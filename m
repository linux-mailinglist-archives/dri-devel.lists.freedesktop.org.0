Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0EE4FA07E
	for <lists+dri-devel@lfdr.de>; Sat,  9 Apr 2022 02:15:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B97810F23E;
	Sat,  9 Apr 2022 00:15:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB32310F23B
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Apr 2022 00:15:03 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id t7so11888921qta.10
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 17:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wqKqNvRBKNK1XdPdWd1W/+J9AUdIYdoGTEbOAR0NgMk=;
 b=azoKrEIF53591VoXaWCsQ+ipgnK2WwCmmUVONxiYTWOSJi/Kigp+j7UENXG2BVz+YI
 gVEXff6nidhrh8Chtspuct7Bvu2V/DcCseg2iMlkbeBpC04w1dPLiuuzYL9SAdenaPvW
 G5I3FkjeNGS3XExzg5iIBxJ1/IqhUwlPRS2VZTdTTX+MvyEcLX95WOTJbAffdLE5v7z+
 K1K+BZXvbxEIdy3jUcwzmEpgx5aQf1WYPcuxpYI/C5/YpA/jfG6U7o12V+M5vk0g+ujw
 jSUiPSWxYeaozohRGtMQ7Gl8WDiNwy/tk1DZOrAflEpSxf0gkcOCwdcJXQrUsE67Esgh
 7Hhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wqKqNvRBKNK1XdPdWd1W/+J9AUdIYdoGTEbOAR0NgMk=;
 b=dVtXxyNXKVFj38nKIO3IN8arxqpTpKIXr5R5nWNjZXMTHWLvR42KrxGMhsQAUNcYZI
 JkVBNfSBZwRwN7UD1UoDcSrJu6oh2p/NWRnqnvlGitGJWHr/wxbZJNgDIFFJY1AjwJVh
 g5cIJe/zAj6f/ynpYMyaHDd9EiYwHyLHckeCh0onOvGoFMxQ0WZEp0rY+y+C4pNRvTBq
 wy70tdayPWSVLh72meO/YGvcBbTJofRe1+r6ix72ugBrEq/LF+/4t+m6UGmBUISFMmgx
 Ociz8filywCeMiBSE/2ULH1SlDWzaFCnbwb1sfR/FtVcH+tCRqcNyn6rxTkrrUszCwMD
 crmw==
X-Gm-Message-State: AOAM5316yT0rIMKSi7MDP64AfpuuLOJsQUkJhX/i5qyIpFK8DwrlAmht
 6/DL7f9DVhDBhhmWgZBi66q/LodppGNbAyAazXdekQ==
X-Google-Smtp-Source: ABdhPJxoYLUQ7Wodg8S1LjYpBE9I/Bk+A6yMDzjWCEyCz7bXKUpAK1sJpbG6x+GWIQOcgKiwn/gJkGD+iHHgChU8230=
X-Received: by 2002:ac8:5702:0:b0:2e1:ec8a:917a with SMTP id
 2-20020ac85702000000b002e1ec8a917amr18093756qtw.682.1649463302828; Fri, 08
 Apr 2022 17:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <1649451894-554-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1649451894-554-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 9 Apr 2022 03:14:51 +0300
Message-ID: <CAA8EJpqtjK_GDe7V5CSU9hs0x6rOJsL8+yoZFMS66i69nwj-9Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: add fail safe mode outside of event_mutex
 context
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, quic_aravindh@quicinc.com,
 bjorn.andersson@linaro.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 9 Apr 2022 at 00:05, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> There is possible circular locking dependency detected on event_mutex
