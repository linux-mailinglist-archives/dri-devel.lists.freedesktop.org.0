Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73496861404
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 15:33:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 541F710EC20;
	Fri, 23 Feb 2024 14:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MpnPm1nv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 745AD10E102;
 Fri, 23 Feb 2024 14:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708698814; x=1740234814;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tGNYx0m7UkhplPnMiLrzE7CRx5l+XxhSaHTwj0/yLgE=;
 b=MpnPm1nvAodrv778Aa4QfcwMrzaeEKXxIv89+/qe8O/fdYGS3Ht254cF
 +EdOYWiBw7cfgMpNArPhZ3dGvQiPjn2TbEMoYrmQUcx1onW/9j/Mv+x21
 hwfHPrk2GO+E4yVapqQpr0SkhWycjxSSaKpbuUzCwFzcm86lL7EJNoKpT
 bvzBoYk2I852sVMsQFnBCPr2Hzg59yPkljqWb2IyLBV5+MpuobYNtz2z8
 g/AtCv0KFt3zAi4lnkT/Jo+mc3FIqeqYnPFxPuCFx44nJPrk8AlWjDcLF
 zeETeBQ3drMu0d/PDXwJgcF1ZHm+9EKnkOQZRoThUVYqa7X10Odo3xkOP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="13654526"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; d="scan'208";a="13654526"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 06:33:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; d="scan'208";a="10523213"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 06:33:24 -0800
