Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1415454F145
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 08:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF5311A7CD;
	Fri, 17 Jun 2022 06:56:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5AB211A7CD
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 06:56:44 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id b8so4920394edj.11
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 23:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sLhfCJ8PekgBeiM3KU80x7Qwq344wsuKnT/r+LcG2GM=;
 b=e7KAaUnuA0HYGg2Lg9mBPj3DrKLEvfZUjQBilNBT6iFsQwiChqYLbSFMpt1CZw49hu
 Uhh/Z4UzfmH1tgChFd4GYmJPuADEzaM36JeRF/stmNvDIRYGsPkJEfUx2gcYqjIzk+1Z
 4pTq/kEcbLMa+GGo+ioysby8f4NVMsOllC4QI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sLhfCJ8PekgBeiM3KU80x7Qwq344wsuKnT/r+LcG2GM=;
 b=HOoXU9V8QPOgBSLGjxkqlad3TCemhZOJRM5shXr+Jpla618nz9dZMwnyxTMGV3Ywu4
 HMtWJErDsmFFwjk9r1mk3leRT+BU5mG3RihLBQnIzIshVpIWfQ1YDeunCaR1x5BcqwW0
 Yj07mxuMYyDbIVQyDJY1RaAB+xqN7mCVAGjWLsOmfUFNRFNg6RTHuggd2mEFqdzGK48Y
 kF5HSgC+KetyqYtqLF3riqet4RImGwc91oeQ5Ztob8XKaUODSxEfL4Z5z4U3P8WDqK0G
 3khpe/daw2B+cHELuAUF5vgNgDnK+zqEEQJqfq5+pPOnRIqcIz82SyM3WW42vE6GGPyx
 XTHQ==
X-Gm-Message-State: AJIora9VnjNm9FHBXpX1pBIB3J4KJ3OXOEMhCPGCErdKwsBUbIFVu+it
 2qz05fSEJq0hILE91uV/S3G9MKR1N9yfoXRL+wkKkg==
X-Google-Smtp-Source: AGRyM1tIbRFLJsIG8ha9JMgB0N9ZCD+AhfPO/Aq8IF+A20gJm7k5xF0so9i5AD1klMG7BMMrL3Xu6QF5ZW0ApN7BiWc=
X-Received: by 2002:a05:6402:6cc:b0:42d:bd2d:9f82 with SMTP id
 n12-20020a05640206cc00b0042dbd2d9f82mr10669676edy.59.1655449003429; Thu, 16
 Jun 2022 23:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220617032113.18576-1-yunfei.dong@mediatek.com>
In-Reply-To: <20220617032113.18576-1-yunfei.dong@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Jun 2022 14:56:32 +0800
Message-ID: <CAGXv+5EZ+Mu1481gM9h0kgqO3a0xFKP8drvGv7gRp6=3NU2oKA@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Fix non subdev architecture open
 power fail
To: Yunfei Dong <yunfei.dong@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, Irui Wang <irui.wang@mediatek.com>,
 George Sun <george.sun@mediatek.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Tiffany Lin <tiffany.lin@mediatek.com>,
 Tomasz Figa <tfiga@google.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Courbot <acourbot@chromium.org>, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 17, 2022 at 11:21 AM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> According to subdev_bitmap bit value to open hardware power, need to
> set subdev_bitmap value for non subdev architecture.
>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Fixes: c05bada35f01 ("media: mtk-vcodec: Add to support multi hardware decode")

?

ChenYu
