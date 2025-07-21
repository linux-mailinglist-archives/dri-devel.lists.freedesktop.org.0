Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E55B0C400
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 14:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25FD810E068;
	Mon, 21 Jul 2025 12:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GPST+UwV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE4110E068;
 Mon, 21 Jul 2025 12:23:00 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e8bd3fbd9f7so3559904276.3; 
 Mon, 21 Jul 2025 05:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753100580; x=1753705380; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=eCEGSN3M10MrjOFjG0lLCegL5PcRSqy0h0h9sELILDA=;
 b=GPST+UwV/jMsguTAMMS1iQiQGagNgVkbLZspla1RHvlDBx55P9ww1ZO0+qzDec6EKg
 wGn2BWFbVKbnPANzdoBebYQFs4B4tspDsCh8BEfLu4cKYLPNs+IRZBEsQowZ+53Tce/o
 y/AdMTbyT/t/W6QmzqVuwtT8K3SWErVDz7YVbrlEUPBR/R3K9NMGXgjBjBlKF9WpX20S
 dVdsk7qwogmQu4e9hyG/N64qT6WKFDBLYN+LMydHUBQEH7RhNQGie48ZqEoZUnpj6hZ9
 jUSVS8Jvy1UztxcL4N69hUMUwhkYwIQh3axbQja863ZL/dgzaikBweahNh72atYloNVO
 1D8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753100580; x=1753705380;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eCEGSN3M10MrjOFjG0lLCegL5PcRSqy0h0h9sELILDA=;
 b=lFynBN3E6hu765CTScfVv7bynZm7b60pgr//BZGJEh8rZdh59ipYRCmVWKNmFv7u5m
 jbEZLbTGpXpJbVnNMsR+3R5B4KaTIwvdGd1nx/v8xIJUbGf0JDBw6JfWyW6EOHkWGxJK
 DfKvAV4AIljQh/5SQw2Q0EWGzveJtoOVEIIuZqomMWOVbUPiwzfO53YS+heZny2U9lRo
 4Q7NNXyOyuoeamgFctUhIQpR7Sv26eiCNdH+1xZb3V9Mhz5xtNVEfNkcOv+rRxQbESCh
 rEPsTsvSSebhuy+8qPNb3wsfCOVQOZPygX+Mdsb8JwP1Q3mxcJlont5w/9KPbjAaRgON
 PGaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKFWrTAJXnhDWr7mQbQeEmfZzCeukXiugKifpGUvMwFJeb2I6fvgu6jHJ/1DfmuHZHH+YTs39+dg==@lists.freedesktop.org,
 AJvYcCXcf11IdAhAXnDRfhsHoFI536zqhZsgghR4mWONgqP9Qb1QARPMo+B0hRr2gbwiKkLfewyz0hyUHOk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEV+a7x9/IMHONiMQLp1oQb5724rAZt/cRzRKWk2I8IfEVE731
 5lpLttuwjh9fYJwlWREhNwtj/N9SQd7eu00rIK2SPbGZVtKWi8ynbbwmKURhanjUyQJeTyEEurK
 C6F7vD1/I5ie6RF1+TACABxxmasm53NU=
X-Gm-Gg: ASbGncsu9cd5oHAdhVPSubX4bEbuPyjjJOnmDpm0rzX5uD0UjmQqZoOpZJrgMzMdMrC
 SgsyUhYFpi/k4DuDWeWzUxwk8L4zbvk/sAAShG55Tf3Sa83HSUD+udah+5YV0ysasrOiGdSC63Y
 BCVktvoKeEPWuowbcvCQUOjnMRAkzewt6+3s3xJLiDwA0m9dsRFBrKQDtqfrwEnyqlK162w0kVR
 BL3jg==
X-Google-Smtp-Source: AGHT+IEWB7JrFoMbHrRALXWP1vhD6NN5YpFLPFz8a0z6KxSPI5Oh15vQ4Zsncp+bvRHP3+gphdxUKvzFK9fNg5W9TvY=
X-Received: by 2002:a05:690c:868a:20b0:718:38bd:bb42 with SMTP id
 00721157ae682-71838bdd021mr184209147b3.41.1753100579541; Mon, 21 Jul 2025
 05:22:59 -0700 (PDT)
MIME-Version: 1.0
From: Satadru Pramanik <satadru@gmail.com>
Date: Mon, 21 Jul 2025 08:22:48 -0400
X-Gm-Features: Ac12FXy7wN3KNUOiIVLumsXVvu9VY7MUOOaJsu-IjLq8qTEhzCqLvUhvpKWfvAw
Message-ID: <CAFrh3J85tsZRpOHQtKgNHUVnn=EG=QKBnZTRtWS8eWSc1K1xkA@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: check ioctl command codes better
To: Arnd Bergmann <arnd@kernel.org>
Cc: airlied@gmail.com, airlied@redhat.com, arnd@arndb.de, bskeggs@nvidia.com, 
 bskeggs@redhat.com,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, 
 open list <linux-kernel@vger.kernel.org>, Lyude Paul <lyude@redhat.com>, 
 nouveau@lists.freedesktop.org, simona@ffwll.ch, ttabi@nvidia.com, 
 Thomas Zimmermann <tzimmermann@suse.de>, Satadru Pramanik <satadru@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello all,

I suspect this commit in 6.16-rc7 has broken acceleration with Mesa's
nouveau drivers on my machine.

glxinfo -B reports that I'm using llvmpipe.

Reverting this in 6.16-rc7 restores nouveau acceleration, and glxinfo
then reports: "OpenGL renderer string: NVE7"

inxi -G
Graphics:
  Device-1: NVIDIA GK107M [GeForce GT 750M Mac Edition] driver: nouveau
    v: kernel
  Display: wayland server: X.Org v: 24.1.8 with: Xwayland v: 24.1.8
    compositor: gnome-shell v: 48.0 driver: X: loaded: modesetting
    unloaded: fbdev,vesa dri: nouveau gpu: nouveau resolution: 2880x1800~60Hz
  API: EGL v: 1.5 drivers: nouveau,swrast
    platforms: gbm,wayland,x11,surfaceless,device
  API: OpenGL v: 4.5 compat-v: 4.3 vendor: mesa
    v: 25.2.0~rc1+git2507191056.03f67b52319~p~mesarc0 renderer: NVE7
  API: Vulkan v: 1.4.304 drivers: N/A surfaces: xcb,xlib,wayland
  Info: Tools: api: eglinfo, glxinfo, vulkaninfo x11: xdriinfo, xdpyinfo,
    xprop, xrandr

Best,
Satadru Pramanik
