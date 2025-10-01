Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0A6BB0B30
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 16:30:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0446110E073;
	Wed,  1 Oct 2025 14:30:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="NxofdnGp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E7D10E073
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 14:30:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759328999; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=EUnild108OCnZzqsNsahuGiOHqWTHHgQ5pr8/5bzzVVlvF44QjjE7wkGedB46qbcfFQvREIrmDUcLJx047XpvYxJrLr841xmdmoCNBB32gJJFuMzXh6299CkJoA7yLQ/gjg/QsYlkFzdiDKYxeEuZO3kuCsnsqR3hdAZhnMIQa4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759328999;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=gW6ghjs/Noql4jWTAU/UeXI3hpwk0ib99YN4wfbqQnE=; 
 b=keBRG0NxV9HccQE2qdPZ/40ZlSMF8dMDnaBBInuyNFgUPr6nWj36VTjZpVVtymg8TkQmpXoyYU4MFxAjU2F/dEWPSnINXAysc5zOXs712QMWCw1+Z9smFVB3cNUR6Sc5h/qb6rMIM6Hv+HHCUN4XwryV9SQs8THuxOTAsLgJzlQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759328999; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=gW6ghjs/Noql4jWTAU/UeXI3hpwk0ib99YN4wfbqQnE=;
 b=NxofdnGp21mOtE1X6eTTa3sD5C/ciAD0YdpomqOnxyRNUbb1zirrKai+bbmWboGK
 tZ4pYLimhHNMfmlnruPXIZ8CtXbnZz7dyjU5GzYyiTWWtGd/V59SPHSICaMytJ+0UpR
 LP8Q0cYtd1ZnhQtI+0PjRyfqgWLrs565fK6PeLQY=
Received: by mx.zohomail.com with SMTPS id 1759328998220292.9015916514884;
 Wed, 1 Oct 2025 07:29:58 -0700 (PDT)
Message-ID: <40772acf-6a9c-4049-9c27-5fa4b1312aaf@collabora.com>
Date: Wed, 1 Oct 2025 17:29:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] drm/virtio: Restore Virt-GPU res on hibernation
 resume via PM notifier
To: dongwon.kim@intel.com, dri-devel@lists.freedesktop.org
References: <20250924194755.1265531-1-dongwon.kim@intel.com>
 <20250924194755.1265531-4-dongwon.kim@intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250924194755.1265531-4-dongwon.kim@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 9/24/25 22:47, dongwon.kim@intel.com wrote:
> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> index 08f8e71a7072..e1b2cee30fa3 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> @@ -26,9 +26,12 @@
>  #include <linux/virtio.h>
>  #include <linux/virtio_config.h>
>  #include <linux/virtio_ring.h>
> +#include <linux/suspend.h>
> +#include <linux/pm_runtime.h>
>  
>  #include <drm/drm_file.h>
>  #include <drm/drm_managed.h>
> +#include <drm/drm_atomic_helper.h>

There is no need to include drm_atomic_helper.h, AFAICT. Please correct
this in v5 in addition to addressing comments from Nirmoy Das.

-- 
Best regards,
Dmitry
