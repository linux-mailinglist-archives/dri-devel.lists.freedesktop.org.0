Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A4A9871F7
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 12:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C8110E15F;
	Thu, 26 Sep 2024 10:48:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="pcshl02z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339D110E02D;
 Thu, 26 Sep 2024 10:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AbgU+rlUVl4u4E+b3tRAQ+gcbi8/sA49xnExKiVBBYo=; b=pcshl02zWba28YeGJyz7xY+iAR
 1xPRTK2iRIozqzY5vZBVzDSpeynoATVSW8Dd7fHUjnMtDjGvGYBG8LdTDfUpWmHP6AFXIHRA66TZc
 RawBBm5WTRw0ZlnPb9rkgICFr3+FKIUphgxsvrNFHvUS8A0LUUL4WXatdyDfKK0jcJdArnm/wNJB6
 e6vvz5kN45yIGejjP6F8j0m0KQ+jVDnIwwcLkGgSfwr9TNkDKLFH0bic8mlXz2cvuDLjBvFPVUtXh
 slyl9IIH+DvJ60Tn2p/2zOrWM2cIu/gfslRyraEXvJ2UsmpAWFP/g6ty+RdlNEXToXWNduouyDlPg
 xo2znbOA==;
Received: from [189.6.17.125] (helo=[192.168.0.55])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1stm3B-001HtO-0w; Thu, 26 Sep 2024 12:48:45 +0200
Message-ID: <cde9d9c6-8da3-4629-8363-fc4c4f6a622c@igalia.com>
Date: Thu, 26 Sep 2024 07:48:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/10] drm/amd/display: remove dc_edid handler from
 dm_helpers_parse_edid_caps
To: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Hung <alex.hung@amd.com>, Alexander Deucher <alexander.deucher@amd.com>
Cc: kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, harry.wentland@amd.com, sunpeng.li@amd.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Wheeler, Daniel" <Daniel.Wheeler@amd.com>
References: <20240918213845.158293-1-mario.limonciello@amd.com>
 <20240918213845.158293-10-mario.limonciello@amd.com>
 <5bbaeac3-7916-4e75-9c92-b93e2cd78ff5@amd.com>
 <4bc60bb2-3c67-4418-ad79-316ea1ac0dc1@amd.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <4bc60bb2-3c67-4418-ad79-316ea1ac0dc1@amd.com>
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




