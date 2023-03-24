Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AFB6C7987
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 09:18:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBBDA10E517;
	Fri, 24 Mar 2023 08:18:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9482D10E517
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 08:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679645909; x=1711181909;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VWYIiuammHuGfocthF8r48PbgjPi0ijJG3FZ3kcjkTU=;
 b=IG3U2Dn9xkun7gWGbgWeMp67rIPFsnBpsaunkXgkfsMFHTcbkbEfM7BC
 +aNpRGHhAt9ZKKCw+AXDVQzLXvCWbUgF77NWpBOzxDtu6y28vI5qaYVsv
 A7joyh6mHAj913mjkNhkYqBtXOwEDpu7SRBqva+7x48IeB77+qFS5/ygz
 YguOU+NhdNlFBxuNp+VTH5z7rseTQ5rr/N7Eo46ZjGmAdPHjoSM8WjaV1
 B5kBN/n+HTp5CBT9vnv2jjfNitg8XDO5J7eTzTT+fWNK4Emulzxo7k+uq
 6Ue7uhKEeljldG01orJuqUk9B9+VILwYXGzvxOetRZCRwtqSgYzYutVpg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="320116411"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="320116411"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 01:18:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="928574832"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="928574832"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 01:18:20 -0700
Date: Fri, 24 Mar 2023 09:18:18 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH 1/6] accel/habanalabs: unmap mapped memory when TLB inv
 fails
Message-ID: <20230324081818.GF2130371@linux.intel.com>
References: <20230323113525.959176-1-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323113525.959176-1-ogabbay@kernel.org>
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
Cc: Koby Elbaz <kelbaz@habana.ai>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 23, 2023 at 01:35:20PM +0200, Oded Gabbay wrote:
> From: Koby Elbaz <kelbaz@habana.ai>
> 
> Once a memory mapping is added to the page tables, it's followed by
> a TLB invalidation request which could potentially fail (HW failure).
> Removing the mapping is simply a part of this failure handling routine.
> TLB invalidation failure prints were updated to be more accurate.
> 
> Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
> Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
> Signed-off-by: Oded Gabbay <ogabbay@kernel.org>

Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

>  	rc = hl_mmu_invalidate_cache(hdev, false, MMU_OP_USERPTR | MMU_OP_SKIP_LOW_CACHE_INV);
> +	if (rc)
> +		goto err_mmu_unmap;

BTW: all other calls of that function ignore the error. Assume that is fine.

Regards
Stanislaw
