Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C69E4C79F9F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 15:08:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA79410E87F;
	Fri, 21 Nov 2025 14:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="O9IpAzoB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E30B10E87F
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 14:08:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 82809602CA
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 14:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B7F8C116D0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 14:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763734113;
 bh=0fCbJXVaRsjMjtguRu/YsukqpYHe/AkvAEGzOZNdCgo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=O9IpAzoBuVRMrevcA/LP5+FxO+d7THQqqggg2UnDtDZQ7D9SRR1R8DXG3oRqWHdnW
 n/T9VCkUo9kVuBZr718MbtzS9o4CMjme3wwo94EQRgvdLGDowxTLkkNIvDnB+ZSHin
 heyTKVZnoH9YV3KGLy9j+a7K/duhiSCiPIpCf6vGq+Pq0rx03lDv2gdWz3w0LuQEcp
 OrVfEvyjm/Oae9YXK7xNytGNYETnThyIhSjTj0fY9R+GZ+90L8sMeYlklloYSsppFU
 ehkXwHQDD9Xc/3IwSoLJM7llM1ytFb6AdYsCwVQsKgo73jxVahR+P0nFTvghvg+whk
 IQIE75xsTvB3A==
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-7881b67da53so21220597b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 06:08:33 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWgz+mlFt+HfmsNBCi6j/qnXr8XX4JsSc8rr0tyPhgxkq1/BbnkMUJhuwMzCfGkCt4UoNzr22E5FPo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSXBuoCvRs+JxtUKaEfxyQJUAEALJ92QJcwgNGi3TPSd49LV6k
 K1z/liosXMGGnfrK373MvA0XUO/fBWwbGOSw8nN71SjS8a1ziQo5tIYku3E252T6jxhZKCTDZSN
 c9xKMF2NllkqAJ9rj1TUm2Ui+tI7ksCU=
X-Google-Smtp-Source: AGHT+IHn5jEsZ0BtZoSto5k16h0MyU6Y6yhqYrPHncjkwNUuqAj4geBqpE3DR4Uk9KNwriieQja2wt73XxPwhHdG6i8=
X-Received: by 2002:a05:690c:48c4:b0:784:f14d:6946 with SMTP id
 00721157ae682-78a8b558e24mr18038797b3.55.1763734112542; Fri, 21 Nov 2025
 06:08:32 -0800 (PST)
MIME-Version: 1.0
References: <20251120-mcde-drm-regression-thirdfix-v3-0-24b1e9886bbf@linaro.org>
 <20251120-mcde-drm-regression-thirdfix-v3-3-24b1e9886bbf@linaro.org>
 <CAMuHMdW5SuSChcSz_DvHTBC=CQbaVaHZqRUM=DcD5mz0axrzyA@mail.gmail.com>
In-Reply-To: <CAMuHMdW5SuSChcSz_DvHTBC=CQbaVaHZqRUM=DcD5mz0axrzyA@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 21 Nov 2025 15:08:21 +0100
X-Gmail-Original-Message-ID: <CAD++jLm+3=9fQh1bSMjXF0WitPmvCpRRSTac_tiLVtaVwzHWUA@mail.gmail.com>
X-Gm-Features: AWmQ_bl73q8t03jFuPMAfW_tRiVDAo8JLkMwiotfhKXRVPKG6_ka_qrjVQozlrs
Message-ID: <CAD++jLm+3=9fQh1bSMjXF0WitPmvCpRRSTac_tiLVtaVwzHWUA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] RFT: drm/rcar-du: Modify custom commit tail
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Aradhya Bhatia <a-bhatia1@ti.com>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
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

Hi Geert,

thanks for your help!

On Fri, Nov 21, 2025 at 9:52=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:

> > +       /* Variant of drm_atomic_helper_commit_modeset_disables() */
> > +       drm_encoder_bridge_disable(dev, state);
>
> drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c:555:41: error: =E2=80=98sta=
te=E2=80=99
> undeclared (first use in this function); did you mean =E2=80=98statx=E2=
=80=99?
>
> old_state (everywhere)?

Fixing it up and sending v4 FWIW (we still don't know if we go this route).

> After making that change, it still works on Koelsch (R-Car M2-W),
> which was not affected by the breakage.

Recording this as Tested-by!

Yours,
Linus Walleij
