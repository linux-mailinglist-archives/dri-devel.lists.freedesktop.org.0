Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7955166620
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 19:22:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98216EE3B;
	Thu, 20 Feb 2020 18:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 302AA6EE3B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 18:22:43 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id l4so24520222ilj.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 10:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JzSVCeoxJffuWBxEw1ANeVyCO37g203+CavuCxKhrrY=;
 b=Sl1RKHKKbsAKWIlhZOjI+Lnp/KRDlz3w8AHxWRpct5NmHrKyA8xj2Jw1Xu5M/0X9MG
 8xDu1beUsS/qUylDp7wTrDKWSOKGGjZJJwTI9tPnnfdSLueep5lh6YxTtDElcb/kYsP9
 NiI0dSqIkmHEs7UuzMgjaD78/SejcrtI0Lk4zkY6tG8qG0xUN3oQ5XYMaCwLipyWN+Iw
 cfxKXjo4/RBbo6EofG0nzl2Kf2gBKhpEwoK2ip2xYv/rVGxjadRweUjzeXA0bJz9MVOw
 mHtBL0dW315zPPwKQHyQDHxY5bqPSAmUBRP1aPSy3CFDIBA1yChJ6os6+B9RrzUhLQFi
 GUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JzSVCeoxJffuWBxEw1ANeVyCO37g203+CavuCxKhrrY=;
 b=RA7AJiBldnbbMlgw3rME4xK4vftJRjZqLButU18AeibTSgODxW3PDdjhmpTKTu4eU8
 b/auhyRyoZUnUoYIi0LSmekvtEfvpGgclJAjL4w9qnVk7lznHQFEflLNOe7o89ETbdGQ
 rTrA0nZCQJAqvpBX0x8gXIVStlsHH+amt60u6ugIAfinMWHJd5uhZ8QCFDhVQUbTkEyA
 ipwtl7FM9+xb1Illifj88L3r2C5p5fFUopHDt2gxq0az6pNBk1sozSKUFBZBWWJAa5a/
 31h6IxSnUX+nWSIYZRhc4mt+KKTyqQL6mb9EsKL6e5kcZd47nFUn+/BUncoEj76XpzxD
 Fdsw==
X-Gm-Message-State: APjAAAWJoLLqwxPYrDzRVqStyLsWaVZb60URZ2ios6XMUn4oA8ZFDfUw
 N4i3HNqb2uJdnrC36xlfqS46n90OC+0e/Jy/zp0=
X-Google-Smtp-Source: APXvYqxFZvM0ntSHWZJhzek0q4CAScuwEtveK+KjgBZ+tvIq0rD+38iRcx9dU7tOys6rKlfroJiuMOqzNRv5p5SsIiI=
X-Received: by 2002:a92:9ac5:: with SMTP id c66mr32291270ill.232.1582222962365; 
 Thu, 20 Feb 2020 10:22:42 -0800 (PST)
MIME-Version: 1.0
References: <20200219204002.220744-1-jbates@chromium.org>
 <CACvgo52oabauyoz81Q1rpp46kf4F_mYZeBb5oSOvW3tsfQT7nQ@mail.gmail.com>
In-Reply-To: <CACvgo52oabauyoz81Q1rpp46kf4F_mYZeBb5oSOvW3tsfQT7nQ@mail.gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 20 Feb 2020 10:22:30 -0800
Message-ID: <CAPaKu7QzyxdHpB2AOJsFkjKmj0yntv_0_CdYX0Y6fvxAFeAheg@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: fix virtio-gpu resource id creation race
To: Emil Velikov <emil.l.velikov@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, John Bates <jbates@chromium.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 20, 2020 at 5:30 AM Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> Hi John,
>
> On Thu, 20 Feb 2020 at 08:45, John Bates <jbates@chromium.org> wrote:
> >
> > The previous code was not thread safe and caused
> > undefined behavior from spurious duplicate resource IDs.
> > In this patch, an atomic_t is used instead. We no longer
> > see any duplicate IDs in tests with this change.
> >
> > Signed-off-by: John Bates <jbates@chromium.org>
> Adding a fixes tag like below makes it easier to track. Especially for
> Greg and team who are working on stable kernels.
>
> Fixes: 3e93bc2a58aa ("drm/virtio: make resource id workaround runtime
> switchable.")
FWIW, the fixes tag should refer to this commit instead

commit 16065fcdd19ddb9e093192914ac863884f308766
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Fri Feb 8 15:04:09 2019 +0100

    drm/virtio: do NOT reuse resource ids

>
> HTH
> Emil
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
