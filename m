Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 284A9A50C5A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 21:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12D310E04C;
	Wed,  5 Mar 2025 20:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rUW0uhtw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4888110E2CB
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 20:18:01 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5496301c6afso1299753e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Mar 2025 12:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741205879; x=1741810679; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EYOlyE/UtiCRh5jP6oKp0hKwGJoeA7m+6rQ+nW6gLRw=;
 b=rUW0uhtwlvktucNIeCNjpJ26MbVfOZVB1lWiVhmbutzeKzBf9XrFrzYIdCLiXtSDpS
 3nDHru6+ZD/em5BAfhVue824Q/9zoY+CcEFlHtOCZbPf1GesaWdWQFMHfdkHwLtrk6MG
 Z5d1GgpLBPyWE5enZZ5r+3cE2iyPOTzT0P2eWuSwVlBYIPZbJr55PaHsFq9nV87jn8pl
 1rIf/gj1TpgVRHAPnRr62es88d4MFiQa+3yonzJRLUnczak+B55ivoBz41ljmWz6zPlY
 DMqUvRU8j1zxkGVW/1EW+GWnK4DDCB7SyT0NXfbPkNLQTL200IDM/tzbPmCMAf8LE4zk
 W+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741205879; x=1741810679;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EYOlyE/UtiCRh5jP6oKp0hKwGJoeA7m+6rQ+nW6gLRw=;
 b=KKtFmCvUXXHJwNkELq+zBT7PPihSYmFYIuqGGPjKoS8UBnNyUEBgMSXDTfxnEtSudU
 8RLBaqJ1b4BMZNf9xhUsF4A5zkq9lwrtr0X3DQFAo0CW0tUnN5jEo+0GsJRstrRw6FyQ
 RHRfFVF17bFuDs8kW/jHnRP1VZCcswEBfaDAXq/1ErBdyJ0v1t6h5SlAO7Q3+6ijgqT+
 KiCOUFzsxEjjjDQDfK5Yv7bT8laQyZJqL2GRMRSLdvs3p1bcgDjkK/Z+QgsU9l7Hoof/
 c7vmTlzR8ES+OH0eLIvnvJVIYPqt6yt4/k3TchxXi01LtwPxPFtYG+Eo0DWRDUZxvkV7
 9d3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCdBJ5xnSIJiwYMNuGNaqdvLZoZ10/cHDSUThaQujUwKXKBSNSXSB6Uqj7s9B6YlDiytiHswqILbo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWy0VsWm2+BxSN+gs07HuHgoJ5a6J0AUWP8MaZNp+XfYnS6vJz
 Nw76igrj2Bs82xaLrqAoUlkxbM6HuYvuWOjXHjASrXGIYTmZ/uYIsYwkjaDlLmQ=
X-Gm-Gg: ASbGnctER4PDLyj4y7UfxQk5lwkffAh/bW8W5neUCSky8pfFw0qAQEqBvFK+T+Nleaz
 OUgPbS9ypc8hlIg2SiMvrf5fAWKm/Ktd+m+DF4Pf2WTZrwTntxJ2mG371QzABFBg+jVGCMaDr1T
 F0lYOW6qhoi5w9uT10QEE+wZB7bEfsLf+pNh/51SH/ei/d4l15rZD2jURZXxetOHITXb77l2m0H
 SVyHhab6BJsAHcWT4vP20Cc7Ceh3W68pY+K8PrqNnZOoXqEXdGtmwV899m7tntpJfTYBcMvCCUe
 L8Rt9iv8ZIawskuVfFpRVJPt8S1FSOm36pUu79lkhU7KzEEuYW0RCMoC18IGcwuzHkYb/q89rsx
 NyoCFiejCSMBjbPtyTnedQaUt
X-Google-Smtp-Source: AGHT+IEIJG5E53l5u0CMWxtBFVzfwJVo6R2kbMyIYyOXI9lhhi/ulkjJEK8lyfcdv5sHAcoowToDaw==
X-Received: by 2002:a05:6512:3e08:b0:545:c51:4a03 with SMTP id
 2adb3069b0e04-54984be6443mr272551e87.11.1741205879455; 
 Wed, 05 Mar 2025 12:17:59 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5495fde71a2sm1146106e87.248.2025.03.05.12.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 12:17:58 -0800 (PST)
Date: Wed, 5 Mar 2025 22:17:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 drm-dp 3/8] drm/hisilicon/hibmc: Add dp serdes cfg in
 dp process
Message-ID: <bg5yiyru6fqnm73qctgullgsdnywdnv2zbcy72mvglxf2uttp4@v2cmuekciqgm>
References: <20250305112647.2344438-1-shiyongbang@huawei.com>
 <20250305112647.2344438-4-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305112647.2344438-4-shiyongbang@huawei.com>
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

On Wed, Mar 05, 2025 at 07:26:42PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> Add dp serdes cfg in link training process, and related adapting
> and modificating. Change some init values about training,
> because we want completely to negotiation process, so we start with
> the maximum rate and the electrical characteristic level is 0.

In the commit message there should be a mention, why are you also
changing hibmc_kms_init().

> 
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v3 -> v4:
>   - add comments for if-statement of dp_init(), suggested by Dmitry Baryshkov.
> v2 -> v3:
>   - change commit to an imperative sentence, suggested by Dmitry Baryshkov.
>   - put HIBMC_DP_HOST_SERDES_CTRL in dp_serdes.h, suggested by Dmitry Baryshkov.
> v1 -> v2:
>   - splittting the patch and add more detailed the changes in the commit message, suggested by Dmitry Baryshkov.
> ---
>  1                                             |  0
>  .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    |  1 +
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  5 ++-
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  | 32 ++++++++++++++++---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |  5 +++
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   | 12 +++----
>  6 files changed, 43 insertions(+), 12 deletions(-)
>  create mode 100644 1
> 

[...]

> @@ -121,9 +119,11 @@ static int hibmc_kms_init(struct hibmc_drm_private *priv)
>  		return ret;
>  	}
>  
> -	/* if DP existed, init DP */
> -	if ((readl(priv->mmio + HIBMC_DP_HOST_SERDES_CTRL) &
> -	     HIBMC_DP_HOST_SERDES_CTRL_MASK) == HIBMC_DP_HOST_SERDES_CTRL_VAL) {
> +	/* if the serdes reg is readable and is not equal to 0,
> +	 * DP existed, and init DP.
> +	 */

Nit: A typical format for block comments is:

  /*
   * Something Something Something
   */

Please follow it.

> +	ret = readl(priv->mmio + HIBMC_DP_HOST_SERDES_CTRL);
> +	if (ret) {
>  		ret = hibmc_dp_init(priv);
>  		if (ret)
>  			drm_err(dev, "failed to init dp: %d\n", ret);
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
