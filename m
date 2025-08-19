Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84259B2C009
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 13:16:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C33A10E051;
	Tue, 19 Aug 2025 11:16:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V+M2UPsq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C17710E051
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 11:16:36 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-b47174c3817so3765458a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 04:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755602196; x=1756206996; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HqS3d0NR6IqU3PuzHJ4SMg1Xfpj38gv7VrlQrAk74Y8=;
 b=V+M2UPsqh28Xy/sv73RYqkilMQ5vJEG+BIWDvMCVAMIdVXRvX4xlBNw6FLapc/Shfl
 usrVVl+2VHr5zSGL4RiR1LZZ9ljfvahluFSiITXgSLYthqhpsB9CLUxiigrLlllGJMes
 m3T8fBXwuUlKQT9LKer/tfu6fRcD7tY7Fq2FNtZuqWLwo3IpoRia/j8JqWwcCHjcYJUM
 yyHBO1ctNVoW8kffMlQZxAtJGSwiR9IyJ5DPfUby+Dqrm/Mo0IfbnxUbGGnQPZ0mDS/L
 S+UTXSb0w5+enIj2HPuMa7FbtlCKnS1Ph7/Lj6fFZHU9V+XyaKz5omaLDoXV1F7DnPX4
 ut8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755602196; x=1756206996;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HqS3d0NR6IqU3PuzHJ4SMg1Xfpj38gv7VrlQrAk74Y8=;
 b=R7P2/Wh70Gr7TTWZxJhTlIGBckraFAg+jVfuLToUQ2uag6sR1SvyQv5EcoiVC+fA4I
 rggVThxNPrayD9BdYxHESf2MlPj2IKW2Mr9PldeSjNtRtb6PI2cuiZxJFKhCoANKieuL
 b+m/+QPUt/cE02VNzvRkWLJqvvWjDnHcAHx3Frqv7S7zYjIRe3tNY+U+Fa0keLx0ekYK
 n3gj97aHQSDCX/bM5jbCE0m9f2a9BwlMBTHZimO4sCROVwwsWyI+757rXSofFmbBbUvj
 mf+tepMYZCXlFrN9DoIwq5toB3t3qBgrXZGeEZWeW2X5pmCS3epyNz0ffN9hYDbCF5B+
 d//Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuzPPb5Wgv2i6Ybzz/lNkyDkOEuhRNtWPc4uWsiXoGixDzZt247eul/ogGXV93Nr3836PQK1185XI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAXg+YpT54szUHWBL9MRuT/9iAE9890wd3nbJJCpo5fFRmvcmr
 Ot34foPwX1qdCBwRzJ4EX7loaHB6iBhzVjMH4d5xjACx6BaUv2zq3Pke
X-Gm-Gg: ASbGnctn3+Z111Xhl8LnqSVk3cXkKoqH7IhLuN9I6htUxSZ1X2vJ5KEr8G+fJaF2Fv1
 OfgHbfxni4mZsg4Su+V+0pNqeeJ4tUqfREkDBJaBq24qN9HgRKPdxtP9QLZDD7gvVjekIz7aVG8
 1X1fCyuNtR6JW5WfF9/DfAnDq8zgPoXlnmuE1DTtVcd3nJnP/xDKdT1Y3B2cpV3/xl3HmhOunMh
 Co41EUznKfsR67Mx/xaJ+wCiQE/rnhM3kQlK4zrnWFSp8P25XKNECWNM7SezeFNqNUNjX+UwD7B
 4pNsJeW2Lmwvjfh5G58oJ7Id7Nrxf8dDtXxFqb0VS8w13ppdEWT5w5hkznl7qBrgbENw+t5Rh5m
 LzImej+jB3U2rzU156Q==
X-Google-Smtp-Source: AGHT+IHSoR+NU5YCpaPXFKS7cE/Fi+7cw3lEoddJGn9NYJrQY0F0AIXAu3Xti0MjWaptmgHCNbj9zg==
X-Received: by 2002:a17:902:db0b:b0:242:460f:e4a2 with SMTP id
 d9443c01a7336-245e0307277mr24452965ad.23.1755602195872; 
 Tue, 19 Aug 2025 04:16:35 -0700 (PDT)
Received: from Terra ([2001:df0:b240:b5e:abe3:8cfd:3fd8:5d8e])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446ca9ef62sm105663305ad.6.2025.08.19.04.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 04:16:35 -0700 (PDT)
Date: Tue, 19 Aug 2025 16:46:29 +0530
From: Athul Raj Kollareth <krathul3152@gmail.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, tzimmermann@suse.de
Cc: tzimmermann@suse.de, airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, skhan@linuxfoundation.org
Subject: Re: [PATCH v2] drm: Replace the deprecated DRM_* logging macros in
 gem helper files
