Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B03B28CE9
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 12:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F71A10E2EA;
	Sat, 16 Aug 2025 10:31:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BFvZfCLu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A38010E2EA
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 10:31:42 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-45a1b05ac1eso11092285e9.1
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 03:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755340301; x=1755945101; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=e8x7+nGgNL/S9BgtpwRdqXmLHGlwLdc6y+hYTmxtYuY=;
 b=BFvZfCLuBng6t6WXX0MJ3aBItFVr2Ejj5ezqC/yqSUJq3F6ProKb4SGsOJVN1FLK2p
 ZcJOIYo74vIkWBQFgFtxJRu/MPH8lBG3/5Yxb8IjZIeahu3uB9okMSsfwu278e3PT9Za
 Pi4t3AgHhfgCXXef3n9/GOZjahSq62QlngdfJl1SGaEms6uH7YwMEM2hoUlkQxwvUcgM
 ApnWqHxRjJVsimAEkI/zXTcAngy+lzLwI46rphcJt42IIK35vRlChqBNxpSHE++efG9J
 iKLQquWwsxianV3bjErjxRKDAhsNqUUAb0gWPZT0jY2Ua5izFMAcsYLPz8RdL+eZG8HI
 /upg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755340301; x=1755945101;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e8x7+nGgNL/S9BgtpwRdqXmLHGlwLdc6y+hYTmxtYuY=;
 b=Oc9tmneV7OmD1qQuBd29dvGeKJrR/H0PjxA0RT3+G/1Zvru/jvv6Agv+WrWB5DM0Ak
 fi1shiAen38AwqnpkhRAtCsUS5u1rihlVnCmC38gYCTmPp67OeaVvGjgKrzYVYvZw2t1
 B47Cx/vgkjSTGqGM3j9ciw/KuefqHCVOQjWlFjzJCLdGgKAYXwrckbQ2UEjvICIBAq6Q
 d4G9kEjSlzTLk+Kbp6X3/m0vbMvC6LNH8632N4OP+03tN7na7Hk8O8R5/RNUdzo1LfxP
 UR42HPJbbHRFHoLnFdKRtOeJHERHRqJYWW8XyfwuHgHaWu6/bNNSUyQebMd6lQBlMrI7
 /cWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7I71sYDs/YUpMcyOwkc7nRXyXEnZ65GNyYqfOWB3ADm0BH+vbM10SL6Wt/u4gYmSnUAdSLAjqZCA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbziSAKfBwiuMnoSQpFb1VB7qFr0dQZNQJ1+fnSzvuchZbpS1e
 ELoDROqgfevVbkcGNS6ahhcBekq/UxHvcu2+NcvowYSKKW6JtjMYvb95PUDZr2b6SL0=
X-Gm-Gg: ASbGncsfSLwk1VcvCqHPacB23fFbe6dyU8BUnAEgfSYEosOt443Ha6y2zrB5BWcHdRq
 WdUey6huMzrTzOvolC4Pe4DXF+9WhATN1eLf6xdglWCV+eMSa9r/KLkd6g/kRj5XwXbQMt2Y439
 AZvf2tDWipYw5osXu805+QqwA1gPWxKFfvy9MR4xO2ocIa9lIEyNh3PvFQJ0swhzhQJBwfqJzRZ
 4oJpGzmWo4usAG0zPb7aHbpipm0b+a54I1cPZlN6h0rcCF5tSveqNs5XaYKJqE8aAtsbNvIDaQA
 xZ9INt+qIgoP7Q1v3nwwJXGPYEU9br6y8VPhy5+rNjZqqHJfehXPmGPBA47bgtNGH/ln/P20qlk
 fsDWlljvuv39k0Oe8iPeDeHmj11eiHW3KTg91goN5PKw=
X-Google-Smtp-Source: AGHT+IGVWDeZL9smLLF1o3RVvY86c9i6C0MTi35gNvuamk+XUR6fXJiX36W4beKN48vGdOJoWRLrlA==
X-Received: by 2002:a05:600c:1c20:b0:456:1e5a:8879 with SMTP id
 5b1f17b1804b1-45a217fbe65mr38114945e9.9.1755340300623; 
 Sat, 16 Aug 2025 03:31:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45a1cc22739sm96669115e9.27.2025.08.16.03.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 03:31:40 -0700 (PDT)
Date: Sat, 16 Aug 2025 13:31:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Damon Ding <damon.ding@rock-chips.com>,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com, dmitry.baryshkov@oss.qualcomm.com,
 l.stach@pengutronix.de, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v4 13/13] drm/bridge: analogix_dp: Apply panel_bridge
 helper
Message-ID: <202508161345.sfsLHzY7-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814104753.195255-14-damon.ding@rock-chips.com>
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

