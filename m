Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA7F172646
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 19:15:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 337EC6EB88;
	Thu, 27 Feb 2020 18:15:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A95C6E96A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 18:15:31 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z15so4670751wrl.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 10:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s9Dt4ZAHYBWy2uNMICh4RsHo7p4PctnYq6F5Xys1W4s=;
 b=ARggmJF0Md01/eym0nw72nOTBrRfmsUuV8VnF35SsA7ok30GpUnsfINOCeoPo16CH3
 EAwDPW+Lu/Wej2oaK5GyxVZn01VewErf8UpL+acHuwuXQK9U4Soz1aqVTfGzE+gsCKVy
 wL6d3cYR5tE/vikv3fUeAvvRcsj3DbUUcQgdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s9Dt4ZAHYBWy2uNMICh4RsHo7p4PctnYq6F5Xys1W4s=;
 b=dItz1GmoCbQqdOU8Qyp8IhXZtw23U6eOh1THPhIFjihehRNuetV5DFhu5zi17eLxai
 42XkK0wkQ8Ubr+ErUAYeBSbW17bd6apXEnpq7k/EBFCqywdlOnXsvAJOBUTldzEbtrDL
 eeUityghlCl3vuqRiQ8JPfuO3F7V4gn4nU9Yq2Ww9IBuH76aY3TARxIaMs+VC43SJluF
 z5yF/NPjUsakxAlI139ry9lwpn0hIEmjzr6P6IN66DfAgNEjEJt6s/1yX1Btp9abcxf3
 q2jPnQTUIOAR6WDl1jzUoO0Cp/wAcdqUFc/srmnHlFkCzJ5hkTbr5KI0GYwINbdQupyW
 KTKQ==
X-Gm-Message-State: APjAAAXXn2SgS5dF9VjGJDBjrdyZ4pw3KN0wi+el0gb6QlblbcUljsg4
 J1oUb2zi38LpNkbBdBKV/+e+q9A/u5A=
X-Google-Smtp-Source: APXvYqyS8G8ysqKvrlfpv+NT0O6trBXNmoLB1tnfzb9RAUggAHw/KDstk2oj74jEGW4oPEPaVnqjMg==
X-Received: by 2002:adf:ffc4:: with SMTP id x4mr134865wrs.306.1582827329860;
 Thu, 27 Feb 2020 10:15:29 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q1sm8551152wrw.5.2020.02.27.10.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 10:15:29 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 01/51] mm/sl[uo]b: export __kmalloc_track(_node)_caller
Date: Thu, 27 Feb 2020 19:14:32 +0100
Message-Id: <20200227181522.2711142-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: linux-mm@kvack.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 m.felsch@pengutronix.de, Pekka Enberg <penberg@kernel.org>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, David Rientjes <rientjes@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter <cl@linux.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

slab does this already, and I want to use this in a memory allocation
tracker in drm for stuff that's tied to the lifetime of a drm_device,
not the underlying struct device. Kinda like devres, but for drm.

Acked-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Christoph Lameter <cl@linux.com>
Cc: Pekka Enberg <penberg@kernel.org>
Cc: David Rientjes <rientjes@google.com>
Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
--
I plan to merge this through drm-misc-next (with Andrew's ack) once
the remainder of the drm series is in shape.
-Daniel
---
 mm/slob.c | 2 ++
 mm/slub.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/mm/slob.c b/mm/slob.c
index fa53e9f73893..ac2aecfbc7a8 100644
--- a/mm/slob.c
+++ b/mm/slob.c
@@ -524,6 +524,7 @@ void *__kmalloc_track_caller(size_t size, gfp_t gfp, unsigned long caller)
 {
 	return __do_kmalloc_node(size, gfp, NUMA_NO_NODE, caller);
 }
+EXPORT_SYMBOL(__kmalloc_track_caller);
 
 #ifdef CONFIG_NUMA
 void *__kmalloc_node_track_caller(size_t size, gfp_t gfp,
@@ -531,6 +532,7 @@ void *__kmalloc_node_track_caller(size_t size, gfp_t gfp,
 {
 	return __do_kmalloc_node(size, gfp, node, caller);
 }
+EXPORT_SYMBOL(__kmalloc_node_track_caller);
 #endif
 
 void kfree(const void *block)
diff --git a/mm/slub.c b/mm/slub.c
index be2854b5b1c9..7271fb235ed8 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -4358,6 +4358,7 @@ void *__kmalloc_track_caller(size_t size, gfp_t gfpflags, unsigned long caller)
 
 	return ret;
 }
+EXPORT_SYMBOL(__kmalloc_track_caller);
 
 #ifdef CONFIG_NUMA
 void *__kmalloc_node_track_caller(size_t size, gfp_t gfpflags,
@@ -4388,6 +4389,7 @@ void *__kmalloc_node_track_caller(size_t size, gfp_t gfpflags,
 
 	return ret;
 }
+EXPORT_SYMBOL(__kmalloc_node_track_caller);
 #endif
 
 #ifdef CONFIG_SYSFS
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
