Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EAF6F61B2
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 01:03:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F67E10E060;
	Wed,  3 May 2023 23:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 638F310E060;
 Wed,  3 May 2023 23:03:38 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 9B16A3FAFD;
 Thu,  4 May 2023 01:03:36 +0200 (CEST)
Date: Thu, 4 May 2023 01:03:35 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH 3/4] drm/msm/dpu: Add has_data_compress to dpu_caps
Message-ID: <46an5zrsxplqo3h35okjyhfes6sqwmw5kez3nm3x5vrkqyvsn5@lxca65m7ju6n>
References: <20230405-add-dsc-support-v1-0-6bc6f03ae735@quicinc.com>
 <20230405-add-dsc-support-v1-3-6bc6f03ae735@quicinc.com>
 <v5hmqtjwd3syqwo5nqru7xgpt3rv5ubfbzt6pssriyb7cuprkf@7zdvwsil67nc>
 <7117aadb-0289-01ff-6eb9-8bfc358eca63@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7117aadb-0289-01ff-6eb9-8bfc358eca63@quicinc.com>
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jessica,

On 2023-05-03 12:03:40, Jessica Zhang wrote:
> 
> 
> On 5/3/2023 12:07 AM, Marijn Suijten wrote:
> > On 2023-05-02 18:19:14, Jessica Zhang wrote:
> >> Add data_compress feature to DPU HW catalog.
> >>
> >> In DPU 7.x and later, there is a DATA_COMPRESS register that must be set
> >> within the DPU INTF block for DSC to work.
> >>
> >> As core_rev (and related macros) was removed from the dpu_kms struct, the
> >> most straightforward way to indicate the presence of this register would be
> >> to have a flag in dpu_caps.
> > 
> > This is a very generic name to have in the global dpu_caps for a very
> > specific register on the INTF block since DPU >= 7.0.0, and I doubt any
> > new catalog contributor will know how to fill this field.  After all,
> > DPU < 7.0.0 also has DCE but it is controlled via the PINGPONG block.
> > 
> > Instead, how about having it as a DPU_INTF_DATA_COMPRESS (or similar)
> > feature flag on the INTF block?  We do the same for other (register
> > related) features on the INTF block, and you did the same to disable DSC
> > callbacks on PP in [1].

(Note: I said "you" but meant Kuogee)

> Hi Marijn,
> 
> Sounds good.
> 
> > 
> > In fact it seems that the DSC/DCE (enablement) registers have been moved
> > from PINGPONG to INTF in DPU 7.0.0.  Can you clarify in the patch
> > message for v2 that this is the case, and do the same in the linked
> > PINGPONG patch?  Perhaps these patches should be part of the same series
> > as they do not seem DSI-specific.
> 
> Will make a note of the PP to INTF change in the commit message.

Thanks.

> I would prefer to keep this patch in this series is because it is needed 
> for DSI over command mode to work and the subsequent patch is 
> specifically for command mode.

That is fine, but do mention this in the commit message if it is
relevant here.  Otherwise only mention it as part of patch 4/4.

- Marijn
