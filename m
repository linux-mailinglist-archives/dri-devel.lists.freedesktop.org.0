Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E755D6D5B00
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 10:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D48B10E61D;
	Tue,  4 Apr 2023 08:37:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C532710E209;
 Tue,  4 Apr 2023 08:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680597434; x=1712133434;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JGggyQzzspR9Su7ugBRfXlt0OlpXpis7bo9tgixoags=;
 b=MwFKuLg9HMlZ3pPTmqwNWORx4wXQG7RHobcRuaKguT7QlKZ30eHImIw7
 fWRn7BJ+eypMjT4DWZbguWS7JXPKQmMZgmd5pT9jJhDsQFWw0qUONL3qD
 Cp8Yf9JXQ7wVf+kttnI0bVFlfRdicwkulsleY9+YQBnO4JV72yekVioZZ
 flu0dLAllhKEzCVl9VrIRyklceGWdAqVkYZzo78WPVUKE53cLfPod0GxW
 8lfg7STm3kU1FZ68XpIKEMMhG590ESIu05VYEbjsiGjoSlbU9xLwJPo0x
 1IaDnFszl6BV7ZnkWw7yCnlhAOer2I5J1Ts0jp03wbtrG0EOJErWulIpV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="344687661"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; d="scan'208";a="344687661"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 01:37:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="810152914"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; d="scan'208";a="810152914"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 04 Apr 2023 01:37:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pjcA7-000PS8-1x;
 Tue, 04 Apr 2023 08:37:07 +0000
Date: Tue, 4 Apr 2023 16:36:52 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 tzimmermann@suse.de, mripard@kernel.org, corbet@lwn.net,
 christian.koenig@amd.com, bskeggs@redhat.com,
 Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com,
 ogabbay@kernel.org, bagasdotme@gmail.com, willy@infradead.org,
 jason@jlekstrand.net
Subject: Re: [PATCH drm-next v3 05/15] drm: debugfs: provide infrastructure
 to dump a DRM GPU VA space
Message-ID: <202304041602.xJ8yUJgd-lkp@intel.com>
References: <20230404012741.116502-6-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404012741.116502-6-dakr@redhat.com>
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

[auto build test WARNING on d36d68fd1925d33066d52468b7c7c6aca6521248]

url:    https://github.com/intel-lab-lkp/linux/commits/Danilo-Krummrich/drm-execution-context-for-GEM-buffers-v3/20230404-093042
base:   d36d68fd1925d33066d52468b7c7c6aca6521248
patch link:    https://lore.kernel.org/r/20230404012741.116502-6-dakr%40redhat.com
patch subject: [PATCH drm-next v3 05/15] drm: debugfs: provide infrastructure to dump a DRM GPU VA space
config: nios2-randconfig-s053-20230403 (https://download.01.org/0day-ci/archive/20230404/202304041602.xJ8yUJgd-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/97d8731cc359143f6f790b1c4755d1055a72adb9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Danilo-Krummrich/drm-execution-context-for-GEM-buffers-v3/20230404-093042
        git checkout 97d8731cc359143f6f790b1c4755d1055a72adb9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=nios2 SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304041602.xJ8yUJgd-lkp@intel.com/

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
https://github.com/intel/lkp-tests
