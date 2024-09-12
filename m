Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E186C9769FA
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 15:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD4C10EAAB;
	Thu, 12 Sep 2024 13:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hx28dttP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8F510E96B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 13:05:49 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5356ab89665so1067000e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 06:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726146348; x=1726751148; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PFy83Xo4HRlT4VMw6aQLtndBYeuj205BcBDL+FukQos=;
 b=hx28dttPFHILrMAGorqGE+/Wi86Lw3acl1TJqmiK+SOyGFSrvXegFsFM28wg8y9sda
 yOn4jN2kz9wSWHbbOi7IIO9FB3HKvNvn6KRhnPoxY/VVthRFsA/jA7gfhFnwiyv9qbbj
 rlt1uQEcUlxtyRpRcH1ut8daNEpUYqO00gSt88/B6vnioNBCsqgHZJzdHTkedaJG6VJl
 g7RHpM2LT9EI7LZ5b3k5tN2tzUz0tgBSwSFSsVM8x8JpqGhgLvaO47ynweUdxN4xCWkh
 8iUbWuQMPybG4BMef07NFU5IetKjEKI0jKs3ZLCpxpmC6ewVGG6ZYfm9cV5wecUbIs7Y
 9+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726146348; x=1726751148;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PFy83Xo4HRlT4VMw6aQLtndBYeuj205BcBDL+FukQos=;
 b=rJOmOfndqeSpBDT8ZQFczGOqAe8lvxmCetbRrdcYPyWHMUieJ9zqpyV+7Ijfud7b2t
 5g0xKWAeXstspZrNiNYkUmexUG2QzULS+JyDsUDF1fYDntb2Cy/FbkrfwMG/7OPzYUT0
 8LGHEKypCX5gZazk4aWJ94arMf9FICOG8GiS+5qpYmPcv1pMR3MoXBTUQWwZDdtMfzCI
 a1fyoCE88BlFeN0Fy+1I2aG6Xe8Yat8qzCdLGbdnQYYJfRE3BRQszCncDrIpMxP3NWtR
 L7x9aUA4OIkAHRy/AT0cfXn2eBxEIhQozezH9ivJD9H8yrpy3ryREOoOAm3f16YpO3iE
 sSEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+GlsxJgXtpkCIpSo7lx2NFY+m53o9ou/BuAgFS1urvNx47gVGIzQU11Sxar7vnpykKeZ6pZ2s2Dc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxirsJ1xynCP/3ukucTBpw5JbHITYn2FHo62nLcCUFctRrJNeql
 R2hZVsEvzD8kMGkkGST3L9ryVFHyBgj59RZ+SdUZcz1peAkZcveL/GHWgyg2eJk=
X-Google-Smtp-Source: AGHT+IG9ZSiURirjUXz2mT5qhibORJ4JRGAIyTsfUR/UAuymDe2P71ZfmKMRfdgOKZSIFaKeDErLAQ==
X-Received: by 2002:a05:6512:3990:b0:533:3223:df91 with SMTP id
 2adb3069b0e04-53678fbab40mr1562276e87.24.1726146346365; 
 Thu, 12 Sep 2024 06:05:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f903bebsm1882080e87.204.2024.09.12.06.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 06:05:45 -0700 (PDT)
Date: Thu, 12 Sep 2024 16:05:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Jani Nikula <jani.nikula@intel.com>, Arnaud Vrac <avrac@freebox.fr>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, 
 Nathan Chancellor <nathan@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 7/8] drm/msmi: annotate pll_cmp_to_fdata() with
 __maybe_unused
Message-ID: <ki27iun7ar6nmwpkzykwjvkrn5jpadirbz6fy2c25akh2sbgpj@etbg4uo3hixr>
References: <cover.1725962479.git.jani.nikula@intel.com>
 <3553b1db35665e6ff08592e35eb438a574d1ad65.1725962479.git.jani.nikula@intel.com>
 <4ag2efwiizn5bnskauekqwfhgl4gioafcvetpvsmbdgg37bdja@3g6tt4rlfwcb>
 <19ac4e25-7609-4d92-8687-585c6ea00c79@freebox.fr>
 <878qvyjxpg.fsf@intel.com>
 <9028f858-8c6d-4292-a6aa-27eedff3ac8b@freebox.fr>
 <87ed5pgm2i.fsf@intel.com>
 <c2ed3380-82c3-43a3-9c01-534b08333f95@freebox.fr>
 <uosenmxvixug7yfakpbynbltryvvxqc2hxtagby362c2lvps22@kce4vsbi7xql>
 <535df4a8-2d4b-4c52-851d-b4306a28b07f@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <535df4a8-2d4b-4c52-851d-b4306a28b07f@freebox.fr>
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

On Thu, Sep 12, 2024 at 02:50:04PM GMT, Marc Gonzalez wrote:
> On 12/09/2024 14:28, Dmitry Baryshkov wrote:
> > On Thu, Sep 12, 2024 at 02:14:10PM GMT, Marc Gonzalez wrote:
> >> On 12/09/2024 13:15, Jani Nikula wrote:
> >>> On Thu, 12 Sep 2024, Marc Gonzalez wrote:
> >>>> On 11/09/2024 12:23, Jani Nikula wrote:
> >>>>> On Tue, 10 Sep 2024, Marc Gonzalez wrote:
> >>>>>> On 10/09/2024 16:51, Dmitry Baryshkov wrote:
> >>>>>>> On Tue, Sep 10, 2024 at 01:03:43PM GMT, Jani Nikula wrote:
> >>>>>>>> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> >>>>>>>> inline functions for W=1 build").
> >>>
> >>> [snip]
> >>>
> >>>>> GCC doesn't catch unused static inlines, while Clang does.
> >>>>
> >>>> It makes no sense to me that adding "inline" would prevent
> >>>> GCC from diagnosing the issue... GCC should simply ignore
> >>>> the "inline" keyword when definition is not in a header file
> >>>> (maybe they don't store "origin").
> >>>
> >>> Please just read the commit message for the commit I reference above for
> >>> details. There's not much more I could say about it.
> >>
> >> OK, I read 6863f5643dd7.
> >>
> >> My remark still stands.
> >>
> >> GCC's decision to not warn for unused static inline functions
> >> in source files (not headers) is questionable at best.
> > 
> > What's the difference between source file and a header after the CPP
> > run?
> 
> That question is moot, since the source file / header file
> convention exists only _before_ the preprocessor runs.
> 
> If you meant to ask
> "How is the implementation supposed to track the origin",
> then I would hand wave and say "internal annotations".

No, I asked what I meant. #include doesn't have any semantics. You can
#include "source.c" in the same way. So asking the compiler to make a
difference between source file and the header isn't going to work (Note,
gcc has some notion of system header files and I think a pragma that
changes the behaviour a bit, but we are not talking about such cases,
are we?).

-- 
With best wishes
Dmitry
