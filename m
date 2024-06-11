Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8959034A6
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 10:02:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9099B10E55F;
	Tue, 11 Jun 2024 08:02:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EuGZglMZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA5B10E55F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 08:02:41 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-421757d217aso33608215e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 01:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718092959; x=1718697759; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xaQ5c2kG2ytdMjulncJeOQcMPePJzL39OYVmshUn2sU=;
 b=EuGZglMZK60T1rTY9kwufBpa5uNMSerjebHo30ItVAp9gmsZ1L7AYexVDhpmfbqpl7
 4v9VuWgOjGp1urbQJohkbICbSJ7sAyWI0QBGedw6b0at36a3NW+J7/LTmloKU2YAIVD6
 D5Tw8/pNoor3G1LFy8IAD2S/yLKlXSUeVfF5tsIe+2qWMukuKZtXurSAAByncMqpwjJk
 vEjBZJVzP8b2Kt5p00N6MIoVw/gFNpVwtRxjilif4L2Ani10T+iMIGGpLpVH2N1tkXqv
 E4YHRsQOaKxUZQ+g+9NB2KeBobYEbfrCbe/PBMCkTBAwKRBaF3dmiElShEoPvrvZUsTe
 s5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718092959; x=1718697759;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xaQ5c2kG2ytdMjulncJeOQcMPePJzL39OYVmshUn2sU=;
 b=vfbb3U5LX/+KWBbJkecDdGn+pSeXqK3qSv6pXT/pjRdSSoTjTVzPjOC8BH4bVQrqyD
 EywzzLFtBAkEfurMJY0FKoLgTP3KRl+teCGckneXB7Hi/RWonjxE9BxRWVwZ9ltSh20N
 wICxKaKhWuOgvxAwwTsykighZFPDxM/em45enfIP37sQL6XbZTon6YB5WWS3Ed6n0AQa
 0yVDMfdg0Yelw4/k2bgUqoyPsk7HA9VjIABExyvu8toDBKC7n9/RLOzOg6tzAlsq5khW
 nntJDGn4/MZM82QjFCVw83C+GoXdMOtsC4umbJbACEWTv9qETQq0uZV4V1DiyW1bHhtA
 5Cbw==
X-Gm-Message-State: AOJu0YyWj6YFKt7fAkavqu2RR+enCvbSVeueA4y/hJIT+ZwH7HXfM3V3
 Oz0HIQhF5FcrQVLiA2rTkifxH/DEpECzwHOPdXZmapXI7r7UM2AQvxxe05OjAuM=
X-Google-Smtp-Source: AGHT+IGN24Aa+RfBIcyXuUKjwh6U0g7ybW6UT5cPP0P3069MO/9Je7HQzSudTLcIQu+deT23iTKWJA==
X-Received: by 2002:a05:600c:45c4:b0:421:29cd:5c95 with SMTP id
 5b1f17b1804b1-421649fba60mr129661095e9.10.1718092958704; 
 Tue, 11 Jun 2024 01:02:38 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-421727aac08sm126706925e9.43.2024.06.11.01.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 01:02:38 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Chris Morgan <macromorgan@hotmail.com>, 
 Yuran Pereira <yuran.pereira@hotmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Robert Chiras <robert.chiras@nxp.com>, Stefan Mavrodiev <stefan@olimex.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20240605002401.2848541-1-dianders@chromium.org>
References: <20240605002401.2848541-1-dianders@chromium.org>
Subject: Re: (subset) [PATCH v3 00/24] drm/panel: Remove most
 store/double-check of prepared/enabled state
Message-Id: <171809295768.4173405.17800575669800599285.b4-ty@linaro.org>
Date: Tue, 11 Jun 2024 10:02:37 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

Hi,

