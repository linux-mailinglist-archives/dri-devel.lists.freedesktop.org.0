Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F226DEBC6
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 08:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC72910E6F2;
	Wed, 12 Apr 2023 06:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 640CF10E6F2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 06:25:39 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-54c17fa9ae8so300330937b3.5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 23:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1681280738; x=1683872738;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jhpyBirk3tYbblseoMyBba93jj3Bl/duZG+Dack8flE=;
 b=grGlxbpyy8NfuDw2kUj/q+KkbN2kiqb1LtrqmIYRqtx2XVb2lcxd49dFz5ggkXg5x5
 gO3ppDDV6t9zfmgCMA+/jXNRa7VsX/Ftomi9M3nNytRUiHQsRfYBWleqEVuv0QIJxP3C
 SMVMQMzbkrnaO1NkziVN8N2y5ACDclLbgxa90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681280738; x=1683872738;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jhpyBirk3tYbblseoMyBba93jj3Bl/duZG+Dack8flE=;
 b=jGMUQxJ2s8nejUW/JeePaB+BMae/YQoYMnumY+YpauhwRvDImNSnXO2YUX7TaCY0tX
 WupC286REHp0bFp2kN7pcNAoRuCUh+af7nQR6uN+H8YHtyGMh3yY6V6ce9IVXi423nyz
 oVr08+dpPrfREfgncSRYnBPBOrXWqbuX2IVOkWNftXg3mbh6Ukrod3m2okT85fjo/Hgr
 q0mzZT00hGNVOJb9O0ghT7ItGRlJsf8GkUK/VyCod4vd0UE8wdcgcbr3a9mX+FRwOmYS
 R8o9jbY/WzJw9XPpS1dw+INbjrYMuh83DeR1t8Q2ZVOZTr++3tpdVGfO/FJquNtsc/Ud
 Lrzw==
X-Gm-Message-State: AAQBX9e1s59l6eB7vQjggXF2aqd5x64RWhEqOuIawVUOL/V9i6exQvhJ
 3kVmmb0VhSjlrv/tKgA/xR2cIygdPD5SARWqjNC0Hg==
X-Google-Smtp-Source: AKy350YSTeHGYU2/C6QSrrxqNviNP2zksoKcUwdUpaGiLruK7+7kEG+tLjFYGvf9vxmYedH/KOVWstc+TMfHW2WMi0A=
X-Received: by 2002:a81:b61c:0:b0:54f:a5f0:2763 with SMTP id
 u28-20020a81b61c000000b0054fa5f02763mr137333ywh.0.1681280738040; Tue, 11 Apr
 2023 23:25:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230328170752.1102347-1-jagan@amarulasolutions.com>
In-Reply-To: <20230328170752.1102347-1-jagan@amarulasolutions.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 12 Apr 2023 11:55:26 +0530
Message-ID: <CAMty3ZBnAw+VHXoZuSgZPmSTMYd-nxBw5cZ+OxLYxqrXRX=MNg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/bridge: Fix improper bridge init order with
 pre_enable_prev_first
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Maxime Ripard <mripard@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

Added Maxime, Laurent [which I thought I added before]

