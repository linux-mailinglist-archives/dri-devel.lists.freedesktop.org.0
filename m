Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7688FE686
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 14:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC0210E927;
	Thu,  6 Jun 2024 12:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RF0sui9W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F5810E92B;
 Thu,  6 Jun 2024 12:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717677102; x=1749213102;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qmQ2i1HXn0VWzplIzuv5p+11bHG39A8QkFIOVxF7dZg=;
 b=RF0sui9WqpM5qPR95dAWCGwO9ydJ8XrMUCGpUkCr57IM/b5MyzhShXgd
 D+TgH+m3GYf9e2LsEpXNTbsLJQAynRRdxMMnjgc/1z9asc/W3FLs5Zxr9
 PXKuX2TH3QDiF8aY42BKYD1UCKlc3eWwcjEEIqXZr4u2xn48bKTrWHBEF
 W/Gsmf+LPNincI1pZG4PqkNdT75ezYgiG8rFJk+95Ea5pNN2OFVLSVRps
 brr6IVY2zrgubLJZF0oWkz1a/iMo/H/7eGD7ScL2qm9ueLbytyGOnkd6j
 +frN7xqczFGbSMseFqvNu3iCeK+bF2kmtCVNDw18JfYKbHy7SbjjzL/Zb Q==;
X-CSE-ConnectionGUID: TdszebvnTqa7it77ZmsLvg==
X-CSE-MsgGUID: 2s4IlH8OQOSkvcP1mVS/rg==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14179502"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="14179502"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 05:31:40 -0700
X-CSE-ConnectionGUID: BERFzdKoRCOuD+bVLtOUDw==
X-CSE-MsgGUID: U23lwtZKQJK6r0IejF8rhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="37960244"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 06 Jun 2024 05:31:35 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 06 Jun 2024 15:31:34 +0300
Date: Thu, 6 Jun 2024 15:31:34 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Chris Bainbridge <chris.bainbridge@gmail.com>,
 kernel test robot <lkp@intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 hughsient@gmail.com
Subject: Re: [PATCH v2] drm/client: Detect when ACPI lid is closed during
 initialization
Message-ID: <ZmGsJsXhHcPV48XJ@intel.com>
References: <20240528210319.1242-1-mario.limonciello@amd.com>
 <202406040928.Eu1gRIWv-lkp@intel.com>
 <ZmB_cs-7GU-m3GXX@debian.local> <87h6e6bkpo.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87h6e6bkpo.fsf@intel.com>
X-Patchwork-Hint: comment
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

On Thu, Jun 06, 2024 at 10:21:07AM +0300, Jani Nikula wrote:
> On Wed, 05 Jun 2024, Chris Bainbridge <chris.bainbridge@gmail.com> wrote:
> > On Tue, Jun 04, 2024 at 10:02:29AM +0800, kernel test robot wrote:
> >> Hi Mario,
> >> 
> >> kernel test robot noticed the following build errors:
> >> 
> >> [auto build test ERROR on drm-misc/drm-misc-next]
> >> [also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.10-rc2 next-20240603]
> >> [If your patch is applied to the wrong git tree, kindly drop us a note.
> >> And when submitting patch, we suggest to use '--base' as documented in
> >> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >> 
> >> url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/drm-client-Detect-when-ACPI-lid-is-closed-during-initialization/20240529-050440
> >> base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> >> patch link:    https://lore.kernel.org/r/20240528210319.1242-1-mario.limonciello%40amd.com
> >> patch subject: [PATCH v2] drm/client: Detect when ACPI lid is closed during initialization
> >> config: i386-randconfig-053-20240604 (https://download.01.org/0day-ci/archive/20240604/202406040928.Eu1gRIWv-lkp@intel.com/config)
> >> compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
> >> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240604/202406040928.Eu1gRIWv-lkp@intel.com/reproduce)
> >> 
> >> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> >> the same patch/commit), kindly add following tags
> >> | Reported-by: kernel test robot <lkp@intel.com>
> >> | Closes: https://lore.kernel.org/oe-kbuild-all/202406040928.Eu1gRIWv-lkp@intel.com/
> >> 
> >> All errors (new ones prefixed by >>):
> >> 
> >>    ld: drivers/gpu/drm/drm_client_modeset.o: in function `drm_client_match_edp_lid':
> >> >> drivers/gpu/drm/drm_client_modeset.c:281:(.text+0x221b): undefined reference to `acpi_lid_open'
> >> 
> >> 
> >> vim +281 drivers/gpu/drm/drm_client_modeset.c
> >> 
> >>    260	
> >>    261	static void drm_client_match_edp_lid(struct drm_device *dev,
> >>    262					     struct drm_connector **connectors,
> >>    263					     unsigned int connector_count,
> >>    264					     bool *enabled)
> >>    265	{
> >>    266		int i;
> >>    267	
> >>    268		for (i = 0; i < connector_count; i++) {
> >>    269			struct drm_connector *connector = connectors[i];
> >>    270	
> >>    271			switch (connector->connector_type) {
> >>    272			case DRM_MODE_CONNECTOR_LVDS:
> >>    273			case DRM_MODE_CONNECTOR_eDP:
> >>    274				if (!enabled[i])
> >>    275					continue;
> >>    276				break;
> >>    277			default:
> >>    278				continue;
> >>    279			}
> >>    280	
> >>  > 281			if (!acpi_lid_open()) {
> >>    282				drm_dbg_kms(dev, "[CONNECTOR:%d:%s] lid is closed, disabling\n",
> >>    283					    connector->base.id, connector->name);
> >>    284				enabled[i] = false;
> >>    285			}
> >>    286		}
> >>    287	}
> >>    288	
> >> 
> >> -- 
> >> 0-DAY CI Kernel Test Service
> >> https://github.com/intel/lkp-tests/wiki
> >
> > The failed config has CONFIG_ACPI_BUTTON=m. The build failure can be
> > fixed with:
> >
> > diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> > index b76438c31761..0271e66f44f8 100644
> > --- a/drivers/gpu/drm/drm_client_modeset.c
> > +++ b/drivers/gpu/drm/drm_client_modeset.c
> > @@ -271,11 +271,13 @@ static void drm_client_match_edp_lid(struct drm_device *dev,
> >                 if (connector->connector_type != DRM_MODE_CONNECTOR_eDP || !enabled[i])
> >                         continue;
> >
> > +#if defined(CONFIG_ACPI_BUTTON)
> >                 if (!acpi_lid_open()) {
> >                         drm_dbg_kms(dev, "[CONNECTOR:%d:%s] lid is closed, disabling\n",
> >                                     connector->base.id, connector->name);
> >                         enabled[i] = false;
> >                 }
> > +#endif
> >         }
> >  }
> 
> No. This is because
> 
> CONFIG_DRM=y
> CONFIG_ACPI_BUTTON=m
> 
> The pedantically correct fix is probably having DRM
> 
> 	depends on ACPI_BUTTON || ACPI_BUTTON=n
> 
> but seeing how i915 and xe just
> 
> 	select ACPI_BUTTON if ACPI

Huh. We should nuke that as we haven't used this lid stuff in ages.

-- 
Ville Syrjälä
Intel
