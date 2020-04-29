Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C40E31BEC5C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 01:03:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C406EB33;
	Wed, 29 Apr 2020 23:03:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ACD06EB33
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 23:03:22 +0000 (UTC)
IronPort-SDR: j+sUJfxwU7vzvE21x+c/6J9dEHNhOX0nozq9ZmVOJ2jxXrGXZ45FKUf5d8ZmRWdpfyoy5PHh31
 YNpO0xBG6ieg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2020 16:03:21 -0700
IronPort-SDR: vKEp8Y9Ajv/ELuwNCe/6yhSD7X7/HMdYmnUh7SD3QtSKA6dQEMbbFtwPCnpq2ryorF9aIOZ7zg
 x/o6BwdmfgUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,333,1583222400"; d="scan'208";a="248110477"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 29 Apr 2020 16:03:19 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jTvja-000Iu8-VP; Thu, 30 Apr 2020 07:03:18 +0800
Date: Thu, 30 Apr 2020 07:02:56 +0800
From: kbuild test robot <lkp@intel.com>
To: Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org,
 nirmoy.das@amd.com, christian.koenig@amd.com, chris@chris-wilson.co.uk
Subject: Re: [PATCH 1/1] drm/mm: optimize rb_hole_addr rbtree search in high
 addr mode
Message-ID: <202004300618.hMnnzauL%lkp@intel.com>
References: <20200428160423.4402-1-nirmoy.das@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428160423.4402-1-nirmoy.das@amd.com>
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
Cc: nirmoy.das@amd.com, kbuild-all@lists.01.org, christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-exynos/exynos-drm-next tegra-drm/drm/tegra/for-next drm-tip/drm-tip linus/master v5.7-rc3 next-20200429]
[cannot apply to drm/drm-next]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Nirmoy-Das/drm-mm-optimize-rb_hole_addr-rbtree-search-in-high-addr-mode/20200429-154950
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/drm_mm.c:455:24: sparse: sparse: Using plain integer as NULL pointer

vim +455 drivers/gpu/drm/drm_mm.c

   431	
   432	/**
   433	 * next_hole_high_addr - returns next hole for a DRM_MM_INSERT_HIGH mode request
   434	 * @entry: previously selected drm_mm_node
   435	 * @size: size of the a hole needed for the request
   436	 *
   437	 * This function will verify whether left subtree of @entry has hole big enough
   438	 * to fit the requtested size. If so, it will return previous node of @entry or
   439	 * else it will return parent node of @entry
   440	 *
   441	 * It will also skip the complete left subtree if max_hole_size of that subtree
   442	 * is same as the max_hole_size of the @entry.
   443	 *
   444	 * Returns:
   445	 * previous node of @entry if left subtree of @entry can serve the request or
   446	 * else return parent of @entry
   447	 */
   448	static struct drm_mm_node *
   449	next_hole_high_addr(struct drm_mm_node *entry, u64 size)
   450	{
   451		struct rb_node *rb_node, *left_rb_node, *parent_rb_node;
   452		struct drm_mm_node *left_node;
   453	
   454		if (!entry)
 > 455			return false;
   456	
   457		rb_node = &entry->rb_hole_addr;
   458		if (rb_node->rb_left) {
   459			left_rb_node = rb_node->rb_left;
   460			parent_rb_node = rb_parent(rb_node);
   461			left_node = rb_entry(left_rb_node,
   462					     struct drm_mm_node, rb_hole_addr);
   463			if ((left_node->max_hole_size < size ||
   464			     entry->size == entry->max_hole_size) &&
   465			    parent_rb_node && parent_rb_node->rb_left != rb_node)
   466				return rb_hole_addr_to_node(parent_rb_node);
   467		}
   468	
   469		return rb_hole_addr_to_node(rb_prev(rb_node));
   470	}
   471	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
