Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E195A2735
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 13:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC95910E872;
	Fri, 26 Aug 2022 11:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 739CD10E872;
 Fri, 26 Aug 2022 11:55:48 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 55EF42B3;
 Fri, 26 Aug 2022 13:55:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661514946;
 bh=CoIrbpAsb3zu6NDKEZO3wt2jfDF7X8uUgU/K7Zd78IU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u96dwNGGef6MZrLU/p0Pmq1VTjF5rLI2hDGXRfgPno8Iu/l70k3jM/YE4CD26G2qJ
 FgWqxDKXVtBiyUqYZZiSzDh1hAv+XGX2B7IiiAVyZegJCSSV4r0QzhQaI3g+evQye0
 BrAb7eH/j4uneainreMMNB6/LnuWYpOlEWTrjiK8=
Date: Fri, 26 Aug 2022 14:55:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [RFC] drm/bridge: adv7533: remove dynamic lane switching from
 adv7533 bridge
Message-ID: <Ywi0u4E5+MUx9wCk@pendragon.ideasonboard.com>
References: <1660005330-12369-1-git-send-email-quic_abhinavk@quicinc.com>
 <YvK4SpvF0zwtaIM9@pendragon.ideasonboard.com>
 <2933a555-d000-3fc3-5336-778238545b80@linaro.org>
 <ef88ed87-fd32-5c50-d220-fd43b238bd7c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef88ed87-fd32-5c50-d220-fd43b238bd7c@linaro.org>
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
Cc: jernej.skrabec@gmail.com, andrzej.hajda@intel.com, narmstrong@baylibre.com,
 airlied@linux.ie, sam@ravnborg.org, jonas@kwiboo.se,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, robert.foss@linaro.org,
 quic_jesszhan@quicinc.com, quic_aravindh@quicinc.com, colin.king@intel.com,
 freedreno@lists.freedesktop.org, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Fri, Aug 26, 2022 at 01:17:43PM +0300, Dmitry Baryshkov wrote:
> On 22/08/2022 19:31, Dmitry Baryshkov wrote:
> > On 09/08/2022 22:40, Laurent Pinchart wrote:
> >> On Mon, Aug 08, 2022 at 05:35:30PM -0700, Abhinav Kumar wrote:
> >>> adv7533 bridge tries to dynamically switch lanes based on the
> >>> mode by detaching and attaching the mipi dsi device.
> >>>
> >>> This approach is incorrect because as per the DSI spec the
> >>> number of lanes is fixed at the time of system design or initial
> >>> configuration and may not change dynamically.
> >>
> >> Is that really so ? The number of lanes connected on the board is
> >> certainlyset at design time, but a lower number of lanes can be used at
> >> runtime. It shouldn't change dynamically while the display is on, but it
> >> could change at mode set time.
> > 
> > I'm not sure if I interpreted the standard correctly, but I tended to 
> > have the same interpretation as Abhinav did.
> > 
> > Anyway, even if we allow the drivers to switch the amount of lanes, this 
> > should not happen in the form of detach()/attach() cycle. The drivers 

Agreed.

> > use mipi_dsi_attach() as way to signal the DSI hosts that the sink 
> > device is ready. Some of DSI hosts (including MSM one) would bind 
> > components from the attach callback.
> > 
> > If we were to support dynamically changing the amount of lanes, I would 
> > ask for additional mipi_dsi API call telling the host to switch the 
> > amount of lanes. And note that this can open the can of worms. Different 
> > hosts might have different requirements here. For example for the MSM 
> > platform the amount of lanes is programmed during bridge_pre_enable 
> > chain call, so it is possible to just set the amount of lanes following 
> > the msm_dsi_device::lanes. Other hosts might have other requirements.

Conceptually, I would expect the number of effective lanes to be
selected at mode set time, because it has to be done while the output is
disabled. With the atomic API for bridges the .mode_set() operation is
deprecated, so .pre_enable() sounds best, but there's a potential issue:
the .pre_enable() operation is called from sink to source. It means that
a DSI sink .pre_enable() operation would need to call a DSI host
operation to set (or maybe negotiate instead of just setting a fixed
value) the number of lanes first if it wants to control the sink through
DCS at .pre_enable() time. We'd have to see how that fits.

> > Thus said I'd suggest accepting this patch and maybe working on the 
> > API/support for the lane switching as a followup.

I don't have a personal need for the ADV7533 so I won't really complain
about any potential regression this may introduce (given that it fixes a
deadlock maybe things are completely broken already and nothing can
regress). I'd like to see this fixed though, doing it as a follow up is
too often a way to avoid doing it at all :-)

In any case, the commit message should be reworded to explain the
rationale and what needs to be done. Adding a TODO or FIXME comment in
the code would also help.

> Laurent, gracious ping for your response.

Done :-)

