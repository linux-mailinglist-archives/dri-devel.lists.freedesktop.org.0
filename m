Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D542AF91A9
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 13:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA85E10E0F3;
	Fri,  4 Jul 2025 11:37:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="arz15q2S";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="W4gdiY2u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 430 seconds by postgrey-1.36 at gabe;
 Fri, 04 Jul 2025 11:37:17 UTC
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8BD10E0F3
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 11:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1751629037; x=1783165037;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oQLSCU6s7tadJXW3ijfkRaS6QjwulBRxirc1q6sY6so=;
 b=arz15q2SaZJC1zmuTJ2c5yYyU6rX/GzNQJLYmO4JiRDkW91CAWzL1WGj
 P55dPFMtXhoi8aBhA0F9MbPe8ta5ybbRy98m9DfGsfZLNhCWXQ2yinRZC
 I2KeXwmmRAznVWlDdOqgolDUVZwhEoOLFXe6GY3wqYAWOfj5GFwiPxUxc
 U3BR7F6pOa8pNuHDCefJMoNPS/Bxjg31dqjPtQqzcBHkRH5Fg4pZZLS73
 VDioiF+KBtl5rQxRf0VujJlU51Ac3v/PUP6lvwveJiFsUpKIclX9esN3R
 /jyFDIxVpYrIGSUrnGPhMIDcQek0hSmOcw1JVGGNd3g2GUfwMAoVjWmRj Q==;
X-CSE-ConnectionGUID: jSRuNTPpRsydYLYRPhbXQg==
X-CSE-MsgGUID: R+RKeJOgQ+S5uDN6S6S9fA==
X-IronPort-AV: E=Sophos;i="6.16,287,1744063200"; d="scan'208";a="45031135"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 04 Jul 2025 13:30:04 +0200
X-CheckPoint: {6867BB3C-30-4FC15ADB-CD71293B}
X-MAIL-CPID: 407389F97A04FFAD1E4F8CCE6D42EE93_0
X-Control-Analysis: str=0001.0A006396.6867BB4C.0063, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AC794165607; Fri,  4 Jul 2025 13:29:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1751628600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oQLSCU6s7tadJXW3ijfkRaS6QjwulBRxirc1q6sY6so=;
 b=W4gdiY2u+KnVU6AEdD0acwe3gCkG8t/uyJscqkMzNXOpRFSqpVNFfLN9jFk/1GB+71IMXE
 kWwh6jGmZ+hBi4ZZ98dPY9+hZRc8zDTWF5S42ufc3p0vo0uB7aULUruYxiNzkCrNAT/dIp
 Qpw3v6qWfXz7EwZcnEe677+Ytex/+2ODif3jwmve/nnfYpoL1eTfa7lWOOciCU3ukcS0hr
 d0eYqEiAt1eRyuRZmrjbZV+VihawcFagHfXxm7z1ahKQ7+MsGLI4O48PqNOEl8w9aK2jpC
 vr9n7V6SlBwd92LVSYrWcBgrTkMgNkpj7p61/UB0iymUekecOOfIsYbbIAq8Aw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH 04/14] drm/imx: dc-fu: Fix dimensions
Date: Fri, 04 Jul 2025 13:29:57 +0200
Message-ID: <3702593.R56niFO833@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250704-imx8-dc-prefetch-v1-4-784c03fd645f@nxp.com>
References: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
 <20250704-imx8-dc-prefetch-v1-4-784c03fd645f@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
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

Hi,

thanks for the patch.

Am Freitag, 4. Juli 2025, 11:03:51 CEST schrieb Liu Ying:
> Fix off-by-one issue in LINEWIDTH, LINECOUNT, FRAMEWIDTH and FRAMEHEIGHT
> macro definitions.  The first two macros are used to set a fetchunit's
> source buffer dimension and the other two are used to set a fetchunit's
> frame dimension.  It appears that display controller itself works ok
> without this fix, however, it enters panic mode when prefetch engine(DPRC
> and PRGs) attaches to it without this fix.
>=20
> Fixes: 0e177d5ce01c ("drm/imx: Add i.MX8qxp Display Controller pixel engi=
ne")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  drivers/gpu/drm/imx/dc/dc-fu.c | 4 ++--
>  drivers/gpu/drm/imx/dc/dc-fu.h | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-f=
u.c
> index f94c591c815891468a5c2a940076963eeaa4d51c..b36d3034b8d5962eaab212b6b=
65ebbb5c29f978c 100644
> --- a/drivers/gpu/drm/imx/dc/dc-fu.c
> +++ b/drivers/gpu/drm/imx/dc/dc-fu.c
> @@ -31,8 +31,8 @@
>  #define STRIDE(x)			FIELD_PREP(STRIDE_MASK, (x) - 1)
> =20
>  /* SOURCEBUFFERDIMENSION */
> -#define LINEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x))
> -#define LINECOUNT(x)			FIELD_PREP(GENMASK(29, 16), (x))
> +#define LINEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x) - 1)
> +#define LINECOUNT(x)			FIELD_PREP(GENMASK(29, 16), (x) - 1)
> =20
>  /* LAYEROFFSET */
>  #define LAYERXOFFSET(x)			FIELD_PREP(GENMASK(14, 0), (x))
> diff --git a/drivers/gpu/drm/imx/dc/dc-fu.h b/drivers/gpu/drm/imx/dc/dc-f=
u.h
> index e016e1ea5b4e0471cf6627782603e72d0475c4e8..518d1af49f5ae9d4f67da5e6c=
2e80abd7e962120 100644
> --- a/drivers/gpu/drm/imx/dc/dc-fu.h
> +++ b/drivers/gpu/drm/imx/dc/dc-fu.h
> @@ -38,8 +38,8 @@
>  #define SOURCEBUFFERENABLE		BIT(31)
> =20
>  /* FRAMEDIMENSIONS */
> -#define FRAMEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x))
> -#define FRAMEHEIGHT(x)			FIELD_PREP(GENMASK(29, 16), (x))
> +#define FRAMEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x) - 1)
> +#define FRAMEHEIGHT(x)			FIELD_PREP(GENMASK(29, 16), (x) - 1)
> =20
>  /* CONTROL */
>  #define INPUTSELECT_MASK		GENMASK(4, 3)
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


