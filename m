Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFBC4B98E9
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 07:10:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5925610E709;
	Thu, 17 Feb 2022 06:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE54610E6FF;
 Thu, 17 Feb 2022 06:10:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B4128B80D56;
 Thu, 17 Feb 2022 06:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3767C340E8;
 Thu, 17 Feb 2022 06:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645078208;
 bh=i3fhCS7y6EEHohO6KNRuRf7uAzQv8fU9N54p/nBpQuw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nN7uM8xTOeEfeH3sIbZ7M6bnyYm46Skv29uEWZu0tUGdRPj9d2cYRFd59U2mss+oj
 VSHFt0sASkvxbrfxBUhQQnRNiNXb/5LBFWAXHsOIIgOGNDJa3Nav9RcFkjKtSPPdBf
 cBqQ+d194G7Yo0qUDvCTsEP4jU6LfhYiUQAr3ZYWh/g1PXHu/5Y96ncwadnOUrBLSS
 bWDNPhJlGwX1k6tURYjZ3cMMoqSUEssSyPd0zwID91fjv6pRAYXOUBUvbnYHVTiZ/+
 dpWKM230JCHLNqFCXbM8mwFLOT87isHWV3lwMA5s5QBI4NYLrR3k5lPxgOzEBu20Y/
 V28W70niycPVQ==
Date: Thu, 17 Feb 2022 11:40:04 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [REPOST PATCH v4 08/13] drm/msm/disp/dpu1: Don't use DSC with
 mode_3d
Message-ID: <Yg3mvEvqYs89dJWI@matsya>
References: <20220210103423.271016-1-vkoul@kernel.org>
 <20220210103423.271016-9-vkoul@kernel.org>
 <67006cc4-3385-fe03-bb4d-58623729a8a8@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67006cc4-3385-fe03-bb4d-58623729a8a8@quicinc.com>
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16-02-22, 19:11, Abhinav Kumar wrote:
> 
> 
> On 2/10/2022 2:34 AM, Vinod Koul wrote:
> > We cannot enable mode_3d when we are using the DSC. So pass
> > configuration to detect DSC is enabled and not enable mode_3d
> > when we are using DSC
> > 
> > We add a helper dpu_encoder_helper_get_dsc() to detect dsc
> > enabled and pass this to .setup_intf_cfg()
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> 
> We should not use 3D mux only when we use DSC merge topology.
> I agree that today we use only 2-2-1 topology for DSC which means its using
> DSC merge.
> 
> But generalizing that 3D mux should not be used for DSC is not right.
> 
> You can detect DSC merge by checking if there are two encoders and one
> interface in the topology and if so, you can disable 3D mux.

Right now with DSC we disable that as suggested by Dmitry last time.
Whenever we introduce merge we should revisit this, for now this should
suffice

-- 
~Vinod
