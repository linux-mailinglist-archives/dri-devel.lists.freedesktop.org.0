Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62745C85E69
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 17:14:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C498F10E2A9;
	Tue, 25 Nov 2025 16:14:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VkKcdiR8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB27810E429
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 16:14:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5762E443E4
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 16:14:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37000C116C6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 16:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764087249;
 bh=qAc86pFUbSJN7iHKIQNJp1vjBlkAY2LqtEa+tE6XHzE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VkKcdiR8nWjV1KHTXCBWJnGxUiazzOab/kwvE5IYbG6m0xyi4HKumQ3+RGWDcz6Uj
 a7chTbe8/7AVuzZq38awT1QG7rVKkU88EAQse+pVDSED70d0yVFZdoq1Qt2rcOmObl
 dRo+LtZBn75qA7M+PVaFTBx5+MckcNz74dqa3Jyw522WSVvAfGIY27WzAoSqD8HLyV
 wryJ+cUmGqglPXVIUGF4Iq7Fx0WmRgYGgYu2DAMjH3a5WVGXXh6tTbE0Wt+dc8RXeD
 ITh7LAp3UbmJXNnpXIbyUJ4dn15D0MpZbcB4o7/5OzJhQuJtOMvuW3hyz2VrQQMIoJ
 lD0Mb1llp7Y5Q==
Received: by mail-yx1-f43.google.com with SMTP id
 956f58d0204a3-6420c08f886so6328780d50.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 08:14:09 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUGWqpbbLj5xxWFiZrkjibpzdIW3q+1HAGXK3i/qbYm2F95TJHBmC/BPD03OpfdKOdlQoLs0qqy3F0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySlFeAqZaYFxgCdGJvEQpW3M8G5mJ6sEwuUlunywnQ1uBPhGWy
 P7A1C0HhHDXZFc0WhmRvi11blKywH9/kyq9BffGAAlNfK/6eyqzQy3H799W7Jad2wTZb7TRVy+D
 JdfgaeEpACGPVvjXYFZMWkxGeysI+W4U=
X-Google-Smtp-Source: AGHT+IFv7JEVIIVvVDywANbCWFoFi90fVPPq64qx041hRYmTTye2SbDhS5D5hv7EmCXcdrsKJQ+lTXduKjXsLF1Wdak=
X-Received: by 2002:a53:d057:0:10b0:63f:aef7:d01b with SMTP id
 956f58d0204a3-64302a3aa3dmr8871189d50.8.1764087248492; Tue, 25 Nov 2025
 08:14:08 -0800 (PST)
MIME-Version: 1.0
References: <20251121-mcde-drm-regression-thirdfix-v4-0-d89bf8c17f85@linaro.org>
In-Reply-To: <20251121-mcde-drm-regression-thirdfix-v4-0-d89bf8c17f85@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 25 Nov 2025 17:13:57 +0100
X-Gmail-Original-Message-ID: <CAD++jL=_wTX6H1uKEHRf7Ud1EKUEhTxmTRqZtUKZzergx-8knw@mail.gmail.com>
X-Gm-Features: AWmQ_bmDXNdbMUOreLvINg_modE7PvILqWmU6FhDborI3I0JGNQHaHDUnKbdGNk
Message-ID: <CAD++jL=_wTX6H1uKEHRf7Ud1EKUEhTxmTRqZtUKZzergx-8knw@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] drm/atomic-helpers: Fix MCDE/R-Car DU regressions
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Aradhya Bhatia <a-bhatia1@ti.com>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
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

On Fri, Nov 21, 2025 at 3:08=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:

> This fixes two regressions experienced in the MCDE and
> R-Car DU DRM drivers after
> commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
> "drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
> caused a series of regressions in all panels that send
> DSI commands in their .prepare() and .unprepare()
> callbacks.
>
> This series make it possible to selectively bring back the
> old behaviour with explicit semantics and implements
> the old behaviour as modified commit tails in MCDE and
> R-Car DU.

So what's the take on this patch series?

Maxime: is this what you had in mind? Acked-by?

Marek: do you think you have an opportunity to test this on the R-Car DU?

I am happy to develop a fifth version using the approach outlined by
Tomi (special codepaths in the helpers) if there is some consensus
that this is better in the long run.

Yours,
Linus Walleij
