Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DF4A91E5E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 15:44:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0343310EB0F;
	Thu, 17 Apr 2025 13:44:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="dKkKabU4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010EF10EB0F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 13:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EPwtQ7dxQK8kZzwkJuhOcgppTuN8gkB7jJkZ2SXR+MM=; b=dKkKabU4G6M8EOJJgdb4Mm+U/8
 cCBtgBlqPiH3b0tgodOPsFTXkvFLRWgNciMR+naKxpthidWYGg1LoEPjv9BdnXLHZdPvAN0d07188
 LSMLRfn5/x3j+3NS2JQ98A1d8jcg+nW5zWPK6WoRXkzSmiry+lRkKfDTMvweM7/SGWPHUovL08eol
 pI13QTAovip5E46DAai/FAcw/6FJIHv3+p4cTawt1vb/TPbpliYhqgYf886r6h/zP5bQQfaOapaWw
 RgcNcU96I5HRbBB+sKCgDtBsVyDCkheXn7IZUFKx+2e/EwmN3JyQmbwy2tBXZ7gpPUqgp8r2Po2vR
 w/lPlb9w==;
Received: from [189.6.35.67] (helo=[192.168.0.55])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u5PXJ-000pNd-MZ; Thu, 17 Apr 2025 15:44:14 +0200
Message-ID: <9293ab7e-0f02-437d-936e-089faeee400b@igalia.com>
Date: Thu, 17 Apr 2025 10:44:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] drm/edid: introduce a helper that compares edid
 data from two drm_edid
To: Jani Nikula <jani.nikula@linux.intel.com>, Alex Hung <alex.hung@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250411201333.151335-1-mwen@igalia.com>
 <20250411201333.151335-12-mwen@igalia.com> <87ikn7t5um.fsf@intel.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <87ikn7t5um.fsf@intel.com>
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



On 14/04/2025 07:06, Jani Nikula wrote:
> On Fri, 11 Apr 2025, Melissa Wen <mwen@igalia.com> wrote:
>> AMD driver has a function used to compare if two edid are the same; this
>> is useful to some of the link detection algorithms implemented by
>> amdgpu. Since the amdgpu function can be helpful for other drivers, this
>> commit abstracts the AMD function to make it available at the DRM level
>> by wrapping existent drm_edid_eq().
>>
>> Co-developed-by: Rodrigo Siqueira <siqueira@igalia.com>
>> Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>> ---
>>   drivers/gpu/drm/drm_edid.c | 18 ++++++++++++++++++
>>   include/drm/drm_edid.h     |  2 ++
>>   2 files changed, 20 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index 855beafb76ff..328a25d198e5 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -7502,3 +7502,21 @@ bool drm_edid_is_digital(const struct drm_edid *drm_edid)
>>   		drm_edid->edid->input & DRM_EDID_INPUT_DIGITAL;
>>   }
>>   EXPORT_SYMBOL(drm_edid_is_digital);
>> +
>> +/**
>> + * drm_edid_is_edid_eq - Check if it the EDID is equal
Hi Jani,
> I think drm_edid_eq() is the better name. Please rename the static one
> to make room. Maybe make it drm_edid_eq_buf() or something, because
> that's what it really does.
right
> "Check if the EDIDs are equal"
>
>> + *
>> + * @drm_edid_old: old drm_edid to compare edid
>> + * @drm_edid_new: new drm_edid to compare edid
> Old and new are meaningless here. It's supposed to be a generic
> function. Just a/b or edid1/edid2 or something.
ack
>> + *
>> + * Return true if the EDID is equal
> "Return true if the EDIDs are equal."
ack
>
>> + */
>> +bool drm_edid_is_edid_eq(const struct drm_edid *drm_edid_old,
>> +			 const struct drm_edid *drm_edid_new)
>> +{
>> +	const void *old_edid = drm_edid_old->edid;
>> +	size_t old_edid_size = drm_edid_old->size;
> The existing drm_edid_eq() function supports the use case of either or
> both EDIDs being NULL, and returning true for two NULL EDIDs. This one
> oopses if the "old" EDID is NULL.
>
> I'm not sure you can trivially replicate that behaviour by reusing the
> existing function, though.
Right.

I think I can replicate this behavior by doing:

         const void *old_edid = drm_edid ? drm_edid_old->edid : NULL;
         size_t old_edid_size = drm_edid ? drm_edid_old->size : 0;

         return drm_edid_eq(drm_edid_new, old_edid, old_edid_size);

WDTY?

Thanks for reviewing.

Melissa

>
>> +
>> +	return drm_edid_eq(drm_edid_new, old_edid, old_edid_size);
>> +}
>> +EXPORT_SYMBOL(drm_edid_is_edid_eq);
>> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
>> index eaac5e665892..0e062761296c 100644
>> --- a/include/drm/drm_edid.h
>> +++ b/include/drm/drm_edid.h
>> @@ -469,6 +469,8 @@ int drm_edid_connector_update(struct drm_connector *connector,
>>   			      const struct drm_edid *edid);
>>   int drm_edid_connector_add_modes(struct drm_connector *connector);
>>   bool drm_edid_is_digital(const struct drm_edid *drm_edid);
>> +bool drm_edid_is_edid_eq(const struct drm_edid *drm_edid_first,
>> +			 const struct drm_edid *drm_edid_second);
>>   void drm_edid_get_product_id(const struct drm_edid *drm_edid,
>>   			     struct drm_edid_product_id *id);
>>   void drm_edid_print_product_id(struct drm_printer *p,

