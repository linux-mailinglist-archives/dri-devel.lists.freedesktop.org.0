Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD12D1E41A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 11:58:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63FED10E5A0;
	Wed, 14 Jan 2026 10:58:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WHjS9huI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A0D10E5A0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 10:58:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 775876001D;
 Wed, 14 Jan 2026 10:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25891C4CEF7;
 Wed, 14 Jan 2026 10:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768388301;
 bh=FB084Np/65yIBtVlFoVrgt1UnmRqnwSuLFcsfpReaVc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WHjS9huI0ccr9soEgGscgbKtE43l9HoUp/hC1eo0cIGhBsCn9dJQ/i3ZIJLF2/tyQ
 amyXviqtbyFwiwPqMCCkE7ybli1l1L7uLcmE410r3+fzCb4AgnKG6MLoefvKtrgpZ+
 TZga5GCgoOBB9Yc1cpQCdUhZRA9IS92eC7ZyjsF+IQaFDBIe5TvbGgLMB2jE42YxvR
 XGUwhqTa/A/I0zQs8+J3JZQtEuIJ1h1jv/vfcDpzvvge3IbDNnlr40c5eIyh3PRoBS
 V2+VlFWOgtnUXT1Tt/gb1/b4mv5nMuhX+/1OQ0cLFz6voLx3zb8lhHExs4+cbx4FIr
 FG11aC9Tw8HRg==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1vfyZq-000000002tn-2MjG;
 Wed, 14 Jan 2026 11:58:14 +0100
Date: Wed, 14 Jan 2026 11:58:14 +0100
From: Johan Hovold <johan@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2] drm/imx/tve: fix probe device leak
Message-ID: <aWd2xizOQAnVRaSs@hovoldconsulting.com>
References: <20251030163456.15807-1-johan@kernel.org>
 <aR8TWJurF1a0LLGJ@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aR8TWJurF1a0LLGJ@hovoldconsulting.com>
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

On Thu, Nov 20, 2025 at 02:10:48PM +0100, Johan Hovold wrote:
> On Thu, Oct 30, 2025 at 05:34:56PM +0100, Johan Hovold wrote:
> > Make sure to drop the reference taken to the DDC device during probe on
> > probe failure (e.g. probe deferral) and on driver unbind.
> > 
> > Fixes: fcbc51e54d2a ("staging: drm/imx: Add support for Television Encoder (TVEv2)")
> > Cc: stable@vger.kernel.org	# 3.10
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> > ---
> > 
> > Changes in v2:
> >  - add missing NULL ddc check
> 
> Can this one be picked up for 6.19?

It's been two more months so sending another reminder.

Can this one be merged now?

Johan