Date: Fri, 23 Feb 2024 16:33:47 +0200
From: Imre Deak <imre.deak@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 02/21] drm/dp: Add support for DP tunneling
Message-ID: <ZdisywVy5fkxOv/S@ideak-desk.fi.intel.com>
References: <20240220211841.448846-1-imre.deak@intel.com>
 <20240220211841.448846-3-imre.deak@intel.com>
 <DM4PR11MB63606B27F3B003294D7D742EF4552@DM4PR11MB6360.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM4PR11MB63606B27F3B003294D7D742EF4552@DM4PR11MB6360.namprd11.prod.outlook.com>
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 23, 2024 at 08:25:38AM +0200, Shankar, Uma wrote:
> [...]
> > diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
> > index 09712b88a5b83..c0f56888c3280 100644
> > --- a/drivers/gpu/drm/display/Kconfig
> > +++ b/drivers/gpu/drm/display/Kconfig
> [...]
> > +struct drm_dp_tunnel {
> > +     struct drm_dp_tunnel_group *group;
> > +
> > +     struct list_head node;
> > +
> > +     struct kref kref;
> > +     struct ref_tracker *tracker;
> > +     struct drm_dp_aux *aux;
> > +     char name[8];
> > +
> > +     int bw_granularity;
> > +     int estimated_bw;
> > +     int allocated_bw;
> > +
> > +     int max_dprx_rate;
> > +     u8 max_dprx_lane_count;
> > +
> > +     u8 adapter_id;
> > +
> > +     bool bw_alloc_supported:1;
> > +     bool bw_alloc_enabled:1;
> > +     bool has_io_error:1;
> > +     bool destroyed:1;
> > +};
> > +
> > +struct drm_dp_tunnel_group_state;
> > +
> > +struct drm_dp_tunnel_state {
> > +     struct drm_dp_tunnel_group_state *group_state;
> > +
> > +     struct drm_dp_tunnel_ref tunnel_ref;
> > +
> > +     struct list_head node;
> > +
> > +     u32 stream_mask;
> > +     int *stream_bw;
> > +};
> > +
> > +struct drm_dp_tunnel_group_state {
> > +     struct drm_private_state base;
> > +
> > +     struct list_head tunnel_states;
> > +};
> > +
> > +struct drm_dp_tunnel_group {
> > +     struct drm_private_obj base;
> > +     struct drm_dp_tunnel_mgr *mgr;
> > +
> > +     struct list_head tunnels;
> > +
> > +     /* available BW including the allocated_bw of all tunnels in the group */
> > +     int available_bw;
> > +     u8 drv_group_id;
> > +
> > +     char name[8];
> > +
> 
> We can drop these line gaps.

Those are used in general to keep related fields together, but the above
three fields could be better grouped, can do that.

> > +     bool active:1;
> > +};
> > +
> > +struct drm_dp_tunnel_mgr {
> > +     struct drm_device *dev;
> > +
> > +     int group_count;
> > +     struct drm_dp_tunnel_group *groups;
> > +     wait_queue_head_t bw_req_queue;
> > +
> > +#ifdef CONFIG_DRM_DISPLAY_DEBUG_DP_TUNNEL_STATE
> > +     struct ref_tracker_dir ref_tracker;
> > +#endif
> > +};
> > +
> > + [...]
> > +/* Return granularity in kB/s units */
> > +static int tunnel_reg_bw_granularity(const struct drm_dp_tunnel_regs *regs)
> > +{
> > +     int gr = tunnel_reg(regs, DP_BW_GRANULARITY) &
> > DP_BW_GRANULARITY_MASK;
> > +
> > +     WARN_ON(gr > 2);
> > +
> 
> I think it should fail as well along with WARN, > 2 is not supported.
> However, this situation is highly unlikely though.

Yes, validating this in tunnel_regs_are_valid() is missing, will add
that.

> > +     return (250000 << gr) / 8;
> [...]
> > +
> > +static int check_and_clear_status_change(struct drm_dp_tunnel *tunnel)
> > +{
> > +     u8 mask = DP_BW_ALLOCATION_CAPABILITY_CHANGED | DP_ESTIMATED_BW_CHANGED;
> > +     u8 val;
> > +
> > +     if (drm_dp_dpcd_readb(tunnel->aux, DP_TUNNELING_STATUS, &val) < 0)
> > +             goto out_err;
> > +
> > +     val &= mask;
> > +
> > +     if (val) {
> > +             if (drm_dp_dpcd_writeb(tunnel->aux, DP_TUNNELING_STATUS, val) < 0)
> > +                     goto out_err;
> > +
> > +             return 1;
> 
> Seems this return value is not considered by the caller.

It indicates a status change and handled accordingly by the caller.
Probably it's better to document this, can add that.

> Hi Imre,
> Overall changes look good to me.
> It would be ideal if we can break this patch down, no major concern though.
> Leaving to your judgment.

The current way adds the DRM/i915 specific support separately, each
adding one .c file, the rest of the patchset taking these into use, each
patch doing this for a given scope of functionality. Didn't have a
better idea, maybe the DPCD registers could be added separately, but not
sure if that would make reviewing easier.

> With some above minor nits addressed, this is
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> 
> Note: Have checked the register definitions/addresses, offsets. Have Logically checked the code
> in general, as well. It would be good if tunnel manager and tunnel groups related logic can be double
> confirmed by someone. Having said that, no issue I could spot there.

Thanks.

> Regards,
> Uma Shankar
> 
> > +     }
> > +
> > +     if (!drm_dp_tunnel_bw_alloc_is_enabled(tunnel))
> > +             return 0;
> > +
> > +     /*
> > +      * Check for estimated BW changes explicitly to account for lost
> > +      * BW change notifications.
> > +      */
> > +     if (drm_dp_dpcd_readb(tunnel->aux, DP_ESTIMATED_BW, &val) < 0)
> > +             goto out_err;
> > +
> > +     if (val * tunnel->bw_granularity != tunnel->estimated_bw)
> > +             return 1;
> > +
> > +     return 0;
> > +
> > +out_err:
> > +     drm_dp_tunnel_set_io_error(tunnel);
> > +
> > +     return -EIO;
> > +}
> > +
> > +/**
> > + * drm_dp_tunnel_update_state - Update DP tunnel SW state with the HW state
> > + * @tunnel: Tunnel object
> > + *
> > + * Update the SW state of @tunnel with the HW state.
> > + *
> > + * Returns 0 if the state has not changed, 1 if it has changed and got updated
> > + * successfully and a negative error code otherwise.
> > + */
> > +int drm_dp_tunnel_update_state(struct drm_dp_tunnel *tunnel)
> > +{
> > +     struct drm_dp_tunnel_regs regs;
> > +     bool changed = false;
> > +     int ret;
> > +
> > +     ret = check_tunnel(tunnel);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ret = check_and_clear_status_change(tunnel);
> > +     if (ret < 0)
> > +             goto out;
> > +
> > +     if (!ret)
> > +             return 0;
> > +
> > +     ret = read_and_verify_tunnel_regs(tunnel, &regs, 0);
> > +     if (ret)
> > +             goto out;
> > +
> > +     if (update_dprx_caps(tunnel, &regs))
> > +             changed = true;
> > +
> > +     ret = update_group_available_bw(tunnel, &regs);
> > +     if (ret == 1)
> > +             changed = true;
> > +
> > +out:
> > +     tun_dbg_stat(tunnel, ret < 0 ? ret : 0,
> > +                  "State update: Changed:%s DPRX:%dx%d Tunnel alloc:%d/%d
> > Group alloc:%d/%d Mb/s",
> > +                  str_yes_no(changed),
> > +                  tunnel->max_dprx_rate / 100, tunnel->max_dprx_lane_count,
> > +                  DPTUN_BW_ARG(tunnel->allocated_bw),
> > +                  DPTUN_BW_ARG(get_max_tunnel_bw(tunnel)),
> > +                  DPTUN_BW_ARG(group_allocated_bw(tunnel->group)),
> > +                  DPTUN_BW_ARG(tunnel->group->available_bw));
> > +
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     if (changed)
> > +             return 1;
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL(drm_dp_tunnel_update_state);
> > +
> > +/*
> > + * drm_dp_tunnel_handle_irq - Handle DP tunnel IRQs
> > + *
> > + * Handle any pending DP tunnel IRQs, waking up waiters for a completion
> > + * event.
> > + *
> > + * Returns 1 if the state of the tunnel has changed which requires calling
> > + * drm_dp_tunnel_update_state(), a negative error code in case of a failure,
> > + * 0 otherwise.
> > + */
> > +int drm_dp_tunnel_handle_irq(struct drm_dp_tunnel_mgr *mgr, struct
> > drm_dp_aux *aux)
> > +{
> > +     u8 val;
> > +
> > +     if (drm_dp_dpcd_readb(aux, DP_TUNNELING_STATUS, &val) < 0)
> > +             return -EIO;
> > +
> > +     if (val & (DP_BW_REQUEST_SUCCEEDED | DP_BW_REQUEST_FAILED))
> > +             wake_up_all(&mgr->bw_req_queue);
> > +
> > +     if (val & (DP_BW_ALLOCATION_CAPABILITY_CHANGED |
> > DP_ESTIMATED_BW_CHANGED))
> > +             return 1;
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL(drm_dp_tunnel_handle_irq);
> > +
> > +/**
> > + * drm_dp_tunnel_max_dprx_rate - Query the maximum rate of the tunnel's
> > DPRX
> > + * @tunnel: Tunnel object
> > + *
> > + * The function is used to query the maximum link rate of the DPRX connected
> > + * to @tunnel. Note that this rate will not be limited by the BW limit of the
> > + * tunnel, as opposed to the standard and extended DP_MAX_LINK_RATE DPCD
> > + * registers.
> > + *
> > + * Returns the maximum link rate in 10 kbit/s units.
> > + */
> > +int drm_dp_tunnel_max_dprx_rate(const struct drm_dp_tunnel *tunnel)
> > +{
> > +     return tunnel->max_dprx_rate;
> > +}
> > +EXPORT_SYMBOL(drm_dp_tunnel_max_dprx_rate);
> > +
> > +/**
> > + * drm_dp_tunnel_max_dprx_lane_count - Query the maximum lane count of
> > the tunnel's DPRX
> > + * @tunnel: Tunnel object
> > + *
> > + * The function is used to query the maximum lane count of the DPRX connected
> > + * to @tunnel. Note that this lane count will not be limited by the BW limit of
> > + * the tunnel, as opposed to the standard and extended DP_MAX_LANE_COUNT
> > DPCD
> > + * registers.
> > + *
> > + * Returns the maximum lane count.
> > + */
> > +int drm_dp_tunnel_max_dprx_lane_count(const struct drm_dp_tunnel *tunnel)
> > +{
> > +     return tunnel->max_dprx_lane_count;
> > +}
> > +EXPORT_SYMBOL(drm_dp_tunnel_max_dprx_lane_count);
> > +
> > +/**
> > + * drm_dp_tunnel_available_bw - Query the estimated total available BW of the
> > tunnel
> > + * @tunnel: Tunnel object
> > + *
> > + * This function is used to query the estimated total available BW of the
> > + * tunnel. This includes the currently allocated and free BW for all the
> > + * tunnels in @tunnel's group. The available BW is valid only after the BW
> > + * allocation mode has been enabled for the tunnel and its state got updated
> > + * calling drm_dp_tunnel_update_state().
> > + *
> > + * Returns the @tunnel group's estimated total available bandwidth in kB/s
> > + * units, or -1 if the available BW isn't valid (the BW allocation mode is
> > + * not enabled or the tunnel's state hasn't been updated).
> > + */
> > +int drm_dp_tunnel_available_bw(const struct drm_dp_tunnel *tunnel)
> > +{
> > +     return tunnel->group->available_bw;
> > +}
> > +EXPORT_SYMBOL(drm_dp_tunnel_available_bw);
> > +
> > +static struct drm_dp_tunnel_group_state *
> > +drm_dp_tunnel_atomic_get_group_state(struct drm_atomic_state *state,
> > +                                  const struct drm_dp_tunnel *tunnel)
> > +{
> > +     return (struct drm_dp_tunnel_group_state *)
> > +             drm_atomic_get_private_obj_state(state,
> > +                                              &tunnel->group->base);
> > +}
> > +
> > +static struct drm_dp_tunnel_state *
> > +add_tunnel_state(struct drm_dp_tunnel_group_state *group_state,
> > +              struct drm_dp_tunnel *tunnel)
> > +{
> > +     struct drm_dp_tunnel_state *tunnel_state;
> > +
> > +     tun_dbg_atomic(tunnel,
> > +                    "Adding state for tunnel %p to group state %p\n",
> > +                    tunnel, group_state);
> > +
> > +     tunnel_state = kzalloc(sizeof(*tunnel_state), GFP_KERNEL);
> > +     if (!tunnel_state)
> > +             return NULL;
> > +
> > +     tunnel_state->group_state = group_state;
> > +
> > +     drm_dp_tunnel_ref_get(tunnel, &tunnel_state->tunnel_ref);
> > +
> > +     INIT_LIST_HEAD(&tunnel_state->node);
> > +     list_add(&tunnel_state->node, &group_state->tunnel_states);
> > +
> > +     return tunnel_state;
> > +}
> > +
> > +static void free_tunnel_state(struct drm_dp_tunnel_state *tunnel_state)
> > +{
> > +     tun_dbg_atomic(tunnel_state->tunnel_ref.tunnel,
> > +                    "Freeing state for tunnel %p\n",
> > +                    tunnel_state->tunnel_ref.tunnel);
> > +
> > +     list_del(&tunnel_state->node);
> > +
> > +     kfree(tunnel_state->stream_bw);
> > +     drm_dp_tunnel_ref_put(&tunnel_state->tunnel_ref);
> > +
> > +     kfree(tunnel_state);
> > +}
> > +
> > +static void free_group_state(struct drm_dp_tunnel_group_state *group_state)
> > +{
> > +     struct drm_dp_tunnel_state *tunnel_state;
> > +     struct drm_dp_tunnel_state *tunnel_state_tmp;
> > +
> > +     for_each_tunnel_state_safe(group_state, tunnel_state,
> > tunnel_state_tmp)
> > +             free_tunnel_state(tunnel_state);
> > +
> > +     kfree(group_state);
> > +}
> > +
> > +static struct drm_dp_tunnel_state *
> > +get_tunnel_state(struct drm_dp_tunnel_group_state *group_state,
> > +              const struct drm_dp_tunnel *tunnel)
> > +{
> > +     struct drm_dp_tunnel_state *tunnel_state;
> > +
> > +     for_each_tunnel_state(group_state, tunnel_state)
> > +             if (tunnel_state->tunnel_ref.tunnel == tunnel)
> > +                     return tunnel_state;
> > +
> > +     return NULL;
> > +}
> > +
> > +static struct drm_dp_tunnel_state *
> > +get_or_add_tunnel_state(struct drm_dp_tunnel_group_state *group_state,
> > +                     struct drm_dp_tunnel *tunnel)
> > +{
> > +     struct drm_dp_tunnel_state *tunnel_state;
> > +
> > +     tunnel_state = get_tunnel_state(group_state, tunnel);
> > +     if (tunnel_state)
> > +             return tunnel_state;
> > +
> > +     return add_tunnel_state(group_state, tunnel);
> > +}
> > +
> > +static struct drm_private_state *
> > +tunnel_group_duplicate_state(struct drm_private_obj *obj)
> > +{
> > +     struct drm_dp_tunnel_group_state *group_state;
> > +     struct drm_dp_tunnel_state *tunnel_state;
> > +
> > +     group_state = kzalloc(sizeof(*group_state), GFP_KERNEL);
> > +     if (!group_state)
> > +             return NULL;
> > +
> > +     INIT_LIST_HEAD(&group_state->tunnel_states);
> > +
> > +     __drm_atomic_helper_private_obj_duplicate_state(obj, &group_state-
> > >base);
> > +
> > +     for_each_tunnel_state(to_group_state(obj->state), tunnel_state) {
> > +             struct drm_dp_tunnel_state *new_tunnel_state;
> > +
> > +             new_tunnel_state = get_or_add_tunnel_state(group_state,
> > +                                                        tunnel_state-
> > >tunnel_ref.tunnel);
> > +             if (!new_tunnel_state)
> > +                     goto out_free_state;
> > +
> > +             new_tunnel_state->stream_mask = tunnel_state-
> > >stream_mask;
> > +             new_tunnel_state->stream_bw = kmemdup(tunnel_state-
> > >stream_bw,
> > +                                                   sizeof(*tunnel_state-
> > >stream_bw) *
> > +
> >       hweight32(tunnel_state->stream_mask),
> > +                                                   GFP_KERNEL);
> > +
> > +             if (!new_tunnel_state->stream_bw)
> > +                     goto out_free_state;
> > +     }
> > +
> > +     return &group_state->base;
> > +
> > +out_free_state:
> > +     free_group_state(group_state);
> > +
> > +     return NULL;
> > +}
> > +
> > +static void tunnel_group_destroy_state(struct drm_private_obj *obj, struct
> > drm_private_state *state)
> > +{
> > +     free_group_state(to_group_state(state));
> > +}
> > +
> > +static const struct drm_private_state_funcs tunnel_group_funcs = {
> > +     .atomic_duplicate_state = tunnel_group_duplicate_state,
> > +     .atomic_destroy_state = tunnel_group_destroy_state,
> > +};
> > +
> > +/**
> > + * drm_dp_tunnel_atomic_get_state - get/allocate the new atomic state for a
> > tunnel
> > + * @state: Atomic state
> > + * @tunnel: Tunnel to get the state for
> > + *
> > + * Get the new atomic state for @tunnel, duplicating it from the old tunnel
> > + * state if not yet allocated.
> > + *
> > + * Return the state or an ERR_PTR() error on failure.
> > + */
> > +struct drm_dp_tunnel_state *
> > +drm_dp_tunnel_atomic_get_state(struct drm_atomic_state *state,
> > +                            struct drm_dp_tunnel *tunnel)
> > +{
> > +     struct drm_dp_tunnel_group_state *group_state;
> > +     struct drm_dp_tunnel_state *tunnel_state;
> > +
> > +     group_state = drm_dp_tunnel_atomic_get_group_state(state, tunnel);
> > +     if (IS_ERR(group_state))
> > +             return ERR_CAST(group_state);
> > +
> > +     tunnel_state = get_or_add_tunnel_state(group_state, tunnel);
> > +     if (!tunnel_state)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     return tunnel_state;
> > +}
> > +EXPORT_SYMBOL(drm_dp_tunnel_atomic_get_state);
> > +
> > +/**
> > + * drm_dp_tunnel_atomic_get_old_state - get the old atomic state for a tunnel
> > + * @state: Atomic state
> > + * @tunnel: Tunnel to get the state for
> > + *
> > + * Get the old atomic state for @tunnel.
> > + *
> > + * Return the old state or NULL if the tunnel's atomic state is not in @state.
> > + */
> > +struct drm_dp_tunnel_state *
> > +drm_dp_tunnel_atomic_get_old_state(struct drm_atomic_state *state,
> > +                                const struct drm_dp_tunnel *tunnel)
> > +{
> > +     struct drm_dp_tunnel_group_state *old_group_state;
> > +     int i;
> > +
> > +     for_each_old_group_in_state(state, old_group_state, i)
> > +             if (to_group(old_group_state->base.obj) == tunnel->group)
> > +                     return get_tunnel_state(old_group_state, tunnel);
> > +
> > +     return NULL;
> > +}
> > +EXPORT_SYMBOL(drm_dp_tunnel_atomic_get_old_state);
> > +
> > +/**
> > + * drm_dp_tunnel_atomic_get_new_state - get the new atomic state for a
> > tunnel
> > + * @state: Atomic state
> > + * @tunnel: Tunnel to get the state for
> > + *
> > + * Get the new atomic state for @tunnel.
> > + *
> > + * Return the new state or NULL if the tunnel's atomic state is not in @state.
> > + */
> > +struct drm_dp_tunnel_state *
> > +drm_dp_tunnel_atomic_get_new_state(struct drm_atomic_state *state,
> > +                                const struct drm_dp_tunnel *tunnel)
> > +{
> > +     struct drm_dp_tunnel_group_state *new_group_state;
> > +     int i;
> > +
> > +     for_each_new_group_in_state(state, new_group_state, i)
> > +             if (to_group(new_group_state->base.obj) == tunnel->group)
> > +                     return get_tunnel_state(new_group_state, tunnel);
> > +
> > +     return NULL;
> > +}
> > +EXPORT_SYMBOL(drm_dp_tunnel_atomic_get_new_state);
> > +
> > +static bool init_group(struct drm_dp_tunnel_mgr *mgr, struct
> > drm_dp_tunnel_group *group)
> > +{
> > +     struct drm_dp_tunnel_group_state *group_state;
> > +
> > +     group_state = kzalloc(sizeof(*group_state), GFP_KERNEL);
> > +     if (!group_state)
> > +             return false;
> > +
> > +     INIT_LIST_HEAD(&group_state->tunnel_states);
> > +
> > +     group->mgr = mgr;
> > +     group->available_bw = -1;
> > +     INIT_LIST_HEAD(&group->tunnels);
> > +
> > +     drm_atomic_private_obj_init(mgr->dev, &group->base, &group_state-
> > >base,
> > +                                 &tunnel_group_funcs);
> > +
> > +     return true;
> > +}
> > +
> > +static void cleanup_group(struct drm_dp_tunnel_group *group)
> > +{
> > +     drm_atomic_private_obj_fini(&group->base);
> > +}
> > +
> > +#ifdef CONFIG_DRM_DISPLAY_DEBUG_DP_TUNNEL_STATE
> > +static void check_unique_stream_ids(const struct drm_dp_tunnel_group_state
> > *group_state)
> > +{
> > +     const struct drm_dp_tunnel_state *tunnel_state;
> > +     u32 stream_mask = 0;
> > +
> > +     for_each_tunnel_state(group_state, tunnel_state) {
> > +             drm_WARN(to_group(group_state->base.obj)->mgr->dev,
> > +                      tunnel_state->stream_mask & stream_mask,
> > +                      "[DPTUN %s]: conflicting stream IDs %x (IDs in other
> > tunnels %x)\n",
> > +                      tunnel_state->tunnel_ref.tunnel->name,
> > +                      tunnel_state->stream_mask,
> > +                      stream_mask);
> > +
> > +             stream_mask |= tunnel_state->stream_mask;
> > +     }
> > +}
> > +#else
> > +static void check_unique_stream_ids(const struct drm_dp_tunnel_group_state
> > *group_state)
> > +{
> > +}
> > +#endif
> > +
> > +static int stream_id_to_idx(u32 stream_mask, u8 stream_id)
> > +{
> > +     return hweight32(stream_mask & (BIT(stream_id) - 1));
> > +}
> > +
> > +static int resize_bw_array(struct drm_dp_tunnel_state *tunnel_state,
> > +                        unsigned long old_mask, unsigned long new_mask)
> > +{
> > +     unsigned long move_mask = old_mask & new_mask;
> > +     int *new_bws = NULL;
> > +     int id;
> > +
> > +     WARN_ON(!new_mask);
> > +
> > +     if (old_mask == new_mask)
> > +             return 0;
> > +
> > +     new_bws = kcalloc(hweight32(new_mask), sizeof(*new_bws),
> > GFP_KERNEL);
> > +     if (!new_bws)
> > +             return -ENOMEM;
> > +
> > +     for_each_set_bit(id, &move_mask, BITS_PER_TYPE(move_mask))
> > +             new_bws[stream_id_to_idx(new_mask, id)] =
> > +                     tunnel_state->stream_bw[stream_id_to_idx(old_mask,
> > id)];
> > +
> > +     kfree(tunnel_state->stream_bw);
> > +     tunnel_state->stream_bw = new_bws;
> > +     tunnel_state->stream_mask = new_mask;
> > +
> > +     return 0;
> > +}
> > +
> > +static int set_stream_bw(struct drm_dp_tunnel_state *tunnel_state,
> > +                      u8 stream_id, int bw)
> > +{
> > +     int err;
> > +
> > +     err = resize_bw_array(tunnel_state,
> > +                           tunnel_state->stream_mask,
> > +                           tunnel_state->stream_mask | BIT(stream_id));
> > +     if (err)
> > +             return err;
> > +
> > +     tunnel_state->stream_bw[stream_id_to_idx(tunnel_state-
> > >stream_mask, stream_id)] = bw;
> > +
> > +     return 0;
> > +}
> > +
> > +static int clear_stream_bw(struct drm_dp_tunnel_state *tunnel_state,
> > +                        u8 stream_id)
> > +{
> > +     if (!(tunnel_state->stream_mask & ~BIT(stream_id))) {
> > +             free_tunnel_state(tunnel_state);
> > +             return 0;
> > +     }
> > +
> > +     return resize_bw_array(tunnel_state,
> > +                            tunnel_state->stream_mask,
> > +                            tunnel_state->stream_mask & ~BIT(stream_id));
> > +}
> > +
> > +/**
> > + * drm_dp_tunnel_atomic_set_stream_bw - Set the BW for a DP tunnel stream
> > + * @state: Atomic state
> > + * @tunnel: DP tunnel containing the stream
> > + * @stream_id: Stream ID
> > + * @bw: BW of the stream
> > + *
> > + * Set a DP tunnel stream's required BW in the atomic state.
> > + *
> > + * Returns 0 in case of success, a negative error code otherwise.
> > + */
> > +int drm_dp_tunnel_atomic_set_stream_bw(struct drm_atomic_state *state,
> > +                                    struct drm_dp_tunnel *tunnel,
> > +                                    u8 stream_id, int bw)
> > +{
> > +     struct drm_dp_tunnel_group_state *new_group_state;
> > +     struct drm_dp_tunnel_state *tunnel_state;
> > +     int err;
> > +
> > +     if (drm_WARN_ON(tunnel->group->mgr->dev,
> > +                     stream_id > BITS_PER_TYPE(tunnel_state-
> > >stream_mask)))
> > +             return -EINVAL;
> > +
> > +     tun_dbg(tunnel,
> > +             "Setting %d Mb/s for stream %d\n",
> > +             DPTUN_BW_ARG(bw), stream_id);
> > +
> > +     new_group_state = drm_dp_tunnel_atomic_get_group_state(state,
> > tunnel);
> > +     if (IS_ERR(new_group_state))
> > +             return PTR_ERR(new_group_state);
> > +
> > +     if (bw == 0) {
> > +             tunnel_state = get_tunnel_state(new_group_state, tunnel);
> > +             if (!tunnel_state)
> > +                     return 0;
> > +
> > +             return clear_stream_bw(tunnel_state, stream_id);
> > +     }
> > +
> > +     tunnel_state = get_or_add_tunnel_state(new_group_state, tunnel);
> > +     if (drm_WARN_ON(state->dev, !tunnel_state))
> > +             return -EINVAL;
> > +
> > +     err = set_stream_bw(tunnel_state, stream_id, bw);
> > +     if (err)
> > +             return err;
> > +
> > +     check_unique_stream_ids(new_group_state);
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL(drm_dp_tunnel_atomic_set_stream_bw);
> > +
> > +/**
> > + * drm_dp_tunnel_atomic_get_required_bw - Get the BW required by a DP
> > tunnel
> > + * @tunnel_state: Atomic state of the queried tunnel
> > + *
> > + * Calculate the BW required by a tunnel adding up the required BW of all
> > + * the streams in the tunnel.
> > + *
> > + * Return the total BW required by the tunnel.
> > + */
> > +int drm_dp_tunnel_atomic_get_required_bw(const struct drm_dp_tunnel_state
> > *tunnel_state)
> > +{
> > +     int tunnel_bw = 0;
> > +     int i;
> > +
> > +     if (!tunnel_state || !tunnel_state->stream_mask)
> > +             return 0;
> > +
> > +     for (i = 0; i < hweight32(tunnel_state->stream_mask); i++)
> > +             tunnel_bw += tunnel_state->stream_bw[i];
> > +
> > +     return tunnel_bw;
> > +}
> > +EXPORT_SYMBOL(drm_dp_tunnel_atomic_get_required_bw);
> > +
> > +/**
> > + * drm_dp_tunnel_atomic_get_group_streams_in_state - Get mask of stream
> > IDs in a group
> > + * @state: Atomic state
> > + * @tunnel: Tunnel object
> > + * @stream_mask: Mask of streams in @tunnel's group
> > + *
> > + * Get the mask of all the stream IDs in the tunnel group of @tunnel.
> > + *
> > + * Return 0 in case of success - with the stream IDs in @stream_mask - or a
> > + * negative error code in case of failure.
> > + */
> > +int drm_dp_tunnel_atomic_get_group_streams_in_state(struct
> > drm_atomic_state *state,
> > +                                                 const struct drm_dp_tunnel
> > *tunnel,
> > +                                                 u32 *stream_mask)
> > +{
> > +     struct drm_dp_tunnel_group_state *group_state;
> > +     struct drm_dp_tunnel_state *tunnel_state;
> > +
> > +     group_state = drm_dp_tunnel_atomic_get_group_state(state, tunnel);
> > +     if (IS_ERR(group_state))
> > +             return PTR_ERR(group_state);
> > +
> > +     *stream_mask = 0;
> > +     for_each_tunnel_state(group_state, tunnel_state)
> > +             *stream_mask |= tunnel_state->stream_mask;
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL(drm_dp_tunnel_atomic_get_group_streams_in_state);
> > +
> > +static int
> > +drm_dp_tunnel_atomic_check_group_bw(struct drm_dp_tunnel_group_state
> > *new_group_state,
> > +                                 u32 *failed_stream_mask)
> > +{
> > +     struct drm_dp_tunnel_group *group = to_group(new_group_state-
> > >base.obj);
> > +     struct drm_dp_tunnel_state *new_tunnel_state;
> > +     u32 group_stream_mask = 0;
> > +     int group_bw = 0;
> > +
> > +     for_each_tunnel_state(new_group_state, new_tunnel_state) {
> > +             struct drm_dp_tunnel *tunnel = new_tunnel_state-
> > >tunnel_ref.tunnel;
> > +             int max_dprx_bw = get_max_dprx_bw(tunnel);
> > +             int tunnel_bw =
> > drm_dp_tunnel_atomic_get_required_bw(new_tunnel_state);
> > +
> > +             tun_dbg(tunnel,
> > +                     "%sRequired %d/%d Mb/s total for tunnel.\n",
> > +                     tunnel_bw > max_dprx_bw ? "Not enough BW: " : "",
> > +                     DPTUN_BW_ARG(tunnel_bw),
> > +                     DPTUN_BW_ARG(max_dprx_bw));
> > +
> > +             if (tunnel_bw > max_dprx_bw) {
> > +                     *failed_stream_mask = new_tunnel_state-
> > >stream_mask;
> > +                     return -ENOSPC;
> > +             }
> > +
> > +             group_bw += min(roundup(tunnel_bw, tunnel->bw_granularity),
> > +                             max_dprx_bw);
> > +             group_stream_mask |= new_tunnel_state->stream_mask;
> > +     }
> > +
> > +     tun_grp_dbg(group,
> > +                 "%sRequired %d/%d Mb/s total for tunnel group.\n",
> > +                 group_bw > group->available_bw ? "Not enough BW: " : "",
> > +                 DPTUN_BW_ARG(group_bw),
> > +                 DPTUN_BW_ARG(group->available_bw));
> > +
> > +     if (group_bw > group->available_bw) {
> > +             *failed_stream_mask = group_stream_mask;
> > +             return -ENOSPC;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +/**
> > + * drm_dp_tunnel_atomic_check_stream_bws - Check BW limit for all streams
> > in state
> > + * @state: Atomic state
> > + * @failed_stream_mask: Mask of stream IDs with a BW limit failure
> > + *
> > + * Check the required BW of each DP tunnel in @state against both the DPRX
> > BW
> > + * limit of the tunnel and the BW limit of the tunnel group. Return a mask of
> > + * stream IDs in @failed_stream_mask once a check fails. The mask will contain
> > + * either all the streams in a tunnel (in case a DPRX BW limit check failed) or
> > + * all the streams in a tunnel group (in case a group BW limit check failed).
> > + *
> > + * Return 0 if all the BW limit checks passed, -ENOSPC in case a BW limit
> > + * check failed - with @failed_stream_mask containing the streams failing the
> > + * check - or a negative error code otherwise.
> > + */
> > +int drm_dp_tunnel_atomic_check_stream_bws(struct drm_atomic_state *state,
> > +                                       u32 *failed_stream_mask)
> > +{
> > +     struct drm_dp_tunnel_group_state *new_group_state;
> > +     int i;
> > +
> > +     for_each_new_group_in_state(state, new_group_state, i) {
> > +             int ret;
> > +
> > +             ret =
> > drm_dp_tunnel_atomic_check_group_bw(new_group_state,
> > +                                                       failed_stream_mask);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL(drm_dp_tunnel_atomic_check_stream_bws);
> > +
> > +static void destroy_mgr(struct drm_dp_tunnel_mgr *mgr)
> > +{
> > +     int i;
> > +
> > +     for (i = 0; i < mgr->group_count; i++) {
> > +             cleanup_group(&mgr->groups[i]);
> > +             drm_WARN_ON(mgr->dev, !list_empty(&mgr-
> > >groups[i].tunnels));
> > +     }
> > +
> > +#ifdef CONFIG_DRM_DISPLAY_DEBUG_DP_TUNNEL_STATE
> > +     ref_tracker_dir_exit(&mgr->ref_tracker);
> > +#endif
> > +
> > +     kfree(mgr->groups);
> > +     kfree(mgr);
> > +}
> > +
> > +/**
> > + * drm_dp_tunnel_mgr_create - Create a DP tunnel manager
> > + * @dev: DRM device object
> > + *
> > + * Creates a DP tunnel manager for @dev.
> > + *
> > + * Returns a pointer to the tunnel manager if created successfully or NULL in
> > + * case of an error.
> > + */
> > +struct drm_dp_tunnel_mgr *
> > +drm_dp_tunnel_mgr_create(struct drm_device *dev, int max_group_count)
> > +{
> > +     struct drm_dp_tunnel_mgr *mgr;
> > +     int i;
> > +
> > +     mgr = kzalloc(sizeof(*mgr), GFP_KERNEL);
> > +     if (!mgr)
> > +             return NULL;
> > +
> > +     mgr->dev = dev;
> > +     init_waitqueue_head(&mgr->bw_req_queue);
> > +
> > +     mgr->groups = kcalloc(max_group_count, sizeof(*mgr->groups),
> > GFP_KERNEL);
> > +     if (!mgr->groups) {
> > +             kfree(mgr);
> > +
> > +             return NULL;
> > +     }
> > +
> > +#ifdef CONFIG_DRM_DISPLAY_DEBUG_DP_TUNNEL_STATE
> > +     ref_tracker_dir_init(&mgr->ref_tracker, 16, "dptun");
> > +#endif
> > +
> > +     for (i = 0; i < max_group_count; i++) {
> > +             if (!init_group(mgr, &mgr->groups[i])) {
> > +                     destroy_mgr(mgr);
> > +
> > +                     return NULL;
> > +             }
> > +
> > +             mgr->group_count++;
> > +     }
> > +
> > +     return mgr;
> > +}
> > +EXPORT_SYMBOL(drm_dp_tunnel_mgr_create);
> > +
> > +/**
> > + * drm_dp_tunnel_mgr_destroy - Destroy DP tunnel manager
> > + * @mgr: Tunnel manager object
> > + *
> > + * Destroy the tunnel manager.
> > + */
> > +void drm_dp_tunnel_mgr_destroy(struct drm_dp_tunnel_mgr *mgr)
> > +{
> > +     destroy_mgr(mgr);
> > +}
> > +EXPORT_SYMBOL(drm_dp_tunnel_mgr_destroy);
> > diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> > index 281afff6ee4e5..8bfd5d007be8d 100644
> > --- a/include/drm/display/drm_dp.h
> > +++ b/include/drm/display/drm_dp.h
> > @@ -1382,6 +1382,66 @@
> >  #define DP_HDCP_2_2_REG_STREAM_TYPE_OFFSET   0x69494
> >  #define DP_HDCP_2_2_REG_DBG_OFFSET           0x69518
> >
> > +/* DP-tunneling */
> > +#define DP_TUNNELING_OUI                             0xe0000
> > +#define  DP_TUNNELING_OUI_BYTES                              3
> > +
> > +#define DP_TUNNELING_DEV_ID                          0xe0003
> > +#define  DP_TUNNELING_DEV_ID_BYTES                   6
> > +
> > +#define DP_TUNNELING_HW_REV                          0xe0009
> > +#define  DP_TUNNELING_HW_REV_MAJOR_SHIFT             4
> > +#define  DP_TUNNELING_HW_REV_MAJOR_MASK                      (0xf
> > << DP_TUNNELING_HW_REV_MAJOR_SHIFT)
> > +#define  DP_TUNNELING_HW_REV_MINOR_SHIFT             0
> > +#define  DP_TUNNELING_HW_REV_MINOR_MASK                      (0xf
> > << DP_TUNNELING_HW_REV_MINOR_SHIFT)
> > +
> > +#define DP_TUNNELING_SW_REV_MAJOR                    0xe000a
> > +#define DP_TUNNELING_SW_REV_MINOR                    0xe000b
> > +
> > +#define DP_TUNNELING_CAPABILITIES                    0xe000d
> > +#define  DP_IN_BW_ALLOCATION_MODE_SUPPORT            (1 << 7)
> > +#define  DP_PANEL_REPLAY_OPTIMIZATION_SUPPORT                (1 << 6)
> > +#define  DP_TUNNELING_SUPPORT                                (1 << 0)
> > +
> > +#define DP_IN_ADAPTER_INFO                           0xe000e
> > +#define  DP_IN_ADAPTER_NUMBER_BITS                   7
> > +#define  DP_IN_ADAPTER_NUMBER_MASK                   ((1 <<
> > DP_IN_ADAPTER_NUMBER_BITS) - 1)
> > +
> > +#define DP_USB4_DRIVER_ID                            0xe000f
> > +#define  DP_USB4_DRIVER_ID_BITS                              4
> > +#define  DP_USB4_DRIVER_ID_MASK                              ((1 <<
> > DP_USB4_DRIVER_ID_BITS) - 1)
> > +
> > +#define DP_USB4_DRIVER_BW_CAPABILITY                 0xe0020
> > +#define  DP_USB4_DRIVER_BW_ALLOCATION_MODE_SUPPORT   (1 << 7)
> > +
> > +#define DP_IN_ADAPTER_TUNNEL_INFORMATION             0xe0021
> > +#define  DP_GROUP_ID_BITS                            3
> > +#define  DP_GROUP_ID_MASK                            ((1 <<
> > DP_GROUP_ID_BITS) - 1)
> > +
> > +#define DP_BW_GRANULARITY                            0xe0022
> > +#define  DP_BW_GRANULARITY_MASK                              0x3
> > +
> > +#define DP_ESTIMATED_BW                                      0xe0023
> > +#define DP_ALLOCATED_BW                                      0xe0024
> > +
> > +#define DP_TUNNELING_STATUS                          0xe0025
> > +#define  DP_BW_ALLOCATION_CAPABILITY_CHANGED         (1 << 3)
> > +#define  DP_ESTIMATED_BW_CHANGED                     (1 << 2)
> > +#define  DP_BW_REQUEST_SUCCEEDED                     (1 << 1)
> > +#define  DP_BW_REQUEST_FAILED                                (1 << 0)
> > +
> > +#define DP_TUNNELING_MAX_LINK_RATE                   0xe0028
> > +
> > +#define DP_TUNNELING_MAX_LANE_COUNT                  0xe0029
> > +#define  DP_TUNNELING_MAX_LANE_COUNT_MASK            0x1f
> > +
> > +#define DP_DPTX_BW_ALLOCATION_MODE_CONTROL           0xe0030
> > +#define  DP_DISPLAY_DRIVER_BW_ALLOCATION_MODE_ENABLE (1 <<
> > 7)
> > +#define  DP_UNMASK_BW_ALLOCATION_IRQ                 (1 << 6)
> > +
> > +#define DP_REQUEST_BW                                        0xe0031
> > +#define  MAX_DP_REQUEST_BW                           255
> > +
> >  /* LTTPR: Link Training (LT)-tunable PHY Repeaters */
> >  #define DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV
> > 0xf0000 /* 1.3 */
> >  #define DP_MAX_LINK_RATE_PHY_REPEATER                            0xf0001 /*
> > 1.4a */
> > diff --git a/include/drm/display/drm_dp_tunnel.h
> > b/include/drm/display/drm_dp_tunnel.h
> > new file mode 100644
> > index 0000000000000..476252021f15c
> > --- /dev/null
> > +++ b/include/drm/display/drm_dp_tunnel.h
> > @@ -0,0 +1,248 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2023 Intel Corporation
> > + */
> > +
> > +#ifndef __DRM_DP_TUNNEL_H__
> > +#define __DRM_DP_TUNNEL_H__
> > +
> > +#include <linux/err.h>
> > +#include <linux/errno.h>
> > +#include <linux/types.h>
> > +
> > +struct drm_dp_aux;
> > +
> > +struct drm_device;
> > +
> > +struct drm_atomic_state;
> > +struct drm_dp_tunnel_mgr;
> > +struct drm_dp_tunnel_state;
> > +
> > +struct ref_tracker;
> > +
> > +struct drm_dp_tunnel_ref {
> > +     struct drm_dp_tunnel *tunnel;
> > +     struct ref_tracker *tracker;
> > +};
> > +
> > +#ifdef CONFIG_DRM_DISPLAY_DP_TUNNEL
> > +
> > +struct drm_dp_tunnel *
> > +drm_dp_tunnel_get(struct drm_dp_tunnel *tunnel, struct ref_tracker
> > **tracker);
> > +
> > +void
> > +drm_dp_tunnel_put(struct drm_dp_tunnel *tunnel, struct ref_tracker
> > **tracker);
> > +
> > +static inline void drm_dp_tunnel_ref_get(struct drm_dp_tunnel *tunnel,
> > +                                      struct drm_dp_tunnel_ref *tunnel_ref)
> > +{
> > +     tunnel_ref->tunnel = drm_dp_tunnel_get(tunnel, &tunnel_ref->tracker);
> > +}
> > +
> > +static inline void drm_dp_tunnel_ref_put(struct drm_dp_tunnel_ref *tunnel_ref)
> > +{
> > +     drm_dp_tunnel_put(tunnel_ref->tunnel, &tunnel_ref->tracker);
> > +}
> > +
> > +struct drm_dp_tunnel *
> > +drm_dp_tunnel_detect(struct drm_dp_tunnel_mgr *mgr,
> > +                  struct drm_dp_aux *aux);
> > +int drm_dp_tunnel_destroy(struct drm_dp_tunnel *tunnel);
> > +
> > +int drm_dp_tunnel_enable_bw_alloc(struct drm_dp_tunnel *tunnel);
> > +int drm_dp_tunnel_disable_bw_alloc(struct drm_dp_tunnel *tunnel);
> > +bool drm_dp_tunnel_bw_alloc_is_enabled(const struct drm_dp_tunnel
> > *tunnel);
> > +int drm_dp_tunnel_alloc_bw(struct drm_dp_tunnel *tunnel, int bw);
> > +int drm_dp_tunnel_get_allocated_bw(struct drm_dp_tunnel *tunnel);
> > +int drm_dp_tunnel_update_state(struct drm_dp_tunnel *tunnel);
> > +
> > +void drm_dp_tunnel_set_io_error(struct drm_dp_tunnel *tunnel);
> > +
> > +int drm_dp_tunnel_handle_irq(struct drm_dp_tunnel_mgr *mgr,
> > +                          struct drm_dp_aux *aux);
> > +
> > +int drm_dp_tunnel_max_dprx_rate(const struct drm_dp_tunnel *tunnel);
> > +int drm_dp_tunnel_max_dprx_lane_count(const struct drm_dp_tunnel *tunnel);
> > +int drm_dp_tunnel_available_bw(const struct drm_dp_tunnel *tunnel);
> > +
> > +const char *drm_dp_tunnel_name(const struct drm_dp_tunnel *tunnel);
> > +
> > +struct drm_dp_tunnel_state *
> > +drm_dp_tunnel_atomic_get_state(struct drm_atomic_state *state,
> > +                            struct drm_dp_tunnel *tunnel);
> > +
> > +struct drm_dp_tunnel_state *
> > +drm_dp_tunnel_atomic_get_old_state(struct drm_atomic_state *state,
> > +                                const struct drm_dp_tunnel *tunnel);
> > +
> > +struct drm_dp_tunnel_state *
> > +drm_dp_tunnel_atomic_get_new_state(struct drm_atomic_state *state,
> > +                                const struct drm_dp_tunnel *tunnel);
> > +
> > +int drm_dp_tunnel_atomic_set_stream_bw(struct drm_atomic_state *state,
> > +                                    struct drm_dp_tunnel *tunnel,
> > +                                    u8 stream_id, int bw);
> > +int drm_dp_tunnel_atomic_get_group_streams_in_state(struct
> > drm_atomic_state *state,
> > +                                                 const struct drm_dp_tunnel
> > *tunnel,
> > +                                                 u32 *stream_mask);
> > +
> > +int drm_dp_tunnel_atomic_check_stream_bws(struct drm_atomic_state *state,
> > +                                       u32 *failed_stream_mask);
> > +
> > +int drm_dp_tunnel_atomic_get_required_bw(const struct drm_dp_tunnel_state
> > *tunnel_state);
> > +
> > +struct drm_dp_tunnel_mgr *
> > +drm_dp_tunnel_mgr_create(struct drm_device *dev, int max_group_count);
> > +void drm_dp_tunnel_mgr_destroy(struct drm_dp_tunnel_mgr *mgr);
> > +
> > +#else
> > +
> > +static inline struct drm_dp_tunnel *
> > +drm_dp_tunnel_get(struct drm_dp_tunnel *tunnel, struct ref_tracker **tracker)
> > +{
> > +     return NULL;
> > +}
> > +
> > +static inline void
> > +drm_dp_tunnel_put(struct drm_dp_tunnel *tunnel, struct ref_tracker **tracker)
> > {}
> > +
> > +static inline void drm_dp_tunnel_ref_get(struct drm_dp_tunnel *tunnel,
> > +                                      struct drm_dp_tunnel_ref *tunnel_ref)
> > {}
> > +
> > +static inline void drm_dp_tunnel_ref_put(struct drm_dp_tunnel_ref *tunnel_ref)
> > {}
> > +
> > +static inline struct drm_dp_tunnel *
> > +drm_dp_tunnel_detect(struct drm_dp_tunnel_mgr *mgr,
> > +                  struct drm_dp_aux *aux)
> > +{
> > +     return ERR_PTR(-EOPNOTSUPP);
> > +}
> > +
> > +static inline int
> > +drm_dp_tunnel_destroy(struct drm_dp_tunnel *tunnel)
> > +{
> > +     return 0;
> > +}
> > +
> > +static inline int drm_dp_tunnel_enable_bw_alloc(struct drm_dp_tunnel *tunnel)
> > +{
> > +     return -EOPNOTSUPP;
> > +}
> > +
> > +static inline int drm_dp_tunnel_disable_bw_alloc(struct drm_dp_tunnel
> > *tunnel)
> > +{
> > +     return -EOPNOTSUPP;
> > +}
> > +
> > +static inline bool drm_dp_tunnel_bw_alloc_is_enabled(const struct
> > drm_dp_tunnel *tunnel)
> > +{
> > +     return false;
> > +}
> > +
> > +static inline int
> > +drm_dp_tunnel_alloc_bw(struct drm_dp_tunnel *tunnel, int bw)
> > +{
> > +     return -EOPNOTSUPP;
> > +}
> > +
> > +static inline int
> > +drm_dp_tunnel_get_allocated_bw(struct drm_dp_tunnel *tunnel)
> > +{
> > +     return -1;
> > +}
> > +
> > +static inline int
> > +drm_dp_tunnel_update_state(struct drm_dp_tunnel *tunnel)
> > +{
> > +     return -EOPNOTSUPP;
> > +}
> > +
> > +static inline void drm_dp_tunnel_set_io_error(struct drm_dp_tunnel *tunnel) {}
> > +
> > +static inline int
> > +drm_dp_tunnel_handle_irq(struct drm_dp_tunnel_mgr *mgr,
> > +                      struct drm_dp_aux *aux)
> > +{
> > +     return -EOPNOTSUPP;
> > +}
> > +
> > +static inline int
> > +drm_dp_tunnel_max_dprx_rate(const struct drm_dp_tunnel *tunnel)
> > +{
> > +     return 0;
> > +}
> > +
> > +static inline int
> > +drm_dp_tunnel_max_dprx_lane_count(const struct drm_dp_tunnel *tunnel)
> > +{
> > +     return 0;
> > +}
> > +
> > +static inline int
> > +drm_dp_tunnel_available_bw(const struct drm_dp_tunnel *tunnel)
> > +{
> > +     return -1;
> > +}
> > +
> > +static inline const char *
> > +drm_dp_tunnel_name(const struct drm_dp_tunnel *tunnel)
> > +{
> > +     return NULL;
> > +}
> > +
> > +static inline struct drm_dp_tunnel_state *
> > +drm_dp_tunnel_atomic_get_state(struct drm_atomic_state *state,
> > +                            struct drm_dp_tunnel *tunnel)
> > +{
> > +     return ERR_PTR(-EOPNOTSUPP);
> > +}
> > +
> > +static inline struct drm_dp_tunnel_state *
> > +drm_dp_tunnel_atomic_get_new_state(struct drm_atomic_state *state,
> > +                                const struct drm_dp_tunnel *tunnel)
> > +{
> > +     return ERR_PTR(-EOPNOTSUPP);
> > +}
> > +
> > +static inline int
> > +drm_dp_tunnel_atomic_set_stream_bw(struct drm_atomic_state *state,
> > +                                struct drm_dp_tunnel *tunnel,
> > +                                u8 stream_id, int bw)
> > +{
> > +     return -EOPNOTSUPP;
> > +}
> > +
> > +static inline int
> > +drm_dp_tunnel_atomic_get_group_streams_in_state(struct drm_atomic_state
> > *state,
> > +                                             const struct drm_dp_tunnel
> > *tunnel,
> > +                                             u32 *stream_mask)
> > +{
> > +     return -EOPNOTSUPP;
> > +}
> > +
> > +static inline int
> > +drm_dp_tunnel_atomic_check_stream_bws(struct drm_atomic_state *state,
> > +                                   u32 *failed_stream_mask)
> > +{
> > +     return -EOPNOTSUPP;
> > +}
> > +
> > +static inline int
> > +drm_dp_tunnel_atomic_get_required_bw(const struct drm_dp_tunnel_state
> > *tunnel_state)
> > +{
> > +     return 0;
> > +}
> > +
> > +static inline struct drm_dp_tunnel_mgr *
> > +drm_dp_tunnel_mgr_create(struct drm_device *dev, int max_group_count)
> > +{
> > +     return ERR_PTR(-EOPNOTSUPP);
> > +}
> > +
> > +static inline
> > +void drm_dp_tunnel_mgr_destroy(struct drm_dp_tunnel_mgr *mgr) {}
> > +
> > +
> > +#endif /* CONFIG_DRM_DISPLAY_DP_TUNNEL */
> > +
> > +#endif /* __DRM_DP_TUNNEL_H__ */
> > --
> > 2.39.2
> 
