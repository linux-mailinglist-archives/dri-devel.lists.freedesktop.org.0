Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5939A9E9026
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 11:31:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4172B10E2C6;
	Mon,  9 Dec 2024 10:31:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="DOSzIIbx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D447310E2C6
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 10:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1733740300;
 bh=k0uZ2UEiQzgNKBRrB48UKpg6beGJR/i+NshtGEJDMvA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DOSzIIbxNs4m/3Mx4eetw8fASpCfbWVS8J/to0FOK37EpAjqQpT//KZQ6ws7Yr2nZ
 3He80xCGICgu2tUehGh4YwyO6Ola5AwNN0q4mEwR6Hc4dxR6K8qTpQpS1PQS2uqyrI
 T2TEoT7mvCYR9l90aBs6w4pYB0/i0Qzn5wPt75XgIgTUqdzkPHVBHKVaf+pHOz+aj+
 sbeijpuLLkSiggw6x4tTrTURF0LzQ/q22GzB7u8UOxYv0Rtuvw16NIYOpbvresYkcr
 Kna8YTPCkXCmHQd1pcDO4cK6QEslLYCMbhK922NP8JfYW08kQKUbFdbTY/GD2qqvnM
 qnJwUDAF0JKbQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 73B1117E09C0;
 Mon,  9 Dec 2024 11:31:39 +0100 (CET)
Message-ID: <5d722361-5ea3-4734-a2af-41aa8c2eab0b@collabora.com>
Date: Mon, 9 Dec 2024 11:31:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v5,07/10] drm/display: bridge_connector: use
 drm_bridge_connector_mode_valid()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20241130-hdmi-mode-valid-v5-7-742644ec3b1f@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241130-hdmi-mode-valid-v5-7-742644ec3b1f@linaro.org>
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

Il 30/11/24 02:52, Dmitry Baryshkov ha scritto:
> Use new drm_bridge_connector_mode_valid() helper if there is a HDMI
> bridge in the bridge chain. This removes the need to perform TMDS char
> rate check manually in the bridge driver.
> 
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

