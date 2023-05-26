Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6FC71213A
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 09:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3188410E7B1;
	Fri, 26 May 2023 07:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61A810E7B1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 07:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685086619; x=1716622619;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xi7TBBQPejEGgobEw64w8lH8esKp08fZJkFWOZYLoxk=;
 b=XPWYuZdDKG0WJ8bfBUYmzK0CqYzC2mMFLwHc4ZPvy2A/++3WI/58H0Zr
 Syiue6tQpSwYt/u4/IsBN3bV8zzDV/clkHENb9aeul+9t806Rh7/eknOa
 pDwzLcctnoattKGGabKybxQg6eCZrJSFcGZF9loYAZzXIUEiCJZLZgqFY
 wEk1kTadVH1zVR3Dspsi0zI0CsMFbDGNtwc9596d5knF/Kka6QSD9nYNa
 OJrDCRzxO+wligxQ02VRgo8ejSBCihviFJ4sdwKXezLOMh7Ovrt1h6RKq
 GQU4wnwBBxidz9rSRnerCd664xfbQdr7rMlgIUgJDLYlgzEIa/fdxMG/v A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="352984367"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; d="scan'208";a="352984367"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 00:36:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="682641409"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; d="scan'208";a="682641409"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 00:36:55 -0700
Date: Fri, 26 May 2023 09:36:53 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] accel/ivpu: ivpu_ipc needs GENERIC_ALLOCATOR
Message-ID: <20230526073653.GA903183@linux.intel.com>
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
Acked-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

> ---
>  drivers/accel/ivpu/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff -- a/drivers/accel/ivpu/Kconfig b/drivers/accel/ivpu/Kconfig
> --- a/drivers/accel/ivpu/Kconfig
> +++ b/drivers/accel/ivpu/Kconfig
> @@ -7,6 +7,7 @@ config DRM_ACCEL_IVPU
>  	depends on PCI && PCI_MSI
>  	select FW_LOADER
>  	select SHMEM
> +	select GENERIC_ALLOCATOR
>  	help
>  	  Choose this option if you have a system that has an 14th generation Intel CPU
>  	  or newer. VPU stands for Versatile Processing Unit and it's a CPU-integrated
