Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A58767A9B3D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 20:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E142510E5EB;
	Thu, 21 Sep 2023 18:56:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D0F10E5EB
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 18:56:31 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c008d8fd07so22449841fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 11:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695322588; x=1695927388;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3qMZGPaiZgAdeetgQNbPZflVmvG6j0/UMJZSOWqoH/Y=;
 b=etQe0fo0Ee1seNrrGaKAQLUV6qLItFupj1ZFRmJC1Xo6aDn/Afng+Z85zfdiuDu5fA
 DzeOH4VaVBJ7Pxe69oquD+IRumELgffiQjt6ytcmUxjQgT7rZm+ODme9z7I7XM7Qyf18
 SFBMwgjSq6NGg2+QFEhGwWPAwPSJlMZJxgvf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695322588; x=1695927388;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3qMZGPaiZgAdeetgQNbPZflVmvG6j0/UMJZSOWqoH/Y=;
 b=E5IxaUQ1C7vpC4JBWlQZPzQizTlUGMIu4yy3LgGr2MOwMORGK+X/o9GdckZxosPsCj
 zF7C8qE12Q90GQW0EL9H7NRv3YHsC8Cq8Sjf3OOX3usPcBJunm/Y6wcB891jDTYKDlVp
 pW35rKLIw8vpNFL8i5Pfxw1DO3qT/lc8k3w/73ljKg0SGrhTeNAQLXDVXRp8vcFvtHsd
 9KzYEnXtzH/sX6JCcKUaR20ZP9RsuYMqF8fuzGJ2clLgEBlNbt55HMBLI3+089B6bKDz
 jo6qG1fk/F6d5xsaVb5JvEqpWkhm5m6D1h+y4ztWZhNkCLZid040nK1IXCzpMbX29rnY
 9rqg==
X-Gm-Message-State: AOJu0Yzz1oWsmCrBR9egArl9b89u2YGX0fHs+VNhQMzl/+iPLYKDwdzY
 U2c5GD2wPQ0btbr85MqO4iyqGWQky7uRuWWmzHsTkhBs
X-Google-Smtp-Source: AGHT+IF3Sm43i8KVvhQW2pw/3PTHPkrnjABOdi5p3UsC6nf2Qgynjsk3qUpFds1d9kBieT/GHdkYMQ==
X-Received: by 2002:a2e:985a:0:b0:2c0:18e0:708a with SMTP id
 e26-20020a2e985a000000b002c018e0708amr5455147ljj.46.1695322588566; 
 Thu, 21 Sep 2023 11:56:28 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46]) by smtp.gmail.com with ESMTPSA id
 kt22-20020a170906aad600b0099cf9bf4c98sm1467268ejb.8.2023.09.21.11.56.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 11:56:28 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4009fdc224dso23495e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 11:56:28 -0700 (PDT)
X-Received: by 2002:a05:600c:1da1:b0:404:7462:1f87 with SMTP id
 p33-20020a05600c1da100b0040474621f87mr125460wms.6.1695322143955; Thu, 21 Sep
 2023 11:49:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230901234015.566018-1-dianders@chromium.org>
 <20230901163944.RFT.6.I21e0916bbd276033f7d31979c0da171458dedd4d@changeid>
In-Reply-To: <20230901163944.RFT.6.I21e0916bbd276033f7d31979c0da171458dedd4d@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 21 Sep 2023 11:48:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X87dWnp+sOQBUG=Mx6_YrD5BbDxHWJjE08_k378T+aAw@mail.gmail.com>
Message-ID: <CAD=FV=X87dWnp+sOQBUG=Mx6_YrD5BbDxHWJjE08_k378T+aAw@mail.gmail.com>
Subject: Re: [RFT PATCH 6/6] drm/hisilicon/kirin: Call
 drm_atomic_helper_shutdown() at shutdown/unbind time
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
Cc: yongqin.liu@linaro.org, tzimmermann@suse.de, xinliang.liu@linaro.org,
 javierm@redhat.com, linux-kernel@vger.kernel.org,
 kong.kongxinwei@hisilicon.com, jstultz@google.com,
 u.kleine-koenig@pengutronix.de, tiantao6@hisilicon.com, steven.price@arm.com,
 sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Sep 1, 2023 at 4:41=E2=80=AFPM Douglas Anderson <dianders@chromium.=
org> wrote:
>
> Based on grepping through the source code this driver appears to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown time
> and at driver unbind time. Among other things, this means that if a
> panel is in use that it won't be cleanly powered off at system
> shutdown time.
>
> The fact that we should call drm_atomic_helper_shutdown() in the case
> of OS shutdown/restart and at driver remove (or unbind) time comes
> straight out of the kernel doc "driver instance overview" in
> drm_drv.c.
>
> I have attempted to put this in the right place at unbind time. In
> most other DRM drivers the call is made right after the call to
> drm_kms_helper_poll_fini(), so I've put it there. That means that this
> call will also be made in the case that we hit errors in bind, since
> kirin_drm_kms_cleanup() is called both in the bind error path and in
> unbind. I believe this is harmless even though it's not needed in the
> bind error path.
>
> For handling shutdown, we rely on the common technique of seeing if
> the drvdata is NULL to know whether we need to call
> drm_atomic_helper_shutdown(). This makes it important to make sure
> that the drvdata is NULL if bind failed or if unbind was called. We
> don't need the actual check for NULL and we'll rely on the patch
> ("drm/atomic-helper: drm_atomic_helper_shutdown(NULL) should be a
> noop").
>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> This commit is only compile-time tested.
>
>  drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Landed in drm-misc-next:

918ce0906dcd drm/hisilicon/kirin: Call drm_atomic_helper_shutdown() at
shutdown/unbind time
