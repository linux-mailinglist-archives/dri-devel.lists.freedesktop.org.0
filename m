Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F04467C9A
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 18:33:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 760087388E;
	Fri,  3 Dec 2021 17:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1630F7388B;
 Fri,  3 Dec 2021 17:33:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10187"; a="235752996"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="235752996"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 09:33:39 -0800
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="610481844"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.205])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 09:33:37 -0800
Date: Fri, 3 Dec 2021 23:06:52 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v2 5/8] drm/i915/migrate: fix length calculation
Message-ID: <20211203173652.GC27873@intel.com>
References: <20211203122426.2859679-1-matthew.auld@intel.com>
 <20211203122426.2859679-6-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211203122426.2859679-6-matthew.auld@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: bob.beckett@collabora.com,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, adrian.larumbe@collabora.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-12-03 at 12:24:23 +0000, Matthew Auld wrote:
> No need to insert PTEs for the PTE window itself, also foreach expects a
> length not an end offset, which could be gigantic here with a second
> engine.
> 
Looks good to me

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>

> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Ramalingam C <ramalingam.c@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_migrate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
> index cb0bb3b94644..2076e24e0489 100644
> --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> @@ -136,7 +136,7 @@ static struct i915_address_space *migrate_vm(struct intel_gt *gt)
>  			goto err_vm;
>  
>  		/* Now allow the GPU to rewrite the PTE via its own ppGTT */
> -		vm->vm.foreach(&vm->vm, base, base + sz, insert_pte, &d);
> +		vm->vm.foreach(&vm->vm, base, d.offset - base, insert_pte, &d);
>  	}
>  
>  	return &vm->vm;
> -- 
> 2.31.1
> 
