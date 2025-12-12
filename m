Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 599BECB88CC
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 10:59:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD62F10E337;
	Fri, 12 Dec 2025 09:59:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="BKk3fA9Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49226.qiye.163.com (mail-m49226.qiye.163.com
 [45.254.49.226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5038610E337
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 09:59:38 +0000 (UTC)
Received: from [172.16.12.51] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 2d014e111;
 Fri, 12 Dec 2025 17:59:35 +0800 (GMT+08:00)
Message-ID: <72e06301-5f3e-4ea8-a9af-f3b1f0b329aa@rock-chips.com>
Date: Fri, 12 Dec 2025 17:59:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] drm/rockchip: vop2: Enforce AFBC source alignment
 in plane_check
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>
References: <20251206-vop2-atomic-fixups-v2-0-7fb45bbfbebd@collabora.com>
 <8655687.NyiUUSuA9g@workhorse>
 <fdd333ac-0542-4312-8ec0-22fded3b1ce0@rock-chips.com>
 <3520923.e9J7NaK4W3@workhorse>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <3520923.e9J7NaK4W3@workhorse>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9b120067a703abkunm2ec5dd2c240e97
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU4aSFYaThpIGUMeGUhITR9WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
 9VSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=BKk3fA9Q32JxLs2aqr2gPKhNMrysYabNjwTIQ1sIruxP0tJFfBHMurTxG7S3cse5kiOO8s2ETV04+LPJhlRwqZ07h/Q5eyv+vk2rN7CT3KCBatwm25FoD5nxqLVO/FWaEmOi1CaTV20NxZKpy0s3Gl7jIQUZG9tu8qXWYhg5mtg=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=H+Gezl1CPLlvzUhhdf55qTX8HyGsiw0g/7H6h/twsWg=;
 h=date:mime-version:subject:message-id:from;
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

Hi Nicolas,

