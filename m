Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD339B802C
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 17:32:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E95010E414;
	Thu, 31 Oct 2024 16:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pC0YxoPp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 196C710E414
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 16:32:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A31D6A44549;
 Thu, 31 Oct 2024 16:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A5E5C4CEE5;
 Thu, 31 Oct 2024 16:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730391813;
 bh=RRfz1nNuXVubsejbLWVePhc2pbS8lDWqOzVyNPvpWwU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pC0YxoPpS80Zc6ELbbZ+TbDyuTkQF5d9e71F4HKlNzW2W5qbyi63uEr6B+nzSpCqS
 HZvpnlwAtKHP7VHI4ts0KMbHWGXKOuwgg4uaVeJoSKT3OrWCaXGQQ2fl7iJW0sUFAZ
 R0VTQd9ZBBclJFYoWcDRkwbtO+nuBzaOmPFPxikcr76JJcvqHfPiQ+Pd/Eqty3VlOo
 n5WEYqjCB665Kg/5OQh7wFyv7qM/i5BFjeSpn3TE+jGbjo3KvUuiNWtUsjTWSRiy48
 JhWd8JxHPXpOMRyOR/aOtWGRrE+x32N9+HXzMaf5ST5u3byA4fTIzzd0BA/TZjg6AV
 tTxirWOuo7fPQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1t6XxK-0000000076v-3Mgh;
 Thu, 31 Oct 2024 17:23:31 +0100
Date: Thu, 31 Oct 2024 17:23:30 +0100
From: Johan Hovold <johan@kernel.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: neil.armstrong@linaro.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>,
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
Message-ID: <ZyOvAqnuxbNnGWli@hovoldconsulting.com>
References: <20241018-drm-aux-bridge-mark-of-node-reused-v2-1-aeed1b445c7d@linaro.org>
 <172951608323.1285208.3162107667310691864.b4-ty@linaro.org>
 <230b5910-6790-44cb-90ed-222bee89054d@linux.dev>
 <c2a4cc3a-2ffc-46f3-8636-238cd561f7aa@linaro.org>
 <751a4ab5-acbf-4e57-8cf4-51ab10206cc9@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <751a4ab5-acbf-4e57-8cf4-51ab10206cc9@linux.dev>
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

On Thu, Oct 31, 2024 at 11:06:38PM +0800, Sui Jingfeng wrote:

> But I think Johan do need more times to understand what exactly
> the real problem is. We do need times to investigate new method.

No, I know perfectly well what the (immediate) problem is here (I was
the one adding support for the of_node_reused flag some years back).

I just wanted to make sure that the commit message was correct and
complete before merging (and also to figure out whether this particular
patch needed to be backported).

Johan
