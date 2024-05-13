Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB4B8C4571
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 18:57:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35ABC10E8A2;
	Mon, 13 May 2024 16:57:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="jPtnilXa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E4D10E880
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 16:57:23 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2b27eec1eb1so3648541a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 09:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715619442; x=1716224242;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XmdRKmR5GwP+S1V0WsXgEf9q8eN7ZBEpbwBCtyyE8ew=;
 b=jPtnilXaxbndfMlRy4v5UmOmos84IRGmTWwu7vpnHpbxCBhsvZiNhyt84ARj5S1X4G
 +dBni0/6aGTPILK5aRkiiT11M8OYeduii8lSSAPZjwbBwW54gv1TlYDF7yu8RadlL2DO
 yJFkfB+niZfjt6IV5CNPgMoYfYCj3qEqR+YNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715619442; x=1716224242;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XmdRKmR5GwP+S1V0WsXgEf9q8eN7ZBEpbwBCtyyE8ew=;
 b=vLCl/nm7F1RNEigxkTUNGaQEdtvasUAb51yygiE2T2JYCtCD60xvCPwnh5wLe/mE9N
 QEMc00zS7YSBTetyhfGMv3qZwOnKviTmUw4ZcsWbCDm0H4b7mU0au0JwFdGiupQTfeGi
 YxT09VkA/YJOsReUbiVfLv+39orORlzMLW66Ac3329MfDren3amnSLZdBhxfdZnQ6x9c
 zzGWsjLGsimC7qUwHz/lFARCy4BAnyzI+QhNSAXKMMEOaQBtXUVATEvH5nnvd1txKFfT
 LyGfpOTOTZUZTdQsuWr7dBHiERCityNKY/fkx13r/aWDJrkJt+pKhBj4zeMUv9xaD50m
 IU+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5dSn6MG4Y2PSNGjtjPZKbWjrFII8vorSdcxkFvGt8AS5HWaIGqnQUbXWDtQpwIDWFwSUZUXP6+qsTd4OO8Ow1GYzT7Ipq972LpWEIJli0
X-Gm-Message-State: AOJu0Yy2Zygm7myQ2mk8L2riIfRrkpnEygHOPzK4diVRrO1hx/GBsCXx
 wKpBr7Px2go0Wca0OOIgZi1QHmK5MQcNvw4A1N1ldtYiJGAEGbW/+ID67uNMtiZ8RX3G7vpGvR0
 =
X-Google-Smtp-Source: AGHT+IGxCftidSUjVX4zQHHh+4l+GvbrWGnl6Bue8MCIyQuON0HTIiXuFXK3sKvSBtn4epAspWZANw==
X-Received: by 2002:a17:90b:1d06:b0:2b2:5b6f:2c96 with SMTP id
 98e67ed59e1d1-2b6cc97d41dmr7499899a91.28.1715619442455; 
 Mon, 13 May 2024 09:57:22 -0700 (PDT)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com.
 [209.85.214.177]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2b6711660acsm8153061a91.15.2024.05.13.09.57.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 May 2024 09:57:21 -0700 (PDT)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1ee5f3123d8so282525ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 09:57:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUtJcVzmiKV8pbNhGt7e4SIWXZ3ghthEKg83LDXDbNJTPTblwaoghmnE0uYCjTKBxbUGfDXpA/PAiNt22/ocIAUX8gq0QtD+IgVySBiiHGv
X-Received: by 2002:a05:622a:5595:b0:437:b4d9:ddc6 with SMTP id
 d75a77b69052e-43e0a22f92fmr4507621cf.27.1715619003150; Mon, 13 May 2024
 09:50:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240512-dsi-panels-upd-api-v2-0-e31ca14d102e@linaro.org>
 <20240512-dsi-panels-upd-api-v2-2-e31ca14d102e@linaro.org>
In-Reply-To: <20240512-dsi-panels-upd-api-v2-2-e31ca14d102e@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 13 May 2024 09:49:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VU7KQohfuOi+hh1Hb+MEYHtCG=BytyK1aGrxhzv85jgw@mail.gmail.com>
Message-ID: <CAD=FV=VU7KQohfuOi+hh1Hb+MEYHtCG=BytyK1aGrxhzv85jgw@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] drm/mipi-dsi: wrap more functions for streamline
 handling
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Vinod Koul <vkoul@kernel.org>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Hi,

On Sat, May 11, 2024 at 4:00=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Follow the pattern of mipi_dsi_dcs_*_multi() and wrap several existing
> MIPI DSI functions to use the context for processing. This simplifies
> and streamlines driver code to use simpler code pattern.
>
> Note, msleep function is also wrapped in this way as it is frequently
> called inbetween other mipi_dsi_dcs_*() functions.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 210 +++++++++++++++++++++++++++++++++++=
++++++
>  include/drm/drm_mipi_dsi.h     |  21 +++++
>  2 files changed, 231 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
