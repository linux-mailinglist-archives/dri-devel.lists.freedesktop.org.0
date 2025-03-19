Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B2AA68DB9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 14:25:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A93E810E261;
	Wed, 19 Mar 2025 13:25:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BCT4meaz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3688010E2FD;
 Wed, 19 Mar 2025 13:24:59 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-22359001f1aso21307715ad.3; 
 Wed, 19 Mar 2025 06:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742390699; x=1742995499; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xZFRLY0XAdp76L6s++8PUE6jOftbFDqTl8mKmLB0uG4=;
 b=BCT4meazTCEzAOv45EavyGKJA+eBjrbRJeufC9TygFuxejPf+G+oAUep/MtHEaeLHL
 1SUwInUUiEEwwvnNUsf32I70FF6/q31epr0C01R3+ET0Hv/qSnooGp8r38hUUKovdMb6
 jn2mxu+SOqlp+9+Mzu+e16NPQ8vkjsK6AIDgKPpSIC0TuQQ8GPhg5z7bHR0c2guu1adl
 D5wa/yrT99kSved4YRnQQOM7Y4OaxKGPNjhMpf4ER0ST718hkwmblWsMvT1dS4FigdCR
 aw1h0yvIdHNqGUYl+Oboha/WjsJZdygSK0Pw2jxamGkKuz3Re1nE7qPHOQhPspMLmwwy
 mxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742390699; x=1742995499;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xZFRLY0XAdp76L6s++8PUE6jOftbFDqTl8mKmLB0uG4=;
 b=mSj6DHJJeSK3INhNNCsk/zMZApF3M6BywmPauGgJN0TyWK7EuYNaAMYNQ9gUtlViby
 4nruy8z9UoiCASGLDbovooh1PoyNCsAvsEu+sRLQpynDKCRC+ouPVPPyjaD6LZCqyhRp
 wR1m/srQcJZEd19xqMIwNJHdb8DGpHSxO3PDiZ16zl+yEbzk01OnpFJJBf4RjTcjlzat
 N7O4GLB4rAgfl09uOLJnlWqpO55ybAUlOQVeXtx8PeWwTPvmDmZOZAXtHDZJgfgVBPTl
 96YcI2XFTnShp4KSU2nylLMSVNLrE/P7IRbOzWfRSNwtRmp+nUAE40hGu2IAlXWF7m1D
 bQZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2YxoXcPuOI7e4iQQxor0H0lOo9Y3WmQTXvPXA2INDHOCCs9D35Sos5i883Oft9Yo2zbggEdVVzSq1@lists.freedesktop.org,
 AJvYcCWgE/815ut8m5PcTLVMcjUKzWhTHuO0q9xG+HhDE2tpj8rMHrBg8ilxYUXggcrjVJtUwPVVCQ1Fkv0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPK/73MLuY9/VcUaJPohLtrNmh7uE6md9ifXGsmsbxsJM0+8Wb
 ktqUBmAcl2dkegyRmCLgR25E9L9LVn9PJoPf38xnGxYm+t3RwByv
X-Gm-Gg: ASbGncu8ckpPH9YznlqiwaT10sO5N6Z9MCzCVkOj3Gb4vZwN96lq5gkoljRHp8rosYA
 HnnMp9U7cqj4LotVcHHtgokhp/ly9wA2xfVfKqww/ACelz2oKYCTCv4IEmhXlu8P7HyeiCBYQVF
 GqfaHX2NhG27bZ3fnGYFnqUveTIrNfLokge75Wl94HkCBEfkIN1fzqltHnbpA1KTKm/UUA5tmln
 kouZdwpcBNTugRYc1O0TRwN1qR3mNORlckbNs3n5Dmsr1MRHQvT9zhY4bmqE21lW/lP65WKOGPk
 kioZt2r5T01AN/emxWlvFRGFsQQYO7fcL/JvN+7802YGQ2UKDqQcKc8zuRl9bX/B5upM
