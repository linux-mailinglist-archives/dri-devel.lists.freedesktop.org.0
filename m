Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE70869B750
	for <lists+dri-devel@lfdr.de>; Sat, 18 Feb 2023 02:06:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF82210E49C;
	Sat, 18 Feb 2023 01:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530AB10E498;
 Sat, 18 Feb 2023 01:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676682406; x=1708218406;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yqcTpH8JDrzqr0UESTfYfiiFLiZTLM14iR9yAw77QO8=;
 b=JaP28DAG029Tj0MnNd60e7Jey7werqIdkCqopd4PsVTSRysBpV7Czdml
 6OXnVCNhf+3XNZ6P1GTzwWuEn0FcNL1p+746uBdSpjBt445ByE3p6wVnc
 nYfeu5HH4Wosmt8ItAjuC1Wfvqux4w2GIfLxH1WHB5UKQs5KL98JMbTSF
 mh3A4Z/J39aafRchsNUpAEIVj08BDq9MaDQnhieCqam4QXEH91OSZtSlB
 9haqUuQ/u5nvgVtn31R+PhQv7q3aMXuP+nY4342CvrbtcFmfXKavObXQE
 g6X/I5QSHn5gBB3VWaeD9/9GiLMRBs1MH0Hg53DzFHUvDcRw/sFMucbjU Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="396806827"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="396806827"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 17:06:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="734496298"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="734496298"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 17 Feb 2023 17:06:40 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pTBgV-000BxN-1w;
 Sat, 18 Feb 2023 01:06:39 +0000
Date: Sat, 18 Feb 2023 09:05:55 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 tzimmermann@suse.de, mripard@kernel.org, corbet@lwn.net,
 christian.koenig@amd.com, bskeggs@redhat.com,
 Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com,
 ogabbay@kernel.org, bagasdotme@gmail.com, willy@infradead.org,
 jason@jlekstrand.net
Subject: Re: [PATCH drm-next v2 05/16] drm: manager to keep track of GPUs VA
 mappings
Message-ID: <202302180805.b0ab40V5-lkp@intel.com>
References: <20230217134422.14116-6-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217134422.14116-6-dakr@redhat.com>
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

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 48075a66fca613477ac1969b576a93ef5db0164f]

url:    https://github.com/intel-lab-lkp/linux/commits/Danilo-Krummrich/drm-execution-context-for-GEM-buffers/20230217-215101
base:   48075a66fca613477ac1969b576a93ef5db0164f
patch link:    https://lore.kernel.org/r/20230217134422.14116-6-dakr%40redhat.com
patch subject: [PATCH drm-next v2 05/16] drm: manager to keep track of GPUs VA mappings
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230218/202302180805.b0ab40V5-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/00132cc92b6745cfd51c0d5df4c246a848f2ceaa
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Danilo-Krummrich/drm-execution-context-for-GEM-buffers/20230217-215101
        git checkout 00132cc92b6745cfd51c0d5df4c246a848f2ceaa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302180805.b0ab40V5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_gpuva_mgr.c:1383:5: warning: no previous prototype for 'drm_gpuva_sm_step' [-Wmissing-prototypes]
    1383 | int drm_gpuva_sm_step(struct drm_gpuva_op *__op, void *priv)
         |     ^~~~~~~~~~~~~~~~~
--
>> drivers/gpu/drm/drm_gpuva_mgr.c:529: warning: expecting prototype for drm_gpuva_remove_iter(). Prototype was for drm_gpuva_iter_remove() instead
   drivers/gpu/drm/drm_gpuva_mgr.c:549: warning: Excess function parameter 'addr' description in 'drm_gpuva_insert'
   drivers/gpu/drm/drm_gpuva_mgr.c:549: warning: Excess function parameter 'range' description in 'drm_gpuva_insert'
   drivers/gpu/drm/drm_gpuva_mgr.c:765: warning: Excess function parameter 'addr' description in 'drm_gpuva_region_insert'
   drivers/gpu/drm/drm_gpuva_mgr.c:765: warning: Excess function parameter 'range' description in 'drm_gpuva_region_insert'
   drivers/gpu/drm/drm_gpuva_mgr.c:1345: warning: Excess function parameter 'ops' description in 'drm_gpuva_sm_unmap'
   drivers/gpu/drm/drm_gpuva_mgr.c:1589: warning: Function parameter or member 'addr' not described in 'drm_gpuva_prefetch_ops_create'
   drivers/gpu/drm/drm_gpuva_mgr.c:1589: warning: Function parameter or member 'range' not described in 'drm_gpuva_prefetch_ops_create'
   drivers/gpu/drm/drm_gpuva_mgr.c:1589: warning: Excess function parameter 'req_addr' description in 'drm_gpuva_prefetch_ops_create'
   drivers/gpu/drm/drm_gpuva_mgr.c:1589: warning: Excess function parameter 'req_range' description in 'drm_gpuva_prefetch_ops_create'


vim +/drm_gpuva_sm_step +1383 drivers/gpu/drm/drm_gpuva_mgr.c

  1382	
> 1383	int drm_gpuva_sm_step(struct drm_gpuva_op *__op, void *priv)
  1384	{
  1385		struct {
  1386			struct drm_gpuva_manager *mgr;
  1387			struct drm_gpuva_ops *ops;
  1388		} *args = priv;
  1389		struct drm_gpuva_manager *mgr = args->mgr;
  1390		struct drm_gpuva_ops *ops = args->ops;
  1391		struct drm_gpuva_op *op;
  1392	
  1393		op = gpuva_op_alloc(mgr);
  1394		if (unlikely(!op))
  1395			goto err;
  1396	
  1397		memcpy(op, __op, sizeof(*op));
  1398	
  1399		if (op->op == DRM_GPUVA_OP_REMAP) {
  1400			struct drm_gpuva_op_remap *__r = &__op->remap;
  1401			struct drm_gpuva_op_remap *r = &op->remap;
  1402	
  1403			r->unmap = kmemdup(__r->unmap, sizeof(*r->unmap),
  1404					   GFP_KERNEL);
  1405			if (unlikely(!r->unmap))
  1406				goto err_free_op;
  1407	
  1408			if (__r->prev) {
  1409				r->prev = kmemdup(__r->prev, sizeof(*r->prev),
  1410						  GFP_KERNEL);
  1411				if (unlikely(!r->prev))
  1412					goto err_free_unmap;
  1413			}
  1414	
  1415			if (__r->next) {
  1416				r->next = kmemdup(__r->next, sizeof(*r->next),
  1417						  GFP_KERNEL);
  1418				if (unlikely(!r->next))
  1419					goto err_free_prev;
  1420			}
  1421		}
  1422	
  1423		list_add_tail(&op->entry, &ops->list);
  1424	
  1425		return 0;
  1426	
  1427	err_free_unmap:
  1428		kfree(op->remap.unmap);
  1429	err_free_prev:
  1430		kfree(op->remap.prev);
  1431	err_free_op:
  1432		gpuva_op_free(mgr, op);
  1433	err:
  1434		return -ENOMEM;
  1435	}
  1436	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
