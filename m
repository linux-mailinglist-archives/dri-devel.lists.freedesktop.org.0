Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5BDCD572E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 11:04:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F26210E21F;
	Mon, 22 Dec 2025 10:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DX3xwYra";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C0C110E21F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766397876; x=1797933876;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=J1EZZVCwpTiIbAyrMOpmNy+FRRI8Ai9A8vQMUUkNmH0=;
 b=DX3xwYraDdOg7VESPHMr33rlqhhNbppdLOtjw1WzT0k1mYAcMNnAhkVk
 rQStC4xW7BdQeIsHLb0DcXK8TwD/2kRhC/0MZhoHB7xenrd+KebeiO9Zo
 SxkqvOUhipJLJJTTiQRXOaf5NghgOmwjcz82j4M0aoNKZWbqgxA7ai11E
 7RcRFMQMSaAGFOQ1TApGjXnrYD3NrhFSNULv7tCxGEZoZFBxEWCUEofjo
 Mmdnf4qbDMnDN7TX915Jo4igKHm4JD3rPreuamYEP0ZeJ9xGYBLU/aNAe
 a/8GHxoJ9zWCkhmaca4af9Pijy4tjoMFjhXsrO0gJ46Gts9kHwbCFkmJv g==;
X-CSE-ConnectionGUID: qvyykBEeTbmDJdsm6WcltQ==
X-CSE-MsgGUID: lRwElsgoSLqc+g14AdFhYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="71883099"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; d="scan'208";a="71883099"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 02:04:36 -0800
X-CSE-ConnectionGUID: SENbKwQ2TGuu/Q2AuFUCmg==
X-CSE-MsgGUID: nfxshazyT4av5RHtxHYyhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; d="scan'208";a="222977989"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
 by fmviesa002.fm.intel.com with ESMTP; 22 Dec 2025 02:04:31 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vXcmC-000000000MH-2wzD;
 Mon, 22 Dec 2025 10:04:28 +0000
Date: Mon, 22 Dec 2025 18:03:51 +0800
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
Message-ID: <202512221735.mRV4BZqB-lkp@intel.com>
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
config: x86_64-randconfig-161-20251222 (https://download.01.org/0day-ci/archive/20251222/202512221735.mRV4BZqB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221735.mRV4BZqB-lkp@intel.com/

smatch warnings:
fs/libfs.c:1628 generic_check_addressable() warn: unsigned '*_d' is never less than zero.
fs/libfs.c:1628 generic_check_addressable() warn: unsigned '_a' is never less than zero.
mm/vmalloc.c:4708 remap_vmalloc_range_partial() warn: unsigned '*_d' is never less than zero.
mm/vmalloc.c:4708 remap_vmalloc_range_partial() warn: unsigned '_a' is never less than zero.

vim +1628 fs/libfs.c

1b061d9247f71c Christoph Hellwig   2010-05-26  1613  
30ca22c70e3ef0 Patrick J. LoPresti 2010-07-22  1614  /**
30ca22c70e3ef0 Patrick J. LoPresti 2010-07-22  1615   * generic_check_addressable - Check addressability of file system
30ca22c70e3ef0 Patrick J. LoPresti 2010-07-22  1616   * @blocksize_bits:	log of file system block size
30ca22c70e3ef0 Patrick J. LoPresti 2010-07-22  1617   * @num_blocks:		number of blocks in file system
30ca22c70e3ef0 Patrick J. LoPresti 2010-07-22  1618   *
30ca22c70e3ef0 Patrick J. LoPresti 2010-07-22  1619   * Determine whether a file system with @num_blocks blocks (and a
30ca22c70e3ef0 Patrick J. LoPresti 2010-07-22  1620   * block size of 2**@blocksize_bits) is addressable by the sector_t
30ca22c70e3ef0 Patrick J. LoPresti 2010-07-22  1621   * and page cache of the system.  Return 0 if so and -EFBIG otherwise.
30ca22c70e3ef0 Patrick J. LoPresti 2010-07-22  1622   */
30ca22c70e3ef0 Patrick J. LoPresti 2010-07-22  1623  int generic_check_addressable(unsigned blocksize_bits, u64 num_blocks)
30ca22c70e3ef0 Patrick J. LoPresti 2010-07-22  1624  {
30ca22c70e3ef0 Patrick J. LoPresti 2010-07-22  1625  	u64 last_fs_block = num_blocks - 1;
25050181b61aa0 Pankaj Raghav       2025-06-30  1626  	u64 last_fs_page, max_bytes;
25050181b61aa0 Pankaj Raghav       2025-06-30  1627  
25050181b61aa0 Pankaj Raghav       2025-06-30 @1628  	if (check_shl_overflow(num_blocks, blocksize_bits, &max_bytes))
25050181b61aa0 Pankaj Raghav       2025-06-30  1629  		return -EFBIG;
25050181b61aa0 Pankaj Raghav       2025-06-30  1630  
25050181b61aa0 Pankaj Raghav       2025-06-30  1631  	last_fs_page = (max_bytes >> PAGE_SHIFT) - 1;
30ca22c70e3ef0 Patrick J. LoPresti 2010-07-22  1632  
30ca22c70e3ef0 Patrick J. LoPresti 2010-07-22  1633  	if (unlikely(num_blocks == 0))
30ca22c70e3ef0 Patrick J. LoPresti 2010-07-22  1634  		return 0;
30ca22c70e3ef0 Patrick J. LoPresti 2010-07-22  1635  
25050181b61aa0 Pankaj Raghav       2025-06-30  1636  	if (blocksize_bits < 9)
30ca22c70e3ef0 Patrick J. LoPresti 2010-07-22  1637  		return -EINVAL;
30ca22c70e3ef0 Patrick J. LoPresti 2010-07-22  1638  
a33f13efe05192 Joel Becker         2010-08-16  1639  	if ((last_fs_block > (sector_t)(~0ULL) >> (blocksize_bits - 9)) ||
a33f13efe05192 Joel Becker         2010-08-16  1640  	    (last_fs_page > (pgoff_t)(~0ULL))) {
30ca22c70e3ef0 Patrick J. LoPresti 2010-07-22  1641  		return -EFBIG;
30ca22c70e3ef0 Patrick J. LoPresti 2010-07-22  1642  	}
30ca22c70e3ef0 Patrick J. LoPresti 2010-07-22  1643  	return 0;
30ca22c70e3ef0 Patrick J. LoPresti 2010-07-22  1644  }
30ca22c70e3ef0 Patrick J. LoPresti 2010-07-22  1645  EXPORT_SYMBOL(generic_check_addressable);
30ca22c70e3ef0 Patrick J. LoPresti 2010-07-22  1646  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
