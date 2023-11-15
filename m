Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 226077EBE59
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 09:06:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7842410E4FE;
	Wed, 15 Nov 2023 08:06:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4E310E4FE;
 Wed, 15 Nov 2023 08:06:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BCE29614BB;
 Wed, 15 Nov 2023 08:06:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 626C9C433C7;
 Wed, 15 Nov 2023 08:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700035609;
 bh=Bmygp15x0jLKbjn9WTbAfKcQyxau4Zlf903Qv1K/O8I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BFIQ3T2dwf0w1oIXpn8Y8M9DFEGPPcPseuED+J2NuDHQDp7xXKZWELKt5PtumWUrj
 Dqq/8plMq3XedcbaF2lRvDH8DF36Vb78+kwk90NPwPaYA8rYH6Y17QdCZqi26JzURa
 rmJsL+HrjZOUZvUpepdxT8qylfp4Cw6akh7b/cX6y/7DVFxseYiJCJy3/qo0dcMN5s
 w9CL3dFjCehFFaS93QBfbwaSGs5Y1lfiDjUCaL2yzEJ8/GkBjN/OcmOlI5YOrvvHVr
 5TLah+jo5aSsaLOJRW41vF2j4JTXOCx9TwZetfSeb92Zf24jc0AMw4zzpw8/VVbL5i
 HDzQmp1/EhMlw==
Received: from johan by xi.lan with local (Exim 4.96.2)
 (envelope-from <johan@kernel.org>) id 1r3Av8-0001Yu-0O;
 Wed, 15 Nov 2023 09:06:46 +0100
Date: Wed, 15 Nov 2023 09:06:46 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 2/2] drm/msm/dp: attach the DP subconnector property
Message-ID: <ZVR8Flrjxy-wgqgJ@hovoldconsulting.com>
References: <20231025092711.851168-1-dmitry.baryshkov@linaro.org>
 <20231025092711.851168-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025092711.851168-3-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Abel Vesa <abel.vesa@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 25, 2023 at 12:23:10PM +0300, Dmitry Baryshkov wrote:
> While developing and testing the commit bfcc3d8f94f4 ("drm/msm/dp:
> support setting the DP subconnector type") I had the patch [1] in my
> tree. I haven't noticed that it was a dependency for the commit in
> question. Mea culpa.

This also broke boot on the Lenovo ThinkPad X13s.

Would be nice to get this fixed ASAP so that further people don't have
to debug this known regression.
 
> Since the patch has not landed yet (and even was not reviewed)
> and since one of the bridges erroneously uses USB connector type instead
> of DP, attach the property directly from the MSM DP driver.
> 
> This fixes the following oops on DP HPD event:
> 
>  drm_object_property_set_value (drivers/gpu/drm/drm_mode_object.c:288)
>  dp_display_process_hpd_high (drivers/gpu/drm/msm/dp/dp_display.c:402)
>  dp_hpd_plug_handle.isra.0 (drivers/gpu/drm/msm/dp/dp_display.c:604)
>  hpd_event_thread (drivers/gpu/drm/msm/dp/dp_display.c:1110)
>  kthread (kernel/kthread.c:388)
>  ret_from_fork (arch/arm64/kernel/entry.S:858)

This only says where the oops happened, it doesn't necessarily in itself
indicate an oops at all or that in this case it's a NULL pointer
dereference.

On the X13s I'm seeing the NULL deref in a different path during boot,
and when this happens after a deferred probe (due to the panel lookup
mess) it hangs the machine, which makes it a bit of a pain to debug:

   Unable to handle kernel NULL pointer dereference at virtual address 0000000000000060
   ...
   CPU: 4 PID: 57 Comm: kworker/u16:1 Not tainted 6.7.0-rc1 #4
   Hardware name: Qualcomm QRD, BIOS 6.0.220110.BOOT.MXF.1.1-00470-MAKENA-1 01/10/2022
   ...
   Call trace:
    drm_object_property_set_value+0x0/0x88 [drm]
    dp_display_process_hpd_high+0xa0/0x14c [msm]
    dp_hpd_plug_handle.constprop.0.isra.0+0x90/0x110 [msm]
    dp_bridge_atomic_enable+0x184/0x21c [msm]
    edp_bridge_atomic_enable+0x60/0x94 [msm]
    drm_atomic_bridge_chain_enable+0x54/0xc8 [drm]
    drm_atomic_helper_commit_modeset_enables+0x194/0x26c [drm_kms_helper]
    msm_atomic_commit_tail+0x204/0x804 [msm]
    commit_tail+0xa4/0x18c [drm_kms_helper]
    drm_atomic_helper_commit+0x19c/0x1b0 [drm_kms_helper]
    drm_atomic_commit+0xa4/0x104 [drm]
    drm_client_modeset_commit_atomic+0x22c/0x298 [drm]
    drm_client_modeset_commit_locked+0x60/0x1c0 [drm]
    drm_client_modeset_commit+0x30/0x58 [drm]
    __drm_fb_helper_restore_fbdev_mode_unlocked+0xbc/0xfc [drm_kms_helper]
    drm_fb_helper_set_par+0x30/0x4c [drm_kms_helper]
    fbcon_init+0x224/0x49c
    visual_init+0xb0/0x108
    do_bind_con_driver.isra.0+0x19c/0x38c
    do_take_over_console+0x140/0x1ec
    do_fbcon_takeover+0x6c/0xe4
    fbcon_fb_registered+0x180/0x1f0
    register_framebuffer+0x19c/0x228
    __drm_fb_helper_initial_config_and_unlock+0x2e8/0x4e8 [drm_kms_helper]
    drm_fb_helper_initial_config+0x3c/0x4c [drm_kms_helper]
    msm_fbdev_client_hotplug+0x84/0xcc [msm]
    drm_client_register+0x5c/0xa0 [drm]
    msm_fbdev_setup+0x94/0x148 [msm]
    msm_drm_bind+0x3d0/0x42c [msm]
    try_to_bring_up_aggregate_device+0x1ec/0x2f4
    __component_add+0xa8/0x194
    component_add+0x14/0x20
    dp_display_probe+0x278/0x41c [msm]

> [1] https://patchwork.freedesktop.org/patch/555530/
> 
> Fixes: bfcc3d8f94f4 ("drm/msm/dp: support setting the DP subconnector type")
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>

Johan
