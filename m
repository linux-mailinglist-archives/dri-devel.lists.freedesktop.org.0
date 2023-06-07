Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9832726AB4
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 22:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 933CF10E544;
	Wed,  7 Jun 2023 20:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA5610E541;
 Wed,  7 Jun 2023 20:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686169187; x=1717705187;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sLX5G4ZkL+Cdg+Izw3VSjARG+9fbg+jRISFwXpa7Fx4=;
 b=PeB4EDNmMtWSEUffMzstY/6I7f1OCeiCAfWfyzUOky48bh3ooX/XiUnM
 xOJS2NHZpEG+vSM4nh1shpEFaSlYaLLIkgBOs4sKcrQlSPxT6Fl4xo427
 97jy5AXQBf/Z+IiJehHf33Pxl35EDmdELHBD76FjXgo7V1obznNGLYqfp
 occWb+8eb+EEIha3qU+tsCt1m2ugmlm0SL5Xdf3RTufWT/9rV1QSzj6a2
 i6xkUEjltp7hqN7u6YkW8cJbQCnZUD6hGcLfcqrnK3S3sANA/ct2FlO+L
 hqehOML+HxSqYpz85O7c8GHy3tNYNcO2gKVdEOVjA42kwZeV60B1Cdhro w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="422943174"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; d="scan'208";a="422943174"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 13:19:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="799528903"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; d="scan'208";a="799528903"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 07 Jun 2023 13:19:41 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1q6zd6-0006t8-2O;
 Wed, 07 Jun 2023 20:19:40 +0000
Date: Thu, 8 Jun 2023 04:19:29 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 tzimmermann@suse.de, mripard@kernel.org, corbet@lwn.net,
 christian.koenig@amd.com, bskeggs@redhat.com,
 Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com,
 ogabbay@kernel.org, bagasdotme@gmail.com, willy@infradead.org,
 jason@jlekstrand.net
Subject: Re: [PATCH drm-next v4 04/14] drm: debugfs: provide infrastructure
 to dump a DRM GPU VA space
Message-ID: <202306080453.W2Dcrevr-lkp@intel.com>
References: <20230606223130.6132-5-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606223130.6132-5-dakr@redhat.com>
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
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Danilo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 33a86170888b7e4aa0cea94ebb9c67180139cea9]

url:    https://github.com/intel-lab-lkp/linux/commits/Danilo-Krummrich/drm-execution-context-for-GEM-buffers-v4/20230607-063442
base:   33a86170888b7e4aa0cea94ebb9c67180139cea9
patch link:    https://lore.kernel.org/r/20230606223130.6132-5-dakr%40redhat.com
patch subject: [PATCH drm-next v4 04/14] drm: debugfs: provide infrastructure to dump a DRM GPU VA space
config: i386-randconfig-s001-20230607 (https://download.01.org/0day-ci/archive/20230608/202306080453.W2Dcrevr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/513e00e3cf4889b115cd8ab122b8e51adf2805ab
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Danilo-Krummrich/drm-execution-context-for-GEM-buffers-v4/20230607-063442
        git checkout 513e00e3cf4889b115cd8ab122b8e51adf2805ab
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306080453.W2Dcrevr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/drm_debugfs.c:213:33: sparse: sparse: non size-preserving pointer to integer cast

vim +213 drivers/gpu/drm/drm_debugfs.c

   178	
   179	/**
   180	 * drm_debugfs_gpuva_info - dump the given DRM GPU VA space
   181	 * @m: pointer to the &seq_file to write
   182	 * @mgr: the &drm_gpuva_manager representing the GPU VA space
   183	 *
   184	 * Dumps the GPU VA mappings of a given DRM GPU VA manager.
   185	 *
   186	 * For each DRM GPU VA space drivers should call this function from their
   187	 * &drm_info_list's show callback.
   188	 *
   189	 * Returns: 0 on success, -ENODEV if the &mgr is not initialized
   190	 */
   191	int drm_debugfs_gpuva_info(struct seq_file *m,
   192				   struct drm_gpuva_manager *mgr)
   193	{
   194		DRM_GPUVA_ITER(it, mgr, 0);
   195		struct drm_gpuva *va, *kva = &mgr->kernel_alloc_node;
   196	
   197		if (!mgr->name)
   198			return -ENODEV;
   199	
   200		seq_printf(m, "DRM GPU VA space (%s) [0x%016llx;0x%016llx]\n",
   201			   mgr->name, mgr->mm_start, mgr->mm_start + mgr->mm_range);
   202		seq_printf(m, "Kernel reserved node [0x%016llx;0x%016llx]\n",
   203			   kva->va.addr, kva->va.addr + kva->va.range);
   204		seq_puts(m, "\n");
   205		seq_puts(m, " VAs | start              | range              | end                | object             | object offset\n");
   206		seq_puts(m, "-------------------------------------------------------------------------------------------------------------\n");
   207		drm_gpuva_iter_for_each(va, it) {
   208			if (unlikely(va == &mgr->kernel_alloc_node))
   209				continue;
   210	
   211			seq_printf(m, "     | 0x%016llx | 0x%016llx | 0x%016llx | 0x%016llx | 0x%016llx\n",
   212				   va->va.addr, va->va.range, va->va.addr + va->va.range,
 > 213				   (u64)va->gem.obj, va->gem.offset);
   214		}
   215	
   216		return 0;
   217	}
   218	EXPORT_SYMBOL(drm_debugfs_gpuva_info);
   219	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
