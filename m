Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 069A176FD1E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 11:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4523810E04D;
	Fri,  4 Aug 2023 09:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649AE10E04D;
 Fri,  4 Aug 2023 09:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691140843; x=1722676843;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pmb5GBWYUbmb/mU/OgOHBE///YNoVPvnDrOtq39Lsf0=;
 b=cAfQHfPC/s4h6ka/Lo1oOgWKL1D6TaWUQj3a1J4NUtN/StQbUBOXpTj8
 PuBDhxWH0KekOlC3Cyq9mqqsumM98nBpkPGflgfiLlRhjc++Z6V4+JOgs
 Sv7HPfo0RMMySy+jmfFqEtygHKEXVPyry3yYCewriGRh3lcqNUsMRJNfi
 91onQq5+vTuS5JFEzmM7b8PoC6kgB5LggGff2HX6ba1382+1bHf+jHuwt
 2kKqtrw3UgOPZy+OvPZ1JkepmETpP+O95Dncs//R+56rhU/952aJBE/pX
 yJ+JgBphnZdbkfYrr3jqkwYWtSPTJW9DkKXn5zb/vDNsgPlKRh56pkWGh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="349707079"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; d="scan'208";a="349707079"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 02:20:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="1060676075"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; d="scan'208";a="1060676075"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 04 Aug 2023 02:20:14 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qRqyj-0002lX-2o;
 Fri, 04 Aug 2023 09:20:13 +0000
Date: Fri, 4 Aug 2023 17:19:53 +0800
From: kernel test robot <lkp@intel.com>
To: Wayne Lin <Wayne.Lin@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/3] drm/mst: Refactor the flow for payload
 allocation/removement
Message-ID: <202308041635.WkgWWX5r-lkp@intel.com>
References: <20230804062029.5686-3-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804062029.5686-3-Wayne.Lin@amd.com>
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
Cc: jani.nikula@intel.com, jerry.zuo@amd.com, Wayne Lin <Wayne.Lin@amd.com>,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Wayne,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-intel/for-linux-next-fixes drm/drm-next linus/master v6.5-rc4 next-20230804]
[cannot apply to drm-intel/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wayne-Lin/drm-mst-delete-unnecessary-case-in-drm_dp_add_payload_part2/20230804-142405
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230804062029.5686-3-Wayne.Lin%40amd.com
patch subject: [PATCH 2/3] drm/mst: Refactor the flow for payload allocation/removement
config: microblaze-randconfig-r021-20230731 (https://download.01.org/0day-ci/archive/20230804/202308041635.WkgWWX5r-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308041635.WkgWWX5r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308041635.WkgWWX5r-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/dispnv50/disp.c: In function 'nv50_msto_prepare':
>> drivers/gpu/drm/nouveau/dispnv50/disp.c:919:53: warning: variable 'old_payload' set but not used [-Wunused-but-set-variable]
     919 |         struct drm_dp_mst_atomic_payload *payload, *old_payload;
         |                                                     ^~~~~~~~~~~


vim +/old_payload +919 drivers/gpu/drm/nouveau/dispnv50/disp.c

f479c0ba4a170a drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs 2016-11-04  908  
f479c0ba4a170a drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs 2016-11-04  909  static void
4d07b0bc403403 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-08-17  910  nv50_msto_prepare(struct drm_atomic_state *state,
4d07b0bc403403 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-08-17  911  		  struct drm_dp_mst_topology_state *mst_state,
4d07b0bc403403 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-08-17  912  		  struct drm_dp_mst_topology_mgr *mgr,
4d07b0bc403403 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-08-17  913  		  struct nv50_msto *msto)
f479c0ba4a170a drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs 2016-11-04  914  {
f479c0ba4a170a drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs 2016-11-04  915  	struct nouveau_drm *drm = nouveau_drm(msto->encoder.dev);
f479c0ba4a170a drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs 2016-11-04  916  	struct nv50_mstc *mstc = msto->mstc;
f479c0ba4a170a drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs 2016-11-04  917  	struct nv50_mstm *mstm = mstc->mstm;
8fb3e25c3dd1a2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-06-13  918  	struct drm_dp_mst_topology_state *old_mst_state;
8fb3e25c3dd1a2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-06-13 @919  	struct drm_dp_mst_atomic_payload *payload, *old_payload;
f479c0ba4a170a drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs 2016-11-04  920  
f479c0ba4a170a drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs 2016-11-04  921  	NV_ATOMIC(drm, "%s: msto prepare\n", msto->encoder.name);
4d07b0bc403403 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-08-17  922  
8fb3e25c3dd1a2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-06-13  923  	old_mst_state = drm_atomic_get_old_mst_topology_state(state, mgr);
8fb3e25c3dd1a2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-06-13  924  
4d07b0bc403403 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-08-17  925  	payload = drm_atomic_get_mst_payload_state(mst_state, mstc->port);
8fb3e25c3dd1a2 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2023-06-13  926  	old_payload = drm_atomic_get_mst_payload_state(old_mst_state, mstc->port);
4d07b0bc403403 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-08-17  927  
4d07b0bc403403 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-08-17  928  	// TODO: Figure out if we want to do a better job of handling VCPI allocation failures here?
4d07b0bc403403 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-08-17  929  	if (msto->disabled) {
c9e8c7f37133c0 drivers/gpu/drm/nouveau/dispnv50/disp.c Wayne Lin  2023-08-04  930  		drm_dp_remove_payload_part1(mgr, mst_state, payload);
8c7d980da9ba3e drivers/gpu/drm/nouveau/dispnv50/disp.c Ben Skeggs 2022-06-01  931  
8c7d980da9ba3e drivers/gpu/drm/nouveau/dispnv50/disp.c Ben Skeggs 2022-06-01  932  		nvif_outp_dp_mst_vcpi(&mstm->outp->outp, msto->head->base.index, 0, 0, 0, 0);
4d07b0bc403403 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-08-17  933  	} else {
4d07b0bc403403 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-08-17  934  		if (msto->enabled)
4d07b0bc403403 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-08-17  935  			drm_dp_add_payload_part1(mgr, mst_state, payload);
4d07b0bc403403 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-08-17  936  
8c7d980da9ba3e drivers/gpu/drm/nouveau/dispnv50/disp.c Ben Skeggs 2022-06-01  937  		nvif_outp_dp_mst_vcpi(&mstm->outp->outp, msto->head->base.index,
8c7d980da9ba3e drivers/gpu/drm/nouveau/dispnv50/disp.c Ben Skeggs 2022-06-01  938  				      payload->vc_start_slot, payload->time_slots,
8c7d980da9ba3e drivers/gpu/drm/nouveau/dispnv50/disp.c Ben Skeggs 2022-06-01  939  				      payload->pbn, payload->time_slots * mst_state->pbn_div);
f479c0ba4a170a drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs 2016-11-04  940  	}
f479c0ba4a170a drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs 2016-11-04  941  }
f479c0ba4a170a drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs 2016-11-04  942  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
