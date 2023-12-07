Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4882C808FC8
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 19:23:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E770A10E20E;
	Thu,  7 Dec 2023 18:23:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C2810E92B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 18:23:38 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a1ef2f5ed02so104921066b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 10:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701973416; x=1702578216;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=18Xj7GvDH6vU8O7BJr6AsjtH8lVK3Aid34DvmXifJHM=;
 b=i9G8gPv1qH+OAQUIoanRTvRbCG9aXAtKPFQ0so/brSaWf20vUC2neWgc+EexGXoF6n
 dMQg1c0+bzoNnV6/sFMq3KQgq+RGI1CcD+VhXA70Cy8p6tLio2u4tD4o7hXUn0es4zWb
 tNBFikah29/doReoFQFATyt8aQwvUca/Tla40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701973416; x=1702578216;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=18Xj7GvDH6vU8O7BJr6AsjtH8lVK3Aid34DvmXifJHM=;
 b=mEka4mpzmfdIAu8x5pzhfjp3mERvV2Kqfp8l9/KuteTDA127S7jemPBbIV6G7dt5Fo
 wo/HFMLsCA8gf2d9Ky0lktfG8lgbdPYcN3PpZzaom60yDcttrPH/JKWhCtUYuuqJu3+X
 T3vlycNCQZMi4HQaj1uWLQ/qYyXQhc1uJ6vLsDGoZpG8re198izrtHjBQAPpryaQ7ZQk
 vPbDmfzXO0vIB+TYA1axFU2YR9YILZp9nfDvlDlTqL/OACb3Sp3MunQmkpZHH25lCOL5
 zeHIxLW3DhFinKgYQ2i2ut/xweX9Wp1vIwALKT0Gzw6+ePRHqQRy95TaFatrk/r4PmPK
 eRaQ==
X-Gm-Message-State: AOJu0YzPgaPtLBowkyO0gGbMVVzpT60WmvYr2jt3ncyl280jl0rIooZK
 IBibM6q6qhJ4b/fY/X/1RsmbmET8Uao8KA0SmbVIXoes
X-Google-Smtp-Source: AGHT+IHjhG7ZmrfJ24B10wNVWlb/uMf8WTDHA//TXzKJbHRxi0FQuuFIBSgvqkmNq5ol7ijlz2RfyA==
X-Received: by 2002:a17:906:47:b0:a19:a1ba:8cc0 with SMTP id
 7-20020a170906004700b00a19a1ba8cc0mr1632134ejg.94.1701973415688; 
 Thu, 07 Dec 2023 10:23:35 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45]) by smtp.gmail.com with ESMTPSA id
 ss22-20020a170907c01600b00a1d781068e8sm57269ejc.8.2023.12.07.10.23.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 10:23:35 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-40b367a0a12so3535e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 10:23:35 -0800 (PST)
X-Received: by 2002:a05:600c:231a:b0:405:320a:44f9 with SMTP id
 26-20020a05600c231a00b00405320a44f9mr220896wmo.5.1701973414710; Thu, 07 Dec
 2023 10:23:34 -0800 (PST)
MIME-Version: 1.0
References: <20231207081801.4049075-1-treapking@chromium.org>
 <20231207081801.4049075-2-treapking@chromium.org>
In-Reply-To: <20231207081801.4049075-2-treapking@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 7 Dec 2023 10:23:18 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xbmo4BYjy3si4D8NJ5hThmjQky3oK4VFQz8fwKj87Rtw@mail.gmail.com>
Message-ID: <CAD=FV=Xbmo4BYjy3si4D8NJ5hThmjQky3oK4VFQz8fwKj87Rtw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/edp-panel: Move the KDC panel to a separate
 group
To: Pin-yen Lin <treapking@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Guenter Roeck <groeck@chromium.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Dec 7, 2023 at 12:18=E2=80=AFAM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> Move the KDC panel entry to make the list sorted by the vendor string.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
>
> (no changes since v1)
>
>  drivers/gpu/drm/panel/panel-edp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

67a5f0ff3429 drm/edp-panel: Move the KDC panel to a separate group
