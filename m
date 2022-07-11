Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C109570C9E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 23:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F139166A;
	Mon, 11 Jul 2022 21:21:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4645291669
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 21:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1657574465;
 bh=pulbl6ZVMF89zqi4FCDK9+iI1hZBrDJ8HumaDHMz+4s=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=AxTWPobAALVtt6qz0PnEwWDJhaQKiIIYYtayCZo8Ee+NdMHNcKnVmSKaACz3nugzy
 HetiOTydYhFfpK20CqdQJhDexwMD9UQ5ul4bMyCi3g3RqW3id/cifYXpo2UW3PA1XC
 BvQUZBgMyDa8KnWSuHA0T0aQZhJ8MfK7rMxnHgkc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.184.221]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MVN6t-1o22Xn3SKt-00SKrM; Mon, 11
 Jul 2022 23:21:04 +0200
Message-ID: <681e1739-d251-661a-a46f-9412f3b6e165@gmx.de>
Date: Mon, 11 Jul 2022 23:20:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] video: fbdev: amiga: Simplify amifb_pan_display()
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <b803f10a2b3b85386b25a2e25b98fb4e59413ea9.1657553681.git.geert@linux-m68k.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <b803f10a2b3b85386b25a2e25b98fb4e59413ea9.1657553681.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nVTr6BBwsWtnZx2aandyv+fUBwA/rXHQ6laYCVuq5K6BMshiorz
 oSUQh06r/DOmXqzDdd5MVI7jLmIlTNgzFGwmwDnAR2OzyUN2qCk2pjlhQH6V4Wl+skQ/cq2
 1poDea8TEluhigguiyqt+Ash7248Rhgqdb6x25clkWzCQUlwIr/oUuE5umGLWMaz82xDURS
 50wroyX+c1Zo0C2Dtrf9A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NZ4kLPOUqWI=:ddtZJMwIk26PDP1AFeNs1I
 CK9cdRIKjSuTZTp1SQ8KYb/TLEpyJQfas9W/uqwufPJgcZyDeOmyK0QOFEOxd/BngpwArrQIE
 c6Ru/c4/rDTsanux1uA/krsBHHCkXGL9QJVw6MuAhlP1sisi/iN/AF4MGwEGmyDGsS1PfVwuZ
 GhC9iwzbxs12fzBjG6++qyDiFJHMwHSLfAJ+ZPwQJkbRiCpLQbRfMxNhyIYDi2iPkpnbsKfKk
 zFj41bGRf+TwVjpwhaSsN3ChpuNgxUEHRxxgTEK2ZIvbaEZ5jFQdngNVJQ4AN79eou+GuUL53
 vjQnWxknd/UpgIGIgQ7Y/1kl/wiiTKAd43W32IcdiZDO95JVKp8oD595IFgHmwl/lcKLXDfld
 qdX//ZJBrqBwL7d9dsCtQ1aQs8A50MYWtJT9AcrAZVXAup4eJO9p2hc27L9ijE7rl43XWFQ5n
 UdN2okVmidi/HEWbBqlyg8Fg5b63I+sf0Bj7e0Pav4/heM0Gk83OL2axdVJdmB3wuX4tPoD87
 zuFAMP7S0U2IetH8GckowCnU5qmgxQMDxbqbF97T+zduYczc6p+dHbPv83HSBgO9OY9bK4Pef
 oJnfIH1FgdySEhD1QuZ7LvMpX16RodLvbXuj2u/NlU7N72DEgXGmc2ZsL/ClFJKGUmGGAVLtw
 v6c7YepDyAIxLnIKxsRU37MWT+yGaTf2NqNiPxXuuuHaZJ3NfyWysn2lko9ThNXkuHJ0WvcZn
 g63SJB+apu0mgvrEIUXQiD+70i8roxHz2gZGzWow8doisq945ActjgeVRyWLRztPlEG7UWuZC
 st9LRE+wGnEp5S7TYMAaM4eaQYMwdfI0EoQyFZSu04mo0F6l/uYV056R6uR/dZUHeFFf/eT0c
 VofMUn0GKy2BcAuJDYBnyKJOi0nSaNFwwM6wFGI1mmvBluksLL1lM51qMC5U4EwxvYk5w/jy+
 pweCuDF4U9xow9b+XF2M7LOmKLCuiH00wfSoeVp5+PJFTFl5SNWnG4uGKHRetPXFzi0vW+tUJ
 1yq2HC+N3Nbw9+7fqknLNIJLssDMPxGsdcT7/G/EPRIWNunhLGMyfjzJH4G5KzilESJUDrhJH
 r5+1ci5/NfJFG26RzRLFY6F1qGN/DLMsPbyHSfacItYZnZ/bFdkIsTTmA==
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
Cc: linux-fbdev@vger.kernel.org, linux-m68k@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/11/22 17:35, Geert Uytterhoeven wrote:
> The fb_pan_display() function in the core already takes care of
> validating most panning parameters before calling the driver's
> .fb_pan_display() callback, and of updating the panning state
> afterwards, so there is no need to repeat that in the driver.
>
> Remove the duplicate code.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

I've applied this and the other 3 patches to the fbdev git tree.

Thanks!
Helge


> ---
>  drivers/video/fbdev/amifb.c | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/video/fbdev/amifb.c b/drivers/video/fbdev/amifb.c
> index 6e07a97bbd31a1dd..d88265dbebf4cb19 100644
> --- a/drivers/video/fbdev/amifb.c
> +++ b/drivers/video/fbdev/amifb.c
> @@ -2540,27 +2540,16 @@ static int amifb_blank(int blank, struct fb_info=
 *info)
>  static int amifb_pan_display(struct fb_var_screeninfo *var,
>  			     struct fb_info *info)
>  {
> -	if (var->vmode & FB_VMODE_YWRAP) {
> -		if (var->yoffset < 0 ||
> -			var->yoffset >=3D info->var.yres_virtual || var->xoffset)
> -				return -EINVAL;
> -	} else {
> +	if (!(var->vmode & FB_VMODE_YWRAP)) {
>  		/*
>  		 * TODO: There will be problems when xpan!=3D1, so some columns
>  		 * on the right side will never be seen
>  		 */
>  		if (var->xoffset + info->var.xres >
> -		    upx(16 << maxfmode, info->var.xres_virtual) ||
> -		    var->yoffset + info->var.yres > info->var.yres_virtual)
> +		    upx(16 << maxfmode, info->var.xres_virtual))
>  			return -EINVAL;
>  	}
>  	ami_pan_var(var, info);
> -	info->var.xoffset =3D var->xoffset;
> -	info->var.yoffset =3D var->yoffset;
> -	if (var->vmode & FB_VMODE_YWRAP)
> -		info->var.vmode |=3D FB_VMODE_YWRAP;
> -	else
> -		info->var.vmode &=3D ~FB_VMODE_YWRAP;
>  	return 0;
>  }
>

