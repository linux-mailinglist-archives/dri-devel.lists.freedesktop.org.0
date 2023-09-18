Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A247A5599
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 00:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE2E610E118;
	Mon, 18 Sep 2023 22:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F269C10E118
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 22:02:44 +0000 (UTC)
Received: from [192.168.68.123] (unknown [177.98.21.184])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8604C660716C;
 Mon, 18 Sep 2023 23:02:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695074563;
 bh=2Eh1ZnRMxZh6W34W3r4wk+vuNL3sb0RCnb6WZGtk7/M=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=SXlIrtYKRF21TYijMB9mNYAljh+FXb39GWY8zC7d5HrLmq7Ec8cNZ4JduOyfD9Iyf
 qf5AYBre3572rIFb/hz4TiyHsplXYjtivEl5h96fNx+YiKzND1IToJYsdMJ2nyWO14
 97WVVy5tddup0/1Kt8dLbVlVwNAHG1AHL2eQ9TmLgycvlwwOIG5x7N7elGIN8YLNGv
 stavAnUz3RtPQIAPWswWeW7rugI1IrVDPgKF+CjsqEkfirCFHyy1piCy3spVLnEQHb
 h0/RRz8M3Hut5sLK396MW4t4wwQwcytF1pLoYwoWXTBHySSCh/ysIsweCNEP69TPcC
 MywbE1fOYJQyQ==
Message-ID: <2784f5e8-ebf4-a000-509e-415e14390e23@collabora.com>
Date: Mon, 18 Sep 2023 19:02:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: drm/vkms: deadlock between dev->event_lock and timer
Content-Language: en-US
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Maira Canal <mairacanal@riseup.net>, Arthur Grillo
 <arthurgrillo@riseup.net>, Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, David Airlie <airlied@gmail.com>,
 DRI <dri-devel@lists.freedesktop.org>, syzkaller@googlegroups.com,
 LKML <linux-kernel@vger.kernel.org>, Hillf Danton <hdanton@sina.com>,
 Sanan Hasanov <Sanan.Hasanov@ucf.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Stone <daniels@collabora.com>,
 David Heidelberg <david.heidelberg@collabora.com>,
 Vignesh Raman <vignesh.raman@collabora.com>
References: <20230913110709.6684-1-hdanton@sina.com>
 <99d99007-8385-31df-a659-665bf50193bc@I-love.SAKURA.ne.jp>
 <CAHk-=wgb9ccWN3Nks5STYUDqQUeHZdCLsK4kA37SdDJuGZfukg@mail.gmail.com>
 <87pm2lzsqi.ffs@tglx>
 <167ee2ad-6a7e-876c-f5c9-f0a227070a78@I-love.SAKURA.ne.jp>
 <ZQLAc/Fwkv/GiVoK@phenom.ffwll.local>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <ZQLAc/Fwkv/GiVoK@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 14/09/2023 05:12, Daniel Vetter wrote:
> On Thu, Sep 14, 2023 at 03:33:41PM +0900, Tetsuo Handa wrote:
>> On 2023/09/14 6:08, Thomas Gleixner wrote:
>>> Maybe the VKMS people need to understand locking in the first place. The
>>> first thing I saw in this code is:
>>>
>>> static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
>>> {
>>>     ...
>>>     mutex_unlock(&output->enabled_lock);
>>>
>>> What?
>>>
>>> Unlocking a mutex in the context of a hrtimer callback is simply
>>> violating all mutex locking rules.
>>>
>>> How has this code ever survived lock debugging without triggering a big
>>> fat warning?
>>
>> Commit a0e6a017ab56936c ("drm/vkms: Fix race-condition between the hrtimer
>> and the atomic commit") in 6.6-rc1 replaced spinlock with mutex. So we haven't
>> tested with the lock debugging yet...
> 
> Yeah that needs an immediate revert, there's not much that looks legit in
> that patch. I'll chat with Maira.
> 
> Also yes how that landed without anyone running lockdep is ... not good. I
> guess we need a lockdep enabled drm ci target that runs vkms tests asap
> :-)

btw, I just executed a draft version of vkms targed on the ci, we do get 
the warning:

https://gitlab.freedesktop.org/helen.fornazier/linux/-/jobs/49156305#L623

I'm just not sure if tests would fail (since it is a warning) and it has 
a chance to be ignored if people don't look at the logs (unless if igt 
already handles that).

I still need to do some adjustments (it seems the tests is hanging 
somewhere and we got a timeout) but we should have vkms in drm ci soon.

Regards,
Helen


> 
>> Maíra and Arthur, mutex_unlock() from interrupt context is not permitted.
>> Please revert that patch immediately.
>> I guess that a semaphore (down()/up()) could be used instead of a mutex.
> 
>  From a quick look this smells like a classic "try to use locking when you
> want synchronization primitives", so semaphore here doesn't look any
> better. The vkms_set_composer() function was originally for crc
> generation, where it's userspace's job to make sure they wait for all the
> crc they need to be generated before they shut it down again. But for
> writeback the kernel must guarantee that the compositiona actually
> happens, and the current function just doesn't make any such guarantees.
> 
> Cheers, Daniel
