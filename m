Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1066D7E18
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 15:52:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 095DF10E96E;
	Wed,  5 Apr 2023 13:52:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D280010E966;
 Wed,  5 Apr 2023 13:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680702760; x=1712238760;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ss6KIAVNm+8Vzn22eI3/TKlG5euz1BkWuVgJyekgkTM=;
 b=R9+CI0I0kIIGJ9b0YPLn2CYglIZB/P8nRXgy1R13l5tcYd6qKqth36Al
 P1y642+wQm6wibQGQgaa2hu7S5Dd0scnJ3cR/aPaRiHvn3W4GS3Mjumfa
 Ipt+7AY9TLJfqpAga9pvtp0cqTcg7ryV1mhSSw+gu15tpRIjlb/7tjdxU
 9+YBzpXxAcBzZ2dsL/B34KzRd1WNVP79V+ou96VKIp4ec7C4f46prJP5i
 3V3041Cupf53EymmVpHATClMkBmkfjYyU7I7c+aMleNu1Q2QgwSjgFRog
 PqQe2Lllfaw/blzfsdtLbtKH+AB6Ea9MFrZ30zUxCj91Sl4QQs8jftQ68 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="428740673"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="428740673"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 06:52:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="717049674"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="717049674"
Received: from amadden-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.53.144])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 06:52:37 -0700
Date: Wed, 5 Apr 2023 15:52:09 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
Subject: Re: [PATCH 1/5] drm/i915/ttm: Add I915_BO_PREALLOC
Message-ID: <ZC19CScaY8vqrMbN@ashyti-mobl2.lan>
References: <20230404143100.10452-1-nirmoy.das@intel.com>
 <ZCxO9WeZHvINgMP8@ashyti-mobl2.lan>
 <6131a80c-a23c-ee17-3144-327b66f636bf@linux.intel.com>
 <ZC1hSRRKyU92kQ86@ashyti-mobl2.lan>
 <c8fe6f23-51e4-fb22-6fdb-999bf41f8dec@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8fe6f23-51e4-fb22-6fdb-999bf41f8dec@linux.intel.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Add a mechanism to preserve existing data when creating a TTM
> object with the I915_BO_ALLOC_USER flag. This will be used in the subsequent
> patch where the I915_BO_ALLOC_USER flag will be applied to the framebuffer
> object. For a pre-allocated framebuffer without the I915_BO_PREALLOC flag,
> TTM would clear the content, which is not desirable.

ack!

Andi
