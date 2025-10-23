Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A21C00D4D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 13:44:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E75E510E3D9;
	Thu, 23 Oct 2025 11:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ldLFkSh8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FF010E3D8;
 Thu, 23 Oct 2025 11:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761219863; x=1792755863;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=cy4V6zbnUJKpfzlYqkl2+ynvSjzII+zM16L4REe+EG0=;
 b=ldLFkSh8BYmH0fcUUwt8NhCgIh34/fp7apcAEHDhVKR7mt5oU38E8P61
 A9ZTfvPZ6kpyy1JOXsxULoq7Fr47F0QfN+T8FAfg2f4ijeFTnS273IQup
 fCSHwy2/19c608t6EeGaYlWKcaGMGdiWVqnLmqs7FYBliLNRiy/114t1/
 oHWOGvQR57vlIzA9Ek9hXY8FaNS2Px/mrHbByS2XWUpWCY+8q6upf0Oa4
 SGSxB5RAOlz/R8SWpKEzs4gxjk7JDHuXSGkTIfrc1ZRI7y5e+80BPMWHz
 V78zRd8q+FOIjo05M/kQJhpbzP1IDuDky43vBzVQ3A2ob0XIQ0yoeYRpE w==;
X-CSE-ConnectionGUID: x2b72O6rRaq2HLNRkxzpQw==
X-CSE-MsgGUID: reFJHl/yRQC9XdCVsP1inQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74823063"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="74823063"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 04:44:23 -0700
X-CSE-ConnectionGUID: lAhY9L45Q3OBESWWbhMiZA==
X-CSE-MsgGUID: B9VvGqLOQLWhP4B5gy4dSg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by fmviesa003.fm.intel.com with ESMTP; 23 Oct 2025 04:44:18 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vBtjr-000DPt-2T;
 Thu, 23 Oct 2025 11:44:15 +0000
Date: Thu, 23 Oct 2025 19:44:03 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Subject: Re: [PATCH v2 22/26] drm/xe/pf: Handle VRAM migration data as part
 of PF control
Message-ID: <202510231918.XlOqymLC-lkp@intel.com>
References: <20251021224133.577765-23-michal.winiarski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251021224133.577765-23-michal.winiarski@intel.com>
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

