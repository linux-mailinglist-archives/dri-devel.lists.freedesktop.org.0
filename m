Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9B087FA8F
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 10:15:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E304410F8E3;
	Tue, 19 Mar 2024 09:15:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EIETo0dJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0C510F8D9
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 09:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710839699; x=1742375699;
 h=resent-from:resent-date:resent-message-id:resent-to:date:
 from:to:cc:subject:message-id:references:mime-version:
 in-reply-to; bh=M18Ey8+UgHjkfpMuAZLere14/BhHnhq3DtKp0vtMgXc=;
 b=EIETo0dJEZKnsZkD1qHrQc+gL7siuoiYEEPKF03mF2FEHYah5U2T96Vm
 /X8RbILNb2svHzz5vE7SDCX1TkdvtnbGyOOiXAbvTY5d3/oSTpU78Uzlz
 USrkuCigKmoaliXnkCmuDzHambiazew2s+g1teKe0S4/GfXeoYJ2hoDaz
 P0U5JjbKWhn40CmsAiVOQzZmCKxC2Nj/hrN6zSoDdXebGHlwNDkLiMaOL
 SfS4xFMnCFrecw9EEidqLna+JRTvI8VchY+1sXOdijS5hzB2pownuJjjG
 I/CLBHwMd27mf1eiLn6v2CCEW239vuS6925vKz6FNr9bvI7PgSckrfRMh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5529768"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="5529768"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 02:14:59 -0700
X-ExtLoopCount2: 2 from 10.237.72.74
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="827782086"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="827782086"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 19 Mar 2024 02:14:56 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 19 Mar 2024 11:14:55 +0200
Resent-From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Resent-Date: Tue, 19 Mar 2024 11:14:55 +0200
Resent-Message-ID: <ZflXj6TsfnWCxnbW@intel.com>
Resent-To: dri-devel@lists.freedesktop.org
X-Original-To: ville.syrjala@linux.intel.com
Delivered-To: ville.syrjala@linux.intel.com
Received: from linux.intel.com [10.54.29.200]
 by stinkbox.stink.local with IMAP (fetchmail-6.4.37)
 for <vsyrjala@localhost> (single-drop); Tue, 19 Mar 2024 08:53:58 +0200 (EET)
Received: from fmviesa002.fm.intel.com (fmviesa002.fm.intel.com
 [10.60.135.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id B5DD0580E13
 for <ville.syrjala@linux.intel.com>; Mon, 18 Mar 2024 23:51:27 -0700 (PDT)
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="36846851"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 18 Mar 2024 23:51:25 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rmTJi-000HXf-38;
 Tue, 19 Mar 2024 06:51:22 +0000
Date: Tue, 19 Mar 2024 14:51:14 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
 Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>,
 Sameer Lattannavar <sameer.lattannavar@intel.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Simon Ser <contact@emersion.fr>, Daniel Stone <daniels@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v3 1/2] drm: Introduce plane SIZE_HINTS property
Message-ID: <202403191412.UTJldbq9-lkp@intel.com>
References: <20240318204408.9687-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240318204408.9687-2-ville.syrjala@linux.intel.com>
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

Hi Ville,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.8 next-20240319]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-Introduce-plane-SIZE_HINTS-property/20240319-044605
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240318204408.9687-2-ville.syrjala%40linux.intel.com
patch subject: [PATCH v3 1/2] drm: Introduce plane SIZE_HINTS property
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240319/202403191412.UTJldbq9-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240319/202403191412.UTJldbq9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403191412.UTJldbq9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_plane.c:1767: warning: expecting prototype for drm_plane_add_size_hint_property(). Prototype was for drm_plane_add_size_hints_property() instead


vim +1767 drivers/gpu/drm/drm_plane.c

  1751	
  1752	/**
  1753	 * drm_plane_add_size_hint_property - create a size hint property
  1754	 *
  1755	 * @plane: drm plane
  1756	 * @hints: size hints
  1757	 * @num_hints: number of size hints
  1758	 *
  1759	 * Create a size hints property for the plane.
  1760	 *
  1761	 * RETURNS:
  1762	 * Zero for success or -errno
  1763	 */
  1764	int drm_plane_add_size_hints_property(struct drm_plane *plane,
  1765					      const struct drm_plane_size_hint *hints,
  1766					      int num_hints)
> 1767	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
