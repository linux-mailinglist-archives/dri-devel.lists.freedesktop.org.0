Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 104E970408E
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 00:01:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4581710E29D;
	Mon, 15 May 2023 22:01:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251B410E29D
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 22:01:46 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id B52B63F6F0;
 Tue, 16 May 2023 00:01:41 +0200 (CEST)
Date: Tue, 16 May 2023 00:01:40 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v10 4/8] drm/msm: Add MSM-specific DSC helper methods
Message-ID: <4cbqbu47vcshskl4npyzos5r7gxipjbbzyfvdfx7fenfh4mzmx@jj6lrysp35du>
References: <20230329-rfc-msm-dsc-helper-v10-0-4cb21168c227@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v10-4-4cb21168c227@quicinc.com>
 <kx3be4c2okye2ts4rzy4j4ltnveixf7v4rxp5v4tl2irvevg6t@c5tuelunmn4c>
 <0e8a8af5-5ab8-c1b9-e08d-909072cc9b76@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e8a8af5-5ab8-c1b9-e08d-909072cc9b76@quicinc.com>
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
Cc: Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-15 13:29:21, Jessica Zhang wrote:
<snip>
> > Const, as requested elsewhere.  But this function is not used anywhere
> > in any of the series (because we replaced the usages with more sensible
> > member accesses like slice_chunk_size).
> 
> Acked.
> 
> I would prefer to keep this helper so that we have a way to easily get 
> BPP information from the DRM DSC config in the future, but if you'd 
> prefer we add this helper then, I'm also ok with that.

The inverse helper is available ad DSC_BPP in drm_dsc_helper.c.  Perhaps
we can move the two variants to the header and define them uniformly?
This isn't MSM-specific it seems (i.e. the format supports fractional
bpp but no RC parameters appear to be defined for such a format yet).

<snip>
> >> + * @dsc: Pointer to drm dsc config struct
> >> + * Returns: Integer value representing pclk per interface
> >> + *
> >> + * Note: This value will then be passed along to DSI and DP for some more
> >> + * calculations. This is because DSI and DP divide the pclk_per_intf value
> >> + * by different values depending on if widebus is enabled.
> > 
> > Can you elaborate what this "note" is trying to tell users of this
> > function?  That they should not use bytes_per_line raw?  That it doesn't
> > actually represent bytes_per_line if the extra calculations mentioned
> > here are not applied?
> 
> The latter -- this method is used for calculating the pclk for DSI and 
> DP. While it does get the raw bytes_per_line, there are some extra 
> calculations needed before it can be set as the pclk_rate. These "extra 
> calculations" are different between DP and DSI.
> 
> For more context, please refer to the earlier revisions of this patch 
> and the usage of the helper in dsi_host.c

Note that I'm not just asking to explain it to me, but to explain it in
the documentation.  The function is named bytes_per_line() but then
Returns: says it returns the pclk per interface, then the note says that
it actually doesn't unless extra calculations are applied.

We can explain the same much more concisely by rewriting Returns and
dropping Note:

    Returns: Integer value representing bytes per line.  DSI and DP need
    to perform further processing/calculations to turn this into
    pclk_per_intf, such as dividing by different values depending on
    if widebus is enabled.

And so we have written the same, just more concisely.  Feel free to
reword it slightly, such as dropping the word "processing".

<snip>
> > Not sure that this helper is useful though: it is
> > only used where msm_dsc_get_slice_per_intf() was already called, so it
> > makes more sense to the reader to just multiply slice_per_intf by
> > slice_chunk_size than to defer to an opaque helper.
> 
> I would prefer to keep this as a helper as this math is common between 
> DP and DSI, and I believe the name of the helper accurately reflects 
> what is being calculated.
> 
> If there's any confusion with the name of the method, I am open to 
> suggestions.

The name is good, I'm just not too keen on it hiding the multiplication
with msm_dsc_get_slice_per_intf() which is already also computed and
available in DSI, and I assume DP too?

- Marijn
