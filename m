Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF909AA05F9
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 10:41:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C4E10E3C5;
	Tue, 29 Apr 2025 08:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ni0Frcr/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCCF110E3C5
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 08:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745916066; x=1777452066;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CVy0vheI3QMFq3s+F3hAGkKONSNpTdBsn+jy7ygRpZg=;
 b=ni0Frcr/uhOIzpYaXauIWVtXH03akq814cJwiEAn8mFZUz+smpb7wtGu
 b5V8OfdhrfsmtElNysJMHv+d44aauz1jNl+ldIJ2hNj3TOEWB+/KqKg5k
 GOWsU5vQFhq1et7EiKTChUGsNjNt8nnW+fh3cGbhxDkWlKBbE8PHdXpGS
 xWrEjXfWRoBm7abEX2Z0J774con0bvtpc0sf+gCg0AQI7z3tbWyrWVPsQ
 mCb3oH6gnBpppr1qJp3KCXG1vrjg5wOkHK6IGaguOBA5ikpat5oGY+bZR
 AlXyrvGzVQPHlR7yc2/VaijoHvQdcL7U+XwhZlZXvGOifYuj+RPOv5hp7 w==;
X-CSE-ConnectionGUID: zeR4N6o0TDaDUhjW+QavEw==
X-CSE-MsgGUID: PbZr8qOkT+qv41xNp7PfmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="72906082"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="72906082"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 01:41:06 -0700
X-CSE-ConnectionGUID: 2Q8mNh1GTHq79mxEQFwMbQ==
X-CSE-MsgGUID: ztfeIiv+QAORM/rOqLzyvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="138753383"
Received: from jlawryno-mobl2.clients.intel.com (HELO [10.217.160.151])
 ([10.217.160.151])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 01:41:05 -0700
Message-ID: <cd36ea5c-a44a-4a8a-a3f4-24d7426e6f70@linux.intel.com>
Date: Tue, 29 Apr 2025 10:41:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Correct mutex unlock order in job submission
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: lizhi.hou@amd.com, Karol Wachowski <karol.wachowski@intel.com>
References: <20250425093656.2228168-1-jacek.lawrynowicz@linux.intel.com>
 <087563ac-bf33-4c80-a5fe-b4f2d155d9d1@oss.qualcomm.com>
 <92d4a66e-8df7-4852-b1b4-c42f167856b0@linux.intel.com>
 <c7752304-7eb4-4617-9e8b-93a00960f6db@oss.qualcomm.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <c7752304-7eb4-4617-9e8b-93a00960f6db@oss.qualcomm.com>
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

On 4/28/2025 4:21 PM, Jeff Hugo wrote:
> On 4/28/2025 12:47 AM, Jacek Lawrynowicz wrote:
>> Hi,
>>
>> On 4/25/2025 7:22 PM, Jeff Hugo wrote:
>>> On 4/25/2025 3:36 AM, Jacek Lawrynowicz wrote:
>>>> From: Karol Wachowski <karol.wachowski@intel.com>
>>>>
>>>> The mutex unlock for vdev->submitted_jobs_lock was incorrectly placed
>>>> after unlocking file_priv->lock. Change order of unlocks to avoid potential
>>>
>>> This should read "before unlocking", right?
>>
>> Yes, I will correct the commit message after submitting this patch :)
> 
> It does not look like this would apply to -next.  Does it depend on something else?  The locking order in -next appears correct.
 
Both -fixes and -next have incorrect order, see:
  https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/accel/ivpu/ivpu_job.c#L683
  https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-fixes/drivers/accel/ivpu/ivpu_job.c#L683

The patch applies to both without issues.

Regards,
Jacek
 

