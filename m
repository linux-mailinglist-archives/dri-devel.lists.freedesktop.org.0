Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6BDA06871
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 23:37:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B5310E957;
	Wed,  8 Jan 2025 22:37:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="dnujLYU2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C31E10E957
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 22:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1736375852;
 bh=hfuyV/5Uw5L5enP6CP3oN959zJakSm/N8lmixLudbEg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dnujLYU2LWLMDsxlAlCfZLArQfHbzVnCX+6evCLbiNut1CfTH7QYZpU5zWf0M93L+
 BjhRVtZQe8fiOOLhfql8o7FG/xjia3RIAb6FPxwy5IRIQYZPgxBwY4Kifo+YgywEeG
 QczioR3mqahamGJ1cVdpqo+qrzWzM3oRJaJfQLk5gjXuvfZLQsu9BFcIex6HPQcjgW
 ZlL7mkC1QjHc1kCvXTyYWtoR+9CNqDYt4zcfbIcXd7Yubo86e2wzCjwSv8hd+wA1QN
 wh9iCNrbRZaIQ3SkTtVR55y9FC1X1+DPXxswmpSpHTUHliR+37OVUUnQpiZ3Rqn5zZ
 UVaGTbYTx+t7w==
Received: from [192.168.1.90] (unknown [82.76.59.196])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C0D6917E3620;
 Wed,  8 Jan 2025 23:37:31 +0100 (CET)
Message-ID: <abffac65-2bbc-4d64-9891-62dbba5296c0@collabora.com>
Date: Thu, 9 Jan 2025 00:37:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/connector: hdmi: Handle NULL display mode in state
 check helper
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250107-hdmi-conn-null-mode-v1-1-fff4be46d106@collabora.com>
 <20250107-dangerous-shapeless-bandicoot-dc74dd@houat>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20250107-dangerous-shapeless-bandicoot-dc74dd@houat>
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

On 1/7/25 5:16 PM, Maxime Ripard wrote:
> On Tue, Jan 07, 2025 at 02:00:35AM +0200, Cristian Ciocaltea wrote:
>> drm_atomic_helper_connector_hdmi_check() helper makes use of
>> connector_state_get_mode() to obtain a drm_display_mode pointer, but it
>> doesn't validate it, which may lead to a NULL pointer dereference in
>> some cases, i.e. unloading a DRM module:
>>
>> [ 1002.910414] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
>> [...]
>> [ 1002.923833] Hardware name: Radxa ROCK 5B (DT)
>> [ 1002.924819] pc : drm_match_cea_mode+0x30/0x280 [drm]
>> [ 1002.925318] lr : hdmi_try_format_bpc+0x7c/0x580 [drm_display_helper]
>> [...]
>> [ 1002.932411] Call trace:
>> [ 1002.932626]  drm_match_cea_mode+0x30/0x280 [drm] (P)
>> [ 1002.933120]  hdmi_try_format_bpc+0x7c/0x580 [drm_display_helper]
>> [ 1002.933662]  drm_atomic_helper_connector_hdmi_check+0x10c/0x478 [drm_display_helper]
>> [ 1002.934355]  drm_bridge_connector_atomic_check+0x20/0x40 [drm_display_helper]
>> [ 1002.934993]  drm_atomic_helper_check_modeset+0x698/0xd28 [drm_kms_helper]
>> [ 1002.935607]  drm_atomic_helper_check+0x28/0xb8 [drm_kms_helper]
>> [ 1002.936143]  drm_atomic_check_only+0x794/0x988 [drm]
>> [ 1002.936635]  drm_atomic_commit+0x60/0xe0 [drm]
>> [ 1002.937082]  drm_atomic_helper_disable_all+0x184/0x218 [drm_kms_helper]
>> [ 1002.937678]  drm_atomic_helper_shutdown+0x90/0x150 [drm_kms_helper]
>> [ 1002.938243]  rockchip_drm_unbind+0x38/0x80 [rockchipdrm]
>> [ 1002.938720]  component_master_del+0xac/0xf8
>> [ 1002.939089]  rockchip_drm_platform_remove+0x34/0x78 [rockchipdrm]
>> [...]
>>
>> Add the missing NULL check before passing the mode pointer further.
>>
>> Fixes: f035f4097f1e ("drm/connector: hdmi: Calculate TMDS character rate")
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> Looks good to me, but we need to provide a test for that case too

Test cases provided in v2:

https://lore.kernel.org/lkml/20250109-hdmi-conn-null-mode-v2-2-9eeaf1109547@collabora.com/

Thanks,
Cristian
