Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FCDADA8A5
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 08:54:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8C710E2B7;
	Mon, 16 Jun 2025 06:54:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ua6wj30l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F3010E2B5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 06:54:28 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-450cfb79177so25025595e9.0
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jun 2025 23:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750056867; x=1750661667; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LA6qyNS9z6v4ERjgPYF6WqyvfBbPjoGj6cbNiGOvOfU=;
 b=Ua6wj30lwJgCTeKYKVFiRlfu9f2WFew4KomB3bsu9h5xqAjpqdV4mbHmd74WBGOSsc
 WYPvF1qj03OSnKsUquRNIFg6mXBVVhqyyxp+de8lZMAbkzTvbnL0vCp4KH6LRER6J/D8
 rc8SxYNFBYAPIwYQztiYDTMPOavrC4XG2glVNId5LSrf2NkV+SgjYDaRZZHMlR7AQi6/
 cD7Nu0FRqvTvqotCh4lFctXj5Dj+1thBCQeUpxi2pNWOwah25ULJ20VA5GM7iqyT76wK
 WoLkSZFmZ6UfdxCNIM5nEzGyNXjquzhPE3c+WdI9LZm5o3LyCuOI0JfTGUvKUeSQGt1t
 EiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750056867; x=1750661667;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LA6qyNS9z6v4ERjgPYF6WqyvfBbPjoGj6cbNiGOvOfU=;
 b=ArXBVT8J/4nnEUtNlTKp9ZRNnt0Qa/iEsLQZOm2oQmNH8PxaC+vKh0/1cZCZ0Pt6v3
 fJaS3edcCflrbpr+0YGC9XH8DxhzGBvwcivDUSIJqXvuwGid3Bd2lvbApgXoO8mFix47
 kTniQNOkQV2+0Yh5CvigNDuVTvxpDR36pGGrK18HcHL2SCcua0Qmu3Oq9EQFsOgvEPAG
 KLWt7vRyzYxLnXMpsqsuIjNGwy2tiAe1KXOmPCgK2Fze0Bw9UvzoCiIrxVeqXgglWyny
 fP43O9ifl1vliig6ZkPlE9MymqMqvpUcFbycX1k+OXZhS0jk6AugFB2wbBF1/ZnI07kC
 MGkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZb9GWh1ik5FHkldM+uuA2Kl/ZWeCqvrzKOUjh9dVTiKbwazw/n8gl4jKhXUnyCg0FjixOV1WN45A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLjCBjVKBXLNg6OI/biCBFkbhijxeefvVaSbHyhQufy3t0n3Ng
 rdJK8OFI8KjcBZhlCDXn5i2FW1RIayDLa1B/Y8qSxaVayAG07CpEWPGaVFWnI/VTc89UTnqQ7W0
 ApxpWuvED6JKsFmBEGEIwd7dTTpLR39I=
X-Gm-Gg: ASbGncvb1v34vW0pNsM82D2MWx2R4hBgvf/LjYq5IgFg1+9Jl+773utU3JmkA+aIFuR
 xqrslvzn/xQagOVl4M/MDvZ+5L5A8ADao2DpuP9nJOI0eo/jNLUwVDUiAthNsVjegSS9Mpx50Qd
 kh/sRdzRrXRRhJNgraW8oe6BM3vrUmopW2ccwxmkILNvDn
X-Google-Smtp-Source: AGHT+IE6I/2rx5nV7gfMDtPJalNVlAfDKfRXQhOdtSztm+UZjqmnbWflX8kVdEbyui2m9twc6XUIRhcYi9XfbwIQvAM=
X-Received: by 2002:a5d:64c9:0:b0:3a4:dde7:ee12 with SMTP id
 ffacd0b85a97d-3a572e9e01cmr7227639f8f.53.1750056866681; Sun, 15 Jun 2025
 23:54:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250303120455.90156-1-clamor95@gmail.com>
 <CAPVz0n0XSzxzkPocRVx6QF7xwmA4otSeSEiRZgJQ3oStyUBrLA@mail.gmail.com>
 <CAPVz0n2MLmHfVNb25=o1_woE7v16hoamwFbbT3ecE+BP1Bn9aw@mail.gmail.com>
 <6df6ecc4-088a-4b27-bebf-abc4560b00ae@kernel.org>
In-Reply-To: <6df6ecc4-088a-4b27-bebf-abc4560b00ae@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 16 Jun 2025 09:54:14 +0300
X-Gm-Features: AX0GCFsqWt_-u5ay7d5bbJVixmP9gUXeVtMWlZMdDA1f-EF5ljJHdYmn8kGXcoI
Message-ID: <CAPVz0n1S2rWW_08FoL+jsVJEOkQ0JJZBu+bB2U5K=fF-g87Y0A@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] drm: bridge: add support for Triple 10-BIT
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Maxim Schwalm <maxim.schwalm@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

=D0=BF=D0=BD, 16 =D1=87=D0=B5=D1=80=D0=B2. 2025=E2=80=AF=D1=80. =D0=BE 09:5=
0 Krzysztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 16/06/2025 08:42, Svyatoslav Ryhel wrote:
> >>>
> >>>  .../devicetree/bindings/display/bridge/lvds-codec.yaml       | 1 +
> >>>  .../devicetree/bindings/display/bridge/simple-bridge.yaml    | 1 +
> >>>  drivers/gpu/drm/bridge/simple-bridge.c                       | 5 +++=
++
> >>>  3 files changed, 7 insertions(+)
> >>>
> >>> --
> >>> 2.43.0
> >>>
> >>
> >> These patches had no activity/feedback from maintainers for a while,
> >> so, in case they got lost in the depths of email box, this is a
> >> friendly reminder that they are still relevant and I would like them
> >> to move on.
> >>
> >> Best regards,
> >> Svyatoslav R.
> >
> > These patches had no activity/feedback from maintainers for a while,
>
> Really? No activity/feedback?
>
> What is this then:
>
> https://lore.kernel.org/all/567addb4-169b-4fd0-aabb-78ceded22702@kernel.o=
rg/#t
>
> https://lore.kernel.org/all/ptyvn34i377pdu7mqital6v2bqe36oy3yprxb5c3hztni=
7h52j@6eo64gzxvgg3/
>
> You already were sending such pings claiming there is no activity while
> we provide you the reviews.
>
>

Then why these patches were not picked for more then 2 month if
everyone acked and reviewed them? I am pinging every month to remind
that they are still relevant and were not picked!

> Best regards,
> Krzysztof
