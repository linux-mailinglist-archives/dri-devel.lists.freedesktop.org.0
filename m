Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E14FA196FC
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 17:55:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 367F510E785;
	Wed, 22 Jan 2025 16:55:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51CCF10E780
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 16:55:30 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id C4CAA40ADD;
 Wed, 22 Jan 2025 17:54:57 +0100 (CET)
Date: Wed, 22 Jan 2025 17:54:56 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] drm/msm/dpu: Fall back to a single DSC encoder
 (1:1:1) on small SoCs
Message-ID: <6g3dfqm274ykypbyz4sckyisg2t67ch7mvh2h6lbkt2lv5unaf@5jcffdimidmw>
References: <20250121-dpu-111-topology-v1-1-d01987205c53@somainline.org>
 <D77VIRU2Z0L9.20OBL2OMAIA7I@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D77VIRU2Z0L9.20OBL2OMAIA7I@fairphone.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2025-01-21 16:58:24, Luca Weiss wrote:
> Hi Marijn,
> 
> On Tue Jan 21, 2025 at 12:06 AM CET, Marijn Suijten wrote:
> > Some SoCs such as SC7280 (used in the FairPhone 5) have only a single
> > DSC "hard slice" encoder.  The current hardcoded use of 2:2:1 topology
> > (2 LM and 2 DSC for a single interface) make it impossible to use
> > Display Stream Compression panels with mainline, which is exactly what's
> > installed on the FairPhone 5.
> 
> Nitpick, if you send another revision: s/FairPhone/Fairphone/
> 
> >
> > By loosening the hardcoded `num_dsc = 2` to fall back to `num_dsc =
> > 1` when the catalog only contains one entry, we can trivially support
> > this phone and unblock further panel enablement on mainline.  A few
> > more supporting changes in this patch ensure hardcoded constants of 2
> > DSC encoders are replaced to count or read back the actual number of
> > DSC hardware blocks that are enabled for the given virtual encoder.
> > Likewise DSC_MODE_SPLIT_PANEL can no longer be unconditionally enabled.
> 
> This unblocks panel enablement on upstream without any hacks on top.
> Many thanks!
> 
> Tested-by: Luca Weiss <luca.weiss@fairphone.com>

Thanks!  I fixed the Fairphone capitalization typo but forgot to roll up
your t-b (something about this being a long time ago and forgetting to run b4
trailers -u), but then the patch changed a little bit.

- Marijn
