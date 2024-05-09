Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E038C0E11
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 12:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3204410E0B7;
	Thu,  9 May 2024 10:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="QMZbp52S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889AA10E0B7
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 10:18:09 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a59cac06ec3so17802866b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 03:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1715249887; x=1715854687; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QMo80re7R0QCnfDajuHAeRt8PiE3aaMzdIRLNaEedAA=;
 b=QMZbp52St2DNNjofSOMyHMklpi5lTQ0QCdFT9sOOeUMCASRc05Wr238qg/xP0YGiSs
 WW9tUo+/N3usMzCtGYGByUle/Dx6bFTdp6SRe9qlm+0pww+cLTLPJIFQMskqOYXBFY8u
 RUjodxCGDXOQygJwL3PuMEttZoFx7fjis0his=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715249887; x=1715854687;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QMo80re7R0QCnfDajuHAeRt8PiE3aaMzdIRLNaEedAA=;
 b=fZhY17UUkrpvQr6SR6kUfStTzsK6dIp8VrwOi1CFzHQc+s83S88booItQYeMtwViAj
 N+6dsWBZyL/+ND1L/ukeJnNo6J37EFHKMa3/qZzrlkdhaWpedNdL116A6Rzxy0EQ12uO
 nkX4WEhu6A8SBzGazUy8xRvsV7WAexAmDjYW77nut3x0/MRPpp72etuJCk0dacnMb/vo
 qEz8g4GBu5mKnviOQzyH/ZQJ5Lm/ZdqS/A1ACClXg27wV/He36xkC/bNx5a3NJOPzrbJ
 ehYYGBM/YoD2UuPJMK7SWu20iUnfXYo4q9NHWcLF++i/ovTLhgAb3zMcJfu9fx+mQvY+
 0iuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8/XiXqZzNY3eRqmeo6+B5O5ceIozB9Wa544dNlIl5CZk3dhVd14wlK3bGHs1QOsUZq+CrS232WKKjfPxBehObt6CF4wT4QsMc7bFFvcmi
X-Gm-Message-State: AOJu0YwWqhAuQFJm3lqQng4K851zFqith1AsZI1E11VLBynbQeoFFeAK
 qmp4u3nO6HQqLk3eiX3gXFVmKIwRpa2K6eVuiHSDOYPMXXApQrQpqHIyY2Fx71o=
X-Google-Smtp-Source: AGHT+IFD2ffhpTIw9COJST54Y67NKmy5baxY2JSAOghYtJSXueh+ikZCOoiZHjIPGzIdmW+a/PZPDg==
X-Received: by 2002:a05:6402:401c:b0:572:6698:9247 with SMTP id
 4fb4d7f45d1cf-5731d99603emr3717435a12.1.1715249887481; 
 Thu, 09 May 2024 03:18:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733bed72bbsm543942a12.57.2024.05.09.03.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 03:18:06 -0700 (PDT)
Date: Thu, 9 May 2024 12:18:04 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Naushir Patuck <naush@raspberrypi.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH 2/2] drm/fourcc.h: Add libcamera to Open Source Waiver
Message-ID: <Zjyi3CFNIKFv1HG5@phenom.ffwll.local>
References: <20240228102245.80469-1-jacopo.mondi@ideasonboard.com>
 <20240228102245.80469-3-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240228102245.80469-3-jacopo.mondi@ideasonboard.com>
X-Operating-System: Linux phenom 6.6.15-amd64 
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

On Wed, Feb 28, 2024 at 11:22:44AM +0100, Jacopo Mondi wrote:
> The libcamera (www.libcamera.org) project uses the drm/fourcc.h header
> to define its own image formats. Albeit libcamera aims for fully open
> source driver and userspace software stacks, it is licensed with the
> 'GNU L-GPL' license which allows closed source application to link
> against the library.
> 
> Add libcamera to the list projects to which the 'Open Source User
> Waiver' notice applies.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  include/uapi/drm/drm_fourcc.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 4e6df826946a..beef743ac818 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -97,6 +97,7 @@ extern "C" {
>   *
>   * - GL
>   * - Vulkan extensions
> + * - libcamera

I think we can bikeshed whether we want to be more specific (with like
listing the gl/vk extensions), but imo it's a good start and imo also
totally makes sense to officially list libcamera. On both patches.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I think collect a handful more acks from drm and libcamera folks and then
land this.
-Sima

>   *
>   * and other standards, and hence used both by open source and closed source
>   * driver stacks, the usual requirement for an upstream in-kernel or open source
> -- 
> 2.43.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
