Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0048C8A5C2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:35:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A1A10E048;
	Wed, 26 Nov 2025 14:35:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=0la.ch header.i=@0la.ch header.b="SfNLWLkG";
	dkim=permerror (0-bit key) header.d=0la.ch header.i=@0la.ch header.b="9SLWDPan";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.0la.ch (mail.0la.ch [78.47.82.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B0C810E048;
 Wed, 26 Nov 2025 14:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202502r; d=0la.ch; c=relaxed/relaxed;
 h=From:To:Subject:Date:Message-ID; t=1764167712; bh=5S/xRtuoNCPIoEQwMLK9Oka
 86PCxoQbNPvfdNfWtG50=; b=SfNLWLkG/e1nQ97bZdkA92EWpeiMgbQaHcPDENX9yeVlbseDKS
 4jYuPLJ3CV9FvJwB8pqK1cQ9Sw2dsGFXoYng5koy6JhKg7qj1MpMbOAotS+gBC+DFbsZxRu0qle
 GM2I+uL9LuMALxMddvHdRepQRkBeKOQaJ4ZV6UWfnT5ECXjt807k3FtEV0UHtGwIJI4KZS3/5XJ
 q5s5JU7acgdKn/S6qs+yog3TU2Lw6PY3muGtUz/zdg5YfTVN8cX40QZrUSE3RXwUPYsP6EK3844
 cPJOumAwpChzoxSigfW1PEA0iNK8OO6N89M6xtmG6wi2WMaXdgH20+vj91A1q4swLmQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202502e; d=0la.ch; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1764167712;
 bh=5S/xRtuoNCPIoEQwMLK9Oka
 86PCxoQbNPvfdNfWtG50=; b=9SLWDPan7vEZQASG2iT9zqRS1bfi7JPzlAfA/jR2MsDbyc9hw1
 hT+RRMDKa+BhIODa7hb5BbD07iYn8Dw7HgAw==;
Message-ID: <c32eb9e4-41fa-4d17-a214-d7f594f34d82@0la.ch>
Date: Wed, 26 Nov 2025 15:35:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] drm/edid: parse DSC DPP passthru support flag for
 mode VII timings
To: Jani Nikula <jani.nikula@linux.intel.com>, Yaroslav Bolyukin
 <iam@lach.pw>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251126065126.54016-1-iam@lach.pw>
 <20251126065126.54016-5-iam@lach.pw>
 <6f88c0111ce7f2a74010ff43a77bdd03f669ffb6@intel.com>
Content-Language: en-US
From: Yaroslav <iam@0la.ch>
In-Reply-To: <6f88c0111ce7f2a74010ff43a77bdd03f669ffb6@intel.com>
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



On 2025-11-26 15:19, Jani Nikula wrote:
> On Wed, 26 Nov 2025, Yaroslav Bolyukin <iam@lach.pw> wrote:
> 
> The commit message goes here.
> 
>> Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
>> ---
>>   drivers/gpu/drm/drm_displayid_internal.h |  2 ++
>>   drivers/gpu/drm/drm_edid.c               | 12 ++++++++----
>>   include/drm/drm_modes.h                  | 10 ++++++++++
>>   3 files changed, 20 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_displayid_internal.h b/drivers/gpu/drm/drm_displayid_internal.h
>> index 72f107ae832f..724174b429f2 100644
>> --- a/drivers/gpu/drm/drm_displayid_internal.h
>> +++ b/drivers/gpu/drm/drm_displayid_internal.h
>> @@ -97,6 +97,7 @@ struct displayid_header {
>>   	u8 ext_count;
>>   } __packed;
>>   
>> +#define DISPLAYID_BLOCK_REV	GENMASK(2, 0)
>>   struct displayid_block {
>>   	u8 tag;
>>   	u8 rev;
>> @@ -125,6 +126,7 @@ struct displayid_detailed_timings_1 {
>>   	__le16 vsw;
>>   } __packed;
>>   
>> +#define DISPLAYID_BLOCK_PASSTHROUGH_TIMINGS_SUPPORT	BIT(3)
>>   struct displayid_detailed_timing_block {
>>   	struct displayid_block base;
>>   	struct displayid_detailed_timings_1 timings[];
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index 348aa31aea1b..72a94b1713e2 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -6792,8 +6792,8 @@ static void update_display_info(struct drm_connector *connector,
>>   }
>>   
>>   static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *dev,
>> -							    const struct displayid_detailed_timings_1 *timings,
>> -							    bool type_7)
>> +							    const struct displayid_block *block,
>> +							    const struct displayid_detailed_timings_1 *timings)
>>   {
>>   	struct drm_display_mode *mode;
>>   	unsigned int pixel_clock = (timings->pixel_clock[0] |
>> @@ -6809,11 +6809,16 @@ static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *d
>>   	unsigned int vsync_width = le16_to_cpu(timings->vsw) + 1;
>>   	bool hsync_positive = le16_to_cpu(timings->hsync) & (1 << 15);
>>   	bool vsync_positive = le16_to_cpu(timings->vsync) & (1 << 15);
>> +	bool type_7 = block->tag == DATA_BLOCK_2_TYPE_7_DETAILED_TIMING;
>>   
>>   	mode = drm_mode_create(dev);
>>   	if (!mode)
>>   		return NULL;
>>   
>> +	if (type_7 && FIELD_GET(DISPLAYID_BLOCK_REV, block->rev) >= 1)
>> +		mode->dsc_passthrough_timings_support =
>> +			!!(block->rev & DISPLAYID_BLOCK_PASSTHROUGH_TIMINGS_SUPPORT);
> 
> The !! and parentheses are superfluous.
> 

Most of the other instances of bitflag parsing logic in kernel seem to 
cast integers to booleans explicitly this way.

I'm fine with simplifying that, I was only doing what everyone else does.

>> +
>>   	/* resolution is kHz for type VII, and 10 kHz for type I */
>>   	mode->clock = type_7 ? pixel_clock : pixel_clock * 10;
>>   	mode->hdisplay = hactive;
>> @@ -6846,7 +6851,6 @@ static int add_displayid_detailed_1_modes(struct drm_connector *connector,
>>   	int num_timings;
>>   	struct drm_display_mode *newmode;
>>   	int num_modes = 0;
>> -	bool type_7 = block->tag == DATA_BLOCK_2_TYPE_7_DETAILED_TIMING;
>>   	/* blocks must be multiple of 20 bytes length */
>>   	if (block->num_bytes % 20)
>>   		return 0;
>> @@ -6855,7 +6859,7 @@ static int add_displayid_detailed_1_modes(struct drm_connector *connector,
>>   	for (i = 0; i < num_timings; i++) {
>>   		struct displayid_detailed_timings_1 *timings = &det->timings[i];
>>   
>> -		newmode = drm_mode_displayid_detailed(connector->dev, timings, type_7);
>> +		newmode = drm_mode_displayid_detailed(connector->dev, block, timings);
>>   		if (!newmode)
>>   			continue;
>>   
>> diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
>> index b9bb92e4b029..312e5c03af9a 100644
>> --- a/include/drm/drm_modes.h
>> +++ b/include/drm/drm_modes.h
>> @@ -417,6 +417,16 @@ struct drm_display_mode {
>>   	 */
>>   	enum hdmi_picture_aspect picture_aspect_ratio;
>>   
>> +	/**
>> +	 * @dsc_passthrough_timing_support:
>> +	 *
>> +	 * Indicates whether this mode timing descriptor is supported
>> +	 * with specific target DSC bits per pixel only.
>> +	 *
>> +	 * VESA vendor-specific data block shall exist with the relevant
>> +	 * DSC bits per pixel declaration when this flag is set to true.
>> +	 */
>> +	bool dsc_passthrough_timings_support;
>>   };
>>   
>>   /**
> 
