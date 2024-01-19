Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EAB8330B1
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 23:12:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA23010EA8A;
	Fri, 19 Jan 2024 22:12:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC2BF10EA8A;
 Fri, 19 Jan 2024 22:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705702346; x=1737238346;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=A0nh44Thyix5l0t0txwwi1AF+uP8BXmjFVt/E9X/HJM=;
 b=dKDzh2GGyUiSo/etHPydQbNnG9RAaJIgFnJu9mux6dvTwBRMDLGWEMFH
 89oV3jL7stKT6hemSTBjiQX+FX9WHs/WmFUQN9pksLXI5v4XdjLH6PPux
 VI+qmuXRjf8bcsExq24EQhFR86QvcDuUJ8FpYtsJozWB1Nh1BWXgOpj2M
 UPJtFzU83DbWz57qMZ597w2POWIX5tA4RzP8Vby7CHIPVHN8VrM7VcfEp
 /CvR35sIDcBzP/CGW60r+5xbOoZG6P9X1R+/QDceDbSo6qkSIpQwgy0Vs
 TeooeB6dQ8l7Iu/UXlYgtXbW7UCnj5sNXiTkgKWt7Y52gTVWN6tDJ6eCU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="752692"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="752692"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 14:12:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="661671"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 19 Jan 2024 14:12:16 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rQx5y-0004SY-0u;
 Fri, 19 Jan 2024 22:12:14 +0000
Date: Sat, 20 Jan 2024 06:12:11 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/atomic: Allow drivers to write their own plane
 check for async flips
Message-ID: <202401200526.Xggix2DE-lkp@intel.com>
References: <20240116045159.1015510-2-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240116045159.1015510-2-andrealmeid@igalia.com>
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
Cc: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 kernel-dev@igalia.com, 'Marek =?utf-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
 llvm@lists.linux.dev, Xaver Hugl <xaver.hugl@gmail.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, daniel@ffwll.ch,
 oe-kbuild-all@lists.linux.dev, alexander.deucher@amd.com,
 Dave Airlie <airlied@gmail.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi André,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-tip/drm-tip linus/master next-20240119]
[cannot apply to drm-intel/for-linux-next-fixes v6.7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/drm-atomic-Allow-drivers-to-write-their-own-plane-check-for-async-flips/20240116-125406
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240116045159.1015510-2-andrealmeid%40igalia.com
patch subject: [PATCH 1/2] drm/atomic: Allow drivers to write their own plane check for async flips
config: hexagon-randconfig-002-20240119 (https://download.01.org/0day-ci/archive/20240120/202401200526.Xggix2DE-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d92ce344bf641e6bb025b41b3f1a77dd25e2b3e9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401200526.Xggix2DE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401200526.Xggix2DE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/drm_atomic_uapi.c:31:
   In file included from include/drm/drm_atomic.h:31:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:35:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/gpu/drm/drm_atomic_uapi.c:31:
   In file included from include/drm/drm_atomic.h:31:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:35:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/gpu/drm/drm_atomic_uapi.c:31:
   In file included from include/drm/drm_atomic.h:31:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:35:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/gpu/drm/drm_atomic_uapi.c:1149:30: warning: variable 'old_val' is uninitialized when used here [-Wuninitialized]
    1149 |                                                              obj, prop_value, old_val);
         |                                                                               ^~~~~~~
   drivers/gpu/drm/drm_atomic_uapi.c:1087:13: note: initialize the variable 'old_val' to silence this warning
    1087 |         u64 old_val;
         |                    ^
         |                     = 0
   7 warnings generated.


vim +/old_val +1149 drivers/gpu/drm/drm_atomic_uapi.c

  1078	
  1079	int drm_atomic_set_property(struct drm_atomic_state *state,
  1080				    struct drm_file *file_priv,
  1081				    struct drm_mode_object *obj,
  1082				    struct drm_property *prop,
  1083				    u64 prop_value,
  1084				    bool async_flip)
  1085	{
  1086		struct drm_mode_object *ref;
  1087		u64 old_val;
  1088		int ret;
  1089	
  1090		if (!drm_property_change_valid_get(prop, prop_value, &ref))
  1091			return -EINVAL;
  1092	
  1093		switch (obj->type) {
  1094		case DRM_MODE_OBJECT_CONNECTOR: {
  1095			struct drm_connector *connector = obj_to_connector(obj);
  1096			struct drm_connector_state *connector_state;
  1097	
  1098			connector_state = drm_atomic_get_connector_state(state, connector);
  1099			if (IS_ERR(connector_state)) {
  1100				ret = PTR_ERR(connector_state);
  1101				break;
  1102			}
  1103	
  1104			if (async_flip) {
  1105				ret = drm_atomic_connector_get_property(connector, connector_state,
  1106									prop, &old_val);
  1107				ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
  1108				break;
  1109			}
  1110	
  1111			ret = drm_atomic_connector_set_property(connector,
  1112					connector_state, file_priv,
  1113					prop, prop_value);
  1114			break;
  1115		}
  1116		case DRM_MODE_OBJECT_CRTC: {
  1117			struct drm_crtc *crtc = obj_to_crtc(obj);
  1118			struct drm_crtc_state *crtc_state;
  1119	
  1120			crtc_state = drm_atomic_get_crtc_state(state, crtc);
  1121			if (IS_ERR(crtc_state)) {
  1122				ret = PTR_ERR(crtc_state);
  1123				break;
  1124			}
  1125	
  1126			if (async_flip) {
  1127				ret = drm_atomic_crtc_get_property(crtc, crtc_state,
  1128								   prop, &old_val);
  1129				ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
  1130				break;
  1131			}
  1132	
  1133			ret = drm_atomic_crtc_set_property(crtc,
  1134					crtc_state, prop, prop_value);
  1135			break;
  1136		}
  1137		case DRM_MODE_OBJECT_PLANE: {
  1138			struct drm_plane *plane = obj_to_plane(obj);
  1139			struct drm_plane_state *plane_state;
  1140	
  1141			plane_state = drm_atomic_get_plane_state(state, plane);
  1142			if (IS_ERR(plane_state)) {
  1143				ret = PTR_ERR(plane_state);
  1144				break;
  1145			}
  1146	
  1147			if (async_flip) {
  1148				ret = drm_atomic_check_plane_changes(prop, plane, plane_state,
> 1149								     obj, prop_value, old_val);
  1150				if (ret)
  1151					break;
  1152			}
  1153	
  1154			ret = drm_atomic_plane_set_property(plane,
  1155					plane_state, file_priv,
  1156					prop, prop_value);
  1157			break;
  1158		}
  1159		default:
  1160			drm_dbg_atomic(prop->dev, "[OBJECT:%d] has no properties\n", obj->id);
  1161			ret = -EINVAL;
  1162			break;
  1163		}
  1164	
  1165		drm_property_change_valid_put(prop, ref);
  1166		return ret;
  1167	}
  1168	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
