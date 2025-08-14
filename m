Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD15B26582
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 14:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCBB010E87D;
	Thu, 14 Aug 2025 12:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NQpT3GvL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812A310E87D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 12:38:52 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-45a1ac7c066so5657975e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 05:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755175131; x=1755779931; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EPz7ssqjO1h3zPDdSNeM/PBBBggiFT8+tZOchRnsIG8=;
 b=NQpT3GvLm408LpDZ+9U6eJ0Sjz+vlINWxc1Iev1R89SBMVg80jn+vs60DTL3LOtHN0
 jeSjYlSaqo/ctlyZjVxqvo0kEvyZ7aGYzreHoRAXb4lyUaPL2CCp6Z3cXU2L+d6wIH9F
 wtVYSqtIIpd1UWNav3+C9ol+/TZuu8LznVTyQeIc4dfpoN6O9AUbq+akdi8aTUwMlO1J
 5ROlawkocyqvbEbhD5PK2sQ5njP9HnTC/KPRVzKh4XYjqz0dxyoJZTJauYixdMzF7OmF
 H70yq3Y1sootaE4I52MO81w+kvyQZ2OIYlr1XC8KZfNPNaubnV/56S0gm5a1OOi5I+Ld
 c/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755175131; x=1755779931;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EPz7ssqjO1h3zPDdSNeM/PBBBggiFT8+tZOchRnsIG8=;
 b=DJWBYFU/AYxd+vf1/grcHXNQkgjx8t3zaaANiJ3+I/3GPKHOnFb9mq84Yw9c0fmLFk
 XtZvjvFKWimajce/HgJQlV6UB9L045NuRT7BvOi0qEOtKTYJR+9GUUBo1PiTEY/iII61
 zDPhQ3JfOxUFSO//X8JMv3iIdp7b7bYZBoeUNk1+cXtBUE6U5oTwKFYqmJLPTlI4fvU6
 kOXCeGsHx6TpjoBIalxmBQqUKOqzkuIGl7deMd5O/US7toBhS17owyM427RhZkIRrXQL
 B6pVRXBnV3psksCxr1aPK5DQpMAh6I4oV74MisGBgIyBVxFGfIgr5V35EiaLG3OSd4Mf
 0qxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvpXAEWD4zba0hq4mCu4YS+HeAJlSkRbwiCBCgD7z8nEdsTiPf/EAlfPB5JS50ypMmZ7feB1+BqBo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLxG0sonhNGPOwYQbknNXATOqJcEeqL4uParAIsNx84SRfggZb
 qp3wvIYGamhxOG1npDY6j3QclvCcK67Jgq3udIUR2XVznmBzP/tYetG1GxPM37Qpl+M=
X-Gm-Gg: ASbGncsLvK8re1ZaYET7WEh2RpzgIiicqpUimds8gjBCqgxJAk2AcUgfzv5fCnQNbHE
 7Oq2g3W4qtsVBULlTU8C+J4MIkxDiYUPoZyZJ9dEuB0uR8JkK7ZBTGcVM/pt4WgGVTAN3MKK3AG
 M6z24O0OepaQ08rHESRwqAjvtasDgbqu4kvCSrqTCaRYB3MAKTMoStZe4MI6lpQg1xctxYS+57I
 UjMWwre/mX+tPAr3mF3D0RABtiD+7/2tZHbMySQh/9p8zkjaW6f3uUkrzpBJPzBhj7fLDj6GsLo
 rBkXcRRjpwIzTrNqBXqX5qkaS7kqo/ZJZv2tP7Vv1gHi78NNYKfcwA/Nt4yVTDuAkh0r+vlD/x8
 Z01fx6SmWIm0D37PilHVpEFMQIMfcC1mvMTx0uDSc/Pg=
X-Google-Smtp-Source: AGHT+IF/ppAwQetiBd0wp/qfvGWqioLtpcsysBKMaFWSLwxDoTBshLVeizH2zPHayB9NK+G77PX3mg==
X-Received: by 2002:a05:600c:a410:b0:459:dd1d:2ee0 with SMTP id
 5b1f17b1804b1-45a1b5ce7ccmr18335865e9.0.1755175130790; 
 Thu, 14 Aug 2025 05:38:50 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:1e8b:1779:ed5:b6f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1b855c87sm11997735e9.4.2025.08.14.05.38.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 05:38:50 -0700 (PDT)
Date: Thu, 14 Aug 2025 14:38:45 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, Michael Walle <mwalle@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/2] driver core: platform: / drm/msm: dp: Delay applying
 clock defaults
Message-ID: <aJ3Y1XhvTPB7J6az@linaro.org>
References: <20250814-platform-delay-clk-defaults-v1-0-4aae5b33512f@linaro.org>
 <flybqtcacqa3mtvav4ba7qcqtn6b7ocziweydeuo4v2iosqdqe@4oj7z4ps7d2c>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <flybqtcacqa3mtvav4ba7qcqtn6b7ocziweydeuo4v2iosqdqe@4oj7z4ps7d2c>
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

