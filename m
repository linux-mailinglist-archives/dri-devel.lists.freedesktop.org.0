Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7671F866BAA
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 09:03:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AFFF10EF22;
	Mon, 26 Feb 2024 08:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Jgto7MOS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9553B10EF22
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 08:03:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DD4F960F21;
 Mon, 26 Feb 2024 08:03:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55353C433C7;
 Mon, 26 Feb 2024 08:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708934587;
 bh=BeTOLJtP9AdrBcyMBpzL9OYFKJ9cR8nzGWdiyS7Gj+E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jgto7MOSPftYRs/CvdQZe0jlNQ0kX07dEjimQFDf87NFbLUPSxHE+zvNRJmt5BYxd
 ia0kX3UbVJyF5JLmyACNQ7oeCtdDoFP0pv05gp39NHtbTU9YxbBotuDfHJrIQ695BM
 31W17sEYfpVhaRn+u41BkRoauj7CIDoyNdih2UUW5ziRj4QC70BEizlNnUScGfGIa4
 dm4aUUEHrCfrvYwapscD73+vRN1TXRPWL2+Ugb7F5aFBEMoZD+oyghpzWWfgtkra9e
 B/n1ytflWFv1ObGUoz3EQnDtk3wQuoVSe8AG2TMPLmh77tQydQxDP34px7rmzIva3e
 uV44/lD/UjrXw==
Date: Mon, 26 Feb 2024 10:03:02 +0200
From: Oded Gabbay <ogabbay@kernel.org>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] accel: constify the struct device_type usage
Message-ID: <ZdxFtvl6C/k71nbZ@ogabbay-vm-u22.habana-labs.com>
References: <20240219-device_cleanup-accel-v1-1-5031e5046cff@marliere.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240219-device_cleanup-accel-v1-1-5031e5046cff@marliere.net>
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

On Mon, Feb 19, 2024 at 04:48:28PM -0300, Ricardo B. Marliere wrote:
> Since commit aed65af1cc2f ("drivers: make device_type const"), the driver
> core can properly handle constant struct device_type. Move the
> accel_sysfs_device_minor variable to be a constant structure as well,
> placing it into read-only memory which can not be modified at runtime.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
> ---
>  drivers/accel/drm_accel.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/drm_accel.c b/drivers/accel/drm_accel.c
> index 24cac4c0274b..16c3edb8c46e 100644
> --- a/drivers/accel/drm_accel.c
> +++ b/drivers/accel/drm_accel.c
> @@ -23,7 +23,7 @@ static struct idr accel_minors_idr;
>  
>  static struct dentry *accel_debugfs_root;
>  
> -static struct device_type accel_sysfs_device_minor = {
> +static const struct device_type accel_sysfs_device_minor = {
>  	.name = "accel_minor"
>  };
>  
> 
> ---
> base-commit: b401b621758e46812da61fa58a67c3fd8d91de0d
> change-id: 20240219-device_cleanup-accel-a990dc3bfbc1
> 
> Best regards,
> -- 
> Ricardo B. Marliere <ricardo@marliere.net>
> 
Applied to -next.
Thanks,
Oded

