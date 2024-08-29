Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90731964A4D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 17:41:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 170D410E1B3;
	Thu, 29 Aug 2024 15:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pb6gtWIT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C9310E1B3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 15:41:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 56667CE1BCB;
 Thu, 29 Aug 2024 15:41:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 519BEC4CEC1;
 Thu, 29 Aug 2024 15:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724946064;
 bh=/zGGPt8jYtuq/1RE9arY1RA1H+rfW2qjhyrvYnQ62ps=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pb6gtWIT0umdrydivzW3q3x+x8RffD3d4f4N9Pxo5JhkzOL8GdkTxGt2RfEsuuGSi
 gE3mHFkn/f7T7k6uL9vo3yI2u6IHdmN0Djc2HAjxOkgRhb/8WyNcUIEoyUisdKE1Br
 ghCEROt32J4MuG/nNAVHOMqq3lqSY6cFNaK47i8HiZDVeuY57YEG3cLwyCD1P5xOzQ
 G+KkCjkmLXNb6kanoNJHrT/6bKRODeYUrHYs+tIdkaIx9Z1/kXB9zOZuQXC20gd4+x
 T3IjAROTorQiGQtwEgGY9ag1AaUpM/U1aUQi70qibxS+PnWbwFTyMHZsQvuRrIJvO7
 nKj26aueNEWLQ==
Date: Thu, 29 Aug 2024 10:41:02 -0500
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Saravana Kannan <saravanak@google.com>, Takashi Iwai <tiwai@suse.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-sound@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v4 4/9] ASoC: rcar_snd: use new of_graph functions
Message-ID: <20240829154102.GB465065-robh@kernel.org>
References: <87bk1d2pvt.wl-kuninori.morimoto.gx@renesas.com>
 <875xrl2pur.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875xrl2pur.wl-kuninori.morimoto.gx@renesas.com>
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

On Wed, Aug 28, 2024 at 05:11:56AM +0000, Kuninori Morimoto wrote:
> Now we can use new port related functions for port parsing. Use it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> ---
>  sound/soc/sh/rcar/core.c | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
> index 15cb5e7008f9f..281936ece760b 100644
> --- a/sound/soc/sh/rcar/core.c
> +++ b/sound/soc/sh/rcar/core.c
> @@ -1237,7 +1237,7 @@ static int rsnd_dai_of_node(struct rsnd_priv *priv, int *is_graph)
>  {
>  	struct device *dev = rsnd_priv_to_dev(priv);
>  	struct device_node *np = dev->of_node;
> -	struct device_node *ports, *node;
> +	struct device_node *node;
>  	int nr = 0;
>  	int i = 0;
>  
> @@ -1277,16 +1277,12 @@ static int rsnd_dai_of_node(struct rsnd_priv *priv, int *is_graph)
>  	/*
>  	 * Audio-Graph-Card
>  	 */
> -	for_each_child_of_node(np, ports) {
> -		if (!of_node_name_eq(ports, "ports") &&
> -		    !of_node_name_eq(ports, "port"))
> -			continue;
> -		priv->component_dais[i] = of_graph_get_endpoint_count(ports);
> +	for_each_of_graph_ports(np, ports) {
> +		priv->component_dais[i] = of_graph_get_port_count(ports);

These are not equivalent. Besides now working with multiple 'ports' 
nodes, it's possible to have a port node without an endpoint populated 
for example.

Rob
