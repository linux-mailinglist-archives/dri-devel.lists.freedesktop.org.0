Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0524289DD99
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 17:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0673810E09C;
	Tue,  9 Apr 2024 15:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NJYXcFaD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F01510EF0B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 15:02:53 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2d094bc2244so60637211fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 08:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712674971; x=1713279771; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MMEQzcoh+W9ymgQy42WUpt0B0+Cde8aQQwQGAW1A/G8=;
 b=NJYXcFaDZnvch1ga1bxBK7Ynz2B1nj8OU/5rde8MGdTGma70S0FRtMvTpJoVmodLZK
 SV1hoBYhQbZsKRuTp+PrZAD4Sy/eVgNRXLOQznQqiEEXfhnM+26ybyO452NinsSFmge+
 RHWiwrBEhdyxRScHEUqZoHJGoGQD86E9izVO6M+V+jx/h88KVcNUjmH/urXf7sQ74bXP
 2mWykLEpc4Eh8XZ87/DbSl6w5281mxG2CEUMgGSxQQnN988dhL9VnK5+Be66LU10yI9M
 RiK7n4vus0hQglzgzM2ATdX/cPkgm3qJrPVBKNSc3p+T09ON9O6dVLwyjn4bdw5ccf/P
 P4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712674971; x=1713279771;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MMEQzcoh+W9ymgQy42WUpt0B0+Cde8aQQwQGAW1A/G8=;
 b=n1lmvXYBe408i6Qy5sppiMm11mKUpetrOZ84MPOBSr4TQXBLYLr87/sHA+iT9V34cX
 4/aOROHt6o8gRBZtIzp4LDfXqtYI4ZYzPb095+TuxsNjTgpoPe3GF2Us2eEGsoKXyhz0
 JTVo5LDzGMcs4oz7BVzdzh34mh4ZDgAHSbNclR5z32hOVwrN6AErUknmbbfZXXlldqBb
 6a2cLbx76YHXEi+V1LrDTdRkPTMC4hqfuUatOOwLZPAe3dEp9ySrzbVeXx2SdofPc+Xz
 hgdzy3I1dvQpQ61znrMwiyQ0TTH1f9+bRXNlzG7C3nemsYJSutJNzu4oVddi0fbDSo9p
 302Q==
X-Gm-Message-State: AOJu0YzZ1x5jyKJdcyyAOFwgKEZpXvCoNb+/j7VD7cK3IB/VW45Mu0DW
 UmqPAn1CG8NM734nd/JOY/8/iNmt2S/tAw72HDAczcz9s6WyGnjuAg3WULnigDE=
X-Google-Smtp-Source: AGHT+IG1DOn2lwakZ6lS5Tchcr1IL09dUEqXy2PWdSWvWJ/sfDjBq2uc8wWh7XDZMMdULS+2tSvSFA==
X-Received: by 2002:a2e:b055:0:b0:2d8:4158:cbaa with SMTP id
 d21-20020a2eb055000000b002d84158cbaamr64433ljl.7.1712674970957; 
 Tue, 09 Apr 2024 08:02:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
 by smtp.gmail.com with ESMTPSA id
 s30-20020a05651c049e00b002d10de4733esm1518715ljc.95.2024.04.09.08.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 08:02:50 -0700 (PDT)
Date: Tue, 9 Apr 2024 18:02:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 1/5] drm/vblank: Introduce drm_crtc_vblank_crtc()
Message-ID: <zbme6rzphmwtaky3r6ozo27hevms2smixn3wjh2msnwmfy5akz@rqjkwpxlvdck>
References: <20240408190611.24914-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240408190611.24914-1-ville.syrjala@linux.intel.com>
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

On Mon, Apr 08, 2024 at 10:06:07PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Make life easier by providing a function that hands
> out the the correct drm_vblank_crtc for a given a drm_crtc.
> 
> Also abstract the lower level internals of the vblank
> code in a similar fashion.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_vblank.c      | 58 ++++++++++++++++++-------------
>  drivers/gpu/drm/drm_vblank_work.c |  2 +-
>  include/drm/drm_vblank.h          |  1 +
>  3 files changed, 36 insertions(+), 25 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I'm looking forward to using this in drm/msm

