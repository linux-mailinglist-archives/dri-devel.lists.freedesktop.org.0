Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D11AD570A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 15:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2775E10E65C;
	Wed, 11 Jun 2025 13:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j82pf381";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8432C10E366;
 Wed, 11 Jun 2025 13:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749648729; x=1781184729;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eSDv28MuTdwZ6xTMeqLdugHcHec2hDq5By/9GkUZe3g=;
 b=j82pf3812PnnESkwJj9ifMm7vpzhIGaOammCq0koJRM4Jn2icMsLaF/I
 BJEb8gfn8Q4o8xANDg+DmQ2ggrmR1azIbI6/66ATLeUbHA0Ffb1uPgmU7
 2uEc4XsuUGkANYVPPjR4oywIu1n3GwbrPuNhBafzq4XW5d6sRsHkIIsai
 hCOmNd2ux8ewkIgMgBUKftYaNypgDZpnD3pporl5brXhltF3nVdLG2LJ8
 cL5eK2hPhg+Dp25PaO+PIUM+RwJv0swfWe2Yp/j5xNyvKdeLnuFFrca4l
 qo0F/9q46Eb0pw6p3p8ARpe6AlObdPSd9jF/SbQmUwt+ye/Pn5DpIMd/q w==;
X-CSE-ConnectionGUID: NSIL5LsOQuu+A7ok3l4eDg==
X-CSE-MsgGUID: 3U0Y0UTEQ2u1La0VmIneqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51014381"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="51014381"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 06:32:08 -0700
X-CSE-ConnectionGUID: 071oI+h3Qji4k13VB1TsaA==
X-CSE-MsgGUID: Q8gjurnuS2eCKUnDRZRfiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="184407810"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 11 Jun 2025 06:31:49 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uPLYQ-000AVO-28;
 Wed, 11 Jun 2025 13:31:46 +0000
Date: Wed, 11 Jun 2025 21:30:51 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, kernel-dev@igalia.com,
 amd-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH v4 2/6] drm/syncobj: Do not allocate an array to store
 zeros when waiting
Message-ID: <202506112101.YHxD1SCt-lkp@intel.com>
References: <20250610083001.4120-3-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610083001.4120-3-tvrtko.ursulin@igalia.com>
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

