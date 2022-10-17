Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A044A6009AD
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 11:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C02310E59C;
	Mon, 17 Oct 2022 09:00:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B8710E59C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 09:00:04 +0000 (UTC)
Received: from SoMainline.org (D57D4C6E.static.ziggozakelijk.nl
 [213.125.76.110])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 7F1683EED4;
 Mon, 17 Oct 2022 11:00:01 +0200 (CEST)
Date: Mon, 17 Oct 2022 10:59:44 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [Freedreno] [PATCH v3 06/10] drm/msm/dsi: Migrate to
 drm_dsc_compute_rc_parameters()
Message-ID: <20221017085944.2r24uqg73irmziqm@SoMainline.org>
References: <20221009184824.457416-1-marijn.suijten@somainline.org>
 <20221009185058.460688-1-marijn.suijten@somainline.org>
 <5c178d7e-5022-f5e5-791d-d3800114b42b@quicinc.com>
 <20221013093646.c65mbjc6oekd7gha@SoMainline.org>
 <32af4444-9c88-eb0f-eda7-24fa0418aff6@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32af4444-9c88-eb0f-eda7-24fa0418aff6@quicinc.com>
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
Cc: Sean Paul <sean@poorly.run>, Newbyte <newbie13xd@gmail.com>,
 Caleb Connolly <caleb@connolly.tech>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
 Vinod Koul <vkoul@kernel.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-10-13 09:02:44, Abhinav Kumar wrote:
> On 10/13/2022 2:36 AM, Marijn Suijten wrote:
> > On 2022-10-12 16:03:06, Abhinav Kumar wrote:
> >> [..]
> >> But I would like to hold back this change till Vinod clarifies because
> >> Vinod had mentioned that with drm_dsc_compute_rc_parameters() he was
> >> seeing a mismatch in the computation of two values.
> >>
> >> slice_bpg_offset and the final_offset.
> > 
> > Unsurprisingly so because final_offset, and slice_bpg_offset through
> > initial_offset depend directly on bits_per_pixel.  The main takeaway of
> > this series is that Vinod was interpreting this field as integer instead
> > of containing 4 fractional bits.  If he updates his the panel driver [1]
> > to set bits_per_pixel = 8 << 4 instead of just 8 to account for this,
> > the values should check out once again.
> > 
> > [1]: https://git.linaro.org/people/vinod.koul/kernel.git/commit/?h=topic/pixel3_5.18-rc1&id=1d7d98ad564f1ec69e7525e07418918d90f247a1
> > 
> > Once Vinod (or someone else in the posession of a Pixel 3) confirms
> > this, I can respin this series and more explicitly explain why the FIXME
> > was put in place, instead of being resolved outright?
> > 
> > - Marijn
> 
> Makes perfect sense to me.
> 
> Will just wait for Vinod's tested-by.

Unfortunately Vinod doesn't have access to this device anymore, but
Caleb recently sent the support series including display driver for
Pixel 3 and is picking up the testing.  User "Newbyte" from #linux-msm
promised to test on the LG G7 to have even more input samples.

- Marijn
