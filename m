Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 299136D5800
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 07:30:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1581210E0DD;
	Tue,  4 Apr 2023 05:30:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6049810E0DC;
 Tue,  4 Apr 2023 05:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680586214; x=1712122214;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ve6U2A790yFZDP2NASGkDII48rORhlhHF+QczkodZ4o=;
 b=mTF8s+MdlRXHTMVEzRuE7b9hH99oEBvNMz1X6HlJQu9L9bKlYjOAYEV9
 CIMZi9q+TT+P1hZJLLhKlFR9C7XcVtjDBevhyLlJf1XtdnNVrlGmVWlo5
 gtGvs9ERpOPkdGLGYu64Rnyx0bDpWkc38jSALprqwQoj4HW/ozIynIiKR
 fD9UXcc4B/r2beIM0fTPlgUZYf505YEpdVXVdn09Cd1LrKCBPSKTasiam
 Mt1PQOQDReHXbrz1JOZw7zRiCQ0BZu4aUiSP74LRpSoHpzeli9XyrIHgg
 nGcDLHqhn+0oZWfvJR5M0SAk8M1yuWAhjzB3otxJDyjhVqTsle4eHm0yq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="407154297"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="407154297"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 22:30:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="810096875"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="810096875"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 03 Apr 2023 22:30:06 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pjZF8-000PEc-0r;
 Tue, 04 Apr 2023 05:30:06 +0000
Date: Tue, 4 Apr 2023 13:29:44 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 tzimmermann@suse.de, mripard@kernel.org, corbet@lwn.net,
 christian.koenig@amd.com, bskeggs@redhat.com,
 Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com,
 ogabbay@kernel.org, bagasdotme@gmail.com, willy@infradead.org,
 jason@jlekstrand.net
Subject: Re: [PATCH drm-next v3 04/15] drm: manager to keep track of GPUs VA
 mappings
Message-ID: <202304041336.BD0G9U85-lkp@intel.com>
References: <20230404012741.116502-5-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404012741.116502-5-dakr@redhat.com>
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
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Danilo Krummrich <dakr@redhat.com>, oe-kbuild-all@lists.linux.dev,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Danilo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d36d68fd1925d33066d52468b7c7c6aca6521248]

