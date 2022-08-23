Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9306759EBD1
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 21:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CDBD10E63A;
	Tue, 23 Aug 2022 19:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F7410E63A
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 19:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661281759; x=1692817759;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xBFL36xzbBhw3pvkHFxAFjXmBsofEsVU8PPhz+4jLuM=;
 b=GEkMPHA/ki0YuqxPKriQIrVemaKXlZgYGU2EbZy2qYG1HD0oX/O7QMyG
 NmjL2Kd0GSGJPTnB3U5yjNdNrKjm0XyjwN84B92ELsrdPZaPxYOrfMB/I
 i22JOmfGZHWuHr9mz2+ke8z1ib8+6CifUsQ+zKbEPw72TJh4ow40a6ytq
 VO9XJ9wrsmP2JhKWpJQ3Ci5d9UvKm7jJ8m7SfGMoaSVO33d4RsmIB+ynb
 dLbYkAiWMGcRDlxlZ0taK0naYDAORZcHFCJFFy9FJ0COvSFHdV8HiqUtJ
 uLiD3104XUeS3TahBJBW6ywZxP1+0XQgvsj/aTHbveEFtNP6waHlSZOUq w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="274163187"
X-IronPort-AV: E=Sophos;i="5.93,258,1654585200"; d="scan'208";a="274163187"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 12:09:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,258,1654585200"; d="scan'208";a="751791017"
Received: from lkp-server02.sh.intel.com (HELO 9bbcefcddf9f) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 23 Aug 2022 12:09:02 -0700
Received: from kbuild by 9bbcefcddf9f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oQZGm-0000Rt-0L;
 Tue, 23 Aug 2022 19:09:00 +0000
Date: Wed, 24 Aug 2022 03:08:21 +0800
From: kernel test robot <lkp@intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/4] drm: rcar-du: fix DSI enable & disable sequence
Message-ID: <202208240201.ss8E6NY0-lkp@intel.com>
References: <20220822130513.119029-4-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220822130513.119029-4-tomi.valkeinen@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on pinchartl-media/drm/du/next]
[also build test WARNING on linus/master v6.0-rc2 next-20220823]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomi-Valkeinen/drm-rcar-du-DSI-fixes/20220822-210756
base:   git://linuxtv.org/pinchartl/media.git drm/du/next
config: arm-defconfig (https://download.01.org/0day-ci/archive/20220824/202208240201.ss8E6NY0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d037472981c443d699c022aa91c5335f686d82ad
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tomi-Valkeinen/drm-rcar-du-DSI-fixes/20220822-210756
        git checkout d037472981c443d699c022aa91c5335f686d82ad
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/rcar-du/rcar_du_crtc.c:34:
>> drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h:26:6: warning: no previous prototype for 'rcar_mipi_dsi_pclk_disable' [-Wmissing-prototypes]
      26 | void rcar_mipi_dsi_pclk_disable(struct drm_bridge *bridge)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/rcar_mipi_dsi_pclk_disable +26 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h

    25	
  > 26	void rcar_mipi_dsi_pclk_disable(struct drm_bridge *bridge)
    27	{
    28	}
    29	#endif /* CONFIG_DRM_RCAR_MIPI_DSI */
    30	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
