Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D38D3489E6D
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 18:33:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4107112C94;
	Mon, 10 Jan 2022 17:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55CC1112C94
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 17:33:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id D1F011F41363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641836013;
 bh=2g3G8luaz7ZD7KDtSA8vvM2OkKCtTnXdaPyiMq/li4o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UUtwoWJQolaU0Y8Or88wO8xZP6aNj7MXNPv1KLki5CEg0FiL44bsKgx9JH3QvzYYg
 0lMJE9zIaycVkZLoIhKxVd8rAlg/lPVlLARElU4XY1DleVdOkPp7iCNVgYC7W6cev2
 UWKC8NQeQ4OM8hjYQT4fdzJHiTtmoCE/YFwOjjp/qk5PGuoIIA40wnp2eIULDmSq2g
 NHUBV7v8JZCEgeaxIMCQxHYEkV3GF+V5O0WPCSEQX8ZLW1JLGlrk9TOhHG29TihYXt
 P+jpmKlYZPMSRtFRB6m786ephM1jURVLKKzjZDVzxy9hqF6r8wWD9PoDZIY9KaIjnX
 oDohSMgKlus5Q==
Date: Mon, 10 Jan 2022 12:33:26 -0500
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [RFC PATCH] drm/panfrost: Handle IDVS_GROUP_SIZE feature
Message-ID: <Ydxt5hXewcx9st1m@maud>
References: <20220109171254.3183-1-alyssa.rosenzweig@collabora.com>
 <4628eb5a-b644-47af-a865-73300460a92b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4628eb5a-b644-47af-a865-73300460a92b@arm.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > This feature adds an extra IDVS group size field to the JM_CONFIG
> > register. In kbase, the value is configurable via the device tree; kbase
> > uses 0xF as a default if no value is specified. Until we find a device
> > demanding otherwise, let's always set the 0xF default on devices which
> > support this feature mimicking kbase's behaviour.
> 
> This is a performance thing - so I don't think it will break anything if
> this is wrong, it just won't be optimal.

Then interpret my remarks as hardcoding the default until we find a
device where setting to something other than 0xF improves performance
nontrivially. (Read: I am lazy and do not want to write dt-bindings for
something nobody will ever use.)

> > As JM_CONFIG is an undocumented register, it's not clear to me what
> > happens if we fail to include this handling. Index-driven vertex shading
> > already works on Bifrost boards with this feature without this handling.
> > Perhaps this has performance implications? Patch untested for the
> > moment, wanted to give Steven a chance to comment.
> 
> As it's a performance thing you shouldn't see correctness issues with
> not setting it. But 0xF seems to have been chosen as it gave the best
> overall performance (although for individual test content this can
> vary). AFAICT the performance impact isn't massive either.

Good to know, will update the commit message accordingly.

> Reviewed-by: Steven Price <steven.price@arm.com>
> 
> Since you've tagged this RFC I won't merge it now, but it looks correct
> to me.

Thanks for the review... I hope you like reviewing Panfrost patches
because I have a Valhall bring-up series waiting o:)

When I get a chance to uprev the kernel on my G52 board I'll see if I
can benchmark the impact of this change, so far this is only
compile-tested. Even if there's no impact the patch should likely go in
to stay consistent with kbase, but hopefully there's a win from this. At
that point I'll send a v2 with your reviewed-by (and hopefully no
changes other than the commit message) and we'll land that.
