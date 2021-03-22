Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AF13445EF
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 14:38:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C8F16E486;
	Mon, 22 Mar 2021 13:38:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A0A6E486;
 Mon, 22 Mar 2021 13:38:07 +0000 (UTC)
IronPort-SDR: wtB8LnYWciCCL5vvIFBz3PGda2xejBsT9kHhJLmPsDBMmhOVc71poOGG7seIzE6izHDmCbUXiA
 Sq/X4ervWNfw==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="177403302"
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="177403302"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 06:38:04 -0700
IronPort-SDR: UibSpSC3e0SIXUQFQV2Scb1ueMtWfRxxwuiFAXBO/a1DAV3rtJTsKNsGilmzI4yWSHElIQo5Cm
 DiFysdwxp2Jg==
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="407835413"
Received: from rgkirwan-mobl.ger.corp.intel.com (HELO [10.213.212.156])
 ([10.213.212.156])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 06:38:01 -0700
Subject: =?UTF-8?Q?Re=3a_=e2=9c=97_Fi=2eCI=2eIGT=3a_failure_for_Default_requ?=
 =?UTF-8?Q?est/fence_expiry_+_watchdog_=28rev3=29?=
To: intel-gfx@lists.freedesktop.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20210318170419.2107512-1-tvrtko.ursulin@linux.intel.com>
 <161611666102.8628.1124825882873170304@emeril.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <39d7d721-4e52-89b2-8efe-54cb7768ec6c@linux.intel.com>
Date: Mon, 22 Mar 2021 13:37:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <161611666102.8628.1124825882873170304@emeril.freedesktop.org>
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


On 19/03/2021 01:17, Patchwork wrote:

Okay with 20s default expiration the hangcheck tests on Tigerlake pass 
and we are left with these failures:

>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@gem_ctx_ringsize@idle@bcs0:
> 
>       o shard-skl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9870/shard-skl10/igt@gem_ctx_ringsize@idle@bcs0.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19806/shard-skl7/igt@gem_ctx_ringsize@idle@bcs0.html>

Too many runnable requests on a slow Skylake SKU with command parsing 
active. Too many to finish withing the 20s default expiration that is. 
This is actually the same root cause as the below tests tries to 
explicitly demonstrate:

>   *
> 
>     {igt@gem_watchdog@far-fence@bcs0} (NEW):
> 
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19806/shard-glk7/igt@gem_watchdog@far-fence@bcs0.html>
>   *
> 
>     {igt@gem_watchdog@far-fence@vcs0} (NEW):
> 
>       o shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19806/shard-apl1/igt@gem_watchdog@far-fence@vcs0.html>
>         +2 similar issues
>   *
> 
>     {igt@gem_watchdog@far-fence@vecs0} (NEW):
> 
>       o shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19806/shard-kbl7/igt@gem_watchdog@far-fence@vecs0.html>
>         +2 similar issues

The vulnerability default expiration adds compared to the current state 
is applicable to heaviliy loaded systems where GPU is shared between 
multiple clients.

Otherwise series seems to work. Failing tests can be blacklisted going 
forward. Ack to merge and merge itself, after review, I leave to 
maintainers since personally I am not supportive of this mechanism.

Regards,

Tvrtko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
