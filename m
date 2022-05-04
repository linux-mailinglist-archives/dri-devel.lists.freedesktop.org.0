Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AEF51A034
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 15:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9F010E526;
	Wed,  4 May 2022 13:04:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B40510E734;
 Wed,  4 May 2022 13:04:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AA222618BB;
 Wed,  4 May 2022 13:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 437A0C385A4;
 Wed,  4 May 2022 13:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651669491;
 bh=zHWcpt3bK0TDTAN2FqBM6HMQFW9CX5zg/jNylvcfIaA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FsdkLXYTzrKjJsxb6Vs5S1KirEgfixOt3aUhgUTJPttgvk84wO6C8pol8JoyxCmXA
 Y4ahHI4GNvXe5SMR4RN7uJfkn1x4Fm4hD1kAw929vpPljMTXc2f9BiDe+0s6Hfjhq3
 o0rskrEMhOW5teED8d8vadEBcyEOInauvQl8Rpr1urZDA8mAmnFaA4esTxE8kkdeyl
 GtshsPlmWckS2evRqHw++8QKMJ2fUOcZaH+q+jtsH4Rw/xsjfbT9rgmkQNgihse2oi
 bxTdeVeN47eOFPhlJmoACu3Yk0PvYh6MXipHWBrm603kOb8COM/rcrd0JGcueKW18G
 ahHYo63ZDXITQ==
Date: Wed, 4 May 2022 18:34:46 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 0/3] drm: move dsc data pointer from drm_panel to
 mipi_dsi_device
Message-ID: <YnJ57lXGyc8zcj0m@matsya>
References: <20220501151220.3999164-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220501151220.3999164-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01-05-22, 18:12, Dmitry Baryshkov wrote:
> To properly support DSC the sink driver (panel) has to pass DSC pps data
> to the source (DSI host). The commit 0f40ba48de3b ("drm/msm/dsi: Pass
> DSC params to drm_panel") added a pointer to the DSC data to the struct
> drm_panel. However this is not the ideal solution.
> 
> First, this leaves DSC-supporting DSI sink bridges (like ANX7625 which
> support DSC decoding on the MIPI DSI inputs).
> 
> Second, this does not play well with the panel_bridge. Drivers depending
> solely on the bridge chains will still have to lookup panel and fetch
> data from it.
> 
> Last, but not least, the DSC data is not relevant for the wide variety
> of panels including DPI and LVDS panels.
> 
> To solve all these problems, move struct drm_dsc_config pointer from
> struct drm_panel to struct mipi_host_device. This way MIPI DSI host
> driver receives DSC data during attach callback without additional
> lookups.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

I tested this on my pixel3 and had to change how panel driver handles
this, with that it worked just fine

Tested-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
