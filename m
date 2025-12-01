Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29172C98AB4
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 19:13:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7507910E44D;
	Mon,  1 Dec 2025 18:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O3AHzNoZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C3E10E447;
 Mon,  1 Dec 2025 18:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764612811; x=1796148811;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1OVxfyh8sdIolJjCq/0rbz5FUEcQW1fLWnCdbSs7H3A=;
 b=O3AHzNoZE0P0KQkPiiPpuajGLwhdiqtySsEFDdo1/X78NGDUqfNB5PpK
 9ebhGIIPU0qimVCPwBw5EECWWMtasQC3yyDXHegC7qCowNkIvf1qA6kgp
 S9wxoOouxPMT4AvFjntk081FuJKeE3oIrPds7zhrQGN3+jq7/Rzu5+yH+
 XNt70/u3myq/Fk6xvX+Uu9pb7KQfcKhimzt2AseWVISjue4Wxv74hvZ6s
 e2HtV3p4eeUXmk/E/24TB0CZIMT4qiNbzfrFDtMcHxXpm+VpY4j3+ZuBs
 F3JktilA0V1yU1m67xNAQC1GrzPCVv0M8WjxKpA4lfT7i7J+YNFxE0PrE w==;
X-CSE-ConnectionGUID: TLlF7xZBQzeDtPKznOk3eg==
X-CSE-MsgGUID: +oauqm0CR96InJeQff4JQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66456936"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="66456936"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 10:13:31 -0800
X-CSE-ConnectionGUID: eQsj4P6fTUiHH7qMtVRguQ==
X-CSE-MsgGUID: k2CTu3v2Qi+MYIFMXyXr8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="224838033"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 01 Dec 2025 10:13:27 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vQ8Oq-0000000091d-1lmf;
 Mon, 01 Dec 2025 18:13:24 +0000
Date: Tue, 2 Dec 2025 02:13:09 +0800
From: kernel test robot <lkp@intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, chaitanya.kumar.borah@intel.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, harry.wentland@amd.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com,
 swati2.sharma@intel.com, alex.hung@amd.com, jani.nikula@intel.com,
 suraj.kandpal@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: Re: [v7 07/15] drm/i915/color: Add plane CTM callback for D12 and
 beyond
Message-ID: <202512020215.qWaNGjB2-lkp@intel.com>
References: <20251201064655.3579280-8-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201064655.3579280-8-uma.shankar@intel.com>
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

