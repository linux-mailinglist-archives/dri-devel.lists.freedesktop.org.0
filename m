Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0393550C7C4
	for <lists+dri-devel@lfdr.de>; Sat, 23 Apr 2022 08:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF1B112106;
	Sat, 23 Apr 2022 06:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B93112105
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Apr 2022 06:25:31 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2f7ca2ce255so5624667b3.7
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 23:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L7NFwT62hgPxHq65e3HJNK92BlG2QATKXdPuAfZSThg=;
 b=gp3vjF0VMbM4eI8d0gT4q+k2/iFSb1gA0aZ2ykGIJUzkY6vOOc4SWoKOQyiHGEfWz+
 kX6Mei6TzFcmJ7k0OkeoSBUGYGiicOgdF8VLUvdNdBNh2CLFXhz7wnZI+7ukIqMbesRk
 DvA/jK1DgOyZyugm+0Dy3/vQ5zZds0uZstPHleYQS1ncXKO4JJTxrSoA+mI2n27RiSZb
 XmkHswqcisYyos9DJJwKq+4zT2HIDeqjMdfXiwY67Lpp+7RMCq/b4vS6TKffLQzbvree
 d8IRYCUgSdL2x7e50gEdd1V2ox422c5SR1fBQIqxes4gxgKGvuHiCoMLA26pEEuclKU4
 DNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L7NFwT62hgPxHq65e3HJNK92BlG2QATKXdPuAfZSThg=;
 b=pEEdQzJjHsqU/LfzunOe4xYbMzqpsv1jBPplH8n1S81wTj4i8otErhfiXB4RPuGlsu
 PhiWAfHP78gy90Yg8hCe44JpKJEH1NI+b3hYmTlWvhDBHdYLlHExQobA3SE6DGxg1Tqr
 AOq39dylBlMjsuYtsyQ3tlyPj8YQCcbGeL+SOAp7sn0hBdOYfP46L0iTerO/J1+VefCW
 eYMaNAdAGQ8/eBH6Iyon+kveYYQtQzC1683EDQndl2Om5hI9L9FArnhI3M0wuYMHBNmk
 X+Orpm7r4U3VHTiLaoZMHuCh1z7QLR+6CuX5MuYh/ribMM4L6LJmlU61WzdeXcVADKXO
 HLAA==
X-Gm-Message-State: AOAM5309VqwvSD3uR03mvmoWyWoUa7fa5B9kJjCmh038KFHXQMg3jf9a
 Ab4daJmgsbYQcdtvIxGqACwmneADDFUVu8ZLtEQDrw==
X-Google-Smtp-Source: ABdhPJwdPHZq0yWlkaz35kVDl6iQALYru8ENisFOlt0ALDyjJ2C57VWsnLUeiv6CxMf+glnNifz/qXAPq/s0MCfP3yk=
X-Received: by 2002:a81:1985:0:b0:2f7:c16b:3afd with SMTP id
 127-20020a811985000000b002f7c16b3afdmr3195464ywz.113.1650695130460; Fri, 22
 Apr 2022 23:25:30 -0700 (PDT)
MIME-Version: 1.0
References: <1650671124-14030-1-git-send-email-quic_khsieh@quicinc.com>
 <3b9588d2-d9f6-c96f-b316-953b56b59bfe@linaro.org>
 <73e2a37e-23db-d614-5f5c-8120f1869158@quicinc.com>
In-Reply-To: <73e2a37e-23db-d614-5f5c-8120f1869158@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 23 Apr 2022 09:25:19 +0300
Message-ID: <CAA8EJprjuzUrfwXodgKmbWxgK6t+bY601E_nS7CHNH_+4Tfn5Q@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: move add fail safe mode to
 dp_connector_get_mode()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 bjorn.andersson@linaro.org, quic_aravindh@quicinc.com,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 23 Apr 2022 at 03:12, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 4/22/2022 5:07 PM, Dmitry Baryshkov wrote:
