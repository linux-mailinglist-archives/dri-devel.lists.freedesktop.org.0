Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D99F53C08B
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 00:01:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4791310E8A8;
	Thu,  2 Jun 2022 22:01:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 315 seconds by postgrey-1.36 at gabe;
 Thu, 02 Jun 2022 22:01:06 UTC
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2BAE10E8A8
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 22:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1654206947; bh=Ki/Rl/4q0399EjnSBqmzWU3sLpJik8WX4vFYR3fDXjg=;
 h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
 b=FLcoU608SZaHaFJVRmHeaoFikgDsv6OxWVxeRAWPKeAQKSmUPNsaF9elJXb9Z6ST9
 axoaxO/BP16uhEv0Im0qYE0VTGmt7sBdQe16Q8AWXWtcNdNVrolG1Z7fgg2u/tV3bL
 5e34zlYVa/hV/i9VZaDx0KppIU7ukftnHRY6QCLo=
Date: Thu, 2 Jun 2022 23:55:47 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Roman Stratiienko <r.stratiienko@gmail.com>
Subject: Re: [PATCH] drm/sun4i: sun8i: Add the ability to keep scaler enabled
 for VI layer
Message-ID: <20220602215547.scsabzbeztgduaj3@core>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
 Roman Stratiienko <r.stratiienko@gmail.com>, mripard@kernel.org,
 wens@csie.org, jernej.skrabec@gmail.com, airlied@linux.ie,
 daniel@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20220602180118.66170-1-r.stratiienko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220602180118.66170-1-r.stratiienko@gmail.com>
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
Cc: samuel@sholland.org, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com, wens@csie.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Roman,

On Thu, Jun 02, 2022 at 06:01:18PM +0000, Roman Stratiienko wrote:
> According to DE2.0/DE3.0 manual VI scaler enable register is double
> buffered, but de facto it doesn't, or the hardware has the shadow
> register latching issues which causes single-frame picture corruption
> after changing the state of scaler enable register.
> 
> Allow the user to keep the scaler always enabled, preventing the UI
> glitches on the transition from scaled to unscaled state.
> 
> NOTE:
> UI layer scaler has more registers with double-buffering issue and can't
> be workarounded in the same manner.
> 
> You may find a python test and a demo video for this issue at [1]

Isn't this an issue with kernel driver not waiting for DE2 FINISH IRQ, but
for VBLANK IRQ from TCON instead, before allowing to write new set of register
values?

https://megous.com/dl/tmp/4fe35b3fc72ee7de.png

I haven't checked if FINISH flag is set at time of VBLANK interrupt, so maybe
this is not the issue.

regards,
	o.

> [1]: https://github.com/GloDroid/glodroid_tests/issues/4
> Signed-off-by: Roman Stratiienko <r.stratiienko@gmail.com>
> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c    | 12 ++++++++++++
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c |  4 +++-
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> index 71ab0a00b4de..15cad0330f66 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -27,6 +27,18 @@
>  #include "sun8i_vi_layer.h"
>  #include "sunxi_engine.h"
>  
> +/* According to DE2.0/DE3.0 manual VI scaler enable register is double
> + * buffered, but de facto it doesn't, or the hardware has the shadow
> + * register latching issues which causes single-frame picture corruption
> + * after changing the state of scaler enable register.
> + * Allow the user to keep the scaler always enabled, preventing the UI
> + * glitches on the transition from scaled to unscaled state.
> + */
> +int sun8i_vi_keep_scaler_enabled;
> +MODULE_PARM_DESC(keep_vi_scaler_enabled,
> +		 "Keep VI scaler enabled (1 = enabled, 0 = disabled (default))");
> +module_param_named(keep_vi_scaler_enabled, sun8i_vi_keep_scaler_enabled, int, 0644);
> +
>  struct de2_fmt_info {
>  	u32	drm_fmt;
>  	u32	de2_fmt;
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> index 662ba1018cc4..f005ab883503 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -17,6 +17,8 @@
>  #include "sun8i_vi_layer.h"
>  #include "sun8i_vi_scaler.h"
>  
> +extern int sun8i_vi_keep_scaler_enabled;
> +
>  static void sun8i_vi_layer_enable(struct sun8i_mixer *mixer, int channel,
>  				  int overlay, bool enable, unsigned int zpos)
>  {
> @@ -149,7 +151,7 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
>  	 */
>  	subsampled = format->hsub > 1 || format->vsub > 1;
>  
> -	if (insize != outsize || subsampled || hphase || vphase) {
> +	if (insize != outsize || subsampled || hphase || vphase || sun8i_vi_keep_scaler_enabled) {
>  		unsigned int scanline, required;
>  		struct drm_display_mode *mode;
>  		u32 hscale, vscale, fps;
> -- 
> 2.30.2
> 
