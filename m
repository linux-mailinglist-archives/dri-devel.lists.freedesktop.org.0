Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 260C8964EFD
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 21:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF1510E071;
	Thu, 29 Aug 2024 19:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="fJndigkx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0CA410E071
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 19:33:43 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-70f6732a16dso71899a34.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 12:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724960023; x=1725564823;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+89V/Pkw0eErHNWTJZLzdCFWIv36uJ87GHJgsJod6mk=;
 b=fJndigkxx4qDFHIVx+mdsIPeDTldCmdsdjVNwjRvUoXvLFHnL9uRU78ZNp8cX2A6ba
 sXkebEEv1bJSfiRezxRDP6dtN1Yp0Z87zmbwqMsw3XFJHofz8DpXfhppCtQxtXxl/NG/
 qM6dst266zmM+x+ilZMZ2KiBznJIFb6w+a00A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724960023; x=1725564823;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+89V/Pkw0eErHNWTJZLzdCFWIv36uJ87GHJgsJod6mk=;
 b=LR2nzjY97ARGagCF2/fjbtdGtbx3cCbUtwpSoxalejR8EsJlDzh7/oUIsRYSzPOJE4
 LEcIewwiG/NDXbSbvA8VjiBRbY/voFZoANXfnZMpet2npP1JO1juen+bQUV6zLu6HiDQ
 jhgdIX1Jb2wohpZDGDye49RKr2gaURSGtEWUADmeKwpTrnm9pBo6xq5IfSnHs9lUFq6I
 afWxTo1g41Kbna9r+z2yrZJDFhNyxwvTv/vWJdH1Cc0FD812OgtmyOeYSnBorU4PyIKL
 /nFcU53Rh1KYmF8L6b/5R9k59CobGHku9Pw1aOiCoXJeLG2HlCc4jRDoDD3W29qzeISf
 +k7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9sfXad79b9TAGjKjYgVacauqKe6MxLUI5jdJqzNRPrOTy6m8K48wEqgtGxFTw0zF0vSKp7cAnb1A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTPNM8KNYSZc+oznDABK0m02g7IGMsrVzZioEeqwLnSARe5pkO
 jdZE/gBoXAnNDXTlEphlPn7n+tsM13mMAFKjRrMdWU+jvprcx+ToXt0Nh2RbjcccYL8AkkTzfDQ
 =
X-Google-Smtp-Source: AGHT+IE1xs8lijIFRv7ivwGuCa26XYUG38P5P8TEZu7MVMerUsOKGlGM5veCPUciRYMUUZFyOMBMLw==
X-Received: by 2002:a05:6830:718e:b0:70f:3d6f:4cfd with SMTP id
 46e09a7af769-70f5c343ef1mr3405921a34.5.1724960022933; 
 Thu, 29 Aug 2024 12:33:42 -0700 (PDT)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com.
 [209.85.210.45]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-70f671aa4bfsm43650a34.61.2024.08.29.12.33.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 12:33:42 -0700 (PDT)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-70f6732a16dso71876a34.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 12:33:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV9FIqm61yS2wSafyaHB3lPqFznutYI3XT/qgYo5A6xQ6DGv81dhawyG+Mugk1/dnY/J4G5Rhw+xms=@lists.freedesktop.org
X-Received: by 2002:a05:6830:b85:b0:70c:aceb:c6c4 with SMTP id
 46e09a7af769-70f5c21e47dmr4373135a34.0.1724960022060; Thu, 29 Aug 2024
 12:33:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240821214052.6800-1-wahrenst@gmx.net>
 <20240821214052.6800-9-wahrenst@gmx.net>
In-Reply-To: <20240821214052.6800-9-wahrenst@gmx.net>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Aug 2024 12:33:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X+VbFmzMk8mHy6HGf5+W-7YQjTEDPqiJXs0hecbZ_T9Q@mail.gmail.com>
Message-ID: <CAD=FV=X+VbFmzMk8mHy6HGf5+W-7YQjTEDPqiJXs0hecbZ_T9Q@mail.gmail.com>
Subject: Re: [PATCH V3 RFC 8/9] usb: dwc2: Implement recovery after PM domain
 off
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Russell King <linux@armlinux.org.uk>,
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Maxime Ripard <mripard@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Minas Harutyunyan <hminas@synopsys.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lukas Wunner <lukas@wunner.de>, 
 Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>, 
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel-list@raspberrypi.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Aug 21, 2024 at 2:41=E2=80=AFPM Stefan Wahren <wahrenst@gmx.net> wr=
ote:
>
> According to the dt-bindings there are some platforms, which have a
> dedicated USB power domain for DWC2 IP core supply. If the power domain
> is switched off during system suspend then all USB register will lose
> their settings.
>
> Use GUSBCFG_TOUTCAL as a canary to detect that the power domain has
> been powered off during suspend. Since the GOTGCTL_CURMODE_HOST doesn't
> match on all platform with the current mode, additionally backup
> GINTSTS. This works reliable to decide which registers should be
> restored.
>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  drivers/usb/dwc2/core.c     |  1 +
>  drivers/usb/dwc2/core.h     |  2 ++
>  drivers/usb/dwc2/platform.c | 38 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 41 insertions(+)
> +static int dwc2_restore_critical_registers(struct dwc2_hsotg *hsotg)
> +{
> +       struct dwc2_gregs_backup *gr;
> +
> +       gr =3D &hsotg->gr_backup;
> +
> +       if (!gr->valid) {
> +               dev_err(hsotg->dev, "%s: no registers to restore\n",
> +                       __func__);

nit: IMO "__func__" should not be in dev_err() messages. The message
plus the device should be enough. If __func__ should have been in
dev_err() messages then the Linux kernel would have automatically put
it there.

Aside from that, this looks reasonable to me and discussed previously.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
