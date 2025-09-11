Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E895FB53A77
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 19:36:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FAEF10E3D0;
	Thu, 11 Sep 2025 17:36:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="fS477kAR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F3C10E3BA;
 Thu, 11 Sep 2025 17:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L1bORo1Jli0A3VVhtHwmGAdhC0sSuWhT/vnaokCHUkM=; b=fS477kARxHZbqCWBGhS6/DPDvZ
 bKL5syMcO8qbqFMj+tUGzHL41XtHqS6bWcE00CLoesi70BmCpMS4XKiJ3C2XyiiRU37WZY4TVmcFk
 hKAzKX46TWDJDu//rVpt0HbodYzCIn3y8Vf33T41yikk8dWHTYZe+RL/BWUXW1IHVa2nvTDtuxM5U
 hw+p3WVPhAxDxywXYEkXazrAxHgqIKx0OogvkLCtqzkEHX862yLdowpKAEakUoMVgY4e+em4Y/Qsh
 eFAKFSdBlN3WN4Tsq0T/5rf8xRRMN6loXmduaiK85BI/4ugTs9i6LMuIlky+WtDukVXHbHQBKUNIb
 p/ES45cA==;
Received: from [189.6.16.239] (helo=[192.168.31.42])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uwlDU-009uPN-DO; Thu, 11 Sep 2025 19:36:16 +0200
Message-ID: <2a0a65c5-4ea3-463f-98d6-3356d87e08fc@igalia.com>
Date: Thu, 11 Sep 2025 14:36:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/14] drm/amd/display: create a function to fill
 dc_sink with edid data
To: Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, sunpeng.li@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250618152216.948406-1-mwen@igalia.com>
 <20250618152216.948406-12-mwen@igalia.com>
 <c51f7e55-04d1-474f-9fcd-028fe3201aba@amd.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <c51f7e55-04d1-474f-9fcd-028fe3201aba@amd.com>
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



On 10/09/2025 16:54, Harry Wentland wrote:
>
> On 2025-06-18 11:19, Melissa Wen wrote:
>> From: Rodrigo Siqueira <siqueira@igalia.com>
>>
>> As part of the effort of stopping using raw edid, this commit move the
>> copy of the edid in DC to a dedicated function that will allow the usage
>> of drm_edid in the next steps.
>>
>> Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>
>> Co-developer-by: Melissa Wen <mwen@igalia.com>
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>
>> ---
>>
>> v3:
>> - remove superfulous cast (jani)
>> ---
>>   drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c      | 8 ++++++++
>>   drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h      | 2 ++
>>   drivers/gpu/drm/amd/display/dc/link/link_detection.c | 3 +--
>>   3 files changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
>> index 3f8295a68a72..b4ccc111fa08 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
>> @@ -17,3 +17,11 @@ bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
>>          return (memcmp(old_edid->raw_edid,
>>                         new_edid->raw_edid, new_edid->length) == 0);
>>   }
>> +
>> +void dc_edid_copy_edid_to_dc(struct dc_sink *dc_sink,
>> +			     const void *edid,
>> +			     int len)
>> +{
>> +	memmove(dc_sink->dc_edid.raw_edid, edid, len);
>> +	dc_sink->dc_edid.length = len;
>> +}
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
>> index 7e3b1177bc8a..f42cd5bbc730 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
>> @@ -7,5 +7,7 @@
>>   
>>   bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
>>   			  struct dc_sink *current_sink);
>> +void dc_edid_copy_edid_to_dc(struct dc_sink *dc_sink,
>> +			     const void *edid, int len);
> Same comment as before, please put the definition into
> dm_helpers and rename the dc_edid.c to amdgpu_dm_edid.
> and function to use dm_helpers_ prefix.
Ack

Melissa
>
> Harry
>
>>   
>>   #endif /* __DC_EDID_H__ */
>> diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
>> index 957d74ff1294..891d35274f69 100644
>> --- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
>> +++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
>> @@ -1401,8 +1401,7 @@ struct dc_sink *link_add_remote_sink(
>>   	if (!dc_sink)
>>   		return NULL;
>>   
>> -	memmove(dc_sink->dc_edid.raw_edid, (const uint8_t *) edid, len);
>> -	dc_sink->dc_edid.length = len;
>> +	dc_edid_copy_edid_to_dc(dc_sink, edid, len);
>>   
>>   	if (!link_add_remote_sink_helper(
>>   			link,

