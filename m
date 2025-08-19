Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BD9B2C7C0
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 16:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4807A10E610;
	Tue, 19 Aug 2025 14:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P65tBTnp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA9B810E1B6;
 Tue, 19 Aug 2025 14:58:42 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-76e2eaa6359so314518b3a.2; 
 Tue, 19 Aug 2025 07:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755615522; x=1756220322; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nfPFYHO8LgjsfMvxfw+sgzT7X98jNtWXiuJDEFaajRw=;
 b=P65tBTnpCYGZODldN+vJMR5YF1FKPXxxs/IPkdI2AdqDlEyR2N/BzaOYYXoRCyekgA
 EnWc18Vhb6XJ0YPQIweZ6Kgwx2URCnrbZtE/oWQm0MjoPzwTQcpad67C/AJhlbdzRJZu
 /odw30sF6gzR7GkWY2U3qcFVmnXKqKAMcRiOPO9dAOBQTuxLMUOnNMQEGin/NQ8GlnRK
 6DpxVS0/pm2zoEry9k9n4T6ps/+FQtSSGb6upCox08f1/6ptNNqQraXcsaqYp8VLbYCh
 isNuNNiplmPYFoSSvxgY9LXHaGQDi3D9Taxe2noTRvlgPRA5Mcvi5xDV7xbb4K+QxVkh
 BimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755615522; x=1756220322;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nfPFYHO8LgjsfMvxfw+sgzT7X98jNtWXiuJDEFaajRw=;
 b=XY0YTtE+OYHQs3JW8OOfTg5SaqwH4W1yyDfOHA4JNl0Qr0Dq/0Gg+uSIwOYmdlXzMV
 3e+jBWLz9W3tfftHXlTLAZ2sI/QAQxlqFXrh2MapB8NFb1GzjnUKnwnndPrnKvwihVfa
 iOgs8UaccwKi8qvT39Ioi1Mymld7ONPJA2GbMKvFRzMFDQZI9xRktXEXBIPrEi+Z/FXA
 YXt/639sh6JQe2apPvwgjcjt0pewZh7r9WvYPYswceK4WZOQ+OV915fqbou9Rn0zpcHz
 pj5Sp0MM5k1AZbq/3G26WSgJXJFOWWZk8VWHSjSOczknSvw9xf8lZjd0wgE8vXLNM0vM
 SZYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6LTqTlRqw3S1ICUc4MRUG7sPXlstJKS9jJkvRoXeLtNV7GIn8HlPt4SMb4EFONaiJNWfdXeth@lists.freedesktop.org,
 AJvYcCVduoK2oPjuaPBAHEGVIfUQGhdiZPSsKsylJNQnZ/2Et1Q8gedwLBkFgifJmTQdur8cG/u/S/GdvZr7@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxX3cOjsXatcWnEZfb/KbKBkBfKAv/IvrsVXUZ+yqpz/tVrt20r
 ZGJCzYMjqGfi2uRq2OC+jWh6S+Hn5EchYW1huLhMZWePyZQO2pgqKue9Wp/Zv7ylTcagPYFInTf
 +C1mPG9mFLah8KjqeUUxo8Mg05t3wLqs0lw==
X-Gm-Gg: ASbGnctkzAvl0X/gtiwjZVo+Gc5xmc+RHzPmQCiRJVk9vl8MOXtTEX8piWH277+eD5j
 jrwzmconYLr4hxyCPCLrbzG4P5RFpU4etRnAfILPo/8MjbuvwQvykBXGBTnFWV4EvpWddRLzb/S
 t2g6dA+8x2VM5YkZ5bV67vD1tbefO4XP1X06Ze1K4tjVYDDqxosgnO/WQDjuygcYzUABG8U4746
 lz327o=
X-Google-Smtp-Source: AGHT+IEu+kTxRqCVTWGmKUUlh48Cz4IPdwyniv5y9FLrM2n3DQL6QBcqHwkIXa9ftDeM/WMl7B6pNWoTOs6Fqp/KoZg=
X-Received: by 2002:a17:902:e5c9:b0:234:8f5d:e3a0 with SMTP id
 d9443c01a7336-245e04410d7mr22304635ad.2.1755615522059; Tue, 19 Aug 2025
 07:58:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250819142453.368440-1-liaoyuanhong@vivo.com>
In-Reply-To: <20250819142453.368440-1-liaoyuanhong@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 19 Aug 2025 10:58:29 -0400
X-Gm-Features: Ac12FXyT9JMEDwUxumFLGLORwKYFJb99cw71NnptTHv-DsTYVW8iN-K8zH3TdQc
Message-ID: <CADnq5_P78iHtM=kQQhiY2nf9j_PKnQKSqLNYchG1bcY56jWYvg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Remove redundant header files
To: Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Hung <alex.hung@amd.com>, 
 Aric Cyr <aric.cyr@amd.com>, Taimur Hassan <Syed.Hassan@amd.com>, 
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Dillon Varone <dillon.varone@amd.com>, 
 Yihan Zhu <Yihan.Zhu@amd.com>, Muhammad Ahmed <Muhammad.Ahmed@amd.com>, 
 George Shen <george.shen@amd.com>, Reza Amini <reza.amini@amd.com>, 
 Cruise Hung <Cruise.Hung@amd.com>, 
 "open list:AMD DISPLAY CORE" <amd-gfx@lists.freedesktop.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
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

Applied.  Thanks!

On Tue, Aug 19, 2025 at 10:33=E2=80=AFAM Liao Yuanhong <liaoyuanhong@vivo.c=
om> wrote:
>
> The header file "dc_stream.h" is already included on line 1507. Remove th=
e
> redundant include.
>
> This is because the header file was initially included towards the latter
> part of the code. Subsequent commits had to include the header file again
> earlier in the code. In my opinion, this doesn't count as a fix; it just
> requires removing the redundant header inclusion.
>
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dc.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/di=
splay/dc/dc.h
> index 1ab05eabbddb..2ceaf861edb9 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc.h
> @@ -1854,8 +1854,6 @@ void dc_3dlut_func_retain(struct dc_3dlut *lut);
>  void dc_post_update_surfaces_to_stream(
>                 struct dc *dc);
>
> -#include "dc_stream.h"
> -
>  /**
>   * struct dc_validation_set - Struct to store surface/stream association=
s for validation
>   */
> --
> 2.34.1
>
