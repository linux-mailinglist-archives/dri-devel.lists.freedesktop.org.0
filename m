Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB10776F9B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 07:32:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F42F10E159;
	Thu, 10 Aug 2023 05:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1069110E0C6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 05:32:02 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-790fc019c62so14388139f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 22:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1691645522; x=1692250322;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=90vuit1vtETcc7ICm483dG4LoGioHBxHspT621cfQB0=;
 b=WJJogRNM6Mk8P3sdz8L3D0d80nJu2cpmp2YPfhgM77MzAqx9eFdDFbghqW6ZOkuWd6
 ohv6qZZkuNtUr18E2yqc2cLIo71iXRjEvDDYo7h+dzlXwoQa0RBN3WLJ9yF/PAsgp1MC
 LW6uQNaHXuBndssmA9PoIHV25ZFOoBAcsZStU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691645522; x=1692250322;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=90vuit1vtETcc7ICm483dG4LoGioHBxHspT621cfQB0=;
 b=YPz0N8B2prwisoAsu4jW64A7KP5n5PnAGI4z/MbVadviCdUYir4OuKhG5GhGr25LLh
 wLXR8EThGcq+LiDJspL+68yhUiFjE8Nobc3Eq8s3pKXDhi9Z00dVBF3MNzEnT8RAlYF6
 RdOlEuEzPSDrat5MtSz+uX6XH7JYV06hg89EO/YQUVPFC8FmX27IJhCBGrYbgrji0i0W
 laML0dRg6YZ9dtVqURxgmDcvJTl5qPwnpymyTjtoRMy4ARenjZ6QpeVHViC3exlEY8gE
 NMsOePhxhHvs/yqllYpfTAPmDjzsGBRQaz0hRYbWrJvqPJ4HOTCyxgNTLpBG1KPnYZa7
 6uzQ==
X-Gm-Message-State: AOJu0YxU2kp0f+cWb08+QFYmLLqfp9yFzCgotE8bNCsClmMGiu12nR4H
 tUYQjY48e7E8wD7ZrTmWRVKk0/7H4WEBC3CbovA=
X-Google-Smtp-Source: AGHT+IEtQ9RnIIIzOBNL9WuVAxz6bQNNu9lVTg9dAY+JMTX17WCmc0/llANa3yD3s6sT5SHly2gueQ==
X-Received: by 2002:a05:6602:2552:b0:790:aed5:d0b0 with SMTP id
 cg18-20020a056602255200b00790aed5d0b0mr1722611iob.0.1691645521695; 
 Wed, 09 Aug 2023 22:32:01 -0700 (PDT)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com.
 [209.85.166.49]) by smtp.gmail.com with ESMTPSA id
 e24-20020a6bf118000000b007871aa2f144sm246403iog.16.2023.08.09.22.32.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Aug 2023 22:32:00 -0700 (PDT)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-790fef20fafso42174739f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 22:32:00 -0700 (PDT)
X-Received: by 2002:a05:6602:2552:b0:790:aed5:d0b0 with SMTP id
 cg18-20020a056602255200b00790aed5d0b0mr1722545iob.0.1691645520345; Wed, 09
 Aug 2023 22:32:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230809181525.7561-1-jason-jh.lin@mediatek.com>
 <20230809181525.7561-2-jason-jh.lin@mediatek.com>
In-Reply-To: <20230809181525.7561-2-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 10 Aug 2023 13:31:23 +0800
X-Gmail-Original-Message-ID: <CAC=S1ng4UKNy2ZtJr1YUAtZ5M+A5DgRWt68ibKaW3ohwV6foTw@mail.gmail.com>
Message-ID: <CAC=S1ng4UKNy2ZtJr1YUAtZ5M+A5DgRWt68ibKaW3ohwV6foTw@mail.gmail.com>
Subject: Re: [PATCH v9 1/7] drm/mediatek: Add mmsys_dev_num to mt8188 vdosys0
 driver data
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
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, dri-devel@lists.freedesktop.org,
 Shawn Sung <shawn.sung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 10, 2023 at 2:35=E2=80=AFAM Jason-JH.Lin <jason-jh.lin@mediatek=
.com> wrote:
>
> Add missing mmsys_dev_num to mt8188 vdosys0 driver data.
>
> Fixes: 54b48080278a ("drm/mediatek: Add mediatek-drm of vdosys0 support f=
or mt8188")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Tested with MT8188 and the internal display is up and functioning.

Reviewed-by: Fei Shao <fshao@chromium.org>
Tested-by: Fei Shao <fshao@chromium.org>
