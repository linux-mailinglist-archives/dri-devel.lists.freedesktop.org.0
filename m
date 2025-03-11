Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCBBA5BD2E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 11:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E29710E151;
	Tue, 11 Mar 2025 10:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="L/IHBDqm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBB610E151
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 10:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741687528;
 bh=cj3zWPnkW2ekNrOvCr+j0WVhEmNfZMjuNHLNg0V+U/c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=L/IHBDqmX6ZexWlMn41GpV0SlREfNRW7euROQ15Gb+dJ39GSjEBKSqNipJBFhIihF
 i1iIJJA36tWo1NaoxCkP5o63/iLh9N3RamPqdFNp+52Sct5MwO7yXaRDJIaRm3dhdx
 2kmpJRrD5Rslw/ZmVjq7Lor2OrcxczYQ65waMhRFgcfXy9/5wH1At0XbpTPLW2QoQX
 0bQVw4mMSfJdo6yIDP8J4E7H11ztCUCHRR/pnkRS4rWPNoCMPPqbDMW9VRDfqsNKMq
 oLxFulJnypGlRE0dv6XiI1NG97e79DYy4zevXtMgZmY71tSlKj5ZGuh64SNi+ncXZo
 ldLqDUjNLsyBw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id BCABF17E0B25;
 Tue, 11 Mar 2025 11:05:27 +0100 (CET)
Date: Tue, 11 Mar 2025 11:05:20 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh@kernel.org, steven.price@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, kernel@collabora.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, sjoerd@collabora.com
Subject: Re: [PATCH v1 4/6] drm/panfrost: Add support for AARCH64_4K page
 table format
Message-ID: <20250311110520.6b79e090@collabora.com>
In-Reply-To: <16f6a6e2-4dce-4af9-bc0a-61c4d6213f02@collabora.com>
References: <20250310195921.157511-1-ariel.dalessandro@collabora.com>
 <20250310195921.157511-5-ariel.dalessandro@collabora.com>
 <20250311090545.3b941567@collabora.com>
 <16f6a6e2-4dce-4af9-bc0a-61c4d6213f02@collabora.com>
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

On Tue, 11 Mar 2025 10:14:44 +0100
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
wrote:

> Il 11/03/25 09:05, Boris Brezillon ha scritto:
> > On Mon, 10 Mar 2025 16:59:19 -0300
> > Ariel D'Alessandro <ariel.dalessandro@collabora.com> wrote:
> >   
> >> Currently, Panfrost only supports MMU configuration in "LEGACY" (as
> >> Bifrost calls it) mode, a (modified) version of LPAE "Large Physical
> >> Address Extension", which in Linux we've called "mali_lpae".
> >>
> >> This commit adds support for conditionally enabling AARCH64_4K page
> >> table format. To achieve that, a "GPU optional configurations" field was
> >> added to `struct panfrost_features` with the related flag.
> >>
> >> Note that, in order to enable AARCH64_4K mode, the GPU variant must have
> >> the HW_FEATURE_AARCH64_MMU feature flag present.
> >>
> >> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> >> ---
> >>   drivers/gpu/drm/panfrost/panfrost_device.h |  16 +++
> >>   drivers/gpu/drm/panfrost/panfrost_mmu.c    | 132 +++++++++++++++++++--
> >>   drivers/gpu/drm/panfrost/panfrost_regs.h   |  34 ++++++
> >>   3 files changed, 169 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> >> index cffcb0ac7c111..0385702aa43c7 100644
> >> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> >> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> >> @@ -42,6 +42,14 @@ enum panfrost_gpu_pm {
> >>   	GPU_PM_VREG_OFF,
> >>   };
> >>   
> >> +/**
> >> + * enum panfrost_gpu_config - GPU optional configurations
> >> + * @GPU_CONFIG_AARCH64_4K: Use AARCH64_4K page table format
> >> + */
> >> +enum panfrost_gpu_config {
> >> +	GPU_CONFIG_AARCH64_4K,
> >> +};
> >> +
> >>   struct panfrost_features {
> >>   	u16 id;
> >>   	u16 revision;
> >> @@ -95,6 +103,9 @@ struct panfrost_compatible {
> >>   
> >>   	/* Allowed PM features */
> >>   	u8 pm_features;
> >> +
> >> +	/* GPU features */
> >> +	u8 gpu_configs;  
> > 
> > I would probably name this gpu_quirks, with the GPU_CONFIG_AARCH64_4K
> > flag renamed GPU_QUIRK_FORCE_AARCH64_PAGE_TABLE.
> >   
> 
> Boris, at this point the quirk should be LPAE, not AARCH64_4K, because the
> former is legacy...

It's legacy, but it's also the default in this driver. And just because
it's legacy doesn't mean it's broken :P. As Steve mentioned, there are
perf considerations to take into account, and on some platforms (most?),
it's preferable to use the legacy format because of that.

> 
> I think that Ariel is right in this, as in, that's a capability of the GPU
> MMU, so if anything I would rather rename it to gpu_capabilities,

No, GPU capabilities are extracted from he GPU ID, and all Bifrost GPUs
support the aarch64 page table format. But what matters here is GPUs
that can't use the legacy page table format because it's to limited to
express the cacheability/shareability properties.

> but then
> that'd be confusing for other stuff - which means that gpu_configs is most
> probably the least confusing and/or most appropriate name for this.

Again, it's not a random configuration decision, it's something we do
because the default (legacy page table format) doesn't work, so I keep
thinking quirk is an appropriate name in this context.

Regards,

Boris
