Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1166C322B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 14:00:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BC110E776;
	Tue, 21 Mar 2023 13:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8239210E776;
 Tue, 21 Mar 2023 13:00:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C6B1561B8C;
 Tue, 21 Mar 2023 13:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35F5BC433D2;
 Tue, 21 Mar 2023 13:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679403651;
 bh=B8D6tcxg6AwWwKpnpZveYJcDqvXwTVdwK/BrT8cTJoU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qLei1DH+Jz4h1XIQnNgpbQZd3+jU4dQ4RrgCf+OlAl8EGk9sEk68S2JreIDSHwv0z
 Tmo1/29yHxRZFpbbYp+nsVdKdckBQtQbAZvMrWTCSRe0gCAVG1CDXKtaAqptTvYuYn
 XtdV8FtbKrRnseZd5D4UQ/o6YLn1uIgPC+RGhk6yeXEfoFK2W0tQlaXq/MjcA84L4m
 fI0v3QlSuaSwO598vgR5NNXuGqVLgTQ9K1+9IqBRpcolwRh9btO2c3uz5R079yifWc
 w5yOZV7RgZVzXr5Arpq8mp+t1THppIqVZ/EuAHxGlRwWDP0UY6WNxwM5F+lLtvo112
 J0bGVENa9uAnw==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1pebd1-0005wz-6j; Tue, 21 Mar 2023 14:02:15 +0100
Date: Tue, 21 Mar 2023 14:02:15 +0100
From: Johan Hovold <johan@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 00/10] drm/msm: fix bind error handling
Message-ID: <ZBmq12uP+TY4EaE3@hovoldconsulting.com>
References: <20230306100722.28485-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230306100722.28485-1-johan+linaro@kernel.org>
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 06, 2023 at 11:07:12AM +0100, Johan Hovold wrote:
> I had reasons to look closer at the MSM DRM driver error handling and
> realised that it had suffered from a fair amount of bit rot over the
> years.
> 
> Unfortunately, I started fixing this in my 6.2 branch and failed to
> notice two partial and, as it turned out, broken attempts to address
> this that are now in 6.3-rc1.
> 
> Instead of trying to salvage this incrementally, I'm reverting the two
> broken commits so that clean and backportable fixes can be added in
> their place.
> 
> Included are also two related cleanups.

Any further comments to these patches (except for 9/10, which should be
dropped)?

As the patches being reverted here were first added in 6.3-rc1 there is
still time to get this into 6.3-rc (e.g. before AUTOSEL starts trying to
backport them).

Johan

> Johan Hovold (10):
>   Revert "drm/msm: Add missing check and destroy for
>     alloc_ordered_workqueue"
>   Revert "drm/msm: Fix failure paths in msm_drm_init()"
>   drm/msm: fix NULL-deref on snapshot tear down
>   drm/msm: fix NULL-deref on irq uninstall
>   drm/msm: fix drm device leak on bind errors
>   drm/msm: fix vram leak on bind errors
>   drm/msm: fix missing wq allocation error handling
>   drm/msm: fix workqueue leak on bind errors
>   drm/msm: use drmm_mode_config_init()
>   drm/msm: move include directive
> 
>  drivers/gpu/drm/msm/disp/msm_disp_snapshot.c |  3 -
>  drivers/gpu/drm/msm/msm_drv.c                | 67 +++++++++++++-------
>  2 files changed, 44 insertions(+), 26 deletions(-)
