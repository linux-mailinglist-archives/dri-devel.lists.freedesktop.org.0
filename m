Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6C86F688F
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 11:45:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87DE110E417;
	Thu,  4 May 2023 09:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D3D210E417;
 Thu,  4 May 2023 09:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683193522; x=1714729522;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xXxKdtNC5aGnqQZK70eazDiZwZew3BpBgKA0azwk6Ig=;
 b=fXKThyVzgs1agv123vNGJ5hw1cJ0s+8iUTf2tyCAPbZxlOeGX2sME+hP
 kC/R729sSC8akX36PfcpqsWubNj6HKC7Q4oUqH2H6bCG9EILsfR3aWTt2
 y8GBYIEWabRSe1IUI+DmaF+WgrvMccr6KDyYdyeIkiEMHDyEx9YOpammS
 R5RYxgMZlDYKUfe/SnwtoPFJZAIdqex6q36bE3u0oYgyS5hh1CUy7Vo14
 ryo6cD7tXWv28qt2OnMh+TM7axOvUYjopzOnkOHyUs2Py+1nJOUdiFbnU
 RDGfL40BfL2eWtBIXJfIVC2z1Mr5bUPAzc9pICclFIGJ0X0J/D+Adzqrf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="348929913"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="348929913"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 02:45:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="841074862"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="841074862"
Received: from dmitriyp-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.37.93])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 02:45:18 -0700
Date: Thu, 4 May 2023 11:45:15 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 5/5] drm/i915/gt: Make sure that errors
 are propagated through request chains
Message-ID: <ZFN+q9xEyuRFrJp4@ashyti-mobl2.lan>
References: <20230412113308.812468-1-andi.shyti@linux.intel.com>
 <20230412113308.812468-6-andi.shyti@linux.intel.com>
 <ca796c78-67cf-c803-b3bc-7d6eaa542b32@linux.intel.com>
 <5b7f82db-b9dd-e9c9-496c-72995469d699@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b7f82db-b9dd-e9c9-496c-72995469d699@linux.intel.com>
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
Cc: Andi Shyti <andi.shyti@kernel.org>, intel-gfx@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>, stable@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

> Another option - maybe - is this related to revert of fence error
> propagation? If it is and having that would avoid the need for this invasive
> fix, maybe we unrevert 3761baae908a7b5012be08d70fa553cc2eb82305 with edits
> to limit to special contexts? If doable..

I think that is not enough as we want to get anyway to the last
request and fence submitted. Right?

I guess this commit should be reverted anyway.

Andi
