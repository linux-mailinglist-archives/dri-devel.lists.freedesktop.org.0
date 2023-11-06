Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6CC7E2269
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 13:54:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1CCD10E2FC;
	Mon,  6 Nov 2023 12:54:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 963 seconds by postgrey-1.36 at gabe;
 Mon, 06 Nov 2023 12:54:07 UTC
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com
 (mailrelay5-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:404::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E5710E2FC
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 12:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=ycGE/iiF6naL2xL+fBBE0XZ1/cqgYsFMAA6Zd70Z1Jw=;
 b=vH0RQZrM7dNH2YoCChVMLaE/dsodYd4JiNpusQKHpaBW6JvYamB0+7MjZ79+L9EAsPzpz/3kRcE5V
 MU4ZtPdhrs5EzGmZsKpEsBxhhMVhPUXprBBUNy+id59z5Ta+vvN4Ky+oxE4I/mQX3t7e6oW+GJnePU
 KPp02ls3Yxg9o4MZFS8zvDadV11Hn/OCskuoJfqPqnuNVOswrhKX6ERDvtA1pAyUt8zatmRRS1jqUn
 uH1QhkPTs+3O2zX4qUCyZViauaS5O+RX8/A/rD/9hkHz9ANrqT/yDrJdfrY+Gx807b8OygHBLqBovC
 z06mvg2o1PTiihrhntQexMiVVf2R/kg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=ycGE/iiF6naL2xL+fBBE0XZ1/cqgYsFMAA6Zd70Z1Jw=;
 b=1VXLx7xnbBAvswLF+WCHpEVP3EylBfIQQbC2ezJfpjo1RVM2giMnZHZcZL4BjEV832K4nAvP2FcSY
 Wh9x88vAw==
X-HalOne-ID: 5177d4a4-7ca1-11ee-b013-a71ee59276a3
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay5 (Halon) with ESMTPSA
 id 5177d4a4-7ca1-11ee-b013-a71ee59276a3;
 Mon, 06 Nov 2023 12:38:01 +0000 (UTC)
Date: Mon, 6 Nov 2023 13:38:00 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Subject: Re: [PATCH] drm/bridge: tc358767: Support input format negotiation
 hook
Message-ID: <20231106123800.GC47195@ravnborg.org>
References: <20231030192846.27934-1-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231030192846.27934-1-a-bhatia1@ti.com>
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
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Jan Kiszka <jan.kiszka@siemens.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Francesco Dolcini <francesco@dolcini.it>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jayesh Choudhary <j-choudhary@ti.com>, Tomi Valkeinen <tomba@kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Aradhya,

On Tue, Oct 31, 2023 at 12:58:46AM +0530, Aradhya Bhatia wrote:
> With new connector model, tc358767 will not create the connector, when
> DRM_BRIDGE_ATTACH_NO_CONNECTOR is set and display-controller driver will
> rely on format negotiation to setup the encoder format.
> 
> Add the missing input-format negotiation hook in the
> drm_bridge_funcs to complete DRM_BRIDGE_ATTACH_NO_CONNECTOR support.
> 
> Input format is selected to MEDIA_BUS_FMT_RGB888_1X24 as default, as is
> the case with older model.
> 
> Reported-by: Jan Kiszka <jan.kiszka@siemens.com>
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
> 
> Notes:
> 
>   * Since I do not have hardware with me, this was just build tested. I would
>     appreciate it if someone could test and review it, especically somebody, who
>     uses the bridge for DPI/DSI to eDP format conversion.
> 
>   * The Toshiba TC358767 bridge is not enabled in arm64 defconfig by default,
>     when it should be. Hence, I sent a quick patch[0] earlier.
> 
> [0]: https://lore.kernel.org/all/20231030152834.18450-1-a-bhatia1@ti.com/
> 
>  drivers/gpu/drm/bridge/tc358767.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index ef2e373606ba..0affcefdeb1c 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1751,6 +1751,30 @@ tc_dpi_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>  	return input_fmts;
>  }
>  
> +static u32 *
> +tc_edp_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +				 struct drm_bridge_state *bridge_state,
> +				 struct drm_crtc_state *crtc_state,
> +				 struct drm_connector_state *conn_state,
> +				 u32 output_fmt,
> +				 unsigned int *num_input_fmts)
> +{
> +	u32 *input_fmts;
> +
> +	*num_input_fmts = 0;
> +
> +	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
> +			     GFP_KERNEL);
> +	if (!input_fmts)
> +		return NULL;
> +
> +	/* This is the DSI/DPI-end bus format */
> +	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> +	*num_input_fmts = 1;
> +
> +	return input_fmts;
> +}

You could benefit from using the helper:
drm_atomic_helper_bridge_propagate_bus_fmt()

	Sam
