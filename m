Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D8FA263F4
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 20:46:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C41B10E54F;
	Mon,  3 Feb 2025 19:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="jsj851nm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9799D10E54F
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 19:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1738611979; x=1739216779; i=deller@gmx.de;
 bh=D+e6/UKakYk9gJj4pSwyWRCem/OkH3uCWnrW/Htp1Hw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=jsj851nm6pSbNuQu07wwyYfBnkzsspWnWkyQ3qnvZpAY2bL0ElRLztPMuFk+Zz6A
 mR1rt/ZgFyGhj4MbDmSqF86qQaNgurrp+Zmy/xdzHi0ULUAKpS5U4C+aASqEGI4K6
 tvMApXMBh792hGaoVLX2vpWgDbwWwx7ja9wdelXaSm3rjUuTEaEOzDDgZWhNLwvnJ
 czLQf1JqJAH3mFM0NBxR8aYDbUtUNAI4nUD2BmIZKoZurvzkXnkV3QxG0uBA3cOnu
 vcVceFE5Jx0uPuc5E1zvircYWT21JatpzWCtWWDhGvSYxeU1s2exhio4xs3+xLP63
 lq3DNElerdfG/tIURg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.6]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJmKh-1tycR71Wv3-00TMp0; Mon, 03
 Feb 2025 20:41:04 +0100
Message-ID: <1236a374-4863-4a4b-a244-2cb8e52a0526@gmx.de>
Date: Mon, 3 Feb 2025 20:41:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: core: tileblit: Implement missing margin clearing
 for tileblit
To: Soci/Singular <soci@singularcrew.hu>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <c8cc27ea-05a8-14b7-0047-4f1fa6d73f93@singularcrew.hu>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <c8cc27ea-05a8-14b7-0047-4f1fa6d73f93@singularcrew.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5XO4+3fFbxFWVUhj07dZ1H9l0igJqXpQyVe7xjksP1mNETWdUg9
 ulSYaG3LAJRgb/gpTCedd+6vC4v9HjIKXWpBc7mLaTXs0sgTBOsfp1XHXontrgcAXHBdMEn
 WfUcov1JcJaf/9q3EUpUHKfDDAQZfbZs9djyb3aeoplLB5eAWXYt4aElR9obH9FVRODFZ4t
 OG+1NZEJNjo6OCeV54wtA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0Ynu6S5oJRo=;wUrbCpp/6+jTflRXW8EP5jO/InE
 cHrdOF5ut4kyCW2opYGpPBWYnI0M4T2KXugKLAgfWHQ9T4LDAQXCwpMo+hjV1ID4PakbYSBRF
 //wO+K4yYNiUI6wFFku5aMHJ3yyAiWrzKIUhqO4RCOoOczuBc/59S0hnNL7OaG51iR3DYwumM
 Iei1QvfZZGTD93ooD3yFMHXzdykGrnbLiuQcQHvknXWpX9pZtOH4EaO22NT8T99QsiO119haR
 CEfHT6oh/mhyh//cqQeEL6F1DrWS9U0LiM3WPliFDHeKoDRDqfuw9vj20oEqYxeQqXfn4UaKB
 yq4bA29kkoZY8mibMlLVlb6TfGkpl75zXAxH9jehcEkPeFlP28WHW9lMHjLNjxFUAmepapG9T
 UU7FJoq7c1+HsiOQJhZBj8kmUgp3dfn3tU+JdAH+0hBPjxwn3hjP9iVnJjnM3KImX4ysdWiI+
 bgNunx3ViIa66ALigrfVDKE+qqfkLZrZfcVBGr88JTvm8KcNVnxVnESxhLfC3e7BqPKNzmRjf
 bVYbcX2w31O/KH7NYWx0njwpCL5JcGiKDZo02pgrY25JldbdI8QkmIj1LU0yxtAZvXtBI3rsH
 vqECD6P54OsKs99MKXEQ8mR272b/wHEcvYBBbEcJrQMh0YLm3kH4PUTvcyAl3kc5Lz9jaQeOH
 LKf6NVtgTm9wah3BQmxa6KL05c2qyItzwqNK2G4ZAKyWAmve7NhzFpJdl//dMYcI++jtMC6ij
 tGWLnAhcoCRyDks71Bf5KeZwP4FoXsRJwdv1Kxa1Z7SbAXqIfMfw0rNzXPXqieRAOSbfzvdQ2
 xO37Vh2nqGnEEfUshxq8eXSE84HO7NcVHkJAOaG+FlA/DKUC9jSsgKdccnYzx21kC9hNN+ZdP
 zFXDtzxawoRutQecEvlOUwRFD41kPyD746OlBasN6j81v10yzaFQLbHTGWUPWDMelXH3Kcowd
 sEHF8kWcORYx6jlFSq/adfln0XQNLcaKdPRRSjY/eA3RavzQni/mmSHUDmwrZbngP52vdYcgX
 IwiwrkanrARz2WyS4iOJzENzonSL9OxPImkBVZPQhxxVmzrlt71HoNMQu9iPDCVcRwxbuYXY+
 ls1QLjOB8lLe9fkUPc0fecS2rAzkQXVU855mneU6M2d+6nEqMiGeozahL8XDcJpl8J5GoEhFD
 gopk0f2qYXEp43qiF+e6N4V4FNwRQ75QcCxGVqCFS8jHxZ0r2m804hZsusgZaXu7+gKBirrfc
 A8jVzeHoc9qR/fN/z4aEcb0O0djg9gk9SolBrZhgRgjLhuzB5Mr9LUdvC7WoWi4xDdNMMbPjh
 ziBFt+aeh52XZNgbBnymj89P4GZYXUSXy3MG5XidNtmqds=
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

