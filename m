Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJVtKytBrWnv0AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 10:28:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA64122F2BD
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 10:28:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C110010E090;
	Sun,  8 Mar 2026 09:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IM1YdcDl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85FD710E090
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2026 09:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772962085; x=1804498085;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cSiZXE/kSyUm1O0K63blHHUWZz+8qV9acKXRx5UCc/s=;
 b=IM1YdcDlkmgam0U6hxJ78zaVEeYT/BZ+DALT8A2Gd6P8hRzHL+xUF25B
 xIF7t8YS4dOWfGmNRT51yVd+3c0rIbAn5wfOmQ9f0qwutkkyXnunCJbdZ
 0JIJ8awEuAwM92hwsh8WzQ2a30QbvVC27pDNVbS2GN3JTP8Hy17VQ3Cww
 5Pt7/MqekTT34APPOVj6QqnRqJEHJqyBAUZnOcRnAGZzEXRxn1+05WBjP
 1hQMWQTAHUqgaSwDFrDn5OinH4xb+nD2SNXJAlJamF3F0AWC6CuR3xTyn
 uolIhVySa6SG5Z0T/nsPuI7557s1qzHPOdAVxo+8Mnq9WRMaX0ePNHbP4 A==;
X-CSE-ConnectionGUID: 2yyBft6RTDOUcBpBha2Wbg==
X-CSE-MsgGUID: I53MsyA4QFKRoeUdw+XFCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="91393776"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; d="scan'208";a="91393776"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2026 01:28:04 -0800
X-CSE-ConnectionGUID: waEBKvIXRRa+tF9r0Ld7dQ==
X-CSE-MsgGUID: IE1cYLz2RWCqRrAaJCAGjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; d="scan'208";a="223926575"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 08 Mar 2026 01:28:00 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vzAQX-0000000030X-46lI;
 Sun, 08 Mar 2026 09:27:57 +0000
Date: Sun, 8 Mar 2026 17:27:51 +0800
From: kernel test robot <lkp@intel.com>
To: Kishore Batta <kishore.batta@oss.qualcomm.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/9] bus: mhi: Centralize firmware image table
 selection at probe time
Message-ID: <202603081717.xp3UQU2K-lkp@intel.com>
References: <20260307-sahara_protocol_new_v2-v2-4-29dc748b5e9c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307-sahara_protocol_new_v2-v2-4-29dc748b5e9c@oss.qualcomm.com>
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
X-Rspamd-Queue-Id: BA64122F2BD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:kishore.batta@oss.qualcomm.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:jeff.hugo@oss.qualcomm.com,m:carl.vanderlip@oss.qualcomm.com,m:ogabbay@kernel.org,m:mani@kernel.org,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mhi@lists.linux.dev,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,01.org:url]
X-Rspamd-Action: no action

Hi Kishore,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a0ae2a256046c0c5d3778d1a194ff2e171f16e5f]

url:    https://github.com/intel-lab-lkp/linux/commits/Kishore-Batta/Add-documentation-for-Sahara-protocol/20260307-194417
base:   a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
patch link:    https://lore.kernel.org/r/20260307-sahara_protocol_new_v2-v2-4-29dc748b5e9c%40oss.qualcomm.com
patch subject: [PATCH v2 4/9] bus: mhi: Centralize firmware image table selection at probe time
config: i386-buildonly-randconfig-003-20260308 (https://download.01.org/0day-ci/archive/20260308/202603081717.xp3UQU2K-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603081717.xp3UQU2K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603081717.xp3UQU2K-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bus/mhi/sahara/sahara.c:270:18: warning: address of array 'id->chan' will always evaluate to 'true' [-Wpointer-bool-conversion]
     270 |                         if (id && id->chan && !strcmp(id->chan, v->match))
         |                                ~~ ~~~~^~~~
   1 warning generated.


vim +270 drivers/bus/mhi/sahara/sahara.c

   260	
   261	static const struct sahara_variant *sahara_select_variant(struct mhi_device *mhi_dev,
   262								  const struct mhi_device_id *id)
   263	{
   264		int i;
   265	
   266		for (i = 0; i < ARRAY_SIZE(sahara_variants); i++) {
   267			const struct sahara_variant *v = &sahara_variants[i];
   268	
   269			if (v->match_is_chan) {
 > 270				if (id && id->chan && !strcmp(id->chan, v->match))
   271					return v;
   272			} else {
   273				if (mhi_dev->mhi_cntrl && mhi_dev->mhi_cntrl->name &&
   274				    !strcmp(mhi_dev->mhi_cntrl->name, v->match))
   275					return v;
   276			}
   277		}
   278		return NULL;
   279	}
   280	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
