Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B206C9CA22
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 19:29:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B80B10E64A;
	Tue,  2 Dec 2025 18:29:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="I7Vk7Eix";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252F310E64A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 18:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1764700126; x=1765304926; i=deller@gmx.de;
 bh=yCsV+Yf81BDZT3nBGQDIxCv4glbr9+x2X86RPGjsrE0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=I7Vk7EixPNn8cwCm0nzP6EA9JZ8jd+qQRjgnSkgfVPmIoCmwO6R3iDw8J+rFGBX1
 NS6QQmje3WiI6rPk/LH8GtTf5gxd4A3MRQeRv9uOm0Sws4agfCBEyx3tXe+IKDRuR
 oQ4eRED1hITR3m2+THjUeTnpvLO/t0H8rxhxh2zYP0y3uZ+TKNrkFfPftfmB0pwIz
 KesD8FglaSNqT1DIp+04xBWbyIFiWAn7AXqvOSHTZ9h++LfmxkyWyOgOJfm9mckVJ
 JZT91FRE1XuZn70dD2bxsf+w4y1RRpveXREWmfzAnRw4EfYW5caBu1DDKi1ZzmBbS
 EFwzvocuUXl00eItYA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.47]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mwwdl-1wIsoY467n-015sIg; Tue, 02
 Dec 2025 19:28:46 +0100
Message-ID: <a7213b69-f6ae-4975-8c8b-2783dbe9f9b3@gmx.de>
Date: Tue, 2 Dec 2025 19:28:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev/pxafb: Fix multiple clamped values in
 pxafb_adjust_timing
To: Thorsten Blum <thorsten.blum@linux.dev>,
 Chelsy Ratnawat <chelsyratnawat2001@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Raag Jadav <raag.jadav@intel.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251202181600.511166-2-thorsten.blum@linux.dev>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20251202181600.511166-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xz2ocqL4DFmWZUJdufUElcT/u0RkB+A0zdlpFOCNON2JScVgZbU
 o6xhUEkBnMZnWvTqlG56ypTJTE4OLgfd5naMHE4bkCjtddIUFeAiy94bNAUTr7WjxANG6XX
 4NMHAw3m4qGhbxThr3I/e4JBHPxXGBieWM9s2crHvvXmKJxvylbmkX+OnQOS2Dk4DtTafMI
 4t9Hp8JoPzcQDPask79Rg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cxoL23qK4QQ=;O1BJQo0EUzKrRVYhb04Ga3rk1gS
 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
 8Ucwxs1Vhh2eYQ9WWAt9AKrPFaXCQN7XILprBE
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

On 12/2/25 19:15, Thorsten Blum wrote:
> The variables were never clamped because the return value of clamp_val()
> was not used. Fix this by assigning the clamped values, and use clamp()
> instead of clamp_val().
>=20
> Cc: stable@vger.kernel.org
> Fixes: 3f16ff608a75 ("[ARM] pxafb: cleanup of the timing checking code")
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>   drivers/video/fbdev/pxafb.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Thanks for the patch!
It looks good, so I'll include it in the fbdev tree.
Out of curiosity:
How did you notice? Do you actually have the hardware and tested it?

Helge=20
> diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
> index b96a8a96bce8..e418eee825fb 100644
> --- a/drivers/video/fbdev/pxafb.c
> +++ b/drivers/video/fbdev/pxafb.c
> @@ -419,12 +419,12 @@ static int pxafb_adjust_timing(struct pxafb_info *=
fbi,
>   	var->yres =3D max_t(int, var->yres, MIN_YRES);
>  =20
>   	if (!(fbi->lccr0 & LCCR0_LCDT)) {
> -		clamp_val(var->hsync_len, 1, 64);
> -		clamp_val(var->vsync_len, 1, 64);
> -		clamp_val(var->left_margin,  1, 255);
> -		clamp_val(var->right_margin, 1, 255);
> -		clamp_val(var->upper_margin, 1, 255);
> -		clamp_val(var->lower_margin, 1, 255);
> +		var->hsync_len =3D clamp(var->hsync_len, 1, 64);
> +		var->vsync_len =3D clamp(var->vsync_len, 1, 64);
> +		var->left_margin  =3D clamp(var->left_margin,  1, 255);
> +		var->right_margin =3D clamp(var->right_margin, 1, 255);
> +		var->upper_margin =3D clamp(var->upper_margin, 1, 255);
> +		var->lower_margin =3D clamp(var->lower_margin, 1, 255);
>   	}
>  =20
>   	/* make sure each line is aligned on word boundary */

