Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F480A91DF4
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 15:27:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C04C10EB03;
	Thu, 17 Apr 2025 13:27:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ZxXl4Z0K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5D110EB02;
 Thu, 17 Apr 2025 13:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d2q5RcDkAluN47Vv2yvtvUPxLO1N10nktBWjVXupI8M=; b=ZxXl4Z0K0Igk/mjZFab3MnU5pO
 2xxFYXSCHU+Q+nfzbZ+W73lVfcMmPn+y1eZw4g8kmhPIe/DHjkOLy5ULByiK91RwvHAHnlG4BVeyR
 ut1RiHudMbtofo1V6/b5RGr+uAgIS+KNh4V1KbvEMdPyLts9kDNLYrfY2hw5DyIDZIuKejyz1m3Tj
 jf2ozHxQqhq2oEV5uBIRm6LlX3BgX9H8D4HTwUUQCIA+AZOe1pJtQ9jfbZcXEmPWbmT09j/GBH0RX
 12obPa8APyQxgj/innSY4Qb8mxrzvCcjIwh9feIx9Y82nxxQXrXT6mL5tAaDywYqsjmXRK1Qo+KWs
 ZjL6m25w==;
Received: from [189.6.35.67] (helo=[192.168.0.55])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u5PGp-000ouM-Uz; Thu, 17 Apr 2025 15:27:12 +0200
Message-ID: <0d50464e-a504-4f03-a7cd-d7e472bafe9f@igalia.com>
Date: Thu, 17 Apr 2025 10:27:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/13] drm/amd/display: use drm_edid_product_id for
 parsing EDID product info
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Alex Hung <alex.hung@amd.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250411201333.151335-1-mwen@igalia.com>
 <20250411201333.151335-3-mwen@igalia.com>
 <1df5b916-b24d-4b56-87e4-2d7075cfb5b5@mailbox.org>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <1df5b916-b24d-4b56-87e4-2d7075cfb5b5@mailbox.org>
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



On 15/04/2025 06:32, Michel Dänzer wrote:
> On 2025-04-11 22:08, Melissa Wen wrote:
>> Since [1], we can use drm_edid_product_id to get debug info from
>> drm_edid instead of directly parsing EDID.
>>
>> Link: https://lore.kernel.org/dri-devel/cover.1712655867.git.jani.nikula@intel.com/ [1]
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>> ---
>>   .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c    | 16 +++++++++-------
>>   1 file changed, 9 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>> index 62954b351ebd..e93adb7e48a5 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>> [...]
>> @@ -122,13 +124,13 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>>   	if (!drm_edid_is_valid(edid_buf))
>>   		result = EDID_BAD_CHECKSUM;
>>   
>> -	edid_caps->manufacturer_id = (uint16_t) edid_buf->mfg_id[0] |
>> -					((uint16_t) edid_buf->mfg_id[1])<<8;
>> -	edid_caps->product_id = (uint16_t) edid_buf->prod_code[0] |
>> -					((uint16_t) edid_buf->prod_code[1])<<8;
>> -	edid_caps->serial_number = edid_buf->serial;
>> -	edid_caps->manufacture_week = edid_buf->mfg_week;
>> -	edid_caps->manufacture_year = edid_buf->mfg_year;
>> +	drm_edid_get_product_id(drm_edid, &product_id);
>> +
>> +	edid_caps->manufacturer_id = le16_to_cpu(product_id.manufacturer_name);
> struct drm_edid_product_id has
>
> 	__be16 manufacturer_name;
>
> so shouldn't this use be16_to_cpu? (Though I see that would be a change in behaviour from the existing code...)
Hi Michel, thanks for reviewing this patch.

It changes the behaviour, yes. But as you pointed it out I realized I 
can just assign product_id.manufacturer_name directly.
It also noticed that I screwed up on rebasing and there is a patch 
missing here [1], let me fix all these things in the next version.

[1] https://lore.kernel.org/amd-gfx/20250308142650.35920-3-mwen@igalia.com

Melissa

>
>

