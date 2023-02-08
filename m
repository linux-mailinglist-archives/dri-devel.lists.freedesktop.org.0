Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E24E68F0C7
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 15:26:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F0710E791;
	Wed,  8 Feb 2023 14:26:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58CDF10E780;
 Wed,  8 Feb 2023 14:26:43 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso1607332wms.4; 
 Wed, 08 Feb 2023 06:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kxmLNQGQnUPXCQmiQQ52CqZR+8qti5lEjpjLI5zEoyk=;
 b=ji9NkTYUZDmD4HbhqqrUS6VeY9LZwfdC+ezz4YC/dBHIypAEitLkRNFVFqzt+/c/PG
 miTL2fzpt/sIGPRoSMAAtEBCy4i68cJiKvuz1WvW3dR0+QjSZhuuvz2n7plDP5m1dHnU
 uNb8RTgfr/p7Z2QB7ng8J/SybeyHNA3mUM5bCdOad230vVVEFyovuWPPiJSrgX3Z5jGy
 xsSe6/A0m8GH8zqtmM1eVpxGcVlCEML/tLxEAWa825E2LQzehDO7ZRikpqgYWs2zHzBS
 Jvs58Y7BbhAvmQ6ChfBtexeyeB1EIyxEZ2soKUytAG8hIIFyt+4XQqk+D5yTz8kO7XTl
 YKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kxmLNQGQnUPXCQmiQQ52CqZR+8qti5lEjpjLI5zEoyk=;
 b=gMFJBz61skirkgIAa7rfnXHuW/cYf+IZWZbCe68uffXiNQc/SpHzP+IpLnYy/qB3j+
 sj2K9dW8qnROzYDrXX1U3ZhoCPmhsaQawcBHd0HBWaXwHTegBJTnOBdp45zqykqSEGed
 +6uhhQXxWpfoWclrImC91wsgWiQKYDjBq30l8yBMJktMtaGVBLMC9qngfqVI3VObHGIh
 NxiP2hMqcM3Ab97CPWUKdz52Pn9ieI4/KHTtQePT82+SExdQRStbERT74ZMVjoHdI3zB
 8V5Jb9jYpGGJN3HP46o/5ZjNJf+Xg/xJQGfYthxpGMWzGgBDv9eOGBqXeWwQmAVu4K0R
 w+cg==
X-Gm-Message-State: AO0yUKXyJ9zPjfFjysd+Crk3xlZVDH4xBUe1ID7Wgt7kK/YvoMaWhHtT
 lACzMNk/CYUEcW6oFGjg0jE=
X-Google-Smtp-Source: AK7set/tLb7qwH+1NuCLkfVA22zjSgVa2zNLqGJBTREbn92FDuIP+l55nun5sR/LqCRq+xzXTkwurA==
X-Received: by 2002:a05:600c:4586:b0:3df:9858:c03a with SMTP id
 r6-20020a05600c458600b003df9858c03amr2455115wmo.15.1675866401857; 
 Wed, 08 Feb 2023 06:26:41 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 p24-20020a05600c1d9800b003dd1bd0b915sm2058911wms.22.2023.02.08.06.26.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 06:26:41 -0800 (PST)
Date: Wed, 8 Feb 2023 17:26:36 +0300
From: Dan Carpenter <error27@gmail.com>
To: matthew.d.roper@intel.com
Subject: [bug report] drm/i915/mtl: Add hardware-level lock for steering
Message-ID: <Y+OxHCcNco8uwgvP@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Matt Roper,

The patch 3100240bf846: "drm/i915/mtl: Add hardware-level lock for
steering" from Nov 28, 2022, leads to the following Smatch static
checker warning:

drivers/gpu/drm/i915/gt/intel_gt_mcr.c:379 intel_gt_mcr_lock() warn: sleeping in atomic context
CALL TREE:
intel_engine_reset() <- disables preempt
intel_gt_handle_error() <- disables preempt
live_hold_reset() <- disables preempt
reset_virtual_engine() <- disables preempt
-> __intel_engine_reset_bh()
   -> intel_engine_resume()
      -> intel_engine_apply_workarounds()
         -> wa_list_apply()
            -> intel_gt_mcr_lock()

drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c:769 intel_guc_ct_send() warn: sleeping in atomic context
CALL TREE:
guc_submission_tasklet() <- disables preempt
-> guc_dequeue_one_context()
guc_submit_request() <- disables preempt
-> guc_bypass_tasklet_submit()
   -> guc_add_request()
      -> __guc_add_request() <- disables preempt
         -> intel_guc_send_nb()
            -> intel_guc_ct_send()

drivers/gpu/drm/i915/gt/intel_gt_mcr.c
    366 void intel_gt_mcr_lock(struct intel_gt *gt, unsigned long *flags)
    367 {
    368         unsigned long __flags;
    369         int err = 0;
    370 
    371         lockdep_assert_not_held(&gt->uncore->lock);
    372 
    373         /*
    374          * Starting with MTL, we need to coordinate not only with other
    375          * driver threads, but also with hardware/firmware agents.  A dedicated
    376          * locking register is used.
    377          */
    378         if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))
--> 379                 err = wait_for(intel_uncore_read_fw(gt->uncore,
    380                                                     MTL_STEER_SEMAPHORE) == 0x1, 100);

The wait_for() macro sleeps.  But we can't sleep if preempt is disabled.
The code in the caller looks likes:

drivers/gpu/drm/i915/gt/selftest_execlists.c
   626                  err = engine_lock_reset_tasklet(engine);
                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
local_bh_disable() bumps the preempt_count.

   627                  if (err)
   628                          goto out;
   629  
   630                  engine->sched_engine->tasklet.callback(&engine->sched_engine->tasklet);
   631                  GEM_BUG_ON(execlists_active(&engine->execlists) != rq);
   632  
   633                  i915_request_get(rq);
   634                  execlists_hold(engine, rq);
   635                  GEM_BUG_ON(!i915_request_on_hold(rq));
   636  
   637                  __intel_engine_reset_bh(engine, NULL);
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Sleeping.

   638                  GEM_BUG_ON(rq->fence.error != -EIO);
   639  
   640                  engine_unlock_reset_tasklet(engine);
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
preempt enabled again.

   641  
   642                  /* Check that we do not resubmit the held request */

regards,
dan carpenter
