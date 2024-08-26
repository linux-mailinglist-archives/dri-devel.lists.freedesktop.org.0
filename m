Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 247F195E825
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 07:58:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF0C10E0D8;
	Mon, 26 Aug 2024 05:57:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c3UIcaK2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75F310E0D8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 05:57:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id F2D29CE0ABE;
 Mon, 26 Aug 2024 05:57:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52EDFC4AF11;
 Mon, 26 Aug 2024 05:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724651874;
 bh=wyRlaGNpg7WUxry9pFdgw984ZNawvpL6nElCg7i5/OM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c3UIcaK2jh/Zk1IFnUTnAXv5IMQBJ7tyIjK3F62xYaY5k6gK+aN3yXUl2WRH28kF6
 3/gLudS9ZU4R/uCMw7Vsz9U2PZUMZ5CtUzp/z9O77SmlzDhcA/qpJUhIrbaKVK5/Pe
 hWksA2nN3Mwd1HSK3/zVHu4Xtk4TOeKY1ahEnxcvWHdw6kv7bBMV6PAhksrtr9pEBu
 jSgiBIArl1+OFjk7G1MCeOCNYu1LcQw3mXxsgu9sJBtGGgPIAsOJbGmiaZo2aYs588
 ajb2ma9kiZ2dNcoI+VNhn5gKgeHy668dpSjCAaV0cLCUs7Re5Sk3tWr00gRhfGAKVu
 YU7NHRHGLZZ5A==
Date: Mon, 26 Aug 2024 07:57:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, Takashi Iwai <tiwai@suse.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, 
 linux-omap@vger.kernel.org, linux-sound@vger.kernel.org,
 Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v3 1/9] of: property: add of_graph_get_next_port()
Message-ID: <rlfczbgxjhnqeqskbg7q7rsvhyzznbqdjbtajl44pokpsdtdzx@ecirg7ytm6az>
References: <87cylwqa12.wl-kuninori.morimoto.gx@renesas.com>
 <87bk1gqa0k.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87bk1gqa0k.wl-kuninori.morimoto.gx@renesas.com>
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

On Mon, Aug 26, 2024 at 02:43:23AM +0000, Kuninori Morimoto wrote:
> We have endpoint base functions
> 	- of_graph_get_next_device_endpoint()
> 	- of_graph_get_device_endpoint_count()
> 	- for_each_of_graph_device_endpoint()

> +	if (!prev) {
> +		/*
> +		 * Find "ports" node from parent
> +		 *
> +		 *	parent {
> +		 * =>		ports {
> +		 *			port {...};
> +		 *		};
> +		 *	};
> +		 */
> +		prev = of_get_child_by_name(parent, "ports");
> +
> +		/*
> +		 * Use parent as its ports if it not exist
> +		 *
> +		 * =>	parent {
> +		 *		port {...};
> +		 *	};
> +		 */
> +		if (!prev) {
> +			prev = of_node_get(parent);
> +
> +			/* check wether it has port node */
> +			struct device_node *port __free(device_node) =
> +				of_get_child_by_name(prev, "port");
> +
> +			if (!port)
> +				prev = NULL;

It looks like you leak here "prev".

> +		}
> +
> +		return prev;
> +	}

Best regards,
Krzysztof

