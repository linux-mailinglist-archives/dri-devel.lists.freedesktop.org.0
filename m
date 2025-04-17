Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42505A91EFC
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 15:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD2E10EB23;
	Thu, 17 Apr 2025 13:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="avO/+T5K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D575D10EB20;
 Thu, 17 Apr 2025 13:57:52 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Zdfbv2nfBz9sT5;
 Thu, 17 Apr 2025 15:57:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1744898267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VHLMhIM4CW1VEsaRgLP9RK1YWEu9+lBXT4OOfk9wAKg=;
 b=avO/+T5KXcBNWeifUsgHIvmwGKtmnVStPUpQP+hMnZfd2x+wy5vYSaiaGasr8matBBIjab
 vRGKfid0FkYU80CFRbjEm9otwa03YGoDaqNJMmjlLEqla3mLpXL3Oic1UBaSIQsxWKbWh5
 NcDSF6vlbbALPyUqfsuguHhD49EwVxC6G+ClsFnsDKqKj+zmNLvNjeTj6L54vlS9n6diEi
 U5tzv1Q63lQMx4UIMWLfbp2lREB5zTV3QhYHYJuyU/RyNPSswun26sREO0mowaWjXbQWc0
 C7+GRUTc4xN/SlNop3jY8jXwHwZLrcW1yjaIOC7IL6xYrhzN5HRqu/B0d/og0w==
Message-ID: <a28c6bb7-7811-49b4-9a31-a9c7df3b9816@mailbox.org>
Date: Thu, 17 Apr 2025 15:57:43 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 02/13] drm/amd/display: use drm_edid_product_id for
 parsing EDID product info
To: Melissa Wen <mwen@igalia.com>, Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250411201333.151335-1-mwen@igalia.com>
 <20250411201333.151335-3-mwen@igalia.com>
 <1df5b916-b24d-4b56-87e4-2d7075cfb5b5@mailbox.org>
 <0d50464e-a504-4f03-a7cd-d7e472bafe9f@igalia.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: de-CH-frami, en-CA
In-Reply-To: <0d50464e-a504-4f03-a7cd-d7e472bafe9f@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: xamaa13wruw3g11f7yigrexfxwjwq4n3
X-MBO-RS-ID: 38b8646a0dd1fda344d
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

On 2025-04-17 15:27, Melissa Wen wrote:
> On 15/04/2025 06:32, Michel Dänzer wrote:
>> On 2025-04-11 22:08, Melissa Wen wrote:
>>> Since [1], we can use drm_edid_product_id to get debug info from
>>> drm_edid instead of directly parsing EDID.
>>>
>>> Link: https://lore.kernel.org/dri-devel/cover.1712655867.git.jani.nikula@intel.com/ [1]
>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>> ---
>>>   .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c    | 16 +++++++++-------
>>>   1 file changed, 9 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>>> index 62954b351ebd..e93adb7e48a5 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>>> [...]
>>> @@ -122,13 +124,13 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>>>       if (!drm_edid_is_valid(edid_buf))
>>>           result = EDID_BAD_CHECKSUM;
>>>   -    edid_caps->manufacturer_id = (uint16_t) edid_buf->mfg_id[0] |
>>> -                    ((uint16_t) edid_buf->mfg_id[1])<<8;
>>> -    edid_caps->product_id = (uint16_t) edid_buf->prod_code[0] |
>>> -                    ((uint16_t) edid_buf->prod_code[1])<<8;
>>> -    edid_caps->serial_number = edid_buf->serial;
>>> -    edid_caps->manufacture_week = edid_buf->mfg_week;
>>> -    edid_caps->manufacture_year = edid_buf->mfg_year;
>>> +    drm_edid_get_product_id(drm_edid, &product_id);
>>> +
>>> +    edid_caps->manufacturer_id = le16_to_cpu(product_id.manufacturer_name);
>> struct drm_edid_product_id has
>>
>>     __be16 manufacturer_name;
>>
>> so shouldn't this use be16_to_cpu? (Though I see that would be a change in behaviour from the existing code...)
> Hi Michel, thanks for reviewing this patch.
> 
> It changes the behaviour, yes. But as you pointed it out I realized I can just assign product_id.manufacturer_name directly.

That's a third option, with its own issues:

struct dc_edid_caps::manufacturer_id doesn't have any endianness annotation and is otherwise accessed directly, not via [bl]e16_to_cpu.

It's also assigned directly to struct audio_info::manufacture_id, which is programmed to the AZALIA_F0_CODEC_PIN_CONTROL_SINK_INFO0 register.

This means different behaviour (and specifically a different value being written to the register) on little vs big endian hosts. That can't be right.


P.S. Independently from the above, AFAIK sparse will complain if a field marked with __be16 isn't accessed via be16_to_cpu / cpu_to_be16.

-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