On 25/09/2024 14:55, Mario Limonciello wrote:
> Alex,
>
> Unfortunately I can't reproduce the regression on the APU I tried. 
> However I do have a suspicion on a fix.
>
> Can you see if this helps?  If it does, we can squash it in.
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c 
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index bf847ac55475..e75cd527d753 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -7008,6 +7008,7 @@ static void amdgpu_dm_connector_destroy(struct 
> drm_connector *connector)
>                 kfree(aconnector->i2c);
>         }
>         kfree(aconnector->dm_dp_aux.aux.name);
> +       drm_edid_free(aconnector->drm_edid);
>
>         kfree(connector);
>  }
>
> If that doesn't help, I did test dropping this patch and it doesn't 
> affect the last patch in the series, that one still works so I'm fine 
> with dropping it and we can follow up later.
yes, I agree with Mario's proposal.
>
> On 9/25/2024 12:06, Alex Hung wrote:
>> Mario and Melissa,
>>
>> This patch causes a regrerssion on 7900 XTX in an IGT test: 
>> amd_mem_leak's connector-suspend-resume.
>>
>> Is this patch necessary on this series or is it independent from 
>> other patches, i.e. can it be dropped from this series until fixed??
>>
>> Cheers,
>> Alex Hung
>>
>> On 9/18/24 15:38, Mario Limonciello wrote:
>>> From: Melissa Wen <mwen@igalia.com>
>>>
>>> We can parse edid caps from drm_edid and drm_eld and any calls of
>>> dm_helpers_parse_edid_caps is made in a state that we have drm_edid set
>>> to amdgpu connector.
>>>
>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>> ---
>>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  5 +---
>>>   .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 30 
>>> ++++++++-----------
>>>   drivers/gpu/drm/amd/display/dc/dm_helpers.h   |  1 -
>>>   .../drm/amd/display/dc/link/link_detection.c  |  6 ++--
>>>   4 files changed, 16 insertions(+), 26 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/ 
>>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> index bd8fb9968c7c..bf847ac55475 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> @@ -7123,10 +7123,7 @@ static void 
>>> amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
>>>           memset(&dc_em_sink->edid_caps, 0, sizeof(struct 
>>> dc_edid_caps));
>>>           memmove(dc_em_sink->dc_edid.raw_edid, edid,
>>>               (edid->extensions + 1) * EDID_LENGTH);
>>> -        dm_helpers_parse_edid_caps(
>>> -            dc_link,
>>> -            &dc_em_sink->dc_edid,
>>> -            &dc_em_sink->edid_caps);
>>> +        dm_helpers_parse_edid_caps(dc_link, &dc_em_sink->edid_caps);
>>>       }
>>>   }
>>> diff --git 
>>> a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c 
>>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>>> index d43ed3ea000b..8f4be7a1ec45 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>>> @@ -83,32 +83,24 @@ static void apply_edid_quirks(struct 
>>> drm_edid_product_id *product_id,
>>>    * dm_helpers_parse_edid_caps() - Parse edid caps
>>>    *
>>>    * @link: current detected link
>>> - * @edid:    [in] pointer to edid
>>>    * @edid_caps:    [in] pointer to edid caps
>>>    *
>>>    * Return: void
>>>    */
>>> -enum dc_edid_status dm_helpers_parse_edid_caps(
>>> -        struct dc_link *link,
>>> -        const struct dc_edid *edid,
>>> -        struct dc_edid_caps *edid_caps)
>>> +enum dc_edid_status dm_helpers_parse_edid_caps(struct dc_link *link,
>>> +                           struct dc_edid_caps *edid_caps)
>>>   {
>>>       struct amdgpu_dm_connector *aconnector = link->priv;
>>>       struct drm_connector *connector = &aconnector->base;
>>>       const struct drm_edid *drm_edid = aconnector->drm_edid;
>>>       struct drm_edid_product_id product_id;
>>> -    struct edid *edid_buf = edid ? (struct edid *) edid->raw_edid : 
>>> NULL;
>>>       int sad_count;
>>>       int i = 0;
>>> -
>>>       enum dc_edid_status result = EDID_OK;
>>> -    if (!edid_caps || !edid)
>>> +    if (!edid_caps || !drm_edid)
>>>           return EDID_BAD_INPUT;
>>> -    if (!drm_edid_is_valid(edid_buf))
>>> -        result = EDID_BAD_CHECKSUM;
>>> -
>>>       drm_edid_get_product_id(drm_edid, &product_id);
>>>       edid_caps->manufacturer_id = 
>>> le16_to_cpu(product_id.manufacturer_name);
>>> @@ -920,19 +912,23 @@ enum dc_edid_status dm_helpers_read_local_edid(
>>>           if (!drm_edid)
>>>               return EDID_NO_RESPONSE;
>>> -        edid = drm_edid_raw(drm_edid); // FIXME: Get rid of 
>>> drm_edid_raw()
>>> +        /* FIXME: Get rid of drm_edid_raw()
>>> +         * Raw edid is still needed for dm_helpers_dp_write_dpcd()
>>> +         */
>>> +        edid = drm_edid_raw(drm_edid);
>>>           sink->dc_edid.length = EDID_LENGTH * (edid->extensions + 1);
>>>           memmove(sink->dc_edid.raw_edid, (uint8_t *)edid, sink- 
>>> >dc_edid.length);
>>>           edid_status = dm_helpers_parse_edid_caps(
>>>                           link,
>>> -                        &sink->dc_edid,
>>>                           &sink->edid_caps);
>>> -        /* We don't need the original edid anymore */
>>> -        drm_edid_free(drm_edid);
>>> -
>>> -    } while (edid_status == EDID_BAD_CHECKSUM && --retry > 0);
>>> +        if (edid_status != EDID_OK) {
>>> +            /* We can discard the drm_edid and retry */
>>> +            drm_edid_free(drm_edid);
>>> +            drm_edid_connector_update(connector, drm_edid);
>>> +        }
>>> +    } while (edid_status != EDID_OK && --retry > 0);
>>>       if (edid_status != EDID_OK)
>>>           DRM_ERROR("EDID err: %d, on connector: %s",
>>> diff --git a/drivers/gpu/drm/amd/display/dc/dm_helpers.h b/drivers/ 
>>> gpu/drm/amd/display/dc/dm_helpers.h
>>> index 2e4a46f1b499..4e1776b5f0d4 100644
>>> --- a/drivers/gpu/drm/amd/display/dc/dm_helpers.h
>>> +++ b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
>>> @@ -61,7 +61,6 @@ void dm_helpers_free_gpu_mem(
>>>   enum dc_edid_status dm_helpers_parse_edid_caps(
>>>       struct dc_link *link,
>>> -    const struct dc_edid *edid,
>>>       struct dc_edid_caps *edid_caps);
>>> diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/ 
>>> drivers/gpu/drm/amd/display/dc/link/link_detection.c
>>> index d21ee9d12d26..94c911742dd3 100644
>>> --- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
>>> +++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
>>> @@ -1413,10 +1413,8 @@ struct dc_sink *link_add_remote_sink(
>>>               dc_sink))
>>>           goto fail_add_sink;
>>> -    edid_status = dm_helpers_parse_edid_caps(
>>> -            link,
>>> -            &dc_sink->dc_edid,
>>> -            &dc_sink->edid_caps);
>>> +    edid_status = dm_helpers_parse_edid_caps(link,
>>> +                         &dc_sink->edid_caps);
>>>       /*
>>>        * Treat device as no EDID device if EDID
>>
>

