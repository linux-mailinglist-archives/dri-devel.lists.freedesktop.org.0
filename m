Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A2DC9CEEB
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 21:35:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B5F10E6C9;
	Tue,  2 Dec 2025 20:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MSsY1Q9R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8605E10E6C4
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 20:35:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8ED7760153
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 20:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 438BFC4CEF1
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 20:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764707739;
 bh=fw3vvCO25y2QsEtxQr3J1GyiYMB72VrlHeF4NTnUQqM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MSsY1Q9RCpZtv5Vyvg/sUp5gnbAenL0h7nDk8HEZksWy7rx/IWN/iaSBdcT13LvNu
 n1p0E67G+jjn9+R3TEuyGVPa8+8cxGAd1rT0bZOgXQPMMs2uHu3MOWcKicVlj6EVfU
 pNqDe18bGx8nEJRYzciZPPXApFKzxdD224IN3W4McDDtpNNkWe/NrGlkIeaHpTlppT
 IO0yuQ7ve4VTq0g/X+CM52cNVddfkA4buhVXtDU1V5pC7y6Ip8jFe4HO+eFuS5Aqk5
 FUD9rsmOJKkFD/CmLaamJvEeL3mOXznPVu7W8WEdiqRZrYn99I4v37f1meJRsjElon
 0Z7Hgtkiq8Fsw==
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-789524e6719so4117967b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Dec 2025 12:35:39 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVmcPzM6YpO4vIByQqKYunYnh+oKiMSTb7GdaZWGt8MFZzyOT1j8YQWDh8qCvH1emyh2zElppnZeK4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymYewXkygmeavnQuBYYnG0EHIToyDglv1FbPixKU7RK00V4YMk
 /AGUkKKgwUif1c70gM7ySclyQqFw/DHpVde0lG10dGTLMRgVeRaE20vYcey03oAed9ZEAma+1mx
 RJeRrfWP78kT6Bj1+c0OesMLnJLh36c8=
X-Google-Smtp-Source: AGHT+IHig/urPkaR1oA+wP6UgSBaE9q1ljtg9f8Gcd/QeEE1KBA/BNINyk+rLkEuRB3QcVgUPL0PGjj/DJwLFXDY/xU=
X-Received: by 2002:a05:690c:399:b0:78a:834e:b106 with SMTP id
 00721157ae682-78bff634c32mr31924477b3.25.1764707738655; Tue, 02 Dec 2025
 12:35:38 -0800 (PST)
MIME-Version: 1.0
References: <20251130-mcde-drm-regression-thirdfix-v5-0-aed71a32981d@kernel.org>
 <20251202063403.GA18267@pendragon.ideasonboard.com>
In-Reply-To: <20251202063403.GA18267@pendragon.ideasonboard.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 2 Dec 2025 21:35:26 +0100
X-Gmail-Original-Message-ID: <CAD++jLn5NmPubNm_hv9xCSvbY9pAKj_GLFWC1Hq5YP6ZHP=UZg@mail.gmail.com>
X-Gm-Features: AWmQ_bniAk89rICI8zBhXLsMDXs2C_Zjmwnz8XeXqKahgHSWRTnp_0PHlTf_qEc
Message-ID: <CAD++jLn5NmPubNm_hv9xCSvbY9pAKj_GLFWC1Hq5YP6ZHP=UZg@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] drm/atomic-helpers: Fix MCDE/R-Car DU regressions
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Aradhya Bhatia <a-bhatia1@ti.com>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
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

On Tue, Dec 2, 2025 at 7:34=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:

> We now have a third platform broken by
> c9b1150a68d9362a0827609fc0dc1664c0d8bfe1, see [1]. I think this calls
> for a revert, to give us the time to implement a correct solution.
>
> [1] https://lore.kernel.org/r/CAAMcf8Di8sc_XVZAnzQ9sUiUf-Ayvg2yjhx2dWmvvC=
nfF3pBRA@mail.gmail.com

This is a mess.

But OK let's see if we can deal with the mess.

I will make an RFT patch for Rockchip as well and resend at the
tail of the patch series if we want to try to fix also that one.

Yours,
Linus Walleij
