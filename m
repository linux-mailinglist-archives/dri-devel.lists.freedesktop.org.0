Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B96D5A9318
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 11:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54BF810E674;
	Thu,  1 Sep 2022 09:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321EB10E673;
 Thu,  1 Sep 2022 09:28:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8F49D61962;
 Thu,  1 Sep 2022 09:28:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE133C433C1;
 Thu,  1 Sep 2022 09:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662024496;
 bh=wynK0xNq0B3tZ8gKv1xPpPUeKbsBAfa8JCKeDEjpJfg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dIdnwHePmemwHTYRcGwoYfYdci6JxyuBojsb0+cKMmqyUTOgDYE1UEBP2UggJcRAg
 HikFvinjDmmHutB9O0uQrVmPVzsVfRXnmXyFxWqaZ9fkJNma6xYvh6SSGKYajh5D3q
 o+LCpmGHnX9GJji38y512r6JXuiAi9DCBKpK0e6NLb5MlAE2iN74tadvsQ1KDa+hGj
 Dn6vfZlGldfCspto3TT9AjhlU/ePFLL5WbUZh9n8uahl8jtXVP9mX3egMZxcXKS+Z/
 jK6zzTW3TInl037dEgft45wc2upyMmULz0wLBcSTjhAbvb3IyYu9pPmZdVRKjvDdJO
 y3fAuF8t8bzYA==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1oTgUh-0006ct-RV; Thu, 01 Sep 2022 11:28:16 +0200
Date: Thu, 1 Sep 2022 11:28:15 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [RFC PATCH 0/3] drm/msm/dp: several fixes for the IRQ handling
Message-ID: <YxB7L9A7VHj7ioXc@hovoldconsulting.com>
References: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org>
 <YxB5R/6u9/ERyUSP@hovoldconsulting.com>
 <f6868bf1-445b-e350-5032-09595666449b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6868bf1-445b-e350-5032-09595666449b@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 01, 2022 at 12:21:36PM +0300, Dmitry Baryshkov wrote:
> On 01/09/2022 12:20, Johan Hovold wrote:
> > On Thu, Sep 01, 2022 at 12:15:24PM +0300, Dmitry Baryshkov wrote:
> >> Johan Hovold has reported that returning a probe deferral from the
> >> msm_dp_modeset_init() can cause issues because the IRQ is not freed
> >> properly. This (compile-tested only) series tries to fix the issue by
> >> moving devm_request_irq() to the probe callback.
> > 
> > Please try to reproduce the issue yourself before posting untested RFCs.
> > We're all short on time.
> 
> I do not have a working DP setup. Thus it's either this, or nothing.

Ok, you could have mentioned that as the above sounds a bit lazy.

I don't have time to work on this right now as I mentioned elsewhere.
Avoiding probe deferral by fiddling with the config serves as a fragile
workaround until then.

Johan
