Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E91B95E73CE
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 08:17:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 780D810E3DF;
	Fri, 23 Sep 2022 06:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D52D510E3D1;
 Fri, 23 Sep 2022 06:17:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3610B6194F;
 Fri, 23 Sep 2022 06:17:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 923D2C433D6;
 Fri, 23 Sep 2022 06:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663913843;
 bh=087222Xy8pZjxNKwBirqYA3XIzVV/4i7Mss3vpSpd14=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JWIwwHV/RaIiU6aBqkf7d1JFcWRbDborvpLhn3FVp0PRRXG/Ofa8dYm9RTBoMHfMx
 KbV2rEc7i7fUrlTOCJ5CtIynqpFMnkVUjp6hjHhZRtiFI9wlEtLYsbG7x8WALnduAz
 wGQpsJUKd5Gd1j3aZoJf/HPbJpTfR7meZCsOdBM5gs8e+d5xf1Kb5ZzUv2NCTRrXWq
 NimW7ZebHGANSFgKT4lEFWpoedoa01T9VVg8KIHDcXX/sL2Q0Pkni/0oFw1xWqbu5n
 B8bWTYdit0IMdjyJA5OIFtqQ3RC5CsUzu9tNzs9O8SyKJewh5pH9EPvvufNCR222Pp
 g9Vw4qFwOo+VQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1obc06-0006GM-An; Fri, 23 Sep 2022 08:17:26 +0200
Date: Fri, 23 Sep 2022 08:17:26 +0200
From: Johan Hovold <johan@kernel.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v2 08/10] drm/msm/hdmi: fix IRQ lifetime
Message-ID: <Yy1Pdr6gxGR1O+o2@hovoldconsulting.com>
References: <20220913085320.8577-1-johan+linaro@kernel.org>
 <20220913085320.8577-9-johan+linaro@kernel.org>
 <9e223c13-15e2-de5e-e1e1-0dbbe629a0a1@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e223c13-15e2-de5e-e1e1-0dbbe629a0a1@quicinc.com>
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
Cc: dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Sean Paul <sean@poorly.run>, Johan Hovold <johan+linaro@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, stable@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 22, 2022 at 12:55:03PM -0700, Kuogee Hsieh wrote:
> 
> On 9/13/2022 1:53 AM, Johan Hovold wrote:
> > Device-managed resources allocated post component bind must be tied to
> > the lifetime of the aggregate DRM device or they will not necessarily be
> > released when binding of the aggregate device is deferred.
> >
> > This is specifically true for the HDMI IRQ, which will otherwise remain
> > requested so that the next bind attempt fails when requesting the IRQ a
> > second time.
> >
> > Fix this by tying the device-managed lifetime of the HDMI IRQ to the DRM
> > device so that it is released when bind fails.
> >
> > Fixes: 067fef372c73 ("drm/msm/hdmi: refactor bind/init")
> > Cc: stable@vger.kernel.org      # 3.19
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> 
> > Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> > Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

I believe you meant:

Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

here (i.e. without the '>' quotes). Otherwise the tooling may not pick
these up.

Thanks for reviewing and testing.

Johan
