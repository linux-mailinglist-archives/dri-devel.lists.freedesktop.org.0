Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AE179FC10
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 08:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0745610E254;
	Thu, 14 Sep 2023 06:34:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7981B10E254
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 06:34:02 +0000 (UTC)
Received: from fsav113.sakura.ne.jp (fsav113.sakura.ne.jp [27.133.134.240])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 38E6Xhrr082763;
 Thu, 14 Sep 2023 15:33:43 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav113.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav113.sakura.ne.jp);
 Thu, 14 Sep 2023 15:33:43 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav113.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 38E6XhTd082760
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 14 Sep 2023 15:33:43 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <167ee2ad-6a7e-876c-f5c9-f0a227070a78@I-love.SAKURA.ne.jp>
Date: Thu, 14 Sep 2023 15:33:41 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: drm/vkms: deadlock between dev->event_lock and timer
Content-Language: en-US
To: Maira Canal <mairacanal@riseup.net>,
 Arthur Grillo <arthurgrillo@riseup.net>
References: <20230913110709.6684-1-hdanton@sina.com>
 <99d99007-8385-31df-a659-665bf50193bc@I-love.SAKURA.ne.jp>
 <CAHk-=wgb9ccWN3Nks5STYUDqQUeHZdCLsK4kA37SdDJuGZfukg@mail.gmail.com>
 <87pm2lzsqi.ffs@tglx>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <87pm2lzsqi.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, Hillf Danton <hdanton@sina.com>,
 Sanan Hasanov <Sanan.Hasanov@ucf.edu>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>, syzkaller@googlegroups.com,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023/09/14 6:08, Thomas Gleixner wrote:
> Maybe the VKMS people need to understand locking in the first place. The
> first thing I saw in this code is:
> 
> static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
> {
>    ...
>    mutex_unlock(&output->enabled_lock);
> 
> What?
> 
> Unlocking a mutex in the context of a hrtimer callback is simply
> violating all mutex locking rules.
> 
> How has this code ever survived lock debugging without triggering a big
> fat warning?

Commit a0e6a017ab56936c ("drm/vkms: Fix race-condition between the hrtimer
and the atomic commit") in 6.6-rc1 replaced spinlock with mutex. So we haven't
tested with the lock debugging yet...

Maíra and Arthur, mutex_unlock() from interrupt context is not permitted.
Please revert that patch immediately.
I guess that a semaphore (down()/up()) could be used instead of a mutex.

