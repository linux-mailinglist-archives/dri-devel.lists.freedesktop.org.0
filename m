Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBE28B82C5
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2024 00:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC88110EC6D;
	Tue, 30 Apr 2024 22:51:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TMALhvsN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FCF010EC6D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 22:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714517464; x=1746053464;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WI6e855Kc92SAi9gqKtnj+EkJ3KnHR+2fh4AgnRu2iY=;
 b=TMALhvsNrlcfD/nXj/0eRkh/hpa9ZVPa/4lvho5AIqQNsJRtHow1Reea
 1ebhd5GUHXWiKy2Fl6uTAensmZ0i9VJ7ueso1Ee4r2g1wmMigMmR3UsAG
 tOdx5YAe8fGin6DV3sGVtVNUnebcLXC3O57zV19kSkQ9xqowXChtGkpGn
 gWSCLRrLymH52dlUO/ZBA+dLx4tfVGIwdm/UiAmJ0/02M/0onYFkLE+dX
 28ds5jwbj3B1O/geKn1sCuuOTPIWrxDbzxovLeID81mmxYT15SLHBZBL8
 gOACxzLnvtcTiYK1Xvv/xUSDQKjElo1ebhiCDo/AlQfl0P2BoJrMLNzH4 g==;
X-CSE-ConnectionGUID: noyFH3/SQsuSSLlG5O2hXQ==
X-CSE-MsgGUID: BLbfAHD9RhOiV5VVhwpW8Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10790886"
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; d="scan'208";a="10790886"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 15:51:02 -0700
X-CSE-ConnectionGUID: FZkSokSlRC6f+NGqNm3JLw==
X-CSE-MsgGUID: qu5447TjTguXRIksIdWSjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; d="scan'208";a="64102738"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 30 Apr 2024 15:50:59 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1s1wJM-0008fJ-0R;
 Tue, 30 Apr 2024 22:50:56 +0000
Date: Wed, 1 May 2024 06:50:26 +0800
From: kernel test robot <lkp@intel.com>
To: Weishi Li <liweishi@kylinos.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, airlied@redhat.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 gurchetansingh@chromium.org, kraxel@redhat.com,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, olvaffe@gmail.com, tzimmermann@suse.de,
 virtualization@lists.linux.dev
Subject: Re: [PATCH] [PATCH RESEND] drm/virtio: fix memory leak of vbuf
Message-ID: <202405010653.utlwekew-lkp@intel.com>
References: <20240429030541.56702-1-liweishi@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240429030541.56702-1-liweishi@kylinos.cn>
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

Hi Weishi,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.9-rc6 next-20240430]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Weishi-Li/drm-virtio-fix-memory-leak-of-vbuf/20240430-132447
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240429030541.56702-1-liweishi%40kylinos.cn
patch subject: [PATCH] [PATCH RESEND] drm/virtio: fix memory leak of vbuf
config: hexagon-randconfig-001-20240501 (https://download.01.org/0day-ci/archive/20240501/202405010653.utlwekew-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405010653.utlwekew-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405010653.utlwekew-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/virtio/virtgpu_vq.c:29:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/gpu/drm/virtio/virtgpu_vq.c:29:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/gpu/drm/virtio/virtgpu_vq.c:29:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   drivers/gpu/drm/virtio/virtgpu_vq.c:474:2: error: expected expression
           else if (ret < 0) {
           ^
>> drivers/gpu/drm/virtio/virtgpu_vq.c:503:1: error: function definition is not allowed here
   {
   ^
   drivers/gpu/drm/virtio/virtgpu_vq.c:523:1: error: function definition is not allowed here
   {
   ^
   drivers/gpu/drm/virtio/virtgpu_vq.c:534:1: error: function definition is not allowed here
   {
   ^
   drivers/gpu/drm/virtio/virtgpu_vq.c:556:1: error: function definition is not allowed here
   {
   ^
   drivers/gpu/drm/virtio/virtgpu_vq.c:580:1: error: function definition is not allowed here
   {
   ^
   drivers/gpu/drm/virtio/virtgpu_vq.c:604:1: error: function definition is not allowed here
   {
   ^
   drivers/gpu/drm/virtio/virtgpu_vq.c:635:1: error: function definition is not allowed here
   {
   ^
   drivers/gpu/drm/virtio/virtgpu_vq.c:654:1: error: function definition is not allowed here
   {
   ^
   drivers/gpu/drm/virtio/virtgpu_vq.c:683:1: error: function definition is not allowed here
   {
   ^
   drivers/gpu/drm/virtio/virtgpu_vq.c:704:1: error: function definition is not allowed here
   {
   ^
   drivers/gpu/drm/virtio/virtgpu_vq.c:729:1: error: function definition is not allowed here
   {
   ^
   drivers/gpu/drm/virtio/virtgpu_vq.c:741:1: error: function definition is not allowed here
   {
   ^
   drivers/gpu/drm/virtio/virtgpu_vq.c:767:1: error: function definition is not allowed here
   {
   ^
   drivers/gpu/drm/virtio/virtgpu_vq.c:790:1: error: function definition is not allowed here
   {
   ^
   drivers/gpu/drm/virtio/virtgpu_vq.c:815:1: error: function definition is not allowed here
   {
   ^
   drivers/gpu/drm/virtio/virtgpu_vq.c:889:1: error: function definition is not allowed here
   {
   ^
   drivers/gpu/drm/virtio/virtgpu_vq.c:919:1: error: function definition is not allowed here
   {
   ^
   drivers/gpu/drm/virtio/virtgpu_vq.c:936:1: error: function definition is not allowed here
   {
   ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   6 warnings and 20 errors generated.


vim +503 drivers/gpu/drm/virtio/virtgpu_vq.c

dc5698e80cf724 Dave Airlie      2013-09-09  492  
dc5698e80cf724 Dave Airlie      2013-09-09  493  /* just create gem objects for userspace and long lived objects,
5d883850dc23a5 Rodrigo Siqueira 2018-02-22  494   * just use dma_alloced pages for the queue objects?
5d883850dc23a5 Rodrigo Siqueira 2018-02-22  495   */
dc5698e80cf724 Dave Airlie      2013-09-09  496  
dc5698e80cf724 Dave Airlie      2013-09-09  497  /* create a basic resource */
dc5698e80cf724 Dave Airlie      2013-09-09  498  void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
23c897d72ca806 Gerd Hoffmann    2018-10-19  499  				    struct virtio_gpu_object *bo,
530b28426a94b8 Gerd Hoffmann    2019-03-18  500  				    struct virtio_gpu_object_params *params,
e2324300f427ff Gerd Hoffmann    2019-08-29  501  				    struct virtio_gpu_object_array *objs,
530b28426a94b8 Gerd Hoffmann    2019-03-18  502  				    struct virtio_gpu_fence *fence)
dc5698e80cf724 Dave Airlie      2013-09-09 @503  {
dc5698e80cf724 Dave Airlie      2013-09-09  504  	struct virtio_gpu_resource_create_2d *cmd_p;
dc5698e80cf724 Dave Airlie      2013-09-09  505  	struct virtio_gpu_vbuffer *vbuf;
dc5698e80cf724 Dave Airlie      2013-09-09  506  
dc5698e80cf724 Dave Airlie      2013-09-09  507  	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
dc5698e80cf724 Dave Airlie      2013-09-09  508  	memset(cmd_p, 0, sizeof(*cmd_p));
e2324300f427ff Gerd Hoffmann    2019-08-29  509  	vbuf->objs = objs;
dc5698e80cf724 Dave Airlie      2013-09-09  510  
dc5698e80cf724 Dave Airlie      2013-09-09  511  	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_CREATE_2D);
724cfdfd667a28 Gerd Hoffmann    2018-10-19  512  	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
f9659329f222a6 Gerd Hoffmann    2019-03-18  513  	cmd_p->format = cpu_to_le32(params->format);
f9659329f222a6 Gerd Hoffmann    2019-03-18  514  	cmd_p->width = cpu_to_le32(params->width);
f9659329f222a6 Gerd Hoffmann    2019-03-18  515  	cmd_p->height = cpu_to_le32(params->height);
dc5698e80cf724 Dave Airlie      2013-09-09  516  
e19d341174b679 Chia-I Wu        2020-02-05  517  	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
23c897d72ca806 Gerd Hoffmann    2018-10-19  518  	bo->created = true;
dc5698e80cf724 Dave Airlie      2013-09-09  519  }
dc5698e80cf724 Dave Airlie      2013-09-09  520  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
