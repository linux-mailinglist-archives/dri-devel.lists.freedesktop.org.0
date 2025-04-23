Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F382A98098
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 09:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D205789FA7;
	Wed, 23 Apr 2025 07:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QwJejhiA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240A789FA7
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 07:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745393036; x=1776929036;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kcZOH5fmCZ8eik6qhiDHkyfMjvEVRWuvFnzx9WaCgFk=;
 b=QwJejhiA/MNfJFTllTAcy/uJRIxfegYm37xFXY3oBhB0lD4esw6bMc7V
 PiaQtnZ62HoHQT5DPyggdZYaPQZYSAS57e1qHS11OzG+tUMvD0LwGi4kf
 AFBBieTF/A4MtrGfCB/jeWY7N+MsVNZRyL7Bxk+XfHPix85Jrm1AViq4t
 3lzqL/ZkqenWegXno3w6RWH5E2bvYYRQ5nAZSVsHC6zJLeCcobxlCkxrY
 uVEBhYKrIjvyeF9XS1g3X45Aa9hee+NJxiKxFGu45BKA2Vg40THpGsMjU
 G+F07bBlJ5w6lOPRbAQbmQnlD/ot1x6EiwRSHBHCdNBj8o6f40760tnll A==;
X-CSE-ConnectionGUID: f7fkCLDBQEuwyozLVWzjHg==
X-CSE-MsgGUID: vAXoBVepR7CZ1ckfCYjviA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="47100692"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="47100692"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 00:23:56 -0700
X-CSE-ConnectionGUID: QVCUY94ZQSSFblr4zdVRCA==
X-CSE-MsgGUID: X6eQ4EcLSKWXn0qXRIGr+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="132776538"
Received: from pwilma-mobl1.ger.corp.intel.com (HELO [10.245.252.249])
 ([10.245.252.249])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 00:23:54 -0700
Message-ID: <edbd4421-e3b4-47a9-834e-200faf6fbda9@linux.intel.com>
Date: Wed, 23 Apr 2025 09:23:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Implement heartbeat-based TDR mechanism
To: Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, lizhi.hou@amd.com,
 Karol Wachowski <karol.wachowski@intel.com>
References: <20250416102555.384526-1-maciej.falkowski@linux.intel.com>
 <c6b4aaad-aa5f-4f46-948f-de150dfc60fe@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <c6b4aaad-aa5f-4f46-948f-de150dfc60fe@quicinc.com>
Content-Type: text/plain; charset=UTF-8
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

Hi,

On 4/18/2025 5:27 PM, Jeffrey Hugo wrote:
> On 4/16/2025 4:25 AM, Maciej Falkowski wrote:
>> From: Karol Wachowski <karol.wachowski@intel.com>
>>
>> Introduce a heartbeat-based Timeout Detection and Recovery (TDR) mechanism.
>> The enhancement aims to improve the reliability of device hang detection by
>> monitoring heartbeat updates.
>>
>> Each progressing inference will update heartbeat counter allowing driver to
>> monitor its progression. Limit maximum number of reschedules when heartbeat
>> indicates progression to 30.
> 
> Code looks good.  However, why 30?  This would artificially limit how long a job could run, no?

Yes, we still need a time based limit. There may be workloads that are stuck in infinite loop for example.
With this patch the max time the job can run is extended from 2 to 60 seconds.
We are not aware of any workloads that exceed this timeout at the moment.

Regards,
Jacek
