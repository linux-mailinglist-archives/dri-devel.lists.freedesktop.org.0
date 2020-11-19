Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EF12B940B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 15:02:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1BDC6E527;
	Thu, 19 Nov 2020 14:02:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FDFD6E527
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 14:02:24 +0000 (UTC)
IronPort-SDR: SrnTrGbt1gGXR5xy121JKY0V+oQIsiY6FX3iRzneTDbbhn5F2Euzj6sI1lQiGUK8LedEEQ6/tr
 Y8kL3tpHyTFg==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="256000111"
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; d="scan'208";a="256000111"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2020 06:02:06 -0800
IronPort-SDR: gTcCNbt3OeOF/ouh7YLo8YmMJxeODvD/y5eR0dYU3T+vy4wHF/1XFG4wwTF2IXN3cU5bY+npQr
 2DjdgbxtPXmw==
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; d="scan'208";a="534787734"
Received: from staskuzm-mobl1.ger.corp.intel.com (HELO [10.249.92.37])
 ([10.249.92.37])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2020 06:02:04 -0800
Subject: Re: [PATCH] intel: Do not assert on unknown chips in
 drm_intel_decode_context_alloc
To: Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org
References: <20201118163601.958254-1-tvrtko.ursulin@linux.intel.com>
 <160571907017.19853.2138891452982731448@build.alporthouse.com>
 <b8438d8f-bc6b-921d-adb2-cd6e25d70bdb@linux.intel.com>
 <160579393163.30679.15261134775534336025@build.alporthouse.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <baa196c2-ee8f-ca18-4f91-3b50bc1356b7@linux.intel.com>
Date: Thu, 19 Nov 2020 13:58:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <160579393163.30679.15261134775534336025@build.alporthouse.com>
Content-Language: en-US
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 19/11/2020 13:52, Chris Wilson wrote:
> Quoting Tvrtko Ursulin (2020-11-19 13:42:07)
>>
>> On 18/11/2020 17:04, Chris Wilson wrote:
>>> Quoting Tvrtko Ursulin (2020-11-18 16:36:01)
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>
>>>> There is this long standing nit of igt/tools/intel_error_decode asserting
>>>> when you feed it an error state from a GPU the local libdrm does not know
>>>> of.
>>>>
>>>> To fix this I need a tweak in drm_intel_decode_context_alloc to make it
>>>> not assert but just return NULL (which seems an already possible return
>>>> value).
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>
>>> Good riddance,
>>> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
>>
>> Thanks, now how can push to drm and is there some testing to be
>> triggered before, or after?
> 
> cd intel; for i in tests/gen*.sh; do $i; done
> 
> But clearly I haven't built libdrm since automake was dropped.

Thanks, all good:

$ for t in ../../intel/tests/gen*.sh; do bash -x $t; done
++ echo ../../intel/tests/gen4-3d.batch.sh
++ sed 's|\.sh$||'
+ TEST_FILENAME=../../intel/tests/gen4-3d.batch
+ ./test_decode ../../intel/tests/gen4-3d.batch
+ ret=0
+ test 0 = 1
+ exit 0
++ echo ../../intel/tests/gen5-3d.batch.sh
++ sed 's|\.sh$||'
+ TEST_FILENAME=../../intel/tests/gen5-3d.batch
+ ./test_decode ../../intel/tests/gen5-3d.batch
+ ret=0
+ test 0 = 1
+ exit 0
++ echo ../../intel/tests/gen6-3d.batch.sh
++ sed 's|\.sh$||'
+ TEST_FILENAME=../../intel/tests/gen6-3d.batch
+ ./test_decode ../../intel/tests/gen6-3d.batch
+ ret=0
+ test 0 = 1
+ exit 0
++ echo ../../intel/tests/gen7-2d-copy.batch.sh
++ sed 's|\.sh$||'
+ TEST_FILENAME=../../intel/tests/gen7-2d-copy.batch
+ ./test_decode ../../intel/tests/gen7-2d-copy.batch
+ ret=0
+ test 0 = 1
+ exit 0
++ echo ../../intel/tests/gen7-3d.batch.sh
++ sed 's|\.sh$||'
+ TEST_FILENAME=../../intel/tests/gen7-3d.batch
+ ./test_decode ../../intel/tests/gen7-3d.batch
+ ret=0
+ test 0 = 1
+ exit 0

Regards,

Tvrtko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
