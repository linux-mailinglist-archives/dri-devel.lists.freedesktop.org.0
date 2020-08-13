Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D62332437A8
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 11:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D70D76E98B;
	Thu, 13 Aug 2020 09:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E418F6E989;
 Thu, 13 Aug 2020 09:29:16 +0000 (UTC)
IronPort-SDR: EMH3WfmJlt1Hhj1pwg7weBs9UvVpPmTQP6ZTVGnN4vkcOtqWrRw9FBDdJqmWAA/Q5WPQO44j87
 zGjRM+Uzcl8Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9711"; a="155313866"
X-IronPort-AV: E=Sophos;i="5.76,307,1592895600"; d="scan'208";a="155313866"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 02:29:16 -0700
IronPort-SDR: MK/x35pDZzaydGm75YzoPW75Rh3/VYqRmUF+7ZwOjGrhQov+vy/w+rO5og4iW9tHULiXtxtg6c
 ApkrqTp96f1A==
X-IronPort-AV: E=Sophos;i="5.76,307,1592895600"; d="scan'208";a="335208341"
Received: from unknown (HELO intel.com) ([10.223.74.178])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 02:29:13 -0700
Date: Thu, 13 Aug 2020 14:47:32 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [Intel-gfx] [PATCH v7 17/17] drm/i915: Add HDCP 1.4 support for
 MST connectors
Message-ID: <20200813091729.GJ30770@intel.com>
References: <20200623155907.22961-1-sean@poorly.run>
 <20200623155907.22961-18-sean@poorly.run>
 <20200709103712.GD13481@intel.com>
 <20200709122845.GP15183@intel.com>
 <CAMavQKKFL11e6cCmQaVkyUgRsAst_F5=mwNf3q86qrmXWhvp5Q@mail.gmail.com>
 <20200812070322.GG30770@intel.com>
 <CAMavQKKw23K4BgcGPeUj10rHQzHyuxCFK_5XhuEcktqOHSj1KQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMavQKKw23K4BgcGPeUj10rHQzHyuxCFK_5XhuEcktqOHSj1KQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-08-12 at 13:21:51 -0400, Sean Paul wrote:
