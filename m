Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A200A633E3
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 12:05:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A1E8967A;
	Tue,  9 Jul 2019 10:05:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7AF88967A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 10:05:27 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jul 2019 03:05:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,470,1557212400"; 
 d="p7s'?scan'208";a="340714829"
Received: from irsmsx107.ger.corp.intel.com ([163.33.3.99])
 by orsmga005.jf.intel.com with ESMTP; 09 Jul 2019 03:05:24 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.164]) by
 IRSMSX107.ger.corp.intel.com ([169.254.10.251]) with mapi id 14.03.0439.000;
 Tue, 9 Jul 2019 11:05:23 +0100
From: "Vasilev, Oleg" <oleg.vasilev@intel.com>
To: "liviu.dudau@arm.com" <liviu.dudau@arm.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "brian.starkey@arm.com" <brian.starkey@arm.com>,
 "hamohammed.sa@gmail.com" <hamohammed.sa@gmail.com>,
 "rodrigosiqueiramelo@gmail.com" <rodrigosiqueiramelo@gmail.com>,
 "contact@emersion.fr" <contact@emersion.fr>
Subject: Re: [PATCH V3 4/5] drm/vkms: Compute CRC without change input data
Thread-Topic: [PATCH V3 4/5] drm/vkms: Compute CRC without change input data
Thread-Index: AQHVK7/lp5X43oOti0qw+UTZJuDPk6bCE2AA
Date: Tue, 9 Jul 2019 10:05:22 +0000
Message-ID: <3b7a5f6ae167517ff37b586b02e3faae38bf6cc0.camel@intel.com>
References: <cover.1561491964.git.rodrigosiqueiramelo@gmail.com>
 <ea7e3a0daa4ee502d8ec67a010120d53f88fa06b.1561491964.git.rodrigosiqueiramelo@gmail.com>
In-Reply-To: <ea7e3a0daa4ee502d8ec67a010120d53f88fa06b.1561491964.git.rodrigosiqueiramelo@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.66.161]
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1528572651=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1528572651==
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature"; boundary="=-NXLBnbD/52Bj0FDRsusX"

