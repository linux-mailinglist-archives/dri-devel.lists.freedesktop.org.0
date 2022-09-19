Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A73335BD64D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 23:22:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3457D10E146;
	Mon, 19 Sep 2022 21:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D11310E146;
 Mon, 19 Sep 2022 21:22:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0F765B820F4;
 Mon, 19 Sep 2022 21:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4394C433D6;
 Mon, 19 Sep 2022 21:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663622541;
 bh=IvWPxgYC8Y7/jKbvrMgvoSlVhNU4G8aj4azB6VTN5qk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LDukC2laWLeAS1hTstk3+uI80cx9+0pZ+wPFhhsMNlRE1bu16hMatnmZ1crpFbqt1
 k3tuAb9cL3igaJ1hDw7pjHvCDdVDLLmsBbe8qF07lur0B2xwaCdMINQtpmSO8vGW4c
 Wm8sgUtgNwKfKIY2ok3U8REzvC4BSqFPOn0IFdSj7Nw4tvVH2ISkeHNNXtB698XHbA
 uzxcqMJLg0T1xmOP/eHgGvkLgQDLvJAfLjdQ/w6afxgTGGwuF5TtgJcCpyRafNtP2a
 qbELnhcSynvFccTFurRKvvc8gGi6OMcf1cAYn2a79rBiiIey0Kb9Xl0WsTfpXmYe+Z
 /sx7/IpnsHzsw==
Date: Mon, 19 Sep 2022 16:22:18 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH v2 5/7] drm/msm/dp: Implement hpd_notify()
Message-ID: <20220919212218.chyeo7uga2sitwk7@builder.lan>
References: <20220916200028.25009-1-quic_bjorande@quicinc.com>
 <20220916200028.25009-6-quic_bjorande@quicinc.com>
 <07b39c97-30be-4e82-044e-51b0d98a5197@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07b39c97-30be-4e82-044e-51b0d98a5197@quicinc.com>
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
Cc: devicetree@vger.kernel.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 16, 2022 at 02:17:30PM -0700, Jeff Johnson wrote:
> On 9/16/2022 1:00 PM, Bjorn Andersson wrote:
> > From: Bjorn Andersson <bjorn.andersson@linaro.org>
> > 
> > The DisplayPort controller's hot-plug mechanism is based on pinmuxing a
> > physical signal no a GPIO pin into the controller. This is not always
> 
> nit: s/ no / on /?
> 

Correct, thank you Jeff.

> > possible, either because there aren't dedicated GPIOs available or
> > because the hot-plug signal is a virtual notification, in cases such as
> > USB Type-C.
> 
