Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1F087D58A
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 21:52:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E18D10E04F;
	Fri, 15 Mar 2024 20:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BoYY4M/6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AACC110E04F
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 20:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710535956; x=1742071956;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lym18ZesQC+Q6gWwXilhatR9qla2T4b8vlkjNBFywO0=;
 b=BoYY4M/6UD5pGJj3jdLtoGVLuSuHnC6fh9n+FiWYhSQup1okADpogctq
 sUvyjmnH+UhyQc7q71rTGQa+rli3y3D+fckfbgEtT07hFN9+ZVsTA1uf6
 sv0OE9aeha7aHG1JobMxjhrWGbpmb2dn7UcNX4fhnNYaQQjuCYCO9HEAw
 YuMgyMikKOMQ4B9TeOanVGwMywMunGDf0IA4EibzDtnhCbbhBK5gV1nFh
 AOGLByIeL1sw1dSLJla2gKGQqrDWNoDWwnvc/aY/rEck10RtTOe/D0A/t
 PUBbDyid199ZSny8JdR/MBT+lVqScuK8Jf1v0DODYHnK2oy9FU7Mq7Ic2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="5282992"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="5282992"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 13:52:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; d="scan'208";a="17402062"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 15 Mar 2024 13:52:22 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rlEXM-000Emv-1A;
 Fri, 15 Mar 2024 20:52:20 +0000
Date: Sat, 16 Mar 2024 04:51:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, daniel@ffwll.ch,
 jiasheng@iscas.ac.cn, quic_carlv@quicinc.com,
 quic_pkanojiy@quicinc.com, stanislaw.gruszka@linux.intel.com,
 jacek.lawrynowicz@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ogabbay@kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH 1/2] drm: Add DRM-managed alloc_workqueue() and
 alloc_ordered_workqueue()
Message-ID: <202403160449.IaCY0Cl5-lkp@intel.com>
References: <20240315145034.3972749-2-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240315145034.3972749-2-quic_jhugo@quicinc.com>
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

Hi Jeffrey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.8 next-20240315]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeffrey-Hugo/drm-Add-DRM-managed-alloc_workqueue-and-alloc_ordered_workqueue/20240315-225330
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240315145034.3972749-2-quic_jhugo%40quicinc.com
patch subject: [PATCH 1/2] drm: Add DRM-managed alloc_workqueue() and alloc_ordered_workqueue()
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240316/202403160449.IaCY0Cl5-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403160449.IaCY0Cl5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403160449.IaCY0Cl5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_managed.c:336: warning: Function parameter or struct member 'fmt' not described in 'drmm_alloc_workqueue'
>> drivers/gpu/drm/drm_managed.c:336: warning: Function parameter or struct member 'flags' not described in 'drmm_alloc_workqueue'
>> drivers/gpu/drm/drm_managed.c:336: warning: Function parameter or struct member 'max_active' not described in 'drmm_alloc_workqueue'
>> drivers/gpu/drm/drm_managed.c:336: warning: Excess function parameter 'wq' description in 'drmm_alloc_workqueue'
>> drivers/gpu/drm/drm_managed.c:374: warning: Function parameter or struct member 'fmt' not described in 'drmm_alloc_ordered_workqueue'
>> drivers/gpu/drm/drm_managed.c:374: warning: Function parameter or struct member 'flags' not described in 'drmm_alloc_ordered_workqueue'
>> drivers/gpu/drm/drm_managed.c:374: warning: Excess function parameter 'wq' description in 'drmm_alloc_ordered_workqueue'


vim +336 drivers/gpu/drm/drm_managed.c

   320	
   321	/**
   322	 * drmm_alloc_workqueue - &drm_device-managed alloc_workqueue()
   323	 * @dev: DRM device
   324	 * @wq: workqueue to be allocated
   325	 *
   326	 * Returns:
   327	 * Valid pointer on success, NULL on error.
   328	 *
   329	 * This is a &drm_device-managed version of alloc_workqueue().
   330	 * The initialized lock is automatically destroyed on the final
   331	 * drm_dev_put().
   332	 */
   333	struct workqueue_struct *drmm_alloc_workqueue(struct drm_device *dev,
   334						      const char *fmt, unsigned int flags,
   335						      int max_active, ...)
 > 336	{
   337		struct workqueue_struct *wq;
   338		va_list args;
   339		int ret;
   340	
   341		va_start(args, max_active);
   342		wq = alloc_workqueue(fmt, flags, max_active, args);
   343		va_end(args);
   344	
   345		if (!wq)
   346			return NULL;
   347	
   348		ret = drmm_add_action_or_reset(dev, drmm_destroy_workqueue, wq);
   349		if (ret) {
   350			destroy_workqueue(wq);
   351			return NULL;
   352		}
   353	
   354		return wq;
   355	}
   356	EXPORT_SYMBOL(drmm_alloc_workqueue);
   357	
   358	/**
   359	 * drmm_alloc_ordered_workqueue - &drm_device-managed
   360	 * alloc_ordered_workqueue()
   361	 * @dev: DRM device
   362	 * @wq: workqueue to be allocated
   363	 *
   364	 * Returns:
   365	 * Valid pointer on success, NULL on error.
   366	 *
   367	 * This is a &drm_device-managed version of alloc_ordered_workqueue().
   368	 * The initialized lock is automatically destroyed on the final
   369	 * drm_dev_put().
   370	 */
   371	struct workqueue_struct *drmm_alloc_ordered_workqueue(struct drm_device *dev,
   372							      const char *fmt,
   373							      unsigned int flags, ...)
 > 374	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
