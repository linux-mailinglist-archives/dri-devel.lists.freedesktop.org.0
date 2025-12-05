Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1059DCA7957
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 13:36:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B8310E132;
	Fri,  5 Dec 2025 12:36:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kA9jAiXM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D58210E132
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 12:36:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 17D3F4448C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 12:36:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBDBBC113D0
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 12:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764938188;
 bh=40WaPL3xSyqPdfQ0BAFTST386p7tT1HulIdRWXHJkKo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kA9jAiXM5XfELxuKU9/l9OpMOt7HLiUaJi/7R5aGry/eGkBeBaRtm1w9auQ3EGkDk
 daZ1xEFxRCUxO2MhMrxLlHdzG/9Cu39Wj9QBJ5/OF0sQfGnnx7a4bL0FWzsUaRCSxr
 GMcrXuuIOSvQDiqpufJzCiIGhx0LiwbHjB8F1SFsWyde9l4ZKQzGdkljBmfTpIPDTC
 4xkAZ58K5JMAiu3XuGb36DJ6WypdTSVnzfpxILFJJKVOd2AJZH+tgSvVDBrx/j1dAt
 TlNwWkvcoEH28P/xAPkWqu/tbBWQw+fvin+z6lcsIWsGHpn75h1HSrTV9aQWP99VJr
 5h8spjUvoS/mg==
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-78a712cfbc0so23417587b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 04:36:27 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW/oy2IZyaC/YsPZBsUmvn6Hyudupuzw0W/56TPiLzuIAfBoS8y61yHLfuf/QxENHA9srARgAf56vo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOkiTwLk6K8N2ADxs8bztH1XE582w4R/xD+pbYHepXquCo7Vrr
 YD+9qK/F30OjtwQH3dUqGesy/RFYQAeQ/tjsEeKGLFUodfclgNJcJ4Lf8brzUH/gJ4/dXEa25sy
 P/uWapNEemuVQWCbAqFb0XZmBkqSNhmc=
X-Google-Smtp-Source: AGHT+IFJmlLvuUNZfx9GIfUBDjC2grftRlFjbvDqqrPRzj/oZgXVOMBUT7kbSYooxA8gr0guXcBsmXxXrD2+uuIJcXg=
X-Received: by 2002:a05:690c:6007:b0:784:883c:a88d with SMTP id
 00721157ae682-78c0c18ea37mr70979807b3.52.1764938187032; Fri, 05 Dec 2025
 04:36:27 -0800 (PST)
MIME-Version: 1.0
References: <20251205-drm-seq-fix-v1-0-fda68fa1b3de@ideasonboard.com>
In-Reply-To: <20251205-drm-seq-fix-v1-0-fda68fa1b3de@ideasonboard.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 5 Dec 2025 13:36:15 +0100
X-Gmail-Original-Message-ID: <CAD++jLkpWoHe5qYSABF1GeDq-9hZh7ZdL-+8Xqu5MA_erzNqsA@mail.gmail.com>
X-Gm-Features: AQt7F2rYtL9k7rH39ohC1dih2VUr1gAYC2XO7dYs8vpOSbzH63P91fhZJWxLMZY
Message-ID: <CAD++jLkpWoHe5qYSABF1GeDq-9hZh7ZdL-+8Xqu5MA_erzNqsA@mail.gmail.com>
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

On Fri, Dec 5, 2025 at 10:52=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:

> Changing the enable/disable sequence in commit c9b1150a68d9
> ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
> has caused regressions on multiple platforms: R-Car, MCDE, Rockchip.
>
> This is an alternate series to Linus' series:
>
> https://lore.kernel.org/all/20251202-mcde-drm-regression-thirdfix-v6-0-f1=
bffd4ec0fa%40kernel.org/
>
> This series first reverts the original commit and reverts a fix for
> mediatek which is no longer needed. It then exposes helper functions
> from DRM core, and finally implements the new sequence only in the tidss
> driver.
>
> There is one more fix in upstream for the original commit, commit
> 5d91394f2361 ("drm/exynos: fimd: Guard display clock control with
> runtime PM calls"), but I have not reverted that one as it looks like a
> valid patch in its own.
>
> I added Cc stable v6.17+ to all patches, but I didn't add Fixes tags, as
> I wasn't sure what should they point to. But I could perhaps add Fixes:
> <original commit> to all of these.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

The series:
Reviewed-by: Linus Walleij <linusw@kernel.org>
Tested-by: Linus Walleij <linusw@kernel.org>

In my opinion Laurent is the more senior maintainer and my
trust level in him is the highest of all the maintainers, so
I think we should apply this revert series if
Laurent ACKs that this is what he thinks is best for DRI.

Yours,
Linus Walleij
