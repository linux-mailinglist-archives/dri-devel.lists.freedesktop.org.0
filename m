Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CBF877246
	for <lists+dri-devel@lfdr.de>; Sat,  9 Mar 2024 17:30:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA161121D8;
	Sat,  9 Mar 2024 16:30:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PtOOz9a1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30AAF1121D8;
 Sat,  9 Mar 2024 16:30:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CFBE5CE09B1;
 Sat,  9 Mar 2024 16:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E84EBC433F1;
 Sat,  9 Mar 2024 16:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710001809;
 bh=Z8NYMNi75dMPpNy4mJ7qTSQzkrstQRIM4zNyis8YJtk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PtOOz9a19RHXtayeov5eJZw28Eu0tjt638RoawRo5es4cJLeERmUcYj3lyY45zQVL
 Za2XoTc7l7RXSihFU9waQp4CKwy5zD1/J+5cccgrLM/0BAVz4pZqmfpuEDjEPumN7g
 SX2n3Vt4fXOiq7k3Ybm524pNXcOmv4TIXd6e/NKwEWP2FTbn2vovEsSAzChZnl9Rg5
 Y4bCTSBfawzNIdgvRWfD1fBIQM+051+a/pHRuf4Sp5yUMUeoxvmd3Dl2CJ5nJyjuOl
 SmtnyJFZJPn/fViINBffgONjrLaoT6MmZ8xTmk44+PF8yjwTEmm9KHJoiQmRImj11K
 SFQNdK8VwgOrQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1rizaS-000000001sK-0xji;
 Sat, 09 Mar 2024 17:30:16 +0100
Date: Sat, 9 Mar 2024 17:30:16 +0100
From: Johan Hovold <johan@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 quic_jesszhan@quicinc.com, quic_sbillaka@quicinc.com,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: drm/msm: DisplayPort hard-reset on hotplug regression in 6.8-rc1
Message-ID: <ZeyOmJLlBbwnmaJN@hovoldconsulting.com>
References: <Zd3kvD02Qvsh2Sid@hovoldconsulting.com>
 <ZesH21DcfOldRD9g@hovoldconsulting.com>
 <56de6cfb-fe0f-de30-d4d0-03c0fbb0afbb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56de6cfb-fe0f-de30-d4d0-03c0fbb0afbb@quicinc.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 08, 2024 at 09:50:17AM -0800, Abhinav Kumar wrote:
> On 3/8/2024 4:43 AM, Johan Hovold wrote:

> For this last remaining reset with the stacktrace you have mentioned 
> below, I do not think this was introduced due to PM runtime series. We 
> have had this report earlier with the same stacktrace as well in earlier 
> kernels which didnt have PM runtime support:

> But, it seems like there is another race condition in this code 
> resulting in this issue again.
> 
> I have posted my analysis with the patch here as a RFC y'day:
> 
> https://patchwork.freedesktop.org/patch/581758/
> 
> I missed CCing you and Bjorn on the RFC but when I post it as a patch 
> either today/tomm, will CC you both.

Ok, thanks. I'll take a closer look at that next week. It's not clear to
me what that race looks like after reading the commit message. It would
be good to have some more details in there (e.g. the sequence of events
that breaks the state machine) and some way to reproduce the issue
reliably.

> > We now also have Bjorn's call trace from a different Qualcomm platform
> > triggering an unclocked access on disconnect, something which would
> > trigger a reset by the hypervisor on sc8280xp platforms like the X13s:

> > [ 2030.379583] Kernel panic - not syncing: Asynchronous SError Interrupt
> > [ 2030.379586] CPU: 0 PID: 239 Comm: kworker/0:2 Not tainted 6.8.0-rc4-next-20240216-00015-gc937d3c43ffe-dirty #219
> > [ 2030.379590] Hardware name: Qualcomm Technologies, Inc. Robotics RB3gen2 (DT)
> > [ 2030.379592] Workqueue: events output_poll_execute [drm_kms_helper]
> > [ 2030.379642] Call trace:

