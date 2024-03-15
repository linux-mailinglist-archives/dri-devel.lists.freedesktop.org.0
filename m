Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA8887D0CD
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 16:57:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 604C5112316;
	Fri, 15 Mar 2024 15:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PjFwN2R7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 455FA112314;
 Fri, 15 Mar 2024 15:57:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8D8156171C;
 Fri, 15 Mar 2024 15:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D985C433C7;
 Fri, 15 Mar 2024 15:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710518238;
 bh=+27njxvTQI9ZBIhezxtzfCGEjQq6eW+OVH0WF5kinqo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PjFwN2R7Ml6OnXuHFUNhVlcuAMX/WtOyTgqbQYADqdwTqZfVB8pwjSULrG8PfvJDE
 fCLlafHqOz5eEY497R8gJvP1h1a0G0Ow4kPlu995KdckrKw9MBNofk2jJn1ZWJFrMY
 QdipCePE9gRzhFADdzMxJmFev7yM+2e96GfI1HFS+pX/qI9lZEOI7Sgkpdim94SxPa
 MIW6RC75gYNG3ASz8AUXm8uk0mkAElWnV6WYUopArvcrZXJm0ue6toNIAROIXWLH+O
 aaWYZkWjj1Khl9Ap3wri881v+EtdyZXdpQMKuWlpxOsVD75hSk3QxsJe2S8/Aru0FQ
 CCanFtVG4Zpnw==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1rl9vy-000000008Ts-0qdx;
 Fri, 15 Mar 2024 16:57:26 +0100
Date: Fri, 15 Mar 2024 16:57:26 +0100
From: Johan Hovold <johan@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 quic_jesszhan@quicinc.com, quic_parellan@quicinc.com,
 quic_bjorande@quicinc.com, Rob Clark <robdclark@chromium.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: move link_ready out of HPD event thread
Message-ID: <ZfRv5le7Bfdiwrk_@hovoldconsulting.com>
References: <20240308214532.1404038-1-quic_abhinavk@quicinc.com>
 <ZfApxyVAJMK4bL8O@hovoldconsulting.com>
 <ZfCFsmNv62-KMkA6@hovoldconsulting.com>
 <ZfCKDGq9n9WG3Quj@hovoldconsulting.com>
 <8e125a99-543d-8328-a2a9-100e223e4faf@quicinc.com>
 <ZfFhXG5yd6O29spS@hovoldconsulting.com>
 <ec2cba17-5644-6cf6-f6c9-d37d7ca56204@quicinc.com>
 <ZfMaEIzv3Z3ny3y0@hovoldconsulting.com>
 <9313aa00-41f0-15af-a646-3f4e4b3098c7@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9313aa00-41f0-15af-a646-3f4e4b3098c7@quicinc.com>
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

On Thu, Mar 14, 2024 at 09:30:57AM -0700, Abhinav Kumar wrote:
> On 3/14/2024 8:38 AM, Johan Hovold wrote:
> > On Wed, Mar 13, 2024 at 10:24:08AM -0700, Abhinav Kumar wrote:

> > Perhaps I'm missing something in the race that you are trying to
> > describe (and which I've asked you to describe in more detail so that I
> > don't have to spend more time trying to come up with a reproducer
> > myself).

> The race condition is between the time we get disconnect event and set 
> link_ready to false, a commit can come in. Because setting link_ready to 
> false happens in the event thread so it could be slightly delayed.

I get this part, just not why, or rather when, that becomes a problem.

Once the disconnect event is processed, dp_hpd_unplug_handle() will
update the state to ST_DISCONNECT_PENDING, and queue a notification
event. link_ready is (before this patch) still set to 1.

Here a commit comes in; what exactly are you suggesting would trigger
that? And in such a way that it breaks the state machine?

One way this could cause trouble is if you end up with a call to
dp_bridge_atomic_post_disable() which updates the state to
ST_DISCONNECTED. (1)

This would then need to be followed by another call to
dp_bridge_atomic_enable() which bails out early with the link clock
disabled. (2) (And if link_ready were to be set to 0 sooner, the
likelihood of this is reduced.)

This in turn, would trigger a reset when dp_bridge_atomic_disable() is
later called.

This is the kind of description of the race I expect to see in the
commit message, and I'm still not sure what would trigger the call to
dp_bridge_atomic_post_disable() and dp_bridge_atomic_enable() (i.e. (1)
and (2) above) and whether this is a real issue or not.

Also note that the above scenario is quite different from the one I've
hit and described earlier.

> It will be hard to reproduce this. Only way I can think of is to delay 
> the EV_NOTIFICATION for sometime and see in dp_bridge_hpd_notify()
> 
>          else if (dp_display->link_ready && status == 
> connector_status_disconnected)
>                  dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
> 
> as dp_add_event() will add the event, then wakeup the event_q.

Sure that would increase the race window with the current code, but that
alone isn't enough to trigger the bug AFAICT.

> Before the event thread wakes up and processes this unplug event, the 
> commit can come in. This is the race condition i was thinking of.

Yes, but what triggers the commit? And why would it lead to a mode set
that disables the bridge?
 
Johan
