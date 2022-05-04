Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4588551B230
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 00:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF7710F86E;
	Wed,  4 May 2022 22:43:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD4FE10F86F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 22:43:15 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id b24so3282164edu.10
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 15:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qeNl0BPYDf3IXa/nIoXbcizIQgwortdosv6DqZ+2Ygs=;
 b=K0FwWjAxKLYxxY8VQ5P+DZca2xPeh/cBhVK6DsLQkfboh2wdAebP54hKdJ57ACMh+5
 o+aijwkiXLYPVcB4wUb22hNPWY7BS32Z8/ZKrGZoxyUzvdTdl+OO/gpsoovgJpRDeLN5
 zHSuT/qDM6f/HusbWuu6aJr5fVx7NgLQbPgfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qeNl0BPYDf3IXa/nIoXbcizIQgwortdosv6DqZ+2Ygs=;
 b=N4jSn5jFAHsPt6CR4IxgDOZ0ph2DhsWIbdqHh+6WWl2JEqlnbI4ePY7z9S2Xv1um4B
 IznEreWN21brl3xa08wogflC4SWcF+zVWSNj/NWSG4dBrrDKtQ4vUTPIO0GY+7UF3QUK
 eSw5QrUstGkDpIAE0GDqHzyepjYrJseb8cF34TIkAta0rF0kE0mt8H2uPuOQJf4GXUJ8
 ASsx9OTqP3EEHXHQ4TRFI5eCisYuFBtBikwKhAndFJKh3lBdSXuCFLfiBkv4ymtzn85F
 MDcRPrcLCelajeYfi+XX9Utdh5vjncBWW2oBE0K7jso+vqcHXVouyejPcngx2dv1EneO
 eMXg==
X-Gm-Message-State: AOAM533ygXDVLWF+hmgYb3Akewo9wqNxoMnIjDZlH6PqsOotVDLJqRDs
 5z/h8xkyK5FtzqvrmGbz5QAd9w==
X-Google-Smtp-Source: ABdhPJy4cr9ioAU+WY0vqg/v/MiW6O9lpTb9k9MbkvRur8zWIkSbBs0wJ67Drb1ntxzUBch3G+5YBw==
X-Received: by 2002:aa7:d842:0:b0:425:f329:33b1 with SMTP id
 f2-20020aa7d842000000b00425f32933b1mr26062144eds.74.1651704194239; 
 Wed, 04 May 2022 15:43:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 cf11-20020a170906b2cb00b006f3ef214da7sm77696ejb.13.2022.05.04.15.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 15:43:13 -0700 (PDT)
Date: Thu, 5 May 2022 00:43:12 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v2] drm/etnaviv: avoid cleaning up sched_job when submit
 succeeded
Message-ID: <YnMBgC8L9ij9Z1kK@phenom.ffwll.local>
References: <20220504090229.2506560-1-l.stach@pengutronix.de>
 <eb6f2f8d4ba4b34c1dcbe6f4e16449a1@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb6f2f8d4ba4b34c1dcbe6f4e16449a1@walle.cc>
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
Cc: kernel@pengutronix.de, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 04, 2022 at 10:58:57PM +0200, Michael Walle wrote:
> Am 2022-05-04 11:02, schrieb Lucas Stach:
> > While the labels may mislead the casual reader, the tail of the function
> > etnaviv_ioctl_gem_submit is always executed, as a lot of the structures
> > set up in this function need to be cleaned up regardless of whether the
> > submit succeeded or failed.
> > 
> > An exception is the newly added drm_sched_job_cleanup, which must only
> > be called when the submit failed before handing the job to the
> > scheduler.
> > 
> > Fixes: b827c84f5e84 ("drm/etnaviv: Use scheduler dependency handling")
> > Reported-by: Michael Walle <michael@walle.cc>
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> 
> FWIW (because it's already picked up)
> 
> Tested-by: Michael Walle <michael@walle.cc>

Thanks for confirming anyway, and apologies for breaking stuff - the bug
has been pretty screaming when I looked at the changes in detail and I
think I created it in one of the rebases and changes for drm_sched_job
error handling, I should have been a bit more careful.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
