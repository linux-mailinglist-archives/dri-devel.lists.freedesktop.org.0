Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C36ED199603
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 14:11:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B5E6E2E4;
	Tue, 31 Mar 2020 12:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED9E6E2E4
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 12:10:58 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f6so2308480wmj.3
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 05:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RrqkCj6L/Tg2EbBd7IQLzdwlvBoqLN79C8ZFJpwkZcA=;
 b=RjXP8ybQ/cwskiyw14qvGPMgpglpCgZmlaSO0k7nVjB8K/FUCnH4tNXcqih7sB2fL6
 ZAhvKsoiuPSjoAUOgXnm6kRv16R8P3Qy7UzI6WzaJD6KxKqDLslVHHKu96fFJHNXFCML
 JvGJlOj7fteoN/9jgJsWkxfblR8tID+KmWIRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RrqkCj6L/Tg2EbBd7IQLzdwlvBoqLN79C8ZFJpwkZcA=;
 b=jXOi04oea/pkB+u85KHPdfIzc/Hktuf25KFZXnDP662h+vkOYoCQ4bNPI/zkXey3JP
 f3kle+b1LUKg88BmWAg+ZVXZryO2BLeEbbHsYui6h2OtbIi2fH2TPAmKP9tnnogh8GbI
 zCsmFAzCuPixO+h59Qlz7/8bX+CAzJM6VI1/C1XNHuX/OXHLm+uOhAp35q1wwrklf+9B
 qIMa0rCwxGAGvyHRA24bABtG99ZSEo0KM07xYswemcDpwPbVCK4aNMFgn0BWiZba0zPm
 BGq6m23N961c/AxpdfsRsu/d87I7rUmS17r5rDq8U0PQrpUq5JFDafBthE1bavU4LpV3
 V0Dg==
X-Gm-Message-State: ANhLgQ2DuoKL5GJGdetxN9ChSTn5KebiCN8RhqU0CcLg/zPWWT21T+DD
 yJjm4adyBhpyb4Io3l32z8/syA==
X-Google-Smtp-Source: ADFU+vs2wmCBVaB/oYiIVew6td6JDgz8HhKkDkfa4r/TRGwZKxplR1/00rfBBAs0qZiaJxGRqC21wQ==
X-Received: by 2002:a05:600c:2317:: with SMTP id
 23mr3208379wmo.85.1585656657013; 
 Tue, 31 Mar 2020 05:10:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k84sm3687978wmk.2.2020.03.31.05.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 05:10:56 -0700 (PDT)
Date: Tue, 31 Mar 2020 14:10:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 0/3] video: Use scnprintf() for avoiding potential buffer
 overflow
Message-ID: <20200331121054.GN2363188@phenom.ffwll.local>
References: <20200311093230.24900-1-tiwai@suse.de>
 <CGME20200319154932eucas1p2ef5a13ed2630d236acb7a7bb0b5e56c6@eucas1p2.samsung.com>
 <s5hh7ykuyyg.wl-tiwai@suse.de>
 <85a0f31c-2e83-cf13-d5e8-2ea7f236f921@samsung.com>
 <s5hftdufbm9.wl-tiwai@suse.de>
 <9c3c20d5-290f-2a2c-07c1-12df8d02c921@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9c3c20d5-290f-2a2c-07c1-12df8d02c921@samsung.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 31, 2020 at 01:59:32PM +0200, Bartlomiej Zolnierkiewicz wrote:
> 
> On 3/27/20 9:25 AM, Takashi Iwai wrote:
> > On Fri, 20 Mar 2020 14:42:51 +0100,
> > Bartlomiej Zolnierkiewicz wrote:
> >>
> >>
> >> On 3/19/20 4:49 PM, Takashi Iwai wrote:
> >>> On Wed, 11 Mar 2020 10:32:27 +0100,
> >>> Takashi Iwai wrote:
> >>>>
> >>>> Hi,
> >>>>
> >>>> here is a series of trivial patches just to convert suspicious
> >>>> snprintf() usages with the more safer one, scnprintf().
> >>>>
> >>>>
> >>>> Takashi
> >>>>
> >>>> ===
> >>>>
> >>>> Takashi Iwai (3):
> >>>>   video: omapfb: Use scnprintf() for avoiding potential buffer overflow
> >>>>   video: omap2: Use scnprintf() for avoiding potential buffer overflow
> >>>>   video: uvesafb: Use scnprintf() for avoiding potential buffer overflow
> >>>>
> >>>>  drivers/video/fbdev/omap/omapfb_main.c          | 14 +++++++-------
> >>>>  drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c |  8 ++++----
> >>>>  drivers/video/fbdev/uvesafb.c                   |  2 +-
> >>>>  3 files changed, 12 insertions(+), 12 deletions(-)
> >>>
> >>> Just a gentle ping about those patches.
> >>> Let me know if any further changes needed.
> >> Patches #1-3 queued for v5.7, thanks!
> > 
> > I still don't see those in linux-next as of today.
> > Could you check it?
> They are in drm-misc/drm-misc-next branch but for some reason linux-next
> uses drm-misc/for-linux-next one.
> 
> Daniel, is this correct?
> 
> [ I couldn't find anything about for-linux-next branch at
>   https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html ]

Yup, once drm is frozen for features we push drm-misc-next-fixes to
for-linux-next, but the main branch drm-misc-next is still open (but will
be delayed to the subsequent kernel merge window). That's why the "where
do I apply a bugfix" diagram in our docs isn't that simply (if you pick
the wrong branch it's going to be one kernel release too late). This
freeze generally happans around -rc6/7 or so, a bit ahead of when the
merge windo opens.

iow the above stuff is queued for 5.8, and should show up in linux-next
right after -rc1 is out.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
