Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD25E872591
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 18:22:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AFA110E53B;
	Tue,  5 Mar 2024 17:22:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K3aeReqU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5FE310E52E;
 Tue,  5 Mar 2024 17:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709659343; x=1741195343;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=r5dRwA7cUGwvnoUKCrlo7pT9LzeqqbNLAEeDdS6w7As=;
 b=K3aeReqUPCSP+IX/EXyxS7NoDyo4S/A4aIzXbcCgaHRuzt/Jm5SOlRo2
 qJXoyN5fY1nqxegZds3sZwqt4wc1wk2DdngYNsuJekm2COEz4mBzfmnvm
 88DVGOXdhpN94cwVDDiap1OgcqnBdVMxvhF9S8PBPP393vCENYNuiKqlf
 veWvsdwLr1EuOs1BfNC3NxWC8riKWcEopiZ0lZQ+dwPAn/Y4n1hPvpsTD
 q2FWAHwX0JjF+xLhzqmaLg82kfTyKGPwYc7+TISkDyTIv42W7Xb4AQ6f4
 SYm5AuiSpzoR2EiqGIi36q0RJJp9fYo2pcRpyxyDLf0ZMXMFx/zskcCkE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="29651815"
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; d="scan'208";a="29651815"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 09:22:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="9310967"
Received: from unknown (HELO intel.com) ([10.247.118.75])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 09:22:16 -0800
Date: Tue, 5 Mar 2024 18:22:10 +0100
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
Message-ID: <ZedUwtadmlo9iOFl@ashyti-mobl2.lan>
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

pushed in drm-intel-gt-next.

Thank you,
Andi
