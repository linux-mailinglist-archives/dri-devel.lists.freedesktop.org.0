Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA9E7280A2
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 14:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2979B10E5AA;
	Thu,  8 Jun 2023 12:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC92110E258;
 Thu,  8 Jun 2023 12:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686228855; x=1717764855;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ANx6CbIhekRQ83tFcSsoMWFj7V/9tdCSO1pg4R3s0Pw=;
 b=M77M1mGOMymufXqV8zWyY5wGN64uJi24j+fzBcNDM0lEHBCNg8xcmyaX
 i2eKQp8/2ZznlefXD5JbnMiLL/ceDqvwiX7pG2MtqfHRC8aYxOuFApDCu
 T15SXdn7o7lJufE8X7ThH3DNUlb8AWUpK8JNiW9i5dKrt7wriW9KCqkMJ
 N6RNiKYtQPVQXE2bsceZiCMQj4Sw9KkLJzhQIhsDttKQkrhP9quhVz5YU
 jq0OofsQl8KrmABWXBCY4niW+PPsPGdxk6j21mL0hg9MU3WEqmZn1r0PI
 +THSuo6VZgs21JxJoA6ruwyUCddGppWix1rsuwGygyiKPh4diOqDr36J2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="346912559"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="346912559"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 05:54:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="743098987"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="743098987"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 08 Jun 2023 05:54:08 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1q7F9U-0007mw-0z;
 Thu, 08 Jun 2023 12:54:08 +0000
Date: Thu, 8 Jun 2023 20:53:34 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 tzimmermann@suse.de, mripard@kernel.org, corbet@lwn.net,
 christian.koenig@amd.com, bskeggs@redhat.com,
 Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com,
 ogabbay@kernel.org, bagasdotme@gmail.com, willy@infradead.org,
 jason@jlekstrand.net
