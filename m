Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B0C8B8DC7
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2024 18:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF82112368;
	Wed,  1 May 2024 16:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="DsZAI+en";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD98D112368
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2024 16:09:23 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-69b44071a07so66851166d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 May 2024 09:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714579761; x=1715184561;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z2spOwtWOqMT7Ms41TL5RVzlbesAQkmsONqFkI4fS7c=;
 b=DsZAI+enXui5O95vWWoEAZeYq2yQt/GJQqGytG2qDEwroH8PlZHDdMPag1uNcy2Q2/
 BZHxVF/Tjlr4KfzIeq17psj/7t0QjuzmPOc94RgrmaPsHR3uCY5VcWRAfuGVGiWNfz6n
 1nuxdbEX5yMWYtwAtQHUM01gTQvekgzeKD3UM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714579761; x=1715184561;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z2spOwtWOqMT7Ms41TL5RVzlbesAQkmsONqFkI4fS7c=;
 b=XC5jxqEiIRGMeakMs7toXJSWUtOWshBznXqYOmu5ePMxb8ckHGGZqW+/ZyV34ZqchD
 ETRJLuQmsJzPcojS+tMmytBR9DmwoZPW1pxCbtoWP86WrZzqyToYWrrZfFPuHGjBQmld
 6OCxcVJb9k7SpLTUMyD9Xs7L5IESNlpdcOURGH2+qGuqO7o8uXtR/z0qj5YtfQANM6Ll
 FgPMLuQg7acM/Bo1fihM7c9eyQzBsLlTXcs/vjzrfXAUDcRVgja4re/6tTHWP+jtmxCr
 RkOWQkmcluyVZEHev3FJ8HHowVMgxleHjVOwfZA4EUM8LnAJTFpPQzRcXIalhxihCNDN
 giew==
X-Forwarded-Encrypted: i=1;
 AJvYcCW03HZAQ09ROf1Pm3joFvjccJIrgmHx4C4lNr6OmHa28UuufqXDMWp0JmKORZYzmpxZibGr92mk9v8h8G7va9q+wxsFofyUsdGXc5NC3Sk5
X-Gm-Message-State: AOJu0YwfnoKxjm/amJVoRefCZRX6bmWTA+TBkELLhRPml2sLAKoE+Ax4
 u8i3hJqA3a95/1CphIyQ6gb3TDPhgybwv3eOfVGrqdbkgszKrEM27RzPOikxtxTwbAkmnmXcCno
 =
X-Google-Smtp-Source: AGHT+IGyCkOpRbTjQ5e7lD161QTbckD0zdRdiz404BEMluoCE/89IvHQ4Pc/ujg5o1zysuHPnd5acw==
X-Received: by 2002:a05:6214:2683:b0:69b:683b:8686 with SMTP id
 gm3-20020a056214268300b0069b683b8686mr2964803qvb.3.1714579761374; 
 Wed, 01 May 2024 09:09:21 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com.
 [209.85.160.179]) by smtp.gmail.com with ESMTPSA id
 r6-20020ac87ee6000000b00439c1419553sm8903613qtc.44.2024.05.01.09.09.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 May 2024 09:09:20 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-439b1c72676so77791cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 May 2024 09:09:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWEo5fcG9elNBqAKMtdtNvG+e9unjBXUXMqiKx7fbQGJxcNU+ry6MUiCLDC0doxBYFREy3WOdmVD+iT5IV5Z6NAu9Dj7CBqZj0cAiV0jV9A
X-Received: by 2002:ac8:5d8f:0:b0:43a:c84f:5689 with SMTP id
 d15-20020ac85d8f000000b0043ac84f5689mr233727qtx.1.1714579759956; Wed, 01 May
 2024 09:09:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240501051323.805076-1-sui.jingfeng@linux.dev>
In-Reply-To: <20240501051323.805076-1-sui.jingfeng@linux.dev>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 1 May 2024 09:09:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XdQjEM05Jw7iVVcHbJ9oqy8qQeH66oxf2g304QKDaL=Q@mail.gmail.com>
Message-ID: <CAD=FV=XdQjEM05Jw7iVVcHbJ9oqy8qQeH66oxf2g304QKDaL=Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/debugfs: Drop conditionals around of_node pointers
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

On Tue, Apr 30, 2024 at 10:13=E2=80=AFPM Sui Jingfeng <sui.jingfeng@linux.d=
ev> wrote:
>
> Having conditional around the of_node pointer of the drm_bridge structure
> is not necessary anymore, since drm_bridge structure always has the of_no=
de
> member since the commit d8dfccde2709 ("drm/bridge: Drop conditionals arou=
nd
> of_node pointers").
>
> So drop the conditional, please also note that this patch is following th=
e
> convention used by driver core, see commit c9e358dfc4a8 ("driver-core:
> remove conditionals around devicetree pointers").
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
> v2: Update commit message
> ---
>  drivers/gpu/drm/drm_debugfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Pushed to drm-misc-next:

235e60653f8d drm/debugfs: Drop conditionals around of_node pointers

-Doug
