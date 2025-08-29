Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB52EB3BEC7
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 17:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C95B10EBF6;
	Fri, 29 Aug 2025 15:01:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=temperror (0-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="TqUuHgBs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 360FB10EBF6;
 Fri, 29 Aug 2025 15:01:36 +0000 (UTC)
Received: from relay12 (localhost [127.0.0.1])
 by relay12.grserver.gr (Proxmox) with ESMTP id D1E8ABDD1C;
 Fri, 29 Aug 2025 18:01:34 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by relay12.grserver.gr (Proxmox) with ESMTPS id 0961FBDCDE;
 Fri, 29 Aug 2025 18:01:34 +0300 (EEST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by linux3247.grserver.gr (Postfix) with ESMTPSA id 72FD2206A57;
 Fri, 29 Aug 2025 18:01:33 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1756479693;
 bh=1U1DVmXJsHIcYVFTEM7DLCbaTODSc/fo7E8poybOfSY=;
 h=Received:From:Subject:To;
 b=TqUuHgBsKB68zeDa7u9hG2gNOYhoYFqchDtCi+s9f2baST7FdnvOKutzqdg34SBX1
 HZvoK8i4/q0QvKfT6kqL7YID3+UW8iiC3+aydjXYCqJwk4Ppe5a/vG9tzYz0fXMu5E
 68HTppw15c9GTADLjS738IElPHei9qmnKTStK8bfWJgzrECs9DVk8cfzOH6p2urTpw
 eWv9dUfRJkC683P1ZK+pHkQRsokipzSjN0MywUi0/1oCdIIBpqVpnCVQFWd83t8vm9
 VmAPyEypbxRKqJE3E3mBIxAWps3Df8qAv9E50giXN2Ry7D6VpRTCHeWIsCOnFemVHf
 c/OA4sm2zCSNg==
Authentication-Results: linux3247.grserver.gr;
 spf=pass (sender IP is 209.85.208.171) smtp.mailfrom=lkml@antheas.dev
 smtp.helo=mail-lj1-f171.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-336b63d2e56so7910931fa.2;
 Fri, 29 Aug 2025 08:01:33 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy2/pqNBGJciDzyTOkHdsWQ3xSzJnYjL8xWscGE/ItpQc6w933n
 BviqgvdT1rmXKIEWMxQd3CcGH82ArKrmPBIjAx9cYlHILnuI0XrTrJFRlNWLO70JuCc1yjgPKLg
 ewQNrbqQhEBNxWflWI7u0JFMMd7xq02I=
X-Google-Smtp-Source: AGHT+IHRhoVyBnlmRNxs8S4Qk6bIkWtYHJDTpiDTM7YphEyV8RPt1frLfQbtcxA0P5mt9fmdAI2jSHQkivKLQ3CsG7M=
X-Received: by 2002:a2e:be03:0:b0:336:7eed:2f8f with SMTP id
 38308e7fff4ca-3367eed3c67mr53490721fa.32.1756479693034; Fri, 29 Aug 2025
 08:01:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250829145541.512671-1-lkml@antheas.dev>
 <20250829145541.512671-7-lkml@antheas.dev>
In-Reply-To: <20250829145541.512671-7-lkml@antheas.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Fri, 29 Aug 2025 17:01:21 +0200
X-Gmail-Original-Message-ID: <CAGwozwHaWPwy6_LTvTy4ybdrN27fEXc-GbhYEt4_cM88_VGYPA@mail.gmail.com>
X-Gm-Features: Ac12FXwc-70TdRRuQwuWkUdiF-RAPppFFl03l0G0vTZarpoHRqwXFyxp5Symuao
Message-ID: <CAGwozwHaWPwy6_LTvTy4ybdrN27fEXc-GbhYEt4_cM88_VGYPA@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] drm: panel-backlight-quirks: Log applied panel
 brightness quirks
To: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 philm@manjaro.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Robert Beckett <bob.beckett@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: <175647969370.293109.2353577295138115310@linux3247.grserver.gr>
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

On Fri, 29 Aug 2025 at 16:57, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>
> Currently, when a panel brightness quirk is applied, there is no log
> indicating that a quirk was applied. Unwrap the drm device on its own
> and use drm_info() to log when a quirk is applied.
>
> Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 263f15f6fdea..2a3e17d83d6e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3617,13 +3617,15 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
>         struct drm_connector *conn_base;
>         struct amdgpu_device *adev;
>         struct drm_luminance_range_info *luminance_range;
> +       struct drm_device *drm;
>
>         if (aconnector->bl_idx == -1 ||
>             aconnector->dc_link->connector_signal != SIGNAL_TYPE_EDP)
>                 return;
>
>         conn_base = &aconnector->base;
> -       adev = drm_to_adev(conn_base->dev);
> +       drm = conn_base->dev;
> +       adev = drm_to_adev(drm);
>
>         caps = &adev->dm.backlight_caps[aconnector->bl_idx];
>         caps->ext_caps = &aconnector->dc_link->dpcd_sink_ext_caps;
> @@ -3659,12 +3661,20 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
>         panel_backlight_quirk =
>                 drm_get_panel_backlight_quirk(aconnector->drm_edid);
>         if (!IS_ERR_OR_NULL(panel_backlight_quirk)) {
> -               if (panel_backlight_quirk->min_brightness)
> +               if (panel_backlight_quirk->min_brightness) {
> +                       drm_info(drm,
> +                                "Applying panel backlight quirk, min_brightness: %d\n",
> +                                panel_backlight_quirk->min_brightness);

mmm, needs a -1 here

>                         caps->min_input_signal =
>                                 panel_backlight_quirk->min_brightness - 1;
> -               if (panel_backlight_quirk->brightness_mask)
> +               }
> +               if (panel_backlight_quirk->brightness_mask) {
> +                       drm_info(drm,
> +                                "Applying panel backlight quirk, brightness_mask: 0x%X\n",
> +                                panel_backlight_quirk->brightness_mask);
>                         caps->brightness_mask =
>                                 panel_backlight_quirk->brightness_mask;
> +               }
>         }
>  }
>
> --
> 2.51.0
>
>

