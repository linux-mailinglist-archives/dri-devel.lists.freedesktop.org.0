Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC219A6062
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 11:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706DA10E468;
	Mon, 21 Oct 2024 09:42:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="jCucMIuB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com
 [91.218.175.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5DE10E468
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 09:41:59 +0000 (UTC)
Message-ID: <a0200145-deaa-4db1-810a-827b4b11103c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1729503717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S6l9K0VABXE+0LeImmfqPp/nt0looAfEbAGIBgXZDPI=;
 b=jCucMIuBRLRE4hZMwwRR9BBJT7sIplWy8LiattcyQH+egx1uMiD9e52iFp1QG3SOcil1qQ
 gNC+9B25VGIAiHtOFBKlgJw8FT7sh7tbcJoFJPfEpR/vO/XqLc6ABIZ4uqyB0wPzelphwG
 8Gl/MyQWxKjOkOscJiOMJi9Ul0/4sKk=
Date: Mon, 21 Oct 2024 17:41:45 +0800
MIME-Version: 1.0
Subject: Re: drm/lsdc: Request PCI BAR
To: Philipp Stanner <pstanner@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241021091116.14368-1-pstanner@redhat.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20241021091116.14368-1-pstanner@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Hi,  thanks

On 2024/10/21 17:11, Philipp Stanner wrote:
> lsdc currently just ioremaps its PCI BAR with pcim_iomap(). Performing
> a region regquest additionally can make the driver more robust.
>
> Replace pcim_iomap() with the managed function pcim_iomap_region() which
> performs the request and ioremaps the BAR.
>
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>


Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>


> ---
>   drivers/gpu/drm/loongson/lsdc_drv.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c b/drivers/gpu/drm/loongson/lsdc_drv.c
> index adc7344d2f80..592d01b6767e 100644
> --- a/drivers/gpu/drm/loongson/lsdc_drv.c
> +++ b/drivers/gpu/drm/loongson/lsdc_drv.c
> @@ -230,9 +230,9 @@ lsdc_create_device(struct pci_dev *pdev,
>   	lsdc_gem_init(ddev);
>   
>   	/* Bar 0 of the DC device contains the MMIO register's base address */
> -	ldev->reg_base = pcim_iomap(pdev, 0, 0);
> -	if (!ldev->reg_base)
> -		return ERR_PTR(-ENODEV);
> +	ldev->reg_base = pcim_iomap_region(pdev, 0, "lsdc");
> +	if (IS_ERR(ldev->reg_base))
> +		return ldev->reg_base;
>   
>   	spin_lock_init(&ldev->reglock);
>   

-- 
Best regards,
Sui

