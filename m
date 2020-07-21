Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B7422899B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 22:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A7A6E283;
	Tue, 21 Jul 2020 20:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD066E283
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 20:03:55 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id q74so22819378iod.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 13:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=EYaTONgh/BERR8v/mOEUdaJjeF9YXqvQCKUQqVxHf9w=;
 b=GpXGfoJJK5WSVjHy3fiKp7du2eyRdKZ5CPrTD5oDB1RGGq7zkt+9EpgtV3QVJSa6uk
 lCRVCn/HhSvOW7M5EHHUIF6x9DzJjyB0eyQrgevroL528MujuhJvQP/EU1+qP+TZygmB
 BDvH8KALmAtMZbkd56r3QbokrxJhKRMd4Mzj8qdyNuhqo35rv/ivc8BpffNuZEeReyVT
 inqkrQ30Mla33Y9VZ5h/byt+fh0twtttbEmZZ1DoavQxvVAMMAVvcgrlXxW4OTXXD1gH
 dP3qCTA+TMEVSbDZiUu3scwyPcYPFZlqALuPuHzyAzvOPy4AFdjse7XRrARDqoHOOuPY
 jP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=EYaTONgh/BERR8v/mOEUdaJjeF9YXqvQCKUQqVxHf9w=;
 b=gmJ/dJqRsdOS9MWZdQ6bwy7irdR5Qs4a1GAnM2S+089iyFztiqzQA0CrgvR+bqjOYR
 fxYQIqxIPOOX/lrcl2kZQA5DzUIbtYJ3j5tFs1ZJIBCkg5XgzMf3eFhFhpLUhBZ/4Ksm
 9vrwIW/f9nWKNWdZ7JDLVDj/kzH4XqyPZjsxrbZfv70L726xObhh0iDhFkJddKCriyaG
 BZ8R6CsH5B1umpxDvZ0eV/LT4nbNAHv4nVoi5colMjMNDknHNfDQOjSuhGMrkGgeCmmb
 U3nmscOG+4yte+FMDkrNAIrdjfah/24s+b2NbuJ7A+S5C+3CBQ4YpiAtyU4mEfslQFxd
 xIaw==
X-Gm-Message-State: AOAM533OyDlI0bpzqZWIDrhn4Dp40fyxzpMqhT5CLRU282GDXy/+UqtH
 w+InYGDw/F3qrplu+irFZHKyupFdtbAU8+4NPMJe4pIyUIo=
X-Google-Smtp-Source: ABdhPJxbbB9s806qZ5/wY+TmIy71pA0tYTf66ggxPI3Umw74VSqJnk4Hd38/Bi0X4uy8U9FhclYRYn5E0lW4RE3HATU=
X-Received: by 2002:a02:1d04:: with SMTP id 4mr7141864jaj.16.1595361834201;
 Tue, 21 Jul 2020 13:03:54 -0700 (PDT)
MIME-Version: 1.0
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 21 Jul 2020 13:04:40 -0700
Message-ID: <CAPaKu7S2BjymZN1pPnYz-YAXpHsD8Q_EPxttifhoTBc-Qe52dg@mail.gmail.com>
Subject: pages pinned for BO lifetime and security
To: ML dri-devel <dri-devel@lists.freedesktop.org>
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
Cc: Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi list,

virtio-gpu is moving in the direction where BO pages are pinned for
the lifetime for simplicity.  I am wondering if that is considered a
security issue in general, especially after running into the
description of the new DMABUF_MOVE_NOTIFY config option.

Most drivers do not have a shrinker, or whether a BO is purgeable is
entirely controlled by the userspace (madvice).  They can be
categorized as "a security problem where userspace is able to pin
unrestricted amounts of memory".  But those drivers are normally found
on systems without swap.  I don't think the issue applies.

Of the desktop GPU drivers, i915's shrinker certainly supports purging
to swap.  TTM is a bit hard to follow.  I can't really tell if amdgpu
or nouveau supports that.  virtio-gpu is more commonly found on
systems with swaps so I think it should follow the desktop practices?

Truth is, the emulated virtio-gpu device always supports page moves
with VIRTIO_GPU_CMD_RESOURCE_{ATTACH,DETACH}_BACKING.  It is just that
the driver does not make use of them.  That makes this less of an
issue because the driver can be fixed anytime (finger crossed that the
emulator won't have bugs in these untested paths).  This issue becomes
more urgent because we are considering adding a new HW command[1]
where page moves will be disallowed.  We definitely don't want a HW
command that is inherently insecure, if BO pages pinned for the
lifetime is considered a security issue on desktops.

[1] VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB
https://gitlab.freedesktop.org/virgl/drm-misc-next/-/blob/virtio-gpu-next/include/uapi/linux/virtio_gpu.h#L396
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