On Tue, Mar 28, 2023 at 10:38=E2=80=AFPM Jagan Teki <jagan@amarulasolutions=
.com> wrote:
>
> For a given bridge pipeline if any bridge sets pre_enable_prev_first
> flag then the pre_enable for the previous bridge will be called before
> pre_enable of this bridge and opposite is done for post_disable.
>
> These are the potential bridge flags to alter bridge init order in order
> to satisfy the MIPI DSI host and downstream panel or bridge to function.
> However the existing pre_enable_prev_first logic with associated bridge
> ordering has broken for both pre_enable and post_disable calls.
>
> [pre_enable]
>
> The altered bridge ordering has failed if two consecutive bridges on a
> given pipeline enables the pre_enable_prev_first flag.
>
> Example:
> - Panel
> - Bridge 1
> - Bridge 2 pre_enable_prev_first
> - Bridge 3
> - Bridge 4 pre_enable_prev_first
> - Bridge 5 pre_enable_prev_first
> - Bridge 6
> - Encoder
>
> In this example, Bridge 4 and Bridge 5 have pre_enable_prev_first.
>
> The logic looks for a bridge which enabled pre_enable_prev_first flag
> on each iteration and assigned the previou bridge to limit pointer
> if the bridge doesn't enable pre_enable_prev_first flags.
>
> If control found Bridge 2 is pre_enable_prev_first then the iteration
> looks for Bridge 3 and found it is not pre_enable_prev_first and assigns
> it's previous Bridge 4 to limit pointer and calls pre_enable of Bridge 3
> and Bridge 2 and assign iter pointer with limit which is Bridge 4.
>
> Here is the actual problem, for the next iteration control look for
> Bridge 5 instead of Bridge 4 has iter pointer in previous iteration
> moved to Bridge 4 so this iteration skips the Bridge 4. The iteration
> found Bridge 6 doesn't pre_enable_prev_first flags so the limit assigned
> to Encoder. From next iteration Encoder skips as it is the last bridge
> for reverse order pipeline.
>
> So, the resulting pre_enable bridge order would be,
> - Panel, Bridge 1, Bridge 3, Bridge 2, Bridge 6, Bridge 5.
>
> This patch fixes this by assigning limit to next pointer instead of
> previous bridge since the iteration always looks for bridge that does
> NOT request prev so assigning next makes sure the last bridge on a
> given iteration what exactly the limit bridge is.
>
> So, the resulting pre_enable bridge order with fix would be,
> - Panel, Bridge 1, Bridge 3, Bridge 2, Bridge 6, Bridge 5, Bridge 4,
>   Encoder.
>
> [post_disable]
>
> The altered bridge ordering has failed if two consecutive bridges on a
> given pipeline enables the pre_enable_prev_first flag.
>
> Example:
> - Panel
> - Bridge 1
> - Bridge 2 pre_enable_prev_first
> - Bridge 3
> - Bridge 4 pre_enable_prev_first
> - Bridge 5 pre_enable_prev_first
> - Bridge 6
> - Encoder
>
> In this example Bridge 5 and Bridge 4 have pre_enable_prev_first.
>
> The logic looks for a bridge which enabled pre_enable_prev_first flags
> on each iteration and assigned the previou bridge to next and next to
> limit pointer if the bridge does enable pre_enable_prev_first flag.
>
> If control starts from Bridge 6 then it found next Bridge 5 is
> pre_enable_prev_first and immediately the next assigned to previous
> Bridge 6 and limit assignments to next Bridge 6 and call post_enable
> of Bridge 6 even though the next consecutive Bridge 5 is enabled with
> pre_enable_prev_first. This clearly misses the logic to find the state
> of next conducive bridge as everytime the next and limit assigns
> previous bridge if given bridge enabled pre_enable_prev_first.
>
> So, the resulting post_disable bridge order would be,
> - Encoder, Bridge 6, Bridge 5, Bridge 4, Bridge 3, Bridge 2, Bridge 1,
>   Panel.
>
> This patch fixes this by assigning next with previou bridge only if the
> bridge doesn't enable pre_enable_prev_first flag and the next further
> assign it to limit. This way we can find the bridge that NOT requested
> prev to disable last.
>
> So, the resulting pre_enable bridge order with fix would be,
> - Encoder, Bridge 4, Bridge 5, Bridge 6, Bridge 2, Bridge 3, Bridge 1,
>   Panel.
>
> Validated the bridge init ordering by incorporating dummy bridges in
> the sun6i-mipi-dsi pipeline
>
> Fixes: 4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_first to
> alter bridge init order")
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v2:
> - add missing dri-devel in CC

Would you please look into this issue?

Thanks,
Jagan.
