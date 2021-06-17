Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA6E3AAF93
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 11:20:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D1C86E8CE;
	Thu, 17 Jun 2021 09:20:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5DD6E8CE
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 09:20:20 +0000 (UTC)
IronPort-SDR: E7CaFqB/PTJ1Qo3bs4ovPztNQU09pI5twizWYxI90ljBLD4VkFfq1p+QyQali90cfWJ+aiaV8y
 uzEINQo0OieA==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="291967225"
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; d="scan'208";a="291967225"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2021 02:20:19 -0700
IronPort-SDR: uYNUCwTDHEapetovfPYtlMvy6NdZvl+It+wgsKnZQw1Ij+W6RUUYahom0LZ5yMkFiOYmuguo4X
 Rp8bHA7o55Tw==
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; d="scan'208";a="621991727"
Received: from bmoran1x-mobl3.ger.corp.intel.com (HELO [10.213.219.91])
 ([10.213.219.91])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2021 02:20:17 -0700
Subject: Re: [PATCH] intel: Do not assert on unknown chips in
 drm_intel_decode_context_alloc
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org
References: <20201118163601.958254-1-tvrtko.ursulin@linux.intel.com>
 <160571907017.19853.2138891452982731448@build.alporthouse.com>
 <b8438d8f-bc6b-921d-adb2-cd6e25d70bdb@linux.intel.com>
 <160579393163.30679.15261134775534336025@build.alporthouse.com>
 <baa196c2-ee8f-ca18-4f91-3b50bc1356b7@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <5047dfbb-6097-3af7-b5ac-7103085daae0@linux.intel.com>
Date: Thu, 17 Jun 2021 10:20:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <baa196c2-ee8f-ca18-4f91-3b50bc1356b7@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Engestrom <eric@engestrom.ch>, "Kempczynski,
 Zbigniew" <zbigniew.kempczynski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


+ a bunch of recent committers to libdrm

Guys, anyone okay to push this patch? I can resend if required.

Regards,

Tvrtko

On 19/11/2020 13:58, Tvrtko Ursulin wrote:
> 
> On 19/11/2020 13:52, Chris Wilson wrote:
>> Quoting Tvrtko Ursulin (2020-11-19 13:42:07)
>>>
>>> On 18/11/2020 17:04, Chris Wilson wrote:
>>>> Quoting Tvrtko Ursulin (2020-11-18 16:36:01)
>>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>
>>>>> There is this long standing nit of igt/tools/intel_error_decode 
>>>>> asserting
>>>>> when you feed it an error state from a GPU the local libdrm does 
>>>>> not know
>>>>> of.
>>>>>
>>>>> To fix this I need a tweak in drm_intel_decode_context_alloc to 
>>>>> make it
>>>>> not assert but just return NULL (which seems an already possible 
>>>>> return
>>>>> value).
>>>>>
>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>
>>>> Good riddance,
>>>> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
>>>
>>> Thanks, now how can push to drm and is there some testing to be
>>> triggered before, or after?
>>
>> cd intel; for i in tests/gen*.sh; do $i; done
>>
>> But clearly I haven't built libdrm since automake was dropped.
> 
> Thanks, all good:
> 
> $ for t in ../../intel/tests/gen*.sh; do bash -x $t; done
> ++ echo ../../intel/tests/gen4-3d.batch.sh
> ++ sed 's|\.sh$||'
> + TEST_FILENAME=../../intel/tests/gen4-3d.batch
> + ./test_decode ../../intel/tests/gen4-3d.batch
> + ret=0
> + test 0 = 1
> + exit 0
> ++ echo ../../intel/tests/gen5-3d.batch.sh
> ++ sed 's|\.sh$||'
> + TEST_FILENAME=../../intel/tests/gen5-3d.batch
> + ./test_decode ../../intel/tests/gen5-3d.batch
> + ret=0
> + test 0 = 1
> + exit 0
> ++ echo ../../intel/tests/gen6-3d.batch.sh
> ++ sed 's|\.sh$||'
> + TEST_FILENAME=../../intel/tests/gen6-3d.batch
> + ./test_decode ../../intel/tests/gen6-3d.batch
> + ret=0
> + test 0 = 1
> + exit 0
> ++ echo ../../intel/tests/gen7-2d-copy.batch.sh
> ++ sed 's|\.sh$||'
> + TEST_FILENAME=../../intel/tests/gen7-2d-copy.batch
> + ./test_decode ../../intel/tests/gen7-2d-copy.batch
> + ret=0
> + test 0 = 1
> + exit 0
> ++ echo ../../intel/tests/gen7-3d.batch.sh
> ++ sed 's|\.sh$||'
> + TEST_FILENAME=../../intel/tests/gen7-3d.batch
> + ./test_decode ../../intel/tests/gen7-3d.batch
> + ret=0
> + test 0 = 1
> + exit 0
> 
> Regards,
> 
> Tvrtko
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
