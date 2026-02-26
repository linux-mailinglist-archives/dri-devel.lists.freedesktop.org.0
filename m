Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cA8pKha4oGnClwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 22:16:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C041AF965
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 22:16:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31CA210E9A1;
	Thu, 26 Feb 2026 21:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AZ0XYGDU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BA410E9A1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 21:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772140563; x=1803676563;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YwPQeyGBzJcABYucg90H9LmrLb/nelrgO9edJ4pmwS0=;
 b=AZ0XYGDUIzxJ3qK14WHSQJSrpceUeObiO7kQbUmgngDhcRd8c7re8lDQ
 /91vY3V8VEG5pWO1MHLvxtYYEbyqU09Kk0Xxd7sMLkbQvFfT5THJgr5FS
 eNqTPeXAXOppdCRPk7lvB0uU17EBxCgHiIHt9yhM6AofMRxNq5fvOBlTY
 aPCANQrAclX7cihPQarmgXyI7C8dPpYNl65u5LzC0xSR2ETDKcz+PKrrh
 asQ+uVaFPgboyVleYNAz62SRoqzAc6yD14sRrjajkntCg2AezmZ88XjIO
 BOCUA/jguBHNqC/29RDG2IIT4UwigbO2vfr6gtibgR/edXwC1NKaSEpEu g==;
X-CSE-ConnectionGUID: +HqY068JSWSePe5pav2QAQ==
X-CSE-MsgGUID: DOa5GXrIRra664W5CTILKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="72422788"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="72422788"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 13:16:02 -0800
X-CSE-ConnectionGUID: KF8q2MCfQ7KO5yyM2PuPtA==
X-CSE-MsgGUID: booS3pxyQp61NWJ++rs5Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="216816235"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
 by orviesa007.jf.intel.com with ESMTP; 26 Feb 2026 13:15:57 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vviiA-000000009sp-1VpU;
 Thu, 26 Feb 2026 21:15:54 +0000
Date: Fri, 27 Feb 2026 05:15:49 +0800
From: kernel test robot <lkp@intel.com>
To: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Jiwei Fu <jiwei.fu@nxp.com>, Forrest Shi <xuelin.shi@nxp.com>,
 Alexandru Taran <alexandru.taran@nxp.com>,
 Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
Subject: Re: [PATCH 5/9] accel/neutron: Add GEM buffer object support
Message-ID: <202602270531.MP8x6wo3-lkp@intel.com>
References: <20260226-neutron-v1-5-46eccb3bb50a@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226-neutron-v1-5-46eccb3bb50a@nxp.com>
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
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ruxandra.radulescu@nxp.com,m:ogabbay@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:robh@kernel.org,m:krzk@kernel.org,m:conor+dt@kernel.org,m:Frank.Li@nxp.com,m:christian.koenig@amd.com,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:jiwei.fu@nxp.com,m:xuelin.shi@nxp.com,m:alexandru.taran@nxp.com,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[nxp.com,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 10C041AF965
X-Rspamd-Action: no action

Hi Ioana,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f]

url:    https://github.com/intel-lab-lkp/linux/commits/Ioana-Ciocoi-Radulescu/drm-gem-dma-Add-flag-for-bidirectional-mapping-of-non-coherent-GEM-DMA-buffers/20260226-221222
base:   6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
patch link:    https://lore.kernel.org/r/20260226-neutron-v1-5-46eccb3bb50a%40nxp.com
patch subject: [PATCH 5/9] accel/neutron: Add GEM buffer object support
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260227/202602270531.MP8x6wo3-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602270531.MP8x6wo3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602270531.MP8x6wo3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/accel/neutron/neutron_gem.c:52:6: warning: variable 'gem_obj' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
      52 |         if (drm_WARN_ON(drm, !IS_ALIGNED(dma_obj->dma_addr, NEUTRON_BO_ALIGN))) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:789:2: note: expanded from macro 'drm_WARN_ON'
     789 |         drm_WARN((drm), (x), "%s",                                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     790 |                  "drm_WARN_ON(" __stringify(x) ")")
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:779:2: note: expanded from macro 'drm_WARN'
     779 |         WARN(condition, "%s %s: [drm] " format,                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     780 |                         dev_driver_string(__drm_to_dev(drm)),           \
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     781 |                         dev_name(__drm_to_dev(drm)), ## arg)
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:163:36: note: expanded from macro 'WARN'
     163 | #define WARN(condition, format...) ({                                   \
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     164 |         int __ret_warn_on = !!(condition);                              \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     165 |         if (unlikely(__ret_warn_on))                                    \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     166 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     167 |         unlikely(__ret_warn_on);                                        \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     168 | })
         | ~~
   drivers/accel/neutron/neutron_gem.c:67:21: note: uninitialized use occurs here
      67 |         drm_gem_object_put(gem_obj);
         |                            ^~~~~~~
   drivers/accel/neutron/neutron_gem.c:52:2: note: remove the 'if' if its condition is always false
      52 |         if (drm_WARN_ON(drm, !IS_ALIGNED(dma_obj->dma_addr, NEUTRON_BO_ALIGN))) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      53 |                 ret = -EFAULT;
         |                 ~~~~~~~~~~~~~~
      54 |                 goto out_put;
         |                 ~~~~~~~~~~~~~
      55 |         }
         |         ~
   drivers/accel/neutron/neutron_gem.c:38:32: note: initialize the variable 'gem_obj' to silence this warning
      38 |         struct drm_gem_object *gem_obj;
         |                                       ^
         |                                        = NULL
   1 warning generated.


vim +52 drivers/accel/neutron/neutron_gem.c

    33	
    34	int neutron_ioctl_create_bo(struct drm_device *drm, void *data, struct drm_file *filp)
    35	{
    36		struct drm_neutron_create_bo *args = data;
    37		struct drm_gem_dma_object *dma_obj;
    38		struct drm_gem_object *gem_obj;
    39		size_t size;
    40		int ret;
    41	
    42		if (!args->size || args->pad)
    43			return -EINVAL;
    44	
    45		size = ALIGN(args->size, NEUTRON_BO_ALIGN);
    46	
    47		dma_obj = drm_gem_dma_create(drm, size);
    48		if (IS_ERR(dma_obj))
    49			return PTR_ERR(dma_obj);
    50	
    51		/* We expect correctly aligned buffers, but double-check */
  > 52		if (drm_WARN_ON(drm, !IS_ALIGNED(dma_obj->dma_addr, NEUTRON_BO_ALIGN))) {
    53			ret = -EFAULT;
    54			goto out_put;
    55		}
    56	
    57		gem_obj = &dma_obj->base;
    58		ret = drm_gem_handle_create(filp, gem_obj, &args->handle);
    59		if (ret)
    60			goto out_put;
    61	
    62		args->map_offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
    63		args->size = gem_obj->size;
    64	
    65	out_put:
    66		/* No need to keep a reference of the GEM object. Freeing is handled by user */
    67		drm_gem_object_put(gem_obj);
    68	
    69		return ret;
    70	}
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
