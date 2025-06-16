Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9F7ADB989
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 21:28:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E7010E432;
	Mon, 16 Jun 2025 19:28:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="lAErXEMB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C7410E432;
 Mon, 16 Jun 2025 19:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ca3Im91atM4IlVuzMTvMy+oLRTHwolg+Nw5q1hIfmp4=; b=lAErXEMBLlZm/Ylxwdp2XYMmnu
 KJqH4iHVYZy+mFDpFIgf8nLVTwnEa6bBaCMfrx9zz91RBwEZ40GWhveWXU+eFp/eix1xEWXU9z+WC
 mBKdHtL+tsEhn0uFlCDu9wg7GsTDqB+TiqKYCbbVVZF3BHuZStVa6VcdPmSQDEXtmrX10X1QB6NxB
 G6a5bNCu1pu7WRpJgK6OQ9Kh1f3XD+ijbEzUa7gsfDlfXTpHoF3wotm0mjTsMRTNd8VKfW7uUPMw5
 SQTSGDuvRHWMfVZlPFlHSgHDN+dRisdysVzj1vIO+A6C0D90gMqBizXuktuBlalCU3RoGHAWPNFqJ
 RFd00HdQ==;
Received: from [189.6.13.79] (helo=[192.168.0.55])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uRFUw-004G9r-9Q; Mon, 16 Jun 2025 21:28:02 +0200
Message-ID: <9cba2f0c-b6d4-42d9-b3b1-9869fcabaa62@igalia.com>
Date: Mon, 16 Jun 2025 16:27:56 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/14] drm/amd/display: add a mid-layer file to handle
 EDID in DC
To: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250613150015.245917-1-mwen@igalia.com>
 <20250613150015.245917-11-mwen@igalia.com>
 <2b05cc7d-c2bd-442a-87dd-d1f0abc11629@amd.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <2b05cc7d-c2bd-442a-87dd-d1f0abc11629@amd.com>
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



On 13/06/2025 15:48, Mario Limonciello wrote:
> On 6/13/2025 9:58 AM, Melissa Wen wrote:
>> From: Rodrigo Siqueira <siqueira@igalia.com>
>>
>> Since DC is a shared code, this commit introduces a new file to work as
>> a mid-layer in DC for the edid manipulation.
>>
>> v3:
>> - rebase on top of asdn
> Can you put changelog below cutlist (---)?
ack
>>
>> Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>
>> Co-developed-by: Melissa Wen <mwen@igalia.com>
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>> ---
>>   .../gpu/drm/amd/display/amdgpu_dm/Makefile    |  1 +
>>   .../gpu/drm/amd/display/amdgpu_dm/dc_edid.c   | 19 +++++++++++++++++++
>>   .../gpu/drm/amd/display/amdgpu_dm/dc_edid.h   | 11 +++++++++++
>>   .../drm/amd/display/dc/link/link_detection.c  | 17 +++--------------
>>   4 files changed, 34 insertions(+), 14 deletions(-)
>>   create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
>>   create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile 
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
>> index 7329b8cc2576..09cb94d8e0e4 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
>> @@ -39,6 +39,7 @@ AMDGPUDM = \
>>       amdgpu_dm_psr.o \
>>       amdgpu_dm_replay.o \
>>       amdgpu_dm_quirks.o \
>> +    dc_edid.o \
>>       amdgpu_dm_wb.o
>>     ifdef CONFIG_DRM_AMD_DC_FP
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c 
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
>> new file mode 100644
>> index 000000000000..fab873b091f5
>> --- /dev/null
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
>> @@ -0,0 +1,19 @@
>> +// SPDX-License-Identifier: MIT
>> +#include "amdgpu_dm/dc_edid.h"
>> +#include "dc.h"
>> +
>> +bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
>> +              struct dc_sink *current_sink)
>> +{
>> +    struct dc_edid *old_edid = &prev_sink->dc_edid;
>> +    struct dc_edid *new_edid = &current_sink->dc_edid;
>> +
>> +       if (old_edid->length != new_edid->length)
>> +               return false;
>> +
>> +       if (new_edid->length == 0)
>> +               return false;
>> +
>> +       return (memcmp(old_edid->raw_edid,
>> +                      new_edid->raw_edid, new_edid->length) == 0);
>> +}
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h 
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
>> new file mode 100644
>> index 000000000000..7e3b1177bc8a
>> --- /dev/null
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
>> @@ -0,0 +1,11 @@
>> +/* SPDX-License-Identifier: MIT */
>> +
>> +#ifndef __DC_EDID_H__
>> +#define __DC_EDID_H__
>> +
>> +#include "dc.h"
>> +
>> +bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
>> +              struct dc_sink *current_sink);
>> +
>> +#endif /* __DC_EDID_H__ */
>> diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c 
>> b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
>> index 863c24fe1117..344356e26f8b 100644
>> --- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
>> +++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
>> @@ -48,6 +48,8 @@
>>   #include "dm_helpers.h"
>>   #include "clk_mgr.h"
>>   +#include "dc_edid.h"
>
> There's a problem with the header location.  If you're naming it 
> dc_edid.h but putting the header in amdgpu_dm/ directory then it's 
> only going to compile for amdgpu.
>
> I think dc_edid.h needs to go into dc/ directory.
>
>> +
>>    // Offset DPCD 050Eh == 0x5A
>>   #define MST_HUB_ID_0x5A  0x5A
>>   @@ -617,18 +619,6 @@ static bool detect_dp(struct dc_link *link,
>>       return true;
>>   }
>>   -static bool is_same_edid(struct dc_edid *old_edid, struct dc_edid 
>> *new_edid)
>> -{
>> -    if (old_edid->length != new_edid->length)
>> -        return false;
>> -
>> -    if (new_edid->length == 0)
>> -        return false;
>> -
>> -    return (memcmp(old_edid->raw_edid,
>> -               new_edid->raw_edid, new_edid->length) == 0);
>> -}
>> -
>>   static bool wait_for_entering_dp_alt_mode(struct dc_link *link)
>>   {
>>   @@ -1105,8 +1095,7 @@ static bool detect_link_and_local_sink(struct 
>> dc_link *link,
>>           // Check if edid is the same
>>           if ((prev_sink) &&
>>               (edid_status == EDID_THE_SAME || edid_status == EDID_OK))
>> -            same_edid = is_same_edid(&prev_sink->dc_edid,
>> -                         &sink->dc_edid);
>> +            same_edid = dc_edid_is_same_edid(prev_sink, sink);
>>             if (sink->edid_caps.panel_patch.skip_scdc_overwrite)
>>               link->ctx->dc->debug.hdmi20_disable = true;
>

