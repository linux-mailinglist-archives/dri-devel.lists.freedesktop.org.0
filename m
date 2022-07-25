Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A46E857FEA4
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 13:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A8D9BA97;
	Mon, 25 Jul 2022 11:52:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 076BC9BA97;
 Mon, 25 Jul 2022 11:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658749936; x=1690285936;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9NgeSRHF7by1oNE5632wo1Q7W5x4CF7TrNAUuXj/zbg=;
 b=lAQ7v+B49eyqobgCG/xFv8wSEiHc1dLiSjernJ3ab+H6VGa+ZcKDRLta
 iparNRG/y7b0OZorOvbJE9VQ38eFvs+zduyaxojr9Cy/g8kJwfTVGeSMK
 y/f9I01V9WPe1Ze6KDWZb+vqqepMzopUJu1i2O9J13kPcq1lESNQu7kT+
 TJcSBHNcbIvCG+P96B5dcP6bWRr3PvaWdue1h8HcxFEfJI3r04rIDJ80h
 jVGf8Dp+MAU5+RJru/PkG1sZJrMACr9wr5vTu146QlgLOtNDmwoU2yA/h
 ok53qfgFEwu0gTcU4grHUaKbgE3T335NHMHk3ULAyjtvc4D+QUBzdsIdg w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10418"; a="288864513"
X-IronPort-AV: E=Sophos;i="5.93,192,1654585200"; d="scan'208";a="288864513"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 04:52:09 -0700
X-IronPort-AV: E=Sophos;i="5.93,192,1654585200"; d="scan'208";a="632330980"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.13.24])
 ([10.213.13.24])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 04:52:02 -0700
Message-ID: <abc353e1-f9f1-2cdf-4752-06f3aa4046c9@intel.com>
Date: Mon, 25 Jul 2022 13:51:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [Intel-gfx] [PATCH v5 3/7] drm/i915: Check for integer truncation
 on scatterlist creation
Content-Language: en-US
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20220725092528.1281487-1-gwan-gyeong.mun@intel.com>
 <20220725092528.1281487-4-gwan-gyeong.mun@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220725092528.1281487-4-gwan-gyeong.mun@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com, jani.nikula@intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk, airlied@linux.ie,
 matthew.auld@intel.com, mchehab@kernel.org, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25.07.2022 11:25, Gwan-gyeong Mun wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> There is an impedance mismatch between the scatterlist API using unsigned
> int and our memory/page accounting in unsigned long. That is we may try
> to create a scatterlist for a large object that overflows returning a
> small table into which we try to fit very many pages. As the object size
> is under control of userspace, we have to be prudent and catch the
> conversion errors.
> 
> To catch the implicit truncation as we switch from unsigned long into the
> scatterlist's unsigned int, we use overflows_type check and report
> E2BIG prior to the operation. This is already used in our create ioctls to
> indicate if the uABI request is simply too large for the backing store.
> Failing that type check, we have a second check at sg_alloc_table time
> to make sure the values we are passing into the scatterlist API are not
> truncated.
> 
> It uses pgoff_t for locals that are dealing with page indices, in this
> case, the page count is the limit of the page index.
> And it uses safe_conversion() macro which performs a type conversion (cast)
> of an integer value into a new variable, checking that the destination is
> large enough to hold the source value.
> 
> v2: Move added i915_utils's macro into drm_util header (Jani N)
> v5: Fix macros to be enclosed in parentheses for complex values
>      Fix too long line warning
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Brian Welty <brian.welty@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
