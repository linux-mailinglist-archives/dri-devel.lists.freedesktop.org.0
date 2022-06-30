Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F1956177A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 12:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8335C10F51B;
	Thu, 30 Jun 2022 10:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 743BE10F51B;
 Thu, 30 Jun 2022 10:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656584247; x=1688120247;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5Zeh7z1jlhybCi2/CC0GiRXfeBYwNYRO9qZXlCvuT6s=;
 b=EAXfIMO5D/sPdVDVey8ozytCTtUWT7hBLq88eu9Evf9k9Bw7hr7MfGe9
 xFmFJfVEx20Hvze+VUflbYGRz+G2ZcJj55BKPbaBy2946EJJjsh/bJN0X
 sjPq887VCA35CE5Y9w8AjDQuJoSvybHdVAjoiOjE0DFtzTQxIQNCsFiEC
 YHXWD/talZ74BRMOvl+Wfn40PYEJ8LzER+6GMIHLH+OE4QIZD0CKsp6XA
 15uT9/thzVGK+759BxyDoNjdqtZR0QyHa20KtEoyomENyRStuv42CsS/c
 GN0JtuUUDKdx3oXkyLVIOXTw3RU9p0T+bFREo7+RyRXuRmr0ZJZ4DTzZL g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="283407358"
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; d="scan'208";a="283407358"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 03:17:26 -0700
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; d="scan'208";a="837551459"
Received: from hanj1-mobl1.ccr.corp.intel.com (HELO [10.213.202.230])
 ([10.213.202.230])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 03:17:25 -0700
Message-ID: <703244a5-f2c9-adfb-892f-dd2353cf384e@linux.intel.com>
Date: Thu, 30 Jun 2022 11:17:23 +0100
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
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <c379bbe5-a416-7757-b0e3-1b767bb5a775@I-love.SAKURA.ne.jp>
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


On 30/06/2022 09:06, Tetsuo Handa wrote:
> On 2022/06/30 16:46, Tvrtko Ursulin wrote:
>>
>> Hi,
>>
>> On 10/06/2022 15:57, Tetsuo Handa wrote:
>>> Hello.
>>>
>>> Like commit c4f135d643823a86 ("workqueue: Wrap flush_workqueue() using
>>> a macro") explains, we are removing flush_scheduled_work() calls. And now
>>>
>>>     drivers/gpu/drm/i915/display/intel_display.c
>>>     drivers/gpu/drm/i915/gt/selftest_execlists.c
>>>
>>> are the last flush_scheduled_work() callers which have no patch proposed.
>>> I want to make a patch like
>>> https://lkml.kernel.org/r/e9b95132-89cd-5cfc-1a09-966393c5ecb0@I-love.SAKURA.ne.jp
>>> but I couldn't understand how to interpret drivers/gpu/drm/i915/ part.
>>
>> Could you provide some more context please? I did not immediately understand
>> whether the goal is remove flush_schedule_work helper with no arguments, or
>> actually stop drivers using the system work queues.
> 
> The goal is to remove flush_schedule_work().
> 
> Any kernel module is expected to stop using system workqueues if that module
> needs to call flush_scheduled_work() or flush_workqueue(system_*_wq).
> Continuing use of system workqueues is OK as long as that module does not
> need to call flush_scheduled_work() nor flush_workqueue(system_*_wq).

Could you give more context on reasoning here please? What is the 
difference between using the system_wq and flushing it from a random 
context? Or concern is about flushing from specific contexts?

> All in-tree kernel modules stopped calling flush_workqueue(system_*_wq) in 5.19.
> 
> Many of in-tree kernel modules already have patches for stop calling
> flush_scheduled_work(). But gpu/drm/i915 is one of in-tree kernel modules
> which do not have patches for stop calling flush_scheduled_work().
> 
> I want help from those who are familiar with this module.

On the i915 specifics, the caller in 
drivers/gpu/drm/i915/gt/selftest_execlists.c I am pretty sure can be 
removed. It is synchronized with the error capture side of things which 
is not required for the test to work.

I can send a patch for that or you can, as you prefer?

The drivers/gpu/drm/i915/display/intel_display.c one will have to be 
looked at by Jani or someone familiar with display code paths.

Regards,

Tvrtko
