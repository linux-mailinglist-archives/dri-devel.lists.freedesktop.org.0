Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 126477A1568
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 07:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3738610E0FC;
	Fri, 15 Sep 2023 05:28:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2438D10E0FC
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 05:28:18 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-502934c88b7so2954927e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 22:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694755696; x=1695360496;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xn9oFhHLAknaWRf3uArqHTLA9prBJhnE4LW7Dd164uA=;
 b=UB2i3jhUG8gSZfGP9IrNue3ZOeIoA2wuU7t0JxwKkZj96n9qsCAtdWv6akUIfi63Oc
 MKGI1qK6SzvIKQdyiNxNReucwyoiKVZ76SCLhM3/yvXwtlYy1fd2YhfkCY0Ri7pMr1WI
 suiova/IdO36NCVlOLhvqfJPfPhlOvPhtKeV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694755696; x=1695360496;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xn9oFhHLAknaWRf3uArqHTLA9prBJhnE4LW7Dd164uA=;
 b=MY+/y2RQdWiMLPFymM0twiGMjJ/W0ZUuSUgGvKA4fSmbL0BA4/R9JW+9WVaUls5fvb
 p9peOTHHNNWs0+orzR8SRHN9GLb0AZZ+zb+l7J74I5vdi3tzNbw68uchaj7dq8Wr7/io
 5IaMeLV7PAcEQQ3ZU/Pppk0znCiQ8YXiGPQdIvG2KxscXXrstWgW4tTcVIL51ts992tA
 gH1XNLdUREMzwjYR5OF7I/oWkx/EboHgpzc95gonqI01iNvvv6v2u9x7YS6rkXdDon4W
 UCjcymCSMZ1G/IhrzYpPoMrJSy2mPTVaTLzf6uUK0Rz0UwhbSxv3fZVnOS3L+3Xy71zS
 xv7g==
X-Gm-Message-State: AOJu0Yz2JR0VKmkn1RYlEdgOe7KCSqcsYTtXRo5vcaI7b6Ct0soSXphQ
 ODw6BKcMOa8w0rQSYIX6vrTBqyYuIi1ImX9MYHjK3A==
X-Google-Smtp-Source: AGHT+IHBF/LZiSOCHbF9PK/ZZsZw9DLkRfLiviBg8ZInp/Df/pEH0sQClGR3SSNslHwvIhnE/oLD3Fo+uCtKqC7O+9w=
X-Received: by 2002:a05:6512:48c9:b0:502:d639:22ed with SMTP id
 er9-20020a05651248c900b00502d63922edmr518597lfb.48.1694755696091; Thu, 14 Sep
 2023 22:28:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230914131058.2472260-1-jani.nikula@intel.com>
 <20230914155317.2511876-1-jani.nikula@intel.com>
In-Reply-To: <20230914155317.2511876-1-jani.nikula@intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 15 Sep 2023 13:28:04 +0800
Message-ID: <CAGXv+5GJxEobJKKWuc_UN+Gf_z8g6eb6KWTz-L+RqtyLYKK3Jg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek/dp: fix memory leak on ->get_edid callback
 audio detection
To: Jani Nikula <jani.nikula@intel.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Guillaume Ranquet <granquet@baylibre.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Bo-Chen Chen <rex-bc.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 14, 2023 at 11:53=E2=80=AFPM Jani Nikula <jani.nikula@intel.com=
> wrote:
>
> The sads returned by drm_edid_to_sad() needs to be freed.
>
> Fixes: e71a8ebbe086 ("drm/mediatek: dp: Audio support for MT8195")
> Cc: Guillaume Ranquet <granquet@baylibre.com>
> Cc: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: <stable@vger.kernel.org> # v6.1+
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Looks correct to me.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
