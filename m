Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD139847A86
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 21:32:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A9910E5DD;
	Fri,  2 Feb 2024 20:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="MaAyVAXA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB7E10E5DD
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 20:31:51 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2d066b532f0so38731581fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Feb 2024 12:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1706905907; x=1707510707;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0h1IIKH0viGaA3orHuy1hmOvR0Hle+LrWHOWH3Kx7Iw=;
 b=MaAyVAXApAUvNdxCGb59yGUb68ywW4Kcu781dczSsXwnQQYIIyP90+Q/jRG0WsfUvR
 UfCLI8Bvw41rlTwJ/uFAGOAJxlmIiH8ZeWlSiu6O2Sehq8Oyo2TkOhuP51A3q/4h+chn
 r8kyOm4KlHIdNYueOyqBPKI0m+LbxBy2CfYEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706905907; x=1707510707;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0h1IIKH0viGaA3orHuy1hmOvR0Hle+LrWHOWH3Kx7Iw=;
 b=sn6f/Lk/RcHoP74eT0WwyXHXcdA+QQ3Flq8BZUurPtRCXRkzIP0e7UtM791qiT9WMF
 tYSZXiGnEr2U00ao/Sr1a3x1z9KY51NMZ03wp1JxLpAAy1SLtVAIH5GEl01kerDPVr2z
 KOk8Aryp6CI8HMUQxfgbjWY0qbKrjtEuCpLOhU+MMvqGEFkwowPqRwXJTp4zDnYprwtU
 z66Jj/P4A0KhqxiqDZ4e9NE0oLjGCDwyp7cDdIub9cyQmj4okHRBET8nJSQQbpBXqWVk
 zC7F60YxINdq/D3UkluM03IpqSQzjLg2BcQVgucBMvHYT3P0ByFUOuAQCofe8V9LI38a
 wkeQ==
X-Gm-Message-State: AOJu0YwLSNQU5RPHPI+MV3OOUh01pz792VIYnY1JwJ8WW09YW0GwLxIe
 AfQqQE9Xb48Ml/AMdyyDUy6ZT0e5u1vUe9kCjOekoAAfyzB3ikiNSm/1L/MHVVKv8lLPRjMAwq0
 w6t5t
X-Google-Smtp-Source: AGHT+IEZMG+GxxRJPD3MZ0+a12lXb5ehrG32Vd84ui7Txz01oVXSfrTV6CY8jYbRXZ13JiDFolzMtQ==
X-Received: by 2002:a2e:9cc9:0:b0:2d0:9076:e9cc with SMTP id
 g9-20020a2e9cc9000000b002d09076e9ccmr966684ljj.29.1706905907552; 
 Fri, 02 Feb 2024 12:31:47 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXtTWX5IVblzuGYSWYpHZJ3c4BK/tf+eXeQefnSg3l41yOhK1Vl3WcaMTJS9pcrNHlBifE9EGIna/F+Yg1U38EgnUEc36qAy9HvCQ4TTdVu
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com.
 [209.85.208.43]) by smtp.gmail.com with ESMTPSA id
 ll9-20020a170907190900b00a370e130fc0sm889051ejc.59.2024.02.02.12.31.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Feb 2024 12:31:46 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-55fff7a874fso3043a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Feb 2024 12:31:46 -0800 (PST)
X-Received: by 2002:a50:8d15:0:b0:55f:a1af:bade with SMTP id
 s21-20020a508d15000000b0055fa1afbademr6757eds.4.1706905905770; Fri, 02 Feb
 2024 12:31:45 -0800 (PST)
MIME-Version: 1.0
References: <20240202202329.4172917-1-quic_jhugo@quicinc.com>
In-Reply-To: <20240202202329.4172917-1-quic_jhugo@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 2 Feb 2024 12:31:30 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WkNKFiRKyadVnAMmtcDH=PVv6vk2CvMbME9FZ5UHNxuw@mail.gmail.com>
Message-ID: <CAD=FV=WkNKFiRKyadVnAMmtcDH=PVv6vk2CvMbME9FZ5UHNxuw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: drm/bridge: ti-sn65dsi86: Fix bouncing
 @codeaurora address
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 quic_bjorande@quicinc.com, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
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

On Fri, Feb 2, 2024 at 12:25=E2=80=AFPM Jeffrey Hugo <quic_jhugo@quicinc.co=
m> wrote:
>
> The servers for the @codeaurora domain are long retired and any messages
> sent there bounce.  Sandeep Panda's email address is no longer valid and
> should be repleaced.  However Sandeep has left the company and has not
> been active sice, therefore it looks like this binding is orphaned.
>
> Doug is listed as the reviewer for this file in MAINTAINERS and has
> volunteered to be listed within the file as the binding maintainer.
> Therefore replace Sandeep with Doug to make the documentation current.
>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi8=
6.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> index 6ec6d287bff4..c93878b6d718 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: SN65DSI86 DSI to eDP bridge chip
>
>  maintainers:
> -  - Sandeep Panda <spanda@codeaurora.org>
> +  - Douglas Anderson <dianders@chromium.org>

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Unless there are comments, I'll let this stew over the weekend and
then land it through drm-misc next week.

-Doug
