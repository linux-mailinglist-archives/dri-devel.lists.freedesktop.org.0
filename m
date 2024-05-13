Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A43F38C3EA4
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 12:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E3C10E5AB;
	Mon, 13 May 2024 10:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nFJJXvXr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A25010E5AB
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 10:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715595074; x=1747131074;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YP8jF3VkZdjbb/wXiA4pt83a2lqX0Uns83340RI+eco=;
 b=nFJJXvXrWMfCabfRZZg7Ke9OCSnzviUd7rLYCqMtxISR+nfME8p5xP3X
 zYn0TMxStnDza1lctqgYyH/9QynMdk+meNABdZ6MrgBiOMsSyQODAUy13
 GWY7Ve/NRIRpILa4oXBheMJih0ZYmmuUM9rtIrRACg0R41dZLhSYobEw6
 8XBa/yRToZOG6HqiOz9sAuZCuKjs25wqB7dx+rrbCGVF+ajZ5muN28JEA
 GnLADaxBtiC4Ds55pk0JMC1O5L0Qc6qCWuQMBh8nxVOciR0cXWxb/0S5P
 UTdnsaq1U0IxUxn6D+q+wXMyfpeZtb88JIU696LHfcNO3CUbdhociA1tl A==;
X-CSE-ConnectionGUID: xREp9mpyRcOLS6bBL+mHIw==
X-CSE-MsgGUID: EqPkT7B+RbCbyhER8aSgNg==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11356276"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="11356276"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 03:11:14 -0700
X-CSE-ConnectionGUID: l9uiP+AlRmiNYRmwEK59PQ==
X-CSE-MsgGUID: g1VH/14hTPOCGpfCelE5pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30276441"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.246.3.118])
 ([10.246.3.118])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 03:11:12 -0700
Message-ID: <09d0c6c0-24fd-4c28-bd85-09c9d1d80e97@linux.intel.com>
Date: Mon, 13 May 2024 12:11:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] accel/ivpu: Add resume engine support
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, "Wachowski, Karol" <karol.wachowski@intel.com>
References: <20240508132106.2387464-1-jacek.lawrynowicz@linux.intel.com>
 <20240508132106.2387464-8-jacek.lawrynowicz@linux.intel.com>
 <064c4c36-e9ce-6643-9916-7f226053caed@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <064c4c36-e9ce-6643-9916-7f226053caed@quicinc.com>
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

On 10.05.2024 18:42, Jeffrey Hugo wrote:
> On 5/8/2024 7:21 AM, Jacek Lawrynowicz wrote:
>> From: "Wachowski, Karol" <karol.wachowski@intel.com>
>>
>> Create debugfs interface that triggers sending resume engine IPC
>> command to VPU.
> 
> Why?  Who would use this and for what purpose?
This is used by our user space tests. I will extend the description.