Message-ID: <aKRdDRLZIEgZ17Ms@Terra>
References: <f94151b4-893a-4758-a118-153076a20d3c@suse.de>
 <20250818192247.58322-1-krathul3152@gmail.com>
 <90f79bba-bee6-47ea-9881-9ae37eae42e0@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90f79bba-bee6-47ea-9881-9ae37eae42e0@intel.com>
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

On Mon, Aug 18, 2025 at 09:42:46PM +0200, Michal Wajdeczko wrote:
 
 
> On 8/18/2025 9:20 PM, Athul Raj Kollareth wrote:
> > Replace the DRM_* logging macros used in gem helper files with the appropriate
> > ones specified in /include/drm/drm_print.h.
> > 
> > Signed-off-by: Athul Raj Kollareth <krathul3152@gmail.com>
> > ---
> > Changes in v2:
> >     - Change drm_gem_objects_lookup() to take a drm_device* argument.
> >     - Make appropriate changes to all calls of drm_gem_objects_lookup().
> > ---
> >  drivers/accel/rocket/rocket_job.c       |  4 ++--
> >  drivers/gpu/drm/drm_gem.c               | 12 +++++++-----
> >  drivers/gpu/drm/drm_gem_dma_helper.c    |  2 +-
> >  drivers/gpu/drm/panfrost/panfrost_drv.c |  2 +-
> >  drivers/gpu/drm/v3d/v3d_submit.c        |  2 +-
> >  drivers/gpu/drm/vc4/vc4_gem.c           |  2 +-
> >  include/drm/drm_gem.h                   |  5 +++--
> >  7 files changed, 16 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
> > index 5d4afd692306..db7c50c9ab90 100644
> > --- a/drivers/accel/rocket/rocket_job.c
> > +++ b/drivers/accel/rocket/rocket_job.c
> > @@ -560,14 +560,14 @@ static int rocket_ioctl_submit_job(struct drm_device *dev, struct drm_file *file
> >  	if (ret)
> >  		goto out_cleanup_job;
> >  
> > -	ret = drm_gem_objects_lookup(file, u64_to_user_ptr(job->in_bo_handles),
> > +	ret = drm_gem_objects_lookup(dev, file, u64_to_user_ptr(job->in_bo_handles),
> >  				     job->in_bo_handle_count, &rjob->in_bos);
> >  	if (ret)
> >  		goto out_cleanup_job;
> >  
> >  	rjob->in_bo_count = job->in_bo_handle_count;
> >  
> > -	ret = drm_gem_objects_lookup(file, u64_to_user_ptr(job->out_bo_handles),
> > +	ret = drm_gem_objects_lookup(dev, file, u64_to_user_ptr(job->out_bo_handles),
> >  				     job->out_bo_handle_count, &rjob->out_bos);
> >  	if (ret)
> >  		goto out_cleanup_job;
> > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > index 4a89b6acb6af..ee1e5ded6dd6 100644
> > --- a/drivers/gpu/drm/drm_gem.c
> > +++ b/drivers/gpu/drm/drm_gem.c
> > @@ -102,7 +102,7 @@ drm_gem_init(struct drm_device *dev)
> >  	vma_offset_manager = drmm_kzalloc(dev, sizeof(*vma_offset_manager),
> >  					  GFP_KERNEL);
> >  	if (!vma_offset_manager) {
> > -		DRM_ERROR("out of memory\n");
> > +		drm_err(dev, "out of memory\n");
> >  		return -ENOMEM;
> >  	}
> >  
> > @@ -764,6 +764,7 @@ static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
> >  
> >  /**
> >   * drm_gem_objects_lookup - look up GEM objects from an array of handles
> > + * @dev: corresponding drm_device
> >   * @filp: DRM file private date
> >   * @bo_handles: user pointer to array of userspace handle
> >   * @count: size of handle array
> > @@ -780,8 +781,9 @@ static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
> >   * failure. 0 is returned on success.
> >   *
> >   */
> > -int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
> > -			   int count, struct drm_gem_object ***objs_out)
> > +int drm_gem_objects_lookup(struct drm_device *dev, struct drm_file *filp,
> > +			   void __user *bo_handles, int count,
> > +			   struct drm_gem_object ***objs_out)
> >  {
> 
> can't we just use:
> 
> 	struct drm_device *dev = filp->minor->dev;
> 

Ah, yes. I think I can use that. Thank you.

Best regards,
Athul

 
