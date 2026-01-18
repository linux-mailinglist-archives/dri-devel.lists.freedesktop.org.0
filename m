Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED51D399A7
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jan 2026 21:10:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E7B10E160;
	Sun, 18 Jan 2026 20:10:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EYTfK0A9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A1B910E160
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 20:10:39 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id
 5614622812f47-45c819ca0f1so2234438b6e.0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 12:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768767038; x=1769371838; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AGoxtBWa7Hges9TlON6JW/74fTOpKQVhj45ottMY/WE=;
 b=EYTfK0A9q6XEuR9maPfiub+Vt7R1vjfVw4dK5+qid6zjVXLzI6MvD9wwfkxwVADixI
 5++9Y19zHrOk7QjjtYDF5XrKf4aRJhTujZgv8wYJtnfidzFz1KGdLDPBxV6bW54LdSJ5
 qUJRucRTVfKx21DJiWKLdumV+41hTGamv8lZYcTQ3UXKVbOCMqC2jwkYYgzsNeZEf7AP
 LnvP1X7t1+1V/ZgOBYT8mmp01x2eH7nVnOYDq2Kwyh9pguIXtgcnXHAPdGyYKty3SncA
 0D3upwRngs0gGGT3c0o5F0ZYhky1isZ30XEjJY4IG5bLqlY4/FXBPT21wnOxo98/Ja0f
 Biuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768767038; x=1769371838;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AGoxtBWa7Hges9TlON6JW/74fTOpKQVhj45ottMY/WE=;
 b=jnu66zAsaQVI+EJpuXMTZNW+0GXZuokR6eCplfxab+UodY3qJPM9/rGPXjHBK9WW1X
 x52F4veY58VOymDz1egMrV8mXxSvC1sL1ZC0Ay+YBQXVGRz4Jwkw4E96ncaGQ0puLAE2
 628gB8M1NNn+4gJ+gcAJ5r5s5Wy21J5Z+qte/D6hRbc1B+V9WxZroqmlMxwV7cWZLrJo
 K86i3lyVDC2Nh7SEwsINPk/KfVMEG0Lofo/beIPz7uJqRVWRwvTZ4VR0DqEA9qjhE1VR
 fQPgSpATtRS6JOnu1woQ6RXnRcfuhC335aQztY38LBaNQ0u3Rbm+8oXL5wBBxQ3ifVPx
 pKYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXkej8MJ8oF2PxkjsutbaqdgvXhCGlqdm2rju+gd2/OMg5ejMlY2jeLTEbFaoo/ORZt+812hF8RsQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrCmcC/YH1hTjly0loEbdlcUSfIPZPUxjTU2+kR3YIebgcBXt9
 uBCS0groxLixtW8o63tZzXwsULG05s8BbFggny7jpLegfZNmf7asgvArp4BZv2heKtT2hIvCkWq
 dvhfvjlVZF4SxoLwt+tnEww3TXTKiDBs=
X-Gm-Gg: AY/fxX7x4V3tu74BWJ0jREyzlKOK5fDEB6r0JDGWn046Oy1SaqpFXVh603KlSvMcPQ7
 56LkU0RiiUa/2QPdHRMlNTbMHCTlsd/A72B+O4YT0F+M8PgxT0JYQYyA17P980Xu2hqVbA4ToVH
 QPCSkkK1cLYXat/DqR5qW0fdBYiWWv86VH9LK5m2fHiUbYE6aQTFUY2qSeKsxgi0+Il9v8s28SP
 ZfGjm8kDQNQfypvh5Nl72CnRYpy05WUEQUKi1O0ikcYgLpn+iWGlUEdPg2jDNuj/mRUfveN
X-Received: by 2002:a05:6808:80b3:b0:450:89ee:922b with SMTP id
 5614622812f47-45c9c88dcd6mr5123911b6e.22.1768767038493; Sun, 18 Jan 2026
 12:10:38 -0800 (PST)
MIME-Version: 1.0
References: <20251031155838.1650833-1-jason-jh.lin@mediatek.com>
 <e6c2c86d-71bd-453c-847c-1eff2be88be7@collabora.com>
In-Reply-To: <e6c2c86d-71bd-453c-847c-1eff2be88be7@collabora.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 18 Jan 2026 14:10:26 -0600
X-Gm-Features: AZwV_Qh1K-r-Z8NlKIiE7Ar8yunvRZXy4lr5rzaBilBfhNZa6yCxoqTzBHyaliM
Message-ID: <CABb+yY3ioZ4KCG0tp-r7Xj7hJZFf57xeA_mByUEZBXRaBQQ35w@mail.gmail.com>
Subject: Re: [PATCH 0/9] Add GCE support for MT8196 (series 1/4)
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Nicolas Dufresne <nicolas@ndufresne.ca>, Nancy Lin <nancy.lin@mediatek.com>, 
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, 
 Moudy Ho <moudy.ho@mediatek.com>, Xiandong Wang <xiandong.wang@mediatek.com>, 
 Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>, 
 Chen-yu Tsai <wenst@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
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

On Thu, Jan 8, 2026 at 3:37=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 31/10/25 16:56, Jason-JH Lin ha scritto:
> > From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
> >
> > This series adds initial support for the MediaTek MT8196 GCE in the CMD=
Q
> > driver, including related API changes for new hardware requirements.
> >
> > Series application order:
> >    1. [Fixes] Refine DMA address handling for the command buffer
> >    - https://lore.kernel.org/all/20251022171847.379470-1-jason-jh.lin@m=
ediatek.com/
> >    2. [Series 1/4] Add GCE support for MT8196 and update CMDQ APIs (thi=
s series)
> >    3. [Series 2/4] Migrate subsystems to new CMDQ APIs
> >    4. [Series 3/4] Remove shift_pa from CMDQ jump functions
> >    5. [Series 4/4] Remove deprecated CMDQ APIs
> >
> > Please apply this series after the DMA address handling Fixes patch[1],
> > and before the following series.
> >
>
> Jassi, since this is touching both mailbox and soc/mediatek, can we avoid=
 to create
> immutable branches to pick this entire thing?
>
> If you wish, I'm fine with you picking the soc/mediatek commits as well a=
s the
> mailbox ones, or I can pick the mailbox ones instead if you're okay with =
that.
>
Yes, I am fine with this going via mediatek tree.
Acked-by: Jassi Brar <jassisinghbrar@gmail.com>
