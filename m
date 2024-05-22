Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD448CBBC0
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 09:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4500910E9E9;
	Wed, 22 May 2024 07:13:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="KkFRQKz0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D5910E0DA
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 07:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716362017;
 bh=ovjsPfFfFox4+imrFSPnYzf2/8RO117uDA2zkRXNfwA=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=KkFRQKz0MxzG22OOPEO8j67lNYRPlqtfyMac+UsYjN4SRbp3Xa5KiRCexxYiKyLAy
 EUAwRR4/QxCU+H6QkD/HrDOcMBU31d58wVIIIWz4ls5Z4Mg3qk2b1MSfDnFmd9ZH/K
 P9LhoXe0Ne5BsbYtzAw5nfHIAhwEwIjOko8f49go1pG0pvYY8T14A9QBamezgl7eNN
 299ya3lanlzRA3SyuskG0aQmnWVkspFZ26QN2IGCD4dnvfV/PJ+xGUDIuoevhnDM4d
 U0beMYKzKSE/zBLjcMX3Xj4xiVHieKNofMi9rQYYWOWKJxjwKwnAmGz9WPZshe16dh
 6kOBl4NFY8yQw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1B2B23782157;
 Wed, 22 May 2024 07:13:36 +0000 (UTC)
Message-ID: <36052284-6b17-4b3f-ab99-a01beed4c601@collabora.com>
Date: Wed, 22 May 2024 09:13:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13] drm/bridge: it6505: fix hibernate to resume no
 display issue
To: kuro <kuro.chung@ite.com.tw>, Pin-yen Lin <treapking@chromium.org>,
 Kenneth Haung <kenneth.hung@ite.com.tw>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Hermes Wu <hermes.wu@ite.com.tw>, Allen Chen <allen.chen@ite.com.tw>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20240522065528.1053439-1-kuro.chung@ite.com.tw>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240522065528.1053439-1-kuro.chung@ite.com.tw>
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

Il 22/05/24 08:55, kuro ha scritto:
> From: Kuro Chung <kuro.chung@ite.com.tw>
> 
> When the system power resumes, the TTL input of IT6505 may experience
> some noise before the video signal stabilizes, necessitating a video
> reset. This patch is implemented to prevent a loop of video error
> interrupts, which can occur when a video reset in the video FIFO error
> interrupt triggers another such interrupt. The patch processes the SCDT
> and FIFO error interrupts simultaneously and ignores any video FIFO
> error interrupts caused by a video reset.
> 
> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> Signed-off-by: Kuro Chung <kuro.chung@ite.com.tw>
> Signed-off-by: Hermes Wu <hermes.wu@ite.com.tw>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