Subject: Re: [PATCH drm-next v4 13/14] drm/nouveau: implement new VM_BIND uAPI
Message-ID: <202306082035.J4ZJW2HE-lkp@intel.com>
References: <20230606223130.6132-14-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606223130.6132-14-dakr@redhat.com>
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
patch link:    https://lore.kernel.org/r/20230606223130.6132-14-dakr%40redhat.com
patch subject: [PATCH drm-next v4 13/14] drm/nouveau: implement new VM_BIND uAPI
config: alpha-randconfig-s041-20230608 (https://download.01.org/0day-ci/archive/20230608/202306082035.J4ZJW2HE-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/28d9f3973f9ed165312943fb05304fad878abb33
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Danilo-Krummrich/drm-execution-context-for-GEM-buffers-v4/20230607-063442
        git checkout 28d9f3973f9ed165312943fb05304fad878abb33
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306082035.J4ZJW2HE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/nouveau_drm.c:1194:9: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected int ( [usertype] *func )( ... ) @@     got int ( * )( ... ) @@
   drivers/gpu/drm/nouveau/nouveau_drm.c:1194:9: sparse:     expected int ( [usertype] *func )( ... )
   drivers/gpu/drm/nouveau/nouveau_drm.c:1194:9: sparse:     got int ( * )( ... )
   drivers/gpu/drm/nouveau/nouveau_drm.c:1195:9: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected int ( [usertype] *func )( ... ) @@     got int ( * )( ... ) @@
   drivers/gpu/drm/nouveau/nouveau_drm.c:1195:9: sparse:     expected int ( [usertype] *func )( ... )
   drivers/gpu/drm/nouveau/nouveau_drm.c:1195:9: sparse:     got int ( * )( ... )
   drivers/gpu/drm/nouveau/nouveau_drm.c:1196:9: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected int ( [usertype] *func )( ... ) @@     got int ( * )( ... ) @@
   drivers/gpu/drm/nouveau/nouveau_drm.c:1196:9: sparse:     expected int ( [usertype] *func )( ... )
   drivers/gpu/drm/nouveau/nouveau_drm.c:1196:9: sparse:     got int ( * )( ... )
--
>> drivers/gpu/drm/nouveau/nouveau_exec.c:305:19: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/nouveau/nouveau_exec.c:306:19: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/nouveau/nouveau_exec.c:307:20: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/nouveau/nouveau_exec.c:308:20: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/nouveau/nouveau_exec.c:309:21: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/nouveau/nouveau_exec.c:310:21: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/nouveau/nouveau_exec.c:378:43: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/nouveau/nouveau_exec.c:393:13: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/nouveau/nouveau_exec.c:396:13: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/nouveau/nouveau_exec.c:397:17: sparse: sparse: dereference of noderef expression
--
   drivers/gpu/drm/nouveau/nouveau_uvmm.c:1637:1: sparse: sparse: symbol 'nouveau_uvmm_ioctl_vm_init' redeclared with different type (incompatible argument 2 (different address spaces)):
>> drivers/gpu/drm/nouveau/nouveau_uvmm.c:1637:1: sparse:    int extern [addressable] [signed] [toplevel] nouveau_uvmm_ioctl_vm_init( ... )
   drivers/gpu/drm/nouveau/nouveau_uvmm.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
   drivers/gpu/drm/nouveau/nouveau_uvmm.h:91:5: sparse: note: previously declared as:
>> drivers/gpu/drm/nouveau/nouveau_uvmm.h:91:5: sparse:    int extern [addressable] [signed] [toplevel] nouveau_uvmm_ioctl_vm_init( ... )
   drivers/gpu/drm/nouveau/nouveau_uvmm.c:342:17: sparse: sparse: context imbalance in '__nouveau_uvma_region_insert' - unexpected unlock
>> drivers/gpu/drm/nouveau/nouveau_uvmm.c:1674:19: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/nouveau/nouveau_uvmm.c:1675:19: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/nouveau/nouveau_uvmm.c:1676:20: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/nouveau/nouveau_uvmm.c:1677:20: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/nouveau/nouveau_uvmm.c:1678:19: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/nouveau/nouveau_uvmm.c:1679:19: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/nouveau/nouveau_uvmm.c:1682:23: sparse: sparse: dereference of noderef expression

vim +1194 drivers/gpu/drm/nouveau/nouveau_drm.c

  1177	
  1178	static const struct drm_ioctl_desc
  1179	nouveau_ioctls[] = {
  1180		DRM_IOCTL_DEF_DRV(NOUVEAU_GETPARAM, nouveau_abi16_ioctl_getparam, DRM_RENDER_ALLOW),
  1181		DRM_IOCTL_DEF_DRV(NOUVEAU_SETPARAM, drm_invalid_op, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
  1182		DRM_IOCTL_DEF_DRV(NOUVEAU_CHANNEL_ALLOC, nouveau_abi16_ioctl_channel_alloc, DRM_RENDER_ALLOW),
  1183		DRM_IOCTL_DEF_DRV(NOUVEAU_CHANNEL_FREE, nouveau_abi16_ioctl_channel_free, DRM_RENDER_ALLOW),
  1184		DRM_IOCTL_DEF_DRV(NOUVEAU_GROBJ_ALLOC, nouveau_abi16_ioctl_grobj_alloc, DRM_RENDER_ALLOW),
  1185		DRM_IOCTL_DEF_DRV(NOUVEAU_NOTIFIEROBJ_ALLOC, nouveau_abi16_ioctl_notifierobj_alloc, DRM_RENDER_ALLOW),
  1186		DRM_IOCTL_DEF_DRV(NOUVEAU_GPUOBJ_FREE, nouveau_abi16_ioctl_gpuobj_free, DRM_RENDER_ALLOW),
  1187		DRM_IOCTL_DEF_DRV(NOUVEAU_SVM_INIT, nouveau_svmm_init, DRM_RENDER_ALLOW),
  1188		DRM_IOCTL_DEF_DRV(NOUVEAU_SVM_BIND, nouveau_svmm_bind, DRM_RENDER_ALLOW),
  1189		DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_NEW, nouveau_gem_ioctl_new, DRM_RENDER_ALLOW),
  1190		DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_PUSHBUF, nouveau_gem_ioctl_pushbuf, DRM_RENDER_ALLOW),
  1191		DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_CPU_PREP, nouveau_gem_ioctl_cpu_prep, DRM_RENDER_ALLOW),
  1192		DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_CPU_FINI, nouveau_gem_ioctl_cpu_fini, DRM_RENDER_ALLOW),
  1193		DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_INFO, nouveau_gem_ioctl_info, DRM_RENDER_ALLOW),
> 1194		DRM_IOCTL_DEF_DRV(NOUVEAU_VM_INIT, nouveau_uvmm_ioctl_vm_init, DRM_RENDER_ALLOW),
  1195		DRM_IOCTL_DEF_DRV(NOUVEAU_VM_BIND, nouveau_uvmm_ioctl_vm_bind, DRM_RENDER_ALLOW),
  1196		DRM_IOCTL_DEF_DRV(NOUVEAU_EXEC, nouveau_exec_ioctl_exec, DRM_RENDER_ALLOW),
  1197	};
  1198	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
