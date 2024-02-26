Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 693E186731A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 12:32:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E3910F0AB;
	Mon, 26 Feb 2024 11:32:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="nuMs/rY/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA1610F0AB
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 11:32:22 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id
 ada2fe7eead31-471e6e9482eso128201137.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 03:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1708947141; x=1709551941;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=59M376lOs4RpQY+QsNbUdwZI7JBMTstkeh/+AItoW50=;
 b=nuMs/rY/hEMQ9QLY/4hbuHeozQ3MTAw5boikQRb+1FGS9UXrz82c7sGnTL8sWteLYj
 uUlqr4ZcnapQ9PCnoDSeHJPHIKSHLvSFla/c9Er8pF84ALY/8IUjpfw6u+jnoIISkhHX
 ZGulaxgvlbc/admMHDj7ayUHm0KZG6g1icyi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708947141; x=1709551941;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=59M376lOs4RpQY+QsNbUdwZI7JBMTstkeh/+AItoW50=;
 b=hAd865PX27YGcve88dsnVkVdvpFzxFpC+SjbpYoDxsVe2cx809/dPcxMkhYe3ca/Oy
 7OsKsf1qZpGGzsmnMluunO1PKIXSQVfixOBaHwf6HA8ck4ND3U4zU8H18Uw6t21WQKXH
 Y0BNcPpBUt/2+EJGN/nLxEyrruQRIq7z6vNE8MjmEPBSQwD7S+Z9K7UMY07EZ94yjqkn
 43sxsx9kW/4fyAYClzvdN1E75HKWBmsaGqsq6ZVSszt+eIfvJ/+7lAs2GOuHHV6CDxNR
 LvZniZUY48w1rsmVqkV6W4ZrQvdjhC+83KG3Tx7P1F/+k7R2EciGBQVl1prl0S7PxoyY
 3bDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbM/yQpVFWxmJBt5adQNT8xRkYhkNeTsMTacyZmTfhCdaCpRxfuiLcN73IavzCXywx7LOQNxqj/UtWz9R24zYlDH819naPo/OM7tnlXPBf
X-Gm-Message-State: AOJu0YxEUNt+jUCA3aya7d4n4cY86k1FSdiuvgTUu9g/Lbhy1x7CO4Nj
 Ua6FNSLTKce10F+GCXfJ0Zlt6Zls1NItLV4GrBGvXsxe/mk9h/loL6WEmki61/Y+fwKwIADlrHT
 TpA==
X-Google-Smtp-Source: AGHT+IHv16GtiP67EbEHGdEzK/AIRZ5xjfqeo2D3qPze9fK+9rw8YStpoDfT5YCYom3A4+BJ2ikjYg==
X-Received: by 2002:a67:fe4b:0:b0:470:5373:2389 with SMTP id
 m11-20020a67fe4b000000b0047053732389mr3076665vsr.0.1708947140825; 
 Mon, 26 Feb 2024 03:32:20 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com.
 [209.85.222.44]) by smtp.gmail.com with ESMTPSA id
 ez4-20020a0561302f0400b007cb869908b0sm727216uab.6.2024.02.26.03.32.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 03:32:20 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id
 a1e0cc1a2514c-7d5bbbe57bbso1503103241.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 03:32:20 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUBSCu5twbyB6+UQjOuJB5RAs3Gi2pdbedyDBj3KUUBEA4gs88LZJTqQPIG+WL4SpsZiDeqTyDm/4LsF5TZj3VIPHZc2LCz3pS44yPx/7JQ
X-Received: by 2002:a05:6102:3a0f:b0:471:e2ca:4023 with SMTP id
 b15-20020a0561023a0f00b00471e2ca4023mr2137374vsu.25.1708947138994; Mon, 26
 Feb 2024 03:32:18 -0800 (PST)
MIME-Version: 1.0
References: <20240226080721.3331649-1-fshao@chromium.org>
In-Reply-To: <20240226080721.3331649-1-fshao@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 26 Feb 2024 19:31:42 +0800
X-Gmail-Original-Message-ID: <CAC=S1niCFgbNjbnHmUD46N-9gSagYuExeQ+nUHvKOvNbS-jz1A@mail.gmail.com>
Message-ID: <CAC=S1niCFgbNjbnHmUD46N-9gSagYuExeQ+nUHvKOvNbS-jz1A@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Support MT8195 OVL compatible in mtk_drm_drv
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
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

On Mon, Feb 26, 2024 at 4:07=E2=80=AFPM Fei Shao <fshao@chromium.org> wrote=
:
>
> Specify the component type for mediatek,mt8195-disp-ovl in the MediaTek
> DRM driver on top of commit 76cdcb87d391 ("drm/mediatek: Add MT8195 ovl
> driver support").
>
> With this, the compatible can function as an independent fallback for
> other display overlays without relying on MT8192.
>
> Signed-off-by: Fei Shao <fshao@chromium.org>

Please disregard this patch.

With the feedback in [1], I can also fix the issue from within the
SoC's device tree.
Even taking a step back, I just learned that this is a duplicate of
[2], so it makes no sense to merge mine in any case.
Sorry for the noise.

[1]: https://lore.kernel.org/all/c4814e25-42c9-4604-b86a-8ef0bd634f78@colla=
bora.com/
[2]: https://lore.kernel.org/all/20240215101119.12629-3-shawn.sung@mediatek=
.com/

Regards,
Fei