> > On 23/04/2022 02:45, Kuogee Hsieh wrote:
> >> Current DP driver implementation has adding safe mode done at
> >> dp_hpd_plug_handle() which is expected to be executed under event
> >> thread context.
> >>
> >> However there is possible circular locking happen (see blow stack trace)
> >> after edp driver call dp_hpd_plug_handle() from dp_bridge_enable() which
> >> is executed under drm_thread context.
> >>
> >> To break this circular locking, this patch have safe mode added at
> >> dp_connector_get_mode() which is executed under drm thread context.
> >> Therefore no lock acquired required for &dev->mode_config.mutex while
> >> adding fail safe mode since it has been hold by drm thread already.
> >>
> >> ======================================================
> >>   WARNING: possible circular locking dependency detected
> >>   5.15.35-lockdep #6 Tainted: G        W
> >>   ------------------------------------------------------
> >>   frecon/429 is trying to acquire lock:
> >>   ffffff808dc3c4e8 (&dev->mode_config.mutex){+.+.}-{3:3}, at:
> >> dp_panel_add_fail_safe_mode+0x4c/0xa0
> >>
> >>   but task is already holding lock:
> >>   ffffff808dc441e0 (&kms->commit_lock[i]){+.+.}-{3:3}, at:
> >> lock_crtcs+0xb4/0x124
> >>
> >>   which lock already depends on the new lock.
> >>
> >>   the existing dependency chain (in reverse order) is:
> >>
> >>   -> #3 (&kms->commit_lock[i]){+.+.}-{3:3}:
> >>          __mutex_lock_common+0x174/0x1a64
> >>          mutex_lock_nested+0x98/0xac
> >>          lock_crtcs+0xb4/0x124
> >>          msm_atomic_commit_tail+0x330/0x748
> >>          commit_tail+0x19c/0x278
> >>          drm_atomic_helper_commit+0x1dc/0x1f0
> >>          drm_atomic_commit+0xc0/0xd8
> >>          drm_atomic_helper_set_config+0xb4/0x134
> >>          drm_mode_setcrtc+0x688/0x1248
> >>          drm_ioctl_kernel+0x1e4/0x338
> >>          drm_ioctl+0x3a4/0x684
> >>          __arm64_sys_ioctl+0x118/0x154
> >>          invoke_syscall+0x78/0x224
> >>          el0_svc_common+0x178/0x200
> >>          do_el0_svc+0x94/0x13c
> >>          el0_svc+0x5c/0xec
> >>          el0t_64_sync_handler+0x78/0x108
> >>          el0t_64_sync+0x1a4/0x1a8
> >>
> >>   -> #2 (crtc_ww_class_mutex){+.+.}-{3:3}:
> >>          __mutex_lock_common+0x174/0x1a64
> >>          ww_mutex_lock+0xb8/0x278
> >>          modeset_lock+0x304/0x4ac
> >>          drm_modeset_lock+0x4c/0x7c
> >>          drmm_mode_config_init+0x4a8/0xc50
> >>          msm_drm_init+0x274/0xac0
> >>          msm_drm_bind+0x20/0x2c
> >>          try_to_bring_up_master+0x3dc/0x470
> >>          __component_add+0x18c/0x3c0
> >>          component_add+0x1c/0x28
> >>          dp_display_probe+0x954/0xa98
> >>          platform_probe+0x124/0x15c
> >>          really_probe+0x1b0/0x5f8
> >>          __driver_probe_device+0x174/0x20c
> >>          driver_probe_device+0x70/0x134
> >>          __device_attach_driver+0x130/0x1d0
> >>          bus_for_each_drv+0xfc/0x14c
> >>          __device_attach+0x1bc/0x2bc
> >>          device_initial_probe+0x1c/0x28
> >>          bus_probe_device+0x94/0x178
> >>          deferred_probe_work_func+0x1a4/0x1f0
> >>          process_one_work+0x5d4/0x9dc
> >>          worker_thread+0x898/0xccc
> >>          kthread+0x2d4/0x3d4
> >>          ret_from_fork+0x10/0x20
> >>
> >>   -> #1 (crtc_ww_class_acquire){+.+.}-{0:0}:
> >>          ww_acquire_init+0x1c4/0x2c8
> >>          drm_modeset_acquire_init+0x44/0xc8
> >>          drm_helper_probe_single_connector_modes+0xb0/0x12dc
> >>          drm_mode_getconnector+0x5dc/0xfe8
> >>          drm_ioctl_kernel+0x1e4/0x338
> >>          drm_ioctl+0x3a4/0x684
> >>          __arm64_sys_ioctl+0x118/0x154
> >>          invoke_syscall+0x78/0x224
> >>          el0_svc_common+0x178/0x200
> >>          do_el0_svc+0x94/0x13c
> >>          el0_svc+0x5c/0xec
> >>          el0t_64_sync_handler+0x78/0x108
> >>          el0t_64_sync+0x1a4/0x1a8
> >>
> >>   -> #0 (&dev->mode_config.mutex){+.+.}-{3:3}:
> >>          __lock_acquire+0x2650/0x672c
> >>          lock_acquire+0x1b4/0x4ac
> >>          __mutex_lock_common+0x174/0x1a64
> >>          mutex_lock_nested+0x98/0xac
> >>          dp_panel_add_fail_safe_mode+0x4c/0xa0
> >>          dp_hpd_plug_handle+0x1f0/0x280
> >>          dp_bridge_enable+0x94/0x2b8
> >>          drm_atomic_bridge_chain_enable+0x11c/0x168
> >>          drm_atomic_helper_commit_modeset_enables+0x500/0x740
> >>          msm_atomic_commit_tail+0x3e4/0x748
> >>          commit_tail+0x19c/0x278
> >>          drm_atomic_helper_commit+0x1dc/0x1f0
> >>          drm_atomic_commit+0xc0/0xd8
> >>          drm_atomic_helper_set_config+0xb4/0x134
> >>          drm_mode_setcrtc+0x688/0x1248
> >>          drm_ioctl_kernel+0x1e4/0x338
> >>          drm_ioctl+0x3a4/0x684
> >>          __arm64_sys_ioctl+0x118/0x154
> >>          invoke_syscall+0x78/0x224
> >>          el0_svc_common+0x178/0x200
> >>          do_el0_svc+0x94/0x13c
> >>          el0_svc+0x5c/0xec
> >>          el0t_64_sync_handler+0x78/0x108
> >>          el0t_64_sync+0x1a4/0x1a8
> >>
> >> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/dp/dp_display.c |  6 ------
> >>   drivers/gpu/drm/msm/dp/dp_panel.c   | 23 +++++++++++++----------
> >>   2 files changed, 13 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> >> b/drivers/gpu/drm/msm/dp/dp_display.c
> >> index 92cd50f..01453db 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -555,12 +555,6 @@ static int dp_hpd_plug_handle(struct
> >> dp_display_private *dp, u32 data)
> >>       mutex_unlock(&dp->event_mutex);
> >> -    /*
> >> -     * add fail safe mode outside event_mutex scope
> >> -     * to avoid potiential circular lock with drm thread
> >> -     */
> >> -    dp_panel_add_fail_safe_mode(dp->dp_display.connector);
> >> -
> >>       /* uevent will complete connection part */
> >>       return 0;
> >>   };
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c
> >> b/drivers/gpu/drm/msm/dp/dp_panel.c
> >> index 1aa9aa8c..23fee42 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> >> @@ -151,15 +151,6 @@ static int dp_panel_update_modes(struct
> >> drm_connector *connector,
> >>       return rc;
> >>   }
> >> -void dp_panel_add_fail_safe_mode(struct drm_connector *connector)
> >> -{
> >> -    /* fail safe edid */
> >> -    mutex_lock(&connector->dev->mode_config.mutex);
> >> -    if (drm_add_modes_noedid(connector, 640, 480))
> >> -        drm_set_preferred_mode(connector, 640, 480);
> >> -    mutex_unlock(&connector->dev->mode_config.mutex);
> >> -}
> >> -
> >>   int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
> >>       struct drm_connector *connector)
> >>   {
> >> @@ -216,7 +207,11 @@ int dp_panel_read_sink_caps(struct dp_panel
> >> *dp_panel,
> >>               goto end;
> >>           }
> >> -        dp_panel_add_fail_safe_mode(connector);
> >> +        /* fail safe edid */
> >> +        mutex_lock(&connector->dev->mode_config.mutex);
> >> +        if (drm_add_modes_noedid(connector, 640, 480))
> >> +            drm_set_preferred_mode(connector, 640, 480);
> >> +        mutex_unlock(&connector->dev->mode_config.mutex);
> >>       }
> >>       if (panel->aux_cfg_update_done) {
> >> @@ -266,6 +261,14 @@ int dp_panel_get_modes(struct dp_panel *dp_panel,
> >>           return -EINVAL;
> >>       }
> >> +    /*
> >> +     * add fail safe mode (640x480) here
> >> +     * since we are executed in drm_thread context,
> >> +     * no mode_config.mutex acquired required
> >> +     */
> >> +    if (drm_add_modes_noedid(connector, 640, 480))
> >> +        drm_set_preferred_mode(connector, 640, 480);
> >> +
> >>       if (dp_panel->edid)
> >>           return dp_panel_update_modes(connector, dp_panel->edid);
> > Also, wouldn't calling get_modes() several times make cause adding more
> > and more 640x480 modes to the modes list?
> >
>
> Shouldnt DRM be blocking that here? Call should trickle down here only
> if count_modes was 0
>
>     if (out_resp->count_modes == 0) {
>          if (is_current_master)
>              connector->funcs->fill_modes(connector,
>                               dev->mode_config.max_width,
>                               dev->mode_config.max_height);
>          else
>              drm_dbg_kms(dev, "User-space requested a forced probe on
> [CONNECTOR:%d:%s] but is not the DRM master, demoting to read-only probe",
>                      connector->base.id, connector->name);
>      }
>

count_modes is set by userspace:
        /*
         * This ioctl is called twice, once to determine how much space is
         * needed, and the 2nd time to fill it.
         */

So, nothing prevents userspace from passing zero count_mode more than once.

However drm_helper_probe_single_connector_modes() will set old modes
to MODE_STALE and then will call get_modes().
Then drm_mode_prune_invalid() will prune stale modes. So, this should be fine.

A more generic question is why do we need to add the mode in two places?

-- 
With best wishes
Dmitry
