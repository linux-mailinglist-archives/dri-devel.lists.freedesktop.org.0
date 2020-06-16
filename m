Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6691FAC4A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 11:22:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6E46E038;
	Tue, 16 Jun 2020 09:22:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 105986E038;
 Tue, 16 Jun 2020 09:22:43 +0000 (UTC)
IronPort-SDR: +HjUmApn5BySSBaN+VVUN/22xjixDhALuaOjxaPGjt6p4NNYV5aOikiCqpCEYn+Y65n7XDciA4
 N/idLiGjF9IQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2020 02:22:42 -0700
IronPort-SDR: eA0x/VqDskuTKgeLmngYdGcDDDgAJQjFs934NzqW4ZS6C6/H5Wt318GMQheZZoPShHoGfAz0Xh
 ohx8FnggmGhg==
X-IronPort-AV: E=Sophos;i="5.73,518,1583222400"; d="scan'208";a="449736538"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.251.94.207])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2020 02:22:39 -0700
MIME-Version: 1.0
In-Reply-To: <20200616093912.4dffcc71@canb.auug.org.au>
References: <20200616093912.4dffcc71@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the drm-intel-fixes tree
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: DRI <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Tue, 16 Jun 2020 12:22:36 +0300
Message-ID: <159229935689.7727.9085291204498542933@jlahtine-desk.ger.corp.intel.com>
User-Agent: alot/0.8.1
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Stephen Rothwell (2020-06-16 02:39:12)
> Hi all,
> 
> After merging the drm-intel-fixes tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> In file included from drivers/gpu/drm/i915/gt/intel_lrc.c:5972:
> drivers/gpu/drm/i915/gt/selftest_lrc.c: In function 'live_timeslice_nopreempt':
> drivers/gpu/drm/i915/gt/selftest_lrc.c:1333:3: error: too few arguments to function 'engine_heartbeat_disable'
>  1333 |   engine_heartbeat_disable(engine);
>       |   ^~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/i915/gt/selftest_lrc.c:54:13: note: declared here
>    54 | static void engine_heartbeat_disable(struct intel_engine_cs *engine,
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/i915/gt/selftest_lrc.c:1402:3: error: too few arguments to function 'engine_heartbeat_enable'
>  1402 |   engine_heartbeat_enable(engine);
>       |   ^~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/i915/gt/selftest_lrc.c:64:13: note: declared here
>    64 | static void engine_heartbeat_enable(struct intel_engine_cs *engine,
>       |             ^~~~~~~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   04dc41776145 ("drm/i915/gt: Prevent timeslicing into unpreemptable requests")
> 
> I have reverted that commit for today.

Thanks for reporting. I had my drm-intel-fixes build tree configured
without selftests. I've now corrected that and added a missing dependency
patch.

Regards, Joonas

> 
> -- 
> Cheers,
> Stephen Rothwell
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
