Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5ECC443229
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 16:59:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382227305B;
	Tue,  2 Nov 2021 15:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBB87305B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 15:59:08 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id g14so15407628edz.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Nov 2021 08:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=82gcyYi21JR2yl5HnQJPNTUGk95bSOyQQAZSvB97oV4=;
 b=mqPeGtTTFM8RhF4E4WUZJM/qs5mKYfvHn6ixlFp9fulZ9XJdec+gCYvWZzF44Q0P9Z
 yqv/cOuua58Y3vAJHKGnVfq6wUgatrSjw0j5ZaT/YJ0Jo04LQfnEYB08CgZYU9dTBNMl
 rXX6ESNW29DHkRJ/uIX7y55rt7qTayDo98CiG5cnv+ZYZhtku8aLNOLoX+00NXKreA8O
 R9iU161Z0maGb3CsNZ0aLkcRqYoKd3KNKW0gG5GE1BL8YYtVq+kRxsGm8871B9m/QHMi
 HvZJd2zunffq5oh/zZ5Zz2IS9LzaTBuJUbp2uu4m8uCIJ0bB2XmLwkUwPGk/ZQ+SR1Cj
 XsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=82gcyYi21JR2yl5HnQJPNTUGk95bSOyQQAZSvB97oV4=;
 b=kmqGKYBTIyXh+VtfrQ8bExD06DP8rRDTKQsBCsrMthJacKmonyjVo4al2iLtu0pgh3
 2jXjFBN0Mv7u8zgIx90E9l6j3DncBnABkDVjIe/vorY2Lb1rxcE5Bb1fk1amWQJnpnGE
 1nxopJimESX6MLqCTQBM2/gycFcEnEdcppMMxNNrIUjuOZM8RDMMrg+Qsb+UcmN1iCaE
 D/Ll5e8gZTUOSx40reEmsw8l5D0ZyEC22MmJ0HBMelvw6x6c1tL8njgZd53ZqBgbQ4jv
 YoapjtiRB3vL0/uH9/7nj8PFAK2t3LGrkFmOc9dc3eOn0+MVop0pt0J9aF2xsyhbN93u
 SqFQ==
X-Gm-Message-State: AOAM531i5OCUOAm25T1+m8Q6Ha5uShE/Cy3zx2x0SCvRBO4WlsmYPUVO
 XwSGWijNJ1ZCpENbqcpuZ4hO5er2d00eW5ng12M=
X-Google-Smtp-Source: ABdhPJwcgTlfHqBGlrJhLQL+x+bR7sLLA1z9C+zICT29lLaDMWLwZjcVUPOSbPWd4+cMRBvtppuC9V5ITdGjcrdeb+k=
X-Received: by 2002:a17:906:180a:: with SMTP id
 v10mr45948349eje.112.1635868746685; 
 Tue, 02 Nov 2021 08:59:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211102113139.154140-1-maksym.wezdecki@collabora.com>
 <20211102130308.2s64ghmic5nhj6vu@sirius.home.kraxel.org>
In-Reply-To: <20211102130308.2s64ghmic5nhj6vu@sirius.home.kraxel.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 2 Nov 2021 08:58:55 -0700
Message-ID: <CAPaKu7T9-KmmDwNRFzQWM3jH4h-xUwjtfWays20z24dVvROoHw@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: delay pinning the pages till first use
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Airlie <airlied@linux.ie>, mwezdeck <maksym.wezdecki@collabora.co.uk>,
 Maksym Wezdecki <maksym.wezdecki@collabora.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, "open list:VIRTIO CORE,
 NET AND BLOCK DRIVERS" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 2, 2021 at 6:07 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Tue, Nov 02, 2021 at 12:31:39PM +0100, Maksym Wezdecki wrote:
> > From: mwezdeck <maksym.wezdecki@collabora.co.uk>
> >
> > The idea behind the commit:
> >   1. not pin the pages during resource_create ioctl
> >   2. pin the pages on the first use during:
> >       - transfer_*_host ioctl
> >         - map ioctl
>
> i.e. basically lazy pinning.  Approach looks sane to me.
>
> >   3. introduce new ioctl for pinning pages on demand
>
> What is the use case for this ioctl?
> In any case this should be a separate patch.

Lazy pinning can be a nice optimization that userspace does not
necessarily need to know about.  This patch however skips pinning for
execbuffer ioctl and introduces a new pin ioctl instead.  That is a
red flag.
