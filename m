Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B63A530F651
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 16:32:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0826E094;
	Thu,  4 Feb 2021 15:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 840FF6E094
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 15:32:20 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id d16so3961454wro.11
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 07:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=OHddg4KwkhbW2czo5caTcxRW+H2Ii0cmmum7Fw2R3bY=;
 b=VV4eJm+qGZ20YQCuZBVXV5YrD52cO57s+HBHpSc2W1rBo618bKLwKa0yrqAtDSniNp
 gU1fIKK26zEgFNVix7LO+9OmDYSznMU6rqi7gxdTsAR6MYTmmYScNraux1LkhkegCgcy
 DVk6p8vUcauKygmgCj16uv3M1gB2rSE9RxCm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=OHddg4KwkhbW2czo5caTcxRW+H2Ii0cmmum7Fw2R3bY=;
 b=aa70axJCkGoJr0WCHr2njTieECfoXfXQ3SfsmA7wQcC2Q8Vg5+sR2rcf6CVE3yqyHL
 pkDef81B3LOaLoF+2GZSBt5u10Q1W6VVQnODKCXnGoZ7Ix/5/mf5G4VnvYtTmYky1uCw
 TDTAtTuyjmeXfIaQM1iesyL3d3ziKVxq1Rt6+foPMnfS9H4gagmLMg76nrX5PnWUZXBa
 gKFLrhEB41P2xrphCMXEdDkoBkJZaupCHipJ0ImlUNn9Hm8873TdA5YkOLyoTkdCP911
 GC34v7MMLyQlWQY7Z6c4WO6kvcO7IrlFcSr2eSG0DgYEH5xr6BcF3Hb8SfTs4Tccyqf9
 uqnw==
X-Gm-Message-State: AOAM530eF4XFzLc6VHkM6g1mpBnoFB6VXwwveCWVdaYqOWGoPFha1+eM
 QA+X5eaHnVQUA7Xju2VKbtnFwg==
X-Google-Smtp-Source: ABdhPJyeahUGhKD98yF/LkR8ei+kW2+lrhWsVAiflZTfit6uewdJHScdS3TqowI027KYTmExXdkznQ==
X-Received: by 2002:a05:6000:143:: with SMTP id
 r3mr9964029wrx.357.1612452739271; 
 Thu, 04 Feb 2021 07:32:19 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x13sm1244525wmc.27.2021.02.04.07.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 07:32:18 -0800 (PST)
Date: Thu, 4 Feb 2021 16:32:16 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/vblank: Avoid storing a timestamp for the same frame
 twice
Message-ID: <YBwTgHwZwMr8PwMr@phenom.ffwll.local>
References: <20210204020400.29628-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210204020400.29628-1-ville.syrjala@linux.intel.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 04, 2021 at 04:04:00AM +0200, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> drm_vblank_restore() exists because certain power saving states
> can clobber the hardware frame counter. The way it does this is
> by guesstimating how many frames were missed purely based on
> the difference between the last stored timestamp vs. a newly
> sampled timestamp.
> =

> If we should call this function before a full frame has
> elapsed since we sampled the last timestamp we would end up
> with a possibly slightly different timestamp value for the
> same frame. Currently we will happily overwrite the already
> stored timestamp for the frame with the new value. This
> could cause userspace to observe two different timestamps
> for the same frame (and the timestamp could even go
> backwards depending on how much error we introduce when
> correcting the timestamp based on the scanout position).
> =

> To avoid that let's not update the stored timestamp unless we're
> also incrementing the sequence counter. We do still want to update
> vblank->last with the freshly sampled hw frame counter value so
> that subsequent vblank irqs/queries can actually use the hw frame
> counter to determine how many frames have elapsed.

Hm I'm not getting the reason for why we store the updated hw vblank
counter?

There's definitely a race when we grab the hw timestamp at a bad time
(which can't happen for the irq handler, realistically), so maybe we
should first adjust that to make sure we never store anything inconsistent
in the vblank state?

And when we have that we should be able to pull the inc =3D=3D 0 check out
into _restore(), including comment. Which I think should be cleaner.

Or I'm totally off with why you want to store the hw vblank counter?

> =

> Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_vblank.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> =

> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 893165eeddf3..e127a7db2088 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -176,6 +176,17 @@ static void store_vblank(struct drm_device *dev, uns=
igned int pipe,
>  =

>  	vblank->last =3D last;
>  =

> +	/*
> +	 * drm_vblank_restore() wants to always update
> +	 * vblank->last since we can't trust the frame counter
> +	 * across power saving states. But we don't want to alter
> +	 * the stored timestamp for the same frame number since
> +	 * that would cause userspace to potentially observe two
> +	 * different timestamps for the same frame.
> +	 */
> +	if (vblank_count_inc =3D=3D 0)
> +		return;
> +
>  	write_seqlock(&vblank->seqlock);
>  	vblank->time =3D t_vblank;
>  	atomic64_add(vblank_count_inc, &vblank->count);
> -- =

> 2.26.2
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
