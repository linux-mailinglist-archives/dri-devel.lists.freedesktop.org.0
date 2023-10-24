Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CF27D59E0
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 19:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A921810E449;
	Tue, 24 Oct 2023 17:42:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF7710E447;
 Tue, 24 Oct 2023 17:42:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 93668B827D3;
 Tue, 24 Oct 2023 17:41:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 306E8C433C8;
 Tue, 24 Oct 2023 17:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698169318;
 bh=TTksDceA+wO0GuVnCGF4HeG429ffyHr6vIFC99gELqo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kole9idDyEzsBcVajRjH1HVLnr/wnud0s0YxQCybAGeygnTutgBzTIMy0OuiSvaiK
 FbTxTnHY+bNlvyoALqlF2Yu0jtADBLv3k7LLYpuEegPKbxpeN9J8Hbm4E5TvKPJ4Pc
 9bvwII1J2QQM2QX6brHuCxqwz0zskj/Dq6Oo7V0vOPOGkAIB/+5Mwugwg1uzoTlB2b
 /X/p0Re7GXFBzcNPZSIGCv/KTK9gKj43ua97Jv6TamormI91WSX3nYL4xYxGh94379
 XI+5lKMBAFwGU2qzI018uhOdQDyKXwwWgeTQYjeA0bHvbZSBdEbiTQ/tSmcOEOKEuR
 /IZtV4r7AIVJw==
Date: Tue, 24 Oct 2023 19:41:53 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/i915/mtl: avoid stringop-overflow warning
Message-ID: <20231024174153.byeq7ctssvxuwa4z@zenone.zhora.eu>
References: <20231016201012.1022812-1-arnd@kernel.org>
 <87edhlbj16.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87edhlbj16.fsf@intel.com>
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
Cc: Arnd Bergmann <arnd@kernel.org>, Badal Nilawar <badal.nilawar@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

> >  static void rc6_res_reg_init(struct intel_rc6 *rc6)
> >  {
> > -	memset(rc6->res_reg, INVALID_MMIO_REG.reg, sizeof(rc6->res_reg));
> 
> That's just bollocks. memset() is byte granularity, while
> INVALID_MMIO_REG.reg is u32. If the value was anything other than 0,
> this would break.

Actually it's:

   void *memset(void *s, int c, size_t count)

> And you're not supposed to look at the guts of i915_reg_t to begin with,
> that's why it's a typedef. Basically any code that accesses the members
> of i915_reg_t outside of its implementation are doing it wrong.
> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

in any case, I agree with your argument, but why can't we simply
do:

   memset(rc6->res_reg, 0, sizeof(rc6->res_reg));

?

The patch looks to me like it's being more complex that it
should.

Andi
