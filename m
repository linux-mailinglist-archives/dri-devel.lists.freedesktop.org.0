Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13543274B13
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 23:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40AE16E32A;
	Tue, 22 Sep 2020 21:22:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
 [209.85.217.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227FE6E32A;
 Tue, 22 Sep 2020 21:22:35 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id p24so6223111vsf.8;
 Tue, 22 Sep 2020 14:22:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QNfsE0e5j0sjDrSbMU06dsnlI5tq+95f3KQ29B+CI20=;
 b=TbRqvGiMMpWo7o06LeSg3YlZWPZOskJgmQCmxmbZwcgkjCvAP4kl+jGFQMpaneR/80
 15g7Y95kd/17HEMMyJXHqDup8jbeczTuNm/pk68yY10sTvtb5iqXD0WVhwWY/6uqjfHe
 VjRJmvinhwYhfEJEpFuabxhbyP9A+b7PXZA4Ho0Xdh1wMaxJA8/20EgDXol2mtj0GEsn
 NJGXSv36ZYAAX5/SWgRuc2zlAl3/Bm/X4VD2/0gHYu/lIADFOcUXL9ic+In8JrRZyAU0
 GFVTW1JTLOolXeY7YpHQy+Qya72ZEU3UJAE5SreDcUcSu5AYxuanx1/ZM6zq0fMvCTMv
 BE9g==
X-Gm-Message-State: AOAM531YXALs+2j4eRxOieXKzdwaCwQBF7JrIHBrpKMouRxY7VJ+JS4B
 g9WIW9Wa+DuzcMFGFkLU3wmHrAsTuiu7LxQOeb4=
X-Google-Smtp-Source: ABdhPJzNRd7B2R7QiAPHviF5QusJT5P0Eo+vC2zhxf2IS/6iuwUDz7oG9NnbchSGGWa7yTlgf9ajqRRNHPP4xJEzJMU=
X-Received: by 2002:a67:6954:: with SMTP id e81mr5330189vsc.0.1600809754259;
 Tue, 22 Sep 2020 14:22:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200922210510.156220-1-lyude@redhat.com>
 <CAKb7UvhAb0wFd9Qi1FGJ=TAYZJ9DYXL6XXMfnG49xEO=a9TuYg@mail.gmail.com>
 <7b10668ee337e531b14705ebecb1f6c1004728d6.camel@redhat.com>
In-Reply-To: <7b10668ee337e531b14705ebecb1f6c1004728d6.camel@redhat.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 22 Sep 2020 17:22:23 -0400
Message-ID: <CAKb7Uvj++15aEXiLGgSZb37wwzDSRCetVT+trP6JNwhk8n-whA@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/kms/nv50-: Fix clock checking algorithm in
 nv50_dp_mode_valid()
To: Lyude Paul <lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 22, 2020 at 5:14 PM Lyude Paul <lyude@redhat.com> wrote:
>
> On Tue, 2020-09-22 at 17:10 -0400, Ilia Mirkin wrote:
> > Can we use 6bpc on arbitrary DP monitors, or is there a capability for
> > it? Maybe only use 6bpc if display_info.bpc == 6 and otherwise use 8?
>
> I don't think that display_info.bpc actually implies a minimum bpc, only a
> maximum bpc iirc (Ville would know the answer to this one). The other thing to
> note here is that we want to assume the lowest possible bpc here since we're
> only concerned if the mode passed to ->mode_valid can be set under -any-
> conditions (including those that require lowering the bpc beyond it's maximum
> value), so we definitely do want to always use 6bpc here even once we get
> support for optimizing the bpc based on the available display bandwidth.

Yeah, display_info is the max bpc. But would an average monitor
support 6bpc? And if it does, does the current link training code even
try that when display_info.bpc != 6?

  -ilia
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
