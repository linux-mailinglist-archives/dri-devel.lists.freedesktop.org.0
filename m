Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F4D1ED11D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 15:45:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CDB389C2A;
	Wed,  3 Jun 2020 13:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC59B89C2A
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 13:45:16 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id e1so2445893wrt.5
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jun 2020 06:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=B9yrci7XXi+Fut+T2vAt55juj5rE/++nUAUvjZvU414=;
 b=fv2SKFls3l04cG390iVb+Lt7Fs8Iked5sNd7Yq30KlJfgyBj/uUCBQCFS6vUPY/3Q7
 wsTbPUMflpjWN7/JIbGK1PHiZbYuxOp0Jp2s3HsFGY+UmXtU/6FFC1eipYW58HzQJNmd
 hNiz4pGuR/gThYS0e/zOxYcrVm2CUHYBwUD+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=B9yrci7XXi+Fut+T2vAt55juj5rE/++nUAUvjZvU414=;
 b=FNDN5PK1uVTOoscX3OcwzfxRgSITKoN3pYwlot/H3CZ6Z2b8fXFcpLSawnS05VYd9M
 N0O/M9KyUVDXowqV03yGOzMV0bndFLM3UMwUyG83vRabCeJ+7YIR0hz/3HrYuzJSwe7n
 nYmMdt9MLRfFE5R/u17jlOk0y/CiAWGWghkRsAX7cH1L7aZeb1n8PjS94jcYLtlf6v0G
 SiER2RnLMjsbx4kQ3wIyNhIG8SuWvsvj859oQJYUeoUCMBv4bqymmxyUnUzk37wm1EPF
 OSFrQkvy7NUNXM81DJc0weuKbAXuxrqUyqi48RkaNjDZsotEDypvMo3GbcFaWct8gk5J
 DGeg==
X-Gm-Message-State: AOAM532R2nCADizMD03cTJxgfUSvzjS37k7yvpmO3Kz8jShkRwqVPaeN
 zS1stsUksOe90rvpJiOdZmC79g==
X-Google-Smtp-Source: ABdhPJyRYPmyul9VX5GzZQ1hbFkIEE3IWPI/vFfR88MZlbVCxgriScWRKEtniMfi6vOvKxzC5EJ02Q==
X-Received: by 2002:adf:f990:: with SMTP id f16mr30272000wrr.311.1591191915423; 
 Wed, 03 Jun 2020 06:45:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k21sm3647193wrd.24.2020.06.03.06.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2020 06:45:14 -0700 (PDT)
Date: Wed, 3 Jun 2020 15:45:12 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/atomic: don't reset link-status to GOOD without
 ALLOW_MODESET
Message-ID: <20200603134512.GP20149@phenom.ffwll.local>
References: <6Q-O7vKObfRu8cOyvcAxR_uRWgjQdlYgVursTGN2AaHtdaUZICSC6szFjkkDGXhyKF22Grj-aGCTC74OGhtuJ9JChitqvqtCVi1wr_Lnh6Y=@emersion.fr>
 <20200603111343.GO6112@intel.com>
 <20200603113646.GK20149@phenom.ffwll.local>
 <JVT0GCme37ZPwkrYR-Ly9A-jZKs8QGDGOgPcmyDgPHvYRwtNutsoG53fkrrKB95t-ml7YKa0gEpCchaW7jIgDW-XnBCYh6xjPrsO-3W05mo=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <JVT0GCme37ZPwkrYR-Ly9A-jZKs8QGDGOgPcmyDgPHvYRwtNutsoG53fkrrKB95t-ml7YKa0gEpCchaW7jIgDW-XnBCYh6xjPrsO-3W05mo=@emersion.fr>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Manasi Navare <manasi.d.navare@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 03, 2020 at 01:17:14PM +0000, Simon Ser wrote:
> On Wednesday, June 3, 2020 1:36 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
> =

> > On Wed, Jun 03, 2020 at 02:13:43PM +0300, Ville Syrj=E4l=E4 wrote:
> >
> > > On Wed, Jun 03, 2020 at 10:45:23AM +0000, Simon Ser wrote:
> > >
> > > > In update_output_state, the link-status property was reset to GOOD =
to
> > > > ensure legacy drmModeSetCrtc re-trains the link. However this auto-=
reset
> > > > is also performed on an atomic commit without ALLLOW_MODESET. If a
> > >
> > > I didn't think udate_output_state() was getting called for
> > > non-legacy paths. Where is that coming from?
> >
> > Oops, I'm blind and you're right, there's no bug. We already only
> > force-set this for legacy modeset (and fbcon).
> =

> Indeed, good catch Ville. set_config is purely a legacy thing.
> =

> > That also means that atomic userspace has to handle this, which is maybe
> > not so awesome ... So maybe we need to duct-tape over this for atomic t=
oo,
> > and in that case it should be only done when ALLOW_MODESET is set.
> >
> > But maybe all the compositors that care will handle this :-/
> =

> Not fond of this because we'll basically end up with some drivers
> checking for link-status (none do that yet) and some user-space
> resetting it to GOOD. It'll break only if user-space doesn't reset and
> a driver which checks link-status is used. Driver-specific behaviour
> isn't great.

See my other reply, drivers don't need to check for GOOD, it's kinda
magic.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
