Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 023CB57BCA2
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 19:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5BC9136A;
	Wed, 20 Jul 2022 17:28:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465D991357
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 17:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=BdJWXweqyGQCfeqjgnpozbgFrJmoxkwreT6XvGPN9cU=;
 b=TPW5xqoQKc9bBVSk7wAQi68wlUj2/qo7KL5bIP6XvWSMptbqaa0t3LwFKdw0KIouFKJelqGmkV6hN
 p4Jq75Dz00Lvz7yPLYNvWFgn4OkYRcP06rQVBugi/DsTbE6VvL+CFZUA5oi5sjfCkgL1prCGRp/zs4
 5tS5R7I6NrP44EIq3c96wANrQSFMsUi5wZehdHAJxQyu1NMrLqATTShMEAbaKpFqFMouqnGdWNjXkd
 iOnviH1g6lKRnDp8heD+G4bFXIA2i1JV0oVrtOUVX0edQB4d3xF4eBRQOZ/dp1dPRtxhh2JiOgL7IK
 7zJcr81oUyp0qbX1QIan8jXTMTJ/7Og==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=BdJWXweqyGQCfeqjgnpozbgFrJmoxkwreT6XvGPN9cU=;
 b=9/77iI4g8nLFFpDP3kcwwe2k8lEWk0/rWegn9g5uN/ccefisW4YicrTn3v29GrqyemjbNf6EUnTFj
 Yh+rDeoBQ==
X-HalOne-Cookie: 2fd1a0ace96f55cc674a3b3f8564ed9a1b8f418a
X-HalOne-ID: 6cf369b5-0851-11ed-823f-d0431ea8bb10
Received: from mailproxy1.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 6cf369b5-0851-11ed-823f-d0431ea8bb10;
 Wed, 20 Jul 2022 17:28:53 +0000 (UTC)
Date: Wed, 20 Jul 2022 19:28:51 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next v5 3/4] drm/gem: rename struct
 drm_gem_dma_object.{paddr => dma_addr}
Message-ID: <Ytg7U/+SX0LSAmku@ravnborg.org>
References: <20220720153128.526876-1-dakr@redhat.com>
 <20220720153532.527458-1-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220720153532.527458-1-dakr@redhat.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 20, 2022 at 05:35:31PM +0200, Danilo Krummrich wrote:
> The field paddr of struct drm_gem_dma_object holds a DMA address, which
> might actually be a physical address. However, depending on the platform,
> it can also be a bus address or a virtual address managed by an IOMMU.
> 
> Hence, rename the field to dma_addr, which is more applicable.
> 
> In order to do this renaming the following coccinelle script was used:
> 
> ```
> 	@@
> 	struct drm_gem_dma_object *gem;
> 	@@
> 
> 	- gem->paddr
> 	+ gem->dma_addr
> 
> 	@@
> 	struct drm_gem_dma_object gem;
> 	@@
> 
> 	- gem.paddr
> 	+ gem.dma_addr
> 
> 	@exists@
> 	typedef dma_addr_t;
> 	symbol paddr;
> 	@@
> 
> 	dma_addr_t paddr;
> 	<...
> 	- paddr
> 	+ dma_addr
> 	...>
> 
> 	@@
> 	symbol paddr;
> 	@@
> 	dma_addr_t
> 	- paddr
> 	+ dma_addr
> 	;
> 
> ```
> 
> This patch is compile-time tested with:
> 
> ```
> 	make ARCH={x86_64,arm,arm64} allyesconfig
> 	make ARCH={x86_64,arm,arm64} drivers/gpu/drm`
> ```
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