On 12/11/2025 10:16 PM, Nicolas Frattaroli wrote:
> On Thursday, 11 December 2025 12:06:38 Central European Standard Time Chaoyi Chen wrote:
>> Hello Nicolas,
>>
>> On 12/9/2025 6:58 PM, Nicolas Frattaroli wrote:
>>> Hi Chaoyi Chen, Andy Yan,
>>>
>>> On Monday, 8 December 2025 08:24:52 Central European Standard Time Nicolas Frattaroli wrote:
>>>> On Monday, 8 December 2025 03:48:24 Central European Standard Time Chaoyi Chen wrote:
>>>>> Hello Nicolas, Daniel,
>>>>>
>>>>> On 12/7/2025 4:45 AM, Nicolas Frattaroli wrote:
>>>>>> From: Daniel Stone <daniels@collabora.com>
>>>>>>
>>>>>> Planes can only source AFBC framebuffers at multiples of 4px wide on
>>>>>> RK3566/RK3568. Instead of clipping on all SoCs when the user asks for an
>>>>>> unaligned source rectangle, reject the configuration in the plane's
>>>>>> atomic check on RK3566/RK3568 only.
>>>>>>
>>>>>> Signed-off-by: Daniel Stone <daniels@collabora.com>
>>>>>> [Make RK3566/RK3568 specific, reword message]
>>>>>> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
>>>>>> ---
>>>>>>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 14 +++++++++-----
>>>>>>  1 file changed, 9 insertions(+), 5 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>>>>>> index bc1ed0ffede0..e23213337104 100644
>>>>>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>>>>>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>>>>>> @@ -1076,6 +1076,13 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
>>>>>>  		return -EINVAL;
>>>>>>  	}
>>>>>>  
>>>>>> +	if (vop2->version == VOP_VERSION_RK3568 && drm_is_afbc(fb->modifier) && src_w % 4) {
>>>>>> +		drm_dbg_kms(vop2->drm,
>>>>>> +			    "AFBC source rectangles must be 4-byte aligned; is %d\n",
>>>>>> +			    src_w);
>>>>>> +		return -EINVAL;
>>>>>> +	}
>>>>>> +
>>>>>>  	return 0;
>>>>>>  }
>>>>>>  
>>>>>> @@ -1237,11 +1244,8 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
>>>>>>  	WARN_ON(src_w < 4);
>>>>>>  	WARN_ON(src_h < 4);
>>>>>>  
>>>>>> -	if (afbc_en && src_w % 4) {
>>>>>> -		drm_dbg_kms(vop2->drm, "vp%d %s src_w[%d] not 4 pixel aligned\n",
>>>>>> -			    vp->id, win->data->name, src_w);
>>>>>> -		src_w = ALIGN_DOWN(src_w, 4);
>>>>>> -	}
>>>>>> +	if (vop2->version == VOP_VERSION_RK3568 && drm_is_afbc(fb->modifier))
>>>>>> +		WARN_ON(src_w % 4);
>>>>>>  
>>>>>>  	act_info = (src_h - 1) << 16 | ((src_w - 1) & 0xffff);
>>>>>>  	dsp_info = (dsp_h - 1) << 16 | ((dsp_w - 1) & 0xffff);
>>>>>>
>>>>>
>>>>> You haven't replied to Andy's comment yet [0].
>>>>>
>>>>> [0] https://lore.kernel.org/dri-devel/7b4e26ec.75f3.19a77276b53.Coremail.andyshrk@163.com/
>>>>>
>>>>
>>>> Hello,
>>>>
>>>> I addressed the follow-ups where it was clarified that the 4 pixel
>>>> limitation was RK3566/RK3568-only. I'm not going to bring back the
>>>> post-atomic_check modification for a fast path, but I'm open to
>>>> suggestions on how to do this differently.
>>>>
>>>> One solution might be to modify the state with the ALIGN_DOWN stuff
>>>> in atomic_check instead, where userspace is then aware of the change
>>>> being done to its requested parameters. I'll need to double-check
>>>> whether this is in line with atomic modesetting's design.
>>>>
>>>> Kind regards,
>>>> Nicolas Frattaroli
>>>
>>> Okay, so I've asked internally, and atomic_check isn't allowed to
>>> modify any of the parameters either. There's efforts [0] underway
>>> to allow error codes to be more specific, so that userspace knows
>>> which constraint is being violated. That would allow userspace
>>> applications to react by either adjusting their size or turning
>>> off AFBC in this case. Turning off AFBC seems more generally
>>> applicable here, since it means it won't need to resize the plane
>>> and it'll save more than enough memory bandwidth by not going
>>> through the GPU.
>>>
>>> On that note: Andy, I didn't find a weston-simple-egl test in the
>>> Weston 14.0.2 or git test suite, and weston-simple-egl itself does
>>> not tell me whether GPU compositing is being used or not. Do you
>>> have more information on how to test for this? I'd like to know
>>> for when we have the necessary functionality in place to make
>>> userspace smart enough to pick the fast path again.
>>>
>>
>> I think weston-simple-egl is part of the weston client. When you build
>> weston from source, you should obtain it. Just run `weston-simple-egl` 
>> after compile and install weston.
>>
>> And I guess you're using Debian... The weston package there also ships
>> with a weston-simple-egl binary [2].
> 
> Yeah, I know there's a tool called that, but I'm specifically curious
> about how to determine whether it's using GPU compositing or what I
> presume is fixed-function compositing.
> 
> When I enable some more logging with
> 
>   weston -l log,drm-backend,gl-renderer
> 
> and also some kms debug messages with
> 
>   echo 4 > /sys/module/drm/parameters/debug
> 
> then I see weston outputting
> 
> [atomic] drmModeAtomicCommit
>         [repaint] Using mixed state composition
>         [repaint] view 0xaaab18c00c10 using renderer composition
>         [repaint] view 0xaaab18b68f00 using renderer composition
>         [repaint] view 0xaaab18c00ec0 using renderer composition
> 
> regardless of whether the size is 250x250 or fullscreen. With
> 250x250, I know we're failing the plane check, because I see
> 
>   [  776.160101] rockchip-drm display-subsystem: [drm:vop2_plane_atomic_check
>                  [rockchipdrm]] AFBC source rectangles must be 4-pixel
>                  aligned; is 250
> 
> on the console, but with fullscreen I don't see any errors from plane-check
> as the src_w is now divisible by 4, yet it's also "using renderer composition"
> for all views.
> 
> Same goes for using `weston-simple-dmabuf-egl` (which is 256x256) instead of
> the fullscreen simple-egl.
> 
> So basically, I need to know where a change in behaviour is actually
> observed.
> 

