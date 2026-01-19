Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED68AD3A226
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 09:54:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C0B10E2BE;
	Mon, 19 Jan 2026 08:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NISdHHjr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED9910E2BE
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:54:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7538E444EE
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:54:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D071C2BCB1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768812882;
 bh=AfAFiAKqGuf4s4xS3t6rG82aL2XtowFNMfmV8sPSb4o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NISdHHjrH8h5CDOSzyncEnUY8cPRf27d3DeQzoulmU+Avg3x3HTsdoAhTpRESpqqS
 0HFdBjPJWMto/P4ZENYva2l9+mOFMi81NwH+9X6A3KjY+ErI0T8bYBxyc6ilB7M/yV
 Bed6aGnZWrCIZOxfhqShKfRXpzitEthqFOKRuI9yP5EFulV4C/5/aK2xItNq6VXyuh
 3PFIK4sVzT4ivAAHgdOQjCgRfnCGwRzkXVjZUMhKeA83zBoeUYvAzWOhqIZE19J+WW
 E9/D8ItKjIBgC3H23v5QtitkOiuZ4bmNrRFOS1Rv+YvSZpYUrtUT8X0uJmrDf2U9fr
 5OLYIaTxA4oBg==
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-78f89501423so48992037b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 00:54:42 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV1o8ALICovN3eL/O8/VilMvIHULNR24SDhX2U3LF+bswwQ+tma2BcTyeKkNQCI9m2X9Yc8FGVfc+w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMRIDMrll+ay15tOvc/84XZabHIfktUqJKFFSrsBgjZgR4WiJr
 BEkzFy00dH5cu3OxtnvH+Hz7PTOGonYOJeNKhOO7qFjeYipotgNpJMLgK3PUhJca9WL3ecKAren
 PEEMhOHpyauIOvqXIUZps8hOGSHG+oPc=
X-Received: by 2002:a05:690e:4004:b0:646:44ef:cee0 with SMTP id
 956f58d0204a3-6490a6045b0mr10201129d50.16.1768812881615; Mon, 19 Jan 2026
 00:54:41 -0800 (PST)
MIME-Version: 1.0
References: <20260116-drm-bridge-alloc-getput-drm_of_find_bridge-4-v1-0-e34b38f50d27@bootlin.com>
 <20260116-drm-bridge-alloc-getput-drm_of_find_bridge-4-v1-3-e34b38f50d27@bootlin.com>
In-Reply-To: <20260116-drm-bridge-alloc-getput-drm_of_find_bridge-4-v1-3-e34b38f50d27@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 19 Jan 2026 09:54:30 +0100
X-Gmail-Original-Message-ID: <CAD++jLm_Va+7c_usgoPDhsDiCr4NQMZWsQ3iJW5-a1ETP4EaJQ@mail.gmail.com>
X-Gm-Features: AZwV_QiQiCvJPbJl4OoLpqmgSDxUUuEabMx18a-5zdnevAobr9Cg_QY0Ktd2TjE
Message-ID: <CAD++jLm_Va+7c_usgoPDhsDiCr4NQMZWsQ3iJW5-a1ETP4EaJQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm/mcde: dsi: warn in case of multiple subnodes
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

> mcde_dsi_bind() has a loop over all subnodes looking for a panel, but doe=
s
> not exit when a match is found and only stores the last match. However th=
is
> will be problematic when introducing refcounting on the struct drm_device
> pointer in a following commit, because of_drm_find_and_get_bridge() would
> get a reference to multiple bridges.
>
> Assuming there is no real reason for looking for multiple panels, add a
> warning so it gets noticed in case the assumption is wrong.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> ---
>
> I think the correct thing to do would be adding a break statement when
> there is a match. However I don't have knowledge of this driver and the
> hardware, thus this patch is a prudential alternative, not changing the
> behaviour.

Go ahead and insert a break when the panel is found, there is
no MCDE-attached device with more than one panel.

There *exist* the Samsung Gavini device which has a
LED panel, *and* the same lines attached to a mini-projector
so these two can be used at the same time. I have no idea
how to actually deal with that if someone one day want to
support it. Probably by putting the projector as a side thing
and not deal with the video stream in the device tree.

Yours,
Linus Walleij
