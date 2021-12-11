Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C40E4716C6
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 22:35:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F13710E753;
	Sat, 11 Dec 2021 21:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D4810E60E
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Dec 2021 21:35:32 +0000 (UTC)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl
 [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 1BA26202F2;
 Sat, 11 Dec 2021 22:35:30 +0100 (CET)
Date: Sat, 11 Dec 2021 22:35:28 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH v2 2/2] drm/msm/dpu: Fix timeout issues on command mode
 panels
Message-ID: <20211211213528.uroqfdksvokspbxf@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, robdclark@gmail.com,
 sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 abhinavk@codeaurora.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org
References: <20210911163919.47173-1-angelogioacchino.delregno@somainline.org>
 <20210911163919.47173-2-angelogioacchino.delregno@somainline.org>
 <b325fc8d-e06b-36de-b40a-b5ffbcebb1c5@linaro.org>
 <94bedea3-0e5f-5ae8-79d1-ceb17ccdea23@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94bedea3-0e5f-5ae8-79d1-ceb17ccdea23@somainline.org>
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, konrad.dybcio@somainline.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 paul.bouchara@somainline.org, martin.botka@somainline.org,
 dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, phone-devel@vger.kernel.org,
 sean@poorly.run, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-12-09 18:02:40, AngeloGioacchino Del Regno wrote:
> Il 02/10/21 00:33, Dmitry Baryshkov ha scritto:
> > On 11/09/2021 19:39, AngeloGioacchino Del Regno wrote:
> >> [..]
> > I've compared this with the MDP5 driver, where we always wait for PP_DONE 
> > interrupt. Would it be enough to always wait for it (= always call 
> > dpu_encoder_phys_cmd_wait_for_tx_complete())?
> > 
> 
> Jokes apart, yes it would make sense to do that, it's something that works
> at least... but we should verify that such a thing doesn't break new platforms
> (like sm8150 and newer).

On sm6125 (keeping in mind that we're on llvmpipe, will bring up the GPU
later) none of this hurts the display:

- Without this patch, so only checking for wait_for_ctl_start;
- With this patch, checking for idle if it was already started;
- With this patch altered to only ever call wait_for_tx_complete (wait
  for idle), in place of wait_for_ctl_start.

Working in the sense that glxgears, which actually reports a framerate
of approx 170 despite being on llvmpipe on an SoC that is still in
snail-mode, seems to update (commit) the panel smoothly on every
occasion.

On this note, does it perhaps make more sense to call the "internal"
_dpu_encoder_phys_cmd_wait_for_idle function directly, instead of going
through the "public" dpu_encoder_phys_cmd_wait_for_tx_complete which
seems solely intended to handle the wait_for_tx_complete callback?

- Marijn
