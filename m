Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C692B1E1C46
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 09:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 474F16E115;
	Tue, 26 May 2020 07:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5975B89CF9
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 04:18:52 +0000 (UTC)
Received: from fsav101.sakura.ne.jp (fsav101.sakura.ne.jp [27.133.134.228])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 04Q4Ii1f014733;
 Tue, 26 May 2020 13:18:44 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav101.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav101.sakura.ne.jp);
 Tue, 26 May 2020 13:18:44 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav101.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 04Q4Iikd014730
 (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Tue, 26 May 2020 13:18:44 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH] drm/vkms: Don't warn hrtimer_forward_now failure.
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200525143849.4964-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <20200525152119.GL206103@phenom.ffwll.local>
 <b3715721-4982-83d9-dd6f-2a87e3b02a40@i-love.sakura.ne.jp>
 <CAKMK7uE9p_qDFL9XAqfHQPitTB+-+ZVAmCor-tbvheYjx4e-ZA@mail.gmail.com>
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <579a707b-8bfd-66d1-a1c5-f7883e82969e@i-love.sakura.ne.jp>
Date: Tue, 26 May 2020 13:18:45 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uE9p_qDFL9XAqfHQPitTB+-+ZVAmCor-tbvheYjx4e-ZA@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 26 May 2020 07:26:30 +0000
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
Cc: Shayenne Moura <shayenneluzmoura@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 DRI <dri-devel@lists.freedesktop.org>,
 syzbot+0871b14ca2e2fb64f6e3@syzkaller.appspotmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020/05/26 2:00, Daniel Vetter wrote:
> Forgot to add: I did run this quickly with vkms as secondary output.
> Good fireworks show, but there's an entire army of additional splats
> after the first one. The WARN_ON you're removing is only the
> messenger, the real bug is probably one of the later backtraces. Or at
> least points more clearly at the real bug.
> -Daniel
> 
>>
>> Debug printk() patch shows that hrtimer_forward_now() can return larger than 1.
>> What is the reason you are expecting hrtimer_forward_now() to always return 1 ?
>>
>>>
>>> If the vkms driver is loaded, and there's nothing else going on, then what
>>> I expect to happen is that this virtual hw is entirely off. And in that
>>> case, the vblank ioctl should be rejected outright. So there's definitely
>>> something fishy going on to begin with.
>>>
>>> If otoh the virtual hw is somehow on (maybe fbcon gets loaded, no idea),
>>> then the vblank wait shouldn't just blow up like this.

I see. Another debug printk() patch ( https://syzkaller.appspot.com/text?tag=Patch&x=135f254a100000 ) found that

  [   86.613767][ T7837] [drm:drm_stub_open] 
  [   86.621592][ T7837] [drm:drm_open] pid = 7837, minor = 1
  [   86.651632][ T7837] [drm:drm_ioctl] pid=7837, dev=0xe201, auth=1, DRM_IOCTL_WAIT_VBLANK
  [   86.663391][ T7837] [drm:drm_calc_timestamping_constants] *ERROR* crtc 32: Can't calculate constants, dotclock = 0!
  [   86.679151][ T7837] [drm:drm_calc_timestamping_constants] crtc 32: hwmode: htotal 0, vtotal 0, vdisplay 0
  [   86.688865][ T7837] [drm:drm_calc_timestamping_constants] crtc 32: clock 0 kHz framedur 0 linedur 0
  [   86.688899][ T7837] Starting out->vblank_hrtimer : out->period_ns=0 vblank->framedur_ns=0
  [   86.689348][ T7837] [drm:drm_vblank_enable] enabling vblank on crtc 0, ret: 0
  [   86.706883][ T7837] [drm:drm_update_vblank_count] updating vblank count on crtc 0: current=0, diff=0, hw=0 hw_last=0
  [   86.706962][    C1] now=86714983667 interval=0 ret_overrun=17693375

hrtimer_start(&out->vblank_hrtimer, 0, HRTIMER_MODE_REL) from vkms_enable_vblank() is
causing immediate vkms_vblank_simulate() callback. The reason of vblank->framedur_ns == 0
is that drm_calc_timestamping_constants() fails to calculate framedur_ns (which is 0 by default)
due to mode->crtc_clock <= 0. Thus, somehow initializing mode->crtc_clock > 0 might be able
to solve this problem.

By the way, if you have an environment that can reproduce this problem, you can
test with debug printk() patch above applied.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
