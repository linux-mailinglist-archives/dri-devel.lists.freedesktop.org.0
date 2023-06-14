Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 116AC72FA03
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 12:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA2010E439;
	Wed, 14 Jun 2023 10:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C78610E439;
 Wed, 14 Jun 2023 10:03:43 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 1F08B3F806;
 Wed, 14 Jun 2023 12:03:40 +0200 (CEST)
Date: Wed, 14 Jun 2023 12:03:39 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 3/3] drm/msm/dsi: Enable DATABUS_WIDEN for DSI command mode
Message-ID: <mfzmioovf54lcuiuzvk4fuz26elag6iw3ohbdhgym7k3qzirhx@dd7vu7ms6azz>
References: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
 <20230525-add-widebus-support-v1-3-c7069f2efca1@quicinc.com>
 <3a6cc492-6b54-2c70-402e-995c0b003c01@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a6cc492-6b54-2c70-402e-995c0b003c01@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-14 10:49:31, Dmitry Baryshkov wrote:
> On 14/06/2023 04:57, Jessica Zhang wrote:
> > DSI 6G v2.5.x+ supports a data-bus widen mode that allows DSI to send
> > 48 bits of compressed data per pclk instead of 24.
> > 
> > For all chipsets that support this mode, enable it whenever DSC is
> > enabled as recommend by the hardware programming guide.
> > 
> > Only enable this for command mode as we are currently unable to validate
> > it for video mode.
> > 
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> > 
> > Note: The dsi.xml.h changes were generated using the headergen2 script in
> > envytools [1], but the changes to the copyright and rules-ng-ng source file
> > paths were dropped.
> > 
> > [1] https://github.com/freedreno/envytools/
> > 
> >   drivers/gpu/drm/msm/dsi/dsi.xml.h  |  1 +
> >   drivers/gpu/drm/msm/dsi/dsi_host.c | 19 ++++++++++++++++++-
> >   2 files changed, 19 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> > index a4a154601114..2a7d980e12c3 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
> > +++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> > @@ -664,6 +664,7 @@ static inline uint32_t DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP(enum dsi_rgb_swap v
> >   	return ((val) << DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP__SHIFT) & DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP__MASK;
> >   }
> >   #define DSI_CMD_MODE_MDP_CTRL2_BURST_MODE			0x00010000
> > +#define DSI_CMD_MODE_MDP_CTRL2_DATABUS_WIDEN			0x00100000
> > 
> >   #define REG_DSI_CMD_MODE_MDP_STREAM2_CTRL			0x000001b8
> >   #define DSI_CMD_MODE_MDP_STREAM2_CTRL_DATA_TYPE__MASK		0x0000003f
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > index 5d7b4409e4e9..1da5238e7105 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -927,6 +927,9 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> >   	u32 hdisplay = mode->hdisplay;
> >   	u32 wc;
> >   	int ret;
> > +	bool widebus_supported = msm_host->cfg_hnd->major == MSM_DSI_VER_MAJOR_6G &&
> > +			msm_host->cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V2_5_0;
> > +
> > 
> >   	DBG("");
> > 
> > @@ -973,8 +976,15 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> >   		 *
> >   		 * hdisplay will be divided by 3 here to account for the fact
> >   		 * that DPU sends 3 bytes per pclk cycle to DSI.
> > +		 *
> > +		 * If widebus is supported, set DATABUS_WIDEN register and divide hdisplay by 6
> > +		 * instead of 3
> 
> This is useless, it is already obvious from the code below. Instead 
> there should be something like "wide bus extends that to 6 bytes per 
> pclk cycle"

Yes please.  In general, don't paraphrase the code, but explain _why_ it
is doing what it does.  Saying that the widebus feature doubles the
bandwidth per pclk tick is much more clear than "divide by 6 instead of
3" - we can read that from the code.

Overall comments have been very good so far (such as the original "to
account for the fact that DPU sends 3 bytes per pclk cycle"), though!

> >   		 */
> > -		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
> > +		if (!(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) && widebus_supported)
> > +			hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 6);
> > +		else
> > +			hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
> > +
> >   		h_total += hdisplay;
> >   		ha_end = ha_start + hdisplay;
> >   	}
> > @@ -1027,6 +1037,13 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> >   		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_TOTAL,
> >   			DSI_CMD_MDP_STREAM0_TOTAL_H_TOTAL(hdisplay) |
> >   			DSI_CMD_MDP_STREAM0_TOTAL_V_TOTAL(mode->vdisplay));
> > +
> > +		if (msm_host->dsc && widebus_supported) {
> > +			u32 mdp_ctrl2 = dsi_read(msm_host, REG_DSI_CMD_MODE_MDP_CTRL2);
> > +
> > +			mdp_ctrl2 |= DSI_CMD_MODE_MDP_CTRL2_DATABUS_WIDEN;
> > +			dsi_write(msm_host, REG_DSI_CMD_MODE_MDP_CTRL2, mdp_ctrl2);
> 
> Is widebus applicable only to the CMD mode, or video mode can employ it too?

The patch description states that it was not tested on video-mode yet,
so I assume it will.  But this should also be highlighted with a comment
(e.g. /* XXX: Allow for video-mode once tested/fixed */), _especially_
on the check for MIPI_DSI_MODE_VIDEO above.

If I understand this correctly DSC is not working for video mode at all
on these setups, right?  Or no-one was able to test it?  I'm inclined to
request dropping these artifical guards to have as little friction as
possible when someone starts enabling and testing this - and less
patches removing artificial bounds in the future.

- Marijn
