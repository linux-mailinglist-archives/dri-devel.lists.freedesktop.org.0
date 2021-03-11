Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7226A337FAF
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 22:37:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12006EE81;
	Thu, 11 Mar 2021 21:37:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF97E6EE81
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 21:37:07 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id n14so23577341iog.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 13:37:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=88YoBu3IChQNr/V3l4UggEOXALs8K2tk4zELlhVMgFY=;
 b=cacsc5uBz8v/ZhVFRBkxWZ8xmF4cBRzMB3TQ5ZxVj1cUtepWU3fr6Bx4wxuafCRoz3
 0aOrFlToMWvXi6TPBX2BpHEBnPBpsIn+/5/GPCyUJO8ajfayliiw1UT7lz1j4IBdb+rC
 iZ139o/cYk3JroJQa9uisy/pW2zYfEVMEIgr42bGVXXNg3ahLXzVL2P+km522E4iAdlw
 7b7OoRD6RgPJkGxySVJie/WA+kS74Wkvgmw8tYmEDeSdG7i0185DcpP2Jpra2MNjajZL
 +/R/RMiAiSc5zxAdNb9QDYnqt5n0Q7XvkJrwTRodiEqFVM2Pvt9z4704NMNtonpDAmpB
 58Jg==
X-Gm-Message-State: AOAM530W+2wdNRoViRmcX5IcamTJHqHEE/PCWVc1uhVD6u4+rvijIXF+
 jIt4aYAEt2w8QU8/0KGlnG9NmysZ+aUYUiZZ2aQ=
X-Google-Smtp-Source: ABdhPJw+YTm5PRWrc1GuPKUsimfEN4Wp8nCWrWwvqjSef29BAoUxRTJMC+nYrrWkOEw2ou0D9TVZCg7ED8EPPW+sLhE=
X-Received: by 2002:a02:7419:: with SMTP id o25mr5589952jac.100.1615498627003; 
 Thu, 11 Mar 2021 13:37:07 -0800 (PST)
MIME-Version: 1.0
References: <20210310045544.28961.qmail@stuge.se>
 <1894f3f7-bd1d-493e-8d7f-8c10917da51b@tronnes.org>
 <20210311144839.29454.qmail@stuge.se>
 <04a86207-325c-8170-6692-a87ec3b0fe4c@tronnes.org>
 <20210311200226.1166.qmail@stuge.se>
In-Reply-To: <20210311200226.1166.qmail@stuge.se>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Thu, 11 Mar 2021 16:36:56 -0500
Message-ID: <CAKb7UvihLX0hgBOP3VBG7O+atwZcUVCPVuBdfmDMpg0NjXe-cQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] drm: Add GUD USB Display driver
To: Peter Stuge <peter@stuge.se>
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
Cc: hudson@trmm.net, markus@raatikainen.cc,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-usb@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>, th020394@gmail.com,
 lkundrak@v3.sk, pontus.fuchs@gmail.com, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 11, 2021 at 3:02 PM Peter Stuge <peter@stuge.se> wrote:
> > > Hence the question: What does DRM promise about the XRGB8888 mode?
> >
> > That it's a 32-bit value. From include/uapi/drm/drm_fourcc.h:
> >
> > /* 32 bpp RGB */
> > #define DRM_FORMAT_XRGB8888   fourcc_code('X', 'R', '2', '4') /* [31:0]
> > x:R:G:B 8:8:8:8 little endian */
>
> Okay, "[31:0] x:R:G:B 8:8:8:8" can certainly mean
> [31:24]=x [23:16]=R [15:8]=G [7:0]=B, which when stored "little endian"
> becomes B G R X in memory, for which your pix32 code is correct.
>
> That's the reverse *memory* layout of what the name says :) but yes,
> the name then matches the representation seen by software. That's the
> "abstracted" case that I didn't expect, because I thought the name was
> refering to memory layout and because I was thinking about how traditional
> graphics adapter video memory has the R component at the lower
> address, at least in early linear modes.

The definition of the formats is memory layout in little endian. The
definition you see is of a 32-bit packed little-endian integer, which
is a fixed memory layout.

Now, if you're on an actual big-endian platform, and you want to
accept big-endian-packed formats, there's a bit of unpleasantness that
goes on. Basically there are two options:

1. Ignore the above definition and interpret the formats as
*big-endian* layouts. This is what nouveau and radeon do. They also
don't support AddFB2 (which is what allows supplying a format) -- only
AddFB which just has depth (and bpp). That's fine for nouveau and
radeon because the relevant userspace just uses AddFB, and knows what
the drivers want, so it all works out.

2. Comply with the above definition and set
dev->mode_config.quirk_addfb_prefer_host_byte_order to false. This
loses you native host packing of RGB565/etc, since they're just not
defined as formats. There's a DRM_FORMAT_BIG_ENDIAN bit but it's not
properly supported for anything but the 8888 formats.

I'm not sure why you guys were talking about BE in the first place,
but since this is a topic I've looked into (in the context of moving
nouveau from 1 to 2 - but that can't happen due to the reduced format
availability), figured I'd share some of the current sad state.

Cheers,

  -ilia
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