--=-NXLBnbD/52Bj0FDRsusX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-06-25 at 22:38 -0300, Rodrigo Siqueira wrote:
> The compute_crc() function is responsible for calculating the
> framebuffer CRC value; due to the XRGB format, this function has to
> ignore the alpha channel during the CRC computation. Therefore,
> compute_crc() set zero to the alpha channel directly in the input
> framebuffer, which is not a problem since this function receives a
> copy
> of the original buffer. However, if we want to use this function in a
> context without a buffer copy, it will change the initial value. This
> patch makes compute_crc() calculate the CRC value without modifying
> the
> input framebuffer.
>=20
> Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 31 +++++++++++++++++---------
> --
>  1 file changed, 19 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c
> b/drivers/gpu/drm/vkms/vkms_composer.c
> index 51a270514219..8126aa0f968f 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -6,33 +6,40 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> =20
> +static u32 get_pixel_from_buffer(int x, int y, const u8 *buffer,
> +				 const struct vkms_composer *composer)
> +{
> +	int src_offset =3D composer->offset + (y * composer->pitch)
> +					  + (x * composer->cpp);
> +
> +	return *(u32 *)&buffer[src_offset];
> +}
> +
>  /**
>   * compute_crc - Compute CRC value on output frame
>   *
> - * @vaddr_out: address to final framebuffer
> + * @vaddr: address to final framebuffer
>   * @composer: framebuffer's metadata
>   *
>   * returns CRC value computed using crc32 on the visible portion of
>   * the final framebuffer at vaddr_out
>   */
> -static uint32_t compute_crc(void *vaddr_out, struct vkms_composer
> *composer)
> +static uint32_t compute_crc(const u8 *vaddr,
> +			    const struct vkms_composer *composer)
>  {
> -	int i, j, src_offset;
> +	int x, y;
>  	int x_src =3D composer->src.x1 >> 16;
>  	int y_src =3D composer->src.y1 >> 16;
>  	int h_src =3D drm_rect_height(&composer->src) >> 16;
>  	int w_src =3D drm_rect_width(&composer->src) >> 16;
> -	u32 crc =3D 0;
> +	u32 crc =3D 0, pixel =3D 0;
> =20
> -	for (i =3D y_src; i < y_src + h_src; ++i) {
> -		for (j =3D x_src; j < x_src + w_src; ++j) {
> -			src_offset =3D composer->offset
> -				     + (i * composer->pitch)
> -				     + (j * composer->cpp);
> +	for (y =3D y_src; y < y_src + h_src; ++y) {
> +		for (x =3D x_src; x < x_src + w_src; ++x) {
>  			/* XRGB format ignores Alpha channel */
> -			memset(vaddr_out + src_offset + 24, 0,  8);
Hi Rodgrigo,

Do I understand correctly, that previous version with memset was
actually zeroing out the whole fb, except first 24 bytes? On the first
iteration bytes 24..32 would be zeroed, on the second 25..33, etc.

Should we add more CRC tests to IGT, so we can catch such mistakes? For
example, compute CRC, than augment random pixel and assert that CRC
changed.

Oleg
> -			crc =3D crc32_le(crc, vaddr_out + src_offset,
> -				       sizeof(u32));
> +			pixel =3D get_pixel_from_buffer(x, y, vaddr,
> composer);
> +			bitmap_clear((void *)&pixel, 0, 8);
> +			crc =3D crc32_le(crc, (void *)&pixel,
> sizeof(u32));
>  		}
>  	}
> =20

--=-NXLBnbD/52Bj0FDRsusX
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

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
DdWSiLBgHgGaO0ThuDGV4bz316/+F4Vy7z9hcMbMJs41eGz9tueMREgDNywNIAdzWQIDAQABo4IC
LjCCAiowHQYDVR0OBBYEFP8BYPvxsk8Ryh4Tt/ZBT5qIg2TiMB8GA1UdIwQYMBaAFB5pKrTcKP5H
GE4hCz+8rBEv8Jj1MGUGA1UdHwReMFwwWqBYoFaGVGh0dHA6Ly93d3cuaW50ZWwuY29tL3JlcG9z
aXRvcnkvQ1JML0ludGVsJTIwRXh0ZXJuYWwlMjBCYXNpYyUyMElzc3VpbmclMjBDQSUyMDRBLmNy
bDCBngYIKwYBBQUHAQEEgZEwgY4waQYIKwYBBQUHMAKGXWh0dHA6Ly93d3cuaW50ZWwuY29tL3Jl
cG9zaXRvcnkvY2VydGlmaWNhdGVzL0ludGVsJTIwRXh0ZXJuYWwlMjBCYXNpYyUyMElzc3Vpbmcl
MjBDQSUyMDRBLmNydDAhBggrBgEFBQcwAYYVaHR0cDovL29jc3AuaW50ZWwuY29tMAsGA1UdDwQE
AwIHgDA8BgkrBgEEAYI3FQcELzAtBiUrBgEEAYI3FQiGw4x1hJnlUYP9gSiFjp9TgpHACWeB3r05
lfBDAgFkAgELMB8GA1UdJQQYMBYGCCsGAQUFBwMEBgorBgEEAYI3CgMMMCkGCSsGAQQBgjcVCgQc
MBowCgYIKwYBBQUHAwQwDAYKKwYBBAGCNwoDDDBJBgNVHREEQjBAoCYGCisGAQQBgjcUAgOgGAwW
b2xlZy52YXNpbGV2QGludGVsLmNvbYEWb2xlZy52YXNpbGV2QGludGVsLmNvbTANBgkqhkiG9w0B
AQUFAAOCAQEAffmCWGLFQzB82/D5fYYzYJ3/8uSfKWA4UPCKcqETG1Zb0vl2FPoCjNID1Bw2HNS7
TxYcXvrVDul3vdCQfQhKonJi4ioJJXPPAQBDKKPkVoL9f/maehuXJYjFNsGmHNYADJL+4bDRJJcq
wIQlFVGXvPJFuTSj9HjJAiwH4zehhiEuTTbDhbaaLVrDsEVKCFMj0nvxN4AsYfoBXbscUVLrZs8n
ZIht2nPvz2NlWwxWgl/7+T42CcriuoeLOPWjmaMncOnXaIR/XNpzvCd6N8Xurg9NhzZaCUwLPAX1
fyAyMXRsdpgqKqVNd+jLBGt87zB3FQQOh73i8+vBMqm1BfEoojGCAhcwggITAgEBMIGQMHkxCzAJ
BgNVBAYTAlVTMQswCQYDVQQIEwJDQTEUMBIGA1UEBxMLU2FudGEgQ2xhcmExGjAYBgNVBAoTEUlu
dGVsIENvcnBvcmF0aW9uMSswKQYDVQQDEyJJbnRlbCBFeHRlcm5hbCBCYXNpYyBJc3N1aW5nIENB
IDRBAhMzAADRf+xxDzfl4feqAAAAANF/MAkGBSsOAwIaBQCgXTAYBgkqhkiG9w0BCQMxCwYJKoZI
hvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xOTA3MDkxMDA1MjJaMCMGCSqGSIb3DQEJBDEWBBTN/CGI
3+9kEqetmvF0SM7vcW8GITANBgkqhkiG9w0BAQEFAASCAQB2o46ri/3jUOPNg16Y9M1dxUBqICc9
3qdNs8tb7IzD9TKkB70/XojeYAfwQWg2mJIx+34xIJfha483NtLL8uDPlbBsL5XAPYKWLXCoZ8GO
xOVHDhYuqIq0abWd/PqhCNJ9zLII0It/buRptX85mTlohGwCcUItqToKy1yrjPcogFU25l5BumTx
dH6lzZCiBUSDKj1knsFwDErEDc6MSnZiIwFueXYY8ceA6uyWelxNS2bOzW+LKPW0BwAJCxN3BQta
fsg1yPTjhKbM3KPb1a/jQ4JcifftSLvSZRskDr2iO6gGtGIQWsHURirHoZOX6h1CGARZ60A8fDTC
1mjP2pXfAAAAAAAA


--=-NXLBnbD/52Bj0FDRsusX--

--===============1528572651==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1528572651==--
