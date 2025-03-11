Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AB9A5BC5C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 10:34:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA7310E540;
	Tue, 11 Mar 2025 09:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JcMQkSfG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9D810E54B;
 Tue, 11 Mar 2025 09:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741685663; x=1773221663;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=LebBBESWJ2cPq87zRLHHN29cZaZU4ISrMaxhhN5zrNI=;
 b=JcMQkSfGN+5qlyDTdl+O48LJa+IKoTIPZXoEBWVvEnnw/vZ68zbmP/U0
 LeuhC8vCjX0DHwK/e748TcP7J8LwiXekz61xgXVSzCsBYajLD4GAtB2Q9
 KVc1ojqibOshj2a7bsX1tkiUfeiatAFAb4Nw5xt1rDhYxsBo9X6/u8uZD
 pAYCc+lTLCJmatRJBg08eIVHoklqlVAIlyqLqAIOe4DQPmr7xmvyemRCi
 fPpXrgQuiy9LLbU9Rn8U08Z/sWgoQxXoc6Sk64ml+3xGXtw3HYDEI3V7k
 E0CrgOw4Q4OBsncE+vSiUOorxQHiJPhwFyFA1rE6uZqS9P6gdA82xujGO Q==;
X-CSE-ConnectionGUID: EI8Y3GlBS7WHLI88tl8cdg==
X-CSE-MsgGUID: vG63ytTBR+iSVefxxD0lLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="68075692"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="68075692"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 02:34:22 -0700
X-CSE-ConnectionGUID: u11IgAWMTa+qUNcV7QfobA==
X-CSE-MsgGUID: Bh0EboGfRXypRCkABqco+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="125297902"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 02:34:21 -0700
Date: Tue, 11 Mar 2025 11:34:11 +0200
From: Imre Deak <imre.deak@intel.com>
To: Wayne Lin <Wayne.Lin@amd.com>, Lyude Paul <lyude@redhat.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyTIGk5MTUuQ0kuQkFUOiBzdWNj?=
 =?utf-8?Q?ess_for_drm=2Fdp=5Fmst?= =?utf-8?Q?=3A?= Fix locking when skipping
 CSN before topology probing
Message-ID: <Z9ADk3ZPdCyZZd8R@ideak-desk.fi.intel.com>
References: <20250307183152.3822170-1-imre.deak@intel.com>
 <174137869839.3691.14948952669555397218@18a75f3d1eae>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174137869839.3691.14948952669555397218@18a75f3d1eae>
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 07, 2025 at 08:18:18PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/dp_mst: Fix locking when skipping CSN before topology probing
> URL   : https://patchwork.freedesktop.org/series/146019/
> State : success

Thanks for the reviews, patch is pushed to drm-misc-fixes.

> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16246 -> Patchwork_146019v1
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_146019v1/index.html
> 
> Participating hosts (43 -> 43)
> ------------------------------
> 
>   Additional (1): bat-arlh-2 
>   Missing    (1): fi-snb-2520m 
> 
> Known issues
> ------------
> 
>   Here are the changes found in Patchwork_146019v1 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@debugfs_test@basic-hwmon:
>     - bat-arlh-2:         NOTRUN -> [SKIP][1] ([i915#11346] / [i915#9318])
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_146019v1/bat-arlh-2/igt@debugfs_test@basic-hwmon.html
> 
>   * igt@fbdev@eof:
>     - bat-arlh-2:         NOTRUN -> [SKIP][2] ([i915#11345] / [i915#11346]) +3 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_146019v1/bat-arlh-2/igt@fbdev@eof.html
> 
>   * igt@fbdev@info:
>     - bat-arlh-2:         NOTRUN -> [SKIP][3] ([i915#11346] / [i915#1849])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_146019v1/bat-arlh-2/igt@fbdev@info.html
>     - fi-kbl-8809g:       NOTRUN -> [SKIP][4] ([i915#1849])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_146019v1/fi-kbl-8809g/igt@fbdev@info.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - fi-kbl-8809g:       NOTRUN -> [SKIP][5] ([i915#2190])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_146019v1/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_swapping@basic:
>     - bat-arlh-2:         NOTRUN -> [SKIP][6] ([i915#10213] / [i915#11346] / [i915#11671]) +3 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_146019v1/bat-arlh-2/igt@gem_lmem_swapping@basic.html
> 
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - fi-kbl-8809g:       NOTRUN -> [SKIP][7] ([i915#4613]) +3 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_146019v1/fi-kbl-8809g/igt@gem_lmem_swapping@parallel-random-engines.html
> 
>   * igt@gem_mmap@basic:
>     - bat-arlh-2:         NOTRUN -> [SKIP][8] ([i915#11343] / [i915#11346])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_146019v1/bat-arlh-2/igt@gem_mmap@basic.html
> 
>   * igt@gem_render_tiled_blits@basic:
>     - bat-arlh-2:         NOTRUN -> [SKIP][9] ([i915#10197] / [i915#10211] / [i915#11346] / [i915#11725])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_146019v1/bat-arlh-2/igt@gem_render_tiled_blits@basic.html
> 
>   * igt@gem_tiled_blits@basic:
>     - bat-arlh-2:         NOTRUN -> [SKIP][10] ([i915#11346] / [i915#12637]) +4 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_146019v1/bat-arlh-2/igt@gem_tiled_blits@basic.html
> 
>   * igt@gem_tiled_pread_basic:
>     - bat-arlh-2:         NOTRUN -> [SKIP][11] ([i915#10206] / [i915#11346] / [i915#11724])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_146019v1/bat-arlh-2/igt@gem_tiled_pread_basic.html
> 
>   * igt@i915_pm_rpm@module-reload:
>     - bat-adls-6:         [PASS][12] -> [FAIL][13] ([i915#13633])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16246/bat-adls-6/igt@i915_pm_rpm@module-reload.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_146019v1/bat-adls-6/igt@i915_pm_rpm@module-reload.html
>     - bat-dg1-7:          [PASS][14] -> [FAIL][15] ([i915#13633])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16246/bat-dg1-7/igt@i915_pm_rpm@module-reload.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_146019v1/bat-dg1-7/igt@i915_pm_rpm@module-reload.html
>     - bat-rpls-4:         [PASS][16] -> [FAIL][17] ([i915#13633])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16246/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_146019v1/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - bat-arlh-2:         NOTRUN -> [SKIP][18] ([i915#10209] / [i915#11346] / [i915#11681])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_146019v1/bat-arlh-2/igt@i915_pm_rps@basic-api.html
> 
>   * igt@i915_selftest@live:
>     - bat-mtlp-8:         [PASS][19] -> [DMESG-FAIL][20] ([i915#12061]) +1 other test dmesg-fail
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16246/bat-mtlp-8/igt@i915_selftest@live.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_146019v1/bat-mtlp-8/igt@i915_selftest@live.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-arls-6:         [PASS][21] -> [DMESG-FAIL][22] ([i915#12061]) +1 other test dmesg-fail
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16246/bat-arls-6/igt@i915_selftest@live@workarounds.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_146019v1/bat-arls-6/igt@i915_selftest@live@workarounds.html
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - bat-arlh-2:         NOTRUN -> [SKIP][23] ([i915#10200] / [i915#11346] / [i915#11666] / [i915#12203])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_146019v1/bat-arlh-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_addfb_basic@basic-x-tiled-legacy:
>     - bat-arlh-2:         NOTRUN -> [SKIP][24] ([i915#10200] / [i915#11346] / [i915#11666]) +8 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_146019v1/bat-arlh-2/igt@kms_addfb_basic@basic-x-tiled-legacy.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - fi-kbl-8809g:       NOTRUN -> [SKIP][25] +34 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_146019v1/fi-kbl-8809g/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
>     - bat-dg2-11:         [PASS][26] -> [SKIP][27] ([i915#9197]) +3 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16246/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_146019v1/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
> 
>   * igt@kms_psr@psr-primary-page-flip:
>     - bat-arlh-2:         NOTRUN -> [SKIP][28] ([i915#11346]) +32 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_146019v1/bat-arlh-2/igt@kms_psr@psr-primary-page-flip.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - bat-arlh-2:         NOTRUN -> [SKIP][29] ([i915#10208] / [i915#11346] / [i915#8809])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_146019v1/bat-arlh-2/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@prime_vgem@basic-fence-read:
>     - bat-arlh-2:         NOTRUN -> [SKIP][30] ([i915#10212] / [i915#11346] / [i915#11726])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_146019v1/bat-arlh-2/igt@prime_vgem@basic-fence-read.html
> 
>   * igt@prime_vgem@basic-read:
>     - bat-arlh-2:         NOTRUN -> [SKIP][31] ([i915#10214] / [i915#11346] / [i915#11726])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_146019v1/bat-arlh-2/igt@prime_vgem@basic-read.html
> 
>   * igt@prime_vgem@basic-write:
>     - bat-arlh-2:         NOTRUN -> [SKIP][32] ([i915#10216] / [i915#11346] / [i915#11723])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_146019v1/bat-arlh-2/igt@prime_vgem@basic-write.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-arls-5:         [DMESG-FAIL][33] ([i915#12061]) -> [PASS][34] +1 other test pass
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16246/bat-arls-5/igt@i915_selftest@live@workarounds.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_146019v1/bat-arls-5/igt@i915_selftest@live@workarounds.html
>     - bat-mtlp-6:         [DMESG-FAIL][35] ([i915#12061]) -> [PASS][36] +1 other test pass
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16246/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_146019v1/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
>     - bat-mtlp-9:         [DMESG-FAIL][37] ([i915#12061]) -> [PASS][38] +1 other test pass
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16246/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_146019v1/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
> 
>   
>   [i915#10197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10197
>   [i915#10200]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200
>   [i915#10206]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10206
>   [i915#10208]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10208
>   [i915#10209]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10209
>   [i915#10211]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10211
>   [i915#10212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212
>   [i915#10213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213
>   [i915#10214]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214
>   [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
>   [i915#11343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11343
>   [i915#11345]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11345
>   [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
>   [i915#11666]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11666
>   [i915#11671]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671
>   [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
>   [i915#11723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11723
>   [i915#11724]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11724
>   [i915#11725]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11725
>   [i915#11726]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11726
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
>   [i915#12203]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12203
>   [i915#12637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637
>   [i915#13633]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13633
>   [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
>   [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
>   [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>   [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
>   [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
>   [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318
> 
> 
> Build changes
> -------------
> 
>   * Linux: CI_DRM_16246 -> Patchwork_146019v1
> 
>   CI-20190529: 20190529
>   CI_DRM_16246: f811577f424491a57b1e8669bde62998227d6907 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGT_8264: 8264
>   Patchwork_146019v1: f811577f424491a57b1e8669bde62998227d6907 @ git://anongit.freedesktop.org/gfx-ci/linux
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_146019v1/index.html
