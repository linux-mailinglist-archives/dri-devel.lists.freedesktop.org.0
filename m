Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DEF79E139
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 09:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DDB310E474;
	Wed, 13 Sep 2023 07:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA0710E474
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 07:54:57 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-792726d3aeeso221154339f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 00:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694591696; x=1695196496;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eVi9HWsbyhPpxRlpwWkXgfmiV8lk8qQbW6adbUERlyM=;
 b=WlgjpynvPnFkWoTa79bVrKsKvSZXXWtdT3K5cjBjWlEI/MPkkgl6sSZOMneyh6HUHR
 jQ+6+lgV7YacQiqTfXTe2GT77gPfRvPfwdiCMpiH6d94EErRZu+Ki2FZsxmhqNeBDsVB
 jtzQoUhe8Z+yG+0V+h2OSNiHITTe9kZR2oAGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694591696; x=1695196496;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eVi9HWsbyhPpxRlpwWkXgfmiV8lk8qQbW6adbUERlyM=;
 b=OkmIWG6oRHaUFCsiajNcOnMPppteZUnt+USTZTsfJgSpG+0M1TUyzmxkRgwKpG888d
 B6qp0fHGhgXDDIiiIGB0MPd7KrcZpiPFe3HKjhqA+rGUFrZ4fQLkbKwfsxrelTKpHKqP
 H1k7mAt+8iE4TgIoTJ0MDCXpIdnQl/ao7T75ToXzdZCkhIN09FuTqxB+jNPnC3/tmPlx
 Yx0duVaDPT5dzIFe7wKGlb/ymN9YP1JQtq/wT2/QTL6KBO/BQVCUb09DzhL5q6ZpPiny
 WbH7HFuJq/zgZbsiGUB5fGtBxnI95dqpp1qsoUYxkncPmfkXV7FuagvS+ih5VhgLAuWH
 m+7w==
X-Gm-Message-State: AOJu0YygUU2vijNHEhWCR4X+R1o8ZW5Ji4D12NI7Si19PmhTy4Ls5o/u
 bopNTRDIFBhDqSl+CE8Y1oM+YFZS9cU9Qf2TrJg=
X-Google-Smtp-Source: AGHT+IFIEJ6+Y3AABnjlT88TDS+hrZZI40ZQR+mwVoIwUB8PBTlYZW13+Q77ElT1z645uJ2kimsHiQ==
X-Received: by 2002:a05:6602:3a0e:b0:799:2163:418a with SMTP id
 by14-20020a0566023a0e00b007992163418amr1830998iob.13.1694591696513; 
 Wed, 13 Sep 2023 00:54:56 -0700 (PDT)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com.
 [209.85.166.45]) by smtp.gmail.com with ESMTPSA id
 x5-20020a6bda05000000b0076373f90e46sm3354895iob.33.2023.09.13.00.54.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Sep 2023 00:54:55 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-79834a7a5d8so61077439f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 00:54:55 -0700 (PDT)
X-Received: by 2002:a05:6602:3281:b0:786:7100:72de with SMTP id
 d1-20020a056602328100b00786710072demr2263328ioz.16.1694591694827; Wed, 13 Sep
 2023 00:54:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230822132646.9811-1-jason-jh.lin@mediatek.com>
 <CAC=S1njUVqt969Wv+dMc5wD3Uyu-2Cm4qCUwkp7kfeG_uBbpVw@mail.gmail.com>
In-Reply-To: <CAC=S1njUVqt969Wv+dMc5wD3Uyu-2Cm4qCUwkp7kfeG_uBbpVw@mail.gmail.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 13 Sep 2023 15:54:18 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhhAevMct0SoipCRpVmHmMGEuvu2yKmkjuVVUpeZxZ5ug@mail.gmail.com>
Message-ID: <CAC=S1nhhAevMct0SoipCRpVmHmMGEuvu2yKmkjuVVUpeZxZ5ug@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Add spinlock for setting vblank event in
 atomic_begin
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
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
 Alexandre Mergnat <amergnat@baylibre.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, dri-devel@lists.freedesktop.org,
 Shawn Sung <shawn.sung@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 31, 2023 at 3:12=E2=80=AFPM Fei Shao <fshao@chromium.org> wrote=
:
>
> On Tue, Aug 22, 2023 at 10:27=E2=80=AFPM Jason-JH.Lin <jason-jh.lin@media=
tek.com> wrote:
> >
> > Add spinlock protection to avoid race condition on vblank event
> > between mtk_drm_crtc_atomic_begin() and mtk_drm_finish_page_flip().
> >
> > Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8=
173.")
> > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>
> Reviewed-by: Fei Shao <fshao@chromium.org>

Also, I verified that this fixes a real world system hang issue on the
MT8195 Chromebook.

Tested-by: Fei Shao <fshao@chromium.org>
