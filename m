Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7D1427F80
	for <lists+dri-devel@lfdr.de>; Sun, 10 Oct 2021 09:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9FED6E23D;
	Sun, 10 Oct 2021 07:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD02A6E233
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Oct 2021 07:05:14 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10132"; a="250089567"
X-IronPort-AV: E=Sophos;i="5.85,362,1624345200"; 
 d="gz'50?scan'50,208,50";a="250089567"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2021 00:05:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,362,1624345200"; 
 d="gz'50?scan'50,208,50";a="490012728"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 10 Oct 2021 00:05:10 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mZStR-000119-Vb; Sun, 10 Oct 2021 07:05:09 +0000
Date: Sun, 10 Oct 2021 15:04:20 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Cc: kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org
Subject: [airlied:drm-intel-display-refactor 7/9]
 drivers/gpu/drm/i915/display/intel_fbdev.c:251:60: sparse: sparse: incorrect
 type in argument 3 (different address spaces)
Message-ID: <202110101512.NT1DYYY5-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://people.freedesktop.org/~airlied/linux.git drm-intel-display-refactor
head:   57c0bb98bd7351cfb13403dd854cc9a0fc9ad5df
commit: 0f3c35589c8c2924d384164482aa273def8aaf1a [7/9] drm/i915/display: refactor fbdev pin/unpin out into functions.
config: i386-randconfig-s001-20211010 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        git remote add airlied git://people.freedesktop.org/~airlied/linux.git
        git fetch --no-tags airlied drm-intel-display-refactor
        git checkout 0f3c35589c8c2924d384164482aa273def8aaf1a
        # save the attached .config to linux build tree
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=i386 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/i915/display/intel_fbdev.c:188:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/i915/display/intel_fbdev.c:188:16: sparse:     expected void *
   drivers/gpu/drm/i915/display/intel_fbdev.c:188:16: sparse:     got void [noderef] __iomem *
>> drivers/gpu/drm/i915/display/intel_fbdev.c:251:60: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void **vaddr @@     got void [noderef] __iomem ** @@
   drivers/gpu/drm/i915/display/intel_fbdev.c:251:60: sparse:     expected void **vaddr
   drivers/gpu/drm/i915/display/intel_fbdev.c:251:60: sparse:     got void [noderef] __iomem **

