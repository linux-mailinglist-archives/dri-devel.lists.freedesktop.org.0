Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C6990BD81
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 00:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B74C10E1AF;
	Mon, 17 Jun 2024 22:26:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pKlG+b90";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A505210E1AF
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 22:26:24 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-52c9034860dso6075359e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 15:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718663182; x=1719267982; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=I5gR82bl2Ug4kICksfq0yamduDdpDT78AwxrkSHnNJI=;
 b=pKlG+b90FuIv5qWeZLCdgjMMREKroR9NzEtPtmJ07tlu8Msp6tm4JICDLXPT9/X7cl
 fFWKuR38LVyOhgycJNrlV5ldnI5IEtSEZojbrxIB0AEjK6bmWtubB0QKlFKe6c/rgdGQ
 d9l9Dj3YzER2fZpUKzOdiVFuZJJ8k6PGHpnij5QlZzv0TNJphXmJ/mtb1mGTZqswEKrb
 irE6tQD8/fESlvMo3trvpu7CqB7jXrNSa5ip9IFE8HIshF8ETvbbhCd58zMmpdYSjiHY
 ZYUp9+BN9J7VoFU84+bHRnZhWHnRKTH+1RrOh7drR8NFU9OriNTErGg56W2WP/mpAmZd
 B9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718663182; x=1719267982;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I5gR82bl2Ug4kICksfq0yamduDdpDT78AwxrkSHnNJI=;
 b=TxwJQ7ibjo+CjWnLMwBfFhfpE3ghFoQEbF2rvRFbX5ADNx0oX+og0k5rLCOC2YLzvV
 /+WAi2+qpF2K8nVkqNPOlLvSVFsVn6eUM9I4yRq0yKeEtlRESRFkQGSoJHUa8mC8K01F
 b+G7fm9mH2z69sNRa5KrPaQpr177gP4z5RFL+1IbP/DNuCoKhWTEMYSFSC2WRrfdJ+r8
 obLB9+KTlhxLX84gSBtCLgkFWH+eEpRL/8k4hL60ISrE7+MZzF8WE/zfQ0ItC57DNpMb
 dBVKxZ3QsC4wSebfN6rtbH5ugNqQPXtpo/wq935unOQZ2ls7TznpDo8t31SrVaSv/oKc
 /Qvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhMXkQ1bVZqFZZrK0Rr6ajzdrzKDcELWec95DuFi2mExOirHhVF4GxLohAbvVmWL0Cnplu2chzFvCE/0F8GJjPfcA4cvTaTNaCDjAmd6BN
X-Gm-Message-State: AOJu0YzqdTLtZDkRPoAbb60WSIbCbsVbBdFAH6Vzay8UQ4Uy4AQI0ler
 wfxLQPsB1uhdrYFi43p/Yl393qfpTW7U0GVQYytyvTGVJ1CkWw6i+5zH3t8zGlw=
X-Google-Smtp-Source: AGHT+IE0S9TzJTmn/4Itff9qKnfgos31gAG8PMEgOkt3+SZrjM0TS4f1ZS5scMO4EJyrMtuajq9LDg==
X-Received: by 2002:a05:6512:b9c:b0:52c:aea5:9e09 with SMTP id
 2adb3069b0e04-52caea5a347mr9590015e87.20.1718663182234; 
 Mon, 17 Jun 2024 15:26:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca282de86sm1357045e87.68.2024.06.17.15.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 15:26:21 -0700 (PDT)
Date: Tue, 18 Jun 2024 01:26:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH RESEND] drm/display: Drop obsolete dependency on
 COMPILE_TEST
Message-ID: <jbqbn6zaqq7j5htxuqxb34tjrf5lnqabkh5ywtnklhd4owyc3h@ztvolr6hjrti>
References: <20240617103018.515f0bf1@endymion.delvare>
 <xd2yybtxvzte7gwqwg2vudzvhoekqao2dle6zsuduzjzi3rsay@xhahwof2prph>
 <20240617132348.5f20bf89@endymion.delvare>
 <vsrsvmrkqnmxs3ncqv5m2gevzefiq55tr2iolxlmoehsvgcfkn@hyx37vax6r5e>
 <20240617201814.73a07702@endymion.delvare>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617201814.73a07702@endymion.delvare>
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

On Mon, Jun 17, 2024 at 08:18:14PM GMT, Jean Delvare wrote:
> On Mon, 17 Jun 2024 14:55:22 +0300, Dmitry Baryshkov wrote:
> > On Mon, Jun 17, 2024 at 01:23:48PM GMT, Jean Delvare wrote:
> > > Hi Dmitry,
> > > 
> > > Thanks for your feedback.
> > > 
> > > On Mon, 17 Jun 2024 12:57:19 +0300, Dmitry Baryshkov wrote:  
> > > > On Mon, Jun 17, 2024 at 10:30:30AM GMT, Jean Delvare wrote:  
> > > > > Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), it
> > > > > is possible to test-build any driver which depends on OF on any
> > > > > architecture by explicitly selecting OF. Therefore depending on
> > > > > COMPILE_TEST as an alternative is no longer needed.    
> > > > 
> > > > The goal of this clause is to allow build-testing the driver with OF
> > > > being disabled (meaning that some of OF functions are stubbed and some
> > > > might disappear). I don't see how user-selectable OF provides the same
> > > > result.  
> > > 
> > > Historically, the goal of this clause *was* to allow build-testing the
> > > driver on architectures which did not support OF, and that did make
> > > sense back then. As I understand it, building the driver without OF
> > > support was never a goal per se (if it was, then the driver wouldn't be
> > > set to depend on OF in the first place).
> > > 
> > > Some of my other submissions include the following explanation which
> > > you might find useful (I ended up stripping it on resubmission after
> > > being told I was being too verbose, but maybe it was needed after all):
> > > 
> > > It is actually better to always build such drivers with OF enabled,
> > > so that the test builds are closer to how each driver will actually be
> > > built on its intended target. Building them without OF may not test
> > > much as the compiler will optimize out potentially large parts of the
> > > code. In the worst case, this could even pop false positive warnings.
> > > Dropping COMPILE_TEST here improves the quality of our testing and
> > > avoids wasting time on non-existent issues.  
> > 
> > This doesn't seem to match the COMPILE_TEST usage that I observe in
> > other places. For example, we frequently use 'depends on ARCH_QCOM ||
> > COMPILE_TEST'. Which means that the driver itself doesn't make sense
> > without ARCH_QCOM, but we want for it to be tested on non-ARCH_QCOM
> > cases. I think the same logic applies to 'depends on OF ||
> > COMPILE_TEST' clauses. The driver (DP AUX bus) depends on OF to be fully
> > functional, but it should be compilable even without OF case.
> 
> The major difference is that one can't possibly enable ARCH_QCOM if
> building on X86 for example. Therefore COMPILE_TEST is the only way to
> let everyone (including randconfig/allmodconfig build farms) test-build
> your code.
> 
> On the other hand, if you want to test-build drm_dp_aux_bus, you can
> simply enable OF, because it is available on all architectures and
> doesn't depend on anything. No need for COMPILE_TEST.

I'd probably let Doug respond, what was his intention. 

> 
> For clarity, I'm not advocating against the use of COMPILE_TEST,
> actually if you check the history of my kernel contributions 10 years
> back, you'll find commits from me adding COMPILE_TEST in addition to
> arch-specific dependencies to many drivers. All I'm saying is that it
> should only be used when it is the only way to enable the build.


-- 
With best wishes
Dmitry
