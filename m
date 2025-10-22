Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D7DBFAE05
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 10:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36FC10E6EC;
	Wed, 22 Oct 2025 08:24:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="I8Dyn2im";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 305FB10E6EC
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 08:24:52 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-7849c889ac8so10759707b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 01:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761121491; x=1761726291; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RXxaSNMDRj91FhueTL9SXO/VAqCmGMKRScvrihJDC2U=;
 b=I8Dyn2imASknr/JLTIUFwpAxEkj5oeFiOnafHqczdRsoFb4gtg4tlYFmejCx2daImK
 4FtMfhVzhJ4quWA009mvzRO8nvgUscqMNsLexaGh8D2UE2WDs1ojmYeNC9ucvR9edL1d
 MR2CibjVsT1YVq0KUWm4DlB5+9+Ox5Zhc15X9m614Izcnyj1wwrLDEEdOhgKXK5rc/ht
 Aes4eyfaJlTgbMQCNz3DjXa2TKPARgKra/sf0bazYzet/F+GJXOfarFBoBti+JkmCBXm
 vgjlQRR9fMOY6Hg9aMLQpQo999vZaSmxjysZu+piS52SSr/8Ll/glKe1F03IM1OScYx9
 reQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761121491; x=1761726291;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RXxaSNMDRj91FhueTL9SXO/VAqCmGMKRScvrihJDC2U=;
 b=sUAfZpsdxSvA6XAcY/pGOFb7cNMrmAKs2RodjEeNuvLdtZaqIUjy7BfzMq7dDzW6pB
 D0srxmYxO/glw3ZigYuehWCvtq/Qysu32RLvC9r39sq5A6umoNiYi4mz1+HJ6w4Ey6eT
 iYH6P8GnXtmUIKISeQq3Iq9C9kMRXDcJJOtn9IHDFmXIwDIkuIBLPmN7X8bDIXX+WCo6
 wnz7kSgEXhnKiQWAW7J/RpLHeMOhmvNqczdY6Jt95ItQVmyRfcEpKf3QtYBqiOkyINor
 KCxVPot/fIT5hNnDyBVTTL2uBYbvKfAaS5HTQEQRo62Qboa6gCl38TomwjtRM8+tIxuc
 ipjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCXTlw7McbnmS6UHY+ZhHYMGPR4si0Uxzep1jTeS10wYvZFuVAkdhSRy7PpFJX+dbUH6QnQPDSCj0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaujpT0TStWnrZO+GZcgO3Wb2NLNwgQ4mWniKuJOoPgCcYqXHc
 ysEtFpT88+z47FTmjLa1syoXZLFJ99GtP3m5jO8w9eQT//VZOQ5Z5NrOcJ3PUrUk8yUb4L21WOh
 g6DJR5WIcR/v3fYCodrRoRYRBwlYX/2KRY53cV7ZIvA==
X-Gm-Gg: ASbGncsLMVegFc5lzn9LoD/sQ9qxPHbtTEOL6TXETIAQ6K0VxNC4DmEM2bJ7WvE1mJr
 KpupEZ4fauqt+VF4R2r386bQwT5srWH2JYGwBaVCTLNHv78ENQnx2H1HDoIcV8dTS+rtedkMyn2
 tgcrMN5yJ9mBCbu1I0UOH3HQyHgXXTp7OrvV5qvI8R3Z2sWQHLpRAAe3JKlcKuOoUJkIjO3ADw6
 P1rPoB2WE0gYUMCd7kcS9J+mLp+m234tURlUACAkQs+BTbpXWrgY09C2FWeNhLeX4i/hCQ=
X-Google-Smtp-Source: AGHT+IERBbCdzrK/DnyqVvBrjv6GLzWwxwoEO7f9Mw9D/RkAigeGgzM8GB04mtMR32cqX6B3SnKkLTsVQyTiuof3lXc=
X-Received: by 2002:a05:690e:11cd:b0:63e:2b9e:1462 with SMTP id
 956f58d0204a3-63f2f624987mr358734d50.22.1761121490978; Wed, 22 Oct 2025
 01:24:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250605171524.27222-1-aradhya.bhatia@linux.dev>
 <20250605171524.27222-4-aradhya.bhatia@linux.dev>
In-Reply-To: <20250605171524.27222-4-aradhya.bhatia@linux.dev>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 22 Oct 2025 10:24:37 +0200
X-Gm-Features: AS18NWBhnPNxVBgcXMb7pCZGsTv2XFqiKsKzW4r9u2dZYTJ-75bh2elmyFMfPJQ
Message-ID: <CACRpkdaOyDJ-ur6iO8qnWesL1SZ9C-okWO353rUKpTO-q8urWA@mail.gmail.com>
Subject: Re: [PATCH v13 3/4] drm/atomic-helper: Re-order bridge chain
 pre-enable and post-disable
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Dmitry Baryshkov <lumag@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 DRI Development List <dri-devel@lists.freedesktop.org>, 
 Linux Kernel List <linux-kernel@vger.kernel.org>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Jayesh Choudhary <j-choudhary@ti.com>, 
 Alexander Sverdlin <alexander.sverdlin@siemens.com>
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

On Thu, Jun 5, 2025 at 7:15=E2=80=AFPM Aradhya Bhatia <aradhya.bhatia@linux=
.dev> wrote:

> From: Aradhya Bhatia <a-bhatia1@ti.com>
>
> Move the bridge pre_enable call before crtc enable, and the bridge
> post_disable call after the crtc disable.

This commit regresses the MCDE driver to a hard boot failure.
Reverting the patch fixes the issue.

I think it has something to do with the internal DSI bridge in
drivers/gpu/drm/mcde/mcde_dsi.c

Any hints to what needs to be fixed here?

Yours,
Linus Walleij
