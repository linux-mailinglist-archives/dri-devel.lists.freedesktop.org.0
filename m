Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGaTDug5rWndzgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 09:57:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B35D22F19E
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 09:57:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7917510E044;
	Sun,  8 Mar 2026 08:57:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jF+myy0e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E64610E044
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2026 08:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772960227; x=1804496227;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=x3L8/hSJukNMi+lmDq/Se3gidbTHfKkxioCsvzYz/9c=;
 b=jF+myy0eKubV1nfeTfq8EB/xu/ddvVfhYPaPdhASr4HqLZza/XIY5cy9
 gvJRoneedPQzQUSd8W5xwMiv80qmu9cx620KFUjCdI4H9IyBQbrwV/drb
 QuHI5n2TzcRtBI7c0vfO/cq81cFcIwdPPCOisUFCc4tUpOjE4ZqujbGf7
 mSKEy0J0eZlxW+ykzKX3VVJLIlLFogMmDtyyVRkmmoEUdvhrwbohuF8Sp
 dhI5ODFWXo0AZHAfhz/BQjcbNYQxbttjoW1BHw7+zEM/ncztq5MFOe5kc
 2iB9AbANTPhLuPUw7OYIK9MP6O159bQm0xjOOjeNFyHFRCzHaMt+w0+vV A==;
X-CSE-ConnectionGUID: kmHehaMUSW2T0KBUu/jvsw==
X-CSE-MsgGUID: 2Q+qL9ppTq28FuVAxUt3mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="74202441"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; d="scan'208";a="74202441"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2026 00:57:03 -0800
X-CSE-ConnectionGUID: qaGVg+KyTWmMdGABz88xqw==
X-CSE-MsgGUID: KiZ3vj7/QA+yk4CkqqYqtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; d="scan'208";a="223920453"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 08 Mar 2026 00:57:00 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vz9wX-00000000305-2YXB;
 Sun, 08 Mar 2026 08:56:57 +0000
Date: Sun, 8 Mar 2026 16:56:15 +0800
From: kernel test robot <lkp@intel.com>
To: Kishore Batta <kishore.batta@oss.qualcomm.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mhi@lists.linux.dev,
 Kishore Batta <kishore.batta@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/9] bus: mhi: Centralize firmware image table
 selection at probe time
Message-ID: <202603081641.KSZC3Jla-lkp@intel.com>
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
X-Rspamd-Queue-Id: 8B35D22F19E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:kishore.batta@oss.qualcomm.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:jeff.hugo@oss.qualcomm.com,m:carl.vanderlip@oss.qualcomm.com,m:ogabbay@kernel.org,m:mani@kernel.org,m:oe-kbuild-all@lists.linux.dev,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mhi@lists.linux.dev,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
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
	NEURAL_HAM(-0.00)[-0.991];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Hi Kishore,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a0ae2a256046c0c5d3778d1a194ff2e171f16e5f]

url:    https://github.com/intel-lab-lkp/linux/commits/Kishore-Batta/Add-documentation-for-Sahara-protocol/20260307-194417
base:   a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
patch link:    https://lore.kernel.org/r/20260307-sahara_protocol_new_v2-v2-4-29dc748b5e9c%40oss.qualcomm.com
patch subject: [PATCH v2 4/9] bus: mhi: Centralize firmware image table selection at probe time
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260308/202603081641.KSZC3Jla-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603081641.KSZC3Jla-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603081641.KSZC3Jla-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/bus/mhi/sahara/sahara.c: In function 'sahara_select_variant':
>> drivers/bus/mhi/sahara/sahara.c:270:32: warning: the comparison will always evaluate as 'true' for the address of 'chan' will never be NULL [-Waddress]
     270 |                         if (id && id->chan && !strcmp(id->chan, v->match))
         |                                ^~
   In file included from drivers/bus/mhi/sahara/sahara.c:12:
   include/linux/mod_devicetable.h:867:20: note: 'chan' declared here
     867 |         const char chan[MHI_NAME_SIZE];
         |                    ^~~~


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
