Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 118C15BB688
	for <lists+dri-devel@lfdr.de>; Sat, 17 Sep 2022 07:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1E510E2D5;
	Sat, 17 Sep 2022 05:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 440 seconds by postgrey-1.36 at gabe;
 Fri, 16 Sep 2022 18:28:19 UTC
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC3D10E4FD;
 Fri, 16 Sep 2022 18:28:19 +0000 (UTC)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28GHdif4003235;
 Fri, 16 Sep 2022 11:19:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PPS06212021;
 bh=4Bl1oOzxnloiv5lBZu0sTycNMhJ6BoRjgmbXTEm4F3U=;
 b=BqwncfYrEqbB4J0TOeA/YUU3Y4GvKH0Q3i2TJiI+lPvaXUQPNgSUJ79UKmDSaqbvJN0c
 KN3nER0W1aJD5P1ZNHr1h+5QBQUN3cKC2I8xq/YLvDD+SNS3E8MbARiiAigh0vUjmJAj
 U/MKsokCMTfBnNf6miDpHVw7vJCoutI11swZ5pqr9tydiUm19R9dlfTkdBRxCFHEjbDz
 rvQuAjEn2McYOQ1zXT58qKzuXrfKZj5k/J4cL3XtJ3OvfUUwYzDqcTmnLeGhJd57OaRf
 7pGx3Ep0aYDNaRj1fFwyYJeFGNji/8OZ68mjNzryuAefSGYUA4LUK4VjA08FyM/ORcXv kg== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jm8ye8x8b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 16 Sep 2022 11:19:38 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 16 Sep 2022 11:19:37 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 16 Sep 2022 11:19:37 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 8023)
 id 494092003A; Fri, 16 Sep 2022 14:19:37 -0400 (EDT)
Date: Fri, 16 Sep 2022 14:19:37 -0400
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v5 0/2] Fix TLB invalidate issues with Broadwell
 [preempt-rt regression]
Message-ID: <20220916181934.GA16961@windriver.com>
References: <cover.1657639152.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1657639152.git.mchehab@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: 35mH7Uo2DatrHXmJyPSAceB3PLOJ6EMQ
X-Proofpoint-ORIG-GUID: 35mH7Uo2DatrHXmJyPSAceB3PLOJ6EMQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_12,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011
 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209160133
X-Mailman-Approved-At: Sat, 17 Sep 2022 05:33:33 +0000
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 linux-rt-users@vger.kernel.org, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Clark Williams <clrkwllms@kernel.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Bruce Chang <yu.bruce.chang@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dave Airlie <airlied@redhat.com>,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[[PATCH v5 0/2] Fix TLB invalidate issues with Broadwell] On 12/07/2022 (Tue 16:21) Mauro Carvalho Chehab wrote:

> i915 selftest hangcheck is causing the i915 driver timeouts, as reported
> by Intel CI bot:
> 
> http://gfx-ci.fi.intel.com/cibuglog-ng/issuefilterassoc/24297?query_key=42a999f48fa6ecce068bc8126c069be7c31153b4

[...]

> After that, the machine just silently hangs.
> 
> Bisecting the issue, the patch that introduced the regression is:
> 
>     7938d61591d3 ("drm/i915: Flush TLBs before releasing backing store")
> 
> Reverting it fix the issues, but introduce other problems, as TLB
> won't be invalidated anymore. So, instead, let's fix the root cause.
> 
> It turns that the TLB flush logic ends conflicting with i915 reset,
> which is called during selftest hangcheck. So, the TLB cache should
> be serialized together with i915 reset.
> 
> Tested on an Intel NUC5i7RYB with an i7-5557U Broadwell CPU.

It turns out that this breaks PM-suspend operations on preempt-rt, on
multiple versions, due to all the linux-stable backports.  This happens
because the uncore->lock is now used in atomic contexts.

As the uncore->lock is widely used, conversion to a raw lock seems
inappropriate at 1st glance, and hence some alternate solution will
likely be required.

Below is an example of the regression on v5.15-rt, with backport:

