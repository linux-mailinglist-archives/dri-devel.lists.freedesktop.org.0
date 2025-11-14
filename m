Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E44C5D29C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 13:47:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0BB10E24A;
	Fri, 14 Nov 2025 12:47:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="OBNq0zJk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9585F10EA57
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 12:47:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1763124434; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=JRJkYEp6FMPW8cEnqbM6KqPrjI02P27n9Pu+KuhHB8VR/J4cb9uhu/WqesaqEA8SuluMkuGvVLXwr1wH+2rV2sTTmqnZzaV9A/EdOf3p+d1QnduZXYBZM9vdi794yRJNx6Jn/tTnGagWEI8EBv2vY8ctMTNvxvm++VNkg3NdLbU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1763124434;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=t+asLhpd4on+hl/lq+HTTa2Wum2CDeb0nkLLQKCq0+M=; 
 b=UWUXVDh1LsM06cEWzbXkEmW6dMGq6t58jUy5lZv3aMa6EgCXgF311Gu+xdXSY6ebOVpbQ10Ee5XmGhpZvlDCPZAKVEx48Ckbbu6E7v8Wd4PmDodX4k6/EhuMFEDxHJtvPzEz/zvqnTpMr2gfHjBPtW5lc5uqTRcJ+pr7BjRksO4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763124434; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=t+asLhpd4on+hl/lq+HTTa2Wum2CDeb0nkLLQKCq0+M=;
 b=OBNq0zJksKntNDY3gmInjLtzUB+iTBWJlGBnqltd5fQeutwsok5L0cUleluaL+J0
 Bdm56a3hjzK6Drx6Rlxi+ghRO1cMFydBFgpfQkeOt1665/xn2nVmzRXDQOw37uc0Ts0
 vy/uhT7R+x4eYv2niEV5Ylfc7+AUtZ6KXzUsOIQ4=
Received: by mx.zohomail.com with SMTPS id 1763124433282268.4433193842584;
 Fri, 14 Nov 2025 04:47:13 -0800 (PST)
Message-ID: <975b6e7f-7e07-46c9-89d0-d03fd701ff52@collabora.com>
Date: Fri, 14 Nov 2025 15:47:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/virtgpu: Make vblank event dependent on the
 external sync
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "airlied@redhat.com" <airlied@redhat.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>
References: <20251027095550.110562-1-tzimmermann@suse.de>
 <1e4a29e7-bf98-4193-962a-66fd251e2c72@collabora.com>
 <IA0PR11MB718584C85B844B3ED6115858F8FAA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <b54f8527-5ce3-449a-ac96-6b4686d1b108@collabora.com>
 <CH3PR11MB7177B04D32239354CD6A609EF8F8A@CH3PR11MB7177.namprd11.prod.outlook.com>
 <f99e94e2-2357-4645-8d6e-2d234d7d2e12@collabora.com>
 <IA0PR11MB71859CA8214A1CED151004C4F8CEA@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <IA0PR11MB71859CA8214A1CED151004C4F8CEA@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 11/10/25 04:00, Kasireddy, Vivek wrote:
