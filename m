Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A73685BA83
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 12:27:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A42610E357;
	Tue, 20 Feb 2024 11:27:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="r5juAYSU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD55410E357;
 Tue, 20 Feb 2024 11:27:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 21FCB60C3F;
 Tue, 20 Feb 2024 11:27:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0BF5C433C7;
 Tue, 20 Feb 2024 11:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708428420;
 bh=VddnBpFylmssPBNR8LxVy9HNAItc6vmZJuhEvw0a1cc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r5juAYSUvCxKuNFb30xnBGP17AeDgQUJFn90heG7na3+4GVGkGHv+uzoBqj9ng/t+
 EFpWosEYzWejLzvTu1Bjvd4u5MAlivbrRnLRMjMfuVHGn0lk6E5xGLqRZs6afOtc8c
 SYeeknMVdh8Ikld407i7xVPx2i0/h6I2pLkXnOgloW9j9ZrZa/OkqaAfpbGDOZjNpJ
 726ZtnhyNIwlhqnaH68sGapgpXtajy8uqaA7IHDbJGyFupXqg/fdqFU9YA2D8CGGvs
 JXtfLbRWHbGtx5EOJuo+kL+Wh1rV5LD7kN3bAl4LuNNiiS6AWwXNixXdTwbJAnTXyp
 H2SE4ozHo1jxw==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1rcOH5-000000005Em-1y3j;
 Tue, 20 Feb 2024 12:26:59 +0100
Date: Tue, 20 Feb 2024 12:26:59 +0100
From: Johan Hovold <johan@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Johan Hovold <johan+linaro@kernel.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Vinod Koul <vkoul@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Rob Clark <robdclark@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH 3/6] soc: qcom: pmic_glink_altmode: fix drm bridge
 use-after-free
Message-ID: <ZdSMg63b4ZGYhUXO@hovoldconsulting.com>
References: <20240217150228.5788-4-johan+linaro@kernel.org>
 <9ff4221a-7083-4cb1-abde-1690f655da8d@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ff4221a-7083-4cb1-abde-1690f655da8d@web.de>
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

On Tue, Feb 20, 2024 at 11:55:57AM +0100, Markus Elfring wrote:
> …
> > Specifically, the dp-hpd bridge is currently registered before all
> > resources have been acquired which means that it can also be
> > deregistered on probe deferrals.
> >
> > In the meantime there is a race window where the new aux bridge driver
> > (or PHY driver previously) may have looked up the dp-hpd bridge and
> > stored a (non-reference-counted) pointer to the bridge which is about to
> > be deallocated.
> …
> > +++ b/drivers/soc/qcom/pmic_glink_altmode.c
> …
> > @@ -454,7 +454,7 @@ static int pmic_glink_altmode_probe(struct auxiliary_device *adev,
> >  		alt_port->index = port;
> >  		INIT_WORK(&alt_port->work, pmic_glink_altmode_worker);
> >
> > -		alt_port->bridge = drm_dp_hpd_bridge_register(dev, to_of_node(fwnode));
> > +		alt_port->bridge = devm_drm_dp_hpd_bridge_alloc(dev, to_of_node(fwnode));
> >  		if (IS_ERR(alt_port->bridge)) {
> >  			fwnode_handle_put(fwnode);
> >  			return PTR_ERR(alt_port->bridge);
> …
> 
> The function call “fwnode_handle_put(fwnode)” is used in multiple if branches.
> https://elixir.bootlin.com/linux/v6.8-rc5/source/drivers/soc/qcom/pmic_glink_altmode.c#L435
> 
> I suggest to add a jump target so that a bit of exception handling
> can be better reused at the end of this function implementation.

Markus, as people have told you repeatedly, just stop with these
comments. You're not helping, in fact, you are actively harmful to the
kernel community as you are wasting people's time.

Johan
