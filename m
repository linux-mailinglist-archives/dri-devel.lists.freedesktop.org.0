Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F37437FC1
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 23:06:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650F46E5B9;
	Fri, 22 Oct 2021 21:06:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835406EDD5
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 21:06:38 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634936801; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=KxZsOka7xb/jrtEPxBz99kS0XgIspD8USAoo2CE9OAE=;
 b=VLFdu5ApR43XGXVQ4inFDreAn4XpCd7j1gAtBCjPVuyFEC5MHXCkGp87t/XX967YIBI7f8Fz
 xVT63jYiTFinwDWrZWQrmzEET96C8SqMScjbe6714AcF3llcm4SPSvGwCZADimfAuLzwKY+X
 Zj2QyD0tHMU1bEIJB2lzJ0QB0bg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 617327d9fd91319f0facf1f0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 22 Oct 2021 21:06:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3FD38C4360C; Fri, 22 Oct 2021 21:06:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1896DC4338F;
 Fri, 22 Oct 2021 21:06:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 22 Oct 2021 14:06:31 -0700
From: abhinavk@codeaurora.org
To: Sean Paul <sean@poorly.run>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, swboyd@chromium.org,
 jani.nikula@linux.intel.com, Sean Paul <seanpaul@chromium.org>, Rob Clark
 <robdclark@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 10/14] drm/msm/dpu: Remove encoder->enable() hack
In-Reply-To: <20211001151145.55916-11-sean@poorly.run>
References: <20211001151145.55916-1-sean@poorly.run>
 <20211001151145.55916-11-sean@poorly.run>
Message-ID: <dcaa555f11bf7cdbb7a4214a9a58c0c0@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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

On 2021-10-01 08:11, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> encoder->commit() was being misused because there were some global
> resources which needed to be tweaked in encoder->enable() which were 
> not
> accessible in dpu_encoder.c. That is no longer true and the redirect
> serves no purpose any longer. So remove the indirection.
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Tested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-11-sean@poorly.run
> #v1
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-11-sean@poorly.run
> #v2
> 
> Changes in v2:
> -None
> Changes in v3:
> -None
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  5 +----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 22 ---------------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  2 --
>  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h   |  4 ----
>  4 files changed, 1 insertion(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 984f8a59cb73..ddc542a0d41f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2122,11 +2122,8 @@ static void
> dpu_encoder_frame_done_timeout(struct timer_list *t)
>  static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs 
> = {
>  	.mode_set = dpu_encoder_virt_mode_set,
>  	.disable = dpu_encoder_virt_disable,
> -	.enable = dpu_kms_encoder_enable,
> +	.enable = dpu_encoder_virt_enable,
>  	.atomic_check = dpu_encoder_virt_atomic_check,
> -
> -	/* This is called by dpu_kms_encoder_enable */
> -	.commit = dpu_encoder_virt_enable,
>  };
> 
>  static const struct drm_encoder_funcs dpu_encoder_funcs = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index fb0d9f781c66..4a0b55d145ad 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -381,28 +381,6 @@ static void dpu_kms_flush_commit(struct msm_kms
> *kms, unsigned crtc_mask)
>  	}
>  }
> 
> -/*
> - * Override the encoder enable since we need to setup the inline 
> rotator and do
> - * some crtc magic before enabling any bridge that might be present.
> - */
> -void dpu_kms_encoder_enable(struct drm_encoder *encoder)
> -{
> -	const struct drm_encoder_helper_funcs *funcs = 
> encoder->helper_private;
> -	struct drm_device *dev = encoder->dev;
> -	struct drm_crtc *crtc;
> -
> -	/* Forward this enable call to the commit hook */
> -	if (funcs && funcs->commit)
> -		funcs->commit(encoder);
> -
> -	drm_for_each_crtc(crtc, dev) {
> -		if (!(crtc->state->encoder_mask & drm_encoder_mask(encoder)))
> -			continue;
> -
> -		trace_dpu_kms_enc_enable(DRMID(crtc));
> -	}
> -}
> -
>  static void dpu_kms_complete_commit(struct msm_kms *kms, unsigned 
> crtc_mask)
>  {
>  	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index 323a6bce9e64..f1ebb60dacab 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -248,8 +248,6 @@ void *dpu_debugfs_get_root(struct dpu_kms 
> *dpu_kms);
>  int dpu_enable_vblank(struct msm_kms *kms, struct drm_crtc *crtc);
>  void dpu_disable_vblank(struct msm_kms *kms, struct drm_crtc *crtc);
> 
> -void dpu_kms_encoder_enable(struct drm_encoder *encoder);
> -
>  /**
>   * dpu_kms_get_clk_rate() - get the clock rate
>   * @dpu_kms:  pointer to dpu_kms structure
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> index 37bba57675a8..54d74341e690 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> @@ -266,10 +266,6 @@ DEFINE_EVENT(dpu_drm_obj_template,
> dpu_crtc_complete_commit,
>  	TP_PROTO(uint32_t drm_id),
>  	TP_ARGS(drm_id)
>  );
> -DEFINE_EVENT(dpu_drm_obj_template, dpu_kms_enc_enable,
> -	TP_PROTO(uint32_t drm_id),
> -	TP_ARGS(drm_id)
> -);
>  DEFINE_EVENT(dpu_drm_obj_template, dpu_kms_commit,
>  	TP_PROTO(uint32_t drm_id),
>  	TP_ARGS(drm_id)
