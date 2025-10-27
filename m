Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2341CC0D2AB
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 12:36:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D47310E446;
	Mon, 27 Oct 2025 11:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YFnS2ywz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D654F10E442
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 11:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761565010;
 bh=584a4V7A0teLQbtFCVuKn+vPFu3wI1RrRXSg8EXz918=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YFnS2ywzK4DX+IP7buG2LbhGiT6MlHEBQhplynbXE9ygylUVRdDGAXahpLpfIblb6
 fZQ8vYBeELDsG9bEdNcvmHx7cexv9oovNrH2jc64ZJbJwxccKHE6R5viiFaur2jKMZ
 DMNH0SpyOXwQiPtfgsMQluBXYv1Vpf4mz1o1k9PkoDqQMnn/ZRSUkaHkHSbo/wcIDr
 sBAqpNeWi+MjkqrMb+utNalPIOh18epJ4eEit/BZXwDnzyYAtixCSjHjEX7Jp2SMbP
 W1jaUinWdEt1nug+zB7qtQJqe4pY+17aOLgVUhM1pd5tkpdm+3YMkPNOytZX4f9bjf
 MG6H/6QnScAsw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0331917E10F4;
 Mon, 27 Oct 2025 12:36:49 +0100 (CET)
Date: Mon, 27 Oct 2025 12:36:45 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/8] drm/panthor: Introduce panthor_pwr API and power
 control framework
Message-ID: <20251027123645.7f3879ba@fedora>
In-Reply-To: <4cea5fa2-83da-4620-aa4a-97a6378f62f8@arm.com>
References: <20251024202117.3241292-1-karunika.choo@arm.com>
 <20251024202117.3241292-4-karunika.choo@arm.com>
 <20251026091310.4046f061@fedora>
 <4cea5fa2-83da-4620-aa4a-97a6378f62f8@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 27 Oct 2025 10:36:13 +0000
Karunika Choo <karunika.choo@arm.com> wrote:

> On 26/10/2025 08:13, Boris Brezillon wrote:
> > On Fri, 24 Oct 2025 21:21:12 +0100
> > Karunika Choo <karunika.choo@arm.com> wrote:  
> >> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
> >> index 092962db5ccd..09aef34a6ce7 100644
> >> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> >> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> >> @@ -192,3 +192,8 @@ int panthor_hw_init(struct panthor_device *ptdev)
> >>
> >>  	return 0;
> >>  }
> >> +
> >> +bool panthor_hw_has_pwr_ctrl(struct panthor_device *ptdev)
> >> +{
> >> +	return GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id) >= 14;
> >> +}
> >> diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
> >> index 2665d6dde2e3..4c71f27d1c0b 100644
> >> --- a/drivers/gpu/drm/panthor/panthor_hw.h
> >> +++ b/drivers/gpu/drm/panthor/panthor_hw.h
> >> @@ -32,4 +32,6 @@ struct panthor_hw {
> >>
> >>  int panthor_hw_init(struct panthor_device *ptdev);
> >>
> >> +bool panthor_hw_has_pwr_ctrl(struct panthor_device *ptdev);  
> > 
> > Let's make this a static inline function so the compiler can inline its
> > content at compile time.
> >   
> 
> I wonder if making it static inline is a good idea. We will need to move
> this function into panthor_device.h to be able to do so as we need to
> access the panthor_device structure. Would this still be desirable?

Can't we just include panthor_device.h from panthor_hw.h instead? As
far as I can tell, panthor_device.h doesn't include panthor_hw.h, so we
should be fine.
