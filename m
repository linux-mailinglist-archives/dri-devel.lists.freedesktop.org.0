Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5955E4F3CB8
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 19:02:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 775BA10EC24;
	Tue,  5 Apr 2022 17:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F5BD10EC1D;
 Tue,  5 Apr 2022 17:02:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 33D7E5D;
 Tue,  5 Apr 2022 19:02:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1649178166;
 bh=VdVfVMz4RsEekdS+ua00Jxb9KTfcT+oE2GXNmrKpvrk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=el5t2BfhpfXCt7y54pDTSYDi0GiGDnLw1o9euWyg20dOi61Q0TaxkQVqaJF4bkd72
 BZiGVMv8GJMAHcdpU8/1MC5AiBeCVcORD7sNNL24KQ1/Hv0FdXbdsZ/6Izx2F+VPqu
 1SR0s7HzmrRvES4jLDic2nllLnjqT5N7MX6iEDJc=
Date: Tue, 5 Apr 2022 20:02:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [Freedreno] [PATCH v6 4/4] drm: allow real encoder to be passed
 for drm_writeback_connector
Message-ID: <Ykx2M0gUvG5fcLJ4@pendragon.ideasonboard.com>
References: <1648771933-18512-1-git-send-email-quic_abhinavk@quicinc.com>
 <1648771933-18512-5-git-send-email-quic_abhinavk@quicinc.com>
 <YkccZgD+f0enx2aV@pendragon.ideasonboard.com>
 <CAF6AEGu6dE_47DZm9ZcF54mkHpAXGY30WuSP3LCRjtf5bNvjtw@mail.gmail.com>
 <YkxymKepTBq1MsWG@pendragon.ideasonboard.com>
 <65a349f6-3978-bad0-1e64-2c4ccc22d075@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <65a349f6-3978-bad0-1e64-2c4ccc22d075@quicinc.com>
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
Cc: hamohammed.sa@gmail.com, Kandpal Suraj <suraj.kandpal@intel.com>,
 Emma Anholt <emma@anholt.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, melissa.srw@gmail.com,
 nganji@codeaurora.org, Sean Paul <seanpaul@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, james.qian.wang@arm.com,
 quic_aravindh@quicinc.com, Mihail Atanassov <mihail.atanassov@arm.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Abhinav,

On Tue, Apr 05, 2022 at 09:53:57AM -0700, Abhinav Kumar wrote:
> On 4/5/2022 9:47 AM, Laurent Pinchart wrote:
> > On Mon, Apr 04, 2022 at 11:43:37AM -0700, Rob Clark wrote:
> >> On Fri, Apr 1, 2022 at 8:38 AM Laurent Pinchart wrote:
> >>> On Thu, Mar 31, 2022 at 05:12:13PM -0700, Abhinav Kumar wrote:
> >>>> For some vendor driver implementations, display hardware can
> >>>> be shared between the encoder used for writeback and the physical
> >>>> display.
> >>>>
> >>>> In addition resources such as clocks and interrupts can
> >>>> also be shared between writeback and the real encoder.
> >>>>
> >>>> To accommodate such vendor drivers and hardware, allow
> >>>> real encoder to be passed for drm_writeback_connector.
> >>>>
> >>>> changes in v6:
> >>>>        - assign the encoder inside
> >>>>          drm_writeback_connector_init_with_encoder() for
> >>>>          better readability
> >>>>        - improve some documentation for internal encoder
> >>>>
> >>>> Co-developed-by: Kandpal Suraj <suraj.kandpal@intel.com>
> >>>> Signed-off-by: Kandpal Suraj <suraj.kandpal@intel.com>
> >>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>>> ---
> >>>>   drivers/gpu/drm/drm_writeback.c | 18 ++++++++++++------
> >>>>   drivers/gpu/drm/vc4/vc4_txp.c   | 14 ++++++++------
> >>>>   include/drm/drm_writeback.h     | 21 +++++++++++++++++++--
> >>>
> >>> Please split this in two patches, one for the DRM core and one for the
> >>> VC4 driver. This applies to most patches as a general rule, with the
> >>> main exception being API refactoring that requires changing the
> >>> implementation and all its users in a single patch.
> >>
> >> But this *is* API refactoring ;-)
> > 
> > Partly at least :-) Looking at the API change itself, wouldn't we
> > minimize the extra changes to vc4 if we moved this patch before 3/4 ?
> 
> I can move all the changes done in vc4 except below part to the change 
> 3/4 itself because that way I can show usage of vc4->drm_enc with the 
> new API. Let me know if that works.

