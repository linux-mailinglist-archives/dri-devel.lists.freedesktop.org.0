Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5903B6BAAE5
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 09:37:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0839510E2D4;
	Wed, 15 Mar 2023 08:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1963410E2D4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 08:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678869451; x=1710405451;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MGe+wu03SgVhyZX13WFZVMUGp4Eh/8ZQN9CHXaDvzYI=;
 b=KLgJVassRHCwSdY5PJ8+epaaALSnRPXGntqtbqUTP8YVSZosg8io500n
 9nkFeyn1RYFJ+AtYlclqHORGv7JBC+YAmYWfbGAJYarO8pkvwYUAvAEXu
 I07swE20qDT9TdrGnwgmtnFGugDmOiEqYhtyZGnfFTvaoiM7MXNZTcfaT
 Xcl0tSkziaDUfMuI7DaRJQa2Ul1T4S6pwr97lUoSZ9C1Du6v009p0CFP1
 3ulNI3uD7gVvJrgsU7VFGKrvrsDtlXx/54TTGmrCC9a12XpKUkkMJh5X5
 51HgWzCKDrtC5wm8LKB0nxfTfZJBlXhbWLrQxH4uk9wxkEzEeIS76uVq4 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="317299583"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="317299583"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 01:37:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="789713577"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="789713577"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 15 Mar 2023 01:37:26 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pcMdS-0007Xn-0o;
 Wed, 15 Mar 2023 08:37:26 +0000
Date: Wed, 15 Mar 2023 16:36:29 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Cercueil <paul@crapouillou.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 2/2] usb: gadget: functionfs: Add DMABUF import interface
Message-ID: <202303151639.4xUPfzJD-lkp@intel.com>
References: <20230314105257.17345-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230314105257.17345-3-paul@crapouillou.net>
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
 michael.hennerich@analog.com, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nuno.sa@analog.com, Paul Cercueil <paul@crapouillou.net>,
 oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

I love your patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linus/master v6.3-rc2 next-20230315]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Cercueil/usb-gadget-Support-already-mapped-DMA-SGs/20230314-185522
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20230314105257.17345-3-paul%40crapouillou.net
patch subject: [PATCH 2/2] usb: gadget: functionfs: Add DMABUF import interface
config: s390-randconfig-r002-20230312 (https://download.01.org/0day-ci/archive/20230315/202303151639.4xUPfzJD-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/4ee364ed5d112c4550344fd037f4e1ef7cc41878
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Paul-Cercueil/usb-gadget-Support-already-mapped-DMA-SGs/20230314-185522
        git checkout 4ee364ed5d112c4550344fd037f4e1ef7cc41878
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/media/platform/mediatek/jpeg/ drivers/usb/gadget/function/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303151639.4xUPfzJD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/usb/gadget/function/f_fs.c:18:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from drivers/usb/gadget/function/f_fs.c:18:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from drivers/usb/gadget/function/f_fs.c:18:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> drivers/usb/gadget/function/f_fs.c:1401:5: warning: no previous prototype for function 'ffs_dma_resv_lock' [-Wmissing-prototypes]
   int ffs_dma_resv_lock(struct dma_buf *dmabuf, bool nonblock)
       ^
   drivers/usb/gadget/function/f_fs.c:1401:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int ffs_dma_resv_lock(struct dma_buf *dmabuf, bool nonblock)
   ^
   static 
   13 warnings generated.


vim +/ffs_dma_resv_lock +1401 drivers/usb/gadget/function/f_fs.c

  1400	
> 1401	int ffs_dma_resv_lock(struct dma_buf *dmabuf, bool nonblock)
  1402	{
  1403		int ret;
  1404	
  1405		ret = dma_resv_lock_interruptible(dmabuf->resv, NULL);
  1406		if (ret) {
  1407			if (ret != -EDEADLK)
  1408				goto out;
  1409			if (nonblock) {
  1410				ret = -EBUSY;
  1411				goto out;
  1412			}
  1413	
  1414			ret = dma_resv_lock_slow_interruptible(dmabuf->resv, NULL);
  1415		}
  1416	
  1417	out:
  1418		return ret;
  1419	}
  1420	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
