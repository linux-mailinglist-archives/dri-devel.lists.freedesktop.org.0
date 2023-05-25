Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF57A71182F
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 22:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C1A10E75E;
	Thu, 25 May 2023 20:33:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6367310E75E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 20:33:44 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id E0FFB3F73D;
 Thu, 25 May 2023 22:33:40 +0200 (CEST)
Date: Thu, 25 May 2023 22:33:39 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v14 1/9] drm/display/dsc: Add flatness and initial scale
 value calculations
Message-ID: <iemmv4nfpoxsrpcf7q6xc4bycnrl4ax4wknswfxx52dz7a5jyp@jis4mxee4flw>
References: <20230329-rfc-msm-dsc-helper-v14-0-bafc7be95691@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v14-1-bafc7be95691@quicinc.com>
 <7yzn3lyxpdl447c2ujq3yfh37pbnfvv2t2bvrtziie3j3lxt5n@a6znq7ahjr2a>
 <814707a6-4193-4834-9715-ff132ce3146e@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <814707a6-4193-4834-9715-ff132ce3146e@quicinc.com>
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-24 18:05:51, Jessica Zhang wrote:
<snip>
> >> +/**
> >> + * drm_dsc_initial_scale_value() - Calculate the initial scale value for the given DSC config
> >> + * @dsc: Pointer to DRM DSC config struct
> >> + *
> >> + * Return: Calculated initial scale value
> > 
> > Perhaps just drop Calculated from Return:?
> > 
> >> + */
> >> +u8 drm_dsc_initial_scale_value(const struct drm_dsc_config *dsc)
> >> +{
> >> +	return 8 * dsc->rc_model_size / (dsc->rc_model_size - dsc->initial_offset);
> >> +}
> >> +EXPORT_SYMBOL(drm_dsc_initial_scale_value);
> >> +
> >> +/**
> >> + * drm_dsc_flatness_det_thresh() - Calculate the flatness_det_thresh for the given DSC config
> > 
> > You've written out the word ("flatness det thresh" and "initial scale
> > value") entirely elsewhere, why the underscores in the doc comment here?
> > 
> > Instead we should have the full meaning here (and in the Return: below),
> > please correct me if I'm wrong but in VESA DSC v1.2a spec 6.8.5.1
> > Encoder Flatness Decision I think this variable means "flatness
> > determination threshold"?  If so, use that in the doc comment :)
> > 
> > (and drop the leading "the", so just "Calculate flatness determination
> > threshold for the given DSC config")
> > 
> >> + * @dsc: Pointer to DRM DSC config struct
> >> + *
> >> + * Return: Calculated flatness det thresh value
> > 
> > Nit: perhaps we can just drop "calculated" here?
> 
> 
> Hi Marijn,
> 
> Sure, I will make these changes if a v15 is necessary.
> 
> In the future, can we try to group comments on wording/grammar/patch 
> formatting with comments on the code itself?

Can you clarify what you mean?  v14 here is the first series including
this doc comment so there was no way for me to have reviewed this
earlier.  Code contents were already successfully reviewed many
revisions ago.

> I really appreciate your feedback and help in improving the 
> documentation around this feature, however I don't find it very 
> productive to have revisions where the only changes are on (in my 
> opinion) small wording details.

It is also down to you to have some patience and collect more review
from other maintainers and batch up changes, instead of spinning another
revision quickly after a review comment.

But this request can also be turned around: review and scan your own
series for simple inconsistencies before sending it to the lists, that
will surely make the time spent by reviewers much more "productive" as
well.
(Note that this goes hand in hand with the request to slow down
 consecutive revisions!)

And finally, as already said before: you can always decide to ignore my
review nits.  I am not a maintainer and don't have final say on whatever
is blocking for a patch to get merged.
But, when another revision is needed, the things I pointed out can at
least be incorporated, which is why they were shared in the first place.

Thanks for understanding.

- Marijn
