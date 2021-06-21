Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9403AF831
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 00:01:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65FE96E432;
	Mon, 21 Jun 2021 22:01:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A808D6E432
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 22:01:47 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1624312911; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=mKdPiX5ceufqkEx8Nci/j3NszUX+oF1c+HY50pFYGus=;
 b=T+fKYfbGiEOa81H+ZeYxTjnAnCx+OtTgpMSXlpThwV2R7bVGx51qQ7KrLbLr8onARlyKEa2r
 4iGeMnrAaBRzBdL4WMCIXi7wF2EmScC2qHdyewIsn9s6zcNqEHTDhYpchsiaSmlZSSCxjq3M
 SwrxU5p6Lo/1AjvafaFKKu+LzBg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60d10c372eaeb98b5ef06bd3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 21 Jun 2021 22:01:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B4076C43217; Mon, 21 Jun 2021 22:01:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8895CC433F1;
 Mon, 21 Jun 2021 22:01:26 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 21 Jun 2021 15:01:26 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH 0/8] dsi: rework clock parents and timing
 handling
In-Reply-To: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
References: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
Message-ID: <5156aeb320b5625959fff8364e216c2f@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-05-15 06:12, Dmitry Baryshkov wrote:
> This patch series brings back several patches targeting assigning 
> dispcc
> clock parents, that were removed from the massive dsi rework patchset
> earlier.
> 
> Few notes:
>  - assign-clock-parents is a mandatory proprety according to the 
> current
>    dsi.txt description.

Is this comment still right? dsi.txt has now moved to YAML format, but 
even before
that I am not able to see that this was a mandatory property. With these 
changes yes,
it becomes a mandatory property and hence needs to be documented that 
way.

>  - There is little point in duplicating this functionality with the 
> ad-hoc
>    implementation in the dsi code.
> 
> On top of that come few minor cleanups for the DSI PHY drivers.
> 
> I'd kindly ask to bring all dts changes also through the drm tree, so
> that there won't be any breakage of the functionality.
> 
> 
> The following changes since commit 
> f2f46b878777e0d3f885c7ddad48f477b4dea247:
> 
>   drm/msm/dp: initialize audio_comp when audio starts (2021-05-06
> 16:26:57 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.linaro.org/people/dmitry.baryshkov/kernel.git 
> dsi-phy-update
> 
> for you to fetch changes up to 
> f1fd3b113cbb98febad682fc11ea1c6e717434c2:
> 
>   drm/msm/dsi: remove msm_dsi_dphy_timing from msm_dsi_phy (2021-05-14
> 22:55:11 +0300)
> 
> ----------------------------------------------------------------
> Dmitry Baryshkov (8):
>       arm64: dts: qcom: sc7180: assign DSI clock source parents
>       arm64: dts: qcom: sdm845: assign DSI clock source parents
>       arm64: dts: qcom: sdm845-mtp: assign DSI clock source parents
>       arm64: dts: qcom: sm8250: assign DSI clock source parents
>       drm/msm/dsi: stop setting clock parents manually
>       drm/msm/dsi: phy: use of_device_get_match_data
>       drm/msm/dsi: drop msm_dsi_phy_get_shared_timings
>       drm/msm/dsi: remove msm_dsi_dphy_timing from msm_dsi_phy
> 
>  arch/arm64/boot/dts/qcom/sc7180.dtsi            |  3 ++
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts         |  3 ++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi            |  6 +++
>  arch/arm64/boot/dts/qcom/sm8250.dtsi            |  6 +++
>  drivers/gpu/drm/msm/dsi/dsi.h                   |  7 +---
>  drivers/gpu/drm/msm/dsi/dsi_host.c              | 51 
> -------------------------
>  drivers/gpu/drm/msm/dsi/dsi_manager.c           |  8 +---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c           | 46 
> ++++++++++------------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h           | 10 ++++-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      | 11 ++----
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      | 11 ++----
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c      | 10 +----
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      | 12 ++----
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 10 +----
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       | 13 ++-----
>  15 files changed, 67 insertions(+), 140 deletions(-)
> 
> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
