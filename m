Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKf4HcrGjWnT6gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 13:25:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C01A312D71A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 13:25:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70B010E728;
	Thu, 12 Feb 2026 12:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="g9GVte2U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E5FA10E728
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 12:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770899139;
 bh=E1ppuDkUjhv1cxj2mRtLRlumGkKTthSCdrELx98tgt0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=g9GVte2UbOH6CjhR9R/B3BkRv8wvdoh2NlC1ctWKZsHzoxbPGUQ0LskPYmcCHkquq
 tsV6MQa9eGiTbBbeQYhgJnkfM3qBSBJ9m8l+Z7MMtN7o86XqkKx0drA4g/ZTDOObFi
 rdZFafViHThNoQrKgFfW0NkjBRI5uQoqsQmIqW7LTvTkYQJH5GEInewIG/N4UE8pZ1
 p95kvCFej7hjKz1YOWGhKA1COhX2rKoZTLbwD1NtJkEYs1eZj3FjNq/ogbBxAZNimw
 ixmOR9LSvdW7yvx1wC6idp3STuo6syG/9KCMfBNqhhPPf+IiioQvj1GvuEvvhaPpgs
 0XiQ2YOjby+BA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E2E8317E151C;
 Thu, 12 Feb 2026 13:25:38 +0100 (CET)
Date: Thu, 12 Feb 2026 13:25:34 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
Cc: daniel.almeida@collabora.com, aliceryhl@google.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v1] drm/tyr: gpu: fix GpuInfo::log model/version decoding
Message-ID: <20260212132534.3b18096f@fedora>
In-Reply-To: <20260210183812.261142-1-work@onurozkan.dev>
References: <20260210183812.261142-1-work@onurozkan.dev>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:work@onurozkan.dev,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[collabora.com,google.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[onurozkan.dev:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,collabora.com:dkim,model.name:url]
X-Rspamd-Queue-Id: C01A312D71A
X-Rspamd-Action: no action

On Tue, 10 Feb 2026 21:38:12 +0300
Onur =C3=96zkan <work@onurozkan.dev> wrote:

> GpuInfo::log() was decoding GPU_ID like this:
>=20
>   major =3D (self.gpu_id >> 16) & 0xff;
>   minor =3D (self.gpu_id >> 8) & 0xff;
>   status =3D self.gpu_id & 0xff;
>=20
> That does not match the Mali GPU_ID layout and mixes unrelated
> fields. Due to that, model detection becomes `mali-unknown` on
> rk3588s which is wrong.
>=20
> We can already get all the version information with a single
> GpuId::from call (less code and cleaner), so this patch uses it.
>=20
> Also renamed `GpuModels` fields from `major/minor` to
> `arch_major/prod_major` to reflect their real meaning.
>=20
> This change was tested on Orange Pi 5 (rk3588s) board and the
> results are as follows:
>=20
> Before this change:
>=20
> $ dmesg | grep 'tyr'
> [   19.698338] tyr fb000000.gpu: mali-unknown id 0xa867 major 0x67 minor =
0x0 status 0x5
> [   19.699050] tyr fb000000.gpu: Features: L2:0x7120306 Tiler:0x809 Mem:0=
x301 MMU:0x2830 AS:0xff
> [   19.699817] tyr fb000000.gpu: shader_present=3D0x0000000000050005 l2_p=
resent=3D0x0000000000000001 tiler_present=3D0x0000000000000001
> [   19.702493] tyr fb000000.gpu: Tyr initialized correctly.
>=20
> After this change:
>=20
> $ dmesg | grep 'tyr'
> [   19.591692] tyr fb000000.gpu: mali-g610 id 0xa867 major 0x0 minor 0x0 =
status 0x5
> [   19.592374] tyr fb000000.gpu: Features: L2:0x7120306 Tiler:0x809 Mem:0=
x301 MMU:0x2830 AS:0xff
> [   19.593141] tyr fb000000.gpu: shader_present=3D0x0000000000050005 l2_p=
resent=3D0x0000000000000001 tiler_present=3D0x0000000000000001
> [   19.595831] tyr fb000000.gpu: Tyr initialized correctly.
>=20
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/tyr/gpu.rs | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
> index 6c582910dd5d..da97844efbec 100644
> --- a/drivers/gpu/drm/tyr/gpu.rs
> +++ b/drivers/gpu/drm/tyr/gpu.rs
> @@ -99,13 +99,11 @@ pub(crate) fn new(dev: &Device<Bound>, iomem: &Devres=
<IoMem>) -> Result<Self> {
>      }
> =20
>      pub(crate) fn log(&self, pdev: &platform::Device) {
> -        let major =3D (self.gpu_id >> 16) & 0xff;
> -        let minor =3D (self.gpu_id >> 8) & 0xff;
> -        let status =3D self.gpu_id & 0xff;
> +        let gpu_id =3D GpuId::from(self.gpu_id);
> =20
>          let model_name =3D if let Some(model) =3D GPU_MODELS
>              .iter()
> -            .find(|&f| f.major =3D=3D major && f.minor =3D=3D minor)
> +            .find(|&f| f.arch_major =3D=3D gpu_id.arch_major && f.prod_m=
ajor =3D=3D gpu_id.prod_major)
>          {
>              model.name
>          } else {
> @@ -117,9 +115,9 @@ pub(crate) fn log(&self, pdev: &platform::Device) {
>              "mali-{} id 0x{:x} major 0x{:x} minor 0x{:x} status 0x{:x}",
>              model_name,
>              self.gpu_id >> 16,
> -            major,
> -            minor,
> -            status
> +            gpu_id.ver_major,
> +            gpu_id.ver_minor,
> +            gpu_id.ver_status
>          );
> =20
>          dev_info!(
> @@ -167,14 +165,14 @@ unsafe impl AsBytes for GpuInfo {}
> =20
>  struct GpuModels {
>      name: &'static str,
> -    major: u32,
> -    minor: u32,
> +    arch_major: u32,
> +    prod_major: u32,
>  }
> =20
>  const GPU_MODELS: [GpuModels; 1] =3D [GpuModels {
>      name: "g610",
> -    major: 10,
> -    minor: 7,
> +    arch_major: 10,
> +    prod_major: 7,
>  }];
> =20
>  #[allow(dead_code)]

