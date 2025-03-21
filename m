Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAAFA6C0CF
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 18:05:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1FD10E177;
	Fri, 21 Mar 2025 17:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mXmQzyVV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3569510E186;
 Fri, 21 Mar 2025 17:05:22 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-223f4c06e9fso38303655ad.1; 
 Fri, 21 Mar 2025 10:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742576722; x=1743181522; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qFJmlO/iB6/7i2e30laD/4rk/wX+i4QVOj1nk+xkAog=;
 b=mXmQzyVVVeQVS/CuXwEuW4/ooiUKdTbhHG1MMRsWslLRNxHfpGZ28ofvUIsuvN0k0u
 91yGkN/AO1P/pxFWKBidCl8mxyuWjS6KkjfYY1BG8Wf5b2/iTscsCh1KQ4pz3wSTFTsW
 d+qDL6rcoWyosQy+S7AR5zUYau1NPqs3nMSQbavsfFMKlBqqa7yKJxn+J5VQG4aAaV+7
 Xh/VMTKqDRnglprtdt8eLFiwAI9IbAcMHRIQvwbuMMp1/qI2rDhedHsJS5lxsx20qflF
 1vU4l/NaVTIRFePmLpyxtWK4W/47j5Ytts7kVsVNzQClOULkpSjOxi0Jcx9YDmzzeWeC
 oDZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742576722; x=1743181522;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qFJmlO/iB6/7i2e30laD/4rk/wX+i4QVOj1nk+xkAog=;
 b=p76VDhLnM1n3T21vEzS+X0EK8Ce9gPotxWWfnuNxJgZV+/eLMaJsw/wBTAKnSh5Qgt
 aU28/kbU4uWF21jl+1w/UHrF3EaKuTM1cymmZ/sijYWCuYcEIajr9aAX8nKsV7Wc3rC/
 zy9YBGEJAKGdYCIuRu60eDFdi0Bh0DCVfilvoZCxgcXYlVLnPMhX5gI00h6weiMa2Wvc
 vSLcMNc51irhjmSj19ol/pc9I0PxhRIEQyBHTD+NK7epUkjj+bK/DIoFa6OKerUx1+8Q
 j+lmsDgmGs64TSIduzeHRFSLa/x9rAFG/C1h8WmrQB/g0ICI64evvNx2no5NCc+f3usg
 FMpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2QFSAuHx/r5uQuTXzM52DMmocmJ9u5aMeMYaV1XNKEBMRYq/v7/vJf+h/1X2FCIGyAnaDEja162gD@lists.freedesktop.org,
 AJvYcCWP2QoSIn1VFuiJypAJ/KXb6Sw6gNc1FP8aRmwiW/HOugS9RMZi6AtbyHHl4n0geE+AV9NMIvdgtS8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyELnmEMkogGZr35c0LQftD9/iMwkYud6YJJaqjE3CyEMPOcxot
 PYkYG+9SzhRvumyChM/BDgQzBnfOkjSV8sQrF85lrR9DYZ6e1/Vk
X-Gm-Gg: ASbGnctc/C60k7q9NlGVsnGKxwItxNDp4sFC4JwKLGBmbhTveRiuDgyGQXU+8AooDBP
 7+3brbVUiYR0GHcVMIole3DHljgODO6u518oh6aN2h4ws1qBUjtV2p4AzW+OcMVc1YO43d+Kk6f
 DRFxFj3bHz8BuzzDA1HGo45EJtTsdxsr0IJDA5qO0kbgisPkqEt7gKK8dmO89WeLwAdww3oya9L
 Ww6Nkv/8fEIOSWNWbU4JMtpEOP/f3nG+e8yw5qVFkv2CUhYOTf+XQijTiNh+E099kr4Y9AX8oh+
 4+ei5kwSeBBUEV9A+vbp9GSGEIRzST2NvdRp2AXjb+5w
X-Google-Smtp-Source: AGHT+IH7UrSBOupRRVjrb3wtNzf50EusSmn8NacmvaKZuKRlw8NkIWXeCKo1ec3bmF+7vhQTLnjYjQ==
X-Received: by 2002:a17:902:f684:b0:215:58be:3349 with SMTP id
 d9443c01a7336-227806d072amr73177805ad.14.1742576721585; 
 Fri, 21 Mar 2025 10:05:21 -0700 (PDT)
