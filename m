Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IH3JNIRknWlgPQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:42:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 265F4183E62
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3DD10E503;
	Tue, 24 Feb 2026 08:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bTLmWGuF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44CC210E503
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 08:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771922560; x=1803458560;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NDxi//Dba1wbPUsIKoTjHMV/rNScnA7634AbsOEXxHg=;
 b=bTLmWGuFsJWdjAaunP0z+gMQNtXx6AZQ2KH/cfb+8X2FQEvu9iIqFK5i
 mt5KutF/GshqGA1IswyQ6oalZVox+abARM0sa+Y3dCGdIx4SMJJvbLVFm
 cjdMZ7f8tXS5BxlaELA5vEO44/a0DjwZof3ML5EPT62TMlShX+GmiPLti
 jSBktxpOgYaNk4HfuloEdsYcGZ+r3ylHAdhjltjHgNrLGNCT5S3emWZWz
 i9u6RlY5lmWrrBRjk381cijIOYEwVoff5JmpPuLxTc0id1ivfxOjTOlHl
 S0l/KgJbZqA3aDRgaNZMP20ca18e7HQw5rpoHML0OqpVv5EJQLrPQEuKz Q==;
X-CSE-ConnectionGUID: ulvgf7HTQYm/UY4/zxBsKw==
X-CSE-MsgGUID: ejV6w0ilRlmncnlsT1tR0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83642188"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="83642188"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:42:40 -0800
X-CSE-ConnectionGUID: Ih7jRUjiRqeS0ekoFBczOw==
X-CSE-MsgGUID: rAxfmtZlS9uByqyoIN3Itg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="243832914"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
 by fmviesa001.fm.intel.com with ESMTP; 24 Feb 2026 00:42:36 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vuo02-000000001hQ-30Zg;
 Tue, 24 Feb 2026 08:42:34 +0000
Date: Tue, 24 Feb 2026 16:42:19 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 tj@kernel.org, christian.koenig@amd.com,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, cgroups@vger.kernel.org,
 Dave Chinner <david@fromorbit.com>,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: Re: [PATCH 08/16] ttm: add a memcg accounting flag to the
 alloc/populate APIs
Message-ID: <202602241625.E8sX98Qb-lkp@intel.com>
References: <20260224020854.791201-9-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224020854.791201-9-airlied@gmail.com>
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:tj@kernel.org,m:christian.koenig@amd.com,m:hannes@cmpxchg.org,m:mhocko@kernel.org,m:roman.gushchin@linux.dev,m:shakeel.butt@linux.dev,m:muchun.song@linux.dev,m:oe-kbuild-all@lists.linux.dev,m:cgroups@vger.kernel.org,m:david@fromorbit.com,m:longman@redhat.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org,kernel.org,amd.com,cmpxchg.org,linux.dev];
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
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email,01.org:url,gitlab.freedesktop.org:url,git-scm.com:url]
X-Rspamd-Queue-Id: 265F4183E62
X-Rspamd-Action: no action

Hi Dave,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v7.0-rc1 next-20260223]
[cannot apply to akpm-mm/mm-everything drm-xe/drm-xe-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Airlie/drm-ttm-use-gpu-mm-stats-to-track-gpu-memory-allocations-v4/20260224-112019
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260224020854.791201-9-airlied%40gmail.com
patch subject: [PATCH 08/16] ttm: add a memcg accounting flag to the alloc/populate APIs
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20260224/202602241625.E8sX98Qb-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260224/202602241625.E8sX98Qb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602241625.E8sX98Qb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/ttm/ttm_bo.c:1264 function parameter 'memcg_account' not described in 'ttm_bo_populate'
>> Warning: drivers/gpu/drm/ttm/ttm_bo.c:1264 function parameter 'memcg_account' not described in 'ttm_bo_populate'
--
>> Warning: drivers/gpu/drm/ttm/ttm_pool.c:867 function parameter 'memcg_account' not described in 'ttm_pool_alloc'
>> Warning: drivers/gpu/drm/ttm/ttm_pool.c:867 function parameter 'memcg_account' not described in 'ttm_pool_alloc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
