Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4733C1477D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 12:52:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC0510E39A;
	Tue, 28 Oct 2025 11:52:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="jEGEwemJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE07410E39A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 11:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761652329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aYlm/9W4kQf1dlluWkpL7o6LFKc+F6jXn2CnWZOeTzo=;
 b=jEGEwemJ3L3ozn0BDMZbKo8F/EnMH0JR6MkqE+BKsEffWHhUGJlvCYOqmfX4nwmDKhLQH0
 fNMac3NyvM7M3MJD0KkuczEIHhGW1+RPyZXLo4bMcPZwUztBVgWq12k8bzFZsld4yMhXcL
 PT0vXqsHovtBQV+PrnSo/P4gZOS7XQI=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-395-BqUuFdTRPh-W3nIlyb6Rfw-1; Tue, 28 Oct 2025 07:52:07 -0400
X-MC-Unique: BqUuFdTRPh-W3nIlyb6Rfw-1
X-Mimecast-MFC-AGG-ID: BqUuFdTRPh-W3nIlyb6Rfw_1761652327
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7a2885329beso3011335b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 04:52:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761652326; x=1762257126;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aYlm/9W4kQf1dlluWkpL7o6LFKc+F6jXn2CnWZOeTzo=;
 b=tJfZytaRCWlVhLxOgbXwPuQt7iLiiUm9IGluiPXTLJZKJ95+LR1F2DmpqAo7wDK5fy
 F+y9UfLvJy6q7o7Nh7JeGoA0NwPIVEqViSRFFybVY420g5Ys+igSMmNI5RP+M027w/zc
 Y3t74qtm0cJZGDM4XbKIZUa2TBWAbEp4CgzZdnAnwpO7R9dHTYJDbCEgX2fGM6GsB9N7
 AZzp99sR1x+EWuI6itxXSj5LH/0kQJS1UPC+8gNiwZKz0a4VibxWy9kUvWdJHXk3dNkh
 GcI0KOZGV8RdyCCHB0kePHrMFpj7reAaTk03yQ6XYKVUBiTmMHb/t1oD3WXl/rO0es1L
 N8ag==
X-Gm-Message-State: AOJu0Yy9t/ItBSkIv3RI/sNFYIe4FxSiCZtW1N0leZQbLhy+e3erUBo7
 ev21P4b4asYjRDQb22bTZbkcgSVTn8p9L7zGEcHefzux9Xzc6DUXLmGtNVziNWUcld2AcJ4JPL+
 Ygkt4X4678Dl/teK7p5CKlw1VAJ58CHDAa1KYn9VOtzWhzuFYwIT7H4NsGzEJQxHkI+sQMSwZ6Q
 fplfc8
X-Gm-Gg: ASbGncuCz0c9PjNr4mqMXAR5LONr8TiSpcJ+sXF8NG0BiEvCai6u+zEq/7wuBH1JgQE
 Zrb20eF4kfaGTijQUO3fVG/iW0Xg2bwvS/IG7rPwra0zwIl/93NIyvLSzyS6M4Et37/0uutSqnf
 sE5YAlgH536F9wwlWnVnTEOxf4DRkHZi2FPpLFA0CrjFPWsIk89FaX7oedP1duUgFzCd1M8nITH
 md0imZ5oIDi02vmV4Z+Ad+rKrz2WcDy3Y7E7e5mYv3CD1Pp0zQXTdQ0AFMhTfwrEf4RRUh2O9SV
 T8OsR1xLYgIGnWkX+zSeYidfrKI7rrvdYt4Z/ZQwpO6ZSUiFwIY8BtqnIp4eq5aO7vZsSQ==
X-Received: by 2002:a05:6a00:190d:b0:7a2:7f45:5898 with SMTP id
 d2e1a72fcca58-7a442e0f8ddmr3638662b3a.3.1761652326401; 
 Tue, 28 Oct 2025 04:52:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGS4dyGEhrQjTsdoZZ200tdaWVCARKXkcuIoCe5yxPfzqYFEFwid6K9pGHnnpa5iBTfhZhu7g==
X-Received: by 2002:a05:6a00:190d:b0:7a2:7f45:5898 with SMTP id
 d2e1a72fcca58-7a442e0f8ddmr3638638b3a.3.1761652325941; 
 Tue, 28 Oct 2025 04:52:05 -0700 (PDT)
Received: from zeus ([2405:6580:83a0:7600:6e93:a15a:9134:ae1f])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a41402e554sm11362178b3a.18.2025.10.28.04.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 04:52:05 -0700 (PDT)
Date: Tue, 28 Oct 2025 20:51:54 +0900
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 zack.rusin@broadcom.com, maaz.mombasawala@broadcom.com, jfalempe@redhat.com
Subject: Re: [PATCH] drm/vmwgfx: Add drm_panic support
Message-ID: <aQCuQITy-z8aMDE-@zeus>
References: <20251023200447.206834-1-ian.forbes@broadcom.com>
 <b4c069b6-b932-45a9-a681-f661bb0a89cf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b4c069b6-b932-45a9-a681-f661bb0a89cf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mTyyUKfk_6tOoJyYVk5Jralx91z-4yHj0tn6cEPPBgs_1761652327
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

