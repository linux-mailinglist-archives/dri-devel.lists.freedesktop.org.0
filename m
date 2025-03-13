Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A70A5F743
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 15:08:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1809910E8A1;
	Thu, 13 Mar 2025 14:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C50FA10E8A1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 14:08:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FEF1150C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 07:09:00 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 029143F694
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 07:08:49 -0700 (PDT)
Date: Thu, 13 Mar 2025 14:08:42 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/komeda: Remove unnecessary NULL check before
 clk_prepare_enable()
Message-ID: <Z9Lm6nSPphPfupEB@e110455-lin.cambridge.arm.com>
References: <20250313082907.2481547-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313082907.2481547-1-nichen@iscas.ac.cn>
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

On Thu, Mar 13, 2025 at 04:29:07PM +0800, Chen Ni wrote:
> clk_prepare_enable() already checked NULL clock parameter.
> Remove unneeded NULL check for clk here.

You're not saving anything here. If mdev->aclk is NULL you still end up
calling clk_prepare() and clk_enable() even if they return zero immediately.
And if you don't like the check for mdev->aclk not being NULL, you should
also move the clk_disable_unprepare() call outside the if() {...} block.

Best regards,
Liviu

> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_dev.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> index 5ba62e637a61..2b59830f0572 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> @@ -282,8 +282,7 @@ void komeda_dev_destroy(struct komeda_dev *mdev)
>  
>  	debugfs_remove_recursive(mdev->debugfs_root);
>  
> -	if (mdev->aclk)
> -		clk_prepare_enable(mdev->aclk);
> +	clk_prepare_enable(mdev->aclk);
>  
>  	for (i = 0; i < mdev->n_pipelines; i++) {
>  		komeda_pipeline_destroy(mdev, mdev->pipelines[i]);
> -- 
> 2.25.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
