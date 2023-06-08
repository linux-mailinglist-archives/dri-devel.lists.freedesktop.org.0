Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1302672787F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 09:15:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A444110E58E;
	Thu,  8 Jun 2023 07:15:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ADCB10E58E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 07:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686208550; x=1717744550;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BL2likjgo0S+4XGmHIfpSStordjpYuBQnIcuC2vgFgY=;
 b=W8VaGqQ/fn4iIv8/1d+0++WIeP9O1EfBGcIXyeABs+ByMqqTRjTHj1kM
 EtbB8F25AZDNSl1eEm3Bzr4CaRmQy9P5cXtF03n/yvQ2C7rblQ9h9i6Is
 t4fHDvH9Fm3ksHbeMyXtfsRUhWiEOSvozCGYf2ik/sViwQi70hugaNGEQ
 PWGvMi/aRrltz1zOjrKRAPlWeWpJapzCrOsmSNqu5Gf7gdpRkT7PtGYts
 AEaeTJK0AOsMQDbvVt/BWVKN+6H2BjLh/b/SMved/L3Tc+t58Uw4Qk6xE
 A4GTxOQ1Uyik9AuCVa8xd6thCTzRnEE1xQMsPeK4hHhFdUmb3f9vjr31j A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="360567826"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="360567826"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 00:15:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="799711386"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="799711386"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Jun 2023 00:15:43 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1q79rz-0007Vr-04;
 Thu, 08 Jun 2023 07:15:43 +0000
Date: Thu, 8 Jun 2023 15:14:49 +0800
From: kernel test robot <lkp@intel.com>
To: Douglas Anderson <dianders@chromium.org>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 08/10] HID: i2c-hid: Support being a panel follower
Message-ID: <202306081419.Dzz0T4iW-lkp@intel.com>
References: <20230607144931.v2.8.Ib1a98309c455cd7e26b931c69993d4fba33bbe15@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607144931.v2.8.Ib1a98309c455cd7e26b931c69993d4fba33bbe15@changeid>
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
Cc: devicetree@vger.kernel.org, cros-qcom-dts-watchers@chromium.org,
 linux-arm-msm@vger.kernel.org, yangcong5@huaqin.corp-partner.google.com,
 llvm@lists.linux.dev, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Morgan <macroalpha82@gmail.com>, oe-kbuild-all@lists.linux.dev,
 hsinyi@google.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Douglas,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on hid/for-next dtor-input/next dtor-input/for-linus drm-misc/drm-misc-next linus/master v6.4-rc5 next-20230607]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Douglas-Anderson/dt-bindings-HID-i2c-hid-Add-panel-property-to-i2c-hid-backed-touchscreens/20230608-055515
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230607144931.v2.8.Ib1a98309c455cd7e26b931c69993d4fba33bbe15%40changeid
patch subject: [PATCH v2 08/10] HID: i2c-hid: Support being a panel follower
config: i386-randconfig-i003-20230607 (https://download.01.org/0day-ci/archive/20230608/202306081419.Dzz0T4iW-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch robh for-next
        git checkout robh/for-next
        b4 shazam https://lore.kernel.org/r/20230607144931.v2.8.Ib1a98309c455cd7e26b931c69993d4fba33bbe15@changeid
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306081419.Dzz0T4iW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: drm_panel_add_follower
   >>> referenced by i2c-hid-core.c:1159 (drivers/hid/i2c-hid/i2c-hid-core.c:1159)
   >>>               drivers/hid/i2c-hid/i2c-hid-core.o:(i2c_hid_core_probe) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: drm_panel_remove_follower
   >>> referenced by i2c-hid-core.c:1218 (drivers/hid/i2c-hid/i2c-hid-core.c:1218)
   >>>               drivers/hid/i2c-hid/i2c-hid-core.o:(i2c_hid_core_remove) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
