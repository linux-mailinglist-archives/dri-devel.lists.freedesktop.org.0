Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0208595127E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 04:33:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C7010E404;
	Wed, 14 Aug 2024 02:33:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Hm9snwvE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428B610E403
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 02:33:16 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-e0bf9602db6so5976258276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 19:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1723602795; x=1724207595;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KSoxI6rxCpxOXvCi4qD5cRIVnA35QEDc1DgARiQJipY=;
 b=Hm9snwvEaG5T0Y1wc5js5Zk64HLPAassvvSiBPgdkoaWz7lmpxcmUgHPtujoUjPCiS
 BFGSpmo4Q61K6O4m1Egl9lKGJM7U3BXVibgw88XtaL09fesJ8HEgCpu9cPG4HEsdmvIG
 bKl8q/Lhoeh6WmgZ0Q2vCO15qXCrt+kNnNoaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723602795; x=1724207595;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KSoxI6rxCpxOXvCi4qD5cRIVnA35QEDc1DgARiQJipY=;
 b=Gw2uGbaVEMEREaNT6ucKgL0g1KdSkvMN1rT3QWOmUbSq+vtB4rUYLc6bw7WYFcXo7Y
 EX0kVduSwvlrd2BvLnRZnVcoUgZhIk9l5o/v66HsUJJUzOtBFCUPOZ2M4Y1f2wPN4zh4
 oJfE+gHAuL4asyfIGM9ShbKmoX+pgCds14n+6zOcCI0sRsTgebK0jDVUpGgSKcmnee1T
 zApbaCDDzHhajrrJ7f16jrQOc53T8zfMfeb80yAdbIC6qUlqsU0cZRdiEuP8yRkC/P+q
 wFm8zS/hDIPzaUunKvO4J9jUc4ENHQEuFIdKYB7pbZpiTvniNI1lqPuFq+pT2aozNDA6
 Rpcw==
X-Gm-Message-State: AOJu0YyiRgsQ6gNOTOLc7RYPzEFgEHruwKxEW0S9dmtOjxLhV14mrXuU
 edyqDzLZK6iTywgRtrgF7QkC3JMzvlcQUF5pPbjnT1lVfmyIHPK/gWQPMbKkZTvhvrrjgJvSzj/
 zCvP33OrZGWj3iAcwz/gKmXjmTktR7Mwm3x6H
X-Google-Smtp-Source: AGHT+IEv2dixlsur8Zagpa0cpxJYOtAS1RigQCL38B4k4yWBqVnCDbRPxD2mpp7In5Fx9R6P7VwU4BY0RzOSqsPC2WA=
X-Received: by 2002:a05:6902:2201:b0:e0b:c402:b03f with SMTP id
 3f1490d57ef6-e1155ae6007mr1615153276.27.1723602794757; Tue, 13 Aug 2024
 19:33:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240812191639.649841-1-maaz.mombasawala@broadcom.com>
In-Reply-To: <20240812191639.649841-1-maaz.mombasawala@broadcom.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Tue, 13 Aug 2024 22:33:01 -0400
Message-ID: <CABQX2QPKKr6H5_sMYUkx4meTJQ_FOsTebYM0cukW4JR8d3FF4w@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/vmwgfx: Add support for userspace managed
 surfaces.
To: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 ian.forbes@broadcom.com, martin.krastev@broadcom.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 12, 2024 at 3:16=E2=80=AFPM Maaz Mombasawala
<maaz.mombasawala@broadcom.com> wrote:
>
> This series introduces basic support for userspace managed surfaces. The
> lifetime and id's of these surfaces is managed by userspace submitted
> commands instead of relying on the kernel to manage them.
>
> Maaz Mombasawala (3):
>   drm/vmwgfx: Introduce userspace managed surfaces
>   drm/vmwgfx: Support hw_destroy for userspace managed surfaces
>   drm/vmwgfx: Add support for older define commands for userspace
>     surfaces
>
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h     |  24 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 331 ++++++++++++++++++++++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 196 +++++++++++++-
>  3 files changed, 518 insertions(+), 33 deletions(-)
>

In general that looks great. Do you happen to have the userspace patch
somewhere where we could see it? In particular there are three things
I'm wondering about:
1) In the first patch you mark the gb surface as may_evict =3D false;
correctly, because if user space is the thing that attaches mob's then
kernel can not switch them underneath but then I'd like to see how are
the memory pressure situations handled on the user-side,
2) Since now we allow surface destroy commands from userspace could
one trigger some kernel oops when running old surface defines with
mob_create flag set and issuing the gb surface destroy or will the
res->id be reset properly?
3) how is userspace able to select whether it should self-manage the
mob's or let the kernel do it? i.e. what flag signifies that the
userspace is running on a kernel that is capable of handling this?

z
