Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C265F0789
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 11:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38FFA10EC1D;
	Fri, 30 Sep 2022 09:25:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A339510EC1D
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 09:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664529939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wHizq7BlPFEQ4Or7gBQDWV2H9Bve5A4TC0jGsXwCKqY=;
 b=g8gqIXytf+QbvddoxkwfFxaGeF5Pz8RF8ta8LXEBVAPxPqIVJosUcuMLrHT2wiidj6kc5I
 CrkbSVmGybbAKMvQ1twltM1+L3c+TuWGbfV4jy23Kfk7Wtol6ftNLcyy5sjWWdRhSqUjHq
 WPh7r3kMuN+urU+7hUmXbFyq2ZOIj7M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-62-QNNnDoNGMmycaDvwBtmbSg-1; Fri, 30 Sep 2022 05:25:38 -0400
X-MC-Unique: QNNnDoNGMmycaDvwBtmbSg-1
Received: by mail-wr1-f72.google.com with SMTP id
 e28-20020adfa45c000000b0022cc7d071b4so1359426wra.23
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 02:25:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=wHizq7BlPFEQ4Or7gBQDWV2H9Bve5A4TC0jGsXwCKqY=;
 b=Q8BxhuR0wlGvAJMEbWn/mZwCtrc9lpqK8WEnZX3eRl5X5X3VaNP5y6pEcVZkAN3IEd
 e7rzbC2PuPfPtGsCpUNOBPv3deEtYQNlsi6KxFUTd+59BRa6o0255Jr4ow74Ph67Dz0I
 Fuii3SaHxcmS2x1ycZvX0YQdAoul1IGWNL4t2L4XeGeCpJZ2AHiJYzC2d0/zu1u5kAJn
 Zkq1BKEq4HD1g5b34ysKXK0G8KPUf4JNuLwA9XfGISm9LEtLGJkYVbhwMtkyPMn6NSiN
 0yJ1LK+ne94fhVDHIdxCN4U5Ir3tJII9/WhY9PYkw9cFTOK/jzvtU24UH702A1OMLT+6
 j1HA==
X-Gm-Message-State: ACrzQf3oU3pTF6gB4MjOBm9YNjnesbZZxaj/DeIz98rcO3xGw3inCE/c
 mhh34XSAIkCbDZVPQJvsmdPHoYlHaVGFCQDHh8r47PxYGUTGOUa0Tq1Eh/httDYrE0QZmJvCMGu
 0mkQI36tz07/XXqnaoaaTfMfLKIND
X-Received: by 2002:a5d:5a1a:0:b0:22a:ad99:d6eb with SMTP id
 bq26-20020a5d5a1a000000b0022aad99d6ebmr5618688wrb.76.1664529937450; 
 Fri, 30 Sep 2022 02:25:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM69Z1NMeezNfWti8y4P1oywT0JJcVH22qy0OB4L5lj8XASLTSigVkXmdmqLEoZUymOkuE/tXQ==
X-Received: by 2002:a5d:5a1a:0:b0:22a:ad99:d6eb with SMTP id
 bq26-20020a5d5a1a000000b0022aad99d6ebmr5618677wrb.76.1664529937242; 
 Fri, 30 Sep 2022 02:25:37 -0700 (PDT)
Received: from [10.0.6.199] ([91.126.32.244]) by smtp.gmail.com with ESMTPSA id
 n186-20020a1ca4c3000000b003a8434530bbsm6305484wme.13.2022.09.30.02.25.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 02:25:36 -0700 (PDT)
Message-ID: <da9fddaa-2329-c91b-a89d-c998c5720917@redhat.com>
Date: Fri, 30 Sep 2022 11:25:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] drm/ssd130x: Iterate over damage clips instead of using a
 merged rect
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220930080123.2441629-1-javierm@redhat.com>
 <a72d4736-74e1-1485-e952-f39909d94fbc@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <a72d4736-74e1-1485-e952-f39909d94fbc@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: David Airlie <airlied@linux.ie>, Jocelyn Falempe <jfalempe@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

Thanks a lot for your feedback.

On 9/30/22 10:26, Thomas Zimmermann wrote:
> Hi
> 
> Am 30.09.22 um 10:01 schrieb Javier Martinez Canillas:
>> The drm_atomic_helper_damage_merged() helper merges all the damage clips
>> into one rectangle. If there are multiple damage clips that aren't close
>> to each other, the resulting rectangle could be quite big.
>>
>> Instead of using that function helper, iterate over all the damage clips
>> and update them one by one.
>>
>> Suggested-by: Jocelyn Falempe <jfalempe@redhat.com>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> ---
>>
>>   drivers/gpu/drm/solomon/ssd130x.c | 18 ++++++++++--------
>>   1 file changed, 10 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
>> index bc41a5ae810a..2428f1813a8d 100644
>> --- a/drivers/gpu/drm/solomon/ssd130x.c
>> +++ b/drivers/gpu/drm/solomon/ssd130x.c
>> @@ -578,21 +578,23 @@ static void ssd130x_primary_plane_helper_atomic_update(struct drm_plane *plane,
>>   	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
>>   	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
>>   	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
>> +	struct drm_atomic_helper_damage_iter iter;
>>   	struct drm_device *drm = plane->dev;
>> -	struct drm_rect src_clip, dst_clip;
>> +	struct drm_rect dst_clip;
>> +	struct drm_rect damage;
>>   	int idx;
>>   
>> -	if (!drm_atomic_helper_damage_merged(old_plane_state, plane_state, &src_clip))
>> -		return;
>> -
>>   	dst_clip = plane_state->dst;
>> -	if (!drm_rect_intersect(&dst_clip, &src_clip))
>> -		return;
>> -
>>   	if (!drm_dev_enter(drm, &idx))
>>   		return;
>>   
>> -	ssd130x_fb_blit_rect(plane_state->fb, &shadow_plane_state->data[0], &dst_clip);
>> +	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
>> +	drm_atomic_for_each_plane_damage(&iter, &damage) {
>> +		if (!drm_rect_intersect(&dst_clip, &damage))
>> +			continue;
> 
> dst_clip will be overwritten here. So need to init it within the loop first.
> 

Oh, indeed. I'll move it inside the loop. Thanks for catching this.

>> +
>> +		ssd130x_fb_blit_rect(plane_state->fb, &shadow_plane_state->data[0], &damage);
> 
> In simpledrm, we adjust the destination address with dst_clip like this:
> 
>    iosys_map_incr(&dst, drm_fb_clip_offset(sdev->pitch, sdev->format, 
> &dst_clip));
> 
> How does this work in ssd130x? You never use dst_clip to adjust to the 
> changed location. Won't you have out-of-bounds writes on the device?
> 

Right, in ssd130x what I do is:

static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_map *vmap,
				struct drm_rect *rect)
{
	struct iosys_map dst;
...
	u8 *buf = NULL;
...
	buf = kcalloc(dst_pitch, drm_rect_height(rect), GFP_KERNEL);
...
	iosys_map_set_vaddr(&dst, buf);
	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, rect);
...
	ssd130x_update_rect(ssd130x, buf, rect);
}

I understand that's correct too?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

