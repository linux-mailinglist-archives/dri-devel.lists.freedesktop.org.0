Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8CB8C856B
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 13:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B212210E222;
	Fri, 17 May 2024 11:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BSF/+khP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E8510EE76
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 11:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715944631; x=1747480631;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hS7NlRBQ1HpfMGaEyWXHDF++JFNfFPErwh+V/Grho4s=;
 b=BSF/+khPB2zrfC52hL7T9HeqtWWyVZaDSRttQiUole0fJxB+LjLwl4Nw
 eSioeyPh5i+L7Cc9yjkCxmCa+nY9Iwa4s1K3bnQ5y4TCTWxc8Kx+gUT4Y
 9Lf6wYoynpPKEupqD8nAlwipvuBQu0hLTP2ImktAKQPO3CIUeXktJrENx
 DmNarftjiW0Hj7K3XrULuVvaSknUX7qmtif2ebKOTe1+zVE57f0Y1doIR
 8tZwzQkInM/eCn9L9VPIEOQ3YlNLU9YiY6ypiY296GvqCNH3Nh6g7f0qc
 StmfgVO20R9VYA2KrTpuATD+9tipbFVk04sSdACrMift+CJxYjT7zYZCJ Q==;
X-CSE-ConnectionGUID: uuj647FFQgSYafxEyVKBDg==
X-CSE-MsgGUID: 8SDqIChIQK+c3jXLQqi5xQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12328647"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="12328647"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 04:17:11 -0700
X-CSE-ConnectionGUID: 7zLzKfrVR8G52ZH/Yzd2EA==
X-CSE-MsgGUID: ubpXkSihRJqqGMwOg8i5dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="36500770"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO [10.245.244.100])
 ([10.245.244.100])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 04:17:10 -0700
Message-ID: <9dcd1af7-3716-450c-adae-ae1d04d6df79@intel.com>
Date: Fri, 17 May 2024 12:17:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/buddy: stop using PAGE_SIZE
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
References: <20240229105112.250077-3-matthew.auld@intel.com>
 <06841e76-0a6d-4cbb-a903-1f2e5dfbaf46@app.fastmail.com>
 <CAPM=9tyNrCsT27bvAVUcee-UME7568hZvU18m0k3OSopzUGaCA@mail.gmail.com>
 <3ef0fe56-f488-452a-9d35-dc081bf59816@intel.com>
 <2a6ea297-167f-4b0c-8aba-a4c1430f0e92@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <2a6ea297-167f-4b0c-8aba-a4c1430f0e92@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/05/2024 12:00, Christian König wrote:
> Am 17.05.24 um 10:53 schrieb Matthew Auld:
>> On 17/05/2024 02:11, Dave Airlie wrote:
>>> On Thu, 29 Feb 2024 at 23:48, Arnd Bergmann <arnd@arndb.de> wrote:
>>>>
>>>> On Thu, Feb 29, 2024, at 11:51, Matthew Auld wrote:
>>>>> The drm_buddy minimum page-size requirements should be distinct 
>>>>> from the
>>>>> CPU PAGE_SIZE. Only restriction is that the minimum page-size is at
>>>>> least 4K.
>>>>>
>>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>>> Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>> Cc: Arnd Bergmann <arnd@arndb.de>
>>>>
>>>> Acked-by: Arnd Bergmann <arnd@arndb.de>
>>>
>>> Has this landed anywhere yet?
>>
>> Looks like it fell through the cracks. I think it still applies, so 
>> just needs someone with commit rights to push it.
> 
> Pushed to drm-misc-fixes.

Thanks.

> 
> Regards,
> Christian.
> 
>>
>>>
>>> I'm been testing 6.9 on 64K pages and the buddy tests are exploding so
>>> I wanted to pull this in.
>>>
>>> Dave.
> 
