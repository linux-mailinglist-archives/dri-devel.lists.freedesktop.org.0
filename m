Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C74B797F156
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 21:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ECFE10E481;
	Mon, 23 Sep 2024 19:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="tkN/hx3N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1DF210E481
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 19:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1727120700; x=1727725500; i=deller@gmx.de;
 bh=DsU93JGlxA0QqymVUBTHJF5pe2jt27csGWQyOojGadU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=tkN/hx3NDnT/fhOq5SOjfM3wq4TVrTLpplQGrcvPAhTZN0dUuoDe+03CCJC9AuW2
 nrDJqJj7VwwABKTfjauGmB115KdgSOObqcoLbZCWN3aOv+95fru4pDmBZ3FnSBD2h
 sFF/fRtcY8uBpu3cPnvZBN+jgiftowsDxHTe8kkjfjSTtSj9nIKkUQnwwnkV+sPwa
 6NXtzVl04Atw/HGYnHdvy/Xoea0kpDwuszHOEmDzk/Crm6oNyjfyJ1be9NQyWvlpU
 8KcdYCx6awd0j5MuasOYMLgK2ugeugHQDv3IVOWtTg2I8xprzXVlHRO15vqoPsEQM
 mayzS9hXRAcQSIMv5A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mt75H-1s3kfd2I6T-00zjbd; Mon, 23
 Sep 2024 21:45:00 +0200
