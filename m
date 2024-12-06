Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FBF9E79B7
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 21:04:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C55E10F1AA;
	Fri,  6 Dec 2024 20:04:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="MdOlHdZ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A35610F1AA
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 20:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1733515485;
 bh=hmsqwiQoFyVymGO/tJ3hsCNiyGGrTZsfN1G8UeJFit0=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=MdOlHdZ39aR49HyyARCdN8GqayWyX3S3gNFi3AfBo95I76Vx5AeojrrgUcWCP07H4
 62+hIdz87RNXToZDoXVyzBmDgMzI2cwhMnfzEf3NDQHEIMh+vy4KPwjiLOoEbBAtCY
 NhD4rN3j3YDPQ8ftsYcMyK1DrBPFeoWOrgTTesX9Xfx3Y8DRNQNy4TnH4bmO3yd9KB
 pE2XHHoPb1PNuymUEG3BGyVcl0RLF1F3bUJ8iVubzSBlxrETxSfLbJt8QQz1nEWIIm
 kinst8ATPxw7FClsOF+fz/PfLmQ5d/FovaA1b4JD5B6qnB2ISVOCpXiV5G1Y5V/QA8
 GPm/+O2z/LdtQ==
Received: from [192.168.1.90] (unknown [188.27.48.199])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3CA6E17E37E9;
 Fri,  6 Dec 2024 21:04:45 +0100 (CET)
Message-ID: <d53a6509-1575-4c07-9680-c039ad357909@collabora.com>
Date: Fri, 6 Dec 2024 22:04:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge-connector: Prioritize supported_formats over
 ycbcr_420_allowed
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241130-bridge-conn-fmt-prio-v1-1-146b663f17f3@collabora.com>
Content-Language: en-US
In-Reply-To: <20241130-bridge-conn-fmt-prio-v1-1-146b663f17f3@collabora.com>
Content-Type: text/plain; charset=UTF-8
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

On 11/30/24 1:13 AM, Cristian Ciocaltea wrote:
> Bridges having the DRM_BRIDGE_OP_HDMI flag set in drm_bridge->ops are
> supposed to rely on drm_bridge->supported_formats bitmask to advertise
> the supported colorspaces, including HDMI_COLORSPACE_YUV420.  Therefore,
> the newly introduced drm_bridge->ycbcr_420_allowed flag becomes
> redundant in this particular context.
> 
> Moreover, when drm_bridge_connector gets initialised, only
> drm_bridge->ycbcr_420_allowed is considered in the process of adjusting
> the equivalent property of the base drm_connector, which effectively
> discards the formats advertised by the HDMI bridge.
> 
> Handle the inconsistency by ignoring ycbcr_420_allowed for HDMI bridges
> and, instead, make use of the supported_formats bitmask when setting up
> the bridge connector.
> 
> Fixes: 3ced1c687512 ("drm/display: bridge_connector: handle ycbcr_420_allowed")

Please ignore this and check v2 instead:

https://lore.kernel.org/all/20241206-bridge-conn-fmt-prio-v2-1-85c817529b88@collabora.com/
