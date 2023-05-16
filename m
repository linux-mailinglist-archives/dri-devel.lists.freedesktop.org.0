Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE9E705ABF
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 00:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE2810E379;
	Tue, 16 May 2023 22:46:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01AB210E379
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 22:46:06 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id DA7BB202E3;
 Wed, 17 May 2023 00:46:01 +0200 (CEST)
Date: Wed, 17 May 2023 00:45:59 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [Freedreno] [PATCH v10 8/8] drm/msm/dsi: update hdisplay
 calculation for dsi_timing_setup
Message-ID: <45htnhfupwmiiuxy53osahrd6lpaz4my2apbqhxw6uuwlq5vxl@qhvf6guwk3np>
References: <20230329-rfc-msm-dsc-helper-v10-0-4cb21168c227@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v10-8-4cb21168c227@quicinc.com>
 <5jqvxyy7ixfpwzepgseqwwz5elyn2qhxa4qdwhxcw7xbkvle4l@rijv4uq5wsb7>
 <43a07bc1-d758-242a-7017-f566daadc35c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43a07bc1-d758-242a-7017-f566daadc35c@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-16 11:18:17, Jessica Zhang wrote:
> On 5/14/2023 2:29 PM, Marijn Suijten wrote:
> > On 2023-05-12 14:32:18, Jessica Zhang wrote:
> >>
> >> hdisplay for compressed images should be calculated as bytes_per_slice *
> >> slice_count. Thus, use MSM DSC helper to calculate hdisplay for
> >> dsi_timing_setup instead of directly using mode->hdisplay.
> > 
> > As mentioned in review on an earlier revision, is there any sort of
> > clarification you can provide here to explain the cases where
> > hdisplay!=bytes_per_line?  That goes a long way towards justifying this
> > change.  Thanks!
> 
> Hi Marijn,
> 
> Sorry for not responding to this in the earlier revision, I think I 
> missed the original comment.
> 
> Please correct me if I'm wrong, but I'm guessing the question here is 
> why we can't keep the hdisplay adjustment as `hdisplay /= 3` and have to 
> go out of our way to recalculate hdisplay before doing the `/ 3`.
> 
> This is because the original adjustment only works for BPP = 8. By using 
> the msm_dsc_get_bytes_per_line() here, we can generalize this adjustment 
> to work for cases where BPP != 8.

I am fully aware that the original computation only works for BPP=8 and
even mentioned so in v7 review [1].  The question / request is instead
to include such context in your commit message, rather than the
nondescriptive "should be calculated as" -> who says that and why?
Stating that the current approach was only working for BPP=8 (hence why
currently tested panels are working fine) but that this isn't a
long-term solution if we starts upporting other BPP is a proper
justification to make this change.

[1]: https://lore.kernel.org/linux-arm-msm/ju7647tlogo25fnhswgp7zn67syvsjy2ldjugvygh3z4rxtdrx@kb76evjvulgw/

> Thanks,

Thanks for looking into improving this!

- Marijn
