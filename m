Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E90A539770
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 22:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C6310E24E;
	Tue, 31 May 2022 20:00:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F36610E24E
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 20:00:15 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id rs12so28653831ejb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 13:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N/5hFp0lMWC4dYsgyS8F7d3AZ1PIyvtWlhq+Sm07wFE=;
 b=BfAzztMNm1Jp/TdVi0t4iVReEv4ID5XLse+uh2O08vd5p45IIiN2ru9VwuJU6Um5Nv
 0qh6aXb3IQyqKe5AJz5SZ3TUw59Bs/A9IZpkkj26xiglqeckNDZL6KrBNR2L9m0gzOW9
 xN8FWpowprhXG7MbtRfuG5IEYYtXp1UOcQ2cjuare7jC91K6A1IVfw9NE4TttMwgjjjN
 mkiznqExdK01IwGOBpobCBk5lXWvmApbyMdx+Zp6iOQuLn696fC3m+i1EsKvqenaRQXY
 jia0fUobMIA/yV+n357zIRHHq3K9HD5P47G3l49XAHkYdD/+A/ITVdWhi2yroIFq60s2
 mgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N/5hFp0lMWC4dYsgyS8F7d3AZ1PIyvtWlhq+Sm07wFE=;
 b=Kju3YWb9mILBV9DqSIBN+zUhQ3mNv9P2boZWnMRqCYnrIUrPIDI5RCEJCwTjhm2VyB
 PozpOOFs/CcDptfDoI4OXSGCIw9b+9hryLZ6362RZ2d/gznBsUE3fAaWMIFENRHGm1y8
 6V7O671d+28jOqTjOv5Wjcqb3SRYUhF/SnvDdSuV0pRSE3JPAsPKN44DAjrZNR7zAeFW
 F14UyH1WRHZUJDjZtjGpxLzO1wl8mPczHm1FLIbmjHSvJdTdQ1wqDTAKeeE0W1TjMMVJ
 PXQ1RHCwp7919GX9rjOo+vY+m8sYmKe5mMFo8E0w1lJB8OhykeyBAMfVjG67vUteZnTx
 O8Dw==
X-Gm-Message-State: AOAM533BAdlbab5jSdghjwu+W9CjFvANew3b1GveqPWeEnWRNr5jevVF
 9fqU6+KgM4Vu17VGcDBgtHeCXi1GzspI0B+f2dv7g9t16Jc=
X-Google-Smtp-Source: ABdhPJy10QXI2/ZkHtl9TZrO9ctuZkG39qUaTuGRRuWnMdaywHiIXFoOLxMbU2TIJIGuNyp5YTDWSwDcDQgsRT5WYgM=
X-Received: by 2002:a17:907:381:b0:6fe:9ca8:c4b4 with SMTP id
 ss1-20020a170907038100b006fe9ca8c4b4mr52565612ejb.147.1654027203570; Tue, 31
 May 2022 13:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220531144818.26943-1-linmq006@gmail.com>
In-Reply-To: <20220531144818.26943-1-linmq006@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 31 May 2022 21:59:52 +0200
Message-ID: <CAFBinCDrnUXS+djchc=68jPVZwqbgPcJy6WKFus7L3JKTSsdZg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/meson: encoder_cvbs: Fix refcount leak in
 meson_encoder_cvbs_init
To: Miaoqian Lin <linmq006@gmail.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 31, 2022 at 4:49 PM Miaoqian Lin <linmq006@gmail.com> wrote:
>
> of_graph_get_remote_node() returns remote device nodepointer with
> refcount incremented, we should use of_node_put() on it when done.
> Add missing of_node_put() to avoid refcount leak.
>
> Fixes: 318ba02cd8a8 ("drm/meson: encoder_cvbs: switch to bridge with ATTACH_NO_CONNECTOR")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
