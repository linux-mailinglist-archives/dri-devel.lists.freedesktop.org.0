Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E966B0503
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 11:52:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AFE610E0D8;
	Wed,  8 Mar 2023 10:52:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD66310E0D8;
 Wed,  8 Mar 2023 10:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678272764; x=1709808764;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8GGeXOVNPdAPA4se2KMZEzZWeXw8zxBtmfQj54e1x2U=;
 b=iXsNSkNgtuqiYy8oL0iMidVGtERsrCk3SBGW4Sp8RAuXdT68mvhZg0+M
 XTTzVQqbZjLgrbkgPJazZCEtvuBOob41QkbQdnAnwLNCfJpgFRDPpXzuA
 Ucl/IisapD3rb/AU61Nw0Rkf4ScxBowRuvhCNQxVOIGbt0N97StmDv+qG
 9CBVWPAUXQm1BhS2znQ15r8v04R9SOY1NVuFSKohI5SliVO33WSm+2/B/
 pvEza3xNnrXoW5bf5wvWl3kBtOhQss01hVXWWGkiZ5xsIGYt3bvBT4gu8
 Xid+36X1/pojeMalQAy+QCBVfJCopyp5rGDyDIgfcg5Ny3Nf2qihOXHxN Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="334837709"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="334837709"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 02:52:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="679296486"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="679296486"
Received: from dodonogh-mobl.ger.corp.intel.com (HELO [10.213.219.205])
 ([10.213.219.205])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 02:52:43 -0800
Message-ID: <70e694cd-45d0-7b98-b0d2-eebb15283239@linux.intel.com>
Date: Wed, 8 Mar 2023 10:52:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] drm/i915/pmu: Use correct requested freq for SLPC
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230304012705.70003-1-ashutosh.dixit@intel.com>
 <20230304012705.70003-3-ashutosh.dixit@intel.com>
 <6c005534-9919-aad7-eb6c-fba0c8e12448@linux.intel.com>
 <87ilfbn6s0.wl-ashutosh.dixit@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <87ilfbn6s0.wl-ashutosh.dixit@intel.com>
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 08/03/2023 05:36, Dixit, Ashutosh wrote:
> On Mon, 06 Mar 2023 03:10:24 -0800, Tvrtko Ursulin wrote:
>>
> 
> Hi Tvrtko,
> 
>> On 04/03/2023 01:27, Ashutosh Dixit wrote:
>>> SLPC does not use 'struct intel_rps'. Use UNSLICE_RATIO bits from
>>
>> Would it be more accurate to say 'SLPC does not use rps->cur_freq' rather
>> than it not using struct intel_rps?
> 
> No actually SLPC maintains a separate 'struct intel_guc_slpc' and does not
> use 'struct intel_rps' at all so all of 'struct intel_rps' is 0.

I keep forgetting how there is zero code / data sharing with all this.. :(

>> Fixes: / stable ? CI chances of catching this?
> 
> Same issue as Patch 1, I have answered this there.

Okay lets see it clarified there.

Regards,

Tvrtko
