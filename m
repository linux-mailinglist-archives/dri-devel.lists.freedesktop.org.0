Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3754249E2CB
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 13:45:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A154710E371;
	Thu, 27 Jan 2022 12:45:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7330F10E64E;
 Thu, 27 Jan 2022 12:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643287532; x=1674823532;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YuH2RZG+RGvt74U74UpO3K39XsULoPyARyVDyhZ+PbI=;
 b=b79ZuSzbCyaDmr5cWwgyTbwz7ZHMcO4C8RlUg/gWBv7PKE//JIjiFVb1
 AuFbkgnoamzk30mWvl4zN2Oq8NCUxDMamjdPMl/fhSS3M8lq3OqzghgmC
 MlIces+XzlhhERLQGSWMQBK2x04VaHmEhEf13ugM9lWNKZkhuBe4EFa7p
 rn/W3/qeeWSLMMHMu76sCJXn3Nz1m9v9Q0WFY8NmXmVngGNff+4FzhtSE
 duQzwGeNYmOKBN7vdqElhdg618dadR44n+SuNz6N6BZSKCKHeoOtcgcDp
 Te6jaWt+m0G2cQo3FHKvDgfy4vleXGr3W4taLtQHPGWrrn/13IF+rfMhT Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="244441394"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="244441394"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 04:45:31 -0800
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="480276665"
Received: from cmathias-mobl1.ger.corp.intel.com (HELO [10.249.254.207])
 ([10.249.254.207])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 04:45:30 -0800
Message-ID: <e73bb44a-04fe-a7ca-abab-da1002ec9623@linux.intel.com>
Date: Thu, 27 Jan 2022 13:45:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Lock dpt_obj around
 set_cache_level, v2.
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220126073703.1215696-1-maarten.lankhorst@linux.intel.com>
 <fdea6db7-44e4-dcbc-548a-7888c089d25e@intel.com>
 <83aec5cf-2e5c-77ec-b716-0416551c3f2a@linux.intel.com>
 <27506ac8eff06662f063d563662555cb08f2ce64.camel@linux.intel.com>
 <982820d1-0d9a-ac01-e4f5-9a11556d8690@linux.intel.com>
 <44532d97-6701-93f2-dd06-4429b523f666@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <44532d97-6701-93f2-dd06-4429b523f666@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/27/22 13:38, Maarten Lankhorst wrote:
> Op 27-01-2022 om 13:09 schreef Thomas Hellström:
>> On 1/27/22 13:05, Thomas Hellström wrote:
>>>> The bug on vm_close is a separate bug, and would probably best be
>>>> fixed in a separate patch.
>>>>
>>>> Could I get a r-b on this? It should fix some issues, even if the
>>>> unbind there is a separate bug.
>>>>
>>>> ~Maarten
>>>>
>>> Recognizing that it doesn't fix the vm_close issue,
>>>
>>> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Oh, BTW should probably carefully review those seemingly unrelated stall warnings from BAT to check whether the newly introduced object lock might stall a workqueue causing those.
>>
>> /Thomas
> Which ones? I mostly see ext4 failures, where it doesn't seem to have any i915 lock held at all.
>
Oh, I was looking at v1 version of the patch, but just noticed a hang. 
Didn't look to carefully at what was the cause.

/Thomas


