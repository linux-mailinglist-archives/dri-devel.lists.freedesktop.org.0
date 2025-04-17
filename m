Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D016EA91E82
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 15:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C1810EB14;
	Thu, 17 Apr 2025 13:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Lszj41dl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4FA210EB14;
 Thu, 17 Apr 2025 13:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7Ve/5yoWS+f2YOKIyD3keVfXxstxVxIdQeYfaEd2ynU=; b=Lszj41dljN3K1kWU2+Rdvpz0S9
 v/V+9VqgvTVy4zJiFx7O2/1e6RrG1T7Xi/NjOfnPaM3AikifkhVFxjoiDtJoDGyRL8hLe2Am/AcSa
 l+eqLhW9RA52zWLeOmmnl6907HJNmYpKafBVWSidqz1GdO6L1SetQXk57QJXFrXi92CnGgcQFeSjL
 WetAHgtvYk0h8PVqFeAAusR+qPPQbzf9reHEYiKnVNXSWXS20PQ9baiLyoXbsFFTxUAYhqOP1Vieu
 nfthw5DFv2ftIvoOwpYe63Fs6e5FLfdBSe2kBYs6gwxbl+7SczUCnc2zzZ4HbzYtU8JcDmHvbuSws
 fFRKdvmw==;
Received: from [189.6.35.67] (helo=[192.168.0.55])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u5PZK-000pPq-Vk; Thu, 17 Apr 2025 15:46:19 +0200
Message-ID: <c817cdda-77dc-4fdf-b414-9a542c7100f7@igalia.com>
Date: Thu, 17 Apr 2025 10:46:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/13] drm/amd/display: parse display name from drm_eld
To: Jani Nikula <jani.nikula@linux.intel.com>, Alex Hung <alex.hung@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20250411201333.151335-1-mwen@igalia.com>
 <20250411201333.151335-4-mwen@igalia.com> <87fribt5o7.fsf@intel.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <87fribt5o7.fsf@intel.com>
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



On 14/04/2025 07:10, Jani Nikula wrote:
> On Fri, 11 Apr 2025, Melissa Wen <mwen@igalia.com> wrote:
>> We don't need to parse dc_edid to get the display name since it's
>> already set in drm_eld which in turn had it values updated when updating
>> connector with the opaque drm_edid.
>>
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>> ---
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>> index e93adb7e48a5..faea6b7fb3f3 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>> @@ -34,7 +34,7 @@
>>   #include <drm/amdgpu_drm.h>
>>   #include <drm/drm_edid.h>
>>   #include <drm/drm_fixed.h>
>> -
>> +#include <drm/drm_eld.h>
>>   #include "dm_services.h"
>>   #include "amdgpu.h"
>>   #include "dc.h"
>> @@ -90,6 +90,7 @@ static void apply_edid_quirks(struct drm_device *dev, struct edid *edid, struct
>>   	}
>>   }
>>   
>> +#define AMDGPU_ELD_DISPLAY_NAME_SIZE_IN_CHARS 13
>>   /**
>>    * dm_helpers_parse_edid_caps() - Parse edid caps
>>    *
>> @@ -132,9 +133,10 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>>   	edid_caps->manufacture_week = product_id.week_of_manufacture;
>>   	edid_caps->manufacture_year = product_id.year_of_manufacture;
>>   
>> -	drm_edid_get_monitor_name(edid_buf,
>> -				  edid_caps->display_name,
>> -				  AUDIO_INFO_DISPLAY_NAME_SIZE_IN_CHARS);
>> +	memset(edid_caps->display_name, 0, AUDIO_INFO_DISPLAY_NAME_SIZE_IN_CHARS);
>> +	memcpy(edid_caps->display_name,
>> +	       &connector->eld[DRM_ELD_MONITOR_NAME_STRING],
>> +	       AMDGPU_ELD_DISPLAY_NAME_SIZE_IN_CHARS);
> It's not that simple. The monitor name in ELD is not fixed length (see
> drm_eld_mnl()) and neither is it guaranteed to be NUL terminated.
I see. Thanks for raising these points.
I need to looking for a better solution then.

Melissa
>
> BR,
> Jani.
>
>
>>   
>>   	edid_caps->edid_hdmi = connector->display_info.is_hdmi;

