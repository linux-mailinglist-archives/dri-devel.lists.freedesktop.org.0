Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIqhJksxrWl1zQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 09:20:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEB522F045
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 09:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8418B10E00E;
	Sun,  8 Mar 2026 08:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cG69BamK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE84310E009;
 Sun,  8 Mar 2026 08:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772958023; x=1804494023;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Pe3lvvOiPMFQ46F7OuVkf8+omFdhw7YDqvcnRRAGsLQ=;
 b=cG69BamKluF1caNfEh5dVLWrVHbBCY8SHoyC+efyJvplN30iCLplnaue
 lLb4VE2/TwbGhmGuEoLjgjFeMy8jHPN2CwD6uOyPjBNyz8b/iHXZ76Fia
 hQmSshidyTS++UqD+8SovdSSQliaoIGigkjbX/kgPdb7Mez1eXgp+bDDr
 T1GcnoPfcv79OKMXIChqKSzgvhnXpusF4z4gXjd7PL0D/CTbgItXA++nv
 TazAe4/ZUiYvxq7nPDLFZQ6gmtOB97hUdR1iwTGKKGqBnjS2oKO8KB3YH
 hD9Ply3hoBL7r/p9jMV+aHsPnD1GHsFSxcYdJZCQRhkG7swptw1hPEIrP w==;
X-CSE-ConnectionGUID: C/Q2ZzfqQcyas5/bETPWkA==
X-CSE-MsgGUID: 76Q20NvHQRWX5UHf3ancQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="73977855"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; d="scan'208";a="73977855"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2026 00:20:22 -0800
X-CSE-ConnectionGUID: lA4yGwBVQuKcjREHK06l5Q==
X-CSE-MsgGUID: A+qRt4H6RvW8JfY0/nx6vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; d="scan'208";a="218641940"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2)
 ([10.211.93.152])
 by orviesa010.jf.intel.com with ESMTP; 08 Mar 2026 00:20:18 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vz9N1-000000002eD-2dND;
 Sun, 08 Mar 2026 08:20:15 +0000
Date: Sun, 8 Mar 2026 09:19:42 +0100
From: kernel test robot <lkp@intel.com>
To: Rafael Passos <rafael@rcpassos.me>, alexdeucher@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, BhuvanaChandra.Pinninti@amd.com,
 Harry.Wentland@amd.com, Martin.Leung@amd.com, Sunpeng.Li@amd.com,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 daniel.wheeler@amd.com, davidbtadokoro@ime.usp.br,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rafael@rcpassos.me, ray.wu@amd.com, rcpassos@ime.usp.br,
 siqueira@igalia.com
Subject: Re: [PATCH] drm/amd/display: fix resuming from S3 sleep for Renoir
 iGPU
Message-ID: <202603080959.llKqWvRQ-lkp@intel.com>
References: <20260308000515.890688-1-rafael@rcpassos.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308000515.890688-1-rafael@rcpassos.me>
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
X-Rspamd-Queue-Id: 4BEB522F045
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[rcpassos.me,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.928];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[git-scm.com:url,gitlab.freedesktop.org:url,01.org:url]
X-Rspamd-Action: no action

Hi Rafael,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v7.0-rc2 next-20260306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rafael-Passos/drm-amd-display-fix-resuming-from-S3-sleep-for-Renoir-iGPU/20260308-080715
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260308000515.890688-1-rafael%40rcpassos.me
patch subject: [PATCH] drm/amd/display: fix resuming from S3 sleep for Renoir iGPU
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260308/202603080959.llKqWvRQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603080959.llKqWvRQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603080959.llKqWvRQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dccg/dcn21/dcn21_dccg.c:99:6: warning: no previous prototype for 'dccg21_init' [-Wmissing-prototypes]
      99 | void dccg21_init(struct dccg *dccg)
         |      ^~~~~~~~~~~


vim +/dccg21_init +99 drivers/gpu/drm/amd/amdgpu/../display/dc/dccg/dcn21/dcn21_dccg.c

    98	
  > 99	void dccg21_init(struct dccg *dccg)
   100	{
   101		struct dcn_dccg *dccg_dcn = TO_DCN_DCCG(dccg);
   102	
   103		/* Hardcoded register values for DCN21
   104		 * These are specific to 100Mhz refclk
   105		 * Different ASICs with different refclk may override this in their own init
   106		 */
   107		REG_WRITE(MICROSECOND_TIME_BASE_DIV, 0x00120464);
   108		REG_WRITE(MILLISECOND_TIME_BASE_DIV, 0x001186a0);
   109		REG_WRITE(DISPCLK_FREQ_CHANGE_CNTL, 0x0e01003c);
   110	
   111		if (REG(REFCLK_CNTL))
   112			REG_WRITE(REFCLK_CNTL, 0);
   113	}
   114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
