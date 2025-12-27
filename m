Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91477CDF54B
	for <lists+dri-devel@lfdr.de>; Sat, 27 Dec 2025 09:50:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 882E210E58C;
	Sat, 27 Dec 2025 08:50:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J7XzFEBN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B375910E58C
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 08:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766825425; x=1798361425;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RTojEMiAD/uiUEkVv8WCKlz5qD03a5+9MsYox/dtBt0=;
 b=J7XzFEBN4EFbFyu+gkedVrIxTnIvhzmlMicx/TMWkSRZy563N2RZIrdC
 WfTY6ZiCv7XYwlEAS9y4377hLtdu4g8dFfuEHlYjyulYEL30wNaOPk3Tf
 Zq90gdkf7KesmkBL/rD94oA3kK7+obReSD0j88RnKZQW3bll8XoOOcA8D
 QY/iBeptoKLaWzn2lzz96Vn6TjgvH1Z2+lqt+8c+KePdJCYh321BOHQhJ
 noBMgVRhYecmS4E94haG+YHHM8TPqv/S4soWAbw7ovW87P+KfeIexWsgw
 M44CqGouQupe3UU6a2WFAAxhjXnKtTapjm6yfn5qoibFQnekcNfWIbIJu g==;
X-CSE-ConnectionGUID: mfUXwJRdT3mommz0YD5z1A==
X-CSE-MsgGUID: tY14qT1aQI2ijIjG75pTjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="85957975"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; d="scan'208";a="85957975"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2025 00:50:24 -0800
X-CSE-ConnectionGUID: kEUaqMdDROuKkw6VwT9uhg==
X-CSE-MsgGUID: tYrD3lycQiO3GJGRIEib5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; d="scan'208";a="237927639"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
 by orviesa001.jf.intel.com with ESMTP; 27 Dec 2025 00:50:19 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vZQ04-000000005hJ-2JLG;
 Sat, 27 Dec 2025 08:50:13 +0000
Date: Sat, 27 Dec 2025 16:49:41 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Mailhol <mailhol@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chris Mason <chris.mason@fusionio.com>,
 David Sterba <dsterba@suse.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kbuild@vger.kernel.org,
 linux-sparse@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-btrfs@vger.kernel.org, linux-hardening@vger.kernel.org,
 Vincent Mailhol <mailhol@kernel.org>
Subject: Re: [PATCH v3 3/3] overflow: Remove is_non_negative() and
 is_negative()
Message-ID: <202512271618.33YepxDC-lkp@intel.com>
References: <20251220-remove_wtype-limits-v3-3-24b170af700e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251220-remove_wtype-limits-v3-3-24b170af700e@kernel.org>
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

Hi Vincent,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3e7f562e20ee87a25e104ef4fce557d39d62fa85]

