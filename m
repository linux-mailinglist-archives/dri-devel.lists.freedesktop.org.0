Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2762A561B03
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 15:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0100E10FA00;
	Thu, 30 Jun 2022 13:09:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B8610FA00;
 Thu, 30 Jun 2022 13:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656594578; x=1688130578;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/QZSFGFitnl+qAny1CbpYhB1+rW9IHGWTmuNGJDCPZY=;
 b=i3ns02orKVYZdJVkX33OIFdQLFaEGvGKOkzG7DU6BqcqqB/dfJ1dnSCe
 yMbrzPeSpZBYeKvtLJ9Vc8yHIByilHqDUa2dPqGBydCuY3tEjc64KVf2Q
 530WXAFf675nC1bAyT6WA5q36kaeXN41vG2ZSbtbIaJd00+glZQN1kyJk
 MiBCv/fjWfDwL3HdEpVLgguX8lIVLMkWkbqo6o72n3ZZTIb9XNsh+l+i+
 uEt+EvAqgjxp+R6ddU1sLdTSdHMTbg2aDYxDfGEni3znQ6VvfUyg5L0dc
 l0OlG97nVcJ5rQb2qoDCIpkPpdzLGYWBs6bRaPejiqOLOOysyq4M4UW3V g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="368657188"
X-IronPort-AV: E=Sophos;i="5.92,234,1650956400"; d="scan'208";a="368657188"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 06:09:05 -0700
X-IronPort-AV: E=Sophos;i="5.92,234,1650956400"; d="scan'208";a="837595881"
Received: from hanj1-mobl1.ccr.corp.intel.com (HELO [10.213.202.230])
 ([10.213.202.230])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 06:09:04 -0700
Message-ID: <b21d9f1e-65e3-8f2f-a5c3-04bf866823e3@linux.intel.com>
Date: Thu, 30 Jun 2022 14:09:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: How to convert drivers/gpu/drm/i915/ to use local workqueue?
Content-Language: en-US
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <bdf23a1c-0d89-c395-4a7a-2840ce5f639a@I-love.SAKURA.ne.jp>
 <98c6d61e-0c0f-e385-6100-6b7ebe6874b1@linux.intel.com>
 <c379bbe5-a416-7757-b0e3-1b767bb5a775@I-love.SAKURA.ne.jp>
 <703244a5-f2c9-adfb-892f-dd2353cf384e@linux.intel.com>
 <f15c7336-10fd-cd86-a95f-aec99154319b@I-love.SAKURA.ne.jp>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <f15c7336-10fd-cd86-a95f-aec99154319b@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 30/06/2022 12:19, Tetsuo Handa wrote:
> On 2022/06/30 19:17, Tvrtko Ursulin wrote:
>> Could you give more context on reasoning here please? What is the difference
>> between using the system_wq and flushing it from a random context? Or concern
>> is about flushing from specific contexts?
> 
> Excuse me, but I couldn't catch what you want. Thus, I show three patterns of
> problems with an example.
> 
> Commit c4f135d643823a86 ("workqueue: Wrap flush_workqueue() using a macro") says:
> 
>    Tejun Heo commented that it makes no sense at all to call flush_workqueue()
>    on the shared WQs as the caller has no idea what it's gonna end up waiting for.
> 
>    The "Think twice before calling this function! It's very easy to get into trouble
>    if you don't take great care." warning message does not help avoiding problems.
> 
>    Let's change the direction to that developers had better use their local WQs
>    if flush_scheduled_work()/flush_workqueue(system_*_wq) is inevitable.
> 
> Three patterns of problems are:
> 
>    (a) Flushing from specific contexts (e.g. GFP_NOFS/GFP_NOIO) can cause deadlock
>        (circular locking dependency) problem.
> 
>    (b) Flushing with specific locks (e.g. module_mutex) held can cause deadlock
>        (circular locking dependency) problem.
> 
>    (c) Even if there is no possibility of deadlock, flushing with specific locks
>        held can cause khungtaskd to complain.
> 
> An example of (a):
> 
>    ext4 filesystem called flush_scheduled_work(), which meant to wait for only
>    work item scheduled by ext4 filesystem, tried to also wait for work item
>    scheduled by 9p filesystem.
>    https://syzkaller.appspot.com/bug?extid=bde0f89deacca7c765b8
> 
>    Fixed by reverting the problematic patch.
> 
> An example of (b):
> 
>    It is GFP_KERNEL context when module's __exit function is called. But whether
>    flush_workqueue() is called from restricted context depends on what locks does
>    the module's __exit function hold.
> 
>    If request_module() is called from some work function using one of system-wide WQs,
>    and flush_workqueue() is called on that WQ from module's __exit function, the kernel
>    might deadlock on module_mutex lock. Making sure that flush_workqueue() is not called
>    on system-wide WQs is the safer choice.
> 
>    Commit 1b3ce51dde365296 ("Input: psmouse-smbus - avoid flush_scheduled_work() usage")
>    is for drivers/input/mouse/psmouse-smbus.c .
> 
> An example of (c):
> 
>    ath9k driver calls schedule_work() via request_firmware_nowait().
>    https://syzkaller.appspot.com/bug?id=78a242c8f1f4d15752c8ef4efc22974e2c52c833
> 
>    ath6kl driver calls flush_scheduled_work() which needlessly waits for completion
>    of works scheduled by ath9k driver (i.e. loading firmware used by ath9k driver).
>    https://syzkaller.appspot.com/bug?id=10a1cba59c42d11e12f897644341156eac9bb7ee
> 
>    Commit 4b2b8e748467985c ("ath6kl: avoid flush_scheduled_work() usage") in linux-next.git
>    might be able to mitigate these problems. (Waiting for next merge window...)

Okay, from 1b3ce51dde365296:

  "Flushing system-wide workqueues is dangerous and will be forbidden."

Thank you, this exactly explains the motivation which is what I was 
after. I certainly agree there is a possibility for lock coupling via 
the shared wq so that is fine by me.

>> On the i915 specifics, the caller in drivers/gpu/drm/i915/gt/selftest_execlists.c
>> I am pretty sure can be removed. It is synchronized with the error capture side of
>> things which is not required for the test to work.
>>
>> I can send a patch for that or you can, as you prefer?
> 
> OK. Please send a patch for that, for that patch will go linux-next.git tree via
> a tree for gpu/drm/i915 driver.

Patch sent. If I am right the easiest solution was just to remove the 
flush. If I was wrong though I'll need to create a dedicated wq so we 
will see what our automated CI will say.

Regards,

Tvrtko