> On Wed, Aug 12, 2020 at 3:15 AM Anshuman Gupta <anshuman.gupta@intel.com> wrote:
> >
> > On 2020-08-11 at 13:28:46 -0400, Sean Paul wrote:
> > > On Thu, Jul 9, 2020 at 8:40 AM Anshuman Gupta <anshuman.gupta@intel.com> wrote:
> > > >
> > >
> > > \snip
> > >
> > > > > > +static int
> > > > > > +intel_dp_mst_hdcp_toggle_signalling(struct intel_digital_port *intel_dig_port,
> > > > > > +                               enum transcoder cpu_transcoder,
> > > > > > +                               bool enable)
> > > > > > +{
> > > > > > +   struct drm_i915_private *i915 = to_i915(intel_dig_port->base.base.dev);
> > > > > > +   int ret;
> > > > > > +
> > > > > > +   if (!enable)
> > > > > > +           usleep_range(6, 60); /* Bspec says >= 6us */
> > > > > > +
> > > > > > +   ret = intel_ddi_toggle_hdcp_signalling(&intel_dig_port->base,
> > > > > > +                                          cpu_transcoder, enable);
> > > > > Sean,
> > > > >
> > > > > This function toggles the TRANS_DDI_HDCP_SIGNALLING (9th)bit of TRANS_DDI_FUNC_CTL(tran)
> > > > > But in the hw specification this bit is mentioned to be ignored for non
> > > > > HDMI/DVI modes of the TRANS DDI.
> > > > >
> > > > > Any reason why we need this? Did you try with out this function?
> > > > >
> > >
> > > Under "Authentication Part 1 for Multi-stream DisplayPort", bspec says:
> > > 2. Select HDCP for the desired stream using the Pipe DDI Function
> > > Control register.
> > This is the 5th bit (Multistream HDCP Select) of Pipe DDI Function Control register i.e
> > TRANS_DDI_FUNC_CTL register. This bit ensures HDCP encryption to this transcoder stream when used in
> > multistream DisplayPort mode.
> > Unfortunately public specs of Gen11 has discrepency and doesn't describe this bit.
> > https://01.org/sites/default/files/documentation/intel-gfx-prm-osrc-icllp-vol02c-commandreference-registers-part2_0.pdf
> > Page No.1026 TRANS_DDI_FUNC_CTL
> > >
> > > > > Apart from that Patch looks good to me.
> > > > IMHO it seems we are still missing to enable the Multistream HDCP Select
> > > > bit (5) in TRANS_DDI_FUNC_CTL register which is required to enable the
> > > > stream encryption.
> > > >
> > >
> > > Could you send me some docs on this? I don't see have info on this bit.
> > This bit is not described in above mentioned public spec, but neither bit TRANS_DDI_HDCP_SIGNALLING bit (9th)
> > which used in this patch, what is the source of public B.spec you are following?
> 
> I think it's been removed from public now, but there was a public doc
> on Intel's site when I originally wrote these which described the
> TRANS_DDI_FUNC_CTL register.
> 
> So do I just need to set bit 5 at the same time as the HDCP SIGNALLING bit?
Yes that should be the ideal way with respect to B.Specs Documentation but
as you had already tested it and stream level encryption is confirmed via
QUERY_STREAM_ENCRYPTION_STATUS sideband message, considering that it is really confusing
whether HDCP select bit required to be set for each stream.
I feel based upon your test results this patch should be good to be merged.
if any iterative development will be required, it can be pursued later. 
Either way, 
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>  
> 
> Sean
> 
> > Thanks,
> > Anshuman Gupta.
> > >
> > > Sean
> > >
> > > > Thanks,
> > > > Anshuman Gupta.
> > > > >
> > > > > -Ram
> > > > >
> > > > > > +   if (ret)
> > > > > > +           drm_dbg_kms(&i915->drm, "%s HDCP signalling failed (%d)\n",
> > > > > > +                         enable ? "Enable" : "Disable", ret);
> > > > > > +   return ret;
> > > > > > +}
> > > > > > +
> > > > > > +static
> > > > > > +bool intel_dp_mst_hdcp_check_link(struct intel_digital_port *intel_dig_port,
> > > > > > +                             struct intel_connector *connector)
> > > > > > +{
> > > > > > +   struct drm_i915_private *i915 = to_i915(intel_dig_port->base.base.dev);
> > > > > > +   struct intel_dp *intel_dp = &intel_dig_port->dp;
> > > > > > +   struct drm_dp_query_stream_enc_status_ack_reply reply;
> > > > > > +   int ret;
> > > > > > +
> > > > > > +   if (!intel_dp_hdcp_check_link(intel_dig_port, connector))
> > > > > > +           return false;
> > > > > > +
> > > > > > +   ret = drm_dp_send_query_stream_enc_status(&intel_dp->mst_mgr,
> > > > > > +                                             connector->port, &reply);
> > > > > > +   if (ret) {
> > > > > > +           drm_dbg_kms(&i915->drm,
> > > > > > +                       "[CONNECTOR:%d:%s] failed QSES ret=%d\n",
> > > > > > +                       connector->base.base.id, connector->base.name, ret);
> > > > > > +           return false;
> > > > > > +   }
> > > > > > +
> > > > > > +   return reply.auth_completed && reply.encryption_enabled;
> > > > > > +}
> > > > > > +
> > > > > > +static const struct intel_hdcp_shim intel_dp_mst_hdcp_shim = {
> > > > > > +   .write_an_aksv = intel_dp_hdcp_write_an_aksv,
> > > > > > +   .read_bksv = intel_dp_hdcp_read_bksv,
> > > > > > +   .read_bstatus = intel_dp_hdcp_read_bstatus,
> > > > > > +   .repeater_present = intel_dp_hdcp_repeater_present,
> > > > > > +   .read_ri_prime = intel_dp_hdcp_read_ri_prime,
> > > > > > +   .read_ksv_ready = intel_dp_hdcp_read_ksv_ready,
> > > > > > +   .read_ksv_fifo = intel_dp_hdcp_read_ksv_fifo,
> > > > > > +   .read_v_prime_part = intel_dp_hdcp_read_v_prime_part,
> > > > > > +   .toggle_signalling = intel_dp_mst_hdcp_toggle_signalling,
> > > > > > +   .check_link = intel_dp_mst_hdcp_check_link,
> > > > > > +   .hdcp_capable = intel_dp_hdcp_capable,
> > > > > > +
> > > > > > +   .protocol = HDCP_PROTOCOL_DP,
> > > > > > +};
> > > > > > +
> > > > > >  int intel_dp_init_hdcp(struct intel_digital_port *intel_dig_port,
> > > > > >                    struct intel_connector *intel_connector)
> > > > > >  {
> > > > > > @@ -630,7 +691,10 @@ int intel_dp_init_hdcp(struct intel_digital_port *intel_dig_port,
> > > > > >     if (!is_hdcp_supported(dev_priv, port))
> > > > > >             return 0;
> > > > > >
> > > > > > -   if (!intel_dp_is_edp(intel_dp))
> > > > > > +   if (intel_connector->mst_port)
> > > > > > +           return intel_hdcp_init(intel_connector, port,
> > > > > > +                                  &intel_dp_mst_hdcp_shim);
> > > > > > +   else if (!intel_dp_is_edp(intel_dp))
> > > > > >             return intel_hdcp_init(intel_connector, port,
> > > > > >                                    &intel_dp_hdcp_shim);
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > > > > index 0675825dcc20..abaaeeb963d2 100644
> > > > > > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > > > > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > > > > @@ -37,6 +37,7 @@
> > > > > >  #include "intel_dp.h"
> > > > > >  #include "intel_dp_mst.h"
> > > > > >  #include "intel_dpio_phy.h"
> > > > > > +#include "intel_hdcp.h"
> > > > > >
> > > > > >  static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
> > > > > >                                         struct intel_crtc_state *crtc_state,
> > > > > > @@ -352,6 +353,8 @@ static void intel_mst_disable_dp(struct intel_atomic_state *state,
> > > > > >     drm_dbg_kms(&i915->drm, "active links %d\n",
> > > > > >                 intel_dp->active_mst_links);
> > > > > >
> > > > > > +   intel_hdcp_disable(intel_mst->connector);
> > > > > > +
> > > > > >     drm_dp_mst_reset_vcpi_slots(&intel_dp->mst_mgr, connector->port);
> > > > > >
> > > > > >     ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr);
> > > > > > @@ -548,6 +551,13 @@ static void intel_mst_enable_dp(struct intel_atomic_state *state,
> > > > > >
> > > > > >     if (pipe_config->has_audio)
> > > > > >             intel_audio_codec_enable(encoder, pipe_config, conn_state);
> > > > > > +
> > > > > > +   /* Enable hdcp if it's desired */
> > > > > > +   if (conn_state->content_protection ==
> > > > > > +       DRM_MODE_CONTENT_PROTECTION_DESIRED)
> > > > > > +           intel_hdcp_enable(to_intel_connector(conn_state->connector),
> > > > > > +                             pipe_config->cpu_transcoder,
> > > > > > +                             (u8)conn_state->hdcp_content_type);
> > > > > >  }
> > > > > >
> > > > > >  static bool intel_dp_mst_enc_get_hw_state(struct intel_encoder *encoder,
> > > > > > @@ -770,6 +780,14 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
> > > > > >     intel_attach_force_audio_property(connector);
> > > > > >     intel_attach_broadcast_rgb_property(connector);
> > > > > >
> > > > > > +
> > > > > > +   /* TODO: Figure out how to make HDCP work on GEN12+ */
> > > > > > +   if (INTEL_GEN(dev_priv) < 12) {
> > > > > > +           ret = intel_dp_init_hdcp(intel_dig_port, intel_connector);
> > > > > > +           if (ret)
> > > > > > +                   DRM_DEBUG_KMS("HDCP init failed, skipping.\n");
> > > > > > +   }
> > > > > > +
> > > > > >     /*
> > > > > >      * Reuse the prop from the SST connector because we're
> > > > > >      * not allowed to create new props after device registration.
> > > > > > diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > > > > > index 6bd0e4616ee1..ddc9db8de2bc 100644
> > > > > > --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > > > > > +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > > > > > @@ -2060,7 +2060,7 @@ int intel_hdcp_init(struct intel_connector *connector,
> > > > > >     if (!shim)
> > > > > >             return -EINVAL;
> > > > > >
> > > > > > -   if (is_hdcp2_supported(dev_priv))
> > > > > > +   if (is_hdcp2_supported(dev_priv) && !connector->mst_port)
> > > > > >             intel_hdcp2_init(connector, port, shim);
> > > > > >
> > > > > >     ret =
> > > > > > --
> > > > > > Sean Paul, Software Engineer, Google / Chromium OS
> > > > > >
> > > > > _______________________________________________
> > > > > Intel-gfx mailing list
> > > > > Intel-gfx@lists.freedesktop.org
> > > > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
