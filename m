Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA7BC258DB
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 15:24:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B3B10EBC4;
	Fri, 31 Oct 2025 14:24:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="HHcUlPQY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A753410EBC4
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 14:24:23 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-63c21467e5bso4909848a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 07:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1761920661; x=1762525461;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UyvLR/aTPgdHtklMf3S8VVUt+hq3yvjQCoTbWQpjR1s=;
 b=HHcUlPQYTNFc7SC2Yo7rHBgqEa+gzlgQ5mybe1D1eFDPevK6sjUJTSAjFMbGPbgqOn
 EETi871vLemB9t93mbymxPqwFvbV3XpnHPDnlmuZ/Ov3v8s6mi5nkBtj9rPslBFwXdBR
 1fW2E8QnBAz4C4pRZpZhNS4s8SB09YFoe+yqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761920661; x=1762525461;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UyvLR/aTPgdHtklMf3S8VVUt+hq3yvjQCoTbWQpjR1s=;
 b=OmGWXR+pQxoCnjRSwaJsWI9Cu/y62TN7A59EwAmoXM0JfxCTgvRHIoIf+dYMVU+7Ci
 DDs+4GEAGu2RoSJ3npDKAo0t4F53hRhC5aJSpaeXTxjG5QFjLo/KZ6h8mgQxioRWmKh8
 I4Glpko2TeMykOw8fGkIzpyk+CEUWRK7pNYEx/KlICpx7oVHbP4MJdPuJYzb+KqQ9uvQ
 rAWx2ClJjfH4kYX9oImOhakpG7caYrmSMBjcJq+m3ztm/2x4vjkJxvqATWrqGc2DtCMN
 eiBpucp4vRMyzWw36jRFzV77gvD0BkjDb/PpMRxnenPOD7/cuP1SRPkxas9XmyVEFgRI
 +7mQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCyMjPHBH+AMCDwRr3SvUcupPOD4MgJBInXUdw7MqAPDbIuK52lyxwG6I7hAUPypLZ2K1aFwbfaEU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSR9IMtDdDYMH//vHgrmI5X0y4ywhBOauOda6nWh+n2aDKwVQ2
 WL3W0HHoClXvaBxjya3JrmLvqbHq+nWZG2rcD3IovDr0mZoCaCW06FrUDrAySlHOwQ6LboAQdAT
 UCATYA77g
X-Gm-Gg: ASbGncu5xsL7YOsDut3xB7NDDrSn6dS85vcqHNYMjyRry3G8nkri0YO5AAuAaUjiqME
 gnS8L3X/pxvXqkK7+WvoEN7vxvxyZfOwPyvaTVaLexgptE0sGIEh7R2YmlF/g1+iwIXdchW6zor
 YXjAO7A2JcKNvtjzzn1YZqyi/H+G4F0eygaK/p/WMY+oPbJBc2o+DU/Z6Vv+ZkWIHv0ORpMaWzJ
 OTSbC3mtHfhxgDtxYpTTL4KxTH2Ud+oDao2qJsj377zpV6GJgkzpnTECmcQ0kC6xYOGFVN7wJth
 xohuIOAXOn793x6wD63U/zUuIjhq92Gx3u3/pm1OCDM+zRDU97Obgwbi8K9Dhfr+IsesEEgHVRn
 BCJhEAgOnXXZ037B4jPaCUMVaJLvg1yg88JEt8NNaih+BxNO9HiO7VeAwPMk0YM0ETO4RZ4rKJm
 wHMOVqWVWu1xtCySPVAoFKKZ1LhSihFz3xEceVEPA=
X-Google-Smtp-Source: AGHT+IFD2m92+pDvhc6iBz1CHSCRxSEy3mCnu26ZqGfzviMOBEvH2IlXhcdIIcoRgzAlqdsqbNvLpw==
X-Received: by 2002:a05:6402:34d5:b0:637:8faa:9df7 with SMTP id
 4fb4d7f45d1cf-640771cee09mr2584308a12.29.1761920661155; 
 Fri, 31 Oct 2025 07:24:21 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com.
 [209.85.128.49]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6407b34a7c8sm1701945a12.5.2025.10.31.07.24.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Oct 2025 07:24:19 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-475dbc3c9efso14718405e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 07:24:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVc8OASD6+G/JBczyOgfEkyFck/H3X/78cH9fVcc/2byLdnrede9YOyvpn2zq1on5FiSsrERKXdQL4=@lists.freedesktop.org
