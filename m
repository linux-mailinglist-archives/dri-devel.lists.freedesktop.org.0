Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EE5875FB0
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 09:39:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3217A10F8FB;
	Fri,  8 Mar 2024 08:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="gYK21Qyx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8ED10F8FA
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 08:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1709887159; x=1741423159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+0Zk9YrNAPHRCrDTW6MNWvjCjE1nDUbXvpf0eiRTAcI=;
 b=gYK21QyxBKCcYCHTNENpNFtoBSpGoHUKKkMbuyc7zS03C56+m/k/2M8t
 HNpJlD1ZHrgQZVupWoWoYYnez3vQP9vG1SG4rn9qN6MVrrmc7C7oeRPQX
 aWvoY7PWYlMaun2Da4eUwqyjEaNFaHz4aBaSLZnllJJpQhdcswJnyRbEl
 J1Zqtj78XW3dGmVxI1y6kwFa8pnh0WSz+ZxN/2TLxFnaNjYoTVdSZrcMO
 V9FEuEIW5TMeCeHK2Cp/rAU1WtnAqPAYQ+PP/MrdDS+PO4UJ5I6VSP7N4
 xWTk7tt6SVt9ZFn2Sv9pm8LoxZPcXcyAlev5SjjP8jCoLKhsp+eFwJYwP Q==;
X-IronPort-AV: E=Sophos;i="6.07,109,1708383600"; d="scan'208";a="35803051"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 08 Mar 2024 09:39:17 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 4074628007C;
 Fri,  8 Mar 2024 09:39:17 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v8 05/27] drm/tests: Add output bpc tests
Date: Fri, 08 Mar 2024 09:39:18 +0100
Message-ID: <1788224.VLH7GnMWUR@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240307-kms-hdmi-connector-state-v8-5-ef6a6f31964b@kernel.org>
References: <20240307-kms-hdmi-connector-state-v8-0-ef6a6f31964b@kernel.org>
 <20240307-kms-hdmi-connector-state-v8-5-ef6a6f31964b@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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

Hi Maxime,