On Tue, 04 Jun 2024 17:22:46 -0700, Douglas Anderson wrote:
> As talked about in commit d2aacaf07395 ("drm/panel: Check for already
> prepared/enabled in drm_panel"), we want to remove needless code from
> panel drivers that was storing and double-checking the
> prepared/enabled state. Even if someone was relying on the
> double-check before, that double-check is now in the core and not
> needed in individual drivers.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[01/24] drm/panel: boe-himax8279d: Stop tracking prepared/enabled
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/12866fdcfb9ebbe1b175804390195b99a234d5e7
[02/24] drm/panel: boe-himax8279d: Don't call unprepare+disable at shutdown/remove
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/2ccc698c68333256621abc1146de0d3fb0cc6ebd
[03/24] drm/panel: khadas-ts050: Stop tracking prepared/enabled
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/2469cb5c41b4774a6fb5ed799ae53ad16b407a9a
[04/24] drm/panel: khadas-ts050: Don't call unprepare+disable at shutdown/remove
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/6ac427c0cd21c7260d6b5133a70084aa35267a72
[05/24] drm/panel: olimex-lcd-olinuxino: Stop tracking prepared/enabled
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/db45a6991d9e33e852419f8bb0bb8d70b8d633ac
[06/24] drm/panel: olimex-lcd-olinuxino: Don't call unprepare+disable at remove
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/16661a0dd54168826edb2fe5a7b9a183cff0c69b
[07/24] drm/panel: osd-osd101t2587-53ts: Stop tracking prepared/enabled
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/9a3f7eb7811a4c5f36eee93b83bbd72bf6adeac8
[08/24] drm/panel: osd-osd101t2587-53ts: Don't call unprepare+disable at shutdown/remove
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/c99e387afed197c3f22d73d8649c54f7c8da30ec
[09/24] drm/panel: tdo-tl070wsh30: Stop tracking prepared
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/7c9526e58f74e9d725a9607b1ec24ba675f5b00b
[10/24] drm/panel: tdo-tl070wsh30: Don't call unprepare+disable at shutdown/remove
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/2098604605adf35c9a0936355252d676f4cbc38b
[11/24] drm/panel: jdi-lt070me05000: Stop tracking prepared/enabled
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/698acd40aee3ab2dfff4472ec3c16ce42e70e4f3
[12/24] drm/panel: jdi-lt070me05000: Don't call disable at shutdown/remove
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/c8f67cd1d931f2e61a3456d0122ffdeb90b699f7
[13/24] drm/panel: panasonic-vvx10f034n00: Stop tracking prepared/enabled
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e9864996b44e8add09fd612cb7d00d9b54cd9ef1
[14/24] drm/panel: panasonic-vvx10f034n00: Don't call disable at shutdown/remove
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/f10b4577da3e8c8e457016c77ce2c2fb8d2d5023
[15/24] drm/panel: seiko-43wvf1g: Stop tracking prepared/enabled
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/155739579969d9653f9c2e69141129a824cbd6b8
[16/24] drm/panel: seiko-43wvf1g: Don't call disable at shutdown/remove
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/728290006afba80108b3ce9dd33018f05e454cf0
[17/24] drm/panel: sharp-lq101r1sx01: Stop tracking prepared/enabled
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/316bb1473c78f415a99a10d3c903ed70e0014ae3
[18/24] drm/panel: sharp-lq101r1sx01: Don't call disable at shutdown/remove
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d7d473d8464e7b9931c0b19f68ea0df807e01b4c
[19/24] drm/panel: sharp-ls043t1le01: Stop tracking prepared
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/804c4d0a20437bca3f017aaf96416f3cec7951c9
[20/24] drm/panel: sharp-ls043t1le01: Don't call disable at shutdown/remove
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/b3494ccb04124ab3ae08fcd01f9571d209ce97f2
[21/24] drm/panel: raydium-rm67191: Stop tracking enabled
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/b7c906d68078f235c1d017a5a820fbeac5a53904
[22/24] drm/panel: raydium-rm67191: Don't call unprepare+disable at shutdown
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/78f15847bdb8fe04b1753b1fed4984c183661ef5
[23/24] drm/panel: Update TODO list item for cleaning up prepared/enabled tracking
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/8e11b23c96c694d4cb0fb6595b38d77ee5edb296

-- 
Neil

