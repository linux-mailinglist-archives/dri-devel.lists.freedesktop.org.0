Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 155DDA72E44
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 11:57:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7ED10E8AC;
	Thu, 27 Mar 2025 10:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="rF+ImRBc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17EF10E8AC
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 10:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1743073047; x=1743677847; i=wahrenst@gmx.net;
 bh=nUpxMMkSlP1GLG9y2WxDd2hRqCbwCePcAvk7yyuvIrg=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=rF+ImRBc3i1Q32aSzmZjoxP6yi6tSbvx2dxUpmkN6qv2/RM4J5Vaimds9laqevJr
 ggDoh2IIFdw0teJPX2yki3CwdprndQBtXrj5iNGOYsPcF1YNe9rKicKx6zrkr3zg+
 K4qHaopdotyrvzIM5vK/6j2i79m866SxoGmexE3NejGrPyRvQOM8avF/bY4sU0Eea
 XYE8/hzmZIfo39PMQtFhcdqHG7h9qka/lI6hrX7ynCLiBE+OVfhhH1Z8kE3d87I58
 k90S1nAbyoUxfs0WHgEB8BD1sTX6H6oXjLOnDhP40l0wouCTvFzs3rfPgCotbbRp0
 VMst7uxUVDG83JtKyA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.107] ([37.4.251.153]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MG9kM-1tuQTj2WBY-0097PN; Thu, 27
 Mar 2025 11:57:27 +0100
Message-ID: <bffb4df1-1171-4a9b-9b73-af33136c620a@gmx.net>
Date: Thu, 27 Mar 2025 11:57:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] drm/v3d: Use V3D_SMS registers for power on/off
 and reset on V3D 7.x
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, kernel-dev@igalia.com
References: <20250317-v3d-gpu-reset-fixes-v6-0-f3ee7717ed17@igalia.com>
 <20250317-v3d-gpu-reset-fixes-v6-5-f3ee7717ed17@igalia.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20250317-v3d-gpu-reset-fixes-v6-5-f3ee7717ed17@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:C5PqLnh09+1WAJuqsetZM6VzFDSYGb9N/V/kP/lMGjOW9e9lTZR
 aRrh55avbiqrLNRZK3aRwnIQK8f1XyfDNSfPMwz2AbqSazRyuT22zFkeEYlF8O+xfEp0jD4
 t69FzmOfX/LMQ0TVwuvqB4uLIRiojgVY4M6DtvmmY9PmotJicmc5OSBOa6NyYzE/XAefiSM
 VRmQK8Ib6167mLTg7TfQQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:10iuzMRhk4Y=;MPfK5TMi/EiR1RwhppWrpupIbeu
 1mmCRWFIkFEE4kGM3mZHvKgJ593ja2mrRjh9/NjxUYplYM/8bPHndM2newUpfrhbRrus8HbOm
 c2ic0x9poWmbX6y+wqgHaqXDqxNnq9wSfM0uLwxmB3IG9IaUza0H+QJLhg0FrUWfTQmNkN+WR
 u9h0eoqjzbkK0mQAbGlWypM5SbVaGI0naxabWkMj8NJp6PI7A/UOiQF+rKdqeFgbUnRX/PgNd
 yAIuIauJ1EtwrsAEyp6NANEM8Wv/8qFIhK8DCJnMxa9ghclDbVjQBdPZ/Z0gcgaKHdWewTAXe
 lY1DtbTqpdecx9G/pjPShNuHQkudIk7/smJ3t3AGNEQO1yzEIaQwmO/dj6ND8vwOXBI5MrSLm
 ZLNWqE6E1PSoUPURT95nK7bXnhjftfRFB8nl8ErKoOzZdHXg2gnacem8gm8XEO211i6HEgGeZ
 BtbgOB0BGt+5vpsO9PCy0qV8iJ7VWvbF7RPMHLO9X/3+sq12KuyJ4ZQwsEmzYbVU7Bk8ml04v
 vIKPddKwp1n5m9GMhQYNFiMxQzVLuE4XC7UVoEnjMzEUT4YhorZHfNDuSB5HAqyYJQDgu5TXA
 SqHjQfVDn79u2/5TYC2mk1aP00OBwwNa65Qn/o8z5AsybxkQRsYxF/yXaXikM+hoMxDP7NIzF
 aZ1yyKspVPQScwkjV9EfHdZJf5o8el7Syzmh4lrbNeMvpzFXeUObgvNRWzlpdUIecAY1fmSCc
 qRRi3qKfe2oB2i6fJFepWn4fVWppAYgGc1lXxdlRnEdxY1MZj/aFuiZ9Td0u12ktJUt8BeWaX
 LjFGeRss5p/K0RNnd+FcJ/IPYjATjW5JBZa7L/6hg9cZOHvTrwYiXtzwMj9JkMJ0n/8rY/E6U
 3dXnIPQ0xjDHjQEZCdrJsj9BgOvx8U0M49BO6obrKpW8WjNx+qyETSRhX9uPJFwU9SKXPMKp3
 JCFWyfHpV9ovlwkeqygJcS983WzNDWGmyxnvlrEnyoswMa0dYt7UU1oTtEzKmQNdFk+essXvl
 DWC9TdytsKz9TIrOiEolzSCAWDsZaTDO26DwwqNMBzxjXnTtqUMSdHW65kpcoyddHu/denBxJ
 EzGIzvq7JbEmQO04lnpjPdAbB377kdrmPmW82TnVJlSi3IiDOZdYDHO/B+zX9k6wUASGeLnRW
 vUIjhvwL7M5tTIkuimjvMJ81rQOJEWZCOMdCHwxksPxeAPkm6gGYKt+mT9QDdu3XGjvATay+T
 mhQsGxDRy92c8b7oYFeQfQRQAJQg8rr8S04nzxdMOgaaQOPDjQ02kWwXReiuSVrABaUqr2wOB
 7MhvMtIi226V7qfHBl6SZttUT6qrY8o3tB8lxmy08mYhVl6FvoJ7Qqs8nSbpfCkUtu2LNiOWL
 z2f1cOTNnP55EAZR225gvBHB30SBcme8nD2Ty+BPMALToChRY4QqrE4TlG6m/LEItFRVk9yu7
 cgfHKLdb5c+0IktiMDKC9r72k3Ysh6loDZ5GUoBYiqKP3AKV4ZGLEo1Pf7ZUyci3bjTV4Kw==
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

