Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 260A87F9E86
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 12:26:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC5610E243;
	Mon, 27 Nov 2023 11:26:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3607210E243
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 11:26:02 +0000 (UTC)
Received: from i53875bf8.versanet.de ([83.135.91.248] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1r7ZkO-000139-1p; Mon, 27 Nov 2023 12:25:52 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: hjc@rock-chips.com, Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v1 3/4] drm/rockchip: rk3066_hdmi: Remove useless output
 format
Date: Mon, 27 Nov 2023 12:25:51 +0100
Message-ID: <8082175.UjTJXf6HLC@diego>
In-Reply-To: <bff69815-1185-c74f-82ab-5b8f7faccfac@gmail.com>
References: <cda574be-4f33-b66d-eb14-92c2b31d241e@gmail.com>
 <4308014.ejJDZkT8p0@phil>
 <bff69815-1185-c74f-82ab-5b8f7faccfac@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Johan,

Am Donnerstag, 23. November 2023, 13:54:28 CET schrieb Johan Jonker:
> 
> On 11/20/23 18:06, Heiko Stuebner wrote:
> > Hi Johan,
> > 
> > Am Donnerstag, 2. November 2023, 14:42:19 CET schrieb Johan Jonker:
> >> The Rk3066 hdmi output format is hard coded to RGB. Remove
> >> all useless code related to colorimetry and enc_out_format.
> >>
> >> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> > 
> 
> > I guess my first question is, is the hardcoding happening just because
> > of missing functionality in the driver, or does the hardware only
> > support RGB?
> 
> This driver can do so much more..., but is crippled by various causes.
> If in need for a full functional rk3066 driver a little bit help/advise/action from other people is needed.

Part of me wants to have fully working drivers, but on the other hand,
both the rk3066-hdmi and also the inno-hdmi drivers are sort of one-off
drivers used by rk3066 and rk3036 (inno-hdmi) and most likely won't see
new SoCs using them in the future.


So I guess after thinking more about this, I should probably just apply
your patch to simplify the code and if by some magical happenings in
future someone really wants to spend time on either one of these drivers
they can always use "git revert" to bring back the old code?


Heiko


