Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 905384092A0
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 16:14:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D846E0CC;
	Mon, 13 Sep 2021 14:14:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657916E0CC
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 14:14:21 +0000 (UTC)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl
 [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 6CC6A1F4B9;
 Mon, 13 Sep 2021 16:14:18 +0200 (CEST)
Date: Mon, 13 Sep 2021 16:14:17 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, abhinavk@codeaurora.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 konrad.dybcio@somainline.org, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 paul.bouchara@somainline.org
Subject: Re: [PATCH v2 2/2] drm/msm/dpu: Fix timeout issues on command mode
 panels
Message-ID: <20210913141417.7brqczhagufgqch2@SoMainline.org>
References: <20210911163919.47173-1-angelogioacchino.delregno@somainline.org>
 <20210911163919.47173-2-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210911163919.47173-2-angelogioacchino.delregno@somainline.org>
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

On 2021-09-11 18:39:19, AngeloGioacchino Del Regno wrote:
> In function dpu_encoder_phys_cmd_wait_for_commit_done we are always
> checking if the relative CTL is started by waiting for an interrupt
> to fire: it is fine to do that, but then sometimes we call this
> function while the CTL is up and has never been put down, but that
> interrupt gets raised only when the CTL gets a state change from
> 0 to 1 (disabled to enabled), so we're going to wait for something
> that will never happen on its own.
> 
> Solving this while avoiding to restart the CTL is actually possible
> and can be done by just checking if it is already up and running
> when the wait_for_commit_done function is called: in this case, so,
> if the CTL was already running, we can say that the commit is done
> if the command transmission is complete (in other terms, if the
> interface has been flushed).
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

This has unfortunately not solved any ctl_start timeout issues for me/us
on other platforms yet, but for the code:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index aa01698d6b25..aa5d3b3cef15 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -682,6 +682,9 @@ static int dpu_encoder_phys_cmd_wait_for_commit_done(
>  	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
>  		return 0;
>  
> +	if (phys_enc->hw_ctl->ops.is_started(phys_enc->hw_ctl))
> +		return dpu_encoder_phys_cmd_wait_for_tx_complete(phys_enc);
> +
>  	return _dpu_encoder_phys_cmd_wait_for_ctl_start(phys_enc);
>  }
>  
> -- 
> 2.32.0
> 
