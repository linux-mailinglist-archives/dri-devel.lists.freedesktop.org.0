Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E856C8674BB
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 13:24:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E1410E4BF;
	Mon, 26 Feb 2024 12:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="BROXfXqQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D1010F12D
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 12:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zc1RjtY1ARFXv9X7AWb9xg2qefIhvIwrCXvg3e6WynE=; b=BROXfXqQXZTbIHzw0zpQsN6HXm
 A9Zq5kJDUduueLDMU05tNBf766hgTB9RrfuLsQ9vFytUWw3IR/SQqHpE1VGGujMI9eeNAs0xNP2Fv
 GPhVNEujNa+JT+5JdTn3hBcvRm352QvCDhXgFTtQMJ/i7ZGcJAIf7+gxXnqPU/LWoRzN5TuWcLAxH
 +s0CGxCQN/UTOXasfQCUp5oakmXwMsw6MpPNejJxUzqgo2CIFm9NwulM9N4qmWRpZAIO5qIKv5hjU
 WDOlq7Ygigcj5WhK+M7BKDJKKNKgY2MD7hENrwfddIEBbsGGQD2odotWzFKv120sE0tovM8j74uxu
 /NFJ0Sqg==;
Received: from [177.34.169.255] (helo=[192.168.0.139])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rea19-003YfT-KA; Mon, 26 Feb 2024 13:23:35 +0100
Message-ID: <ad133922-6f11-483f-94c9-12aa8c3189df@igalia.com>
Date: Mon, 26 Feb 2024 09:23:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/36] drm/tests: helpers: Add atomic helpers
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
 <20240222-kms-hdmi-connector-state-v7-2-8f4af575fce2@kernel.org>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <20240222-kms-hdmi-connector-state-v7-2-8f4af575fce2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 2/22/24 15:13, Maxime Ripard wrote:
> The mock device we were creating was missing any of the driver-wide
> helpers. That was fine before since we weren't testing the atomic state
> path, but we're going to start, so let's use the default
> implementations.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/tests/drm_kunit_helpers.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> index ca4f8e4c5d5d..4fb11b938bc1 100644
> --- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
> +++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0
>   
>   #include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
>   #include <drm/drm_drv.h>
>   #include <drm/drm_kunit_helpers.h>
>   #include <drm/drm_managed.h>
> @@ -14,6 +15,8 @@
>   #define KUNIT_DEVICE_NAME	"drm-kunit-mock-device"
>   
>   static const struct drm_mode_config_funcs drm_mode_config_funcs = {
> +	.atomic_check	= drm_atomic_helper_check,
> +	.atomic_commit	= drm_atomic_helper_commit,
>   };
>   
>   /**
> 
