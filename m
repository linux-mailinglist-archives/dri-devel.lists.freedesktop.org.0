Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D21FB40C5D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 19:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE8710E805;
	Tue,  2 Sep 2025 17:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KPrnPvca";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79D4410E805
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 17:45:45 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-7725fb32e1bso2374288b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 10:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756835145; x=1757439945; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mLftuepl8Ai11mnJzzF3qo/kXusPLAacbdlidpMXOjM=;
 b=KPrnPvcaCXa6Wnpa6+1ZfViPH6x4qlAYUPlFJAQyZCZcQeko09R7fMgiBkG3eyc+26
 265s6U7c7JKiYGHV3/cHO+ojvKOwRQAHPqIbZbr6EfhxtoDM+BhZ7LhBOiIsPgbjq9B9
 Q/xAi5BT/TQ9HclZE96/m/GIT80DfpJ5F7T83b6MqubLmDTnaTB7VqewIKJ8Uyx7B5w/
 nh2+OLCRxFFXP0M91UPcsECOlskx+Ou0L4WraU8li35wWXNWLkQ0Jhpu62t5jweQ79/c
 GZQOs6r8bBm9PMyJnSA/a7B4/1iAi4Pw4EhGxbnGKEkjTOELsyd85uJU4lm3qsVinLVn
 8uug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756835145; x=1757439945;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mLftuepl8Ai11mnJzzF3qo/kXusPLAacbdlidpMXOjM=;
 b=JlmJSxaxEdIrXZcUw6zK1QKDxtPoQBYJVnCmNQCV92c/HFBtTt5H0Ti4hWPpW+U3L2
 t/Ka+WG2dWBOp5QfU5703MVlFu0Ip8gBkxz/fkucFBKRIQt85WPIyNAwMTXaFBEqTpLm
 +qscYftUUYb5rxJ5/NPSiRnNnP5nEvhsuMnqmd8Mv42gKy7HrybiwppT4wqZArKSf8wp
 vMvfhTZJ5jTgXZ101viivsi2mBdgk/HHpyGf9hOeTZ7dfesJApqaShSUAVd5n9cYdX2P
 YNESjtsF3I48zRMBTTBQQJ6MnMbcc2c7y54BA2owQHbZC+RnEQ87BvJZT3grbrlELudI
 i9wQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPcCciRQurJIJuLfEqi4akgsLBLDGOP4reWGpuIDdSQZ9itwAPbTZbkMfFggUuq3wFBpVP1cp6sZo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywayloz7pKLnwLKqtTuyxpBZXPMpYrZzgHHj/xSPBa36sLdv8uk
 J03KbpZ0sBXVudWSm4XOgrhTTBmPdf/OnP4PmaEDWoXc6Xh8CZS+HSCBZRV/Lw==
X-Gm-Gg: ASbGncsFGhmmrb+8v6tJpsvaKVA2xul4Fk+8KGfe8aWu9/6Fe6vlT0FjtKuzaLoZAsA
 OQL1XV/eP2Bse0yrb8wqEMzDKTAbYeFYyj5ir80JW2VGgTSIVAP7jdEcgD6K2YInLI6saoiPPn5
 HeRgSRX4sDye0q38FrE7TDPR9b+yTn/ijMv4Me8wzLLRLh+jDnzohewf3u02tSz/OXrhfJA2H5X
 OaY1bLm0IZS4ALViQEX+3DwPvpM+Z66+gokogF6v4zqtpmuLMx6QPG5CYmKMqUf6/3p8wv8AVa5
 oVYbZvmzmJ+N2UBx6fUHxRjaRlB/ZLO9VBeTj/+RqSnihtR3+LW86KRN78/uClJ9URkUbjyPTC4
 wKcDv0JPJ1b2N/wJ609yhjXJV3jloDHFcLtZaaRE=
X-Google-Smtp-Source: AGHT+IHraZscRDQf4h1fjj89O4jtpkvZmFKpvnnflKmKHVlG1h1oO0o54pzOpCTebqJtHo6A7gyQVw==
X-Received: by 2002:a05:6a20:258f:b0:240:1241:5f2c with SMTP id
 adf61e73a8af0-243d6dd13dfmr20064959637.10.1756835144876; 
 Tue, 02 Sep 2025 10:45:44 -0700 (PDT)
Received: from Terra ([2001:df0:b240:6cbd:e842:2f6a:96d:9188])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7724f079b88sm8154759b3a.40.2025.09.02.10.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 10:45:44 -0700 (PDT)
Date: Tue, 2 Sep 2025 23:15:39 +0530
From: Athul Raj Kollareth <krathul3152@gmail.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: tzimmermann@suse.de, skhan@linuxfoundation.org,
 dri-devel@lists.freedesktop.org,
 linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
 simona@ffwll.ch, mripard@kernel.org
