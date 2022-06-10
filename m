Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D5F5468EA
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 16:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 114D410F78B;
	Fri, 10 Jun 2022 14:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B56810F78B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 14:58:03 +0000 (UTC)
Received: from fsav312.sakura.ne.jp (fsav312.sakura.ne.jp [153.120.85.143])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 25AEvepY091034;
 Fri, 10 Jun 2022 23:57:40 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav312.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav312.sakura.ne.jp);
 Fri, 10 Jun 2022 23:57:40 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav312.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 25AEvdZF091030
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 10 Jun 2022 23:57:40 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <bdf23a1c-0d89-c395-4a7a-2840ce5f639a@I-love.SAKURA.ne.jp>
Date: Fri, 10 Jun 2022 23:57:36 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: How to convert drivers/gpu/drm/i915/ to use local workqueue?
Content-Type: text/plain; charset=UTF-8
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

Hello.

Like commit c4f135d643823a86 ("workqueue: Wrap flush_workqueue() using
a macro") explains, we are removing flush_scheduled_work() calls. And now

  drivers/gpu/drm/i915/display/intel_display.c
  drivers/gpu/drm/i915/gt/selftest_execlists.c

are the last flush_scheduled_work() callers which have no patch proposed.
I want to make a patch like
https://lkml.kernel.org/r/e9b95132-89cd-5cfc-1a09-966393c5ecb0@I-love.SAKURA.ne.jp
but I couldn't understand how to interpret drivers/gpu/drm/i915/ part.



There are many schedule_work()/schedule_delayed_work() callers within
drivers/gpu/drm/i915/ directory.

intel_modeset_driver_remove_noirq() in intel_display.c says

        /* flush any delayed tasks or pending work */
        flush_scheduled_work();

but intel_display.c itself does not call schedule_delayed_work().
Then, does this flush_scheduled_work() mean to wait all schedule_work()/schedule_delayed_work()
calls inside drivers/gpu/drm/i915/ directory?

wait_for_reset() in selftest_execlists.c says

	flush_scheduled_work();

but selftest_execlists.c itself does not call schedule_work()/schedule_delayed_work().
Then, does this flush_scheduled_work() mean to wait all schedule_work()/schedule_delayed_work()
calls inside drivers/gpu/drm/i915/ directory, by sharing a WQ created for
intel_modeset_driver_remove_noirq() ?
