Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A176D61B5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 14:55:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16ED10E2C6;
	Tue,  4 Apr 2023 12:55:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E5610E2C6;
 Tue,  4 Apr 2023 12:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680612915; x=1712148915;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7S1POLC7GrH6QkLNsD9/UK1vehxtk1qZ/GOoRkvdiPY=;
 b=gOdnyXQs1nA2Nd8oH42jR8a1+5rze7PKl1LZxTXiGDz57zleN3rOTYsF
 wphPgRAx58HhMM7269ftGNLnpts3Apm+P7U2CWe3zxFU+sxfUMaM9lprc
 /6bdyda2m9kyWGvW30Ix2qzY6ZAt3HmrP4JkmgJZqiH2COSvXZCfxQ7lI
 v3tznTSZkqyIi+jXn1TCkYn2jMEtWn4C1mHM2xHed/P+4MbSTgSZtPxtT
 oxsc7bHfzbinZcwBTcKTX8AWWp0QiFb5n+blfy58fZ+Ee4N3P9sJjWnB6
 FtZtVwpOI2XBDCCuqbLn+/JepuT1fS9GNGJ3wTihWRaWvKU6bGsvyckPK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="343869485"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; d="scan'208";a="343869485"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 05:55:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="716638241"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; d="scan'208";a="716638241"
Received: from thellstr-mobl.ger.corp.intel.com (HELO [192.168.50.128])
 ([10.249.32.178])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 05:55:11 -0700
Message-ID: <f7b3b70b-c798-b09e-210c-f84eaafd3251@linux.intel.com>
Date: Tue, 4 Apr 2023 14:54:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 08/10] dma-buf/dma-fence: Introduce long-running
 completion fences
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <20230404002211.3611376-9-matthew.brost@intel.com>
 <e5eb5ab0-8e51-389c-34ae-7c6004f4b1ba@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <e5eb5ab0-8e51-389c-34ae-7c6004f4b1ba@amd.com>
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
Cc: robdclark@chromium.org, airlied@linux.ie, lina@asahilina.net,
 boris.brezillon@collabora.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Christian,

On 4/4/23 11:09, Christian König wrote:
> Am 04.04.23 um 02:22 schrieb Matthew Brost:
>> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>
>> For long-running workloads, drivers either need to open-code completion
>> waits, invent their own synchronization primitives or internally use
>> dma-fences that do not obey the cross-driver dma-fence protocol, but
>> without any lockdep annotation all these approaches are error prone.
>>
>> So since for example the drm scheduler uses dma-fences it is 
>> desirable for
>> a driver to be able to use it for throttling and error handling also 
>> with
>> internal dma-fences tha do not obey the cros-driver dma-fence protocol.
>>
>> Introduce long-running completion fences in form of dma-fences, and add
>> lockdep annotation for them. In particular:
>>
>> * Do not allow waiting under any memory management locks.
>> * Do not allow to attach them to a dma-resv object.
>> * Introduce a new interface for adding callbacks making the helper 
>> adding
>>    a callback sign off on that it is aware that the dma-fence may not
>>    complete anytime soon. Typically this will be the scheduler chaining
>>    a new long-running fence on another one.
>
> Well that's pretty much what I tried before: 
> https://lwn.net/Articles/893704/
>
> And the reasons why it was rejected haven't changed.
>
> Regards,
> Christian.
>
Yes, TBH this was mostly to get discussion going how we'd best tackle 
this problem while being able to reuse the scheduler for long-running 
workloads.

I couldn't see any clear decision on your series, though, but one main 
difference I see is that this is intended for driver-internal use only. 
(I'm counting using the drm_scheduler as a helper for driver-private 
use). This is by no means a way to try tackle the indefinite fence problem.

We could ofc invent a completely different data-type that abstracts the 
synchronization the scheduler needs in the long-running case, or each 
driver could hack something up, like sleeping in the prepare_job() or 
run_job() callback for throttling, but those waits should still be 
annotated in one way or annotated one way or another (and probably in a 
similar way across drivers) to make sure we don't do anything bad.

  So any suggestions as to what would be the better solution here would 
be appreciated.

Thanks,

Thomas