> > [ 2030.379722]  wait_for_completion_timeout+0x14/0x20
> > [ 2030.379727]  dp_ctrl_push_idle+0x34/0x8c [msm]
> > [ 2030.379844]  dp_bridge_atomic_disable+0x18/0x24 [msm]
> > [ 2030.379959]  drm_atomic_bridge_chain_disable+0x6c/0xb4 [drm]
> > [ 2030.380150]  drm_atomic_helper_commit_modeset_disables+0x174/0x57c [drm_kms_helper]
> > [ 2030.380200]  msm_atomic_commit_tail+0x1b4/0x474 [msm]
> > [ 2030.380316]  commit_tail+0xa4/0x158 [drm_kms_helper]
> > [ 2030.380369]  drm_atomic_helper_commit+0x24c/0x26c [drm_kms_helper]
> > [ 2030.380418]  drm_atomic_commit+0xa8/0xd4 [drm]
> > [ 2030.380529]  drm_client_modeset_commit_atomic+0x16c/0x244 [drm]
> > [ 2030.380641]  drm_client_modeset_commit_locked+0x50/0x168 [drm]
> > [ 2030.380753]  drm_client_modeset_commit+0x2c/0x54 [drm]
> > [ 2030.380865]  __drm_fb_helper_restore_fbdev_mode_unlocked+0x60/0xa4 [drm_kms_helper]
> > [ 2030.380915]  drm_fb_helper_hotplug_event+0xe0/0xf4 [drm_kms_helper]
> > [ 2030.380965]  msm_fbdev_client_hotplug+0x28/0xc8 [msm]
> > [ 2030.381081]  drm_client_dev_hotplug+0x94/0x118 [drm]
> > [ 2030.381192]  output_poll_execute+0x214/0x26c [drm_kms_helper]
> > [ 2030.381241]  process_scheduled_works+0x19c/0x2cc
> > [ 2030.381249]  worker_thread+0x290/0x3cc
> > [ 2030.381255]  kthread+0xfc/0x184
> > [ 2030.381260]  ret_from_fork+0x10/0x20
> > 
> > The above could happen if the convoluted hotplug state machine breaks
> > down so that the device is runtime suspended before
> > dp_bridge_atomic_disable() is called.

> Yes, state machine got broken and I have explained how in the commit 
> text of the RFC. But its not necessarily due to PM runtime but a 
> sequence of events happening from userspace exposing this breakage.

After looking at this some more today, I agree with you. The
observations I've reported are consistent with what would happen if the
link clock is disabled when dp_bridge_atomic_disable() is called.

That clock is disabled in dp_bridge_atomic_post_disable() before runtime
suspending, but perhaps there are some further paths that can end up
disabling it.

> > For some reason, possibly due to unrelated changes in timing, possibly
> > after the hotplug revert, I am no longer able to reproduce the reset
> > with 6.8-rc7 on the X13s.

> I do not know how the hotplug revert fixed this stack because I think 
> this can still happen.

Thanks for confirming.
 
> > I am however able to get the hotplug state machine to leak
> > runtime PM reference counts which prevents it from ever being suspended
> > (e.g. by disconnecting slowly so that we get multiple connect and
> > disconnect events). This can manifest itself as a hotplug event which is
> > processed after disconnecting the display:
> > 
> > 	[drm:dp_panel_read_sink_caps [msm]] *ERROR* read dpcd failed -110

> hmm ... this is another new report. I was not aware of this till this 
> instance. We would like to debug this issue too as we have also not seen 
> this one before.
> 
> But, I am suspicious about how or why a refcount leak leads to a DPCD 
> read failure.

It's the other way round: the hotplug event is processed after
disconnect and that leaks a runtime PM usage count:

< usb-c disconnect >

[  158.167845] msm-dp-display ae98000.displayport-controller: dp_bridge_hpd_notify - link_ready = 1, status = 2

Here's the disconnect event.

[  158.172234] msm-dp-display ae98000.displayport-controller: dp_hpd_unplug_handle
[  158.175164] msm-dp-display ae98000.displayport-controller: dp_bridge_hpd_notify - link_ready = 1, status = 1

Here's an unexpected connect event which is added to the event queue if
the link state is updated by a racing thread (after this printk).

