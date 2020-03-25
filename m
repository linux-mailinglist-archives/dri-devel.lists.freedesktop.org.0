Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0426E192DD1
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 17:08:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE1389890;
	Wed, 25 Mar 2020 16:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF73A89890
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 16:08:12 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a81so3348026wmf.5;
 Wed, 25 Mar 2020 09:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ixbROLOmeLq0mO6PeYIhR3XCaB7opkScZZtzUhky/AU=;
 b=Ov3F0xX7WSaaviMCXK0Dc2jrJMmWPM2VVdqHBzQZJGmP6HtdrGenkjnmRVyigWy17E
 HXPW/SLWbeXv4klht679yeL3jmXHl15tKHIGwN5hWbrY+TkDUX7dpGG1n9mLD5tI0Vrs
 6eX19Y8vn/EeDYvEJpevNchth9OA1mwqPdvYVQ1fgF5hgFpUTiZF0EwZCkGlHga8qD+F
 QecnjvDt1IFv5iNA15MRo0FBW7GDAudi+PHFdwjogaeGVb5/4wcV+IhiGpNq7P01ie98
 kDHnVp5Am0xQtI8ieiift6CbcLHmPAgMwyNwhFWkHrO+anFH7o/TlkF0l6OgtsOHpX8X
 VkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ixbROLOmeLq0mO6PeYIhR3XCaB7opkScZZtzUhky/AU=;
 b=htvi27AFmqqs9P7akALp9P3hWRzT90/yzVd1RO/ewj8zkHRvwpwVdJnilMzPMkn6L5
 h3R6m9UZDWn2t/rNA6q5RHfBCJtViY0+NBhY5Lh9o+CfW32hd23uTth7b5FSg+/qFprY
 7aqT0mn3wNJoWCEm7HYK7PXBigzO4nRZw4eIotFzhm3eREBKEAHex9xk4zyUeDqtlDnO
 HXSCX88geAfncMmOOAilAw/U9B3BzncB/IKiG4pjvCseda+fU3IDr1LW3RSXg91fbDhR
 qlUJTb90GUz9jr7bu1CIRyaZDVc5AYt9P0ZVTp0hOXHSGcwJancNNijVg6ZKRsRJx8im
 piCg==
X-Gm-Message-State: ANhLgQ3X3hGLK2u/P3NOR7v2MbzOX0fJ83AuDIpoikCtRrMTjOv8U1ap
 WTZhI8Rj7+aoSyx6p+CKTczag9ODW6GYtR97u3c=
X-Google-Smtp-Source: ADFU+vttpgaM6WIjzO6/7c2r+BmhO3Fd/fDVy8h/NTwzqh3BMyNi1q8/25wBGAqNuGumuiOmNyPz8YdSkWE1Gr4REvc=
X-Received: by 2002:a1c:cc11:: with SMTP id h17mr4136098wmb.39.1585152491439; 
 Wed, 25 Mar 2020 09:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200325090741.21957-1-bigbeeshane@gmail.com>
 <20200325090741.21957-4-bigbeeshane@gmail.com>
 <14063C7AD467DE4B82DEDB5C278E8663FFFBD48B@fmsmsx107.amr.corp.intel.com>
 <CABnpCuD-A20o3cQrPb+LwbsSRTGPwwdCAYYsSjeCdmimNMYyYA@mail.gmail.com>
In-Reply-To: <CABnpCuD-A20o3cQrPb+LwbsSRTGPwwdCAYYsSjeCdmimNMYyYA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 25 Mar 2020 12:08:00 -0400
Message-ID: <CADnq5_Op0Yn9vtWkYdzhr8rz3FFJwVbhiBKBprvqSosVx8fmyA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] drm/radeon: fix scatter-gather mapping with user
 pages
To: Shane Francis <bigbeeshane@gmail.com>
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ruhl,
 Michael J" <michael.j.ruhl@intel.com>,
 "amd-gfx-request@lists.freedesktop.org"
 <amd-gfx-request@lists.freedesktop.org>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 25, 2020 at 11:54 AM Shane Francis <bigbeeshane@gmail.com> wrote:
>
> > >-----Original Message-----
> > >From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> > >Shane Francis
> > >Sent: Wednesday, March 25, 2020 5:08 AM
> > >To: dri-devel@lists.freedesktop.org
> > >Cc: airlied@linux.ie; linux-kernel@vger.kernel.org; bigbeeshane@gmail.com;
> > >amd-gfx-request@lists.freedesktop.org; alexander.deucher@amd.com;
> > >christian.koenig@amd.com
> > >Subject: [PATCH v4 3/3] drm/radeon: fix scatter-gather mapping with user
> > >pages
> > >
> > >Calls to dma_map_sg may return segments / entries than requested
> >
> > "may return less segment..." ?
> >                        ^^^
>
> I will reword / fix the highlighted issues with the text and send a updated
> patch set later today.

I'll fix it up locally when I apply it.  Thanks!

Alex

>
> >
> > >if they fall on page bounderies. The old implementation did not
> > >support this use case.
> > >
> > >Signed-off-by: Shane Francis <bigbeeshane@gmail.com>
> > >---
> > > drivers/gpu/drm/radeon/radeon_ttm.c | 2 +-
> > > 1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > >diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c
> > >b/drivers/gpu/drm/radeon/radeon_ttm.c
> > >index 3b92311d30b9..b3380ffab4c2 100644
> > >--- a/drivers/gpu/drm/radeon/radeon_ttm.c
> > >+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> > >@@ -528,7 +528,7 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_tt
> > >*ttm)
> > >
> > >       r = -ENOMEM;
> > >       nents = dma_map_sg(rdev->dev, ttm->sg->sgl, ttm->sg->nents,
> > >direction);
> > >-      if (nents != ttm->sg->nents)
> > >+      if (nents == 0)
> > >               goto release_sg;
> >
> > This looks correct to me.
> >
> > Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> >
> > M
> > >       drm_prime_sg_to_page_addr_arrays(ttm->sg, ttm->pages,
> > >--
> > >2.26.0
> > >
> > >_______________________________________________
> > >dri-devel mailing list
> > >dri-devel@lists.freedesktop.org
> > >https://lists.freedesktop.org/mailman/listinfo/dri-devel
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
