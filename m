Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDFD9436D6
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 22:03:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0391410E6C4;
	Wed, 31 Jul 2024 20:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="dkf4OSL+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C2F10E6C4
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 20:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1722456200;
 bh=ALLryGFl6MDYaFUXnyF92rskMoQ1mK0GIOJ/exNKv4o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dkf4OSL+3IQSqZdT7jfZQZiphOWNvh3Ty1GvlrwpE6e6lUZSVizLBr0UHrPXyd7cC
 D5Geb5S8nwtEXJcI76dVv7mUqbH6QieyhmmJLAqb1V2p67461QpcXur3LMykxhJ4kv
 sv8aAGOOQ0yAM/M8FCJpFQ9jEao5ycVu/qYTGttmmz15DgAeGETriGmobExipaIWDD
 AZTfaOIyuLj+ksy6BmchJ+f8HKWrfttCkKohfTzLbVnUCvxJ1MHt5QP30KpAFxjlnI
 d2gJQ0y6FVjnICY1YU8ZOj2JXAZkHoneJ1n+Xm6Sx3GHoqrqWE9DfsouhV7+6NmBWD
 Xv9CDfGPnKSzQ==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id E4E2E3782201;
 Wed, 31 Jul 2024 20:03:19 +0000 (UTC)
Message-ID: <8d9e8947-5d13-40eb-a887-06a809174fc6@collabora.com>
Date: Wed, 31 Jul 2024 23:03:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge-connector: Fix double free in error handling
 paths
To: Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240711-bridge-connector-fix-dbl-free-v1-1-d558b2d0eb93@collabora.com>
 <172130413876.532897.864210015976659933.b4-ty@kernel.org>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <172130413876.532897.864210015976659933.b4-ty@kernel.org>
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

Hi Robert,

On 7/18/24 3:02 PM, Robert Foss wrote:
> On Thu, 11 Jul 2024 14:26:55 +0300, Cristian Ciocaltea wrote:
>> The recent switch to drmm allocation in drm_bridge_connector_init() may
>> cause double free on bridge_connector in some of the error handling
>> paths.
>>
>> Drop the explicit kfree() calls on bridge_connector.
>>
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/1] drm/bridge-connector: Fix double free in error handling paths
>       https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ca5442ed8f53

The fix is supposed to reach v6.11 tree, hence wondering if this fall
through the cracks as it haven't shown up in -rc1, neither in linux-next
- should have been applied to drm-misc-fixes instead of drm-misc?!

Sorry for the noise if this already follows the regular DRM workflow and
just needs more time to get picked into the target branches.

Thanks,
Cristian
