Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C446C446E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 08:53:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABCB410E379;
	Wed, 22 Mar 2023 07:53:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E56B10E3B2;
 Wed, 22 Mar 2023 07:53:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0AAAEB81A34;
 Wed, 22 Mar 2023 07:53:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B16C4C433D2;
 Wed, 22 Mar 2023 07:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679471606;
 bh=6us+L/XQm1baJWcqSucEebFsFr6/7LTQQTA45/1sK9w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V4b2fGg2pHM3FPEW87yN8n2hsakjJoVAowHip1XmWw9BlkHBJnQTwMUcrtY/RTApR
 NBxyBX1jk0AXYSSfcc+SK/cOziReWXUJTz56jIsU3m2LovjxjDOpZDHuLFkrOpr3UR
 WFAEbz6J6SzyEVvYklOVKrpYcKhYoTDfBwsidTwWX3RWP2rbJKLfG1+0h3fgvxKUDT
 b9yEnkojuNKFSnSNFfii3Chzy+3S0neYSnNKMDh8lDqOau12JKTdFG9sIQFL9BupPQ
 HNmBUEECqb+cfaT5yZXOXtXmiyfvk+3QEwSjdu+5BKkGsuyD+vyyurvs4rdJF9Cu1u
 o5hROj9r5DsBg==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1petJ7-0002VJ-38; Wed, 22 Mar 2023 08:54:53 +0100
Date: Wed, 22 Mar 2023 08:54:53 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 00/10] drm/msm: fix bind error handling
Message-ID: <ZBq0TaDON8iJ3/Rh@hovoldconsulting.com>
References: <20230306100722.28485-1-johan+linaro@kernel.org>
 <ZBmq12uP+TY4EaE3@hovoldconsulting.com>
 <6b2f4d0d-ba39-dd2b-e41e-b5accb4df1a2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b2f4d0d-ba39-dd2b-e41e-b5accb4df1a2@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 21, 2023 at 05:21:56PM +0200, Dmitry Baryshkov wrote:
> On 21/03/2023 15:02, Johan Hovold wrote:
> > On Mon, Mar 06, 2023 at 11:07:12AM +0100, Johan Hovold wrote:
> >> I had reasons to look closer at the MSM DRM driver error handling and
> >> realised that it had suffered from a fair amount of bit rot over the
> >> years.
> >>
> >> Unfortunately, I started fixing this in my 6.2 branch and failed to
> >> notice two partial and, as it turned out, broken attempts to address
> >> this that are now in 6.3-rc1.
> >>
> >> Instead of trying to salvage this incrementally, I'm reverting the two
> >> broken commits so that clean and backportable fixes can be added in
> >> their place.
> >>
> >> Included are also two related cleanups.
> > 
> > Any further comments to these patches (except for 9/10, which should be
> > dropped)?
> > 
> > As the patches being reverted here were first added in 6.3-rc1 there is
> > still time to get this into 6.3-rc (e.g. before AUTOSEL starts trying to
> > backport them).
> 
> I will take a look at the patches. Additional question, as you have been 
> looking into this area. We have plenty of code which is only called 
> under the `if (kms)` condition. Could you hopefully move these parts to 
> separate functions, so that the error handling is also simpler? If not, 
> I'll put this to my todo list, but it might take some time before I have 
> time for that.

There's definitely room for cleaning up the bind/unbind paths further,
but for this series I focus on correctness while maintaining symmetry
(e.g. if an allocation was done under if (kms), then the release should
be done under the same).

I don't think I will have time to look at this further for a few weeks
either, but I'll add it to my list of future work as well and I'll check
in with you before actually working on it.

Johan
