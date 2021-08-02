Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A223DD2A3
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 11:09:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0986E4D0;
	Mon,  2 Aug 2021 09:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D656D6E4D0
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 09:09:28 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id b7so23516587edu.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Aug 2021 02:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JVfs9sfaW8TDRZNHsemNswuxLGM9Fk3dGLj+GvG8HBQ=;
 b=WGMYSiNHNcpNFAdJI3PE1lvWvPwuvZr7QI7LlLgKgP9sFggUXrtsSwlTBLrLqSt16H
 rWubqVsIfrbPvOBUcVtfsBb6D4DZfsKreBOYewEDvxWvBu/MtYCdJmYov7V7jwu8y++B
 yxtwhAOU6vSFpjmY3MladqKB2jFxCrh1zubUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JVfs9sfaW8TDRZNHsemNswuxLGM9Fk3dGLj+GvG8HBQ=;
 b=c0i2B8vuAyoYaz7QB6PJzF+ntflWcJQWDaNVaRmehCdHMK0C7wp5DcuNe8XfNmRhkJ
 A8BCF+sbLnMgsHSc1p+35pbanJchCjdJDwPyVYLIwi+mUzYuOsrGBjNEFO0v4fxYxyET
 1zGTns2w00A/gvLhcLAPnymkPYAsNQXPM1KNdHjRceO4mfnpsaF9WqaqYaDj5dlKcjIm
 HfoG/OI/KgTZ3x60gGpGQ7eKHzNnfv3erD3noEf2F5VY/Pe2qQZKh/MA5BpiNgZ0zHvP
 JQpZ5GKYiSY85/HpJ2rQe8vZxr5tSE6uyCbeATCiXcjl4Snag2vpkIvyTUaxmtjIgWJj
 cjYA==
X-Gm-Message-State: AOAM531o3uBigiAx7czzivAo4vkB6nxU8oxxF8w6uzkmTPFrPvNyZZaO
 HmogzAMnjXDYw+6YE2Ssca3Sfw==
X-Google-Smtp-Source: ABdhPJyUQofqfK+iVEhqSFJnTT235E6oAKGT+zHUdlm5X9LWTk8/UfG1gCH22zo3kwywtC7xGW5heg==
X-Received: by 2002:a50:b412:: with SMTP id b18mr18329573edh.103.1627895367413; 
 Mon, 02 Aug 2021 02:09:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b5sm4272302ejq.56.2021.08.02.02.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 02:09:27 -0700 (PDT)
Date: Mon, 2 Aug 2021 11:09:25 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
 Simon Ser <contact@emersion.fr>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Tina Zhang <tina.zhang@intel.com>, Dongwon Kim <dongwon.kim@intel.com>
Subject: Re: [RFC v1 0/4] drm: Add support for DRM_CAP_DEFERRED_OUT_FENCE
 capability
Message-ID: <YQe2RfK0wCY6Q2y/@phenom.ffwll.local>
References: <20210729081659.2255499-1-vivek.kasireddy@intel.com>
 <YQPTo0D5SZfX44dn@phenom.ffwll.local>
 <20210730133850.bbje7uxvrvsmuopt@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210730133850.bbje7uxvrvsmuopt@sirius.home.kraxel.org>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Fri, Jul 30, 2021 at 03:38:50PM +0200, Gerd Hoffmann wrote:
>   Hi,
> 
> > - We fix virtio to send out the completion event at the end of this entire
> >   pipeline, i.e. virtio code needs to take care of sending out the
> >   crtc_state->event correctly.
> 
> That sounds sensible to me.  Fence the virtio commands, make sure (on
> the host side) the command completes only when the work is actually done
> not only submitted.  Has recently been added to qemu for RESOURCE_FLUSH
> (aka frontbuffer rendering) and doing the same for SET_SCANOUT (aka
> pageflipping), then send vblank events to userspace on command
> completion certainly makes sense.

Hm how does this all work? At least drm/virtio uses
drm_atomic_helper_dirtyfb, so both DIRTYFB ioctl and atomic flips all end
up in the same driver path for everything. Or do you just combine the
resource_flush with the flip as needed and let the host side figure it all
out? From a quick read of virtgpu_plane.c that seems to be the case ...

Also to make this work we don't just need the fence, we need the timestamp
(in a clock domain the guest can correct for ofc) of the host side kms
driver flip completion. If you just have the fence then the jitter from
going through all the layers will most likely make it unusable.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
