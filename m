Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B5A9D7B5B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 06:53:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E8510E134;
	Mon, 25 Nov 2024 05:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lehQAkml";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C3C10E134;
 Mon, 25 Nov 2024 05:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732514016; x=1764050016;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UZzeNgqldzL/eKNaTYTZOcFy8gMJ9ABaJnzp6cZLHvQ=;
 b=lehQAkml90MoYJER5uL0pE9jJwM5XaNJqkKek3zdO1GoEZe2jP11IJ7Y
 2GDTZlWC0n6cWrlmOiCYs9ocm81L9tvEnDpO1OCIEGCRwNorgCTNuZeMY
 XTwlSOFmpbgjKHloIe4ZK6orMOsyoDM/Plb3R9Ns2BdXRaDh7NLZx0Mys
 5ggdPJfDBvFjBE456eX3f43XfetIQQtM+TyQLOGz8k4qktkqTbC2Mtill
 q72ox41O6gG7QogywYnLdwt02RJrgBk5AL8AYCOWX19jWhyJXgsTZLTnS
 JBC3mCyy7wlQppkyBsd0YAYqm36apfcNiFxbQKEn6TQiFmJ1wzXuxe+lu g==;
X-CSE-ConnectionGUID: cZFYPseUTJ+KHOXTSE1e2g==
X-CSE-MsgGUID: 0F7t3pTqRnGh8KsLA3YJxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="55106218"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="55106218"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2024 21:53:35 -0800
X-CSE-ConnectionGUID: kTcW2iuqTgiCvfmug3UC+w==
X-CSE-MsgGUID: aUk/fCs7SgGn2Q2AvICA4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="96084337"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2024 21:53:27 -0800
Message-ID: <637aa694-d32b-4c9a-99b7-3b77996d96b6@linux.intel.com>
Date: Mon, 25 Nov 2024 11:26:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/4] drm: Introduce device wedged event
To: Raag Jadav <raag.jadav@intel.com>
Cc: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com, lina@asahilina.net,
 michal.wajdeczko@intel.com, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, anshuman.gupta@intel.com,
 alexander.deucher@amd.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20241115050733.806934-1-raag.jadav@intel.com>
 <20241115050733.806934-2-raag.jadav@intel.com>
 <8c7292c3-8459-4ddc-a899-b56b1d93076f@linux.intel.com>
 <Z0Atv3Zw1d0N8hvv@black.fi.intel.com>
 <3644d364-6021-46fe-b3a2-689821551984@amd.com>
 <Z0CrJ3C3wJqtySLp@black.fi.intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <Z0CrJ3C3wJqtySLp@black.fi.intel.com>
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


On 22/11/24 21:32, Raag Jadav wrote:
> On Fri, Nov 22, 2024 at 11:09:32AM +0100, Christian König wrote:
>> Am 22.11.24 um 08:07 schrieb Raag Jadav:
>>> On Mon, Nov 18, 2024 at 08:26:37PM +0530, Aravind Iddamsetty wrote:
>>>> On 15/11/24 10:37, Raag Jadav wrote:
>>>>> Introduce device wedged event, which notifies userspace of 'wedged'
>>>>> (hanged/unusable) state of the DRM device through a uevent. This is
>>>>> useful especially in cases where the device is no longer operating as
>>>>> expected and has become unrecoverable from driver context. Purpose of
>>>>> this implementation is to provide drivers a generic way to recover with
>>>>> the help of userspace intervention without taking any drastic measures
>>>>> in the driver.
>>>>>
>>>>> A 'wedged' device is basically a dead device that needs attention. The
>>>>> uevent is the notification that is sent to userspace along with a hint
>>>>> about what could possibly be attempted to recover the device and bring
>>>>> it back to usable state. Different drivers may have different ideas of
>>>>> a 'wedged' device depending on their hardware implementation, and hence
>>>>> the vendor agnostic nature of the event. It is up to the drivers to
>>>>> decide when they see the need for recovery and how they want to recover
>>>>> from the available methods.
>>>>>
>>>>> Prerequisites
>>>>> -------------
>>>>>
>>>>> The driver, before opting for recovery, needs to make sure that the
>>>>> 'wedged' device doesn't harm the system as a whole by taking care of the
>>>>> prerequisites. Necessary actions must include disabling DMA to system
>>>>> memory as well as any communication channels with other devices. Further,
>>>>> the driver must ensure that all dma_fences are signalled and any device
>>>>> state that the core kernel might depend on are cleaned up. Once the event
>>>>> is sent, the device must be kept in 'wedged' state until the recovery is
>>>>> performed. New accesses to the device (IOCTLs) should be blocked,
>>>>> preferably with an error code that resembles the type of failure the
>>>>> device has encountered. This will signify the reason for wegeding which
>>>>> can be reported to the application if needed.
>>>> should we even drop the mmaps we created?
>>> Whatever is required for a clean recovery, yes.
>>>
>>> Although how would this play out? Do we risk loosing display?
>>> Or any other possible side-effects?
>> Before sending a wedge event all DMA transfers of the device have to be
>> blocked.
>>
>> So yes, all display, mmap() and file descriptor connections you had with the
>> device would need to be re-created.
> Does it mean we'd have to rely on userspace to unmap()?


I'm not sure of display, but at least all user mappings can be destroyed
using drm_vma_node_unmap.

Thanks,
Aravind.
>
> Raag
