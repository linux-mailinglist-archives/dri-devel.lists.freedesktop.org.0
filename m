Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA605FADCC
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 09:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADCA10E7DB;
	Tue, 11 Oct 2022 07:51:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C3B10E7DF
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 07:51:24 +0000 (UTC)
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl
 [94.209.172.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 3D3FC2063E;
 Tue, 11 Oct 2022 09:51:21 +0200 (CEST)
Date: Tue, 11 Oct 2022 09:51:19 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 10/10] drm/msm/dsi: Prevent signed BPG offsets from
 bleeding into adjacent bits
Message-ID: <20221011075119.tvn5j5jm6aqnhqv2@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20221009184824.457416-1-marijn.suijten@somainline.org>
 <20221009185316.462522-3-marijn.suijten@somainline.org>
 <408bf6a2-47fe-3eaf-7235-578d33a576c9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <408bf6a2-47fe-3eaf-7235-578d33a576c9@linaro.org>
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
Cc: Vinod Koul <vkoul@kernel.org>, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, freedreno@lists.freedesktop.org,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-10-09 22:14:16, Dmitry Baryshkov wrote:
> On 09/10/2022 21:53, Marijn Suijten wrote:
> > The bpg_offset array contains negative BPG offsets which fill the full 8
> > bits of a char thanks to two's complement: this however results in those
> > bits bleeding into the next field when the value is packed into DSC PPS
> > by the drm_dsc_helper function, which only expects range_bpg_offset to
> > contain 6-bit wide values.  As a consequence random slices appear
> > corrupted on-screen (tested on a Sony Tama Akatsuki device with sdm845).
> > 
> > Use AND operators to limit these two's complement values to 6 bits,
> > similar to the AMD and i915 drivers.
> > 
> > Fixes: b9080324d6ca ("drm/msm/dsi: add support for dsc data")
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Side note: the DSC params tables are more or less common between amd, 
> i916 and msm drivers. It might be worth moving them to the DSC helpers 
> from the individual drivers. This would mean such masks handling can go 
> into the helper too.

I'll queue this up in my list and perhaps tackle it in the next round of
DSC fixes, assuming things don't get too big.

If there are no more reviews I'll respin v4 with your review picked up
and patch 7/10 reworked or reordered to have access to the msm_host
pointer added in 8/10 (see kernel test robot mail).

- Marijn
