Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 906988A4772
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 06:39:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5794510E8F6;
	Mon, 15 Apr 2024 04:39:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GoriXNdC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E2610E054;
 Mon, 15 Apr 2024 04:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713155960; x=1744691960;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=xAD1aFqnzl73taL/FeC1hAcDSI9TFg3roUcmuXf1xsA=;
 b=GoriXNdC6bziqrg6o9ps73sUmXrbXqLYSwFAxynCEKbMLlztKHJOsHzp
 VkLsDPQ6A3RX9hAla+ouez1l2b5iF6xrQhd+iTPEsSeAZYjJcba6K0L67
 enqck7oauUmKHe7MeuNTOhWQeWIWcbA5uwdhHsbvUxr1AM5G6karV/hbj
 J4Lnr2buOhRe9wxrfDUfHkvAOim7SyM9EBGafrqWkCJXdsboBM40B3hmC
 1VEt2RlYXXbR/EwTQuTNuuXWL/ajOhGd4MJlITQih0oA07KC+Es9xcGTE
 FkMp583FE9N3s5J2Mi1hCdKwO5bUnUB2+8yprkzZDZRUEjDR5xI5NAxDx g==;
X-CSE-ConnectionGUID: nCxwdPA0RoquElvQOw2OAw==
X-CSE-MsgGUID: pWZxqbg9Qsi03XjmRE5jdw==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8698001"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="8698001"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2024 21:39:19 -0700
X-CSE-ConnectionGUID: uaGur8UmRtq6WiCDcluQ+A==
X-CSE-MsgGUID: ZkKyovpxSSWgNNGzIdpGew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208";a="26596290"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2024 21:39:16 -0700
Message-ID: <390e30de-3967-41c0-9e38-6421be1b6a1e@linux.intel.com>
Date: Mon, 15 Apr 2024 10:12:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm: add devm release action
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20240402085859.1591264-1-aravind.iddamsetty@linux.intel.com>
 <20240402085859.1591264-2-aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20240402085859.1591264-2-aravind.iddamsetty@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi Thomas,

Could you share your thoughts on this please.

Thanks,
Aravind.


On 02/04/24 14:28, Aravind Iddamsetty wrote:
> In scenarios where drm_dev_put is directly called by driver we want to
> release devm_drm_dev_init_release action associated with struct
> drm_device.
>
> v2: Directly expose the original function, instead of introducing a
> helper (Rodrigo)
>
> Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_drv.c | 6 ++++++
>  include/drm/drm_drv.h     | 2 ++
>  2 files changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 243cacb3575c..ba60cbb0725f 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -714,6 +714,12 @@ static int devm_drm_dev_init(struct device *parent,
>  					devm_drm_dev_init_release, dev);
>  }
>  
> +void devm_drm_dev_release_action(struct drm_device *dev)
> +{
> +	devm_release_action(dev->dev, devm_drm_dev_init_release, dev);
> +}
> +EXPORT_SYMBOL(devm_drm_dev_release_action);
> +
>  void *__devm_drm_dev_alloc(struct device *parent,
>  			   const struct drm_driver *driver,
>  			   size_t size, size_t offset)
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 8878260d7529..fa9123684874 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -444,6 +444,8 @@ struct drm_driver {
>  	const struct file_operations *fops;
>  };
>  
> +void devm_drm_dev_release_action(struct drm_device *dev);
> +
>  void *__devm_drm_dev_alloc(struct device *parent,
>  			   const struct drm_driver *driver,
>  			   size_t size, size_t offset);
