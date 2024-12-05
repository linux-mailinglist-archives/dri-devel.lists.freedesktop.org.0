Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0E29E572D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 14:32:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4D210EE6B;
	Thu,  5 Dec 2024 13:32:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XN7uxW74";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D7B610EE6A;
 Thu,  5 Dec 2024 13:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733405533; x=1764941533;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ZKJmbFXZb7Mu5ntPsS5hH2MbAYfqPgPQ9hW8tcycSl0=;
 b=XN7uxW74B7VeVmK5/7BiDSuRrNjw3XtkReFYgLc7rcWiw2qvVBysGPJE
 r1XXCXTuSAAgo/RxxbWt7IiTthppVXTnWLKHMeRMgpINXVfBAByhwb5Ws
 IxZ/ilr/EXCwpDZvb5HNH6/Rphx9RjAuAXC/0FLS50bB6GiRK6PbSrYy8
 Q+LendvaJg018//o3eAyrB6P6qhDeXF9kjlKHShTghRx/ct9RqyqjAxVN
 s7+dFTHA1YRECDEtcu3L0/lU5W3pvBLPqpbDAEs5FKWPEHuqpwQeg7pBF
 5eSc1FdDK/nfiMcZ4u+kT1pmxbeq1isjWkvZIy8omAsdxeyGx/DW4aZGi g==;
X-CSE-ConnectionGUID: sZqr0rXMT2uvS4pum9osRQ==
X-CSE-MsgGUID: zLyGV8z4TMSLdxFmZyFWtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="44322492"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="44322492"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 05:32:12 -0800
X-CSE-ConnectionGUID: /n4XjCZHRFyHH8GrvQKnTw==
X-CSE-MsgGUID: gULP/NQmSqKL4f6u26RkQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="94535500"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 05:32:11 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 2/3] drm/i915/display: use drm_print_hex_dump() for crtc
 state dump
In-Reply-To: <Z1GnsMJXRvMgpCdf@ashyti-mobl2.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1733392101.git.jani.nikula@intel.com>
 <12d76e34ed4c508524f768a46d2a2beb09991a23.1733392101.git.jani.nikula@intel.com>
 <Z1GnsMJXRvMgpCdf@ashyti-mobl2.lan>
Date: Thu, 05 Dec 2024 15:32:08 +0200
Message-ID: <87cyi61civ.fsf@intel.com>
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

On Thu, 05 Dec 2024, Andi Shyti <andi.shyti@linux.intel.com> wrote:
> Hi Jani,
>
> On Thu, Dec 05, 2024 at 11:49:34AM +0200, Jani Nikula wrote:
>> Use the drm_printer based printer to get the device specific printing of
>> the hex dump.
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> ...
>
>> -static void
>> -intel_dump_buffer(const char *prefix, const u8 *buf, size_t len)
>> -{
>> -	if (!drm_debug_enabled(DRM_UT_KMS))
>> -		return;
>
> We lose this check now, anyway,

That now depends on the drm_printer, as it should.

Moreover, intel_crtc_state_dump() already has that check, so this is
completely redundant.

> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Jani.

>
> Thanks,
> Andi

-- 
Jani Nikula, Intel
