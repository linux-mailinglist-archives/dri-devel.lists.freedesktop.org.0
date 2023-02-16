Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC11A69938C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 12:48:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706F789E1D;
	Thu, 16 Feb 2023 11:48:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B50F289E1D
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 11:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676548100; x=1708084100;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rAGUQ396tcjZtm2/zUtmnBzlQhrIhPw9RcffTBvQgTg=;
 b=QE/wYM9P4R5b1T7MAcHyS/rfkZJKq1R/iZhy6PHEmh2fj1l191RSfM3Z
 2L0RmfERdegB0ZDWvQ+I4YY0ItJ2WJeO0aUrcry/MuIpIWk1ldUbuBa+5
 KukgowM0jiPhNDDJffyRwY8yP4Lnf52qbCWhJn8DZsKRKAA6wt7AvIVeF
 BdPJV3bhCIpM3+CtIb5HNfDf5wdOXq3VzD3qAKBgFzMb/YouoT/W5fnRG
 Dh1h13j1SJR79VgW+jEJFN1VVAD0GT194Pm/5LEopC4b6B4W4nWW2nVXD
 P59Z/3mQPWh8HuQuvbjj2hWTWtL9/FOFppkLnrtQUbwBfZMOl3Tsqc4JA g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="359125580"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="359125580"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 03:48:20 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="999004859"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="999004859"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 03:48:19 -0800
Date: Thu, 16 Feb 2023 12:48:17 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH 06/27] habanalabs: use memhash_node_export_put() in
 hl_release_dmabuf()
Message-ID: <20230216114817.GD2849548@linux.intel.com>
References: <20230212204454.2938561-1-ogabbay@kernel.org>
 <20230212204454.2938561-6-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230212204454.2938561-6-ogabbay@kernel.org>
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
Cc: Tomer Tayar <ttayar@habana.ai>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 12, 2023 at 10:44:33PM +0200, Oded Gabbay wrote:
> From: Tomer Tayar <ttayar@habana.ai>
> 
> The same mutex lock/unlock and counter decrementing in
> hl_release_dmabuf() is already done in the memhash_node_export_put()
> helper function.
> 
> Signed-off-by: Tomer Tayar <ttayar@habana.ai>
> Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
> Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
> ---
>  drivers/accel/habanalabs/common/memory.c | 89 ++++++++++++------------
>  1 file changed, 43 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/accel/habanalabs/common/memory.c b/drivers/accel/habanalabs/common/memory.c
> index e6474d38afc4..7b3809853dd5 100644
> --- a/drivers/accel/habanalabs/common/memory.c
> +++ b/drivers/accel/habanalabs/common/memory.c
> @@ -1779,6 +1779,47 @@ static void hl_unmap_dmabuf(struct dma_buf_attachment *attachment,
>  	kfree(sgt);
>  }
>  
> +static struct hl_vm_hash_node *memhash_node_export_get(struct hl_ctx *ctx, u64 addr)
> +{
> +	struct hl_device *hdev = ctx->hdev;
> +	struct hl_vm_hash_node *hnode;
> +
> +	/* get the memory handle */
> +	mutex_lock(&ctx->mem_hash_lock);
> +	hash_for_each_possible(ctx->mem_hash, hnode, node, (unsigned long)addr)
> +		if (addr == hnode->vaddr)
> +			break;
> +
> +	if (!hnode) {

This looks suspicious, I think hnode can be not-NULL here and has
hnode->vaddr different than searched addr, in case there is 
hash collision and we iterate over hlist where there is no
searched addr. Not 100% sure about that though.

I think would be better to provide helper like this:

	hash_for_each_possible(ctx->mem_hash, hnode, node, (unsigned long)addr)
		if (addr == hnode->vaddr)
			return hnode;
	return NULL;

which is basically standard way how hash_for_each_possible() used.


Regards
Stanislaw