Hmm, I don't think weston logs make this obvious. We also need the drm kms logs.

Test results may vary across different platforms. But it's certain that 
fullscreen and non-fullscreen modes are identical in the following respects:

- fullscreen: Try to use only one plane (may be AFBC) .
- non fullscreen: Try to use 2 plane (may be AFBC) .

- On the RK3588, we won't get two planes without modifying the code, because
the primary plane is already assign to AFBC background plane.
- On the RK356x, we'll get a primary plane in linear format, while
weston-simple-egl will use an overlay plane with AFBC format.
- On the RK3576, we should be able to obtain an AFBC primary plane and an AFBC
overlay plane.

Try to set env `export WESTON_LIBINPUT_LOG_PRIORITY=debug` and you will see
these log in non fullscreen mode:

```
Layer 5 (pos 0x50000000):
        View 0 (role xdg_toplevel, PID 686, surface ID 14, top-level window 'simple-egl' of org.freedesktop.weston.simple-egl, 0xaaaae61a62d0):

...

                        [view] evaluating view 0xaaaae61a62d0 for plane assignment on output HDMI-A-1 (0)
                        [plane] started with zpos 18446744073709551615
                                [primary] not assigning view 0xaaaae61a62d0 on primary, plane 33 (format ARGB8888 (0x34325241) with modifier 0x800000000000051) not supported
                                [primary] not assigning view 0xaaaae61a62d0 on primary, plane 39 (format ARGB8888 (0x34325241) with modifier 0x800000000000051) not supported
                                [overlay] not assigning view 0xaaaae61a62d0 on overlay, plane 63 (format ARGB8888 (0x34325241) with modifier 0x800000000000051) not supported
                                [overlay] not assigning view 0xaaaae61a62d0 on overlay, plane 69 (format ARGB8888 (0x34325241) with modifier 0x800000000000051) not supported
                                [overlay] not assigning view 0xaaaae61a62d0 on overlay, plane 75 (format ARGB8888 (0x34325241) with modifier 0x800000000000051) not supported
                        [view] view 0xaaaae61a62d0 format: ARGB8888
                                [plane] plane 51 picked from candidate list, type: overlay
```

When vop2_plane_atomic_check() fails, in addition to the above logs, you will
also get the following log:

```
[view] not placing view 0xaaaad9ec8e40 on plane 51: atomic test failed
```

I don't think there's any more log information that can indicate the error here.
The relevant code is here [3].

[3]: https://gitlab.freedesktop.org/wayland/weston/-/blob/main/libweston/backend-drm/state-propose.c?ref_type=heads#L181

>>
>> [1]: https://gitlab.freedesktop.org/wayland/weston/-/blob/main/clients/simple-egl.c
>> [2]: https://packages.debian.org/sid/arm64/weston/filelist
>>
>>> In either case, I think adhering to the atomic API to ensure
>>> artifact-free presentation is more important here than enabling
>>> a fast-path on RK3568. I do think in most real-world use case
>>> scenarios, the fallback won't degrade user experience, because
>>> almost everything performance intensive I can think of (video
>>> playback, games) will likely already use a plane geometry
>>> where the width is divisible by 4. 800, 1024, 1280, 1600, 1920,
>>> 2560, 3840 are all divisible by 4, so a window or full-screen
>>> playback of common content won't need to fall back to GPU
>>> compositing.
>>>
>>> I'll send a v2 to fix another instance of "eSmart" left in a
>>> message, but beyond that I think we should be good.
>>>
>>> Kind regards,
>>> Nicolas Frattaroli
>>>
>>> https://lore.kernel.org/dri-devel/20251009-atomic-v6-0-d209709cc3ba@intel.com/ [0]
>>>
>>>
>>>
>>>
>>
>>
> 
> 
> 
> 
> 
> 

-- 
Best, 
Chaoyi
