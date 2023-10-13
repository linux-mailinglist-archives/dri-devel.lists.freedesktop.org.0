Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AF77C8546
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 14:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB86410E5DE;
	Fri, 13 Oct 2023 12:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C9E310E5DE;
 Fri, 13 Oct 2023 12:05:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 38D60CE3110;
 Fri, 13 Oct 2023 12:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67647C433C7;
 Fri, 13 Oct 2023 12:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697198738;
 bh=nzkUtLBqmirZ6m/6sa9MukyVECkrLso7I7MyMjnA/gA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b35zLxn+F38/TILhl6VO9FmvMCSuPNzIzpLpZP/jSMd2JDh4SEwthFaIjP0ODkdO3
 HNLOXWKvywrH9gZ/vLIXaTGucPlEoeG/eUyM0U6zc0ZhQkKuxp+78PJyK0P0ePXx9z
 K3F3pnukV15Ld7Z+WWjcxRHnMXAJ9MQJoag8ODDaAyba7gAoRYV8FvipC5yvInrEDZ
 Foo1vxyJJ7zM8BqsXdVvr+wCHfCdIJIBjVEmyb8u4GYvuTLEy8IcB9NiL5Glk9O4XX
 b86ICOUpCa3IezU9mi3Oxv3HWhYpStHNMSMWnT8podKi7Aa4G3FmOdEV5UkHBL0i+5
 8vNXJdsdg4m0Q==
Received: from johan by xi.lan with local (Exim 4.96)
 (envelope-from <johan@kernel.org>) id 1qrGvh-0000sd-1v;
 Fri, 13 Oct 2023 14:06:09 +0200
Date: Fri, 13 Oct 2023 14:06:09 +0200
From: Johan Hovold <johan@kernel.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v1] drm/msm/dp: do not reinitialize phy unless retry
 during link training
Message-ID: <ZSkysaMcOQO89zpd@hovoldconsulting.com>
References: <1691533190-19335-1-git-send-email-quic_khsieh@quicinc.com>
 <ZRvaoz7CbNncM3t6@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZRvaoz7CbNncM3t6@hovoldconsulting.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, quic_jesszhan@quicinc.com, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, swboyd@chromium.org, sean@poorly.run,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 03, 2023 at 11:10:59AM +0200, Johan Hovold wrote:
> On Tue, Aug 08, 2023 at 03:19:50PM -0700, Kuogee Hsieh wrote:
> > DP PHY re-initialization done using dp_ctrl_reinitialize_mainlink() will
> > cause PLL unlocked initially and then PLL gets locked at the end of
> > initialization. PLL_UNLOCKED interrupt will fire during this time if the
> > interrupt mask is enabled.
> > However currently DP driver link training implementation incorrectly
> > re-initializes PHY unconditionally during link training as the PHY was
> > already configured in dp_ctrl_enable_mainlink_clocks().
> > 
> > Fix this by re-initializing the PHY only if the previous link training
> > failed.
> > 
> > [drm:dp_aux_isr] *ERROR* Unexpected DP AUX IRQ 0x01000000 when not busy
> > 
> > Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> > Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/30
> > Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> 
> This fixes the above warning and avoids the unnecessary PHY power-off
> and power-on during boot of the ThinkPad X13s:
> 
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> 
> I guess this one should go to stable as well:
> 
> Cc: stable@vger.kernel.org	# 5.10
> 
> Is anyone planning on getting this fixed in 6.6-rc? I noticed that this
> one still hasn't shown up linux-next.

For the record, this one showed up in a PR from Rob and has now been
forwarded to Linus.

No stable tag included, but I guess we can ping the stable team unless
AUTOSEL picks this up.

Johan
