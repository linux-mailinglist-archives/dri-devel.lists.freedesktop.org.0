Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A393F728FBD
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 08:17:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F278410E0E8;
	Fri,  9 Jun 2023 06:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7745F10E0E8;
 Fri,  9 Jun 2023 06:17:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BE7AF611A9;
 Fri,  9 Jun 2023 06:17:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2845CC433EF;
 Fri,  9 Jun 2023 06:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686291434;
 bh=B6+cEXU+VzPhKn+kA8svZbpcpafwICKvJPZUpHR+zho=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WEogXCkWo/1eteonPbvslPLmwh7f55SvhXOwmOCm9WKWcy5eTEFw/QaMD/0JXOn28
 KnP9y1lI9alflEFPTRb6CQ29Fr02ynwnlvXbpjezaFzuuRTYVHMl5+ZzzK4CUVp/4T
 Q0r8/70eaxtnmsWg8c9005jbDGbm3OolvxiDhbnFiADE/Vbvhup13EztHwvQlMQ/cP
 nSYC2SHYs9kDbuIN1dxi/0OynRW5QMtRiF+3fL+8SggYtruE+TKk5BLVr5zzCZusdr
 WG7taaUi2BmoD/wBoA5UmXtlDPHas6sRxHxjNAw7+NMupsJtrUPEJLFtF7RMITQNle
 qI4I3IEfPO6Mg==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1q7VRM-0005C5-SA; Fri, 09 Jun 2023 08:17:41 +0200
Date: Fri, 9 Jun 2023 08:17:40 +0200
From: Johan Hovold <johan@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: Adreno devfreq lockdep splat with 6.3-rc2
Message-ID: <ZILEBPQgqr1HomUQ@hovoldconsulting.com>
References: <ZBGNmXwQoW330Wr8@hovoldconsulting.com>
 <ZIHh95IeOPBTvB00@hovoldconsulting.com>
 <CAF6AEGv3y3C6nAq7nrkgbv5-9-tVgj+BtY1yU+fXXFFm_N7fcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGv3y3C6nAq7nrkgbv5-9-tVgj+BtY1yU+fXXFFm_N7fcQ@mail.gmail.com>
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 08, 2023 at 02:17:45PM -0700, Rob Clark wrote:
> On Thu, Jun 8, 2023 at 7:12 AM Johan Hovold <johan@kernel.org> wrote:

> > Have you had a chance to look at this regression yet? It prevents us
> > from using lockdep on the X13s as it is disabled as soon as we start
> > the GPU.
> 
> Hmm, curious what is different between x13s and sc7180/sc7280 things?

It seems like lockdep needs to hit the tear down path in order to
detect the circular lock dependency. Perhaps you don't hit that on your
sc7180/sc7280? 

It is due to the fact that the panel is looked up way too late so that
bind fails unless the panel driver is already loaded when the msm drm
driver probes.

Manually loading the panel driver before msm makes the splat go away.

> Or did lockdep recently get more clever (or more annotation)?

I think this is indeed a new problem related to some of the devfreq work
you did in 6.3-rc1 (e.g. fadcc3ab1302 ("drm/msm/gpu: Bypass PM QoS
constraint for idle clamp")).

> I did spend some time a while back trying to bring some sense to
> devfreq/pm-qos/icc locking:
> https://patchwork.freedesktop.org/series/115028/
> 
> but haven't had time to revisit that for a while

That's the series I link to below, but IIRC it did not look directly
applicable to the splat I see on X13s (e.g. does not involve
fs_reclaim).

> > On Wed, Mar 15, 2023 at 10:19:21AM +0100, Johan Hovold wrote:
> > >
> > > Since 6.3-rc2 (or possibly -rc1), I'm now seeing the below
> > > devfreq-related lockdep splat.
> > >
> > > I noticed that you posted a fix for something similar here:
> > >
> > >       https://lore.kernel.org/r/20230312204150.1353517-9-robdclark@gmail.com
> > >
> > > but that particular patch makes no difference.
> > >
> > > From skimming the calltraces below and qos/devfreq related changes in
> > > 6.3-rc1 it seems like this could be related to:
> > >
> > >       fadcc3ab1302 ("drm/msm/gpu: Bypass PM QoS constraint for idle clamp")

Johan
