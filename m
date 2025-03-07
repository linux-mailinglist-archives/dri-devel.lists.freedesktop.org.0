Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEABDA56868
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 14:03:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F0D10EA1C;
	Fri,  7 Mar 2025 13:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VYcrP3Rn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DEEE10EA1D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 13:03:12 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5496078888eso2083288e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 05:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741352590; x=1741957390; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kLeGgbjVBcAPCl3aG2E0GcrYM0Yzi9aa/3xxUloO+y4=;
 b=VYcrP3RntjcNFL9LCISUDHl1MJLd1Vvuadx0+9zNyrHMTfthbrN2jSM1ZIe0n0HVEx
 YHBeTk8VXjWtsoFlwtbgAfYnDDNrzhowpckyFYKHDZbE2BJaBA9JrfFXAIwRZxcBnrpW
 hLiuYYnjeK+TJea0qBqipXBnm+XHl/b3y8g9ov1l8pPTCXainwUsElBe4AGSMejFYA/a
 MP5Lqh8KA6cJER899E6NYZtH7GyrSSIpIdwc4dnGeJYAQq/j+ZSgFikyWgFK6x3Ge+F/
 PEQPEY2MWnV9EVKvclVI01F+z/8tpGdRMrNlOdTezPw5zYh6QHw+QKv6Z9aIOMEai5jq
 wz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741352590; x=1741957390;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kLeGgbjVBcAPCl3aG2E0GcrYM0Yzi9aa/3xxUloO+y4=;
 b=wJJ5/wICA/SXj81/0WSf40sXW7zuoVmTrgItzV7SJNTdsSrSNDYVl+8jhLc0qQR/o0
 zXgxxgrXul7UDWtQYz0olaIIMKWzD7JEDQ71m3xZtw6nwBpPQRlbC3cXb+M9RTiIlH6d
 55hoUMtjL3pCdiy/PNYGgbr+X8W7Zw/HHW3WGE62ieLxgaCr3Qyt3v5KCucNYgrlYeue
 /5u2lO2ZP2a26+nESbphxzPcERCYOo6kHzQkxOmzizD9NhCmDrtPtJ8ksZjfCI7LIhOD
 GDQ6A54SuowO0ZCLoli5y02jXAriRjU0MBRYUX1s/F22yD8+9Y9R9gpKbxHjhXbvimbG
 Dd2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVm0mV58lwd7iNG1pwFZC4WWpih8V8s+iIVt2Oz7a80rcNwq0RUnh6k1yV49A9G6IUj96dlGVjr/JE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJX2ZbkCYTUvf8YQ2K5mhFRSj/CSBZBjvIxpRtuEjVbXQ4zBL1
 VdhRbvRDgt8fK2ZoaELuOcS1C7zIUghl35Unq8Rlk6Gtdc1ZHYfeEX5W19j1Z5g=
X-Gm-Gg: ASbGnct1TIfX18zHRc2qbo210sL4/yl3eOtanbBTdskcLeMMgNymnM7tr2vFmTI/BzW
 cNuCBOh6WrWcWe25H6E1WzitrMOC/9yQEsvZerNlOb49dkXPDMyz05X3OkOnmCO8J4cjmWN0JkX
 BhR5alVb0wwpEyCznZjDGbiB9GyQlMDodvpnICA0DjDANYPkJEE/BMlEuuOMz3cbl7VPXYYOe80
 5AoaTKjmZTVZNuyXHavvg0zo4Gp7vS6RYAdZLn2nD/W2prCAM6aeKjGHAU33w3UiUAUN2PpbkEl
 I2yI24RSajPM5eYdG2kNrUgIpqNPFBMLwAhEDGUPbJfZaCEYhDe4m89/Ng91b6qOVm8l1ZSThKc
 KB9PwEl+D0kHdjaNyW9dYImBJ
X-Google-Smtp-Source: AGHT+IGIJV0ELkHdf7lsKbA2N6s1XmXcUz7x/m7RVlnY4w+TAn+21DgF7ag+RAW2PzSo5ynAcv/AoQ==
X-Received: by 2002:a05:6512:ad1:b0:549:8f3a:f64 with SMTP id
 2adb3069b0e04-549910b59b2mr1123534e87.41.1741352590041; 
 Fri, 07 Mar 2025 05:03:10 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498b1bc0c2sm481749e87.162.2025.03.07.05.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 05:03:08 -0800 (PST)
Date: Fri, 7 Mar 2025 15:03:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 drm-dp 3/9] drm/hisilicon/hibmc: Add dp serdes cfg in
 dp process
Message-ID: <qig57go45vj6hnnacak3qvuzapkgymf55bp7uobn5xvfjwgcir@ue4zm7dqqrnt>
References: <20250307101640.4003229-1-shiyongbang@huawei.com>
 <20250307101640.4003229-4-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307101640.4003229-4-shiyongbang@huawei.com>
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

On Fri, Mar 07, 2025 at 06:16:34PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> Add dp serdes cfg in link training process, and related adapting
> and modificating. Change some init values about training, because we want
> completely to negotiation process, so we start with the maximum rate and
> the electrical characteristic level is 0. Becuase serdes default cfgs is
> changed and used in hibmc_kms_init(), we changed the if-statement to check
> whether the value is 0.
> 
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v4 -> v5:
>   - add commit log about hibmc_kms_init(), suggested by Dmitry Baryshkov.
>   - fix the format of block comments, suggested by Dmitry Baryshkov.
>   - add hibmc_dp_get_serdes_rate_cfg() to correct transferring serdes cfg.
> v3 -> v4:
>   - add comments for if-statement of dp_init(), suggested by Dmitry Baryshkov.
> v2 -> v3:
>   - change commit to an imperative sentence, suggested by Dmitry Baryshkov.
>   - put HIBMC_DP_HOST_SERDES_CTRL in dp_serdes.h, suggested by Dmitry Baryshkov.
> v1 -> v2:
>   - splittting the patch and add more detailed the changes in the commit message, suggested by Dmitry Baryshkov.
> ---
>  .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    |  1 +
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  5 +-
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  | 77 ++++++++++++++-----
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |  5 ++
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   | 13 ++--
>  5 files changed, 75 insertions(+), 26 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry
