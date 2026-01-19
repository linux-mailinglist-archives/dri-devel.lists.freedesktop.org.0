Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E58D3A23D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 09:58:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C71C10E39B;
	Mon, 19 Jan 2026 08:58:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="i/mtPhXF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18AF710E39B
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:57:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 283E76014F
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:57:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4AA2C2BCB1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768813077;
 bh=eUIdkUA5rSHUc/16jWwY/MLc6uCqT0F2f5ANhd+0ZMI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=i/mtPhXFXtuQOx4GTYTOhellOiwIMNlHGM78B2WUjRqymYwTUeL2i8p2l0da/Sf5v
 Jw9h4qwOA7OtI672KQIJ7lekPY7xvnZjLVv9GaQmNfMeTNlrjG7qEegGPXf5+Zql+U
 GNMhXpSfl1t+0cIFkRZSAEFq+q+hWh3tq3KNbzazrpdQnm/u1949R5lDfqG0WjhF8E
 Yp2jpskWoathBbQgI+dkpyF45WoOgmePAiTbRrbTSWFL5b+a8ABa+1yAXm550OKJJY
 k2+h+ZEpWcWE18+r9Aee9pLmYVET1ROtnOJ4WYzsbXFDRPb9qkAkveNONEh28Bsx9o
 04FlmXVquVJLQ==
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-7927541abfaso36388637b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 00:57:57 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWwT+cROLW2jOceu0jLwgh6RM/TfGEWSJFpbDZpgE05E7U9gnQIpYVmHZLWwPOmzm0nhEYD1mPwDpI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2z+co/c1/H3T4SedEIb+1720Qi4Yfiljsz3W7TJ/aScSyuSa1
 bnLKXlKacj3YTXzT8LDx5IUU6nP9ZRT8VUS/Yw6y2q79+qEhkwHTfvw4JI8uMTevfBTbCfJi8Bb
 qkFWHmT0Q2A2L6NJOlzpavMqKe9kbutg=
X-Received: by 2002:a05:690c:e3e6:b0:793:c8ab:8bc5 with SMTP id
 00721157ae682-793c8ab8bcbmr75254207b3.46.1768813077137; Mon, 19 Jan 2026
 00:57:57 -0800 (PST)
MIME-Version: 1.0
References: <20260116-drm-bridge-alloc-getput-drm_of_find_bridge-4-v1-0-e34b38f50d27@bootlin.com>
 <20260116-drm-bridge-alloc-getput-drm_of_find_bridge-4-v1-4-e34b38f50d27@bootlin.com>
In-Reply-To: <20260116-drm-bridge-alloc-getput-drm_of_find_bridge-4-v1-4-e34b38f50d27@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 19 Jan 2026 09:57:45 +0100
X-Gmail-Original-Message-ID: <CAD++jLmriwfBaMKGP=-pOZyCnHZt78RKKURmOXuyNSTZz5geWQ@mail.gmail.com>
X-Gm-Features: AZwV_QisP2RcYqah-7gXatWhtjOE-lesyGnKBPPcwA2KdgqZekYhuvcO0Ej5zQQ
Message-ID: <CAD++jLmriwfBaMKGP=-pOZyCnHZt78RKKURmOXuyNSTZz5geWQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/mcde: dsi: convert to of_drm_find_and_get_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Edmund Dea <edmund.j.dea@intel.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
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

On Fri, Jan 16, 2026 at 6:33=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:

> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done.
>
> We need to handle the two cases: when a panel is found and when it isn't,
> even though the latter is not supported. So:
>
>  * in case a panel is not found and bridge is, get a reference to the
>    found bridge
>  * in case a panel is found, get a reference to the panel_bridge when it
>    is added, so the following code always get exactly one reference that
>    it needs to put
>
> Finally, use the next_bridge pointer in struct drm_bridge in order to
> simplify putting the reference.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

I do not understand the change as a whole but the approach
looks sane so:
Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
