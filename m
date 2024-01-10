Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C879D82915D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 01:28:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF3B10E529;
	Wed, 10 Jan 2024 00:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5288F10E529
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 00:28:16 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3bd489d75b7so21458b6e.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 16:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1704846495; x=1705451295;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aK3jhkol3+inPMbNlaoVpd4B/+jgDSrVQM34PNwnaCo=;
 b=O/+AQWTw3vt824LYwC1HH+sDvxC486322+kaXCg+TemqY71IKoVs8i/h4xKb0RjdxY
 TkHid0bmsvg2qY0iOiniNnl1ir4hhV6CnORh0Nw9ly19JeOzGWogj1yeEL+X3UewzYCk
 j+trNOrY0ERfKPIPsjpnCwdxS7YgvPNvjNUSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704846495; x=1705451295;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aK3jhkol3+inPMbNlaoVpd4B/+jgDSrVQM34PNwnaCo=;
 b=jat+cKNteuKTM9vgdqgnmL7y6aUv8BmWy2awg4DHTzYqdsaacIUeOntxLrIbURW2/M
 Ru77e6yl8VXXOjF7LDFfItKylYmjKD9HalISq4HumEauxYXA3ViKnePCTlLs2Buto+c7
 V4nNi6DbVCdRUmS1sAay5l9lxls8NieYLxmtydu6PksPqULbcM87Ff0PThV7b39LJgE1
 ngzCLj+49hE0WicSmXwT6tK5oEOLPcYlgCj/DIIN9jpJr+f/VsS2twLIyYb85YEI65Ti
 qWnt2M/Ofjll5D7SOv8zUX/g3Ga4Rz5xGLK6416VsvujVSbFQFV19t5R9y8rRcRN9y7h
 +IEQ==
X-Gm-Message-State: AOJu0YzENp02WVJXwyvREXIY2QFdmK5i2CxplQB1xxZr4ihWX48dK8K2
 ggaJVu1F7wI36x/PSWJJzVl3ZaMJ+xo/IX7hxpcfik3taKBg
X-Google-Smtp-Source: AGHT+IFqKQbKasBNHAKy7uLdZS5HRCnuSo6IZwV4PQwhyXCWuYFaWpxh8oma4XmuhI6ZDiwCAq8mwS7pLp9ZuBzvzjc=
X-Received: by 2002:a05:6808:331a:b0:3b8:b063:6666 with SMTP id
 ca26-20020a056808331a00b003b8b0636666mr250099oib.93.1704846495467; Tue, 09
 Jan 2024 16:28:15 -0800 (PST)
MIME-Version: 1.0
References: <CAFZQkGxgdeXb82kEsVuC72kGos385YX=GD4QNKfAsM9TyTqoAw@mail.gmail.com>
In-Reply-To: <CAFZQkGxgdeXb82kEsVuC72kGos385YX=GD4QNKfAsM9TyTqoAw@mail.gmail.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Tue, 9 Jan 2024 19:28:04 -0500
Message-ID: <CABQX2QNhdLp6GC6ZE=vRaGgpLV3pqQYZ84_iq_+zoGB_vU0ejA@mail.gmail.com>
Subject: Re: BUG / design challenge: vmwgfx + PRIME handle free == clobbering
 errno
To: Xaver Hugl <xaver.hugl@kde.org>
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
Cc: linux-graphics-maintainer@vmware.com, stefan.hoffmeister@econos.de,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 9, 2024 at 11:06=E2=80=AFAM Xaver Hugl <xaver.hugl@kde.org> wro=
te:
>
> Hi,
>
> KWin does use DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT.

Can you point me to the code that implements it? Just wanted to take a
quick look, because I didn't see the cursor on KDE 6 after fixing the
kernel oops.

> Tying the check to
> DRM_CLIENT_CAP_ATOMIC instead would IMO make more sense though (even if i=
t's
> still weird) and would work with older versions of KWin and other composi=
tors.

Unfortunately xf86-video-modesetting advertises CLIENT_CAP_ATOMIC and
uses GL where our GL driver assumes the prime object is not GEM. Not
impossible, as mentioned before, we can always add code to the kernel
that handles both but I don't think there's any particularly clean
solutions here. We'll probably play with a few solutions and see which
one is the cleanest.

z
