Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE08A8A49F5
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 10:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C446F10E3F1;
	Mon, 15 Apr 2024 08:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gnq6zfL4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84FA410E3F1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 08:13:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5EBAB60C07;
 Mon, 15 Apr 2024 08:13:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3273C32786;
 Mon, 15 Apr 2024 08:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713168803;
 bh=yNPyaoE+1YD2n6GMJmfwIULv/0PA81dmRmXg2JvJ6yM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=gnq6zfL47dW3bC/D+/fHSKBjwzPTKNZVXoSF/k/3LYrKSqevWXQ6zZAmlE9xcF9T6
 iQG3dwp7oGhtjr/XDAEKcgYR3Tt8vVum9TmQDCGXM0AW8cx2tjYIIMBNhgsMlxBc7i
 Syc5MhpbougAAjW3MJh3EYfByTz1MHScd+w+Sm5kfns6Q/Pe0OJoMyPAxl/v66PLtv
 FZ8aX/rbZfK+DXQ/qrfMbKIH7ZJmoXxCyaZq6DW/L6sHt+fcvmpHjeKEZNUlwLZWfc
 MiL12hlC8QW2TMknwHhn2TM/5dG8rZVee0IKJ33QwwxYx3IzJtRWcLhUzg8r4rYrxd
 IADiDi6+sTxLg==
From: Maxime Ripard <mripard@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Jani Nikula <jani.nikula@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
In-Reply-To: <20240405143531.925589-1-arnd@kernel.org>
References: <20240405143531.925589-1-arnd@kernel.org>
Subject: Re: (subset) [PATCH] drm: fix DRM_DISPLAY_DP_HELPER dependencies,
 part 2
Message-Id: <171316880026.200641.2717784608814103660.b4-ty@kernel.org>
Date: Mon, 15 Apr 2024 10:13:20 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

On Fri, 05 Apr 2024 16:35:10 +0200, Arnd Bergmann wrote:
> After my fix yesterday, I ran into another problem of the same kind:
> 
> aarch64-linux-ld: drivers/gpu/drm/bridge/analogix/analogix_dp_core.o: in function `drm_dp_dpcd_readb':
> analogix_dp_core.c:(.text+0x194): undefined reference to `drm_dp_dpcd_read'
> aarch64-linux-ld: drivers/gpu/drm/bridge/analogix/analogix_dp_core.o: in function `drm_dp_dpcd_writeb':
> analogix_dp_core.c:(.text+0x214): undefined reference to `drm_dp_dpcd_write'
> aarch64-linux-ld: drivers/gpu/drm/bridge/analogix/analogix_dp_core.o: in function `analogix_dp_stop_crc':
> analogix_dp_core.c:(.text+0x4b0): undefined reference to `drm_dp_stop_crc'
> aarch64-linux-ld: drivers/gpu/drm/bridge/analogix/analogix_dp_core.o: in function `analogix_dp_start_crc':
> analogix_dp_core.c:(.text+0xbe8): undefined reference to `drm_dp_start_crc'
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

