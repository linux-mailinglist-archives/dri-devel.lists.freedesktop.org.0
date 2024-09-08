Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40863970A21
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 23:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2223C10E1C5;
	Sun,  8 Sep 2024 21:33:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.b="kpi7zeme";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 451 seconds by postgrey-1.36 at gabe;
 Sun, 08 Sep 2024 19:40:01 UTC
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com
 [91.218.175.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7785610E20D
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 19:40:01 +0000 (UTC)
Message-ID: <45c866f7-076a-4da8-b1b6-1e442ff52d9e@postmarketos.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
 s=key1; t=1725823947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dQn56cl0NzqhLZfcaPshq+OJv47131RSvRelLzaOS6A=;
 b=kpi7zemeoEE1yluG0KWiQfcqPCE9insBH+x/Jw9r1u1/Jf/uMAKI6i2OsPfVGOq4qXhn5N
 pmiXWmf4uZ1JPk/WMOHPDflrdVfWix+NzX0MKn+qgtSSGTmN31yFrXFGk1Ptrxt0rwegJe
 p4b7I+RW+2whihieCAFQDeAXtAicnHXTyn5Sy46+JSZyCu8uas0XXt/b0Phuel7SuRu7+s
 qLE5QnML1me+EEJgeSceMhuLVn4+t3dm4sd/eVIjaiZ7GqBKvSKJ4gGXbzCcMyuaKfemrN
 StoV31g/vfsmlgv4jNMJd+imiTrIC3hwgazmHDy6MYqsqu+yctZyH4li0ir3hg==
Date: Sun, 8 Sep 2024 21:32:24 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/panel: nt35510: Make new commands optional
To: Linus Walleij <linus.walleij@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: dri-devel@lists.freedesktop.org
References: <20240906-fix-nt35510-v1-1-1971f3af7dda@linaro.org>
Content-Language: en-GB
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Stefan Hansson <newbyte@postmarketos.org>
In-Reply-To: <20240906-fix-nt35510-v1-1-1971f3af7dda@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Sun, 08 Sep 2024 21:33:05 +0000
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

Hi Linus!

On 2024-09-06 23:54, Linus Walleij wrote:
> The commit introducing the Frida display started to write the
> SETVCL, BT3CTR and SETVCMOFF registers unconditionally, and some
> (not all!) Hydis display seem to be affected by ghosting after
> the commit.
> 
> Make them all optional and only send these commands on the
> Frida display for now.
> 
> Reported-by: Stefan Hansson <newbyte@postmarketos.org>
> Fixes: 219a1f49094f ("drm/panel: nt35510: support FRIDA FRD400B25025-A-CTK")
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Stefan: if this patch works and you have time you can try adding
> the three flags one at a time to your device and we can see which
> command is problematic.

I did just that.

I tried different combinations of the .cmds property of 
nt35510_hydis_hva40wv1 and came to these conclusions:

Good:

     .cmds = NT35510_CMD_CORRECT_GAMMA
     .cmds = NT35510_CMD_CORRECT_GAMMA | NT35510_CMD_SETVCL
     .cmds = NT35510_CMD_CORRECT_GAMMA | NT35510_CMD_SETVCL | 
NT35510_CMD_BT3CTR

Bad:

     .cmds = NT35510_CMD_CORRECT_GAMMA | NT35510_CMD_SETVCL | 
NT35510_CMD_BT3CTR | NT35510_CMD_SETVCMOFF
     .cmds = NT35510_CMD_CORRECT_GAMMA | NT35510_CMD_SETVCMOFF

By good, I mean "no visible ghosting" and by bad I mean "visible ghosting".

Based on this, it seems to me that NT35510_CMD_SETVCMOFF is the culprit. 
However, this patch is also good as-is.

> ---
>   drivers/gpu/drm/panel/panel-novatek-nt35510.c | 45 +++++++++++++++++----------
>   1 file changed, 29 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> index d3bfdfc9cff6..e07409dcbd1d 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> @@ -38,6 +38,9 @@
>   
>   #define NT35510_CMD_CORRECT_GAMMA BIT(0)
>   #define NT35510_CMD_CONTROL_DISPLAY BIT(1)
> +#define NT35510_CMD_SETVCL BIT(2)
> +#define NT35510_CMD_BT3CTR BIT(3)
> +#define NT35510_CMD_SETVCMOFF BIT(4)
>   
>   #define MCS_CMD_MAUCCTR		0xF0 /* Manufacturer command enable */
>   #define MCS_CMD_READ_ID1	0xDA
> @@ -675,16 +678,23 @@ static int nt35510_setup_power(struct nt35510 *nt)
>   				nt->conf->bt2ctr);
>   	if (ret)
>   		return ret;
> -	ret = nt35510_send_long(nt, dsi, NT35510_P1_SETVCL,
> -				NT35510_P1_VCL_LEN,
> -				nt->conf->vcl);
> -	if (ret)
> -		return ret;
> -	ret = nt35510_send_long(nt, dsi, NT35510_P1_BT3CTR,
> -				NT35510_P1_BT3CTR_LEN,
> -				nt->conf->bt3ctr);
> -	if (ret)
> -		return ret;
> +
> +	if (nt->conf->cmds & NT35510_CMD_SETVCL) {
> +		ret = nt35510_send_long(nt, dsi, NT35510_P1_SETVCL,
> +					NT35510_P1_VCL_LEN,
> +					nt->conf->vcl);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (nt->conf->cmds & NT35510_CMD_BT3CTR) {
> +		ret = nt35510_send_long(nt, dsi, NT35510_P1_BT3CTR,
> +					NT35510_P1_BT3CTR_LEN,
> +					nt->conf->bt3ctr);
> +		if (ret)
> +			return ret;
> +	}
> +
>   	ret = nt35510_send_long(nt, dsi, NT35510_P1_SETVGH,
>   				NT35510_P1_VGH_LEN,
>   				nt->conf->vgh);
> @@ -721,11 +731,13 @@ static int nt35510_setup_power(struct nt35510 *nt)
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
> @@ -1319,7 +1331,8 @@ static const struct nt35510_config nt35510_frida_frd400b25025 = {
>   	},
>   	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
>   			MIPI_DSI_MODE_LPM,
> -	.cmds = NT35510_CMD_CONTROL_DISPLAY,
> +	.cmds = NT35510_CMD_CONTROL_DISPLAY | NT35510_CMD_SETVCL |
> +			NT35510_CMD_BT3CTR | NT35510_CMD_SETVCMOFF,
>   	/* 0x03: AVDD = 6.2V */
>   	.avdd = { 0x03, 0x03, 0x03 },
>   	/* 0x46: PCK = 2 x Hsync, BTP = 2.5 x VDDB */
> 
> ---
> base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
> change-id: 20240906-fix-nt35510-a8ec6e47e036
> 
> Best regards,

Stefan Hansson
