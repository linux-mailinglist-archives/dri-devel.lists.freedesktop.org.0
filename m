Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE414B40A86
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 18:26:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A1E110E7E4;
	Tue,  2 Sep 2025 16:26:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="mnz2RLK4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA0410E7E4
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 16:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1756830362;
 bh=WALewwHx2C+Gr6Q65PLmSt5V0bZuUMTVLBppkG5GReI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mnz2RLK4X3Hk5GbUktymH8Z7xV3xj05l/Ro6j5NbhrNjDWsApUu8raDBfmlyQaJpT
 BVPoxC4eqLR3B+te5KPtj0FiQ1ymxK+fJo23QM2Kq8ihnBNB6t/lT0YvhU48OD/S1A
 IT1BK+xCwrQDeZqG2pHK8ijHJcop/QUFi57O9hR4Fr6CNSb3WD8DE+/WImSnPaI2oV
 3rSa7s6KWHrnrGj2EC+3BcOSJfOFz5IadIRB6dZq3G1FCxI68dOqclnUdZda5CKMnD
 tnQcQvg0wg1GGHeLx/vLzWkxAfjYaO79PVi8Aj5VUf5a2Ifp4YkAoD7RepZN4x+vmf
 OMyM4CwsQQqtQ==
Received: from [192.168.1.90] (unknown [82.79.138.60])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2FDA617E0B84;
 Tue,  2 Sep 2025 18:26:02 +0200 (CEST)
Message-ID: <2a8ab8c3-36ae-46bd-8f98-6b3760532cb5@collabora.com>
Date: Tue, 2 Sep 2025 19:26:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm: Add CRTC background color property
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Matt Roper <matthew.d.roper@intel.com>
References: <20250902-rk3588-bgcolor-v1-0-fd97df91d89f@collabora.com>
 <20250902-rk3588-bgcolor-v1-1-fd97df91d89f@collabora.com>
 <aLby6OPxgubt7kd_@intel.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <aLby6OPxgubt7kd_@intel.com>
Content-Type: text/plain; charset=UTF-8
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

On 9/2/25 4:36 PM, Ville Syrjälä wrote:
> On Tue, Sep 02, 2025 at 12:27:56PM +0300, Cristian Ciocaltea wrote:
>> Some display controllers can be hardware programmed to show non-black
>> colors for pixels that are either not covered by any plane or are
>> exposed through transparent regions of higher planes.  This feature can
>> help reduce memory bandwidth usage, e.g. in compositors managing a UI
>> with a solid background color while using smaller planes to render the
>> remaining content.
>>
>> To support this capability, introduce the BACKGROUND_COLOR standard DRM
>> mode property, which can be attached to a CRTC through the
>> drm_crtc_attach_background_color_property() helper function.
>>
>> Additionally, define a 64-bit ARGB format value to be built with the
>> help of a dedicated drm_argb64() utility macro.  Individual color
>> components can be extracted with desired precision using the
>> corresponding DRM_ARGB64_*() macros.
>>
>> Co-developed-by: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
>>  drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++++
>>  drivers/gpu/drm/drm_blend.c               | 37 +++++++++++++++++++++++++++----
>>  drivers/gpu/drm/drm_mode_config.c         |  6 +++++
>>  include/drm/drm_blend.h                   |  4 +++-
>>  include/drm/drm_crtc.h                    | 12 ++++++++++
>>  include/drm/drm_mode_config.h             |  5 +++++
>>  include/uapi/drm/drm_mode.h               | 30 +++++++++++++++++++++++++
>>  8 files changed, 94 insertions(+), 5 deletions(-)

[...]

>> +/*
>> + * Put 16-bit ARGB values into a standard 64-bit representation that
>> + * can be used for ioctl parameters, inter-driver communication, etc.
>> + */
>> +static inline __u64
>> +drm_argb64(__u16 alpha, __u16 red, __u16 green, __u16 blue)
>> +{
>> +	return (__u64)alpha << 48 | (__u64)red << 32 | (__u64)green << 16 | blue;
>> +}
>> +
>> +/*
>> + * Extract the specified number of least-significant bits of a specific
>> + * color component from a standard 64-bit ARGB value.
> 
> Why would you ever want the least significant bits?

Right, that's useless - will replace with proper helpers dealing with custom
precision.

Thanks,
Cristian

>> + */
>> +#define DRM_ARGB64_COMP(c, shift, numlsb) \
>> +	((__u16)(((c) >> (shift)) & ((1UL << (numlsb) % 17) - 1)))
>> +#define DRM_ARGB64_ALPHA_LSB(c, numlsb) DRM_ARGB64_COMP(c, 48, numlsb)
>> +#define DRM_ARGB64_RED_LSB(c, numlsb)   DRM_ARGB64_COMP(c, 32, numlsb)
>> +#define DRM_ARGB64_GREEN_LSB(c, numlsb) DRM_ARGB64_COMP(c, 16, numlsb)
>> +#define DRM_ARGB64_BLUE_LSB(c, numlsb)  DRM_ARGB64_COMP(c, 0, numlsb)
>> +
>> +/*
>> + * Convenience wrappers to extract all 16 bits of a specific color
>> + * component from a standard 64-bit ARGB value.
>> + */
>> +#define DRM_ARGB64_ALPHA(c)		DRM_ARGB64_ALPHA_LSB(c, 16)
>> +#define DRM_ARGB64_RED(c)		DRM_ARGB64_RED_LSB(c, 16)
>> +#define DRM_ARGB64_GREEN(c)		DRM_ARGB64_GREEN_LSB(c, 16)
>> +#define DRM_ARGB64_BLUE(c)		DRM_ARGB64_BLUE_LSB(c, 16)
>> +
>>  #if defined(__cplusplus)
>>  }
>>  #endif
>>
>> -- 
>> 2.51.0
> 

