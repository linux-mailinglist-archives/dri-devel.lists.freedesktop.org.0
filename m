Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 251C718051D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 18:44:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA67F8944A;
	Tue, 10 Mar 2020 17:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D8C8944A
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 17:43:57 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id B67BD8051C;
 Tue, 10 Mar 2020 18:43:54 +0100 (CET)
Date: Tue, 10 Mar 2020 18:43:53 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH] drm/panel-simple: Fix dotclock for Ortustech COM37H3M
Message-ID: <20200310174353.GC3785@ravnborg.org>
References: <e63a0533ad5b5142373437ef758aedbdb716152d.1583826198.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e63a0533ad5b5142373437ef758aedbdb716152d.1583826198.git.hns@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8
 a=ztCEdXhiAAAA:8 a=e5mUnYsNAAAA:8 a=PPQHlS4OQuZ3qoFTbPgA:9
 a=CjuIK1q_8ugA:10 a=nCm3ceeH17rKjHWsMeRo:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 letux-kernel@openphoenux.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikolaus

Thanks for the detailed explanation.

Applied and pushed to drm-misc-next.

	Sam

On Tue, Mar 10, 2020 at 08:43:19AM +0100, H. Nikolaus Schaller wrote:
> The currently listed dotclock disagrees with the currently
> listed vrefresh rate. Change the dotclock to match the vrefresh.
> 
> There are two variants of the COM37H3M panel.
> The older one's COM37H3M05DTC data sheet specifies:
> 
>                          MIN      TYP     MAX
> CLK frequency    fCLK     --       22.4    26.3 MHz (in VGA mode)
> VSYNC Frequency  fVSYNC   54       60      66   Hz
> VSYNC cycle time tv       --      650      --   H
> HSYNC frequency  fHSYNC   --       39.3    --   kHz
> HSYNC cycle time th       --      570      --   CLK
> 
> The newer one's COM37H3M99DTC data sheet says:
> 
>                          MIN      TYP     MAX
> CLK frequency    fCLK     18       19.8    27   MHz
> VSYNC Frequency  fVSYNC   54       60      66   Hz
> VSYNC cycle time tv      646      650     700   H
> HSYNC frequency  fHSYNC  --        39.0    50.0 kHz
> HSYNC cycle time th      504      508     630   CLK
> 
> So we choose a parameter set that lies within the specs
> of both variants. We start at .vrefresh = 60,
> choose .htotal = 570 and .vtotal = 650 and end up
> in a clock of 22.230 MHz.
> 
> Reported-by: Ville Syrjala <ville.syrjala@linux.intel.com>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index e14c14ac62b5..b4cb23d4898d 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2390,15 +2390,15 @@ static const struct panel_desc ontat_yx700wv03 = {
>  };
>  
>  static const struct drm_display_mode ortustech_com37h3m_mode  = {
> -	.clock = 22153,
> +	.clock = 22230,
>  	.hdisplay = 480,
> -	.hsync_start = 480 + 8,
> -	.hsync_end = 480 + 8 + 10,
> -	.htotal = 480 + 8 + 10 + 10,
> +	.hsync_start = 480 + 40,
> +	.hsync_end = 480 + 40 + 10,
> +	.htotal = 480 + 40 + 10 + 40,
>  	.vdisplay = 640,
>  	.vsync_start = 640 + 4,
> -	.vsync_end = 640 + 4 + 3,
> -	.vtotal = 640 + 4 + 3 + 4,
> +	.vsync_end = 640 + 4 + 2,
> +	.vtotal = 640 + 4 + 2 + 4,
>  	.vrefresh = 60,
>  	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
>  };
> -- 
> 2.23.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
