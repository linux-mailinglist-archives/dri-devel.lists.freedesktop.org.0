Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAC4B204AD
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 11:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC7F10E0CD;
	Mon, 11 Aug 2025 09:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5D57F10E0CD
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 09:59:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDF62152B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 02:59:05 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B525D3F738
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 02:59:13 -0700 (PDT)
Date: Mon, 11 Aug 2025 10:59:06 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Rahul Kumar <rk0006818@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
Subject: Re: [PATCH] drm/komeda: Convert logging in komeda_crtc.c to drm_*
 with drm_device parameter
Message-ID: <aJm-6pbrllD56Cx8@e110455-lin.cambridge.arm.com>
References: <20250811054459.15851-1-rk0006818@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250811054459.15851-1-rk0006818@gmail.com>
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

Hi,

On Mon, Aug 11, 2025 at 11:14:59AM +0530, Rahul Kumar wrote:
> Replace all dev_err(), dev_warn(), dev_info() and DRM_ERROR/WARN/INFO()
> calls in drivers/gpu/drm/arm/display/komeda/komeda_crtc.c with the
> corresponding drm_err(), drm_warn(), and drm_info() helpers.
> 
> The new drm_*() logging functions take a struct drm_device * as the
> first argument. This allows the DRM core to prefix log messages with
> the specific DRM device name and instance, which is essential for
> distinguishing logs when multiple GPUs or display controllers are present.
> 
> This change aligns komeda with the DRM TODO item: "Convert logging to
> drm_* functions with drm_device parameter".
> 
> Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
> ---
>  .../gpu/drm/arm/display/komeda/komeda_crtc.c  | 37 +++++++++++--------
>  1 file changed, 21 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> index 2ad33559a33a..b50ce3653ff6 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> @@ -111,6 +111,7 @@ komeda_crtc_atomic_check(struct drm_crtc *crtc,
>  static int
>  komeda_crtc_prepare(struct komeda_crtc *kcrtc)
>  {
> +	struct drm_device *drm = kcrtc->base.dev;
>  	struct komeda_dev *mdev = kcrtc->base.dev->dev_private;
>  	struct komeda_pipeline *master = kcrtc->master;
>  	struct komeda_crtc_state *kcrtc_st = to_kcrtc_st(kcrtc->base.state);
> @@ -128,8 +129,8 @@ komeda_crtc_prepare(struct komeda_crtc *kcrtc)
>  
>  	err = mdev->funcs->change_opmode(mdev, new_mode);
>  	if (err) {
> -		DRM_ERROR("failed to change opmode: 0x%x -> 0x%x.\n,",
> -			  mdev->dpmode, new_mode);
> +		drm_err(drm, "failed to change opmode: 0x%x -> 0x%x.\n,",
> +			mdev->dpmode, new_mode);
>  		goto unlock;
>  	}
>  
> @@ -142,18 +143,18 @@ komeda_crtc_prepare(struct komeda_crtc *kcrtc)
>  	if (new_mode != KOMEDA_MODE_DUAL_DISP) {
>  		err = clk_set_rate(mdev->aclk, komeda_crtc_get_aclk(kcrtc_st));
>  		if (err)
> -			DRM_ERROR("failed to set aclk.\n");
> +			drm_err(drm, "failed to set aclk.\n");
>  		err = clk_prepare_enable(mdev->aclk);
>  		if (err)
> -			DRM_ERROR("failed to enable aclk.\n");
> +			drm_err(drm, "failed to enable aclk.\n");
>  	}
>  
>  	err = clk_set_rate(master->pxlclk, mode->crtc_clock * 1000);
>  	if (err)
> -		DRM_ERROR("failed to set pxlclk for pipe%d\n", master->id);
> +		drm_err(drm, "failed to set pxlclk for pipe%d\n", master->id);
>  	err = clk_prepare_enable(master->pxlclk);
>  	if (err)
> -		DRM_ERROR("failed to enable pxl clk for pipe%d.\n", master->id);
> +		drm_err(drm, "failed to enable pxl clk for pipe%d.\n", master->id);
>  
>  unlock:
>  	mutex_unlock(&mdev->lock);
> @@ -164,6 +165,7 @@ komeda_crtc_prepare(struct komeda_crtc *kcrtc)
>  static int
>  komeda_crtc_unprepare(struct komeda_crtc *kcrtc)
>  {
> +	struct drm_device *drm = kcrtc->base.dev;
>  	struct komeda_dev *mdev = kcrtc->base.dev->dev_private;
>  	struct komeda_pipeline *master = kcrtc->master;
>  	u32 new_mode;
> @@ -180,8 +182,8 @@ komeda_crtc_unprepare(struct komeda_crtc *kcrtc)
>  
>  	err = mdev->funcs->change_opmode(mdev, new_mode);
>  	if (err) {
> -		DRM_ERROR("failed to change opmode: 0x%x -> 0x%x.\n,",
> -			  mdev->dpmode, new_mode);
> +		drm_err(drm, "failed to change opmode: 0x%x -> 0x%x.\n,",
> +			mdev->dpmode, new_mode);
>  		goto unlock;
>  	}
>  
> @@ -200,6 +202,7 @@ komeda_crtc_unprepare(struct komeda_crtc *kcrtc)
>  void komeda_crtc_handle_event(struct komeda_crtc   *kcrtc,
>  			      struct komeda_events *evts)
>  {
> +	struct drm_device *drm = kcrtc->base.dev;
>  	struct drm_crtc *crtc = &kcrtc->base;
>  	u32 events = evts->pipes[kcrtc->master->id];
>  
> @@ -212,7 +215,7 @@ void komeda_crtc_handle_event(struct komeda_crtc   *kcrtc,
>  		if (wb_conn)
>  			drm_writeback_signal_completion(&wb_conn->base, 0);
>  		else
> -			DRM_WARN("CRTC[%d]: EOW happen but no wb_connector.\n",
> +			drm_warn(drm, "CRTC[%d]: EOW happen but no wb_connector.\n",
>  				 drm_crtc_index(&kcrtc->base));
>  	}
>  	/* will handle it together with the write back support */
> @@ -236,7 +239,7 @@ void komeda_crtc_handle_event(struct komeda_crtc   *kcrtc,
>  			crtc->state->event = NULL;
>  			drm_crtc_send_vblank_event(crtc, event);
>  		} else {
> -			DRM_WARN("CRTC[%d]: FLIP happened but no pending commit.\n",
> +			drm_warn(drm, "CRTC[%d]: FLIP happened but no pending commit.\n",
>  				 drm_crtc_index(&kcrtc->base));
>  		}
>  		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
> @@ -309,7 +312,7 @@ komeda_crtc_flush_and_wait_for_flip_done(struct komeda_crtc *kcrtc,
>  
>  	/* wait the flip take affect.*/
>  	if (wait_for_completion_timeout(flip_done, HZ) == 0) {
> -		DRM_ERROR("wait pipe%d flip done timeout\n", kcrtc->master->id);
> +		drm_err(drm, "wait pipe%d flip done timeout\n", kcrtc->master->id);
>  		if (!input_flip_done) {
>  			unsigned long flags;
>  
> @@ -562,6 +565,7 @@ static const struct drm_crtc_funcs komeda_crtc_funcs = {
>  int komeda_kms_setup_crtcs(struct komeda_kms_dev *kms,
>  			   struct komeda_dev *mdev)
>  {
> +	struct drm_device *drm = &kms->base;
>  	struct komeda_crtc *crtc;
>  	struct komeda_pipeline *master;
>  	char str[16];
> @@ -581,7 +585,7 @@ int komeda_kms_setup_crtcs(struct komeda_kms_dev *kms,
>  		else
>  			sprintf(str, "None");
>  
> -		DRM_INFO("CRTC-%d: master(pipe-%d) slave(%s).\n",
> +		drm_info(drm, "CRTC-%d: master(pipe-%d) slave(%s).\n",
>  			 kms->n_crtcs, master->id, str);
>  
>  		kms->n_crtcs++;
> @@ -609,10 +613,11 @@ get_crtc_primary(struct komeda_kms_dev *kms, struct komeda_crtc *crtc)
>  	return NULL;
>  }
>  
> -static int komeda_attach_bridge(struct device *dev,
> -				struct komeda_pipeline *pipe,
> +static int komeda_attach_bridge(struct komeda_pipeline *pipe,
>  				struct drm_encoder *encoder)
>  {
> +	struct drm_device *drm = pipe->mdev->drm;

As the kernel build bot has already said, there is no struct drm_device in komeda_dev. Not
sure what you're getting by trying to remove that parameter though.

Best regards,
Liviu


> +	struct device *dev = drm->dev;
>  	struct drm_bridge *bridge;
>  	int err;
>  
> @@ -624,7 +629,7 @@ static int komeda_attach_bridge(struct device *dev,
>  
>  	err = drm_bridge_attach(encoder, bridge, NULL, 0);
>  	if (err)
> -		dev_err(dev, "bridge_attach() failed for pipe: %s\n",
> +		drm_err(drm, "bridge_attach() failed for pipe: %s\n",
>  			of_node_full_name(pipe->of_node));
>  
>  	return err;
> @@ -658,7 +663,7 @@ static int komeda_crtc_add(struct komeda_kms_dev *kms,
>  		return err;
>  
>  	if (pipe->of_output_links[0]) {
> -		err = komeda_attach_bridge(base->dev, pipe, encoder);
> +		err = komeda_attach_bridge(pipe, encoder);
>  		if (err)
>  			return err;
>  	}
> -- 
> 2.43.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
