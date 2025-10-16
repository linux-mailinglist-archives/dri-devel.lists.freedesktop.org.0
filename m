Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2B7BE408F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 16:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1817910EA08;
	Thu, 16 Oct 2025 14:56:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Nz8w2ptR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sKX1lw/B";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Nz8w2ptR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sKX1lw/B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B86010EA08
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 14:56:09 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 286D31F8AA;
 Thu, 16 Oct 2025 14:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760626568; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lOHoicXxiVbhEg4GDZIDLLCggn3pAtpOJNoEO6tbl1c=;
 b=Nz8w2ptRQS/liAC1rqd1Dphag7bJFQytyBMPCgHWGamCSEKxNfTQiH7C5G/Ujfy+TedcJG
 jXnF22J44PdH094m0PvSZFGXvaxFVDY4Ih4PUAeltyZ7++riUjRxm0iQGhJVp70EFwj9AO
 uHpcvbIF0WqgIw/tKeYWpcwDYUK/zNY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760626568;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lOHoicXxiVbhEg4GDZIDLLCggn3pAtpOJNoEO6tbl1c=;
 b=sKX1lw/BHyD5Jw4jDic8qWGYxBOiOIp2fZdqauYxFHcXKY1dplw1TJGFnfV587KwQcx9Ms
 FYdY/NGuFzn3qNBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760626568; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lOHoicXxiVbhEg4GDZIDLLCggn3pAtpOJNoEO6tbl1c=;
 b=Nz8w2ptRQS/liAC1rqd1Dphag7bJFQytyBMPCgHWGamCSEKxNfTQiH7C5G/Ujfy+TedcJG
 jXnF22J44PdH094m0PvSZFGXvaxFVDY4Ih4PUAeltyZ7++riUjRxm0iQGhJVp70EFwj9AO
 uHpcvbIF0WqgIw/tKeYWpcwDYUK/zNY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760626568;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lOHoicXxiVbhEg4GDZIDLLCggn3pAtpOJNoEO6tbl1c=;
 b=sKX1lw/BHyD5Jw4jDic8qWGYxBOiOIp2fZdqauYxFHcXKY1dplw1TJGFnfV587KwQcx9Ms
 FYdY/NGuFzn3qNBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CE0BB1376E;
 Thu, 16 Oct 2025 14:56:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id k6kYMYcH8WjnHAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Oct 2025 14:56:07 +0000
