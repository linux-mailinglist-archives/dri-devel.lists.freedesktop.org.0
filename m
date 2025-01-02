Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 688EB9FF95E
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 13:35:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB3D10E351;
	Thu,  2 Jan 2025 12:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="BodiJ3LM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D3710E351
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 12:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1735821281;
 bh=L25Jezz6jioNC5qrIg5TFebAApK1YxWaAFIlFVtRveU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BodiJ3LM6A1a6eglI6FhAvP9vpwEWtDMHnxH0HwSRG9RYYy7BwYJArnL+FrOocCfB
 4R1+pBR54S6wveIfqNcr0F6GV/DWTqzty153Z1T74x2k5Lsppfcrcu7IXf2ZEOgmL1
 hvzL85+1guO60UjrpszvahAN+okrEqi9gu96CF4Wwj0upSL4g/7uXGGkjkn6ip36sj
 3oI/b8oBAL9j1LjvcSmskKsnSoA143U+ymZrPKh7pQ3JZC+p5xrmEkI3QgRE9w01YK
 +NgPvrhELYxt3gZMD74x9qiMaAi+RM8Atn8O8huR1xJxxd4JPS/Gbc/q6ywob8p2fz
 VNOvC6ZbIElXA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8562317E1569;
 Thu,  2 Jan 2025 13:34:40 +0100 (CET)
Message-ID: <f26f3b12-0e65-47b9-b2d7-bfb5733f2c8f@collabora.com>
Date: Thu, 2 Jan 2025 13:34:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v7 00/10] drm/bridge: it6505: fix HDCP CTS fail
 items and add MCCS support
To: Hermes.wu@ite.corp-partner.google.com,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Hermes Wu <hermes.wu@ite.com.tw>, Allen Chen <allen.chen@ite.com.tw>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Pin-yen Lin <treapking@chromium.org>, Kenneth Hung
 <Kenneth.Hung@ite.com.tw>, Pet Weng <Pet.Weng@ite.com.tw>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20241230-v7-upstream-v7-0-e0fdd4844703@ite.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241230-v7-upstream-v7-0-e0fdd4844703@ite.corp-partner.google.com>
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

Il 30/12/24 11:51, Hermes Wu via B4 Relay ha scritto:
> There are lots of failure items while running HDCP CTS using UNIGRAF DPR-100.
> In Order to fix those failures, HDCP flow needs to be changed.
> 
> The DisplayPort AUX protocol supports I2C transport.
> In Order to support MCCS via the aux channel, the aux-i2c operation is added.
> 
> v6->v7
> 	-[3/10] add header <linux/bitfield.h> included
> 
> 	links:
> 	https://lore.kernel.org/all/20241016-upstream-v6-v6-0-4d93a0c46de1@ite.com.tw/
> 
> v5->v6:
> 	-keep the commit message wrapped at 72-75 chars.
> 	-[10/10] fix return variable being used without being initialized
> 
> v4->v5:
> 	-add more messages for changes.
> 	-[2/10] modified AUX transfer data size judgment.
> 		change for-loop to do-while.
> 	-[7/10] change for-loop to do-while.
> 	-[9/10] change wait timer with timer_after()
> 
> 	links:
> 	https://lore.kernel.org/all/20240926074755.22176-4-Hermes.Wu@ite.com.tw/
> 	https://lore.kernel.org/all/20240926075134.22394-1-Hermes.Wu@ite.com.tw/
> 
> v3->v4:
> 	-split changes  into patches.
> 
> v2->v3:
> 	-split aux read  KSV function to a patch.
> 	-[1/3] new in v3
> 	-[2/3] add description of patch
> 
> v1->v2:
> 	- ignored.
> 
> To: Andrzej Hajda <andrzej.hajda@intel.com>
> To: Neil Armstrong <neil.armstrong@linaro.org>
> To: Robert Foss <rfoss@kernel.org>
> To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> To: Jonas Karlman <jonas@kwiboo.se>
> To: Jernej Skrabec <jernej.skrabec@gmail.com>
> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> To: Maxime Ripard <mripard@kernel.org>
> To: Thomas Zimmermann <tzimmermann@suse.de>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> To: Hermes Wu <hermes.wu@ite.com.tw>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Pin-yen Lin <treapking@chromium.org>
> Cc: Kenneth Hung <Kenneth.Hung@ite.com.tw>
> Cc: Pet Weng <Pet.Weng@ite.com.tw>
> 
> Change-Id: I7f14eeb18ae70b17ef7e1a8622c590427b0ff2ed
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>

Whole series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