Hi Michał,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on next-20251023]
[cannot apply to awilliam-vfio/next awilliam-vfio/for-linus drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master v6.18-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Micha-Winiarski/drm-xe-pf-Remove-GuC-version-check-for-migration-support/20251022-064617
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20251021224133.577765-23-michal.winiarski%40intel.com
patch subject: [PATCH v2 22/26] drm/xe/pf: Handle VRAM migration data as part of PF control
config: arm-randconfig-r072-20251023 (https://download.01.org/0day-ci/archive/20251023/202510231918.XlOqymLC-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510231918.XlOqymLC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510231918.XlOqymLC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c:212:2: error: duplicate case value: 'XE_GT_SRIOV_STATE_RESTORE_DATA_DONE' and 'XE_GT_SRIOV_STATE_MISMATCH' both equal '31'
           CASE2STR(MISMATCH);
           ^
   drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c:170:7: note: expanded from macro 'CASE2STR'
           case XE_GT_SRIOV_STATE_##_X: return #_X
                ^
   <scratch space>:58:1: note: expanded from here
   XE_GT_SRIOV_STATE_MISMATCH
   ^
   drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c:201:2: note: previous case defined here
           CASE2STR(RESTORE_DATA_DONE);
           ^
   drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c:170:7: note: expanded from macro 'CASE2STR'
           case XE_GT_SRIOV_STATE_##_X: return #_X
                ^
   <scratch space>:36:1: note: expanded from here
   XE_GT_SRIOV_STATE_RESTORE_DATA_DONE
   ^
   1 error generated.


vim +212 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c

aed2c1d70aa008 Michal Wajdeczko 2024-03-26   99  
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  100  /**
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  101   * DOC: The VF state machine
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  102   *
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  103   * The simplified VF state machine could be presented as::
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  104   *
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  105   *	               pause--------------------------o
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  106   *	              /                               |
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  107   *	             /                                v
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  108   *	      (READY)<------------------resume-----(PAUSED)
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  109   *	         ^   \                             /    /
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  110   *	         |    \                           /    /
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  111   *	         |     stop---->(STOPPED)<----stop    /
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  112   *	         |                  /                /
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  113   *	         |                 /                /
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  114   *	         o--------<-----flr                /
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  115   *	          \                               /
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  116   *	           o------<--------------------flr
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  117   *
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  118   * Where:
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  119   *
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  120   * * READY - represents a state in which VF is fully operable
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  121   * * PAUSED - represents a state in which VF activity is temporarily suspended
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  122   * * STOPPED - represents a state in which VF activity is definitely halted
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  123   * * pause - represents a request to temporarily suspend VF activity
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  124   * * resume - represents a request to resume VF activity
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  125   * * stop - represents a request to definitely halt VF activity
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  126   * * flr - represents a request to perform VF FLR to restore VF activity
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  127   *
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  128   * However, each state transition requires additional steps that involves
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  129   * communication with GuC that might fail or be interrupted by other requests::
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  130   *
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  131   *	                   .................................WIP....
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  132   *	                   :                                      :
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  133   *	          pause--------------------->PAUSE_WIP----------------------------o
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  134   *	         /         :                /         \           :               |
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  135   *	        /          :    o----<---stop          flr--o     :               |
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  136   *	       /           :    |           \         /     |     :               V
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  137   *	(READY,RESUMED)<--------+------------RESUME_WIP<----+--<-----resume--(PAUSED)
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  138   *	  ^ \  \           :    |                           |     :          /   /
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  139   *	  |  \  \          :    |                           |     :         /   /
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  140   *	  |   \  \         :    |                           |     :        /   /
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  141   *	  |    \  \        :    o----<----------------------+--<-------stop   /
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  142   *	  |     \  \       :    |                           |     :          /
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  143   *	  |      \  \      :    V                           |     :         /
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  144   *	  |       \  stop----->STOP_WIP---------flr--->-----o     :        /
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  145   *	  |        \       :    |                           |     :       /
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  146   *	  |         \      :    |                           V     :      /
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  147   *	  |          flr--------+----->----------------->FLR_WIP<-----flr
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  148   *	  |                :    |                        /  ^     :
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  149   *	  |                :    |                       /   |     :
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  150   *	  o--------<-------:----+-----<----------------o    |     :
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  151   *	                   :    |                           |     :
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  152   *	                   :....|...........................|.....:
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  153   *	                        |                           |
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  154   *	                        V                           |
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  155   *	                     (STOPPED)--------------------flr
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  156   *
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  157   * For details about each internal WIP state machine see:
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  158   *
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  159   * * `The VF PAUSE state machine`_
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  160   * * `The VF RESUME state machine`_
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  161   * * `The VF STOP state machine`_
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  162   * * `The VF FLR state machine`_
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  163   */
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  164  
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  165  #ifdef CONFIG_DRM_XE_DEBUG_SRIOV
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  166  static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  167  {
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  168  	switch (bit) {
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  169  #define CASE2STR(_X) \
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  170  	case XE_GT_SRIOV_STATE_##_X: return #_X
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  171  	CASE2STR(WIP);
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  172  	CASE2STR(FLR_WIP);
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  173  	CASE2STR(FLR_SEND_START);
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  174  	CASE2STR(FLR_WAIT_GUC);
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  175  	CASE2STR(FLR_GUC_DONE);
2a8fcf7cc950e6 Michal Wajdeczko 2025-10-01  176  	CASE2STR(FLR_SYNC);
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  177  	CASE2STR(FLR_RESET_CONFIG);
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  178  	CASE2STR(FLR_RESET_DATA);
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  179  	CASE2STR(FLR_RESET_MMIO);
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  180  	CASE2STR(FLR_SEND_FINISH);
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  181  	CASE2STR(FLR_FAILED);
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  182  	CASE2STR(PAUSE_WIP);
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  183  	CASE2STR(PAUSE_SEND_PAUSE);
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  184  	CASE2STR(PAUSE_WAIT_GUC);
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  185  	CASE2STR(PAUSE_GUC_DONE);
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  186  	CASE2STR(PAUSE_FAILED);
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  187  	CASE2STR(PAUSED);
ed3b410584ff58 Michał Winiarski 2025-10-22  188  	CASE2STR(SAVE_WIP);
008ba8d0525f68 Michał Winiarski 2025-10-22  189  	CASE2STR(SAVE_PROCESS_DATA);
008ba8d0525f68 Michał Winiarski 2025-10-22  190  	CASE2STR(SAVE_WAIT_DATA);
33cfbd2b4f240a Michał Winiarski 2025-10-22  191  	CASE2STR(SAVE_DATA_GUC);
994e46306a1791 Michał Winiarski 2025-10-22  192  	CASE2STR(SAVE_DATA_GGTT);
bdbad7e79b97c4 Michał Winiarski 2025-10-22  193  	CASE2STR(SAVE_DATA_MMIO);
afa80586c0896a Michał Winiarski 2025-10-22  194  	CASE2STR(SAVE_DATA_VRAM);
008ba8d0525f68 Michał Winiarski 2025-10-22  195  	CASE2STR(SAVE_DATA_DONE);
ed3b410584ff58 Michał Winiarski 2025-10-22  196  	CASE2STR(SAVE_FAILED);
ed3b410584ff58 Michał Winiarski 2025-10-22  197  	CASE2STR(SAVED);
ed3b410584ff58 Michał Winiarski 2025-10-22  198  	CASE2STR(RESTORE_WIP);
008ba8d0525f68 Michał Winiarski 2025-10-22  199  	CASE2STR(RESTORE_PROCESS_DATA);
008ba8d0525f68 Michał Winiarski 2025-10-22  200  	CASE2STR(RESTORE_WAIT_DATA);
008ba8d0525f68 Michał Winiarski 2025-10-22  201  	CASE2STR(RESTORE_DATA_DONE);
ed3b410584ff58 Michał Winiarski 2025-10-22  202  	CASE2STR(RESTORE_FAILED);
ed3b410584ff58 Michał Winiarski 2025-10-22  203  	CASE2STR(RESTORED);
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  204  	CASE2STR(RESUME_WIP);
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  205  	CASE2STR(RESUME_SEND_RESUME);
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  206  	CASE2STR(RESUME_FAILED);
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  207  	CASE2STR(RESUMED);
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  208  	CASE2STR(STOP_WIP);
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  209  	CASE2STR(STOP_SEND_STOP);
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  210  	CASE2STR(STOP_FAILED);
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  211  	CASE2STR(STOPPED);
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28 @212  	CASE2STR(MISMATCH);
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  213  #undef  CASE2STR
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  214  	default: return "?";
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  215  	}
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  216  }
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  217  #endif
2bd87f0fc24ae2 Michal Wajdeczko 2024-08-28  218  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