vim +251 drivers/gpu/drm/i915/display/intel_fbdev.c

   173	
   174	static int intel_fbdev_pin_and_fence(struct drm_i915_private *dev_priv,
   175					     struct intel_fbdev *ifbdev,
   176					     void **vaddr)
   177	{
   178		const struct i915_ggtt_view view = {
   179			.type = I915_GGTT_VIEW_NORMAL,
   180		};
   181		ifbdev->vma = intel_pin_and_fence_fb_obj(&ifbdev->fb->base, false,
   182							 &view, false, &ifbdev->vma_flags);
   183	
   184		if (IS_ERR(ifbdev->vma)) {
   185			return PTR_ERR(ifbdev->vma);
   186		}
   187	
 > 188		*vaddr = i915_vma_pin_iomap(ifbdev->vma);
   189		if (IS_ERR(*vaddr)) {
   190			drm_err(&dev_priv->drm,
   191				"Failed to remap framebuffer into virtual memory\n");
   192			return PTR_ERR(vaddr);
   193		}
   194		return 0;
   195	}
   196	
   197	static void intel_fbdev_unpin(struct intel_fbdev *ifbdev)
   198	{
   199		if (ifbdev->vma)
   200			intel_unpin_fb_vma(ifbdev->vma, ifbdev->vma_flags);
   201	}
   202	
   203	static int intelfb_create(struct drm_fb_helper *helper,
   204				  struct drm_fb_helper_surface_size *sizes)
   205	{
   206		struct intel_fbdev *ifbdev =
   207			container_of(helper, struct intel_fbdev, helper);
   208		struct intel_framebuffer *intel_fb = ifbdev->fb;
   209		struct drm_device *dev = helper->dev;
   210		struct drm_i915_private *dev_priv = to_i915(dev);
   211		struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
   212		struct i915_ggtt *ggtt = &dev_priv->ggtt;
   213		intel_wakeref_t wakeref;
   214		struct fb_info *info;
   215		bool prealloc = false;
   216		void __iomem *vaddr;
   217		struct drm_i915_gem_object *obj;
   218		int ret;
   219	
   220		if (intel_fb &&
   221		    (sizes->fb_width > intel_fb->base.width ||
   222		     sizes->fb_height > intel_fb->base.height)) {
   223			drm_dbg_kms(&dev_priv->drm,
   224				    "BIOS fb too small (%dx%d), we require (%dx%d),"
   225				    " releasing it\n",
   226				    intel_fb->base.width, intel_fb->base.height,
   227				    sizes->fb_width, sizes->fb_height);
   228			drm_framebuffer_put(&intel_fb->base);
   229			intel_fb = ifbdev->fb = NULL;
   230		}
   231		if (!intel_fb || drm_WARN_ON(dev, !intel_fb_obj(&intel_fb->base))) {
   232			drm_dbg_kms(&dev_priv->drm,
   233				    "no BIOS fb, allocating a new one\n");
   234			ret = intelfb_alloc(helper, sizes);
   235			if (ret)
   236				return ret;
   237			intel_fb = ifbdev->fb;
   238		} else {
   239			drm_dbg_kms(&dev_priv->drm, "re-using BIOS fb\n");
   240			prealloc = true;
   241			sizes->fb_width = intel_fb->base.width;
   242			sizes->fb_height = intel_fb->base.height;
   243		}
   244	
   245		wakeref = intel_runtime_pm_get(&dev_priv->runtime_pm);
   246	
   247		/* Pin the GGTT vma for our access via info->screen_base.
   248		 * This also validates that any existing fb inherited from the
   249		 * BIOS is suitable for own access.
   250		 */
 > 251		ret = intel_fbdev_pin_and_fence(dev_priv, ifbdev, &vaddr);
   252		if (ret) {
   253			goto out_unlock;
   254		}
   255	
   256		info = drm_fb_helper_alloc_fbi(helper);
   257		if (IS_ERR(info)) {
   258			drm_err(&dev_priv->drm, "Failed to allocate fb_info\n");
   259			ret = PTR_ERR(info);
   260			goto out_unpin;
   261		}
   262	
   263		ifbdev->helper.fb = &ifbdev->fb->base;
   264	
   265		info->fbops = &intelfb_ops;
   266	
   267		/* setup aperture base/size for vesafb takeover */
   268		obj = intel_fb_obj(&intel_fb->base);
   269		if (i915_gem_object_is_lmem(obj)) {
   270			struct intel_memory_region *mem = obj->mm.region;
   271	
   272			info->apertures->ranges[0].base = mem->io_start;
   273			info->apertures->ranges[0].size = mem->total;
   274	
   275			/* Use fbdev's framebuffer from lmem for discrete */
   276			info->fix.smem_start =
   277				(unsigned long)(mem->io_start +
   278						i915_gem_object_get_dma_address(obj, 0));
   279			info->fix.smem_len = obj->base.size;
   280		} else {
   281			info->apertures->ranges[0].base = ggtt->gmadr.start;
   282			info->apertures->ranges[0].size = ggtt->mappable_end;
   283	
   284			/* Our framebuffer is the entirety of fbdev's system memory */
   285			info->fix.smem_start =
   286				(unsigned long)(ggtt->gmadr.start + ifbdev->vma->node.start);
   287			info->fix.smem_len = ifbdev->vma->node.size;
   288		}
   289	
   290		info->screen_base = vaddr;
   291		info->screen_size = ifbdev->vma->node.size;
   292	
   293		drm_fb_helper_fill_info(info, &ifbdev->helper, sizes);
   294	
   295		/* If the object is shmemfs backed, it will have given us zeroed pages.
   296		 * If the object is stolen however, it will be full of whatever
   297		 * garbage was left in there.
   298		 */
   299		if (!i915_gem_object_is_shmem(ifbdev->vma->obj) && !prealloc)
   300			memset_io(info->screen_base, 0, info->screen_size);
   301	
   302		/* Use default scratch pixmap (info->pixmap.flags = FB_PIXMAP_SYSTEM) */
   303	
   304		drm_dbg_kms(&dev_priv->drm, "allocated %dx%d fb: 0x%08x\n",
   305			    ifbdev->fb->base.width, ifbdev->fb->base.height,
   306			    i915_ggtt_offset(ifbdev->vma));
   307	
   308		intel_runtime_pm_put(&dev_priv->runtime_pm, wakeref);
   309		vga_switcheroo_client_fb_set(pdev, info);
   310		return 0;
   311	
   312	out_unpin:
   313		intel_fbdev_unpin(ifbdev);
   314	out_unlock:
   315		intel_runtime_pm_put(&dev_priv->runtime_pm, wakeref);
   316		return ret;
   317	}
   318	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--gKMricLos+KVdGMg
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
E52D0/4D6iOG9SUTAgA=

--gKMricLos+KVdGMg--
