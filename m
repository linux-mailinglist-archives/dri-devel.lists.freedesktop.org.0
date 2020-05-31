Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5551E993C
	for <lists+dri-devel@lfdr.de>; Sun, 31 May 2020 19:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8664689E38;
	Sun, 31 May 2020 17:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E5A89E38
 for <dri-devel@lists.freedesktop.org>; Sun, 31 May 2020 17:21:26 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id a68so4317031vsd.8
 for <dri-devel@lists.freedesktop.org>; Sun, 31 May 2020 10:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6Xa/p3RaMPdMpv3FkdDhw9giyhla/nXQ8S7VUYfYelU=;
 b=N1blGyMGEesI/w0cTCqn1JLZRsPhzLgmL8b7poUytOtcMfxrv/8BRxLI1gEHwW/pHL
 8/JVLy6/khC/1Bd5a6ZtT5+Gt30EBuMTkd4O69hEM/NEtQq99hnfzH7iR+UzQBewM8IC
 w/p4fCwGcgni6uNWXT4gvaT6iSskORVqXmtsbKdl9k4XRmdBy/7AxZYRK2QUl+kBthQ8
 Hp4fLxTq2wkWx6mzf31ZitMBhJ+Yufov4Olvdq2pYcUh9dFlsWFYl76RlywiqptG8tx+
 orBNgugCjNNHIM/oihj8oPAzwfoN9QV9sm9X6DW4jp1cYvm7jFhCxA+L0LaaIkIcPL3p
 TTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6Xa/p3RaMPdMpv3FkdDhw9giyhla/nXQ8S7VUYfYelU=;
 b=FHJ7BLt3A82IuJ2bNYyi6exfl52wu/rhIgBK/I/D6FmlOf5fEWHI7iA5q9Xr66Drzu
 wely809Iv3RcdIZ3lUG8cmVCxLd4yUL6+SSUGfbcC40g9lLpoP+q2rrupx0HlvJ5GNUv
 YDn7Ez6trLHAhP3Jmrr9WUNx6ocLm8BaRshWOCcIXHAOCoBTEWxHFZQjpTDdRT3RtStb
 Dj41Vso5ehM4az0pko0JHWxiy3iAImZAs/AdayiJEONTn9ZRidOu88zHSVtRjClNKFs+
 nO44nYUbhlu61qFQ4UjXOo6vX4vihCVKrHgL7BVvUK4JXWuoAuB2gUf5JJSIOz9CoM65
 PFcw==
X-Gm-Message-State: AOAM530W6DfL3o4n1dGTOunFCdhAA9GNIVUdpSAIPV+RYk0CjN5vPqnr
 bb4DcQnCu2S8UTcRtCtz5JohDM0KpT3NkRrIj1I=
X-Google-Smtp-Source: ABdhPJyfvtjYG1xFWvdx3xyMMdPAFclI8zaoUQj5xqoppnPv4mptGwW1XT8bAVegyZzNi/1+UCGvJYjFqK7DpBuKVWE=
X-Received: by 2002:a67:c18a:: with SMTP id h10mr156735vsj.186.1590945686020; 
 Sun, 31 May 2020 10:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200531131237.24781-1-realwakka@gmail.com>
In-Reply-To: <20200531131237.24781-1-realwakka@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Sun, 31 May 2020 18:18:12 +0100
Message-ID: <CACvgo50SzjUe6usELF33qXW3BWZmH5U4ynPTBorZLDrG-Nx2Pw@mail.gmail.com>
Subject: Re: [PATCH] drm/vkms: Optimize compute_crc(), blend()
To: Sidong Yang <realwakka@gmail.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 31 May 2020 at 14:12, Sidong Yang <realwakka@gmail.com> wrote:
>
> Optimize looping pixels in compute_crc() and blend(). Calculate
> src_offset in start of looping horizontally and increase it.
> It's better than calculating in every pixels.
>
When you say "optimize" have you observed any actual benefits of the
patch - be that smaller binary, faster execution time, etc?
If there are - mentioned them in the commit message. Otherwise, it
doesn't optimise anything.

A while back, I've suggested something similar [1] mostly for cosmetic
purposes - doubt there's much benefits beyond that.

HTH
-Emil
[1] https://patchwork.freedesktop.org/patch/365177/#comment_674314
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
