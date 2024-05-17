Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD018C84E2
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 12:31:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D340910E0FC;
	Fri, 17 May 2024 10:31:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fa8Ty4Jz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88DE710E0FC;
 Fri, 17 May 2024 10:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715941871; x=1747477871;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rs2o47wJ15H3/HiD7Y6kYrLDSocRoVoJ2C2Uqw6Ayy0=;
 b=fa8Ty4JzMcA5D83NkMCVsdjB4C4oFl2Dns/ozYpHuBQT9+B7BwOIFHgS
 fG0ZHpj7s36+XU9ZJd+Rwsj/dMRhSjaVoSPlfTWtLlRRsxmJtfOzPysEY
 23LYI2Qd/Z8m+ToSMvj7lvUQzTUNLSBpkde3TRhjK+NkBKVnH904+Oo1q
 qwlBbgbVPm7rRNfCWmYeqtjzQp2RHjTvi1qCcZkLLTMLkN7kkl93mRvLf
 x4GvWk9LuCdWfqEzrhDTNx16RA95xh9T9iutRj7nSud5s8wLWPG7vzZAA
 +Rxneu9N397xbCwV+92ocYaBzx5gYJlxwHvbwL1aga9MdWhUw4xM2bhzp A==;
X-CSE-ConnectionGUID: HQXJArliTRKMyrVyA1nQZg==
X-CSE-MsgGUID: NIB5X/JfT8KeXbhyuQl69w==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="37489094"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="37489094"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 03:31:10 -0700
X-CSE-ConnectionGUID: D12wqzdgQO6zc3PxQ4V+2A==
X-CSE-MsgGUID: Og+mX4IhTAigJbTjt0abRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="32351448"
Received: from bvivekan-mobl2.gar.corp.intel.com (HELO intel.com)
 ([10.247.118.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 03:31:04 -0700
Date: Fri, 17 May 2024 12:30:54 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH] drm/i915/selftests: Set always_coherent to false when
 reading from CPU
Message-ID: <Zkcx3r-qrs12ZSvj@ashyti-mobl2.lan>
References: <20240516151403.2875-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240516151403.2875-1-nirmoy.das@intel.com>
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

Hi Nirmoy,

On Thu, May 16, 2024 at 05:14:03PM +0200, Nirmoy Das wrote:
> The previous commit 'commit 8d4ba9fc1c6c ("drm/i915/selftests: Pick
> correct caching mode.")' was not complete as for non LLC  sharing platforms
> cpu read can happen from LLC which probably doesn't have the latest
> changes made by GPU.
> 
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

you can add:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
