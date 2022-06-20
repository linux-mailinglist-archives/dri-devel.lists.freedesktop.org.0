Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A57550FAE
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 07:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD0C112088;
	Mon, 20 Jun 2022 05:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19684112088
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 05:25:35 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id o10so13498602edi.1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 22:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iTyxMGysFvLVjw1ty4gwMbVdKBXhcL1xQssE1M7jQRs=;
 b=hr/i+COcpVsTSVEVRXmn8BToF7wohakO0101jRn9kRrjM38xXFv36ueZmUYFeF7tMs
 MhQf0KBvD+ufRlJDSD8p+HhwOg1IatNHX5ROaL5G3WIA4Bc/XVrN1sotSR3iUwscYf9w
 zs6/fyN9LhYXinNOiVjFzKY1HepGVgu2Gb5jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iTyxMGysFvLVjw1ty4gwMbVdKBXhcL1xQssE1M7jQRs=;
 b=bj3wazXZyij8shqtd4t2/ek4ByK9QHfoyVyYCgB2W+iRxI3RwfOQ8NPpVwFWjtmcvM
 LV7ET1KB3NiGGLcWios7EpAeeakChfQuNzM3Brjof4AwDNdbxVZxv2VuvV16RJBK6x2R
 BKuboGkEuezZfr1OU5ShwO6VciOjVzNoBUCTI47bKdy1UH/niIxvYGcg5LOi6gzt8Zb6
 j+S5B+MKsqYsDzlLXGUhyASmvkixbujYmy3FZt+Z8tmgw+QjYt/tCcEqHXrRu2Hl96sP
 ahLHwWl8pWG6iZUFKdtgONRPwNWaasPhrSiPwA6B7tfg0897RzyLQx+zgG/0di0bLQ4i
 GFvQ==
X-Gm-Message-State: AJIora/TXaALeKm64Tix9KzpX/kM/QzMYUFRlETHDo/vRm+3adEVc5cg
 HweqppBSlpgkfktJKJdl8p0+j1K9FjAM3E1OnqAGlA==
X-Google-Smtp-Source: AGRyM1ve6GEVbjnEdneKcnH6buKWIMD7xtxtHnE/K2tR9nDrr6cM5g2g7pzOhyL1GqvCL7sj+U4/HpOoO6q4bsSD2TU=
X-Received: by 2002:a05:6402:4303:b0:435:833a:16ed with SMTP id
 m3-20020a056402430300b00435833a16edmr2517462edc.248.1655702733588; Sun, 19
 Jun 2022 22:25:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220618072929.28783-1-yunfei.dong@mediatek.com>
 <CAGXv+5EFkZ6-bvu68dV4hr795+N3tAwbXYg5WCJp+Zd+pf1Aqw@mail.gmail.com>
In-Reply-To: <CAGXv+5EFkZ6-bvu68dV4hr795+N3tAwbXYg5WCJp+Zd+pf1Aqw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 20 Jun 2022 13:25:22 +0800
Message-ID: <CAGXv+5E2wULkB7_u_H7jFAi6Jk2AvUcfOJdzOp_5m2b4n3shww@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Initialize decoder parameters
 after getting dec_capability
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
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
 devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tomasz Figa <tfiga@google.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 20, 2022 at 12:54 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Sat, Jun 18, 2022 at 3:29 PM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
> >
> > Need to get dec_capability from scp first, then initialize decoder
> > supported format and other parameters according to dec_capability value.
> >
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Tested on MT8183 on mainline 20220617-next with the vcodec-dec DT node
> copied from the ChromeOS v5.10 kernel.
>
> This fixes an issue where the first attempt to enumerate formats on the
> device right after boot returns an empty list.

BTW, this should have a Fixes tag.

Either

Fixes: 7a7ae26fd458 ("media: mediatek: vcodec: support stateless VP8 decoding")

which looks like the first instance of when firmware capability really is
considered, or

Fixes: fd00d90330d1 ("media: mtk-vcodec: vdec: move stateful ops into
their own file")

which matches when ctx->dev->vdec_pdata->init_vdec_params(ctx) was first added.


ChenYu
