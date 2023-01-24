Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0409467928F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 09:09:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7430910E61E;
	Tue, 24 Jan 2023 08:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D730810E61E;
 Tue, 24 Jan 2023 08:09:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 146D6611FD;
 Tue, 24 Jan 2023 08:09:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7290BC433D2;
 Tue, 24 Jan 2023 08:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674547742;
 bh=TRocIrBG205Sv8eelyMy2hfITbfOBpE1O01eh4HW/XY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CJYnW7GphJzPeSUmvUcxBIa/oKMqd8ezbxM/r+fuCWqX2Zgfr4dD+O2cB4XfxhATR
 iGdkGVu94g8Gvk3utzvoszBn2wH/jBw7JGBPAOKp/UcD1AtQa/66g/8fJiu4hOsYoP
 I/3qplJNLecojxQP2AI0FS952OCFWqFa9eNIwDF4jmR9Py03O5W9xInmgxxySvq9P+
 xcYWom6EsrZjH4NQRrkcrR9epy1fGP8TlhhoCs+lqPMbUmAIoHin8j75hwIKyh/en1
 OjhikC4epD7BMLFuoNzV6Y9ujmTdcoiEV+rOgd0Y9qF9WN3OOja6A8wx4nq6UmyT9o
 zKeTjnQt1z9ug==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1pKEMX-00057Z-IJ; Tue, 24 Jan 2023 09:09:02 +0100
Date: Tue, 24 Jan 2023 09:09:01 +0100
From: Johan Hovold <johan@kernel.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH] drm/msm: Initialize mode_config earlier
Message-ID: <Y8+SHQ/klPwusQRj@hovoldconsulting.com>
References: <20230113041051.4189063-1-quic_bjorande@quicinc.com>
 <eea1c5dc-6bc5-4246-f0e1-0c790de9f078@linaro.org>
 <9a64c685-9ff0-bc1d-e604-e3773ff9edd7@linaro.org>
 <20230117025122.jt3wrjkqfnogu4ci@builder.lan>
 <Y8ZWl85gSpOaLgO4@hovoldconsulting.com>
 <Y86vaTQR7INWezyj@hovoldconsulting.com>
 <20230123171749.GA623918@hu-bjorande-lv.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123171749.GA623918@hu-bjorande-lv.qualcomm.com>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 23, 2023 at 09:17:49AM -0800, Bjorn Andersson wrote:
> On Mon, Jan 23, 2023 at 05:01:45PM +0100, Johan Hovold wrote:
> > On Tue, Jan 17, 2023 at 09:04:39AM +0100, Johan Hovold wrote:
> > > On Mon, Jan 16, 2023 at 08:51:22PM -0600, Bjorn Andersson wrote:

> > > > Perhaps we have shuffled other things around to avoid this bug?  Either
> > > > way, let's this on hold  until further proof that it's still
> > > > reproducible.
> > > 
> > > As I've mentioned off list, I haven't hit the apparent race I reported
> > > here:
> > > 
> > > 	https://lore.kernel.org/all/Y1efJh11B5UQZ0Tz@hovoldconsulting.com/
> > > 
> > > since moving to 6.2. I did hit it with both 6.0 and 6.1-rc2, but it
> > > could very well be that something has changes that fixes (or hides) the
> > > issue since.
> > 
> > For unrelated reasons, I tried enabling async probing, and apart from
> > apparently causing the panel driver to probe defer indefinitely, I also
> > again hit the WARN_ON() I had added to catch this:
> > 
> > [   13.593235] WARNING: CPU: 0 PID: 125 at drivers/gpu/drm/drm_probe_helper.c:664 drm_kms_helper_hotplug_event+0x48/0x7
> > 0 [drm_kms_helper]

> > So the bug still appears to be there (and the MSM DRM driver is fragile
> > and broken, but we knew that).
> > 
> 
> But the ordering between mode_config.funcs = !NULL and
> drm_kms_helper_poll_init() in msm_drm_init() seems pretty clear.
> 
> And my testing shows that drm_kms_helper_poll_init() is the cause for
> getting bridge->hpd_cb != NULL.
> 
> So the ordering seems legit, unless there's something else causing the
> assignment of bridge->hpd_cb to happen earlier in this scenario.

I'm not saying that this patch is correct (indeed it doesn't seem to
be), but only that the bug I reported still appears to be present in
6.2.

Now that I actually looked at this again, I realise that the reason that
haven't seen it with 6.2 is more likely due to the fact that I'm now
making sure to load the panel driver before the drm driver to avoid that
unnecessary probe deferral.

With async probing, I get the probe deferral again, and boom, I hit the
same old NULL deref.

I see there's a call to drm_kms_helper_poll_fini() in msm_drm_uninit()
which should stop the polling, but perhaps there's still some corner
case due to the unexpected probe (or rather component bind) deferral
which we're hitting.

Johan