> (see below logs). This is due to set fail safe mode is done at
> dp_panel_read_sink_caps() within event_mutex scope. To break this
> possible circular locking, this patch move setting fail safe mode
> out of event_mutex scope.
>
> [   23.958078] ======================================================
> [   23.964430] WARNING: possible circular locking dependency detected
> [   23.970777] 5.17.0-rc2-lockdep-00088-g05241de1f69e #148 Not tainted
> [   23.977219] ------------------------------------------------------
> [   23.983570] DrmThread/1574 is trying to acquire lock:
> [   23.988763] ffffff808423aab0 (&dp->event_mutex){+.+.}-{3:3}, at: msm_dp_displ                                                                             ay_enable+0x58/0x164
> [   23.997895]
> [   23.997895] but task is already holding lock:
> [   24.003895] ffffff808420b280 (&kms->commit_lock[i]/1){+.+.}-{3:3}, at: lock_c                                                                             rtcs+0x80/0x8c
> [   24.012495]
> [   24.012495] which lock already depends on the new lock.
> [   24.012495]
> [   24.020886]
> [   24.020886] the existing dependency chain (in reverse order) is:
> [   24.028570]
> [   24.028570] -> #5 (&kms->commit_lock[i]/1){+.+.}-{3:3}:
> [   24.035472]        __mutex_lock+0xc8/0x384
> [   24.039695]        mutex_lock_nested+0x54/0x74
> [   24.044272]        lock_crtcs+0x80/0x8c
> [   24.048222]        msm_atomic_commit_tail+0x1e8/0x3d0
> [   24.053413]        commit_tail+0x7c/0xfc
> [   24.057452]        drm_atomic_helper_commit+0x158/0x15c
> [   24.062826]        drm_atomic_commit+0x60/0x74
> [   24.067403]        drm_mode_atomic_ioctl+0x6b0/0x908
> [   24.072508]        drm_ioctl_kernel+0xe8/0x168
> [   24.077086]        drm_ioctl+0x320/0x370
> [   24.081123]        drm_compat_ioctl+0x40/0xdc
> [   24.085602]        __arm64_compat_sys_ioctl+0xe0/0x150
> [   24.090895]        invoke_syscall+0x80/0x114
> [   24.095294]        el0_svc_common.constprop.3+0xc4/0xf8
> [   24.100668]        do_el0_svc_compat+0x2c/0x54
> [   24.105242]        el0_svc_compat+0x4c/0xe4
> [   24.109548]        el0t_32_sync_handler+0xc4/0xf4
> [   24.114381]        el0t_32_sync+0x178
> [   24.118688]
> [   24.118688] -> #4 (&kms->commit_lock[i]){+.+.}-{3:3}:
> [   24.125408]        __mutex_lock+0xc8/0x384
> [   24.129628]        mutex_lock_nested+0x54/0x74
> [   24.134204]        lock_crtcs+0x80/0x8c
> [   24.138155]        msm_atomic_commit_tail+0x1e8/0x3d0
> [   24.143345]        commit_tail+0x7c/0xfc
> [   24.147382]        drm_atomic_helper_commit+0x158/0x15c
> [   24.152755]        drm_atomic_commit+0x60/0x74
> [   24.157323]        drm_atomic_helper_set_config+0x68/0x90
> [   24.162869]        drm_mode_setcrtc+0x394/0x648
> [   24.167535]        drm_ioctl_kernel+0xe8/0x168
> [   24.172102]        drm_ioctl+0x320/0x370
> [   24.176135]        drm_compat_ioctl+0x40/0xdc
> [   24.180621]        __arm64_compat_sys_ioctl+0xe0/0x150
> [   24.185904]        invoke_syscall+0x80/0x114
> [   24.190302]        el0_svc_common.constprop.3+0xc4/0xf8
> [   24.195673]        do_el0_svc_compat+0x2c/0x54
> [   24.200241]        el0_svc_compat+0x4c/0xe4
> [   24.204544]        el0t_32_sync_handler+0xc4/0xf4
> [   24.209378]        el0t_32_sync+0x174/0x178
> [   24.213680] -> #3 (crtc_ww_class_mutex){+.+.}-{3:3}:
> [   24.220308]        __ww_mutex_lock.constprop.20+0xe8/0x878
> [   24.225951]        ww_mutex_lock+0x60/0xd0
> [   24.230166]        modeset_lock+0x190/0x19c
> [   24.234467]        drm_modeset_lock+0x34/0x54
> [   24.238953]        drmm_mode_config_init+0x550/0x764
> [   24.244065]        msm_drm_bind+0x170/0x59c
> [   24.248374]        try_to_bring_up_master+0x244/0x294
> [   24.253572]        __component_add+0xf4/0x14c
> [   24.258057]        component_add+0x2c/0x38
> [   24.262273]        dsi_dev_attach+0x2c/0x38
> [   24.266575]        dsi_host_attach+0xc4/0x120
> [   24.271060]        mipi_dsi_attach+0x34/0x48
> [   24.275456]        devm_mipi_dsi_attach+0x28/0x68
> [   24.280298]        ti_sn_bridge_probe+0x2b4/0x2dc
> [   24.285137]        auxiliary_bus_probe+0x78/0x90
> [   24.289893]        really_probe+0x1e4/0x3d8
> [   24.294194]        __driver_probe_device+0x14c/0x164
> [   24.299298]        driver_probe_device+0x54/0xf8
> [   24.304043]        __device_attach_driver+0xb4/0x118
> [   24.309145]        bus_for_each_drv+0xb0/0xd4
> [   24.313628]        __device_attach+0xcc/0x158
> [   24.318112]        device_initial_probe+0x24/0x30
> [   24.322954]        bus_probe_device+0x38/0x9c
> [   24.327439]        deferred_probe_work_func+0xd4/0xf0
> [   24.332628]        process_one_work+0x2f0/0x498
> [   24.337289]        process_scheduled_works+0x44/0x48
> [   24.342391]        worker_thread+0x1e4/0x26c
> [   24.346788]        kthread+0xe4/0xf4
> [   24.350470]        ret_from_fork+0x10/0x20
> [   24.354683]
> [   24.354683]
> [   24.354683] -> #2 (crtc_ww_class_acquire){+.+.}-{0:0}:
> [   24.361489]        drm_modeset_acquire_init+0xe4/0x138
> [   24.366777]        drm_helper_probe_detect_ctx+0x44/0x114
> [   24.372327]        check_connector_changed+0xbc/0x198
> [   24.377517]        drm_helper_hpd_irq_event+0xcc/0x11c
> [   24.382804]        dsi_hpd_worker+0x24/0x30
> [   24.387104]        process_one_work+0x2f0/0x498
> [   24.391762]        worker_thread+0x1d0/0x26c
> [   24.396158]        kthread+0xe4/0xf4
> [   24.399840]        ret_from_fork+0x10/0x20
> [   24.404053]
> [   24.404053] -> #1 (&dev->mode_config.mutex){+.+.}-{3:3}:
> [   24.411032]        __mutex_lock+0xc8/0x384
> [   24.415247]        mutex_lock_nested+0x54/0x74
> [   24.419819]        dp_panel_read_sink_caps+0x23c/0x26c
> [   24.425108]        dp_display_process_hpd_high+0x34/0xd4
> [   24.430570]        dp_display_usbpd_configure_cb+0x30/0x3c
> [   24.436205]        hpd_event_thread+0x2ac/0x550
> [   24.440864]        kthread+0xe4/0xf4
> [   24.444544]        ret_from_fork+0x10/0x20
> [   24.448757]
> [   24.448757] -> #0 (&dp->event_mutex){+.+.}-{3:3}:
> [   24.455116]        __lock_acquire+0xe2c/0x10d8
> [   24.459690]        lock_acquire+0x1ac/0x2d0
> [   24.463988]        __mutex_lock+0xc8/0x384
> [   24.468201]        mutex_lock_nested+0x54/0x74
> [   24.472773]        msm_dp_display_enable+0x58/0x164
> [   24.477789]        dp_bridge_enable+0x24/0x30
> [   24.482273]        drm_atomic_bridge_chain_enable+0x78/0x9c
> [   24.488006]        drm_atomic_helper_commit_modeset_enables+0x1bc/0x244
> [   24.494801]        msm_atomic_commit_tail+0x248/0x3d0
> [   24.499992]        commit_tail+0x7c/0xfc
> [   24.504031]        drm_atomic_helper_commit+0x158/0x15c
> [   24.509404]        drm_atomic_commit+0x60/0x74
> [   24.513976]        drm_mode_atomic_ioctl+0x6b0/0x908
> [   24.519079]        drm_ioctl_kernel+0xe8/0x168
> [   24.523650]        drm_ioctl+0x320/0x370
> [   24.527689]        drm_compat_ioctl+0x40/0xdc
> [   24.532175]        __arm64_compat_sys_ioctl+0xe0/0x150
> [   24.537463]        invoke_syscall+0x80/0x114
> [   24.541861]        el0_svc_common.constprop.3+0xc4/0xf8
> [   24.547235]        do_el0_svc_compat+0x2c/0x54
> [   24.551806]        el0_svc_compat+0x4c/0xe4
> [   24.556106]        el0t_32_sync_handler+0xc4/0xf4
> [   24.560948]        el0t_32_sync+0x174/0x178
>
> Changes in v2:
> -- add circular lockiing trace
>
> Fixes: d4aca422539c ("drm/msm/dp:  always add fail-safe mode into connector mode list")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I'll probably fix the trace while applying the commit.
In future please remove timestamps and make sure that there are no
extra whitespaces.

-- 
With best wishes
Dmitry
