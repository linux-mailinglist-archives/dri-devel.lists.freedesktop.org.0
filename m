Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A896E100C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 16:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFDB710E36A;
	Thu, 13 Apr 2023 14:34:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8597310E36A;
 Thu, 13 Apr 2023 14:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681396481; x=1712932481;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qNXt4Zm3TNW/aZ9bUxcnbpefCgeqe6kpqeibexQ9YSo=;
 b=RiTgPInZJHBdBDH7iAFlHL7EggquhhGtL48zF2GoZ3IVlqYC2JbJ3pHN
 3OHstQbMTm1nEHgXEoGXinQGKOsQ7Bt7AvVF3lsMBTlvuAOe+xKNTlqic
 MYHEL5NAqpF7b2HoWdSL11zJyc3GZRpaZwLUB0jxRpAknk0D1INULN+hO
 cHZff3w9f03DKZyRUvDehHPzVWqveYDCUsrGXniMC8aGCUGl42eNQadqZ
 vRtEpWFK5OnN0EX2oX6jlMWCWayqjRIqK21yy6L7Yj07BfgpX/DTmOKdW
 AHFnr1UanY7Dhk0cKvZlhrVkTGvFPcVhiAKEZmGKfOXJbZIxdw90bclgr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="346009791"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="346009791"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 07:16:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="1019198622"
X-IronPort-AV: E=Sophos;i="5.99,193,1677571200"; d="scan'208";a="1019198622"
Received: from mmcgar2x-mobl1.ger.corp.intel.com (HELO [10.213.231.135])
 ([10.213.231.135])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 07:16:36 -0700
Message-ID: <bad5e5b2-5bc4-09cb-6fa1-c227b42d7e5c@linux.intel.com>
Date: Thu, 13 Apr 2023 15:16:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: Make IRQ reset and postinstall
 multi-gt aware
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230413092006.931861-1-andi.shyti@linux.intel.com>
 <dc0042e0-8a4e-5c3d-922f-bd65402a154a@linux.intel.com>
 <ZDgKBUIV9nGcfQqF@ashyti-mobl2.lan>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZDgKBUIV9nGcfQqF@ashyti-mobl2.lan>
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
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@kernel.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 13/04/2023 14:56, Andi Shyti wrote:
> Hi Tvrtko,
> 
> (I forgot to CC Daniele)
> 
> On Thu, Apr 13, 2023 at 11:41:28AM +0100, Tvrtko Ursulin wrote:
>>
>> On 13/04/2023 10:20, Andi Shyti wrote:
>>> From: Paulo Zanoni <paulo.r.zanoni@intel.com>
>>>
>>> In multitile systems IRQ need to be reset and enabled per GT.
>>>
>>> Although in MTL the GUnit misc interrupts register set are
>>> available only in GT-0, we need to loop through all the GT's
>>> in order to initialize the media engine which lies on a different
>>> GT.
>>>
>>> Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>> ---
>>> Hi,
>>>
>>> proposing again this patch, apparently GuC needs this patch to
>>> initialize the media GT.
>>
>> What is the resolution for Matt's concern that this is wrong for MTL?
> 
> There are two explanations, one easy and one less easy.
> 
> The easy one: without this patch i915 doesn't boot on MTL!(*)
> 
> The second explanation is that in MTL the media engine has it's
> own set of misc irq's registers and those are on a different GT
> (Daniele pointed this out).
> 
> I sent this patch not to bypass any review, but to restart the
> discussion as this patch was just dropped.

I see. It does not sound too challenging to handle with a little bit of 
refactoring. Move writes engine registers to a helper and add a MTL 
specific reset/postinstall? Then MTL can do the engine ones outside the 
for_each_gt loop and the replicated ones under it. Give or take, I did 
not look into the details.

Regards,

Tvrtko
