Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A13F92D8D8
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 21:13:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F9710E87F;
	Wed, 10 Jul 2024 19:13:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Wg9ZWOHe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404CA10E895
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 19:13:09 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-79f0e7faafcso7861785a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 12:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1720638784; x=1721243584;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3lzoBY9/yiM7+D5Gb2Lvu+52q3dl18EqlM4F4NkXNe8=;
 b=Wg9ZWOHe9RDUAWkUsmI6PKiiwfld9P66xgSRHTw/7HhuDyuccMSyh/LUHW7D53whsh
 anv2sLN1cM5j48Z1xMOKFWrqBuXh5AL/o34a1iFt2KeItm6xAcndgBnqtShfzSubVuEh
 zMFc0PjPUQ8YaGJUhm5QFEYuKrJ4f5ZMWpeJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720638784; x=1721243584;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3lzoBY9/yiM7+D5Gb2Lvu+52q3dl18EqlM4F4NkXNe8=;
 b=lZ+rhw8zw3u+qYl4dgBDxIZyAyGH2FbBLx0AdqodPxd/4XzND9HG8FFHlIjp8NmKwJ
 ibe7IqdVmocO165NOcmWExE8C6fmc+rQfOMCUpybkMS9wp3ya74Fgb9A+am6AP2WSyxh
 hHfZ/VdXZgPttLgLlUUqgrWEZSHQYAB6aA29E9oKh+Iafocyo81kl0SViE6rj42PW5A4
 r0SLK7H+13mxPJScN1HppNRUoDUYmG6agJZ5Zu7uICvOd0SDo/v2Tms5PUZUM4c5wiMD
 ugCdWC34U2EYyeYspicznYsMYswfG+BVObjNIL8clFLjpTX5L+zoZv1KCKnY7WFOexQ/
 3ziA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUdTW7D6/sO+6sulXEOvUVpRR7O9X7qV2QOE2xscDp12gXyTlXZ/d6pxnAM6DmlIUXTAJNJHzgKNGMYIXo/kFUUkPLv3y2kHvLZgvNIg7W
X-Gm-Message-State: AOJu0YzkB6Z6X1JvlBYpJtKORS07gR29n/G9b1koGZdPzTx5JbWZlybk
 edBMelbC7TwZwa/+uXaKcy+z5UHuRfDcGh6GblMFm5FZnHADP7u20dgp2qf3qrVElwRuuP9+sUp
 igA==
X-Google-Smtp-Source: AGHT+IHPfvIZZOvs7QIEH8t+VemvWPpDJ5p1HIfPvA9a9g6ITSOAbRT+ZKGvizsHQAo/J1lz9jpubA==
X-Received: by 2002:a05:620a:2e4:b0:79d:772b:3f0b with SMTP id
 af79cd13be357-79f19a51f10mr725896685a.37.1720638784098; 
 Wed, 10 Jul 2024 12:13:04 -0700 (PDT)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com.
 [209.85.160.176]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79f190b4c57sm218555985a.132.2024.07.10.12.12.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jul 2024 12:13:01 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-44a8b140a1bso63331cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 12:12:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXiF74yILaLlWRVOqGVKZBotHUviP191zNZI1abuv0KWeNxEdJa5ZUJ5rlnQnt9oxNTVc8dwnscuL2kHua+ntfQyxGhiqgqeT5mt6VK0IOd
X-Received: by 2002:ac8:6b94:0:b0:447:e76a:c04b with SMTP id
 d75a77b69052e-44d0aa46fd5mr520361cf.10.1720638777116; Wed, 10 Jul 2024
 12:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240710084715.1119935-1-yangcong5@huaqin.corp-partner.google.com>
 <20240710084715.1119935-3-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20240710084715.1119935-3-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 10 Jul 2024 12:12:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UCvbuMbsuproyyDumezHa7eVQHQt-kWxmMwUmxXgh_Sw@mail.gmail.com>
Message-ID: <CAD=FV=UCvbuMbsuproyyDumezHa7eVQHQt-kWxmMwUmxXgh_Sw@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] drm/panel: nt35521: Break some CMDS into helper
 functions
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
> Break select page cmds into helper functions.
>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
>  .../panel/panel-sony-tulip-truly-nt35521.c    | 29 ++++++++++++++-----
>  1 file changed, 21 insertions(+), 8 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
