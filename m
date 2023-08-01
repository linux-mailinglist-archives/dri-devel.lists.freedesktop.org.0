Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FE476BA46
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 19:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3AA410E419;
	Tue,  1 Aug 2023 17:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC17210E419;
 Tue,  1 Aug 2023 17:03:16 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-34930636b05so3981235ab.2; 
 Tue, 01 Aug 2023 10:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690909396; x=1691514196;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Vt/wHfetwQDHpRz65Llg9LjGES1lnjN8dFqGOHt2Ac=;
 b=ZiaDkevfnJ+ET3/E1+KGU6hHq3/PIlb0BSs1FiUfYHGgnKdThqy4KHppHnLBhDBFAF
 F42XOPx6zWICKq8MmL1Y4zBPDdkSeW+oWkEEu4OeuQl1Y6VQa0S2M1kKxAcn9j0RsjXP
 GIU56DsDz2KKJDndnFBBaGKN2BLz9n3SK/t8Im3ajkCx/2Dn8Xo4OFSjREqh3wG1crJs
 7CtTADXR2se7VIj+DJfc2aiVwfTQ9FY8PU6WVP91xUCI512OIZBEAGf/u7C3IQHJTbNP
 Bzi9Ufp9dor29EQJyfvpPpLC7hQHrXvGVCzj/cvhXikXCJw/WBX5iQCithmQTAWVSOXr
 PyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690909396; x=1691514196;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Vt/wHfetwQDHpRz65Llg9LjGES1lnjN8dFqGOHt2Ac=;
 b=h4T2vxT8aORcu9MegvAx7DBmnOqRf+2HynsDPmB8XGGL5f1TwQGeZa7V3g8+ZPCVea
 wCttxj0UjCJxb1CYAEi8do6R6szfzeoNB/oJDccGw2gzB0EWgwq5oBSYcSFSygQm1n6g
 durHn+flNwzRzN7uMUdQlPbH6QpaKEiX6c3ClplJFPQTfYtHxWE+yFLR3cJmXwhFCerA
 Y27IOoUpY+gwMs64h/BZ9VaA4W5FmlyLRf2REnGtyA9e4nwq9vW/9sdrkSi2spURNXjH
 SNq2A4xRT3ey3iNMrd+Uv9HnqcYJAo6ZQlT5FayA+fF5sr46IcCM7rMQIIGGdotc/2Zp
 +D+A==
X-Gm-Message-State: ABy/qLb93qmh1xs61/ujL7zgYUfPRGz/aOzoaahCqXKwD/FxUlzgq1aS
 CxUnZ1bMZV8l4Q813pTBvhk=
X-Google-Smtp-Source: APBJJlFXRa1Etl6yfHFGR6ePAm5/gYzcKoBWdY+UiSYPpDx3PiIMvJYXjeJATdKSxpfNJXMYeySpBg==
X-Received: by 2002:a92:c248:0:b0:348:f4c1:4817 with SMTP id
 k8-20020a92c248000000b00348f4c14817mr13197730ilo.6.1690909395900; 
 Tue, 01 Aug 2023 10:03:15 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o20-20020a02c6b4000000b0042b144abf71sm3768577jan.179.2023.08.01.10.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 10:03:15 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, daniel@ffwll.ch, jbaron@akamai.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 03/22] dyndbg: make ddebug_class_param union members same
 size
Date: Tue,  1 Aug 2023 11:02:35 -0600
Message-ID: <20230801170255.163237-4-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801170255.163237-1-jim.cromie@gmail.com>
References: <20230801170255.163237-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

struct ddebug_class_param keeps a ref to the state-storage of the
param, make both flavors use the same unsigned long under-type.
ISTM this is simpler and safer.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 2 +-
 lib/dynamic_debug.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 061dd84d09f3..dc41e70dc2e1 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -122,7 +122,7 @@ struct _ddebug_info {
 struct ddebug_class_param {
 	union {
 		unsigned long *bits;
-		unsigned int *lvl;
+		unsigned long *lvl;
 	};
 	char flags[8];
 	const struct ddebug_class_map *map;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index fdd6d9800a70..22a3182bf89f 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -795,7 +795,7 @@ int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 
 	case DD_CLASS_TYPE_LEVEL_NAMES:
 	case DD_CLASS_TYPE_LEVEL_NUM:
-		return scnprintf(buffer, PAGE_SIZE, "%d\n", *dcp->lvl);
+		return scnprintf(buffer, PAGE_SIZE, "%ld\n", *dcp->lvl);
 	default:
 		return -1;
 	}
-- 
2.41.0