> 1:
> Missing rk3066 TRM HDMI register info.
> Could Rockchip (= Sandy Huang) disclose this info to the open source community?
> 
> As a way around we can look at older driver code and port to mainline.
> More info gives better results.
> rk30_hdmi_config_csc() function:
> https://github.com/RockchipOpensourceCommunity/px2-android-kernel-3.0/blob/master/drivers/video/rockchip/hdmi/chips/rkpx2/rkpx2_hdmi_hw.c#L315
> 
> 2:
> Could DRM people show us examples for:
> - How to advertise to the VOP driver what data formats (RGB, YCBCR) it can send to the HDMI driver or any other Rockchip DRM sub driver other then RGB.
> - Advertise EDID data monitor modes RGB444, YCBCR444 and YCBCR422 to the HDMI driver.
> 
> https://github.com/RockchipOpensourceCommunity/px2-android-kernel-3.0/blob/master/drivers/video/rockchip/hdmi/rk_hdmi_edid.c#L217C1-L218C41
> 
> 3:
> Advise when what Infoframe is needed for only RGB vs. the rest according to the specification.
> https://engineering.purdue.edu/ece477/Archive/2012/Spring/S12-Grp10/Datasheets/CEC_HDMI_Specification.pdf
> 
> rk3066 currently only sends avi info. Does it need vsi as well? Can anyone give some clarity here?
> inno_hdime sends avi and vsi info.
> 
> 4:
> rk3066_hdmi and inno_hdmi are HDMI 1.4a drivers for DVI and HDMI.
> Validated by drm_match_cea_mode() this function only gives us both HDMI + HDMI2 focus, but nothing for old DVI monitors.
> How to improve?
> 
> 5:
> Sound support was submitted:
> Re: [PATCH v6 2/5] drm: rockchip: add sound support to rk3066 hdmi driver
> https://lore.kernel.org/linux-rockchip/48dbe9b7-0aa0-f459-301f-f380e2b7f2f8@gmail.com/
> 
> No reply was given (by Heiko or others) on why it wasn't applied or what needs to be improved.
> 
> Without reply no improvement.
> 
> Johan
> 
> 
> > 
> > 
> >> ---
> >>  drivers/gpu/drm/rockchip/rk3066_hdmi.c | 20 +-------------------
> >>  1 file changed, 1 insertion(+), 19 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
> >> index 0e7aae341960..f2b1b2faa096 100644
> >> --- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
> >> +++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
> >> @@ -23,8 +23,6 @@
> >>
> >>  struct hdmi_data_info {
> >>  	int vic; /* The CEA Video ID (VIC) of the current drm display mode. */
> >> -	unsigned int enc_out_format;
> >> -	unsigned int colorimetry;
> >>  };
> >>
> >>  struct rk3066_hdmi_i2c {
> >> @@ -200,14 +198,7 @@ static int rk3066_hdmi_config_avi(struct rk3066_hdmi *hdmi,
> >>  	rc = drm_hdmi_avi_infoframe_from_display_mode(&frame.avi,
> >>  						      &hdmi->connector, mode);
> >>
> >> -	if (hdmi->hdmi_data.enc_out_format == HDMI_COLORSPACE_YUV444)
> >> -		frame.avi.colorspace = HDMI_COLORSPACE_YUV444;
> >> -	else if (hdmi->hdmi_data.enc_out_format == HDMI_COLORSPACE_YUV422)
> >> -		frame.avi.colorspace = HDMI_COLORSPACE_YUV422;
> >> -	else
> >> -		frame.avi.colorspace = HDMI_COLORSPACE_RGB;
> >> -
> >> -	frame.avi.colorimetry = hdmi->hdmi_data.colorimetry;
> >> +	frame.avi.colorspace = HDMI_COLORSPACE_RGB;
> >>  	frame.avi.scan_mode = HDMI_SCAN_MODE_NONE;
> >>
> >>  	return rk3066_hdmi_upload_frame(hdmi, rc, &frame,
> >> @@ -329,15 +320,6 @@ static int rk3066_hdmi_setup(struct rk3066_hdmi *hdmi,
> >>  	struct drm_display_info *display = &hdmi->connector.display_info;
> >>
> >>  	hdmi->hdmi_data.vic = drm_match_cea_mode(mode);
> >> -	hdmi->hdmi_data.enc_out_format = HDMI_COLORSPACE_RGB;
> >> -
> >> -	if (hdmi->hdmi_data.vic == 6 || hdmi->hdmi_data.vic == 7 ||
> >> -	    hdmi->hdmi_data.vic == 21 || hdmi->hdmi_data.vic == 22 ||
> >> -	    hdmi->hdmi_data.vic == 2 || hdmi->hdmi_data.vic == 3 ||
> >> -	    hdmi->hdmi_data.vic == 17 || hdmi->hdmi_data.vic == 18)
> >> -		hdmi->hdmi_data.colorimetry = HDMI_COLORIMETRY_ITU_601;
> >> -	else
> >> -		hdmi->hdmi_data.colorimetry = HDMI_COLORIMETRY_ITU_709;
> > 
> 
> > while I can understand the RGB output format, why does the colorimetry
> > also get removed? This looks like it is dependent on the mode itself
> > and not the output format?
> 
> From the old driver these conditions apply whether csc is needed.
> https://github.com/RockchipOpensourceCommunity/px2-android-kernel-3.0/blob/master/drivers/video/rockchip/hdmi/chips/rkpx2/rkpx2_hdmi_hw.c#L320C1-L324C3
> 
> 	if( ((vpara->input_color == VIDEO_INPUT_COLOR_RGB) && (vpara->output_color == VIDEO_OUTPUT_RGB444)) ||
> 		((vpara->input_color == VIDEO_INPUT_COLOR_YCBCR) && (vpara->output_color != VIDEO_OUTPUT_RGB444) ))
> 	{
> 		return;
> 	}
> 
> > 
> > Thanks
> > Heiko
> > 
> > 
> 




