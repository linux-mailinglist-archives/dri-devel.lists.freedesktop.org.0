Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 551CD7DF07A
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 11:47:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F4C10E155;
	Thu,  2 Nov 2023 10:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8478F10E00E;
 Thu,  2 Nov 2023 10:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698922033; x=1730458033;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KH7vT1lEeEU0uB3WixM0UBZSUFvdyaK2lluLFuQhe+k=;
 b=lKuEEFJdHkRmcgtd8rR6DkcA+jOol3qcjCj2ZBi9f4LR4uyXMrXx+wPw
 2S6TMY/3mgXxJxIgoBKAnzasuCQS4vRPDOtia0r/0VxSMR44Qk4nPTsXq
 /mp0TlWWz4g39jSR69jgvHT5ls6IOienVpYexLgLq0G4pTfbVvjtxQw/+
 X93G5k+vr9rqH7S+YSqL7WKjMiqnuABhTW9aIsmPGRI2uzA3Hv58t2tuF
 P23J52xCzGYKGmX7VUmia1e8wkdm018AfIUirwNhJiZA/eRnAyKNXxct3
 bEONiqsOU/mjtRtE7/3Jqvlimkc0KSTJ30Z2sQc2ShEojlGx0vxDlgEBN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="419795671"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="419795671"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 03:47:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="790351817"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="790351817"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 02 Nov 2023 03:47:09 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qyVEA-0001Q4-1m;
 Thu, 02 Nov 2023 10:47:06 +0000
Date: Thu, 2 Nov 2023 18:46:09 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith@gfxstrand.net
Subject: Re: [PATCH drm-misc-next v8 09/12] drm/gpuvm: reference count
 drm_gpuvm structures
Message-ID: <202311021833.q8aYDJnr-lkp@intel.com>
References: <20231101233113.8059-10-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231101233113.8059-10-dakr@redhat.com>
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
Cc: nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Danilo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3c6c7ca4508b6cb1a033ac954c50a1b2c97af883]

url:    https://github.com/intel-lab-lkp/linux/commits/Danilo-Krummrich/drm-gpuvm-convert-WARN-to-drm_WARN-variants/20231102-073332
base:   3c6c7ca4508b6cb1a033ac954c50a1b2c97af883
patch link:    https://lore.kernel.org/r/20231101233113.8059-10-dakr%40redhat.com
patch subject: [PATCH drm-misc-next v8 09/12] drm/gpuvm: reference count drm_gpuvm structures
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20231102/202311021833.q8aYDJnr-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231102/202311021833.q8aYDJnr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311021833.q8aYDJnr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_gpuvm.c:810: warning: expecting prototype for drm_gpuvm_bo_put(). Prototype was for drm_gpuvm_put() instead


vim +810 drivers/gpu/drm/drm_gpuvm.c

   801	
   802	/**
   803	 * drm_gpuvm_bo_put() - drop a struct drm_gpuvm reference
   804	 * @gpuvm: the &drm_gpuvm to release the reference of
   805	 *
   806	 * This releases a reference to @gpuvm.
   807	 */
   808	void
   809	drm_gpuvm_put(struct drm_gpuvm *gpuvm)
 > 810	{
   811		if (gpuvm)
   812			kref_put(&gpuvm->kref, drm_gpuvm_free);
   813	}
   814	EXPORT_SYMBOL_GPL(drm_gpuvm_put);
   815	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
