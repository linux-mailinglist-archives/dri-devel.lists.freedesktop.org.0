Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67900CBB9E7
	for <lists+dri-devel@lfdr.de>; Sun, 14 Dec 2025 12:14:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FCF710E475;
	Sun, 14 Dec 2025 11:14:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="A+LFESQI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50CB510E475
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 11:14:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 026BC443D3
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 11:14:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBDD9C19423
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 11:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765710864;
 bh=/QLe5DRA4R5uIxIMYOd08sO2x/axkjdz2V3xzbL3jPA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=A+LFESQIXd3zItQtPPuxev+VA+1XilaSrnOr/SEUs484jKGiSDLhqWpVkx5ciMeZK
 ilVLuA/AvXxLj5d9VY7W0g60E1WXQfidapl/33Iw+hUiU1z/fPedpgw4bpqMPV7Sax
 olfFMfBho4k/nSmFzuyBNHwuYQXdnRM0CcgE0VMeJ56Z8e6rN6GJ3wBnRW9kQBzwv/
 486z5UGraXFdTNqLeP0a8ajpjRvnHw2zEMpcX0MI1Juk+htHW9SYk9ccaTOMmdwXtz
 N0eV/QSjZK3SXVYp1Si4XIxH7DXy4crDghAuzSQ/npx1hRPdVscQTyZzOfdVYhzcJc
 XJCl55l0Xq4Sg==
Received: by mail-yx1-f53.google.com with SMTP id
 956f58d0204a3-64472c71fc0so2141420d50.0
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 03:14:24 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVLThs8/S4/m4IyfZN2HhJHALwbjDdWuCSYLTaXWMIkEAgtIcD0wPI0UZotD9JmVGzFaKPTTU+OYf8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRZmiwGrOB8b5L/mjNX72C4298hKZJEapwv3yd4OEyarB0YByi
 pQoE2g4dkZm3ET1FZ55WkUZiAScUL7H5X+Qe+xag2fCAEutNJgbquxlS2NvgCLM08/cKyKmkPCa
 0yTXS+RwftEgO4gkb9x209feOwkV7Wzc=
X-Google-Smtp-Source: AGHT+IF59cxs2kdU4eDBNHMhmLTNz8MsYKlAx9mrL803Pj47S8lUi3lkvhPPv1HSTCcC+HsFx/YkSG29wQ1pVt26PNc=
X-Received: by 2002:a05:690e:20a:b0:63f:add1:e6da with SMTP id
 956f58d0204a3-64555651315mr5936681d50.57.1765710863949; Sun, 14 Dec 2025
 03:14:23 -0800 (PST)
MIME-Version: 1.0
References: <20251205-drm-seq-fix-v1-0-fda68fa1b3de@ideasonboard.com>
 <3b13c7a2-f7e6-49fd-b3bb-3e0a1fe9acf3@ideasonboard.com>
In-Reply-To: <3b13c7a2-f7e6-49fd-b3bb-3e0a1fe9acf3@ideasonboard.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 14 Dec 2025 12:14:12 +0100
X-Gmail-Original-Message-ID: <CAD++jLk8-0Rkh16T+R1dh6=e_f9U1i=AKOk1Y8dLGV4bxzRtFg@mail.gmail.com>
X-Gm-Features: AQt7F2ocpq33b3u9qnsKC4Ot3iW4zl2olWm7s8rxLgJ7ka5jFZMptEaRqkUdvZI
Message-ID: <CAD++jLk8-0Rkh16T+R1dh6=e_f9U1i=AKOk1Y8dLGV4bxzRtFg@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm: Revert and fix enable/disable sequence
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Vicente Bergas <vicencb@gmail.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, stable@vger.kernel.org
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

On Fri, Dec 12, 2025 at 3:21=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> On 05/12/2025 11:51, Tomi Valkeinen wrote:
> > Changing the enable/disable sequence in commit c9b1150a68d9
> > ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"=
)
> > has caused regressions on multiple platforms: R-Car, MCDE, Rockchip.
> >
> > This is an alternate series to Linus' series:
> >
> > https://lore.kernel.org/all/20251202-mcde-drm-regression-thirdfix-v6-0-=
f1bffd4ec0fa%40kernel.org/
> >
> > This series first reverts the original commit and reverts a fix for
> > mediatek which is no longer needed. It then exposes helper functions
> > from DRM core, and finally implements the new sequence only in the tids=
s
> > driver.
> >
> > There is one more fix in upstream for the original commit, commit
> > 5d91394f2361 ("drm/exynos: fimd: Guard display clock control with
> > runtime PM calls"), but I have not reverted that one as it looks like a
> > valid patch in its own.
> >
> > I added Cc stable v6.17+ to all patches, but I didn't add Fixes tags, a=
s
> > I wasn't sure what should they point to. But I could perhaps add Fixes:
> > <original commit> to all of these.

> There has been no comments, so I assume this is the way to go.
>
> Should we merge this series as a fix for 6.18 rcs?

Too late now, so let's merge it as a fix for v6.19 rcs!

Yours,
Linus Walleij
