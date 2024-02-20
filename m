Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 111E785B3E9
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 08:25:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF2010E02A;
	Tue, 20 Feb 2024 07:25:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y6WSjOKx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4605610E02A;
 Tue, 20 Feb 2024 07:25:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 63889CE1312;
 Tue, 20 Feb 2024 07:24:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96CECC433C7;
 Tue, 20 Feb 2024 07:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708413898;
 bh=Km8gZMkJB7vNwcEvKJf3Z5MjG8s2kLrFv7d6SMKvVC4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y6WSjOKxHt9TBefi2fivgCw5sGg4pib4PrIDZmtoesOTgo80CtchhROVw3pw0FeqR
 Pc9MGfrCfAKPZbAgDQVs+NvTqOslO+bcwY0+bPdxSK2Sx7n0x9RIur2VOHGKxXS5q1
 ZojucTaTTOXH7nqkaDAr7oKNW9keBDciLLBBztXj3jG96Dqy7egDtQFdz8u2Q2iBJt
 aWy2UUb55Fmr0MdRm5gJysrUBrLO6+m7+7BBeis1O8wXCAb8JBXQ17KOHFtUMJxzgm
 /zoywKFK7JfGrRP4yu7ts9/D14Ft57GqR0srDYm1N84JAeD8Tp4Vli9+dIMNop2M/1
 B2HwmHPKoXLyg==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1rcKUp-0000000024l-2ZkS;
 Tue, 20 Feb 2024 08:24:56 +0100
Date: Tue, 20 Feb 2024 08:24:55 +0100
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
 Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 1/6] drm/bridge: aux-hpd: fix OF node leaks
Message-ID: <ZdRTx2lmHBVlcLub@hovoldconsulting.com>
References: <20240217150228.5788-2-johan+linaro@kernel.org>
 <c95f5ff3-8dad-4302-9384-92a9b83f7bdc@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c95f5ff3-8dad-4302-9384-92a9b83f7bdc@web.de>
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

On Mon, Feb 19, 2024 at 06:48:30PM +0100, Markus Elfring wrote:
> > The two device node references taken during allocation need to be
> > dropped when the auxiliary device is freed.
> …
> > +++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> …
> > @@ -74,6 +75,8 @@ struct device *drm_dp_hpd_bridge_register(struct device *parent,
> >
> >  	ret = auxiliary_device_init(adev);
> >  	if (ret) {
> > +		of_node_put(adev->dev.platform_data);
> > +		of_node_put(adev->dev.of_node);
> >  		ida_free(&drm_aux_hpd_bridge_ida, adev->id);
> >  		kfree(adev);
> >  		return ERR_PTR(ret);
> 
> The last two statements are also used in a previous if branch.
> https://elixir.bootlin.com/linux/v6.8-rc5/source/drivers/gpu/drm/bridge/aux-hpd-bridge.c#L63
> 
> How do you think about to avoid such a bit of duplicate source code
> by adding a label here?

No, the current code is fine and what you are suggesting is in any case
unrelated to this fix.

If this function ever grows a third error path like that, I too would
consider it however.

Johan
