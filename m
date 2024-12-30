Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EFA9FE72C
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 15:34:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B714E10E2C3;
	Mon, 30 Dec 2024 14:34:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eKGowTjq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0E210E2C3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 14:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735569275; x=1767105275;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=rIntRNnOttznCDMdhQKbsUM6ixES4VV01lYopRVfuYY=;
 b=eKGowTjqT5SyAF5U5rBLU0i4OUfjDAuSXXuXCDGjfcKE94yePMN+nCoH
 QLE19R066dPXu0ZhwL0lRFUuavQPHbxc0hnE1xrnYJj116Nyvsy4yxc1G
 tAWxDY49m7v1lXnHD88qN5GDlW6U8rCVkkq345+NcqCV+AMg8woxdca0U
 N/zIDn8BVIzd+C6I8iwqkxTPNOOADS1rZ7L2XshVKwbDvKAM4cCVGAK1i
 uap+5B/8kRc3rfXn3X7husEjbkjjF2Oz3t34kGLZb2PKe29j1kD/pte/L
 DnwZDt0sWVQiJwut0tisSArsrVIa0D4eA82iTmlY+Z2+uy0At6dNycy6O g==;
X-CSE-ConnectionGUID: QRepINs7QzWbbnDRI2aX6w==
X-CSE-MsgGUID: Elx1VpmhR9m+5MLcqyWFOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="35733559"
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; d="scan'208";a="35733559"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2024 06:34:35 -0800
X-CSE-ConnectionGUID: FJ3NU2bBQZSUHTjLGYF+WQ==
X-CSE-MsgGUID: u/MPyJTBTaO5249o6yYdvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; d="scan'208";a="101312298"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.167])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2024 06:34:33 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2] media: cec: include linux/debugfs.h and
 linux/seq_file.h where needed
In-Reply-To: <20241217100024.1858704-1-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241217100024.1858704-1-jani.nikula@intel.com>
Date: Mon, 30 Dec 2024 16:34:30 +0200
Message-ID: <871pxpp7d5.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 17 Dec 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> Having cec.h include linux/debugfs.h leads to all users of all cec
> headers include and depend on debugfs.h and its dependencies for no
> reason. Drop the include from cec.h, and include debugfs.h and
> seq_file.h where needed.
>
> Sort all the modified include lists while at it.
>
> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Ping?

>
> ---
>
> v2: Rebase, update cec-pin-error-inj.c and cec-gpio.c too
>
> Depends on commit ae19ba915eb7 ("drm/i915/display: include
> media/cec-notifier.h and linux/debugfs.h where needed") in v6.13-rc1
> ---
>  drivers/media/cec/core/cec-adap.c              | 5 +++--
>  drivers/media/cec/core/cec-core.c              | 5 +++--
>  drivers/media/cec/core/cec-pin-error-inj.c     | 3 ++-
>  drivers/media/cec/core/cec-pin.c               | 3 ++-
>  drivers/media/cec/platform/cec-gpio/cec-gpio.c | 7 ++++---
>  include/media/cec.h                            | 1 -
>  6 files changed, 14 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
> index c7d36010c890..ba6828ef540e 100644
> --- a/drivers/media/cec/core/cec-adap.c
> +++ b/drivers/media/cec/core/cec-adap.c
> @@ -7,12 +7,13 @@
>  
>  #include <linux/errno.h>
>  #include <linux/init.h>
> -#include <linux/module.h>
>  #include <linux/kernel.h>
>  #include <linux/kmod.h>
>  #include <linux/ktime.h>
> -#include <linux/slab.h>
>  #include <linux/mm.h>
> +#include <linux/module.h>
> +#include <linux/seq_file.h>
> +#include <linux/slab.h>
>  #include <linux/string.h>
>  #include <linux/types.h>
>  
> diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
> index ca0db8d457b4..e10bd588a586 100644
> --- a/drivers/media/cec/core/cec-core.c
> +++ b/drivers/media/cec/core/cec-core.c
> @@ -5,13 +5,14 @@
>   * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
>   */
>  
> +#include <linux/debugfs.h>
>  #include <linux/errno.h>
>  #include <linux/init.h>
> -#include <linux/module.h>
>  #include <linux/kernel.h>
>  #include <linux/kmod.h>
> -#include <linux/slab.h>
>  #include <linux/mm.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
>  #include <linux/string.h>
>  #include <linux/types.h>
>  
> diff --git a/drivers/media/cec/core/cec-pin-error-inj.c b/drivers/media/cec/core/cec-pin-error-inj.c
> index fc0968b9d40e..6e61a04b8168 100644
> --- a/drivers/media/cec/core/cec-pin-error-inj.c
> +++ b/drivers/media/cec/core/cec-pin-error-inj.c
> @@ -4,8 +4,9 @@
>   */
>  
>  #include <linux/delay.h>
> -#include <linux/slab.h>
>  #include <linux/sched/types.h>
> +#include <linux/seq_file.h>
> +#include <linux/slab.h>
>  
>  #include <media/cec-pin.h>
>  #include "cec-pin-priv.h"
> diff --git a/drivers/media/cec/core/cec-pin.c b/drivers/media/cec/core/cec-pin.c
> index 330d5d5d86ab..a70451d99ebc 100644
> --- a/drivers/media/cec/core/cec-pin.c
> +++ b/drivers/media/cec/core/cec-pin.c
> @@ -4,8 +4,9 @@
>   */
>  
>  #include <linux/delay.h>
> -#include <linux/slab.h>
>  #include <linux/sched/types.h>
> +#include <linux/seq_file.h>
> +#include <linux/slab.h>
>  
>  #include <media/cec-pin.h>
>  #include "cec-pin-priv.h"
> diff --git a/drivers/media/cec/platform/cec-gpio/cec-gpio.c b/drivers/media/cec/platform/cec-gpio/cec-gpio.c
> index cf64e8871fe5..50cdc557c943 100644
> --- a/drivers/media/cec/platform/cec-gpio/cec-gpio.c
> +++ b/drivers/media/cec/platform/cec-gpio/cec-gpio.c
> @@ -3,11 +3,12 @@
>   * Copyright 2017 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
>   */
>  
> -#include <linux/module.h>
> -#include <linux/interrupt.h>
>  #include <linux/delay.h>
> -#include <linux/platform_device.h>
>  #include <linux/gpio/consumer.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/seq_file.h>
>  #include <media/cec-notifier.h>
>  #include <media/cec-pin.h>
>  
> diff --git a/include/media/cec.h b/include/media/cec.h
> index 16b412b3131b..0c8e86115b6f 100644
> --- a/include/media/cec.h
> +++ b/include/media/cec.h
> @@ -10,7 +10,6 @@
>  
>  #include <linux/poll.h>
>  #include <linux/fs.h>
> -#include <linux/debugfs.h>
>  #include <linux/device.h>
>  #include <linux/cdev.h>
>  #include <linux/kthread.h>

-- 
Jani Nikula, Intel
