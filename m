Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA83879928
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 17:41:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6311411229A;
	Tue, 12 Mar 2024 16:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mCyyrJVi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EABD11254E;
 Tue, 12 Mar 2024 16:41:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 26C98CE1801;
 Tue, 12 Mar 2024 16:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FE3EC433F1;
 Tue, 12 Mar 2024 16:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710261676;
 bh=0g9LLPvlH5qpBdQAUmu++557crlx9uckDyhZnn5Qxls=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mCyyrJVi8Gfx4GQpxPp/xOYa4x3L/5rtjT+tWPz/oNwV+8ariPs6A9sEHDdmj1DV+
 pBmgoR0O1eT9oyW/GOEZBaJj6N2MaF2RlMtTgdBGb/xoHfxC6bjVMD4H9u4DvvU84S
 hM2T++jhIZ8UkplTr7aH/5Oa8odR3abY9IRzQX9HpeOJfFc67JP7p9fqdLkZMwOzV4
 6g+Uo2hgDhS/f//VYHB0rO9DFINzDI9uv89grP2I56yU0nGsgRhhOPj350h3LzPpmY
 uqBCPQS42VJeYxGVGlmF/1nV7JxtSTHIPYVyGE7VU3ttUfNA7ehckv3NBzURj2+QS/
 Vr4xm7r6P6fIw==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1rk5Bq-000000005fC-2l0B;
 Tue, 12 Mar 2024 17:41:23 +0100
Date: Tue, 12 Mar 2024 17:41:22 +0100
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
Message-ID: <ZfCFsmNv62-KMkA6@hovoldconsulting.com>
References: <20240308214532.1404038-1-quic_abhinavk@quicinc.com>
 <ZfApxyVAJMK4bL8O@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZfApxyVAJMK4bL8O@hovoldconsulting.com>
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

On Tue, Mar 12, 2024 at 11:09:11AM +0100, Johan Hovold wrote:
> On Fri, Mar 08, 2024 at 01:45:32PM -0800, Abhinav Kumar wrote:

> > @@ -466,6 +466,8 @@ static int dp_display_notify_disconnect(struct device *dev)
> >  {
> >  	struct dp_display_private *dp = dev_get_dp_display_private(dev);
> >  
> > +	dp->dp_display.link_ready = false;
> 
> As I also pointed out in the other thread, setting link_ready to false
> here means that any spurious connect event (during physical disconnect)
> will always be processed, something which can currently lead to a leaked
> runtime pm reference.
> 
> Wasting some power is of course preferred over crashing the machine, but
> please take it into consideration anyway.
> 
> Especially if your intention with this patch was to address the resets
> we saw with sc8280xp which are gone since the HPD notify revert (which
> fixed the hotplug detect issue that left the bridge in a
> half-initialised state).

Heh. This is getting ridiculous. I just tried running with this patch
and it again breaks hotplug detect in a VT console and in X (where I
could enable a reconnected external display by running xrandr twice
before).

So, please, do not apply this one.

Johan
