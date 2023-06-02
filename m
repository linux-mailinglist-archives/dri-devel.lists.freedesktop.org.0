Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 992E171F777
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 03:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A43B10E606;
	Fri,  2 Jun 2023 01:03:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5046D10E053;
 Fri,  2 Jun 2023 01:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685667804; x=1717203804;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UzCJ2xtSvIRGsRHhm9t1YVI8nd1QRoXT2ZxHMUiLcKQ=;
 b=biOtpaU2Me6vdaXnFTClO5mzV8s3Hk6QAPZ8JhUGZeaUkkvZO9YAHlDQ
 cSPN3SKztwbgNWIqOJnLyroqd2nGQR8oS529aoH1GosR+m5VDiVTO63j3
 T173yEbP/10uDm9yTxx5OYtbpurWzIAlBd8bSc+QfKeqZJI+J/98HXM90
 Tbh2XHSrO+6DHWpor5S9QyGhyjj2bPNkIyWakqrA4x5WysDk/01WvZrZG
 EEO7bKe9GYaAcjg1TNSUtV27ZP28s3o8sWjeluFb9lZSCSdqzucTgkaZU
 AupXufabN5VB3CyejifiTZENLpeagjk/zFEIfTL9Z9gBUsvg/8EOinT0h Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="419257240"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; d="scan'208";a="419257240"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 18:03:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="1037721020"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; d="scan'208";a="1037721020"
Received: from gsavorni-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.251.210.46])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 18:03:17 -0700
Date: Fri, 2 Jun 2023 03:03:14 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 0/2] drm/i915/gt: Fix recent kCFI violations
Message-ID: <ZHk/0iN9uwphaC+1@ashyti-mobl2.lan>
References: <20230530-i915-gt-cache_level-wincompatible-function-pointer-types-strict-v1-0-54501d598229@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530-i915-gt-cache_level-wincompatible-function-pointer-types-strict-v1-0-54501d598229@kernel.org>
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
Cc: tvrtko.ursulin@linux.intel.com, llvm@lists.linux.dev, fei.yang@intel.com,
 trix@redhat.com, intel-gfx@lists.freedesktop.org, ndesaulniers@google.com,
 patches@lists.linux.dev, dri-devel@lists.freedesktop.org,
 andi.shyti@linux.intel.com, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nathan,

On Tue, May 30, 2023 at 11:24:37AM -0700, Nathan Chancellor wrote:
> Hi all,
> 
> This series fixes a few clang kernel Control Flow Integrity (kCFI)
> violations that appear after commit 9275277d5324 ("drm/i915: use
> pat_index instead of cache_level"). They were found between run time
> testing on real hardware and compile time testing with
> -Wincompatible-function-pointer-types-strict (which is not yet enabled
> for the kernel but I build with it locally to catch new instances).
> 
> If there are any problems or questions, please let me know.
> 
> ---
> Nathan Chancellor (2):
>       drm/i915/gt: Fix second parameter type of pre-gen8 pte_encode callbacks
>       drm/i915/gt: Fix parameter in gmch_ggtt_insert_{entries,page}()

pushed in drm-intel-gt-next.

Thank you,
Andi