Message-ID: <d4a85d99-7dc3-454d-bcc2-4f4746a0f474@gmx.de>
Date: Mon, 23 Sep 2024 21:44:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] fbcon: fbcon_is_inactive() -> fbcon_is_active()
To: Ville Syrjala <ville.syrjala@linux.intel.com>, linux-fbdev@vger.kernel.org
Cc: Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
References: <20240923155749.30846-1-ville.syrjala@linux.intel.com>
 <20240923155749.30846-5-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 xsFNBF3Ia3MBEAD3nmWzMgQByYAWnb9cNqspnkb2GLVKzhoH2QD4eRpyDLA/3smlClbeKkWT
 HLnjgkbPFDmcmCz5V0Wv1mKYRClAHPCIBIJgyICqqUZo2qGmKstUx3pFAiztlXBANpRECgwJ
 r+8w6mkccOM9GhoPU0vMaD/UVJcJQzvrxVHO8EHS36aUkjKd6cOpdVbCt3qx8cEhCmaFEO6u
 CL+k5AZQoABbFQEBocZE1/lSYzaHkcHrjn4cQjc3CffXnUVYwlo8EYOtAHgMDC39s9a7S90L
 69l6G73lYBD/Br5lnDPlG6dKfGFZZpQ1h8/x+Qz366Ojfq9MuuRJg7ZQpe6foiOtqwKym/zV
 dVvSdOOc5sHSpfwu5+BVAAyBd6hw4NddlAQUjHSRs3zJ9OfrEx2d3mIfXZ7+pMhZ7qX0Axlq
 Lq+B5cfLpzkPAgKn11tfXFxP+hcPHIts0bnDz4EEp+HraW+oRCH2m57Y9zhcJTOJaLw4YpTY
 GRUlF076vZ2Hz/xMEvIJddRGId7UXZgH9a32NDf+BUjWEZvFt1wFSW1r7zb7oGCwZMy2LI/G
 aHQv/N0NeFMd28z+deyxd0k1CGefHJuJcOJDVtcE1rGQ43aDhWSpXvXKDj42vFD2We6uIo9D
 1VNre2+uAxFzqqf026H6cH8hin9Vnx7p3uq3Dka/Y/qmRFnKVQARAQABzRxIZWxnZSBEZWxs
 ZXIgPGRlbGxlckBnbXguZGU+wsGRBBMBCAA7AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheA
 FiEERUSCKCzZENvvPSX4Pl89BKeiRgMFAl3J1zsCGQEACgkQPl89BKeiRgNK7xAAg6kJTPje
 uBm9PJTUxXaoaLJFXbYdSPfXhqX/BI9Xi2VzhwC2nSmizdFbeobQBTtRIz5LPhjk95t11q0s
 uP5htzNISPpwxiYZGKrNnXfcPlziI2bUtlz4ke34cLK6MIl1kbS0/kJBxhiXyvyTWk2JmkMi
 REjR84lCMAoJd1OM9XGFOg94BT5aLlEKFcld9qj7B4UFpma8RbRUpUWdo0omAEgrnhaKJwV8
 qt0ULaF/kyP5qbI8iA2PAvIjq73dA4LNKdMFPG7Rw8yITQ1Vi0DlDgDT2RLvKxEQC0o3C6O4
 iQq7qamsThLK0JSDRdLDnq6Phv+Yahd7sDMYuk3gIdoyczRkXzncWAYq7XTWl7nZYBVXG1D8
 gkdclsnHzEKpTQIzn/rGyZshsjL4pxVUIpw/vdfx8oNRLKj7iduf11g2kFP71e9v2PP94ik3
 Xi9oszP+fP770J0B8QM8w745BrcQm41SsILjArK+5mMHrYhM4ZFN7aipK3UXDNs3vjN+t0zi
 qErzlrxXtsX4J6nqjs/mF9frVkpv7OTAzj7pjFHv0Bu8pRm4AyW6Y5/H6jOup6nkJdP/AFDu
 5ImdlA0jhr3iLk9s9WnjBUHyMYu+HD7qR3yhX6uWxg2oB2FWVMRLXbPEt2hRGq09rVQS7DBy
 dbZgPwou7pD8MTfQhGmDJFKm2jvOwU0EXchrcwEQAOsDQjdtPeaRt8EP2pc8tG+g9eiiX9Sh
 rX87SLSeKF6uHpEJ3VbhafIU6A7hy7RcIJnQz0hEUdXjH774B8YD3JKnAtfAyuIU2/rOGa/v
 UN4BY6U6TVIOv9piVQByBthGQh4YHhePSKtPzK9Pv/6rd8H3IWnJK/dXiUDQllkedrENXrZp
 eLUjhyp94ooo9XqRl44YqlsrSUh+BzW7wqwfmu26UjmAzIZYVCPCq5IjD96QrhLf6naY6En3
 ++tqCAWPkqKvWfRdXPOz4GK08uhcBp3jZHTVkcbo5qahVpv8Y8mzOvSIAxnIjb+cklVxjyY9
 dVlrhfKiK5L+zA2fWUreVBqLs1SjfHm5OGuQ2qqzVcMYJGH/uisJn22VXB1c48yYyGv2HUN5
 lC1JHQUV9734I5cczA2Gfo27nTHy3zANj4hy+s/q1adzvn7hMokU7OehwKrNXafFfwWVK3OG
 1dSjWtgIv5KJi1XZk5TV6JlPZSqj4D8pUwIx3KSp0cD7xTEZATRfc47Yc+cyKcXG034tNEAc
 xZNTR1kMi9njdxc1wzM9T6pspTtA0vuD3ee94Dg+nDrH1As24uwfFLguiILPzpl0kLaPYYgB
 wumlL2nGcB6RVRRFMiAS5uOTEk+sJ/tRiQwO3K8vmaECaNJRfJC7weH+jww1Dzo0f1TP6rUa
 fTBRABEBAAHCwXYEGAEIACAWIQRFRIIoLNkQ2+89Jfg+Xz0Ep6JGAwUCXchrcwIbDAAKCRA+
 Xz0Ep6JGAxtdEAC54NQMBwjUNqBNCMsh6WrwQwbg9tkJw718QHPw43gKFSxFIYzdBzD/YMPH
 l+2fFiefvmI4uNDjlyCITGSM+T6b8cA7YAKvZhzJyJSS7pRzsIKGjhk7zADL1+PJei9p9idy
 RbmFKo0dAL+ac0t/EZULHGPuIiavWLgwYLVoUEBwz86ZtEtVmDmEsj8ryWw75ZIarNDhV74s
 BdM2ffUJk3+vWe25BPcJiaZkTuFt+xt2CdbvpZv3IPrEkp9GAKof2hHdFCRKMtgxBo8Kao6p
 Ws/Vv68FusAi94ySuZT3fp1xGWWf5+1jX4ylC//w0Rj85QihTpA2MylORUNFvH0MRJx4mlFk
 XN6G+5jIIJhG46LUucQ28+VyEDNcGL3tarnkw8ngEhAbnvMJ2RTx8vGh7PssKaGzAUmNNZiG
 MB4mPKqvDZ02j1wp7vthQcOEg08z1+XHXb8ZZKST7yTVa5P89JymGE8CBGdQaAXnqYK3/yWf
 FwRDcGV6nxanxZGKEkSHHOm8jHwvQWvPP73pvuPBEPtKGLzbgd7OOcGZWtq2hNC6cRtsRdDx
 4TAGMCz4j238m+2mdbdhRh3iBnWT5yPFfnv/2IjFAk+sdix1Mrr+LIDF++kiekeq0yUpDdc4
 ExBy2xf6dd+tuFFBp3/VDN4U0UfG4QJ2fg19zE5Z8dS4jGIbLg==
