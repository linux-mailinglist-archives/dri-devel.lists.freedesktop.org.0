Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 662C07F74C2
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 14:20:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C2E10E7E8;
	Fri, 24 Nov 2023 13:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4080110E7E7;
 Fri, 24 Nov 2023 13:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700832030; x=1732368030;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PW3KckIX0ptjSyzaMFy5WY04i16wdeJmbtv0TsCpx/U=;
 b=ViDvSMpq+Ni1UHF6uEGCnPyYSM5ThOrCKg6vLRKJ5NH3BMaBhl4TZsXR
 HNegU3AjTzXdQQTcLo6ll+LT8eXzWcOOM4dms1zpm5k0seK8uODWf3Bw6
 lZll6mMMWddJ8998lrSts5yoKhvBVZmEmMWQFCS7xb3hb961oqzc0wSfk
 AmSi1HShenF8DMIK814uT67UMCq7KKgyeT/VFQtZiF+ro3wP2kXA3LqnF
 SpjUnPM0VGQYB10PdDBf3Kn6ujjLaiywjc9+3u0bDiCcYvDT4eRL8E6DA
 m4YeJalgXj30Vfj/8V9jRHmdKPwZUbWGYfT5iJFQqrw5MOUgA3PuHfcNj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="382823511"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="382823511"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 05:20:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="885274573"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="885274573"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 24 Nov 2023 05:20:27 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r6W6b-0002nz-2u;
 Fri, 24 Nov 2023 13:20:25 +0000
Date: Fri, 24 Nov 2023 21:19:32 +0800
From: kernel test robot <lkp@intel.com>
To: Lu Yao <yaolu@kylinos.cn>, airlied@gmail.com, daniel@ffwll.ch
Subject: Re: [PATCH] drm/amdgpu: Fix cat debugfs amdgpu_regs_didt causes
 kernel null pointer
Message-ID: <202311241442.F0S4BazK-lkp@intel.com>
References: <20231122093509.34302-1-yaolu@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122093509.34302-1-yaolu@kylinos.cn>
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
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lu Yao <yaolu@kylinos.cn>,
 amd-gfx@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lu,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.7-rc2 next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lu-Yao/drm-amdgpu-Fix-cat-debugfs-amdgpu_regs_didt-causes-kernel-null-pointer/20231122-203138
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231122093509.34302-1-yaolu%40kylinos.cn
patch subject: [PATCH] drm/amdgpu: Fix cat debugfs amdgpu_regs_didt causes kernel null pointer
config: x86_64-randconfig-001-20231123 (https://download.01.org/0day-ci/archive/20231124/202311241442.F0S4BazK-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241442.F0S4BazK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241442.F0S4BazK-lkp@intel.com/

All errors (new ones prefixed by >>):

   warning: unknown warning option '-Wstringop-truncation'; did you mean '-Wstring-concatenation'? [-Wunknown-warning-option]
   warning: unknown warning option '-Wpacked-not-aligned'; did you mean '-Wpacked-non-pod'? [-Wunknown-warning-option]
>> drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:642:55: error: use of undeclared identifier '__FUNC__'
                   dev_err(adev->dev, "%s adev->didt_rreg is null!\n", __FUNC__);
                                                                       ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:703:55: error: use of undeclared identifier '__FUNC__'
                   dev_err(adev->dev, "%s adev->didt_wreg is null!\n", __FUNC__);
                                                                       ^
   2 warnings and 2 errors generated.


vim +/__FUNC__ +642 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c

   618	
   619	/**
   620	 * amdgpu_debugfs_regs_didt_read - Read from a DIDT register
   621	 *
   622	 * @f: open file handle
   623	 * @buf: User buffer to store read data in
   624	 * @size: Number of bytes to read
   625	 * @pos:  Offset to seek to
   626	 *
   627	 * The lower bits are the BYTE offset of the register to read.  This
   628	 * allows reading multiple registers in a single call and having
   629	 * the returned size reflect that.
   630	 */
   631	static ssize_t amdgpu_debugfs_regs_didt_read(struct file *f, char __user *buf,
   632						size_t size, loff_t *pos)
   633	{
   634		struct amdgpu_device *adev = file_inode(f)->i_private;
   635		ssize_t result = 0;
   636		int r;
   637	
   638		if (size & 0x3 || *pos & 0x3)
   639			return -EINVAL;
   640	
   641		if (adev->didt_rreg == NULL) {
 > 642			dev_err(adev->dev, "%s adev->didt_rreg is null!\n", __FUNC__);
   643			return -EPERM;
   644		}
   645	
   646		r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
   647		if (r < 0) {
   648			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
   649			return r;
   650		}
   651	
   652		r = amdgpu_virt_enable_access_debugfs(adev);
   653		if (r < 0) {
   654			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
   655			return r;
   656		}
   657	
   658		while (size) {
   659			uint32_t value;
   660	
   661			value = RREG32_DIDT(*pos >> 2);
   662			r = put_user(value, (uint32_t *)buf);
   663			if (r)
   664				goto out;
   665	
   666			result += 4;
   667			buf += 4;
   668			*pos += 4;
   669			size -= 4;
   670		}
   671	
   672		r = result;
   673	out:
   674		pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
   675		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
   676		amdgpu_virt_disable_access_debugfs(adev);
   677		return r;
   678	}
   679	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
