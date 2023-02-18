Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C5169B97A
	for <lists+dri-devel@lfdr.de>; Sat, 18 Feb 2023 11:45:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFCDF10E186;
	Sat, 18 Feb 2023 10:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03BB910E0AD
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Feb 2023 10:45:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 46A1360B42;
 Sat, 18 Feb 2023 10:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2FFFC4339B;
 Sat, 18 Feb 2023 10:45:05 +0000 (UTC)
Message-ID: <c70e40fe-6834-2382-ec89-28714a67fd1f@xs4all.nl>
Date: Sat, 18 Feb 2023 11:45:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/9] drm/vc4: Switch to container_of_const
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20221207-rpi-hdmi-improvements-v2-0-8ace2d8221ad@cerno.tech>
 <20221207-rpi-hdmi-improvements-v2-1-8ace2d8221ad@cerno.tech>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20221207-rpi-hdmi-improvements-v2-1-8ace2d8221ad@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 26/01/2023 14:46, Maxime Ripard wrote:
> container_of_const() allows to preserve the pointer constness and is
> thus more flexible than inline functions.
> 
> Let's switch all our instances of container_of() to
> container_of_const().
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/tests/vc4_mock.h        |  3 ++
>  drivers/gpu/drm/vc4/tests/vc4_mock_output.c |  4 +-
>  drivers/gpu/drm/vc4/vc4_bo.c                |  2 +-
>  drivers/gpu/drm/vc4/vc4_crtc.c              |  4 +-
>  drivers/gpu/drm/vc4/vc4_dpi.c               |  7 +---
>  drivers/gpu/drm/vc4/vc4_drv.h               | 65 +++++++++--------------------
>  drivers/gpu/drm/vc4/vc4_dsi.c               | 19 ++++-----
>  drivers/gpu/drm/vc4/vc4_gem.c               |  7 ++--
>  drivers/gpu/drm/vc4/vc4_hdmi.c              |  7 ++--
>  drivers/gpu/drm/vc4/vc4_hdmi.h              | 16 +++----
>  drivers/gpu/drm/vc4/vc4_irq.c               |  2 +-
>  drivers/gpu/drm/vc4/vc4_kms.c               | 16 +++----
>  drivers/gpu/drm/vc4/vc4_plane.c             |  2 +-
>  drivers/gpu/drm/vc4/vc4_txp.c               | 12 ++----
>  drivers/gpu/drm/vc4/vc4_v3d.c               |  2 +-
>  drivers/gpu/drm/vc4/vc4_vec.c               | 14 ++-----
>  16 files changed, 65 insertions(+), 117 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock.h b/drivers/gpu/drm/vc4/tests/vc4_mock.h
> index db8e9a141ef8..2d0b339bd9f3 100644
> --- a/drivers/gpu/drm/vc4/tests/vc4_mock.h
> +++ b/drivers/gpu/drm/vc4/tests/vc4_mock.h
> @@ -43,6 +43,9 @@ struct vc4_dummy_output {
>  	struct drm_connector connector;
>  };
>  
> +#define encoder_to_vc4_dummy_output(_enc)				\
> +	container_of_const(_enc, struct vc4_dummy_output, encoder.base)

I think it is OKish to do this in a define like this, but...

