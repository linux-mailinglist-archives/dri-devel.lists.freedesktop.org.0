Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4627B57F997
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 08:46:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7397D10ECD9;
	Mon, 25 Jul 2022 06:46:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D8310ECD9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 06:46:50 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id b143so17182607yba.11
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jul 2022 23:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a+LHD1Eh7R5NFEh/i7at+5wk7Eyhd6qFs5js/UI+dUc=;
 b=Ibr9q1wIeBGws91HK3qdE1+wGQ7t0MkwzuOm1Xb3FnQkzuTRYcgaObgz8ynZLO2q52
 PA+10trsRKvarVn64dlNZzx6SdntY3tG6R7uP/a3yZTiEgS5/BXsZAPxKqmDTwjgXyyv
 GeBSJ75Ea/cEKXAv60Z9TTrJB0U/3a9uxk09g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a+LHD1Eh7R5NFEh/i7at+5wk7Eyhd6qFs5js/UI+dUc=;
 b=BpcuGvy/qpdCB6ZP4dC2Qfw68WviI+fDSVe6AFuHw7/CgUKFSOEHrXRXuvuml/KgQG
 PuFTKzXtLz1QIuriMmoszp7lL4Ums656M87e8EzfpZ/UABZaHZ+0WsdZeu4THLm44st2
 YgNR58VW0r3Ob8kHm2z0xxcrk7BJiA9Vg57agE52NgzvQCIM2r860OFBxMoP8YqX7m94
 49RWHq9Y42dDbhpzpn3tkN+AS6wzuKo7ThuAG3fgJhzlx0tO62vNjveIdH6puoFxnQn9
 tosAg1Rpr8zwXVu1cfxtGgoI37DM1XRC9zDjbAfR1ymVx88Rn3ANoMvMWqMe6ILxnqHi
 qLpw==
X-Gm-Message-State: AJIora/nn71BEc70U+ih8S3mIKynksYXOrBx2iS5+BF3DFfSJRJrC1E4
 FBOlZxW/6xomIxbyRAxVHTD1XpUqt7laPuuums9dFg==
X-Google-Smtp-Source: AGRyM1vJ0Mmq3F2lfrUDVjqxtvHQmzaTShK7/xuF4iFq5a9n1GXpZWltqxF+0o4P2HADFPt1FvB99qvJNv/yVZEJkrQ=
X-Received: by 2002:a25:640c:0:b0:670:91a0:57e3 with SMTP id
 y12-20020a25640c000000b0067091a057e3mr8294122ybb.204.1658731610056; Sun, 24
 Jul 2022 23:46:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220721172727.14624-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220721172727.14624-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 25 Jul 2022 14:46:39 +0800
Message-ID: <CAGXv+5GyOjMxsmP24e-oUMJxhpV_UO_=c6RjCPf60MKn+SNiYA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: dsi: Add atomic {destroy, duplicate}_state, 
 reset callbacks
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: chunkuang.hu@kernel.org, jitao.shi@mediatek.com, xinlei.lee@mediatek.com,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, rex-bc.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 22, 2022 at 1:27 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add callbacks for atomic_destroy_state, atomic_duplicate_state and
> atomic_reset to restore functionality of the DSI driver: this solves
> vblank timeouts when another bridge is present in the chain.
>
> Tested bridge chain: DSI <=> ANX7625 => aux-bus panel
>
> Fixes: 7f6335c6a258 ("drm/mediatek: Modify dsi funcs to atomic operations")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

on top of next-20220722 with additional DTSI changes for display related
device nodes [1] and modification to mt8192-asurada.dtsi to enable internal
display.

[1] https://lore.kernel.org/linux-mediatek/20220712114046.15574-1-allen-kh.cheng@mediatek.com/
