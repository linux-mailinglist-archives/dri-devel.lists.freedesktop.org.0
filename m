Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F7C6D7A63
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 12:53:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F8D10E8D2;
	Wed,  5 Apr 2023 10:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBB810E8D9;
 Wed,  5 Apr 2023 10:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680691977; x=1712227977;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TcLBivQ+NNv25sjuT7Hma0Pn33Bhr5vnXXpMlqlhF1E=;
 b=AUHPKzZitM/j6YtLTKxzXAZ8LevHCFehAdGtZwBmy9jRI7cd9JFXL/9c
 Uyfr1bxKMuXRayFF/LoxZaQnLV86XNtiooRWiQrrXzjHgLAHjKarqxnHk
 gvdvpCZuTi2ti0/GCEUPFQpbghhx4r/toqJDogkhbfwvupS+881FtHL3O
 60tMBfatrJQDXytj5xbo2e0wwcAnkCcUjbIK72RI0eOof3TLB8dpvLqNm
 Slet61GjuzW3wSCv5So5WKgqUcvj4JXrX/8+UIq9LXwSKS8uIVnp9hoky
 UqCPJ82uLd0e52RgZJHwvJi4Wjg5XN1L450ZSU3Lq47ofpjM82aREIOIz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="339914387"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="339914387"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 03:52:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="755974267"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="755974267"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.41.195])
 ([10.252.41.195])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 03:52:55 -0700
Message-ID: <6131a80c-a23c-ee17-3144-327b66f636bf@linux.intel.com>
Date: Wed, 5 Apr 2023 12:52:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/5] drm/i915/ttm: Add I915_BO_PREALLOC
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20230404143100.10452-1-nirmoy.das@intel.com>
 <ZCxO9WeZHvINgMP8@ashyti-mobl2.lan>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <ZCxO9WeZHvINgMP8@ashyti-mobl2.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/4/2023 6:23 PM, Andi Shyti wrote:
> Hi Nirmoy,
>
> On Tue, Apr 04, 2023 at 04:30:56PM +0200, Nirmoy Das wrote:
>> Add a mechanism to keep existing data when creating
>> a ttm object with I915_BO_ALLOC_USER flag.
> why do we need this mechanism? What was the logic behind? These
> are all questions people might have when checking this commit.
> Please be a bit more explicative.


Agree, the commit message is bit short. I will add more content in next 
revision.

>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Cc: Imre Deak <imre.deak@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>


Thanks,

Nirmoy

>
> Thanks,
> Andi
