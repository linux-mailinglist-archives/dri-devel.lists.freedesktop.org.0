Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F3394396E
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 01:39:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E24A710E07B;
	Wed, 31 Jul 2024 23:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="J+OBDpC5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B224910E07B
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 23:39:42 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-6b796667348so14202676d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 16:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1722469180; x=1723073980;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cGN3NcBjvEDPuj/1+sYN2kLmAgP2z3leFVjhSD6EVrs=;
 b=J+OBDpC5YVGGC7V4QVTNXlpMuc9E/1W/zi+Ng/KBJ6MfCjjX5Os70ffleZVhetfxq5
 mXfNLi8D/2t87KCIqgqXV/ypwiFng/eukv0su/irsd0171P9yL0QPSBNQ/KbO85Qs7zD
 0u0i8fCfxYujFF4HYanT9msMdph8NBBb9mjX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722469180; x=1723073980;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cGN3NcBjvEDPuj/1+sYN2kLmAgP2z3leFVjhSD6EVrs=;
 b=jn5sGRv0T+uyVFkyHYz1jivr5dsNPgr2+/p94hN0yP68sWC/dvdJlk41hRf3/CRfG7
 vbHAQ2z7HtwCSd0M1ySyPYRpr5+IGHOu8pTlh3vwweucQve18IaBWQfrAg2J8V6TekPJ
 Aw2iS2CwJAcl1PWTgql4YzCAPTXGZMA5eu7ZXT22SCl1fy1+V2xwRNX4C8srUZvGO4SO
 bK0iySoLO+9ylZ5o9jxFyZIbg/wFiBibVsnEyGCU42WJgeEEdPvOtcg6XtjUgvEW10x7
 dIQiVFUeWRnAXR6KvmS91Zy5pvmyH7g6UCsHI1QfPxfV0qWo4yDfjbzg9pzesoGzb3C2
 tpoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkjPY8zq0Fasq4K6SVg6OfMoSoxpMrPk9/m+oyVJ9BlPPicZ0UI62Mn658ZVca41MVt2a1oTQL/rvplNXO3YHAZge4zOvmrY9ibaJxLo8U
X-Gm-Message-State: AOJu0YzX3iY7TNyMGiZlcVjjuXf+ZEntiN81cXqs4nQKw/eNSNrZwf11
 80k+/9QYp/62jB69KKwGxC1srQQhDUgs8GLdTqszaGUqdvUHGNBcnyp0vWvhf/0Y203bE/8aJKk
 =
X-Google-Smtp-Source: AGHT+IEMpawudHTxlOzI0nf/QKkX4OZUz1z+dJXqQCWpHf+cVy+zVLkw9tv1S7tK8uZPAHxOPhnsAw==
X-Received: by 2002:a05:6214:580b:b0:6b7:923c:e0b7 with SMTP id
 6a1803df08f44-6bb780c9099mr126484156d6.21.1722469179783; 
 Wed, 31 Jul 2024 16:39:39 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com.
 [209.85.160.174]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3f9122b4sm79455556d6.59.2024.07.31.16.39.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 16:39:38 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-44fe76fa0b8so508661cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 16:39:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVIQOEKT1T89HE8slSfzLV+E/QYQw7aAwRlUl81IWT77pIsBar0ujc9uKksQnfN7QTPBXmJ2aBsjdpCvSuke+Htosu1vq+E3X1Iq4UGhRm4
X-Received: by 2002:ac8:59d5:0:b0:44b:74aa:1838 with SMTP id
 d75a77b69052e-45181da7fe4mr1901cf.5.1722469178217; Wed, 31 Jul 2024 16:39:38
 -0700 (PDT)
MIME-Version: 1.0
References: <20240729205726.7923-1-robdclark@gmail.com>
In-Reply-To: <20240729205726.7923-1-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 31 Jul 2024 16:39:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wo2nVzn6qvwSAFAnrFX4wtv6_ZCVZaL1K_DBBFg9DJ=w@mail.gmail.com>
Message-ID: <CAD=FV=Wo2nVzn6qvwSAFAnrFX4wtv6_ZCVZaL1K_DBBFg9DJ=w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: samsung,atna45dc02:
 Document ATNA45DC02
To: Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, Abel Vesa <abel.vesa@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Clark <robdclark@chromium.org>, 
 Conor Dooley <conor.dooley@microchip.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
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

On Mon, Jul 29, 2024 at 1:57=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> From: Rob Clark <robdclark@chromium.org>
>
> The Samsung ATNA45DC02 panel is an AMOLED eDP panel, similar to the
> existing ATNA45AF01 and ATNA33XC20 panel but with a higher resolution.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/display/panel/samsung,atna33xc20.yaml       | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'll plan to land this in drm-misc-fixes next week unless someone
objects. "fixes" instead of "next" for the same reasons discussed
previously [1] that the dts patch should probably be considered a fix
and there's a chance that the dts patch could land in an earlier
version of mainline than the bindings unless we consider the bindings
a fix.

[1] https://patchwork.freedesktop.org/patch/msgid/20240715-x1e80100-crd-bac=
klight-v2-1-31b7f2f658a3@linaro.org
