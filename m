Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 766286D56F3
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 04:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1F710E049;
	Tue,  4 Apr 2023 02:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0092310E049
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 02:55:33 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:48454.1860087732
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id 97DE0102ADA;
 Tue,  4 Apr 2023 10:55:29 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-7b48884fd-bkw2h with ESMTP id
 9b5738e047274065a67ab0e7b4b82ca0 for tzimmermann@suse.de; 
 Tue, 04 Apr 2023 10:55:31 CST
X-Transaction-ID: 9b5738e047274065a67ab0e7b4b82ca0
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <3c173bbe-c74a-5817-c9c5-f3364c628240@189.cn>
Date: Tue, 4 Apr 2023 10:55:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/fbdev-generic: optimize out a redundant assignment
 clause
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, suijingfeng <suijingfeng@loongson.cn>,
 liyi <liyi@loongson.cn>, Lucas De Marchi <lucas.demarchi@intel.com>
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
Yes, I just realized that.

iosys_map_incr() change the internal state of a opaque structure, this 
is somewhat evil.

if it is non-opaque, then this is abstract failure.

You have to worry about that if it is changed by a accident call 
iosys_map_incr() from other place.

The map should be const, I guess most programmer expect  the map be a const.

making it const please, copy on demand, modify the copy only, leave the 
original mapping untouched.

Hope this could eliminate the embarrassing.

Sorry for missing the point.

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
I have also get some idea from you idea.
> Best regards
> Thomas
>
>>         drm_client_buffer_vunmap(buffer);
>
