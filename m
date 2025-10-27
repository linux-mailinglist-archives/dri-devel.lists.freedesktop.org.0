Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B8CC0E12E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 14:35:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB84210E49E;
	Mon, 27 Oct 2025 13:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NjqLPiaz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E066010E4A5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 13:35:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C6C8F45A4A;
 Mon, 27 Oct 2025 13:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2245C4CEF1;
 Mon, 27 Oct 2025 13:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761572127;
 bh=aRsCfY5+Xwn/NNYCzEP+7073Q7UM7+DwDHvkcIvZjJg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NjqLPiazll1u7aGaUDZ8Ocn+voLiyebRoHfnMgV6vvaf0ZxBAGKS7TDQdkeF31tAM
 mOsaMma6fmrVWOQ+3uMzXqr2LK7UCR92JGXyt0NeRmSYfCVkPowHCT2/1UsE+yU5Rz
 pz8OOqipJxV46XhVItfePHxgzNpwpyTwiNsMjkpBSIMMXg1dEyhB8XiRSjuqJJI6Nb
 xHYX1v9okS1xy7uHRtIsDeKFY1EhlqdkBH2fFju8fRb7XdRY0W/um83eFGP9O7Ravq
 E2KhPgmiQnUcIjh/NcuWy9EJ96wR3MgY4Fgn/cMoVNyw9fdmJeDc1Ai4l3eKd02pYG
 YRCrCZc2QFDiQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1vDNNj-000000000HH-0GcS;
 Mon, 27 Oct 2025 14:35:31 +0100
Date: Mon, 27 Oct 2025 14:35:31 +0100
From: Johan Hovold <johan@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH] drm: sti: fix device leaks at component probe
Message-ID: <aP91I9j-OV4j3A49@hovoldconsulting.com>
References: <20250922122012.27407-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922122012.27407-1-johan@kernel.org>
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

On Mon, Sep 22, 2025 at 02:20:12PM +0200, Johan Hovold wrote:
> Make sure to drop the references taken to the vtg devices by
> of_find_device_by_node() when looking up their driver data during
> component probe.
> 
> Note that holding a reference to a platform device does not prevent its
> driver data from going away so there is no point in keeping the
> reference after the lookup helper returns.
> 
> Fixes: cc6b741c6f63 ("drm: sti: remove useless fields from vtg structure")
> Cc: stable@vger.kernel.org	# 4.16
> Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Can this one be picked up for 6.19?

Johan