> 
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 702a12bc93bd..cc3571e25a9a 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -166,11 +166,24 @@ module_param_named(timestamp_precision_usec, drm_timestamp_precision, int, 0600)
>  MODULE_PARM_DESC(vblankoffdelay, "Delay until vblank irq auto-disable [msecs] (0: never disable, <0: disable immediately)");
>  MODULE_PARM_DESC(timestamp_precision_usec, "Max. error on timestamps [usecs]");
>  
> +static struct drm_vblank_crtc *
> +drm_vblank_crtc(struct drm_device *dev, unsigned int pipe)
> +{
> +	return &dev->vblank[pipe];
> +}
> +
> +struct drm_vblank_crtc *
> +drm_crtc_vblank_crtc(struct drm_crtc *crtc)
> +{
> +	return drm_vblank_crtc(crtc->dev, drm_crtc_index(crtc));
> +}
> +EXPORT_SYMBOL(drm_crtc_vblank_crtc);
> +
>  static void store_vblank(struct drm_device *dev, unsigned int pipe,
>  			 u32 vblank_count_inc,
>  			 ktime_t t_vblank, u32 last)
>  {
> -	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
> +	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
>  
>  	assert_spin_locked(&dev->vblank_time_lock);
>  
> @@ -184,7 +197,7 @@ static void store_vblank(struct drm_device *dev, unsigned int pipe,
>  
>  static u32 drm_max_vblank_count(struct drm_device *dev, unsigned int pipe)
>  {
> -	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
> +	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
>  
>  	return vblank->max_vblank_count ?: dev->max_vblank_count;
>  }
> @@ -273,7 +286,7 @@ static void drm_reset_vblank_timestamp(struct drm_device *dev, unsigned int pipe
>  static void drm_update_vblank_count(struct drm_device *dev, unsigned int pipe,
>  				    bool in_vblank_irq)
>  {
> -	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
> +	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
>  	u32 cur_vblank, diff;
>  	bool rc;
>  	ktime_t t_vblank;
> @@ -364,7 +377,7 @@ static void drm_update_vblank_count(struct drm_device *dev, unsigned int pipe,
>  
>  u64 drm_vblank_count(struct drm_device *dev, unsigned int pipe)
>  {
> -	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
> +	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
>  	u64 count;
>  
>  	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
> @@ -438,7 +451,7 @@ static void __disable_vblank(struct drm_device *dev, unsigned int pipe)
>   */
>  void drm_vblank_disable_and_save(struct drm_device *dev, unsigned int pipe)
>  {
> -	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
> +	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
>  	unsigned long irqflags;
>  
>  	assert_spin_locked(&dev->vbl_lock);
> @@ -600,7 +613,7 @@ void drm_calc_timestamping_constants(struct drm_crtc *crtc,
>  {
>  	struct drm_device *dev = crtc->dev;
>  	unsigned int pipe = drm_crtc_index(crtc);
> -	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
> +	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
>  	int linedur_ns = 0, framedur_ns = 0;
>  	int dotclock = mode->crtc_clock;
>  
> @@ -930,7 +943,7 @@ EXPORT_SYMBOL(drm_crtc_vblank_count);
>  static u64 drm_vblank_count_and_time(struct drm_device *dev, unsigned int pipe,
>  				     ktime_t *vblanktime)
>  {
> -	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
> +	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
>  	u64 vblank_count;
>  	unsigned int seq;
>  
> @@ -985,7 +998,6 @@ EXPORT_SYMBOL(drm_crtc_vblank_count_and_time);
>   */
>  int drm_crtc_next_vblank_start(struct drm_crtc *crtc, ktime_t *vblanktime)
>  {
> -	unsigned int pipe = drm_crtc_index(crtc);
>  	struct drm_vblank_crtc *vblank;
>  	struct drm_display_mode *mode;
>  	u64 vblank_start;
> @@ -993,7 +1005,7 @@ int drm_crtc_next_vblank_start(struct drm_crtc *crtc, ktime_t *vblanktime)
>  	if (!drm_dev_has_vblank(crtc->dev))
>  		return -EINVAL;
>  
> -	vblank = &crtc->dev->vblank[pipe];
> +	vblank = drm_crtc_vblank_crtc(crtc);
>  	mode = &vblank->hwmode;
>  
>  	if (!vblank->framedur_ns || !vblank->linedur_ns)
> @@ -1147,7 +1159,7 @@ static int __enable_vblank(struct drm_device *dev, unsigned int pipe)
>  
>  static int drm_vblank_enable(struct drm_device *dev, unsigned int pipe)
>  {
> -	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
> +	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
>  	int ret = 0;
>  
>  	assert_spin_locked(&dev->vbl_lock);
> @@ -1185,7 +1197,7 @@ static int drm_vblank_enable(struct drm_device *dev, unsigned int pipe)
>  
>  int drm_vblank_get(struct drm_device *dev, unsigned int pipe)
>  {
> -	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
> +	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
>  	unsigned long irqflags;
>  	int ret = 0;
>  
> @@ -1228,7 +1240,7 @@ EXPORT_SYMBOL(drm_crtc_vblank_get);
>  
>  void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
>  {
> -	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
> +	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
>  
>  	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
>  		return;
> @@ -1274,7 +1286,7 @@ EXPORT_SYMBOL(drm_crtc_vblank_put);
>   */
>  void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
>  {
> -	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
> +	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
>  	int ret;
>  	u64 last;
>  
> @@ -1327,7 +1339,7 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
>  {
>  	struct drm_device *dev = crtc->dev;
>  	unsigned int pipe = drm_crtc_index(crtc);
> -	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
> +	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
>  	struct drm_pending_vblank_event *e, *t;
>  	ktime_t now;
>  	u64 seq;
> @@ -1405,8 +1417,7 @@ EXPORT_SYMBOL(drm_crtc_vblank_off);
>  void drm_crtc_vblank_reset(struct drm_crtc *crtc)
>  {
>  	struct drm_device *dev = crtc->dev;
> -	unsigned int pipe = drm_crtc_index(crtc);
> -	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
> +	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
>  
>  	spin_lock_irq(&dev->vbl_lock);
>  	/*
> @@ -1445,8 +1456,7 @@ void drm_crtc_set_max_vblank_count(struct drm_crtc *crtc,
>  				   u32 max_vblank_count)
>  {
>  	struct drm_device *dev = crtc->dev;
> -	unsigned int pipe = drm_crtc_index(crtc);
> -	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
> +	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
>  
>  	drm_WARN_ON(dev, dev->max_vblank_count);
>  	drm_WARN_ON(dev, !READ_ONCE(vblank->inmodeset));
> @@ -1469,7 +1479,7 @@ void drm_crtc_vblank_on(struct drm_crtc *crtc)
>  {
>  	struct drm_device *dev = crtc->dev;
>  	unsigned int pipe = drm_crtc_index(crtc);
> -	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
> +	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
>  
>  	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
>  		return;
> @@ -1512,7 +1522,7 @@ static void drm_vblank_restore(struct drm_device *dev, unsigned int pipe)
>  	assert_spin_locked(&dev->vbl_lock);
>  	assert_spin_locked(&dev->vblank_time_lock);
>  
> -	vblank = &dev->vblank[pipe];
> +	vblank = drm_vblank_crtc(dev, pipe);
>  	drm_WARN_ONCE(dev,
>  		      drm_debug_enabled(DRM_UT_VBL) && !vblank->framedur_ns,
>  		      "Cannot compute missed vblanks without frame duration\n");
> @@ -1564,7 +1574,7 @@ static int drm_queue_vblank_event(struct drm_device *dev, unsigned int pipe,
>  				  union drm_wait_vblank *vblwait,
>  				  struct drm_file *file_priv)
>  {
> -	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
> +	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
>  	struct drm_pending_vblank_event *e;
>  	ktime_t now;
>  	u64 seq;
> @@ -1872,7 +1882,7 @@ static void drm_handle_vblank_events(struct drm_device *dev, unsigned int pipe)
>   */
>  bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe)
>  {
> -	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
> +	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
>  	unsigned long irqflags;
>  	bool disable_irq;
>  
> @@ -1981,7 +1991,7 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *dev, void *data,
>  
>  	pipe = drm_crtc_index(crtc);
>  
> -	vblank = &dev->vblank[pipe];
> +	vblank = drm_crtc_vblank_crtc(crtc);
>  	vblank_enabled = dev->vblank_disable_immediate && READ_ONCE(vblank->enabled);
>  
>  	if (!vblank_enabled) {
> @@ -2046,7 +2056,7 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
>  
>  	pipe = drm_crtc_index(crtc);
>  
> -	vblank = &dev->vblank[pipe];
> +	vblank = drm_crtc_vblank_crtc(crtc);
>  
>  	e = kzalloc(sizeof(*e), GFP_KERNEL);
>  	if (e == NULL)
> diff --git a/drivers/gpu/drm/drm_vblank_work.c b/drivers/gpu/drm/drm_vblank_work.c
> index 43cd5c0f4f6f..4fe9b1d3b00f 100644
> --- a/drivers/gpu/drm/drm_vblank_work.c
> +++ b/drivers/gpu/drm/drm_vblank_work.c
> @@ -245,7 +245,7 @@ void drm_vblank_work_init(struct drm_vblank_work *work, struct drm_crtc *crtc,
>  {
>  	kthread_init_work(&work->base, func);
>  	INIT_LIST_HEAD(&work->node);
> -	work->vblank = &crtc->dev->vblank[drm_crtc_index(crtc)];
> +	work->vblank = drm_crtc_vblank_crtc(crtc);
>  }
>  EXPORT_SYMBOL(drm_vblank_work_init);
>  
> diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
> index 7f3957943dd1..c8f829b4307c 100644
> --- a/include/drm/drm_vblank.h
> +++ b/include/drm/drm_vblank.h
> @@ -225,6 +225,7 @@ struct drm_vblank_crtc {
>  	wait_queue_head_t work_wait_queue;
>  };
>  
> +struct drm_vblank_crtc *drm_crtc_vblank_crtc(struct drm_crtc *crtc);
>  int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs);
>  bool drm_dev_has_vblank(const struct drm_device *dev);
>  u64 drm_crtc_vblank_count(struct drm_crtc *crtc);
> -- 
> 2.43.2
> 

-- 
With best wishes
Dmitry
