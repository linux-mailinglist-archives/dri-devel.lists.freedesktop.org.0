Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D29FF5FD727
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 11:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F7FB10E6C2;
	Thu, 13 Oct 2022 09:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C31210E6C2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 09:36:50 +0000 (UTC)
Received: from SoMainline.org (D57D4C6E.static.ziggozakelijk.nl
 [213.125.76.110])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id CE7933F757;
 Thu, 13 Oct 2022 11:36:47 +0200 (CEST)
Date: Thu, 13 Oct 2022 11:36:46 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [Freedreno] [PATCH v3 06/10] drm/msm/dsi: Migrate to
 drm_dsc_compute_rc_parameters()
Message-ID: <20221013093646.c65mbjc6oekd7gha@SoMainline.org>
References: <20221009184824.457416-1-marijn.suijten@somainline.org>
 <20221009185058.460688-1-marijn.suijten@somainline.org>
 <5c178d7e-5022-f5e5-791d-d3800114b42b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c178d7e-5022-f5e5-791d-d3800114b42b@quicinc.com>
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
Cc: Sean Paul <sean@poorly.run>, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
 Vinod Koul <vkoul@kernel.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-10-12 16:03:06, Abhinav Kumar wrote:
> 
> 
> On 10/9/2022 11:50 AM, Marijn Suijten wrote:
> > As per the FIXME this code is entirely duplicate with what is already
> > provided inside drm_dsc_compute_rc_parameters(), and it is yet unknown
> > why this comment was put in place instead of resolved from the get-go.
> > Not only does it save on duplication, it would have also spared certain
> > issues.
> > 
> > For example, this code from downstream assumed dsc->bits_per_pixel to
> > contain an integer value, whereas the upstream drm_dsc_config struct has
> > it with 4 fractional bits.  drm_dsc_compute_rc_parameters() already
> > accounts for this feat, and the sole remaining use of
> > dsc->bits_per_pixel inside dsi_populate_dsc_params() will be addressed
> > in a separate patch.
> > 
> 
> This is a nice cleanup! Thanks for doing this. I would actually like to 
> move towards the drm_dsc_compute_rc_parameters() API.
> 
> But I would like to hold back this change till Vinod clarifies because 
> Vinod had mentioned that with drm_dsc_compute_rc_parameters() he was 
> seeing a mismatch in the computation of two values.
> 
> slice_bpg_offset and the final_offset.

Unsurprisingly so because final_offset, and slice_bpg_offset through
initial_offset depend directly on bits_per_pixel.  The main takeaway of
this series is that Vinod was interpreting this field as integer instead
of containing 4 fractional bits.  If he updates his the panel driver [1]
to set bits_per_pixel = 8 << 4 instead of just 8 to account for this,
the values should check out once again.

[1]: https://git.linaro.org/people/vinod.koul/kernel.git/commit/?h=topic/pixel3_5.18-rc1&id=1d7d98ad564f1ec69e7525e07418918d90f247a1

Once Vinod (or someone else in the posession of a Pixel 3) confirms
this, I can respin this series and more explicitly explain why the FIXME
was put in place, instead of being resolved outright?

- Marijn

> 
> The difference between the upstream drm_dsc_compute_rc_parameters() and 
> dsi_populate_dsc_params() causing this was not clear to me from his 
> explanation earlier.
> 
> So this was left as a to-do item.
> 
> I would like this to be re-tested on pixel3 and check if this works for 
> vinod. If not, i think its the right time to debug why and not delay 
> this more.
> 
> Thanks
> 
> Abhinav
