Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 680D298ACC6
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 21:25:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92C910E069;
	Mon, 30 Sep 2024 19:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZG63b4pS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A5A910E069
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 19:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727724339; x=1759260339;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8V62TmC0Aikd2/ond7KTkJ+xjFPzJIvFm+zA+Vx7XtY=;
 b=ZG63b4pSbRLZVnLcX96BRZ3FJOYmjwssEcPQA9sZ7woH6k4b9vHV07oz
 4WJD+rgxP2CDnxgTcXhO24kTrqMTy1YSAtdZZUu93kjdUREpXiXiqx7Qb
 zM0M5BcaujYcxV/rreGxa769pNCxuetyWAmQj6QN7EQSFgj3fjIAJ6GDb
 3UdUVPvZWWxvJ0nopj6+JT8BuBm394qKuSSwfrYbho+tu+u+15h40Xnww
 GUEhlHy7qyaE7nkup8WdTyOS+c0U7OaZs8MQPey/VPQLbPAFtq4+etvPN
 wzut09Rb9p7xTIDMbKjfLbh1ychjracDpuGtYMidnb8hv6iO1mPx+4jK5 Q==;
X-CSE-ConnectionGUID: 8n6yTKFdTk6D7tqMcj0xZw==
X-CSE-MsgGUID: xIM3IHPARAuf2uIvQSXPpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="37977368"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="37977368"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:25:39 -0700
X-CSE-ConnectionGUID: 7fYCszIHRRWndoH0O6nVcQ==
X-CSE-MsgGUID: wkLGsEwSR56VR7vnePjYPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73814934"
Received: from jpdavis-mobl1.ger.corp.intel.com (HELO [10.246.18.68])
 ([10.246.18.68])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:25:38 -0700
Message-ID: <57f7e3cb-6e5f-4379-bfe6-032f970d058e@linux.intel.com>
Date: Mon, 30 Sep 2024 21:25:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/29] accel/ivpu: Refactor FW log
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
References: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
 <20240924081754.209728-5-jacek.lawrynowicz@linux.intel.com>
 <ae938df2-e70d-2885-e423-0cee68f06564@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <ae938df2-e70d-2885-e423-0cee68f06564@quicinc.com>
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

On 9/27/2024 10:30 PM, Jeffrey Hugo wrote:
> On 9/24/2024 2:17 AM, Jacek Lawrynowicz wrote:
>>    - use read_wrap_count from new FW Boot API
>>    - fix logic issues in fw_log_print_buffer
> 
> What issues?  Fixes tag?
> 
>>    - remove unused functions/structures
>>    - rename some of the functions for better readability
> 
> Feels like this should be 4 separate patches. Removing unused functions does not seem to be directly related to readability from naming for example.
> 

I will split this commit and rewrite commit messages.
This patch will not apply to older kernels without all dependencies so I don't think that fixes tag is needed here.

