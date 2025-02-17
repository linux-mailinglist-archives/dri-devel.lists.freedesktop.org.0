Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A083DA3877E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 16:26:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646E710E234;
	Mon, 17 Feb 2025 15:26:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eAGJADXg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A9F10E170
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 15:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739806014; x=1771342014;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=U3kgxBYNjVrWCOlsKZlJ59JSIsE/znZ9PBJxSbBIKOo=;
 b=eAGJADXgOormqkFWXOUrEy8kfjHt+0pqrEscnvVHBZkgzpzIZKoKXkc/
 nj0i52Xauen9AVmWyX2x2CyO3qHO7YmrP+TWEOZMY/LDhapt9s+9afpVu
 Oqmo/KXYzWa1UuPkNUrIx944OIV1tXIfnmx6/JcuiQLhMnWwJpLqPwfDw
 VWQXSAAn8W5v9rYAnzbW98ukCqX2xum8EKgrT2TBZ2Dm5EEQYx8l6Ysg7
 Psbizc0eUGHerrFwBL8sxYxaHhwLVFGWpuTlDN+rQXhev7AZOJDeZVRCi
 +nFqnpYYGBJ27tah0MV/JQ39BKHr6qouFs33qHoq2Cz8JaJOB/ma5d+Si g==;
X-CSE-ConnectionGUID: RYjExxqUT4uqMfmyGwOPPQ==
X-CSE-MsgGUID: CfhBvHmeSNCBEruWBFWvDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44250320"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="44250320"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 07:26:53 -0800
X-CSE-ConnectionGUID: ZVpycXFuTSS+q8IzAdUagg==
X-CSE-MsgGUID: SjI8G6yhR/ikupiEBxHlnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="114080559"
Received: from anishsin-mobl1.ger.corp.intel.com (HELO [10.245.114.74])
 ([10.245.114.74])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 07:26:52 -0800
Message-ID: <f97d2306-d03b-47f6-836c-c9057e526490@linux.intel.com>
Date: Mon, 17 Feb 2025 16:26:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] accel/ivpu: Add missing locks around mmu queues
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, maciej.falkowski@linux.intel.com,
 Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
References: <20250204084622.2422544-1-jacek.lawrynowicz@linux.intel.com>
 <20250204084622.2422544-2-jacek.lawrynowicz@linux.intel.com>
 <8b7ef8c3-788e-bf2a-c393-a627397f6e3f@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <8b7ef8c3-788e-bf2a-c393-a627397f6e3f@quicinc.com>
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

Hi,

On 2/14/2025 5:41 PM, Jeffrey Hugo wrote:
> On 2/4/2025 1:46 AM, Jacek Lawrynowicz wrote:
>> From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
>>
>> Multiple threads were accessing mmu cmd queue simultaneously
>> causing sporadic failures in ivpu_mmu_cmdq_sync() function.
>> Protect critical code with mmu mutex.
> 
> Describe a scenario in which this can occur? The two functions this patch modify cannot run concurrently from what I can tell.

Functions from this diff are called in bottom IRQ handler when memory faults are detected.
The CMDQ is also accessed from IOCTLs when mapping/unmapping buffers in NPU MMU (ivpu_mmu_invalidate_tlb()).

Jacek
