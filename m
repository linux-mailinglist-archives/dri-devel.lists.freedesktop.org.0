Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE4D3BC892
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 11:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2E88985A;
	Tue,  6 Jul 2021 09:38:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD258985A;
 Tue,  6 Jul 2021 09:38:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10036"; a="208904676"
X-IronPort-AV: E=Sophos;i="5.83,328,1616482800"; d="scan'208";a="208904676"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 02:38:18 -0700
X-IronPort-AV: E=Sophos;i="5.83,328,1616482800"; d="scan'208";a="647241989"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.205])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 02:38:16 -0700
Date: Tue, 6 Jul 2021 15:09:55 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 1/2] drm/i915/selftests: fix smatch warning in
 igt_check_blocks
Message-ID: <20210706093955.GA23963@intel.com>
References: <20210702104642.1189978-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210702104642.1189978-1-matthew.auld@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-02 at 11:46:41 +0100, Matthew Auld wrote:
> The block here can't be NULL, especially since we already dereferenced
> it earlier, so remove the redundant check.
> 
> igt_check_blocks() warn: variable dereferenced before check 'block' (see line 126)
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> ---
>  drivers/gpu/drm/i915/selftests/i915_buddy.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/i915_buddy.c b/drivers/gpu/drm/i915/selftests/i915_buddy.c
> index f0f5c4df8dbc..d61ec9c951bf 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_buddy.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_buddy.c
> @@ -166,10 +166,8 @@ static int igt_check_blocks(struct i915_buddy_mm *mm,
>  		igt_dump_block(mm, prev);
>  	}
>  
> -	if (block) {
> -		pr_err("bad block, dump:\n");
> -		igt_dump_block(mm, block);
> -	}
> +	pr_err("bad block, dump:\n");
> +	igt_dump_block(mm, block);
LGTM.

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
>  
>  	return err;
>  }
> -- 
> 2.26.3
> 
