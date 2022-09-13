Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9272E5B690D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 09:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5CBC10E637;
	Tue, 13 Sep 2022 07:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 731F510E637;
 Tue, 13 Sep 2022 07:53:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D53A66133B;
 Tue, 13 Sep 2022 07:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39DA7C433D7;
 Tue, 13 Sep 2022 07:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663055626;
 bh=rFPbnv2DxX3rBK1a7Jmm1zE+iq04DfP9/i/2IqvALRc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hlGrmphSQgEThIAQsJUpshNn2BE0nacqeqs8Un/E4gMkyv1wHHJevTQNjLxpzPwPO
 79tm1goievGKLE8mqyJYBRtHSP2cbkez1QlJfEtWCp67OAaS1wkzYC+Hsv+r++ibRf
 +8s88EmcISfP1CLtcVK9YQKe2RNDEMYIHwq0SB+zhJrR30JQm34isT9nd2jzII2ddg
 Gh+XeLDhPYWBdpk2sp1AlTHVOv4V363IpEu8P2J+90YBc5ZBH+w7iKtiVuOS45et7I
 eTtpsdSjQrXqo2fLL3nixe2uzN8mejPBbKLMNWXIFmeQidRgiWQmzL0fBwOiOhT7XR
 fA5hXas4pgW8w==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1oY0jo-00010R-LD; Tue, 13 Sep 2022 09:53:44 +0200
Date: Tue, 13 Sep 2022 09:53:44 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 7/7] drm/msm: drop modeset sanity checks
Message-ID: <YyA3CDQit8OR6DgL@hovoldconsulting.com>
References: <20220912154046.12900-1-johan+linaro@kernel.org>
 <20220912154046.12900-8-johan+linaro@kernel.org>
 <39cbf0cb-9f25-6a0d-6e56-3f9e0aaa0296@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39cbf0cb-9f25-6a0d-6e56-3f9e0aaa0296@linaro.org>
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
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 12, 2022 at 09:06:28PM +0300, Dmitry Baryshkov wrote:
> On 12/09/2022 18:40, Johan Hovold wrote:
> > Drop the overly defensive modeset sanity checks of function parameters
> > which have already been checked or used by the callers.
> > 
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> 
> Again, please split into dp and dsi patches. After that:

Sure, if you prefer. But without the stable-tree argument I think
there's little point in splitting.

> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> > ---
> >   drivers/gpu/drm/msm/dp/dp_display.c | 7 +------
> >   drivers/gpu/drm/msm/dsi/dsi.c       | 7 +------
> >   2 files changed, 2 insertions(+), 12 deletions(-)

Johan