Message-ID: <2c17fa2d-fca1-4f3b-a7b1-7c07e7d5edee@suse.de>
Date: Thu, 16 Oct 2025 16:56:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/virtgpu: Use vblank timer
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>
Cc: "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20251008130701.246988-1-tzimmermann@suse.de>
 <IA0PR11MB7185D91EB0CD01FD63D21AA7F8EEA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <dd80279d-5469-42db-bfa0-7b9ee3323bc9@suse.de>
 <IA0PR11MB71850152C033B443032AA519F8EFA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <76e2a961-1d3a-411f-9cb3-625be048f4da@suse.de>
 <CH3PR11MB7177EED8239AEBF875AA3389F8EAA@CH3PR11MB7177.namprd11.prod.outlook.com>
 <8fa40ad3-b848-4cf1-8515-7dbe05bb3136@suse.de>
 <CH3PR11MB71771983D6F3A6E567E1904AF8E8A@CH3PR11MB7177.namprd11.prod.outlook.com>
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
In-Reply-To: <CH3PR11MB71771983D6F3A6E567E1904AF8E8A@CH3PR11MB7177.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[intel.com,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 MIME_TRACE(0.00)[0:+]; TO_DN_EQ_ADDR_SOME(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[11]; MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, suse.de:email, bootlin.com:url,
 outlook.com:url, imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 
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

Hi,

for some reason, Dmitry already merged this patch into drm-misc-next. I 
therefore sent out another change to pick the correct handling of vblank 
events depending on the plane's buffer objects. You may want to take a 
look at [1]. Testing is welcome.

[1] 
https://lore.kernel.org/dri-devel/20251016145230.79270-1-tzimmermann@suse.de/T/#u

Best regards
Thomas


Am 15.10.25 um 07:37 schrieb Kasireddy, Vivek:
> Hi Thomas,
>
>> Subject: Re: [PATCH] drm/virtgpu: Use vblank timer
>>
>>>> Am 10.10.25 um 06:25 schrieb Kasireddy, Vivek:
>>>> [...]
>>>>>> Because virtgpu did not initialize vblanking, DRM always sent out a
>>>>>> vblank event after the completed commit. [5] It's not synchronized to
>>>>>> the display output. This means that virtgpu has always been subject to
>>>>>> tearing and the guest always required to hold buffers until the host
>>>>>> completed its display update. IOW adding vblank timers into the mix
>>>>>> should not change the behavior of virtgpu. It just limits the output
>>>>> As I mentioned, the output or display update frequency is already
>> limited
>>>>> when blob=true, so adding a vblank timer would be redundant in this
>> case.
>>>> To summarize my understanding: virtgpu currently generates vblank
>> events
>>>> as soon as if finished updating the display. Which can be too fast for
>>>> blob=false. For blob=true, the display update is (reasonably assumed to
>>>> be) synchronized with the host update and thereby rate limited by the
>>>> host's display output.
>>> Yeah, that is mostly correct.
>>>
>>>> Adding the vblank timer: For blob=true, if a vblank timeout happens
>>>> during an ongoing display update, it does not send an event. If the
>>>> display update finishes before the vblank times out, it arms the vblank
>>>> event and the next vblank timeout will send it out. The vblank timer
>>>> thereby makes events appear at regular intervals instead of ASAP.
>>>>
>>>> So why add the complexity of handling blob=true separately when it
>>>> should integrate well with the existing vblank framework?
>>> There are a few reasons for this:
>>> - When blob=true, the most important goal is to prevent tearing (i.e, to
>>> ensure that Guest VM and Host are not accessing the Guest's FB
>>> simultaneously). As explained previously, just ensuring that this goal
>>> is met will automatically result in rate limited updates that are in
>>> sync with the Host compositor's repaint cycle (if using Gtk UI).
>>> So, given this, adding a vblank timer would not help in this case and
>>> instead would lead to updates that are no longer in sync with the
>>> Host compositor's repaint cycle.
>> No that's not the case. With the vblank timer, the output on the host is
>> still synced to the host's repaint cycle. The guest's compositor still
>> waits for it to finish before updating its own output.
> My concern is that in this case, the Guest's compositor will be made to
> wait a bit too long before it starts its repaint cycle because the vblank
> event was not sent immediately when the Host's update was finished
> but is instead sent after the next vblank timeout. This is what I meant
> by the Guest's updates not staying in sync with the Host compositor's
> repaint cycle because the Guest compositor would not start drawing at
> the best possible time (which is indicated by the Host compositor via the
> repaint callback). More on this below.
>
>>> - Qemu (and Qemu UI) also works with virtio-gpu driver that is part of
>>> Windows VMs where a vblank timer may or may not be available. So,
>>> it is easier to support this case by having a UI timer/repaint cb and
>>> making the Guest VM just wait until the update (or resource flush) is
>>> completed to ensure synchronization and rate limited updates.
>> Nothing in this patch affects the Windows driver. We're not going to
>> remove or modify the host's repaint code.
>>
>>> - Even if a vblank timer is available for a Guest VM (Windows or Linux)
>>> its frequency may not match the UI update frequency, so there might
>>> either be wasteful updates or too few updates. For example, if the
>>> Host's rate is 30 FPS, but the Guest VM's vblank timer is running at
>>> 60 FPS, then roughly 30 frames would not be displayed each cycle IIUC.
>> If the host currently updates with only 30 Hz, it already does not show
>> those additional 30 frames.
>>
>> The userspace compositor only sends the next frame when the current
>> frame has been completed; as signalled by the vblank event. That vblank
>> event only happens after the previous display update completed. (It
>> should have rather been called page-flip event instead.) If the host
>> only updates at 30 Hz, there are currently at most 30 such events per
>> second.  If we add a vblank timer, it'll fire at the guest display
>> refresh rate (say 60 Hz), but only send these events when the previous
>> update has been completed; which is 30 Hz.
> Ok, as long as the Host's refresh rate is communicated with virtio-gpu,
> which is then used as the input to determine the vblank timer frequency,
> this should work. However, as mentioned above, I am still concerned about
> when the vblank event would be sent. For example, let us assume that
> we have 60 Hz as the Guest's refresh rate, which means the vblank event/
> interrupt is expected to happen roughly every 16.66 ms. So, IIUC, we have:
> 0................16....................33................50...........
>
> My specific concern is that if the Guest gets notified that the Host update
> is finished at let's say 18 ms mark above, I think the vblank event would not
> get sent out right away and instead would be sent out at the 33 ms mark
> right? If yes, I wonder if this pattern would continue to repeat itself impacting
> performance?
>
>>>> Please also note that it's not just about compositors. DRM's fbcon
>>>> synchronizes its output to the vblank period. If no vblank is supported,
>>>> it'll happily fire out display updates ASAP even for blob=true.
>>> IIUC, the fbcon updates would still be rate limited in the blob=true
>>> case as the vblank event would only be sent out after the atomic/plane
>>> update is finished right?
>> That's not the case. The DRM fbcon/fbdev code waits for a vblank
>> timeout/interrust to occur [1]  but does NOT wait for the vblank event.
>> To do so, it enables vblanks interrupts, waits for one to occur and then
>> continues. [2] If the driver does not support vblank interrupts, it
>> continues right away without waiting. [3]  The fbcon/fbdev support only
>> uses a single buffer object for a its output. Hence this is where you
>> actually get tearing even with blob=true. None of this can be changed
>> much because of the way fbdev works.
> I have not looked into fbdev/fbcon closely but I did test Gnome + Xorg
> which uses the dirtyfb() method with a single FB for updates (instead of
> page flips with double buffering) when there is no hardware cursor available.
> And, AFAICT, the dirtyfb() method works with no tearing when blob=true
> because it just invokes the atomic commit (drm_atomic_commit) in a blocking
> manner, which means it just waits until the Host update is finished. I thought
> fbdev/fbcon worked in a similar way.
>
> Thanks,
> Vivek
>
>>
>> [1]
>> https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next-2025-
>> 10-02/drivers/gpu/drm/drm_fb_helper.c?ref_type=tags#L372
>> [2]
>> https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next-2025-
>> 10-02/drivers/gpu/drm/drm_client_modeset.c?ref_type=tags#L1322
>> [3]
>> https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next-2025-
>> 10-02/drivers/gpu/drm/drm_vblank.c?ref_type=tags#L1215
>>
>> Best regards
>> Thomas
>>
>>> Thanks,
>>> Vivek
>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>>> Note that blob=true is a performance optimization where we create a
>>>>> dmabuf (on the Host) backed by Guest FB's memory that is shared with
>> the
>>>>> UI layer. And, AFAIK, the only case where virtio-gpu updates are not
>> limited
>>>>> is when blob=false. Even in this case, there would be no tearing issues
>> seen
>>>>> because the Guest is made to wait until the Host makes a copy of its FB.
>>>>>
>>>>>> frequency. If GNOME's pageflip is synchronized to the vblank, it should
>>>>>> immediately benefit.
>>>>>>
>>>>>> The GTK repaint callback is an interface for applications. How does it
>>>>>> affect, or is affected by, any of this?
>>>>> So, virtio-gpu is almost always coupled with a UI (on the Host) in order
>>>>> to display the Guest's desktop content (fbcon and compositor's FB data)
>>>>> on the Host locally (Gtk, SDL, etc) or streamed to a remote system
>> (Spice,
>>>>> Vnc, etc). And, the rate at which the UI updates are submitted (to the
>>>>> Host compositor for local UIs) is controlled by the UI timer.
>>>>>
>>>>> However, in the case of Qemu Gtk UI, the UI timer is used as a backup
>>>>> as we mostly rely on the repaint callback to figure out when to submit
>>>>> updates. This is because the repaint callback is a more reliable
>> mechanism
>>>>> to determine when it is appropriate to submit an update to the Host
>>>>> compositor.
>>>>>
>>>>> And, until the UI's update is not submitted (and executed by the Host
>>>>> GPU and signaled via an EGL fence), the Guest's update fence is not
>>>>> signaled. We can reliably achieve 60 FPS this way (assuming the Host's
>>>>> refresh rate is 60) for Guest's display updates.
>>>>>
>>>>> Thanks,
>>>>> Vivek
>>>>>
>>>>>> [5]
>>>>>>
>> https://elixir.bootlin.com/linux/v6.17.1/source/drivers/gpu/drm/drm_atomi
>>>>>> c_helper.c#L2606
>>>>>>
>>>>>> Best regards
>>>>>> Thomas
>>>>>>
>>>>>>> I am not sure how this would affect virgl use-cases but Dmitry can
>> help
>>>>>> explain if
>>>>>>> the vblank timer would be useful there or not.
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Vivek
>>>>>>>
>>>>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>>>> Link: https://lore.kernel.org/dri-
>>>>>>>>
>> devel/SN6PR02MB415702B00D6D52B0EE962C98D46CA@SN6PR02MB4157.n
>>>>>>>> amprd02.prod.outlook.com/ # [1]
>>>>>>>> ---
>>>>>>>>      drivers/gpu/drm/virtio/virtgpu_display.c | 29
>>>>>> ++++++++++++++++++++++--
>>>>>>>>      1 file changed, 27 insertions(+), 2 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c
>>>>>>>> b/drivers/gpu/drm/virtio/virtgpu_display.c
>>>>>>>> index c3315935d8bc..ee134e46eeba 100644
>>>>>>>> --- a/drivers/gpu/drm/virtio/virtgpu_display.c
>>>>>>>> +++ b/drivers/gpu/drm/virtio/virtgpu_display.c
>>>>>>>> @@ -32,6 +32,8 @@
>>>>>>>>      #include <drm/drm_gem_framebuffer_helper.h>
>>>>>>>>      #include <drm/drm_probe_helper.h>
>>>>>>>>      #include <drm/drm_simple_kms_helper.h>
>>>>>>>> +#include <drm/drm_vblank.h>
>>>>>>>> +#include <drm/drm_vblank_helper.h>
>>>>>>>>
>>>>>>>>      #include "virtgpu_drv.h"
>>>>>>>>
>>>>>>>> @@ -55,6 +57,7 @@ static const struct drm_crtc_funcs
>>>>>> virtio_gpu_crtc_funcs
>>>>>>>> = {
>>>>>>>>      	.reset                  = drm_atomic_helper_crtc_reset,
>>>>>>>>      	.atomic_duplicate_state =
>> drm_atomic_helper_crtc_duplicate_state,
>>>>>>>>      	.atomic_destroy_state   =
>> drm_atomic_helper_crtc_destroy_state,
>>>>>>>> +	DRM_CRTC_VBLANK_TIMER_FUNCS,
>>>>>>>>      };
>>>>>>>>
>>>>>>>>      static const struct drm_framebuffer_funcs virtio_gpu_fb_funcs = {
>>>>>>>> @@ -99,6 +102,7 @@ static void
>> virtio_gpu_crtc_mode_set_nofb(struct
>>>>>>>> drm_crtc *crtc)
>>>>>>>>      static void virtio_gpu_crtc_atomic_enable(struct drm_crtc *crtc,
>>>>>>>>      					  struct drm_atomic_state *state)
>>>>>>>>      {
>>>>>>>> +	drm_crtc_vblank_on(crtc);
>>>>>>>>      }
>>>>>>>>
>>>>>>>>      static void virtio_gpu_crtc_atomic_disable(struct drm_crtc *crtc,
>>>>>>>> @@ -108,6 +112,8 @@ static void
>> virtio_gpu_crtc_atomic_disable(struct
>>>>>>>> drm_crtc *crtc,
>>>>>>>>      	struct virtio_gpu_device *vgdev = dev->dev_private;
>>>>>>>>      	struct virtio_gpu_output *output =
>>>>>>>> drm_crtc_to_virtio_gpu_output(crtc);
>>>>>>>>
>>>>>>>> +	drm_crtc_vblank_off(crtc);
>>>>>>>> +
>>>>>>>>      	virtio_gpu_cmd_set_scanout(vgdev, output->index, 0, 0, 0, 0,
>> 0);
>>>>>>>>      	virtio_gpu_notify(vgdev);
>>>>>>>>      }
>>>>>>>> @@ -121,9 +127,10 @@ static int
>> virtio_gpu_crtc_atomic_check(struct
>>>>>>>> drm_crtc *crtc,
>>>>>>>>      static void virtio_gpu_crtc_atomic_flush(struct drm_crtc *crtc,
>>>>>>>>      					 struct drm_atomic_state *state)
>>>>>>>>      {
>>>>>>>> -	struct drm_crtc_state *crtc_state =
>>>>>>>> drm_atomic_get_new_crtc_state(state,
>>>>>>>> -
>> crtc);
>>>>>>>> +	struct drm_device *dev = crtc->dev;
>>>>>>>> +	struct drm_crtc_state *crtc_state =
>>>>>>>> drm_atomic_get_new_crtc_state(state, crtc);
>>>>>>>>      	struct virtio_gpu_output *output =
>>>>>>>> drm_crtc_to_virtio_gpu_output(crtc);
>>>>>>>> +	struct drm_pending_vblank_event *event;
>>>>>>>>
>>>>>>>>      	/*
>>>>>>>>      	 * virtio-gpu can't do modeset and plane update operations
>>>>>>>> @@ -133,6 +140,20 @@ static void
>> virtio_gpu_crtc_atomic_flush(struct
>>>>>>>> drm_crtc *crtc,
>>>>>>>>      	 */
>>>>>>>>      	if (drm_atomic_crtc_needs_modeset(crtc_state))
>>>>>>>>      		output->needs_modeset = true;
>>>>>>>> +
>>>>>>>> +	spin_lock_irq(&dev->event_lock);
>>>>>>>> +
>>>>>>>> +	event = crtc_state->event;
>>>>>>>> +	crtc_state->event = NULL;
>>>>>>>> +
>>>>>>>> +	if (event) {
>>>>>>>> +		if (drm_crtc_vblank_get(crtc) == 0)
>>>>>>>> +			drm_crtc_arm_vblank_event(crtc, event);
>>>>>>>> +		else
>>>>>>>> +			drm_crtc_send_vblank_event(crtc, event);
>>>>>>>> +	}
>>>>>>>> +
>>>>>>>> +	spin_unlock_irq(&dev->event_lock);
>>>>>>>>      }
>>>>>>>>
>>>>>>>>      static const struct drm_crtc_helper_funcs
>> virtio_gpu_crtc_helper_funcs
>>>>>> = {
>>>>>>>> @@ -356,6 +377,10 @@ int virtio_gpu_modeset_init(struct
>>>>>> virtio_gpu_device
>>>>>>>> *vgdev)
>>>>>>>>      	for (i = 0 ; i < vgdev->num_scanouts; ++i)
>>>>>>>>      		vgdev_output_init(vgdev, i);
>>>>>>>>
>>>>>>>> +	ret = drm_vblank_init(vgdev->ddev, vgdev->num_scanouts);
>>>>>>>> +	if (ret)
>>>>>>>> +		return ret;
>>>>>>>> +
>>>>>>>>      	drm_mode_config_reset(vgdev->ddev);
>>>>>>>>      	return 0;
>>>>>>>>      }
>>>>>>>> --
>>>>>>>> 2.51.0
>>>>>>>>
>>>>>> --
>>>>>> --
>>>>>> Thomas Zimmermann
>>>>>> Graphics Driver Developer
>>>>>> SUSE Software Solutions Germany GmbH
>>>>>> Frankenstrasse 146, 90461 Nuernberg, Germany
>>>>>> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
>>>>>> HRB 36809 (AG Nuernberg)
>>>>>>
>>>> --
>>>> --
>>>> Thomas Zimmermann
>>>> Graphics Driver Developer
>>>> SUSE Software Solutions Germany GmbH
>>>> Frankenstrasse 146, 90461 Nuernberg, Germany
>>>> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
>>>> HRB 36809 (AG Nuernberg)
>>>>
>> --
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Frankenstrasse 146, 90461 Nuernberg, Germany
>> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
>> HRB 36809 (AG Nuernberg)
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