On Thu, Aug 14, 2025 at 02:55:44PM +0300, Dmitry Baryshkov wrote:
> On Thu, Aug 14, 2025 at 11:18:05AM +0200, Stephan Gerhold wrote:
> > Currently, the platform driver core always calls of_clk_set_defaults()
> > before calling the driver probe() function. This will apply any
> > "assigned-clock-parents" and "assigned-clock-rates" specified in the device
> > tree. However, in some situations, these defaults cannot be safely applied
> > before the driver has performed some early initialization. Otherwise, the
> > clock operations might fail or the device could malfunction.
> > 
> > This is the case for the DP/DSI controller on some Qualcomm platforms. We
> > use assigned-clock-parents there to bind the DP/DSI link clocks to the PHY,
> > but this fails if the PHY is not already powered on. We often bypass this
> > problem because the boot firmware already sets up the correct clock parent,
> > but this is not always the case.
> 
> So, the issue is that our abstraction is loose and we register a clock
> before it becomes usable. Would it be better to delay registering a
> clock until it's actually useable? (and then maybe to unregister on the
> link shutdown)
> 
> > 
> > Michael had a somewhat related problem in the PVR driver recently [1],
> > where of_clk_set_defaults() needs to be called a second time from the PVR
> > driver (after the GPU has been powered on) to make the assigned-clock-rates
> > work correctly.
> > 
> > I propose adding a simple flag to the platform_driver struct that skips the
> > call to of_clk_set_defaults(). The platform driver can then call it later
> > after the necessary initialization was performed (in my case: after the PHY
> > was fully enabled for the first time).
> > 
> > There are also alternative solutions that I considered, but so far
> > I discarded them in favor of this simple one:
> > 
> >  - Avoid use of assigned-clock-parents: We could move the clocks from
> >    "assigned-clock-parents" to "clocks" and call clk_set_parent() manually
> >    from the driver. This is what we did for DSI on SM8750 (see commit
> >    80dd5911cbfd ("drm/msm/dsi: Add support for SM8750")).
> > 
> >    This is the most realistic alternative, but it has a few disadvantages:
> > 
> >     - We need additional boilerplate in the driver to assign all the clock
> >       parents, that would be normally hidden by of_clk_set_defaults().
> > 
> >     - We need to change the existing DT bindings for a number of platforms
> >       just to workaround this limitation in the Linux driver stack. The DT
> >       does not specify when to apply the assigned-clock-parents, so there
> >       is nothing wrong with the current hardware description.
> > 
> >  - Use clock subsystem CLK_OPS_PARENT_ENABLE flag: In theory, this would
> >    enable the new parent before we try to reparent to it. It does not work
> >    in this situation, because the clock subsystem does not have enough
> >    information to power on the PHY. Only the DP/DSI driver has.
> > 
> Another possible option would be to introduce the 'not useable' state /
> flag to the CCF, pointing out that the clock is registered, but should
> not be considered for parenting operations.
> 
> >  - Cache the new parent in the clock driver: We could try to workaround
> >    this problem in the clock driver, by delaying application of the new
> >    clock parent until the parent actually gets enabled. From the
> >    perspective of the clock subsystem, the clock would be already
> >    reparented. This would create an inconsistent state: What if the clock
> >    is already running off some other parent and we get a clk_set_rate()
> >    before the parent clock gets enabled? It would operate on the new
> >    parent, but the actual rate is still being derived from the old parent.
> > 
> 
> But... Generally it feels that we should be able to bring up the clocks
> in some 'safe' configuration, so that the set_parent / set_rate calls
> can succeed. E.g. DISP_CC_MDSS_DPTX0_LINK_CLK_SRC can be clocked from XO
> until we actually need to switch it to a proper rate. I see that
> e.g. dispcc-sm8550.c sets 'CLK_SET_RATE_PARENT' on some of DP clock
> sources for no reason (PHY clock rates can not be set through CCF, they
> are controlled through PHY ops).
> 

I don't think there is any problem with the 'safe' configuration you
mention. I have not tried, but we should be able to use that. However,
my understanding is that reparenting does not fail because the clock
itself is in an "unusable" state, but because the new parent is in an
"unusable" state. We can run the clock from XO, but that wouldn't solve
the problem of reparenting to the PHY (until the PHY is fully
configured).

(It would help a lot if you can find someone from the hardware team at
 Qualcomm to confirm that. Everything I write is just based on
 experiments I have done.)

So, assume that DISP_CC_MDSS_DPTX0_LINK_CLK_SRC is already running from
XO, but the PHY is powered off. Now of_clk_set_defaults() gets called
and we get the call to clk_set_parent() while the PHY is off. How do we
deal with that? Returning 0 without actually changing the parent would
result in inconsistent state, as I described above. clk_get_parent()
would return the new parent, but actually it's still running from XO.

With my changes in this series the clock state is always consistent with
the state returned by the clk APIs. We just delay the call to
clk_set_parent() until we know that it can succeed.

Thanks,
Stephan
