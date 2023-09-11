Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB3C79AAD1
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 20:29:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEBC010E34A;
	Mon, 11 Sep 2023 18:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24FD410E34A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 18:29:29 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-402c80b71ecso15605e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 11:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1694456967; x=1695061767;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sVbKwjvYsKayRQfQqnfoMhqs1+0fnsR+3Q13ar61kcQ=;
 b=RFACYECDlfz4XPIuQuqhATW/Xlop7AWfbJ9U6071nFSlXEk1h3aI0rBZaC7bfFDosH
 qBjiK/IIvEzR2zpLqPastqHcxRbal7Gfqq/TdzHCPF/4kKUMwh0oQHgZVRQPAoQr7YLU
 z1oavLt483CQW57zQwL12BrnM4PvDUUs1YeUktIFwE4D+lNse7FYgIJizI6RcqlQ9OYq
 LhFMA1RbYGun+nv1tC25TgfTaRUljk1ODwWGvSX/Vxi8H0xn+BpkqE5wqDwNcOWUCZ2m
 ZXG9NtuS/+7SU+OlwEySbLrLwS1vj9mzKbk5BiiVo0+PlGAXnToIg+EfjWbqrLX8qL3N
 +dVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694456967; x=1695061767;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sVbKwjvYsKayRQfQqnfoMhqs1+0fnsR+3Q13ar61kcQ=;
 b=CUXSR9YDbWEhlc/8bZIsVwUlFeDaUeM7FSobkFPMoIrIxqfLEPw4W2OprPLKfAdII7
 QfH1yiKtzhWN9nPxKQIl44Xce4KhVFAyfeIohLpgM7mWB8Nek2jLrG84BGzFgV72E+EE
 R4KFWB5vqUUIqExMAiAll0WYgsy/RKjM+h8jWNJMZBg6EWFfdedzIr5NmfHSVGD2XaEF
 a1UvrtfP06D6m1351IOAqkRVA/RSnhjBwfZllFN2KoRkoADOFKL7decL8rvdWBhgdpP6
 7C+0CDK2SNd4I2QuniEi2X2lLlBXVkezSHJnKl5HWilT2umB3iKaQg8pEPfThczHMAL8
 rT2g==
X-Gm-Message-State: AOJu0Yx0Ihv/OUnbsgF+ll8t2xTM/C4yPkPcl/mGCcHlDMkvw2wLfJGY
 1fK8GYSIZZY1fayPJZlnlo1+E0ZzQscdwzTHmTW6
X-Google-Smtp-Source: AGHT+IEip61urvwgkKVc4TSjTz4WJ07S5AZ9xWSZrK/2bf3DpFU4C+CemgJRrVeWgKwkbH4wpHkmoqEHFh/enFx67/Q=
X-Received: by 2002:a05:600c:5122:b0:400:c6de:6a20 with SMTP id
 o34-20020a05600c512200b00400c6de6a20mr18298wms.3.1694456967402; Mon, 11 Sep
 2023 11:29:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-4-yong.wu@mediatek.com>
 <803846bc-fd1d-d2ec-2855-456af22c82f8@amd.com>
In-Reply-To: <803846bc-fd1d-d2ec-2855-456af22c82f8@amd.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 11 Sep 2023 11:29:15 -0700
Message-ID: <CANDhNCrQyiFZ+8DnG0iyKBXC0H1698K1a9d2AxOq4whDsZBn+Q@mail.gmail.com>
Subject: Re: [PATCH 3/9] dma-heap: Provide accessors so that in-kernel drivers
 can allocate dmabufs from specific heaps
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 jianjiao.zeng@mediatek.com,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, tjmercier@google.com,
 linux-media@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Yong Wu <yong.wu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 11, 2023 at 3:14=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
> Am 11.09.23 um 04:30 schrieb Yong Wu:
> > From: John Stultz <jstultz@google.com>
> >
> > This allows drivers who don't want to create their own
> > DMA-BUF exporter to be able to allocate DMA-BUFs directly
> > from existing DMA-BUF Heaps.
> >
> > There is some concern that the premise of DMA-BUF heaps is
> > that userland knows better about what type of heap memory
> > is needed for a pipeline, so it would likely be best for
> > drivers to import and fill DMA-BUFs allocated by userland
> > instead of allocating one themselves, but this is still
> > up for debate.
>
> The main design goal of having DMA-heaps in the first place is to avoid
> per driver allocation and this is not necessary because userland know
> better what type of memory it wants.
>
> The background is rather that we generally want to decouple allocation
> from having a device driver connection so that we have better chance
> that multiple devices can work with the same memory.

Yep, very much agreed, and this is what the comment above is trying to desc=
ribe.

Ideally user-allocated buffers would be used to ensure driver's don't
create buffers with constraints that limit which devices the buffers
might later be shared with.

However, this patch was created as a hold-over from the old ION logic
to help vendors transition to dmabuf heaps, as vendors had situations
where they still wanted to export dmabufs that were not to be
generally shared and folks wanted to avoid duplication of logic
already in existing heaps.  At the time, I never pushed it upstream as
there were no upstream users.  But I think if there is now a potential
upstream user, it's worth having the discussion to better understand
the need.

So I think this patch is a little confusing in this series, as I don't
see much of it actually being used here (though forgive me if I'm
missing it).

Instead, It seems it get used in a separate patch series here:
  https://lore.kernel.org/all/20230911125936.10648-1-yunfei.dong@mediatek.c=
om/

Yong, I appreciate you sending this out! But maybe if the secure heap
submission doesn't depend on this functionality, I might suggest
moving this patch (or at least the majority of it) to be part of the
vcodec series instead?  That way reviewers will have more context for
how the code being added is used?

thanks
-john
