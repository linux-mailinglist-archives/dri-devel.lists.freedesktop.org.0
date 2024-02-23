Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C819B8613F1
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 15:28:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D4310EC21;
	Fri, 23 Feb 2024 14:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qlxz5wU2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E954D10EC20;
 Fri, 23 Feb 2024 14:28:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 208FD634C4;
 Fri, 23 Feb 2024 14:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D79C433C7;
 Fri, 23 Feb 2024 14:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708698493;
 bh=1bwXd+3rlYqKr6S6RrkPkb1QhvUSeD3Xj0QpioEvp0g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qlxz5wU2ZZTXuwZG085sWfqP0F0ZnnIzu6kH36RXg2c3DhQcDJz0r1vaSMXDi6pHv
 FpJQo8I04ZwU+Z/Aw3NTR5GecprmB+3GUuv56Q3x7H3OZsyIQbgHAvTk3waIZw35ie
 sE2qErqjfc7sqTKAcmUQKdIkEhUuXYCDGRIIrdudl8Mg0ekVlKrmIfF35bHxKpw1II
 JKiQE90ysGmye3bdhRVEvdYe5PWnJrfjs39aUE982s5p23bZTn0t/oE8fdPg3BhFog
 S9PXQKo/F10Ty92RN3E4CqTP6PjUJ6ejXMNcJ3dpx+VPdExSoePrXbaJzYlIT1kBJN
 G9M+5U/KqYuIg==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1rdWXB-000000004vJ-1N7T;
 Fri, 23 Feb 2024 15:28:18 +0100
Date: Fri, 23 Feb 2024 15:28:17 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: neil.armstrong@linaro.org, Bjorn Andersson <andersson@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Johan Hovold <johan+linaro@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: Re: [PATCH 0/6] soc: qcom: pmic_glink_altmode: fix drm bridge
 use-after-free
Message-ID: <ZdirgQdjn1Pg75--@hovoldconsulting.com>
References: <20240217150228.5788-1-johan+linaro@kernel.org>
 <170868613914.4029284.5549880672870201262.b4-ty@linaro.org>
 <3c4246b6-431a-442e-8ace-3b0d0e67743f@linaro.org>
 <ZdiU2z8rzo542_Ih@hovoldconsulting.com>
 <d4049823-ad24-4426-887b-9c66cdd96318@linaro.org>
 <CAA8EJppYHdSmsWMk-u=QaAaHWqjFj8zs4CF947eeex6iV4dsYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJppYHdSmsWMk-u=QaAaHWqjFj8zs4CF947eeex6iV4dsYw@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 23, 2024 at 04:18:08PM +0200, Dmitry Baryshkov wrote:
> On Fri, 23 Feb 2024 at 15:52, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> > On 23/02/2024 13:51, Johan Hovold wrote:
> > > On Fri, Feb 23, 2024 at 12:03:10PM +0100, Neil Armstrong wrote:
> > >> On 23/02/2024 12:02, Neil Armstrong wrote:

> > >>> Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)
> > >>>
> > >>> [1/6] drm/bridge: aux-hpd: fix OF node leaks
> > >>>         https://cgit.freedesktop.org/drm/drm-misc/commit/?id=9ee485bdda68d6d3f5728cbe3150eb9013d7d22b
> > >>> [2/6] drm/bridge: aux-hpd: separate allocation and registration
> > >>>         (no commit info)
> > >>> [3/6] soc: qcom: pmic_glink_altmode: fix drm bridge use-after-free
> > >>>         (no commit info)
> > >>> [4/6] soc: qcom: pmic_glink: Fix boot when QRTR=m
> > >>>         (no commit info)
> > >>> [5/6] phy: qcom-qmp-combo: fix drm bridge registration
> > >>>         (no commit info)
> > >>> [6/6] phy: qcom-qmp-combo: fix type-c switch registration
> > >>>         (no commit info)
> > >>>
> > >>
> > >> To clarify, I only applied patch 1 to drm-misc-fixes
> > >
> > > Ok, but can you please not do that? :)
> > >
> > > These patches should go in through the same tree to avoid conflicts.
> > >
> > > I discussed this with Bjorn and Dmitry the other day and the conclusion
> > > was that it was easiest to take all of these through DRM.
> >
> > I only applied patch 1, which is a standalone fix and goes into a separate tree,
> > for the next patches it would be indeed simpler for them to go via drm-misc when
> > they are properly acked.
> 
> I think PHY patches can go through a usual route (phy/next or
> phy/fixes).

They can, but I've explicitly asked Vinod to ack them so that they can
go in with the rest of the series through DRM.

They also fix a regression that came in through DRM in 6.8-rc1 (the
bridge rework which started registering child devices) so it makes sense
to also route the fix the same way. And to do it for this cycle.

> For patches 3 and 4 I'd need an ack from Bjorn to merge
> them through drm-misc-next or drm-misc-fixes.

You have Bjorn's ack. He's reviewed all the patches for this purpose and
we discussed this in person two days ago.

And, again, this has to go in for *this* cycle. You broke the display on
the X13s and other machines so this cannot wait for 6.9.

Johan
