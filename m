Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CB34C36F0
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 21:39:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930FC10E6AC;
	Thu, 24 Feb 2022 20:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB4010E6AB;
 Thu, 24 Feb 2022 20:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645735147; x=1677271147;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Y7jHjX9MeTWbmPnQb38nq6YUV/k+5S99uIoIq/DHVWM=;
 b=Ayl1L1Hm8NMulyX3nuGQEbhByyeR+/8OtVLsmpVe+pNWHFb1E/iKw+tX
 eF5IYLmrhAiiAfEl5NCCXv1yuUPIXMEw7ksmFbtjspZXlJD53GYRjFaJ/
 bdRx47EkRbRsKhZj6VzYof41i+J/FUgcfWA9rnnt20fcKG3GxvWsnCKTU
 3utJZfXJR/OyTzqGMWLQx490DG0wXoJDyeidtBko4kML+47hNtyXaHtJ+
 rnBfNuLZXmGmSR9qcVXoIZV6WyVF+r1+5d6gQez5tKhRNMJyrJlhKr/RX
 9J4LVBIbeK1x/LaIp28+nRuRoBK6j2VeVCQIs5VFFIbXLaTHJjC53yrAa w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="252264043"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="252264043"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 12:39:07 -0800
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="533288969"
Received: from shravank-mobl1.gar.corp.intel.com (HELO [10.252.46.141])
 ([10.252.46.141])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 12:39:06 -0800
Message-ID: <b2775a1f-0bf1-99ad-ba89-ea9fb4ebce4e@linux.intel.com>
Date: Thu, 24 Feb 2022 21:39:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH 0/3] drm/helpers: Make the suballocation manager drm
 generic.
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20220223135112.655569-1-maarten.lankhorst@linux.intel.com>
 <868b0d69-0620-95a6-ed47-7f89288afdc5@amd.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <868b0d69-0620-95a6-ed47-7f89288afdc5@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 Xinhui Pan <Xinhui.Pan@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 23-02-2022 om 16:11 schreef Christian König:
> Am 23.02.22 um 14:51 schrieb Maarten Lankhorst:
>> Second version of the patch. I didn't fix the copyright (which ame up
>> in the previous version), as I feel the original author should send a
>> patch for that.
>>
>> I've made the suballocator into its own module, and did a cleanup pass on it.
>> The suballocator is generic enough to be useful for any resource that can be
>> subdivided and is guarded by a completion fence.
>
> Well the main issue is still that you removed the per allocation alignment.
>
> For amdgpu that is not much of a problem, but for radeon that could cause massive issues with UVD semaphore synchronization. 

Hey,

Is this really a problem? I made the per allocation alignment fixed and set it to the higher of the 2 places it's used in by radeon. This just means that slightly more memory might be allocated to each suballocation. This shouldn't cause any problem. It would reserve 256 bytes for a semaphore allocation, instead of 8.

~Maarten

