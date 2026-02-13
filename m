Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDVQFW85j2nHNAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 15:47:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0568137308
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 15:47:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77CD910E102;
	Fri, 13 Feb 2026 14:47:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qLGa0ZqO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C9F10E102;
 Fri, 13 Feb 2026 14:47:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 664FD42B35;
 Fri, 13 Feb 2026 14:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA6E9C116C6;
 Fri, 13 Feb 2026 14:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770994026;
 bh=PfUuTo2C22B502KfiidVcMpl6fd1ZJEdslkaqG2JgXo=;
 h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
 b=qLGa0ZqOVOApBCBl9bS3iFM0WK0TiLYX01j2qDqzV+QxNd8Upska8blJ6snj7Kh1/
 MyJIOCBf5Ucy1ct7yxtw9TsQK/927cYKtZghWawrDKmvR5oUct2EiruQKrLUOWeRiC
 GMk4q9+mVQiYoClAVfo/RfRwD9popMZL5ORrDYb4xus850SjWtcTOXdArG9hAn57FA
 LDRSSQSh6Eg9zlxsmFytnFptZAOT4bK972lTEIXUbUCkiYadROP8AphflKTdvg9CdK
 u9aNAv7ya/aP8cNrN8yStE17ZbQyCw9fp2KAFPKPx/33yVa4vDg0cumdpbNcISc78g
 0lX4Em1fA84Bw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Feb 2026 15:47:01 +0100
Message-Id: <DGDWZHY8XCLX.19DI18CI9QSPQ@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v9 6/9] gpu: nova-core: add PIO support for loading
 firmware images
Cc: "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20260212-turing_prep-v9-0-238520ad8799@nvidia.com>
 <20260212-turing_prep-v9-6-238520ad8799@nvidia.com>
In-Reply-To: <20260212-turing_prep-v9-6-238520ad8799@nvidia.com>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[google.com,gmail.com,ffwll.ch,nvidia.com,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B0568137308
X-Rspamd-Action: no action

On Thu Feb 12, 2026 at 9:26 AM CET, Alexandre Courbot wrote:
> +    fn try_as_pio_loadable(&self) -> Result<FalconDmaFirmwarePioAdapter<=
'_, Self>> {

[...]

> +        let dmem =3D {
> +            let params =3D self.dmem_load_params();
> +
> +            // SAFETY: we keep a reference to `self` for as long as this=
 slice is alive, and the
> +            // device will not access this DMA object since we are using=
 PIO.

How is this guaranteed by this function? I.e. how is it prevented that this
function is never called when the device acesses the DMA memory?

> +            let data =3D unsafe {
> +                self.as_slice(
> +                    usize::from_safe_cast(params.src_start),
> +                    usize::from_safe_cast(params.len),
> +                )?
> +            };
> +
> +            let dst_start =3D u16::try_from(params.dst_start).map_err(|_=
| EINVAL)?;
> +
> +            FalconPioDmemLoadTarget { data, dst_start }
> +        };
> +
> +        Ok(FalconDmaFirmwarePioAdapter {
> +            fw: self,
> +            imem_sec,
> +            imem_ns,
> +            dmem,
> +        })
> +    }
> +}

<snip>

> +/// Adapter type that makes any DMA-loadable firmware also loadable via =
PIO.
> +///
> +/// Created using [`FalconDmaLoadable::try_as_pio_loadable`].
> +pub(crate) struct FalconDmaFirmwarePioAdapter<'a, T: FalconDmaLoadable +=
 ?Sized> {
> +    /// Reference to the DMA firmware.
> +    fw: &'a T,

In v6 [1] I wrote:

	> @@ -221,6 +286,8 @@ pub(crate) struct FwsecFirmware {
	>      desc: FalconUCodeDesc,
	>      /// GPU-accessible DMA object containing the firmware.
	>      ucode: FirmwareDmaObject<Self, Signed>,
	> +    /// Generic bootloader
	> +    gen_bootloader: Option<GenericBootloader>,

	I'm not convinced this is a good idea. We probably want a HAL here and
	have different FwsecFirmware types:

	One with a DMA object and one with a system memory object when the
	architecture uses PIO. In the latter case the object can have a
	GenericBootloader field, i.e.  this also gets us rid of the Option and
	all the subsequent 'if chipset < Chipset::GA102' checks and 'match
	gbl_fw' matches below.

So, I still wonder, why use an Adapter impl on top of DMA memory for PIO ra=
ther
than different base types with a common trait to avoid DMA allocations in t=
he
PIO case altogether?

[1] https://lore.kernel.org/all/DFQBHVTTHZY8.13ASLCJ3FJP81@kernel.org/
