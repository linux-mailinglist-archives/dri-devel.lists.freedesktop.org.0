Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0475697ACB6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 10:15:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B70310E3F6;
	Tue, 17 Sep 2024 08:15:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HOFtmboX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5647E10E1FD;
 Tue, 17 Sep 2024 08:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726560946; x=1758096946;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VHCyMxDpt6VzFR6W8vWLtmNYtrEVhdw4UGyF3I54XVU=;
 b=HOFtmboXyhldFCpGsrm1i1TXWjiVY3/8vxjbOfC9gkNOvmjtrq9/wNYd
 //kf4X458l3iZma9ns8LNFy1EZUYP5moMZpF08Q1SW2e4j6jxK4ck25si
 ezdtttVT6+CBKRCv09HeGxiKp3btygEv/QW4JKkv31wQ8FkwlkwLoUjuT
 gV14uks0vQrWJ5swN3clG6qEQOnvCSW99k2L8dFbhhR19p9Tj+Kw+4Hfu
 Jhi+MiUYH6tg+WOu7hgKOEFr683e3xlKYDsVft5pq6VaGsb0ve25YUjvf
 jIt1Xsur/pncq54FqYubVOWqWa0veDUgZx9g41SXH6SN+9btqx8xPAieA Q==;
X-CSE-ConnectionGUID: /BvoqoEFT1apBfwXAKWtmw==
X-CSE-MsgGUID: +wpEL/DUSPOHVP3QlgDUOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="29303798"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="29303798"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 01:15:46 -0700
X-CSE-ConnectionGUID: HkTSQOvxTs+Zums7pbKOgA==
X-CSE-MsgGUID: oXldicdOSDWMnPPA6+JWPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="69904809"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 01:15:40 -0700
Message-ID: <5e24e8f4-d66f-45ea-8401-2924ec77477f@linux.intel.com>
Date: Tue, 17 Sep 2024 13:48:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] drm/xe: Use device wedged event
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 Raag Jadav <raag.jadav@intel.com>
Cc: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, lina@asahilina.net, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 francois.dugast@intel.com, anshuman.gupta@intel.com,
 andi.shyti@linux.intel.com, andriy.shevchenko@linux.intel.com,
 matthew.d.roper@intel.com
References: <20240917040235.197019-1-raag.jadav@intel.com>
 <20240917040235.197019-4-raag.jadav@intel.com>
 <86908889-2628-44b8-a2e3-af700217df50@intel.com>
 <Zukj9y2oZve73NLy@black.fi.intel.com>
 <97077405-333d-4940-94e1-7e6a5d9c38b5@intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <97077405-333d-4940-94e1-7e6a5d9c38b5@intel.com>
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


On 17/09/24 13:33, Ghimiray, Himal Prasad wrote:
>
>
> On 17-09-2024 12:08, Raag Jadav wrote:
>> On Tue, Sep 17, 2024 at 10:11:05AM +0530, Ghimiray, Himal Prasad wrote:
>>> On 17-09-2024 09:32, Raag Jadav wrote:
>>>> This was previously attempted as xe specific reset uevent but dropped
>>>> in commit 77a0d4d1cea2 ("drm/xe/uapi: Remove reset uevent for now")
>>>> as part of refactoring.
>>>>
>>>> Now that we have device wedged event supported by DRM core, make use
>>>> of it. With this in place userspace will be notified of wedged device,
>>>> on the basis of which, userspace may take respective action to recover
>>>> the device.
>>>
>>>
>>> As per earlier discussions, the UAPI was also supposed to provide the reason
>>> for wedging( which is supposedly used by L0). IS that requirement nomore in
>>> place ?
>>
>> Wondering how does that contribute to the usecase?
>
>
> ZES_EVENT_TYPE_FLAG_DEVICE_RESET_REQUIRED uses zesDeviceGetState
>
> "Get information about the state of the device - if a reset is required, reasons for the reset and if the device has been repaired. "
>
> https://spec.oneapi.io/level-zero/latest/sysman/api.html#zes__api_8h_1aec73230b938f08ad632d0b7817b66183
L0 doesn't read this uevent to know the reason, this uevent is for L0 to know that reset is required 
https://spec.oneapi.io/level-zero/latest/sysman/api.html#_CPPv4N21zes_event_type_flag_t41ZES_EVENT_TYPE_FLAG_DEVICE_RESET_REQUIREDE.


The reason is via a different API via https://spec.oneapi.io/level-zero/latest/sysman/api.html#zesdevicegetstate for which they can open
any IOCTL which will fail with -ECANCELED  when device is wedged and by that they can know the reason.


Thanks,
Aravind.
>
>>
>> Raag
