Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B82BC60C1
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 18:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09CC410E884;
	Wed,  8 Oct 2025 16:39:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b+cW5lDP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 579A710E87B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 16:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759941546; x=1791477546;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mpmmwvL9lSgJITziYZ4gXqKfIji1OeT5pEG3ysfeCp8=;
 b=b+cW5lDPQUELGvWynvjbWtLw3GdpS5To+BeeMBcTwjzcnEddNqCvSdmX
 znd8vSBQ8BRF3u0g8FuuK6Iu7BQ+wNz71FbKc+ZVWLji3hLLQeuCjFQ6E
 DvM73oAQQXzPtPp68dpqjZMalYT4fg+KOW6pNQHXO/TDsPJEF0Z5RlWLj
 R0mwvN6QK+VSROV8BT71Vod1Ubrghv1SLaWEkwWqeDWNvELRWQ4xHV/Hc
 DdCx1ZavViEpcDlo0ub39ERKt/xtUbJApBGQK6XTmQ54gqw8V2/1iW4vq
 DIZNm0+SjU/TpvxIOud5o04EPT23i0Q2q27pNeYonNw8fixI4W1NRoSLX g==;
X-CSE-ConnectionGUID: 1eIfHweCRTCw6Wdmtc6mSg==
X-CSE-MsgGUID: nPO9iSetSGqOmBV9GgsClA==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="61846276"
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="61846276"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 09:39:06 -0700
X-CSE-ConnectionGUID: HfVbzbonSuqqtZUJLw1ChA==
X-CSE-MsgGUID: zY4f8F0nS1a36RiYcl0/6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="204193801"
Received: from kwachows-mobl.ger.corp.intel.com (HELO [10.246.18.173])
 ([10.246.18.173])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 09:39:04 -0700
Message-ID: <833a925f-d138-4b5a-9e05-ac82a45a7ce3@linux.intel.com>
Date: Wed, 8 Oct 2025 18:39:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Trigger engine reset for additional job
 status codes
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, maciej.falkowski@linux.intel.com,
 lizhi.hou@amd.com, Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
References: <20251007083511.2817021-1-karol.wachowski@linux.intel.com>
 <d87317b6-bc92-48a6-abed-05857afc9479@oss.qualcomm.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <d87317b6-bc92-48a6-abed-05857afc9479@oss.qualcomm.com>
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

Applied to drm-misc-next.

On 10/7/2025 4:51 PM, Jeff Hugo wrote:
> On 10/7/2025 2:35 AM, Karol Wachowski wrote:
>> From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
>>
>> Trigger engine reset for any status code in the range.
>> This allows to add additional status codes in the future without
>> breaking compatibility between the firmware and the driver.
>>
>> Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
>> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
>
> Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
