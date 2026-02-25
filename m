Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEDfDud9nmlrVgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 05:43:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1208191A35
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 05:43:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14CDA10E689;
	Wed, 25 Feb 2026 04:43:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EuxQVyhP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFDE610E15C;
 Wed, 25 Feb 2026 04:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771994593; x=1803530593;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=t8D1jQ9ZuCv1Th6BUK3UHEMBCGLUWLXCWP6xRrFdjOk=;
 b=EuxQVyhPMy4OYbB5SmiUTcnVma9daepJnEYd2cI/W6vZZpznTiEJmB8m
 ALrcwJoL1fsHkalk56k3bJt/GxzP1IA40g2Y+zrVNgYlIOer3HNKAbWef
 bzz2IYH05mgrvNm2Q+zcQNnqZ5VJSaqYiJv/TDiRCVIsqGm2ihQAB5vNd
 9NOuHvsipoLi5ruZ2eNpe5ztck5cFK16Hs4a1TWMmW7Ach8m72bM9Hxrr
 GUurlofhPmhzS8XXdGMF50eubhYA8mRecOgOsFPcx4JyFplAugmBw5se4
 vS5JTKQuZ+TkhL8rvsfEp4a045z4kl3oTNf6i85W3pzu9z/mvK/TPuOKW Q==;
X-CSE-ConnectionGUID: FaT8UBgsQMimO0HWEL0c5w==
X-CSE-MsgGUID: OXRyhaS8T5iTGlxvcRvHJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="76631499"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="76631499"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 20:43:13 -0800
X-CSE-ConnectionGUID: gJFov5EqTTK771rDhExCrw==
X-CSE-MsgGUID: xQlg1DhiQgaLy7mOujti4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="253871912"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
 by orviesa001.jf.intel.com with ESMTP; 24 Feb 2026 20:43:10 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vv6jV-000000003vV-0nt6;
 Wed, 25 Feb 2026 04:42:52 +0000
Date: Wed, 25 Feb 2026 12:42:31 +0800
From: kernel test robot <lkp@intel.com>
To: sunpeng.li@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Harry.Wentland@amd.com, simona@ffwll.ch,
 airlied@gmail.com, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, superm1@kernel.org,
 Leo Li <sunpeng.li@amd.com>
Subject: Re: [PATCH 2/5] drm/vblank: Introduce deferred vblank enable/disable
Message-ID: <202602251257.hwgG2w64-lkp@intel.com>
References: <20260224212639.390768-3-sunpeng.li@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224212639.390768-3-sunpeng.li@amd.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,amd.com,ffwll.ch,gmail.com,linux.intel.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url,git-scm.com:url]
X-Rspamd-Queue-Id: E1208191A35
X-Rspamd-Action: no action

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on daeinki-drm-exynos/exynos-drm-next drm/drm-next drm-i915/for-linux-next-fixes drm-tip/drm-tip linus/master v7.0-rc1 next-20260224]
[cannot apply to drm-i915/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/sunpeng-li-amd-com/drm-vblank-Add-drm_crtc_vblank_is_off-helper/20260225-052945
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260224212639.390768-3-sunpeng.li%40amd.com
patch subject: [PATCH 2/5] drm/vblank: Introduce deferred vblank enable/disable
config: microblaze-randconfig-r053-20260225 (https://download.01.org/0day-ci/archive/20260225/202602251257.hwgG2w64-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602251257.hwgG2w64-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/drm_vblank.c:1402:6-25: WARNING: atomic_dec_and_test variation before object free at line 1409.
   drivers/gpu/drm/drm_vblank.c:1402:6-25: WARNING: atomic_dec_and_test variation before object free at line 1416.

vim +1402 drivers/gpu/drm/drm_vblank.c

  1385	
  1386	void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
  1387	{
  1388		struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
  1389		int vblank_offdelay = vblank->config.offdelay_ms;
  1390		bool needs_deferred_disable;
  1391	
  1392		if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
  1393			return;
  1394	
  1395		if (drm_WARN_ON(dev, atomic_read(&vblank->refcount) == 0))
  1396			return;
  1397	
  1398		needs_deferred_disable =
  1399			drm_crtc_needs_deferred_vblank(drm_crtc_from_index(dev, pipe));
  1400	
  1401		/* Last user schedules interrupt disable */
> 1402		if (!atomic_dec_and_test(&vblank->refcount))
  1403			return;
  1404	
  1405		if (!vblank_offdelay)
  1406			return;
  1407		else if (vblank_offdelay < 0) {
  1408			if (needs_deferred_disable)
> 1409				mod_delayed_work(dev->deferred_vblank_wq,
  1410						 &vblank->disable_work,
  1411						 0);
  1412			else
  1413				vblank_disable_fn(&vblank->disable_timer);
  1414		} else if (!vblank->config.disable_immediate) {
  1415			if (needs_deferred_disable)
  1416				mod_delayed_work(dev->deferred_vblank_wq,
  1417						 &vblank->disable_work,
  1418						 msecs_to_jiffies(vblank_offdelay));
  1419			else
  1420				mod_timer(&vblank->disable_timer,
  1421					  jiffies + ((vblank_offdelay * HZ) / 1000));
  1422		}
  1423	}
  1424	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
