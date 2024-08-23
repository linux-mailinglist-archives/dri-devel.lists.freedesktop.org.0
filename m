Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C7295D3A5
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 18:39:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF0410EC80;
	Fri, 23 Aug 2024 16:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="d07LfMIW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com
 [209.85.161.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B098510EC7F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 16:39:29 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id
 006d021491bc7-5d5bb03fe42so1555454eaf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 09:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724431168; x=1725035968;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C2dFEu4a4aZPz4t5jV1whaeQIxhf8Zys0zAb0G/bCQQ=;
 b=d07LfMIWeMcOrGPawkjeYHTq+oZwCybjybSXZG3U0pIrdotUJ0SHm4RKZNhv9tIlSJ
 n21bLJipTfieg9KJBihoqhN/Of4CFuOR54gbPBD+vWQpFNvxqQmJk/dp3tXmB4wmyjIm
 i7cVYVk2disnpSd/ZJBwZnJSzQUFp1NrhH0Zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724431168; x=1725035968;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C2dFEu4a4aZPz4t5jV1whaeQIxhf8Zys0zAb0G/bCQQ=;
 b=rbcVOlLi7ewpIIdW6kC9yI8ukv08Ca1rZS8KJXvBUW34wGZ+0PGUJ2Ukd+yOgluDLl
 6uQNqKlUdjvCUucVbFtCEluR5YKMp4C6Cb0Q/f6mXd38Gsw+NK0OCdGUWJG5nio598fe
 YT+g1mRm5Dqh4bTZ3pkIoSIeGsYVBroXAXwEABOsceuncuAk1QZ/vZQrK7S+P0CxlBBr
 xDFlPIExTgHD373E7e4FlwvpCyRJO95gFwfn/M9BnSPSWi+CFWhri6XorlyOUpqx8zf8
 6zvYIqrb00EP/ueIRGvehBjHiRmtmABNN2UFObtIskfDXcd39LBOfF2fTbz/HvdtPvv/
 AQMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJt4rqjJIub+Roj5R5PnrJxG//fXl92PxyFwHGbJ9VXCuSJHLAfquRCD+GFoQfnkUWrcuvgrLVTTw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfpoB7zRPiZVmkTc4TRTEB9v+I6oWMhejd29u54v8B/3ZbrqG+
 Z4dMl0VmeWX2CmasuaBmmgRnFZRqKQ26mLNaE982I1rJHCZ4SPKQuSK74R79KxM22ID/pRJ9p/M
 =
X-Google-Smtp-Source: AGHT+IGeL+2qUqKlXpbXpH6QpfE6TmUG3h7ZQ//t+ylUQfVe8awIeN1HwVSV8SoVnTYz6ocTx2ueaw==
X-Received: by 2002:a05:6820:1caa:b0:5c4:144b:1ff9 with SMTP id
 006d021491bc7-5dcc625b9bfmr2832558eaf.5.1724431167704; 
 Fri, 23 Aug 2024 09:39:27 -0700 (PDT)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com.
 [209.85.210.42]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5dcb5bd9d3dsm764825eaf.9.2024.08.23.09.39.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Aug 2024 09:39:26 -0700 (PDT)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-70930972e19so1132313a34.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 09:39:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUnx4iPwW6pac/LqEdQ7HeGVnFehnWWcAuBDravYOHkRFcuErOuY/qmEYNVnyw5UQRL12RlMam9A6Y=@lists.freedesktop.org
X-Received: by 2002:a05:6830:2706:b0:70a:9909:ff2 with SMTP id
 46e09a7af769-70e0e9a9b0dmr2464035a34.0.1724431166278; Fri, 23 Aug 2024
 09:39:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240823-drm-panel-edp-add-boe-ne140wum-n6g-v1-1-7bdd3c003514@linaro.org>
In-Reply-To: <20240823-drm-panel-edp-add-boe-ne140wum-n6g-v1-1-7bdd3c003514@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 23 Aug 2024 09:39:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VZ=RQ8iK2qfa+BWJsJ_EGFP697qOsN-bAXFeeyhAM-Jg@mail.gmail.com>
Message-ID: <CAD=FV=VZ=RQ8iK2qfa+BWJsJ_EGFP697qOsN-bAXFeeyhAM-Jg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: add BOE NE140WUM-N6G panel entry
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org, 
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

Hi Abel,

On Fri, Aug 23, 2024 at 5:16=E2=80=AFAM Abel Vesa <abel.vesa@linaro.org> wr=
ote:
>
> Add an eDP panel entry for BOE NE140WUM-N6G.
>
> Due to lack of documentation, use the delay_200_500_e80 timings like
> some other BOE entries for now.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

This looks fine to me:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I started getting in the habit of requesting that people include the
raw EDID of panels in the commit message when adding them. Any way you
could post a v2 with that info? I just imagine this might be useful
someday if we ever have another instance of the type of issue Hsin-Yi
had to fix in commit ca3c7819499e ("drm/panel-edp: Fix AUO 0x405c
panel naming and add a variant").

-Doug
