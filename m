Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 207A27222D3
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 12:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F0910E1C7;
	Mon,  5 Jun 2023 10:02:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A6810E1C0;
 Mon,  5 Jun 2023 10:02:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CFD1C614C5;
 Mon,  5 Jun 2023 10:02:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32815C433EF;
 Mon,  5 Jun 2023 10:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685959330;
 bh=5abGnYlpGeIkAbmWOgFaqsPnq9GUfYv18EA1sRFxf0o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ks5F/7ZsXGFzvQYZkRtnA2uNecgZ73F6IwjUmpD7XAD38sPGLyy7BBTrNpEva1D/z
 ggXUOAtJ5VJYMufV+7FEXksc92u6nFd6nANf1AWy53Ysh4q2DrerwLPml8KN3Ti94j
 ckF2yIETt4QXljbFoh4CRE0/bF2eMPgVHhH4fRePhHhmP4VJW17UBpOThf/8PDalcO
 lVa7FcCmpssWJQE07mdlWlFrRMzy1hICOKUbgKniepMEcl91r4WtBZi/TvBl6YNEy1
 b0HDFg1cJuMDXrJWrV8j1eOTk6m+SOT6zHkxwQlx0NrNsSHTP+sbYejxW85OUGIpgg
 EQzmGCEwlD94Q==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1q672h-0005ky-7p; Mon, 05 Jun 2023 12:02:27 +0200
Date: Mon, 5 Jun 2023 12:02:27 +0200
From: Johan Hovold <johan@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] Revert "drm/msm/dp: set self refresh aware based on PSR
 support"
Message-ID: <ZH2ys6dVeL02JLCU@hovoldconsulting.com>
References: <20230523151646.28366-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230523151646.28366-1-johan+linaro@kernel.org>
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
Cc: freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, regressions@lists.linux.dev,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Johan Hovold <johan@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[ +CC: Thorsten and regzbot so they can help with tracking this
regression ]

#regzbot introduced: v6.3..v6.4-rc1

On Tue, May 23, 2023 at 05:16:46PM +0200, Johan Hovold wrote:
> This reverts commit 1844e680d56bb0c4e0489138f2b7ba2dc1c988e3.
> 
> PSR support clearly is not ready for mainline and specifically breaks
> virtual terminals which are no longer updated when PSR is enabled (e.g.
> no keyboard input is echoed, no cursor blink).
> 
> Disable PSR support for now by reverting commit 1844e680d56b
> ("drm/msm/dp: set self refresh aware based on PSR support").
> 
> Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
> 
> Bjorn reported that PSR support broke virtual terminals two months ago, 
> but this is still broken in 6.4-rc3:
> 
> 	https://lore.kernel.org/lkml/20230326162723.3lo6pnsfdwzsvbhj@ripper/
> 
> despite the following series that claimed to address this:
> 
> 	https://lore.kernel.org/lkml/1680271114-1534-1-git-send-email-quic_vpolimer@quicinc.com
> 
> Let's revert until this has been fixed properly.

Virtual terminals are still broken with 6.4-rc5 on the Lenovo ThinkPad
X13s two weeks after I reported this, and there has been no indication
of any progress in the other related thread:

	https://lore.kernel.org/lkml/ZHYPHnWoDbXB-fqe@hovoldconsulting.com

Seems like it is time to merge this revert to get this sorted.

Rob, Abhinav, Dmitry, can either of you merge this one and get it into
6.4-rc6?

Johan
