Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 794787252F1
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 06:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB6E10E41F;
	Wed,  7 Jun 2023 04:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC1F10E41F;
 Wed,  7 Jun 2023 04:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686112720; x=1717648720;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=stEpQCC6Ez2pk7JottMBEwoff64TCXNQwRNECZ10yzA=;
 b=P/hLpi57XQrihORjxG3HdztILVe5CofzFzB707YA4exbQ8aa0LC2ouKs
 LVapLTVARK2m50NaI85O8asZZ2ZwMQAQTE2UKIQtJs4VeVs5CqdlEwYar
 KLF3amqv8mfdwwT7QigkAd2gn/rUcNcwr9OtnoZ9PQ+mxoj78VqtQz03d
 GBFnsJs0icZrXG8xMPuc0XPmjlia47e6Ijw+PP37UDXfX0FwJgbNB0+q+
 iu1nwVRulvZa8Fm38O8TH8C4Xmasr5josrs/7b8bp7mOzSdfTWUnOZPBb
 3o6kUNlOUa6gIOzBwrc6YmRD1nMfPgYnez1QN8BysEScDju+QLinp2rv/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="420429085"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; d="scan'208";a="420429085"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 21:37:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="709340307"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; d="scan'208";a="709340307"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 06 Jun 2023 21:37:36 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1q6kvP-000699-34;
 Wed, 07 Jun 2023 04:37:35 +0000
Date: Wed, 7 Jun 2023 12:36:59 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 tzimmermann@suse.de, mripard@kernel.org, corbet@lwn.net,
 christian.koenig@amd.com, bskeggs@redhat.com,
 Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com,
 ogabbay@kernel.org, bagasdotme@gmail.com, willy@infradead.org,
 jason@jlekstrand.net
Subject: Re: [PATCH drm-next v4 03/14] drm: manager to keep track of GPUs VA
 mappings
Message-ID: <202306071203.Gn8jrmLz-lkp@intel.com>
References: <20230606223130.6132-4-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606223130.6132-4-dakr@redhat.com>
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
Cc: linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Danilo Krummrich <dakr@redhat.com>,
 oe-kbuild-all@lists.linux.dev, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Danilo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 33a86170888b7e4aa0cea94ebb9c67180139cea9]

url:    https://github.com/intel-lab-lkp/linux/commits/Danilo-Krummrich/drm-execution-context-for-GEM-buffers-v4/20230607-063442
base:   33a86170888b7e4aa0cea94ebb9c67180139cea9
patch link:    https://lore.kernel.org/r/20230606223130.6132-4-dakr%40redhat.com
patch subject: [PATCH drm-next v4 03/14] drm: manager to keep track of GPUs VA mappings
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230607/202306071203.Gn8jrmLz-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 33a86170888b7e4aa0cea94ebb9c67180139cea9
        b4 shazam https://lore.kernel.org/r/20230606223130.6132-4-dakr@redhat.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306071203.Gn8jrmLz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_gpuva_mgr.c: In function '__drm_gpuva_sm_map':
>> drivers/gpu/drm/drm_gpuva_mgr.c:1032:32: warning: variable 'prev' set but not used [-Wunused-but-set-variable]
    1032 |         struct drm_gpuva *va, *prev = NULL;
         |                                ^~~~


