Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6225550520
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 15:38:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D865810E776;
	Sat, 18 Jun 2022 13:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B26C210E776
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 13:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655559508; x=1687095508;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NHM/0kUoRtVjiXJ1ttEc7KyV9BDqTayvABfdIPLKzOM=;
 b=PeFD9Ee/IrlGNBU7NSOQ1nb21gwt1EVHkCeWY83OO5uBXaAgSCUKUaRR
 zEVkjUPkPtSkU3XlYoQal/qUff98UA26fSwpajiO7VoiuxqZOPnPQxvEs
 wo2GrsxWU0vWSq/K4mB9g/9HG0ex/+nC0cLgxqsXHPDifppQZqg6Xagwb
 JluxPI46ufADuMz/J3MA49rd/ilYdPorSImDoKz5lesrqZQ75RPmTL9eD
 o6t8+GKh09jY+7d/FG1ohiMdOS6eTKAqIXsA9ftg5lvx2RsypK21j6No0
 hkFzMw59DI79H3asKn5rgUFwxvw/j8NS2b+HnGBN7yXdGNvfmaTwJDXGf A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="343646671"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="343646671"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2022 06:38:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="642415089"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 18 Jun 2022 06:38:18 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o2YeX-000QLL-Ij;
 Sat, 18 Jun 2022 13:38:17 +0000
Date: Sat, 18 Jun 2022 21:38:04 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>,
 Isabella Basso <isabbasso@riseup.net>, magalilemes00@gmail.com,
 tales.aparecida@gmail.com, mwen@igalia.com, andrealmeid@riseup.net,
 Trevor Woerner <twoerner@gmail.com>, leandro.ribeiro@collabora.com,
 n@nfraprado.net, Daniel Vetter <daniel@ffwll.ch>,
 Shuah Khan <skhan@linuxfoundation.org>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, michal.winiarski@intel.com,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
 David Gow <davidgow@google.com>,
 Daniel Latypov <dlatypov@google.com>, brendanhiggins@google.com
Subject: Re: [PATCH 07/10] drm: selftest: convert drm_dp_mst_helper selftest
 to KUnit
Message-ID: <202206182155.lXXuUjPn-lkp@intel.com>
References: <20220615135824.15522-8-maira.canal@usp.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220615135824.15522-8-maira.canal@usp.br>
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
Cc: kbuild-all@lists.01.org,
 =?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>,
 Rubens Gomes Neto <rubens.gomes.neto@usp.br>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi "Maíra,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on linus/master v5.19-rc2 next-20220617]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Ma-ra-Canal/drm-selftest-Convert-to-KUnit/20220615-220404
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20220618/202206182155.lXXuUjPn-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ad7454e2bd5849a6ce856f14be64439a4b2cc5a7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ma-ra-Canal/drm-selftest-Convert-to-KUnit/20220615-220404
        git checkout ad7454e2bd5849a6ce856f14be64439a4b2cc5a7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: missing MODULE_LICENSE() in drivers/gpu/drm/tests/test-drm_plane_helper.o
ERROR: modpost: missing MODULE_LICENSE() in drivers/gpu/drm/tests/test-drm_dp_mst_helper.o
>> ERROR: modpost: "drm_dp_encode_sideband_req" [drivers/gpu/drm/tests/test-drm_dp_mst_helper.ko] undefined!
>> ERROR: modpost: "drm_dp_decode_sideband_req" [drivers/gpu/drm/tests/test-drm_dp_mst_helper.ko] undefined!
>> ERROR: modpost: "drm_dp_dump_sideband_msg_req_body" [drivers/gpu/drm/tests/test-drm_dp_mst_helper.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
