Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F035F92D8D4
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 21:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88EF710E075;
	Wed, 10 Jul 2024 19:13:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="bylf2jZq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E658710E075
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 19:12:59 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-70388567d24so32395a34.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 12:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1720638777; x=1721243577;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=msnytkDAJA+P3orVTeKKvN06RuuVdEWbRMnBWzLAFIc=;
 b=bylf2jZq/VAqcpwv7oNKkNcjc/Sk9lP0uzpiCgl4UmcEq/YEcwv1rZPQjgNWtYuTMK
 d7iXwevPpPv48/hghBa7nkxTs+MIsw/oYWKeVe7O1LMstDsXl1FcgFkxB3UHqpCbXh8w
 D9rDNDhCFZ34lIPiTIR5HzZJNZJ6gpzZRoTJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720638777; x=1721243577;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=msnytkDAJA+P3orVTeKKvN06RuuVdEWbRMnBWzLAFIc=;
 b=ru4131LvbBCADNzLKnpI9AEoOwGz9+Uy69iD7J7c320CLsYNiAaqhXAI3C1I2zqK7K
 7bKyyYesjOh0Qn5gxiR0uqn5b379A6bWTVtw7495YsUlcL+3jxPBJVgVSzEUND/1Rg6m
 EbVwKXbcD+1Zg3o+efng2Y/mFRVwdqSoO5XDhGIqluJO8ZMWCA6C1qnSA2t5smrSMpyX
 33WzJrDMRWq4lhR0vCg4Hml2t/4EP2I0GXiUYwMkSBNHzo34z6rnyfXdxqD33N1V0rt3
 q0B0FEL8gKWXKAQm78WU4mGb1mOo/lt+xOGzMXObByknKc423TIWvksPHR3Ym3DprSwk
 S7Yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPfxXP4SMTnp0lsVKZOPhV41E0c1RjlFCngUQecGW4RKgUWulvrLzvN9tctwY6+12/E8jfeBPqYK1cXK9beyuWLK9OerJ3RquFwLWQnsd/
X-Gm-Message-State: AOJu0YyP/HUDlgnc1jfHd3JU6W4EfrTYfXZsCU2Xn7i3Jq62TZjyc8wt
 F2UWTZG6wLYijysAxquIz3BjjZYY0nD5vNVAC2NXxF8g5zEQjGhOHwA1ak3z8rV5lug+cLFMl2p
 Ryw==
X-Google-Smtp-Source: AGHT+IEBeQDtBe4ztU7/zLRpF+saSKPHjipnYmcaqx2cshQjCQi/P6JnJmyxkIxyehorFsy5cPzCWQ==
X-Received: by 2002:a05:6830:3b84:b0:703:7051:4018 with SMTP id
 46e09a7af769-70375a4634dmr7270827a34.28.1720638776716; 
 Wed, 10 Jul 2024 12:12:56 -0700 (PDT)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com.
 [209.85.160.170]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b61ba8c9f1sm19301226d6.123.2024.07.10.12.12.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jul 2024 12:12:55 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-44a8b140a1bso63271cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 12:12:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUseV7scq8q4oAzIvQEYjNfa28SlBe+ezrU0OCROo9PaDcjVBVdk12XROEEs0o1ciq6xj5d5YdHEXKAH1s7YV8cGxK4+Jx5jph8JnzcjXpa
X-Received: by 2002:ac8:6a12:0:b0:447:e2f0:4d17 with SMTP id
 d75a77b69052e-44d118939ecmr377451cf.7.1720638775365; Wed, 10 Jul 2024
 12:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240710084715.1119935-1-yangcong5@huaqin.corp-partner.google.com>
 <20240710084715.1119935-2-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20240710084715.1119935-2-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 10 Jul 2024 12:12:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vt+8qqY8AQuKkC2np6z8aHoDpeV1siHKrDe-=Ft8xaMg@mail.gmail.com>
Message-ID: <CAD=FV=Vt+8qqY8AQuKkC2np6z8aHoDpeV1siHKrDe-=Ft8xaMg@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] drm/panel: boe-tv101wum-nl6: Break some CMDS into
 helper functions
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: quic_jesszhan@quicinc.com, neil.armstrong@linaro.org, mwalle@kernel.org, 
 linus.walleij@linaro.org, airlied@gmail.com, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Wed, Jul 10, 2024 at 1:47=E2=80=AFAM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> hj110iz-01a and tv110c9m-ll3 both nt36523 controller, and they have
> some common cmds, so let's break them into helper functions.
>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
>  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 190 ++++++------------
>  1 file changed, 63 insertions(+), 127 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
