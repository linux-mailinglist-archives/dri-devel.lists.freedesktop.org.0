Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCE4ADB990
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 21:29:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 175DE10E439;
	Mon, 16 Jun 2025 19:29:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="cKoRAp9d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE1A10E435;
 Mon, 16 Jun 2025 19:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SwYz+SANGWC7z7laN5WWtz6q1uv+PSD1M3FUpGYW7gk=; b=cKoRAp9dpEgUyYUfpPZCMJpUWK
 W29LKIHBnqHo4FSeh+s8Gah4vL+VpOqzgE489KqgYVfhu6583MJpdy0YQM1hcqTBZgc0GFQgSuELa
 uzb9Epp9x2WnV7p1bgLn8Z+PdQR88+BfO4BLUhQUvdUmioh4s2HHAcTlH9sc5I2+2WDtlEiVl6WVJ
 5u/6r5JFxZWBZEuGKeJX+pSF2eV8epOpZV7jh3tkq4J9EIEkYHAboUg/f7jlUMqHI9K1S5IMZkXlJ
 L1VWfV/fFHJS2FZRgF4P9AdmcdGPg/fmXrbqOcOg26gHUw8VkpeVAJBksTspFd97UPwrYy3l6XXNK
 R1QIkBrw==;
Received: from [189.6.13.79] (helo=[192.168.0.55])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uRFWX-004GBr-3y; Mon, 16 Jun 2025 21:29:41 +0200
Message-ID: <4925aea0-5f6a-46d5-b697-8ee5419c0215@igalia.com>
Date: Mon, 16 Jun 2025 16:29:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/14] drm/amd/display: use drm_edid_product_id for
 parsing EDID product info
To: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250613150015.245917-1-mwen@igalia.com>
 <20250613150015.245917-4-mwen@igalia.com>
 <0125efb7-85df-4911-a51d-8e6fffd6f648@amd.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <0125efb7-85df-4911-a51d-8e6fffd6f648@amd.com>
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



On 13/06/2025 15:53, Mario Limonciello wrote:
> On 6/13/2025 9:58 AM, Melissa Wen wrote:
>> Since [1], we can use drm_edid_product_id to get debug info from
>> drm_edid instead of directly parsing EDID.
>>
>> Link: 
>> https://lore.kernel.org/dri-devel/cover.1712655867.git.jani.nikula@intel.com/ 
>> [1]
>
> This is a pretty old commit.  It's landed now a while, right?
> I'd say if you're going to reference it in the changelog it should be 
> referenced by commit ABC123 ("Foo the bar").

Makes sense.
As it was a series, I'll try to find the most relevant commit and 
replace the reference.

>
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>> ---
>>   .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 15 ++++++++-------
>>   1 file changed, 8 insertions(+), 7 deletions(-)
>>
>> diff --git 
>> a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c 
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>> index 5543780f1024..b1085f1195f7 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>> @@ -109,6 +109,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>>       struct drm_device *dev = connector->dev;
>>       struct edid *edid_buf = edid ? (struct edid *) edid->raw_edid : 
>> NULL;
>>       const struct drm_edid *drm_edid;
>> +    struct drm_edid_product_id product_id;
>>       struct cea_sad *sads;
>>       int sad_count = -1;
>>       int sadb_count = -1;
>> @@ -125,13 +126,13 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>>       if (!drm_edid_valid(drm_edid))
>>           result = EDID_BAD_CHECKSUM;
>>   -    edid_caps->manufacturer_id = (uint16_t) edid_buf->mfg_id[0] |
>> -                    ((uint16_t) edid_buf->mfg_id[1])<<8;
>> -    edid_caps->product_id = (uint16_t) edid_buf->prod_code[0] |
>> -                    ((uint16_t) edid_buf->prod_code[1])<<8;
>> -    edid_caps->serial_number = edid_buf->serial;
>> -    edid_caps->manufacture_week = edid_buf->mfg_week;
>> -    edid_caps->manufacture_year = edid_buf->mfg_year;
>> +    drm_edid_get_product_id(drm_edid, &product_id);
>> +
>> +    edid_caps->manufacturer_id = product_id.manufacturer_name;
>> +    edid_caps->product_id = le16_to_cpu(product_id.product_code);
>> +    edid_caps->serial_number = le32_to_cpu(product_id.serial_number);
>> +    edid_caps->manufacture_week = product_id.week_of_manufacture;
>> +    edid_caps->manufacture_year = product_id.year_of_manufacture;
>>         drm_edid_get_monitor_name(edid_buf,
>>                     edid_caps->display_name,
>