Subject: Re: [PATCH v4 RESEND] drm: Replace the deprecated DRM_* logging
 macros in gem helper files
Message-ID: <aLctQ5pbI5vITf0S@Terra>
References: <aLcGnf_wrY5QuZZC@Terra>
 <6a5cc1e0-ea0a-4d7f-8834-20a371346d79@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a5cc1e0-ea0a-4d7f-8834-20a371346d79@intel.com>
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

On Tue, Sep 02, 2025 at 05:35:48PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 9/2/2025 5:00 PM, Athul Raj Kollareth wrote:
> > Replace the DRM_* logging macros used in gem helper files with the
> > appropriate ones specified in /include/drm/drm_print.h.
> > 
> > Signed-off-by: Athul Raj Kollareth <krathul3152@gmail.com>
> > ---
> > Changes in v4:
> >     - Some codestyle corrections.
> >     - Remove OOM error logging in drm_gem_init().
> > 
> > Changes in v3:
> >     - Revert all changes to drm_gem_objects_lookup().
> >     - Use drm_device from minor.
> > 
> > Changes in v2:
> >     - Change drm_gem_objects_lookup() to take a drm_device* argument.
> >     - Make appropriate changes to all calls of drm_gem_objects_lookup().
> > ---
> >  drivers/gpu/drm/drm_gem.c            | 13 +++++++------
> >  drivers/gpu/drm/drm_gem_dma_helper.c |  2 +-
> >  2 files changed, 8 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > index 4a89b6acb6af..dc3d6cfa692b 100644
> > --- a/drivers/gpu/drm/drm_gem.c
> > +++ b/drivers/gpu/drm/drm_gem.c
> > @@ -102,7 +102,6 @@ drm_gem_init(struct drm_device *dev)
> >  	vma_offset_manager = drmm_kzalloc(dev, sizeof(*vma_offset_manager),
> >  					  GFP_KERNEL);
> >  	if (!vma_offset_manager) {
> > -		DRM_ERROR("out of memory\n");
> >  		return -ENOMEM;
> >  	}
> 
> nit: you can now remove { }, didn't checkpatch.pl complain?
No, it did not.
> >  
> > @@ -783,9 +782,10 @@ static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
> >  int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
> >  			   int count, struct drm_gem_object ***objs_out)
> >  {
> > -	int ret;
> > -	u32 *handles;
> > +	struct drm_device *dev = filp->minor->dev;
> >  	struct drm_gem_object **objs;
> > +	u32 *handles;
> > +	int ret;
> >  
> >  	if (!count)
> >  		return 0;
> > @@ -805,7 +805,7 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
> >  
> >  	if (copy_from_user(handles, bo_handles, count * sizeof(u32))) {
> >  		ret = -EFAULT;
> > -		DRM_DEBUG("Failed to copy in GEM handles\n");
> > +		drm_dbg_core(dev, "Failed to copy in GEM handles\n");
> >  		goto out;
> >  	}
> >  
> > @@ -853,12 +853,13 @@ EXPORT_SYMBOL(drm_gem_object_lookup);
> >  long drm_gem_dma_resv_wait(struct drm_file *filep, u32 handle,
> >  				    bool wait_all, unsigned long timeout)
> >  {
> > -	long ret;
> > +	struct drm_device *dev = filep->minor->dev;
> >  	struct drm_gem_object *obj;
> > +	long ret;
> >  
> >  	obj = drm_gem_object_lookup(filep, handle);
> >  	if (!obj) {
> > -		DRM_DEBUG("Failed to look up GEM BO %d\n", handle);
> > +		drm_dbg_core(dev, "Failed to look up GEM BO %d\n", handle);
> >  		return -EINVAL;
> >  	}
> >  
> > diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
> > index 4f0320df858f..a507cf517015 100644
> > --- a/drivers/gpu/drm/drm_gem_dma_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_dma_helper.c
> > @@ -582,7 +582,7 @@ drm_gem_dma_prime_import_sg_table_vmap(struct drm_device *dev,
> >  
> >  	ret = dma_buf_vmap_unlocked(attach->dmabuf, &map);
> >  	if (ret) {
> > -		DRM_ERROR("Failed to vmap PRIME buffer\n");
> > +		drm_err(dev, "Failed to vmap PRIME buffer\n");
> >  		return ERR_PTR(ret);
> >  	}
> >  
> 
> otherwise LGTM, so with nit fixed:
> 
> 	Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> but you still need someone else to merge it
> 
Thank you, I will fix it and hopefully get someone to merge it.

Best regards,
Athul
