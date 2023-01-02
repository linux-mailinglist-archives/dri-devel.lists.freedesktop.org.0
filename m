Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB3565AFA8
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 11:38:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F9F310E2F7;
	Mon,  2 Jan 2023 10:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB0310E2FB
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 10:38:39 +0000 (UTC)
Received: from SoMainline.org (D57D4C6E.static.ziggozakelijk.nl
 [213.125.76.110])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 3B1ED3EE8C;
 Mon,  2 Jan 2023 11:38:36 +0100 (CET)
Date: Mon, 2 Jan 2023 11:38:34 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [RFC PATCH 5/7] drm/msm/dpu: Document and enable TEAR interrupts
 on DSI interfaces
Message-ID: <20230102103834.v37rv7i72sysruko@SoMainline.org>
References: <20221231215006.211860-1-marijn.suijten@somainline.org>
 <20221231215006.211860-6-marijn.suijten@somainline.org>
 <ccd35acf-15b5-91c7-606a-b327229cb255@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ccd35acf-15b5-91c7-606a-b327229cb255@linaro.org>
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
 dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Adam Skladowski <a39.skl@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 freedreno@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-01-01 15:12:35, Dmitry Baryshkov wrote:
> On 31/12/2022 23:50, Marijn Suijten wrote:
> > <snip>
> > -#define INTF_BLK(_name, _id, _base, _type, _ctrl_id, _progfetch, _features, _reg, _underrun_bit, _vsync_bit) \
> > +#define INTF_BLK(_name, _id, _base, _len, _type, _ctrl_id, _progfetch, _features, _reg, _underrun_bit, _vsync_bit, _tear_reg, _tear_rd_ptr_bit) \
> >   	{\
> >   	.name = _name, .id = _id, \
> > -	.base = _base, .len = 0x280, \
> > +	.base = _base, .len = _len, \
> 
> Please move .len setting to a separate patch, it is not direclty related 
> to tear interrupt addition.

It is directly related in that the TE registers reside in the extra
space beyond 0x280, but I can surely make that explicit in a separate
patch.

> >   	.features = _features, \
> >   	.type = _type, \
> >   	.controller_id = _ctrl_id, \
> >   	.prog_fetch_lines_worst_case = _progfetch, \
> >   	.intr_underrun = DPU_IRQ_IDX(_reg, _underrun_bit), \
> >   	.intr_vsync = DPU_IRQ_IDX(_reg, _vsync_bit), \
> > +	.intr_tear_rd_ptr = DPU_IRQ_IDX(_tear_reg, _tear_rd_ptr_bit), \
> 
> Initially I added separate _reg and _bit settings because reg was common 
> to both interrupts. However now as tear interrups use different reg it 
> might be better to first move DPU_IRQ_IDX out of this macro () and then 
> to add your tear_rd_ptr_intr as a single intr_idx.

I assumed as much; then we do get the duplication of _reg but I guess
it's not too bad if the lines are nicely wrapped like in _pp[].  I'll do
so in a separate patch.

- Marijn

<snip>
