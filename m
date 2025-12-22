Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE7CCD772B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 00:18:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C8310E126;
	Mon, 22 Dec 2025 23:18:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IHKlr+6G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 195BF10E126
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 23:18:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A130E444B4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 23:18:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86FC4C16AAE
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 23:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766445533;
 bh=1PTRj5IbPheHyKPLUeQn09lt7a0KA8xUVM3vs4ytqHE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IHKlr+6Gl+QA6DaryNduIe7WNRMfP/E6B1HbR+itsvFugogI1qMmYADh8rnIcXmNK
 PKRGX1Eb/Hn/078PsXt6gwtRFo7Gg1sFUlfWavz7rQFCxG5psWmo49HEAKbqti2/fz
 A2il37qqTBEs6Cw1bCzYM6zJeOUKjulJ1zJo8luVkqsRxNWYfeB+D6XxKrCu8UW3At
 JNrDfJJ1XxNdiY86a6wVSUUf0yCo42r0DBj931tkjFHjJfmryQmXqOEIDoAdcEjBbH
 s9nXS7azO2fxm1zST5j1Ek8F2UutDiI6uNawqwZzIkim17PjDCkfsgtx5Qql5JmZlY
 r7c7KNDBSTy+A==
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-78fcb465733so19061627b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 15:18:53 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVP2QIOrg8CG6KVrLfy1A/1JrsGY2jhoYfsuJsJ/c7MQI9PSYGdBWzs5ejttDj6krggufusdrVkZho=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxePBt3WxvI08rzus1vNgtoR9qd82LaFUzuoBGx8kfglZx9H6oQ
 c8JTvSXo3MEnyDQdRDgxY4N0GgM4Qxzf1ecfxkFmzdk7i1ZE+RWLzNNFw1P9AnldNW1vDraUegE
 k0O0SwA+rIr4gVpY7QqpE8xEuEYPSytk=
X-Google-Smtp-Source: AGHT+IFLuNG5vfFv+hvdMwlVrLtVEINXP+UqBdcB4yXJij0JrDbJSKnUkVy8zi/D+KeXicJLx2KQRsl8vzD85DfIxMQ=
X-Received: by 2002:a05:690c:6c84:b0:786:827f:6fe8 with SMTP id
 00721157ae682-78fb41ac9e0mr105561577b3.58.1766445532634; Mon, 22 Dec 2025
 15:18:52 -0800 (PST)
MIME-Version: 1.0
References: <20251205-drm-seq-fix-v1-0-fda68fa1b3de@ideasonboard.com>
 <3b13c7a2-f7e6-49fd-b3bb-3e0a1fe9acf3@ideasonboard.com>
 <CAD++jLk8-0Rkh16T+R1dh6=e_f9U1i=AKOk1Y8dLGV4bxzRtFg@mail.gmail.com>
 <817b2358-0920-4b7a-abb1-133103d0f9fe@ideasonboard.com>
In-Reply-To: <817b2358-0920-4b7a-abb1-133103d0f9fe@ideasonboard.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 23 Dec 2025 00:18:39 +0100
X-Gmail-Original-Message-ID: <CAD++jLm_0xweD4tRJ8ZfwmcOe2BBGCsUuL1UWUiNM+Gpbq3Zuw@mail.gmail.com>
X-Gm-Features: AQt7F2qVusB26rJf3VFnv1cbbMcmw7gQTV_3PZwZEvdew2fS2i_2TmDT15TKrTs
Message-ID: <CAD++jLm_0xweD4tRJ8ZfwmcOe2BBGCsUuL1UWUiNM+Gpbq3Zuw@mail.gmail.com>
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

On Sun, Dec 14, 2025 at 1:42=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:

> >> Should we merge this series as a fix for 6.18 rcs?
> >
> > Too late now, so let's merge it as a fix for v6.19 rcs!
>
> Ah, right. Indeed, I meant v6.19 rcs.

Are you applying it or should I?
Not sure if you want some special timing, like outside of
holidays.

Yours,
Linus Walleij
