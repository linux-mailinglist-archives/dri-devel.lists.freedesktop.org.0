Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA3316416A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 11:21:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE31F6EAE9;
	Wed, 19 Feb 2020 10:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE14D6E5A0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:21:33 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id t23so5865534wmi.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 02:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n6n0zYk64QTGBG4zICM+vk9+nqt3qLyHC/COsxsfEtI=;
 b=DSGYRAvhHhOJFcrVGJMtuv9XCixD5vL9GRs3U4gXgQUoD7sOm3dLZIBoYN9TZYLXc9
 qMuSlQafZTCxj/z4lPv5FfjDv2GQBpZwQCtzb8mass6mKCtiLXfGneplK5Ig8BDjWNbF
 9czhe8keGvjt783EJOBtCXIbx/n3nbHp76btg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n6n0zYk64QTGBG4zICM+vk9+nqt3qLyHC/COsxsfEtI=;
 b=D01mbLcc4c8zLgS2s8Freqk5o1P5GlgHf6OaJg2Qa82+iXnRtVrzjVZg/BPTaoYgTu
 Ys66hIm67OfjEfM3Q60m1N45z92PVhOKGIdnX9D/rMySWUzPmdoXRsvFaC5PmnTwS89H
 aeLGFmE8nZKfkwdk0GkudXeS4PXwRZzxcWvJx5TwDaksnWRRFpo12KFDx91j/Ze9qcf3
 nekRJ9warkirrDweJa4XSyOeW8aQ2jBKdwUBegW6LA7VaG+iPoe8qU6BR8u5wkI09lRG
 3t0Kd6yILIhUefRcnpqYyDHc6xWc3rfwRazuvOdfGNeHSC3VyRQkNbFSQ40jOfkgEoSw
 4lDg==
X-Gm-Message-State: APjAAAX/myrJqwDfKDh9XrDssAHuT7zaRHqkU3yQl9H0NHCvo8OVjG7Y
 WYFxZjiWwnhZNvd3QOsZx5X3pHhrBr0=
X-Google-Smtp-Source: APXvYqzHXO/L/mmeE4mAEVOHg8DmRBreHxyB9Ewy8R5hgdUhfwO+3XuVVxPUuk4otK9cWdoWsixv/g==
X-Received: by 2002:a05:600c:149:: with SMTP id
 w9mr8628850wmm.132.1582107692064; 
 Wed, 19 Feb 2020 02:21:32 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s23sm2370339wra.15.2020.02.19.02.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 02:21:31 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 01/52] mm/sl[uo]b: export __kmalloc_track(_node)_caller
Date: Wed, 19 Feb 2020 11:20:31 +0100
Message-Id: <20200219102122.1607365-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
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
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Pekka Enberg <penberg@kernel.org>, linux-mm@kvack.org,
 David Rientjes <rientjes@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christoph Lameter <cl@linux.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

slab does this already, and I want to use this in a memory allocation
tracker in drm for stuff that's tied to the lifetime of a drm_device,
not the underlying struct device. Kinda like devres, but for drm.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Christoph Lameter <cl@linux.com>
Cc: Pekka Enberg <penberg@kernel.org>
Cc: David Rientjes <rientjes@google.com>
Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
--
Ack for merging through drm trees very much appreciated.

Thanks, Daniel
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
