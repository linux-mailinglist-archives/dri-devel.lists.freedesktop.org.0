Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4729ABC9E2B
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 17:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BEA910EAAB;
	Thu,  9 Oct 2025 15:58:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="RlI55nVk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2817 seconds by postgrey-1.36 at gabe;
 Thu, 09 Oct 2025 15:58:20 UTC
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791D410EA9E
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 15:58:20 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 599F9tFs560194;
 Thu, 9 Oct 2025 10:09:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1760022595;
 bh=63aVNnR7dMDW6W77WMHD5To9r1IKMleMsLxbQt0DdyY=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=RlI55nVkpmsHhFbSWEK0Bmb8xPATsVXGSYeZJbja0n72jP2EqSCA/X4VqwN+j2yJ1
 0gGfeyexWe5l3EatY4SCs7tfOCRVlAxLYH1bO2OkJ3dGfRfK+hxHktXPelr2ECI1rY
 8an//8vCkg3H70EEh3DmhjHhthIhHvvTRIokEHWs=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 599F9sab999913
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Thu, 9 Oct 2025 10:09:54 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 9
 Oct 2025 10:09:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Oct 2025 10:09:54 -0500
Received: from [172.24.233.62] (devarsh-precision-tower-3620.dhcp.ti.com
 [172.24.233.62])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 599F9m4W433665;
 Thu, 9 Oct 2025 10:09:49 -0500
Message-ID: <734c8b32-a9a7-4fe5-a6d7-748770e502aa@ti.com>
Date: Thu, 9 Oct 2025 20:39:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/bridge: sii902x: Fix HDMI detection with
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <airlied@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>,
 <dri-devel@lists.freedesktop.org>, <jani.nikula@intel.com>,
 <simona@ffwll.ch>, <linux-kernel@vger.kernel.org>,
 <tomi.valkeinen@ideasonboard.com>, <praneeth@ti.com>,
 <vigneshr@ti.com>, <aradhya.bhatia@linux.dev>, <s-jain1@ti.com>,
 <s-wang12@ti.com>, <r-donadkar@ti.com>, <h-shenoy@ti.com>
References: <20251007112309.1103811-1-devarsht@ti.com>
 <4rbyxn2jr4nsogt4wfdin3jpzumjqj4mcplq7on6yyqvq4wu34@qng22gczlfyn>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <4rbyxn2jr4nsogt4wfdin3jpzumjqj4mcplq7on6yyqvq4wu34@qng22gczlfyn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

Thanks for the quick reviews.

On 09/10/25 01:48, Dmitry Baryshkov wrote:
> On Tue, Oct 07, 2025 at 04:53:09PM +0530, Devarsh Thakkar wrote:
>> The SII902x HDMI bridge driver wasn't working properly with drivers that
>> use the newer bridge connector architecture with the
>> DRM_BRIDGE_ATTACH_NO_CONNECTOR flag, like TIDSS.  This caused HDMI audio to
>> fail since the driver wasn't properly setting the sink_is_hdmi flag when
>> the bridge was attached without a connector since .get_modes() is never
>> called in this case. Fix it by setting sink_is_hdmi flag when reading
>> the EDID block itself.
>>
>> Fixes: 3de47e1309c2 ("drm/bridge: sii902x: use display info is_hdmi")
>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>> ---
>> V3: Use drm_edid_connector_update without edid NULL check
>> V2: Use drm_edid_connector_update to detect HDMI
>>
>> Link to V2:
>> https://lore.kernel.org/all/20251006150714.3144368-1-devarsht@ti.com/
>> Link to V1:
>> https://lore.kernel.org/all/20251003143642.4072918-1-devarsht@ti.com/
>>
>>   drivers/gpu/drm/bridge/sii902x.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
>> index d537b1d036fb..bb613d4c281f 100644
>> --- a/drivers/gpu/drm/bridge/sii902x.c
>> +++ b/drivers/gpu/drm/bridge/sii902x.c
>> @@ -296,6 +296,8 @@ static const struct drm_edid *sii902x_edid_read(struct sii902x *sii902x,
>>   	mutex_lock(&sii902x->mutex);
>>   
>>   	drm_edid = drm_edid_read_ddc(connector, sii902x->i2cmux->adapter[0]);
>> +	drm_edid_connector_update(connector, drm_edid);
>> +	sii902x->sink_is_hdmi = connector->display_info.is_hdmi;
>>   
>>   	mutex_unlock(&sii902x->mutex);
>>   
>> @@ -309,14 +311,11 @@ static int sii902x_get_modes(struct drm_connector *connector)
>>   	int num = 0;
>>   
>>   	drm_edid = sii902x_edid_read(sii902x, connector);
>> -	drm_edid_connector_update(connector, drm_edid);
>>   	if (drm_edid) {
>>   		num = drm_edid_connector_add_modes(connector);
>>   		drm_edid_free(drm_edid);
>>   	}
> 
> The EDID read / free can also be dropped, they don't serve any purpose
> now.
> 

Sorry I did not understand this clearly.
I have already removed drm_edid_connector_update from sii902x_get_modes 
since now it is taken care inside sii902x_edid_read itself which is also 
called by .get_modes (sii902x_get_modes).

We still need to read edid inside sii902x_get_modes as for the legacy 
driver scenario which don't use DRM_BRIDGE_ATTACH_NO_CONNECTOR as in 
those cases .get_modes will get called but bridge function .edid_read 
won't be called. Also as the caller is supposed to free the edid 
allocated so I have preserved drm_edid_free call in .get_modes as 
drm_edid_connector_add_modes is allocating a new drm_edid pointer already.

Kindly let me know if there is a misunderstanding here.

Regards
Devarsh

>>   
>> -	sii902x->sink_is_hdmi = connector->display_info.is_hdmi;
>> -
>>   	return num;
>>   }
>>   
>> -- 
>> 2.39.1
>>
> 

