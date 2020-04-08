Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A461A1CDC
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 09:53:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B5B36E989;
	Wed,  8 Apr 2020 07:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED456E989;
 Wed,  8 Apr 2020 07:52:59 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 16EAC20029;
 Wed,  8 Apr 2020 09:52:57 +0200 (CEST)
Date: Wed, 8 Apr 2020 09:52:55 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 28/44] drm/tidss: Don't use drm_device->dev_private
Message-ID: <20200408075255.GL14965@ravnborg.org>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-29-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403135828.2542770-29-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8
 a=sozttTNsAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=dtz1rv-swwpoju1sx_MA:9
 a=CjuIK1q_8ugA:10 a=aeg5Gbbo78KNqacMgKqU:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 03, 2020 at 03:58:12PM +0200, Daniel Vetter wrote:
> Upcasting using a container_of macro is more typesafe, faster and
> easier for the compiler to optimize.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jyri Sarha <jsarha@ti.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/tidss/tidss_crtc.c  | 16 ++++++++--------
>  drivers/gpu/drm/tidss/tidss_drv.c   |  2 --
>  drivers/gpu/drm/tidss/tidss_drv.h   |  2 ++
>  drivers/gpu/drm/tidss/tidss_irq.c   | 12 ++++++------
>  drivers/gpu/drm/tidss/tidss_kms.c   |  2 +-
>  drivers/gpu/drm/tidss/tidss_plane.c |  6 +++---
>  6 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
> index d4ce9bab8c7e..2396262c09e4 100644
> --- a/drivers/gpu/drm/tidss/tidss_crtc.c
> +++ b/drivers/gpu/drm/tidss/tidss_crtc.c
> @@ -24,7 +24,7 @@
>  static void tidss_crtc_finish_page_flip(struct tidss_crtc *tcrtc)
>  {
>  	struct drm_device *ddev = tcrtc->crtc.dev;
> -	struct tidss_device *tidss = ddev->dev_private;
> +	struct tidss_device *tidss = to_tidss(ddev);
>  	struct drm_pending_vblank_event *event;
>  	unsigned long flags;
>  	bool busy;
> @@ -88,7 +88,7 @@ static int tidss_crtc_atomic_check(struct drm_crtc *crtc,
>  				   struct drm_crtc_state *state)
>  {
>  	struct drm_device *ddev = crtc->dev;
> -	struct tidss_device *tidss = ddev->dev_private;
> +	struct tidss_device *tidss = to_tidss(ddev);
>  	struct dispc_device *dispc = tidss->dispc;
>  	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
>  	u32 hw_videoport = tcrtc->hw_videoport;
> @@ -165,7 +165,7 @@ static void tidss_crtc_atomic_flush(struct drm_crtc *crtc,
>  {
>  	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
>  	struct drm_device *ddev = crtc->dev;
> -	struct tidss_device *tidss = ddev->dev_private;
> +	struct tidss_device *tidss = to_tidss(ddev);
>  	unsigned long flags;
>  
>  	dev_dbg(ddev->dev,
> @@ -216,7 +216,7 @@ static void tidss_crtc_atomic_enable(struct drm_crtc *crtc,
>  {
>  	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
>  	struct drm_device *ddev = crtc->dev;
> -	struct tidss_device *tidss = ddev->dev_private;
> +	struct tidss_device *tidss = to_tidss(ddev);
>  	const struct drm_display_mode *mode = &crtc->state->adjusted_mode;
>  	unsigned long flags;
>  	int r;
> @@ -259,7 +259,7 @@ static void tidss_crtc_atomic_disable(struct drm_crtc *crtc,
>  {
>  	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
>  	struct drm_device *ddev = crtc->dev;
> -	struct tidss_device *tidss = ddev->dev_private;
> +	struct tidss_device *tidss = to_tidss(ddev);
>  	unsigned long flags;
>  
>  	dev_dbg(ddev->dev, "%s, event %p\n", __func__, crtc->state->event);
> @@ -295,7 +295,7 @@ enum drm_mode_status tidss_crtc_mode_valid(struct drm_crtc *crtc,
>  {
>  	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
>  	struct drm_device *ddev = crtc->dev;
> -	struct tidss_device *tidss = ddev->dev_private;
> +	struct tidss_device *tidss = to_tidss(ddev);
>  
>  	return dispc_vp_mode_valid(tidss->dispc, tcrtc->hw_videoport, mode);
>  }
> @@ -314,7 +314,7 @@ static const struct drm_crtc_helper_funcs tidss_crtc_helper_funcs = {
>  static int tidss_crtc_enable_vblank(struct drm_crtc *crtc)
>  {
>  	struct drm_device *ddev = crtc->dev;
> -	struct tidss_device *tidss = ddev->dev_private;
> +	struct tidss_device *tidss = to_tidss(ddev);
>  
>  	dev_dbg(ddev->dev, "%s\n", __func__);
>  
> @@ -328,7 +328,7 @@ static int tidss_crtc_enable_vblank(struct drm_crtc *crtc)
>  static void tidss_crtc_disable_vblank(struct drm_crtc *crtc)
>  {
>  	struct drm_device *ddev = crtc->dev;
> -	struct tidss_device *tidss = ddev->dev_private;
> +	struct tidss_device *tidss = to_tidss(ddev);
>  
>  	dev_dbg(ddev->dev, "%s\n", __func__);
>  
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
> index 7d4465d58be8..99edc66ebdef 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.c
> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> @@ -147,8 +147,6 @@ static int tidss_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, tidss);
>  
> -	ddev->dev_private = tidss;
> -
>  	ret = dispc_init(tidss);
>  	if (ret) {
>  		dev_err(dev, "failed to initialize dispc: %d\n", ret);
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
> index e2aa6436ad18..b23cd95c8d78 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.h
> +++ b/drivers/gpu/drm/tidss/tidss_drv.h
> @@ -33,6 +33,8 @@ struct tidss_device {
>  	struct drm_atomic_state *saved_state;
>  };
>  
> +#define to_tidss(__dev) container_of(__dev, struct tidss_device, ddev)
> +
>  int tidss_runtime_get(struct tidss_device *tidss);
>  void tidss_runtime_put(struct tidss_device *tidss);
>  
> diff --git a/drivers/gpu/drm/tidss/tidss_irq.c b/drivers/gpu/drm/tidss/tidss_irq.c
> index 612c046738e5..1b80f2d62e0a 100644
> --- a/drivers/gpu/drm/tidss/tidss_irq.c
> +++ b/drivers/gpu/drm/tidss/tidss_irq.c
> @@ -23,7 +23,7 @@ static void tidss_irq_update(struct tidss_device *tidss)
>  void tidss_irq_enable_vblank(struct drm_crtc *crtc)
>  {
>  	struct drm_device *ddev = crtc->dev;
> -	struct tidss_device *tidss = ddev->dev_private;
> +	struct tidss_device *tidss = to_tidss(ddev);
>  	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
>  	u32 hw_videoport = tcrtc->hw_videoport;
>  	unsigned long flags;
> @@ -38,7 +38,7 @@ void tidss_irq_enable_vblank(struct drm_crtc *crtc)
>  void tidss_irq_disable_vblank(struct drm_crtc *crtc)
>  {
>  	struct drm_device *ddev = crtc->dev;
> -	struct tidss_device *tidss = ddev->dev_private;
> +	struct tidss_device *tidss = to_tidss(ddev);
>  	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
>  	u32 hw_videoport = tcrtc->hw_videoport;
>  	unsigned long flags;
> @@ -53,7 +53,7 @@ void tidss_irq_disable_vblank(struct drm_crtc *crtc)
>  irqreturn_t tidss_irq_handler(int irq, void *arg)
>  {
>  	struct drm_device *ddev = (struct drm_device *)arg;
> -	struct tidss_device *tidss = ddev->dev_private;
> +	struct tidss_device *tidss = to_tidss(ddev);
>  	unsigned int id;
>  	dispc_irq_t irqstatus;
>  
> @@ -95,7 +95,7 @@ void tidss_irq_resume(struct tidss_device *tidss)
>  
>  void tidss_irq_preinstall(struct drm_device *ddev)
>  {
> -	struct tidss_device *tidss = ddev->dev_private;
> +	struct tidss_device *tidss = to_tidss(ddev);
>  
>  	spin_lock_init(&tidss->wait_lock);
>  
> @@ -109,7 +109,7 @@ void tidss_irq_preinstall(struct drm_device *ddev)
>  
>  int tidss_irq_postinstall(struct drm_device *ddev)
>  {
> -	struct tidss_device *tidss = ddev->dev_private;
> +	struct tidss_device *tidss = to_tidss(ddev);
>  	unsigned long flags;
>  	unsigned int i;
>  
> @@ -138,7 +138,7 @@ int tidss_irq_postinstall(struct drm_device *ddev)
>  
>  void tidss_irq_uninstall(struct drm_device *ddev)
>  {
> -	struct tidss_device *tidss = ddev->dev_private;
> +	struct tidss_device *tidss = to_tidss(ddev);
>  
>  	tidss_runtime_get(tidss);
>  	dispc_set_irqenable(tidss->dispc, 0);
> diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
> index 4bd339a467a4..4b99e9fa84a5 100644
> --- a/drivers/gpu/drm/tidss/tidss_kms.c
> +++ b/drivers/gpu/drm/tidss/tidss_kms.c
> @@ -25,7 +25,7 @@
>  static void tidss_atomic_commit_tail(struct drm_atomic_state *old_state)
>  {
>  	struct drm_device *ddev = old_state->dev;
> -	struct tidss_device *tidss = ddev->dev_private;
> +	struct tidss_device *tidss = to_tidss(ddev);
>  
>  	dev_dbg(ddev->dev, "%s\n", __func__);
>  
> diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
> index ff99b2dd4a17..23bb3e59504b 100644
> --- a/drivers/gpu/drm/tidss/tidss_plane.c
> +++ b/drivers/gpu/drm/tidss/tidss_plane.c
> @@ -22,7 +22,7 @@ static int tidss_plane_atomic_check(struct drm_plane *plane,
>  				    struct drm_plane_state *state)
>  {
>  	struct drm_device *ddev = plane->dev;
> -	struct tidss_device *tidss = ddev->dev_private;
> +	struct tidss_device *tidss = to_tidss(ddev);
>  	struct tidss_plane *tplane = to_tidss_plane(plane);
>  	const struct drm_format_info *finfo;
>  	struct drm_crtc_state *crtc_state;
> @@ -101,7 +101,7 @@ static void tidss_plane_atomic_update(struct drm_plane *plane,
>  				      struct drm_plane_state *old_state)
>  {
>  	struct drm_device *ddev = plane->dev;
> -	struct tidss_device *tidss = ddev->dev_private;
> +	struct tidss_device *tidss = to_tidss(ddev);
>  	struct tidss_plane *tplane = to_tidss_plane(plane);
>  	struct drm_plane_state *state = plane->state;
>  	u32 hw_videoport;
> @@ -133,7 +133,7 @@ static void tidss_plane_atomic_disable(struct drm_plane *plane,
>  				       struct drm_plane_state *old_state)
>  {
>  	struct drm_device *ddev = plane->dev;
> -	struct tidss_device *tidss = ddev->dev_private;
> +	struct tidss_device *tidss = to_tidss(ddev);
>  	struct tidss_plane *tplane = to_tidss_plane(plane);
>  
>  	dev_dbg(ddev->dev, "%s\n", __func__);
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
