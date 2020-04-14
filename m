Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4841A93F6
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:18:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A136E84B;
	Wed, 15 Apr 2020 07:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 829FB6E1D2;
 Tue, 14 Apr 2020 14:35:23 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id i3so2062262pgk.1;
 Tue, 14 Apr 2020 07:35:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rBqTt0fHqGzLLLy8qeio9bjdtjym9/WMds2EnBXmXZQ=;
 b=qYKGpU8kAuSIUjPnBiVhVainmm6RUwWexvPY8624t7CN9JnPRqEU0IQoleLfwNVUs8
 BTnppzoomw9C0qGESbtU7lwuUoxa6Eu0KqtEf7p2MgT0UhJcGIYHVkV0CNff5lnYsqfa
 JM5TkeYXR4eqdBjit/e710zpwRyw0uGoEiy20/S+6dGEvyb9ZCrSXc+58OSaQL8SYAUg
 s40Og+DDhzPRHVJGzMY2d4Nsrn8zMxpMSxtbK++04aLNvloVkbM8k1yk6/nhIlsFTH/d
 HYSROP3dMPhHsTGTQPWU5zMnOlJdnItWvLpeDqgldz3RJ2Ii2wvPO3zBVFtnBVPhQDDn
 rTQQ==
X-Gm-Message-State: AGi0PuajynD/Yk4n410owrm2Mrz7zhJdc9VT3EmZK9k9UcjijAUPJnG7
 3XKxjvmco9SmUYMk1tRhFg4=
X-Google-Smtp-Source: APiQypLeApFBSy8U/PtpeBuAxlxao12boDe4O39ePDAlMjL1FL/bamWKZ5BnsQ9TQXvtr20djFEifQ==
X-Received: by 2002:a62:8202:: with SMTP id w2mr23015058pfd.117.1586874922890; 
 Tue, 14 Apr 2020 07:35:22 -0700 (PDT)
Received: from sultan-box.localdomain (static-198-54-129-52.cust.tzulo.com.
 [198.54.129.52])
 by smtp.gmail.com with ESMTPSA id x18sm4147758pfi.22.2020.04.14.07.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 07:35:22 -0700 (PDT)
Date: Tue, 14 Apr 2020 07:35:18 -0700
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH v2] drm/i915: Fix ref->mutex deadlock in i915_active_wait()
Message-ID: <20200414143518.GA2082@sultan-box.localdomain>
References: <20200407065210.GA263852@kroah.com>
 <20200407071809.3148-1-sultan@kerneltoast.com>
 <20200410090838.GD1691838@kroah.com>
 <20200410141738.GB2025@sultan-box.localdomain>
 <20200411113957.GB2606747@kroah.com>
 <158685210730.16269.15932754047962572236@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158685210730.16269.15932754047962572236@build.alporthouse.com>
X-Mailman-Approved-At: Wed, 15 Apr 2020 07:17:53 +0000
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Greg KH <gregkh@linuxfoundation.org>, intel-gfx@lists.freedesktop.org,
 stable@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 14, 2020 at 09:15:07AM +0100, Chris Wilson wrote:
> The patch does not fix a deadlock. Greg, this patch is not a backport of
> a bugfix, why is it in stable?
> -Chris

Here's the deadlock this supposedly doesn't fix:
INFO: task kswapd0:178 blocked for more than 122 seconds.
      Tainted: G     U            5.4.28-00014-gd1e04f91d2c5 #4
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
kswapd0         D    0   178      2 0x80004000
Call Trace:
 ? __schedule+0x2f3/0x750
 schedule+0x39/0xa0
 schedule_preempt_disabled+0xa/0x10
 __mutex_lock.isra.0+0x19b/0x500
 ? i915_request_wait+0x25b/0x370
 active_retire+0x26/0x30
 i915_active_wait+0xa3/0x1a0
 i915_vma_unbind+0xe2/0x1c0
 i915_gem_object_unbind+0x111/0x140
 i915_gem_shrink+0x21b/0x530
 i915_gem_shrinker_scan+0xfd/0x120
 do_shrink_slab+0x154/0x2c0
 shrink_slab+0xd0/0x2f0
 shrink_node+0xdf/0x420
 balance_pgdat+0x2e3/0x540
 kswapd+0x200/0x3c0
 ? __wake_up_common_lock+0xc0/0xc0
 kthread+0xfb/0x130
 ? balance_pgdat+0x540/0x540
 ? __kthread_parkme+0x60/0x60
 ret_from_fork+0x1f/0x40
INFO: task kworker/u32:5:222 blocked for more than 122 seconds.
      Tainted: G     U            5.4.28-00014-gd1e04f91d2c5 #4
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
kworker/u32:5   D    0   222      2 0x80004000
Workqueue: i915 idle_work_handler
Call Trace:
 ? __schedule+0x2f3/0x750
 schedule+0x39/0xa0
 schedule_preempt_disabled+0xa/0x10
 __mutex_lock.isra.0+0x19b/0x500
 idle_work_handler+0x34/0x120
 process_one_work+0x1ea/0x3a0
 worker_thread+0x4d/0x3f0
 kthread+0xfb/0x130
 ? process_one_work+0x3a0/0x3a0
 ? __kthread_parkme+0x60/0x60
 ret_from_fork+0x1f/0x40
