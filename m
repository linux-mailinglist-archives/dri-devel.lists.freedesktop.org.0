Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D89A309D3
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 12:21:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3921310E66E;
	Tue, 11 Feb 2025 11:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="hMrujhFc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F094710E66E
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 11:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739272861;
 bh=uoP1nCCvDBGx8Z7jqAGdTm1hPsk3dkyFnV2/E09V82I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hMrujhFcOZq/4f66dL7dk+b6M2gxuegP3AwaTO8f1n9aKVEgZtlMNnY4Bhx/ejzMo
 pGydGWXFHnA9dpurrQF5alPZvAbxpAYPoU8StnnR1TnOtC2kRfP0P0HWRkql/TO0D/
 AO/IjMCit3Ob3tK2swaYdx2cFbxh+ddFXuYpgwwwBd/TLPrl0etaxbXsqx1rZMR+4S
 qW2a+K82BrOMXpC4modD0gLaLNGAhu1FPLTJcT5saZWCgOb/A7j6w2vZofUsFr1CLV
 5FdHFaAPaZrnZNYD5X11VJbi2Nzamdxrpz3mFC12cUu6rMtJJ8VrGRjTBAVvRBuD+w
 85thIsVMvH2Jw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 77FD117E0657;
 Tue, 11 Feb 2025 12:21:00 +0100 (CET)
Date: Tue, 11 Feb 2025 12:20:52 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Florent Tomasin <florent.tomasin@arm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Steven
 Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Yong Wu <yong.wu@mediatek.com>,
 <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <nd@arm.com>, Akash Goel
 <akash.goel@arm.com>
Subject: Re: [RFC PATCH 4/5] drm/panthor: Add support for protected memory
 allocation in panthor
Message-ID: <20250211122052.3f550650@collabora.com>
In-Reply-To: <20250211120448.3e89e75f@collabora.com>
References: <cover.1738228114.git.florent.tomasin@arm.com>
 <821252c96ab2ab3e2d8ef211a09f8b171719baaa.1738228114.git.florent.tomasin@arm.com>
 <20250211120448.3e89e75f@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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

On Tue, 11 Feb 2025 12:04:48 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> > --- a/drivers/gpu/drm/panthor/panthor_gem.c
> > +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> > @@ -9,10 +9,14 @@
> >  
> >  #include <drm/panthor_drm.h>
> >  
> > +#include <uapi/linux/dma-heap.h>
> > +
> >  #include "panthor_device.h"
> >  #include "panthor_gem.h"
> >  #include "panthor_mmu.h"
> >  
> > +MODULE_IMPORT_NS(DMA_BUF);  
> 
> Uh, that's ugly. If the consensus is to let panthor allocate
> its protected buffers from a heap, let's just add a dependency on
> DMABUF_HEAPS instead.

My bad, that one is required for dma_buf_put(). Should be

  MODULE_IMPORT_NS("DMA_BUF");

though.
