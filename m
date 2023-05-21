Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 607E070B0E6
	for <lists+dri-devel@lfdr.de>; Sun, 21 May 2023 23:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4120110E207;
	Sun, 21 May 2023 21:37:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AEF610E20D
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 21:37:10 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 56CBF3F260;
 Sun, 21 May 2023 23:37:09 +0200 (CEST)
Date: Sun, 21 May 2023 23:37:08 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 3/3] drm/msm/dpu: switch dpu_encoder to use
 drm_debugfs_add_file()
Message-ID: <7wyze3xlzueeo62q7fxt2habuv5g4tq4xrocz7df4do4m65npg@zf76pixxityu>
References: <20230521192230.9747-1-dmitry.baryshkov@linaro.org>
 <20230521192230.9747-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230521192230.9747-3-dmitry.baryshkov@linaro.org>
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

On 2023-05-21 22:22:30, Dmitry Baryshkov wrote:
> Use drm_debugfs_add_file() for encoder's status file. This changes the
> name of the status file from encoder%d/status to just encoder%d.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Also nice that this is a managed variant so that we don't have to clean
up the debugfs entries manually.

There's also an unused @debugfs_root: doc in dpu_core_perf.h, though
that has nothing to do with this patch.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 40 ++++++---------------
>  1 file changed, 11 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index af34932729db..0ac68f44ec74 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -14,6 +14,7 @@
>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_crtc.h>
> +#include <drm/drm_debugfs.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_probe_helper.h>
>  
> @@ -142,7 +143,6 @@ enum dpu_enc_rc_states {
>   * @crtc_kickoff_cb:		Callback into CRTC that will flush & start
>   *				all CTL paths
>   * @crtc_kickoff_cb_data:	Opaque user data given to crtc_kickoff_cb
> - * @debugfs_root:		Debug file system root file node
>   * @enc_lock:			Lock around physical encoder
>   *				create/destroy/enable/disable
>   * @frame_busy_mask:		Bitmask tracking which phys_enc we are still
> @@ -186,7 +186,6 @@ struct dpu_encoder_virt {
>  	struct drm_crtc *crtc;
>  	struct drm_connector *connector;
>  
> -	struct dentry *debugfs_root;
>  	struct mutex enc_lock;
>  	DECLARE_BITMAP(frame_busy_mask, MAX_PHYS_ENCODERS_PER_VIRTUAL);
>  	void (*crtc_frame_event_cb)(void *, u32 event);
> @@ -2091,7 +2090,8 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>  #ifdef CONFIG_DEBUG_FS
>  static int _dpu_encoder_status_show(struct seq_file *s, void *data)
>  {
> -	struct dpu_encoder_virt *dpu_enc = s->private;
> +	struct drm_debugfs_entry *entry = s->private;
> +	struct dpu_encoder_virt *dpu_enc = entry->file.data;
>  	int i;
>  
>  	mutex_lock(&dpu_enc->enc_lock);
> @@ -2110,48 +2110,31 @@ static int _dpu_encoder_status_show(struct seq_file *s, void *data)
>  	return 0;
>  }
>  
> -DEFINE_SHOW_ATTRIBUTE(_dpu_encoder_status);
> -
> -static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
> +static void _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
>  {
>  	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> -
> -	char name[12];
> +	char *name;
>  
>  	if (!drm_enc->dev) {
>  		DPU_ERROR("invalid encoder or kms\n");
> -		return -EINVAL;
> +		return;
>  	}
>  
> -	snprintf(name, sizeof(name), "encoder%u", drm_enc->base.id);
> +	name = devm_kasprintf(drm_enc->dev->dev, GFP_KERNEL, "encoder%u", drm_enc->base.id);
>  
> -	/* create overall sub-directory for the encoder */
> -	dpu_enc->debugfs_root = debugfs_create_dir(name,
> -			drm_enc->dev->primary->debugfs_root);
> -
> -	/* don't error check these */
> -	debugfs_create_file("status", 0600,
> -		dpu_enc->debugfs_root, dpu_enc, &_dpu_encoder_status_fops);
> -
> -	return 0;
> +	drm_debugfs_add_file(drm_enc->dev, name, _dpu_encoder_status_show, dpu_enc);
>  }
>  #else
> -static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
> +static void _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
>  {
> -	return 0;
>  }
>  #endif
>  
>  static int dpu_encoder_late_register(struct drm_encoder *encoder)
>  {
> -	return _dpu_encoder_init_debugfs(encoder);
> -}
> -
> -static void dpu_encoder_early_unregister(struct drm_encoder *encoder)
> -{
> -	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
> +	_dpu_encoder_init_debugfs(encoder);
>  
> -	debugfs_remove_recursive(dpu_enc->debugfs_root);
> +	return 0;
>  }
>  
>  static int dpu_encoder_virt_add_phys_encs(
> @@ -2380,7 +2363,6 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
>  static const struct drm_encoder_funcs dpu_encoder_funcs = {
>  		.destroy = dpu_encoder_destroy,
>  		.late_register = dpu_encoder_late_register,
> -		.early_unregister = dpu_encoder_early_unregister,
>  };
>  
>  int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
> -- 
> 2.39.2
> 
