Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A878EBFA3BE
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 08:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E62F10E6B3;
	Wed, 22 Oct 2025 06:32:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="gvhzxu2E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nwLCUWk+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CUeUacNR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mw9otv+D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF6410E6B3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 06:32:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 098112118C;
 Wed, 22 Oct 2025 06:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761114725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=I4haBXcI59SAqclsFlKndkWFxtlb/fC3csAEbKP235w=;
 b=gvhzxu2EkmhVF19mxvCt1LQQbF9t4ERmC+Igw7pNmPc3IRUcJHKnVUEeUPLCM9nElxwxBg
 4ZkQHdJa5u1ssX1XqXOMoWJpTWE6g+H+zLHKrQHVkCbapePsQrAuMGP7MYRqchxbPadowt
 0cxUR31HU0+OLOwPjOd+qwBUOK6DNkY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761114725;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=I4haBXcI59SAqclsFlKndkWFxtlb/fC3csAEbKP235w=;
 b=nwLCUWk+uPFx5PrZy5tu37AfLyQ7pGFvedDUKUe7qO9teuOghO+ioHC3n4S7Tp3rC50lcW
 QjSDIggVUSeQY7CQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761114721; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=I4haBXcI59SAqclsFlKndkWFxtlb/fC3csAEbKP235w=;
 b=CUeUacNRdOEKYKljuYscvyqQZSb+OCf3drIpIoYtzs8fB1gGjt7VWZTwS95xG3RjYe6UBc
 n0SQCAfq/g1EcxfwisuntMl82Dz/DCy+3Rv8euJYt31i9WnbqEaJSn+QwN723zFc/TLd0e
 2CdeHvxAq5FZSogPrnyRiwwgI1FIS9Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761114721;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=I4haBXcI59SAqclsFlKndkWFxtlb/fC3csAEbKP235w=;
 b=mw9otv+Dp/g7c2K7qJceZZ4ZE/DKjz3yxBKL8mRojPo3JP7X/8FviGxprBBUgqAfnXBB0+
 6jJQsG9b/cqVhMDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C79D613A29;
 Wed, 22 Oct 2025 06:32:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id /JFLL2B6+GjfXgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 22 Oct 2025 06:32:00 +0000
Message-ID: <085bfefc-a0ab-4e28-be9d-23e92570376d@suse.de>
Date: Wed, 22 Oct 2025 08:32:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH] drm/virtgpu: Make vblank event dependent on the host
 resource
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "airlied@redhat.com" <airlied@redhat.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>
References: <20251016145230.79270-1-tzimmermann@suse.de>
 <IA0PR11MB7185A7BA7B8CEAC46CBC0922F8F6A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <21851b98-06ee-4e2c-8570-70e8a4fe5d86@suse.de>
 <afc6ba14-cd95-49b9-89f5-e90fd19c8927@collabora.com>
 <a2afbc13-0be6-46ef-a6da-9461fd30376b@collabora.com>
 <126a0b10-a550-430c-a1b3-7e144461a0ff@suse.de>
 <IA0PR11MB71850CA585D6E42C1E7217DDF8F3A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <c6b44524-4e44-46e8-89b4-8f90e074431b@collabora.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <c6b44524-4e44-46e8-89b4-8f90e074431b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TO_DN_EQ_ADDR_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_SEVEN(0.00)[7]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -4.30
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

Hi

Am 22.10.25 um 07:37 schrieb Dmitry Osipenko:
> On 10/22/25 08:02, Kasireddy, Vivek wrote:
>> Hi Thomas,
>>
>>> Subject: Re: [RFC][PATCH] drm/virtgpu: Make vblank event dependent on
>>> the host resource
>>>
>>>>> On 10/17/25 10:38, Thomas Zimmermann wrote:
>>>>> ...
>>>>>> There's little difference between the current event handling and the
>>> one
>>>>>> where no vblanks have been set up. I suspect that the vblank timer
>>>>>> callback interferes with the locking in atomic_flush. That would also
>>>>>> explain why the fps drop at no clear pattern.
>>>>>>
>>>>>> Could you please test the attached patch? It enables/disables the
>>> vblank
>>>>>> timer depending on the buffer resources; as you suggested
>>> before.  Does
>>>>>> this make a difference?
>>>>> The attached patch doesn't work, please see the trace below.
>>>>>
>>>>> @Vivek Please clarify whether you only see frames drop with your
>>>>> multi-gpu guest-blob setup or with a usual virgl too. I haven't noticed
>>>>> problem with frames pacing for virgl and nctx modes yesterday, will
>>>>> check again.
>>>> On a second look, I now see that this RFC (not the attached) patch
>>>> doesn't work properly with host blobs.
>>>>
>>>> I'm getting 100-150fps with this patch applied instead of expected
>>>> 60fps. Without this RFC patch I'm getting constant 60fps with native
>>>> context displaying host blobs.
>>>>
>>>> Not sure why guest blob would behave differently from the host blob.
>>>> Suspect something if off with the prime sharing that Vivek uses in the
>>>> vfio testing setup. I'd suggest to disable vblank timer only for guest
>>>> blobs if no quick solution will be found.
>>> After reading your reply and Vivek's new results, I'm confused now. Does
>>> it work or is there another patch needed?
>> Considering my use-case and Dmitry's virgl/venus/native context use-cases
>> and the benefits offered by vblank timer in these different scenarios, I think
>> the following patch should be sufficient for now:
>>
>> diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
>> index e972d9b015a9..c1a8f88f0a20 100644
>> --- a/drivers/gpu/drm/virtio/virtgpu_display.c
>> +++ b/drivers/gpu/drm/virtio/virtgpu_display.c
>> @@ -102,7 +102,11 @@ static void virtio_gpu_crtc_mode_set_nofb(struct drm_crtc *crtc)
>>   static void virtio_gpu_crtc_atomic_enable(struct drm_crtc *crtc,
>>                                            struct drm_atomic_state *state)
>>   {
>> -       drm_crtc_vblank_on(crtc);
>> +       struct drm_device *dev = crtc->dev;
>> +       struct virtio_gpu_device *vgdev = dev->dev_private;
>> +
>> +       if (!vgdev->has_resource_blob || vgdev->has_virgl_3d)
>> +               drm_crtc_vblank_on(crtc);
>>   }
>>   
>>   static void virtio_gpu_crtc_atomic_disable(struct drm_crtc *crtc,
>> @@ -112,7 +116,8 @@ static void virtio_gpu_crtc_atomic_disable(struct drm_crtc *crtc,
>>          struct virtio_gpu_device *vgdev = dev->dev_private;
>>          struct virtio_gpu_output *output = drm_crtc_to_virtio_gpu_output(crtc);
>>   
>> -       drm_crtc_vblank_off(crtc);
>> +       if (!vgdev->has_resource_blob || vgdev->has_virgl_3d)
>> +               drm_crtc_vblank_off(crtc);

That's what my latest patch did, but it tracks the GEM object directly. 
Sending also requires the code in atomic_flush. Or no event will be send 
if vblanks are off.

Let me send another patch for testing.

Best regards
Thomas

> I'm fine with this change. Will need a clarifying comment in the code.
>
> On the other hand, I tried with "-device virtio-vga,blob=true" and still
> don't see problem with the incorrect frame rate.
>
> Vivek, could you please clarify whether you only seeing problem when
> using prime sharing? I.e. whether you can reproduce the wrong fps by
> running qemu casually without using vfio.
>
> Might test the vfio setup myself sometime later. It's a bit cumbersome
> to set it up, will need to re-plug GPUs and etc, currently busy with
> other stuff.
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