url:    https://github.com/intel-lab-lkp/linux/commits/Danilo-Krummrich/drm-execution-context-for-GEM-buffers-v3/20230404-093042
base:   d36d68fd1925d33066d52468b7c7c6aca6521248
patch link:    https://lore.kernel.org/r/20230404012741.116502-5-dakr%40redhat.com
patch subject: [PATCH drm-next v3 04/15] drm: manager to keep track of GPUs VA mappings
config: mips-randconfig-r024-20230403 (https://download.01.org/0day-ci/archive/20230404/202304041336.BD0G9U85-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/c25139e5a168ae8a3a3e5ca0b650c201e5f41367
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Danilo-Krummrich/drm-execution-context-for-GEM-buffers-v3/20230404-093042
        git checkout c25139e5a168ae8a3a3e5ca0b650c201e5f41367
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/drm/ drivers/iio/light/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304041336.BD0G9U85-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_gpuva_mgr.c:1031:25: warning: variable 'prev' set but not used [-Wunused-but-set-variable]
           struct drm_gpuva *va, *prev = NULL;
                                  ^
   1 warning generated.


vim +/prev +1031 drivers/gpu/drm/drm_gpuva_mgr.c

  1023	
  1024	static int
  1025	__drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
  1026			   struct drm_gpuva_fn_ops *ops, void *priv,
  1027			   u64 req_addr, u64 req_range,
  1028			   struct drm_gem_object *req_obj, u64 req_offset)
  1029	{
  1030		DRM_GPUVA_ITER(it, mgr, req_addr);
> 1031		struct drm_gpuva *va, *prev = NULL;
  1032		u64 req_end = req_addr + req_range;
  1033		int ret;
  1034	
  1035		if (unlikely(!drm_gpuva_in_mm_range(mgr, req_addr, req_range)))
  1036			return -EINVAL;
  1037	
  1038		if (unlikely(drm_gpuva_in_kernel_node(mgr, req_addr, req_range)))
  1039			return -EINVAL;
  1040	
  1041		drm_gpuva_iter_for_each_range(va, it, req_end) {
  1042			struct drm_gem_object *obj = va->gem.obj;
  1043			u64 offset = va->gem.offset;
  1044			u64 addr = va->va.addr;
  1045			u64 range = va->va.range;
  1046			u64 end = addr + range;
  1047			bool merge = !!va->gem.obj;
  1048	
  1049			if (addr == req_addr) {
  1050				merge &= obj == req_obj &&
  1051					 offset == req_offset;
  1052	
  1053				if (end == req_end) {
  1054					ret = op_unmap_cb(ops, &it, priv, va, merge);
  1055					if (ret)
  1056						return ret;
  1057					break;
  1058				}
  1059	
  1060				if (end < req_end) {
  1061					ret = op_unmap_cb(ops, &it, priv, va, merge);
  1062					if (ret)
  1063						return ret;
  1064					goto next;
  1065				}
  1066	
  1067				if (end > req_end) {
  1068					struct drm_gpuva_op_map n = {
  1069						.va.addr = req_end,
  1070						.va.range = range - req_range,
  1071						.gem.obj = obj,
  1072						.gem.offset = offset + req_range,
  1073					};
  1074					struct drm_gpuva_op_unmap u = {
  1075						.va = va,
  1076						.keep = merge,
  1077					};
  1078	
  1079					ret = op_remap_cb(ops, &it, priv, NULL, &n, &u);
  1080					if (ret)
  1081						return ret;
  1082					break;
  1083				}
  1084			} else if (addr < req_addr) {
  1085				u64 ls_range = req_addr - addr;
  1086				struct drm_gpuva_op_map p = {
  1087					.va.addr = addr,
  1088					.va.range = ls_range,
  1089					.gem.obj = obj,
  1090					.gem.offset = offset,
  1091				};
  1092				struct drm_gpuva_op_unmap u = { .va = va };
  1093	
  1094				merge &= obj == req_obj &&
  1095					 offset + ls_range == req_offset;
  1096				u.keep = merge;
  1097	
  1098				if (end == req_end) {
  1099					ret = op_remap_cb(ops, &it, priv, &p, NULL, &u);
  1100					if (ret)
  1101						return ret;
  1102					break;
  1103				}
  1104	
  1105				if (end < req_end) {
  1106					ret = op_remap_cb(ops, &it, priv, &p, NULL, &u);
  1107					if (ret)
  1108						return ret;
  1109					goto next;
  1110				}
  1111	
  1112				if (end > req_end) {
  1113					struct drm_gpuva_op_map n = {
  1114						.va.addr = req_end,
  1115						.va.range = end - req_end,
  1116						.gem.obj = obj,
  1117						.gem.offset = offset + ls_range +
  1118							      req_range,
  1119					};
  1120	
  1121					ret = op_remap_cb(ops, &it, priv, &p, &n, &u);
  1122					if (ret)
  1123						return ret;
  1124					break;
  1125				}
  1126			} else if (addr > req_addr) {
  1127				merge &= obj == req_obj &&
  1128					 offset == req_offset +
  1129						   (addr - req_addr);
  1130	
  1131				if (end == req_end) {
  1132					ret = op_unmap_cb(ops, &it, priv, va, merge);
  1133					if (ret)
  1134						return ret;
  1135					break;
  1136				}
  1137	
  1138				if (end < req_end) {
  1139					ret = op_unmap_cb(ops, &it, priv, va, merge);
  1140					if (ret)
  1141						return ret;
  1142					goto next;
  1143				}
  1144	
  1145				if (end > req_end) {
  1146					struct drm_gpuva_op_map n = {
  1147						.va.addr = req_end,
  1148						.va.range = end - req_end,
  1149						.gem.obj = obj,
  1150						.gem.offset = offset + req_end - addr,
  1151					};
  1152					struct drm_gpuva_op_unmap u = {
  1153						.va = va,
  1154						.keep = merge,
  1155					};
  1156	
  1157					ret = op_remap_cb(ops, &it, priv, NULL, &n, &u);
  1158					if (ret)
  1159						return ret;
  1160					break;
  1161				}
  1162			}
  1163	next:
  1164			prev = va;
  1165		}
  1166	
  1167		return op_map_cb(ops, priv,
  1168				 req_addr, req_range,
  1169				 req_obj, req_offset);
  1170	}
  1171	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