On Mon, Oct 27, 2025 at 02:56:21PM +0100, Jocelyn Falempe wrote:
> On 23/10/2025 22:04, Ian Forbes wrote:
> > Sets up VRAM as the scanout buffer then switches to legacy mode.
> 
> Thank you and Ryosuke for working on drm_panic support on vmwgfx.
> For the use of the drm_panic API, it looks good to me.
> 
> Acked-by: Jocelyn Falempe <jfalempe@redhat.com>
> > 
> > Suggested-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
> > Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
> > ---
> >   drivers/gpu/drm/vmwgfx/vmwgfx_kms.c  | 33 ++++++++++++++++++++++++++++
> >   drivers/gpu/drm/vmwgfx/vmwgfx_kms.h  |  5 +++++
> >   drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c |  2 ++
> >   3 files changed, 40 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> > index 54ea1b513950..4ff4ae041236 100644
> > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> > @@ -20,6 +20,7 @@
> >   #include <drm/drm_rect.h>
> >   #include <drm/drm_sysfs.h>
> >   #include <drm/drm_edid.h>
> > +#include <drm/drm_panic.h>
> >   void vmw_du_init(struct vmw_display_unit *du)
> >   {
> > @@ -2022,3 +2023,35 @@ bool vmw_user_object_is_null(struct vmw_user_object *uo)
> >   {
> >   	return !uo->buffer && !uo->surface;
> >   }
> > +
> > +int
> > +vmw_get_scanout_buffer(struct drm_plane *plane, struct drm_scanout_buffer *sb)
> > +{
> > +	void  *vram;
> > +	struct vmw_private *vmw_priv = container_of(plane->dev, struct vmw_private, drm);
> > +
> > +	// Only call on the primary display
> > +	if (container_of(plane, struct vmw_display_unit, primary)->unit != 0)
> > +		return -EINVAL;
> > +
> > +	vram = memremap(vmw_priv->vram_start, vmw_priv->vram_size,
> > +			MEMREMAP_WB | MEMREMAP_DEC);
> > +	if (!vram)
> > +		return -ENOMEM;
> > +
> > +	sb->map[0].vaddr = vram;
> > +	sb->format = drm_format_info(DRM_FORMAT_RGB565);

Let me confirm whether debugfs feature works correctly. As I mentioned
in my original patch [1], modifying this format will allow to display
the panic screen by debugfs only one time. In your environment, can you
trigger panic screen by debugfs multiple times?

> > +	sb->width  = vmw_priv->initial_width;
> > +	sb->height = vmw_priv->initial_height;
> > +	sb->pitch[0] = sb->width * 2;
> > +	return 0;
> > +}
> > +
> > +void vmw_panic_flush(struct drm_plane *plane)
> > +{
> > +	struct vmw_private *vmw_priv = container_of(plane->dev, struct vmw_private, drm);
> > +
> > +	vmw_kms_write_svga(vmw_priv,
> > +			   vmw_priv->initial_width, vmw_priv->initial_height,
> > +			   vmw_priv->initial_width * 2, 16, 16);

vmw_kms_write_svga() calls vmw_write() which locks spin lock. Since
these functions are called in panic handler, we should avoid them. You
can find some idea in my original patch [1]!

[1] https://lore.kernel.org/all/20250919032936.2267240-1-ryasuoka@redhat.com/

Thank you
Ryosuke

> > +}
> > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
> > index 445471fe9be6..8e37561cd527 100644
> > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
> > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
> > @@ -500,6 +500,11 @@ int vmw_kms_stdu_readback(struct vmw_private *dev_priv,
> >   int vmw_du_helper_plane_update(struct vmw_du_update_plane *update);
> > +struct drm_scanout_buffer;
> > +
> > +int vmw_get_scanout_buffer(struct drm_plane *pl, struct drm_scanout_buffer *sb);
> > +void vmw_panic_flush(struct drm_plane *plane);
> > +
> >   /**
> >    * vmw_du_translate_to_crtc - Translate a rect from framebuffer to crtc
> >    * @state: Plane state.
> > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> > index 20aab725e53a..37cb742ba1d9 100644
> > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> > @@ -1506,6 +1506,8 @@ drm_plane_helper_funcs vmw_stdu_primary_plane_helper_funcs = {
> >   	.atomic_update = vmw_stdu_primary_plane_atomic_update,
> >   	.prepare_fb = vmw_stdu_primary_plane_prepare_fb,
> >   	.cleanup_fb = vmw_stdu_primary_plane_cleanup_fb,
> > +	.get_scanout_buffer = vmw_get_scanout_buffer,
> > +	.panic_flush = vmw_panic_flush,
> >   };
> >   static const struct drm_crtc_helper_funcs vmw_stdu_crtc_helper_funcs = {
> 
> 

