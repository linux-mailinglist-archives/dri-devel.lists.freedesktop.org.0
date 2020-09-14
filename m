Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A318826920A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 18:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320586E51A;
	Mon, 14 Sep 2020 16:47:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B6D56E50D;
 Mon, 14 Sep 2020 16:47:46 +0000 (UTC)
IronPort-SDR: eTNEjhl3clJhcpKHhLj+YF5elokOG3V4Iz/eHp3LYKZdn9EPleUiJZRV1oye9Oaa0h1/IsZizE
 0z9LKf1qtmQg==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="146851101"
X-IronPort-AV: E=Sophos;i="5.76,426,1592895600"; d="scan'208";a="146851101"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 09:47:44 -0700
IronPort-SDR: myz5Y7mrXCHjH740bFh0aCX37M4dg16nxkZ62z6HGs+HH8I4a2H6vaC67R4GIjje/0Fy1Dd4e4
 ng2OaE6GQdOg==
X-IronPort-AV: E=Sophos;i="5.76,426,1592895600"; d="scan'208";a="306241329"
Received: from matancoh-mobl2.ger.corp.intel.com (HELO [10.255.198.45])
 ([10.255.198.45])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 09:47:41 -0700
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix the race between the GEM close
 and debugfs
To: "Nikunj A. Dadhania" <nikunj.dadhania@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20200914110019.18613-1-nikunj.dadhania@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <66c99a4d-ab35-55e8-44a2-18f5c39b8b1f@linux.intel.com>
Date: Mon, 14 Sep 2020 17:47:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200914110019.18613-1-nikunj.dadhania@linux.intel.com>
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 14/09/2020 12:00, Nikunj A. Dadhania wrote:
> As we close GEM object and set file_priv to -EBADF which is protected
> by ctx->mutex, populating the GEM debugfs info is not protected
> and results in the crash shown below.
> 
> Make sure to protect the access to file_priv using ctx->mutex to avoid
> race.
> 
> BUG: unable to handle page fault for address: ffffffffffffffff
> RIP: 0010:i915_gem_object_info+0x26b/0x3eb
> Code: 89 44 24 48 48 89 44 24 40 48 89 44 24 38 48 89 44 24 30 48 89 44 24 28 48 89 44 24 20 49 8b 46 f0 48 89 44 24 20 49 8b 46 a0 <48> 8b 58 08 b9 0a 00 00 00 48 b8 aa aa aa aa aa aa aa aa 48 8d bc
> RSP: 0018:ffffac81c14cfc30 EFLAGS: 00010246
> RAX: fffffffffffffff7 RBX: ffff95094429c218 RCX: ffff95096756c740
> RDX: 0000000000000000 RSI: ffffffff919b93ee RDI: ffff95094429c218
> RBP: ffffac81c14cfd58 R08: ffff9509746fab80 R09: 0000000000000000
> R10: 0000000000000001 R11: 0000000000000000 R12: ffff9509753f8e80
> R13: ffffac81c14cfc98 R14: ffff95094429c268 R15: ffffac81c14cfc88
> FS:  00007a1bdcd52900(0000) GS:ffff950977e00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: ffffffffffffffff CR3: 000000026b4e0000 CR4: 0000000000340ef0
> Call Trace:
>   seq_read+0x162/0x3ca
>   full_proxy_read+0x5b/0x8d
>   __vfs_read+0x45/0x1b9
>   vfs_read+0xc9/0x15e
>   ksys_read+0x7e/0xde
>   do_syscall_64+0x54/0x7e
>   entry_SYSCALL_64_after_hwframe+0x44/0xa9
> RIP: 0033:0x7a1bdd34cf03
> 
> Signed-off-by: Nikunj A. Dadhania <nikunj.dadhania@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/i915_debugfs.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
> index 784219962193..ea469168cd44 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> @@ -326,6 +326,7 @@ static void print_context_stats(struct seq_file *m,
>   		}
>   		i915_gem_context_unlock_engines(ctx);
>   
> +		mutex_lock(&ctx->mutex);
>   		if (!IS_ERR_OR_NULL(ctx->file_priv)) {
>   			struct file_stats stats = {
>   				.vm = rcu_access_pointer(ctx->vm),
> @@ -346,6 +347,7 @@ static void print_context_stats(struct seq_file *m,
>   
>   			print_file_stats(m, name, stats);
>   		}
> +		mutex_unlock(&ctx->mutex);
>   
>   		spin_lock(&i915->gem.contexts.lock);
>   		list_safe_reset_next(ctx, cn, link);
> 

Fix is correct, but it looked familiar and indeed I found a fix for the 
same issues back from July. Copied you on that one which now has an r-b. 
This one can have it as well but please also copy stable.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