[  158.175696] msm-dp-display ae98000.displayport-controller: __pm_runtime_idle - usage count = 1
[  158.175704] msm-dp-display ae98000.displayport-controller: dp_display_send_hpd_notification - hpd = 0

Such as here.

[  158.180972] msm-dp-display ae98000.displayport-controller: dp_bridge_hpd_notify - link_ready = 0, status = 2
[  158.184146] msm-dp-display ae98000.displayport-controller: dp_bridge_hpd_notify - link_ready = 0, status = 2
[  158.186565] msm-dp-display ae98000.displayport-controller: dp_bridge_atomic_disable
[  158.235903] msm-dp-display ae98000.displayport-controller: dp_bridge_atomic_post_disable
[  158.237759] msm-dp-display ae98000.displayport-controller: dp_power_clk_enable - type = 2, enable = 0
[  158.238484] msm-dp-display ae98000.displayport-controller: dp_power_clk_enable - type = 1, enable = 0
[  158.240350] msm-dp-display ae98000.displayport-controller: __pm_runtime_idle - usage count = 0
[  158.240966] msm-dp-display ae98000.displayport-controller: dp_pm_runtime_suspend
[  158.242674] msm-dp-display ae98000.displayport-controller: dp_power_clk_enable - type = 0, enable = 0
[  158.259286] msm-dp-display ae98000.displayport-controller: dp_bridge_hpd_notify - link_ready = 0, status = 2
[  158.275869] msm-dp-display ae98000.displayport-controller: dp_hpd_plug_handle

Here the spurious connect event is processed but the external display is
already disconnected.

[  158.277070] msm-dp-display ae98000.displayport-controller: dp_hpd_plug_handle - rpm get
[  158.278234] msm-dp-display ae98000.displayport-controller: __pm_runtime_resume - usage count = 1
[  158.279322] msm-dp-display ae98000.displayport-controller: dp_pm_runtime_resume
[  158.280386] msm-dp-display ae98000.displayport-controller: dp_power_clk_enable - type = 0, enable = 1
[  158.283766] msm-dp-display ae98000.displayport-controller: __pm_runtime_resume - usage count = 2
[  158.340829] msm-dp-display ae98000.displayport-controller: __pm_runtime_idle - usage count = 1
...
[  160.101867] msm-dp-display ae98000.displayport-controller: __pm_runtime_resume - usage count = 2
[  160.159553] msm-dp-display ae98000.displayport-controller: __pm_runtime_idle - usage count = 1
[  160.160643] [drm:dp_panel_read_sink_caps [msm]] *ERROR* read dpcd failed -110

Which leads to the dpcd read failure and leaves the runtime PM usage
count incremented (the next hotplug event bumps the count to 2).

I've also hit one other scenario where a runtime PM reference count is
leaked (without any dpcd errors), but the above one is easily reproduced
by pulling out the plug slowly (the printks may possibly help make this
more reproducable by altering the timing slightly).

> At this point, I would say if the RFC resolves the reset for you and 
> Bjorn with the above stack, that should be the way to go and not full 
> revert.
> 
> Unless you are facing other issues other than this last reset crash.

We only have Bjorn's stack trace as the hypervisor just resets the
machine when I hit this on sc8280xp, but I think it's reasonable to
assume that we are hitting the same or at least a related issue.

Also note that I've hit the resets in two different ways; disconnect in
VT console and when stopping X some time after a disconnect (Bjorn's
stack trace is from the former case I think).

Both resets occur around the time where dp_bridge_atomic_disable() is
normally called, but I'm still missing an explanation for how the link
clock got disabled prematurely (if that's what happened).

> To avoid the breakages on sc8280xp moving forward as it has more 
> visibility, our team here has decided to setup sc8280xp devices to test 
> out all msm display related changes especially eDP/DP as it shares the 
> eDP/DP driver. We can also CC you on these, in case you want to test it 
> out as well and give your Tested-by.

That's good to hear. I'm sure your testing will be sufficient to catch
any obvious regressions. Once it hits mainline we have a larger user
base of people running the X13s which will provide further testing, but
it's not very efficient to rely on third parties with these kind of
issues that just trigger resets on this platform. It gives us an
indication that something is broken, but someone still needs to spend
time to try to narrow it down.

Johan
