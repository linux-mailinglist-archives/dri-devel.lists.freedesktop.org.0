Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A29808CF5
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 17:14:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A46F710E914;
	Thu,  7 Dec 2023 16:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ACBC10E914
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 16:14:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 950DE61EA2;
 Thu,  7 Dec 2023 16:14:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D36C433C7;
 Thu,  7 Dec 2023 16:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701965643;
 bh=0t/eBv95Pg8oVbfN+OcqNWdQmDY6gQl2gRnvLvTEUt0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SSoaGx3LQmdlvJ1siocln3lh9sMW1Rqfgf/ARQZ4m8c3U7ltSlmR/I1HmiZLu1U4G
 t9Q6oZz5g6ZmIF31e0Ouv1cMYSBFE0Fd4cJWohWWJDG0EyQ3pbxxokvwcIhEdF8Zkq
 CPdSnQaaf0SmScf7E+V1oSUak+bW9FiB3kxI9eNyKwsw1e2ZoZjww532xcKrG+GVUU
 3yDT+bxbkPErsY0ouSpqSxzrV+MB/0pe02F9QX6ZkiQn6RwMPF/LHc7PSs+ElIgxTZ
 cDJNSilb44uQHm/EBR6nYQCUFHWNb4Yq7bnGLCZonRfQX5U2kBhVmarlv5JGKQ7Af7
 QpA6R2NNxvo5Q==
From: Michael Walle <mwalle@kernel.org>
To: tony@atomide.com
Subject: Re: [PATCH v2 10/10] drm/bridge: tc358775: Configure hs_rate and
 lp_rate
Date: Thu,  7 Dec 2023 17:13:52 +0100
Message-Id: <20231207161352.2634438-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231202075514.44474-11-tony@atomide.com>
References: <20231202075514.44474-11-tony@atomide.com>
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

> The hs_rate and lp_rate may be used by the dsi host for timing
> calculations. The tc358775 has a maximum bit rate of 1 Gbps/lane,
> tc358765 has maximurate of 800 Mbps per lane.
> 
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/gpu/drm/bridge/tc358775.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
> --- a/drivers/gpu/drm/bridge/tc358775.c
> +++ b/drivers/gpu/drm/bridge/tc358775.c
> @@ -636,6 +636,11 @@ static int tc_attach_host(struct tc_data *tc)
>  	dsi->format = MIPI_DSI_FMT_RGB888;
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
>  		MIPI_DSI_MODE_LPM;
> +	if (tc->type == TC358765)
> +		dsi->hs_rate = 800000000;

It's not clear to me whether this is the data rate or the frequency. From
the kernel doc:

 * @hs_rate: maximum lane frequency for high speed mode in hertz, this should
 * be set to the real limits of the hardware, zero is only accepted for
 * legacy drivers

The tc358775 datasheet lists 1Gbps per lane, which corresponds to a 500MHz DSI
clock frequency. Not sure how that would correspond to the "maximum lane
frequency" above. I guess the wording of the comment is just misleading and
the value is the data rate of the lane.

> +	else
> +		dsi->hs_rate = 1000000000;
> +	dsi->lp_rate = 10000000;

That I didn't found in the datasheet. Just a T_min_rx (minimum pulse width
response) which is 20ns. But there are no more details on this.

-michael
