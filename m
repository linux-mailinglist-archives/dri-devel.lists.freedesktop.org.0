Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGbHIahtmGn4IAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 15:20:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF66168469
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 15:20:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1DC910E0D0;
	Fri, 20 Feb 2026 14:20:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="jINGEs4q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDBDB10E0D0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 14:20:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1771597217; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=V6luLmQipvdgc4RWe4Zap3Y/41+9OBFAPT8/NmchvTw/whxqbm3d6MelhT1aiC1xXBQxv5AE6Cd9ahILAdfELfcDLu7CcqHsjvZkxuRIZO7zuuornLxYvLNo1sDpwHVXxhPlcriuDAnCImqKk4NPSGWf6w9YbbdkjnnegfUvHJo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1771597217;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=gARlf8uh2bRNsFm9PyXFC7uv+D+WAdHDAZ7jZ2i2ckA=; 
 b=MaGNtwy2LfdgVNddfcM4AgvPR+ypCgKEVXypG75cmca6gpHvv2ziplEmRKParZMylY+iZNmdNVdv92a2HLafGjYxiUEKRbQfsCubMDZAyDIfxYN1y594G0HB3ZgjCLvO+7YYR0YX8xOjOw9Vxh097eZYyBdMJiTYdjjQe1RgZTA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771597217; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=gARlf8uh2bRNsFm9PyXFC7uv+D+WAdHDAZ7jZ2i2ckA=;
 b=jINGEs4quuRPh7VtDcC9aJqI0ApS4bkqFCFWylClBa8WTeqJ/5HAjvhNVYPwzD8Q
 osJ/G1V8YO+PAwdsTbOkHZz2L/Hx0vXtnj2rBlSbjbQVDHISjY4XymVP7x52ZE/jHrK
 HYPojO3ZguCnujCmDMw0r5qee0SRjUQVgvQGPIUY=
Received: by mx.zohomail.com with SMTPS id 1771597216155633.3407690253604;
 Fri, 20 Feb 2026 06:20:16 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 04/12] drm/tyr: set DMA mask using GPU physical address
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260212013713.304343-5-deborah.brouwer@collabora.com>
Date: Fri, 20 Feb 2026 11:19:57 -0300
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 aliceryhl@google.com, boris.brezillon@collabora.com,
 beata.michalska@arm.com, lyude@redhat.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <F3F5819A-0F5F-4128-B3E3-5DD2BED4252C@collabora.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-5-deborah.brouwer@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[collabora.com:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[dri-devel];
	APPLE_MAILER_COMMON(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,arm.com:email,collabora.com:mid,collabora.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: CBF66168469
X-Rspamd-Action: no action



> On 11 Feb 2026, at 22:37, Deborah Brouwer =
<deborah.brouwer@collabora.com> wrote:
>=20
> From: Beata Michalska <beata.michalska@arm.com>
>=20
> Configure the device DMA mask during probe using the GPU's physical
> address capability reported in GpuInfo. This ensures DMA allocations
> use an appropriate address mask.
>=20
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
> drivers/gpu/drm/tyr/driver.rs | 11 +++++++++++
> drivers/gpu/drm/tyr/gpu.rs    |  1 -
> 2 files changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/tyr/driver.rs =
b/drivers/gpu/drm/tyr/driver.rs
> index e5eae5a73371..2973a8b3cc09 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -11,6 +11,10 @@
>         Device, //
>     },
>     devres::Devres,
> +    dma::{
> +        Device as DmaDevice,
> +        DmaMask, //
> +    },
>     drm,
>     drm::{
>         driver::Registration,
> @@ -134,6 +138,13 @@ fn probe(
>         let gpu_info =3D GpuInfo::new(pdev.as_ref(), &iomem)?;
>         gpu_info.log(pdev);
>=20
> +        // SAFETY: No concurrent DMA allocations or mappings can be =
made because
> +        // the device is still being probed and therefore isn't being =
used by
> +        // other threads of execution.
> +        unsafe {
> +            =
pdev.dma_set_mask_and_coherent(DmaMask::try_new(gpu_info.pa_bits())?)?;
> +        }
> +
>         let uninit_ddev =3D =
UnregisteredDevice::<TyrDrmDriver>::new(pdev.as_ref())?;
>         let platform: ARef<platform::Device> =3D pdev.into();
>=20
> diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
> index affca5b0dc6c..b5f11bc96fa0 100644
> --- a/drivers/gpu/drm/tyr/gpu.rs
> +++ b/drivers/gpu/drm/tyr/gpu.rs
> @@ -141,7 +141,6 @@ pub(crate) fn va_bits(&self) -> u32 {
>     }
>=20
>     /// Returns the number of physical address bits supported by the =
GPU.
> -    #[expect(dead_code)]
>     pub(crate) fn pa_bits(&self) -> u32 {
>         (self.mmu_features >> 8) & genmask_u32(0..=3D7)
>     }
> --=20
> 2.52.0
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=
