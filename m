Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D27E1E0244
	for <lists+dri-devel@lfdr.de>; Sun, 24 May 2020 21:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E013389C6B;
	Sun, 24 May 2020 19:25:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B9589C07
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 19:25:18 +0000 (UTC)
Date: Sun, 24 May 2020 19:25:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1590348316;
 bh=5+WpI4LqFG5p/XWlbX7OQC/mb7X+8TCfdqbNA4/Aa/I=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=V4bxFfule7pRY3qOfu8R7SwesHHlBL1ConUWuHBssJVkNl3Kk2HUwlcbNiDKPAywR
 0djGY9QV/h6yOqLFWsWwfBIyrPnqrzSbo9DatGMy7GWiLe654zfJRZHe6daz+ksw3K
 vrQ9F5mo7ptdNa3OBP62SWfCYyce1oTjUOf+gegY=
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] xf86drm: add drmOpenByFB
Message-ID: <2xZF5q7722pK-_L_0jQjYv33oMS6WS4Jm06tbVwUo9SQO9QBv48_HaVhzVHTb2OLnz3JUj3O1uRYn_y-JWGrWpD3c8J0y8Mr_qgwbNzsxDE=@emersion.fr>
In-Reply-To: <CAKMK7uGKps4AfLKTSP2HZTHd1cm+1dMD9r8M9rKobqwXGgv5EQ@mail.gmail.com>
References: <20200523154426.1088988-1-issor.oruam@gmail.com>
 <CAKMK7uGKps4AfLKTSP2HZTHd1cm+1dMD9r8M9rKobqwXGgv5EQ@mail.gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Robert Foss <robert.foss@collabora.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, Mauro Rossi <issor.oruam@gmail.com>,
 "cwhuang@linux.org.tw" <cwhuang@linux.org.tw>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sunday, May 24, 2020 8:53 PM, Daniel Vetter <daniel@ffwll.ch> wrote:

> On Sat, May 23, 2020 at 5:44 PM Mauro Rossi issor.oruam@gmail.com wrote:
>
> > OpenByFB is introduced to overcome GPU driver loading order issue
> > on a device with multiple GPUs, e.g. Intel iGPU and Nvidia dGPU
> > where the first drmfb kernel module loaded will become device file
> > /dev/dri/card0 and the second will become /dev/dri/card1
> > The use case is to prefer Intel iGPU over dGPU, or viceversa,
> > in a deterministic and reliable manner.
> > OpenByFB function opens the DRM device with specified fb and node type,
> > thus enabling gralloc to open the correct device node of the primary fb,
> > regardless of the GPU driver loading order.
>
> The fbdev load ordering is as inconsistent/random as the dri node
> loading. Well more so, because you might have random firmware fbdev
> drivers hanging out there. Hence I'm not following how this solves
> anything for your problem.
>
> I think usually what userspace does it look at the boot_vga property
> of the underlying device in sysfs, and prefer that one.

Yes. See [1] for an example of how to do this.

[1]: https://github.com/swaywm/wlroots/blob/5c942bd5972afee9a68cb15c14aa83b4b0aaf82d/backend/session/session.c#L331
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
