Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C659683918E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 15:39:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FAA510E516;
	Tue, 23 Jan 2024 14:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0961710E023
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 14:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706020752; x=1737556752;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=90efiydoJUFwFSGiHQI4dQGybhe96j9FBwZwRp774Eg=;
 b=aP8sj69TbmNDIQmhYR7sTmgcDfxewODiqwkrZrF6MSL8XZvXbxsefFwj
 6fkaHo01prlhZtcVLJsv9AI+RNzpQ/Y6wae3GyZIXb71JeSEQda7wX30S
 R8NZyXCfWxpB55ONbOAuMftsBUnOWn9lurNbxi+3Qb6F6Dz5I9Un4sCTX
 /k1/C5Jji5SXgKoIvHJgBDdX/qnxz3wNJcGtrNHcVg4BDfeVWf/c+Hk0Q
 eNzgNQxosu97LgrP+8Fg8Z74WLRUb4eC63pYajdOzRvFl6qmj6gEY4ZSv
 ku3gUCWZkiBdSKvXjo3yt+PZ463y9/8wBHl7P9pPcNdjqCywilfyGTPRz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="400401586"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="400401586"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 06:39:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1117272579"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="1117272579"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 06:39:04 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 chenhuacai@kernel.org
Subject: Re: [PATCH] Revert "drivers/firmware: Move sysfb_init() from
 device_initcall to subsys_initcall_sync"
In-Reply-To: <20240123120937.27736-1-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240123120937.27736-1-tzimmermann@suse.de>
Date: Tue, 23 Jan 2024 16:39:02 +0200
Message-ID: <874jf4nmgp.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jaak Ristioja <jaak@ristioja.ee>,
 Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 23 Jan 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> This reverts commit 60aebc9559492cea6a9625f514a8041717e3a2e4.
>
> Commit 60aebc9559492cea ("drivers/firmware: Move sysfb_init() from
> device_initcall to subsys_initcall_sync") messes up initialization order
> of the graphics drivers and leads to blank displays on some systems. So
> revert the commit.
>
> To make the display drivers fully independent from initialization
> order requires to track framebuffer memory by device and independently
> from the loaded drivers. The kernel currently lacks the infrastructure
> to do so.
>
> Reported-by: Jaak Ristioja <jaak@ristioja.ee>
> Closes: https://lore.kernel.org/dri-devel/ZUnNi3q3yB3zZfTl@P70.localdomain/T/#t
> Reported-by: Huacai Chen <chenhuacai@loongson.cn>
> Closes: https://lore.kernel.org/dri-devel/20231108024613.2898921-1-chenhuacai@loongson.cn/
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10133

FWIW,

Acked-by: Jani Nikula <jani.nikula@intel.com>

but would be great to get a Tested-by from Jaak or from the gitlab issue
reporter.

Thanks.


> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Thorsten Leemhuis <regressions@leemhuis.info>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> ---
>  drivers/firmware/sysfb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
> index 82fcfd29bc4d2..3c197db42c9d9 100644
> --- a/drivers/firmware/sysfb.c
> +++ b/drivers/firmware/sysfb.c
> @@ -128,4 +128,4 @@ static __init int sysfb_init(void)
>  }
>  
>  /* must execute after PCI subsystem for EFI quirks */
> -subsys_initcall_sync(sysfb_init);
> +device_initcall(sysfb_init);

-- 
Jani Nikula, Intel