Hi Uma,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20251201]
[cannot apply to drm-xe/drm-xe-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip v6.18 v6.18-rc7 v6.18-rc6 linus/master v6.18]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Uma-Shankar/drm-i915-display-Add-identifiers-for-driver-specific-blocks/20251201-150245
base:   next-20251201
patch link:    https://lore.kernel.org/r/20251201064655.3579280-8-uma.shankar%40intel.com
patch subject: [v7 07/15] drm/i915/color: Add plane CTM callback for D12 and beyond
config: i386-buildonly-randconfig-006-20251201 (https://download.01.org/0day-ci/archive/20251202/202512020215.qWaNGjB2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020215.qWaNGjB2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512020215.qWaNGjB2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/intel_color.c:31:
   drivers/gpu/drm/i915/display/intel_display_types.h:1993:28: error: field 'base' has incomplete type
    1993 |         struct drm_colorop base;
         |                            ^~~~
   drivers/gpu/drm/i915/display/intel_color.c: In function 'xelpd_load_plane_csc_matrix':
>> drivers/gpu/drm/i915/display/intel_color.c:3865:20: error: invalid use of undefined type 'struct drm_color_ctm_3x4'
    3865 |         input = ctm->matrix;
         |                    ^~


vim +3865 drivers/gpu/drm/i915/display/intel_color.c

  3846	
  3847	static void
  3848	xelpd_load_plane_csc_matrix(struct intel_dsb *dsb,
  3849				    const struct intel_plane_state *plane_state)
  3850	{
  3851		struct intel_display *display = to_intel_display(plane_state);
  3852		const struct drm_plane_state *state = &plane_state->uapi;
  3853		enum pipe pipe = to_intel_plane(state->plane)->pipe;
  3854		enum plane_id plane = to_intel_plane(state->plane)->id;
  3855		const struct drm_property_blob *blob = plane_state->hw.ctm;
  3856		struct drm_color_ctm_3x4 *ctm;
  3857		const u64 *input;
  3858		u16 coeffs[9] = {};
  3859		int i, j;
  3860	
  3861		if (!icl_is_hdr_plane(display, plane) || !blob)
  3862			return;
  3863	
  3864		ctm = blob->data;
> 3865		input = ctm->matrix;
  3866	
  3867		/*
  3868		 * Convert fixed point S31.32 input to format supported by the
  3869		 * hardware.
  3870		 */
  3871		for (i = 0, j = 0; i < ARRAY_SIZE(coeffs); i++) {
  3872			u64 abs_coeff = ((1ULL << 63) - 1) & input[j];
  3873	
  3874			/*
  3875			 * Clamp input value to min/max supported by
  3876			 * hardware.
  3877			 */
  3878			abs_coeff = clamp_val(abs_coeff, 0, CTM_COEFF_4_0 - 1);
  3879	
  3880			/* sign bit */
  3881			if (CTM_COEFF_NEGATIVE(input[j]))
  3882				coeffs[i] |= 1 << 15;
  3883	
  3884			if (abs_coeff < CTM_COEFF_0_125)
  3885				coeffs[i] |= (3 << 12) |
  3886					      ILK_CSC_COEFF_FP(abs_coeff, 12);
  3887			else if (abs_coeff < CTM_COEFF_0_25)
  3888				coeffs[i] |= (2 << 12) |
  3889					      ILK_CSC_COEFF_FP(abs_coeff, 11);
  3890			else if (abs_coeff < CTM_COEFF_0_5)
  3891				coeffs[i] |= (1 << 12) |
  3892					      ILK_CSC_COEFF_FP(abs_coeff, 10);
  3893			else if (abs_coeff < CTM_COEFF_1_0)
  3894				coeffs[i] |= ILK_CSC_COEFF_FP(abs_coeff, 9);
  3895			else if (abs_coeff < CTM_COEFF_2_0)
  3896				coeffs[i] |= (7 << 12) |
  3897					      ILK_CSC_COEFF_FP(abs_coeff, 8);
  3898			else
  3899				coeffs[i] |= (6 << 12) |
  3900					      ILK_CSC_COEFF_FP(abs_coeff, 7);
  3901	
  3902			/* Skip postoffs */
  3903			if (!((j + 2) % 4))
  3904				j += 2;
  3905			else
  3906				j++;
  3907		}
  3908	
  3909		intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 0),
  3910				   coeffs[0] << 16 | coeffs[1]);
  3911		intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 1),
  3912				   coeffs[2] << 16);
  3913	
  3914		intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 2),
  3915				   coeffs[3] << 16 | coeffs[4]);
  3916		intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 3),
  3917				   coeffs[5] << 16);
  3918	
  3919		intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 4),
  3920				   coeffs[6] << 16 | coeffs[7]);
  3921		intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 5),
  3922				   coeffs[8] << 16);
  3923	
  3924		intel_de_write_dsb(display, dsb, PLANE_CSC_PREOFF(pipe, plane, 0), 0);
  3925		intel_de_write_dsb(display, dsb, PLANE_CSC_PREOFF(pipe, plane, 1), 0);
  3926		intel_de_write_dsb(display, dsb, PLANE_CSC_PREOFF(pipe, plane, 2), 0);
  3927	
  3928		/*
  3929		 * Conversion from S31.32 to S0.12. BIT[12] is the signed bit
  3930		 */
  3931		intel_de_write_dsb(display, dsb,
  3932				   PLANE_CSC_POSTOFF(pipe, plane, 0),
  3933				   ctm_to_twos_complement(input[3], 0, 12));
  3934		intel_de_write_dsb(display, dsb,
  3935				   PLANE_CSC_POSTOFF(pipe, plane, 1),
  3936				   ctm_to_twos_complement(input[7], 0, 12));
  3937		intel_de_write_dsb(display, dsb,
  3938				   PLANE_CSC_POSTOFF(pipe, plane, 2),
  3939				   ctm_to_twos_complement(input[11], 0, 12));
  3940	}
  3941	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
