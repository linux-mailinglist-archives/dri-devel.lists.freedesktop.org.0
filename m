Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35039909305
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 21:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ECEF10E25D;
	Fri, 14 Jun 2024 19:38:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="T/LCp9jL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE1C10E0EA;
 Fri, 14 Jun 2024 19:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G3US0s9AhbQW+KZXBzdRBe9+d9S85YJD8W6IE7z1fBA=; b=T/LCp9jLHrYdd3c+tDD2hJZ6vE
 hfmV5L7VdybRhnWv6XcvT+GC8YYy4q/0+rQWpuQ/z51tGuJSD9DtRNGqjt6mIVvfJwnMuODuJIapp
 gWrqE13N35HevWJjGE/HVyUsVG9CbCzja2IGECPK97e8ALWcYgUPW2oMA/DfOwmkjV9WJmddgG94f
 zVLgg1CgBvBxZ7e8ysRRRtsraMkbUH8Q/yciScnbHh0nsMMT6ohFD5+6JiFc86fPlVz4pZ3VpK77F
 ZPi2CyyzlLCs/J+PgG9oc/WdgbWCPvvlbbXdgfYHomdOJFU+vnSxupySJFyd/x+NbT68J4Vz2OAWY
 a9k66X+Q==;
Received: from [179.118.191.115] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sICkD-003Fy9-IJ; Fri, 14 Jun 2024 21:37:53 +0200
Message-ID: <ea501920-7319-46f4-98ca-cea412abf8a9@igalia.com>
Date: Fri, 14 Jun 2024 16:37:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/8] drm: Support per-plane async flip configuration
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, Melissa Wen <mwen@igalia.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 Simon Ser <contact@emersion.fr>, Pekka Paalanen <ppaalanen@gmail.com>,
 daniel@ffwll.ch, Daniel Stone <daniel@fooishbar.org>,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 Dave Airlie <airlied@gmail.com>, ville.syrjala@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>, Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>
References: <20240614153535.351689-1-andrealmeid@igalia.com>
 <lxfxqbax6azdpeamwm2qqv2tulgxrb7y3qzb4ir4myt6x5sqez@imd3yd5mbk7u>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <lxfxqbax6azdpeamwm2qqv2tulgxrb7y3qzb4ir4myt6x5sqez@imd3yd5mbk7u>
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

Hi Dmitry,

Em 14/06/2024 14:32, Dmitry Baryshkov escreveu:
> On Fri, Jun 14, 2024 at 12:35:27PM GMT, André Almeida wrote:
>> AMD hardware can do async flips with overlay planes, but currently there's no
>> easy way to enable that in DRM. To solve that, this patchset creates a new
>> drm_plane field, bool async_flip, that allows drivers to choose which plane can
>> or cannot do async flips. This is latter used on drm_atomic_set_property when
>> users want to do async flips.
>>
>> Patch 1 allows async commits with IN_FENCE_ID in any driver.
>>
>> Patches 2 to 7 have no function change. As per current code, every driver that
>> allows async page flips using the atomic API, allows doing it only in the
>> primary plane. Those patches then enable it for every driver.
>>
>> Patch 8 finally enables async flip on overlay planes for amdgpu.
>>
>> Changes from v5:
>> - Instead of enabling plane->async_flip in the common code, move it to driver
>> code.
>> - Enable primary plane async flip on every driver
>> https://lore.kernel.org/dri-devel/20240612193713.167448-1-andrealmeid@igalia.com/
>>
>> André Almeida (8):
>>    drm/atomic: Allow userspace to use explicit sync with atomic async
>>      flips
>>    drm: Support per-plane async flip configuration
>>    drm/amdgpu: Enable async flips on the primary plane
>>    drm: atmel-hlcdc: Enable async flips on the primary plane
>>    drm/i915: Enable async flips on the primary plane
>>    drm/nouveau: Enable async flips on the primary plane
>>    drm/vc4: Enable async flips on the primary plane
>>    drm/amdgpu: Make it possible to async flip overlay planes
>>
>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 2 ++
>>   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c         | 3 +++
>>   drivers/gpu/drm/drm_atomic_uapi.c                       | 8 +++++---
>>   drivers/gpu/drm/i915/display/i9xx_plane.c               | 3 +++
>>   drivers/gpu/drm/nouveau/dispnv04/crtc.c                 | 4 ++++
>>   drivers/gpu/drm/nouveau/dispnv50/wndw.c                 | 4 ++++
>>   drivers/gpu/drm/vc4/vc4_plane.c                         | 4 +++-
> 
> The main question is why only these drivers were updated.
> 

According to `git grep async_page_flip`, only those drivers supports 
async page flip. The only corner case is radeon, that does supports 
async but doesn't support planes.

Do you know any other driver that should be updated to?

>>   include/drm/drm_plane.h                                 | 5 +++++
>>   8 files changed, 29 insertions(+), 4 deletions(-)
>>
>> -- 
>> 2.45.2
>>
> 
