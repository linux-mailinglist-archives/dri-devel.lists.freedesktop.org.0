Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2F46D0115
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 12:23:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E67E10E186;
	Thu, 30 Mar 2023 10:23:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D174B10ED9E;
 Thu, 30 Mar 2023 10:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680171781; x=1711707781;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gLn5TTEcIlCoQHKj85Jril/VhPR3hAJS3q3MefOT/pw=;
 b=VoUckJJlYbQKkXmsgPfCVxAiigSFPIVyXuI1zrp+nv5VYu2PxvCFXtBz
 iKnMR/3PX6xLS+rLdJvnb2Z1tNaOlcpSzY3C5uBBLJg6+WT7VUDMadA2i
 XTjkV9JgIq6EMpObdpSkSX03XjG33gWZKNU0wZgSlbsAQACLIML0NcwWh
 OyoDmy1NjmiY8heMtMVHhJpe4qW8zERHLYl//rn6DfeYx8ZqJ0IMEoO3s
 YEn+0NCWSHyA3fzhSNuJf1q5FMcoUx0xIf9JKfWXVrtrCuhTcQyYUvSFj
 lVr/FdvZ5CO0fjtlG8FKQWT2pXLixitnJ6XGmS5mcZ3C5Hxhnpv8rQwvX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="339853744"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="339853744"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 03:22:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="714938796"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="714938796"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 30 Mar 2023 03:22:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1phpQd-000Kjq-1q;
 Thu, 30 Mar 2023 10:22:47 +0000
Date: Thu, 30 Mar 2023 18:22:44 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
 sean@poorly.run, javierm@redhat.com, airlied@gmail.com, daniel@ffwll.ch
