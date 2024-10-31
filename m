Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D752D9B7C48
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 15:03:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A8410E89E;
	Thu, 31 Oct 2024 14:03:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gNaRND/I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F097A10E89E
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 14:02:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 49C3BA43C5A;
 Thu, 31 Oct 2024 14:01:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E98BC4CED0;
 Thu, 31 Oct 2024 14:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730383378;
 bh=rM7JeFz9gUYAeFhBr3i1Nmo+zAAoRiN+ZzEeAmzgmoE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gNaRND/I1qBIq+wxeeLp1W8IrXNFVkeVr16EJ1tTYRm9sd/vefEzYw5RfDzGyiCqQ
 zEbCuZ7MjZMdvzuZdShZ3v54Lk/GuDcyC35jCrNJfrgVhUbHdFXolCT/pE30UMY1+u
 1P79uF/lp7QOOvB2E388qNQpOX0IIOggV6XO6Nb43zMwAy28B9yTP9LLX2SJ7Fgnfg
 0pOsteXjLYtVw5LF8m+AKXiuQwdCwRJbPbICXSr13yenl7TeStlLf2IntYHnTZj2Ev
 utVev3D1dlXbXCTSv2jc2HSeu1gFanS0O8vZVGeINOACvF4QmQxeTjeV1eEGsUyz9Q
 riutsoBiCmDcg==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1t6VlI-000000004Jl-0qBS;
 Thu, 31 Oct 2024 15:02:56 +0100
Date: Thu, 31 Oct 2024 15:02:56 +0100
From: Johan Hovold <johan@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abel Vesa <abel.vesa@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] drm/bridge: Fix assignment of the of_node of the
 parent to aux bridge
Message-ID: <ZyOOEGsnjYreKQN8@hovoldconsulting.com>
References: <20241018-drm-aux-bridge-mark-of-node-reused-v2-1-aeed1b445c7d@linaro.org>
 <172951608323.1285208.3162107667310691864.b4-ty@linaro.org>
 <230b5910-6790-44cb-90ed-222bee89054d@linux.dev>
 <c2a4cc3a-2ffc-46f3-8636-238cd561f7aa@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2a4cc3a-2ffc-46f3-8636-238cd561f7aa@linaro.org>
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

On Thu, Oct 31, 2024 at 01:31:47PM +0100, Neil Armstrong wrote:
> On 30/10/2024 15:49, Sui Jingfeng wrote:
> > On 2024/10/21 21:08, Neil Armstrong wrote:
> >> On Fri, 18 Oct 2024 15:49:34 +0300, Abel Vesa wrote:
> >>> The assignment of the of_node to the aux bridge needs to mark the
> >>> of_node as reused as well, otherwise resource providers like pinctrl will
> >>> report a gpio as already requested by a different device when both pinconf
> >>> and gpios property are present.
> >>> Fix that by using the device_set_of_node_from_dev() helper instead.
> >>>
> >>>
> >>> [...]
> >> Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)
> > 
> > 
> > It's quite impolite to force push patches that still under reviewing,
> > this prevent us to know what exactly its solves.
> 
> It's quite explicit.

It's still disrespectful and prevents reviewers' work from being
acknowledged as I told you off-list when you picked up the patch.

You said it would not happen again, and I had better things to do so I
let this one pass, but now it seems you insist that you did nothing
wrong here.

We do development in public and we should have had that discussion in
public, if only so that no one thinks I'm ok with this.

Johan
