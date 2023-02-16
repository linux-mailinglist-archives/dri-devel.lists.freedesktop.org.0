Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2853D699591
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 14:19:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 552AD10E2D3;
	Thu, 16 Feb 2023 13:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE4210E2D3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 13:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676553578; x=1708089578;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nY6IaXfu1GqwT1+FKpC+5+4H6mFpxeozu0yM80UQf08=;
 b=JEBx0vxzoo08/BtRP4fQZyQlvOfzvmo9ofYwMNJPvW8+hKL1pOhMHEPE
 Ww8++/HhFCn7A/r54pjutjFGFFVMY2/GPdmGg9OEetv7OX6m5FdxWdqH3
 6oHyHo56BMpLS/hZKx5MAwSCDSMp5aUtcnW5IO5cd6l9XbapI/WWpW60O
 ccYJjJO8K4KzUy8GvqhR2avprs4A8kdVJbcche6W7dzcuio8yzJSrH11d
 +IkSNE2MdH2ITe5g6DLUFjK7OEkHr0S2uRMeKuAcIlzBJhu924SBGpr0o
 H4Zg0j1Wgh60R3s+AZfhLv4pWQXyrNuYZegvZSfTMhqMLguTV9uv2FDco A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="333883845"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="333883845"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 05:19:38 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="647676483"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="647676483"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 05:19:36 -0800
Date: Thu, 16 Feb 2023 14:19:34 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jesper Juhl <jesperjuhl76@gmail.com>
Subject: Re: [PATCH] Don't test for NULL firmware before releasing
Message-ID: <20230216131934.GF2849548@linux.intel.com>
References: <1af763de-dbb8-a6f8-1a8a-2d76610d8776@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1af763de-dbb8-a6f8-1a8a-2d76610d8776@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On Thu, Feb 16, 2023 at 02:37:15AM +0100, Jesper Juhl wrote:
> From 4fe34831e2e7677b1c9616356f0a2e0a36ec092f Mon Sep 17 00:00:00 2001
> From: Jesper Juhl <jesperjuhl76@gmail.com>
> Date: Thu, 16 Feb 2023 02:33:05 +0100
> Subject: [PATCH] Don't test for NULL firmware before releasing
> 
> release_firmware() tests for a NULL pointer itself, no need to do it up-front.
> 
> Signed-off-by: Jesper Juhl <jesperjuhl76@gmail.com>
> 
> ---
>  drivers/gpu/drm/tegra/falcon.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/falcon.c b/drivers/gpu/drm/tegra/falcon.c
> index c0d85463eb1a..ae599441f031 100644
> --- a/drivers/gpu/drm/tegra/falcon.c
> +++ b/drivers/gpu/drm/tegra/falcon.c
> @@ -153,8 +153,7 @@ int falcon_init(struct falcon *falcon)
> 
>  void falcon_exit(struct falcon *falcon)
>  {
> -	if (falcon->firmware.firmware)
> -		release_firmware(falcon->firmware.firmware);
> +       	release_firmware(falcon->firmware.firmware);

Please check patches with checkpatch.pl before posting.

Regards
Stanislaw

