Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3BA669650
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 13:03:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7592910E9F6;
	Fri, 13 Jan 2023 12:02:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289D810E9F2;
 Fri, 13 Jan 2023 12:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673611373; x=1705147373;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UlN2j1kIIyxREP9yQns7AFWR8A2uVDXgY1t5Tgi8t5g=;
 b=meYj2oGT9Kkx7xsEsyvelHLK30wVnWZwxlrc238iYhZwosLbHS6Ffz66
 799dN6z2behDX1XAIs4xh3jtMaxG3PS0FWb4dkhcFMJ4cDQqBnkwDMYdB
 myvlJIF4KO6gfaPRnVP5zIR1m3PmuodxGi+LwSsMMzlxq2ZB5K5JNws8c
 ctmMryVNuPC8uroBhqK0bXuLGqlJZcSLMjghvLgHiWsa2ekNYT/27UYs1
 cJQqRq3gL3mcfHZ3s/FOiEfMQUmpB2DOcTguYmQ72QGxCgtuA7pRKeTnu
 9LtUumAPsAMjDG/mV/Os9eHpLjGB4FntEjNc3eEX9kUxTgjLRHBHOK4fw A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="410213169"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="410213169"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 04:02:52 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="782132713"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="782132713"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.251.222.27])
 ([10.251.222.27])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 04:02:51 -0800
Message-ID: <28a2aa02-b62c-9666-6b1f-11bd33b50c23@linux.intel.com>
Date: Fri, 13 Jan 2023 13:02:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/i915/selftests: Unwind hugepages to drop wakeref on
 error
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, Nirmoy Das <nirmoy.das@intel.com>, 
 intel-gfx@lists.freedesktop.org
References: <20230113114903.7824-1-nirmoy.das@intel.com>
 <f691df00-a1b3-a6e1-3ed8-cdb4eb7a5a56@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <f691df00-a1b3-a6e1-3ed8-cdb4eb7a5a56@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: chris.p.wilson@linux.intel.com, dri-devel@lists.freedesktop.org,
 andi.shyti@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks Matt, I missed the Fixes tag so resent it with fixes and Cc to 
stable.

On 1/13/2023 12:51 PM, Matthew Auld wrote:
> On 13/01/2023 11:49, Nirmoy Das wrote:
>> From: Chris Wilson <chris.p.wilson@linux.intel.com>
>>
>> Make sure that upon error after we have acquired the wakeref we do
>> release it again.
>>
>> Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
