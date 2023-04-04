Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF4F6D640A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12B210E696;
	Tue,  4 Apr 2023 13:54:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [IPv6:2607:f8b0:4864:20::e34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452FB10E696
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 13:54:57 +0000 (UTC)
Received: by mail-vs1-xe34.google.com with SMTP id df34so28464797vsb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 06:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=criticallink.com; s=google; t=1680616495;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8vxdDefvvddT/9lK9tLNVI9aT2fK3kIsSFEfydgZYtk=;
 b=Ya/wbST62b8bezjGJ+GdV4aX4VVQ7bkrHG4sJ3MmhiRJGFpPveN8pZ+WsGjh7iPiK0
 toe9rgOKSkw8ZZNtv0JgB/3gyOzpK0o+PRkaObp9GXfbSuj/X8Z5l7mTdA6ukeRBSZ1t
 /Fl227fhx8K4bOyxVBwKplIoQgC5hp0E4BMBvkh204o4HFeppj1CCcjA1tL1dUpJVgX3
 XVgJZgAJcZZoq/p7FlWb8kvNbB1zUD2pFP1YQKm5Icpitm/bP1mjGEwoSgFGIY38I/nu
 b/KHayT+HcLzKVwzBvnsLO3ZoIxGbUdy5VEAUR0AuGtSPbVnRIR1mdI+gsjyZm0g4qyk
 bC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680616495;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8vxdDefvvddT/9lK9tLNVI9aT2fK3kIsSFEfydgZYtk=;
 b=6Rb91MRy5aenJYqg3PKKo63gn9EPmPD1tcNX60sBSWT/sjKvI0rVo+e8pDgBUBcALd
 dSxhgDdjRpQ9rEY+VOkLHvfV+caRRVi0K3Kc/rJFtPCji0gR0G+5Si87WL6kHOzWKhPS
 DJrJY2jFKohUKEki2OFwm5Ieoz05LSS38O+13cIMdvssPNNOGnOkB8WZKR2YkT4n6JmT
 CoFAp9Po/Itg0BFKhgRaz4FpW2J49YJn5gKbM5HaDfxc8AP7oKlQJkEFD8+2YOAgPOAj
 zZ5aV+ZFY2bVp/d8Ka/y5/sGFXyFI1w9zGr7IRDN+KIetn81ie+yZj6nloQZOTMbU4ru
 tTFg==
X-Gm-Message-State: AAQBX9dBGkLOywBadZAk+DsmXZVDYSGscsF2qo+b2lZdGAo5xCG2BpAU
 Cp3sXl01KFN7gTAdJU7Zg4Kzl49skBjkVhxvtKt1M2xlttqvVFpz
X-Google-Smtp-Source: AKy350a5f/7rix1Bx/HaEfgI4ImxkcUz7pSb82+guYOFsa97EzdFAQARipypD435dAL1dHUwvcHFcauKCK+dFMJ2rPw=
X-Received: by 2002:a67:c812:0:b0:416:2ad3:35ba with SMTP id
 u18-20020a67c812000000b004162ad335bamr2335152vsk.1.1680616494759; Tue, 04 Apr
 2023 06:54:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230125-tfp410_i2c-v3-0-a85d5f0f50f1@criticallink.com>
 <20230125-tfp410_i2c-v3-2-a85d5f0f50f1@criticallink.com>
 <4a22e085-b339-aa43-518e-d528c5f76de4@linaro.org>
In-Reply-To: <4a22e085-b339-aa43-518e-d528c5f76de4@linaro.org>
From: Jon Cormier <jcormier@criticallink.com>
Date: Tue, 4 Apr 2023 09:54:43 -0400
Message-ID: <CADL8D3Zhn1iFo0fn-VSw5DTvh3UNmCLAFKviKOOa-+F64tRFTA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/bridge: tfp410: Fix logic to configured polled
 HPD
To: neil.armstrong@linaro.org
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
Cc: devicetree@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Michael Williamson <michael.williamson@criticallink.com>,
 Bob Duke <bduke@criticallink.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 31, 2023 at 5:00=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On 20/02/2023 23:10, Jonathan Cormier wrote:
> > From: Michael Williamson <michael.williamson@criticallink.com>
> >
> > The logic to configure polling (vs async/irq notification) of hot-plug
> > events was not correct.  If the connected bridge requires polling,
> > then inform the upstream bridge we also require polling.
> >
> > Signed-off-by: Michael Williamson <michael.williamson@criticallink.com>
> > Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
> > ---
> >   drivers/gpu/drm/bridge/ti-tfp410.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridg=
e/ti-tfp410.c
> > index bb3f8d0ff207..41007d05d584 100644
> > --- a/drivers/gpu/drm/bridge/ti-tfp410.c
> > +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
> > @@ -155,7 +155,7 @@ static int tfp410_attach(struct drm_bridge *bridge,
> >               return -ENODEV;
> >       }
> >
> > -     if (dvi->next_bridge->ops & DRM_BRIDGE_OP_DETECT)
> > +     if (dvi->next_bridge->ops & DRM_BRIDGE_OP_HPD)
> >               dvi->connector.polled =3D DRM_CONNECTOR_POLL_HPD;
> >       else
> >               dvi->connector.polled =3D DRM_CONNECTOR_POLL_CONNECT | DR=
M_CONNECTOR_POLL_DISCONNECT;
> >
>
> A Fixes tag is probably needed here ?
Thanks will do
>
> With that:
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>




--=20
Jonathan Cormier
Software Engineer

Voice:  315.425.4045 x222



http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211
