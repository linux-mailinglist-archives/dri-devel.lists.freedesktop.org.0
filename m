Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A516389CD05
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 22:42:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4324F112962;
	Mon,  8 Apr 2024 20:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g833Jq0J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F43112962;
 Mon,  8 Apr 2024 20:42:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 17D60CE1254;
 Mon,  8 Apr 2024 20:41:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA163C433F1;
 Mon,  8 Apr 2024 20:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712608917;
 bh=tfdC6IUIDOInprI5HAyhCtD8GrE4tlPMNfZeyK0mQ5c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g833Jq0JM+10ZJ+ETjg9N7wqx+vDkgbHh+qPxlWZPM58bhix0xse+CvnYjZEAJ++t
 ZFIiPv7TdMTA5Wi8avhKDi/+PR756//shV3JnFWMXBHdJiV+Z0w+JQVtD64wmOoW+n
 SMF7812fbkYYd3tQLWxC0ylgTYtLfVpUSCzaoYWo27MkBuAxdJf5m1EP83d1Ql9WQ8
 DEJ7UyVK3LeleDrUhD4LdRccUYPhuH0nnjxczEJWfuos3fdRYcnKBEwbkNcseFHs2F
 HGQb5Bb40e6779tzRaCnRMb7JOyj+89tz9ddkkRkQOyXYXnPfQNvV9WiNOI+f8xTRk
 rBpQo1p9UuNYQ==
Date: Mon, 8 Apr 2024 15:41:54 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org, swboyd@chromium.org, 
 quic_jesszhan@quicinc.com, quic_bjorande@quicinc.com, johan@kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/msm/dp: call dp_hpd_plug_handle()/unplug_handle()
 directly for external HPD
Message-ID: <k7f22hyltul4h4o4vqe6prc2yx3mm2q4dzk66j3xrsdpdtqllb@3c6ul4fpimwz>
References: <20240406031548.25829-1-quic_abhinavk@quicinc.com>
 <ale6wbwzkfagcg2q6glb4vsxu3pthhkk3tquv2ixlatbdryqvh@xscsq2h6emho>
 <01cb1c0d-a801-37f9-2f55-2bbd8d3a68b9@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01cb1c0d-a801-37f9-2f55-2bbd8d3a68b9@quicinc.com>
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

On Mon, Apr 08, 2024 at 12:43:34PM -0700, Abhinav Kumar wrote:
> 
> 
> On 4/7/2024 11:48 AM, Bjorn Andersson wrote:
> > On Fri, Apr 05, 2024 at 08:15:47PM -0700, Abhinav Kumar wrote:
> > > From: Kuogee Hsieh <quic_khsieh@quicinc.com>
> > [..]
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index d80f89581760..bfb6dfff27e8 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -1665,7 +1665,7 @@ void dp_bridge_hpd_notify(struct drm_bridge *bridge,
> > >   		return;
> > >   	if (!dp_display->link_ready && status == connector_status_connected)
> > > -		dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
> > > +		dp_hpd_plug_handle(dp, 0);
> > 
> > If I read the code correctly, and we get an external connect event
> > inbetween a previous disconnect and the related disable call, this
> > should result in a PLUG_INT being injected into the queue still.
> > 
> > Will that not cause the same problem?
> > 
> > Regards,
> > Bjorn
> > 
> 
> Yes, your observation is correct and I had asked the same question to kuogee
> before taking over this change and posting.
> 
> We will have to handle that case separately. I don't have a good solution
> yet for it without requiring further rework or we drop the below snippet.
> 
>         if (state == ST_DISCONNECT_PENDING) {
>                 /* wait until ST_DISCONNECTED */
>                 dp_add_event(dp, EV_HPD_PLUG_INT, 0, 1); /* delay = 1 */
>                 mutex_unlock(&dp->event_mutex);
>                 return 0;
>         }
> 
> I will need sometime to address that use-case as I need to see if we can
> handle that better and then drop the the DISCONNECT_PENDING state to address
> this fully. But it needs more testing.
> 
> But, we will need this patch anyway because without this we will not be able
> to fix even the most regular and commonly seen case of basic
> connect/disconnect receiving complementary events.
> 

I did some more testing on this patch. Connecting and disconnecting the
cable while in fbcon works reliably, except for:
- edid/modes are not read before we bring up the link so I always end up
  with 640x480

- if I run modetest -s <id>:<mode> the link is brought up with the new
  resolution and I get my test image on the screen.
  But as we're shutting down the link for the resolution chance I end up
  in dp_bridge_hpd_notify() with link_ready && state = disconnected.
  This triggers an unplug which hangs on the event_mutex, such that as
  soon as I get the test image, the state machine enters
  DISCONNECT_PENDING. This is immediately followed by another
  !link_ready && status = connected, which attempts to perform the plug
  operation, but as we're in DISCONNECT_PENDING this is posted on the
  event queue. From there I get a log entry from my PLUG_INT, every
  100ms stating that we're still in DISCONNECT_PENDING. If I exit
  modetest the screen goes black, and no new mode can be selected,
  because we're in DISCONNECT_PENDING. The only way out is to disconnect
  the cable to complete the DISCONNECT_PENDING.

Regards,
Bjorn

> 
> > >   	else if (dp_display->link_ready && status == connector_status_disconnected)
> > > -		dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
> > > +		dp_hpd_unplug_handle(dp, 0);
> > >   }
> > > -- 
> > > 2.43.2
> > > 
