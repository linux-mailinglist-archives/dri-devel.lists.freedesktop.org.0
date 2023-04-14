Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 535916E2145
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 12:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A7610ECD1;
	Fri, 14 Apr 2023 10:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C07B10E1B3;
 Fri, 14 Apr 2023 10:52:34 +0000 (UTC)
Received: from fsav411.sakura.ne.jp (fsav411.sakura.ne.jp [133.242.250.110])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 33EAqEl1078551;
 Fri, 14 Apr 2023 19:52:14 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav411.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav411.sakura.ne.jp);
 Fri, 14 Apr 2023 19:52:14 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav411.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 33EAqEeI078548
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 14 Apr 2023 19:52:14 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <95e9f67f-b198-4946-327c-626de07e45f9@I-love.SAKURA.ne.jp>
Date: Fri, 14 Apr 2023 19:52:12 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: avoid flush_scheduled_work()
 usage
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, Luca Coelho <luca@coelho.fi>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <d8b73f88-d4aa-ed7e-09ea-5ad5ee803893@I-love.SAKURA.ne.jp>
 <5bbe7093-791e-5653-850b-aea343db3f3f@I-love.SAKURA.ne.jp>
 <b10d5ada60ab823a09b64f3bfd79db2dd601d5fd.camel@coelho.fi>
 <9ee23b3f-e2e1-6a78-4a28-2ed8790636e5@I-love.SAKURA.ne.jp>
 <87edomg4b6.fsf@intel.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <87edomg4b6.fsf@intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023/04/14 19:13, Jani Nikula wrote:
> On Fri, 14 Apr 2023, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp> wrote:
>> On 2023/03/15 19:47, Luca Coelho wrote:
>>> On Tue, 2023-03-14 at 20:21 +0900, Tetsuo Handa wrote:
>>>> Like commit c4f135d643823a86 ("workqueue: Wrap flush_workqueue() using a
>>>> macro") says, flush_scheduled_work() is dangerous and will be forbidden.
>>>>
>>>> Now that i915 is the last flush_scheduled_work() user, for now let's
>>>> start with blind conversion inside the whole drivers/gpu/drm/i915/
>>>> directory. Jani Nikula wants to use two workqueues in order to avoid
>>>> adding new module globals, but I'm not familiar enough to audit and
>>>> split into two workqueues.
>>>>
>>>> Link: https://lkml.kernel.org/r/87sfeita1p.fsf@intel.com
>>>> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
>>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>>> ---
>>>> Changes in v2:
>>>>   Add missing alloc_workqueue() failure check.
>>>
>>> Hi,
>>>
>>> Thanks for your patch! But it seems that you only fixed that failure
>>> check, without making the other change Jani proposed, namely, move the
>>> work to the i915 struct instead of making it a global.
>>>
>>> I'm working on that now.
>>
>> What is estimated time of arrival on this?
>> Can we expect your work in Linux 6.4 ?
> 
> I'm afraid that ship has sailed. Sorry. :(

Well, then, can we temporarily apply "[PATCH v2] drm/i915: avoid flush_scheduled_work() usage" ?
This patch is a mechanical conversion which unlikely causes regressions. This patch eliminates
interference from work items outside of i915, which is small but an improvement for i915 users.

