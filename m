Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CC7BD1D9E
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 09:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5AA78908B;
	Mon, 13 Oct 2025 07:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=temperror (0-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="G3uCQv8b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 393 seconds by postgrey-1.36 at gabe;
 Mon, 13 Oct 2025 07:42:08 UTC
Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB91C8908B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 07:42:08 +0000 (UTC)
Received: from relay10 (localhost.localdomain [127.0.0.1])
 by relay10.grserver.gr (Proxmox) with ESMTP id 42BB73F6E8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 10:35:33 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by relay10.grserver.gr (Proxmox) with ESMTPS id 703FA3F4E4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 10:35:32 +0300 (EEST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by linux3247.grserver.gr (Postfix) with ESMTPSA id 6CB641FE0C9
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 10:35:31 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1760340931;
 bh=9Hn+Kh+H9BYteHAfZAHvtY3fRWrAQB1UoP7oJwMqcNQ=;
 h=Received:From:Subject:To;
 b=G3uCQv8bPVaiS6LvOfprEyW+itNgwcd+37gZ7L3dkxcKvbsvPZfYOpXHscEvqoGbY
 osFHllYRoPjNL3vVNUj8ewHyV/Y72GHtzGJIpFwDBvrHcr4CflpFIkAmkNlfo+H39t
 zfGh4LI63uWoiSyGZO6uvLPuLGULBHqyyWRp0uFYrjdlaSI+oZbp1BPZNYwTxc9Fzy
 1Gv0OwrrfEtlLnGsWjPIUAcORr6U0IrooC0xVYbpYjcOfra4jEtf2P8RdKtbdd4z/V
 uGJJ2fi0Md9xYXdlBM5TFplRrTDNquf7qUcs7o+L23NMlIyr1N+W+/DqDlJQYFV6/w
 gsu/H4BsjBFGQ==
Authentication-Results: linux3247.grserver.gr;
 spf=pass (sender IP is 209.85.208.180) smtp.mailfrom=lkml@antheas.dev
 smtp.helo=mail-lj1-f180.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-36a448c8aa2so33569991fa.0
 for <dri-devel@lists.freedesktop.org>;
 Mon, 13 Oct 2025 00:35:31 -0700 (PDT)
X-Gm-Message-State: AOJu0YxlEy7AeHWxse8PZAWNyg18YGr/SiwGqIDNSrtcOWN+HC9uU+7B
 +Nd2N6/Pu7q/U0MAjDURDi8oXps63Y/LSWY+l7MbTNriPDI9E2l5wosKiOfhqIx90HecGK1nm/L
 u7q0wRmmhFumYeQS4PBmURKFoWLi4Pso=
X-Google-Smtp-Source: AGHT+IGhL2/hPSVmQ9/g7fkwl+8HCJEvNwUHqNc+SjupFlRWyGcojcgyopcQdncqUTJ3+gEMsIQUOfnoMI7YIJ6vm1A=
X-Received: by 2002:a05:651c:2126:b0:372:921b:4b7e with SMTP id
 38308e7fff4ca-37609e46310mr51045141fa.27.1760340930853; Mon, 13 Oct 2025
 00:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250904175025.3249650-1-lkml@antheas.dev>
In-Reply-To: <20250904175025.3249650-1-lkml@antheas.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 13 Oct 2025 09:35:19 +0200
X-Gmail-Original-Message-ID: <CAGwozwGn3iJLHhSZrokf_V+HELjUSMBnANxcrL3rHi7bjZ57sw@mail.gmail.com>
X-Gm-Features: AS18NWAxC-PYeN9MBQ07gyyTFLN-0TuITGjqsU6t4YtDjnw8Ngcekh9sQdZXDbU
Message-ID: <CAGwozwGn3iJLHhSZrokf_V+HELjUSMBnANxcrL3rHi7bjZ57sw@mail.gmail.com>
Subject: Re: [PATCH v1 00/10] drm: panel-orientation-quirks: Add various
 handheld quirks
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, philm@manjaro.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: <176034093167.240229.14753740427113530024@linux3247.grserver.gr>
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

On Thu, 4 Sept 2025 at 19:50, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>
> Adds a bunch of handheld orientation quirks that collected in the Bazzite
> kernel. I made sure they are alphabetically sorted. In addition, to keep
> the series short, I grouped variants of the same device together.
>
> Antheas Kapenekakis (10):
>   drm: panel-orientation-quirks: Add AOKZOE A1 Pro
>   drm: panel-orientation-quirks: add additional ID for Ayaneo 2021
>   drm: panel-orientation-quirks: Add Ayaneo 3
>   drm: panel-orientation-quirks: Add OneXPlayer X1 variants
>   drm: panel-orientation-quirks: Add OneXPlayer X1 Mini variants
>   drm: panel-orientation-quirks: Add OneXPlayer F1 variants
>   drm: panel-orientation-quirks: Add OneXPlayer G1 variants
>   drm: panel-orientation-quirks: Add GPD Win Max (2021)
>   drm: panel-orientation-quirks: Add GPD Pocket 4
>   drm: panel-orientation-quirks: Add Zeenix Lite and Pro
>
>  .../gpu/drm/drm_panel_orientation_quirks.c    | 108 ++++++++++++++++++
>  1 file changed, 108 insertions(+)

Can I get a bump on this? New ones just keep coming out we need to
start merging them sometime

Antheas

>
> base-commit: 1b237f190eb3d36f52dffe07a40b5eb210280e00
> --
> 2.51.0
>
>

