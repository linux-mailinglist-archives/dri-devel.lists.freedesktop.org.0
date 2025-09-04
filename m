Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A5BB440A7
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 17:31:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A2A10EA8A;
	Thu,  4 Sep 2025 15:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ee6EbmdN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A86B710EA8A
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 15:31:00 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3ceb9c3d98cso709907f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 08:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756999859; x=1757604659; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8xE4rmjGRisIQDV5Gl3u0Fv0zsZRWzQtHGzTA13lIgs=;
 b=ee6EbmdNcyQj61qfXbWdSwKuUdTOAu2o7VBSZ3EPNV+qzhnoOdKocARYVQh9sP1ThU
 F6tmPzoSapBgLelpu2OaCjobFgBpXUz3MZWn+aZWjj21fL7DCpI5SP5+EsqefYdfDibk
 Qxsr1dS5APEhs3vBF423ZSxktr7OjwFcbFouaCCJmJWi9XuDBG8dFyUoHPGGvrVOZ2sZ
 4wXPbVqzCvXmnmJ0WGpZID+NIcFmfGDovFpmug7CfagrdPe8u9dj505tq6V9lCBmAqSa
 Cs4bOFlQRVlWW8syFTDmibGz7YKOvldzjYzW7TrSAGaW97D9HdpVfqqD9q4gNmS/9/D8
 6m2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756999859; x=1757604659;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8xE4rmjGRisIQDV5Gl3u0Fv0zsZRWzQtHGzTA13lIgs=;
 b=kpYzytzrflTiIDNyVcIAg5Swh2GeDxlpFVJxnY0QO49KtPEqLyprOPgXCv8S6PkiYs
 y5hoAGDq2LWSPX5iv86BWv3byr+8VXAt4Wf+Ppt8YO5v3HLEKMjawuqiZXVH5vTQAU5G
 pWkOBZwOG+OZW0hAGOFpEm+912Yhi1MExG5ijVbjq7mSnEOtpgI0/grKGzQzfmh3iM8e
 z8YzMPSpygUWHP9Hb+I/h1XyzhgHcuSkxlnD7e9g596dIi5CJZZF5ht3jBjtRqQJfrDY
 aPt3B2O3buveOKipRMXy7BcF27ZHibJIrerXgliKe6DyzTQ37hqRVY45KyIvUGzcPAf2
 OpvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUkfItWlf0oHKLsT+Xjs+KywjlLOOPZ27wofcZXbxUsWxDlUmXr44mPBipsrL+K+vS+y6DQIDpIa0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnYI4iwhmkoI6RBPulWQgb3O+d/0pLqBvsyW6cpmOt6SrlynU1
 /qzmd0HWNQZSDumBs3Tobhik7WjoMV3O4QTwk6u8uggU/Q1MkDeFQ533
X-Gm-Gg: ASbGncsm53HiGc9+5uSCCAfoxQ+GfHkizA2FxSUxfqZ6OnJIt/+qfS8YwlskHhwr2Bx
 FNMGr2y/3yknIeMM/zUh2FpvLXGwbgy57eynJ7ZVZy0e16gleeOcse19u3poxGzY9De8/NJA+/l
 D+0A2NBRyKaRIts2NDMF/IvWmGWsWFAaC2pOLlnGae8lUW3rRil50herxIbBu2Gc+jYN/RkIjcr
 sqXax0MTi0oOO9+WPLswLZ1ym5ObN/tErbj7gJyiuyQz2wZzZRjhZwBD70Iwry+3gSzEiSNFLI4
 qV4YtL18HuQCTtlHVynMt7oINS7fbuWVKTxWDmn6PQkm/uaruM8XoHapVZZQJZqsFSnZ/zlokDu
 jWzLa1UVgrDnOrmTk9VK8TnpXu9sY9Sog5yUj5l4NqtxTeX64Qrzhzm8YZzsifOqqI2kqibOfFD
 gviLg5tYxO
X-Google-Smtp-Source: AGHT+IELB08VGh3VAq+KT32lgs3tsogmI3gmF9iQ69mvKEfdnKdejg4TzGBR9ruyPEVGthqdMWy/EA==
X-Received: by 2002:a5d:588b:0:b0:3dc:1473:18f3 with SMTP id
 ffacd0b85a97d-3dc14731977mr5762689f8f.41.1756999858759; 
 Thu, 04 Sep 2025 08:30:58 -0700 (PDT)
Received: from orome (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d0a1f807f9sm27264155f8f.38.2025.09.04.08.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 08:30:57 -0700 (PDT)
Date: Thu, 4 Sep 2025 17:30:55 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org
Subject: Re: [PATCH 6/9] arm64: tegra: Add VPR placeholder node on Tegra234
Message-ID: <dzbefkymgrtyxfgfcdu4kq7rmgpa6khfqyhzz4a6y3qqonc4gj@yfafsqwnloia>
References: <20250902154630.4032984-1-thierry.reding@gmail.com>
 <20250902154630.4032984-7-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4xtz2xrto4fsphdg"
Content-Disposition: inline
In-Reply-To: <20250902154630.4032984-7-thierry.reding@gmail.com>
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


--4xtz2xrto4fsphdg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 6/9] arm64: tegra: Add VPR placeholder node on Tegra234
MIME-Version: 1.0

