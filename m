Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FA666D495
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 03:51:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3331010E008;
	Tue, 17 Jan 2023 02:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87E610E008;
 Tue, 17 Jan 2023 02:51:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0AA3561196;
 Tue, 17 Jan 2023 02:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92086C433EF;
 Tue, 17 Jan 2023 02:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673923885;
 bh=JmhtnjRtv93fmLYRY9nJ+6bCJOF5xS+IQeydvqLjKrI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JwcF6Rzoh4bFaEVEF0G1LosXwazA3b54uS4yT1qtBTRxH+WCVlYxJI7UvbRvnGMZm
 S8VjEKubNcAdUsJMMNjIFTk94GfjfIHUHpkpF4bcUyuYGJJa6qNR2QDUlGEFJC2HGV
 UNDur8tV6nrLSqkmVZajJ0cS84DXmU9AEoCU9YnH3Zw22NDbjxXqw8eF46P79dLMLT
 jCNlgPZE9WjjN2ony2ESpyTPSs3ftVDo8a/M+J/sm0fQPbbDEXYSwE13dEDlL0Avfa
 CVjhO83dbu/NTZ8/5FPNnjao/qyQ+ewsvWzJwJ6wSPJOs5uRlyefPKQXnXgjan3hE2
 +zMXVuZVki8PQ==
Date: Mon, 16 Jan 2023 20:51:22 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm: Initialize mode_config earlier
Message-ID: <20230117025122.jt3wrjkqfnogu4ci@builder.lan>
References: <20230113041051.4189063-1-quic_bjorande@quicinc.com>
 <eea1c5dc-6bc5-4246-f0e1-0c790de9f078@linaro.org>
 <9a64c685-9ff0-bc1d-e604-e3773ff9edd7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a64c685-9ff0-bc1d-e604-e3773ff9edd7@linaro.org>
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
Cc: freedreno@lists.freedesktop.org,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 13, 2023 at 10:57:18AM +0200, Dmitry Baryshkov wrote:
> On 13/01/2023 06:23, Dmitry Baryshkov wrote:
> > On 13/01/2023 06:10, Bjorn Andersson wrote:
> > > Invoking drm_bridge_hpd_notify() on a drm_bridge with a HPD-enabled
> > > bridge_connector ends up in drm_bridge_connector_hpd_cb() calling
> > > drm_kms_helper_hotplug_event(), which assumes that the associated
> > > drm_device's mode_config.funcs is a valid pointer.
> > > 
> > > But in the MSM DisplayPort driver the HPD enablement happens at bind
> > > time and mode_config.funcs is initialized late in msm_drm_init(). This
> > > means that there's a window for hot plug events to dereference a NULL
> > > mode_config.funcs.
> > > 
> > > Move the assignment of mode_config.funcs before the bind, to avoid this
> > > scenario.
> > 
> > Cam we make DP driver not to report HPD events until the enable_hpd()
> > was called? I think this is what was fixed by your internal_hpd
> > patchset.
> 
> Or to express this in another words: I thought that internal_hpd already
> deferred enabling hpd event reporting till the time when we need it, didn't
> it?
> 

I added a WARN_ON(1) in drm_bridge_hpd_enable() to get a sense of when
this window of "opportunity" opens up, and here's the callstack:

------------[ cut here ]------------
WARNING: CPU: 6 PID: 99 at drivers/gpu/drm/drm_bridge.c:1260 drm_bridge_hpd_enable+0x48/0x94 [drm]
...
Call trace:
 drm_bridge_hpd_enable+0x48/0x94 [drm]
 drm_bridge_connector_enable_hpd+0x30/0x3c [drm_kms_helper]
 drm_kms_helper_poll_enable+0xa4/0x114 [drm_kms_helper]
 drm_kms_helper_poll_init+0x6c/0x7c [drm_kms_helper]
 msm_drm_bind+0x370/0x628 [msm]
 try_to_bring_up_aggregate_device+0x170/0x1bc
 __component_add+0xb0/0x168
 component_add+0x20/0x2c
 dp_display_probe+0x40c/0x468 [msm]
 platform_probe+0xb4/0xdc
 really_probe+0x13c/0x300
 __driver_probe_device+0xc0/0xec
 driver_probe_device+0x48/0x204
 __device_attach_driver+0x124/0x14c
 bus_for_each_drv+0x90/0xdc
 __device_attach+0xdc/0x1a8
 device_initial_probe+0x20/0x2c
 bus_probe_device+0x40/0xa4
 deferred_probe_work_func+0x94/0xd0
 process_one_work+0x1a8/0x3c0
 worker_thread+0x254/0x47c
 kthread+0xf8/0x1b8
 ret_from_fork+0x10/0x20
---[ end trace 0000000000000000 ]---

As drm_kms_helper_poll_init() is the last thing being called in
msm_drm_init() shifting around the mode_config.func assignment would not
have any impact.

Perhaps we have shuffled other things around to avoid this bug?  Either
way, let's this on hold  until further proof that it's still
reproducible.

Sorry for the noise,
Bjorn