> +
>  struct vc4_dummy_output *vc4_dummy_output(struct kunit *test,
>  					  struct drm_device *drm,
>  					  struct drm_crtc *crtc,
> diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock_output.c b/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
> index 8d33be828d9a..6e11fcc9ef45 100644
> --- a/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
> +++ b/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
> @@ -80,7 +80,7 @@ int vc4_mock_atomic_add_output(struct kunit *test,
>  	crtc = vc4_find_crtc_for_encoder(test, drm, encoder);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc);
>  
> -	output = container_of(encoder, struct vc4_dummy_output, encoder.base);
> +	output = encoder_to_vc4_dummy_output(encoder);
>  	conn = &output->connector;
>  	conn_state = drm_atomic_get_connector_state(state, conn);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
> @@ -126,7 +126,7 @@ int vc4_mock_atomic_del_output(struct kunit *test,
>  	ret = drm_atomic_set_mode_for_crtc(crtc_state, NULL);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
> -	output = container_of(encoder, struct vc4_dummy_output, encoder.base);
> +	output = encoder_to_vc4_dummy_output(encoder);
>  	conn = &output->connector;
>  	conn_state = drm_atomic_get_connector_state(state, conn);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
> diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
> index 86d629e45307..d0a00ed42cb0 100644
> --- a/drivers/gpu/drm/vc4/vc4_bo.c
> +++ b/drivers/gpu/drm/vc4/vc4_bo.c
> @@ -609,7 +609,7 @@ static void vc4_free_object(struct drm_gem_object *gem_bo)
>  static void vc4_bo_cache_time_work(struct work_struct *work)
>  {
>  	struct vc4_dev *vc4 =
> -		container_of(work, struct vc4_dev, bo_cache.time_work);
> +		container_of_const(work, struct vc4_dev, bo_cache.time_work);

...I think this is misleading. It's definitely not const, so switching to
container_of_const suggests that there is some 'constness' involved, which
isn't the case. I'd leave this just as 'container_of'. This also reduces the
size of the patch, since this is done in quite a few places.

Regards,

	Hans

>  	struct drm_device *dev = &vc4->base;
>  
>  	mutex_lock(&vc4->bo_lock);
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index cdc0559221f0..4425dc15308d 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -869,7 +869,7 @@ vc4_async_page_flip_complete(struct vc4_async_flip_state *flip_state)
>  static void vc4_async_page_flip_seqno_complete(struct vc4_seqno_cb *cb)
>  {
>  	struct vc4_async_flip_state *flip_state =
> -		container_of(cb, struct vc4_async_flip_state, cb.seqno);
> +		container_of_const(cb, struct vc4_async_flip_state, cb.seqno);
>  	struct vc4_bo *bo = NULL;
>  
>  	if (flip_state->old_fb) {
> @@ -897,7 +897,7 @@ static void vc4_async_page_flip_fence_complete(struct dma_fence *fence,
>  					       struct dma_fence_cb *cb)
>  {
>  	struct vc4_async_flip_state *flip_state =
> -		container_of(cb, struct vc4_async_flip_state, cb.fence);
> +		container_of_const(cb, struct vc4_async_flip_state, cb.fence);
>  
>  	vc4_async_page_flip_complete(flip_state);
>  	dma_fence_put(fence);
> diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
> index f518d6e59ed6..e68c07d86040 100644
> --- a/drivers/gpu/drm/vc4/vc4_dpi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dpi.c
> @@ -97,11 +97,8 @@ struct vc4_dpi {
>  	struct debugfs_regset32 regset;
>  };
>  
> -static inline struct vc4_dpi *
> -to_vc4_dpi(struct drm_encoder *encoder)
> -{
> -	return container_of(encoder, struct vc4_dpi, encoder.base);
> -}
> +#define to_vc4_dpi(_encoder)						\
> +	container_of_const(_encoder, struct vc4_dpi, encoder.base)
>  
>  #define DPI_READ(offset)								\
>  	({										\
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index 95069bb16821..e23084f3d6c2 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -232,11 +232,8 @@ struct vc4_dev {
>  	struct kref bin_bo_kref;
>  };
>  
> -static inline struct vc4_dev *
> -to_vc4_dev(const struct drm_device *dev)
> -{
> -	return container_of(dev, struct vc4_dev, base);
> -}
> +#define to_vc4_dev(_dev)			\
> +	container_of_const(_dev, struct vc4_dev, base)
>  
>  struct vc4_bo {
>  	struct drm_gem_dma_object base;
> @@ -285,11 +282,8 @@ struct vc4_bo {
>  	struct mutex madv_lock;
>  };
>  
> -static inline struct vc4_bo *
> -to_vc4_bo(const struct drm_gem_object *bo)
> -{
> -	return container_of(to_drm_gem_dma_obj(bo), struct vc4_bo, base);
> -}
> +#define to_vc4_bo(_bo)							\
> +	container_of_const(to_drm_gem_dma_obj(_bo), struct vc4_bo, base)
>  
>  struct vc4_fence {
>  	struct dma_fence base;
> @@ -298,11 +292,8 @@ struct vc4_fence {
>  	uint64_t seqno;
>  };
>  
> -static inline struct vc4_fence *
> -to_vc4_fence(const struct dma_fence *fence)
> -{
> -	return container_of(fence, struct vc4_fence, base);
> -}
> +#define to_vc4_fence(_fence)					\
> +	container_of_const(_fence, struct vc4_fence, base)
>  
>  struct vc4_seqno_cb {
>  	struct work_struct work;
> @@ -368,11 +359,8 @@ struct vc4_hvs_state {
>  	} fifo_state[HVS_NUM_CHANNELS];
>  };
>  
> -static inline struct vc4_hvs_state *
> -to_vc4_hvs_state(const struct drm_private_state *priv)
> -{
> -	return container_of(priv, struct vc4_hvs_state, base);
> -}
> +#define to_vc4_hvs_state(_state)				\
> +	container_of_const(_state, struct vc4_hvs_state, base)
>  
>  struct vc4_hvs_state *vc4_hvs_get_global_state(struct drm_atomic_state *state);
>  struct vc4_hvs_state *vc4_hvs_get_old_global_state(const struct drm_atomic_state *state);
> @@ -382,11 +370,8 @@ struct vc4_plane {
>  	struct drm_plane base;
>  };
>  
> -static inline struct vc4_plane *
> -to_vc4_plane(const struct drm_plane *plane)
> -{
> -	return container_of(plane, struct vc4_plane, base);
> -}
> +#define to_vc4_plane(_plane)					\
> +	container_of_const(_plane, struct vc4_plane, base)
>  
>  enum vc4_scaling_mode {
>  	VC4_SCALING_NONE,
> @@ -458,11 +443,8 @@ struct vc4_plane_state {
>  	u64 membus_load;
>  };
>  
> -static inline struct vc4_plane_state *
> -to_vc4_plane_state(const struct drm_plane_state *state)
> -{
> -	return container_of(state, struct vc4_plane_state, base);
> -}
> +#define to_vc4_plane_state(_state)				\
> +	container_of_const(_state, struct vc4_plane_state, base)
>  
>  enum vc4_encoder_type {
>  	VC4_ENCODER_TYPE_NONE,
> @@ -489,11 +471,8 @@ struct vc4_encoder {
>  	void (*post_crtc_powerdown)(struct drm_encoder *encoder, struct drm_atomic_state *state);
>  };
>  
> -static inline struct vc4_encoder *
> -to_vc4_encoder(const struct drm_encoder *encoder)
> -{
> -	return container_of(encoder, struct vc4_encoder, base);
> -}
> +#define to_vc4_encoder(_encoder)				\
> +	container_of_const(_encoder, struct vc4_encoder, base)
>  
>  static inline
>  struct drm_encoder *vc4_find_encoder_by_type(struct drm_device *drm,
> @@ -591,11 +570,8 @@ struct vc4_crtc {
>  	unsigned int current_hvs_channel;
>  };
>  
> -static inline struct vc4_crtc *
> -to_vc4_crtc(const struct drm_crtc *crtc)
> -{
> -	return container_of(crtc, struct vc4_crtc, base);
> -}
> +#define to_vc4_crtc(_crtc)					\
> +	container_of_const(_crtc, struct vc4_crtc, base)
>  
>  static inline const struct vc4_crtc_data *
>  vc4_crtc_to_vc4_crtc_data(const struct vc4_crtc *crtc)
> @@ -608,7 +584,7 @@ vc4_crtc_to_vc4_pv_data(const struct vc4_crtc *crtc)
>  {
>  	const struct vc4_crtc_data *data = vc4_crtc_to_vc4_crtc_data(crtc);
>  
> -	return container_of(data, struct vc4_pv_data, base);
> +	return container_of_const(data, struct vc4_pv_data, base);
>  }
>  
>  struct drm_encoder *vc4_get_crtc_encoder(struct drm_crtc *crtc,
> @@ -636,11 +612,8 @@ struct vc4_crtc_state {
>  
>  #define VC4_HVS_CHANNEL_DISABLED ((unsigned int)-1)
>  
> -static inline struct vc4_crtc_state *
> -to_vc4_crtc_state(const struct drm_crtc_state *crtc_state)
> -{
> -	return container_of(crtc_state, struct vc4_crtc_state, base);
> -}
> +#define to_vc4_crtc_state(_state)				\
> +	container_of_const(_state, struct vc4_crtc_state, base)
>  
>  #define V3D_READ(offset)								\
>  	({										\
> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
> index a5c075f802e4..0923680f2b2b 100644
> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> @@ -600,19 +600,14 @@ struct vc4_dsi {
>  	struct debugfs_regset32 regset;
>  };
>  
> -#define host_to_dsi(host) container_of(host, struct vc4_dsi, dsi_host)
> +#define host_to_dsi(host)					\
> +	container_of_const(host, struct vc4_dsi, dsi_host)
>  
> -static inline struct vc4_dsi *
> -to_vc4_dsi(struct drm_encoder *encoder)
> -{
> -	return container_of(encoder, struct vc4_dsi, encoder.base);
> -}
> +#define to_vc4_dsi(_encoder)					\
> +	container_of_const(_encoder, struct vc4_dsi, encoder.base)
>  
> -static inline struct vc4_dsi *
> -bridge_to_vc4_dsi(struct drm_bridge *bridge)
> -{
> -	return container_of(bridge, struct vc4_dsi, bridge);
> -}
> +#define bridge_to_vc4_dsi(_bridge)				\
> +	container_of_const(_bridge, struct vc4_dsi, bridge)
>  
>  static inline void
>  dsi_dma_workaround_write(struct vc4_dsi *dsi, u32 offset, u32 val)
> @@ -1625,7 +1620,7 @@ static void vc4_dsi_dma_chan_release(void *ptr)
>  static void vc4_dsi_release(struct kref *kref)
>  {
>  	struct vc4_dsi *dsi =
> -		container_of(kref, struct vc4_dsi, kref);
> +		container_of_const(kref, struct vc4_dsi, kref);
>  
>  	kfree(dsi);
>  }
> diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
> index 628d40ff3aa1..0cb2e86edbf3 100644
> --- a/drivers/gpu/drm/vc4/vc4_gem.c
> +++ b/drivers/gpu/drm/vc4/vc4_gem.c
> @@ -315,7 +315,7 @@ static void
>  vc4_reset_work(struct work_struct *work)
>  {
>  	struct vc4_dev *vc4 =
> -		container_of(work, struct vc4_dev, hangcheck.reset_work);
> +		container_of_const(work, struct vc4_dev, hangcheck.reset_work);
>  
>  	vc4_save_hang_state(&vc4->base);
>  
> @@ -1039,7 +1039,8 @@ vc4_job_handle_completed(struct vc4_dev *vc4)
>  
>  static void vc4_seqno_cb_work(struct work_struct *work)
>  {
> -	struct vc4_seqno_cb *cb = container_of(work, struct vc4_seqno_cb, work);
> +	struct vc4_seqno_cb *cb =
> +		container_of_const(work, struct vc4_seqno_cb, work);
>  
>  	cb->func(cb);
>  }
> @@ -1077,7 +1078,7 @@ static void
>  vc4_job_done_work(struct work_struct *work)
>  {
>  	struct vc4_dev *vc4 =
> -		container_of(work, struct vc4_dev, job_done_work);
> +		container_of_const(work, struct vc4_dev, job_done_work);
>  
>  	vc4_job_handle_completed(vc4);
>  }
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 14628864487a..b3e7030305ea 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -948,9 +948,10 @@ static void vc4_hdmi_disable_scrambling(struct drm_encoder *encoder)
>  
>  static void vc4_hdmi_scrambling_wq(struct work_struct *work)
>  {
> -	struct vc4_hdmi *vc4_hdmi = container_of(to_delayed_work(work),
> -						 struct vc4_hdmi,
> -						 scrambling_work);
> +	struct vc4_hdmi *vc4_hdmi =
> +		container_of_const(to_delayed_work(work),
> +				   struct vc4_hdmi,
> +				   scrambling_work);
>  
>  	if (drm_scdc_get_scrambling_status(vc4_hdmi->ddc))
>  		return;
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index dc3ccd8002a0..5d249ac54cd1 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -223,17 +223,14 @@ struct vc4_hdmi {
>  	enum vc4_hdmi_output_format output_format;
>  };
>  
> -static inline struct vc4_hdmi *
> -connector_to_vc4_hdmi(struct drm_connector *connector)
> -{
> -	return container_of(connector, struct vc4_hdmi, connector);
> -}
> +#define connector_to_vc4_hdmi(_connector)				\
> +	container_of_const(_connector, struct vc4_hdmi, connector)
>  
>  static inline struct vc4_hdmi *
>  encoder_to_vc4_hdmi(struct drm_encoder *encoder)
>  {
>  	struct vc4_encoder *_encoder = to_vc4_encoder(encoder);
> -	return container_of(_encoder, struct vc4_hdmi, encoder);
> +	return container_of_const(_encoder, struct vc4_hdmi, encoder);
>  }
>  
>  struct vc4_hdmi_connector_state {
> @@ -243,11 +240,8 @@ struct vc4_hdmi_connector_state {
>  	enum vc4_hdmi_output_format	output_format;
>  };
>  
> -static inline struct vc4_hdmi_connector_state *
> -conn_state_to_vc4_hdmi_conn_state(struct drm_connector_state *conn_state)
> -{
> -	return container_of(conn_state, struct vc4_hdmi_connector_state, base);
> -}
> +#define conn_state_to_vc4_hdmi_conn_state(_state)			\
> +	container_of_const(_state, struct vc4_hdmi_connector_state, base)
>  
>  void vc4_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
>  		       struct vc4_hdmi_connector_state *vc4_conn_state);
> diff --git a/drivers/gpu/drm/vc4/vc4_irq.c b/drivers/gpu/drm/vc4/vc4_irq.c
> index 1e6db0121ccd..6408fbd1684e 100644
> --- a/drivers/gpu/drm/vc4/vc4_irq.c
> +++ b/drivers/gpu/drm/vc4/vc4_irq.c
> @@ -63,7 +63,7 @@ static void
>  vc4_overflow_mem_work(struct work_struct *work)
>  {
>  	struct vc4_dev *vc4 =
> -		container_of(work, struct vc4_dev, overflow_mem_work);
> +		container_of_const(work, struct vc4_dev, overflow_mem_work);
>  	struct vc4_bo *bo;
>  	int bin_bo_slot;
>  	struct vc4_exec_info *exec;
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> index a7e3d47c50f4..5495f2a94fa9 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -31,11 +31,8 @@ struct vc4_ctm_state {
>  	int fifo;
>  };
>  
> -static struct vc4_ctm_state *
> -to_vc4_ctm_state(const struct drm_private_state *priv)
> -{
> -	return container_of(priv, struct vc4_ctm_state, base);
> -}
> +#define to_vc4_ctm_state(_state)				\
> +	container_of_const(_state, struct vc4_ctm_state, base)
>  
>  struct vc4_load_tracker_state {
>  	struct drm_private_state base;
> @@ -43,11 +40,8 @@ struct vc4_load_tracker_state {
>  	u64 membus_load;
>  };
>  
> -static struct vc4_load_tracker_state *
> -to_vc4_load_tracker_state(const struct drm_private_state *priv)
> -{
> -	return container_of(priv, struct vc4_load_tracker_state, base);
> -}
> +#define to_vc4_load_tracker_state(_state)				\
> +	container_of_const(_state, struct vc4_load_tracker_state, base)
>  
>  static struct vc4_ctm_state *vc4_get_ctm_state(struct drm_atomic_state *state,
>  					       struct drm_private_obj *manager)
> @@ -717,7 +711,7 @@ static void vc4_hvs_channels_destroy_state(struct drm_private_obj *obj,
>  static void vc4_hvs_channels_print_state(struct drm_printer *p,
>  					 const struct drm_private_state *state)
>  {
> -	struct vc4_hvs_state *hvs_state = to_vc4_hvs_state(state);
> +	const struct vc4_hvs_state *hvs_state = to_vc4_hvs_state(state);
>  	unsigned int i;
>  
>  	drm_printf(p, "HVS State\n");
> diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
> index dee525bacd4b..f3cb28657973 100644
> --- a/drivers/gpu/drm/vc4/vc4_plane.c
> +++ b/drivers/gpu/drm/vc4/vc4_plane.c
> @@ -1333,7 +1333,7 @@ u32 vc4_plane_write_dlist(struct drm_plane *plane, u32 __iomem *dlist)
>  u32 vc4_plane_dlist_size(const struct drm_plane_state *state)
>  {
>  	const struct vc4_plane_state *vc4_state =
> -		container_of(state, typeof(*vc4_state), base);
> +		container_of_const(state, typeof(*vc4_state), base);
>  
>  	return vc4_state->dlist_count;
>  }
> diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
> index ef5cab2a3aa9..c5abdec03103 100644
> --- a/drivers/gpu/drm/vc4/vc4_txp.c
> +++ b/drivers/gpu/drm/vc4/vc4_txp.c
> @@ -168,15 +168,11 @@ struct vc4_txp {
>  	void __iomem *regs;
>  };
>  
> -static inline struct vc4_txp *encoder_to_vc4_txp(struct drm_encoder *encoder)
> -{
> -	return container_of(encoder, struct vc4_txp, encoder.base);
> -}
> +#define encoder_to_vc4_txp(_encoder)					\
> +	container_of_const(_encoder, struct vc4_txp, encoder.base)
>  
> -static inline struct vc4_txp *connector_to_vc4_txp(struct drm_connector *conn)
> -{
> -	return container_of(conn, struct vc4_txp, connector.base);
> -}
> +#define connector_to_vc4_txp(_connector)				\
> +	container_of_const(_connector, struct vc4_txp, connector.base)
>  
>  static const struct debugfs_reg32 txp_regs[] = {
>  	VC4_REG32(TXP_DST_PTR),
> diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
> index 29a664c8bf44..f48cf1ea48bb 100644
> --- a/drivers/gpu/drm/vc4/vc4_v3d.c
> +++ b/drivers/gpu/drm/vc4/vc4_v3d.c
> @@ -349,7 +349,7 @@ int vc4_v3d_bin_bo_get(struct vc4_dev *vc4, bool *used)
>  
>  static void bin_bo_release(struct kref *ref)
>  {
> -	struct vc4_dev *vc4 = container_of(ref, struct vc4_dev, bin_bo_kref);
> +	struct vc4_dev *vc4 = container_of_const(ref, struct vc4_dev, bin_bo_kref);
>  
>  	if (WARN_ON_ONCE(!vc4->bin_bo))
>  		return;
> diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
> index a3782d05cd66..d6e6a1a22eba 100644
> --- a/drivers/gpu/drm/vc4/vc4_vec.c
> +++ b/drivers/gpu/drm/vc4/vc4_vec.c
> @@ -219,17 +219,11 @@ struct vc4_vec {
>  		writel(val, vec->regs + (offset));					\
>  	} while (0)
>  
> -static inline struct vc4_vec *
> -encoder_to_vc4_vec(struct drm_encoder *encoder)
> -{
> -	return container_of(encoder, struct vc4_vec, encoder.base);
> -}
> +#define encoder_to_vc4_vec(_encoder)					\
> +	container_of_const(_encoder, struct vc4_vec, encoder.base)
>  
> -static inline struct vc4_vec *
> -connector_to_vc4_vec(struct drm_connector *connector)
> -{
> -	return container_of(connector, struct vc4_vec, connector);
> -}
> +#define connector_to_vc4_vec(_connector)				\
> +	container_of_const(_connector, struct vc4_vec, connector)
>  
>  enum vc4_vec_tv_mode_id {
>  	VC4_VEC_TV_MODE_NTSC,
> 

