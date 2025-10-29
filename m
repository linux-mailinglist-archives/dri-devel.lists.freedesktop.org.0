Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67787C189C0
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 08:15:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DD510E6FD;
	Wed, 29 Oct 2025 07:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V/HjxV/6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980CD10E6FD
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 07:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761722111; x=1793258111;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/jRrPOduVTlj/Gt3xSirIupJXip86RJqNPv8yH8beXg=;
 b=V/HjxV/6L2lg10aYvNhsnlSQUa3/g6vD2yhOoa5hihdptRVtIZe/MVST
 quD8DWdssYUO/hi2FV3l/wZpqgnOgCl0gTA+zlZ/rVYIIT8nrXh1b5c0Q
 64W9xewhH2SafL3HXJ1tmLJ1gwI8tlAUbtL86DxMG3waVUvl68Wdild/L
 TKFFtPKYxR3HaHLvLbZ65hnJzSDJi58QnzAdz25R9JvW5HEpivLEbzjp2
 Lcd4XqwKj8sPlgXyQtJnupUf3aSmARuQtJfgICHO+anWnbX1/k0Jmt8p2
 iPgIOeodRpZFM7sbOv1HfZwCJZdHMWI7BXjARhW3GxzuMntyWuqC+Nzwy A==;
X-CSE-ConnectionGUID: MtJ9hEswSV2uH4W5fFXd5w==
X-CSE-MsgGUID: NCMmdfzrQoin8jiTUrng2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75281274"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="75281274"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 00:15:11 -0700
X-CSE-ConnectionGUID: wspNO7TjSv+qyFROc1FRiw==
X-CSE-MsgGUID: bBl/uXR2Ra2I7yNsqenXmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="189640264"
Received: from unknown (HELO [10.102.88.18]) ([10.102.88.18])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 00:15:07 -0700
Message-ID: <16dc50b8-9f8e-416c-b3c0-82582f5f07d9@linux.intel.com>
Date: Wed, 29 Oct 2025 08:15:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Fix race condition when unbinding BOs
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, maciej.falkowski@linux.intel.com,
 lizhi.hou@amd.com, Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
References: <20251028070559.135097-1-karol.wachowski@linux.intel.com>
 <2a11acc6-28c6-401d-a5c4-d18e75b128d1@oss.qualcomm.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <2a11acc6-28c6-401d-a5c4-d18e75b128d1@oss.qualcomm.com>
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

On 10/28/2025 9:28 PM, Jeff Hugo wrote:
> On 10/28/2025 1:05 AM, Karol Wachowski wrote:
>> From: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
>>
>> Fix 'Memory manager not clean during takedown' warning that occurs
>> when ivpu_gem_bo_free() removes the BO from the BOs list before it
>> gets unmapped. Then file_priv_unbind() triggers a warning in
>> drm_mm_takedown() during context teardown.
>>
>> Protect the unmapping sequence with bo_list_lock to ensure the BO is
>> always fully unmapped when removed from the list. This ensures the BO
>> is either fully unmapped at context teardown time or present on the
>> list and unmapped by file_priv_unbind().
>>
>
> Should this have a Fixes tag? Sounds like just a splat, but a user
> visible one perhaps. 

Good idea, added Fixes tag in v2.

Thanks,
-Karol

>
> -Jeff
