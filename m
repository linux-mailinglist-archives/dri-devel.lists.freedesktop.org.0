Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281299B284D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 08:00:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54CD210E357;
	Mon, 28 Oct 2024 07:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="HawwNhwV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3FB10E354
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 07:00:56 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-539f4d8ef66so5213499e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 00:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1730098854; x=1730703654;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cmwyegq7pd+RNDhv4uH4MzNeE4hWCQOLImM4aqdf6HM=;
 b=HawwNhwVZ3l03G3MyqCQxjyaBav8Co8pEpDjpCzoWMafIam9Mu0gpupEZ0rlgJlzFV
 UQXpmfQJIMCSIhI844LDh6IffHBxylO4/JkmyV48nDHErfiK7UNtPFaaznZhqlIxOhv0
 gOf7qVpUXLU59cMyRcr0uQXvsuoK7jp9aCdak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730098854; x=1730703654;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cmwyegq7pd+RNDhv4uH4MzNeE4hWCQOLImM4aqdf6HM=;
 b=muQvPORemjgb7RwSrSrO2mejLGlLxNvS6/eGGrIMNPFYKcO+tglALJCUUnOMZqAMtw
 +3CWRuaVYsjaspsq1Uou4SVvoPD/oyAma1DgLwi4FYjceE0vIpmNjOlncyhfJKlb8IIG
 i4TVExXW+LiGXcdXz6B2yMCzuFRY9UujS1uWZfpgeRuqLz9aqPVdH8PaE4aenVJ/eTwW
 6+5dTScEviBGOzoDpcrzkhDufrYCXjl5Beb5Ob3q0IdM7e8Zi3lLjQuM3pmbHw9N1+WU
 msIk8Q45yXp8EOAJrzR7flaWv1VjXPWkLcZ+/ljpDtGj21a9t2eS+uFTVkDtGytpyWbG
 lUjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpRant8DHVoNzl6KpD1zKVnkxWzzFcq2I98NJxY++2bg4Q7wSsFq2sDKms2OKhEZf4jysFxYz7DuY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYF5/2dKebxuUC+n2cNVoQXd6E7c1l2PjcqT5tlilR70EXAc0b
 yfkdlQNeFGOl8ZkdVCFqCrbfiORDnSYEsQ5le45owmaxqcVzsjqm1aEWCBjUZ7X8C/kPFP3+GIP
 2iIy2I1ICYO2J81a4okIpPS4dirYlmQqKj3r0
X-Google-Smtp-Source: AGHT+IFCTK/9t8GApx2c313ElibGHVQt1aCzEHXMhwQB7y5ngpH9maQprAhY8bEpEJF/nzrqaJAxSEh5HOrX6QHHt28=
X-Received: by 2002:a05:6512:3ca7:b0:539:e873:6e2 with SMTP id
 2adb3069b0e04-53b348ec22cmr2169421e87.8.1730098854425; Mon, 28 Oct 2024
 00:00:54 -0700 (PDT)
MIME-Version: 1.0
References: <20241011-mtk_drm_drv_memleak-v1-0-2b40c74c8d75@gmail.com>
 <20241011-mtk_drm_drv_memleak-v1-2-2b40c74c8d75@gmail.com>
In-Reply-To: <20241011-mtk_drm_drv_memleak-v1-2-2b40c74c8d75@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 28 Oct 2024 15:00:43 +0800
Message-ID: <CAGXv+5HAXuqxZM+CwfseXbAr2bsPgP__wc34mfmiJfui_fLOOw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/mediatek: Switch to
 for_each_child_of_node_scoped()
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, CK Hu <ck.hu@mediatek.com>, 
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
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

On Sat, Oct 12, 2024 at 3:22=E2=80=AFAM Javier Carrasco
<javier.carrasco.cruz@gmail.com> wrote:
>
> Introduce the scoped variant of the loop to automatically release the
> child node when it goes out of scope, which is more robust than the
> non-scoped variant, and accounts for new early exits that could be added
> in the future.
>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