commit 0ee5874dad61d2b154a9e3db196fc33e8208ce1b
  Author: Chris Wilson <chris@chris-wilson.co.uk>
  Date:   Tue Jul 12 16:21:32 2022 +0100

    drm/i915/gt: Serialize GRDOM access between multiple engine resets
        
    [ Upstream commit b24dcf1dc507f69ed3b5c66c2b6a0209ae80d4d4 ]
	        
Reverting the engine reset serialization change avoids the PM-suspend
regression and is a temporary workaround for -rt users, but of course
leaves this original TLB issue exposed.

  BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:46
  in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 45092, name: kworker/u8:4
  preempt_count: 1, expected: 0
  RCU nest depth: 0, expected: 0
  INFO: lockdep is turned off.
  Preemption disabled at:
  [<ffffffffc0636522>] __intel_gt_reset+0x92/0x100 [i915]
  CPU: 3 PID: 45092 Comm: kworker/u8:4 Tainted: G        W  O      5.15.59-rt48-preempt-rt #1
  Hardware name: Intel(R) Client Systems NUC7i5DNKE/NUC7i5DNB, BIOS DNKBLi5v.86A.0064.2019.0523.1933 05/23/2019
  Workqueue: events_unbound async_run_entry_fn
  Call Trace:
   <TASK>
   show_stack+0x52/0x5c
   dump_stack_lvl+0x5b/0x86
   dump_stack+0x10/0x16
   __might_resched.cold+0xf7/0x12f
   ? __gen6_reset_engines.constprop.0+0x80/0x80 [i915]
   rt_spin_lock+0x4e/0xf0
   ? gen8_reset_engines+0x2e/0x1e0 [i915]
   gen8_reset_engines+0x2e/0x1e0 [i915]
   ? __gen6_reset_engines.constprop.0+0x80/0x80 [i915]
   __intel_gt_reset+0x9d/0x100 [i915]
   gt_sanitize+0x16c/0x190 [i915]
   intel_gt_suspend_late+0x3d/0xc0 [i915]
   i915_gem_suspend_late+0x57/0x130 [i915]
   i915_drm_suspend_late+0x38/0x110 [i915]
   i915_pm_suspend_late+0x1d/0x30 [i915]
   pm_generic_suspend_late+0x28/0x40
   pci_pm_suspend_late+0x37/0x50
   ? pci_pm_poweroff_late+0x50/0x50
   dpm_run_callback.cold+0x3c/0xa8
   __device_suspend_late+0xa4/0x1e0
   async_suspend_late+0x20/0xa0
   async_run_entry_fn+0x28/0xc0
   process_one_work+0x239/0x6c0
   worker_thread+0x58/0x3e0
   kthread+0x1a9/0x1d0
   ? process_one_work+0x6c0/0x6c0
   ? set_kthread_struct+0x50/0x50
   ret_from_fork+0x1f/0x30
   </TASK>
  PM: late suspend of devices complete after 26.497 msecs

Paul.
--

> 
> v5:
> - Added a missing SoB on patch 2.
> - No other changes.
> 
> v4:
> - No functional changes. All changes are at the patch descriptions:
>   - collected acked-by/reviewed-by;
>   - use the same e-mail on Author and SoB on patch 1.
> 
> v3:
> - Removed the logic that would check if the engine is awake before doing
>   TLB flush invalidation as backporting PM logic up to Kernel 4.x could be
>   too painful. After getting this one merged, I'll submit a separate patch
>   with the PM awake logic.
> 
> v2:
> 
> - Reduced to bare minimum fixes, as this shoud be backported deeply
>   into stable.
> 
> Chris Wilson (2):
>   drm/i915/gt: Serialize GRDOM access between multiple engine resets
>   drm/i915/gt: Serialize TLB invalidates with GT resets
> 
>  drivers/gpu/drm/i915/gt/intel_gt.c    | 15 ++++++++++-
>  drivers/gpu/drm/i915/gt/intel_reset.c | 37 ++++++++++++++++++++-------
>  2 files changed, 42 insertions(+), 10 deletions(-)
> 
> -- 
> 2.36.1
> 
> 
