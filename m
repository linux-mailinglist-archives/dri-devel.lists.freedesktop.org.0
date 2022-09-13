Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E253B5B6B0D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 11:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE39310E683;
	Tue, 13 Sep 2022 09:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17FE10E683;
 Tue, 13 Sep 2022 09:44:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 728B1B80E3B;
 Tue, 13 Sep 2022 09:44:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10818C433D7;
 Tue, 13 Sep 2022 09:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663062289;
 bh=skvVraM7srPfIkoWZ6q9hkoJ56QIEuw02+nE/Cr6Icc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IJcLpDVPQYoTsaLIa2Bw02A71s4zAIU/2K2mPrNcwIjbrggvd8Zys1RxGdqFH7dZ6
 t+ETJjw2MBtdK2c9lb5a01S3gSmJdrqBKw1eaDu8UdRIowiwXLTfm1z6dJpszAPN1w
 tKVSP4KvPHz/atuJWecf4SCFsP8IbVI/zP5pOavv5GTgcJUYxpospxrIjDz8Xe/zP7
 zk/hMtqoQKCTIDd/HbrnM0IqXozOmGDqLyC5/sXjmnosoiYLAxtSBdX3TUuPHNzYsj
 c1yMu6eOXUNUkoJoi1bZNmrPhQPTsX+VeYAAJ9CwWTDy8YvSqaQoYr/r7FgGV4cl66
 2D18c3wQTDKPg==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1oY2TI-0002f3-2i; Tue, 13 Sep 2022 11:44:48 +0200
Date: Tue, 13 Sep 2022 11:44:48 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [RFC PATCH 0/3] drm/msm/dp: several fixes for the IRQ handling
Message-ID: <YyBREIfwOQy687zH@hovoldconsulting.com>
References: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 01, 2022 at 12:15:24PM +0300, Dmitry Baryshkov wrote:
> Johan Hovold has reported that returning a probe deferral from the
> msm_dp_modeset_init() can cause issues because the IRQ is not freed
> properly. This (compile-tested only) series tries to fix the issue by
> moving devm_request_irq() to the probe callback.

For reference, here's an analysis of the underlying problem and a series
of fixes that addresses this:

	https://lore.kernel.org/all/20220913085320.8577-1-johan+linaro@kernel.org/

Note that moving the irq request to probe also fixes the immediate
issue, but that can now be done as a follow-on cleanup (optimisation)
instead.

> Dmitry Baryshkov (3):
>   drm/msm/dp: fold disable_irq into devm_request_irq
>   drm/msm/dp: switch to using platform_get_irq()
>   drm/msm/dp: move dp_request_irq() call to dp_display_probe()
> 
>  drivers/gpu/drm/msm/dp/dp_display.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)

Johan
