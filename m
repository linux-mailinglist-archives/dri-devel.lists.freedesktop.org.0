Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGd6HLUNr2lVNAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 19:13:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2435023E5F7
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 19:13:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C140510E586;
	Mon,  9 Mar 2026 18:13:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j+YWF+L6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06D410E585;
 Mon,  9 Mar 2026 18:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773079983; x=1804615983;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4c26JMPBHTpphaYScUbyTq77R/6e3TYzFrDzQS+ekwU=;
 b=j+YWF+L6LYB6/gULMbtWgP8MPlM9cIBUSeZdbjHuwEVxc3F489uEnN8N
 CVnqqWLGu4HRcrKJdMdhwsYp4GDMGmYKmMNSreMxy2HRUEJCYvI6mUNNI
 77I9thEFKbJ1BTzty2batmCK30gv0o54eMoJdcjnUdV+ChkXjZzmIYTIZ
 pUcuxkVCrNCXCJ+FNjTRldb9Miy9TYnfRoNqlu9nPOedyDXIA3W3AVIrq
 nm91wd7jXumwgHRl4zh7U2x4rXc9M9aXtMdG78JXfCUAr719l/zRpaSvc
 mKkkZmq9J3+h98GVMRjswB1MJHRmRJrSAvOJnacQSaA/v5PbPJIcGoscl Q==;
X-CSE-ConnectionGUID: y6/sM7R1T+6kglVlCQ6Czw==
X-CSE-MsgGUID: Str+1lLIS+yIPzJ+Pp+51w==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74192157"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="74192157"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 11:13:03 -0700
X-CSE-ConnectionGUID: kONAl0Z1T7S2FmGlyWTSxA==
X-CSE-MsgGUID: kSkZmuXNRyGqo+KBrp7YyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="217424114"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 09 Mar 2026 11:12:59 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vzf68-000000000gG-3Coy;
 Mon, 09 Mar 2026 18:12:56 +0000
Date: Tue, 10 Mar 2026 02:12:37 +0800
From: kernel test robot <lkp@intel.com>
To: Rafael Passos <rafael@rcpassos.me>, alexdeucher@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 BhuvanaChandra.Pinninti@amd.com, Harry.Wentland@amd.com,
 Martin.Leung@amd.com, Sunpeng.Li@amd.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, daniel.wheeler@amd.com,
 davidbtadokoro@ime.usp.br, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rafael@rcpassos.me, ray.wu@amd.com,
 rcpassos@ime.usp.br, siqueira@igalia.com
Subject: Re: [PATCH] drm/amd/display: fix resuming from S3 sleep for Renoir
 iGPU
Message-ID: <202603100246.Tkzia4Ba-lkp@intel.com>
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
X-Rspamd-Queue-Id: 2435023E5F7
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
	RCPT_COUNT_TWELVE(0.00)[18];
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,gitlab.freedesktop.org:url,01.org:url,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Hi Rafael,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v7.0-rc3 next-20260306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rafael-Passos/drm-amd-display-fix-resuming-from-S3-sleep-for-Renoir-iGPU/20260308-080715
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260308000515.890688-1-rafael%40rcpassos.me
patch subject: [PATCH] drm/amd/display: fix resuming from S3 sleep for Renoir iGPU
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260310/202603100246.Tkzia4Ba-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260310/202603100246.Tkzia4Ba-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603100246.Tkzia4Ba-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dccg/dcn21/dcn21_dccg.c:99:6: warning: no previous prototype for function 'dccg21_init' [-Wmissing-prototypes]
      99 | void dccg21_init(struct dccg *dccg)
         |      ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dccg/dcn21/dcn21_dccg.c:99:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      99 | void dccg21_init(struct dccg *dccg)
         | ^
         | static 
   1 warning generated.


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
