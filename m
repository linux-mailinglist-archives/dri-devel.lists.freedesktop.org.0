Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 563B47A9AA8
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 20:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6701410E2A4;
	Thu, 21 Sep 2023 18:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75EB10E2A4
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 18:46:55 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-99bdcade7fbso155911066b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 11:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695322014; x=1695926814;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oGNO3fxjlHQ6BuBtNnDhbEjBaZDga+bo39FJcPPhcUQ=;
 b=X9mEtrpY8dJaovSoQ2D0CG+XhsP5xm2M+VbXHSBBHwHCqGXwlmoPbDDJE3ZJEvPp+b
 tzjjTWADfAwnS5Csx/wWto3QZY1OW4sYaxtSa1X7d96JbaYsrI2yNA2Gdyrh25s6xfAn
 ua7qGr/W0qSpAgxpv3qOnKRRTaAaRToH+1M6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695322014; x=1695926814;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oGNO3fxjlHQ6BuBtNnDhbEjBaZDga+bo39FJcPPhcUQ=;
 b=BpRi8f39PsiBfNuxdyEL33ml7PWvbaD1XxEtx/xnvQhby745iBgLRtvfMGpMVma6Fg
 3mG2G2YXUHOTcai2Hck3djpcpLlMJyFysPMtUDaQp4Rp45vpnEf5+KUXfEq8s1Pj8e6D
 qcAwWWZ4nIVDrH1UlvrYc60c0o4VlgH587vVmvev7OItqBdYfrTLacsV6Dqr4GKGi33X
 /+C37AOlbkywnDwwJ/O9izKHtEvBNkWiCXcQ30LDJWSxszgRaMIPzMRUC5TioaBqLt48
 zgRgcfI+CAI3/WrqzPoNddPbNdNpAkyDV15Q1b5fdW05TRHFyqDw3A4rtzv7Aw8JywW5
 7FCQ==
X-Gm-Message-State: AOJu0Ywe2ZGljJPr+HmhVGJZ2TbJ3LCKIfIay3u4EqtB902NPIFHwFzV
 /fYlzVBujNUqatC0XWcUrtsQdCgPq1vUjvFuh0sXFg==
X-Google-Smtp-Source: AGHT+IGYMz7duQvCpl9TbQuk1yp101Hik2NbMQuo33EwpEMMFyslSz4KdZHy3/43J300gncD0petzw==
X-Received: by 2002:a17:907:2e0d:b0:9ae:6a60:81a2 with SMTP id
 ig13-20020a1709072e0d00b009ae6a6081a2mr1499502ejc.25.1695322013819; 
 Thu, 21 Sep 2023 11:46:53 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com.
 [209.85.128.54]) by smtp.gmail.com with ESMTPSA id
 y16-20020a1709064b1000b009adc7733f98sm1452117eju.97.2023.09.21.11.46.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 11:46:53 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-405290ab4b6so23305e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 11:46:53 -0700 (PDT)
X-Received: by 2002:a05:600c:d3:b0:405:38d1:e146 with SMTP id
 u19-20020a05600c00d300b0040538d1e146mr59361wmm.4.1695322013017; Thu, 21 Sep
 2023 11:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230901234015.566018-1-dianders@chromium.org>
 <20230901163944.RFT.3.I10dbe099fb1059d304ba847d19fc45054f7ffe9f@changeid>
In-Reply-To: <20230901163944.RFT.3.I10dbe099fb1059d304ba847d19fc45054f7ffe9f@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 21 Sep 2023 11:46:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VTDuvjD8t8amWg=4r8=z3EhnbVms1DcskmYNX8sG4-kw@mail.gmail.com>
Message-ID: <CAD=FV=VTDuvjD8t8amWg=4r8=z3EhnbVms1DcskmYNX8sG4-kw@mail.gmail.com>
Subject: Re: [RFT PATCH 3/6] drm/vc4: Call drm_atomic_helper_shutdown() at
 shutdown time
To: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
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
Cc: emma@anholt.net, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Sep 1, 2023 at 4:40=E2=80=AFPM Douglas Anderson <dianders@chromium.=
org> wrote:
>
> Based on grepping through the source code these drivers appear to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown
> time. Among other things, this means that if a panel is in use that it
> won't be cleanly powered off at system shutdown time.
>
> The fact that we should call drm_atomic_helper_shutdown() in the case
> of OS shutdown/restart comes straight out of the kernel doc "driver
> instance overview" in drm_drv.c.
>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> This commit is only compile-time tested.
>
> Though this patch could be squashed into the patch ("drm: Call
> drm_atomic_helper_shutdown() at shutdown time for misc drivers"), I
> kept it separate to call attention to this driver. While writing this
> patch, I noticed that the bind() function is using "devm" and thus
> assumes it doesn't need to do much explicit error handling. That's
> actually a bug. As per kernel docs [1] "the lifetime of the aggregate
> driver does not align with any of the underlying struct device
> instances. Therefore devm cannot be used and all resources acquired or
> allocated in this callback must be explicitly released in the unbind
> callback". Fixing that is outside the scope of this commit.
>
> [1] https://docs.kernel.org/driver-api/component.html
>
>  drivers/gpu/drm/vc4/vc4_drv.c | 36 ++++++++++++++++++++++-------------
>  1 file changed, 23 insertions(+), 13 deletions(-)

Landed to drm-misc-next:

013d382d11a2 drm/vc4: Call drm_atomic_helper_shutdown() at shutdown time
