Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A59D026F7
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 12:37:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CBA010E33C;
	Thu,  8 Jan 2026 11:37:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aKHx2RpW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E53210E33C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 11:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767872240; x=1799408240;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2iASbPFxSPU48msnD3ShyL4Id+uDsJoqTO3GMqDZB0E=;
 b=aKHx2RpWDw0tswJoYDMz/ue54DNN4UIIhrUalFopjhn21jU9BnRA4jMq
 Cn1UtZRczqKye+bjjpqAGNFbbWVq3rTgLmrDqoa7wSgQKRaBwDaK/brvw
 byLZxBdjAb42V+RUiPfTSwcMKuTpX/GcxyL6LWw7gEIiZM8OuhqNrVpRw
 WEe/Uz8ZxTGidEOioQ3WOL3p0Qf40YEJBh7pmkCg4+0ih3LAXO6WdIrMN
 Y+1cBGkOHvUjRcMDCNXGbaEo+6oQcz4EdFjNF1IUTP/ttwUMxT8qdhrsh
 PRJEJcBPKgtleVqWY3vOm4D7/oAfircN7sju1ADhJ0zBhDaaxk2IBSxGS Q==;
X-CSE-ConnectionGUID: RIqh5qZNS0SWQr/yjMErfw==
X-CSE-MsgGUID: Ac8wiz5HQQC7b7pxysnAKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="80696304"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="80696304"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 03:37:20 -0800
X-CSE-ConnectionGUID: NiD+iZ+0QAieHEu9alwz4A==
X-CSE-MsgGUID: dc1p3KseTRWEdAcMI+gkHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="207318504"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.246.17.246])
 ([10.246.17.246])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 03:37:18 -0800
Message-ID: <deb4834f-3770-483e-9d1e-3c2a885f971f@linux.intel.com>
Date: Thu, 8 Jan 2026 12:37:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Implement warm boot flow for NPU6 and unify
 boot handling
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, karol.wachowski@linux.intel.com, lizhi.hou@amd.com
References: <20251230142116.540026-1-maciej.falkowski@linux.intel.com>
 <ca17e5d1-9de9-44b2-a15a-664d50612ed6@oss.qualcomm.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <ca17e5d1-9de9-44b2-a15a-664d50612ed6@oss.qualcomm.com>
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

On 1/7/2026 6:11 PM, Jeff Hugo wrote:

> On 12/30/2025 7:21 AM, Maciej Falkowski wrote:
>> From: Karol Wachowski <karol.wachowski@linux.intel.com>
>>
>> Starting from NPU6, the driver can pass boot parameters address through
>> the AON retention register and toggle between cold/warm boot types using
>> the boot_type parameter, while setting the cold boot entry point in both
>> cases.
>>
>> Refactor the existing cold/warm boot handling to be consistent with the
>> new NPU6 boot flow requirements and still maintain compatibility with
>> older boot flows.
>>
>> This will allow firmware to remove support for legacy warm boot starting
>> from NPU6.
>>
>> Fixes: 550f4dd2cedd ("accel/ivpu: Add support for Nova Lake's NPU")
>> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
>> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>
> Happy new year.
>
> Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com> 

Happy new year!

Pushed to drm-misc-next.

Best regards,
Maciej
