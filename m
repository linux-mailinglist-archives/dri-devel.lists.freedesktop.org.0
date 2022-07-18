Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB245786F3
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 18:06:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD50810ED78;
	Mon, 18 Jul 2022 16:06:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3513A112E06;
 Mon, 18 Jul 2022 16:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658160397; x=1689696397;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BGMaJTElQp6haGmkH8rT8RsSQevkIPle8322hFlFuJg=;
 b=OEPZJgO5+2GDbJQGXu5mqlZ4TRhmozuZGuDTWxDvbw4y9RNtJQCFQAfn
 5JGq50EjDaVqGaiq2GMSVx362YcCfFT8fuyXBmwdUdMN2RYn8W0KodrJW
 9hn8CRN0TEKvN1ETRVy/5BQNMNSRoorU4oHdYLlU0+zmDBRS7h/eXYHDl
 Sxy2xBRTKhP4dPwXQtMTniwgbpWXf1L+ofPSVEQCaj4Bak+ExHzhqMVXE
 RvbjdqL7YQ3byeHLM5Kj6D7h5cOk20EJEYiRgK++uDkgy7CybxZaZ0i4A
 vxpGCkKrN9FOWEFyZLKbES6YJiYkSWwEDGLzuV604E+OqERIA63q4ld+t g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="266664159"
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; d="scan'208";a="266664159"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 09:06:36 -0700
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; d="scan'208";a="655347466"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO maurocar-mobl2)
 ([10.249.35.85])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 09:06:33 -0700
Date: Mon, 18 Jul 2022 18:06:30 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 05/21] drm/i915/gt: Skip TLB
 invalidations once wedged
Message-ID: <20220718180630.7bef2fd9@maurocar-mobl2>
In-Reply-To: <d51882e0-6864-7a49-ae16-f7213dc716c4@linux.intel.com>
References: <cover.1657800199.git.mchehab@kernel.org>
 <f20bd21c94610dae59824b8040e5a9400de6f963.1657800199.git.mchehab@kernel.org>
 <d51882e0-6864-7a49-ae16-f7213dc716c4@linux.intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Thomas =?UTF-8?B?SGVsbHN0?= =?UTF-8?B?csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dave Airlie <airlied@redhat.com>, stable@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 18 Jul 2022 14:45:22 +0100
Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:

> On 14/07/2022 13:06, Mauro Carvalho Chehab wrote:
> > From: Chris Wilson <chris.p.wilson@intel.com>
> > 
> > Skip all further TLB invalidations once the device is wedged and
> > had been reset, as, on such cases, it can no longer process instructions
> > on the GPU and the user no longer has access to the TLB's in each engine.
> > 
> > That helps to reduce the performance regression introduced by TLB
> > invalidate logic.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 7938d61591d3 ("drm/i915: Flush TLBs before releasing backing store")  
> 
> Is the claim of a performance regression this solved based on a wedged 
> GPU which does not work any more to the extend where mmio tlb 
> invalidation requests keep timing out? If so please clarify in the 
> commit text and then it looks good to me. Even if it is IMO a very 
> borderline situation to declare something a fix.

Indeed this helps on a borderline situation: if GT is wedged, TLB 
invalidation will timeout, so it makes sense to keep the patch with a
comment like:

    drm/i915/gt: Skip TLB invalidations once wedged
    
    Skip all further TLB invalidations once the device is wedged and
    had been reset, as, on such cases, it can no longer process instructions
    on the GPU and the user no longer has access to the TLB's in each engine.
    
    So, an attempt to do a TLB cache invalidation will produce a timeout.
    
    That helps to reduce the performance regression introduced by TLB
    invalidate logic.

Regards,
Mauro
