Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E395066574E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 10:22:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1214110E578;
	Wed, 11 Jan 2023 09:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2FE110E53F;
 Wed, 11 Jan 2023 09:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673428933; x=1704964933;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=o+hLWcQJR1WQrpOJPoZRXxofuA4PdxNyWQ4SIXzT9d0=;
 b=LUAoyHeURjVURPZIV7oMfXimQPOdAYR91glTywXBQ9hYmFP4oddO1rsJ
 dBujggJhvv3FkvEPYCbiLcuCEw3zAiY5OII6Cd9+vJcBQ102WxC9k7bmS
 mg3c5LSo4nsDZuoa7Z542dFDu5618F6LkVPd2l2OxTH0PS3b0b99qMDrE
 QBGXO4mQwx2vGgwnYI+uAhIf0ZvX6Dt7/W3QaTlRAY9Q6wZQeH4NFPVgz
 /FRa3J7+zNYpF7OfE7n6sk2iJlz4+zdAt2+sXIjICe6qimmlD9vzBOIwa
 awfr2zGhXR6vfSAjr5pVPNQ/VQGqoeVDCgrlRqcPy9ZpkmiRfOxVR/CSk A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="323434076"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="323434076"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 01:22:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="607290392"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="607290392"
Received: from dhuchimu-mobl3.amr.corp.intel.com (HELO [10.212.68.70])
 ([10.212.68.70])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 01:22:11 -0800
Message-ID: <46fb54f5-de8f-eec5-216a-b53a483ebcd2@linux.intel.com>
Date: Wed, 11 Jan 2023 09:22:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4] drm/i915: Do not cover all future platforms in TLB
 invalidation
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20230110113533.744436-1-tvrtko.ursulin@linux.intel.com>
 <Y72NTgJ1rgpT2TIA@mdroper-desk1.amr.corp.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <Y72NTgJ1rgpT2TIA@mdroper-desk1.amr.corp.intel.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Intel-gfx@lists.freedesktop.org,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/01/2023 16:07, Matt Roper wrote:
> On Tue, Jan 10, 2023 at 11:35:33AM +0000, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Revert to the original explicit approach and document the reasoning
>> behind it.
>>
>> v2:
>>   * DG2 needs to be covered too. (Matt)
>>
>> v3:
>>   * Full version check for Gen12 to avoid catching all future platforms.
>>     (Matt)
>>
>> v4:
>>   * Be totally explicit on the Gen12 branch. (Andrzej)
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com> # v1
>> Reviewed-by: Matt Roper <matthew.d.roper@intel.com> # v3
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> 
> for v4 as well.

Thanks, pushed!

So next I have that patch which moves the register/bits selection logic 
to engine init time. I will send it out rebased but do not intend to 
merge before the tlb invalidation selftest can land upstream.

Regards,

Tvrtko
