Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7799873BF5B
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 22:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D77EB10E6B2;
	Fri, 23 Jun 2023 20:18:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FAAB10E6C0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 20:18:37 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 68F383F6CF;
 Fri, 23 Jun 2023 22:18:35 +0200 (CEST)
Date: Fri, 23 Jun 2023 22:18:34 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2] drm/msm/dsi: Document DSC related pclk_rate and
 hdisplay calculations
Message-ID: <gtbpo6o255z3wb5veapjf4z2gasf6sjqdswqxxgpcwtkxaa6qk@dgkopjxs47uz>
References: <20230619210647.867630-1-dmitry.baryshkov@linaro.org>
 <e9d5876a-3113-8c79-c2aa-e1ad175f0d84@quicinc.com>
 <b632e52d-7b86-9f5a-913a-aace26d9a039@linaro.org>
 <c2f632e7-8302-a77f-fc61-ccda3b5a8aac@quicinc.com>
 <eqdu44xcd6qdrmxcdr44dfcliydz6q4oombghjg6ptlcbxf22v@uhqnhnlv6gxi>
 <6e2ded6a-63a9-d32a-7a2f-67d3c72b1aa2@quicinc.com>
 <gpxqh6mu5dora7ul4agaflmzqiq7ps6j2dic3zj2ygvp7dsori@lnbnexnbqthg>
 <a3ce94a4-8e5b-427c-28ad-1bfad041d097@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3ce94a4-8e5b-427c-28ad-1bfad041d097@linaro.org>
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

On 2023-06-23 23:10:56, Dmitry Baryshkov wrote:
<snip>
> >> There is no confusion between what was said earlier and now.
> >>
> >> This line is calculating the number of pclks needed to transmit one line
> >> of the compressed data:
> >>
> >> hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
> >>
> >> msm_dsc_get_bytes_per_line() is calculating the number of compressed
> >> bytes as it uses the target bits_per_pixel
> >>
> >> 126 	 * @bits_per_pixel:
> >> 127 	 * Target bits per pixel with 4 fractional bits, bits_per_pixel << 4
> >> 128 	 */
> >> 129 	u16 bits_per_pixel;
> >>
> >> (like I have said a few times, hdisplay is perhaps confusing us)
> >>
> >> If you calculate the bytes this way you are already accounting for the
> >> compression, so where is the confusion.
> >>
> >> The pclk calculation does the same thing of using the ratio instead.
> > 
> > This is not answering my question whether the ratio for pclk calculation
> > should also be adjusted to account for widebus.  And if the ratio is
> > fixed, why use a fixed factor here but the ratio between
> > src_bpp:target_bpp here?  It only adds extra confusion.
> 
> Wide bus is dicussed separately. I think the question you are trying to 
> ask is "why are we not using msm_dsc_get_bytes_per_line() in 
> dsi_adjust_pclk_for_compression()?"

I have asked that question before, and the answer was something
incomprehensible.  But indeed, it would look more natural if
dsi_adjust_pclk_for_compression() replaces:

    int new_hdisplay = DIV_ROUND_UP(mode->hdisplay * drm_dsc_get_bpp_int(dsc),
        dsc->bits_per_component * 3)

With:

    int new_hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(dsc), 3);

Which is the same value as we have here.

And then it becomes more clear how widebus affects this calculation.

- Marijn
