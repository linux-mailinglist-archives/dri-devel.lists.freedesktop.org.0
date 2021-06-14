Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A31BA3A7076
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 22:31:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3820D899DB;
	Mon, 14 Jun 2021 20:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4617899DB
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 20:31:38 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id r5so23182601lfr.5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 13:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dkjEhYqE6mFvndufzXS8AHcdb4GNg2nj/s31fa7ie3k=;
 b=rF7XA4bhnmqn70erSVwmFGPYKpoXc4LRmOjOg9hmuDzS54B2oxIeNjeiSUZ2VDjZte
 f1qw4saFhWOxmgDucL07niDSdA7JnCbCorqvhKVKmrv3cZXdJa1+mM+RPQbTV00kZNka
 BzdgHdFQuuOeQt9fv/iJH3N3wgjVhNi83YG57FyYPcNEwexGW4dHQ5ydyU5rxKp8OVl8
 9egl0RGdLWB4OQwEmXzEZbrNPqGu1A3/+euiwltIDTkwd5TTWokUVqJG+MKsutWsgLpG
 VYQmefG9HlbO4hahlAXkDr2EdqdAeOaI6B+svlEMhSrFXu650WYDOdqF3LEoed1HfC55
 km5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dkjEhYqE6mFvndufzXS8AHcdb4GNg2nj/s31fa7ie3k=;
 b=fVeJLAOZeQjaC1DOlyDpno8noGuIlXA70vaPVgfHNR0FKocknG+3xmVaZZeQa3Vvru
 Gm7lAW7e+Fsw1EFTlW0LtCXhTID/BEf8lMXKEPMchwgblpTaFCI2tuUS5QduRA+KlSK7
 jTQghPl6XmcaBFA2I9MfN/pulSCZu3oV8j0bxcYmnU0L9883hZYKoui9CdBYTf96G847
 5Zh0dEzj+C0H47OyRLCiehVKFZBD8lDZJiWDVXDK8WdBgRn2yP7YNsVBdpqM/sGfD9Ad
 h+PUAyD7hvzg10ekrDK9eDvbE0vG4DYiWiqbFanu6E4q03rtceFXGY3h3VE2/ItVd/HC
 hJZg==
X-Gm-Message-State: AOAM531QoJSELbggm6zId7RH9U0Sk7vGN2vO4coLEqaj9hZfpkyPxjax
 8QxbQBk55mNC/S/ZWyH6CEJspVPkGjcH7WpAnpv6Aa3jSfs=
X-Google-Smtp-Source: ABdhPJx4amfMRVjsGR4BboWqYrfGGGguoAqkFshyVC82lIghQ/fQld/H1sE1iDFxDvMLcDK/RamdATg5VqBeIV6IlKQ=
X-Received: by 2002:a05:6512:20c9:: with SMTP id
 u9mr12916944lfr.291.1623702696900; 
 Mon, 14 Jun 2021 13:31:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210329180120.27380-1-noralf@tronnes.org>
In-Reply-To: <20210329180120.27380-1-noralf@tronnes.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 14 Jun 2021 22:31:25 +0200
Message-ID: <CACRpkdZvq_xL58Ns6S8cddd2hHmwVHALqVDqmvWjZpa3J5p1KQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/gud: Free buffers on device removal
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Peter Stuge <peter@stuge.se>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 29, 2021 at 8:01 PM Noralf Tr=C3=B8nnes <noralf@tronnes.org> wr=
ote:

> Free transfer and compression buffers on device removal instead of at
> DRM device removal time. This ensures that the usual 2x8MB buffers are
> released when the device is unplugged and not kept around should
> userspace keep the DRM device fd open.
>
> At least Ubuntu 20.04 doesn't release the DRM device on unplug.
>
> Signed-off-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>

Interesting, we have exactly the same thing with a shim device
staying around for open file handles after the actual physical
device dies in gpiolib. I guess this is a common problem.

Connect the buffer allocations to the device which will use
them not the userspace facing device, indeed.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
