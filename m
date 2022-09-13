Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A715B6892
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 09:20:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60EB910E61C;
	Tue, 13 Sep 2022 07:20:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605E510E61C;
 Tue, 13 Sep 2022 07:20:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 83088612E7;
 Tue, 13 Sep 2022 07:20:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E09D6C433C1;
 Tue, 13 Sep 2022 07:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663053642;
 bh=8E4O++2S6FWEnxjwuILlmwZ5txcSLR8D7sk53WBMDXQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DbfN+Zsij52xBRMio9UjMnddcvrW6l9KE1bas+PuyClOTdyacgCwG7an4RMBeFzgq
 ZkmufTzGX5eXiWuUaeu60mAi6OuZ/eofEFLww/gnvV28K02ZOqeVzU1jDiJpgZ+kBR
 e4HsovoyZhSSU7WfsnpwNEsRFJ7OS+J9NTRwS1lbBnN8a+QkUCKdK+uqAN5pmLwPbL
 RahtWxI+J/aAuBwYRPhi449p37AjDnVGuSGY2ZtO2qDn8fW4E9HxEOJLwPc6qg9vZJ
 1n/dpiaPWA9L2Qy6akJJFp424t4k9GnNptI+XZHTxWnqTc7YsFCa71oldb5vsEgiQ5
 29EgLxVTHYqIA==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1oY0Do-0000nJ-Jh; Tue, 13 Sep 2022 09:20:40 +0200
Date: Tue, 13 Sep 2022 09:20:40 +0200
From: Johan Hovold <johan@kernel.org>
To: Steev Klimaszewski <steev@kali.org>
Subject: Re: [PATCH 4/7] drm/msm/dp: fix aux-bus EP lifetime
Message-ID: <YyAvSKTBGdVIjaHW@hovoldconsulting.com>
References: <20220912154046.12900-1-johan+linaro@kernel.org>
 <20220912154046.12900-5-johan+linaro@kernel.org>
 <e60f0053-3801-bf33-5841-69f16215fa00@linaro.org>
 <69526798-93df-a4f9-c385-c9bf490cc709@kali.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69526798-93df-a4f9-c385-c9bf490cc709@kali.org>
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, stable@vger.kernel.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 12, 2022 at 04:55:58PM -0500, Steev Klimaszewski wrote:
> 
> On 9/12/22 1:10 PM, Dmitry Baryshkov wrote:
> > On 12/09/2022 18:40, Johan Hovold wrote:
> >> Device-managed resources allocated post component bind must be tied to
> >> the lifetime of the aggregate DRM device or they will not necessarily be
> >> released when binding of the aggregate device is deferred.
> >>
> >> This can lead resource leaks or failure to bind the aggregate device
> >> when binding is later retried and a second attempt to allocate the
> >> resources is made.
> >>
> >> For the DP aux-bus, an attempt to populate the bus a second time will
> >> simply fail ("DP AUX EP device already populated").
> >>
> >> Fix this by amending the DP aux interface and tying the lifetime of the
> >> EP device to the DRM device rather than DP controller platform device.
> >
> > Doug, could you please take a look?
> >
> > For me this is another reminder/pressure point that we should populate 
> > the AUX BUS from the probe(), before binding the components together.
> >
> >>
> >> Fixes: c3bf8e21b38a ("drm/msm/dp: Add eDP support via aux_bus")
> >> Cc: stable@vger.kernel.org      # 5.19
> >> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> >> ---
> >>   drivers/gpu/drm/bridge/parade-ps8640.c   | 2 +-
> >>   drivers/gpu/drm/display/drm_dp_aux_bus.c | 5 +++--
> >>   drivers/gpu/drm/msm/dp/dp_display.c      | 3 ++-
> >>   include/drm/display/drm_dp_aux_bus.h     | 6 +++---
> >>   4 files changed, 9 insertions(+), 7 deletions(-)

> This breaks builds which have ti-sn65dsi86 included:
> 
> drivers/gpu/drm/bridge/ti-sn65dsi86.c:628:50: error: passing argument 1 
> of 'devm_of_dp_aux_populate_ep_devices' from incompatible argument type.
> 
> As well,
> 
> drivers/gpu/drm/bridge/ti-sn65dsi86.c:628:15: error: too few arguments 
> to function 'devm_of_dp_aux_populate_ep_devices'

Thanks for reporting this. I messed up and apparently only grepped for
devm_of_dp_aux_populate_bus() and not the
devm_of_dp_aux_populate_ep_devices() wrapper when searching for users.

Johan
