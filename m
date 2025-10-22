Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F97CBFB7DC
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 12:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE6B710E743;
	Wed, 22 Oct 2025 10:58:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dRgScpES";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB34210E743
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 10:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761130680; x=1792666680;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pXo8HuRn7Fn1l0CR1wRonLuaFRpKfPDZdersXTmqzcI=;
 b=dRgScpES86FsEUJ1ZnXv273UMdekvXTFEJIebsiqcZeSSnt5DrTa747H
 78sJ/JvS9O6qxoIUKibyxXu+/kaTB09O5IkxQtVtMCCS4qJZjBRPGCcoU
 rXuj39SYEMbHTAGvdwguT2zW+g+xEe0NsMuQw2t6t94CkyRN3wa0KoMzv
 BEtwjafgB9qbF8SA8+fJC82Ve2ZahofLqTVranTauMrOEF2GsN45qnHt3
 NaWXja80428zJtVF1Bjom2ZQwIcreQKCMxy6ORuiB/X0N1m4O/UMgCypt
 hDnShyKyAPeCY0Y4MvRohshS7LysaUMyl5mnaYrqXp/wo1nk/mGlKSqjV g==;
X-CSE-ConnectionGUID: 2Gvxr6zxQYugh/WEHj3Zow==
X-CSE-MsgGUID: aO3pZY7kSnuanInKnqYwng==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73564526"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="73564526"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 03:57:59 -0700
X-CSE-ConnectionGUID: SBIHZ0y/RS2Csxs9CQ2LDw==
X-CSE-MsgGUID: wiqWU2arQuqwP6fWZ1fzow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="187882118"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.246.17.115])
 ([10.246.17.115])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 03:57:58 -0700
Message-ID: <59d15b3e-199f-4657-b7bf-ed456a60343f@linux.intel.com>
Date: Wed, 22 Oct 2025 12:57:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Remove VPU_CPU_NOC_* register access from
 NPU6 onward
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, karol.wachowski@linux.intel.com, lizhi.hou@amd.com
References: <20251021142005.2216776-1-maciej.falkowski@linux.intel.com>
 <bf77d882-7ab4-4271-a47b-ec0b86d19f91@oss.qualcomm.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <bf77d882-7ab4-4271-a47b-ec0b86d19f91@oss.qualcomm.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/21/2025 4:55 PM, Jeff Hugo wrote:

> On 10/21/2025 8:20 AM, Maciej Falkowski wrote:
>> From: Karol Wachowski <karol.wachowski@linux.intel.com>
>>
>> Quiescing TOP_MMIO in SOC_CPU_NOC as part of boot procedure is no longer
>> needed starting from 60XX. Remove soc_cpu_drive() call from NPU6 onward.
>>
>> The VPU_CPU_NOC_QREQN, VPU_CPU_NOC_QACCEPTN, and VPU_CPU_NOC_QDENY
>> registers are deprecated and non-functional on 60XX. They will be
>> removed in future generations.
>>
>> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
>> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>
> Should you just squash this into "[PATCH] accel/ivpu: Add support for 
> Nova Lake's NPU"? Feels a bit odd to introduce an issue in that patch, 
> and then immediately fix it.
It wasn't exactly introducing an issue but sure squashing the two 
commits into one will simplify things.

Thanks,
Maciej

>
> -Jeff