Received: from localhost ([216.228.125.130]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22780f3bbedsm19697085ad.3.2025.03.21.10.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Mar 2025 10:05:20 -0700 (PDT)
Date: Fri, 21 Mar 2025 13:05:18 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
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
Subject: Re: [PATCH v4 3/8] bits: introduce fixed-type genmasks
Message-ID: <Z92cThxAyXu9JJdk@thinkpad>
References: <20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr>
 <20250305-fixed-type-genmasks-v4-3-1873dcdf6723@wanadoo.fr>
 <Z8hsRJvpjYoqh9RG@thinkpad> <Z9oiEkQEcHhA0a80@thinkpad>
 <5cbaefa8-e51f-415f-a9b3-4841e69bb3fa@arm.com>
 <1aba17f1-0cd2-429c-8338-28387ec16314@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1aba17f1-0cd2-429c-8338-28387ec16314@arm.com>
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

On Wed, Mar 19, 2025 at 09:43:06AM +0530, Anshuman Khandual wrote:
> 
> 
> On 3/19/25 09:04, Anshuman Khandual wrote:
> > On 3/19/25 07:16, Yury Norov wrote:
> >> + Catalin Marinas, ARM maillist
> >>
> >> Hi Catalin and everyone,
> > 
> > Hello Yury,
> > 
> >>
> >> Anshuman Khandual asked me to merge GENMASK_U128() saying it's
> >> important for ARM to stabilize API. While it's a dead code, I
> >> accepted his patch as he promised to add users shortly.
> >>
> >> Now it's more than half a year since that. There's no users,
> >> and no feedback from Anshuman.
> > 
> > My apologies to have missed your email earlier. Please find response
> > for the earlier email below as well.
> > 
> >>
> >> Can you please tell if you still need the macro? I don't want to
> >> undercut your development, but if you don't need 128-bit genmasks
> >> there's no reason to have a dead code in the uapi.
> > 
> > The code base specifically using GENMASK_U128() has not been posted
> > upstream (probably in next couple of months or so) till now, except
> > the following patch which has been not been merged and still under
> > review and development.
> > 
> > https://lore.kernel.org/lkml/20240801054436.612024-1-anshuman.khandual@arm.com/
> > 
> >>
> >> Thanks,
> >> Yury
> >>
> >> On Wed, Mar 05, 2025 at 10:22:47AM -0500, Yury Norov wrote:
> >>> + Anshuman Khandual <anshuman.khandual@arm.com>
> >>>
> >>> Anshuman,
> >>>
> >>> I merged your GENMASK_U128() because you said it's important for your
> >>> projects, and that it will get used in the kernel soon.
> >>>
> >>> Now it's in the kernel for more than 6 month, but no users were added.
> >>> Can you clarify if you still need it, and if so why it's not used?
> > 
> > We would need it but although the code using GENMASK_U128() has not been
> > posted upstream.
> > 
> >>>
> >>> As you see, people add another fixed-types GENMASK() macros, and their
> >>> implementation differ from GENMASK_U128().
> > 
> > I will take a look. Is GENMASK_U128() being problematic for the this new
> > scheme ?
> > 
> >>>
> >>> My second concern is that __GENMASK_U128() is declared in uapi, while
> >>> the general understanding for other fixed-type genmasks is that they
> >>> are not exported to users. Do you need this macro to be exported to
> >>> userspace? Can you show how and where it is used there?
> > 
> > No, not atleast right now.

Ok, thanks.

> > These were moved into uapi subsequently via the following commit.
> > 
> > 21a3a3d015aee ("tools headers: Synchronize {uapi/}linux/bits.h with the kernel sources")
> > 
> > But in general GENMASK_U128() is needed for generating 128 bit page table
> > entries, related flags and masks whether in kernel or in user space for
> > writing kernel test cases etc.
> 
> In the commit 947697c6f0f7 ("uapi: Define GENMASK_U128"), GENMASK_U128() gets defined
> using __GENMASK_U128() which in turn calls __BIT128() - both of which are defined in
> UAPI headers inside (include/uapi/linux/). 
> 
> Just wondering - are you suggesting to move these helpers from include/uapi/linux/ to
> include/linux/bits.h instead ?

Vincent is working on fixed-width GENMASK_Uxx() based on GENMASK_TYPE().

https://lore.kernel.org/lkml/20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr/T/

The series adds a general GENMASK_TYPE() in the linux/bits.h. I'd like
all fixed-widh genmasks to be based on it. The implementation doesn't
allow to move GENMASK_TYPE() the to uapi easily.

There was a discussion regarding that, and for now the general understanding
is that userspace doesn't need GENMASK_Uxx().

Are your proposed tests based on the in-kernel tools/ ? If so, linux/bits.h
will be available for you.

Vincent,

Can you please experiment with moving GENMASK_U128() to linux/bits.h
and switching it to GENMASK_TYPE()-based implementation?

If it works, we can do it after merging of GENMASK_TYPE() and
ancestors.

Thanks,
Yury
