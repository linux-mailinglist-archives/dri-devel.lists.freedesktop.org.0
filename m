Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3ECE94D838
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 22:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 523C010EA02;
	Fri,  9 Aug 2024 20:48:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kkG67kbi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E7D10EA02
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 20:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723236538; x=1754772538;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LQRpGUBrP4WLVH27RipF1PGbuYLU8ZOry99cQeZsWgc=;
 b=kkG67kbi+AmK42UkUQbQ+l6W+i4z7RlhA4g9mHawUoTK8sUZiqFpOb6M
 sgyRRMxvg8BPC+pMHUHAd7QzE3sqcB/DK+Sv6N3DhFkwhewVqna0IaPlI
 fvo4ZXqr8CszCndrdcIxc/WfQ/i45jjYOw9e8tVqnOdqXIofITceXW6aU
 L0X9/t6rZafFhj0VMLeMXijcbuzowHcIxVW0pNpMBGhLYiuB7wSAvSxQ2
 JJDuroIlogLKyKiqTcK3u19MnXcXPo5xK2MfzO/THUyvKXdqo99pD/Zu0
 NK4/1lKei8FJJK9ZvirdWV1lqBokCm65cEYfQv61AyOvNgupFmiGoFW11 A==;
X-CSE-ConnectionGUID: 9YtPI/C7QMy3rxFzt6eSpw==
X-CSE-MsgGUID: VBOMieYWS8GI0vGxofsI9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21086019"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="21086019"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 13:48:57 -0700
X-CSE-ConnectionGUID: nZZWNeEBS0uGLtOZIanY+w==
X-CSE-MsgGUID: UOaZEDifTu2Qhnfc1lsqJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="88528687"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
 by fmviesa001.fm.intel.com with ESMTP; 09 Aug 2024 13:48:52 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1scWXZ-0009Fz-0o;
 Fri, 09 Aug 2024 20:48:49 +0000
Date: Sat, 10 Aug 2024 04:48:46 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Mark Yao <markyao0591@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 kernel@collabora.com, Alexandre ARNOUD <aarnoud@me.com>,
 Luis de Arquer <ldearquer@gmail.com>, Algea Cao <algea.cao@rock-chips.com>
Subject: Re: [PATCH v2 3/3] drm/rockchip: Add basic RK3588 HDMI output support
Message-ID: <202408100456.yY6K40pK-lkp@intel.com>
References: <20240801-b4-rk3588-bridge-upstream-v2-3-9fa657a4e15b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801-b4-rk3588-bridge-upstream-v2-3-9fa657a4e15b@collabora.com>
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

Hi Cristian,

kernel test robot noticed the following build errors:

[auto build test ERROR on 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0]

url:    https://github.com/intel-lab-lkp/linux/commits/Cristian-Ciocaltea/dt-bindings-display-rockchip-Add-schema-for-RK3588-HDMI-TX-Controller/20240802-173018
base:   1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
patch link:    https://lore.kernel.org/r/20240801-b4-rk3588-bridge-upstream-v2-3-9fa657a4e15b%40collabora.com
patch subject: [PATCH v2 3/3] drm/rockchip: Add basic RK3588 HDMI output support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240810/202408100456.yY6K40pK-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240810/202408100456.yY6K40pK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408100456.yY6K40pK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c:18:10: fatal error: drm/bridge/dw_hdmi_qp.h: No such file or directory
      18 | #include <drm/bridge/dw_hdmi_qp.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +18 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c

    17	
  > 18	#include <drm/bridge/dw_hdmi_qp.h>
    19	#include <drm/drm_bridge_connector.h>
    20	#include <drm/drm_of.h>
    21	#include <drm/drm_probe_helper.h>
    22	#include <drm/drm_simple_kms_helper.h>
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
