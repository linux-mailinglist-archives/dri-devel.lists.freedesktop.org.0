Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C47BF70B0D9
	for <lists+dri-devel@lfdr.de>; Sun, 21 May 2023 23:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B9F010E1FE;
	Sun, 21 May 2023 21:31:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC6510E0E5
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 21:31:12 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 626C43F342;
 Sun, 21 May 2023 23:31:10 +0200 (CEST)
Date: Sun, 21 May 2023 23:31:09 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 1/3] drm/msm/dpu: drop
 dpu_encoder_phys_ops::late_register()
Message-ID: <qxs3qeycbnxcvsqoy3lrap7j7cuamhb7k4sfsic7aiu5b3zrmj@qjgd2ojhsysw>
References: <20230521192230.9747-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230521192230.9747-1-dmitry.baryshkov@linaro.org>
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

On 2023-05-21 22:22:28, Dmitry Baryshkov wrote:
> This callback has been unused since the driver being added. Drop it now.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 7 -------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h | 3 ---
>  2 files changed, 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1dc5dbe58572..c771383446f2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2115,7 +2115,6 @@ DEFINE_SHOW_ATTRIBUTE(_dpu_encoder_status);
>  static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
>  {
>  	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> -	int i;
>  
>  	char name[DPU_NAME_SIZE];
>  
> @@ -2134,12 +2133,6 @@ static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
>  	debugfs_create_file("status", 0600,
>  		dpu_enc->debugfs_root, dpu_enc, &_dpu_encoder_status_fops);
>  
> -	for (i = 0; i < dpu_enc->num_phys_encs; i++)
> -		if (dpu_enc->phys_encs[i]->ops.late_register)
> -			dpu_enc->phys_encs[i]->ops.late_register(
> -					dpu_enc->phys_encs[i],
> -					dpu_enc->debugfs_root);
> -
>  	return 0;
>  }
>  #else
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index 1d434b22180d..9e29079a6fc4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -63,7 +63,6 @@ struct dpu_encoder_phys;
>  /**
>   * struct dpu_encoder_phys_ops - Interface the physical encoders provide to
>   *	the containing virtual encoder.
> - * @late_register:		DRM Call. Add Userspace interfaces, debugfs.
>   * @prepare_commit:		MSM Atomic Call, start of atomic commit sequence
>   * @is_master:			Whether this phys_enc is the current master
>   *				encoder. Can be switched at enable time. Based
> @@ -93,8 +92,6 @@ struct dpu_encoder_phys;
>   */
>  
>  struct dpu_encoder_phys_ops {
> -	int (*late_register)(struct dpu_encoder_phys *encoder,
> -			struct dentry *debugfs_root);
>  	void (*prepare_commit)(struct dpu_encoder_phys *encoder);
>  	bool (*is_master)(struct dpu_encoder_phys *encoder);
>  	void (*atomic_mode_set)(struct dpu_encoder_phys *encoder,
> -- 
> 2.39.2
> 
