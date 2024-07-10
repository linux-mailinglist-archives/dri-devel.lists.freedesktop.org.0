Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 598F692D8D6
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 21:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA6F310E889;
	Wed, 10 Jul 2024 19:13:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="MThbaNle";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1939810E888
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 19:13:04 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id
 5614622812f47-3d9c487b2b5so87165b6e.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 12:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1720638783; x=1721243583;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jfu6YHYXAYDu8BCDtd4YBroCALNFVkJ9E+bO6AtHH3w=;
 b=MThbaNleFTQHxnXcq0UUYwbI9cZjoacvOZTVLtU13BU+KZrVuH4ze1KK7fhpP5fGSw
 9UuGN7qRZRtKgKHhonIXBzdNrChffhyWZPWtwKeG2rHJk21YGgAyvdR2JCaM03KcoUV4
 VD7WLqUyQUaZ8yV+MxV1Cp49NP1lzC3fnViQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720638783; x=1721243583;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jfu6YHYXAYDu8BCDtd4YBroCALNFVkJ9E+bO6AtHH3w=;
 b=P4syS0CdzL+MI/7lmkEOHWNjMUv3cVssaC5g3PGSdwYys3UonoZATt8QfGelzbUbBu
 Ib5eoZsXBxn54diuRQ8MSyNPdgtftrMKGfWiVVuEymtxrf+EytgTrmNZ9VFRkgYZQhLY
 R8ieoUZHW+h4F+dXomJahl6G8Bo8u2CojeRCp7c/7L+zDUk1PoN3sveVJutzVbJPj6IA
 cXTYIUbA/3MCog8XpJqCnYea8htJZKID00nynb2gHGOiMycI6n/JXgaN/ZLWasCC/3qA
 ciCivglJCH5bsaSFyS0pbSDLuwXzLOJQpxdZudwhaTikTEorfQcN0JDKJrVhGUASY3th
 5Hew==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0GIqOLetfaN6w/fFQlavwxquu+rn1MT/aPmniX0JBModNKpogfsLADn1qlW4Lw91rPidkf5SJ03he4YmVs9cziSdsH8Rhqmj6SsWNlv/k
X-Gm-Message-State: AOJu0YzNngYVRzHYpjCNUqXGu2DHCzWQEl9xXvKvqvHSnP12Zs7F+5PH
 aHnAleKQ85CGey7LELuyRxZlw5MYBM5o3KH8uwd1sQzK7Pz+GfXvLE4gAD/3LFNLZYn0dYa+8kL
 lfQ==
X-Google-Smtp-Source: AGHT+IEliEPZOtPq+13VPJjbEZ53vEqKwvG3/dIEvVRqrEwcZzzizVCrlt+4jm6zGFkDJ8cUQBqcOg==
X-Received: by 2002:a05:6808:189e:b0:3d9:e22a:8fa3 with SMTP id
 5614622812f47-3d9e22a94c5mr1998638b6e.32.1720638783222; 
 Wed, 10 Jul 2024 12:13:03 -0700 (PDT)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com.
 [209.85.160.176]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-447f9bf918csm22846601cf.84.2024.07.10.12.13.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jul 2024 12:13:03 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-447f8aa87bfso83811cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 12:13:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUZb8x0iHoZNpsZa5ba+Gan3+tL4qa0CacFKCQjMf1CwYFptBnbxHDSHOTNDhB2sq15Z2CG021UfMYEV6v7rHOWuCXVJj2LF0dafS69xU1q
X-Received: by 2002:ac8:51d1:0:b0:444:fd8a:f1a0 with SMTP id
 d75a77b69052e-44d1255ffaamr427131cf.25.1720638782549; Wed, 10 Jul 2024
 12:13:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240710084715.1119935-1-yangcong5@huaqin.corp-partner.google.com>
 <20240710084715.1119935-4-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20240710084715.1119935-4-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 10 Jul 2024 12:12:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vftx+AVUtpnYrSwW9725gwjH8BD_C6i+bd_m4nCx1vQg@mail.gmail.com>
Message-ID: <CAD=FV=Vftx+AVUtpnYrSwW9725gwjH8BD_C6i+bd_m4nCx1vQg@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] drm/panel: nt36672e: Break some CMDS into helper
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
> Break select page cmds and reload cmds into helper functions.
>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
>  .../gpu/drm/panel/panel-novatek-nt36672e.c    | 69 ++++++++++++-------
>  1 file changed, 44 insertions(+), 25 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
