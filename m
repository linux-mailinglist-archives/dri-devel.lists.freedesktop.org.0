Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2D0466092
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 10:40:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 675416EB92;
	Thu,  2 Dec 2021 09:40:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 55AF66EB92
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 09:40:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B75881435;
 Thu,  2 Dec 2021 01:40:01 -0800 (PST)
Received: from [10.1.32.21] (e122027.cambridge.arm.com [10.1.32.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 257DF3F7D7;
 Thu,  2 Dec 2021 01:40:00 -0800 (PST)
Subject: Re: [PATCH] drm/komeda: Fix an undefined behavior bug in
 komeda_plane_add()
To: Liviu Dudau <liviu.dudau@arm.com>
References: <20211130142531.156863-1-zhou1615@umn.edu>
 <fadc42da-bf13-4c18-653b-8d80fd486940@arm.com>
 <Yafl/A/dId/z+88j@e110455-lin.cambridge.arm.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <95728378-3af0-2b55-0545-46d5131fa491@arm.com>
Date: Thu, 2 Dec 2021 09:39:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Yafl/A/dId/z+88j@e110455-lin.cambridge.arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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
Cc: Mihail Atanassov <mihail.atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Zhou Qingyang <zhou1615@umn.edu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/12/2021 21:15, Liviu Dudau wrote:
> On Wed, Dec 01, 2021 at 03:44:03PM +0000, Steven Price wrote:
>> On 30/11/2021 14:25, Zhou Qingyang wrote:
>>> In komeda_plane_add(), komeda_get_layer_fourcc_list() is assigned to
>>> formats and used in drm_universal_plane_init().
>>> drm_universal_plane_init() passes formats to
>>> __drm_universal_plane_init(). __drm_universal_plane_init() further
>>> passes formats to memcpy() as src parameter, which could lead to an
>>> undefined behavior bug on failure of komeda_get_layer_fourcc_list().
>>>
>>> Fix this bug by adding a check of formats.
>>>
>>> This bug was found by a static analyzer. The analysis employs
>>> differential checking to identify inconsistent security operations
>>> (e.g., checks or kfrees) between two code paths and confirms that the
>>> inconsistent operations are not recovered in the current function or
>>> the callers, so they constitute bugs.
>>>
>>> Note that, as a bug found by static analysis, it can be a false
>>> positive or hard to trigger. Multiple researchers have cross-reviewed
>>> the bug.
>>>
>>> Builds with CONFIG_DRM_KOMEDA=m show no new warnings,
>>> and our static analyzer no longer warns about this code.
>>>
>>> Fixes: 61f1c4a8ab75 ("drm/komeda: Attach komeda_dev to DRM-KMS")
>>> Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
>>> ---
>>>  drivers/gpu/drm/arm/display/komeda/komeda_plane.c | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
>>> index d63d83800a8a..dd3f17e970dd 100644
>>> --- a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
>>> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
>>> @@ -265,6 +265,10 @@ static int komeda_plane_add(struct komeda_kms_dev *kms,
>>>  
>>>  	formats = komeda_get_layer_fourcc_list(&mdev->fmt_tbl,
>>>  					       layer->layer_type, &n_formats);
>>> +	if (!formats) {
>>> +		err = -ENOMEM;
>>> +		goto cleanup;
>>> +	}
>>
>> If this executes it will cause undefined behaviour...
>>
>> The cleanup code calls komeda_plane_destroy() which calls
>> drm_plane_cleanup() which does (amongst other things) a
>> list_del(&plane->head). But the plane hasn't been put on a list yet as
>> that's done in drm_universal_plane_init().
>>
>> So in this case we simple want to do:
>>
>> if (!formats) {
>> 	kfree(kplane);
>> 	return -ENOMEM;
>> }
> 
> Zhou has already posted v2 that contains this fix.

Sorry, for some reason Zhou's patch appeared twice on the list and I
hadn't spotted your reply to the other version. My mistake.

>>
>> Note that without this 'fix' a NULL return from
>> komeda_get_layer_fourcc_list() would leave n_formats==0, so while the
>> NULL pointer is passed into memcpy() it is also passed a length of 0.
>> Which I believe is safe.
>>
>> However while looking at this function...
>>
>>>  
>>>  	err = drm_universal_plane_init(&kms->base, plane,
>>>  			get_possible_crtcs(kms, c->pipeline),
>>>
>>
>> This call to drm_universal_plane_init() can fail early before
>> plane->head has been initialised. In which case the following:
>>
>>> 	komeda_put_fourcc_list(formats);
>>>
>>> 	if (err)
>>> 		goto cleanup;
>>
>> commits the exact same sin and would cause a similar NULL dereference in
>> drm_plane_cleanup().
> 
> I will come up with a patch for this case and post it to the list tomorrow.

Great, thanks for taking a look - I'm afraid I couldn't see an obvious fix.

Regards,

Steven
