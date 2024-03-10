Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E685877596
	for <lists+dri-devel@lfdr.de>; Sun, 10 Mar 2024 08:20:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C7BE112719;
	Sun, 10 Mar 2024 07:20:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BUKVWLmK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A260110F323
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Mar 2024 07:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710055204; x=1741591204;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3EhUpcpxd3ve1kIYZvxRqF4hsYotNnSxvjMRam9Xd/0=;
 b=BUKVWLmK/d0svGpQf+vH7oJmOzQYX6MAom3MC6VG2FOYQYISRLEw2bXl
 RfGuqEtyUPHKjR7bKSoL1u31T7sldm+pFXjJhZAe22cecDMFT+Jvq6vZ2
 am7a/pxVx2JEotF3Mprrw61C7Pm+jfDPJEI6sWMgC8kGiSWQZ9RxusIbs
 JhO9a18gIG+W2sHxdL7U5y37/hlfCBvr3QTGr5Z2oQVO3MvwkncEhWrDF
 mbb7WKBZSSlIrethhL3TzGuu/5pHTq/Awxe8XmCIX+RsQJIevoBpN9bvI
 XwBDO6Og4ochFv0BfVdJ7uuGdxD07Wo2rTMbriO9QZ9mPsGppk5zDVcCl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="15376860"
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; d="scan'208";a="15376860"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2024 23:20:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; d="scan'208";a="10747039"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 09 Mar 2024 23:19:59 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rjDTQ-00083D-2E;
 Sun, 10 Mar 2024 07:19:56 +0000
Date: Sun, 10 Mar 2024 15:19:56 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Cercueil <paul@crapouillou.net>, Jonathan Cameron <jic23@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Nuno Sa <nuno.sa@analog.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v8 3/6] iio: core: Add new DMABUF interface infrastructure
Message-ID: <202403101535.uRqo6AIt-lkp@intel.com>
References: <20240308170046.92899-4-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240308170046.92899-4-paul@crapouillou.net>
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

Hi Paul,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on vkoul-dmaengine/next lwn/docs-next linus/master v6.8-rc7 next-20240308]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Cercueil/dmaengine-Add-API-function-dmaengine_prep_peripheral_dma_vec/20240309-010421
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20240308170046.92899-4-paul%40crapouillou.net
patch subject: [PATCH v8 3/6] iio: core: Add new DMABUF interface infrastructure
config: i386-randconfig-062-20240309 (https://download.01.org/0day-ci/archive/20240310/202403101535.uRqo6AIt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240310/202403101535.uRqo6AIt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403101535.uRqo6AIt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iio/industrialio-buffer.c:1765:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got int *user_req @@
   drivers/iio/industrialio-buffer.c:1765:40: sparse:     expected void const [noderef] __user *from
   drivers/iio/industrialio-buffer.c:1765:40: sparse:     got int *user_req
>> drivers/iio/industrialio-buffer.c:1988:53: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected int *user_req @@     got void [noderef] __user *_arg @@
   drivers/iio/industrialio-buffer.c:1988:53: sparse:     expected int *user_req
   drivers/iio/industrialio-buffer.c:1988:53: sparse:     got void [noderef] __user *_arg
   drivers/iio/industrialio-buffer.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +1765 drivers/iio/industrialio-buffer.c

  1755	
  1756	static int iio_buffer_detach_dmabuf(struct iio_dev_buffer_pair *ib,
  1757					    int *user_req, bool nonblock)
  1758	{
  1759		struct iio_buffer *buffer = ib->buffer;
  1760		struct iio_dev *indio_dev = ib->indio_dev;
  1761		struct iio_dmabuf_priv *priv;
  1762		struct dma_buf *dmabuf;
  1763		int dmabuf_fd, ret = -EPERM;
  1764	
> 1765		if (copy_from_user(&dmabuf_fd, user_req, sizeof(dmabuf_fd)))
  1766			return -EFAULT;
  1767	
  1768		dmabuf = dma_buf_get(dmabuf_fd);
  1769		if (IS_ERR(dmabuf))
  1770			return PTR_ERR(dmabuf);
  1771	
  1772		mutex_lock(&buffer->dmabufs_mutex);
  1773	
  1774		list_for_each_entry(priv, &buffer->dmabufs, entry) {
  1775			if (priv->attach->dev == indio_dev->dev.parent
  1776			    && priv->attach->dmabuf == dmabuf) {
  1777				list_del(&priv->entry);
  1778	
  1779				/* Unref the reference from iio_buffer_attach_dmabuf() */
  1780				iio_buffer_dmabuf_put(priv->attach);
  1781				ret = 0;
  1782				break;
  1783			}
  1784		}
  1785	
  1786		mutex_unlock(&buffer->dmabufs_mutex);
  1787		dma_buf_put(dmabuf);
  1788	
  1789		return ret;
  1790	}
  1791	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
