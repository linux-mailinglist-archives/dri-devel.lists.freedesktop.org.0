Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49762B389C9
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 20:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B9710E88B;
	Wed, 27 Aug 2025 18:41:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=temperror (0-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="QYRo/op8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E1710E0FA;
 Wed, 27 Aug 2025 18:41:33 +0000 (UTC)
Received: from relay11 (localhost.localdomain [127.0.0.1])
 by relay11.grserver.gr (Proxmox) with ESMTP id 97A38CB498;
 Wed, 27 Aug 2025 21:41:31 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by relay11.grserver.gr (Proxmox) with ESMTPS id C78CCCB47E;
 Wed, 27 Aug 2025 21:41:30 +0300 (EEST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by linux3247.grserver.gr (Postfix) with ESMTPSA id 3F86E201A63;
 Wed, 27 Aug 2025 21:41:30 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1756320090;
 bh=h/xwF0KGq3gWr9pBxJyflxpPHXZc98CA4hW7pDTkw2U=;
 h=Received:From:Subject:To;
 b=QYRo/op8RVr9M6QgyvKRSmcuZrGtmAq5RnrGNTMnAaIFqXouoMcIKjdmaDV4xERn5
 kEQNUja8J0H2N2froJT3gVXlkLbfzFjKTgO1VFzM7oV6js8XwYtP/q6Fjq+TdyN2xp
 ZWlgx+AFXaIYD1tIPBsc/YfJkNjQfY8CarmEaeHGaS3X9iBvZdF27KOl2EAft3v1sc
 ZspWf+ZEhxSzzTLi63Nr5tGk1tXZGHo+JEOyBvFwEEmBop+C3UsLq6RBNrbIhuFa+X
 bSoLDTl+VdNo4oKrz0DQIq2lveJqsrh4fjPKFMJMak8WoZXvwK7rGkeLnuLqOha42Q
 L/la1DrTXZNcg==
Authentication-Results: linux3247.grserver.gr;
 spf=pass (sender IP is 209.85.167.43) smtp.mailfrom=lkml@antheas.dev
 smtp.helo=mail-lf1-f43.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-55f4bcceed0so175159e87.1;
 Wed, 27 Aug 2025 11:41:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXi2cNRUmPNGwF6bA0YMPUS7sdSuif1o0t/fAnwoAqKcPD5UMqETdjYuUO4ANAaiGxn5PG17G+zWGU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFEIjTH1Ts6vxm87RwYZxMe1B3PF8bRc0jBwlCyxiymI2M6ClL
 hjXdHrFQmOyF33EBR8OpiOBLxGkCjxb5gbcOVUpD9OreL9bRwmZ+y7YZoXNSUA33yPZyWzrdH/j
 WpNTYJiLDqhxLUgOuABpRlH2/RspPasc=
X-Google-Smtp-Source: AGHT+IFowAHaq81ABZaML4u4gPHxCp/F5971pDuQNrnE6hyA8KydV5GiZxPbrmTwchwoaJKakcXNjrp/jNeC1+Vo5qs=
X-Received: by 2002:a05:6512:438d:b0:55f:4e8a:19ad with SMTP id
 2adb3069b0e04-55f4e8a1b62mr1685248e87.13.1756320089546; Wed, 27 Aug 2025
 11:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250827174400.3692549-1-lkml@antheas.dev>
 <607d5062-1734-46c4-b851-782bd7ad3ec7@amd.com>
In-Reply-To: <607d5062-1734-46c4-b851-782bd7ad3ec7@amd.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 27 Aug 2025 20:41:18 +0200
X-Gmail-Original-Message-ID: <CAGwozwF-7Z_Yy8-w+EJxcJJ-1dKCtTMY356PR--EqWfyVHt+rA@mail.gmail.com>
X-Gm-Features: Ac12FXxVD93_TcP1vy6NnC0zXLOoeVeltkj1_FC6_57yxmPfrnK8qD9vTRAr9oQ
Message-ID: <CAGwozwF-7Z_Yy8-w+EJxcJJ-1dKCtTMY356PR--EqWfyVHt+rA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] drm: panel-backlight-quirks: Do partial refactor
 and apply OLED fix
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, philm@manjaro.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Robert Beckett <bob.beckett@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: <175632009049.1615478.6730903780175231445@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean
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

On Wed, 27 Aug 2025 at 20:38, Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> On 8/27/2025 12:43 PM, Antheas Kapenekakis wrote:
> > This is an alternative to [1], since Phil found out there are still invalid
> > values. We need to reconsider the other patch in that series anyway because
> > the latest AMD firmware update might have fixed the Z13.
> >
> > This series refactors the panel-backlight-quirks code to make it easier to
> > add new quirks. Specifically, it adds the ability to bind to a secondary
> > DMI match so that the make of a device can be specified. Then, it makes
> > EDID optional, for devices we know the value should be applied universally.
> >
> > This is then used to add a quirk for OLED panels that have an issue
> > when their backlight is set with a value that contains a 0/1 value in their
> > minor byte. This issue affects four handhelds from three different vendors,
> > three of which are in the field. This quirk applies a |3 mask to the
> > backlight value, which avoids this issue. In addition, the value change
> > is minor enough so that it is essentially a NOOP. There is no need for
> > ensuring it runs only on panels with faulty firmwares.
> >
> > Finally, since allowed by this refactor, a quirk for Steam Decks is added
> > that lowers their minimum brightness to 0, matching SteamOS. This is
> > a nicety commit, which allows for mildly lower minimum brightness, so
> > there is no time sensitivity for having it merged. Mario noted that if
> > that quirk was refactored to use an EDID match via the current interface,
> > it could go through the fixes tree and land sooner, but perhaps it is not
> > worth the effort.
> >
> > [1] https://lore.kernel.org/all/20250824085351.454619-2-lkml@antheas.dev/
> >
> > ---
> > V1: https://lore.kernel.org/all/20250824200202.1744335-1-lkml@antheas.dev/
> >
> > Changes since v1:
> > - Remove leftover quirk from patch 3 (refactor)
> > - Add dangling comma in patch 4 (oled quirk)
> > - Add the next generation Zotac Zone in patch 4 (currently unreleased)
>
> Can you double check with Phil?  I thought there are two affected Zotac
> devices, but I could be wrong.  If we can get both in a single go let's
> do it.

Indeed. V1 already included the released model. Hopefully I did not
get the ID wrong on this one.

> > - Reword patch 1 and 5 subjects
> >
> > Antheas Kapenekakis (5):
> >    drm: panel-backlight-quirks: Make EDID match optional
> >    drm: panel-backlight-quirks: Convert brightness quirk to generic
> >      structure
> >    drm: panel-backlight-quirks: Add secondary DMI match
> >    drm: panel-backlight-quirks: Add brightness mask quirk
> >    drm: panel-backlight-quirks: Add Steam Deck brightness quirk
> >
> >   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  19 ++-
> >   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   6 +
> >   drivers/gpu/drm/drm_panel_backlight_quirks.c  | 113 ++++++++++++++----
> >   include/drm/drm_utils.h                       |   8 +-
> >   4 files changed, 115 insertions(+), 31 deletions(-)
> >
> >
> > base-commit: 1b237f190eb3d36f52dffe07a40b5eb210280e00
>
> The series looks fine to me.
>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>
> I have two small nits though:
>
> 1) Because this is "effectively" going to limit the amount of brightness
> values available I think there should be a message when a the brightness
> mask quirk is in use that we can get in the logs so that the changed
> behavior isn't totally surprising.  We have some similar messages for
> DMI detected quirks in amdgpu already.
>
>                 drm_info(dev, "support_edp0_on_dp1 attached\n");
>                 drm_info(dev, "aux_hpd_discon_quirk attached\n");
>
> Can you add one for this new quirk?
>
> 2) The comment for 'brightness_mask' in patch 4 should have 'or' as 'OR'
> so it's obvious that it's logical OR to the casual reader and not a
> typographical error.
>
> IE "After deriving brightness, OR it with this mask."
>

Ack. I will give it 1-2 days for more feedback and resend.

Antheas

