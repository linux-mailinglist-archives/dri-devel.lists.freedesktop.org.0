Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8565F81D0F4
	for <lists+dri-devel@lfdr.de>; Sat, 23 Dec 2023 02:27:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD11110E039;
	Sat, 23 Dec 2023 01:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E81610E023
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Dec 2023 01:27:26 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-5e7c1012a42so23213517b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 17:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1703294845; x=1703899645;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ecYYW7QlCn3Kuxh1Ga581Akc7RxIW63MkZaTG7WZ72s=;
 b=FO7D856oIid1OdQctp06OvCurQogEpTiofWhFiDGIeBb0VCy/IHi61KiVaQpR+suW3
 oEjhwyrBbpHUWc+9wEyEhBxorPKYBMRSxtku+AnNPT5T1/RplZaBu9bTTZ7uRpXkw6wF
 uJeVt4KdEO48MNfWbNBngSsS1EaQ6Ou4aQsBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703294845; x=1703899645;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ecYYW7QlCn3Kuxh1Ga581Akc7RxIW63MkZaTG7WZ72s=;
 b=H26qxR1rJghTDetaoNSRbKyVu1iMajPxtJfLRAnZqKm7SPMMggZkWBUoIgAgW8VEvt
 l99YW86XDIAIejZG4o6GXjF7e4rkS3ZLF8gE5jc+ERKDDtYsWc5O4YRCc3S7cg/8lAxe
 CLIqC7GVesK5xoXfDRBefU9sdILxEPDVg50LDN+LfPUuxlj1TsiQUX4037gAhY42UjM8
 wsxucsJ3YUfAE6UFhySmv1Kal7BhX+iUomgfgs3dChX5o6twiiGtL2aYktc/kmA2JasD
 E5o2G2N1uxZoDoOBWdigv1jS9IZyP59P2PBGaxAACKghCwJDtJBCOq5PRghstr0JS1uo
 hFPg==
X-Gm-Message-State: AOJu0YzMdZ0UtphhACoqnmNifqWzDy1vEarEEedB5xVt8N+2blnK6xUR
 Jn+g41AcduoUGyk9OJzMEsMZmiqpkcz/SyRTKrOMzSy8Tq+I
X-Google-Smtp-Source: AGHT+IFAghEwPbMGT+uPII2GeqXJ7q3KV0N4hllEUszoLDonPYrSpd3IvtvFWgiaJsQjxFRgELZEvi4VAVdeOhS9dZk=
X-Received: by 2002:a25:ec03:0:b0:dbd:15b7:c056 with SMTP id
 j3-20020a25ec03000000b00dbd15b7c056mr1798847ybh.27.1703294845180; Fri, 22 Dec
 2023 17:27:25 -0800 (PST)
MIME-Version: 1.0
References: <20231219171554.Horde.U9YedWH6peFYoNUi4CA_Wzp@webmail.your-server.de>
In-Reply-To: <20231219171554.Horde.U9YedWH6peFYoNUi4CA_Wzp@webmail.your-server.de>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Fri, 22 Dec 2023 20:27:14 -0500
Message-ID: <CABQX2QPkEWDhE6xAaucaFh7QWvA06xJ8bfqrmPQTKM61X-YMmQ@mail.gmail.com>
Subject: Re: BUG / design challenge: vmwgfx + PRIME handle free == clobbering
 errno
To: Stefan Hoffmeister <stefan.hoffmeister@econos.de>
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
Cc: VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 19, 2023 at 11:15=E2=80=AFAM Stefan Hoffmeister
<stefan.hoffmeister@econos.de> wrote:
>
>
> Hi,
>
> vmwgfx implements drmPrimeFDToHandle in terms of the TTM resource manager=
.
>
> At the same time, the driver advertises
>
>         .driver_features =3D
>         DRIVER_MODESET | DRIVER_RENDER | DRIVER_ATOMIC | DRIVER_GEM,
>
> Given that, a userland application will call drmCloseBufferHandle to
> correctly release any previously acquired handle.
>
> In kernel language, this translates to ioctl
> DRM_IOCTL_PRIME_FD_TO_HANDLE and DRM_IOCTL_GEM_CLOSE.
>
> Problems:
>
> a) because the application uses drmCloseBufferHandle, and that goes
> through GEM (the driver claims "I am GEM"!), vmwgfx will always return
> EINVAL, because the driver is _not_ GEM, but TTM on that aspect.
>
> This will always clobber errno for userspace, which is not at all
> helpful for meaningful error handling.
>
> Additionally, the driver offers no formal API contract which would
> allow applications to detect that the driver does not like be talked
> to like a GEM driver, although it is _claims_ to be GEM driver.
>
> b) there is no (documented) means to release the handle acquired from
> a call to drmPrimeFDToHandle; this implies that in principle any call
> to drmPrimeFDToHandle will leak the handle.
>
> Questions:
>
> a) how can errno clobbering by vmwgfx with EINVAL be avoided?
>
> b) what is the correct way to release the TTM resources allocated
> through drmPrimeFDToHandle?
>
>
> For context: the KDE Plasma Desktop kwin DRM integration layer makes
> extensive use of drmPrimeFDToHandle. With the way the VMware vmwgfx
> driver behaves, I see these options:
>
> a) correctly check the return code of drmCloseBufferHandle and blindly
> log all the EINVAL errors triggered by the VMware driver, putting
> blame on the application for mis-managing handles
> b) drop any return code from drmCloseBufferHandle onto the floor,
> completely disregarding application integrity checking
> c) hard-code a check for "vmwgfx" as the driver in use and spam "this
> driver owned by VMware / Broadcom is broken, ignore the following
> EINVAL and secondary effects" for integrity checks
>
> I do not like any of these options, to be honest.
>
> Many thanks for any input

Thanks for the report! This is mainly an artifact of vmwgfx predating
GEM and really basically all of drm, so the ioctl interface on top of
which vmwgfx operates is a bit bonkers. I know there are a number of
examples where drm graphics drivers were breaking the ioctl interface,
but we've tried avoiding that in vmwgfx and so supporting our old
userspace and new userspace, which are incompatible, is incredibly
complex and fragile. Our approach was to, in general, deal with those
as they come. Our userspace, also in general, deals with surfaces,
which aren't GEM's, as you've noticed, but instead are backed by a GEM
object, so expects the handle to prime to not be GEM's. As you can
imagine it's a bit hard to make sure ioctl's for which userspace has
the opposite expectations are working fine (we've done it for some
already though, the "dumb" ones being an example).

If you'd have an IGT test that tests for this without requiring CRC's
then we'd get it fixed quickly. Otherwise making it work is difficult,
not because this particular bug is difficult to fix, but because it's
difficult to fix it while keeping the xorg drivers from 2012 working.
We'll likely just make sure the prime ioctl's return proper GEM
objects for clients that advertise certain cap's. Is KWin advertising
DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT?  That'd be a trivial, albeit
unexpected, way of making sure the old userspace gets the semantics it
expects, while making sure the new clients get proper behavior.

z
