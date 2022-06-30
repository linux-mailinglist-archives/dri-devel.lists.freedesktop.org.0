Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1385556138E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 09:48:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C81112A38;
	Thu, 30 Jun 2022 07:48:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B535112A28;
 Thu, 30 Jun 2022 07:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656575281; x=1688111281;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vRk3q5zmBBj8n2ucBu3qNMadHRd94C2VurVWcV0JYgY=;
 b=mlBKw+Px5C3Hz//UhicOTfnlmyrOBxH/Z8o4J+B7QzoUPn5bpB7nWren
 krnQsv9yr6WFTTfs2tyf0rlcEnEhBGmHeDIVkX8Dw6MN8Zx9ZFnoCCZuG
 U6G5Aev8yH3gU5FFqUOz72oeDec58c0oM96jJ/ifmrxBVwQQOnj8lFyhX
 nyfGq9BLD1hPiXwdNxGwVF4cpkzKyo7KcJjXq2zavrwtgIpbP6FLF6cPR
 mVUtk9ipaywAfM8IMUbRzsk7Fs3mPbaX/LJlS32GGtOufvw13w/V82MIS
 5fe6qGnida+z5iT06/zxsYSIVuxougUjBEEpsJ/jOvHjj10A29wD3rJ1e A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="346267090"
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; d="scan'208";a="346267090"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 00:46:41 -0700
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; d="scan'208";a="837496688"
Received: from hanj1-mobl1.ccr.corp.intel.com (HELO [10.213.202.230])
 ([10.213.202.230])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 00:46:38 -0700
Message-ID: <98c6d61e-0c0f-e385-6100-6b7ebe6874b1@linux.intel.com>
Date: Thu, 30 Jun 2022 08:46:36 +0100
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
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <bdf23a1c-0d89-c395-4a7a-2840ce5f639a@I-love.SAKURA.ne.jp>
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


Hi,

On 10/06/2022 15:57, Tetsuo Handa wrote:
> Hello.
> 
> Like commit c4f135d643823a86 ("workqueue: Wrap flush_workqueue() using
> a macro") explains, we are removing flush_scheduled_work() calls. And now
> 
>    drivers/gpu/drm/i915/display/intel_display.c
>    drivers/gpu/drm/i915/gt/selftest_execlists.c
> 
> are the last flush_scheduled_work() callers which have no patch proposed.
> I want to make a patch like
> https://lkml.kernel.org/r/e9b95132-89cd-5cfc-1a09-966393c5ecb0@I-love.SAKURA.ne.jp
> but I couldn't understand how to interpret drivers/gpu/drm/i915/ part.

Could you provide some more context please? I did not immediately 
understand whether the goal is remove flush_schedule_work helper with no 
arguments, or actually stop drivers using the system work queues.

Regards,

Tvrtko

> 
> 
> 
> There are many schedule_work()/schedule_delayed_work() callers within
> drivers/gpu/drm/i915/ directory.
> 
> intel_modeset_driver_remove_noirq() in intel_display.c says
> 
>          /* flush any delayed tasks or pending work */
>          flush_scheduled_work();
> 
> but intel_display.c itself does not call schedule_delayed_work().
> Then, does this flush_scheduled_work() mean to wait all schedule_work()/schedule_delayed_work()
> calls inside drivers/gpu/drm/i915/ directory?
> 
> wait_for_reset() in selftest_execlists.c says
> 
> 	flush_scheduled_work();
> 
> but selftest_execlists.c itself does not call schedule_work()/schedule_delayed_work().
> Then, does this flush_scheduled_work() mean to wait all schedule_work()/schedule_delayed_work()
> calls inside drivers/gpu/drm/i915/ directory, by sharing a WQ created for
> intel_modeset_driver_remove_noirq() ?