url:    https://github.com/intel-lab-lkp/linux/commits/Vincent-Mailhol/kbuild-remove-gcc-s-Wtype-limits/20251220-190509
base:   3e7f562e20ee87a25e104ef4fce557d39d62fa85
patch link:    https://lore.kernel.org/r/20251220-remove_wtype-limits-v3-3-24b170af700e%40kernel.org
patch subject: [PATCH v3 3/3] overflow: Remove is_non_negative() and is_negative()
config: sparc-randconfig-r072-20251227 (https://download.01.org/0day-ci/archive/20251227/202512271618.33YepxDC-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512271618.33YepxDC-lkp@intel.com/

smatch warnings:
drivers/block/nbd.c:1612 __nbd_ioctl() warn: unsigned '_a' is never less than zero.

vim +/_a +1612 drivers/block/nbd.c

55313e92bd17a87 Mike Christie     2019-08-13  1591  
9442b739207aab6 Josef Bacik       2017-02-07  1592  /* Must be called with config_lock held */
9442b739207aab6 Josef Bacik       2017-02-07  1593  static int __nbd_ioctl(struct block_device *bdev, struct nbd_device *nbd,
9442b739207aab6 Josef Bacik       2017-02-07  1594  		       unsigned int cmd, unsigned long arg)
9442b739207aab6 Josef Bacik       2017-02-07  1595  {
5ea8d10802ec4c1 Josef Bacik       2017-04-06  1596  	struct nbd_config *config = nbd->config;
fad7cd3310db309 Baokun Li         2021-08-04  1597  	loff_t bytesize;
5ea8d10802ec4c1 Josef Bacik       2017-04-06  1598  
9442b739207aab6 Josef Bacik       2017-02-07  1599  	switch (cmd) {
9442b739207aab6 Josef Bacik       2017-02-07  1600  	case NBD_DISCONNECT:
29eaadc0364943b Josef Bacik       2017-04-06  1601  		return nbd_disconnect(nbd);
9442b739207aab6 Josef Bacik       2017-02-07  1602  	case NBD_CLEAR_SOCK:
0c1c9a27ce909e3 Christoph Hellwig 2023-08-11  1603  		nbd_clear_sock_ioctl(nbd);
29eaadc0364943b Josef Bacik       2017-04-06  1604  		return 0;
9442b739207aab6 Josef Bacik       2017-02-07  1605  	case NBD_SET_SOCK:
e46c7287b1c2768 Josef Bacik       2017-04-06  1606  		return nbd_add_socket(nbd, arg, false);
9442b739207aab6 Josef Bacik       2017-02-07  1607  	case NBD_SET_BLKSIZE:
dcbddf541f18e36 Christoph Hellwig 2020-11-16  1608  		return nbd_set_size(nbd, config->bytesize, arg);
9442b739207aab6 Josef Bacik       2017-02-07  1609  	case NBD_SET_SIZE:
41e76c6a3c83c85 Nick Desaulniers  2021-09-20  1610  		return nbd_set_size(nbd, arg, nbd_blksize(config));
9442b739207aab6 Josef Bacik       2017-02-07  1611  	case NBD_SET_SIZE_BLOCKS:
41e76c6a3c83c85 Nick Desaulniers  2021-09-20 @1612  		if (check_shl_overflow(arg, config->blksize_bits, &bytesize))
fad7cd3310db309 Baokun Li         2021-08-04  1613  			return -EINVAL;
41e76c6a3c83c85 Nick Desaulniers  2021-09-20  1614  		return nbd_set_size(nbd, bytesize, nbd_blksize(config));
9442b739207aab6 Josef Bacik       2017-02-07  1615  	case NBD_SET_TIMEOUT:
55313e92bd17a87 Mike Christie     2019-08-13  1616  		nbd_set_cmd_timeout(nbd, arg);
9442b739207aab6 Josef Bacik       2017-02-07  1617  		return 0;
9442b739207aab6 Josef Bacik       2017-02-07  1618  
9442b739207aab6 Josef Bacik       2017-02-07  1619  	case NBD_SET_FLAGS:
5ea8d10802ec4c1 Josef Bacik       2017-04-06  1620  		config->flags = arg;
9442b739207aab6 Josef Bacik       2017-02-07  1621  		return 0;
9442b739207aab6 Josef Bacik       2017-02-07  1622  	case NBD_DO_IT:
2a852a693f8839b Christoph Hellwig 2022-03-30  1623  		return nbd_start_device_ioctl(nbd);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1624  	case NBD_CLEAR_QUE:
4b2f0260c74324a Herbert Xu        2006-01-06  1625  		/*
4b2f0260c74324a Herbert Xu        2006-01-06  1626  		 * This is for compatibility only.  The queue is always cleared
4b2f0260c74324a Herbert Xu        2006-01-06  1627  		 * by NBD_DO_IT or NBD_CLEAR_SOCK.
4b2f0260c74324a Herbert Xu        2006-01-06  1628  		 */
^1da177e4c3f415 Linus Torvalds    2005-04-16  1629  		return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1630  	case NBD_PRINT_DEBUG:
fd8383fd88a2fd8 Josef Bacik       2016-09-08  1631  		/*
fd8383fd88a2fd8 Josef Bacik       2016-09-08  1632  		 * For compatibility only, we no longer keep a list of
fd8383fd88a2fd8 Josef Bacik       2016-09-08  1633  		 * outstanding requests.
fd8383fd88a2fd8 Josef Bacik       2016-09-08  1634  		 */
^1da177e4c3f415 Linus Torvalds    2005-04-16  1635  		return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1636  	}
1a2ad21128bb4eb Pavel Machek      2009-04-02  1637  	return -ENOTTY;
1a2ad21128bb4eb Pavel Machek      2009-04-02  1638  }
1a2ad21128bb4eb Pavel Machek      2009-04-02  1639  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
