Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B4E910E66
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 19:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD8E10EB83;
	Thu, 20 Jun 2024 17:24:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="D/oFQvgh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr
 [80.12.242.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE74F10EB83
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 17:24:54 +0000 (UTC)
Received: from [192.168.1.37] ([86.243.222.230]) by smtp.orange.fr with ESMTPA
 id KLVhsuPMas2bgKLVhsCVx9; Thu, 20 Jun 2024 19:23:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1718904230;
 bh=ihK0V93i0kUYjZJxFoTyf13pwL1rOBXEjTiHXm80Fik=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=D/oFQvghy7dXACkonDzJ57U3Epo2n6WVhLieiPe9y3fSV68U10gAFME9D7t/0TeUO
 wBVSB9uIYJhcm69wRDDAKdL4rXf2SaJQ1gAhAf/WuVS+gxO9gsXG1fV2E1Sf8/Y9a3
 krapwyI4WZePfaU22OKhI7WnBUrBHnVsfbi0buPp5ftaN4KFxU3tjvgSbYxmcQNFaw
 wxRVloasWSC19zZVF0tKggy3Quldcw+HoxelGs3SuoeYuR0e5e9vhuYmdKZYats7Mq
 /rfo2+4tTm/TwSOWphDXLaDho3V+wSbosIuiYLoiNs6oOra8HX0Lj4xY4K1S8Kk1GE
 hoNxUrLVYtXRQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 20 Jun 2024 19:23:50 +0200
X-ME-IP: 86.243.222.230
Message-ID: <464e68fd-7175-4de1-b037-3a40c1e134c5@wanadoo.fr>
Date: Thu, 20 Jun 2024 19:23:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/panel: ltk050h3146w: add check for
 mipi_dsi_dcs_enter_sleep_mode
To: Chen Ni <nichen@iscas.ac.cn>, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240620074720.852495-1-nichen@iscas.ac.cn>
Content-Language: en-MW
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240620074720.852495-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Le 20/06/2024 à 09:47, Chen Ni a écrit :
> Add check for the return value of mipi_dsi_dcs_enter_sleep_mode() and
> return the error if it fails in order to catch the error.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>   drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> index 292aa26a456d..24bf05d0589f 100644
> --- a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> +++ b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> @@ -526,7 +526,7 @@ static int ltk050h3146w_unprepare(struct drm_panel *panel)
>   		return ret;
>   	}
>   
> -	mipi_dsi_dcs_enter_sleep_mode(dsi);
> +	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
>   	if (ret < 0) {
>   		dev_err(ctx->dev, "failed to enter sleep mode: %d\n", ret);
>   		return ret;

Reviewed-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>


See: 
https://lore.kernel.org/all/588e8b4519487f6d33419c4b0fa7f8ea1b26cb58.1619869792.git.christophe.jaillet@wanadoo.fr/
which never got any feedback.

CJ
