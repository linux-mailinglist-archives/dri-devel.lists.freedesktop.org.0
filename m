Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 042AA18F736
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 15:50:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D90F6E13C;
	Mon, 23 Mar 2020 14:50:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93406E127
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 14:50:00 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id g62so15127903wme.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 07:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tjiv7qMnzgqOGQnKm8diVuhQQwwy6h5FYe6sb8SS/Og=;
 b=BPGIbJ7zUeLKeMCPq3sTvwhWi2D36jWS3OLlIdaEwHqhCbqnJTzttVjGq1mCMgDw53
 Ky4M0wRmf1jUv9n7w37UFxWMjX7B0KIWOWYQBgCTpNDpXDOa6ZYoPGZ3MbtLTD27elF6
 sG6bBnDAUMGgjEPRVAVuPaiH+zAn3TITFyJb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tjiv7qMnzgqOGQnKm8diVuhQQwwy6h5FYe6sb8SS/Og=;
 b=QyiGMOh6mFoK7CJfZK8Zoe8NuLFX+P4G2Q54SJik85r+O4tE73upe7aXhMaN6RvdzG
 x+q8bu7l8fPGVISM1aBo/avuIibGcxiCGKd6IYWCyps6jWI5+XwekxOgTmLKFfg4o4C4
 QjZaksBOWYhOzCgMVVQKbwYycixuD/h2PO5Gu1XqlNdMOsdlnzCpAPFfTnyB47h+0/Zg
 PcENTGwWPq+A1aVXhBgIiF/KPsrTimVc+yqzcaSIlpIGf3JZ9QoGA+Z9/PjH5lmCRFL2
 nWxPUUjHlLVrV+7/E8MNb3DpdvgkMHMronnSTgx23kLW43alupo7/108iE4YjABbe1y+
 MsWA==
X-Gm-Message-State: ANhLgQ3jJcz/0dqP0ndQAXrP1Du+TvdK1GbrFu4iv/g1u/+FYPybWU/1
 t4wpptMHPvcMRBaBpQ9LfjgSEGJqK9+ReA==
X-Google-Smtp-Source: ADFU+vuIcvgB7enp1CCTvo6W5k+yimEtNaCgQhAy5LcBILNPuMVXRkdi3TkezLvpFn4vmaOSttl9DA==
X-Received: by 2002:a1c:b4d4:: with SMTP id d203mr28192120wmf.85.1584974998322; 
 Mon, 23 Mar 2020 07:49:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s22sm20376522wmc.16.2020.03.23.07.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 07:49:57 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 01/51] mm/sl[uo]b: export __kmalloc_track(_node)_caller
Date: Mon, 23 Mar 2020 15:49:00 +0100
Message-Id: <20200323144950.3018436-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
References: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
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
 Pekka Enberg <penberg@kernel.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 David Rientjes <rientjes@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christoph Lameter <cl@linux.com>, Andrew Morton <akpm@linux-foundation.org>
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
index 2988dae3f692..a937de5182cc 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -4377,6 +4377,7 @@ void *__kmalloc_track_caller(size_t size, gfp_t gfpflags, unsigned long caller)
 
 	return ret;
 }
+EXPORT_SYMBOL(__kmalloc_track_caller);
 
 #ifdef CONFIG_NUMA
 void *__kmalloc_node_track_caller(size_t size, gfp_t gfpflags,
@@ -4407,6 +4408,7 @@ void *__kmalloc_node_track_caller(size_t size, gfp_t gfpflags,
 
 	return ret;
 }
+EXPORT_SYMBOL(__kmalloc_node_track_caller);
 #endif
 
 #ifdef CONFIG_SYSFS
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
