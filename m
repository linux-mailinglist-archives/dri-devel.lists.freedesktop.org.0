Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF923808B46
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 16:01:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED0A10E8E1;
	Thu,  7 Dec 2023 15:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8828110E8CB
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 15:01:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 9C46DB82856;
 Thu,  7 Dec 2023 15:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AB1EC433C8;
 Thu,  7 Dec 2023 15:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701961281;
 bh=H87zHVmCe+jqZ2NARd18JXpG7Y44ERHIWR/UhuPD8do=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lft6Crf045fUHN+P9f0kN+NFh+F4Dn7AEuAhMIl4svHc5TCJORp+pcAc8RriMmRTC
 6tlfcZebullGTKh0LGVfuKSqTkt+LHsA2PyD8d2/RIZOUfAHaUVhVv1KW+UMeU+34c
 2NZ5CPVnU7lfbJ9RTjmMAdborks2BoOLqgy2/5pCUPlvQKXKalzmJRJrd4a4fzlwzv
 RBPrVG5mJCcIw1r/sDanEEsmsXi3MHdXuT1DehMZkkZlgeHmJuOuaWhrplNMdVbV7E
 s96N6YJr0Pbv3rKsLFq6X9vd/9p68nkthO4/rTNYH0sl9RwydOdBaXrXb47MPRT6zk
 gucvhLk6EU/+A==
From: Michael Walle <mwalle@kernel.org>
To: tony@atomide.com
Subject: Re: [PATCH v2 07/10] drm/bridge: tc358775: Add burst and low-power
 modes
Date: Thu,  7 Dec 2023 16:01:04 +0100
Message-Id: <20231207150104.2633528-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231202075514.44474-8-tony@atomide.com>
References: <20231202075514.44474-8-tony@atomide.com>
MIME-Version: 1.0
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
Cc: Michael Walle <mwalle@kernel.org>, krzysztof.kozlowski+dt@linaro.org,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, sam@ravnborg.org, ivo.g.dimitrov.75@gmail.com,
 rfoss@kernel.org, jernej.skrabec@gmail.com, simhavcs@gmail.com,
 merlijn@wizzup.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 tzimmermann@suse.de, jonas@kwiboo.se, pavel@ucw.cz, mripard@kernel.org,
 robh+dt@kernel.org, philipp@uvos.xyz, neil.armstrong@linaro.org,
 sre@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Burst and low-power modes are supported both for tc358765 and tc358775.
> 
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/gpu/drm/bridge/tc358775.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
> --- a/drivers/gpu/drm/bridge/tc358775.c
> +++ b/drivers/gpu/drm/bridge/tc358775.c
> @@ -619,7 +619,8 @@ static int tc_attach_host(struct tc_data *tc)
>  
>  	dsi->lanes = tc->num_dsi_lanes;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
> -	dsi->mode_flags = MIPI_DSI_MODE_VIDEO;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +		MIPI_DSI_MODE_LPM;

Could you align it with the equal sign of the former line?

Reviewed-by: Michael Walle <mwalle@kernel.org>
Tested-by: Michael Walle <mwalle@kernel.org>

-michael
