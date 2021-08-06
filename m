Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D40D83E2901
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 13:00:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D04EC6E17A;
	Fri,  6 Aug 2021 11:00:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60DE56E17A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 11:00:41 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 e2-20020a17090a4a02b029016f3020d867so17071992pjh.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Aug 2021 04:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bqezZ2/HwBTxC4hfR4A8RkBTbm8B6r0iUtltdIvH/WQ=;
 b=wPfCjiqa1MALuiJUaKW5iy1FtNfG6I7bAdM+tcLUlHzl2neknstN3PG01WGezIG4Wn
 AX67+2Wo1cV03hBdnAJyve/wr3U++Sv2+IO4fFRMwBMjg3MlY4LMXxnv9cUYr0J/w8ME
 l0Btb8iRsW/UikCqCHgTYoJAbfIOOSYrxH6UeL81fCtnPOMXF1pOCqAmkKk5chBEiw6Z
 yaTEYJbWUNoVt4HmP/4ut1Oa6QtRxGJUZVSJkrVVIiTdIOwLidoVSJUVDDptJehoEaTE
 KjoaWncKZEYbCPNeDiBQIxq744EGlx7PnATR24qZV2yaDdvpXGHuLHdVuLaLwuvlgthS
 ag0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bqezZ2/HwBTxC4hfR4A8RkBTbm8B6r0iUtltdIvH/WQ=;
 b=Z9FbI66lTkQgIPO6V8N9mjdpLYyJpoHGXfQhe2L0ODpg7ASBMxx7o5PLX5TaqVeB7y
 +WFMnQC6eODERGx+9tIaHrrm6+jBuA2uAhrlr8Pbo/7UuCzhWRFQByfEHtVrYu7fOq4b
 M2e+8V+3greMYgUUnr4CxqzBbfnsojMZ4qF4ZBW5Dx1vz86ZvfHPqREupfA+IFJYvQlC
 SKqVFOZsr8kS6Wr4SCWS8lvlWCYXG3HroxUry/EcPog3rUdZ32gyT+OTDfG/OTfJdE70
 C4Yl5aI4cxwJSnL+grY4OUznXfhDg4VumUFjT68KfBG+Ud8KyGA7Z+3KYu3fOs9It46K
 mw5g==
X-Gm-Message-State: AOAM531UHbfXYbyOOq516m7hzk5SmCRoLjTMDKtjYfIQdO5me9XfeDsJ
 mIagkBkYb3GozqfIQgjbPP93R0OTfnrhFzR/o2lzhw==
X-Google-Smtp-Source: ABdhPJx2mx/FDsh5/262RxdOPkT6ydnEP3Uh2S21vtAYPtUS+Wn/DcQtgQAbZX/mXgpJQMdt+fMf5UfYoS3PcG5G/uw=
X-Received: by 2002:a63:494f:: with SMTP id y15mr876560pgk.185.1628247641017; 
 Fri, 06 Aug 2021 04:00:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210806104407.2208538-1-xji@analogixsemi.com>
In-Reply-To: <20210806104407.2208538-1-xji@analogixsemi.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 6 Aug 2021 13:00:30 +0200
Message-ID: <CAG3jFyuB-PJc5S+jPiBH8_shyWR_05JTBiO802+tg+8RvBQUcg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: anx7625: Tune K value for IVO panel
To: Xin Ji <xji@analogixsemi.com>
Cc: Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Dan Carpenter <dan.carpenter@oracle.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Torsten Duwe <duwe@lst.de>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Bernie Liang <bliang@analogixsemi.com>, Qilin Wen <qwen@analogixsemi.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, devel@driverdev.osuosl.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next
