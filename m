Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6574DADB985
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 21:26:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C73610E41A;
	Mon, 16 Jun 2025 19:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Y1Pdcicv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C6E10E41A;
 Mon, 16 Jun 2025 19:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AmdyMDMOdhvn8R+G8lx3KGWpeafNSjB9gXcXyS2Tzw8=; b=Y1PdcicvD8bRdhQr/r+Sao+Xk4
 VGmR4/M1B55nLbvfHIbwEkT/fwveL4dONbpcW/pK0Qm40CvP9ZyLi2SWmD2lmLrhg0EWULNmqr322
 S1L2JH1qDZ7B/Jxa7jmsi0aRGXuLYORohMq8RqK9IF8FzZVzJLsF4Ta2Ibn5NRyC5aws4GCFYun3C
 ZE7bJ7HIsFQIp4LaS1VfQBNc+FYHVxAHAK+LpfM8ynqAu/ZGlfIghgW4NqTuY0ycSQmpuFFlAaOIa
 FHuAGtcAy30HAIry4H1y88MuEBqr+KEFQTuCoOMa5jkkad2fTMR34xLV76nOeYs+yzBl+RXw0lQha
 RuGHbqdQ==;
Received: from [189.6.13.79] (helo=[192.168.0.55])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uRFTW-004G7u-UR; Mon, 16 Jun 2025 21:26:35 +0200
Message-ID: <8191efcf-9301-45a5-b277-57825d2240e1@igalia.com>
Date: Mon, 16 Jun 2025 16:26:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/14] drm/edid: introduce a helper that compares edid
 data from two drm_edid
To: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20250613150015.245917-1-mwen@igalia.com>
 <20250613150015.245917-13-mwen@igalia.com>
 <28470c12-cc2a-4327-ba72-e926960d5c81@amd.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <28470c12-cc2a-4327-ba72-e926960d5c81@amd.com>
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



On 13/06/2025 15:35, Mario Limonciello wrote:
> On 6/13/2025 9:58 AM, Melissa Wen wrote:
>> AMD driver has a function used to compare if two edid are the same; this
>> is useful to some of the link detection algorithms implemented by
>> amdgpu. Since the amdgpu function can be helpful for other drivers, this
>> commit abstracts the AMD function to make it available at the DRM level
>> by wrapping existent drm_edid_eq().
>>
>> v2:
>> - rename drm_edid_eq to drm_edid_eq_buf (jani)
>> - add NULL checks (jani)
>>
>> v3:
>> - fix kernel-doc (jani)
>> - fix parameter names
>>
>> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>> Co-developed-by: Rodrigo Siqueira <siqueira@igalia.com>
>> Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>> ---
>>   drivers/gpu/drm/drm_edid.c | 24 +++++++++++++++++++++---
>>   include/drm/drm_edid.h     |  2 ++
>>   2 files changed, 23 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index d5772a3d27f1..056e070b2f55 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -1820,8 +1820,8 @@ static bool edid_block_is_zero(const void *edid)
>>       return mem_is_zero(edid, EDID_LENGTH);
>>   }
>>   -static bool drm_edid_eq(const struct drm_edid *drm_edid,
>> -            const void *raw_edid, size_t raw_edid_size)
>> +static bool drm_edid_eq_buf(const struct drm_edid *drm_edid,
>> +                const void *raw_edid, size_t raw_edid_size)
>>   {
>>       bool edid1_present = drm_edid && drm_edid->edid && drm_edid->size;
>>       bool edid2_present = raw_edid && raw_edid_size;
>> @@ -6915,7 +6915,7 @@ static int 
>> _drm_edid_connector_property_update(struct drm_connector *connector,
>>           const void *old_edid = connector->edid_blob_ptr->data;
>>           size_t old_edid_size = connector->edid_blob_ptr->length;
>>   -        if (old_edid && !drm_edid_eq(drm_edid, old_edid, 
>> old_edid_size)) {
>> +        if (old_edid && !drm_edid_eq_buf(drm_edid, old_edid, 
>> old_edid_size)) {
>>               connector->epoch_counter++;
>>               drm_dbg_kms(dev, "[CONNECTOR:%d:%s] EDID changed, epoch 
>> counter %llu\n",
>>                       connector->base.id, connector->name,
>> @@ -7520,3 +7520,21 @@ bool drm_edid_is_digital(const struct drm_edid 
>> *drm_edid)
>>           drm_edid->edid->input & DRM_EDID_INPUT_DIGITAL;
>>   }
>>   EXPORT_SYMBOL(drm_edid_is_digital);
>> +
>> +/**
>> + * drm_edid_eq - Check if EDIDs are equal
>> + *
>> + * @drm_edid_1: first drm_edid to compare edid
>> + * @drm_edid_2: second drm_edid to compare edid
>> + *
>> + * Return true if EDIDs are equal.
>> + */
>> +bool drm_edid_eq(const struct drm_edid *drm_edid_1,
>> +         const struct drm_edid *drm_edid_2)
>> +{
>> +    const void *edid_1 = drm_edid_1 ? drm_edid_1->edid : NULL;
>> +    size_t edid_1_size = drm_edid_1 ? drm_edid_1->size : 0;
>> +
>> +    return drm_edid_eq_buf(drm_edid_2, edid_1, edid_1_size);
>
> What happens when the size for edid 2 is different than edid 1? Does 
> drm_edid_eq_buf() already handle this well (I didn't immediately look)?

drm_edid_eq_buf handles this case.
This is the code:

static bool drm_edid_eq_buf(const struct drm_edid *drm_edid,
                                              const void *raw_edid, 
size_t raw_edid_size)
{
     bool edid1_present = drm_edid && drm_edid->edid && drm_edid->size;
     bool edid2_present = raw_edid && raw_edid_size;

     if (edid1_present != edid2_present)
         return false;

     if (edid1_present) {
         if (drm_edid->size != raw_edid_size)
             return false;

         if (memcmp(drm_edid->edid, raw_edid, drm_edid->size))
             return false;
     }

     return true;
}

>
>
> If not; how about including an extra check directly in this function?
>
> I was thinking this will handle it effectively:
>
> if (!drm_edid_1 || !drm_edid_2)
>     return false;
If both EDIDs are NULL, they are equal (and we don't need to update 
anything).
So drm_edid_eq() should return true.


> if (drm_edid_1->size != drm_edid_2->size)
>     return false;
>
And the size comparison is handled by drm_edid_eq_buf() in this part:

     if (edid1_present) {
         if (drm_edid->size != raw_edid_size)
             return false;

> return drm_edid_eq_buf();
>
>
>
>> +}
>> +EXPORT_SYMBOL(drm_edid_eq);
>> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
>> index 960592167486..e7a9a4928b97 100644
>> --- a/include/drm/drm_edid.h
>> +++ b/include/drm/drm_edid.h
>> @@ -469,6 +469,8 @@ int drm_edid_connector_update(struct 
>> drm_connector *connector,
>>                     const struct drm_edid *edid);
>>   int drm_edid_connector_add_modes(struct drm_connector *connector);
>>   bool drm_edid_is_digital(const struct drm_edid *drm_edid);
>> +bool drm_edid_eq(const struct drm_edid *drm_edid_first,
>> +             const struct drm_edid *drm_edid_second);
>>   void drm_edid_get_product_id(const struct drm_edid *drm_edid,
>>                    struct drm_edid_product_id *id);
>>   void drm_edid_print_product_id(struct drm_printer *p,
>

