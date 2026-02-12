Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILMJFI2ojWkK5wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 11:16:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE15512C5FA
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 11:16:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FAD10E71C;
	Thu, 12 Feb 2026 10:16:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="X6wYQV6p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90BF210E71F
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 10:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770891399;
 bh=2eM/CKRs5f4Vpe8oURMPgU9mms6UR5PTLCJgmzoxUVo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=X6wYQV6pJjeFhd9Lwg+y2WGYiV5ICcJ2/JhavwsL6uqoorwHIlDavIQNvnrpEc5Fe
 vWtadjZJGBA5WVXUy2CqJslWPkCHanM7qn6qWH5TVKVaigRawdrRwc/jpLz46SoUfD
 /Rt+X5u0oq5Og1j+AKUHFfFgFprr0rPXUE+XXsRFQl+riY3vob6tR7g40sn1yNd0MD
 2h+IvzMR5WLyvcW5+pO+IkkmXiuSiihDj50KW3wFNZTL80UhXiL72xh8yVbmgxQOAN
 KTHtXkX6a4BUjRCPBHnsE/lXVe3wCS5GV7CE+8Ky/86P3S2zvKQITwhDDvuUO4FjK4
 KuQEiX/r8JkJg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E6C1417E127F;
 Thu, 12 Feb 2026 11:16:38 +0100 (CET)
Date: Thu, 12 Feb 2026 11:16:33 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 daniel.almeida@collabora.com, aliceryhl@google.com,
 beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 04/12] drm/tyr: set DMA mask using GPU physical address
Message-ID: <20260212111633.77755caf@fedora>
In-Reply-To: <20260212013713.304343-5-deborah.brouwer@collabora.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-5-deborah.brouwer@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:beata.michalska@arm.com,m:lyude@redhat.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	HAS_ORG_HEADER(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,arm.com:email]
X-Rspamd-Queue-Id: CE15512C5FA
X-Rspamd-Action: no action

On Wed, 11 Feb 2026 17:37:05 -0800
Deborah Brouwer <deborah.brouwer@collabora.com> wrote:

> From: Beata Michalska <beata.michalska@arm.com>
> 
> Configure the device DMA mask during probe using the GPU's physical
> address capability reported in GpuInfo. This ensures DMA allocations
> use an appropriate address mask.
> 
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/tyr/driver.rs | 11 +++++++++++
>  drivers/gpu/drm/tyr/gpu.rs    |  1 -
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
> index e5eae5a73371..2973a8b3cc09 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -11,6 +11,10 @@
>          Device, //
>      },
>      devres::Devres,
> +    dma::{
> +        Device as DmaDevice,
> +        DmaMask, //
> +    },
>      drm,
>      drm::{
>          driver::Registration,
> @@ -134,6 +138,13 @@ fn probe(
>          let gpu_info = GpuInfo::new(pdev.as_ref(), &iomem)?;
>          gpu_info.log(pdev);
>  
> +        // SAFETY: No concurrent DMA allocations or mappings can be made because
> +        // the device is still being probed and therefore isn't being used by
> +        // other threads of execution.
> +        unsafe {
> +            pdev.dma_set_mask_and_coherent(DmaMask::try_new(gpu_info.pa_bits())?)?;
> +        }
> +
>          let uninit_ddev = UnregisteredDevice::<TyrDrmDriver>::new(pdev.as_ref())?;
>          let platform: ARef<platform::Device> = pdev.into();
>  
> diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
> index affca5b0dc6c..b5f11bc96fa0 100644
> --- a/drivers/gpu/drm/tyr/gpu.rs
> +++ b/drivers/gpu/drm/tyr/gpu.rs
> @@ -141,7 +141,6 @@ pub(crate) fn va_bits(&self) -> u32 {
>      }
>  
>      /// Returns the number of physical address bits supported by the GPU.
> -    #[expect(dead_code)]
>      pub(crate) fn pa_bits(&self) -> u32 {
>          (self.mmu_features >> 8) & genmask_u32(0..=7)
>      }

