Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C3D8A5D9A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 00:09:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6FAC10F6D0;
	Mon, 15 Apr 2024 22:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="URCJECIj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6AB210F6D0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 22:08:57 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-615019cd427so27583867b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 15:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1713218936; x=1713823736;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tg+VL6P40uuH8Lw2rK3hjC3ba0ahFYdZ/88+i6rd/wg=;
 b=URCJECIjRyM5epwptd3iH4Wji7tZ5Xmd/khi5m1DTY9fJ+x5mvAWF/jeHah7CV5uuo
 nnb+ubtvDB3MOU0BbFWm3y4IVFAB/oiw8Fn1ChyIHxytDKNIWhmLF8ywFWwRnzUQDThj
 h85J2ZFTfRJezFhwTuYUaYCpFQu9JdJ38eykA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713218936; x=1713823736;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tg+VL6P40uuH8Lw2rK3hjC3ba0ahFYdZ/88+i6rd/wg=;
 b=h7EDCbukT0Ygn2+LWNLEoh6X4OcKJXTbCvpK14Ywvxmtpo4dLYfQTyRM//SWV+2x1X
 LH/aHTuPT1VGz1z/46ooX82bRraba4hDJzY2URInc6Mn6oRFsu4q2a/zkECPi2gojN5j
 fN+OjPohXL4cGOW+QZSxEdjTK5MCgKUVrxDubJnKzA6zzQsju+kjDKiMh/h3VOfFJGkG
 +zfhKFrIF3Xy+g+7LEXdd0yhVKD4tuTX0ZgkpBimwRRXdGuiJzmPFLPCeQ8E8PXFjO4X
 aOQFljByR5lM/sEo2gmuMd/dOneoBBq3ksAWItP5scuRY2+3QzFrxqcWXZNnbSuVdwwX
 lmIg==
X-Gm-Message-State: AOJu0Yw6ffV3yl+c/GjXAwB6ISe1UH1kL4vmzvIrVOXOqmhZQo+VGjhY
 wc6wvTRmSXZcOx9UaGtrXktZhSGcYmdSmYvjg359bfTnFWXkMX2ozxxLI9VLU2CG1mAxycjxEmH
 v3WbPl+8TMdJ/PJQ5AzHMsCKLC2BAvcFDT9Tz
X-Google-Smtp-Source: AGHT+IEACbE4BaN7cPCY4vo6lMGDEmSC8bXNaCTrxl7z39IWwqUds8bVLq7IZ9QgVmnkmsDpHMIiBFFKog5JBl3qVJs=
X-Received: by 2002:a81:b047:0:b0:615:41a4:1a8a with SMTP id
 x7-20020a81b047000000b0061541a41a8amr10675743ywk.25.1713218936533; Mon, 15
 Apr 2024 15:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240411212651.540-1-ian.forbes@broadcom.com>
 <CABQX2QMp0OH1nivuo4PBY9Qa3b-1-JDDfsDWuAwD=4DXGaWC=A@mail.gmail.com>
In-Reply-To: <CABQX2QMp0OH1nivuo4PBY9Qa3b-1-JDDfsDWuAwD=4DXGaWC=A@mail.gmail.com>
From: Ian Forbes <ian.forbes@broadcom.com>
Date: Mon, 15 Apr 2024 17:08:46 -0500
Message-ID: <CAO6MGtgexF0Q61HJVnj4DSNf+r3Pr7=yt9vT8h1kKwvc4O8C0A@mail.gmail.com>
Subject: Re: [PATCH 0/4] Fix memory limits for STDU
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com
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

On Thu, Apr 11, 2024 at 10:22=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.co=
m> wrote:
>
> - with stdu what happens when the mode selected is close to our
> limits, the guest is using a hardware cursor and we allocate cursor
> mobs?

With overcommit (cfdc3458db8a1620b1e307e3cb07480a161146ab) it won't be
an issue. Before overcommit there may be issues. That's what the
original code in patch 3 was trying to solve by increasing the guest
memory limit but that variable is also the hard host limit which would
invalidate fixes made by patch 1. Regardless it will be broken in one
way or another. We'd have to backport overcommit or multiply by that
constant factor from patch 3 when calling vmw_gmrid_man_init in
vmwgfx_gmird_manager.c in a separate patch. The only distros that may
be problematic would be debian 11 and ubuntu 22.04 without the HWE
kernel. Graphical installs of Ubuntu 22.04 LTS will have HWE by
default so only Ubuntu server users who installed a GUI and configured
the graphics memory to be tiny will be affected but chances are it was
already broken.
