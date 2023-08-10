Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C42776FB3
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 07:43:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241A010E15A;
	Thu, 10 Aug 2023 05:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5F910E15A
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 05:43:17 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7878e573827so17690539f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 22:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1691646197; x=1692250997;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sP2WNJmHGIojwtQNcqjJWegFiViuW7cigU9WfO1EE3Q=;
 b=J9GRbINtJZ1U7q1Z8bNomXairU+CRVjznqa7I/Rwr41NQ6ZhIEHW6cmx9dJK7gm6FI
 ZU6KLdv1FVl0QOz3tTXoBkf417djpOYMvuGlrxD42RT6aNiOtCUOsXfFEdt0tDxMuE1b
 fVEuh6ds+gNjdJcMFmDVy2UmO5N/gdhxyqJ/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691646197; x=1692250997;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sP2WNJmHGIojwtQNcqjJWegFiViuW7cigU9WfO1EE3Q=;
 b=ZlVX4008W4DQLzhlccZPekXEy0QbHo4ysYt9r7+Wm4XuGS+HSIsh2P+dx4X3kpQ+Px
 DwMsQhKbvJJwOSh1B43NdLmAq8Xj9krP7UoY2LEGn+WRB9AE7EbiHacLmwW2QZz5OCBm
 V738E19s9zhuzisNH1IE+RqQxxIjR/SZHJPWAKb/TyfM17flJ3rSjR6Jy7ZZJMNy+d9E
 pKlu3VBzt3egJU6KFaEfkL6uKeNSJ+17etAV6QRk2uNhTgZo8+fezIJtAFclZaLMLcqX
 v0VjCI+RWWMM/Iy6EZpFDveK8G2zhiExpwluVzi9JofaRsvRrIx3SXUSswMKsnGkpJho
 juQg==
X-Gm-Message-State: AOJu0Yxu/1GbrSu2PzPni23xEBLSoeFTlnma5jEADjbv0kTmDnmIvDSj
 1wgNRlrUm7mJXfR3NhogshsI23I750McDZ4mXGs=
X-Google-Smtp-Source: AGHT+IFVZu/tXbB5g0Y9gLiHeIB4PuLlyhriq0NH4xchq14hgotNewdG6+UKjV3XeHQMt/b0eS64rg==
X-Received: by 2002:a05:6e02:11b4:b0:349:851b:3e5a with SMTP id
 20-20020a056e0211b400b00349851b3e5amr1520487ilj.15.1691646196929; 
 Wed, 09 Aug 2023 22:43:16 -0700 (PDT)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com.
 [209.85.166.50]) by smtp.gmail.com with ESMTPSA id
 c13-20020a92dc8d000000b00345b34fcf34sm222705iln.38.2023.08.09.22.43.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Aug 2023 22:43:16 -0700 (PDT)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-7878e573827so17690239f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 22:43:16 -0700 (PDT)
X-Received: by 2002:a05:6602:20c2:b0:787:1c51:ff99 with SMTP id
 2-20020a05660220c200b007871c51ff99mr2004510ioz.11.1691646196046; Wed, 09 Aug
 2023 22:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230809181525.7561-1-jason-jh.lin@mediatek.com>
 <20230809181525.7561-5-jason-jh.lin@mediatek.com>
In-Reply-To: <20230809181525.7561-5-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 10 Aug 2023 13:42:39 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngxyACUvMXTu5ZDwiLJ=ZzDXMMiVVhNr_Kjv3rxsX5gGQ@mail.gmail.com>
Message-ID: <CAC=S1ngxyACUvMXTu5ZDwiLJ=ZzDXMMiVVhNr_Kjv3rxsX5gGQ@mail.gmail.com>
Subject: Re: [PATCH v9 4/7] drm/mediatek: Add encoder_index function to
 mtk_ddp_comp_funcs for dpi
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

On Thu, Aug 10, 2023 at 2:15=E2=80=AFAM Jason-JH.Lin <jason-jh.lin@mediatek=
.com> wrote:
>
> To support dynamic connector selection function, each ddp_comp need to
> get their encoder_index to identify which connector should be selected.
>
> Add encoder_index function to mtk_ddp_comp_funcs and the implementation
> of mtk_dpi_encoder_index to get its encoder_index.
>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: Fei Shao <fshao@chromium.org>
Tested-by: Fei Shao <fshao@chromium.org>