vim +/prev +1032 drivers/gpu/drm/drm_gpuva_mgr.c

  1024	
  1025	static int
  1026	__drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
  1027			   const struct drm_gpuva_fn_ops *ops, void *priv,
  1028			   u64 req_addr, u64 req_range,
  1029			   struct drm_gem_object *req_obj, u64 req_offset)
  1030	{
  1031		DRM_GPUVA_ITER(it, mgr, req_addr);
> 1032		struct drm_gpuva *va, *prev = NULL;
  1033		u64 req_end = req_addr + req_range;
  1034		int ret;
  1035	
  1036		if (unlikely(!drm_gpuva_in_mm_range(mgr, req_addr, req_range)))
  1037			return -EINVAL;
  1038	
  1039		if (unlikely(drm_gpuva_in_kernel_node(mgr, req_addr, req_range)))
  1040			return -EINVAL;
  1041	
  1042		drm_gpuva_iter_for_each_range(va, it, req_end) {
  1043			struct drm_gem_object *obj = va->gem.obj;
  1044			u64 offset = va->gem.offset;
  1045			u64 addr = va->va.addr;
  1046			u64 range = va->va.range;
  1047			u64 end = addr + range;
  1048			bool merge = !!va->gem.obj;
  1049	
  1050			if (addr == req_addr) {
  1051				merge &= obj == req_obj &&
  1052					 offset == req_offset;
  1053	
  1054				if (end == req_end) {
  1055					ret = op_unmap_cb(ops, &it, priv, va, merge);
  1056					if (ret)
  1057						return ret;
  1058					break;
  1059				}
  1060	
  1061				if (end < req_end) {
  1062					ret = op_unmap_cb(ops, &it, priv, va, merge);
  1063					if (ret)
  1064						return ret;
  1065					goto next;
  1066				}
  1067	
  1068				if (end > req_end) {
  1069					struct drm_gpuva_op_map n = {
  1070						.va.addr = req_end,
  1071						.va.range = range - req_range,
  1072						.gem.obj = obj,
  1073						.gem.offset = offset + req_range,
  1074					};
  1075					struct drm_gpuva_op_unmap u = {
  1076						.va = va,
  1077						.keep = merge,
  1078					};
  1079	
  1080					ret = op_remap_cb(ops, &it, priv, NULL, &n, &u);
  1081					if (ret)
  1082						return ret;
  1083					break;
  1084				}
  1085			} else if (addr < req_addr) {
  1086				u64 ls_range = req_addr - addr;
  1087				struct drm_gpuva_op_map p = {
  1088					.va.addr = addr,
  1089					.va.range = ls_range,
  1090					.gem.obj = obj,
  1091					.gem.offset = offset,
  1092				};
  1093				struct drm_gpuva_op_unmap u = { .va = va };
  1094	
  1095				merge &= obj == req_obj &&
  1096					 offset + ls_range == req_offset;
  1097				u.keep = merge;
  1098	
  1099				if (end == req_end) {
  1100					ret = op_remap_cb(ops, &it, priv, &p, NULL, &u);
  1101					if (ret)
  1102						return ret;
  1103					break;
  1104				}
  1105	
  1106				if (end < req_end) {
  1107					ret = op_remap_cb(ops, &it, priv, &p, NULL, &u);
  1108					if (ret)
  1109						return ret;
  1110					goto next;
  1111				}
  1112	
  1113				if (end > req_end) {
  1114					struct drm_gpuva_op_map n = {
  1115						.va.addr = req_end,
  1116						.va.range = end - req_end,
  1117						.gem.obj = obj,
  1118						.gem.offset = offset + ls_range +
  1119							      req_range,
  1120					};
  1121	
  1122					ret = op_remap_cb(ops, &it, priv, &p, &n, &u);
  1123					if (ret)
  1124						return ret;
  1125					break;
  1126				}
  1127			} else if (addr > req_addr) {
  1128				merge &= obj == req_obj &&
  1129					 offset == req_offset +
  1130						   (addr - req_addr);
  1131	
  1132				if (end == req_end) {
  1133					ret = op_unmap_cb(ops, &it, priv, va, merge);
  1134					if (ret)
  1135						return ret;
  1136					break;
  1137				}
  1138	
  1139				if (end < req_end) {
  1140					ret = op_unmap_cb(ops, &it, priv, va, merge);
  1141					if (ret)
  1142						return ret;
  1143					goto next;
  1144				}
  1145	
  1146				if (end > req_end) {
  1147					struct drm_gpuva_op_map n = {
  1148						.va.addr = req_end,
  1149						.va.range = end - req_end,
  1150						.gem.obj = obj,
  1151						.gem.offset = offset + req_end - addr,
  1152					};
  1153					struct drm_gpuva_op_unmap u = {
  1154						.va = va,
  1155						.keep = merge,
  1156					};
  1157	
  1158					ret = op_remap_cb(ops, &it, priv, NULL, &n, &u);
  1159					if (ret)
  1160						return ret;
  1161					break;
  1162				}
  1163			}
  1164	next:
  1165			prev = va;
  1166		}
  1167	
  1168		return op_map_cb(ops, priv,
  1169				 req_addr, req_range,
  1170				 req_obj, req_offset);
  1171	}
  1172	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
