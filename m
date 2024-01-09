Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99355828649
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 13:51:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9808310E408;
	Tue,  9 Jan 2024 12:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F2F10E408
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 12:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704804707; x=1736340707;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=5cHMdByZo1mj8fyGjeEkIrQxI0xNdAwEEqaHR9bCrFw=;
 b=QQChCvcr+2zc+HBfIuIKDA9qwUIN4eJRsogD7pYYde75JAPl5ghuwVBk
 9BT6vd9zebkG94afUYr0boNrBwKGT+O1RlSv/g9xqxyZLVMwlqftT2hBd
 EBZYFc859moSme1r2S2QIcIyAzPDR04XLvMT2DEpJmqv/ffPiMKccKQ2W
 u0PPUHBPD7xCaG37qH5QLC6hAtQi+phYYrV9fw+8XychwxPIYQYfbnZw1
 Mn35gJb8t574HnO3XVSDRNIEVifB/h9xgbHirV/VomMaZspel5q2Hf2Pu
 mbVGVRDt4TpyH/jsFqAVsRo/FyZaKfpeR4WYQ8Q3zdWRGf76zUiemz543 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="11672779"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="11672779"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 04:51:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="872232110"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="872232110"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.217.160.86])
 ([10.217.160.86])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 04:51:14 -0800
Message-ID: <bccd67ca-b0d1-4895-8497-f229e01a1aa9@linux.intel.com>
Date: Tue, 9 Jan 2024 13:51:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] accel/ivpu: Fix for missing lock around
 drm_gem_shmem_vmap()
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org
References: <20240105112218.351265-1-jacek.lawrynowicz@linux.intel.com>
 <20240105112218.351265-7-jacek.lawrynowicz@linux.intel.com>
 <2936fafd-fa17-1f63-40c3-c38f1b93d5b0@quicinc.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <2936fafd-fa17-1f63-40c3-c38f1b93d5b0@quicinc.com>
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



On 05.01.2024 17:36, Jeffrey Hugo wrote:
> On 1/5/2024 4:22 AM, Jacek Lawrynowicz wrote:
>> drm_gem_shmem_vmap/vunmap requires dma resv lock to be held.
>> This was missed during conversion to shmem helper.
>>  > Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> 
> Fixes tag?

Sure, I'll add it.
