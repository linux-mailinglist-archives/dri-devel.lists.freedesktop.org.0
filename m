Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKEhKlSDrGk1qQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 20:58:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8051622D6F6
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 20:58:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97AEE10E438;
	Sat,  7 Mar 2026 19:58:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PlQSdJ68";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1BC10E43A;
 Sat,  7 Mar 2026 19:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772913488; x=1804449488;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vpK34jiavOf+wUMryDBJi/NV9WUWupPS9ZThQGAPlxY=;
 b=PlQSdJ68NfuauOVjpICx+kRHbdXEIEPw5/4i8vydwUpg9AvzyO3zUh6y
 +b4HX3DdW7nM+/A3BBNYQ/kPZrJ40pdKaAObyYO+01IEvMWMbN5IVP3rg
 RS8F4nGZofliTVmO3yaE0tzXcvxRBNv1zlW2z4LjYvI4cM7kFGoA7MH5n
 r/DktOjNM56hdweNgq+eHPUZdxNcku6AT2guJUAfFkza3nu6Tr279mEJu
 jMTploOe0fjJA3MRL24kz2lBg9hOpngBaXdxRuSre01v+urxbdIjcjBxw
 mDtgydcREe21Fzg6xfs6Rl8HxDYi6Cj9Fgrt23VZE3FPWSk4OBdUKvaM6 Q==;
X-CSE-ConnectionGUID: N/WXUW/uSSSfOT+ITTmhiA==
X-CSE-MsgGUID: fsIoxIbRSCmeS3Ou3t49eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="77869820"
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; d="scan'208";a="77869820"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2026 11:58:08 -0800
X-CSE-ConnectionGUID: 5rWMSpbATBKAzYYozik7zQ==
X-CSE-MsgGUID: JSmY/5QtSHS2UCmjdOGBHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; d="scan'208";a="224286777"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 07 Mar 2026 11:58:05 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vyxmj-000000002b3-0qaW;
 Sat, 07 Mar 2026 19:58:01 +0000
Date: Sun, 8 Mar 2026 03:57:25 +0800
From: kernel test robot <lkp@intel.com>
To: Pengyu Luo <mitltlatltl@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, Pengyu Luo <mitltlatltl@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: fix pclk rate calculation for bonded dsi
Message-ID: <202603080314.XeqyRZ7A-lkp@intel.com>
References: <20260306163255.215456-1-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306163255.215456-1-mitltlatltl@gmail.com>
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
X-Rspamd-Queue-Id: 8051622D6F6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,vger.kernel.org,lists.freedesktop.org];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.966];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,01.org:url,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Action: no action

Hi Pengyu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v7.0-rc2 next-20260306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pengyu-Luo/drm-msm-dsi-fix-pclk-rate-calculation-for-bonded-dsi/20260307-010943
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260306163255.215456-1-mitltlatltl%40gmail.com
patch subject: [PATCH] drm/msm/dsi: fix pclk rate calculation for bonded dsi
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260308/202603080314.XeqyRZ7A-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603080314.XeqyRZ7A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603080314.XeqyRZ7A-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/msm/dsi/dsi_host.c:590 function parameter 'is_bonded_dsi' not described in 'dsi_adjust_pclk_for_compression'
>> Warning: drivers/gpu/drm/msm/dsi/dsi_host.c:590 function parameter 'is_bonded_dsi' not described in 'dsi_adjust_pclk_for_compression'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
