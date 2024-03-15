Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E1A87CA24
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 09:44:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5326A112017;
	Fri, 15 Mar 2024 08:44:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="P3u0epMx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 881 seconds by postgrey-1.36 at gabe;
 Fri, 15 Mar 2024 08:44:13 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD20112019
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 08:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1710492249; x=1711097049; i=deller@gmx.de;
 bh=z21ODUA1mNLuZNRTs2+1Da8p6DxdGZIZqzjsQxJQ2K4=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=P3u0epMxNLoBuVfxp/ZTGBzMgTvDNampVV/PtWEoYfhjgXUHjoxFqd7iKTpslkKw
 GhzfWrcge0PVLZ4hT3DlRRmM7kuBO4IYhh05ZacIEJ5P0CeoaR8pdkBuegoVSdZPl
 R6CMU99p9DwSpeqEdUn8en2Wh9p+oSVBaO7FIr0l6qr0+fEQqoPpfQwpy0e66I5og
 GDHfpCX4aP2sc7IjMJfXn55Zxxhcx9vgnzzNqrtXm/jdcQYJ0BM1Lobn2fXa4upw2
 p1E6vMApdsumhYftNQaZChqo0bcjYDNS2FAggoxQqDIIx6TD5WQX7zBhsDTlxBUV+
 tEKdnBa51Wukv3x37w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.155.107]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mr9G2-1qyIMJ2GhS-00oEZ3; Fri, 15
 Mar 2024 09:44:09 +0100
Message-ID: <64bbc4dd-b617-4f3d-809e-763bedf37fb7@gmx.de>
Date: Fri, 15 Mar 2024 09:44:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fbmon: prevent division by zero in
 fb_videomode_from_videomode()
Content-Language: en-US
To: Roman Smirnov <r.smirnov@omp.ru>, Daniel Vetter <daniel@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Karina Yankevich <k.yankevich@omp.ru>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
References: <20240305135150.23240-1-r.smirnov@omp.ru>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20240305135150.23240-1-r.smirnov@omp.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yUkUDlTs45ggPXHdj7xIpPUfdry3SvhegN7JuxR+2kOrW1+Ys5Q
 YRH9/74b8L/ITmIGWrtjepoLsk86OuDgTphT2+/1eeaupotuVa9NxdNGsaJez/7d8jUyKGk
 T+3BRf7C8gixFX8jCPecj4WO8+4XyGYaruEAiyXuy6hVbatprSMBw+ON8FxWwsDpcQ636Qr
 IgEtvJ/MiX40efManxLQw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:tJ4pLWTNd7M=;8atSOyHZrm7NCU3S6v9G3/d83N2
 TOzwFLNnP4ewNliW506wSzypHu10DCAkf3p5U7cXQJA5XJCAKt6jwvMbBexLpHlkJWki9UUYA
 woKYFVrfBXwU5Xl703/SMScP0ZXs+tklLjhewHQ0bzyx47tsWbfHktiDxCgLS8MF4UNfjwjMN
 i81BptkxkO45/HVU/48n33HM00lSleX83E4HKkM8YJSQp1QHLgxCOZOBtMc5hb21dT0n3T5/F
 EfrThsjTEFRgUP6waOsMLSxG7pG8DQ9XOmmmkLfI5i6yTC+1UJpF5Mw2dLAhfaS5Pz4wZe8qN
 ZiZ0Ot/t8n7lWCArSIFgeTPBgNYTgn+YzFW5DW6piCxzRTqr5vruhyrhcBYsLunUIMJojYAex
 ARbK19tPOBbJud+q/1Fo7BcqkL8bgpsISfxC+bgGLhAK/xM9dDRZ7vgI7GQO/xGPMQM4Svf//
 DLxpp1GjI0bZgvQVqHH2UAutcgwr1trq0pW9F4/y9xlTvUtQkqLH4MUc2KXqclNsZQORliJIn
 0jsxV6LuclTHOmAawkVW85mA4ggq0alJehxBJwNVIevJpE1hoet/J0hhaw2hY4y8vw2wpaU4F
 XmHev1kO9gUXmHndYeOLt6h8WXvM7fY+Pg87SjdnY9EfCms4G5efF0B1M63sY+QH5Q8dJVdiE
 0DR81p5EKxjm8aTshJCzlEacSN5RCn7ulT37OXYtrIWoNJiGegPNSfTxYD0RdJWj1QKRLPa8S
 IbRqLnyjLXyq7F3XlqyJSxJVrPjOZ6mNwaZ4k264WIzq21g34xL7TqAMu0vYo5sgRVuNTe+7M
 OtI94od5Cnn4rnHyPNpqzX/Cg5j3Wx4Q1iw4IIRnYpCco=
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

On 3/5/24 14:51, Roman Smirnov wrote:
> The expression htotal * vtotal can have a zero value on
> overflow.

I'm not sure if thos always results in zero in kernel on overflow.
Might be architecture-depended too, but let's assume it
can become zero, ....

> It is necessary to prevent division by zero like in
> fb_var_to_videomode().
>
> Found by Linux Verification Center (linuxtesting.org) with Svace.
>
> Signed-off-by: Roman Smirnov <r.smirnov@omp.ru>
> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> ---
>   V1 -> V2: Replaced the code of the first version with a check.
>
>   drivers/video/fbdev/core/fbmon.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/core/fbmon.c b/drivers/video/fbdev/core=
/fbmon.c
> index 79e5bfbdd34c..b137590386da 100644
> --- a/drivers/video/fbdev/core/fbmon.c
> +++ b/drivers/video/fbdev/core/fbmon.c
> @@ -1344,7 +1344,7 @@ int fb_videomode_from_videomode(const struct video=
mode *vm,
>   	vtotal =3D vm->vactive + vm->vfront_porch + vm->vback_porch +
>   		 vm->vsync_len;
>   	/* prevent division by zero */
> -	if (htotal && vtotal) {
> +	if (htotal && vtotal && (vm->pixelclock / htotal >=3D vtotal)) {

why don't you then simply check for
	if .. ((htotal * vtotal) =3D=3D 0) ...
instead?

Helge

>   		fbmode->refresh =3D vm->pixelclock / (htotal * vtotal);
>   	/* a mode must have htotal and vtotal !=3D 0 or it is invalid */
>   	} else {

