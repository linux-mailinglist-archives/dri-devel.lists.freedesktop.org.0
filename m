Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E169887997D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 17:59:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5421126BF;
	Tue, 12 Mar 2024 16:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WxoRalM4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF05010F4E4;
 Tue, 12 Mar 2024 16:59:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BB5B461085;
 Tue, 12 Mar 2024 16:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6565BC433F1;
 Tue, 12 Mar 2024 16:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710262790;
 bh=FSXZZfDNrd7UxykRlFzm59PWeSEaNKZ1Vv92FRdyvbg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WxoRalM4CEDvFeUEfC+bcww4xWbVK/OEUIkpGV3walVZXYmVRDvxLSpkwNMXpv24M
 hxtsYbP9eiWdngP109yto1HIFUlA8W7VJQq792SuiCsmLMBNIw+0m5C1vfzae5PtIl
 nNZxLQZz3W+1GVimGGxISe5Ftwf9gNrZ7pu2l/ID6uo9e574LGggcBOc6aKPzF5OA5
 JhQN0fdSDF/yiz25TCm4dqsBuAQxlYO5wWW7VdAxmr2aQ6pObkO/jKIPKgapD786+1
 hY0XsfomZjHNGdARdQuBoDfKxtNi9MEs9cHf/fksvRmPZaLAwVnHx0k02oEs7Uu/lx
 MA5jr7ic3xN4w==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1rk5To-000000005qR-3wEe;
 Tue, 12 Mar 2024 17:59:56 +0100
Date: Tue, 12 Mar 2024 17:59:56 +0100
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
Message-ID: <ZfCKDGq9n9WG3Quj@hovoldconsulting.com>
References: <20240308214532.1404038-1-quic_abhinavk@quicinc.com>
 <ZfApxyVAJMK4bL8O@hovoldconsulting.com>
 <ZfCFsmNv62-KMkA6@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZfCFsmNv62-KMkA6@hovoldconsulting.com>
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

On Tue, Mar 12, 2024 at 05:41:23PM +0100, Johan Hovold wrote:
> On Tue, Mar 12, 2024 at 11:09:11AM +0100, Johan Hovold wrote:
> > On Fri, Mar 08, 2024 at 01:45:32PM -0800, Abhinav Kumar wrote:
> 
> > > @@ -466,6 +466,8 @@ static int dp_display_notify_disconnect(struct device *dev)
> > >  {
> > >  	struct dp_display_private *dp = dev_get_dp_display_private(dev);
> > >  
> > > +	dp->dp_display.link_ready = false;
> > 
> > As I also pointed out in the other thread, setting link_ready to false
> > here means that any spurious connect event (during physical disconnect)
> > will always be processed, something which can currently lead to a leaked
> > runtime pm reference.
> > 
> > Wasting some power is of course preferred over crashing the machine, but
> > please take it into consideration anyway.
> > 
> > Especially if your intention with this patch was to address the resets
> > we saw with sc8280xp which are gone since the HPD notify revert (which
> > fixed the hotplug detect issue that left the bridge in a
> > half-initialised state).
> 
> Heh. This is getting ridiculous. I just tried running with this patch
> and it again breaks hotplug detect in a VT console and in X (where I
> could enable a reconnected external display by running xrandr twice
> before).
> 
> So, please, do not apply this one.

To make things worse, I indeed also hit the reset when disconnecting
after such a failed hotplug.

Johan
