Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA61BDCABD
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 08:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F2BB10E31A;
	Wed, 15 Oct 2025 06:17:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jFLFCfzR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DC010E299
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 06:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760509051; x=1792045051;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gg1TFXKgk0qXnlOANTmXTov5r0gU836bdDnGOK10zaw=;
 b=jFLFCfzRzyAoIcMlGMLsL/c8F0FhX+3f7mSgnc9qdPx4l/SNQ09+dFv5
 NwC6uRPXIMd60Ic9HvxHhxip2OSzUhARKJUS4hjfgmRYZXdIrB38u2z+G
 btow505rtTYTkuo9348qrMyl9B6taV5lWKtkLo6gPRFA4g86GfyT2/w6g
 dOVSrT4Q0vhU8td6bsUoeB4KkmF4uNt8Xoycc/2JsuLGbhCFkfCtFE4rW
 EQD2YCshORyKg/Cf2qHRcZgRaVPKN36ZWG0tDs0eIRtcwooFyHaT9PRch
 XmuBXNm6OkYnuk9ElSNOE2JX8+67R8ONNygdFkVOTYxk0kKIxaOmMtCHE A==;
X-CSE-ConnectionGUID: I+OvwChpSbW4e1a/eEPGAA==
X-CSE-MsgGUID: wVExnjiDTIWSUzSp3frpEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62567711"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="62567711"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 23:17:30 -0700
X-CSE-ConnectionGUID: TLthew8rSUuVbFU5gca7sQ==
X-CSE-MsgGUID: z19pLs1bT8mhN+voKiAqFQ==
X-ExtLoop1: 1
Received: from unknown (HELO [10.102.88.138]) ([10.102.88.138])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 23:17:28 -0700
Message-ID: <8819283b-ffb8-4df2-9a54-dc87dfe71798@linux.intel.com>
Date: Wed, 15 Oct 2025 08:17:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Fix race condition when mapping dmabuf
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, maciej.falkowski@linux.intel.com,
 lizhi.hou@amd.com, "Wludzik, Jozef" <jozef.wludzik@intel.com>
References: <20251014071725.3047287-1-karol.wachowski@linux.intel.com>
 <17ae8bd5-6153-4388-b2f1-2cb2e2b9ae72@oss.qualcomm.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <17ae8bd5-6153-4388-b2f1-2cb2e2b9ae72@oss.qualcomm.com>
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

On 10/14/2025 5:02 PM, Jeff Hugo wrote:
> On 10/14/2025 1:17 AM, Karol Wachowski wrote:
>> From: "Wludzik, Jozef" <jozef.wludzik@intel.com>
>>
>> Fix a race that can occur when multiple jobs submit the same dmabuf.
>> This could cause the sg_table to be mapped twice, leading to undefined
>> behavior.
>>
>> Fixes: e0c0891cd63b ("accel/ivpu: Rework bind/unbind of imported
>> buffers")
>> Signed-off-by: Wludzik, Jozef <jozef.wludzik@intel.com>
>> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
>
> Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com> 

Pushed to drm-misc-next.

-Karol

