Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 318E1536862
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 23:15:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 968A010E289;
	Fri, 27 May 2022 21:15:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9557C10E444;
 Fri, 27 May 2022 11:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653652231; x=1685188231;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8Pv1I1Nns+I2QLs1eslBaZaz+CjfC1UGQQpD+Gz2iAk=;
 b=mxqncneW1ZdY+V8kbWzw9qroLJxt1MrrZoNgFtcZORF5DiF1j0koNcNA
 Q1LQRi+wG0OVVt8zRBlKVlDlYq/WdPw1mRAumNAWxOyB34jwp5up2KjQG
 pbCibHeTevO7ZDlibNYrXnShjdjxEYl/mWpuylJdMO92w0BTsarujgK5T
 mQnA0KYO8lAPrkdwE9ZRKpiDn5HX7B0vY3wV8/ulyfzn1atR8fVb6x6cs
 MiOVhtZ0i+RhBhsXMQFiHdm/evR9Z3yzwVfYvS+Q1XHcj7wtNFFJli9JN
 BZYfAJU+RUa//mwviEz6q6Jf4I0NWrsNaehmZnsZdrgf82QKQKRW5UoJb g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10359"; a="272032295"
X-IronPort-AV: E=Sophos;i="5.91,255,1647327600"; d="scan'208";a="272032295"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2022 04:50:30 -0700
X-IronPort-AV: E=Sophos;i="5.91,255,1647327600"; d="scan'208";a="705112301"
Received: from tdietric-mobl.ger.corp.intel.com (HELO linux.intel.com)
 ([10.252.54.13])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2022 04:50:26 -0700
Received: from localhost ([127.0.0.1] helo=maurocar-mobl2)
 by linux.intel.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95) (envelope-from <mauro.chehab@linux.intel.com>)
 id 1nuYU2-000PFu-Ro; Fri, 27 May 2022 13:50:22 +0200
Date: Fri, 27 May 2022 13:50:22 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH] drm/i915: don't flush TLB on GEN8
Message-ID: <20220527135022.0dd0891d@maurocar-mobl2>
In-Reply-To: <d981f429-d01f-4576-2e5c-0ae153d24df1@linux.intel.com>
References: <b6417c5bf1b0ee8e093712264f325bd1268ed1e4.1653642514.git.mchehab@kernel.org>
 <d981f429-d01f-4576-2e5c-0ae153d24df1@linux.intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 27 May 2022 21:15:17 +0000
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Dave Airlie <airlied@redhat.com>,
 Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Jon Bloomfield <jon.bloomfield@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 27 May 2022 11:55:42 +0100
Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:

> On 27/05/2022 10:09, Mauro Carvalho Chehab wrote:
> > i915 selftest hangcheck is causing the i915 driver timeouts, as
> > reported by Intel CI:
> > 
> > 	http://gfx-ci.fi.intel.com/cibuglog-ng/issuefilterassoc/24297?query_key=42a999f48fa6ecce068bc8126c069be7c31153b4
> > 
> > When such test runs, the only output is:
> > 
> > 	[   68.811639] i915: Performing live selftests with st_random_seed=0xe138eac7 st_timeout=500
> > 	[   68.811792] i915: Running hangcheck
> > 	[   68.811859] i915: Running intel_hangcheck_live_selftests/igt_hang_sanitycheck
> > 	[   68.816910] i915 0000:00:02.0: [drm] Cannot find any crtc or sizes
> > 	[   68.841597] i915: Running intel_hangcheck_live_selftests/igt_reset_nop
> > 	[   69.346347] igt_reset_nop: 80 resets
> > 	[   69.362695] i915: Running intel_hangcheck_live_selftests/igt_reset_nop_engine
> > 	[   69.863559] igt_reset_nop_engine(rcs0): 709 resets
> > 	[   70.364924] igt_reset_nop_engine(bcs0): 903 resets
> > 	[   70.866005] igt_reset_nop_engine(vcs0): 659 resets
> > 	[   71.367934] igt_reset_nop_engine(vcs1): 549 resets
> > 	[   71.869259] igt_reset_nop_engine(vecs0): 553 resets
> > 	[   71.882592] i915: Running intel_hangcheck_live_selftests/igt_reset_idle_engine
> > 	[   72.383554] rcs0: Completed 16605 idle resets
> > 	[   72.884599] bcs0: Completed 18641 idle resets
> > 	[   73.385592] vcs0: Completed 17517 idle resets
> > 	[   73.886658] vcs1: Completed 15474 idle resets
> > 	[   74.387600] vecs0: Completed 17983 idle resets
> > 	[   74.387667] i915: Running intel_hangcheck_live_selftests/igt_reset_active_engine
> > 	[   74.889017] rcs0: Completed 747 active resets
> > 	[   75.174240] intel_engine_reset(bcs0) failed, err:-110
> > 	[   75.174301] bcs0: Completed 525 active resets
> > 
> > After that, the machine just silently hangs.
> > 
> > The root cause is that the flush TLB logic is not working as
> > expected on GEN8.
> > 
> > Tested on an Intel NUC5i7RYB with an i7-5557U Broadwell CPU.
> > 
> > This patch partially reverts the logic by skipping GEN8 from
> > the TLB cache flush.  
> 
> Since I am pretty sure no such failures were spotted when merging the 
> feature I assume the failure is sporadic and/or limited to some 
> configurations? Do you have any details there? Because it is an 
> important security issue we should not revert it lightly.

It occurs every time here:
	https://intel-gfx-ci.01.org/tree/drm-tip/fi-bdw-5557u.html

It also happens on my own NUC5i7RYB every time when the TLB patch is 
applied. Reverting it (or applying this fix) is enough for hangcheck
to pass.

I suspect that TLB flush never happens there, causing ETIMEOUT at
hangcheck.

It could indeed be limited to some specific setups. I dunno.
The only Gen8 machine I have access is my own NUC. So, I can't
test it elsewhere.

Regards,
Mauro


