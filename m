Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31534CA1E9A
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 00:14:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9723D10E163;
	Wed,  3 Dec 2025 23:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="m0gwMoTJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7DB210E163
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 23:14:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B4A10443BC
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 23:14:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93D16C19421
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 23:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764803640;
 bh=ihgCDDT8v/z6Y4GbpIULJIyFLtkjRgYSHsJMkze5H7Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=m0gwMoTJTYcgUJMRzgXQ1/QMlOZTPogG0lANMdW97OT0NMuTAc8A+nwSLo+R9YCrd
 gO1W/x5rrA/plqwmMQZoM/7pfn8gMN87Vx4+qBwzt8KD8U70cGDpIkOekXc6+u8/2G
 0KhJdXhq4/rzApUbBldkSZ3NKFUIVyMoVDWdTjvwTsLIzLmBSbn0TpeMyURg0Io8gd
 8FBszOVK56IQLZad9GuJPEaDuRvI8N+m6PUjLxM7zR93xTfasBiyf+9KYZCDyv9eEo
 Pp4+P1nlVfV6DEebY83NlHuHq+LD0ylrQyXKDhUUqqPsdaJnti/AQylG5hYyHCOeBQ
 M7g1IUsiMYgtQ==
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-7866bca6765so3011947b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 15:14:00 -0800 (PST)
X-Gm-Message-State: AOJu0YwkBE6bDeRONuokIv3TgWrDdwvyXHuvJ3BAacVumWbRpp27Zqip
 kd8M6orXYno/NxtHyghNyBP0Zs54gfOC7Nu4PqdNVZhzeMaKIIWOORwOary646RXTSeZMSl92dE
 y9aVCwh8gFG7VToJ2+kN3QqjeWcsifas=
X-Google-Smtp-Source: AGHT+IEB0RdV7mSFNzpNyLkv75P8Jd/BKS1HODcyk36WY9PHzOfb4L2RJP6I7Nnw9eq8aCpv+z+w6vM8/mTWmqJZTz8=
X-Received: by 2002:a05:690c:7303:b0:786:98d8:c1c7 with SMTP id
 00721157ae682-78c0bf2de2fmr30919417b3.18.1764803639941; Wed, 03 Dec 2025
 15:13:59 -0800 (PST)
MIME-Version: 1.0
References: <20251202-mcde-drm-regression-thirdfix-v6-0-f1bffd4ec0fa@kernel.org>
 <20251202-mcde-drm-regression-thirdfix-v6-2-f1bffd4ec0fa@kernel.org>
 <c3c5f62f-98fd-49a7-9b39-c4c4f798ad2c@rock-chips.com>
In-Reply-To: <c3c5f62f-98fd-49a7-9b39-c4c4f798ad2c@rock-chips.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 4 Dec 2025 00:13:48 +0100
X-Gmail-Original-Message-ID: <CAD++jLmzkmZAgwbahKDnasj3dDpG4RBggoZfhPiEHj9rb09+eQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnWhHUCVDnj7lqS5z50n507rDrSeB_Ghnr7X8Z3Pa5o_zJ_bBK53CBG7IY
Message-ID: <CAD++jLmzkmZAgwbahKDnasj3dDpG4RBggoZfhPiEHj9rb09+eQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] drm/mcde: Create custom commit tail
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, Vicente Bergas <vicencb@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
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
 Linus Walleij <linus.walleij@linaro.org>, Sandy Huang <hjc@rock-chips.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
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

On Wed, Dec 3, 2025 at 7:27=E2=80=AFAM Chaoyi Chen <chaoyi.chen@rock-chips.=
com> wrote:

> The bridge document says: "The display pipe (i.e. clocks and timing
> signals) feeding this bridge will not yet be running when the
> @atomic_pre_enable is called."
>
> Therefore, your approach seems to be merely a workaround and does not
> meet the current requirements of the bridge.
>
> And document also says: "The bridge can assume that the display pipe
> (i.e. clocks and timing signals) feeding it is running when
> @atomic_enable callback is called."
>
> If DSI commands need to wait for the display pipe (CRTC) to be ready,
> why not perform them inside @atomic_enable instead of @atomic_pre_enable?

That was exactly what the v1 and v2 versions of this patch set was
doing, and it was (politely) NACKed, and that is why we are
here.
https://lore.kernel.org/dri-devel/20251023-fix-mcde-drm-regression-v1-0-ed9=
a925db8c7@linaro.org/
https://lore.kernel.org/dri-devel/20251026-fix-mcde-drm-regression-v2-0-8d7=
99e488cf9@linaro.org/

In essence, Tomi remarked that drivers should be able to send DSI
commands at atomic_pre_enable() which is for example
mapped to the .prepare() callback in the DSI panel bridge.
And he has a good point in this, I just converted the few panel
drivers that I was affected by, but there are many more such
and probably some bridges as well.

Yours,
Linus Walleij
