Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CAF6CD7E2
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 12:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD26A10E16E;
	Wed, 29 Mar 2023 10:48:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
 by gabe.freedesktop.org (Postfix) with ESMTP id 62C4410E159
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 10:48:35 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:48250.1027552899
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id DF30A10029C;
 Wed, 29 Mar 2023 18:48:28 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-7b48884fd-ljp89 with ESMTP id
 29ed5fd3609e43b184df0070a4571f07 for tzimmermann@suse.de; 
 Wed, 29 Mar 2023 18:48:29 CST
X-Transaction-ID: 29ed5fd3609e43b184df0070a4571f07
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <daf5bc36-0deb-631d-dfaf-396113d3d1d8@189.cn>
Date: Wed, 29 Mar 2023 18:48:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/fbdev-generic: optimize out a redundant assignment
 clause
To: Thomas Zimmermann <tzimmermann@suse.de>, Sui Jingfeng
 <15330273260@189.cn>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, liyi <liyi@loongson.cn>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20230325074636.136833-1-15330273260@189.cn>
 <a3370ae7-8c78-8170-f9c3-7f616a1fa382@suse.de>
Content-Language: en-US
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <a3370ae7-8c78-8170-f9c3-7f616a1fa382@suse.de>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023/3/29 17:04, Thomas Zimmermann wrote:
> (cc'ing Lucas)
>
> Hi
>
> Am 25.03.23 um 08:46 schrieb Sui Jingfeng:
>>   The assignment already done in drm_client_buffer_vmap(),
>>   just trival clean, no functional change.
>>
>> Signed-off-by: Sui Jingfeng <15330273260@189.cn>
>> ---
>>   drivers/gpu/drm/drm_fbdev_generic.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_fbdev_generic.c 
>> b/drivers/gpu/drm/drm_fbdev_generic.c
>> index 4d6325e91565..1da48e71c7f1 100644
>> --- a/drivers/gpu/drm/drm_fbdev_generic.c
>> +++ b/drivers/gpu/drm/drm_fbdev_generic.c
>> @@ -282,7 +282,7 @@ static int drm_fbdev_damage_blit(struct 
>> drm_fb_helper *fb_helper,
>>                    struct drm_clip_rect *clip)
>>   {
>>       struct drm_client_buffer *buffer = fb_helper->buffer;
>> -    struct iosys_map map, dst;
>> +    struct iosys_map map;
>>       int ret;
>>         /*
>> @@ -302,8 +302,7 @@ static int drm_fbdev_damage_blit(struct 
>> drm_fb_helper *fb_helper,
>>       if (ret)
>>           goto out;
>>   -    dst = map;
>> -    drm_fbdev_damage_blit_real(fb_helper, clip, &dst);
>> +    drm_fbdev_damage_blit_real(fb_helper, clip, &map);
>
> I see what you're doing and it's probably correct in this case.
>
> But there's a larger issue with this iosys interfaces. Sometimes the 
> address has to be modified (see calls of iosys_map_incr()). That can 
> prevent incorrect uses of the mapping in other places, especially in 
> unmap code.
>
> I think it would make sense to consider a separate structure for the 
> I/O location. The buffer as a whole would still be represented by 
> struct iosys_map.  And that new structure, let's call it struct 
> iosys_ptr, would point to an actual location within the buffer's 
> memory range. A few locations and helpers would need changes, but 
> there are not so many callers that it's an issue.  This would also 
> allow for a few debugging tests that ensure that iosys_ptr always 
> operates within the bounds of an iosys_map.
>
> I've long considered this idea, but there was no pressure to work on 
> it. Maybe now.
>
Ok. that's fine then.

> Best regards
> Thomas
>
>>         drm_client_buffer_vunmap(buffer);
>