INFO: task mpv:1535 blocked for more than 122 seconds.
      Tainted: G     U            5.4.28-00014-gd1e04f91d2c5 #4
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
mpv             D    0  1535      1 0x00000000
Call Trace:
 ? __schedule+0x2f3/0x750
 schedule+0x39/0xa0
 schedule_preempt_disabled+0xa/0x10
 __mutex_lock.isra.0+0x19b/0x500
 __i915_gem_free_objects+0x68/0x190
 i915_gem_create_ioctl+0x18/0x30
 ? i915_gem_dumb_create+0xa0/0xa0
 drm_ioctl_kernel+0xb2/0x100
 drm_ioctl+0x209/0x360
 ? i915_gem_dumb_create+0xa0/0xa0
 do_vfs_ioctl+0x43f/0x6c0
 ksys_ioctl+0x5e/0x90
 __x64_sys_ioctl+0x16/0x20
 do_syscall_64+0x4e/0x140
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7fb49f1b32eb
Code: Bad RIP value.
RSP: 002b:00007ffef9eb0948 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007ffef9eb09c0 RCX: 00007fb49f1b32eb
RDX: 00007ffef9eb09c0 RSI: 00000000c010645b RDI: 0000000000000008
RBP: 00000000c010645b R08: 000055fdb80c1370 R09: 000055fdb80c14e0
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fb4781e56b0
R13: 0000000000000008 R14: 00007fb4781e5560 R15: 00007fb4781e56b0
INFO: task kswapd0:178 blocked for more than 245 seconds.
      Tainted: G     U            5.4.28-00014-gd1e04f91d2c5 #4
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
kswapd0         D    0   178      2 0x80004000
Call Trace:
 ? __schedule+0x2f3/0x750
 schedule+0x39/0xa0
 schedule_preempt_disabled+0xa/0x10
 __mutex_lock.isra.0+0x19b/0x500
 ? i915_request_wait+0x25b/0x370
 active_retire+0x26/0x30
 i915_active_wait+0xa3/0x1a0
 i915_vma_unbind+0xe2/0x1c0
 i915_gem_object_unbind+0x111/0x140
 i915_gem_shrink+0x21b/0x530
 i915_gem_shrinker_scan+0xfd/0x120
 do_shrink_slab+0x154/0x2c0
 shrink_slab+0xd0/0x2f0
 shrink_node+0xdf/0x420
 balance_pgdat+0x2e3/0x540
 kswapd+0x200/0x3c0
 ? __wake_up_common_lock+0xc0/0xc0
 kthread+0xfb/0x130
 ? balance_pgdat+0x540/0x540
 ? __kthread_parkme+0x60/0x60
 ret_from_fork+0x1f/0x40
INFO: task kworker/u32:5:222 blocked for more than 245 seconds.
      Tainted: G     U            5.4.28-00014-gd1e04f91d2c5 #4
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
kworker/u32:5   D    0   222      2 0x80004000
Workqueue: i915 idle_work_handler
Call Trace:
 ? __schedule+0x2f3/0x750
 schedule+0x39/0xa0
 schedule_preempt_disabled+0xa/0x10
 __mutex_lock.isra.0+0x19b/0x500
 idle_work_handler+0x34/0x120
 process_one_work+0x1ea/0x3a0
 worker_thread+0x4d/0x3f0
 kthread+0xfb/0x130
 ? process_one_work+0x3a0/0x3a0
 ? __kthread_parkme+0x60/0x60
 ret_from_fork+0x1f/0x40
INFO: task mpv:1535 blocked for more than 245 seconds.
      Tainted: G     U            5.4.28-00014-gd1e04f91d2c5 #4
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
mpv             D    0  1535      1 0x00000000
Call Trace:
 ? __schedule+0x2f3/0x750
 schedule+0x39/0xa0
 schedule_preempt_disabled+0xa/0x10
 __mutex_lock.isra.0+0x19b/0x500
 __i915_gem_free_objects+0x68/0x190
 i915_gem_create_ioctl+0x18/0x30
 ? i915_gem_dumb_create+0xa0/0xa0
 drm_ioctl_kernel+0xb2/0x100
 drm_ioctl+0x209/0x360
 ? i915_gem_dumb_create+0xa0/0xa0
 do_vfs_ioctl+0x43f/0x6c0
 ksys_ioctl+0x5e/0x90
 __x64_sys_ioctl+0x16/0x20
 do_syscall_64+0x4e/0x140
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7fb49f1b32eb
Code: Bad RIP value.
RSP: 002b:00007ffef9eb0948 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007ffef9eb09c0 RCX: 00007fb49f1b32eb
RDX: 00007ffef9eb09c0 RSI: 00000000c010645b RDI: 0000000000000008
RBP: 00000000c010645b R08: 000055fdb80c1370 R09: 000055fdb80c14e0
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fb4781e56b0
R13: 0000000000000008 R14: 00007fb4781e5560 R15: 00007fb4781e56b0

Dead inside the shrinker, and very easy to reproduce.

Sultan
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
