Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 494004C4CD2
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 18:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34A310E8BC;
	Fri, 25 Feb 2022 17:44:22 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8457A10E8BC;
 Fri, 25 Feb 2022 17:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645811061; x=1677347061;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kVkHZ6YSaWiHlquueguNgVcHKjFSuSIOYosMw1eLoJQ=;
 b=LAmzPCB7zxkj1HrRmjEHa4XLSheL3IUNFebjMZQzN88JTGTxf8l5UnLN
 L8l1GPYMz08satje/s09F9n5gg6eK00s5qudcNz8ivTXgbfFiuqmliPPP
 ymWXxasFGg21cFFbrnFBejmjT68elJ7iftwLCS1xDhkFXQJ48movJLI/n
 gQV6cA7lcUYxcos+SshMva+hNuKetOkuVo827z3LjdWF33tcRKtg55r2J
 a2cnCh6XivbjAxT3Hn97xTJQeRpSHhZzodTXSa6UFFh9S9OaU7b5zhdEO
 RU6vTNsjxZ8RQn90uobIhbbABgYXR9wmmUJ7iImEuxS6NM/0S16/1R56k w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="252275223"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="252275223"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 09:44:21 -0800
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="549351346"
Received: from pkinsell-mobl.ger.corp.intel.com (HELO [10.213.234.117])
 ([10.213.234.117])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 09:44:19 -0800
Message-ID: <58605636-42d3-1378-af81-eae4a447db9e@linux.intel.com>
Date: Fri, 25 Feb 2022 17:44:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915/guc: Limit scheduling properties
 to avoid overflow
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, Intel-GFX@Lists.FreeDesktop.Org
References: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
 <20220218213307.1338478-2-John.C.Harrison@Intel.com>
 <0d0c5a79-1285-0830-3794-e9f0644811a5@linux.intel.com>
 <94c3184e-c1e2-668f-5824-00fd55797736@intel.com>
 <17e69f0c-8084-10dc-b20f-7d5108260180@linux.intel.com>
 <85105590-a8be-f4e1-69bc-cd34cad108e2@intel.com>
 <16a2687b-4996-8d40-456e-019a112f0fb6@linux.intel.com>
 <c1472196-260a-d2c8-c508-10fe58d4cd47@intel.com>
 <77a7da0d-4cea-00c5-0073-44c9779b14a5@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <77a7da0d-4cea-00c5-0073-44c9779b14a5@intel.com>
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 24/02/2022 19:51, John Harrison wrote:
> On 2/24/2022 11:19, John Harrison wrote:
>> [snip]
>>
>> I'll change it to _uses_ and repost, then.
>>
> [    7.683149] kernel BUG at drivers/gpu/drm/i915/gt/uc/intel_guc.h:367!
> 
> Told you that one went bang.

intel_guc_is_used ?

My suggestion was intel_engine_uses_guc. But do note I think it would 
not work either because of setup vs init ordering. Not sure that it 
makes sense at engine granularity anyway.

Still I do think "is wanted" is quite bad.

Regards,

Tvrtko
