Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE41966CCA
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2024 01:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3BBC10E627;
	Fri, 30 Aug 2024 23:09:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vbh1vXU0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83EDA10E627
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 23:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725059386; x=1756595386;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=AFJK47fFju2O/0LNGUn/aSuMlxfFAWKvbYO84MsNchk=;
 b=Vbh1vXU0lJPu+3isVCWENbeyAqurWv1x8/gqhxj+m7D9ZFYJtykodiQT
 vYyqk6p3Kyn/SVKX5vvzUP1cvXiNWvX81OwGW44IUK7tdNeNWntJ1lLHW
 6ibifus97vflhiWWNDZVHlitc+Ciit8qLC6rUuKtkjNYLwxLVy2mtfJeU
 gBNA8kaaYIcfWDQ+DiU2Nop8cj38G8Wi3vUxUypGfEhKQuakPe+dllzQA
 683+wdm6K2hpTKP82QEVOoF0thRTDmBseuD1B6WTNbULdljVOoxyoh3di
 +U3BIOzO7gwVCHF/eftUxmaw0V3+j/evy92gMt1pRC9v5rjNjRCnpGYMP A==;
X-CSE-ConnectionGUID: TZGskJcuSaSarbhjW567ew==
X-CSE-MsgGUID: 1dkimbh5QNOFjgTbJQwQyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="27595810"
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; d="scan'208";a="27595810"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 16:09:46 -0700
X-CSE-ConnectionGUID: LhtUaA7+Qhqc6QSITknNZg==
X-CSE-MsgGUID: 6sVpALO4QGuFTZh5zQQrgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; d="scan'208";a="68922737"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 30 Aug 2024 16:09:42 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1skAkN-0002CA-16;
 Fri, 30 Aug 2024 23:09:39 +0000
Date: Sat, 31 Aug 2024 07:09:37 +0800
From: kernel test robot <lkp@intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 arthurgrillo@riseup.net, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com,
 nicolejadeyee@google.com, Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v2 5/6] drm/vkms: Switch to managed for CRTC
Message-ID: <202408310628.jJbxaMOR-lkp@intel.com>
References: <20240827-google-vkms-managed-v2-5-f41104553aeb@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240827-google-vkms-managed-v2-5-f41104553aeb@bootlin.com>
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

Hi Louis,

kernel test robot noticed the following build errors:

[auto build test ERROR on 071d583e01c88272f6ff216d4f867f8f35e94d7d]

url:    https://github.com/intel-lab-lkp/linux/commits/Louis-Chauvet/drm-vkms-Switch-to-managed-for-connector/20240827-180427
base:   071d583e01c88272f6ff216d4f867f8f35e94d7d
patch link:    https://lore.kernel.org/r/20240827-google-vkms-managed-v2-5-f41104553aeb%40bootlin.com
patch subject: [PATCH v2 5/6] drm/vkms: Switch to managed for CRTC
config: i386-randconfig-141-20240831 (https://download.01.org/0day-ci/archive/20240831/202408310628.jJbxaMOR-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408310628.jJbxaMOR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408310628.jJbxaMOR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/vkms/vkms_output.c:58:6: error: variable 'cursor' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
      58 |         if (vkmsdev->config->cursor) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/vkms/vkms_output.c:65:10: note: uninitialized use occurs here
      65 |                               cursor ? &cursor->base : NULL);
         |                               ^~~~~~
   drivers/gpu/drm/vkms/vkms_output.c:58:2: note: remove the 'if' if its condition is always true
      58 |         if (vkmsdev->config->cursor) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/vkms/vkms_output.c:32:37: note: initialize the variable 'cursor' to silence this warning
      32 |         struct vkms_plane *primary, *cursor, *overlay = NULL;
         |                                            ^
         |                                             = NULL
   1 error generated.


vim +58 drivers/gpu/drm/vkms/vkms_output.c

d16489307a52f0 Rodrigo Siqueira    2018-07-11  29  
e9d85f731de06a Rodrigo Siqueira    2019-06-25  30  int vkms_output_init(struct vkms_device *vkmsdev, int index)
854502fa0a38dc Rodrigo Siqueira    2018-05-16  31  {
2abd7e59001123 Louis Chauvet       2024-08-27  32  	struct vkms_plane *primary, *cursor, *overlay = NULL;
854502fa0a38dc Rodrigo Siqueira    2018-05-16  33  	struct drm_device *dev = &vkmsdev->drm;
a12934d3402c04 Louis Chauvet       2024-08-27  34  	struct drm_connector *connector;
e3b4c152118a04 Louis Chauvet       2024-08-27  35  	struct drm_encoder *encoder;
2abd7e59001123 Louis Chauvet       2024-08-27  36  	struct vkms_crtc *crtc;
df2d385cb4132e José Expósito       2022-01-07  37  	unsigned int n;
2abd7e59001123 Louis Chauvet       2024-08-27  38  	int ret;
854502fa0a38dc Rodrigo Siqueira    2018-05-16  39  
2abd7e59001123 Louis Chauvet       2024-08-27  40  	/*
2abd7e59001123 Louis Chauvet       2024-08-27  41  	 * Initialize used plane. One primary plane is required to perform the composition.
2abd7e59001123 Louis Chauvet       2024-08-27  42  	 *
2abd7e59001123 Louis Chauvet       2024-08-27  43  	 * The overlay and cursor planes are not mandatory, but can be used to perform complex
2abd7e59001123 Louis Chauvet       2024-08-27  44  	 * composition.
2abd7e59001123 Louis Chauvet       2024-08-27  45  	 */
e9d85f731de06a Rodrigo Siqueira    2019-06-25  46  	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY, index);
854502fa0a38dc Rodrigo Siqueira    2018-05-16  47  	if (IS_ERR(primary))
854502fa0a38dc Rodrigo Siqueira    2018-05-16  48  		return PTR_ERR(primary);
854502fa0a38dc Rodrigo Siqueira    2018-05-16  49  
310e506c06e495 Melissa Wen         2021-04-24  50  	if (vkmsdev->config->overlay) {
df2d385cb4132e José Expósito       2022-01-07  51  		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
2abd7e59001123 Louis Chauvet       2024-08-27  52  			overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY, index);
2abd7e59001123 Louis Chauvet       2024-08-27  53  			if (IS_ERR(overlay))
2abd7e59001123 Louis Chauvet       2024-08-27  54  				return PTR_ERR(overlay);
310e506c06e495 Melissa Wen         2021-04-24  55  		}
df2d385cb4132e José Expósito       2022-01-07  56  	}
310e506c06e495 Melissa Wen         2021-04-24  57  
2df7af93fdadb9 Sumera Priyadarsini 2021-01-12 @58  	if (vkmsdev->config->cursor) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
