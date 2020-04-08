Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2E91A1D85
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 10:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3D56E9D0;
	Wed,  8 Apr 2020 08:41:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2AEB6E9B4;
 Wed,  8 Apr 2020 08:41:05 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id k5so3996843oiw.10;
 Wed, 08 Apr 2020 01:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=8CsBlVCB7xAbcBCFehmkfGlVBzvRtziwn6tVRTogb5I=;
 b=A/WtBYrOuyAwIBVU+3HC6pfAopxi7VJpuuHELcdlac1gWWAeDyIuR8g4UrCYhL8fHg
 RQ9wLxdres0Wvmc23CdyPi3gkqWehkaAm2KOZnXsiwKA5V6dplfYYkp9YZLjVMx5ysxY
 JnWcNjPTRqT/X2FUUrhUioWokJBNpd9fkpdIY3nZaXbRKdly9mpDyK4n3EwRLNpxBCVC
 wxU0KK33w5jfCG5DqMDTwHcsUdQAHTG6ylZp+kCCmfEUwLW0KV0b4opqZ4uHjo6viB/o
 jxs1+CztT9BZ925f/h6ea8XyozzwnRtn6zWWkAobc9b7Cl8Lnc6eXZ5xzd/PsoTMYY80
 1FBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8CsBlVCB7xAbcBCFehmkfGlVBzvRtziwn6tVRTogb5I=;
 b=U/NXAOQtNTnFcEaBVn9uoEIBAv0VBEx1aHOSOToG4o0wizkdXzCOvA9VpuXgo04o7I
 PLaJzklHKcHeLpq/PG4k8dBFzYBBQYSt/bDy7YSM36lwTB21EOgV6KyPusYYMzoGkxXB
 QOYyrFUDAf8XiSRBt0LspuxQlBriMg0/+YR8Y4PyYqdJ84/rPxiCsSbKRhV8fK+NFy4a
 NIUQWkTCL4+cuj3Ov6jNHy3quuANJkKy7olKyvBPH/+KHJZAjEAbyQAKdj0jwcXUg16b
 ynn9mhpMriWh5M1mMera7TLNI8Tz/bfEGmI7Nnfc4pUB1EQ+/IkPwEpNuOkTvc0u0yim
 yDwA==
X-Gm-Message-State: AGi0PuYLl7skxF4kM0X2ED58QvZRosIOdlny9NVXdRbxSD2VQyHwBHxp
 mpoqagSqbAQRu/D47X3n2HUxm9OEBq1jpSq4xszTUd0=
X-Google-Smtp-Source: APiQypLhNzb1KdGA9EAubGmS51y0FkSiJi7D3quWO9+BQc9AZxDElo9TfizT43gnfmJ+HgC6jrh3Erp7cvqpqM9UzIo=
X-Received: by 2002:a54:4416:: with SMTP id k22mr1681070oiw.34.1586335264802; 
 Wed, 08 Apr 2020 01:41:04 -0700 (PDT)
MIME-Version: 1.0
From: Johannes Pointner <h4nn35.work@gmail.com>
Date: Wed, 8 Apr 2020 10:40:53 +0200
Message-ID: <CAHvQdo2pDtKfKqxt1j5hQt1AKRhtTayQYf-9x3Txbq7=VYfGxA@mail.gmail.com>
Subject: etnaviv: command buffer outside valid memory window
To: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

I'm trying to get etnaviv on an i.MX6Q (2 GB DDR RAM) device running
with kernel 5.6.2 but it is failing to setup the GPU with the
following error:

[    0.000000] Memory policy: Data cache writealloc
[    0.000000] cma: Reserved 256 MiB at 0x7f400000
[    0.000000] On node 0 totalpages: 524288
[    0.000000]   Normal zone: 4608 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 524288 pages, LIFO batch:63
...
[    0.000000] Memory: 1803240K/2097152K available (6144K kernel code,
247K rwdata, 2284K rodata, 1024K init, 375K bss, 31768K reserved,
262144K cma-reserved, 0K highmem)
...
[    0.529924] etnaviv etnaviv: bound 130000.gpu (ops gpu_ops)
[    0.530153] etnaviv etnaviv: bound 134000.gpu (ops gpu_ops)
[    0.530408] etnaviv etnaviv: bound 2204000.gpu (ops gpu_ops)
[    0.530427] etnaviv-gpu 130000.gpu: model: GC2000, revision: 5108
[    0.530748] etnaviv-gpu 134000.gpu: model: GC320, revision: 5007
[    0.530833] etnaviv-gpu 2204000.gpu: model: GC355, revision: 1215
[    0.530853] etnaviv-gpu 2204000.gpu: Ignoring GPU with VG and FE2.0
...
[    5.374046] etnaviv etnaviv: command buffer outside valid memory window
[    5.389451] etnaviv etnaviv: command buffer outside valid memory window
[    5.406062] etnaviv etnaviv: command buffer outside valid memory window
[    5.421381] etnaviv etnaviv: command buffer outside valid memory window

I have a similar setup with a i.MX6DL (1GB DDR RAM) and this works w/o an error.

I found this patch  https://lkml.org/lkml/2019/6/19/809 which
describes a similar issue.

Is there something I'm missing or I have misconfigured?

Any hint would be highly appreciated.

Thx,
Hannes
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