X-Received: by 2002:a05:600c:608e:b0:475:d952:342f with SMTP id
 5b1f17b1804b1-477308cb956mr34652905e9.39.1761920659162; Fri, 31 Oct 2025
 07:24:19 -0700 (PDT)
MIME-Version: 1.0
References: <20251030094434.1390143-1-ajye_huang@compal.corp-partner.google.com>
 <CAD=FV=V6xV0m4pj=7f2dxDP-0A1AaQuYJP5NAnXNz1_bzH7nSw@mail.gmail.com>
 <7071a2b8198c09011c84d39b45dc6d1da4b69d12@intel.com>
 <789d88744fbd3a05758971dc8d893fb4599475f3@intel.com>
In-Reply-To: <789d88744fbd3a05758971dc8d893fb4599475f3@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 31 Oct 2025 07:24:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XuWkudYB3OhPZrLJ0jNXFRyV1c6=czqn2RUo2M9CES9Q@mail.gmail.com>
X-Gm-Features: AWmQ_bksWOd0CYzbEkU8DSTG-gAmtEAtGD6CyOC4AsR3tFevBy5nPue1f4Ho5ks
Message-ID: <CAD=FV=XuWkudYB3OhPZrLJ0jNXFRyV1c6=czqn2RUo2M9CES9Q@mail.gmail.com>
Subject: Re: [PATCH v1] drm/edid: add 6 bpc quirk to the Sharp LQ116M1JW10
To: Jani Nikula <jani.nikula@intel.com>
Cc: Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
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

On Fri, Oct 31, 2025 at 3:40=E2=80=AFAM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> On Fri, 31 Oct 2025, Jani Nikula <jani.nikula@intel.com> wrote:
> > On Thu, 30 Oct 2025, Doug Anderson <dianders@chromium.org> wrote:
> >> Hi,
> >>
> >> On Thu, Oct 30, 2025 at 2:44=E2=80=AFAM Ajye Huang
> >> <ajye_huang@compal.corp-partner.google.com> wrote:
> >>>
> >>> The Sharp LQ116M1JW105 reports that it supports 8 bpc modes,
> >>> but it will happen display noise in some videos.
> >>> So, limit it to 6 bpc modes.
> >>>
> >>> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> >>> ---
> >>>  drivers/gpu/drm/drm_edid.c | 3 +++
> >>>  1 file changed, 3 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> >>> index e2e85345aa9a..a73d37fe7ea1 100644
> >>> --- a/drivers/gpu/drm/drm_edid.c
> >>> +++ b/drivers/gpu/drm/drm_edid.c
> >>> @@ -250,6 +250,9 @@ static const struct edid_quirk {
> >>>         EDID_QUIRK('S', 'V', 'R', 0x1019, BIT(EDID_QUIRK_NON_DESKTOP)=
),
> >>>         EDID_QUIRK('A', 'U', 'O', 0x1111, BIT(EDID_QUIRK_NON_DESKTOP)=
),
> >>>
> >>> +       /* LQ116M1JW10 displays noise when 8 bpc, but display fine as=
 6 bpc */
> >>> +       EDID_QUIRK('S', 'H', 'P', 0x154c, EDID_QUIRK_FORCE_6BPC),
> >>
> >> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > FWIW,
> >
> > Acked-by: Jani Nikula <jani.nikula@intel.com>
>
> And as soon as I hit send, I notice the quirk is missing BIT(). It's a
> bit mask, and the enum signifies the bit number.

Crud, that's not good! Sorry for missing that. :( Definitely glad you notic=
ed!

From off-list communication, it sounds like there is still some
digging going on to see what's really happening with this panel, too.
There is still some sort of mystery...


-Doug
