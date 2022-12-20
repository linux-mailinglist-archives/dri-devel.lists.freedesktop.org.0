Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3016651F0D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 11:41:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62EE10E39E;
	Tue, 20 Dec 2022 10:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00176a03.pphosted.com (mx0a-00176a03.pphosted.com
 [67.231.149.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E09D10E09C
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 08:33:23 +0000 (UTC)
Received: from pps.filterd (m0048275.ppops.net [127.0.0.1])
 by m0048275.ppops.net-00176a03. (8.17.1.19/8.17.1.19) with ESMTP id
 2BK4NSqh028882
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 03:33:22 -0500
Date: Tue, 20 Dec 2022 10:33:18 +0200
From: Ian Ray <ian.ray@ge.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: EXT: Re: [PATCH] drm/imx: ipuv3-plane: Fix overlay plane width
Message-ID: <20221220083318.GA40917@zoo6.em.health.ge.com>
References: <20221108141420.176696-1-p.zabel@pengutronix.de>
 <20221108144955.my4m5smwazsctsli@mercury.elektranox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108144955.my4m5smwazsctsli@mercury.elektranox.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: cNbcm-_SG3ozP_R714Ir8kuSDktFaQ6Z
X-Proofpoint-ORIG-GUID: cNbcm-_SG3ozP_R714Ir8kuSDktFaQ6Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-20_01,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212200069
X-Mailman-Approved-At: Tue, 20 Dec 2022 10:39:50 +0000
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 Huan 'Kitty' Wang <HuanWang@ge.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 08, 2022 at 03:49:55PM +0100, Sebastian Reichel wrote:
> Hi,
> 
> On Tue, Nov 08, 2022 at 03:14:20PM +0100, Philipp Zabel wrote:
> > ipu_src_rect_width() was introduced to support odd screen resolutions
> > such as 1366x768 by internally rounding up primary plane width to a
> > multiple of 8 and compensating with reduced horizontal blanking.
> > This also caused overlay plane width to be rounded up, which was not
> > intended. Fix overlay plane width by limiting the rounding up to the
> > primary plane.
> > 
> > drm_rect_width(&new_state->src) >> 16 is the same value as
> > drm_rect_width(dst) because there is no plane scaling support.
> > 
> > Fixes: 94dfec48fca7 ("drm/imx: Add 8 pixel alignment fix")
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Sorry for the delay in testing, and thank you for the patch!


Tested-by: Ian Ray <ian.ray@ge.com>


> > ---
> 
> Looks sensible, but I no longer have access to the affected
> hardware. Maybe Ian or Kitty (both added to Cc) can give it
> a test on arch/arm/boot/dts/imx6dl-b155v2.dts
> 
> -- Sebastian
> 
> >  drivers/gpu/drm/imx/ipuv3-plane.c | 14 ++++++++------
> >  1 file changed, 8 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
> > index dba4f7d81d69..80142d9a4a55 100644
> > --- a/drivers/gpu/drm/imx/ipuv3-plane.c
> > +++ b/drivers/gpu/drm/imx/ipuv3-plane.c
> > @@ -614,6 +614,11 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
> >  		break;
> >  	}
> >  
> > +	if (ipu_plane->dp_flow == IPU_DP_FLOW_SYNC_BG)
> > +		width = ipu_src_rect_width(new_state);
> > +	else
> > +		width = drm_rect_width(&new_state->src) >> 16;
> > +
> >  	eba = drm_plane_state_to_eba(new_state, 0);
> >  
> >  	/*
> > @@ -622,8 +627,7 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
> >  	 */
> >  	if (ipu_state->use_pre) {
> >  		axi_id = ipu_chan_assign_axi_id(ipu_plane->dma);
> > -		ipu_prg_channel_configure(ipu_plane->ipu_ch, axi_id,
> > -					  ipu_src_rect_width(new_state),
> > +		ipu_prg_channel_configure(ipu_plane->ipu_ch, axi_id, width,
> >  					  drm_rect_height(&new_state->src) >> 16,
> >  					  fb->pitches[0], fb->format->format,
> >  					  fb->modifier, &eba);
> > @@ -678,9 +682,8 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
> >  		break;
> >  	}
> >  
> > -	ipu_dmfc_config_wait4eot(ipu_plane->dmfc, ALIGN(drm_rect_width(dst), 8));
> > +	ipu_dmfc_config_wait4eot(ipu_plane->dmfc, width);
> >  
> > -	width = ipu_src_rect_width(new_state);
> >  	height = drm_rect_height(&new_state->src) >> 16;
> >  	info = drm_format_info(fb->format->format);
> >  	ipu_calculate_bursts(width, info->cpp[0], fb->pitches[0],
> > @@ -744,8 +747,7 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
> >  		ipu_cpmem_set_burstsize(ipu_plane->ipu_ch, 16);
> >  
> >  		ipu_cpmem_zero(ipu_plane->alpha_ch);
> > -		ipu_cpmem_set_resolution(ipu_plane->alpha_ch,
> > -					 ipu_src_rect_width(new_state),
> > +		ipu_cpmem_set_resolution(ipu_plane->alpha_ch, width,
> >  					 drm_rect_height(&new_state->src) >> 16);
> >  		ipu_cpmem_set_format_passthrough(ipu_plane->alpha_ch, 8);
> >  		ipu_cpmem_set_high_priority(ipu_plane->alpha_ch);
> > 
> > base-commit: 9abf2313adc1ca1b6180c508c25f22f9395cc780
> > -- 
> > 2.30.2
> > 