Subject: Re: [PATCH 6/6] drm/msm: Implement fbdev emulation as in-kernel client
Message-ID: <202303301849.HjMnKXNi-lkp@intel.com>
References: <20230330074150.7637-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330074150.7637-7-tzimmermann@suse.de>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.3-rc4]
[cannot apply to next-20230330]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-msm-Clear-aperture-ownership-outside-of-fbdev-code/20230330-154729
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230330074150.7637-7-tzimmermann%40suse.de
patch subject: [PATCH 6/6] drm/msm: Implement fbdev emulation as in-kernel client
config: csky-randconfig-r011-20230329 (https://download.01.org/0day-ci/archive/20230330/202303301849.HjMnKXNi-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ec39cb11cf72fb01ada6fe51c7c572a31dcc805d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Zimmermann/drm-msm-Clear-aperture-ownership-outside-of-fbdev-code/20230330-154729
        git checkout ec39cb11cf72fb01ada6fe51c7c572a31dcc805d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303301849.HjMnKXNi-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/msm/msm_drv.c: In function 'msm_drm_init':
>> drivers/gpu/drm/msm/msm_drv.c:538:20: error: 'fbdev' undeclared (first use in this function)
     538 |         if (kms && fbdev)
         |                    ^~~~~
   drivers/gpu/drm/msm/msm_drv.c:538:20: note: each undeclared identifier is reported only once for each function it appears in


vim +/fbdev +538 drivers/gpu/drm/msm/msm_drv.c

   398	
   399	static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
   400	{
   401		struct msm_drm_private *priv = dev_get_drvdata(dev);
   402		struct drm_device *ddev;
   403		struct msm_kms *kms;
   404		int ret, i;
   405	
   406		if (drm_firmware_drivers_only())
   407			return -ENODEV;
   408	
   409		/* the fw fb could be anywhere in memory */
   410		ret = drm_aperture_remove_framebuffers(false, drv);
   411		if (ret)
   412			return ret;
   413	
   414		ddev = drm_dev_alloc(drv, dev);
   415		if (IS_ERR(ddev)) {
   416			DRM_DEV_ERROR(dev, "failed to allocate drm_device\n");
   417			return PTR_ERR(ddev);
   418		}
   419		ddev->dev_private = priv;
   420		priv->dev = ddev;
   421	
   422		priv->wq = alloc_ordered_workqueue("msm", 0);
   423		if (!priv->wq)
   424			return -ENOMEM;
   425	
   426		INIT_LIST_HEAD(&priv->objects);
   427		mutex_init(&priv->obj_lock);
   428	
   429		/*
   430		 * Initialize the LRUs:
   431		 */
   432		mutex_init(&priv->lru.lock);
   433		drm_gem_lru_init(&priv->lru.unbacked, &priv->lru.lock);
   434		drm_gem_lru_init(&priv->lru.pinned,   &priv->lru.lock);
   435		drm_gem_lru_init(&priv->lru.willneed, &priv->lru.lock);
   436		drm_gem_lru_init(&priv->lru.dontneed, &priv->lru.lock);
   437	
   438		/* Teach lockdep about lock ordering wrt. shrinker: */
   439		fs_reclaim_acquire(GFP_KERNEL);
   440		might_lock(&priv->lru.lock);
   441		fs_reclaim_release(GFP_KERNEL);
   442	
   443		drm_mode_config_init(ddev);
   444	
   445		ret = msm_init_vram(ddev);
   446		if (ret)
   447			goto err_drm_dev_put;
   448	
   449		/* Bind all our sub-components: */
   450		ret = component_bind_all(dev, ddev);
   451		if (ret)
   452			goto err_drm_dev_put;
   453	
   454		dma_set_max_seg_size(dev, UINT_MAX);
   455	
   456		msm_gem_shrinker_init(ddev);
   457	
   458		if (priv->kms_init) {
   459			ret = priv->kms_init(ddev);
   460			if (ret) {
   461				DRM_DEV_ERROR(dev, "failed to load kms\n");
   462				priv->kms = NULL;
   463				goto err_msm_uninit;
   464			}
   465			kms = priv->kms;
   466		} else {
   467			/* valid only for the dummy headless case, where of_node=NULL */
   468			WARN_ON(dev->of_node);
   469			kms = NULL;
   470		}
   471	
   472		/* Enable normalization of plane zpos */
   473		ddev->mode_config.normalize_zpos = true;
   474	
   475		if (kms) {
   476			kms->dev = ddev;
   477			ret = kms->funcs->hw_init(kms);
   478			if (ret) {
   479				DRM_DEV_ERROR(dev, "kms hw init failed: %d\n", ret);
   480				goto err_msm_uninit;
   481			}
   482		}
   483	
   484		drm_helper_move_panel_connectors_to_head(ddev);
   485	
   486		ddev->mode_config.funcs = &mode_config_funcs;
   487		ddev->mode_config.helper_private = &mode_config_helper_funcs;
   488	
   489		for (i = 0; i < priv->num_crtcs; i++) {
   490			/* initialize event thread */
   491			priv->event_thread[i].crtc_id = priv->crtcs[i]->base.id;
   492			priv->event_thread[i].dev = ddev;
   493			priv->event_thread[i].worker = kthread_create_worker(0,
   494				"crtc_event:%d", priv->event_thread[i].crtc_id);
   495			if (IS_ERR(priv->event_thread[i].worker)) {
   496				ret = PTR_ERR(priv->event_thread[i].worker);
   497				DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
   498				priv->event_thread[i].worker = NULL;
   499				goto err_msm_uninit;
   500			}
   501	
   502			sched_set_fifo(priv->event_thread[i].worker->task);
   503		}
   504	
   505		ret = drm_vblank_init(ddev, priv->num_crtcs);
   506		if (ret < 0) {
   507			DRM_DEV_ERROR(dev, "failed to initialize vblank\n");
   508			goto err_msm_uninit;
   509		}
   510	
   511		if (kms) {
   512			pm_runtime_get_sync(dev);
   513			ret = msm_irq_install(ddev, kms->irq);
   514			pm_runtime_put_sync(dev);
   515			if (ret < 0) {
   516				DRM_DEV_ERROR(dev, "failed to install IRQ handler\n");
   517				goto err_msm_uninit;
   518			}
   519		}
   520	
   521		ret = drm_dev_register(ddev, 0);
   522		if (ret)
   523			goto err_msm_uninit;
   524	
   525		if (kms) {
   526			ret = msm_disp_snapshot_init(ddev);
   527			if (ret)
   528				DRM_DEV_ERROR(dev, "msm_disp_snapshot_init failed ret = %d\n", ret);
   529		}
   530		drm_mode_config_reset(ddev);
   531	
   532		ret = msm_debugfs_late_init(ddev);
   533		if (ret)
   534			goto err_msm_uninit;
   535	
   536		drm_kms_helper_poll_init(ddev);
   537	
 > 538		if (kms && fbdev)
   539			msm_fbdev_setup(ddev);
   540	
   541		return 0;
   542	
   543	err_msm_uninit:
   544		msm_drm_uninit(dev);
   545	err_drm_dev_put:
   546		drm_dev_put(ddev);
   547		return ret;
   548	}
   549	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
