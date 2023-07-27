Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD18765CB7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 21:59:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E862910E5EC;
	Thu, 27 Jul 2023 19:59:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791AC10E5EC
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 19:59:42 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id B19A63F1EB;
 Thu, 27 Jul 2023 21:59:40 +0200 (CEST)
Date: Thu, 27 Jul 2023 21:59:39 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 3/4] drm/msm/dpu: add helper to get IRQ-related data
Message-ID: <zpzboxlhbsfw7kz5zkthzeuitwvnq4wwbziedgmpuqaghofuag@acg5r76x5vvq>
References: <20230727150455.1489575-1-dmitry.baryshkov@linaro.org>
 <20230727150455.1489575-4-dmitry.baryshkov@linaro.org>
 <hdenbea53reesjrin4szoq64ja63ryjznsllvmicuzdftmk5u7@lows7neacgm2>
 <7b7e0a8a-392c-19c3-6642-7479c28d4ed8@linaro.org>
 <zilvhfz4qgvnz4thp6wlbg6al7hahen2gw2k5el5o6pi2ysxb6@qhwzla4zmze5>
 <2e20d0ac-0fb5-3f33-910c-438d34d8109e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e20d0ac-0fb5-3f33-910c-438d34d8109e@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-07-27 22:51:32, Dmitry Baryshkov wrote:
> On 27/07/2023 22:41, Marijn Suijten wrote:
> > On 2023-07-27 22:34:59, Dmitry Baryshkov wrote:
> >> On 27/07/2023 22:29, Marijn Suijten wrote:
> >>> On 2023-07-27 18:04:54, Dmitry Baryshkov wrote:
> >>>> In preparation to reworking the IRQ indices, move irq_tbl access to
> >>>> separate helper.
> >>>
> >>> I am not seeing the advantage of the helper, but making every function
> >>> look up dpu_kms->hw_intr->irq_tbl[irq_idx] only once and storing that in
> >>> a local dpu_hw_intr_entry pointer is much tidier.
> >>
> >> There was a bonus point when I tried to do a irq_idx-1 in the next
> >> patch. But since that code has gone, maybe I can drop this patch too.
> > 
> > Don't drop the whole patch though.  While maybe not necessary, having
> > the lookup only once is much easier to follow.
> 
> Then it's easier to keep it as is.

While reviewing patch 4/4 though, the -1 might be missing after all.
You still allocate "nirq = total_irqs" spots in the table, but then
allow any number 0 < irq_idx <= total_irqs.  Indexing irq_idx ==
total_irqs would be out of bounds?

- Marijn

<snip>