On Tue, Sep 02, 2025 at 05:46:26PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> This node contains two sets of properties, one for the case where the
> VPR is resizable (in which case the VPR region will be dynamically
> allocated at boot time) and another case where the VPR is fixed in size
> and initialized by early firmware.
>=20
> The firmware running on the device is responsible for updating the node
> with the real physical address for the fixed VPR case and remove the
> properties needed only for resizable VPR. Similarly, if the VPR is
> resizable, the firmware should remove the "reg" property since it is no
> longer needed.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 34 ++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra234.dtsi
> index df034dbb8285..4d572f5fa0b1 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> @@ -28,6 +28,40 @@ aliases {
>  		i2c8 =3D &dp_aux_ch3_i2c;
>  	};
> =20
> +	reserved-memory {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		vpr: video-protection-region@0 {
> +			compatible =3D "nvidia,tegra-video-protection-region";
> +			status =3D "disabled";
> +			no-map;
> +
> +			/*
> +			 * Two variants exist for this. For fixed VPR, the
> +			 * firmware is supposed to update the "reg" property
> +			 * with the fixed memory region configured as VPR.
> +			 *
> +			 * For resizable VPR we don't care about the exact
> +			 * address and instead want a reserved region to be
> +			 * allocated with a certain size and alignment at
> +			 * boot time.
> +			 *
> +			 * The firmware is responsible for removing the
> +			 * unused set of properties.
> +			 */
> +
> +			/* fixed VPR */
> +			reg =3D <0x0 0x0 0x0 0x0>;
> +
> +			/* resizable VPR */
> +			size =3D <0x0 0x70000000>;
> +			alignment =3D <0x0 0x100000>;
> +			reusable;
> +		};
> +	};

Hi DT maintainers,

I wanted to get some feedback on this type of placeholder DT node. This
doesn't actually validate properly because it contains properties for
both the fixed and resizable VPR variants, which are mutually exclusive.
However, the way that this currently works is that UEFI will remove and
update whatever properties need to change during boot, so the booted
kernel ends up with the correct, non-conflicting information.

The reason why it was done this way is because it simplifies the code in
UEFI to update this node. Also, without this being a placeholder I don't
know what to put into this. There's no "default" for this. One option is
to not have this in the DT at all and completely create it at boot time,
but then it becomes quite difficult to create the phandle references.

While at it, I'm not sure if I properly understand how to correctly name
a reserved-memory region that is dynamically allocated like in the case
of resizable VPR? It doesn't have a base address during boot and the
kernel will allocate memory where it sees fit. Do I just leave out the
unit-address in that case?

Thanks,
Thierry

--4xtz2xrto4fsphdg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmi5sKwACgkQ3SOs138+
s6EL1w/+O3vMzwflDNuAsOeJT5PO30EnSdPQtwSfs1kegW1Z0O7O+SxPDRbIOumH
ZtXCWjmHUA0x4A4tV1KHYusXEpLe8kdgMeaFYK3XECONFcW/xto7lbOk9ujNo4B0
RSBU+KmbKVeHe3JQ8ENftNYUpQqLHdBEi/FZVlgjZW8KLe+MuWHnvoZsutLTvLim
edJeSpS/ms98AYPqE+MACLkqG92b1y0jgGhsa3dymQhX6RYbJxLTzO3SCG9WKpFL
OkfgV5XwyRYgsBQDIkJnBu4+CtPOO2mJeUQGuHgvSlfv8Ulz6jYKIcPQj5hhJ8KZ
qtqV5vMoRauXf76f97vKenJ86SPlWymUWCj5/K88mqtDm9EUoTtMT0LfGhCsIfIX
TNBYgIz79w16UvFuZ/CmD2MEUPi00WpA5b2UyifcHKKnORwL08lBhLD0r5UWMf/H
qUqNt0qtK2EuPjOeUMwB8YN5VPZCP4oWEWoSVCF3cbjUitjx2ogJRMgeazsAZdmP
x1+CSVvTpQ1RqXIn3ezRgBkPLQ2d1KJIJdv+pdQn1zcFTuqd0nP5yFS52TiWsJ8/
cczmrWcs3r30Aoaw3e0rW3OQHghuXLaavcm6FmLVFGs4VDlpRbFnESuLbynzAbAk
7VfAJwgPBaLVqs2UqkC5ezADL7wV+VxmrcPUry4JBO+17jVwwBk=
=p0GH
-----END PGP SIGNATURE-----

--4xtz2xrto4fsphdg--