> Hi Dmitry,
> 
>> Subject: Re: [PATCH v4] drm/virtgpu: Make vblank event dependent on the
>> external sync
>>
>> On 10/31/25 08:04, Kasireddy, Vivek wrote:
>>> Hi Dmitry,
>>>
>>>> Subject: Re: [PATCH v4] drm/virtgpu: Make vblank event dependent on
>> the
>>>> external sync
>>>>
>>>> On 10/29/25 08:47, Kasireddy, Vivek wrote:
>>>>> I applied this patch and tested 3 different scenarios:
>>>>> 1) blob=true + imported buffers
>>>>> root@localhost:weston_upstream/weston# ./build/clients/weston-
>> simple-
>>>> egl -o &
>>>>> Using config: r8g8b8a0
>>>>> has EGL_EXT_buffer_age and EGL_EXT_swap_buffers_with_damage
>>>>> has EGL_EXT_surface_compression
>>>>> 245 frames in 5 seconds: 49.000000 fps
>>>>> 236 frames in 5 seconds: 47.200001 fps
>>>>> 279 frames in 5 seconds: 55.799999 fps
>>>>> 240 frames in 5 seconds: 48.000000 fps
>>>>> 244 frames in 5 seconds: 48.799999 fps
>>>>> 283 frames in 5 seconds: 56.599998 fps
>>>>> 274 frames in 5 seconds: 54.799999 fps
>>>>>
>>>>> 2) blob=true
>>>>> root@localhost:/weston_upstream/weston# ./build/clients/weston-
>> simple-
>>>> egl -o &
>>>>> Using config: r8g8b8a0
>>>>> has EGL_EXT_buffer_age and EGL_EXT_swap_buffers_with_damage
>>>>> has EGL_EXT_surface_compression
>>>>> 167 frames in 5 seconds: 33.400002 fps
>>>>> 208 frames in 5 seconds: 41.599998 fps
>>>>> 203 frames in 5 seconds: 40.599998 fps
>>>>> 252 frames in 5 seconds: 50.400002 fps
>>>>> 180 frames in 5 seconds: 36.000000 fps
>>>>> 219 frames in 5 seconds: 43.799999 fps
>>>>> 176 frames in 5 seconds: 35.200001 fps
>>>>> 220 frames in 5 seconds: 44.000000 fps
>>>>
>>>> Thanks for the testing.
>>>>
>>>> For the second scenario I'm getting better result, it's 55-60fps for me.
>>>> Given that this is a SW rendering, curious whether that's because you're
>>>> testing on a lower end machine(?)
>>> I am testing with a dGPU (B60) on the Host where I am running Gnome
>> Xorg
>>> but I am running Gnome Wayland in the Guest. What compositors are you
>>> running on the Host and Guest? Kwin? Also, could you please share your
>>> Qemu launch parameters as well so that we can try to figure out the
>> reason
>>> for the performance discrepancy?
>>
>> Did further testing on older IvyBridge machine and getting comparable
>> result to yours on it.
> Thank you for running these tests.
> 
>>
>> I'm using exactly same QEMU setup as you do with nothing special in the
>> cmdline. Tested with both KDE and Gnome on host.
>>
>> On IvyBridge getting:
>>
>> - 46-55fps jittery with GTK display + blob + vblank_timer
>> - 46-55fps jittery with GTK display + blob + vblank_timer +
>> vblank_mode=1 to disable vsync on host
>> - constant 60fps with GTK display without blob + vblank_timer
>> - constant 60fps with GTK display + blob without vblank_timer
>> - constant 60fps with SDL display + blob + vblank_timer
> What happens in the case of:
> - SDL display + blob without vblank_timer
> - SDL display + vblank_timer without blob
> 
>>
>> So, discrepancy of the results is directly tied to CPU performance + GTK
>> oddity when SW+blob rendering is used on guest.
>>
>> Why SDL performs much better than GTK I don't know.
> AFAICS, there are some key differences between SDL and GTK UIs that might
> be playing a role:
> - SDL UI does not implement dmabuf ops such as dpy_gl_scanout_dmabuf()
> but it does implement dpy_gl_scanout_texture() which I see is only called
> from virtio-gpu-virgl.c. I am wondering how does the display get updated
> in non-virgl usecases, especially when blob=true and given that this option
> is specifically meant for UI's dmabuf ops?
> 
> - GTK asynchronously waits (using an EGL fence) until the GPU Blit is
> completed (before releasing Guest FB) which other UIs do not do when
> blob=true. So, this might incur some extra delay which is not the case
> with SDL.
> 
> - SDL's display updates (sent to the Host compositor) seem to be UI timer
> driven while GTK's updates are repaint callback driven.

My QEMU branch contains patch adding dpy_gl_scanout_dmabuf() support to
SDL display. Haven't checked without it, will check next week.

Assume this is a QEMU-specific issue with how QEMU display logic works.
It's unclear to me how much severe this problem is in practice.
Meanwhile should be okay to add a workaround for guest blobs with a
comment explaining why it's needed if this is a significant-enough
regression for your use-cases. Feel free to send v5.

-- 
Best regards,
Dmitry
