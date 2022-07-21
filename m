Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF58857C906
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 12:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8027611B136;
	Thu, 21 Jul 2022 10:31:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E0E11B136;
 Thu, 21 Jul 2022 10:31:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 182D6B8239B;
 Thu, 21 Jul 2022 10:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A26C5C3411E;
 Thu, 21 Jul 2022 10:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658399502;
 bh=6cLo27J62FOn04WxOUjgMwROfE1fTOAuDjpYF7NaDwc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N3WbGRRLy3Wz7OLnE9xyJeuJ98YmI7krfBHCmOr89Wmr2NSJ51Y1NwhDSZL7do3tP
 lDY5qvEUEDGK3ZBTiKL6N3H0ZCT07piH6XgcsUP+1DBs4MSdglmBv/lSRCP7uEwIHo
 4mMndlxHuavBGafCJSi0YU/mpbIMU/S7s9VfQkW5w5ZxcFERww4ElkI91OGgELqIFf
 G5EdrwfFRy/DS54kxVu04FF7CbSzVwYK0jaycvcvAL/EaMtRLm1k6f/I0Phvlp7+5P
 ds4flliAvV07XpVp3S/h8s82GLcwQx4i1luvClq9ETl2HPWemt3/RFm/UWrzIwcSD5
 4u7MTyS1qBAOQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1oETT3-00058P-6k; Thu, 21 Jul 2022 12:31:41 +0200
Date: Thu, 21 Jul 2022 12:31:41 +0200
From: Johan Hovold <johan@kernel.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v16 0/3] eDP/DP Phy vdda realted function
Message-ID: <YtkrDcjTGhpaU1e0@hovoldconsulting.com>
References: <1657038556-2231-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1657038556-2231-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, Liam Girdwood <lgirdwood@gmail.com>,
 airlied@linux.ie, freedreno@lists.freedesktop.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 agross@kernel.org, linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 quic_aravindh@quicinc.com, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 05, 2022 at 09:29:13AM -0700, Kuogee Hsieh wrote:
> 0) rebase on https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git tree
> 1) add regulator_set_load() to eDP phy
> 2) add regulator_set_load() to DP phy
> 3) remove vdda related function out of eDP/DP controller
> 
> Kuogee Hsieh (3):
>   phy: qcom-edp: add regulator_set_load to edp phy
>   phy: qcom-qmp: add regulator_set_load to dp phy
>   drm/msm/dp: delete vdda regulator related functions from eDP/DP
>     controller
> 
>  drivers/gpu/drm/msm/dp/dp_parser.c        | 14 -----
>  drivers/gpu/drm/msm/dp/dp_parser.h        |  8 ---
>  drivers/gpu/drm/msm/dp/dp_power.c         | 95 +------------------------------
>  drivers/phy/qualcomm/phy-qcom-edp.c       | 12 ++++
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 41 ++++++++++---
>  5 files changed, 46 insertions(+), 124 deletions(-)

This series breaks USB and PCIe for some SC8280XP and SA540P machines
where the DP PHY regulators are shared with other PHYs whose drivers do
not request a load.

Specifically, the hard-coded vdda-phy load of 21.8 mA added by this
series, causes several RPMh regulators to now be put in low-power mode.

I found Doug's suggestion to handle situations like this in regulator
core:

	https://lore.kernel.org/all/20180814170617.100087-1-dianders@chromium.org/

but since that was rejected, how do we deal with this generally?

In the above thread Doug mentioned adding support for load requests to
further drivers and Bjorn mentioned working around it by adding
regulator-system-load properties to DT.

It seems quite likely that changes like this one affects other systems
too, and the effects may be hard to debug. So a more general solution
than playing whack-a-mole using DT would be good to have.

Johan