X-Google-Smtp-Source: AGHT+IGIFYmDi/KkGln7MKeowoPAzVmI+wsa7nArP8Kx5Xywx6QFPsEGFX/fF3zen40trjIEXgl4DQ==
X-Received: by 2002:a17:902:f548:b0:21f:b483:2ad5 with SMTP id
 d9443c01a7336-2264993273bmr33537815ad.20.1742390698627; 
 Wed, 19 Mar 2025 06:24:58 -0700 (PDT)
Received: from localhost (maglev-oncall.nvidia.com. [216.228.125.128])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-737115292cbsm11533634b3a.1.2025.03.19.06.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 06:24:57 -0700 (PDT)
Date: Wed, 19 Mar 2025 09:24:56 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 David Laight <David.Laight@aculab.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v6 2/7] bits: introduce fixed-type genmasks
Message-ID: <Z9rFqBIWgF1FuM98@thinkpad>
References: <20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr>
 <20250308-fixed-type-genmasks-v6-2-f59315e73c29@wanadoo.fr>
 <Z9mjJ3gJoqLwjIFX@thinkpad>
 <443027f0-08c9-449a-8ee0-db9b234483f4@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <443027f0-08c9-449a-8ee0-db9b234483f4@wanadoo.fr>
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

On Wed, Mar 19, 2025 at 02:39:03PM +0900, Vincent Mailhol wrote:
> On 19/03/2025 at 01:45, Yury Norov wrote:
> > On Sat, Mar 08, 2025 at 01:48:49AM +0900, Vincent Mailhol via B4 Relay wrote:
> >> From: Yury Norov <yury.norov@gmail.com>
> 
> (...)
> 
> >> +#define GENMASK(h, l)		GENMASK_TYPE(unsigned long,  h, l)
> >> +#define GENMASK_ULL(h, l)	GENMASK_TYPE(unsigned long long, h, l)
> > 
> > I like everything except this part. We switch GENMASK() from a well
> > tested implementation, including an asm code, and we split uapi and
> > non-uapi users, with no functionality changes.
> > 
> > Unification is a solid point, however.
> > 
> > Let's make it a 2-step procedure? Adding fixed-width GENMASKs is a
> > non-questionable improvement. Switching an existing API from one
> > implementation to another should be a separate patch, and probably
> > even a separate series. And we should be very clear that __GENMASK()
> > is uapi-only thing from now.
> > 
> > If we decide to switch GENMASK() in a separate series, we'll have some
> > extra time to think about unification...
> 
> Ack. I started drafting the split. The two series would look like:
> 
> [Series #1] bits: Fixed-type GENMASK_U*() and BIT_U*()
>     - bits: introduce fixed-type GENMASK_U*()
>     - bits: introduce fixed-type BIT_U*()
>     - drm/i915: Convert REG_GENMASK*() to fixed-width GENMASK_U*()
>     - test_bits: add tests for GENMASK_U*()
>     - test_bits: add tests for BIT_U*()
> 
> [Series #2] bits: Split asm and non-asm GENMASK*() and unify definitions
>     - bits: split the definition of the asm and non-asm GENMASK*()
>     - bits: unify the non-asm GENMASK*()
>     - test_bits: add tests for __GENMASK() and __GENMASK_ULL()
> 
> 
> Series #1 will leave GENMASK(), GENMASK_ULL() and GENMASK_128()
> untouched. The final result after the Series #2 will be the exact same
> code as of now.
> 
> I am thinking of sending the two series at the same time, and then, you
> can decide what is the good timing to merge these (and eventually, start
> a separate discussion on the second series).
> 
> Does this work for you?

Yes.

> On a side note, it did a lot of modifications to your original patch
> which introduced the GENMASK_U*(). It is OK to tag myself as author and
> you as co-author or do you still prefer to stay as the main author? Let
> me know!

Yes, I'm OK.
