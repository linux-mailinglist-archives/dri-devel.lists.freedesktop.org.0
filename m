Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB657FA05A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 14:10:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F82610E26C;
	Mon, 27 Nov 2023 13:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21AFB10E264
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:10:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D7A0ACE11AA;
 Mon, 27 Nov 2023 13:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4DBEC433C8;
 Mon, 27 Nov 2023 13:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701090592;
 bh=hn/nFHNO6noKdfVoji+3Pl4wibL57tAHB+fliYROVyo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WF3aHs9x4Zc+rvOcto/hyfmdkfCLu4mkpGnvsot5LqHStGLJXV2YGthyyjWPWydaF
 EPx9fNHCDB5VetZoQUV1E+DL5rXKphgK3XpslUjwKKLn28XqZxuI/aQhbQ7Ri7RRFm
 2PPBhuxJveF630ObsUgIV1NonaQyMtjyeUPAc/pVmDadgkn37HrBF/ogD+SjGdT0oo
 p7SmQMSh9PifltgDbHigHW2lMP6IRrmrG8lYNYz4CcKg63Mh0cZk5nFktUgdz5JGnP
 D0zErqbReW7XpK37axw4glPw+vjXbFrI6r4zgB9QXkzWq5EpN30/Q7OuWU/40pDTGg
 FgoJOfIFIGAdg==
From: Michael Walle <mwalle@kernel.org>
To: tony@atomide.com
Subject: Re: [PATCH 2/6] drm/bridge: tc358775: Fix getting dsi host data lanes
Date: Mon, 27 Nov 2023 14:09:41 +0100
Message-Id: <20231127130941.2154871-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231126163247.10131-2-tony@atomide.com>
References: <20231126163247.10131-2-tony@atomide.com>
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
Cc: mripard@kernel.org, devicetree@vger.kernel.org,
 Michael Walle <mwalle@kernel.org>, ivo.g.dimitrov.75@gmail.com,
 rfoss@kernel.org, andrzej.hajda@intel.com, tzimmermann@suse.de,
 jonas@kwiboo.se, pavel@ucw.cz, sam@ravnborg.org, merlijn@wizzup.org,
 neil.armstrong@linaro.org, sre@kernel.org, dri-devel@lists.freedesktop.org,
 jernej.skrabec@gmail.com, Laurent.pinchart@ideasonboard.com,
 simhavcs@gmail.com, philipp@uvos.xyz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> The current code assume hardcoded dsi host endpoint 1, which may not
> be the case. Let's fix that and simplify the code by getting the dsi
> endpoint with of_graph_get_remote_endpoint() that does not assume any
> endpoint numbering.
> 
> Fixes: b26975593b17 ("display/drm/bridge: TC358775 DSI/LVDS driver")
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/gpu/drm/bridge/tc358775.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
> --- a/drivers/gpu/drm/bridge/tc358775.c
> +++ b/drivers/gpu/drm/bridge/tc358775.c
> @@ -528,25 +528,17 @@ tc_mode_valid(struct drm_bridge *bridge,
>  static int tc358775_parse_dt(struct device_node *np, struct tc_data *tc)
>  {
>  	struct device_node *endpoint;
> -	struct device_node *parent;
>  	struct device_node *remote;
>  	int dsi_lanes = -1;
>  
> -	/*
> -	 * To get the data-lanes of dsi, we need to access the dsi0_out of port1
> -	 *  of dsi0 endpoint from bridge port0 of d2l_in
> -	 */
>  	endpoint = of_graph_get_endpoint_by_regs(tc->dev->of_node,
>  						 TC358775_DSI_IN, -1);
>  	if (endpoint) {
> -		/* dsi0_out node */
> -		parent = of_graph_get_remote_port_parent(endpoint);
> +		/* Get the configured data lanes on the dsi host side */
> +		remote = of_graph_get_remote_endpoint(endpoint);
>  		of_node_put(endpoint);
> -		if (parent) {
> -			/* dsi0 port 1 */
> -			dsi_lanes = drm_of_get_data_lanes_count_ep(parent, 1, -1, 1, 4);
> -			of_node_put(parent);
> -		}
> +		dsi_lanes = drm_of_get_data_lanes_count(remote, 1, 4);

I actually have the same fix, but with one additional detail, which I'm
unsure about though: This looks at the data-lanes property of the *remote*
endpoint whereas other bridge drivers (see tc358767, ti-sn65dsi83, lt8912b,
anx7625) look at the local endpoint and I'm not sure what is correct.

-michael
