Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CCC158D71
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 12:20:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524276E4B3;
	Tue, 11 Feb 2020 11:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894766EA2B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 11:20:36 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id t3so11862868wru.7
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 03:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=oKA580eN4gimhHoVSc3Rn2l6V9j6epembRn90vRGC20=;
 b=JBUTnHNcMNs6ENlEPnyRfOjTSgoU7xd5T4/IhP12c+4bgPYWbGtAih5YxAy2qhGomu
 RWTkhl2QUphSxtLuR2pbHNLlxpdfSKN5JEIXGv2XyXrkc6WRhPUIT0vRZS3TfTJC4grj
 2b12zBcbydzrHkyj7S1CvTXpI8GpDMfRTSSBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=oKA580eN4gimhHoVSc3Rn2l6V9j6epembRn90vRGC20=;
 b=rSwcqiIIYpMxAVQ/0uJMttkH4msiBNhszrb527prsriJWl26e5vNvePAk+Bij9Ww/1
 pTkp1NtarjbFY2VBQTztb/n39Pm84azNC22WBw24Er7955hy4UA713wLU1spv/u5Eqvb
 uYSLOVLsUs4gWYPm1oIkuzvsOJyuYAFaPzK5tFr1jqy7IaaQz6T+3nuxBxztKFggMd72
 MZPUhvTH3Js2VHpaJtux+osj8dL8BnDFL5LrGQzxsHEXDfE6BlQO2ADIq+ty2dRThEE+
 ddQ0shXw1nTVqaZ1gVSr8+dmoMgJXblFLXpioMcBV5zvKXDym6FDVtLuGx7CmGYSqG1t
 dB5Q==
X-Gm-Message-State: APjAAAUsl8jR7s7B87gb94OAe45gDlJobaQQo8URsRzwG1mjrrN4sxwU
 eMii1WcatfRsuMsME+EqgD+4PcGFiFs=
X-Google-Smtp-Source: APXvYqzDbi9Nn/nF4xz/aZrpTNukXfQPHTI5FerkQMw65PC9zYc7DT5BD7kwZH9XBVnRZiUXyO17Vw==
X-Received: by 2002:a5d:4f8b:: with SMTP id d11mr7762537wru.87.1581420035116; 
 Tue, 11 Feb 2020 03:20:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f1sm4817887wro.85.2020.02.11.03.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 03:20:34 -0800 (PST)
Date: Tue, 11 Feb 2020 12:20:00 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/5] disable drm_global_mutex for most drivers, take 2
Message-ID: <20200211112000.GA2363188@phenom.ffwll.local>
References: <20200204150146.2006481-1-daniel.vetter@ffwll.ch>
 <61d3ec83-862d-fe88-d618-f7728806ea9a@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <61d3ec83-862d-fe88-d618-f7728806ea9a@suse.de>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 10, 2020 at 10:47:36AM +0100, Thomas Zimmermann wrote:
> Hi,
> =

> I smoke-tested the patchset by running X11, Weston and fbdev emulation
> on ast and udl. No apparent problems found, so
> =

> Tested-by: Thomas Zimmermann <tzimmermann@suse.de>

Merged patches 2-5 (first one needs to wait for amdgpu/radeon patches),
thanks everyone for review&testing.
-Daniel

> =

> Best regards
> Thomas
> =

> Am 04.02.20 um 16:01 schrieb Daniel Vetter:
> > CI didn't like my test-with tag :-/
> > =

> > Test-with: 20200128112549.172135-1-daniel.vetter@ffwll.ch
> > =

> > Daniel Vetter (5):
> >   drm: Complain if drivers still use the ->load callback
> >   drm/fbdev-helper: don't force restores
> >   drm/client: Rename _force to _locked
> >   drm: Push drm_global_mutex locking in drm_open
> >   drm: Nerf drm_global_mutex BKL for good drivers
> > =

> >  drivers/gpu/drm/drm_client_modeset.c | 12 +++++---
> >  drivers/gpu/drm/drm_drv.c            | 26 +++++++++-------
> >  drivers/gpu/drm/drm_fb_helper.c      | 16 ++--------
> >  drivers/gpu/drm/drm_file.c           | 46 ++++++++++++++++++++++++++--
> >  drivers/gpu/drm/drm_internal.h       |  1 +
> >  include/drm/drm_client.h             |  7 ++++-
> >  include/drm/drm_drv.h                |  3 ++
> >  7 files changed, 79 insertions(+), 32 deletions(-)
> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
