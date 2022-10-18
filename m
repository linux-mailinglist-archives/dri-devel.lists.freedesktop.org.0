Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9758A6033DD
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 22:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21E510F012;
	Tue, 18 Oct 2022 20:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 887D210F010
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 20:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666124457; x=1697660457;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uJg9sMdDITbrIUXukpGf3KWTGBBgTAteBz2uZw59IwQ=;
 b=gLZdjdi8+mKNz00emKtaNwq4yRJJOJbPbmmbFELEHiyTyOjs7IgzhzYK
 24uV2FbnQ55Ai3REzW1Qiu4xSynRhfvgUWjkU8Y7ZdCCt256TDRdEpOlm
 9b/hFMhriKlmukrIbqPFauCTk5T4IVkdsqExBddPXHmV/VVZOOPspE9/P
 gfzeaCh/EEU2cZgnYs244MtxOSLn1M+eAf81qKuNxshDtSt5Hz84rOg1M
 upYzj0XlEYgBM/J8uRYlWZ0kYyF6IZbyr7hShJZNwg6SM4iZs8sror8ar
 uo37kqG93GWlqD5YH13+E9SWbwx14xc0NqjkXOnF6pKNDDiW2fBBqpbuG g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="332772747"
X-IronPort-AV: E=Sophos;i="5.95,194,1661842800"; d="scan'208";a="332772747"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 13:20:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="874086308"
X-IronPort-AV: E=Sophos;i="5.95,194,1661842800"; d="scan'208";a="874086308"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga006.fm.intel.com with ESMTP; 18 Oct 2022 13:20:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1okt4y-009XbY-2F; Tue, 18 Oct 2022 23:20:48 +0300
Date: Tue, 18 Oct 2022 23:20:48 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH v2] drm: Remove drm_mode_config::fb_base
Message-ID: <Y08KoKYEd4fzE6wc@smile.fi.intel.com>
References: <20221018131754.351957-1-zack@kde.org>
 <20221018161201.365897-1-zack@kde.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221018161201.365897-1-zack@kde.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 18, 2022 at 12:11:51PM -0400, Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
> 
> v2: Thomas and Laurent noticed that in radeon_fb.c I forgot to set the
> info->apertures->ranges[0].base and Laurent noticed a neat little cleanup
> in the hisilicon driver as a result of the drm_mode_config::fb_base
> removal.

You need to address LKP comment.

> The fb_base in struct drm_mode_config has been unused for a long time.

> Some drivers set it and some don't leading to a very confusing state
> where the variable can't be relied upon, because there's no indication
> as to which driver sets it and which doesn't.
> 
> The only usage of fb_base is internal to two drivers so instead of trying
> to force it into all the drivers to get it into a coherent state
> completely remove it.

...

> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1778,7 +1778,6 @@ int ast_mode_config_init(struct ast_private *ast)
>  	dev->mode_config.min_width = 0;
>  	dev->mode_config.min_height = 0;
>  	dev->mode_config.preferred_depth = 24;
> -	dev->mode_config.fb_base = pci_resource_start(pdev, 0);

Unused pdev.

>  	if (ast->chip == AST2100 ||
>  	    ast->chip == AST2200 ||

I suggest to compile with `make W=1 C=1` on your side before sending v3 and
address all compiler complaints.

-- 
With Best Regards,
Andy Shevchenko


