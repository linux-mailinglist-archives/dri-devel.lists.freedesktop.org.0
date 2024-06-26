Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82ED6917A42
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 09:57:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7266010E164;
	Wed, 26 Jun 2024 07:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="KlirOKIE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B6D10E164
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 07:56:59 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-424a3d36c28so1603855e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 00:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1719388617; x=1719993417; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4weZwxLAOTSRE91t3PrkWKmPSiEW34ViHbejcnV7jHY=;
 b=KlirOKIERuIWE9ug5FXOc/xp8yMIFmC+yrJZ9jos8HU+pa/q7dS111XWxaHUgb9ZyV
 Y9cM6YLGnMEXNw6UzAS/40/yBWYiSCCLI9bbww0yS2DXnKdz0zeI71VCLfMuLHIg8Fdv
 UjAMVoZuf40flEoG2fnvcU3kRwGbM3NFqZjrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719388617; x=1719993417;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4weZwxLAOTSRE91t3PrkWKmPSiEW34ViHbejcnV7jHY=;
 b=H8qXawmjA+lYe7J6eTwxaSp0awtPSglu1+MGFPpmrsMK5MrqKCPScK49jxGEq8iC8h
 MhkzwMMQnAaQ0gVgJL7JaEWJPNkLqX0RBL84vVrlrQMAU+KaKGJqqYhLsOjNu6y+WNIj
 h1dysqZvdklMZCMIPyQzzcjOwR0DDa5cbpn995MB2+wV0hzRHPAb8QLS6cIhqula5jk3
 1Suz9R47yk6ZzDXl2xqSa/BLjGEBaAVbf4/VFPNvLTLsFlsUPBy3hJuf89ihM9YYTKRi
 qe45jq4RNo+jahBBqMN56aRMYq+NB5+KORQsgGKD4oAsNiJlbYGXMdaIqaMTkhflhSNf
 HMEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0LvZG1oqDgXxAyrto53Qsgzmxvn2dOFuRlWe/D/GS+KtYmJrNoIYJS7mUZjjAFbO/UPmvQRvmfW/RpzfOBkIfliEvwKL+xOIPSlrL3Qxn
X-Gm-Message-State: AOJu0YzzyWSk9SLO2Q0q5sluJw4eUhQTt5I4A6fhSnaGsJs9x82zGtbg
 J72JbDnk7veO0nhUhXiUHZEZ8IzGRtyc0SPHwBn62xs9dXhiOmx60yUbA1Eu/vo=
X-Google-Smtp-Source: AGHT+IE8mtnu354Lnnb8pc6Cfyx5XzQpO2ELR8w+d6qQu0+A10VHOPGQYWa6Ahs9j9Oz7mFzb9wmKg==
X-Received: by 2002:a05:600c:54cb:b0:425:604a:8f90 with SMTP id
 5b1f17b1804b1-425604a9174mr1512125e9.0.1719388617509; 
 Wed, 26 Jun 2024 00:56:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424c823c1c3sm15358085e9.3.2024.06.26.00.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 00:56:57 -0700 (PDT)
Date: Wed, 26 Jun 2024 09:56:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/ast: Inline drm_simple_encoder_init()
Message-ID: <ZnvJx_rRNPMik4Zf@phenom.ffwll.local>
References: <20240625131815.14514-1-tzimmermann@suse.de>
 <85916061-256b-4268-9361-67421dcb51e8@redhat.com>
 <97463c74-fe5d-4cd7-9b64-0264050e660a@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <97463c74-fe5d-4cd7-9b64-0264050e660a@suse.de>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Tue, Jun 25, 2024 at 04:03:21PM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 25.06.24 um 15:55 schrieb Jocelyn Falempe:
> > 
> > 
> > On 25/06/2024 15:18, Thomas Zimmermann wrote:
> > > The function drm_simple_encoder_init() is a trivial helper and
> > > deprecated. Replace it with the regular call to drm_encoder_init().
> > > Resolves the dependency on drm_simple_kms_helper.h. No functional
> > > changes.
> > 
> > Do you think it's possible to add a default to drm_encoder_init() to
> > avoid having to declare the same struct for each encoder ?
> > 
> > something like:
> > 
> > drm_encoder_init(...)
> > {
> > 
> > if (!funcs)
> >     funcs = &drm_encoder_default_funcs;
> > 
> > So you can call it like this to get the default funcs:
> > 
> > drm_encoder_init(dev, encoder, NULL, DRM_MODE_ENCODER_DAC, NULL);
> > 
> > 
> > I don't see this pattern in other drm functions, so it might not fit the
> > current coding style.
> 
> Yeah, we don't do this in other places. And it's not guaranteed that
> drm_encoder_cleanup() is the correct helper in all cases; even the common
> ones. I would prefer to not add such tweaks. As for
> drm_simple_encoder_init(), it was an attempt to solve exactly this problem,
> but the function is so trivial that it's not actually worth the dependency.

For drmm_encoder_init/alloc this is doable, because it makes sure that
there really is only one correct encoder cleanup hook for simple encoders.
Without drmm_ there's the entire "who calls kfree() and how buggy is it"
mess :-/

So I'd very much welcome this kind of handling in drmm_encoder_alloc/init,
but in the unmanaged drm_encoder_init I agree it sounds like a mistake.

Cheers,
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
