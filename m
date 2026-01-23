Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPSLGxtpc2mivQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 13:27:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD20675C1F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 13:27:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8247410E2AE;
	Fri, 23 Jan 2026 12:27:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lUvLUFUl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D085510E2BA;
 Fri, 23 Jan 2026 12:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769171222; x=1800707222;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XA1SjaS2/7tkFIIRzJGUee57bJy4LE6ja09RafCZp9g=;
 b=lUvLUFUlAZBCEeji6JUCP4bk59HalqL+Or4vLPGS4a+tpgbpAC5JWEHO
 0ukw/r9MSsl0a6b2bTGiAORJjwrev4RPQYp/jBZvoBUuxwl3EYGLsuZZ6
 /FIFTFExLe5aYhEhIedQtGSzfUH8MillninPPMW61PVVP5r31fUpj6xFF
 RqrwNprbfCmKTfT2zI9YVPzZHDxSNecrPfuv6Q8G1Oym2fLDBmjZzZTpM
 mV2gRyfYuPVOnzcyer1J9ap059pOCnS2nHafX0Zxh+5d3cOi7/dhl/VvD
 yc8sHwVunBLvnHxjxK2p6FR6gB51ZX+47uz41P3LCIorB5NwMArbLPnWS A==;
X-CSE-ConnectionGUID: USWwX9taTkeNJHn4czN6Ug==
X-CSE-MsgGUID: qqsLboTJQQ6M/47GiM6n0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="87841460"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="87841460"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 04:27:02 -0800
X-CSE-ConnectionGUID: QzrIgEsERtSX4zO+kS9/Uw==
X-CSE-MsgGUID: W4E3+5+NR4iRaLuDbBSLGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="206274996"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa010.jf.intel.com with ESMTP; 23 Jan 2026 04:26:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vjGFY-00000000TwY-3vMe;
 Fri, 23 Jan 2026 12:26:52 +0000
Date: Fri, 23 Jan 2026 20:26:09 +0800
From: kernel test robot <lkp@intel.com>
To: Hamza Mahfooz <someguy@effective-light.com>,
 dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Hamza Mahfooz <someguy@effective-light.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sunil Khatri <sunil.khatri@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Ce Sun <cesun102@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>, Alex Hung <alex.hung@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Melissa Wen <mwen@igalia.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <mdaenzer@redhat.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/amdgpu: implement page_flip_timeout() support
Message-ID: <202601232007.NAxTeBna-lkp@intel.com>
References: <20260123000537.2450496-2-someguy@effective-light.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123000537.2450496-2-someguy@effective-light.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,effective-light.com,amd.com,gmail.com,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,redhat.com,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.965];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: CD20675C1F
X-Rspamd-Action: no action

Hi Hamza,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-i915/for-linux-next drm-i915/for-linux-next-fixes drm-tip/drm-tip linus/master v6.19-rc6 next-20260122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hamza-Mahfooz/drm-amdgpu-implement-page_flip_timeout-support/20260123-085944
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260123000537.2450496-2-someguy%40effective-light.com
patch subject: [PATCH 2/2] drm/amdgpu: implement page_flip_timeout() support
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260123/202601232007.NAxTeBna-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601232007.NAxTeBna-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601232007.NAxTeBna-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c:348:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     348 |         default:
         |         ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c:348:2: note: insert '__attribute__((fallthrough));' to silence this warning
     348 |         default:
         |         ^
         |         __attribute__((fallthrough)); 
   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c:348:2: note: insert 'break;' to avoid fall-through
     348 |         default:
         |         ^
         |         break; 
   1 warning generated.


vim +348 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c

2656e1ce783a90 Eric Huang    2024-06-03  315  
2656e1ce783a90 Eric Huang    2024-06-03  316  void amdgpu_reset_get_desc(struct amdgpu_reset_context *rst_ctxt, char *buf,
2656e1ce783a90 Eric Huang    2024-06-03  317  			   size_t len)
2656e1ce783a90 Eric Huang    2024-06-03  318  {
2656e1ce783a90 Eric Huang    2024-06-03  319  	if (!buf || !len)
2656e1ce783a90 Eric Huang    2024-06-03  320  		return;
2656e1ce783a90 Eric Huang    2024-06-03  321  
2656e1ce783a90 Eric Huang    2024-06-03  322  	switch (rst_ctxt->src) {
2656e1ce783a90 Eric Huang    2024-06-03  323  	case AMDGPU_RESET_SRC_JOB:
2656e1ce783a90 Eric Huang    2024-06-03  324  		if (rst_ctxt->job) {
7bed1df814cd61 Eric Huang    2024-06-06  325  			snprintf(buf, len, "job hang on ring:%s",
7bed1df814cd61 Eric Huang    2024-06-06  326  				 rst_ctxt->job->base.sched->name);
2656e1ce783a90 Eric Huang    2024-06-03  327  		} else {
2656e1ce783a90 Eric Huang    2024-06-03  328  			strscpy(buf, "job hang", len);
2656e1ce783a90 Eric Huang    2024-06-03  329  		}
2656e1ce783a90 Eric Huang    2024-06-03  330  		break;
2656e1ce783a90 Eric Huang    2024-06-03  331  	case AMDGPU_RESET_SRC_RAS:
2656e1ce783a90 Eric Huang    2024-06-03  332  		strscpy(buf, "RAS error", len);
2656e1ce783a90 Eric Huang    2024-06-03  333  		break;
2656e1ce783a90 Eric Huang    2024-06-03  334  	case AMDGPU_RESET_SRC_MES:
2656e1ce783a90 Eric Huang    2024-06-03  335  		strscpy(buf, "MES hang", len);
2656e1ce783a90 Eric Huang    2024-06-03  336  		break;
2656e1ce783a90 Eric Huang    2024-06-03  337  	case AMDGPU_RESET_SRC_HWS:
2656e1ce783a90 Eric Huang    2024-06-03  338  		strscpy(buf, "HWS hang", len);
2656e1ce783a90 Eric Huang    2024-06-03  339  		break;
2656e1ce783a90 Eric Huang    2024-06-03  340  	case AMDGPU_RESET_SRC_USER:
2656e1ce783a90 Eric Huang    2024-06-03  341  		strscpy(buf, "user trigger", len);
2656e1ce783a90 Eric Huang    2024-06-03  342  		break;
c5da9e9c023893 Alex Deucher  2025-04-16  343  	case AMDGPU_RESET_SRC_USERQ:
c5da9e9c023893 Alex Deucher  2025-04-16  344  		strscpy(buf, "user queue trigger", len);
c5da9e9c023893 Alex Deucher  2025-04-16  345  		break;
7136aabf196b0a Hamza Mahfooz 2026-01-22  346  	case AMDGPU_RESET_SRC_DISPLAY:
7136aabf196b0a Hamza Mahfooz 2026-01-22  347  		strscpy(buf, "display hang", len);
2656e1ce783a90 Eric Huang    2024-06-03 @348  	default:
2656e1ce783a90 Eric Huang    2024-06-03  349  		strscpy(buf, "unknown", len);
2656e1ce783a90 Eric Huang    2024-06-03  350  	}
2656e1ce783a90 Eric Huang    2024-06-03  351  }
a86e0c0e94373a Lijo Lazar    2024-11-15  352  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
