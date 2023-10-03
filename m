Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F717B5E3E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 02:32:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC62110E141;
	Tue,  3 Oct 2023 00:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0DA10E141
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 00:32:01 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50573e85ee0so349822e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Oct 2023 17:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1696293118; x=1696897918;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iO9eQroF7O4wqoRvgq0RaFH1dV9uh3sUuUFRmWyQ7SM=;
 b=Gz9C0ZPFsDQxd1jEid1hXNGgIQjalW7UuxWYMkkTRkY9r6h8Zma9JC5j6VEYQB1GIR
 gBl7g4+i/BPsgoSf+xL8coPCwlp80meDNpw2FaXYQ7/hGl0x7baACqkuxb7ltbki1hXz
 P6ge+t9mI0fHUCiz2zxZ/XLeTTSWmx5apriF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696293118; x=1696897918;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iO9eQroF7O4wqoRvgq0RaFH1dV9uh3sUuUFRmWyQ7SM=;
 b=GhXBKlD7jZUdSDtg4PKOBiMkv+M+akPuyvfIehLKl8BGjn4Z/RRx4eJBmD9vYiJFy3
 Rf+6b+x9jVtGoa2Da9dEc0CdyDA8iS5XYguZQvOFz9GknaXxwzo61ykq3UdWgo2lAFvZ
 JZbLoirR8d6SQn9gH3IcQ7OnA02WBBhYIvCiPWk5qQ5dEoj6bacrGiwMU8HMesI4fr8+
 bFXT9hI+sGJ2YMy2OS720xL6xHVPR7UpYQTIYnDuK8Cr8+QMYH+g5v36kC2OO7ixZAKx
 STaPBZjnWarLsKitFDtfrsLZTBpDl/7WvBbklXT7bR6+0kCVSApCo91rbTDncjojk/o1
 3afQ==
X-Gm-Message-State: AOJu0YyiBtyOQZypwU2XSy8V023GU6o6gdNYr9cclpCBOWgPBvJZLilm
 N0f1c+cURBQ4aXy7S9Uj1WL1Mq2fWLNBvp8cgXakC+rm
X-Google-Smtp-Source: AGHT+IHKG3iXqmcDZD5ql0MUKWLvWhF9fGPMxIR/oUOnu7gWhP7or5vtvW3SwNXSf6T9HyjszDq6fw==
X-Received: by 2002:ac2:5f68:0:b0:503:364d:b93b with SMTP id
 c8-20020ac25f68000000b00503364db93bmr9320171lfc.33.1696293118453; 
 Mon, 02 Oct 2023 17:31:58 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53]) by smtp.gmail.com with ESMTPSA id
 y23-20020ac24477000000b00501c51ab085sm4894393lfl.60.2023.10.02.17.31.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Oct 2023 17:31:58 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-50302e8fca8so2724e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Oct 2023 17:31:57 -0700 (PDT)
X-Received: by 2002:a05:6512:3903:b0:504:7b50:ec9a with SMTP id
 a3-20020a056512390300b005047b50ec9amr25948lfu.1.1696293117450; Mon, 02 Oct
 2023 17:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <20231002235407.769399-1-swboyd@chromium.org>
In-Reply-To: <20231002235407.769399-1-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 2 Oct 2023 17:31:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U2dza-rxV=YtcfJwUY-gZw5FrCyn0NahOxvXJW2J2-vg@mail.gmail.com>
Message-ID: <CAD=FV=U2dza-rxV=YtcfJwUY-gZw5FrCyn0NahOxvXJW2J2-vg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Associate DSI device lifetime
 with auxiliary device
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, Maxime Ripard <maxime@cerno.tech>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Oct 2, 2023 at 4:54=E2=80=AFPM Stephen Boyd <swboyd@chromium.org> w=
rote:
>
> The kernel produces a warning splat and the DSI device fails to register
> in this driver if the i2c driver probes, populates child auxiliary
> devices, and then somewhere in ti_sn_bridge_probe() a function call
> returns -EPROBE_DEFER. When the auxiliary driver probe defers, the dsi
> device created by devm_mipi_dsi_device_register_full() is left
> registered because the devm managed device used to manage the lifetime
> of the DSI device is the parent i2c device, not the auxiliary device
> that is being probed.
>
> Associate the DSI device created and managed by this driver to the
> lifetime of the auxiliary device, not the i2c device, so that the DSI
> device is removed when the auxiliary driver unbinds. Similarly change
> the device pointer used for dev_err_probe() so the deferred probe errors
> are associated with the auxiliary device instead of the parent i2c
> device so we can narrow down future problems faster.
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Fixes: c3b75d4734cb ("drm/bridge: sn65dsi86: Register and attach our DSI =
device at probe")

Even before that commit I think it was using the main "dev" instead of
the auxiliary device's "dev" for some "devm" stuff. I guess the
difference is that it wouldn't mess with probe deferral? Searching
back, I think the first instance of a case that was using "devm_" with
the wrong device was commit 4e5763f03e10 ("drm/bridge: ti-sn65dsi86:
Wrap panel with panel-bridge")? Would it make sense to use that as a
Fixes, you think?

In any case, this looks reasonable to me:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'll give it a week and then apply to "-fixes" if everything is quiet.
