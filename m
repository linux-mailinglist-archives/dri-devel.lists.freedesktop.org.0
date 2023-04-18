Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A5D6E5B01
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 09:54:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E2F10E6C0;
	Tue, 18 Apr 2023 07:54:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD44210E6BE
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 07:54:36 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 7B19A2008D;
 Tue, 18 Apr 2023 09:54:32 +0200 (CEST)
Date: Tue, 18 Apr 2023 09:54:30 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH 1/3] drm/msm/dpu: Drop unused members from HW structs
Message-ID: <tqftgyqd72u5cze7phfkntl7t3zyarvf5ekeoh4zwcn33vimdl@qe3tntyvjyzf>
References: <20230418-dpu-drop-useless-for-lookup-v1-0-b9897ceb6f3e@somainline.org>
 <20230418-dpu-drop-useless-for-lookup-v1-1-b9897ceb6f3e@somainline.org>
 <bb229562-b0af-88f4-1207-ac23a6076dff@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb229562-b0af-88f4-1207-ac23a6076dff@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org,
 Jami Kettunen <jami.kettunen@somainline.org>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-04-17 18:54:18, Abhinav Kumar wrote:
> 
> On 4/17/2023 4:14 PM, Marijn Suijten wrote:
> > Some of these members were initialized while never read, while others
> > were not even assigned any value at all.  Drop them to save some space,
> > and above all confusion when looking at these members.
> > 
> > Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> > Fixes: 84a33d0fd921 ("drm/msm/dpu: add dpu_hw_wb abstraction for writeback blocks")
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > ---
> 
> It seems like WB UBWC formats are not supported today. Because otherwise 
> ctx->mdp would be used for writeback. I guess we can add a ubwc member 
> similar to hw_sspp, when we do add the support for this. Hence this is,

That seems preferable to me.  SSPP does the same in patch 3/3, and I
have been thinking to replace the dpu_mdss_cfg *catalog parameter in
dpu_hw_sspp_init with just the ubwc cfg pointer.  Likewise
dpu_hw_ctl_init also takes the full dpu_mdss_cfg only to take out the
mixers.

- Marijn

> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
