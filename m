Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F23D28B81F3
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 23:35:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF8BD10E60C;
	Tue, 30 Apr 2024 21:35:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TldT/FbN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9E210E60C
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 21:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714512901; x=1746048901;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tTccR7b+fg7YW2r965Vb1yvRMrgT+rQm3TA8SN9Sdu0=;
 b=TldT/FbNfqLUpu3nvi0F0XurIBwYfDbRniHBSOqRFaO0L4c6Y0+w8n26
 tfGcZYpBpsJUKJhgFBgLm7/69YYcvjWV5yRGVkez6fgj27eJRWIuqrjQJ
 UfkfU2dsk/zb5BLEKgYyhZasgIjjicpgM+c2YZB2O12o3I5N/XUvFEGs8
 y4iPEJUJapgOtDnVeNG1zsm6QvK2nYuV0XXHmlI1id9tYj4gp0eLnoHx9
 rE7Zz2w0cNjHaiU8QdNhpmgGCnJo/5kgE6c5n4lO/9jcFqk/P2zUNsuBJ
 PxdS7pOpMhNXdO3J8aFs+qqMuzL8Typu/wSwaM07gQzw+KdXpvcaabIcR A==;
X-CSE-ConnectionGUID: sz9TNxoXQRqVlcu0f2GaZg==
X-CSE-MsgGUID: c97ripxMQ4m6dybwFzC44A==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="14070078"
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; d="scan'208";a="14070078"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 14:35:00 -0700
X-CSE-ConnectionGUID: m6voHUtJQrWPhP8kSdz+Gg==
X-CSE-MsgGUID: I/a3pbHETjiyyNx1OkI/4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; d="scan'208";a="31423229"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 30 Apr 2024 14:34:57 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1s1v7m-0008cj-1Z;
 Tue, 30 Apr 2024 21:34:54 +0000
Date: Wed, 1 May 2024 05:34:23 +0800
From: kernel test robot <lkp@intel.com>
To: Weishi Li <liweishi@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev, airlied@redhat.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, gurchetansingh@chromium.org,
 kraxel@redhat.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 olvaffe@gmail.com, tzimmermann@suse.de, virtualization@lists.linux.dev
Subject: Re: [PATCH] [PATCH RESEND] drm/virtio: fix memory leak of vbuf
Message-ID: <202405010502.1BWe3b2S-lkp@intel.com>
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
[also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.9-rc6 next-20240430]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Weishi-Li/drm-virtio-fix-memory-leak-of-vbuf/20240430-132447
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240429030541.56702-1-liweishi%40kylinos.cn
patch subject: [PATCH] [PATCH RESEND] drm/virtio: fix memory leak of vbuf
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240501/202405010502.1BWe3b2S-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405010502.1BWe3b2S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405010502.1BWe3b2S-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/virtio/virtgpu_vq.c: In function 'virtio_gpu_queue_cursor':
>> drivers/gpu/drm/virtio/virtgpu_vq.c:474:9: error: expected '}' before 'else'
     474 |         else if (ret < 0) {
         |         ^~~~


vim +474 drivers/gpu/drm/virtio/virtgpu_vq.c

   448	
   449	static void virtio_gpu_queue_cursor(struct virtio_gpu_device *vgdev,
   450					    struct virtio_gpu_vbuffer *vbuf)
   451	{
   452		struct virtqueue *vq = vgdev->cursorq.vq;
   453		struct scatterlist *sgs[1], ccmd;
   454		int idx, ret, outcnt;
   455		bool notify;
   456	
   457		if (!drm_dev_enter(vgdev->ddev, &idx)) {
   458			free_vbuf(vgdev, vbuf);
   459			return;
   460		}
   461	
   462		sg_init_one(&ccmd, vbuf->buf, vbuf->size);
   463		sgs[0] = &ccmd;
   464		outcnt = 1;
   465	
   466		spin_lock(&vgdev->cursorq.qlock);
   467	retry:
   468		ret = virtqueue_add_sgs(vq, sgs, outcnt, 0, vbuf, GFP_ATOMIC);
   469		if (ret == -ENOSPC) {
   470			spin_unlock(&vgdev->cursorq.qlock);
   471			wait_event(vgdev->cursorq.ack_queue, vq->num_free >= outcnt);
   472			spin_lock(&vgdev->cursorq.qlock);
   473			goto retry;
 > 474		else if (ret < 0) {
   475			free_vbuf(vgdev, vbuf);
   476		} else {
   477			vbuf->seqno = ++vgdev->cursorq.seqno;
   478			trace_virtio_gpu_cmd_queue(vq,
   479				virtio_gpu_vbuf_ctrl_hdr(vbuf),
   480				vbuf->seqno);
   481	
   482			notify = virtqueue_kick_prepare(vq);
   483		}
   484	
   485		spin_unlock(&vgdev->cursorq.qlock);
   486	
   487		if (notify)
   488			virtqueue_notify(vq);
   489	
   490		drm_dev_exit(idx);
   491	}
   492	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
