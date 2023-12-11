Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD1180DFA0
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 00:44:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C08710E52D;
	Mon, 11 Dec 2023 23:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 561F710E52D
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 23:44:00 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-5cfc3a48ab2so43834227b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 15:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702338239; x=1702943039; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0/KHog0g187jttkFsjo2QPc99oaIIhNcuNib1MjoOVw=;
 b=bxNBCdvd0+mwmTYPFYySJZThbM+5bukj+D8CfhOFBrDOAWjo6zDDF2eUW4sYlHdOF2
 CjaCcUfAuWt9Fygk4nSkcIYTs4OduQzqTuyMyx0Aik7/UdPS2/LeVCitnhK8UnliHjlC
 MQe71lM+K1ggPGMY14tvt4QD4akURGmZcStoJT5PRY61e3peU71f2AoBwklvxyawlaIN
 3VX8N6oYjLiJCcJcRgkQzHIpKOtiZunXs0FnXJmoKXeI5F/8mPsf6VoZ+1ETJmw8ziKD
 iCXcaKUg2YaSw1LMoXWeUTHKxDOBpFCDR8ppQue0IRxsp2/NOiKoN4dnxlLg3aV7Ibmf
 KPDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702338239; x=1702943039;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0/KHog0g187jttkFsjo2QPc99oaIIhNcuNib1MjoOVw=;
 b=ENTG6hWZ2+bm4Ec2V4y6BxsFU2n8tVZ/YhJISVieeGYX9E/X1m2Y2QbRksOs9YAdBE
 EV1Hp5mTTy+liw7XsGGxATyqHsjYakHonVbQOxg3AzZQ6c13agdYC49LwQkMxqul2yzC
 6G2KniZ4l6fQcfyi6iBz0E3jrG5lbvnb8xpGcuq9SbNGP3FEP9HWicbdymAm1GPd65DD
 3f3Cw3tWK+iLML/OMJZvXmaQ8s7Z/36fzczh2Lt1siyR/inEF8GgIyZmdcDOT8CBGb/o
 +7TEQMqApprORi2UxOse+7wfHhly46z3lG8c/RJBL8uDMnUnhnK7BhLJJ8Vu1GuT0Nhv
 dZPQ==
X-Gm-Message-State: AOJu0YyI9XjrLjrqQS3dGi63uF1hlFohDZhfjbeiibYKSO2/ZMe1FxEz
 XwkNbhFuvNuFwefuGBp2guyVawC8rPqKoHVA8riy2g==
X-Google-Smtp-Source: AGHT+IEU90tODYSktnGQR28uQLa9xNq1IGgYZM3SThDZKZmWHM4wPt+DOBf0hsF0QUjax1PKwDEIYIPuewUKL184+iU=
X-Received: by 2002:a81:6555:0:b0:5c9:8183:6ab7 with SMTP id
 z82-20020a816555000000b005c981836ab7mr4242669ywb.0.1702338239471; Mon, 11 Dec
 2023 15:43:59 -0800 (PST)
MIME-Version: 1.0
References: <20231208154847.130615-1-macroalpha82@gmail.com>
 <20231208154847.130615-2-macroalpha82@gmail.com>
In-Reply-To: <20231208154847.130615-2-macroalpha82@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 12 Dec 2023 00:43:47 +0100
Message-ID: <CACRpkdZDJRdCYh4R4b0CsMMKm14PmToHCPgVDpio3Tb4n4ovOQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/panel: st7701: Fix AVCL calculation
To: Chris Morgan <macroalpha82@gmail.com>
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
Cc: marex@denx.de, devicetree@vger.kernel.org, conor+dt@kernel.org,
 neil.armstrong@linaro.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, jagan@amarulasolutions.com,
 krzysztof.kozlowski+dt@linaro.org, quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 8, 2023 at 4:48=E2=80=AFPM Chris Morgan <macroalpha82@gmail.com=
> wrote:

> From: Chris Morgan <macromorgan@hotmail.com>
>
> The AVCL register, according to the datasheet, comes in increments
> of -0.2v between -4.4v (represented by 0x0) to -5.0v (represented
> by 0x3). The current calculation is done by adding the defined
> AVCL value in mV to -4400 and then dividing by 200 to get the register
> value. Unfortunately if I subtract -4400 from -4400 I get -8800, which
> divided by 200 gives me -44. If I instead subtract -4400 from -4400
> I get 0, which divided by 200 gives me 0. Based on the datasheet this
> is the expected register value.
>
> Fixes: 83b7a8e7e88e ("drm/panel/panel-sitronix-st7701: Parametrize voltag=
e and timing")
>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Good catch!

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