Hi Ma=C3=ADra,

Am 18.03.25 um 02:01 schrieb Ma=C3=ADra Canal:
> In addition to the standard reset controller, V3D 7.x requires configuri=
ng
> the V3D_SMS registers for proper power on/off and reset. Add the new
> registers to `v3d_regs.h` and ensure they are properly configured during
> device probing, removal, and reset.
>
> This change fixes GPU reset issues on the Raspberry Pi 5 (BCM2712).
> Without exposing these registers, a GPU reset causes the GPU to hang,
> stopping any further job execution and freezing the desktop GUI. The sam=
e
> issue occurs when unloading and loading the v3d driver.
>
> Link: https://github.com/raspberrypi/linux/issues/6660
> Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/v3d/v3d_drv.c  | 40 ++++++++++++++++++++++++++++++++++=
++++++
>   drivers/gpu/drm/v3d/v3d_drv.h  | 11 +++++++++++
>   drivers/gpu/drm/v3d/v3d_gem.c  | 17 +++++++++++++++++
>   drivers/gpu/drm/v3d/v3d_regs.h | 26 ++++++++++++++++++++++++++
>   4 files changed, 94 insertions(+)
>
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv=
.c
> index c63f0ed1bd8a3d5511085e76ed2fbd6ee7df6f80..122848cdccc4a02039d9ea2e=
77aa2f377886b5d6 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -263,6 +263,36 @@ static const struct of_device_id v3d_of_match[] =3D=
 {
>   };
>   MODULE_DEVICE_TABLE(of, v3d_of_match);
>
> +static void
> +v3d_idle_sms(struct v3d_dev *v3d)
> +{
> +	if (v3d->ver < V3D_GEN_71)
> +		return;
> +
> +	V3D_SMS_WRITE(V3D_SMS_TEE_CS, V3D_SMS_CLEAR_POWER_OFF);
> +
> +	if (wait_for((V3D_GET_FIELD(V3D_SMS_READ(V3D_SMS_TEE_CS),
> +				    V3D_SMS_STATE) =3D=3D V3D_SMS_IDLE), 100)) {
> +		DRM_ERROR("Failed to power up SMS\n");
> +	}
> +
> +	v3d_reset_sms(v3d);
> +}
> +
> +static void
> +v3d_power_off_sms(struct v3d_dev *v3d)
> +{
> +	if (v3d->ver < V3D_GEN_71)
> +		return;
> +
> +	V3D_SMS_WRITE(V3D_SMS_TEE_CS, V3D_SMS_POWER_OFF);
> +
> +	if (wait_for((V3D_GET_FIELD(V3D_SMS_READ(V3D_SMS_TEE_CS),
> +				    V3D_SMS_STATE) =3D=3D V3D_SMS_POWER_OFF_STATE), 100)) {
> +		DRM_ERROR("Failed to power off SMS\n");
> +	}
> +}
> +
>   static int
>   map_regs(struct v3d_dev *v3d, void __iomem **regs, const char *name)
>   {
> @@ -300,6 +330,12 @@ static int v3d_platform_drm_probe(struct platform_d=
evice *pdev)
>   	if (ret)
>   		return ret;
>
> +	if (v3d->ver >=3D V3D_GEN_71) {
> +		ret =3D map_regs(v3d, &v3d->sms_regs, "sms");
> +		if (ret)
> +			return ret;
Is it correct, that BCM2712 now requires the SMS register and otherwise
the driver doesn't probe?

Just a note for the future: the devicetree is considered as an ABI [1],
so new kernels should still work with old DTB (no regression). For
Raspberry Pi OS, the kernel and DTB are always updated, but this doesn't
apply for Linux Mainline. AFAIK V3D doesn't work with Linux Mainline on
Raspberry Pi 5 yet, so this is just a theoretical problem.

Best regards

[1] - https://docs.kernel.org/devicetree/bindings/ABI.html
