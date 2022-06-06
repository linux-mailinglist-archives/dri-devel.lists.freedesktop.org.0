Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C0153EE8C
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 21:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F4211B426;
	Mon,  6 Jun 2022 19:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 843C411B426
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 19:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=6Cg1ugMW2sgR40fh9Scahx5XXbaDSIss/S9MBAp8xq8=;
 b=ETNremb0uLGQKMa9jdGQJ2mGNnyNkXO2sPf08r/Z0bnFUkACFuvUBKMu1U6HNCSky8IqzL9AxavKd
 aoNnlzE6w67Kc8H5HUsEATZ50YDG1B0LFEy7qZCgP5xSdJbXT1TpeX5qI2okHWTEZptwbDhCdPm2H4
 IgOhPgdmwcFXNTT0Gw//7ajYP+ppdFccxK/S7Ney+1dWDHWMDL3laztIiI295Z4mM+i+TsAJ0xGXPa
 pClgkifJLS2q8tYRURntTr5T2lROayoQf/OUEqIcN/IZy+bGvKE8/CgYKgTrjyhFXHfORBjekidJMf
 uFxsoG5ADMIyWwXWOXg++N4MGQ41qeA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=6Cg1ugMW2sgR40fh9Scahx5XXbaDSIss/S9MBAp8xq8=;
 b=H4W1sEEIyckKy4ictTk9wQBkyCsvmPLwtpavm6fJMLh5D2dGa+zCB5sMBBKOPDG4Cwf4Ul/oZeZlX
 sy8p4T8CQ==
X-HalOne-Cookie: d1498cb72ad0f58e22308cc44230f2d4a7b4d137
X-HalOne-ID: 62ba285a-e5ce-11ec-a911-d0431ea8a290
Received: from mailproxy4.cst.dirpod3-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 62ba285a-e5ce-11ec-a911-d0431ea8a290;
 Mon, 06 Jun 2022 19:25:13 +0000 (UTC)
Date: Mon, 6 Jun 2022 21:25:11 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v4 5/8] drm/panel: panel-simple: Implement
 .get_orientation callback
Message-ID: <Yp5Ul/ODUB/sQ0Jf@ravnborg.org>
References: <20220606152431.1889185-1-hsinyi@chromium.org>
 <20220606152431.1889185-6-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220606152431.1889185-6-hsinyi@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, Hans de Goede <hdegoede@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hsin-Yi,

On Mon, Jun 06, 2022 at 11:24:28PM +0800, Hsin-Yi Wang wrote:
> To return the orientation property to drm/kms driver.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 4a2e580a2f7b..f232b8cf4075 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -411,7 +411,12 @@ static int panel_simple_get_modes(struct drm_panel *panel,
>  	/* add hard-coded panel modes */
>  	num += panel_simple_get_non_edid_modes(p, connector);
>  
> -	/* set up connector's "panel orientation" property */
> +	/*
> +	 * drm drivers are expected to call drm_panel_get_orientation() to get
> +	 * panel's orientation then drm_connector_set_panel_orientation() to
> +	 * set the property before drm_dev_register(). Otherwise there will be
> +	 * a WARN_ON if orientation is set after drm is registered.
> +	 */

This comment is not really relevant here. If we need to explain this
then put it in drm_panel.c/h - as this applies for all panels and not
just the panel_simple.
Keep in mind, this is the source new panels often use a inspiration and
no need to have this copied around.

>  	drm_connector_set_panel_orientation(connector, p->orientation);
>  
>  	return num;
> @@ -434,6 +439,14 @@ static int panel_simple_get_timings(struct drm_panel *panel,
>  	return p->desc->num_timings;
>  }
>  
> +static enum drm_panel_orientation panel_simple_get_orientation(struct drm_panel *panel)
> +{
> +       struct panel_simple *p = to_panel_simple(panel);
> +
> +       return p->orientation;
> +}
> +
> +
>  static const struct drm_panel_funcs panel_simple_funcs = {
>  	.disable = panel_simple_disable,
>  	.unprepare = panel_simple_unprepare,
> @@ -441,6 +454,7 @@ static const struct drm_panel_funcs panel_simple_funcs = {
>  	.enable = panel_simple_enable,
>  	.get_modes = panel_simple_get_modes,
>  	.get_timings = panel_simple_get_timings,
> +	.get_orientation = panel_simple_get_orientation,

I like the order in this list to match the order in the .h file.
So my OCD would like you to move it up right after get_modes,
but feel free to ignore this.

With the suggested changes:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

>  };
>  
>  static struct panel_desc panel_dpi;
> -- 
> 2.36.1.255.ge46751e96f-goog
