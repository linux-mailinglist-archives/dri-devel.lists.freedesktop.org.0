Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 032087054C1
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 19:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4FC010E282;
	Tue, 16 May 2023 17:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id E54C910E282
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 17:13:35 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:38604.1707314332
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 17FDE1001EC;
 Wed, 17 May 2023 01:13:31 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-prw2v with ESMTP id
 953a00f70f7049468745cd8cdf3e03c8 for tzimmermann@suse.de; 
 Wed, 17 May 2023 01:13:33 CST
X-Transaction-ID: 953a00f70f7049468745cd8cdf3e03c8
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <530369f4-1edd-d8cf-031e-a8effdf15510@189.cn>
Date: Wed, 17 May 2023 01:13:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/drm_vblank.c: avoid unsigned int to signed int cast
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Sui Jingfeng <suijingfeng@loongson.cn>
References: <20230516165931.2989639-1-suijingfeng@loongson.cn>
 <c4a08b01-6d81-a21f-ba9f-ade2b447ff6d@suse.de>
Content-Language: en-US
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <c4a08b01-6d81-a21f-ba9f-ade2b447ff6d@suse.de>
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

Hi,

On 2023/5/17 01:06, Thomas Zimmermann wrote:
>
>
> Am 16.05.23 um 18:59 schrieb Sui Jingfeng:
>> Both mode->crtc_htotal and mode->crtc_vtotal are u16 type,
>> mode->crtc_htotal * mode->crtc_vtotal will results a unsigned type.
>> Using a u32 is enough to store the result, but considering that the
>> result will be casted to u64 soon after. We use a u64 type directly.
>>
>> So there no need to cast it to signed type and cast back then.
>>
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linux-kernel@vger.kernel.org
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>
Thanks a lot,  thanks for the response time also.

>> ---
>>   drivers/gpu/drm/drm_vblank.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
>> index 877e2067534f..d99c404b181b 100644
>> --- a/drivers/gpu/drm/drm_vblank.c
>> +++ b/drivers/gpu/drm/drm_vblank.c
>> @@ -622,7 +622,7 @@ void drm_calc_timestamping_constants(struct 
>> drm_crtc *crtc,
>>         /* Valid dotclock? */
>>       if (dotclock > 0) {
>> -        int frame_size = mode->crtc_htotal * mode->crtc_vtotal;
>> +        u64 frame_size = mode->crtc_htotal * mode->crtc_vtotal;
>>             /*
>>            * Convert scanline length in pixels and video
>> @@ -630,7 +630,7 @@ void drm_calc_timestamping_constants(struct 
>> drm_crtc *crtc,
>>            * in nanoseconds:
>>            */
>>           linedur_ns  = div_u64((u64) mode->crtc_htotal * 1000000, 
>> dotclock);
>> -        framedur_ns = div_u64((u64) frame_size * 1000000, dotclock);
>> +        framedur_ns = div_u64(frame_size * 1000000, dotclock);
>>             /*
>>            * Fields of interlaced scanout modes are only half a frame 
>> duration.
>
