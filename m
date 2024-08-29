Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEBF964A69
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 17:45:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC31B10E707;
	Thu, 29 Aug 2024 15:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZpX/oRyx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D0110E707
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 15:45:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D8A9BA441E1;
 Thu, 29 Aug 2024 15:45:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C421C4CEC1;
 Thu, 29 Aug 2024 15:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724946317;
 bh=VIY5HaE7JEsJLMzs9MMF9q38bi2uPDkUtjNeBnAxG/I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZpX/oRyxClc9YiG9o6xKE5jQw2jRGFQMpdFckrio93oUHx5SCLEDiSKjiMlZn2Urh
 Ivumr6vnpv0dovvr+Ne7nYPjF8D9k7/nV7GDiyQr+N5y5rhpYwWIUKjdOUUhwz6BXQ
 FZte1sDARnCFVGUOkdba75ztEvoOpNnl23MP4lCBy4YqzOvjprYlf6CksH57SMYJEI
 RxHqbTyLkAAL3r4ShgrSCoDX0c7Fj7LYOGHAuURSnWVIJlsUJuOPXGTfNLVA++T4Sl
 dSlmVVeoNrQ5WCFBwabIAojPDfY6bLWgo+zGTW+GmfsoiKxoApSmXREUkDioMatkgG
 gY6cO8fb6y7tg==
Date: Thu, 29 Aug 2024 10:45:15 -0500
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
Subject: Re: [PATCH v4 1/9] of: property: add of_graph_get_next_port()
Message-ID: <20240829154515.GD465065-robh@kernel.org>
References: <87bk1d2pvt.wl-kuninori.morimoto.gx@renesas.com>
 <87a5gx2pva.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a5gx2pva.wl-kuninori.morimoto.gx@renesas.com>
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

On Wed, Aug 28, 2024 at 05:11:37AM +0000, Kuninori Morimoto wrote:
> We have endpoint base functions
> 	- of_graph_get_next_device_endpoint()
> 	- of_graph_get_device_endpoint_count()
> 	- for_each_of_graph_device_endpoint()
> 
> Here, for_each_of_graph_device_endpoint() loop finds each endpoints
> 
> 	ports {
> 		port@0 {
> (1)			endpoint {...};
> 		};
> 		port@1 {
> (2)			endpoint {...};
> 		};
> 		...
> 	};
> 
> In above case, it finds endpoint as (1) -> (2) -> ...
> 
> Basically, user/driver knows which port is used for what, but not in
> all cases. For example on flexible/generic driver case, how many ports
> are used is not fixed.
> 
> For example Sound Generic Card driver which is used from many venders
> can't know how many ports are used. Because the driver is very
> flexible/generic, it is impossible to know how many ports are used,
> it depends on each vender SoC and/or its used board.
> 
> And more, the port can have multi endpoints. For example Generic Sound
> Card case, it supports many type of connection between CPU / Codec, and
> some of them uses multi endpoint in one port.
> Then, Generic Sound Card want to handle each connection via "port"
> instead of "endpoint".
> But, it is very difficult to handle each "port" via existing
> for_each_of_graph_device_endpoint(). Getting "port" via of_get_parent()
> from "endpoint" doesn't work. see below.
> 
> 	ports {
> 		port@0 {
> (1)			endpoint@0 {...};
> (2)			endpoint@1 {...};
> 		};
> 		port@1 {
> (3)			endpoint {...};
> 		};
> 		...
> 	};
> 
> In other case, we want to handle "ports" same as "port" for some reasons.
> 
> 	node {
> =>		ports@0 {
> 			port@0 { ... };
> 			port@1 { ... };
> 			...
> 		};
> =>		ports@1 {
> 			...
> 		};
> 	};

There is no schema that supports this structure. The closest thing we 
have is in-ports and out-ports in Coresight bindings.

In any case, it should be a separate patch, not buried in here.

Rob
