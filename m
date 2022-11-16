Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC8B62B73E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 11:11:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DDA410E0F3;
	Wed, 16 Nov 2022 10:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6FA010E0F3;
 Wed, 16 Nov 2022 10:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668593485; x=1700129485;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=GvNypQu57pyaZ739Rd5mWa7coT5VRJmIkuNoPDwdLRU=;
 b=YC+ADzQaxj4CrOwp90x00C2nqGUopVTD0z+2fbN1/4ABYmmBv06VgeCa
 mL7/cur0ya9ANPJ4z1wsWe4RDMGLMQUMGCWTRqTj08WIhfg51RgxeRbjB
 Ei1suxUXtgqtIlJWWnRUe01jhcBMZn8PMcC8/Qm6Ss3SQjH2T19gCbE5k
 ZjaQ56M02u4IPMZvtnyBNYKQ6fGQ/3FFkjhaPOiUngd/QXII5NThokbId
 ylT6lMVUmGYtPMrhKVk0qrFvIjK09b5F9+9w3ZQmYpwVOfJwSntuboI7w
 VxFeAQrmA19JuRuOKL6xpCmpEIAQQbMCszXRngq0XbCrA2wyH2W5aapqT g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="398794399"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="398794399"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 02:08:32 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="633576261"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="633576261"
Received: from dariofax-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.59.5])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 02:08:30 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, DRI
 <dri-devel@lists.freedesktop.org>, Intel Graphics Development
 <intel-gfx@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Intel-gfx] How is the progress for removing
 flush_scheduled_work() callers?
In-Reply-To: <e170edc2-e5b9-4c8b-4ed3-7e2d7a2850dc@I-love.SAKURA.ne.jp>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <e170edc2-e5b9-4c8b-4ed3-7e2d7a2850dc@I-love.SAKURA.ne.jp>
Date: Wed, 16 Nov 2022 12:08:27 +0200
Message-ID: <877czv2ov8.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Sun, 06 Nov 2022, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp> wrote:
> Like commit c4f135d643823a86 ("workqueue: Wrap flush_workqueue() using a
> macro") says, flush_scheduled_work() is dangerous and will be forbidden.
> We are on the way for removing all flush_scheduled_work() callers from
> the kernel, and there are only 4 callers remaining as of linux-20221104.
>
>   drivers/gpu/drm/i915/display/intel_display.c:8997:      flush_scheduled_work();

Thanks for the reminder, I've pinged folks to get someone working on
this. We do schedule quite a bunch of work, so it's not immediately
obvious (at least to me) what exactly needs flushing.

https://gitlab.freedesktop.org/drm/intel/-/issues/7546

>   drivers/gpu/drm/i915/gt/selftest_execlists.c:88:        flush_scheduled_work();

Removed by commit 7d33fd02dd94 ("drm/i915/selftests: Remove
flush_scheduled_work() from live_execlists") in drm-next.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
