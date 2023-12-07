Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EB68086AF
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 12:26:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C3FA10E0D3;
	Thu,  7 Dec 2023 11:26:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A38710E87B;
 Thu,  7 Dec 2023 11:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701948405; x=1733484405;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bWcopTLPhOTAbphW/B+Lz4NoZrg10SRH1Cpjn1whZv8=;
 b=JUk6xhyh7gJ7Vb6nEwnpfOOwu3Yu7CQU9DvL2UxfoA0kScYqVaTPxd3m
 Q+63WU7zIENRq4lYEfbq7iiEeVE3LTJTmLhsJa3Of2j+kY7lpEAlKatEz
 lUTc1YgQwcuQwcPlgE/qZLlNIhblUZ4GcNQmck6ZpaxJkCSBFflx7Hjtm
 1ISEdXhdnld5Mul4BdbZ1slmerAUq6lOhjgdfTkydJjhavw/8wNjTDKFO
 aLYypHd5hfejxNzem5gwsWvdQJlqrhuvcn23QqcnfXdBYySAxDY/ztxZP
 zEpOMeh+xWPLWiDVIJne9kUJlJB49ThP77ZbiEAMarYZGB//LIJu1jDlm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1042179"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1042179"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 03:26:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="944997958"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="944997958"
Received: from mtiebout-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.62.163])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 03:26:41 -0800
Date: Thu, 7 Dec 2023 12:26:38 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/i915/selftests: Fix engine reset count storage
 for multi-tile
Message-ID: <ZXGr7s7wkYZexDuc@ashyti-mobl2.lan>
References: <20231201122109.729006-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201122109.729006-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Intel-gfx@lists.freedesktop.org,
 Tejas Upadhyay <tejas.upadhyay@intel.com>, dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

> Engine->id namespace is per-tile so struct igt_live_test->reset_engine[]
> needs to be two-dimensional so engine reset counts from all tiles can be
> stored with no aliasing. With aliasing, if we had a real multi-tile
> platform, the reset counts would be incorrect for same engine instance on
> different tiles.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Fixes: 0c29efa23f5c ("drm/i915/selftests: Consider multi-gt instead of to_gt()")
> Reported-by: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

sorry for being late here... the patch makes sense to me and the
CI failures don't look related.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
