Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D57924A41
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:58:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33DF910E6C3;
	Tue,  2 Jul 2024 21:58:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mUOb0M9m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3970710E6AB;
 Tue,  2 Jul 2024 21:58:20 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-7f63db7a69cso142327339f.2; 
 Tue, 02 Jul 2024 14:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957499; x=1720562299; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p9Cfh8vQIJvZJJ9snElx0jBXe6PzWuVjUPtCeny8PSA=;
 b=mUOb0M9mK/56uyDidX6Lg7PtlXUkuExNFEuhXq7Il+o4c6zOLwpzS8RGUFmNdns2LL
 3K0YWG5n4ZlvU4kL9pOJAI273A5uFy/YGwfok/nm4Y9KGyCTLrR77DoJheg+lI7p4I3K
 XStI6MNZhxRvlgy7cpnPQg6yuTMBFnjQV+0HWBNjBGCkF2eGb5adf7i6GJ5qsq9Pou83
 4E/jqR8J8EGux8yM+Q4PhCMjVTmm6eeCS06YQRouVc7yWKFRb8wH/k3Ad/aFq3Eupn3J
 C4KxejP3bBk9rhG5dvbLKY32tldiOoGiUOQSKqAs5EVsdD6susnxjQjwxcqk73U7rakR
 fxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957499; x=1720562299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p9Cfh8vQIJvZJJ9snElx0jBXe6PzWuVjUPtCeny8PSA=;
 b=h1YzmTsWMJuVIUac3b8V98esBqCFwKdeEsy1Mp5A7y0Ga9WvuHOvXmxcsJq9renIkh
 SXbDfMDD3T2NUxMkPYc/K5We+vAxM8OUoizgkNPSQgVYqj0nG3O6aJ4NaBsF2383PHOk
 4WvJ3fSMMmg7t1InfauRaoFSGl8xzkvtqeTVu48BPnXYwPRmjn8rSv0pMIvlZ9AS+esp
 cy9JB+M19Kg7/QkTPbKPYy021yAlaJoDD+HE36EI0CNdRxA6uODylfitCOgL/bEta37h
 ZT0r/BmrSnLO3NtDOadF5YDJrQ19B1Xv0W2cALkrffP49AKPsdGX31lurxgDg7+5+9Co
 H0yQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjScb9EYAJbOHwnqKKqR74zI+WbKxqMEFr2UGhqngmfnVQ1tHmdSsttnIwV/nI3l5JAi3oSyR2Bvk/ht0ImbMEX3w6HmOKK8MZn0szvzTF5NCcEBPOY5uzOuMS2C16HFxgSbkVZnhOFAHYUlkuu6vMr7ocwkhWiYO/VXie4OFkAgt2sz4m4UC/2lO5qslhF5wYiwo6gIALJOgP/+6m7tgJgeqeCytdCv3q0dhkVUyl6dpxr+A=
X-Gm-Message-State: AOJu0Yxn6kpQUOn9Q4jVyBqWMTNiJFnpYnaCUL4dTEPjkBG4AGTRUsu+
 98Mbm0VoFv6Y8ligkQPKmpFMQRghfcHvOCRv6pFRUQ6JZKIYjbxz
X-Google-Smtp-Source: AGHT+IG2ft1Pm2/g4PtzgBlVmK5r7iXT/FGK9csFrxluaEy4o+i8PIv1GdXT4+15tPtbVitEa/IibQ==
X-Received: by 2002:a6b:5a0e:0:b0:7f6:210c:61b0 with SMTP id
 ca18e2360f4ac-7f62ee853a4mr1060817239f.20.1719957499460; 
 Tue, 02 Jul 2024 14:58:19 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:58:18 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 04/52] dyndbg: make ddebug_class_param union members same
 size
Date: Tue,  2 Jul 2024 15:56:54 -0600
Message-ID: <20240702215804.2201271-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702215804.2201271-1-jim.cromie@gmail.com>
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

struct ddebug_class_param keeps a ref to the state-storage of the
param; make both class-types use the same unsigned long storage type.

ISTM this is simpler and safer; it avoids an irrelevant difference,
and if 2 users somehow get class-type mixed up (or refer to the wrong
union member), at least they will both see the same value.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 2 +-
 lib/dynamic_debug.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 4fcbf4d4fd0a..5231aaf361c4 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -124,7 +124,7 @@ struct _ddebug_info {
 struct ddebug_class_param {
 	union {
 		unsigned long *bits;
-		unsigned int *lvl;
+		unsigned long *lvl;
 	};
 	char flags[8];
 	const struct ddebug_class_map *map;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 73ccf947d4aa..152b04c05981 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -799,7 +799,7 @@ int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 
 	case DD_CLASS_TYPE_LEVEL_NAMES:
 	case DD_CLASS_TYPE_LEVEL_NUM:
-		return scnprintf(buffer, PAGE_SIZE, "%d\n", *dcp->lvl);
+		return scnprintf(buffer, PAGE_SIZE, "%ld\n", *dcp->lvl);
 	default:
 		return -1;
 	}
-- 
2.45.2

