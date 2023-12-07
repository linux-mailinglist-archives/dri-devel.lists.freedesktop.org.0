Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CE6808B90
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 16:15:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E8510E8B8;
	Thu,  7 Dec 2023 15:15:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF32B10E8B8
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 15:15:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 1F31DB827F7;
 Thu,  7 Dec 2023 15:15:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E485EC433C8;
 Thu,  7 Dec 2023 15:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701962099;
 bh=kzMOr7V9gX3Dg3V/1bzEx7CSqNcckGh18xs8/WVR7kk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WrAl/U7luNdzg4httNKR/ztsEt9oueWv2ai3MuXcALw+U+MGNGEkpLGZLxt80ft23
 yheAy5jZYGfipUnzeDbtWRcfyHJhxKU2znzv8He/l3H3pdcsoKTgowci1odYqwdcwd
 hCxIFe2iHPXhRftNSSbDfDuGGw/tzawza5jWkmiVhWWHQxL2oStmXXorMo5OtaqBSo
 a2bO2E9dvM9OtqpQFo8theaYIi9qb6Lrb0Gsfbd08apmPxNGUaarV9FsIoDr0ZTy+Q
 ijDGyjO5dGxqKjCRrEaa52QVGp+zcRaI06uG6FueUsm/Dn6Gj3uMm3Wl3FC44vEMPh
 jY9bZESeMZuyA==
From: Michael Walle <mwalle@kernel.org>
To: tony@atomide.com
Subject: Re: [PATCH v2 06/10] drm/bridge: tc358775: Get bridge data lanes
 instead of the DSI host lanes
Date: Thu,  7 Dec 2023 16:14:46 +0100
Message-Id: <20231207151446.2633981-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231202075514.44474-7-tony@atomide.com>
References: <20231202075514.44474-7-tony@atomide.com>
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

> The current code assumes the data-lanes property is configured on the
> DSI host side instead of the bridge side, and assumes DSI host endpoint 1.
> 
> Let's standardize on what the other bridge drivers are doing and parse the
> data-lanes property for the bridge. Only if data-lanes property is not found,
> let's be nice and also check the DSI host for old dtb in use and warn.
> 
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/gpu/drm/bridge/tc358775.c | 25 +++++++++++--------------
>  1 file changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
> --- a/drivers/gpu/drm/bridge/tc358775.c
> +++ b/drivers/gpu/drm/bridge/tc358775.c
> @@ -525,27 +525,24 @@ tc_mode_valid(struct drm_bridge *bridge,
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
> -	if (endpoint) {
> -		/* dsi0_out node */
> -		parent = of_graph_get_remote_port_parent(endpoint);
> -		of_node_put(endpoint);
> -		if (parent) {
> -			/* dsi0 port 1 */
> -			dsi_lanes = drm_of_get_data_lanes_count_ep(parent, 1, -1, 1, 4);
> -			of_node_put(parent);
> -		}
> +	dsi_lanes = drm_of_get_data_lanes_count(endpoint, 1, 4);
> +
> +	/* Quirk old dtb: Use data lanes from the DSI host side instead of bridge */
> +	if (dsi_lanes == -EINVAL || dsi_lanes == -ENODEV) {
> +		remote = of_graph_get_remote_endpoint(endpoint);
> +		dsi_lanes = drm_of_get_data_lanes_count(remote, 1, 4);
> +		of_node_put(remote);
> +		if (dsi_lanes >= 1)
> +			dev_warn(tc->dev, "missing dsi-lanes property for the bridge\n");

It wasn't obvious what this warning should tell me at first. Maybe
add something like ". Falling back to the property of the remote
endpoint". A little verbose, maybe you could come up with a more
dense wording.

In any case,

Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael
