Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 637CC66D777
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 09:04:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA8910E2D8;
	Tue, 17 Jan 2023 08:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 160FC10E2D8;
 Tue, 17 Jan 2023 08:04:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3CF2E60C25;
 Tue, 17 Jan 2023 08:04:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1306C433EF;
 Tue, 17 Jan 2023 08:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673942658;
 bh=vB1tUi0ipCUEpsBghYAjXEtXUjagIZFsMiRJPsWnUaU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T5yZSdMjUiRzxdy3m2UG+4oH3ZQlLPbzR+AnF52SIEImKtlyPrUvMcmkG25HjpZ79
 joYjF+7Uei7L3bhxUxQZMNSVVlgUr/35WwcarMU6e6lG0r/yCrGtOXCG6FEi6O/UXk
 XRBjZpUT0bW7LTEZUP9lUyEbl2BTAhsSVdaKfuTp+IVSX9wBl1GkmWZ4y82M6xrzJ7
 Xwj6WP0H8jfHRn5Sx0d+D9ouSZNV3EEK/Kaq5687HVuEph0UwiUTqfd++pFIJ8QcAR
 eV+n82ogzK1BDQ+E3+t0Ne+2N0d/uM9RDKD726Ea4girgTXOHtwIB7M1FSWjovvohH
 XwbixnAO3tX+w==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1pHgxT-00074C-F0; Tue, 17 Jan 2023 09:04:39 +0100
Date: Tue, 17 Jan 2023 09:04:39 +0100
From: Johan Hovold <johan@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH] drm/msm: Initialize mode_config earlier
Message-ID: <Y8ZWl85gSpOaLgO4@hovoldconsulting.com>
References: <20230113041051.4189063-1-quic_bjorande@quicinc.com>
 <eea1c5dc-6bc5-4246-f0e1-0c790de9f078@linaro.org>
 <9a64c685-9ff0-bc1d-e604-e3773ff9edd7@linaro.org>
 <20230117025122.jt3wrjkqfnogu4ci@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117025122.jt3wrjkqfnogu4ci@builder.lan>
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
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 16, 2023 at 08:51:22PM -0600, Bjorn Andersson wrote:
> On Fri, Jan 13, 2023 at 10:57:18AM +0200, Dmitry Baryshkov wrote:
> > On 13/01/2023 06:23, Dmitry Baryshkov wrote:
> > > On 13/01/2023 06:10, Bjorn Andersson wrote:
> > > > Invoking drm_bridge_hpd_notify() on a drm_bridge with a HPD-enabled
> > > > bridge_connector ends up in drm_bridge_connector_hpd_cb() calling
> > > > drm_kms_helper_hotplug_event(), which assumes that the associated
> > > > drm_device's mode_config.funcs is a valid pointer.
> > > > 
> > > > But in the MSM DisplayPort driver the HPD enablement happens at bind
> > > > time and mode_config.funcs is initialized late in msm_drm_init(). This
> > > > means that there's a window for hot plug events to dereference a NULL
> > > > mode_config.funcs.
> > > > 
> > > > Move the assignment of mode_config.funcs before the bind, to avoid this
> > > > scenario.
> > > 
> > > Cam we make DP driver not to report HPD events until the enable_hpd()
> > > was called? I think this is what was fixed by your internal_hpd
> > > patchset.
> > 
> > Or to express this in another words: I thought that internal_hpd already
> > deferred enabling hpd event reporting till the time when we need it, didn't
> > it?
> > 
> 
> I added a WARN_ON(1) in drm_bridge_hpd_enable() to get a sense of when
> this window of "opportunity" opens up, and here's the callstack:
> 
> ------------[ cut here ]------------
> WARNING: CPU: 6 PID: 99 at drivers/gpu/drm/drm_bridge.c:1260 drm_bridge_hpd_enable+0x48/0x94 [drm]
> ...
> Call trace:
>  drm_bridge_hpd_enable+0x48/0x94 [drm]
>  drm_bridge_connector_enable_hpd+0x30/0x3c [drm_kms_helper]
>  drm_kms_helper_poll_enable+0xa4/0x114 [drm_kms_helper]
>  drm_kms_helper_poll_init+0x6c/0x7c [drm_kms_helper]
>  msm_drm_bind+0x370/0x628 [msm]
>  try_to_bring_up_aggregate_device+0x170/0x1bc
>  __component_add+0xb0/0x168
>  component_add+0x20/0x2c
>  dp_display_probe+0x40c/0x468 [msm]
>  platform_probe+0xb4/0xdc
>  really_probe+0x13c/0x300
>  __driver_probe_device+0xc0/0xec
>  driver_probe_device+0x48/0x204
>  __device_attach_driver+0x124/0x14c
>  bus_for_each_drv+0x90/0xdc
>  __device_attach+0xdc/0x1a8
>  device_initial_probe+0x20/0x2c
>  bus_probe_device+0x40/0xa4
>  deferred_probe_work_func+0x94/0xd0
>  process_one_work+0x1a8/0x3c0
>  worker_thread+0x254/0x47c
>  kthread+0xf8/0x1b8
>  ret_from_fork+0x10/0x20
> ---[ end trace 0000000000000000 ]---
> 
> As drm_kms_helper_poll_init() is the last thing being called in
> msm_drm_init() shifting around the mode_config.func assignment would not
> have any impact.
> 
> Perhaps we have shuffled other things around to avoid this bug?  Either
> way, let's this on hold  until further proof that it's still
> reproducible.

As I've mentioned off list, I haven't hit the apparent race I reported
here:

	https://lore.kernel.org/all/Y1efJh11B5UQZ0Tz@hovoldconsulting.com/

since moving to 6.2. I did hit it with both 6.0 and 6.1-rc2, but it
could very well be that something has changes that fixes (or hides) the
issue since.

Johan
