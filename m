Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC60B7CE374
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 19:06:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AACA910E408;
	Wed, 18 Oct 2023 17:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D6610E402;
 Wed, 18 Oct 2023 17:06:14 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-79fd60f40ebso175703939f.1; 
 Wed, 18 Oct 2023 10:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697648773; x=1698253573; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1C+2NMg1JH09l8lpRwB0Ubzh+mfktnl5vVkwETAlRt8=;
 b=TJZKGpZvJoZMHeDGO7Cq3aodNDw9HBiHXwCNTBl4hjfMG2jPtfr/wI7qXbJlVSK8sB
 62noqx5wpSyYMIAzNMWUV2BrQCoGVAw3r/t6arG0HYkQuIoBtHvA+5jGz5NZNgXWTzuU
 YoDXCr174D+QW4yVt1Ji7YIc4aP3EpqjV318awJBDISrtS05eufrDSptvNIkTq9d+Sb6
 ffyFsxjeBluueIlmg3HMGLSJhTBi7Gxk88+DrmeMa8YMDQbh4Mt+ogf06D0DyAv4YcL8
 6E/SQrm2kvb4S0aw5EgdAUDRCBgsDZe8jt2Qc610XdlePw5WZ8mSB0htlyjGgyb6Veh2
 nsog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697648773; x=1698253573;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1C+2NMg1JH09l8lpRwB0Ubzh+mfktnl5vVkwETAlRt8=;
 b=onK8GTSrfDa33qMLzA3YdkmJEfpMCNqmPPNwBi2hL8aSHYyxtlxG3Gm1rcjSIGKbkA
 R1M/Dgg0kQ/he3Ju8i7ZK7h3BHsdYM7d1y3gDyedkLqjO92VDpDZMJuUUwuSXM1q57Pa
 bLvJP+9GkQ7hnxFN3BLRxSNwkd220pVTh/sVkX6zhUCvzXmvZR+ZzhBVlvIvnnr0eaub
 UaJvwr3Rum/Z+iM0g+Chxics5dhx1PvbZaTqp5wmsnqDMXLbYbhnY+F8OJ22MUL+z7YM
 a7UJIpCLuHdGNxEsSk2ngPh84y8cGaOSiE8Le6EQ1JRHtBUaZnJTrdkryEf6j5iDmPI9
 LnJw==
X-Gm-Message-State: AOJu0YyB+tLHQPs69MxRasz9hLVxS7mVXxnObkG+fmO8/thQc0Oksi8y
 XC7X6FEFroulkmF50n1sBiI=
X-Google-Smtp-Source: AGHT+IHC4qfEU9tiSYAxK9P1UlIGyXdQhT0HhIP6RQL7IWtMjBWJEVhbKCGk1E5v8O6KifE2BTCJNw==
X-Received: by 2002:a5d:9da6:0:b0:787:8cf:fe82 with SMTP id
 ay38-20020a5d9da6000000b0078708cffe82mr5775684iob.8.1697648773211; 
 Wed, 18 Oct 2023 10:06:13 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 n4-20020a5d8244000000b0079fa1a7cd36sm1228944ioo.30.2023.10.18.10.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 10:06:12 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7c 03/24] dyndbg: make ddebug_class_param union members same
 size
Date: Wed, 18 Oct 2023 11:05:43 -0600
Message-ID: <20231018170604.569042-4-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018170604.569042-1-jim.cromie@gmail.com>
References: <20231018170604.569042-1-jim.cromie@gmail.com>
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
Cc: lb@semihalf.com, groeck@google.com, linux-doc@vger.kernel.org,
 jani.nikula@intel.com, daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk,
 rostedt@goodmis.org, mcgrof@kernel.org, seanpaul@chromium.org, joe@perches.com,
 bleung@google.com, yanivt@google.com
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
index ceb3067a5c83..b984ce338921 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -796,7 +796,7 @@ int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 
 	case DD_CLASS_TYPE_LEVEL_NAMES:
 	case DD_CLASS_TYPE_LEVEL_NUM:
-		return scnprintf(buffer, PAGE_SIZE, "%d\n", *dcp->lvl);
+		return scnprintf(buffer, PAGE_SIZE, "%ld\n", *dcp->lvl);
 	default:
 		return -1;
 	}
-- 
2.41.0

