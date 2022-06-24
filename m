Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BCE55957E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 10:34:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A011C10F695;
	Fri, 24 Jun 2022 08:34:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD41F10FC50;
 Fri, 24 Jun 2022 08:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656059666; x=1687595666;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GL7gNHkZqM1sWdOok001Mz0b5ZGecYzNGjnRUb23NBQ=;
 b=WuBGWNCyBYKwCdVT3AWZOGl2wphgyNXiCkeW21lfuLPfaerAVr+mBCQK
 siLJBBKUy7zObDq3zEYns135BVU3sarQQgx2QLE3mLY2jfpoGZ/Y/Y1aA
 MDsCYhzXg2vzm690EYIV7pWNWHmywnABwd9OLdQ0sMbadz2dQiCT6oYND
 k4s7RUxGI2R3++9DwWVCcSHWzOhaNOQM+lXbanAyQ6evjGCBB9GQyGOY9
 JGBsvKmr6QOEDjKy7KJyLqEipAeXh532bNU6zXL1s96dNmSQNBl2phqNV
 9boqw7VlWat083JbcFg9eqPyOPNCQgWN1qr+OOXcpFmyq4rYqdfN1ax6H A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10387"; a="279720883"
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; d="scan'208";a="279720883"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2022 01:34:26 -0700
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; d="scan'208";a="915596863"
Received: from acamigob-mobl.amr.corp.intel.com (HELO [10.212.103.132])
 ([10.212.103.132])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2022 01:34:22 -0700
Message-ID: <160e613f-a0a8-18ff-5d4b-249d4280caa8@linux.intel.com>
Date: Fri, 24 Jun 2022 09:34:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 5/6] drm/i915/gt: Serialize GRDOM access between multiple
 engine resets
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cover.1655306128.git.mchehab@kernel.org>
 <5ee647f243a774927ec328bfca8212abc4957909.1655306128.git.mchehab@kernel.org>
 <YrRLyg1IJoZpVGfg@intel.intel>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <YrRLyg1IJoZpVGfg@intel.intel>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Fei Yang <fei.yang@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>, Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, mauro.chehab@linux.intel.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Bruce Chang <yu.bruce.chang@intel.com>,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 23/06/2022 12:17, Andi Shyti wrote:
> Hi Mauro,
> 
> On Wed, Jun 15, 2022 at 04:27:39PM +0100, Mauro Carvalho Chehab wrote:
>> From: Chris Wilson <chris.p.wilson@intel.com>
>>
>> Don't allow two engines to be reset in parallel, as they would both
>> try to select a reset bit (and send requests to common registers)
>> and wait on that register, at the same time. Serialize control of
>> the reset requests/acks using the uncore->lock, which will also ensure
>> that no other GT state changes at the same time as the actual reset.
>>
>> Fixes: 7938d61591d3 ("drm/i915: Flush TLBs before releasing backing store")
>>
>> Reported-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
>> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>> Cc: Andi Shyti <andi.shyti@intel.com>
>> Cc: stable@vger.kernel.org
>> Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Notice I had a bunch of questions and asks in this series so please do 
not merge until those are addressed.

In this particular patch (and some others) for instance Fixes: tag, at 
least against that sha, shouldn't be there.

Regards,

Tvrtko
