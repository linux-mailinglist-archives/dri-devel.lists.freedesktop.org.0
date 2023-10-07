Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CA57BC4C6
	for <lists+dri-devel@lfdr.de>; Sat,  7 Oct 2023 07:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29D210E101;
	Sat,  7 Oct 2023 05:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8953910E101
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Oct 2023 05:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696655871; x=1728191871;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=h8JjTkOjxy+GvvvrgGzYxXx8I+OrRY9nFul1gwrLQGU=;
 b=hDHwLjZ8Ar6w6iBJfcGK8jO0UkBLy0j4BZtEACp322VWjhlggX1GiZeL
 7TC8l/1ErjzUT8sGCzJNq5jV4vdSIn/eCCsCLYqB8W7PVT3oTl2xnT8BD
 g7gwt8PtIHbfb2Sha1NeRU2v6VUJmB5lJIF5TxQTBaAmfdzbiq/NvZ9QN
 yiVAAd558UkfAq7REweu991yqsDq+iOqSUIyw4SGY4D/C62DMWDEIODms
 CHK+7FVLhPD7fVD8qvIm6XVa/TUVei+s9wW4XvgC2ivbud0j4AzK/tULX
 iMvi/aocB8N92KN3ur8+LMAYZyiC6o09t2kTu78j6sxxNWAmua2aSSQhD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="386731702"
X-IronPort-AV: E=Sophos;i="6.03,205,1694761200"; d="scan'208";a="386731702"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 22:17:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="756103940"
X-IronPort-AV: E=Sophos;i="6.03,205,1694761200"; d="scan'208";a="756103940"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 06 Oct 2023 22:17:46 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qozhA-0003zl-27;
 Sat, 07 Oct 2023 05:17:44 +0000
Date: Sat, 7 Oct 2023 13:17:06 +0800
From: kernel test robot <lkp@intel.com>
To: Ma Ke <make_ruc2021@163.com>, airlied@gmail.com, daniel@ffwll.ch,
 javierm@redhat.com, lyude@redhat.com, mripard@kernel.org,
 u.kleine-koenig@pengutronix.de, noralf@tronnes.org, tzimmermann@suse.de
Subject: Re: [PATCH] drm/i2c/ch7006: fix a possible null pointer dereference
Message-ID: <202310071306.7oXVHYob-lkp@intel.com>
References: <20231007031712.3997144-1-make_ruc2021@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231007031712.3997144-1-make_ruc2021@163.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ma,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.6-rc4 next-20231006]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ma-Ke/drm-i2c-ch7006-fix-a-possible-null-pointer-dereference/20231007-112036
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231007031712.3997144-1-make_ruc2021%40163.com
patch subject: [PATCH] drm/i2c/ch7006: fix a possible null pointer dereference
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231007/202310071306.7oXVHYob-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231007/202310071306.7oXVHYob-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310071306.7oXVHYob-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/i2c/ch7006_drv.c: In function 'ch7006_encoder_get_modes':
>> drivers/gpu/drm/i2c/ch7006_drv.c:239:42: warning: variable 'encoder_mode' set but not used [-Wunused-but-set-variable]
     239 |                 struct drm_display_mode *encoder_mode;
         |                                          ^~~~~~~~~~~~


vim +/encoder_mode +239 drivers/gpu/drm/i2c/ch7006_drv.c

   226	
   227	static int ch7006_encoder_get_modes(struct drm_encoder *encoder,
   228					    struct drm_connector *connector)
   229	{
   230		struct ch7006_priv *priv = to_ch7006_priv(encoder);
   231		const struct ch7006_mode *mode;
   232		int n = 0;
   233	
   234		for (mode = ch7006_modes; mode->mode.clock; mode++) {
   235			if (~mode->valid_scales & 1<<priv->scale ||
   236			    ~mode->valid_norms & 1<<priv->norm)
   237				continue;
   238	
 > 239			struct drm_display_mode *encoder_mode;
   240			encoder_mode = drm_mode_duplicate(encoder->dev, &mode->mode);
   241			if (!mode)
   242				continue;
   243	
   244			n++;
   245		}
   246	
   247		return n;
   248	}
   249	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
