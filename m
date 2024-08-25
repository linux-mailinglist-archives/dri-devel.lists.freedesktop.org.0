Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1994295E561
	for <lists+dri-devel@lfdr.de>; Sun, 25 Aug 2024 23:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92EEF10E05C;
	Sun, 25 Aug 2024 21:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="ZpCT4VGd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com
 [91.218.175.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6594D10E05C
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Aug 2024 21:19:44 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1724620782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=LdZOrRmqpEiA7n2tnAtRogGoCmmowhl7JYIfyH8GvSY=;
 b=ZpCT4VGdIm1gckRv7ViqH19u9opQeKB3EH5a//nGmOQzw7kS01+AHXG499VUg4IIEFguBZ
 zTX503GrI2aPTu/1wZ+FXj1pmLSTJo5HmO8BzuNA9oK6QsZJVeO7osHiAfPrJ5Urcr4K8A
 vASc985F6iROpSvafHt+0TqMjbQOmoY=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH 0/2] drm/etnaviv: Implement drm_gem_object_funcs::print_info()
Date: Mon, 26 Aug 2024 05:19:27 +0800
Message-Id: <20240825211929.614631-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

It will be called by drm_gem_print_info() if have implemented, and this can
provide more information about the framebuffer objects. In order to make
the newly implemented etnaviv_gem_object_funcs::print_info() get in use,
we make the drm_gem_print_info() exported, then we re-implement the
etnaviv_gem_describe() base on it.

Sample Testing Information:

[root@fedora 0]# ls
clients  DPI-1	    encoder-1	 gem_names	   mm	 ring
crtc-0	 DPI-2	    framebuffer  gpu		   mmu	 state
crtc-1	 encoder-0  gem		 internal_clients  name
[root@fedora 0]# cat framebuffer 
framebuffer[49]:
	allocated by = Xorg
	refcount=1
	format=AR24 little-endian (0x34325241)
	modifier=0x0
	size=32x32
	layers:
		size[0]=32x32
		pitch[0]=128
		offset[0]=0
		obj[0]:
			name=0
			refcount=3
			start=00040096
			size=16384
			imported=no
			caching mode=write-combine
			active=no
			vaddr=0000000000000000
framebuffer[47]:
	allocated by = Xorg
	refcount=2
	format=XR24 little-endian (0x34325258)
	modifier=0x0
	size=1024x600
	layers:
		size[0]=1024x600
		pitch[0]=4096
		offset[0]=0
		obj[0]:
			name=0
			refcount=3
			start=00040000
			size=2457600
			imported=no
			caching mode=write-combine
			active=no
			vaddr=0000000000000000
			
[root@fedora 0]# cat gem
obj[0]:
	name=0
	refcount=3
	start=00040000
	size=2457600
	imported=no
	caching mode=write-combine
	active=no
	vaddr=0000000000000000
obj[1]:
	name=0
	refcount=3
	start=00040096
	size=16384
	imported=no
	caching mode=write-combine
	active=no
	vaddr=0000000000000000
obj[2]:
	name=0
	refcount=2
	start=00040097
	size=16384
	imported=no
	caching mode=write-combine
	active=no
	vaddr=0000000000000000
Total 3 objects, 2490368 bytes

Sui Jingfeng (2):
  drm/etnaviv: Implement drm_gem_object_funcs::print_info()
  drm/etnaviv: Export drm_gem_print_info() and use it

 drivers/gpu/drm/drm_gem.c             |  1 +
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 43 ++++++++++++++++++++++-----
 drivers/gpu/drm/etnaviv/etnaviv_gem.h |  2 +-
 include/drm/drm_gem.h                 |  2 ++
 4 files changed, 40 insertions(+), 8 deletions(-)

-- 
2.34.1

