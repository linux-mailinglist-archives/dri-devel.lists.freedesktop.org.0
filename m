Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AD3ACF42F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 18:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF39210E326;
	Thu,  5 Jun 2025 16:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eAqv3W27";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD1A10E326
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 16:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749140695; x=1780676695;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QUmJDNLv4/JzLs2JYyQzQHjA0LeAO+ICOXHf6mJrw+U=;
 b=eAqv3W2730a/kcuariKCyVJCE6bjw/NsMdFKhYX58daw1zQT5EYYcmBq
 Iur709+AIURfyFaGOU5XHdNxQZu+142Uoaa6oUbLJOuDq1VrAZVDCY4ae
 EE4fWESDr29tkM8VfT/jEc0HT/WdPq8AoCP2TDWPH0p/eWK3zpGC9pDT/
 gC1m6M3EfsVVM4oxHTlR55Q9ImFFNRC6KWMC8ZqdxWAbyzVH246s01dco
 nYoL7vBZnKIfKw6tkqZJFB7Yq0zY2nSQeDkbth+NeWsdHI+CPESUHeVpD
 nw+BjKNrlxBSpcyBCOyC+NHWIiDBVFecS+TB8H0JblPk5gLkmhmedte3K w==;
X-CSE-ConnectionGUID: egiWNxIMR8yXi52pw41Hag==
X-CSE-MsgGUID: Dc5UgahcTQqPB0Lrql9H8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="55076677"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="55076677"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 09:24:52 -0700
X-CSE-ConnectionGUID: cQeREChzTkKRto+gWXcbCA==
X-CSE-MsgGUID: IhtrAAEcSWyfwgZRWyBYxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="145528071"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.245.252.111])
 ([10.245.252.111])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 09:24:50 -0700
Message-ID: <22209cdb-db72-4515-852d-9df1f4091402@linux.intel.com>
Date: Thu, 5 Jun 2025 18:24:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Reorder doorbell unregister and command queue
 destruction
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jacek.lawrynowicz@linux.intel.com,
 lizhi.hou@amd.com, Karol Wachowski <karol.wachowski@intel.com>,
 stable@vger.kernel.org
References: <20250604154450.1209596-1-maciej.falkowski@linux.intel.com>
 <0423ac43-0a12-4f0f-ade3-61364d4abf93@oss.qualcomm.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <0423ac43-0a12-4f0f-ade3-61364d4abf93@oss.qualcomm.com>
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

On 6/4/2025 6:18 PM, Jeff Hugo wrote:

> On 6/4/2025 9:44 AM, Maciej Falkowski wrote:
>> From: Karol Wachowski <karol.wachowski@intel.com>
>>
>> Refactor ivpu_cmdq_unregister() to ensure the doorbell is unregistered
>> before destroying the command queue. The NPU firmware requires doorbells
>> to be unregistered prior to command queue destruction.
>>
>> If doorbell remains registered when command queue destroy command is 
>> sent
>> firmware will automatically unregister the doorbell, making subsequent
>> unregister attempts no-operations (NOPs).
>>
>> Ensure compliance with firmware expectations by moving the doorbell
>> unregister call ahead of the command queue destruction logic,
>> thus preventing unnecessary NOP operation.
>>
>> Fixes: 2a18ceff9482 ("accel/ivpu: Implement support for hardware 
>> scheduler")
>> Cc: <stable@vger.kernel.org> # v6.11+
>> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
>> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>
> Huh?  This was posted to the list on May 15th, and Jacek applied it to 
> drm-misc-fixes on May 28th.
My apologies, you are right. I accidentally included it while checking 
latest changes.

Best regards,
Maciej
>
> -Jeff
