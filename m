Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D6C7160CB
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 14:58:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A53D610E0A3;
	Tue, 30 May 2023 12:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3431910E13B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 12:58:14 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:36042.1831460184
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id EB33C100198;
 Tue, 30 May 2023 20:58:09 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-7vx9t with ESMTP id
 74c4c7cd99da4575ac5fd10594e22a3e for lkp@intel.com; 
 Tue, 30 May 2023 20:58:10 CST
X-Transaction-ID: 74c4c7cd99da4575ac5fd10594e22a3e
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <c3d67084-df46-6ea4-2f37-43cc03147ef9@189.cn>
Date: Tue, 30 May 2023 20:58:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 5/6] drm/etnaviv: expand driver support for the PCI
 devices
To: kernel test robot <lkp@intel.com>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230529172452.2148819-6-suijingfeng@loongson.cn>
 <202305301659.4guSLavL-lkp@intel.com>
Content-Language: en-US
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <202305301659.4guSLavL-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: loongson-kernel@lists.loongnix.cn, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


Previously, I don't realize some arch doesn't enable CONFIG_PCI by default.

This problem only happens on the arch which CONFIG_PCI isn't being enabled.

This problem also caused by the fact that pci_clear_master don't have a 
dummy implement.

I have create a patch to fix that, see [1].


This problem is easy to fix,  with some #ifdef and #endif definition guard,

make the PCI driver support don't get compiled on the architecture which 
don't have  CONFIG_PCI enable. Originally, I want it always built-in.


Should I fix this problem at driver side and respin this patch?


[1] 
https://patchwork.kernel.org/project/linux-pci/patch/20230530101655.2275731-1-suijingfeng@loongson.cn/


On 2023/5/30 17:00, kernel test robot wrote:
> Hi Sui,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on drm-misc/drm-misc-next]
> [also build test ERROR on drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.4-rc4 next-20230530]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Sui-Jingfeng/drm-etnaviv-add-a-dedicated-function-to-register-an-irq-handler/20230530-012547
> base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> patch link:    https://lore.kernel.org/r/20230529172452.2148819-6-suijingfeng%40loongson.cn
> patch subject: [PATCH v5 5/6] drm/etnaviv: expand driver support for the PCI devices
> config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230530/202305301659.4guSLavL-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 12.3.0
> reproduce (this is a W=1 build):
>          mkdir -p ~/bin
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://github.com/intel-lab-lkp/linux/commit/1d05a5fa048dd4b2a934ffbb07c330ddd9279287
>          git remote add linux-review https://github.com/intel-lab-lkp/linux
>          git fetch --no-tags linux-review Sui-Jingfeng/drm-etnaviv-add-a-dedicated-function-to-register-an-irq-handler/20230530-012547
>          git checkout 1d05a5fa048dd4b2a934ffbb07c330ddd9279287
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k olddefconfig
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/gpu/drm/etnaviv/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202305301659.4guSLavL-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>     drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c: In function 'etnaviv_gpu_pci_fini':
>>> drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c:32:9: error: implicit declaration of function 'pci_clear_master'; did you mean 'pci_set_master'? [-Werror=implicit-function-declaration]
>        32 |         pci_clear_master(pdev);
>           |         ^~~~~~~~~~~~~~~~
>           |         pci_set_master
>     cc1: some warnings being treated as errors
>
>
> vim +32 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
>
>      27	
>      28	static void etnaviv_gpu_pci_fini(struct etnaviv_gpu *gpu, bool component)
>      29	{
>      30		struct pci_dev *pdev = to_pci_dev(gpu->dev);
>      31	
>    > 32		pci_clear_master(pdev);
>      33	
>      34		dev_dbg(gpu->dev, "component is %s\n",
>      35			component ? "enabled" : "disabled");
>      36	}
>      37	
>
