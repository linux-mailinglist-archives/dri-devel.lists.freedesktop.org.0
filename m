Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEBDB735B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 08:45:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9496F67F;
	Thu, 19 Sep 2019 06:45:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09D76F67F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 06:45:47 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Sep 2019 23:45:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,522,1559545200"; d="scan'208";a="202224644"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 18 Sep 2019 23:45:45 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iAqCG-0007ZY-W9; Thu, 19 Sep 2019 14:45:44 +0800
Date: Thu, 19 Sep 2019 14:45:07 +0800
From: kbuild test robot <lkp@intel.com>
To: Flora Cui <flora.cui@amd.com>
Subject: [radeon-alex:amd-mainline-dkms-5.0 3697/3724]
 include/drm/drm_fb_helper.h:641:1: sparse:  the previous one is here
Message-ID: <201909191458.ZRh1CjvS%lkp@intel.com>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Feifei Xu <Feifei.Xu@amd.com>, kbuild-all@01.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0871232889=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0871232889==
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   git://people.freedesktop.org/~agd5f/linux.git amd-mainline-dkms-5.0
head:   a51a5ad4b8daf0dd0a437d51a19c2baa98953675
commit: f460c248a3f0bca3a875602cf40693de672485c4 [3697/3724] drm/amd/autoconf: refactor dma_fence header check
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-rc1-7-g2b96cd8-dirty
        git checkout f460c248a3f0bca3a875602cf40693de672485c4
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   include/kcl/kcl_drm.h:167:1: sparse: sparse: multiple definitions for function 'drm_fb_helper_remove_conflicting_pci_framebuffers'
>> include/drm/drm_fb_helper.h:641:1: sparse:  the previous one is here
   include/kcl/kcl_drm.h:390:28: sparse: sparse: redefinition of struct drm_format_name_buf

vim +641 include/drm/drm_fb_helper.h

0a3bfe29f81622 Chris Wilson    2016-08-22  627  
c9527f0de508b1 Michał Mirosław 2018-09-07  628  /**
c9527f0de508b1 Michał Mirosław 2018-09-07  629   * drm_fb_helper_remove_conflicting_pci_framebuffers - remove firmware-configured framebuffers for PCI devices
c9527f0de508b1 Michał Mirosław 2018-09-07  630   * @pdev: PCI device
c9527f0de508b1 Michał Mirosław 2018-09-07  631   * @resource_id: index of PCI BAR configuring framebuffer memory
c9527f0de508b1 Michał Mirosław 2018-09-07  632   * @name: requesting driver name
c9527f0de508b1 Michał Mirosław 2018-09-07  633   *
c9527f0de508b1 Michał Mirosław 2018-09-07  634   * This function removes framebuffer devices (eg. initialized by firmware)
c9527f0de508b1 Michał Mirosław 2018-09-07  635   * using memory range configured for @pdev's BAR @resource_id.
c9527f0de508b1 Michał Mirosław 2018-09-07  636   *
c9527f0de508b1 Michał Mirosław 2018-09-07  637   * The function assumes that PCI device with shadowed ROM drives a primary
c9527f0de508b1 Michał Mirosław 2018-09-07  638   * display and so kicks out vga16fb.
c9527f0de508b1 Michał Mirosław 2018-09-07  639   */
4d18975c78f2d5 Michał Mirosław 2018-09-01  640  static inline int
4d18975c78f2d5 Michał Mirosław 2018-09-01 @641  drm_fb_helper_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
4d18975c78f2d5 Michał Mirosław 2018-09-01  642  						  int resource_id,
4d18975c78f2d5 Michał Mirosław 2018-09-01  643  						  const char *name)
4d18975c78f2d5 Michał Mirosław 2018-09-01  644  {
4d18975c78f2d5 Michał Mirosław 2018-09-01  645  #if IS_REACHABLE(CONFIG_FB)
4d18975c78f2d5 Michał Mirosław 2018-09-01  646  	return remove_conflicting_pci_framebuffers(pdev, resource_id, name);
4d18975c78f2d5 Michał Mirosław 2018-09-01  647  #else
4d18975c78f2d5 Michał Mirosław 2018-09-01  648  	return 0;
4d18975c78f2d5 Michał Mirosław 2018-09-01  649  #endif
4d18975c78f2d5 Michał Mirosław 2018-09-01  650  }
4d18975c78f2d5 Michał Mirosław 2018-09-01  651  

:::::: The code at line 641 was first introduced by commit
:::::: 4d18975c78f2d5c91792356501cf369e67594241 fbdev: add remove_conflicting_pci_framebuffers()

:::::: TO: Michał Mirosław <mirq-linux@rere.qmqm.pl>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--===============0871232889==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0871232889==--
