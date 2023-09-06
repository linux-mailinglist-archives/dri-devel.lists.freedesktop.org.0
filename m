Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3E6794092
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 17:42:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1EA810E69D;
	Wed,  6 Sep 2023 15:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9872410E69D
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 15:42:21 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-99de884ad25so595254866b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 08:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694014939; x=1694619739;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8YnkA1hdOlu7MrSYVoA9DXoUNwGSQiK/yVg4K+jIqsI=;
 b=lHiryO9xHqVILWEn/MfFV2kzH2KE4041UReC+T5TPMebgOzPq+5Y+QmZfIT0ABNIYr
 Q7LmAQK8FVPbIP7SE66hYVpigiP9H5BqgbyZwA3x+r2UBlTYYjfm7fT5LSnEwrTg2apj
 gGUQ/ixgz7lrEkjqoU6H0Y6QxVaLGaQLFdBMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694014939; x=1694619739;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8YnkA1hdOlu7MrSYVoA9DXoUNwGSQiK/yVg4K+jIqsI=;
 b=VDockn/zqPaVt8ouMRRTxPP1Ia88SaVhAA9XxaxFV9TQ+fiLFlyM9Vl+G4MOJDi/E0
 hicWZosMV7G/kCXCIMwQRuiJWUvIL2ozq7tTo4oJCiR/ptOdJhxHnU2H3NoL4gjmyauX
 00GjfpvMsS7xArO4axfSaeyz8VgCvjDYVGOmtLefxuFs3rUeROpjAF2zzLTUtewsH8PN
 Uw5TwIZYmfU4UvEV1X1h5mfB5hQNJM/8fvnmgoSNtb1q9uAj1jlSZ54q4Cf2orjwZnY/
 V8d7E5gQxYmjazLBzUua1tVOVBBITW6iK4nzy0Nx0CeQUj7/9U6AHZI+14QKd/DQ0VbP
 x3oQ==
X-Gm-Message-State: AOJu0YxfCj2zkN4zDIhY/vdsifeNSqGSgaJ/DGsAJy0J/aqfDPqsJSZ3
 hk6/jGV4/Sl39K4yoKny0ZdN4HeEI+zSvcteEa5gWfyA
X-Google-Smtp-Source: AGHT+IEeDHYl4kpLnM7UAbSWsaXjUGTuZn4ngs4GZHdZHWEMoU7S4685H98U5CL95cVcXhNM6+N4Ig==
X-Received: by 2002:a17:907:7758:b0:99c:b0c9:4ec0 with SMTP id
 kx24-20020a170907775800b0099cb0c94ec0mr2726301ejc.30.1694014938796; 
 Wed, 06 Sep 2023 08:42:18 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48]) by smtp.gmail.com with ESMTPSA id
 ox29-20020a170907101d00b00992ea405a79sm9172721ejb.166.2023.09.06.08.42.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Sep 2023 08:42:18 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-402bec56ca6so110625e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 08:42:18 -0700 (PDT)
X-Received: by 2002:a05:600c:4f14:b0:3fe:e9ea:9653 with SMTP id
 l20-20020a05600c4f1400b003fee9ea9653mr156513wmq.4.1694014937894; Wed, 06 Sep
 2023 08:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230831080938.47454-1-biju.das.jz@bp.renesas.com>
 <20230831080938.47454-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230831080938.47454-3-biju.das.jz@bp.renesas.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 6 Sep 2023 08:42:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V-Mft_FjqfkgyMf--03tqrAoCVsG23v-4CBR0sQZFjAg@mail.gmail.com>
Message-ID: <CAD=FV=V-Mft_FjqfkgyMf--03tqrAoCVsG23v-4CBR0sQZFjAg@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] drm/bridge: Drop conditionals around of_node
 pointers
To: Biju Das <biju.das.jz@bp.renesas.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Aug 31, 2023 at 1:10=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> This patch is based on commit c9e358dfc4a8 ("driver-core: remove
> conditionals around devicetree pointers").
>
> Having conditional around the of_node pointer of the drm_bridge
> structure turns out to make driver code use ugly #ifdef blocks. Drop the
> conditionals to simplify drivers. While this slightly increases the size
> of struct drm_bridge on non-OF system, the number of bridges used today
> and foreseen tomorrow on those systems is very low, so this shouldn't be
> an issue.
>
> So drop #if conditionals by adding struct device_node forward declaration=
.
>
> Suggested-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> v5->v6:
>  * Updated commit description.
>  * Added Rb tag from Douglas Anderson and Laurent
> v5:
>  * Split from patch#2
>  * Updated commit description
>  * Added struct device_node forward declaration.
> ---
>  include/drm/drm_bridge.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

I think this has had enough time to marinate, so landed to drm-misc-next:

d8dfccde2709 drm/bridge: Drop conditionals around of_node pointers
