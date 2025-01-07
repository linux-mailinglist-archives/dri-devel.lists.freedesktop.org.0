Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6819A04025
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 14:00:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EBFA10E254;
	Tue,  7 Jan 2025 12:59:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="IN8J5fMl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A802410E254
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 12:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1736254766;
 bh=++UKU75rdXOIGAGFnLlqeD0iDhbh9gLg0blagBXDFJU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IN8J5fMlTUEjmAtGeHl7B/lm3+1IHUfaxdHBqnK4B7MNWPiTK2VgW62lsTSmz5g/G
 GiLG6e9/Rf/spaRK0bP30dxdcX5HUlg7a+E5bmJdgBHRyOeNUGZcxMe6bRgO1UaAqv
 AOIEnGpOQojo5i8+G4k/vw2x4AS1gdsfw4q8lYIkAiVCB0CHw1lufh5GXbm2N9vDZL
 nEZkuD3qKuikhuHVH6YW5yr44cS4bUIa5HNKVYHVs0H9miqZDSAOEqgKCknsPvFUgl
 W853LDonjunG1ToQv9FH4w1PA4PtsA9+d0lTVp+tQbACrsNTECqmPtnE/i/a9njehz
 AgZSBCrBgD0Fw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8FB9417E1574;
 Tue,  7 Jan 2025 13:59:25 +0100 (CET)
Message-ID: <67007940-4ab8-4297-8172-b1c2fa1829a0@collabora.com>
Date: Tue, 7 Jan 2025 13:59:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/connector: hdmi: Handle NULL display mode in state
 check helper
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250107-hdmi-conn-null-mode-v1-1-fff4be46d106@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250107-hdmi-conn-null-mode-v1-1-fff4be46d106@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Il 07/01/25 01:00, Cristian Ciocaltea ha scritto:
> drm_atomic_helper_connector_hdmi_check() helper makes use of
> connector_state_get_mode() to obtain a drm_display_mode pointer, but it
> doesn't validate it, which may lead to a NULL pointer dereference in
> some cases, i.e. unloading a DRM module:
> 
> [ 1002.910414] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> [...]
> [ 1002.923833] Hardware name: Radxa ROCK 5B (DT)
> [ 1002.924819] pc : drm_match_cea_mode+0x30/0x280 [drm]
> [ 1002.925318] lr : hdmi_try_format_bpc+0x7c/0x580 [drm_display_helper]
> [...]
> [ 1002.932411] Call trace:
> [ 1002.932626]  drm_match_cea_mode+0x30/0x280 [drm] (P)
> [ 1002.933120]  hdmi_try_format_bpc+0x7c/0x580 [drm_display_helper]
> [ 1002.933662]  drm_atomic_helper_connector_hdmi_check+0x10c/0x478 [drm_display_helper]
> [ 1002.934355]  drm_bridge_connector_atomic_check+0x20/0x40 [drm_display_helper]
> [ 1002.934993]  drm_atomic_helper_check_modeset+0x698/0xd28 [drm_kms_helper]
> [ 1002.935607]  drm_atomic_helper_check+0x28/0xb8 [drm_kms_helper]
> [ 1002.936143]  drm_atomic_check_only+0x794/0x988 [drm]
> [ 1002.936635]  drm_atomic_commit+0x60/0xe0 [drm]
> [ 1002.937082]  drm_atomic_helper_disable_all+0x184/0x218 [drm_kms_helper]
> [ 1002.937678]  drm_atomic_helper_shutdown+0x90/0x150 [drm_kms_helper]
> [ 1002.938243]  rockchip_drm_unbind+0x38/0x80 [rockchipdrm]
> [ 1002.938720]  component_master_del+0xac/0xf8
> [ 1002.939089]  rockchip_drm_platform_remove+0x34/0x78 [rockchipdrm]
> [...]
> 
> Add the missing NULL check before passing the mode pointer further.
> 
> Fixes: f035f4097f1e ("drm/connector: hdmi: Calculate TMDS character rate")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