> >>> In addition this method of dynamic switch of detaching and
> >>> attaching the mipi dsi device also results in removing
> >>> and adding the component which is not necessary.
> >>
> >> Yes, that doesn't look good, and the .mode_valid() operation is
> >> definitely not the right point where to set the number of lanes.
> > 
> > .mode_set()?
> > 
> >>> This approach is also prone to deadlocks. So for example, on the
> >>> db410c whenever this path is executed with lockdep enabled,
> >>> this results in a deadlock due to below ordering of locks.
> > 
> > Even without the deadlock, we are pulling the whole DRM device from 
> > beneath the DSI panel by unbinding all the components. This is not going 
> > to work correctly.
> > 
> >>>
> >>> -> #1 (crtc_ww_class_acquire){+.+.}-{0:0}:
> >>>          lock_acquire+0x6c/0x90
> >>>          drm_modeset_acquire_init+0xf4/0x150
> >>>          drmm_mode_config_init+0x220/0x770
> >>>          msm_drm_bind+0x13c/0x654
> >>>          try_to_bring_up_aggregate_device+0x164/0x1d0
> >>>          __component_add+0xa8/0x174
> >>>          component_add+0x18/0x2c
> >>>          dsi_dev_attach+0x24/0x30
> >>>          dsi_host_attach+0x98/0x14c
> >>>          devm_mipi_dsi_attach+0x38/0xb0
> >>>          adv7533_attach_dsi+0x8c/0x110
> >>>          adv7511_probe+0x5a0/0x930
> >>>          i2c_device_probe+0x30c/0x350
> >>>          really_probe.part.0+0x9c/0x2b0
> >>>          __driver_probe_device+0x98/0x144
> >>>          driver_probe_device+0xac/0x14c
> >>>          __device_attach_driver+0xbc/0x124
> >>>          bus_for_each_drv+0x78/0xd0
> >>>          __device_attach+0xa8/0x1c0
> >>>          device_initial_probe+0x18/0x24
> >>>          bus_probe_device+0xa0/0xac
> >>>          deferred_probe_work_func+0x90/0xd0
> >>>          process_one_work+0x28c/0x6b0
> >>>          worker_thread+0x240/0x444
> >>>          kthread+0x110/0x114
> >>>          ret_from_fork+0x10/0x20
> >>>
> >>> -> #0 (component_mutex){+.+.}-{3:3}:
> >>>          __lock_acquire+0x1280/0x20ac
> >>>          lock_acquire.part.0+0xe0/0x230
> >>>          lock_acquire+0x6c/0x90
> >>>          __mutex_lock+0x84/0x400
> >>>          mutex_lock_nested+0x3c/0x70
> >>>          component_del+0x34/0x170
> >>>          dsi_dev_detach+0x24/0x30
> >>>          dsi_host_detach+0x20/0x64
> >>>          mipi_dsi_detach+0x2c/0x40
> >>>          adv7533_mode_set+0x64/0x90
> >>>          adv7511_bridge_mode_set+0x210/0x214
> >>>          drm_bridge_chain_mode_set+0x5c/0x84
> >>>          crtc_set_mode+0x18c/0x1dc
> >>>          drm_atomic_helper_commit_modeset_disables+0x40/0x50
> >>>          msm_atomic_commit_tail+0x1d0/0x6e0
> >>>          commit_tail+0xa4/0x180
> >>>          drm_atomic_helper_commit+0x178/0x3b0
> >>>          drm_atomic_commit+0xa4/0xe0
> >>>          drm_client_modeset_commit_atomic+0x228/0x284
> >>>          drm_client_modeset_commit_locked+0x64/0x1d0
> >>>          drm_client_modeset_commit+0x34/0x60
> >>>          drm_fb_helper_lastclose+0x74/0xcc
> >>>          drm_lastclose+0x3c/0x80
> >>>          drm_release+0xfc/0x114
> >>>          __fput+0x70/0x224
> >>>          ____fput+0x14/0x20
> >>>          task_work_run+0x88/0x1a0
> >>>          do_exit+0x350/0xa50
> >>>          do_group_exit+0x38/0xa4
> >>>          __wake_up_parent+0x0/0x34
> >>>          invoke_syscall+0x48/0x114
> >>>          el0_svc_common.constprop.0+0x60/0x11c
> >>>          do_el0_svc+0x30/0xc0
> >>>          el0_svc+0x58/0x100
> >>>          el0t_64_sync_handler+0x1b0/0x1bc
> >>>          el0t_64_sync+0x18c/0x190
> >>>
> >>> Due to above reasons, remove the dynamic lane switching
> >>> code from adv7533 bridge chip and filter out the modes
> >>> which would need different number of lanes as compared
> >>> to the initialization time using the mode_valid callback.
> >>>
> >>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>> ---
> >>>   drivers/gpu/drm/bridge/adv7511/adv7511.h     |  3 ++-
> >>>   drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 18 ++++++++++++++----
> >>>   drivers/gpu/drm/bridge/adv7511/adv7533.c     | 25 +++++++++++++------------
> >>>   3 files changed, 29 insertions(+), 17 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> >>> index 9e3bb8a8ee40..0a7cec80b75d 100644
> >>> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> >>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> >>> @@ -417,7 +417,8 @@ static inline int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
> >>>   void adv7533_dsi_power_on(struct adv7511 *adv);
> >>>   void adv7533_dsi_power_off(struct adv7511 *adv);
> >>> -void adv7533_mode_set(struct adv7511 *adv, const struct drm_display_mode *mode);
> >>> +enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
> >>> +        const struct drm_display_mode *mode);
> >>>   int adv7533_patch_registers(struct adv7511 *adv);
> >>>   int adv7533_patch_cec_registers(struct adv7511 *adv);
> >>>   int adv7533_attach_dsi(struct adv7511 *adv);
> >>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> >>> index 5bb9300040dd..1115ef9be83c 100644
> >>> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> >>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> >>> @@ -697,7 +697,7 @@ adv7511_detect(struct adv7511 *adv7511, struct drm_connector *connector)
> >>>   }
> >>>   static enum drm_mode_status adv7511_mode_valid(struct adv7511 *adv7511,
> >>> -                  struct drm_display_mode *mode)
> >>> +                  const struct drm_display_mode *mode)
> >>>   {
> >>>       if (mode->clock > 165000)
> >>>           return MODE_CLOCK_HIGH;
> >>> @@ -791,9 +791,6 @@ static void adv7511_mode_set(struct adv7511 *adv7511,
> >>>       regmap_update_bits(adv7511->regmap, 0x17,
> >>>           0x60, (vsync_polarity << 6) | (hsync_polarity << 5));
> >>> -    if (adv7511->type == ADV7533 || adv7511->type == ADV7535)
> >>> -        adv7533_mode_set(adv7511, adj_mode);
> >>> -
> >>>       drm_mode_copy(&adv7511->curr_mode, adj_mode);
> >>>       /*
> >>> @@ -913,6 +910,18 @@ static void adv7511_bridge_mode_set(struct drm_bridge *bridge,
> >>>       adv7511_mode_set(adv, mode, adj_mode);
> >>>   }
> >>> +static enum drm_mode_status adv7511_bridge_mode_valid(struct drm_bridge *bridge,
> >>> +        const struct drm_display_info *info,
> >>> +        const struct drm_display_mode *mode)
> >>> +{
> >>> +    struct adv7511 *adv = bridge_to_adv7511(bridge);
> >>> +
> >>> +    if (adv->type == ADV7533 || adv->type == ADV7535)
> >>> +        return adv7533_mode_valid(adv, mode);
> >>> +    else
> >>> +        return adv7511_mode_valid(adv, mode);
> >>> +}
> >>> +
> >>>   static int adv7511_bridge_attach(struct drm_bridge *bridge,
> >>>                    enum drm_bridge_attach_flags flags)
> >>>   {
> >>> @@ -960,6 +969,7 @@ static const struct drm_bridge_funcs 
> >>> adv7511_bridge_funcs = {
> >>>       .enable = adv7511_bridge_enable,
> >>>       .disable = adv7511_bridge_disable,
> >>>       .mode_set = adv7511_bridge_mode_set,
> >>> +    .mode_valid = adv7511_bridge_mode_valid,
> >>>       .attach = adv7511_bridge_attach,
> >>>       .detect = adv7511_bridge_detect,
> >>>       .get_edid = adv7511_bridge_get_edid,
> >>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> >>> index ef6270806d1d..4a6d45edf431 100644
> >>> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> >>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> >>> @@ -100,26 +100,27 @@ void adv7533_dsi_power_off(struct adv7511 *adv)
> >>>       regmap_write(adv->regmap_cec, 0x27, 0x0b);
> >>>   }
> >>> -void adv7533_mode_set(struct adv7511 *adv, const struct drm_display_mode *mode)
> >>> +enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
> >>> +        const struct drm_display_mode *mode)
> >>>   {
> >>> +    int lanes;
> >>>       struct mipi_dsi_device *dsi = adv->dsi;
> >>> -    int lanes, ret;
> >>> -
> >>> -    if (adv->num_dsi_lanes != 4)
> >>> -        return;
> >>>       if (mode->clock > 80000)
> >>>           lanes = 4;
> >>>       else
> >>>           lanes = 3;
> >>> -    if (lanes != dsi->lanes) {
> >>> -        mipi_dsi_detach(dsi);
> >>> -        dsi->lanes = lanes;
> >>> -        ret = mipi_dsi_attach(dsi);
> >>> -        if (ret)
> >>> -            dev_err(&dsi->dev, "failed to change host lanes\n");
> >>> -    }
> >>> +    /*
> >>> +     * number of lanes cannot be changed after initialization
> >>> +     * as per section 6.1 of the DSI specification. Hence filter
> >>> +     * out the modes which shall need different number of lanes
> >>> +     * than what was configured in the device tree.
> >>> +     */
> >>> +    if (lanes != dsi->lanes)
> >>> +        return MODE_BAD;
> >>> +
> >>> +    return MODE_OK;
> >>>   }
> >>>   int adv7533_patch_registers(struct adv7511 *adv)

-- 
Regards,

Laurent Pinchart
