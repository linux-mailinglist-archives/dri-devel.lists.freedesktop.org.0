Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A1641DC3A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 16:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B48806E417;
	Thu, 30 Sep 2021 14:26:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957086E417
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 14:26:56 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id t8so10452452wri.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 07:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=xCUW4DYpcvfuZtuU3plFLnVjCTEdDK5f8kHlUi+qoUE=;
 b=kqGLwx12cDUzoC3iVNA+NJM4OhqKmVGWb+hkz/24TW+SqnZyjX4yHnJMTUGXjJhhrw
 h2BmwKqV0WCPe/V8yNYQ7hjO+NER31wCIwxWNQMRKUE98UAzpMQ7rzPDlLVxuIhcFPuG
 af1WBWnfuOzPTg+Stbh8+dP0FEJKH48b/M52E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=xCUW4DYpcvfuZtuU3plFLnVjCTEdDK5f8kHlUi+qoUE=;
 b=Ki18JQ9DnTdjeeYZ5twdC+B9idLZTTYOUBy5//3ySHCpBwPcmehCw+KfWFk2r22iQ7
 l2QBqsjGdl7aTp/ikLiBfxHoGX5/+CkbkjITCOWh3fIUA1hYXuwQUG2BnuL8kVV3WrQz
 8oKBNwhRPMhgrJTFG5XflLqG9TriHE/1htrGvRkbktDeWtFi0JXl1c76jajZttFHxaci
 7JVjbW4aVp4j7p/4mi9SJuw+HAUKlEoRXE2uVXBSQMGfUsTibxFH6cd8H+eRRtXUavPN
 4MJiLbY4CBnVeznEzKR6MW2Ye+FqUgEigR1CfNArpXoXB0sZWmHj2h/FXxDjPsQ5gZ8H
 YW2A==
X-Gm-Message-State: AOAM53159aeIKAHCyHkXhYwgLDrRnw5wBMbrlF7xvrUSsWnJpsPSV5il
 iY72ugqpCNBJ3aTjFeVzVdNZ5w==
X-Google-Smtp-Source: ABdhPJyM/Mb9G9Dw6E28dIKZojOERdji8EqoOdbiAVKePmWDkfGwO6V7NnENfyHJOM3wI39vpQhC9A==
X-Received: by 2002:a5d:47a4:: with SMTP id 4mr6512514wrb.274.1633012015165;
 Thu, 30 Sep 2021 07:26:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u5sm3443501wrg.57.2021.09.30.07.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 07:26:54 -0700 (PDT)
Date: Thu, 30 Sep 2021 16:26:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Kees Cook <keescook@chromium.org>
Cc: Arnd Bergmann <arnd@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Arnd Bergmann <arnd@arndb.de>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [RESEND] drm: fb_helper: fix CONFIG_FB dependency
Message-ID: <YVXJLE8UqgcUNIKl@phenom.ffwll.local>
Mail-Followup-To: Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Arnd Bergmann <arnd@arndb.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210927142816.2069269-1-arnd@kernel.org>
 <202109270923.97AFDE89DB@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202109270923.97AFDE89DB@keescook>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Mon, Sep 27, 2021 at 09:23:45AM -0700, Kees Cook wrote:
> On Mon, Sep 27, 2021 at 04:28:02PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > With CONFIG_FB=m and CONFIG_DRM=y, we get a link error in the fb helper:
> > 
> > aarch64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_alloc_fbi':
> > (.text+0x10cc): undefined reference to `framebuffer_alloc'
> > 
> > Tighten the dependency so it is only allowed in the case that DRM can
> > link against FB.
> > 
> > Fixes: f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
> > Link: https://lore.kernel.org/all/20210721152211.2706171-1-arnd@kernel.org/
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> Thanks for fixing this!
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>

Stuffed into drm-misc-next.

Arnd, I guess I still can't volunteer you for commit rights so I don't
have to bother with this anymore? It's nice to be lazy and comfy :-)

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
