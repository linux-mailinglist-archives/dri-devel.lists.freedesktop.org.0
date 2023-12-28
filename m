Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B77B81FA09
	for <lists+dri-devel@lfdr.de>; Thu, 28 Dec 2023 17:51:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658A410E0CF;
	Thu, 28 Dec 2023 16:51:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F9710E0CF
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Dec 2023 16:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703782278; x=1735318278;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XYOTYJ77YKnUFrVlaJSxWr2I93Md1Ed7ac29wDvu4Fg=;
 b=XjY3XksUTn12S+n8xcjUpru1jnLXPYoxRNT7Nu23x51x+i1cCCjzVXhy
 LkwsNAEAwf76U1xOsc7u88BaoKFd0xCKb290HKrLSWPWMOG6uhxCc0y67
 sRTspJqyA1pI0WmJorqA5eOEKqqIv3bU6RGBXA+KjTXKatgbXu3seSc+0
 Ul8TuO0DEd3JztLMjevpC6uSkwVr8Aueq+u/Vqwd77NOEZbc0LCIIYjWf
 RpIoHAtAk24M9nxAAAjQ05nMfPB8t/r5HYuG6rtYVZDLhYsnPiAb9UF/L
 S6HeKjxTCdw2L9QknUxomETMLh48x9YOGCIr2ShPkqPB0nYM0yh4U7hQe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="395455934"
X-IronPort-AV: E=Sophos;i="6.04,312,1695711600"; d="scan'208";a="395455934"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2023 08:51:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="848987390"
X-IronPort-AV: E=Sophos;i="6.04,312,1695711600"; d="scan'208";a="848987390"
Received: from noblecat-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.35.63])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2023 08:51:15 -0800
Date: Thu, 28 Dec 2023 15:04:37 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Yaxiong Tian <iambestgod@outlook.com>
Subject: Re: [PATCH] drm/debugfs: fix memory leak in drm_debugfs_remove_files()
Message-ID: <ZY2AdV1DP6YnSh6g@linux.intel.com>
References: <PUZPR01MB4775A8F67AE31D6A4927E6B7D59EA@PUZPR01MB4775.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PUZPR01MB4775A8F67AE31D6A4927E6B7D59EA@PUZPR01MB4775.apcprd01.prod.exchangelabs.com>
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
Cc: tzimmermann@suse.de, linux-kernel@vger.kernel.org, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, Yaxiong Tian <tianyaxiong@kylinos.cn>,
 airlied@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 28, 2023 at 04:07:40PM +0800, Yaxiong Tian wrote:
> From: Yaxiong Tian <tianyaxiong@kylinos.cn>
> 
> The dentry returned by debugfs_lookup() needs to be released by calling
> dput() which is missing in drm_debugfs_remove_files(). Fix this by adding
> dput().
> 
> Signed-off-by: Yaxiong Tian <tianyaxiong@kylinos.cn>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_debugfs.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index f4715a67e340..4d299152c302 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -277,6 +277,7 @@ int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
>  
>  		drmm_kfree(minor->dev, d_inode(dent)->i_private);
>  		debugfs_remove(dent);
> +		dput(dent);
>  	}
>  	return 0;
>  }
> -- 
> 2.25.1
> 
