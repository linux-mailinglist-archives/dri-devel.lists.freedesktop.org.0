Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9810550F8A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 06:54:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD0A10F3C7;
	Mon, 20 Jun 2022 04:54:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5530F10EB3B
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 04:54:25 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id o10so13432676edi.1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 21:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mukyLCtBBbCJ6QLdWGYeYZEZ9YqINwpy/ZdfkORqBZE=;
 b=UKNKFhdL+7ivgne6rJC21mSSfiaLKZHX9yoOuIh9UmqiDzzaewQHD7yYJipRMbN5SI
 sqMO9Scex5fT2OG4s3idcHiBshzVzr83BQRiz9MclD5AgLHLh9ef6R0EaL7PWErhcE/g
 wKYAz5furNCnzUMXK/fAv/VmQ0Psdwl6aMHDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mukyLCtBBbCJ6QLdWGYeYZEZ9YqINwpy/ZdfkORqBZE=;
 b=sUgviuFOzupktGiuOY7SoTCXVoN7hKFlDlxlEWUg3IFBx+kOA2LHMfZs8DycPYWwA0
 jjDBlwgsKVmeg1fTN+VvgKl8etMhDW+t0/Iw0GYo3hO9NMEI7dm8L8jevZ1KNw6mJ8/i
 bulcaNqTcHvAAVVeXYd48xc2aNuuI41Cv2sPs69zPhqwTUbUnleZy8SfvFq628zv+BAk
 wUDZBoA/ocxiSwGP8Y+mgMRlVWSMx1ObFGTlAr96ATShHRZysHrhhwuqLruSosCGobXF
 3rUiL9hWu4dpFir8vx7k3GzIEIrwoIIfrd9jDmE5ttxZ73snjcl9b+UNmHB/yA4HOBlo
 udZQ==
X-Gm-Message-State: AJIora8Ev9COYU7BmbQzbUbEsmBKiREiy8f7/CRgBmW89aZkw3FYzbmc
 aDFkm1zQRsN/Bmw3fTDCOSXoc3BdJET++fFIFIDK5A==
X-Google-Smtp-Source: AGRyM1uRThNT8XmE57SQVNixL8TMkzT1S2u9lzIBzMfvygATaLlCkuFrLWUz2Cy72NYhPuNYT7dU009axLMuI9/ox2A=
X-Received: by 2002:a05:6402:3785:b0:435:5d0e:2a2e with SMTP id
 et5-20020a056402378500b004355d0e2a2emr19724945edb.307.1655700863894; Sun, 19
 Jun 2022 21:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220618072929.28783-1-yunfei.dong@mediatek.com>
In-Reply-To: <20220618072929.28783-1-yunfei.dong@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 20 Jun 2022 12:54:12 +0800
Message-ID: <CAGXv+5EFkZ6-bvu68dV4hr795+N3tAwbXYg5WCJp+Zd+pf1Aqw@mail.gmail.com>
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

On Sat, Jun 18, 2022 at 3:29 PM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> Need to get dec_capability from scp first, then initialize decoder
> supported format and other parameters according to dec_capability value.
>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

Tested on MT8183 on mainline 20220617-next with the vcodec-dec DT node
copied from the ChromeOS v5.10 kernel.

This fixes an issue where the first attempt to enumerate formats on the
device right after boot returns an empty list.
