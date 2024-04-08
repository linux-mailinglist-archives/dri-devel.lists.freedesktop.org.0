Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B4189C889
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 17:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F09112711;
	Mon,  8 Apr 2024 15:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DHb3MfgP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A09112712
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 15:40:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B1E16612CC;
 Mon,  8 Apr 2024 15:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF580C433F1;
 Mon,  8 Apr 2024 15:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712590829;
 bh=PwZ0U9sZzNkD0KaVqwgkszl5WrTAUE7/ASJNm1Q6o/Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DHb3MfgPvwrWQm3k7uMR+X/ZVuy6AsSrHO2oEzZBvIGK3Ara/PXVFf5vvF1Is6oOF
 IviCPuF7Fl70MR4XKy5vMNLgdAImIvgD+re95FXhRWfRC7jwlicPlh+BlNhAib991h
 4+lyX/oNPd8QLHoKraUPbcFzJOqk/aldsxrxpifWkatQXWZAhxgXnSgq8iu0UzuoSY
 YS7Js+fcGyeWmQRQzu+ZAiayDH5soEmiuQHPV0UuWSQMgnb2x8iIjvWjj1C4flJ+R2
 /DY/IifpBVlR4/nKvJ6PR5sUukdxrRiZ5b4dDG3GHIxUPRGGdrEdKksdIswxUVm8kM
 nNSLAa/MIlSDg==
From: Robert Foss <rfoss@kernel.org>
To: Aleksandr Mishin <amishin@t-argos.ru>,
 Swapnil Jakhade <sjakhade@cadence.com>
Cc: Robert Foss <rfoss@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 lvc-project@linuxtesting.org,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Quentin Schulz <quentin.schulz@free-electrons.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Zhu Wang <wangzhu9@huawei.com>, linux-kernel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Rob Herring <robh@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Jyri Sarha <jsarha@ti.com>,
 Yuti Amonkar <yamonkar@cadence.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
 Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drm: bridge: cdns-mhdp8546: Fix possible null pointer
 dereference
Date: Mon,  8 Apr 2024 17:40:20 +0200
Message-ID: <171259081156.2558005.10286796627234601438.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240408125810.21899-1-amishin@t-argos.ru>
References: <20240408125810.21899-1-amishin@t-argos.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 8 Apr 2024 15:58:10 +0300, Aleksandr Mishin wrote:
> In cdns_mhdp_atomic_enable(), the return value of drm_mode_duplicate() is
> assigned to mhdp_state->current_mode, and there is a dereference of it in
> drm_mode_set_name(), which will lead to a NULL pointer dereference on
> failure of drm_mode_duplicate().
> 
> Fix this bug add a check of mhdp_state->current_mode.
> 
> [...]

Applied, thanks!

[1/1] drm: bridge: cdns-mhdp8546: Fix possible null pointer dereference
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=935a92a1c400



Rob

