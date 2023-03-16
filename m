Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF226BD810
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 19:19:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E245D10EDE5;
	Thu, 16 Mar 2023 18:18:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9114610E29C;
 Thu, 16 Mar 2023 18:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678990737; x=1710526737;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pAvg3SuZqEJ6Cl69ahM7MR7Th6gdWUEQc5iMKwqIrBY=;
 b=Lcue1oNoLwqrvRso6Y24MwbjhajSM00n8ob4/wKObg49QLELdcKW3vhl
 3auoLNRoBhkgfsqS1189RZXqprOlGuEzXJWIOort779OGAI1OA5NbFg3D
 PoTog+I9pIezJHJMiWTOtRX8CzwAa6c14LGv2hmXXu3aEPoLHpEyD7ZO2
 5W3c9cyx0qFRi6u9uxrGYjQ5kgtiI12QFhHuHVsvpuXV+seNdR24kvuyV
 p2HYUsP9n9VZRwAUsOdEgKMSp7o8apBQLeRNMv6KyE86PN/kgNIvr4vwu
 Yc62ej3TnhHnrmPNZJk3Z40TG56ijEDL9fuuE42Qn9se1QDwcf1gTQ626 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="326443555"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="326443555"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 11:18:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="1009343282"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="1009343282"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.22.209])
 ([10.213.22.209])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 11:18:53 -0700
Message-ID: <8a52b10f-0c6c-e776-df94-d5c85868f440@intel.com>
Date: Thu, 16 Mar 2023 19:18:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [Intel-gfx] [PATCH v6 0/2] drm/i915: add guard page to
 ggtt->error_capture
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
References: <20230308-guard_error_capture-v6-0-1b5f31422563@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230308-guard_error_capture-v6-0-1b5f31422563@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10.03.2023 10:23, Andrzej Hajda wrote:
> This patch tries to diminish plague of DMAR read errors present
> in CI for ADL*, RPL*, DG2 platforms, see for example [1] (grep DMAR).
> CI is usually tolerant for these errors, so the scale of the problem
> is not really visible.
> To show it I have counted lines containing DMAR read errors in dmesgs
> produced by CI for all three versions of the patch, but in contrast to v2
> I have grepped only for lines containing "PTE Read access".
> Below stats for kernel w/o patchset vs patched one.
> v1: 210 vs 0
> v2: 201 vs 0
> v3: 214 vs 0
> Apparently the patchset fixes all common PTE read errors.
> 
> Changelog:
> v2:
>      - modified commit message (I hope the diagnosis is correct),
>      - added bug checks to ensure scratch is initialized on gen3 platforms.
>        CI produces strange stacktrace for it suggesting scratch[0] is NULL,
>        to be removed after resolving the issue with gen3 platforms.
> v3:
>      - removed bug checks, replaced with gen check.
> v4:
>      - change code for scratch page insertion to support all platforms,
>      - add info in commit message there could be more similar issues
> v5:
>      - changed to patchset adding nop_clear_range related code,
>      - re-insert scratch PTEs on resume
> v6:
>      - use scratch_range
> 
> To: Jani Nikula <jani.nikula@linux.intel.com>
> To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> To: Rodrigo Vivi <rodrigo.vivi@intel.com>
> To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> 

Queued to drm-intel-gt-next

Regards
Andrzej

> ---
> - Link to v5: https://lore.kernel.org/r/20230308-guard_error_capture-v5-0-6d1410d13540@intel.com
> 
> ---
> Andrzej Hajda (2):
>        drm/i915/gt: introduce vm->scratch_range callback
>        drm/i915: add guard page to ggtt->error_capture
> 
>   drivers/gpu/drm/i915/gt/intel_ggtt.c      | 43 ++++++++++++++++++++++++++++---
>   drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c |  1 +
>   drivers/gpu/drm/i915/gt/intel_gtt.h       |  2 ++
>   3 files changed, 42 insertions(+), 4 deletions(-)
> ---
> base-commit: 3cd6c251f39c14df9ab711e3eb56e703b359ff54
> change-id: 20230308-guard_error_capture-f3f334eec85f
> 
> Best regards,

