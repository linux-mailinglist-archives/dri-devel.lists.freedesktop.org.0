Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D714A5855
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 09:13:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55F8710EB03;
	Tue,  1 Feb 2022 08:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A0A10EAC9;
 Tue,  1 Feb 2022 08:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643703211; x=1675239211;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nPSQKuIXYlxkx1AwqzWrUCeAbzqbk2COfYDFVttPyDI=;
 b=GzhoM2rxh0GpdM3a8vV9THRQXL7+Br2DGGzjzcOjlCpd8Bib3Bjq1ypr
 zZ+sC/4u0YuNF3zRD41bZFtckRimhBiHq8AY6RvXFr4xXIbB/bWs9/A70
 XdaqJWVApd3Ld+wn7lMBAL8vBCrpqFKG5FIgX4zSkyPwA/L1ivrLp7AUb
 5m48YzCcdnaM5f3ezRzbUk5oTQqoSVVP3yIIYfIPQa5JRxsdkI3hTcTmP
 znpWkbjoOWHBWtdur+gAgtrsvYWMlaAhz89Q9W9HIpepg/YQBV9/ZgegV
 bRQIao9JfpbdEbIVtSnWFajxht7S7ij1idpY15BjbFtnKKpa7TmeDaPWR g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="247411512"
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="247411512"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 00:13:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="537709080"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 01 Feb 2022 00:13:27 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nEoI3-000T0T-0G; Tue, 01 Feb 2022 08:13:27 +0000
Date: Tue, 1 Feb 2022 16:13:05 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 21/21] fbdev: Make registered_fb[] private to
 fbmem.c
Message-ID: <202202011603.vczWPod7-lkp@intel.com>
References: <20220131210552.482606-22-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131210552.482606-22-daniel.vetter@ffwll.ch>
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 kbuild-all@lists.01.org, Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Jens Frederich <jfrederich@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Zheyu Ma <zheyuma97@gmail.com>, LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

I love your patch! Yet something to improve:

[auto build test ERROR on tegra-drm/drm/tegra/for-next]
[also build test ERROR on drm/drm-next linus/master v5.17-rc2 next-20220131]
[cannot apply to airlied/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Daniel-Vetter/some-fbcon-patches-mostly-locking/20220201-050907
base:   git://anongit.freedesktop.org/tegra/linux.git drm/tegra/for-next
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220201/202202011603.vczWPod7-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/245da5ab93b17c0cf1521713d5bde655a72efb65
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Daniel-Vetter/some-fbcon-patches-mostly-locking/20220201-050907
        git checkout 245da5ab93b17c0cf1521713d5bde655a72efb65
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/staging/olpc_dcon/olpc_dcon.c: In function 'dcon_probe':
>> drivers/staging/olpc_dcon/olpc_dcon.c:605:6: error: 'num_registered_fb' undeclared (first use in this function); did you mean 'WB_registered'?
     605 |  if (num_registered_fb < 1) {
         |      ^~~~~~~~~~~~~~~~~
         |      WB_registered
   drivers/staging/olpc_dcon/olpc_dcon.c:605:6: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/staging/olpc_dcon/olpc_dcon.c:610:17: error: 'registered_fb' undeclared (first use in this function)
     610 |  dcon->fbinfo = registered_fb[0];
         |                 ^~~~~~~~~~~~~


vim +605 drivers/staging/olpc_dcon/olpc_dcon.c

53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  584  
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  585  static int dcon_probe(struct i2c_client *client, const struct i2c_device_id *id)
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  586  {
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  587  	struct dcon_priv *dcon;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  588  	int rc, i, j;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  589  
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  590  	if (!pdata)
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  591  		return -ENXIO;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  592  
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  593  	dcon = kzalloc(sizeof(*dcon), GFP_KERNEL);
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  594  	if (!dcon)
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  595  		return -ENOMEM;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  596  
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  597  	dcon->client = client;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  598  	init_waitqueue_head(&dcon->waitq);
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  599  	INIT_WORK(&dcon->switch_source, dcon_source_switch);
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  600  	dcon->reboot_nb.notifier_call = dcon_reboot_notify;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  601  	dcon->reboot_nb.priority = -1;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  602  
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  603  	i2c_set_clientdata(client, dcon);
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  604  
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04 @605  	if (num_registered_fb < 1) {
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  606  		dev_err(&client->dev, "DCON driver requires a registered fb\n");
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  607  		rc = -EIO;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  608  		goto einit;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  609  	}
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04 @610  	dcon->fbinfo = registered_fb[0];
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  611  
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  612  	rc = dcon_hw_init(dcon, 1);
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  613  	if (rc)
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  614  		goto einit;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  615  
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  616  	/* Add the DCON device */
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  617  
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  618  	dcon_device = platform_device_alloc("dcon", -1);
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  619  
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  620  	if (!dcon_device) {
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  621  		pr_err("Unable to create the DCON device\n");
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  622  		rc = -ENOMEM;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  623  		goto eirq;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  624  	}
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  625  	rc = platform_device_add(dcon_device);
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  626  	platform_set_drvdata(dcon_device, dcon);
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  627  
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  628  	if (rc) {
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  629  		pr_err("Unable to add the DCON device\n");
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  630  		goto edev;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  631  	}
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  632  
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  633  	for (i = 0; i < ARRAY_SIZE(dcon_device_files); i++) {
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  634  		rc = device_create_file(&dcon_device->dev,
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  635  					&dcon_device_files[i]);
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  636  		if (rc) {
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  637  			dev_err(&dcon_device->dev, "Cannot create sysfs file\n");
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  638  			goto ecreate;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  639  		}
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  640  	}
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  641  
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  642  	dcon->bl_val = dcon_read(dcon, DCON_REG_BRIGHT) & 0x0F;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  643  
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  644  	/* Add the backlight device for the DCON */
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  645  	dcon_bl_props.brightness = dcon->bl_val;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  646  	dcon->bl_dev = backlight_device_register("dcon-bl", &dcon_device->dev,
848d9eabcaebf21 Zebulon McCorkle   2017-11-21  647  						 dcon, &dcon_bl_ops,
848d9eabcaebf21 Zebulon McCorkle   2017-11-21  648  						 &dcon_bl_props);
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  649  	if (IS_ERR(dcon->bl_dev)) {
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  650  		dev_err(&client->dev, "cannot register backlight dev (%ld)\n",
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  651  			PTR_ERR(dcon->bl_dev));
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  652  		dcon->bl_dev = NULL;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  653  	}
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  654  
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  655  	register_reboot_notifier(&dcon->reboot_nb);
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  656  	atomic_notifier_chain_register(&panic_notifier_list, &dcon_panic_nb);
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  657  
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  658  	return 0;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  659  
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  660   ecreate:
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  661  	for (j = 0; j < i; j++)
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  662  		device_remove_file(&dcon_device->dev, &dcon_device_files[j]);
4996b4610767064 Jing Xiangfeng     2020-11-20  663  	platform_device_del(dcon_device);
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  664   edev:
4996b4610767064 Jing Xiangfeng     2020-11-20  665  	platform_device_put(dcon_device);
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  666  	dcon_device = NULL;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  667   eirq:
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  668  	free_irq(DCON_IRQ, dcon);
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  669   einit:
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  670  	kfree(dcon);
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  671  	return rc;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  672  }
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  673  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