In-Reply-To: <20240923155749.30846-5-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:E6wa4DNo8mtBVVAeomvwsquQvKKAzxcY9KtRcy2jk6MvY4AHBgG
 242QzgYNkj0b3NRl9tRqNOLW47fthZ7F1gst9TNZAEqN/ZES8b0pjFA3EB5c1Kp3Ti5qkwm
 1YALVD+6yiT45dMz50TGzKvIrcq5ynm4WOQCK+FY4hR4rSssomZxjzUzsFsSGZZOsHwOEGt
 8CzcTrwFyatObNqQ2w3YQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3RAm5JZvoP0=;jtC7Qx2rFgqvB86lf0uXN+nTFCr
 JCdigMuugt/qDiyfDrnRodI5H38yRG6vZAHAqQTBhdRkibsrzkQ+i+fVVFprksDnTPlHWux8m
 N5TP/pK6XX96bonWn30KWAOosZPFvgp8zaAer5tEucwmyz604w9HdmO89VGn6czwdMDak9sU9
 5bx+rHHSSuHqde3XVoJ1+f4d2dnn4sncpYL70BbTsUKn0rlVn2dZwjWl+A+GPdF29OuJynjmj
 xG5m9GpmIIYHVLWhTWR1arRGlEH+Ntus4BQKZ75Gr1furr4D6VVaCB2laAU2BHGlEFqmKv7Zy
 yCiRPrdEoLsrs70thll080OBjid1dDNnvfbnDg0scSTTYMMglcpyFC45mH+TdvgXBO9mVsJBL
 1QBJS04grC8OdkQn9ZcWYy0UyLyOaQQjVMtAsQDyIMcwFzC3ru9ZuxyKoIpyKqVa5csixbknX
 oqFIqXgIzuotHM/NXH74pcKSfs08GWBBObnW4yOj3L4dDF7Tr+IjfhyysqqF/bE4+gk1HW1z1
 BttGPE6WTne1VW33OokcYHevL5Ma8fCp+h886ni3rrPTgglUchJe9ZP19aAVxtczZ73sNS622
 KI5rcXaUoDo8zC843k8PLuLbIxq3EygGUFccnCbOdty23uyvrsLATGrF9abyMs6yAkB3c8CFO
 s6e5ICpHO9DSgxYfwxAkr/TeAbnq8QPmYBi5Jk+eKJ2Rdp5Sl11y7Agz1RodqZOsXdrEXWsX7
 tgNsL9TiC503fv7FeYMZGnc4MGTTodF4q/my1ONWP61RQedkNLFZNAfIZle7qnCJuMgPtVaGm
 YhwvKxenh9t0N3hasFLtw4VQ==
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

On 9/23/24 17:57, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Invert fbcon_is_inactive() into fbcon_is_active(). Much easier
> on the poor brain when you don't have to do dobule negations
> all over the place.

Agreed.
Acked-by: Helge Deller <deller@gmx.de>


> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>   drivers/video/fbdev/core/fbcon.c | 30 +++++++++++++++---------------
>   1 file changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core=
/fbcon.c
> index eb30aa872371..2a78cca3e9de 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -281,12 +281,12 @@ static bool fbcon_skip_panic(struct fb_info *info)
>   #endif
>   }
>
> -static inline int fbcon_is_inactive(struct vc_data *vc, struct fb_info =
*info)
> +static inline int fbcon_is_active(struct vc_data *vc, struct fb_info *i=
nfo)
>   {
>   	struct fbcon_ops *ops =3D info->fbcon_par;
>
> -	return (info->state !=3D FBINFO_STATE_RUNNING ||
> -		vc->vc_mode !=3D KD_TEXT || ops->graphics || fbcon_skip_panic(info));
> +	return info->state =3D=3D FBINFO_STATE_RUNNING &&
> +		vc->vc_mode =3D=3D KD_TEXT && !ops->graphics && !fbcon_skip_panic(inf=
o);
>   }
>
>   static int get_color(struct vc_data *vc, struct fb_info *info,
> @@ -1253,7 +1253,7 @@ static void __fbcon_clear(struct vc_data *vc, unsi=
gned int sy, unsigned int sx,
>   	struct fbcon_display *p =3D &fb_display[vc->vc_num];
>   	u_int y_break;
>
> -	if (fbcon_is_inactive(vc, info))
> +	if (!fbcon_is_active(vc, info))
>   		return;
>
>   	if (!height || !width)
> @@ -1295,7 +1295,7 @@ static void fbcon_putcs(struct vc_data *vc, const =
u16 *s, unsigned int count,
>   	struct fbcon_display *p =3D &fb_display[vc->vc_num];
>   	struct fbcon_ops *ops =3D info->fbcon_par;
>
> -	if (!fbcon_is_inactive(vc, info))
> +	if (fbcon_is_active(vc, info))
>   		ops->putcs(vc, info, s, count, real_y(p, ypos), xpos,
>   			   get_color(vc, info, scr_readw(s), 1),
>   			   get_color(vc, info, scr_readw(s), 0));
> @@ -1306,7 +1306,7 @@ static void fbcon_clear_margins(struct vc_data *vc=
, int bottom_only)
>   	struct fb_info *info =3D fbcon_info_from_console(vc->vc_num);
>   	struct fbcon_ops *ops =3D info->fbcon_par;
>
> -	if (!fbcon_is_inactive(vc, info))
> +	if (fbcon_is_active(vc, info))
>   		ops->clear_margins(vc, info, margin_color, bottom_only);
>   }
>
> @@ -1318,7 +1318,7 @@ static void fbcon_cursor(struct vc_data *vc, bool =
enable)
>
>   	ops->cur_blink_jiffies =3D msecs_to_jiffies(vc->vc_cur_blink_ms);
>
> -	if (fbcon_is_inactive(vc, info) || vc->vc_deccm !=3D 1)
> +	if (!fbcon_is_active(vc, info) || vc->vc_deccm !=3D 1)
>   		return;
>
>   	if (vc->vc_cursor_type & CUR_SW)
> @@ -1724,7 +1724,7 @@ static void fbcon_bmove(struct vc_data *vc, int sy=
, int sx, int dy, int dx,
>   	struct fb_info *info =3D fbcon_info_from_console(vc->vc_num);
>   	struct fbcon_display *p =3D &fb_display[vc->vc_num];
>
> -	if (fbcon_is_inactive(vc, info))
> +	if (!fbcon_is_active(vc, info))
>   		return;
>
>   	if (!width || !height)
> @@ -1748,7 +1748,7 @@ static bool fbcon_scroll(struct vc_data *vc, unsig=
ned int t, unsigned int b,
>   	struct fbcon_display *p =3D &fb_display[vc->vc_num];
>   	int scroll_partial =3D info->flags & FBINFO_PARTIAL_PAN_OK;
>
> -	if (fbcon_is_inactive(vc, info))
> +	if (!fbcon_is_active(vc, info))
>   		return true;
>
>   	fbcon_cursor(vc, false);
> @@ -2132,7 +2132,7 @@ static bool fbcon_switch(struct vc_data *vc)
>   			fbcon_del_cursor_work(old_info);
>   	}
>
> -	if (fbcon_is_inactive(vc, info) ||
> +	if (!fbcon_is_active(vc, info) ||
>   	    ops->blank_state !=3D FB_BLANK_UNBLANK)
>   		fbcon_del_cursor_work(info);
>   	else
> @@ -2172,7 +2172,7 @@ static bool fbcon_switch(struct vc_data *vc)
>   	scrollback_max =3D 0;
>   	scrollback_current =3D 0;
>
> -	if (!fbcon_is_inactive(vc, info)) {
> +	if (fbcon_is_active(vc, info)) {
>   	    ops->var.xoffset =3D ops->var.yoffset =3D p->yscroll =3D 0;
>   	    ops->update_start(info);
>   	}
> @@ -2228,7 +2228,7 @@ static bool fbcon_blank(struct vc_data *vc, enum v=
esa_blank_mode blank,
>   		}
>   	}
>
> - 	if (!fbcon_is_inactive(vc, info)) {
> +	if (fbcon_is_active(vc, info)) {
>   		if (ops->blank_state !=3D blank) {
>   			ops->blank_state =3D blank;
>   			fbcon_cursor(vc, !blank);
> @@ -2242,7 +2242,7 @@ static bool fbcon_blank(struct vc_data *vc, enum v=
esa_blank_mode blank,
>   			update_screen(vc);
>   	}
>
> -	if (mode_switch || fbcon_is_inactive(vc, info) ||
> +	if (mode_switch || !fbcon_is_active(vc, info) ||
>   	    ops->blank_state !=3D FB_BLANK_UNBLANK)
>   		fbcon_del_cursor_work(info);
>   	else
> @@ -2572,7 +2572,7 @@ static void fbcon_set_palette(struct vc_data *vc, =
const unsigned char *table)
>   	int i, j, k, depth;
>   	u8 val;
>
> -	if (fbcon_is_inactive(vc, info))
> +	if (!fbcon_is_active(vc, info))
>   		return;
>
>   	if (!con_is_visible(vc))
> @@ -2672,7 +2672,7 @@ static void fbcon_modechanged(struct fb_info *info=
)
>   		scrollback_max =3D 0;
>   		scrollback_current =3D 0;
>
> -		if (!fbcon_is_inactive(vc, info)) {
> +		if (fbcon_is_active(vc, info)) {
>   		    ops->var.xoffset =3D ops->var.yoffset =3D p->yscroll =3D 0;
>   		    ops->update_start(info);
>   		}

