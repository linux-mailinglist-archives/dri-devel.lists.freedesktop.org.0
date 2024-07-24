Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B69A93B4B4
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 18:15:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C48AD10E74B;
	Wed, 24 Jul 2024 16:15:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ipVABmjI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3EAD10E74B
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 16:15:25 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-79f083f5cb6so386046585a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 09:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1721837722; x=1722442522;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q7e5mdNizpr6t3j3m8AUb0y13KqlMGi3CCgQaLhUCww=;
 b=ipVABmjIj5UFizxfF70osBCy7sH+Ut8RA41dR+7b6laDkEIP8ZXdQcDZm0FDajWM7z
 BiDNjyRcfYDf0LBtzxox7/Ad0ak85Ci30A4aCmCafX4Z+KdRkqD8vT24jHmWku28KmZG
 x+59KyUQtgCtpoAYfS50qS8aTzS6t9hx8EzaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721837722; x=1722442522;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q7e5mdNizpr6t3j3m8AUb0y13KqlMGi3CCgQaLhUCww=;
 b=D5IvjNYGYblfkVul26miygq/DZWAVlPYKmcRXucJXVyCXIWEQdpsrfkK809uYTarCS
 LmuloPdEo8gJog6X06TyKf4CDri9m7b+MS/RCLZeP9+D+qxB39JoLNPkRgf3XK3wZKos
 ZJRW8lLWbSWSqTqjr5GN5NfQo8BjRdA0ALJMtwTdWVk53CNfBT85PtwxppbdKx8xbunb
 FDhTL0lKbsNrcg1ZN7ytOw1xRBYBAbqbMLnVMpwiQhvavK+Icva2FhzX+AW4+R8Nm7La
 aq6B9pfcKS5NRR/YAibOuLKb82pI1nIpoO0ayyCGpoHTzPEVaSwVpVt4sU80I/NlS5UE
 yMfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrMv/8FwobDShRIQM+qtJOCvXzJrBK+6uBS/Qs9inw2R49Kwe85H8OFBO9mgncp3jN8n3da4cVC2RoAI65WjpVgIuN1OZkKT0IBJZd4SiC
X-Gm-Message-State: AOJu0Yz0OI2YGbmVOvm6RTfieISrAGAIKe49/3KDEi0KCaQOE91wZ0m0
 bJ+It4MbtoAwo2fTAR+M1zDvLw86EPNyu/Ld/u2Yu3ayEXyq3FvTgwkFuYxOD25vsuPRzviHKtw
 =
X-Google-Smtp-Source: AGHT+IFDRppAWpR6bosfkM+AmnZW4nxBnukt4WvauQ5B84x494UAGPm1BNHDlXLIQ1psqcRC8sFUwA==
X-Received: by 2002:a05:620a:4553:b0:79d:7b6e:f5d3 with SMTP id
 af79cd13be357-7a1d45372c0mr16139285a.67.1721837721877; 
 Wed, 24 Jul 2024 09:15:21 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com.
 [209.85.160.182]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a198fab446sm592387385a.8.2024.07.24.09.15.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 09:15:21 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-44f9d7cb5c5so373441cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 09:15:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWm5IarXDvfHYBChcSe0mQBiBvv21Fd6IPpBBPOCAT5lV21/EYT3CgL4qJsd0kUnOpxuvCInp0vDKKLS+HYqJnu4m2w9Ex3W/2e8MajDXNp
X-Received: by 2002:ac8:7d8f:0:b0:447:e3e3:77c1 with SMTP id
 d75a77b69052e-44fd4c9a903mr4534671cf.29.1721837720254; Wed, 24 Jul 2024
 09:15:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240709-topic-sdm450-upstream-tbx605f-panel-v1-0-af473397835d@linaro.org>
 <20240709-topic-sdm450-upstream-tbx605f-panel-v1-2-af473397835d@linaro.org>
 <CAD=FV=VL1Wxd0veW7N+0Hy=LdKMzNbBang9_EZ9Zo_d-wZOBfw@mail.gmail.com>
 <dfb29dca-7110-4c11-b86e-9063f71a8ada@linaro.org>
In-Reply-To: <dfb29dca-7110-4c11-b86e-9063f71a8ada@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 24 Jul 2024 09:15:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X=0R_FScPPmU0CXbUv0n+PeSdF0MitRKf5r83V2wEYyg@mail.gmail.com>
Message-ID: <CAD=FV=X=0R_FScPPmU0CXbUv0n+PeSdF0MitRKf5r83V2wEYyg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: add BOE tv101wum-ll2 panel driver
To: neil.armstrong@linaro.org
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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

On Wed, Jul 24, 2024 at 12:51=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> >> @@ -0,0 +1,240 @@
> >> +// SPDX-License-Identifier: GPL-2.0-only
> >> +// Generated with linux-mdss-dsi-panel-driver-generator from vendor d=
evice tree:
> >> +//   Copyright (c) 2013, The Linux Foundation. All rights reserved.
> >> +//   Copyright (c) 2024, Neil Armstrong <neil.armstrong@linaro.org>
> >> +
> >> +#include <linux/delay.h>
> >> +#include <linux/gpio/consumer.h>
> >> +#include <linux/regulator/consumer.h>
> >> +#include <linux/module.h>
> >> +#include <linux/of.h>
> >
> > nit: sort header files?
>
> Will do while I'm it, but I don't personally care of the include order..

FWIW: the main reason I push for sorting in cases like this is to
avoid merge conflicts as the driver changes. If everyone adds new
#includes at the end then every change will cause a merge conflict. If
things are kept sorted it's still possible to get a merge conflict but
the number goes down. Probably not super relevant in such a simple
driver but just the policy I push for in general.

The criteria for sorting doesn't matter to me (some people put
"nested" includes in separate sections and some just do a normal sort)
as long as it's obvious / consistent for a given file.

-Doug
