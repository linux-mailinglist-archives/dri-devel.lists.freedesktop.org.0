Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE9B421F3D
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 09:07:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F966E2E6;
	Tue,  5 Oct 2021 07:07:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097A36E2E6;
 Tue,  5 Oct 2021 07:06:59 +0000 (UTC)
Date: Tue, 5 Oct 2021 09:06:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1633417617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ErA+FMQ6eKB3vV9Xcub5nS1R+oPyIK29BJzJ17LvooM=;
 b=TKyOeNadxK+YbpVRbnTobRx+hlY0jvXQLsCZqQ1NJfLHLcqXPv5Frfgf16XT0GmwF30aCP
 EkBtm5O0A43yp2IJOPdyFqyDCDO8NVjVyl9bksS+9F7okGmui5SD7IKsPVeT9RK7SCHMqW
 yXnPd6b4HSMagJxKWk/EuSpF9+d1FjUE9iO0bOZmjLhjuKi5unG4fr9LwAvTviq7LBDjXx
 /gKre7uXmmjv4R22cxLqj7/7OjF2EnBftggnC1k2DZbvJNUxaYqECQ0//YrZuxAsKYQxqn
 bjjK1yK2H4teOwQHBJR1ir0OWlNs7K2BPwUtV0IX+t2p4oZmRj3plJxoTvti/g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1633417617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ErA+FMQ6eKB3vV9Xcub5nS1R+oPyIK29BJzJ17LvooM=;
 b=htwemY/lmJQUqDOfw1kdfEC67q6oq0hYMl7wVlXISV/FSnRRtUhCntLVMLoD6R/KEprLNV
 6XOgBwt9yptZwSCw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 john.c.harrison@intel.com, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 25/33] drm/i915/guc: Support request cancellation
Message-ID: <20211005070656.25xszayci52wqe7h@linutronix.de>
References: <20210727002348.97202-1-matthew.brost@intel.com>
 <20210727002348.97202-26-matthew.brost@intel.com>
 <2a417f11-050a-2445-d5e9-38fe354402f2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2a417f11-050a-2445-d5e9-38fe354402f2@intel.com>
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

On 2021-07-27 12:15:59 [-0700], Daniele Ceraolo Spurio wrote:
> On 7/26/2021 5:23 PM, Matthew Brost wrote:
> > This adds GuC backend support for i915_request_cancel(), which in turn
> > makes CONFIG_DRM_I915_REQUEST_TIMEOUT work.
> >=20
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

I have a few instances of ODEBUG warnings since this commit
   62eaf0ae217d4 ("drm/i915/guc: Support request cancellation")

like:

| ------------[ cut here ]------------
| ODEBUG: init destroyed (active state 0) object type: i915_sw_fence hint: =
sw_fence_dummy_notify+0x0/0x10
| WARNING: CPU: 0 PID: 987 at lib/debugobjects.c:505 debug_print_object+0x6=
e/0x90
| Modules linked in:
| CPU: 0 PID: 987 Comm: Xorg Not tainted 5.15.0-rc4+ #67
| Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./Z68 Pro3-M, =
BIOS P2.10 04/24/2012
| RIP: 0010:debug_print_object+0x6e/0x90
=E2=80=A6
| Call Trace:
|  i915_sw_fence_reinit+0x10/0x40
|  intel_context_init+0x185/0x1e0
|  intel_context_create+0x2e/0x100
|  default_engines+0x9d/0x120
|  i915_gem_create_context+0x40a/0x5d0
|  ? trace_kmalloc+0x29/0xd0
|  ? kmem_cache_alloc_trace+0xdd/0x190
|  i915_gem_context_open+0x140/0x1c0
|  i915_gem_open+0x70/0xa0
|  drm_file_alloc+0x1af/0x270
|  drm_open+0xdc/0x270
|  drm_stub_open+0xa6/0x130
|  chrdev_open+0xbe/0x250
|  ? cdev_device_add+0x80/0x80
|  do_dentry_open+0x15e/0x390
|  path_openat+0x76b/0xa60
|  do_filp_open+0xa4/0x150
|  ? lock_release+0x149/0x2f0
|  ? _raw_spin_unlock+0x24/0x40
|  do_sys_openat2+0x92/0x160
|  __x64_sys_openat+0x4f/0x90
|  do_syscall_64+0x3b/0xc0
|  entry_SYSCALL_64_after_hwframe+0x44/0xae
| RIP: 0033:0x7f91b5cfdf07

and:
| ODEBUG: activate destroyed (active state 0) object type: i915_sw_fence hi=
nt: sw_fence_dummy_notify+0x0/0x10
| WARNING: CPU: 0 PID: 987 at lib/debugobjects.c:505 debug_print_object+0x6=
e/0x90
|=20
| Call Trace:
|  debug_object_activate+0x174/0x200
|  i915_sw_fence_commit+0x10/0x20
|  intel_context_init+0x18d/0x1e0
|  intel_context_create+0x2e/0x100
|  default_engines+0x9d/0x120

---

| ODEBUG: active_state destroyed (active state 0) object type: i915_sw_fenc=
e hint: sw_fence_dummy_notify+0x0/0x10
| WARNING: CPU: 0 PID: 987 at lib/debugobjects.c:505 debug_print_object+0x6=
e/0x90
| Call Trace:
|  __i915_sw_fence_complete+0x6f/0x280
|  intel_context_init+0x18d/0x1e0
|  intel_context_create+0x2e/0x100
|  default_engines+0x9d/0x120

Is this known? This is yesterday's -rc4, I first noticed it in -rc3.

> Daniele

Sebastian
