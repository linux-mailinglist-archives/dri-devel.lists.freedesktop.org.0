Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB8298AD32
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 21:45:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8871110E2EF;
	Mon, 30 Sep 2024 19:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZmCZOSFM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E08310E2EF
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 19:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727725527; x=1759261527;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vueBQMQxfjDHR/CKw0nhSiUr+gSHZ72NUnkBl6Rsq5A=;
 b=ZmCZOSFMzqN94cJDyt1c7ZkHRCN3erk2BhvYjIZM/1anhchkSh3lSorh
 xtJbu9C6jcgQcerfpXGYS0/mdkfdjZD3AnZEx4fmFLIAHeXIlTnZRhHL6
 J4z8qlQIqkTzV9eBsCZ09+OVlKr08E48dQGEf4ZBrroaWpVbCs7S59iBC
 xmy+OnMmGxpQ10WF3xa9H3pXbHclfOWRhtd7pBXez0nC1uBmBUEDBtMzu
 YNC4ARP79CqsBk7X4Zln7EvNAp1pvhk6osVyApSWLuLpHQnAGx8x3+HIh
 ofztNeMGjsK3t5VhDbpy6QAL0ozseDU/7SWkRQlDXTRys9C9iJ/fo/uGM Q==;
X-CSE-ConnectionGUID: 9YRyAW4gRkKcgtmmNSQpIg==
X-CSE-MsgGUID: UBrxsE8ITEKg0wEx+SfEgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26961475"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26961475"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:45:26 -0700
X-CSE-ConnectionGUID: tN+IRTmJTxuUqklCIA529g==
X-CSE-MsgGUID: aaj+its3RW2khGxFTuKMTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73367998"
Received: from jpdavis-mobl1.ger.corp.intel.com (HELO [10.246.18.68])
 ([10.246.18.68])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:45:25 -0700
Message-ID: <5c588429-4acb-414b-a6b9-82c26c514a1c@linux.intel.com>
Date: Mon, 30 Sep 2024 21:45:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/29] accel/ivpu: Prevent recovery invocation during
 probe and resume
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, Karol Wachowski <karol.wachowski@intel.com>
References: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
 <20240924081754.209728-21-jacek.lawrynowicz@linux.intel.com>
 <43a19468-8691-8947-e306-40de75cd7e4d@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <43a19468-8691-8947-e306-40de75cd7e4d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/27/2024 11:28 PM, Jeffrey Hugo wrote:
> On 9/24/2024 2:17 AM, Jacek Lawrynowicz wrote:
>> From: Karol Wachowski <karol.wachowski@intel.com>
>>
>> Refactor IPC send and receive functions to allow correct
>> handling of operations that should not trigger a recovery process.
>>
>> Expose ivpu_send_receive_internal(), which is now utilized by the D0i3
>> entry, DCT initialization, and HWS initialization functions.
>> These functions have been modified to return error codes gracefully,
>> rather than initiating recovery.
>>
>> The updated functions are invoked within ivpu_probe() and ivpu_resume(),
>> ensuring that any errors encountered during these stages result in a proper
>> teardown or shutdown sequence. The previous approach of triggering recovery
>> within these functions could lead to a race condition, potentially causing
>> undefined behavior and kernel crashes due to null pointer dereferences.
> 
> Fixing possible kernel panics, sounds like a great idea. Should have a fixes tag through?

OK
