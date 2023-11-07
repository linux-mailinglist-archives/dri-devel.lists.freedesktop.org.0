Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 826A97E43AF
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 16:42:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5B010E14E;
	Tue,  7 Nov 2023 15:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 97395 seconds by postgrey-1.36 at gabe;
 Tue, 07 Nov 2023 15:42:21 UTC
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com
 (mailrelay1-1.pub.mailoutpod2-cph3.one.com [46.30.211.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7CC610E14E
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 15:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=r4pS3nzg1xHsTPROp8NMUMZcT6aPPgnVU+KRkpioBHA=;
 b=gjsapIyc2vwjxnaisvqK9yQebWHeP7F/rxPVU/9qvnVqohA3dIo2HPJ72ldLQQ1nUS8gCOv4jzuSo
 B9+7A5BI3UYe23FGkZbn4NqMTpPLQb0t94Z4K5zgYYipdhkJARHTWiHivdV2TZWOXmU54JiMNdwpCX
 QsaO39o1dExXbjsB5LlxPYlFU5rjD9JOR2kTDVw1zi42hXYQWEbJIcmkYi/+BKY9ahfFowZ/OvBlZG
 EyYVFsbLxlZLeZB2HLJBilE2grCc7mgwPBhHVx9ScabZ6ZbP+rAEmDZ8lvQt7TiY+AMYDhbjodtOxt
 HYyFP7cbjbZiVQjXFZl08ITh+VCMjnQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=r4pS3nzg1xHsTPROp8NMUMZcT6aPPgnVU+KRkpioBHA=;
 b=AqDvLY68qSvpYK0M6v2AFgdtAJSxj+atFt3Pbp78PJGiSuGbTqa+15txBENi21GWvuCMEC4LDLWTu
 SEss8K9BQ==
X-HalOne-ID: 15d52a21-7d84-11ee-8d75-2b733b0ff8f0
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1 (Halon) with ESMTPSA
 id 15d52a21-7d84-11ee-8d75-2b733b0ff8f0;
 Tue, 07 Nov 2023 15:41:16 +0000 (UTC)
Date: Tue, 7 Nov 2023 16:41:15 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Subject: Re: [PATCH] drm/bridge: tc358767: Support input format negotiation
 hook
Message-ID: <20231107154115.GA100782@ravnborg.org>
References: <20231030192846.27934-1-a-bhatia1@ti.com>
 <20231106123800.GC47195@ravnborg.org>
 <7ddf0edb-2925-4b7c-ad07-27c030dd0232@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ddf0edb-2925-4b7c-ad07-27c030dd0232@ti.com>
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
Cc: Nishanth Menon <nm@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jayesh Choudhary <j-choudhary@ti.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jan Kiszka <jan.kiszka@siemens.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>, Tomi Valkeinen <tomba@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Francesco Dolcini <francesco@dolcini.it>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Aradhya,

On Tue, Nov 07, 2023 at 01:17:03AM +0530, Aradhya Bhatia wrote:
> Hi Sam,
> 
> Thank you for the suggestion!
> 
> On 06-Nov-23 18:08, Sam Ravnborg wrote:
> > Hi Aradhya,
> > 
> > On Tue, Oct 31, 2023 at 12:58:46AM +0530, Aradhya Bhatia wrote:
> >> With new connector model, tc358767 will not create the connector, when
> >> DRM_BRIDGE_ATTACH_NO_CONNECTOR is set and display-controller driver will
> >> rely on format negotiation to setup the encoder format.
> >>
> >> Add the missing input-format negotiation hook in the
> >> drm_bridge_funcs to complete DRM_BRIDGE_ATTACH_NO_CONNECTOR support.
> >>
> >> Input format is selected to MEDIA_BUS_FMT_RGB888_1X24 as default, as is
> >> the case with older model.
> >>
> >> Reported-by: Jan Kiszka <jan.kiszka@siemens.com>
> >> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> >> ---
> >>
> >> Notes:
> >>
> >>   * Since I do not have hardware with me, this was just build tested. I would
> >>     appreciate it if someone could test and review it, especically somebody, who
> >>     uses the bridge for DPI/DSI to eDP format conversion.
> >>
> >>   * The Toshiba TC358767 bridge is not enabled in arm64 defconfig by default,
> >>     when it should be. Hence, I sent a quick patch[0] earlier.
> >>
> >> [0]: https://lore.kernel.org/all/20231030152834.18450-1-a-bhatia1@ti.com/
> >>
> >>  drivers/gpu/drm/bridge/tc358767.c | 25 +++++++++++++++++++++++++
> >>  1 file changed, 25 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> >> index ef2e373606ba..0affcefdeb1c 100644
> >> --- a/drivers/gpu/drm/bridge/tc358767.c
> >> +++ b/drivers/gpu/drm/bridge/tc358767.c
> >> @@ -1751,6 +1751,30 @@ tc_dpi_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> >>  	return input_fmts;
> >>  }
> >>  
> >> +static u32 *
> >> +tc_edp_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> >> +				 struct drm_bridge_state *bridge_state,
> >> +				 struct drm_crtc_state *crtc_state,
> >> +				 struct drm_connector_state *conn_state,
> >> +				 u32 output_fmt,
> >> +				 unsigned int *num_input_fmts)
> >> +{
> >> +	u32 *input_fmts;
> >> +
> >> +	*num_input_fmts = 0;
> >> +
> >> +	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
> >> +			     GFP_KERNEL);
> >> +	if (!input_fmts)
> >> +		return NULL;
> >> +
> >> +	/* This is the DSI/DPI-end bus format */
> >> +	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> >> +	*num_input_fmts = 1;
> >> +
> >> +	return input_fmts;
> >> +}
> > 
> > You could benefit from using the helper:
> > drm_atomic_helper_bridge_propagate_bus_fmt()
> 
> You are right!
> 
> Upon taking a second look, I realize that the bridge chain works with
> MEDIA_BUS_FMT_FIXED bus format, when tc358767 is being used in DPI/DSI
> to eDP mode (because the panel-bridge does not have a get_output_bus_fmt
> hook, and uses the same helper for its get_input_bus_fmt hook). My patch
> creates a deviation from that, by forcing MEDIA_BUS_FMT_RGB888_1X24 even
> when eDP is involved.
> 
> Using the helper here, will certainly address this deviation.
> 
> However, for the DPI/DSI to DP mode, MEDIA_BUS_FMT_RGB888_1X24 bus
> format is required, and *just* using the helper as its get_input_bus_fmt
> hook, might not be enough.
> 
> Since tc358767 is the last bridge in DPI/DSI to DP mode, the
> output_fmt parameter get defaulted to MEDIA_BUS_FMT_FIXED too, as there
> is no get_output_bus_fmt hook present in the driver. If we simply us
> the helper here, the input_fmt will also get set to MEDIA_BUS_FMT_FIXED.
> This too is an unwanted deviation.
> 
> It seems like the right way to address both the cases, would be by
> adding the get_output_bus_fmt hook that sets output_fmt to
> MEDIA_BUS_FMT_RGB888_1X24, as well as using the helper as the
> get_input_bus_fmt hook.
> 
> If this seems good to you too, I will send a new version of Tomi's
> series[0] which incorporates this patch.

I never managed to fully wrap my head around the bus fmt negotiation,
and as I am trying to recover from a flu this is not the time to try.
Your explanations sounds like you have grasped it so I suggest to move
ahead.

	Sam