Am Donnerstag, 7. M=E4rz 2024, 14:38:32 CET schrieb Maxime Ripard:
> Now that we're tracking the output bpc count in the connector state,
> let's add a few tests to make sure it works as expected.
>=20
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/Makefile                     |   1 +
>  .../gpu/drm/tests/drm_atomic_state_helper_test.c   | 436 +++++++++++++++=
++++++
>  drivers/gpu/drm/tests/drm_connector_test.c         | 140 +++++++
>  drivers/gpu/drm/tests/drm_kunit_edid.h             | 106 +++++
>  4 files changed, 683 insertions(+)
>=20
> [snip]
> diff --git a/drivers/gpu/drm/tests/drm_kunit_edid.h b/drivers/gpu/drm/tes=
ts/drm_kunit_edid.h
> new file mode 100644
> index 000000000000..2bba316de064
> --- /dev/null
> +++ b/drivers/gpu/drm/tests/drm_kunit_edid.h
> @@ -0,0 +1,106 @@
> +#ifndef DRM_KUNIT_EDID_H_
> +#define DRM_KUNIT_EDID_H_
> +
> +/*
> + * edid-decode (hex):
> + *
> + * 00 ff ff ff ff ff ff 00 31 d8 2a 00 00 00 00 00
> + * 00 21 01 03 81 a0 5a 78 02 00 00 00 00 00 00 00
> + * 00 00 00 20 00 00 01 01 01 01 01 01 01 01 01 01
> + * 01 01 01 01 01 01 02 3a 80 18 71 38 2d 40 58 2c
> + * 45 00 40 84 63 00 00 1e 00 00 00 fc 00 54 65 73
> + * 74 20 45 44 49 44 0a 20 20 20 00 00 00 fd 00 32
> + * 46 1e 46 0f 00 0a 20 20 20 20 20 20 00 00 00 10
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 92
> + *
> + * 02 03 1b 81 e3 05 00 20 41 10 e2 00 4a 6d 03 0c
> + * 00 12 34 00 28 20 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 d0
> + *
> + * ----------------
> + *
> + * Block 0, Base EDID:
> + *   EDID Structure Version & Revision: 1.3
> + *   Vendor & Product Identification:
> + *     Manufacturer: LNX
> + *     Model: 42
> + *     Made in: 2023
> + *   Basic Display Parameters & Features:
> + *     Digital display
> + *     DFP 1.x compatible TMDS
> + *     Maximum image size: 160 cm x 90 cm
> + *     Gamma: 2.20
> + *     Monochrome or grayscale display
> + *     First detailed timing is the preferred timing
> + *   Color Characteristics:
> + *     Red  : 0.0000, 0.0000
> + *     Green: 0.0000, 0.0000
> + *     Blue : 0.0000, 0.0000
> + *     White: 0.0000, 0.0000
> + *   Established Timings I & II:
> + *     DMT 0x04:   640x480    59.940476 Hz   4:3     31.469 kHz     25.1=
75000 MHz
> + *   Standard Timings: none
> + *   Detailed Timing Descriptors:
> + *     DTD 1:  1920x1080   60.000000 Hz  16:9     67.500 kHz    148.5000=
00 MHz (1600 mm x 900 mm)
> + *                  Hfront   88 Hsync  44 Hback  148 Hpol P
> + *                  Vfront    4 Vsync   5 Vback   36 Vpol P
> + *     Display Product Name: 'Test EDID'
> + *     Display Range Limits:
> + *       Monitor ranges (GTF): 50-70 Hz V, 30-70 kHz H, max dotclock 150=
 MHz
> + *     Dummy Descriptor:
> + *   Extension blocks: 1
> + * Checksum: 0x92
> + *
> + * ----------------
> + *
> + * Block 1, CTA-861 Extension Block:
> + *   Revision: 3
> + *   Underscans IT Video Formats by default
> + *   Native detailed modes: 1
> + *   Colorimetry Data Block:
> + *     sRGB
> + *   Video Data Block:
> + *     VIC  16:  1920x1080   60.000000 Hz  16:9     67.500 kHz    148.50=
0000 MHz
> + *   Video Capability Data Block:
> + *     YCbCr quantization: No Data
> + *     RGB quantization: Selectable (via AVI Q)
> + *     PT scan behavior: No Data
> + *     IT scan behavior: Always Underscanned
> + *     CE scan behavior: Always Underscanned
> + *   Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
> + *     Source physical address: 1.2.3.4
> + *     Maximum TMDS clock: 200 MHz
> + *     Extended HDMI video details:
> + * Checksum: 0xd0  Unused space in Extension Block: 100 bytes
> + */
> +const unsigned char test_edid_hdmi_1080p_rgb_max_200mhz[] =3D {

Shouldn't this be a static one? It's defined in a header.

Best regards,
Alexander

> +  0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x31, 0xd8, 0x2a, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x01, 0x03, 0x81, 0xa0, 0x5a, 0x78,
> +  0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20,
> +  0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
> +  0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x3a, 0x80, 0x18, 0x71, 0x38,
> +  0x2d, 0x40, 0x58, 0x2c, 0x45, 0x00, 0x40, 0x84, 0x63, 0x00, 0x00, 0x1e,
> +  0x00, 0x00, 0x00, 0xfc, 0x00, 0x54, 0x65, 0x73, 0x74, 0x20, 0x45, 0x44,
> +  0x49, 0x44, 0x0a, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xfd, 0x00, 0x32,
> +  0x46, 0x00, 0x00, 0xc4, 0x00, 0x0a, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
> +  0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x41, 0x02, 0x03, 0x1b, 0x81,
> +  0xe3, 0x05, 0x00, 0x20, 0x41, 0x10, 0xe2, 0x00, 0x4a, 0x6d, 0x03, 0x0c,
> +  0x00, 0x12, 0x34, 0x00, 0x28, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0xd0
> +};
> +
> +#endif // DRM_KUNIT_EDID_H_
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


