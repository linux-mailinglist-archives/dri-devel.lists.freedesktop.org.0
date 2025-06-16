Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC5DADB987
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 21:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88FC010E437;
	Mon, 16 Jun 2025 19:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="kCE2ZE/v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1FDA10E447;
 Mon, 16 Jun 2025 19:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X3GKKRWKmHLAsbz7GqcLdlP5vfIVw0zMS4kwpk6rjBg=; b=kCE2ZE/vztAFwwkWkjHTZY2LxZ
 xUicfZsB34diDmTWLzD1uIgD3LwgyBOjgnBl6u+SdaXu4DpaU8DcrI4wIk9juDFKHw7SW3ffDElvQ
 +zKk9zrqJwbtGn2HYbumg1NljrXbU7JRF6yLqOUrHZ5lO/ZYwjrlXrNZGX+zGoCzsnmBuehXbIpEN
 LEzxTU1x3PdTBJwTbSgKgg9tF0DjihCSaIVM7t50ffkuPOJ3WgbwiwQ8lVz+s/33rgme8NhwaadUK
 yuUtUMLVYylMuizvab65nTQfyQP+lkPHgNL2V3HixIRY/4uHVut/hwp4UTWosjFBCLM4Lo9AzRSjk
 TqqQmJnw==;
Received: from [189.6.13.79] (helo=[192.168.0.55])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uRFUS-004G94-Fr; Mon, 16 Jun 2025 21:27:32 +0200
Message-ID: <be451690-6cc1-446f-96d9-dc871060c9a8@igalia.com>
Date: Mon, 16 Jun 2025 16:27:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/14] drm/amd/display: create a function to fill
 dc_sink with edid data
To: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250613150015.245917-1-mwen@igalia.com>
 <20250613150015.245917-12-mwen@igalia.com>
 <a2d55d42-ee5d-46be-a725-3bae6b6fb220@amd.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <a2d55d42-ee5d-46be-a725-3bae6b6fb220@amd.com>
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



On 13/06/2025 15:38, Mario Limonciello wrote:
> On 6/13/2025 9:58 AM, Melissa Wen wrote:
>> From: Rodrigo Siqueira <siqueira@igalia.com>
>>
>> As part of the effort of stopping using raw edid, this commit move the
>> copy of the edid in DC to a dedicated function that will allow the usage
>> of drm_edid in the next steps.
>>
>> v3:
>> - remove superfulous cast (jani)
>
> I don't think that changelog needs to end up in the eventual commit 
> history.  But it's useful while still under review.
Ack
>
> Could you put the changelog below the cutlist (---)?
>
>>
>> Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>
>> Co-developer--by: Melissa Wen <mwen@igalia.com>
>
> These tags are wrong.  It's "Co-developed-by".
ugh. ack

Thanks

Melissa
>
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>> ---
>>   drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c      | 8 ++++++++
>>   drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h      | 2 ++
>>   drivers/gpu/drm/amd/display/dc/link/link_detection.c | 3 +--
>>   3 files changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c 
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
>> index fab873b091f5..a90545b176cc 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
>> @@ -17,3 +17,11 @@ bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
>>          return (memcmp(old_edid->raw_edid,
>>                         new_edid->raw_edid, new_edid->length) == 0);
>>   }
>> +
>> +void dc_edid_copy_edid_to_dc(struct dc_sink *dc_sink,
>> +                 const void *edid,
>> +                 int len)
>> +{
>> +    memmove(dc_sink->dc_edid.raw_edid, edid, len);
>> +    dc_sink->dc_edid.length = len;
>> +}
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h 
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
>> index 7e3b1177bc8a..f42cd5bbc730 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
>> @@ -7,5 +7,7 @@
>>     bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
>>                 struct dc_sink *current_sink);
>> +void dc_edid_copy_edid_to_dc(struct dc_sink *dc_sink,
>> +                 const void *edid, int len);
>>     #endif /* __DC_EDID_H__ */
>> diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c 
>> b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
>> index 344356e26f8b..c28072f980cc 100644
>> --- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
>> +++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
>> @@ -1401,8 +1401,7 @@ struct dc_sink *link_add_remote_sink(
>>       if (!dc_sink)
>>           return NULL;
>>   -    memmove(dc_sink->dc_edid.raw_edid, (const uint8_t *) edid, len);
>> -    dc_sink->dc_edid.length = len;
>> +    dc_edid_copy_edid_to_dc(dc_sink, edid, len);
>>         if (!link_add_remote_sink_helper(
>>               link,
>