What I meant is moving the API refactoring from 4/4 before the current
3/4, with minimal changes to vc4 there (only to avoid introducing a
bisection breakge), and then move most of the vc4 changes from this
patch to the current 3/4 (which will become 4/4). If that's what you
meant too, it sounds good to me.

> The only part which will remain is the below one:
> 
> @@ -523,7 +525,7 @@  static int vc4_txp_bind(struct device *dev, struct 
> device *master, void *data)
>   	if (ret)
>   		return ret;
> 
> -	encoder = &txp->connector.encoder;
> +	encoder = txp->connector.encoder;
>   	encoder->possible_crtcs = drm_crtc_mask(crtc);
> 
> Since i dont know vc4 driver very well, I was not sure of a good way to 
> decouple this dependency.
> 
> Let me know if that works.
>
> >>>>   3 files changed, 39 insertions(+), 14 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> >>>> index 797223c..7f72109 100644
> >>>> --- a/drivers/gpu/drm/drm_writeback.c
> >>>> +++ b/drivers/gpu/drm/drm_writeback.c
> >>>> @@ -179,21 +179,21 @@ int drm_writeback_connector_init(struct drm_device *dev,
> >>>>   {
> >>>>        int ret = 0;
> >>>>
> >>>> -     drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
> >>>> +     drm_encoder_helper_add(&wb_connector->internal_encoder, enc_helper_funcs);
> >>>>
> >>>> -     wb_connector->encoder.possible_crtcs = possible_crtcs;
> >>>> +     wb_connector->internal_encoder.possible_crtcs = possible_crtcs;
> >>>>
> >>>> -     ret = drm_encoder_init(dev, &wb_connector->encoder,
> >>>> +     ret = drm_encoder_init(dev, &wb_connector->internal_encoder,
> >>>>                               &drm_writeback_encoder_funcs,
> >>>>                               DRM_MODE_ENCODER_VIRTUAL, NULL);
> >>>>        if (ret)
> >>>>                return ret;
> >>>>
> >>>> -     ret = drm_writeback_connector_init_with_encoder(dev, wb_connector, &wb_connector->encoder,
> >>>> -                     con_funcs, formats, n_formats);
> >>>> +     ret = drm_writeback_connector_init_with_encoder(dev, wb_connector,
> >>>> +                     &wb_connector->internal_encoder, con_funcs, formats, n_formats);
> >>>>
> >>>>        if (ret)
> >>>> -             drm_encoder_cleanup(&wb_connector->encoder);
> >>>> +             drm_encoder_cleanup(&wb_connector->internal_encoder);
> >>>>
> >>>>        return ret;
> >>>>   }
> >>>> @@ -238,6 +238,12 @@ int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
> >>>>        struct drm_mode_config *config = &dev->mode_config;
> >>>>        int ret = create_writeback_properties(dev);
> >>>>
> >>>> +     /*
> >>>> +      * Assign the encoder passed to this API to the wb_connector's encoder.
> >>>> +      * For drm_writeback_connector_init(), this shall be the internal_encoder
> >>>> +      */
> >>>> +     wb_connector->encoder = enc;
> >>>> +
> >>>>        if (ret != 0)
> >>>>                return ret;
> >>>>
> >>>> diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
> >>>> index 5e53f02..a9b4f83 100644
> >>>> --- a/drivers/gpu/drm/vc4/vc4_txp.c
> >>>> +++ b/drivers/gpu/drm/vc4/vc4_txp.c
> >>>> @@ -151,6 +151,8 @@ struct vc4_txp {
> >>>>
> >>>>        struct platform_device *pdev;
> >>>>
> >>>> +     struct drm_encoder drm_enc;
> >>>> +
> >>>>        struct drm_writeback_connector connector;
> >>>>
> >>>>        void __iomem *regs;
> >>>> @@ -159,7 +161,7 @@ struct vc4_txp {
> >>>>
> >>>>   static inline struct vc4_txp *encoder_to_vc4_txp(struct drm_encoder *encoder)
> >>>>   {
> >>>> -     return container_of(encoder, struct vc4_txp, connector.encoder);
> >>>> +     return container_of(encoder, struct vc4_txp, drm_enc);
> >>>>   }
> >>>>
> >>>>   static inline struct vc4_txp *connector_to_vc4_txp(struct drm_connector *conn)
> >>>> @@ -499,9 +501,9 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
> >>>>
> >>>>        wb_conn = &txp->connector;
> >>>>
> >>>> -     drm_encoder_helper_add(&wb_conn->encoder, &vc4_txp_encoder_helper_funcs);
> >>>> +     drm_encoder_helper_add(&txp->drm_enc, &vc4_txp_encoder_helper_funcs);
> >>>>
> >>>> -     ret = drm_encoder_init(drm, &wb_conn->encoder,
> >>>> +     ret = drm_encoder_init(drm, &txp->drm_enc,
> >>>>                        &vc4_txp_encoder_funcs,
> >>>>                        DRM_MODE_ENCODER_VIRTUAL, NULL);
> >>>>
> >>>> @@ -511,10 +513,10 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
> >>>>        drm_connector_helper_add(&wb_conn->base,
> >>>>                                 &vc4_txp_connector_helper_funcs);
> >>>>
> >>>> -     ret = drm_writeback_connector_init_with_encoder(drm, wb_conn, &wb_conn->encoder,
> >>>> +     ret = drm_writeback_connector_init_with_encoder(drm, wb_conn, &txp->drm_enc,
> >>>>                        &vc4_txp_connector_funcs, drm_fmts, ARRAY_SIZE(drm_fmts));
> >>>>        if (ret) {
> >>>> -             drm_encoder_cleanup(&wb_conn->encoder);
> >>>> +             drm_encoder_cleanup(&txp->drm_enc);
> >>>>                return ret;
> >>>>        }
> >>>>
> >>>> @@ -523,7 +525,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
> >>>>        if (ret)
> >>>>                return ret;
> >>>>
> >>>> -     encoder = &txp->connector.encoder;
> >>>> +     encoder = txp->connector.encoder;
> >>>>        encoder->possible_crtcs = drm_crtc_mask(crtc);
> >>>>
> >>>>        ret = devm_request_irq(dev, irq, vc4_txp_interrupt, 0,
> >>>> diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
> >>>> index 4795024..3f5c330 100644
> >>>> --- a/include/drm/drm_writeback.h
> >>>> +++ b/include/drm/drm_writeback.h
> >>>> @@ -25,15 +25,32 @@ struct drm_writeback_connector {
> >>>>        struct drm_connector base;
> >>>>
> >>>>        /**
> >>>> -      * @encoder: Internal encoder used by the connector to fulfill
> >>>> +      * @encoder: handle to drm_encoder used by the connector to fulfill
> >>>>         * the DRM framework requirements. The users of the
> >>>>         * @drm_writeback_connector control the behaviour of the @encoder
> >>>>         * by passing the @enc_funcs parameter to drm_writeback_connector_init()
> >>>>         * function.
> >>>> +      *
> >>>> +      * For some vendor drivers, the hardware resources are shared between
> >>>> +      * writeback encoder and rest of the display pipeline.
> >>>> +      * To accommodate such cases, encoder is a handle to the real encoder
> >>>> +      * hardware.
> >>>> +      *
> >>>> +      * For current existing writeback users, this shall continue to be the
> >>>> +      * embedded encoder for the writeback connector.
> >>>>         */
> >>>> -     struct drm_encoder encoder;
> >>>> +     struct drm_encoder *encoder;
> >>>>
> >>>>        /**
> >>>> +      * @internal_encoder: internal encoder used by writeback when
> >>>> +      * drm_writeback_connector_init() is used.
> >>>> +      * @encoder will be assigned to this for those cases
> >>>> +      *
> >>>> +      * This will be unused when drm_writeback_connector_init_with_encoder()
> >>>> +      * is used.
> >>>> +      */
> >>>> +     struct drm_encoder internal_encoder;
> >>>> +     /**
> >>>>         * @pixel_formats_blob_ptr:
> >>>>         *
> >>>>         * DRM blob property data for the pixel formats list on writeback

-- 
Regards,

Laurent Pinchart
