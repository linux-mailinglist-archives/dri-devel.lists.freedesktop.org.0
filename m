Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CBA661FED
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 09:24:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA1810E28D;
	Mon,  9 Jan 2023 08:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E80410E28C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 08:24:04 +0000 (UTC)
Received: from SoMainline.org (unknown [89.205.227.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id BA0103EE8C;
 Mon,  9 Jan 2023 09:23:59 +0100 (CET)
Date: Mon, 9 Jan 2023 09:23:57 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 4/8] drm/msm/dpu: Disallow unallocated resources to be
 returned
Message-ID: <20230109082357.meebk7udokdfvwle@SoMainline.org>
References: <20221221231943.1961117-1-marijn.suijten@somainline.org>
 <20221221231943.1961117-5-marijn.suijten@somainline.org>
 <b415a91d-f804-1fec-52dd-4124d3f1e583@linaro.org>
 <1b872a47-6ffc-1fe9-f283-897dbc37d709@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b872a47-6ffc-1fe9-f283-897dbc37d709@linaro.org>
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Haowen Bai <baihaowen@meizu.com>, Vinod Koul <vkoul@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, sunliming <sunliming@kylinos.cn>,
 Drew Davenport <ddavenport@chromium.org>, freedreno@lists.freedesktop.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-01-09 01:30:29, Dmitry Baryshkov wrote:
> On 09/01/2023 01:28, Dmitry Baryshkov wrote:
> > On 22/12/2022 01:19, Marijn Suijten wrote:
> >> In the event that the topology requests resources that have not been
> >> created by the system (because they are typically not represented in
> >> dpu_mdss_cfg ^1), the resource(s) in global_state (in this case DSC
> >> blocks) remain NULL but will still be returned out of
> >> dpu_rm_get_assigned_resources, where the caller expects to get an array
> >> containing num_blks valid pointers (but instead gets these NULLs).
> >>
> >> To prevent this from happening, where null-pointer dereferences
> >> typically result in a hard-to-debug platform lockup, num_blks shouldn't
> >> increase past NULL blocks and will print an error and break instead.
> >> After all, max_blks represents the static size of the maximum number of
> >> blocks whereas the actual amount varies per platform.
> >>
> >> ^1: which can happen after a git rebase ended up moving additions to
> >> _dpu_cfg to a different struct which has the same patch context.
> >>
> >> Fixes: bb00a452d6f7 ("drm/msm/dpu: Refactor resource manager")
> >> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 5 +++++
> >>   1 file changed, 5 insertions(+)
> > 
> > I think the patch is not fully correct. Please check resource 
> > availability during allocation. I wouldn't expect an error from 
> > get_assigned_resources because of resource exhaustion.

Theoretically patch 5/8 should take care of this, and we should never
reach this failure condition.  Emphasis on /should/, this may happen
again if/when another block type is added with sub-par resource
allocation and assignment implementation.

> Another option, since allocation functions (except DSC) already have 
> these safety checks: check error message to mention internal 
> inconstency: allocated resource doesn't exist.

Is this a suggestion for the wording of the error message?

- Marijn
