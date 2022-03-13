Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39ACD4D75EF
	for <lists+dri-devel@lfdr.de>; Sun, 13 Mar 2022 15:50:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD3910E2D0;
	Sun, 13 Mar 2022 14:50:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D532310E2D0;
 Sun, 13 Mar 2022 14:50:19 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B7C9C475;
 Sun, 13 Mar 2022 15:50:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1647183018;
 bh=d51s09i2ljOYka2tmE99miWfW9VXyka+FuaFJHRKA9c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hW+nVE5SwELCk+UcVvmnm0L1nB6N4q5z0RjAE9g9k+QzLf2ypuDtDdJs3W7MWOH1d
 E3bgorK2L1ebjmexWrcEoU6QE4PZr5u9uPsSvskWbxI/M+x2E7EBIJwOwlFLuHCsQN
 hZat+vXPzXem9RS1xwhywpO/qqqgKjVtEPZB/+OQ=
Date: Sun, 13 Mar 2022 16:50:01 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH 5/6] drm/rcar_du: use drm_encoder pointer for
 drm_writeback_connector
Message-ID: <Yi4EmSDj04KdslxP@pendragon.ideasonboard.com>
References: <1646963400-25606-1-git-send-email-quic_abhinavk@quicinc.com>
 <1646963400-25606-6-git-send-email-quic_abhinavk@quicinc.com>
 <Yir6M150BkXPyH2b@pendragon.ideasonboard.com>
 <e31334cf-7e3b-e330-98af-545a07ebff33@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e31334cf-7e3b-e330-98af-545a07ebff33@quicinc.com>
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
Cc: hamohammed.sa@gmail.com, suraj.kandpal@intel.com, emma@anholt.net,
 rodrigosiqueiramelo@gmail.com, jani.nikula@intel.com, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, melissa.srw@gmail.com,
 nganji@codeaurora.org, seanpaul@chromium.org, dmitry.baryshkov@linaro.org,
 james.qian.wang@arm.com, quic_aravindh@quicinc.com, mihail.atanassov@arm.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Abhinav

On Fri, Mar 11, 2022 at 09:47:17AM -0800, Abhinav Kumar wrote:
> On 3/10/2022 11:28 PM, Laurent Pinchart wrote:
> > On Thu, Mar 10, 2022 at 05:49:59PM -0800, Abhinav Kumar wrote:
> >> Make changes to rcar_du driver to start using drm_encoder pointer
> >> for drm_writeback_connector.
> >>
> >> Co-developed-by: Kandpal Suraj <suraj.kandpal@intel.com>
> >> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/rcar-du/rcar_du_writeback.c | 3 ++-
> >>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> >> index c79d125..03930ad 100644
> >> --- a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> >> +++ b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> >> @@ -200,7 +200,8 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
> >>   {
> >>   	struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
> >>   
> >> -	wb_conn->encoder.possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
> >> +	wb_conn->encoder = kzalloc(sizeof(struct drm_encoder), GFP_KERNEL);
> > 
> > Where is this freed ?
> 
> You are right, this isnt. Looking more into this, it seems like moving 
> the allocation of encoder to drm_writeback.c for cases which dont pass a 
> real encoder is much better so that I will not have to add alloc() / 
> free() code for all the vendor driver changes which is what I originally 
> thought in my RFC but changed my mind because of below.

Yes, I think that would be better indeed. You could even skip the
dynamic allocation, you could have

	struct drm_encoder *encoder;
	struct drm_encoder internal_encoder;

in drm_writeback_connector, and set

	wb->encoder = &wb->internal_encoder;

when the user doesn't pass an encoder.

> >> +	wb_conn->encoder->possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
> 
> Do you think we can just move usage of wb_conn->encoder->possible_crtcs 
> just right after drm_writeback_connector_init() so that it wont crash?

How about adding a possible_crtcs argument to
drm_writeback_connector_init() (to cover existing use cases), and adding
a new drm_writeback_connector_init_with_encoder() that would get an
encoder pointer (and expect possible_crtcs, as well as all the other
appropriate encoder fields, having been initialized) ?

> 198 int rcar_du_writeback_init(struct rcar_du_device *rcdu,
> 199 			   struct rcar_du_crtc *rcrtc)
> 200 {
> 201 	struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
> 202
> 203 	wb_conn->encoder.possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
> 204 	drm_connector_helper_add(&wb_conn->base,
> 205 				 &rcar_du_wb_conn_helper_funcs);
> 206
> 207 	return drm_writeback_connector_init(&rcdu->ddev, wb_conn,
> 208 					    &rcar_du_wb_conn_funcs,
> 209 					    &rcar_du_wb_enc_helper_funcs,
> 210 					    writeback_formats,
> 211 					    ARRAY_SIZE(writeback_formats));
> 212 }
> 
> >>   	drm_connector_helper_add(&wb_conn->base,
> >>   				 &rcar_du_wb_conn_helper_funcs);
> >>   

-- 
Regards,

Laurent Pinchart
