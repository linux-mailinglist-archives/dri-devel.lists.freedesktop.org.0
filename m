Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB7A3227F1
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 10:42:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8AE96E7FE;
	Tue, 23 Feb 2021 09:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF23C6E7FE
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 09:42:50 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id e13so30326674ejl.8
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 01:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XW/yISfQDWWdJbFvZo/dQr9eVcqJYVXzSCdpsn0vFko=;
 b=MMYgdtPqVLy50UqtcHvQ2gMbyAqUCexwO0oeYa4EsTMn1wYYQa37j/qFTB/EOcFHGN
 B+l3pOwrpXrW82H7tSWShAAAJ4CkyRPubYRmO8zbAPKEvDSMVwbO1qU2rKez3TBYOQjn
 LQRwQO+b/CDW3jZVOIpq8IKYAdXcKNrIWsQ2nKK5u1wPRreg3M30D3pxRMKNntF4SaOc
 GmYGpgu6zzz8HDqVHRYEcuw9SOR+VPD7Y4p4chnA+bM6rzeZnmAg0ANcgNjwT86qMKOE
 dZDzyUSz2DfDKaBmQMUv+3L6FlwckE8XaubtTV5NeH6mwT2ANeaIMO70gAr20PnaYOEv
 SEhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XW/yISfQDWWdJbFvZo/dQr9eVcqJYVXzSCdpsn0vFko=;
 b=J8UaIkRJAaPQx/uF8f3eaYbpTiMiB1yGB25vK6fJjYmrBQe4ZbKd9gpsr3Tn6DLjDi
 +3nyexfj+KHC1SIm2HTCvf0hT/9u+ivLRlR5zJ9CGDYjxIwcTf8QUlxLR6I84uU9wcYW
 D0JDLa5e5DJaJyqWoN0uoQDrwNinJtYOYgGIRHOm8EEo6SXRNAw1xV++oQZZMjZU1Rmj
 +5R5rQd+8tp2WW71XCMbhQTq9qFHC2jA+NZcCZRdrEimwPJVH2gnSRjkrjW8Jrign01s
 /mH/6G2/DVRG1YSU50cyI5pC1ITqz3Wn5dzGdn5hzD+vaYJ0r2hyf+lEu2n6nwme3t3Z
 f9Wg==
X-Gm-Message-State: AOAM530Q8EBJSfbD6RUPJef/LfkTMjjcenADvRNGxOphgEwajOGAxxA1
 vUGfcKm4JqM7J9gk3SYetWM=
X-Google-Smtp-Source: ABdhPJzftGo8nRTv7RIgcIt53PSTSUtVXWHruNxsWPV1MKPJClQ92Xg6/+yhrkzv8iY/mNYgGNJoAg==
X-Received: by 2002:a17:907:a058:: with SMTP id
 gz24mr5425904ejc.544.1614073369461; 
 Tue, 23 Feb 2021 01:42:49 -0800 (PST)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id c18sm13745877edu.20.2021.02.23.01.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 01:42:48 -0800 (PST)
Date: Tue, 23 Feb 2021 06:42:42 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC PATCH 1/3] drm/vkms: decouple cursor plane setup from
 crtc_init
Message-ID: <20210223094242.shy3ndudhw3hweav@smtp.gmail.com>
References: <20210220143850.k22n4r4uel5zhxr2@smtp.gmail.com>
 <YDPeGjnrQKRdfRpZ@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YDPeGjnrQKRdfRpZ@phenom.ffwll.local>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Sumera Priyadarsini <sylphrenadin@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/22, Daniel Vetter wrote:
> On Sat, Feb 20, 2021 at 11:38:50AM -0300, Melissa Wen wrote:
> > Initialize CRTC only with primary plane (without cursor) as a preparation
> > to init overlay plane before cursor plane and keep cursor on the top.
> > 
> > Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
> 
> Why can't we first initialize all the planes (primary, cursor, overlay)
> and then the crtc?
> 
> For drivers where there's not really a functional difference between these
> planes (like vkms, since it's all sw, only difference is z position
> really) the usual approach is to initialize all planes in a loop. And then
> call crtc init with the first and last plane for that crtc.
> 
Hi Daniel,

It was a misundertanding from my side. I thought that, besides to
initialize the planes, setting the possible_crtcs should also be done in
order.

Thanks for the feeback. I will discard this patch from the series.

Melissa

> Passing NULL for the cursor for crtc_init and then patching it up
> afterwards is a bit a hack, so would be good to avoid that.
> -Daniel
> 
> > ---
> >  drivers/gpu/drm/vkms/vkms_crtc.c   |  4 ++--
> >  drivers/gpu/drm/vkms/vkms_drv.h    |  2 +-
> >  drivers/gpu/drm/vkms/vkms_output.c | 14 +++++++++-----
> >  3 files changed, 12 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> > index 0443b7deeaef..2d4cd7736933 100644
> > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > @@ -270,12 +270,12 @@ static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
> >  };
> >  
> >  int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
> > -		   struct drm_plane *primary, struct drm_plane *cursor)
> > +		   struct drm_plane *primary)
> >  {
> >  	struct vkms_output *vkms_out = drm_crtc_to_vkms_output(crtc);
> >  	int ret;
> >  
> > -	ret = drm_crtc_init_with_planes(dev, crtc, primary, cursor,
> > +	ret = drm_crtc_init_with_planes(dev, crtc, primary, NULL,
> >  					&vkms_crtc_funcs, NULL);
> >  	if (ret) {
> >  		DRM_ERROR("Failed to init CRTC\n");
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> > index 35540c7c4416..9ad5ad8b7737 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.h
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> > @@ -110,7 +110,7 @@ struct vkms_device {
> >  
> >  /* CRTC */
> >  int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
> > -		   struct drm_plane *primary, struct drm_plane *cursor);
> > +		   struct drm_plane *primary);
> >  
> >  int vkms_output_init(struct vkms_device *vkmsdev, int index);
> >  
> > diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> > index f5f6f15c362c..05d3bb45e6c1 100644
> > --- a/drivers/gpu/drm/vkms/vkms_output.c
> > +++ b/drivers/gpu/drm/vkms/vkms_output.c
> > @@ -47,6 +47,10 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
> >  	if (IS_ERR(primary))
> >  		return PTR_ERR(primary);
> >  
> > +	ret = vkms_crtc_init(dev, crtc, primary);
> > +	if (ret)
> > +		goto err_crtc;
> > +
> >  	if (vkmsdev->config->cursor) {
> >  		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, index);
> >  		if (IS_ERR(cursor)) {
> > @@ -55,9 +59,9 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
> >  		}
> >  	}
> >  
> > -	ret = vkms_crtc_init(dev, crtc, primary, cursor);
> > -	if (ret)
> > -		goto err_crtc;
> > +	crtc->cursor = cursor;
> > +	if (cursor && !cursor->possible_crtcs)
> > +		cursor->possible_crtcs = drm_crtc_mask(crtc);
> >  
> >  	ret = drm_connector_init(dev, connector, &vkms_connector_funcs,
> >  				 DRM_MODE_CONNECTOR_VIRTUAL);
> > @@ -100,11 +104,11 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
> >  err_connector:
> >  	drm_crtc_cleanup(crtc);
> >  
> > -err_crtc:
> > +err_cursor:
> >  	if (vkmsdev->config->cursor)
> >  		drm_plane_cleanup(cursor);
> >  
> > -err_cursor:
> > +err_crtc:
> >  	drm_plane_cleanup(primary);
> >  
> >  	return ret;
> > -- 
> > 2.30.0
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
