Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CA89115F2
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 00:54:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3698410E28C;
	Thu, 20 Jun 2024 22:54:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B6SAYmsK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8026110E28C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 22:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718924075; x=1750460075;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jXdtOsUhVghD5MmyzdTFIIAxpmkvQ4thmfKjJV9QJ8E=;
 b=B6SAYmsKMQ/fhm3xvIIVob9dJNlafBWkxeVcPKwwZgioXZHoBRkg1hqv
 qpLeux1apJvbFXakzPGY2n49uYIpNX3DpO/7wXoWAjC1VC8Hu8GWQ2+gR
 POWMtBbeQ6wFZ2hv7XRZHNV0ytG81NB0en9hTcQFQakviaNy9r5EL8OM5
 Hf80VJcOja6EUWOnmdkwXSlbxt+alFYNIGVw5EJofsM48dfU3u8v8oco4
 EOlgzLn6R+GzBcsV124X7JQ7sztW24y7t69qFuPK/U5S70zPzXLln1J+N
 8FhZ4UNrAGuYSO77/UbRgz7AtELfab6hR0dK2ho1QVED+XHc7oSlg6Mgq Q==;
X-CSE-ConnectionGUID: ldle1nBATumXUNzxzNPmJQ==
X-CSE-MsgGUID: ek9MxBX5QleJx0dFuF5RoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="26532773"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="26532773"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 15:54:35 -0700
X-CSE-ConnectionGUID: u6Xm1W96SbmkfVZUOfFtOQ==
X-CSE-MsgGUID: icu+aSI0S5aUK8xt6KI6LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="79904859"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 20 Jun 2024 15:54:31 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sKQfk-00080g-15;
 Thu, 20 Jun 2024 22:54:28 +0000
Date: Fri, 21 Jun 2024 06:54:13 +0800
From: kernel test robot <lkp@intel.com>
To: carlos.song@nxp.com, aisheng.dong@nxp.com, andi.shyti@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, sumit.semwal@linaro.org, christian.koenig@amd.com
Cc: oe-kbuild-all@lists.linux.dev, carlos.song@nxp.com, frank.li@nxp.com,
 linux-i2c@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [Patch V3] i2c: imx-lpi2c: add eDMA mode support for LPI2C
Message-ID: <202406210604.bil4fzu2-lkp@intel.com>
References: <20240614045616.1751784-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614045616.1751784-1-carlos.song@nxp.com>
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

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on linus/master v6.10-rc4 next-20240620]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/carlos-song-nxp-com/i2c-imx-lpi2c-add-eDMA-mode-support-for-LPI2C/20240614-125044
base:   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240614045616.1751784-1-carlos.song%40nxp.com
patch subject: [Patch V3] i2c: imx-lpi2c: add eDMA mode support for LPI2C
config: loongarch-randconfig-r071-20240620 (https://download.01.org/0day-ci/archive/20240621/202406210604.bil4fzu2-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406210604.bil4fzu2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406210604.bil4fzu2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-imx-lpi2c.o: warning: objtool: unexpected relocation symbol type in .rela.discard.reachable

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
