Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A95DA8198F0
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 08:02:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3A310E30B;
	Wed, 20 Dec 2023 07:02:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710CE10E30B
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 07:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703055761; x=1734591761;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=vL9PMXI8odI9hUWBJ4I8AXiOoIzrZ+Uitq44gt2pMys=;
 b=c/bGdqEnllVO3uQEWVL731vMh6Lsk+fUQ4icqSMC3Ok0+zxyLlAj34/R
 RIb8bHYyg+HA8ztyPapu9o9OZnaHRk11rOgFpEbHnLeyhx52EvqD/nyl8
 rb3vc1g02tKSby7imYv84+yETC0AF1HcKrbJjnTJD+FLhnHS+1R4UOa5Y
 b5FuWFU+HLoeG601Hb/e0F3v3s1hEo8ma9LXNYUmXEB9bBt/ieFasINlN
 SMRNTQXJwB7/eBtgs/ZURj3PoXkW6fctI8LYNZfgOYHm07kfk2NarsAE6
 b//C0aL3LemjtO4oQomevIVKLh8dqEOAdJ/EJIleNIhA25S72uVwVm/Zp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="394655200"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; d="scan'208";a="394655200"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 23:02:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="769484035"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; d="scan'208";a="769484035"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.130.98])
 ([10.249.130.98])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 23:02:39 -0800
Message-ID: <dddc3acc-fe15-4d0c-b9f7-5cc475534498@linux.intel.com>
Date: Wed, 20 Dec 2023 08:02:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] accel/qaic: Leverage DRM managed APIs to release
 resources
To: dri-devel@lists.freedesktop.org
References: <20231208163457.1295993-1-quic_jhugo@quicinc.com>
 <20231208163457.1295993-7-quic_jhugo@quicinc.com>
 <9c314cf9-0291-2879-9a78-80cf97ca4ce6@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <9c314cf9-0291-2879-9a78-80cf97ca4ce6@quicinc.com>
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

On 15.12.2023 19:06, Jeffrey Hugo wrote:
> On 12/8/2023 9:34 AM, Jeffrey Hugo wrote:
>> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>>
>> Offload the balancing of init and destroy calls to DRM managed APIs.
>> mutex destroy for ->cntl_mutex is not called during device release and
>> destroy workqueue is not called in error path of create_qdev(). So, use
>> DRM managed APIs to manage the release of resources and avoid such
>> problems.
>>
>> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> Jacek, I saw a review from you for 1-5, and 7 but not this patch (6). Did I miss something?

Sorry, I was out of office for a couple days and I wasn't able to finish the review.

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
