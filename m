Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 605E486D7F5
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 00:41:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7782010E6DE;
	Thu, 29 Feb 2024 23:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dSsEKLvQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6CB510E6DE;
 Thu, 29 Feb 2024 23:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709250060; x=1740786060;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=930WpWCMVx8vaaEx5O7Jspr1tnEZc4dhEMPwWQMZqjo=;
 b=dSsEKLvQ1XZsQYGQkdu3plpBmhElTDNrN0rOoqqQLZWzH1ayxvZ+9B4j
 AtkLC/N88UCffC8Ek6rdknqajsmThzWIABoT3K5j6hTVCqlanv7hbqNMM
 9MR+31NPuVVf/o9IIdXH5r9SYR9+2/zqF8JXqu6HNwgkGZ6lLUq0OS43l
 aYm7e4DNQejPUSemBg8E67mmkilfOEiOU496mDUq8+uC4Fr3hRplvjTS9
 Yt9bexfHRbVS0p8RjDL4PRSxr0t+ZH82dK9RcCWi9YLt0j7vyu2xLmi1L
 JTpVt0FtFafBM2p52ngBvla7hmxy5KVJHSINQxAAp3+ljYowwFbJ/ptid w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="6719031"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="6719031"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 15:40:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="12602232"
Received: from syhu-mobl2.ccr.corp.intel.com (HELO intel.com) ([10.94.248.193])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 15:40:57 -0800
Date: Fri, 1 Mar 2024 00:40:54 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, John Harrison <John.C.Harrison@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rahul Kumar Singh <rahul.kumar.singh@intel.com>
Subject: Re: [PATCH] drm/i915/selftests: Fix dependency of some timeouts on HZ
Message-ID: <ZeEWBnPjh7Jfm0IC@ashyti-mobl2.lan>
References: <20240222113347.648945-2-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240222113347.648945-2-janusz.krzysztofik@linux.intel.com>
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

Hi Janusz,

On Thu, Feb 22, 2024 at 12:32:40PM +0100, Janusz Krzysztofik wrote:
> Third argument of i915_request_wait() accepts a timeout value in jiffies.
> Most users pass either a simple HZ based expression, or a result of
> msecs_to_jiffies(), or MAX_SCHEDULE_TIMEOUT, or a very small number not
> exceeding 4 if applicable as that value.  However, there is one user --
> intel_selftest_wait_for_rq() -- that passes a WAIT_FOR_RESET_TIME symbol,
> defined as a large constant value that most probably represents a desired
> timeout in ms.  While that usage results in the intended value of timeout
> on usual x86_64 kernel configurations, it is not portable across different
> architectures and custom kernel configs.
> 
> Rename the symbol to clearly indicate intended units and convert it to
> jiffies before use.
> 
> Fixes: 3a4bfa091c46 ("drm/i915/selftest: Fix workarounds selftest for GuC submission")
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Rahul Kumar Singh <rahul.kumar.singh@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
