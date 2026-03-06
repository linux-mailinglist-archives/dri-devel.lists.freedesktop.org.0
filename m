Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCKvMBaKqml0TQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 09:02:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB2921CC87
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 09:02:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3E110E3A4;
	Fri,  6 Mar 2026 08:02:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b+Za/AfX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D75110E3A4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 08:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772784146; x=1804320146;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XYXePCuYtoMn6zgave+FTiKfxh89bOZmVAJ15I+iZvQ=;
 b=b+Za/AfXMXK32haIask3wAjHJzpzg8IEgBmW567D/XnqBwgV/Q1exj6R
 0Iz43OWp0or4YWV0PCXzY7v69qicQbTeU/QKi8HLzmhnLy/cxNjNG3Dyy
 1rGaEEJ5z+YBln80dpLPKjDcLDfXMMYWv5nwZZ2cBwnSbZ7zmwkztiBve
 N3S6rGJ1U9dEJA36HtP4gf9xm6reaQ4FT7yEZrk9Y9GsXfkhlemf0IraN
 hKo8n0kzrLUMn9f8bbom6XTFq21M0mF/iH/1UjJw4OqJIxuxKFhUeSLaW
 eyar+CdTTWrvBFzM2erHzqd8UG6bbZ1oYRn18biwFt7JDYjKHoLc5Tu60 A==;
X-CSE-ConnectionGUID: RZyoRMSxRV6eTvkMt6iXSw==
X-CSE-MsgGUID: fhud7UuRQ+Wnad1cdFz08g==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="84522189"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="84522189"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 00:02:17 -0800
X-CSE-ConnectionGUID: i/G8HcP5TbGCsooB29xPGw==
X-CSE-MsgGUID: rd2dXeBiQUS5WXBRLnNLfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="219073484"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 06 Mar 2026 00:02:12 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vyQ8O-000000000Y5-01ip;
 Fri, 06 Mar 2026 08:02:08 +0000
Date: Fri, 6 Mar 2026 16:01:51 +0800
From: kernel test robot <lkp@intel.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akash Goel <akash.goel@arm.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Chris Diamand <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, Chia-I Wu <olvaffe@gmail.com>,
 kernel@collabora.com
Subject: Re: [PATCH v4 5/9] drm/panthor: Part ways with drm_gem_shmem_object
Message-ID: <202603061504.eTxNXzrU-lkp@intel.com>
References: <20260305124320.156606-6-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305124320.156606-6-boris.brezillon@collabora.com>
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
X-Rspamd-Queue-Id: BAB2921CC87
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,lists.freedesktop.org,gmail.com,ffwll.ch,arm.com,oss.qualcomm.com,poorly.run,kernel.org,linux.intel.com,suse.de,collabora.com,intel.com,google.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:bbrezillon@kernel.org,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:adrian.larumbe@collabora.com,m:oe-kbuild-all@lists.linux.dev,m:airlied@gmail.com,m:simona@ffwll.ch,m:akash.goel@arm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dmitry.osipenko@collabora.com,m:chris.diamand@arm.com,m:dakr@kernel.org,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:aliceryhl@google.com,m:olvaffe@gmail.com,m:kernel@collabora.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,git-scm.com:url,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Action: no action

Hi Boris,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on next-20260305]
[cannot apply to linus/master v7.0-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Boris-Brezillon/drm-gem-Consider-GEM-object-reclaimable-if-shrinking-fails/20260305-215529
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260305124320.156606-6-boris.brezillon%40collabora.com
patch subject: [PATCH v4 5/9] drm/panthor: Part ways with drm_gem_shmem_object
config: arc-randconfig-r132-20260306 (https://download.01.org/0day-ci/archive/20260306/202603061504.eTxNXzrU-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603061504.eTxNXzrU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603061504.eTxNXzrU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/panthor/panthor_gem.c:708:35: sparse: sparse: symbol 'panthor_gem_vm_ops' was not declared. Should it be static?

vim +/panthor_gem_vm_ops +708 drivers/gpu/drm/panthor/panthor_gem.c

   707	
 > 708	const struct vm_operations_struct panthor_gem_vm_ops = {
   709		.fault = panthor_gem_fault,
   710		.open = panthor_gem_vm_open,
   711		.close = drm_gem_vm_close,
   712	};
   713	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
