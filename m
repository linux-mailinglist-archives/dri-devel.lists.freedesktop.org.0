Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBD11A1C73
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 09:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C091B6E975;
	Wed,  8 Apr 2020 07:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675C56E975;
 Wed,  8 Apr 2020 07:19:20 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 31B4A80512;
 Wed,  8 Apr 2020 09:19:18 +0200 (CEST)
Date: Wed, 8 Apr 2020 09:19:16 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 08/44] drm/vboxvideo: Stop using drm_device->dev_private
Message-ID: <20200408071916.GF14965@ravnborg.org>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-9-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403135828.2542770-9-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8
 a=20KFwNOVAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=YF0qToWgTmNRp-P22-wA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 03, 2020 at 03:57:52PM +0200, Daniel Vetter wrote:
> We use the baseclass pattern here, so lets to the proper (and more
> typesafe) upcasting.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>

As for naming discussed in other mail I had gone for
to_vbox() - as we name the variable assinged vbox whereever we use it.
But no strong feeling as long as we get away from dev_private
and are consistent.

	Sam

> ---
>  drivers/gpu/drm/vboxvideo/vbox_drv.c  |  1 -
>  drivers/gpu/drm/vboxvideo/vbox_drv.h  |  1 +
>  drivers/gpu/drm/vboxvideo/vbox_irq.c  |  2 +-
>  drivers/gpu/drm/vboxvideo/vbox_mode.c | 10 +++++-----
>  4 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> index be0600b22cf5..d34cddd809fd 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> @@ -52,7 +52,6 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		return PTR_ERR(vbox);
>  
>  	vbox->ddev.pdev = pdev;
> -	vbox->ddev.dev_private = vbox;
>  	pci_set_drvdata(pdev, vbox);
>  	mutex_init(&vbox->hw_mutex);
>  
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.h b/drivers/gpu/drm/vboxvideo/vbox_drv.h
> index 87421903816c..ac7c2effc46f 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.h
> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.h
> @@ -127,6 +127,7 @@ struct vbox_encoder {
>  #define to_vbox_crtc(x) container_of(x, struct vbox_crtc, base)
>  #define to_vbox_connector(x) container_of(x, struct vbox_connector, base)
>  #define to_vbox_encoder(x) container_of(x, struct vbox_encoder, base)
> +#define to_vbox_dev(x) container_of(x, struct vbox_private, ddev)
>  
>  bool vbox_check_supported(u16 id);
>  int vbox_hw_init(struct vbox_private *vbox);
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_irq.c b/drivers/gpu/drm/vboxvideo/vbox_irq.c
> index 16a1e29f5292..631657fa554f 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_irq.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_irq.c
> @@ -34,7 +34,7 @@ void vbox_report_hotplug(struct vbox_private *vbox)
>  irqreturn_t vbox_irq_handler(int irq, void *arg)
>  {
>  	struct drm_device *dev = (struct drm_device *)arg;
> -	struct vbox_private *vbox = (struct vbox_private *)dev->dev_private;
> +	struct vbox_private *vbox = to_vbox_dev(dev);
>  	u32 host_flags = vbox_get_flags(vbox);
>  
>  	if (!(host_flags & HGSMIHOSTFLAGS_IRQ))
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> index 0883a435e62b..d9a5af62af89 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> @@ -36,7 +36,7 @@ static void vbox_do_modeset(struct drm_crtc *crtc)
>  	u16 flags;
>  	s32 x_offset, y_offset;
>  
> -	vbox = crtc->dev->dev_private;
> +	vbox = to_vbox_dev(crtc->dev);
>  	width = vbox_crtc->width ? vbox_crtc->width : 640;
>  	height = vbox_crtc->height ? vbox_crtc->height : 480;
>  	bpp = fb ? fb->format->cpp[0] * 8 : 32;
> @@ -77,7 +77,7 @@ static void vbox_do_modeset(struct drm_crtc *crtc)
>  static int vbox_set_view(struct drm_crtc *crtc)
>  {
>  	struct vbox_crtc *vbox_crtc = to_vbox_crtc(crtc);
> -	struct vbox_private *vbox = crtc->dev->dev_private;
> +	struct vbox_private *vbox = to_vbox_dev(crtc->dev);
>  	struct vbva_infoview *p;
>  
>  	/*
> @@ -174,7 +174,7 @@ static void vbox_crtc_set_base_and_mode(struct drm_crtc *crtc,
>  					int x, int y)
>  {
>  	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(fb->obj[0]);
> -	struct vbox_private *vbox = crtc->dev->dev_private;
> +	struct vbox_private *vbox = to_vbox_dev(crtc->dev);
>  	struct vbox_crtc *vbox_crtc = to_vbox_crtc(crtc);
>  	bool needs_modeset = drm_atomic_crtc_needs_modeset(crtc->state);
>  
> @@ -272,7 +272,7 @@ static void vbox_primary_atomic_update(struct drm_plane *plane,
>  {
>  	struct drm_crtc *crtc = plane->state->crtc;
>  	struct drm_framebuffer *fb = plane->state->fb;
> -	struct vbox_private *vbox = fb->dev->dev_private;
> +	struct vbox_private *vbox = to_vbox_dev(fb->dev);
>  	struct drm_mode_rect *clips;
>  	uint32_t num_clips, i;
>  
> @@ -704,7 +704,7 @@ static int vbox_get_modes(struct drm_connector *connector)
>  	int preferred_width, preferred_height;
>  
>  	vbox_connector = to_vbox_connector(connector);
> -	vbox = connector->dev->dev_private;
> +	vbox = to_vbox_dev(connector->dev);
>  
>  	hgsmi_report_flags_location(vbox->guest_pool, GUEST_HEAP_OFFSET(vbox) +
>  				    HOST_FLAGS_OFFSET);
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
