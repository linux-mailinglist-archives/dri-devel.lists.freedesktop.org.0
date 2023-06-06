Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1429724240
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 14:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A7610E11C;
	Tue,  6 Jun 2023 12:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C074010E11C
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 12:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686054937; x=1717590937;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tA7wwf/t/7qt0yTKz623VV7kJiNe41UtCjTEvJ+qhiQ=;
 b=Bmm2wDpxx1QM+Fzvvzf9kFAj36oo2rqdi8If4hN1oFRvBguPh9xxkyX+
 QpHFHhai4BmpHLhXbfyRql7YZG9NyRy83Pb2p17YEUqzVmd9hPcpr+tBZ
 VRoykhAes+/ANe+c7ppRj37yWKR7RN52kLwA8ztOsH5PrM0TiQ8lL9a4V
 VBungVwlsAvAN4rvNFtPmIyESxjqwCwbtQkf/OchORkoBVZgLSaXw6zJr
 jH3oVVfxVSRw0gnfwDcA//Sf8wMDljRt42ROMJ/QlKDKXjrQ/aYjE1HFn
 mF2ez/pBXQNnsAevDy6Kwp7jrctluNM/jfqULouvbjdtO+TsCbKjabbYP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="346254614"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="346254614"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 05:35:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="833208288"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="833208288"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 05:35:33 -0700
Date: Tue, 6 Jun 2023 14:35:32 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] accel/ivpu: ivpu_ipc needs GENERIC_ALLOCATOR
Message-ID: <20230606123532.GA324119@linux.intel.com>
References: <20230526044519.13441-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230526044519.13441-1-rdunlap@infradead.org>
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
Cc: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, kernel test robot <lkp@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 25, 2023 at 09:45:19PM -0700, Randy Dunlap wrote:
> Drivers that use the gen_pool*() family of functions should
> select GENERIC_ALLOCATOR to prevent build errors like these:
> 
> ld: drivers/accel/ivpu/ivpu_ipc.o: in function `gen_pool_free':
> include/linux/genalloc.h:172: undefined reference to `gen_pool_free_owner'
> ld: drivers/accel/ivpu/ivpu_ipc.o: in function `gen_pool_alloc_algo':
> include/linux/genalloc.h:138: undefined reference to `gen_pool_alloc_algo_owner'
> ld: drivers/accel/ivpu/ivpu_ipc.o: in function `gen_pool_free':
> include/linux/genalloc.h:172: undefined reference to `gen_pool_free_owner'
> ld: drivers/accel/ivpu/ivpu_ipc.o: in function `ivpu_ipc_init':
> drivers/accel/ivpu/ivpu_ipc.c:441: undefined reference to `devm_gen_pool_create'
> ld: drivers/accel/ivpu/ivpu_ipc.o: in function `gen_pool_add_virt':
> include/linux/genalloc.h:104: undefined reference to `gen_pool_add_owner'
> 
> Fixes: 5d7422cfb498 ("accel/ivpu: Add IPC driver and JSM messages")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/all/202305221206.1TaugDKP-lkp@intel.com/
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Cc: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> Cc: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
> Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Applied to drm-misc-fixes

Thanks
Stanislaw

