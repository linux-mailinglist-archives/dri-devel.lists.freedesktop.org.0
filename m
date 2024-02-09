Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3841384F307
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 11:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A100D10F2E6;
	Fri,  9 Feb 2024 10:13:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="mDawvdUM";
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="XAYPat59";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 318 seconds by postgrey-1.36 at gabe;
 Fri, 09 Feb 2024 10:13:46 UTC
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02C210F2ED
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 10:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 51831FB03;
 Fri,  9 Feb 2024 11:08:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1707473304; bh=VQtsM1NoSqX40YRSgKtqlY63frGldNV2NwDpUbSFoic=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mDawvdUMHHMK8UBJh6xdqdhxeZ2JotoZ5Kg69AnmcDDMgmVQ137YBotOj/FYJjNj5
 VYta49wk9Wp30dApXR9kbeVWgHANz2HrxvNjGiGro+0BHQcCQeyLwePWXnwnvBUnPd
 52z5/d+jqSLbGunRJcve6ronSdgDum4XJlnOjdT/WUVuzuoeEw09fnxM4f7x/Un5SN
 2JdZbiSomYIw+C8s2+EQ0bg2K/+tCWeTf5pDvAIgE65uROfi7OOL9+c/m8oXD9Cx/N
 GPZCWG7rLpqdrM0yIjjE1lfXD3LBlgYoD2r/XOpYZMo/zzppXAWwoaF+2q2akfi3ZC
 rpw1JWUZjbE/Q==
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1een4FirSMfU; Fri,  9 Feb 2024 11:08:23 +0100 (CET)
Date: Fri, 9 Feb 2024 11:08:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1707473303; bh=VQtsM1NoSqX40YRSgKtqlY63frGldNV2NwDpUbSFoic=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XAYPat596iZ7EHbpKJoMg/4J9SUOJZl+4fz2181UiJtvssll5imFi6AYSVLaSmCD5
 tM84FEX/7JEuO3N6K6+8q/m7KB5++XXlO61lp/XdjK8NTxuVg3XplZPnYsSHB6F1dP
 p1snKEMA873w2SMKS8p6j/917L6EYGMmgGenTxidw8/2AJ02J8k8ybJGBziKyzKQBM
 BjRl8jVGJqcWf9D9FukoNVUBUHJyxFLZ6AWhTLrxYu7xuYLyk1NWz9oyPhjyH+Egkz
 RSRWazUpoi09koBwczlpemoO6Dwli3FqGMPpl1svsjZXqGr9hf/p+pz9yFcFzU+UE9
 4PBNjFiOImfJQ==
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Ao Zhong <hacc1225@gmail.com>
Cc: Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH RESEND 1/1] drm/panel: st7703: Fix Panel Initialization
 for Anbernic RG353V-V2
Message-ID: <ZcX5ljSCc7nyr_NE@qwark.sigxcpu.org>
References: <20240128021048.6059-1-hacc1225@gmail.com>
 <20240128021048.6059-2-hacc1225@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240128021048.6059-2-hacc1225@gmail.com>
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

Hi Ao,

this doesn't say why that was changed but your cover letter
has that information:

> After correcting these parameters by referencing the
> device tree in JELOS (which uses the BSP kernel for RK3566), the panel
> started to work properly.

Can you add that to the commit message and maybe add an URL as
reference please?

I've added Chris to the cc: list. He submitted the original rg353v2
and we don't want to break other devices. Chris, do you have any means
to check these values?

Cheers,
 -- Guido

On Sun, Jan 28, 2024 at 03:10:48AM +0100, Ao Zhong wrote:
> This patch resolves the issue with the panel initialization of the
> Anbernic RG353V-V2 caused by incorrect parameters.
> 
> Signed-off-by: Ao Zhong <hacc1225@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> index b55bafd1a8be..a346d6c3d283 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> @@ -357,8 +357,8 @@ static int rg353v2_init_sequence(struct st7703 *ctx)
>  			       0x28, 0x03, 0xff, 0x00, 0x00, 0x00, 0x00);
>  	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETCYC, 0x80);
>  	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETBGP, 0x0a, 0x0a);
> -	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVCOM, 0x92, 0x92);
> -	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER_EXT, 0x25, 0x22,
> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVCOM, 0x7f, 0x7f);
> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER_EXT, 0x26, 0x62,
>  			       0xf0, 0x63);
>  	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETMIPI, 0x33, 0x81, 0x05,
>  			       0xf9, 0x0e, 0x0e, 0x20, 0x00, 0x00, 0x00, 0x00,
> -- 
> 2.43.0
> 
