Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 100FA3F87F5
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 14:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A866E83C;
	Thu, 26 Aug 2021 12:50:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34BDE6E83C
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 12:50:21 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id q3so4503117edt.5
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 05:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=I9wjcFFYltBqsKTuBhl5Qy8QquzY3ivFWev1xfsh3Ig=;
 b=JU0gGqThOJXS7CBHeQ7gRqSpDgKndNKO2Z+6znbYILfsniCFm81lM3vU+wzwcHwxty
 XMlzFY4YagMS9sYjkNrd09TrJMtzrmVPeUXKPNebOJLQlQrVKA0GzQM8tSGyg5tJgNss
 8bRZcSwSg7xJ0J6AkidlwUbq8vfahqqK7kRn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=I9wjcFFYltBqsKTuBhl5Qy8QquzY3ivFWev1xfsh3Ig=;
 b=TKTu8e4kw+QljWZJ6xhJPSHdvq17WDcrO98Va6pdE/FU3kbdFHgA9YtjFQnpCVN2wh
 osuPCM5HiaEI007z12/U94WwoD0tc3Mr2iSSLCjtM4ZsiCLou0f7ABbvaMLGB+J4dHGn
 tkjnhcAQI5ZnMYL/A1SVpiUUmq/RmARFSQ5vSCqrKtMhvs8iE4y+nGoBoIXXkdFOsKNp
 +89IgJCJHV2NFWXjD+eokBPFd4W2O90FzUOA1vvwK04J2tezNgQgUyIyIdr64zh7EiQN
 5CucYlYlHv4KZ8jgh/QjhtGobpfIJigxhGuHtyL0j1CcA+6zuwWYJE60g5NfNoiO9BTf
 AhnQ==
X-Gm-Message-State: AOAM532FqnPhLPTdPpv0zc5aVRHYka+FHtuQYRfho/skbnX9QONPhYm/
 kV5BxBEcukjE8funPS3ZP21F9Q==
X-Google-Smtp-Source: ABdhPJwM+FGcOxNnqwHj4qE6peBnRjY/imjHjM5SPyKXqUQkMUI+wpanCISJdtgLMjVihBURhNOsMA==
X-Received: by 2002:a05:6402:110e:: with SMTP id
 u14mr4087222edv.345.1629982219785; 
 Thu, 26 Aug 2021 05:50:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id di15sm190333edb.20.2021.08.26.05.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 05:50:18 -0700 (PDT)
Date: Thu, 26 Aug 2021 14:50:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 daniel.vetter@ffwll.ch, airlied@gmail.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/5] drm/vmwgfx: unbind in vmw_ttm_unpopulate
Message-ID: <YSeOCLUjalj6tT83@phenom.ffwll.local>
References: <20210728130552.2074-1-christian.koenig@amd.com>
 <eebf6fc4-c299-6aa7-f91c-16029c5c3444@gmail.com>
 <3ad5188659ce362087db1980880ac47af60e639f.camel@linux.intel.com>
 <YSdVkNcKLG8j7uP/@phenom.ffwll.local>
 <8800c47f-7029-1804-774c-457ce850066c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8800c47f-7029-1804-774c-457ce850066c@gmail.com>
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

On Thu, Aug 26, 2021 at 12:11:04PM +0200, Christian König wrote:
> 
> 
> Am 26.08.21 um 10:49 schrieb Daniel Vetter:
> > On Mon, Aug 23, 2021 at 01:15:20PM +0200, Thomas Hellström wrote:
> > > On Mon, 2021-08-23 at 13:05 +0200, Christian König wrote:
> > > > Adding Thomas on CC as well.
> > > > 
> > > > Just a gentle ping. I think the patch set makes sense now.
> > > > 
> > > > Regards,
> > > > Christian.
> > > > 
> > > > Am 28.07.21 um 15:05 schrieb Christian König:
> > > > > Doing this in vmw_ttm_destroy() is to late.
> > > > > 
> > > > > It turned out that this is not a good idea at all because it leaves
> > > > > pointers
> > > > > to freed up system memory pages in the GART tables of the drivers.
> > > > > 
> > > > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > > > ---
> > > > >    drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 9 +++------
> > > > >    1 file changed, 3 insertions(+), 6 deletions(-)
> > > > > 
> > > Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > For next time around I think recording a bit more of the discussions and
> > git history in these would be really good. At least I'd like to get more
> > people ramped up on ttm work, and for that to work out things need to be a
> > bit more accessible ... The above commit message is pretty much useless if
> > you ever hit it in a git blame, if you haven't been involved in any of
> > these discussions.
> 
> I've pushed it with a link tag back to the patches in patchwork, but I
> should probably include a link tag to the older versions as well for
> completeness.

Imo references to the commits that landed which broke stuff and full
quotes of the relevant discussions in the other thread. Just adding the
links still means you have to painstakingly stitch the story together
yourself, but at least it would be somewhat possible.

Really I think stuff like this should be documented in kerneldoc for these
callbacks, and we just got to start doing that. Waiting until magically
someone else fixes the ttm kerneldoc wont happen :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
