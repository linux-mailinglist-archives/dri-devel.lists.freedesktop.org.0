Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0537BE272C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 11:40:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF2C10E986;
	Thu, 16 Oct 2025 09:40:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="CUS5qKMX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB6B610E986
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 09:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760607620;
 bh=fGMwze4EW9EL74icbGlhobpT5wikVa0unEplucU4aqg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CUS5qKMXLv+emHFfqpQyBbIL99625tN7gP9oEmpetnp1c6ezEOcO/71zrE04ymKO3
 FWs21TS96grt8bvWCT1ChW0OQGA8K0ATfhrFhlyTZnqy4r75ruXQTNufAdVOS9rZ0u
 E7+IJsRYIdtNjdTGR/gi08AFB4m7E47Pgr0yNaMTo6uSxXQ3RGRGY39GTtQR3rPCmo
 DOSg2Qz7XSBA4Z7KdlZlkOlIpd8VEq7ejosl5xQQ68sAJwK+0p8MZjIi5G7m+yUvUh
 QVBNmHPztR7fqdaVMsHBb6687fVSYKUT9yTybw4KbovyRGof+qKyTpXve94UTIqjbh
 XCgeeixfIJCmw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 151AD17E10C8;
 Thu, 16 Oct 2025 11:40:20 +0200 (CEST)
Date: Thu, 16 Oct 2025 11:40:16 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Faith Ekstrand <faith.ekstrand@collabora.com>,
 kernel@collabora.com
Subject: Re: [PATCH v4 02/14] drm/gem: Add a drm_gem_object_funcs::sync()
 and a drm_gem_sync() helper
Message-ID: <20251016114016.12bb49cd@fedora>
In-Reply-To: <f89987b9-2df8-45ab-8b53-6a210a30ce50@suse.de>
References: <20251015160326.3657287-1-boris.brezillon@collabora.com>
 <20251015160326.3657287-3-boris.brezillon@collabora.com>
 <f89987b9-2df8-45ab-8b53-6a210a30ce50@suse.de>
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

Hi Thomas,

On Thu, 16 Oct 2025 10:32:46 +0200
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Hi,
> 
> on patches 2 to 4: sync is really begin/end access wrapped into one 
> interface, which I find questionable. I also don't like that these 
> patches add generic infrastructure for a single driver.

It's actually two drivers (panfrost and panthor), and the interface is
here so other drivers relying on drm_gem_shmem don't have to hand-roll
these things in the future.

> 
> My proposal is to make your own dma_buf exporter in panthor and set the 
> begin/end_cpu_access functions as you need. Panthor already contains its 
> own GEM export helper at [1]. If you inline drm_gem_prime_export() [2] 
> you can set the cpu_access callbacks to panthor-specific code. The other 
> dma-buf helpers' symbols should be exported and can be re-used. That is 
> a lot less intrusive and should provide what you need.

I can of course do that in panthor, but then I'll have to duplicate
the same logic in panfrost. Also, the whole point of making it generic
is so that people don't forget that begin/end_cpu_access() is a thing
they should consider (like happened to me if you look at v2 of this
patchset), otherwise importers of their buffers might have unpleasant
side effects because of missing flush/invalidates. This, IMHO, is a good
reason to have it as a drm_gem_funcs::sync() callback. That, or we
decide that the default dma_buf_ops is not a thing, and we force
developers to think twice when they select the default hooks to pick
for their dma_buf implementation.

> 
> I found that a hand full of other DRM drivers implement dma-buf's 
> begin/end access callbacks. If you want a generic begin/end interface 
> for GEM, you certainly want to get them on board. If there's something 
> common to share, this should be done in a separate series.

Fair enough. I'll try to convert freedreno and imagination to this new
interface, and gather some feedback.

Regards,

Boris
