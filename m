Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F1E6B14CF
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 23:11:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E07D010E733;
	Wed,  8 Mar 2023 22:11:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D4410E733
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 22:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1678313471; i=deller@gmx.de;
 bh=KiCVvUYymv3ZDP5Dqv97SnkeHUGlZBmYwTatTeIiUko=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=N/Vuvgu3Ey34YOmHulL7VdElKv0tyqb783f+anI7oUa4Jx+3wX2w7Vm5iDDMAZk+P
 L5Sc5LDj+MNDGiX97gTZtIiEamauNZ+o8OBMuXap+saUuDYnl197zpanbY4PARoye5
 DDeVQE9u9llQds5K5gbNcnDue9EbOWg507pKztPE7FxnFUIKZtP0EsP9phJko3Ww08
 5ASJkn8gF61bwyRzQdFPWnI90UO5JpmiMAfG8JJdBp6vkgnk7nRaRVKJfOQ+zGeU97
 Sg836ERNgWHNZ/wfDxjcNdypRCy5ytcUx7LcxVJwen9aZyN5VFg5Yq3mbn4aU/EikK
 k/NpIfVkcGfBg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.151.44]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfHAH-1qBreD3FIR-00gmWh; Wed, 08
 Mar 2023 23:05:54 +0100
Message-ID: <123a52d8-baf0-e32b-3262-1e8619b1c3ad@gmx.de>
Date: Wed, 8 Mar 2023 23:05:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] fbdev: tgafb: Fix potential divide by zero
Content-Language: en-US
To: harperchen <harperchen1110@gmail.com>
References: <20230307130856.2295182-1-harperchen1110@gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230307130856.2295182-1-harperchen1110@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IdUOlwZoj5bhTPGnl9poGNK8wqEf95a3RUGpT3QzZH6Y04qhfaU
 VKPgXLA942WRURGMySDpqHMlIV8FWkRfnkGbcwTe0eV3GnycTqCFrM6fN3cKfjHFdIm7sJx
 PX8cq+l4uUdmJ7evOd2QHlaUpTJ+Xf5O505MlnpdVd0SWZptr8LvG+fwlmHCYrZEZ54GfLd
 5egDILNkIqIPk2EGzDnRQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4Py8xK+feCw=;RNP8QJcoqjoMYqDAtpUx94/srbP
 s5W+7xSLGUYWMa1s7N6dGSMZXS9XX1FeidbieUho7lwUv/Yx0IsmdnVcEciZhgH5snD5UYk/j
 bLXCuOf2Mmd+6GUbKwmeXzT2rxdcBnyla2PFGV2GFwguAOg/+bACAh7Sh7Rz5sthDo7WyoR1Y
 bNrP40hNYCpg89vaVHjnNBqoOBEwII/kxE5EPZpjSyWLIueBR+jj1DyD1bFbyv5u4jkAnN+/n
 s4S2cwbKWfb8ZRA7IfdtN9q1WkTTRwbTaWIfidrsBpT/gfOf4l6coL2FjVHctvBRfJvCYDBei
 ktvdy959KMbcJMemxADuv80cls4wrZAbHXolTRoCGhE/HfbysSz/VY+kDocL8/Kcg9dNpmrfk
 ZItUJ4uTomvUxGkGRQ5Ga6ul54MWyKkAYtYUEVwZVKB12BNjNIM5dBZpDvhD7Aan/gN71VVjC
 hpavNpb+Q91QMX2fEkmSH1ix3x1Kz1IkTGms4e0N6i6oNpAHffgC6io/pFK3h/6GPKtDDgc79
 yrdmTVg0eyuY37/vDfzvFlZskiZLkCSKU15W7Z/kgIy9Qe4B5ASbazQLXNSSxazOFWJHNLbpp
 eKlDe/Nb9ZcVA6EE8qRgb169qDvB2/4Nh5bx2u1bsGAMy5blB+bDgwYoHDuuIkSTHOG19Pwx1
 S1B9Fuv2weniwdAr7Ffw2PQCLYWU7SQMp6a6//NwSfADpRRFDuUJ62GaPEgsWK4Bk11O6X4o2
 xssIdWjHBrtKOjunIHK5DdQC1+ELoxmJuyBzAJKMc4WPxyFD6m3KdKCBkZrUzmLN90hsuJ1jF
 dAjPHJOYhdQ68ogQ8/4Ehb9vWeL4v4/BJV8o7QMHJnShsNEG9Yu+3ZZkTFpe3AVQ9VqfGktGm
 3ERWLT3qmLY8EENL1PnVlBKCNDYYsktlEe52j/u+zkEvZqcmfTbgKUHJYDzUywk8+iyCpley+
 YiHzhM2J1/crbYY5m8Y1FyMSsGI=
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
Cc: linux-fbdev@vger.kernel.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 wsa+renesas@sang-engineering.com, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/7/23 14:08, harperchen wrote:
> fb_set_var would by called when user invokes ioctl with cmd
> FBIOPUT_VSCREENINFO. User-provided data would finally reach
> tgafb_check_var. In case var->pixclock is assigned to zero,
> divide by zero would occur when checking whether reciprocal
> of var->pixclock is too high.
>
> Similar crashes have happened in other fbdev drivers. There
> is no check and modification on var->pixclock along the call
> chain to tgafb_check_var. We believe it could also be triggered
> in driver tgafb from user site.
>
> Signed-off-by: harperchen <harperchen1110@gmail.com>

Could you provide a real name?
Otherwise applied to fbdev git tree.

Thanks!
Helge

> ---
>   drivers/video/fbdev/tgafb.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/video/fbdev/tgafb.c b/drivers/video/fbdev/tgafb.c
> index 14d37c49633c..b44004880f0d 100644
> --- a/drivers/video/fbdev/tgafb.c
> +++ b/drivers/video/fbdev/tgafb.c
> @@ -173,6 +173,9 @@ tgafb_check_var(struct fb_var_screeninfo *var, struc=
t fb_info *info)
>   {
>   	struct tga_par *par =3D (struct tga_par *)info->par;
>
> +	if (!var->pixclock)
> +		return -EINVAL;
> +
>   	if (par->tga_type =3D=3D TGA_TYPE_8PLANE) {
>   		if (var->bits_per_pixel !=3D 8)
>   			return -EINVAL;

