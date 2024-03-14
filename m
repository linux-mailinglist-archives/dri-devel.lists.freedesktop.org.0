Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC0B87C196
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 17:58:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C1010E034;
	Thu, 14 Mar 2024 16:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F49o9o6f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA7D910E034;
 Thu, 14 Mar 2024 16:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710435483; x=1741971483;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fcf8GvnNI2NlxwWa/BLBUBs674hhRLyrkoAa66D2RKo=;
 b=F49o9o6f1wA2+0hKn2KaNWoiU1UaqF5OSDbpLsz7FOXcrELL9HyUrEm2
 Q7o/CPG+e7ansTYgABaa4woiQvX89RKbkPHj+bcgh3tYYn0XGK646ElkI
 HrgYq/7XfEdsyNtraXvIPPPL9YendLYAIydJX7fyXvsyOkFSLKRZSD2KS
 /viwGMOLdRhlZ5Ia5FECnv7rM7SLSFF6MvtJ9znOXtJRdgwbP4P/BZ58s
 J7j0afF+CVkZ4pph2QI+dRrCHA03wcMHd7Ly3thCHCt+6jI+JMAnuKqhK
 T122oCRSneZNdNILJL0gsQT3+Fp4ao8P7KOOXtiUwYbhAvSMXWpouRApx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="22731674"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="22731674"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 09:58:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="16952403"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2)
 ([10.209.72.214])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 09:57:59 -0700
Date: Thu, 14 Mar 2024 09:57:57 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 linux-block@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-rdma@vger.kernel.org, linux-pm@vger.kernel.org,
 iommu@lists.linux.dev, linux-tegra@vger.kernel.org,
 netdev@vger.kernel.org, linux-hyperv@vger.kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-usb@vger.kernel.org, linux-bcachefs@vger.kernel.org,
 linux-nfs@vger.kernel.org, ocfs2-devel@lists.linux.dev,
 linux-cifs@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-edac@vger.kernel.org, selinux@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-hwmon@vger.kernel.org,
 io-uring@vger.kernel.org, linux-sound@vger.kernel.org,
 bpf@vger.kernel.org, linux-wpan@vger.kernel.org,
 dev@openvswitch.org, linux-s390@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, Julia Lawall <Julia.Lawall@inria.fr>
Subject: Re: [FYI][PATCH] tracing/treewide: Remove second parameter of
 __assign_str()
Message-ID: <ZfMslbCmCtyEaEWN@aschofie-mobl2>
References: <20240223125634.2888c973@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240223125634.2888c973@gandalf.local.home>
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

On Fri, Feb 23, 2024 at 12:56:34PM -0500, Steven Rostedt wrote:
> From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> 
> [
>    This is a treewide change. I will likely re-create this patch again in
>    the second week of the merge window of v6.9 and submit it then. Hoping
>    to keep the conflicts that it will cause to a minimum.
> ]
> 
> With the rework of how the __string() handles dynamic strings where it
> saves off the source string in field in the helper structure[1], the
> assignment of that value to the trace event field is stored in the helper
> value and does not need to be passed in again.
> 
> This means that with:
> 
>   __string(field, mystring)
> 
> Which use to be assigned with __assign_str(field, mystring), no longer
> needs the second parameter and it is unused. With this, __assign_str()
> will now only get a single parameter.
> 
> There's over 700 users of __assign_str() and because coccinelle does not
> handle the TRACE_EVENT() macro I ended up using the following sed script:
> 
>   git grep -l __assign_str | while read a ; do
>       sed -e 's/\(__assign_str([^,]*[^ ,]\) *,[^;]*/\1)/' $a > /tmp/test-file;
>       mv /tmp/test-file $a;
>   done
> 
> I then searched for __assign_str() that did not end with ';' as those
> were multi line assignments that the sed script above would fail to catch.
> 
> Note, the same updates will need to be done for:
> 
>   __assign_str_len()
>   __assign_rel_str()
>   __assign_rel_str_len()
>   __assign_bitmask()
>   __assign_rel_bitmask()
>   __assign_cpumask()
>   __assign_rel_cpumask()
> 
> [1] https://lore.kernel.org/linux-trace-kernel/20240222211442.634192653@goodmis.org/
> 
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
>  arch/arm64/kernel/trace-events-emulation.h    |   2 +-
>  arch/powerpc/include/asm/trace.h              |   4 +-
>  arch/x86/kvm/trace.h                          |   2 +-
>  drivers/base/regmap/trace.h                   |  18 +--
>  drivers/base/trace.h                          |   2 +-
>  drivers/block/rnbd/rnbd-srv-trace.h           |  12 +-
>  drivers/cxl/core/trace.h                      |  24 ++--

snip to CXL


> diff --git a/drivers/cxl/core/trace.h b/drivers/cxl/core/trace.h
> index bdf117a33744..07ba4e033347 100644
> --- a/drivers/cxl/core/trace.h
> +++ b/drivers/cxl/core/trace.h

snip to poison

> @@ -668,8 +668,8 @@ TRACE_EVENT(cxl_poison,
>  	    ),
>  
>  	TP_fast_assign(
> -		__assign_str(memdev, dev_name(&cxlmd->dev));
> -		__assign_str(host, dev_name(cxlmd->dev.parent));
> +		__assign_str(memdev);
> +		__assign_str(host);

I think I get that the above changes work because the TP_STRUCT__entry for
these did:
	__string(memdev, dev_name(&cxlmd->dev))
	__string(host, dev_name(cxlmd->dev.parent))

>  		__entry->serial = cxlmd->cxlds->serial;
>  		__entry->overflow_ts = cxl_poison_overflow(flags, overflow_ts);
>  		__entry->dpa = cxl_poison_record_dpa(record);
> @@ -678,12 +678,12 @@ TRACE_EVENT(cxl_poison,
>  		__entry->trace_type = trace_type;
>  		__entry->flags = flags;
>  		if (region) {
> -			__assign_str(region, dev_name(&region->dev));
> +			__assign_str(region);
>  			memcpy(__entry->uuid, &region->params.uuid, 16);
>  			__entry->hpa = cxl_trace_hpa(region, cxlmd,
>  						     __entry->dpa);
>  		} else {
> -			__assign_str(region, "");
> +			__assign_str(region);
>  			memset(__entry->uuid, 0, 16);
>  			__entry->hpa = ULLONG_MAX;

For the above 2, there was no helper in TP_STRUCT__entry. A recently
posted patch is fixing that up to be __string(region, NULL) See [1],
with the actual assignment still happening in TP_fast_assign.

Does that assign logic need to move to the TP_STRUCT__entry definition
when you merge these changes? I'm not clear how much logic is able to be
included, ie like 'C' style code in the TP_STRUCT__entry.

[1]
https://lore.kernel.org/linux-cxl/20240314044301.2108650-1-alison.schofield@intel.com/

Thanks for helping,
Alison


>  		}



