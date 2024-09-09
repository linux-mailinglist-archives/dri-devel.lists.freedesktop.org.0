Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5AA970FF5
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:37:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C61610E2FB;
	Mon,  9 Sep 2024 07:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.b="iU/Kd4nK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 346 seconds by postgrey-1.36 at gabe;
 Mon, 09 Sep 2024 07:37:47 UTC
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com
 [95.215.58.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7962F10E2FB
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 07:37:47 +0000 (UTC)
Message-ID: <cb01ade3-2eb5-4941-8cb7-f816cb3e80d1@postmarketos.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
 s=key1; t=1725867118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TpUPzNlr2Ydw1EYiUudLXTae/o3dl9t04zRfySMVs68=;
 b=iU/Kd4nKu2taF7UgMRVVciMCV7K2xFKf+l89knh1wxWeDtyBnyqJLzRdKns8Bn97BlrqkI
 HmDUsh4Rgp1ZhLdBe7Hfwgc0uYAuZQKib0y2X6/LyYlxKa8AZMSBFUsFBlOwpGNrt6F3jm
 D5rhNKBwH8Qb9bUTD7TpHqMCfU+H2f6yyyJqud+ZHYb2/srXzGby4mY51nrgZBC021qZCT
 xZ0mrhnwOqcOopRCvFmE2szCI1dD91Jyua5cOX257byFhD/OT2XpX1kNjIDZiNgng9vXP6
 FAnLH2X4JdQbp5SepsuFi6ELEDB65vkhJHtNyLQvV9VEQNZOThjPAe/Q49cSlw==
Date: Mon, 9 Sep 2024 09:31:56 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2] drm/panel: nt35510: Make new commands optional
To: Linus Walleij <linus.walleij@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: dri-devel@lists.freedesktop.org
References: <20240908-fix-nt35510-v2-1-d4834b9cdb9b@linaro.org>
Content-Language: sv-SE
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Stefan Hansson <newbyte@postmarketos.org>
In-Reply-To: <20240908-fix-nt35510-v2-1-d4834b9cdb9b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi again!

On 2024-09-08 23:50, Linus Walleij wrote:
> The commit introducing the Frida display started to write the
> SETVCMOFF registers unconditionally, and some (not all!) Hydis
> display seem to be affected by ghosting after the commit.
> 
> Make SETVCMOFF optional and only send these commands on the
> Frida display for now.
> 
> Reported-by: Stefan Hansson <newbyte@postmarketos.org>
> Fixes: 219a1f49094f ("drm/panel: nt35510: support FRIDA FRD400B25025-A-CTK")
> Acked-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Changes in v2:
> - After Stefan's testing conclude that we only need to make
>    SETVCMOFF optional.
> - Link to v1: https://lore.kernel.org/r/20240906-fix-nt35510-v1-1-1971f3af7dda@linaro.org
> ---
>   drivers/gpu/drm/panel/panel-novatek-nt35510.c | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> index d3bfdfc9cff6..a3460ed38cc4 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> @@ -38,6 +38,7 @@
>   
>   #define NT35510_CMD_CORRECT_GAMMA BIT(0)
>   #define NT35510_CMD_CONTROL_DISPLAY BIT(1)
> +#define NT35510_CMD_SETVCMOFF BIT(2)
>   
>   #define MCS_CMD_MAUCCTR		0xF0 /* Manufacturer command enable */
>   #define MCS_CMD_READ_ID1	0xDA
> @@ -675,16 +676,19 @@ static int nt35510_setup_power(struct nt35510 *nt)
>   				nt->conf->bt2ctr);
>   	if (ret)
>   		return ret;
> +
>   	ret = nt35510_send_long(nt, dsi, NT35510_P1_SETVCL,
>   				NT35510_P1_VCL_LEN,
>   				nt->conf->vcl);
>   	if (ret)
>   		return ret;
> +
>   	ret = nt35510_send_long(nt, dsi, NT35510_P1_BT3CTR,
>   				NT35510_P1_BT3CTR_LEN,
>   				nt->conf->bt3ctr);
>   	if (ret)
>   		return ret;
> +
>   	ret = nt35510_send_long(nt, dsi, NT35510_P1_SETVGH,
>   				NT35510_P1_VGH_LEN,
>   				nt->conf->vgh);
> @@ -721,11 +725,13 @@ static int nt35510_setup_power(struct nt35510 *nt)
>   	if (ret)
>   		return ret;
>   
> -	ret = nt35510_send_long(nt, dsi, NT35510_P1_SETVCMOFF,
> -				NT35510_P1_VCMOFF_LEN,
> -				nt->conf->vcmoff);
> -	if (ret)
> -		return ret;
> +	if (nt->conf->cmds & NT35510_CMD_SETVCMOFF) {
> +		ret = nt35510_send_long(nt, dsi, NT35510_P1_SETVCMOFF,
> +					NT35510_P1_VCMOFF_LEN,
> +					nt->conf->vcmoff);
> +		if (ret)
> +			return ret;
> +	}
>   
>   	/* Typically 10 ms */
>   	usleep_range(10000, 20000);
> @@ -1319,7 +1325,7 @@ static const struct nt35510_config nt35510_frida_frd400b25025 = {
>   	},
>   	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
>   			MIPI_DSI_MODE_LPM,
> -	.cmds = NT35510_CMD_CONTROL_DISPLAY,
> +	.cmds = NT35510_CMD_CONTROL_DISPLAY | NT35510_CMD_SETVCMOFF,
>   	/* 0x03: AVDD = 6.2V */
>   	.avdd = { 0x03, 0x03, 0x03 },
>   	/* 0x46: PCK = 2 x Hsync, BTP = 2.5 x VDDB */
> 
> ---
> base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
> change-id: 20240906-fix-nt35510-a8ec6e47e036
> 
> Best regards,

It is

Tested-by: Stefan Hansson <newbyte@postmarketos.org>
