Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3719969A91D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 11:33:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 765D810EF51;
	Fri, 17 Feb 2023 10:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04D610EF52;
 Fri, 17 Feb 2023 10:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676630016; x=1708166016;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Ngp/R/xo4RrSqAQSsUw9XesJnozJaQOqjD3HrKvwvyc=;
 b=SHKrhs+x9huggUMLJDSIRAvYja/ckDRKPemZmgV1j8s/2r/sjANG1gQg
 hx5R7VosGD6oRfE5iKIlrBkGpvhYSQYplPuNC9qtYy3eAqK8U6VFTw25B
 rsyKXCtQDLW2cFIpHxX7qBkv2336g2KLsri2fvqA4Dg9g3ES9+8WbPaNZ
 I8dGzUOmpjtWZ5NQgpZCiUbQHJv6HGECyiRIDXyyiOeon4ud0RYourXuz
 uvY49xRXfbU/8fioiWWXARpJy7+1xqpRHAZamJqWsYlzpVLRe/u9ugjFx
 V+4v38Hh/KMno+7Zkm87PcQcCX9CebF8elDvJtPKsndo7+EkufiVKmZG6 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="396633928"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="396633928"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 02:33:36 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="794366649"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="794366649"
Received: from scurtin-mobl.ger.corp.intel.com (HELO [10.213.210.155])
 ([10.213.210.155])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 02:33:34 -0800
Message-ID: <baf3d615-c764-6e9b-a910-70b3f0fdcabc@linux.intel.com>
Date: Fri, 17 Feb 2023 10:33:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5] drm/i915: Consolidate TLB invalidation flow
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20230216092123.159085-1-tvrtko.ursulin@linux.intel.com>
 <Y+5OpUckkJlqaRjh@mdroper-desk1.amr.corp.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <Y+5OpUckkJlqaRjh@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Intel-gfx@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 16/02/2023 15:41, Matt Roper wrote:
> On Thu, Feb 16, 2023 at 09:21:23AM +0000, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> As the logic for selecting the register and corresponsing values grew, the
>> code become a bit unsightly. Consolidate by storing the required values at
>> engine init time in the engine itself, and by doing so minimise the amount
>> of invariant platform and engine checks during each and every TLB
>> invalidation.
>>
>> v2:
>>   * Fail engine probe if TLB invlidations registers are unknown.
>>
>> v3:
>>   * Rebase.
>>
>> v4:
>>   * Fix handling of GEN8_M2TCR. (Andrzej)
>>
>> v5:
>>   * Tidy checkpatch warnings.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com> # v1
>> Reviewed-by: Matt Roper <matthew.d.roper@intel.com> # v3
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> 
> for this version as well.

Thanks Matt, pushed.

Regards,

Tvrtko
