Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B879B4984DC
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 17:32:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BCA410E207;
	Mon, 24 Jan 2022 16:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C86A510E1EC;
 Mon, 24 Jan 2022 16:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643041931; x=1674577931;
 h=message-id:subject:from:to:date:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ljYzMx7eashDoVWnX7UEqED4AmZeqIf5MfmoxULUtms=;
 b=M8249KP/y/MinWFgoG6hv+mgrW+2FkfS8T/cmuQuh8+e03paiOVuR3W/
 Y34gkCxxhtlRqwN9cxWf4vbUJ8AApl7u9vRwaxI7Wf1v5GHJ9HQJKk5uZ
 IL6Ip9d+v71o4WiWAS2kgUBoUelbFNVKjORHAo3V3vw887RcmYT9SphaI
 GmZ9wrJUhb7RGDoS6MKxjyhBvB8+NqlnmhK2qwKR2Szu3DI7EqhcD3wmq
 2mzX084AW0qIECSdw4sZf2g47TY9JZcbkdGSmhO/RQMG2bVSh/HIg8sd7
 PoJMPy6h/vniMWqbPioDJ8a4MMnSJvfQPmhPYh2/J7EEmBWAZ4yvy8oPP g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="245867647"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="245867647"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 08:32:10 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="673676797"
Received: from olindum-mobl1.ger.corp.intel.com (HELO [10.249.254.70])
 ([10.249.254.70])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 08:32:08 -0800
Message-ID: <5ad6f09f4b4ec5a3fe803c3d4811b10d13565d71.camel@linux.intel.com>
Subject: Re: [PATCH 04/11] dma-buf: warn about dma_fence_array container
 rules v2
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 sumit.semwal@linaro.org, gustavo@padovan.org, daniel.vetter@ffwll.ch, 
 zackr@vmware.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  intel-gfx@lists.freedesktop.org
Date: Mon, 24 Jan 2022 17:32:06 +0100
In-Reply-To: <20220124130328.2376-5-christian.koenig@amd.com>
References: <20220124130328.2376-1-christian.koenig@amd.com>
 <20220124130328.2376-5-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Mon, 2022-01-24 at 14:03 +0100, Christian König wrote:
> It's not allowed to nest another dma_fence container into a
> dma_fence_array
> or otherwise we can run into recursion.
> 
> Warn about that when we create a dma_fence_array.
> 
> v2: fix comment style and typo in the warning pointed out by Thomas
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

> ---
>  drivers/dma-buf/dma-fence-array.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-
> fence-array.c
> index 3e07f961e2f3..cb1bacb5a42b 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -176,6 +176,20 @@ struct dma_fence_array
> *dma_fence_array_create(int num_fences,
>  
>         array->base.error = PENDING_ERROR;
>  
> +       /*
> +        * dma_fence_array objects should never contain any other
> fence
> +        * containers or otherwise we run into recursion and
> potential kernel
> +        * stack overflow on operations on the dma_fence_array.
> +        *
> +        * The correct way of handling this is to flatten out the
> array by the
> +        * caller instead.
> +        *
> +        * Enforce this here by checking that we don't create a
> dma_fence_array
> +        * with any container inside.
> +        */
> +       while (num_fences--)
> +               WARN_ON(dma_fence_is_container(fences[num_fences]));
> +
>         return array;
>  }
>  EXPORT_SYMBOL(dma_fence_array_create);


