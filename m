Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2786883360A
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jan 2024 21:21:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8228210E34F;
	Sat, 20 Jan 2024 20:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E3C10E346
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jan 2024 20:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705782057; x=1737318057;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=U78daOtSkrFdUaUQZUr/tYdCEiTmvCOAjx1R2N9s7GE=;
 b=PFk6mnTOsygrv5tQ1ivax1qq1gU0h2HGBG3XIQZyEKK6myP0CwoRq2eL
 IhOYCOw4A7J0nRGlLAxfPHUoKdQJVSo906CBHXlvoX4PGkRZBEVnzjH6w
 IMfmE46Z32LTliH6/IT1CM4Yk/w5SQ2cxGdNWSv/jLgJ38/xGpha+K2Mx
 gwx0iLWtcD+JRRFidyt29JsBLnlP/DEJBq2/Gd9LRsydAJzONEfIkgaHg
 fipecHoAl05x5VDK1JA4EzCVRpZ42FL9zMBsLDbWT4AP4EmTyJUWTZwfI
 zHFuuPoar2Wvy9pJ8M7XEXmwn0Lep4YB+Uz9MifNlRFURP4EQiPJzLtXu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="487111260"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; d="scan'208";a="487111260"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2024 12:20:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="941461"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 20 Jan 2024 12:20:53 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rRHpi-0005Pv-0Y;
 Sat, 20 Jan 2024 20:20:50 +0000
Date: Sun, 21 Jan 2024 04:20:40 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Cercueil <paul@crapouillou.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v5 1/6] dma-buf: Add dma_buf_{begin,end}_access()
Message-ID: <202401210406.YYgVcAC1-lkp@intel.com>
References: <20240119141402.44262-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240119141402.44262-2-paul@crapouillou.net>
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
Cc: linaro-mm-sig@lists.linaro.org, linux-usb@vger.kernel.org,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-doc@vger.kernel.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Jonathan Cameron <jic23@kernel.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus drm-misc/drm-misc-next lwn/docs-next linus/master v6.7 next-20240119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Cercueil/dma-buf-Add-dma_buf_-begin-end-_access/20240119-221604
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20240119141402.44262-2-paul%40crapouillou.net
patch subject: [PATCH v5 1/6] dma-buf: Add dma_buf_{begin,end}_access()
config: arm-randconfig-001-20240120 (https://download.01.org/0day-ci/archive/20240121/202401210406.YYgVcAC1-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d92ce344bf641e6bb025b41b3f1a77dd25e2b3e9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240121/202401210406.YYgVcAC1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401210406.YYgVcAC1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/dma-buf.c:1608: warning: Cannot understand  * @dma_buf_begin_access - Call before any hardware access from/to the DMABUF
    on line 1608 - I thought it was a doc line
>> drivers/dma-buf/dma-buf.c:1640: warning: Cannot understand  * @dma_buf_end_access - Call after any hardware access from/to the DMABUF
    on line 1640 - I thought it was a doc line


vim +1608 drivers/dma-buf/dma-buf.c

  1606	
  1607	/**
> 1608	 * @dma_buf_begin_access - Call before any hardware access from/to the DMABUF
  1609	 * @attach:	[in]	attachment used for hardware access
  1610	 * @sg_table:	[in]	scatterlist used for the DMA transfer
  1611	 * @direction:  [in]    direction of DMA transfer
  1612	 */
  1613	int dma_buf_begin_access(struct dma_buf_attachment *attach,
  1614				 struct sg_table *sgt, enum dma_data_direction dir)
  1615	{
  1616		struct dma_buf *dmabuf;
  1617		bool cookie;
  1618		int ret;
  1619	
  1620		if (WARN_ON(!attach))
  1621			return -EINVAL;
  1622	
  1623		dmabuf = attach->dmabuf;
  1624	
  1625		if (!dmabuf->ops->begin_access)
  1626			return 0;
  1627	
  1628		cookie = dma_fence_begin_signalling();
  1629		ret = dmabuf->ops->begin_access(attach, sgt, dir);
  1630		dma_fence_end_signalling(cookie);
  1631	
  1632		if (WARN_ON_ONCE(ret))
  1633			return ret;
  1634	
  1635		return 0;
  1636	}
  1637	EXPORT_SYMBOL_NS_GPL(dma_buf_begin_access, DMA_BUF);
  1638	
  1639	/**
> 1640	 * @dma_buf_end_access - Call after any hardware access from/to the DMABUF
  1641	 * @attach:	[in]	attachment used for hardware access
  1642	 * @sg_table:	[in]	scatterlist used for the DMA transfer
  1643	 * @direction:  [in]    direction of DMA transfer
  1644	 */
  1645	int dma_buf_end_access(struct dma_buf_attachment *attach,
  1646			       struct sg_table *sgt, enum dma_data_direction dir)
  1647	{
  1648		struct dma_buf *dmabuf;
  1649		bool cookie;
  1650		int ret;
  1651	
  1652		if (WARN_ON(!attach))
  1653			return -EINVAL;
  1654	
  1655		dmabuf = attach->dmabuf;
  1656	
  1657		if (!dmabuf->ops->end_access)
  1658			return 0;
  1659	
  1660		cookie = dma_fence_begin_signalling();
  1661		ret = dmabuf->ops->end_access(attach, sgt, dir);
  1662		dma_fence_end_signalling(cookie);
  1663	
  1664		if (WARN_ON_ONCE(ret))
  1665			return ret;
  1666	
  1667		return 0;
  1668	}
  1669	EXPORT_SYMBOL_NS_GPL(dma_buf_end_access, DMA_BUF);
  1670	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