On 2/1/25 09:18, Soci/Singular wrote:
> I was wondering why there's garbage at the bottom of the screen when
> tile blitting is used with an odd mode like 1080, 600 or 200. Sure there=
's
> only space for half a tile but the same area is clean when the buffer
> is bitmap.
>
> Then later I found that it's supposed to be cleaned but that's not
> implemented. So I took what's in bitblit and adapted it for tileblit.
>
> This implementation was tested for both the horizontal and vertical case=
,
> and now does the same as what's done for bitmap buffers.
>
> If anyone is interested to reproduce the problem then I could bet that'd
> be on a S3 or Ark. Just set up a mode with an odd line count and make
> sure that the virtual size covers the complete tile at the bottom. E.g.
> for 600 lines that's 608 virtual lines for a 16 tall tile. Then the
> bottom area should be cleaned.
>
> For the right side it's more difficult as there the drivers won't let an
> odd size happen, unless the code is modified. But once it reports back a
> few pixel columns short then fbcon won't use the last column. With the
> patch that column is now clean.
>
> Btw. the virtual size should be rounded up by the driver for both axes
> (not only the horizontal) so that it's dividable by the tile size.
> That's a driver bug but correcting it is not in scope for this patch.
>
> Implement missing margin clearing for tileblit
>
> Signed-off-by: Zsolt Kajtar <soci@c64.rulez.org>

applied to fbdev git tree.

Helge

> ---
>   drivers/video/fbdev/core/tileblit.c | 37 ++++++++++++++++++++++++++++-
>   1 file changed, 36 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/core/tileblit.c b/drivers/video/fbdev/c=
ore/tileblit.c
> index eff7ec4da..98e528d38 100644
> --- a/drivers/video/fbdev/core/tileblit.c
> +++ b/drivers/video/fbdev/core/tileblit.c
> @@ -76,7 +76,42 @@ static void tile_putcs(struct vc_data *vc, struct fb_=
info *info,
>   static void tile_clear_margins(struct vc_data *vc, struct fb_info *inf=
o,
>   			       int color, int bottom_only)
>   {
> -	return;
> +	unsigned int cw =3D vc->vc_font.width;
> +	unsigned int ch =3D vc->vc_font.height;
> +	unsigned int rw =3D info->var.xres - (vc->vc_cols*cw);
> +	unsigned int bh =3D info->var.yres - (vc->vc_rows*ch);
> +	unsigned int rs =3D info->var.xres - rw;
> +	unsigned int bs =3D info->var.yres - bh;
> +	unsigned int vwt =3D info->var.xres_virtual / cw;
> +	unsigned int vht =3D info->var.yres_virtual / ch;
> +	struct fb_tilerect rect;
> +
> +	rect.index =3D vc->vc_video_erase_char &
> +		((vc->vc_hi_font_mask) ? 0x1ff : 0xff);
> +	rect.fg =3D color;
> +	rect.bg =3D color;
> +
> +	if ((int) rw > 0 && !bottom_only) {
> +		rect.sx =3D (info->var.xoffset + rs + cw - 1) / cw;
> +		rect.sy =3D 0;
> +		rect.width =3D (rw + cw - 1) / cw;
> +		rect.height =3D vht;
> +		if (rect.width + rect.sx > vwt)
> +			rect.width =3D vwt - rect.sx;
> +		if (rect.sx < vwt)
> +			info->tileops->fb_tilefill(info, &rect);
> +	}
> +
> +	if ((int) bh > 0) {
> +		rect.sx =3D info->var.xoffset / cw;
> +		rect.sy =3D (info->var.yoffset + bs) / ch;
> +		rect.width =3D rs / cw;
> +		rect.height =3D (bh + ch - 1) / ch;
> +		if (rect.height + rect.sy > vht)
> +			rect.height =3D vht - rect.sy;
> +		if (rect.sy < vht)
> +			info->tileops->fb_tilefill(info, &rect);
> +	}
>   }
>
>   static void tile_cursor(struct vc_data *vc, struct fb_info *info, bool=
 enable,

