Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75894CC58A6
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 01:01:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D2E10E71C;
	Wed, 17 Dec 2025 00:01:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="b9dpJp/c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CAAD10E71C
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 00:01:53 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-29f102b013fso63283925ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 16:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1765929712; x=1766534512;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O5eCzl8UBxQzsjN75O8DpTQOlVvtN45HumiW/nT7Mrc=;
 b=b9dpJp/caRyaTVCy3xJOYtMl89Q0g62U2B5mFFRK85PwrjZhv9O2k+dl09YDe3uB62
 Bgu+xvbivBHqdzJOTeTJUmbFshCAtZqsQvD1eEke4Z4qBttgaMqPhFVSKU56AuQo4SM/
 JDTM0BA/1ZoWu9pCRluQPUSvdBejAdBLhwjSSBue1+SGYjNy9H4yTRtM7sjzIyVvnZxo
 Yx7TJzqX8Xiwexrqt5S6LLPUq2dyPCkARA23+zETwzhPpk+VGc8XRgMgmU2vx+PHI8ZJ
 836uPT3u5odTY7jYPE77a/X9vI8yk6ub3IxnKDo99zsCEGpflzTD8oiaPycPsv8rPUFU
 c4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765929712; x=1766534512;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=O5eCzl8UBxQzsjN75O8DpTQOlVvtN45HumiW/nT7Mrc=;
 b=asR++FMBI/Fqxc9duuyb4hsVDzAsqJCCv7cKUuABChaTiwiXLv6GsAqbgW936Yg5MK
 qUFfqJR8OC+gH0PHAACqJ5hrwKhPabFOmwmMkVtq37zfkXDkEnXyRuUr2ITFnq3HEkEw
 IzKEptzV3ThWvAAsS87h/bMTSim7gCDjG+R7687ERx6KMzlTl313kk8EtEzhQziEF9EY
 rBviSDOSfKnSMjlYrJp2cviQJuJEEeBwbf/YvB7jPUIGIu82OW+Vlb/ezCwkAAPbV8u6
 KXZyxgGS2pVF7g9pTU36zjF5i5H5BDsJvzrGYb84HpnweatIyKPZfxA4nnw0qt41ddLp
 56kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoypIhcPVvkOIjrJ1Ixy+JNVwWqHmeQWNptST+CFu0j/bmzhWH9XDKD21ynYRL+Nikxk/plWzdlM4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz418cfk6jWBd9HoiDg9ofw1CjldKagxyopHmzK/ngspUwaddp3
 +2ik06d86m352/drEY/zXX3cUr1ViaA1u763W15lt3vmoaD+M8TVqhOYBVdr9vtXedgpn5aqvpx
 +db1M5elinZe++z/zYH2itsbMyV5pkrM=
X-Gm-Gg: AY/fxX4Wa0MhYaQunI69U5fzNHTbNc4x6XHbkrN38Z4Ff+7i4pMybF6ryaaX7LoFRmX
 gnOKh7LAYHF0EIQ2zyxXFSKE5yv5G6odSYuyll261CcCoBiTjMWIPVHgIhhabG4CGtqyWBosw4i
 NnNjBp4ryupowb0ea9bvwby60ig62+bMQzMVrkvOfbMiO7kNJAmQu6eo0E2PD9a8xnKpzdxEVec
 DWL3zHd1DF4FDkaoVHjCqiM6QiDKpJEjiZ1Dg3hcCmOSyTWexolOSa4v0Z3s+djJJS6Rpq0/pBp
 tvvOf1l9RhwZ961DYzzgT59Msuo=
X-Google-Smtp-Source: AGHT+IGJCumVLPI6LXTb+R3wbQ5b6SSgqQC0QLByiXYYrEmbkjlG0jzydWOiaHp0sl9AgFqwMi+afZ8/iOgSdsy9IWU=
X-Received: by 2002:a17:903:1446:b0:295:425a:350e with SMTP id
 d9443c01a7336-29f23de66ebmr152982955ad.8.1765929712310; Tue, 16 Dec 2025
 16:01:52 -0800 (PST)
MIME-Version: 1.0
References: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-0-88f8a107eca2@bootlin.com>
 <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-17-88f8a107eca2@bootlin.com>
 <CAFBinCCQjeUu7pgfwViH6b0-M6S_sKgfvz9VAP1hpqLRj=bL_g@mail.gmail.com>
 <DEZNGU4VJFK8.Y1LKWVTD7O8K@bootlin.com>
In-Reply-To: <DEZNGU4VJFK8.Y1LKWVTD7O8K@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 17 Dec 2025 01:01:40 +0100
X-Gm-Features: AQt7F2qigiuBf-2umKIaZyZh98eVY_wIo1vz8CYcqmMw3ZJiZleOgoOUFsOFlyM
Message-ID: <CAFBinCBaXRNBHpY2uYy4FxyAOnRA4NxJtHbraG0=j_U6Dzz2=A@mail.gmail.com>
Subject: Re: [PATCH v2 17/26] drm/meson: encoder_*: use
 devm_of_drm_get_bridge() to put the next bridge
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>,
 Phong LE <ple@baylibre.com>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Adrien Grassein <adrien.grassein@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
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

Hi Luca,

On Tue, Dec 16, 2025 at 1:46=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
[...]
> > What I'm not sure about is how this series interacts with
> > devm_drm_of_get_bridge() which is why I'm asking before cooking a
> > patch.
>
> Apologies for the long delay in getting back to you. You might have notic=
ed
> some discussion about the overall approach, and I waited for it to settle=
.
That hasn't gone unnoticed!

> About devm_drm_of_get_bridge(), it is a very different function so it doe=
s
> not affect this series. The name similarity is confusing indeed, but
> devm_of_drm_get_bridge() has been removed from my approach, so one less
> source of confusion.
I have to confess that I'm still confused. drivers/gpu/drm/drm_bridge.c sta=
tes:
"Display drivers are responsible for linking encoders with the first bridge
 in the chains. This is done by acquiring the appropriate bridge with
 devm_drm_of_get_bridge(). Once acquired, the bridge shall be attached to t=
he
 encoder with a call to drm_bridge_attach().

 Bridges are responsible for linking themselves with the next bridge in the
 chain, if any. This is done the same way as for encoders, with the call to
 drm_bridge_attach() occurring in the &drm_bridge_funcs.attach operation."
Does this mean your series effectively deprecates devm_drm_of_get_bridge()?

> I'm soon sending v3, and I have updated my patch to
> eson_encoder_{cvbs,dsi,hdmi}.c, actually splitting it in 3. I'd be gratef=
ul
> if you could reviewd and/ot test them when I send v3. But I don't think
> there is a need for you to send any patches related to this topic.
Regardless of the questions I still have around
devm_drm_of_get_bridge(): I'll give your patches a go in the next
days.


Best regards,
Martin
