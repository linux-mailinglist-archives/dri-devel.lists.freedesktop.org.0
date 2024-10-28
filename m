Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BA09B2D87
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 11:54:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 168BD10E465;
	Mon, 28 Oct 2024 10:54:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Xcg4q1Pz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4817210E465
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 10:54:49 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-539e4b7409fso4033194e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 03:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730112887; x=1730717687; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hIp8p1y9OYLmueWzt8+7yDMvWFfo7oDb41HmupTIZZA=;
 b=Xcg4q1PzieOFOAnUtXovglmiM70Fc+UUi/+PwOzgZu815DXwAz4cYNNSd5VepQdiml
 x1Rz+yGgXyBQjHxi0mda2lCUwQ0ii/2IM9BM3T5KCM4nDV01iV2/ExYRzq8hAlz+oWxQ
 6urWolC3vqsfGn8vCUX2odwm6i5w/I9KgHIJNSdTqPm5uCkMGks+kGlSZ3T42eXKQ2uW
 RlLZBpR9nG+7I+eSgbPQRvB6A+/J+CUj9h3Xe+dt3Pv8qZx6MFfYyct3zDDkaTXeu5Sq
 ySzfmgUUc/fkFAH8u58iy9sTBwNG+YXYr/tDo0GCEG4DA0zk4hPgENg0N4hqeoSTmt62
 gyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730112887; x=1730717687;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hIp8p1y9OYLmueWzt8+7yDMvWFfo7oDb41HmupTIZZA=;
 b=VZrIXkVGuOP3xsO4RO8LOhH2gVrrZUGXLoTHLyMinrLdJecYRnfMqWDJLBrBrYrGa2
 CVxeVIvHE6ny18eEPSk1lG+cDujiZ7O74aU6JJAw6WqbnzJ7l5JAkCZ3TQBzNAU128gQ
 BCG0Y6s5zEebPCBSjp7bfV5DkXIZMxo9i1rit9gfjYRb66ab4Sec6UmokWUZImr+IvJR
 J8RcawDGnGSI5PYZmzP53l7dWmc887cD4sSPEOcjejtqkekSe3k7EzI2ygpegVIyl90Y
 2RNbCF3NPmRehyMa6B6y1qS77Qnp2rQQTE/CAb5NNEZ8ACGl0/iykWz82edQZ+zozzwO
 QNrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVo5JIzRu2O+bQ4tKl53YfCrbFKVedBXOExAY4SqvCEbys6wSoWTzRm/QwXnIpMsotIQMWQNxvJoqY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQs7t0eu4SlUo4RiHrnk+emKt2NSdNB6arRGV7f5AayZG5GXJL
 PXn7k/hMJMUC/p9u7jrFQGDi9XIt3lwbp1Q4G6hMrqwTszJiIz204U9mokHwlGI=
X-Google-Smtp-Source: AGHT+IEvzbs7iCzZXXfk6Ann3ZL3OW88AuVYQtULh9f4OSje5nI375zcEnnbchgjpRTSYmWkTUgo6Q==
X-Received: by 2002:a05:6512:1107:b0:539:fbf8:5735 with SMTP id
 2adb3069b0e04-53b33df7378mr2053614e87.8.1730112887274; 
 Mon, 28 Oct 2024 03:54:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53b2e10a7efsm1043915e87.56.2024.10.28.03.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 03:54:46 -0700 (PDT)
Date: Mon, 28 Oct 2024 12:54:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: Yongbang Shi <shiyongbang@huawei.com>, xinliang.liu@linaro.org, 
 tiantao6@hisilicon.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 kong.kongxinwei@hisilicon.com, oe-kbuild-all@lists.linux.dev,
 liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 drm-dp 1/4] drm/hisilicon/hibmc: add dp aux in hibmc
Message-ID: <5sb3loc23nf45up3tx3z7nq2s4hvevhxdwhq7t6w5hrwnyw7vi@kjg4vshkuvjm>
References: <20241022124148.1952761-2-shiyongbang@huawei.com>
 <202410250305.UHKDhtxy-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202410250305.UHKDhtxy-lkp@intel.com>
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

On Fri, Oct 25, 2024 at 03:52:49AM +0800, kernel test robot wrote:
> Hi Yongbang,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on drm-misc/drm-misc-next]
> [also build test ERROR on linus/master v6.12-rc4 next-20241024]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Yongbang-Shi/drm-hisilicon-hibmc-add-dp-aux-in-hibmc/20241022-204925
> base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> patch link:    https://lore.kernel.org/r/20241022124148.1952761-2-shiyongbang%40huawei.com
> patch subject: [PATCH V2 drm-dp 1/4] drm/hisilicon/hibmc: add dp aux in hibmc
> config: arm64-randconfig-004-20241024 (https://download.01.org/0day-ci/archive/20241025/202410250305.UHKDhtxy-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410250305.UHKDhtxy-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410250305.UHKDhtxy-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    aarch64-linux-ld: drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.o: in function `dp_aux_init':
> >> drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c:154: multiple definition of `dp_aux_init'; drivers/gpu/drm/msm/dp/dp_aux.o:dp_aux.c:(.text+0x8a0): first defined here

I think both of us should switch to a more generic names. I'll send a
patchset for msm/dp, please use some less generic prefix for hibmc
driver.

> 
> 
> vim +154 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
> 
>    152	
>    153	void dp_aux_init(struct dp_dev *dp)
>  > 154	{
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

-- 
With best wishes
Dmitry
