Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 350539EA40C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 02:03:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A10210E0CA;
	Tue, 10 Dec 2024 01:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rwztfl74";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BBFA10E0CA
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 01:03:10 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-53e3a5fa6aaso2546973e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 17:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733792588; x=1734397388; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wuMOGX85l5nyRxt+UxCQ7JHkxB5r1qM4UgPGN4w1SHo=;
 b=rwztfl74nCABibYztTpspdl76M+sj+mbK2nPxZhkVzrbCRJvrHC3JmxAOtdggQAzHh
 9pJ8UNzwBF9Xux/nto/3bvrCmCiMZQlqTrDHbYcPrJJ+PikKws81rA2AzSWs86fIYkQU
 rIJeL66TrZV15AeAbTB6yeleRKc0jeZgcxF8Hy5cYCKCcs0kalQoNCvCiZ2LoZ7zPUAh
 lboMlxSo0Y/GQkh1MwIaTywUKMdS3DMOebhSN39txRqLLeDinapG7XVTLnsk7C7mWVyB
 7NMRWGNln3De0QkFiVDQlBOoNTVGWJAkShu5IaSdbOjOKv9MTdwc4LdYyjTQonYVTQmR
 33MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733792588; x=1734397388;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wuMOGX85l5nyRxt+UxCQ7JHkxB5r1qM4UgPGN4w1SHo=;
 b=REOP5/HBRHfikRrAbgnxdqTKdhuQgz8/7koVVozWoEAuSYu4ICSrxq76xyhn4TZ5JN
 QQ7vvCvpX1LpEIRO+aPby1hLLxXnMey5yCcJXg8T+SiPNYxyCBwKvp6gJfJcdx2PfyVb
 rtVqwE36VWF/ucdQmsco58isYobCVFGH+ttAa6c9c4ZobG5nxiwUmWrvFxmPzNVxjnrj
 8t7VLcxEKkmtiu4YwBsaBz/Qes1TptQLILGji2wtcCX2jBcmGrg7b5Au9v8EhZX4YEGt
 egZbOPwQpx/k7MplLXrRNHKLPuPFtVXGDLQPTNU52kB+0TeGFvPv+BGNvMmKMegQ12/o
 WYYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcGTHrAxslNzJi0NaU+iIWKSDJJMjSU+yA2GVm0e26sWi+Mh415QMUBGX3dM6vSJ8N93JW9XoeBi8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFG6zeIFmdrts3l8obyQV99+gpJeZs0MRkbKi5QriZbdq73DhM
 WrV3NLYkK7qVVHZKt4MPlairsZzbJedM2qSnzzaUu/lqX6Vw+7/rlEA+yyNW9pg=
X-Gm-Gg: ASbGncvGJY/zLGfi4/IvkAv9/E8IYdj6HZJM/TCMGgg2EGI+vkOkx0oJVDkF4hoCPRG
 N/CRnwIB+/Fd6eqC5eNVpYuWNhPG9D94v5K4msnrTmlHsroMbnF2+Ol+Re9LvnCgLVwuAa1MmWo
 0V3cLPN8Vx0HxdOwlgp6T7upWddL7hg6TVG0go6lf3xOs4fi4vgvwTA5sjKPOr1XTpdTaN7J4Ba
 cMGEJZoUHkgTeVcRHsTgtOPPr5/0yC8AwAIiG/qB40B7wLnPQKNKK6W+MZ3HHbnSh77eqKv8X8Q
 6LfD3pfSMbWnt0ZLe+zEnz23tXquNE+4tw==
X-Google-Smtp-Source: AGHT+IE8VzIRsoOMMK5ni+Jq+hPyqKRMlOBk8PtNU6SADe1Jqc+MHdxWquf3NeGRrAWy95PtMn2ddA==
X-Received: by 2002:a05:6512:4005:b0:53e:39ba:fb3b with SMTP id
 2adb3069b0e04-540252183cdmr348409e87.21.1733792588450; 
 Mon, 09 Dec 2024 17:03:08 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e34916befsm1143550e87.120.2024.12.09.17.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 17:03:07 -0800 (PST)
Date: Tue, 10 Dec 2024 03:03:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 drm-dp 2/5] drm/hisilicon/hibmc: add dp link moduel in
 hibmc
Message-ID: <aj6yh5jgxmscmmdt7djbmr6h3bwhelvisoyvkfwfniahwididi@4l2krysjdg7l>
References: <20241209144840.1933265-1-shiyongbang@huawei.com>
 <20241209144840.1933265-3-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209144840.1933265-3-shiyongbang@huawei.com>
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

On Mon, Dec 09, 2024 at 10:48:37PM +0800, Yongbang Shi wrote:
> From: baihan li <libaihan@huawei.com>
> 
> Add link training process functions in this moduel.
> 
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> Changelog:
> v6 -> v7:
>   - deleteing unset fields in struct hibmc_link_cap, suggested by Dmitry Baryshkov.
>   - using macro instead of constants in hibmc_dp_link_training_configure(), suggested by Dmitry Baryshkov.
> v5 -> v6:
>   - using drm_dbg_dp() to print debug info instead of drm_info(), suggested by Dmitry Baryshkov.
> v3 -> v4:
>   - optimizing hibmc_dp_link_get_adjust_train() to delete for loop, suggested by Dmitry Baryshkov.
>   - changing ELNRNG to EIO error code, suggested by Dmitry Baryshkov.
>   - deleting meaningless macro, suggested by Dmitry Baryshkov.
>   - fixing build errors reported by kernel test robot <lkp@intel.com>
>     Closes: https://lore.kernel.org/oe-kbuild-all/202411041559.WIfxRN6n-lkp@intel.com/
> v2 -> v3:
>   - using switchcase in dp_link_reduce_lane, suggested by Dmitry Baryshkov.
>   - deleting dp_link_pattern2dpcd function and using macros directly, suggested by Dmitry Baryshkov.
>   - deleting EFAULT error codes, suggested by Dmitry Baryshkov.
> v1 -> v2:
>   - using drm_dp_* functions implement dp link training process, suggested by Jani Nikula.
>   - fix build errors reported by kernel test robot <lkp@intel.com>
>     Closes: https://lore.kernel.org/oe-kbuild-all/202410031735.8iRZZR6T-lkp@intel.com/
>   v1:https://lore.kernel.org/all/20240930100610.782363-1-shiyongbang@huawei.com/
> ---
>  drivers/gpu/drm/hisilicon/hibmc/Makefile     |   2 +-
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h |  21 ++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c | 329 +++++++++++++++++++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h  |   8 +
>  4 files changed, 359 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
