Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF904AF73C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 17:53:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D6D10E3D1;
	Wed,  9 Feb 2022 16:53:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A93D10E3D1;
 Wed,  9 Feb 2022 16:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644425582; x=1675961582;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=e3Ciq2QYPZgT+s4iAlBCtkk3t9CniM2bYjnPxiTZ4LI=;
 b=FvcxJQlpPikf30lVxiwaguh2QVRh2yHsE9InST53tvmcIRjnZ8zxmnmD
 LbIEN18c7WnaYgjTmWC5MUzIYjiThuTKv5zAZjdYc+WrFPeOGhgmWwXmC
 xTudUhme+hYweFrPollW+/8zh4X+ctXiTb+ctkOrTLVDSu+uvA7QgSLsd
 9TJFWdc2/GwE/hp0/v386lGkW/uYTiSdU9kkpMiWXIih5jxMoufvx5NAt
 HBFpgwb/rWV03W43a5TQ1c3vnUoTwFI4iMWe4VVRkAr1CavatDTH4KzVj
 z9L3Kf451lJ83ndAnh70hT3c7eI3VqLp8IzvvaR4GzIn0hQGTuL8mxD/3 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="273788701"
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="273788701"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 08:52:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="482390232"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 09 Feb 2022 08:52:57 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nHqDA-00024O-Bz; Wed, 09 Feb 2022 16:52:56 +0000
Date: Thu, 10 Feb 2022 00:52:19 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Cheng <michael.cheng@intel.com>,
	intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v6 4/6] drm/i915/: Re-work clflush_write32
Message-ID: <202202100010.fBBNyCpm-lkp@intel.com>
References: <20220207201127.648624-5-michael.cheng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207201127.648624-5-michael.cheng@intel.com>
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
Cc: lucas.demarchi@intel.com, michael.cheng@intel.com, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michael,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip drm/drm-next v5.17-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Michael-Cheng/Use-drm_clflush-instead-of-clflush/20220208-041326
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: x86_64-randconfig-c002 (https://download.01.org/0day-ci/archive/20220210/202202100010.fBBNyCpm-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1310:32-38: ERROR: application of sizeof to pointer
   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1322:32-38: ERROR: application of sizeof to pointer

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