Hi Tvrtko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on linus/master v6.16-rc1 next-20250611]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tvrtko-Ursulin/drm-syncobj-Remove-unhelpful-helper/20250610-163819
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250610083001.4120-3-tvrtko.ursulin%40igalia.com
patch subject: [PATCH v4 2/6] drm/syncobj: Do not allocate an array to store zeros when waiting
config: x86_64-randconfig-121-20250611 (https://download.01.org/0day-ci/archive/20250611/202506112101.YHxD1SCt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250611/202506112101.YHxD1SCt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506112101.YHxD1SCt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/drm_syncobj.c:1090:47: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *to @@     got unsigned long long [noderef] [usertype] __user * @@
   drivers/gpu/drm/drm_syncobj.c:1090:47: sparse:     expected void *to
   drivers/gpu/drm/drm_syncobj.c:1090:47: sparse:     got unsigned long long [noderef] [usertype] __user *
>> drivers/gpu/drm/drm_syncobj.c:1090:59: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned long long * @@
   drivers/gpu/drm/drm_syncobj.c:1090:59: sparse:     expected void const [noderef] __user *from
   drivers/gpu/drm/drm_syncobj.c:1090:59: sparse:     got unsigned long long *

vim +1090 drivers/gpu/drm/drm_syncobj.c

  1056	
  1057	static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
  1058							  u64 __user *user_points,
  1059							  uint32_t count,
  1060							  uint32_t flags,
  1061							  signed long timeout,
  1062							  uint32_t *idx,
  1063							  ktime_t *deadline)
  1064	{
  1065		struct syncobj_wait_entry *entries;
  1066		uint32_t signaled_count, i;
  1067		struct dma_fence *fence;
  1068	
  1069		if (flags & (DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
  1070			     DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE)) {
  1071			might_sleep();
  1072			lockdep_assert_none_held_once();
  1073		}
  1074	
  1075		entries = kcalloc(count, sizeof(*entries), GFP_KERNEL);
  1076		if (!entries)
  1077			return -ENOMEM;
  1078	
  1079		/* Walk the list of sync objects and initialize entries.  We do
  1080		 * this up-front so that we can properly return -EINVAL if there is
  1081		 * a syncobj with a missing fence and then never have the chance of
  1082		 * returning -EINVAL again.
  1083		 */
  1084		signaled_count = 0;
  1085		for (i = 0; i < count; ++i) {
  1086			struct dma_fence *fence;
  1087	
  1088			entries[i].task = current;
  1089			if (user_points &&
> 1090			    copy_from_user(user_points++, &entries[i].point,
  1091					   sizeof(*user_points))) {
  1092				timeout = -EFAULT;
  1093				goto cleanup_entries;
  1094			}
  1095			fence = drm_syncobj_fence_get(syncobjs[i]);
  1096			if (!fence ||
  1097			    dma_fence_chain_find_seqno(&fence, entries[i].point)) {
  1098				dma_fence_put(fence);
  1099				if (flags & (DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
  1100					     DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE)) {
  1101					continue;
  1102				} else {
  1103					timeout = -EINVAL;
  1104					goto cleanup_entries;
  1105				}
  1106			}
  1107	
  1108			if (fence)
  1109				entries[i].fence = fence;
  1110			else
  1111				entries[i].fence = dma_fence_get_stub();
  1112	
  1113			if ((flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE) ||
  1114			    dma_fence_is_signaled(entries[i].fence)) {
  1115				if (signaled_count == 0 && idx)
  1116					*idx = i;
  1117				signaled_count++;
  1118			}
  1119		}
  1120	
  1121		if (signaled_count == count ||
  1122		    (signaled_count > 0 &&
  1123		     !(flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL)))
  1124			goto cleanup_entries;
  1125	
  1126		/* There's a very annoying laxness in the dma_fence API here, in
  1127		 * that backends are not required to automatically report when a
  1128		 * fence is signaled prior to fence->ops->enable_signaling() being
  1129		 * called.  So here if we fail to match signaled_count, we need to
  1130		 * fallthough and try a 0 timeout wait!
  1131		 */
  1132	
  1133		if (flags & (DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
  1134			     DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE)) {
  1135			for (i = 0; i < count; ++i)
  1136				drm_syncobj_fence_add_wait(syncobjs[i], &entries[i]);
  1137		}
  1138	
  1139		if (deadline) {
  1140			for (i = 0; i < count; ++i) {
  1141				fence = entries[i].fence;
  1142				if (!fence)
  1143					continue;
  1144				dma_fence_set_deadline(fence, *deadline);
  1145			}
  1146		}
  1147	
  1148		do {
  1149			set_current_state(TASK_INTERRUPTIBLE);
  1150	
  1151			signaled_count = 0;
  1152			for (i = 0; i < count; ++i) {
  1153				fence = entries[i].fence;
  1154				if (!fence)
  1155					continue;
  1156	
  1157				if ((flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE) ||
  1158				    dma_fence_is_signaled(fence) ||
  1159				    (!entries[i].fence_cb.func &&
  1160				     dma_fence_add_callback(fence,
  1161							    &entries[i].fence_cb,
  1162							    syncobj_wait_fence_func))) {
  1163					/* The fence has been signaled */
  1164					if (flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL) {
  1165						signaled_count++;
  1166					} else {
  1167						if (idx)
  1168							*idx = i;
  1169						goto done_waiting;
  1170					}
  1171				}
  1172			}
  1173	
  1174			if (signaled_count == count)
  1175				goto done_waiting;
  1176	
  1177			if (timeout == 0) {
  1178				timeout = -ETIME;
  1179				goto done_waiting;
  1180			}
  1181	
  1182			if (signal_pending(current)) {
  1183				timeout = -ERESTARTSYS;
  1184				goto done_waiting;
  1185			}
  1186	
  1187			timeout = schedule_timeout(timeout);
  1188		} while (1);
  1189	
  1190	done_waiting:
  1191		__set_current_state(TASK_RUNNING);
  1192	
  1193	cleanup_entries:
  1194		for (i = 0; i < count; ++i) {
  1195			drm_syncobj_remove_wait(syncobjs[i], &entries[i]);
  1196			if (entries[i].fence_cb.func)
  1197				dma_fence_remove_callback(entries[i].fence,
  1198							  &entries[i].fence_cb);
  1199			dma_fence_put(entries[i].fence);
  1200		}
  1201		kfree(entries);
  1202	
  1203		return timeout;
  1204	}
  1205	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