Hi Damon,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Damon-Ding/drm-bridge-analogix_dp-Formalize-the-struct-analogix_dp_device/20250814-185009
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250814104753.195255-14-damon.ding%40rock-chips.com
patch subject: [PATCH v4 13/13] drm/bridge: analogix_dp: Apply panel_bridge helper
config: hexagon-randconfig-r072-20250815 (https://download.01.org/0day-ci/archive/20250816/202508161345.sfsLHzY7-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508161345.sfsLHzY7-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1595 analogix_dp_bind() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +1595 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c

152cce0006abf7e Marek Szyprowski 2020-03-10  1560  int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
152cce0006abf7e Marek Szyprowski 2020-03-10  1561  {
41dc71b87962d41 Damon Ding       2025-08-14  1562  	struct drm_bridge *bridge = &dp->bridge;
152cce0006abf7e Marek Szyprowski 2020-03-10  1563  	int ret;
152cce0006abf7e Marek Szyprowski 2020-03-10  1564  
3424e3a4f844c0a Yakir Yang       2016-03-29  1565  	dp->drm_dev = drm_dev;
3424e3a4f844c0a Yakir Yang       2016-03-29  1566  	dp->encoder = dp->plat_data->encoder;
3424e3a4f844c0a Yakir Yang       2016-03-29  1567  
6cba3fe433415b2 Lyude Paul       2021-04-23  1568  	dp->aux.drm_dev = drm_dev;
0d97ad03f4220ca Tomeu Vizoso     2016-08-24  1569  
0d97ad03f4220ca Tomeu Vizoso     2016-08-24  1570  	ret = drm_dp_aux_register(&dp->aux);
2d192f4a3acc1c6 Lucas Stach      2024-06-19  1571  	if (ret) {
2d192f4a3acc1c6 Lucas Stach      2024-06-19  1572  		DRM_ERROR("failed to register AUX (%d)\n", ret);
c71db051142a74b Damon Ding       2025-03-10  1573  		return ret;
2d192f4a3acc1c6 Lucas Stach      2024-06-19  1574  	}
0d97ad03f4220ca Tomeu Vizoso     2016-08-24  1575  
41dc71b87962d41 Damon Ding       2025-08-14  1576  	bridge->ops = DRM_BRIDGE_OP_DETECT |
41dc71b87962d41 Damon Ding       2025-08-14  1577  		      DRM_BRIDGE_OP_EDID |
41dc71b87962d41 Damon Ding       2025-08-14  1578  		      DRM_BRIDGE_OP_MODES;
41dc71b87962d41 Damon Ding       2025-08-14  1579  	bridge->of_node = dp->dev->of_node;
41dc71b87962d41 Damon Ding       2025-08-14  1580  	bridge->type = DRM_MODE_CONNECTOR_eDP;
41dc71b87962d41 Damon Ding       2025-08-14  1581  	ret = devm_drm_bridge_add(dp->dev, &dp->bridge);
41dc71b87962d41 Damon Ding       2025-08-14  1582  	if (ret)
41dc71b87962d41 Damon Ding       2025-08-14  1583  		goto err_unregister_aux;
41dc71b87962d41 Damon Ding       2025-08-14  1584  
41dc71b87962d41 Damon Ding       2025-08-14  1585  	ret = drm_bridge_attach(dp->encoder, bridge, NULL, 0);
3424e3a4f844c0a Yakir Yang       2016-03-29  1586  	if (ret) {
3424e3a4f844c0a Yakir Yang       2016-03-29  1587  		DRM_ERROR("failed to create bridge (%d)\n", ret);
2d192f4a3acc1c6 Lucas Stach      2024-06-19  1588  		goto err_unregister_aux;
3424e3a4f844c0a Yakir Yang       2016-03-29  1589  	}
3424e3a4f844c0a Yakir Yang       2016-03-29  1590  
dbd8040a6d0dedc Damon Ding       2025-08-14  1591  	if (dp->plat_data->panel) {
dbd8040a6d0dedc Damon Ding       2025-08-14  1592  		dp->plat_data->next_bridge = devm_drm_panel_bridge_add(dp->dev,
dbd8040a6d0dedc Damon Ding       2025-08-14  1593  								       dp->plat_data->panel);
dbd8040a6d0dedc Damon Ding       2025-08-14  1594  		if (IS_ERR(dp->plat_data->next_bridge)) {
dbd8040a6d0dedc Damon Ding       2025-08-14 @1595  			ret = PTR_ERR(bridge);

Wrong variable.  s/bridge/dp->plat_data->next_bridge/.

dbd8040a6d0dedc Damon Ding       2025-08-14  1596  			goto err_unregister_aux;
dbd8040a6d0dedc Damon Ding       2025-08-14  1597  		}
dbd8040a6d0dedc Damon Ding       2025-08-14  1598  	}
dbd8040a6d0dedc Damon Ding       2025-08-14  1599  
dbd8040a6d0dedc Damon Ding       2025-08-14  1600  	ret = drm_bridge_attach(dp->encoder, dp->plat_data->next_bridge, bridge,
dbd8040a6d0dedc Damon Ding       2025-08-14  1601  				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
dbd8040a6d0dedc Damon Ding       2025-08-14  1602  	if (ret) {
dbd8040a6d0dedc Damon Ding       2025-08-14  1603  		dev_err(dp->dev, "failed to attach following panel or bridge (%d)\n", ret);
dbd8040a6d0dedc Damon Ding       2025-08-14  1604  		goto err_unregister_aux;
dbd8040a6d0dedc Damon Ding       2025-08-14  1605  	}
dbd8040a6d0dedc Damon Ding       2025-08-14  1606  
152cce0006abf7e Marek Szyprowski 2020-03-10  1607  	return 0;
3424e3a4f844c0a Yakir Yang       2016-03-29  1608  
2d192f4a3acc1c6 Lucas Stach      2024-06-19  1609  err_unregister_aux:
2d192f4a3acc1c6 Lucas Stach      2024-06-19  1610  	drm_dp_aux_unregister(&dp->aux);
f0a8b49c03d22a5 Marek Szyprowski 2016-12-30  1611  
152cce0006abf7e Marek Szyprowski 2020-03-10  1612  	return ret;
3424e3a4f844c0a Yakir Yang       2016-03-29  1613  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

