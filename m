Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC899CA4C7B
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 18:33:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14EF410E994;
	Thu,  4 Dec 2025 17:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="CS3NUIWc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ADF310E994
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 17:33:36 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-b7633027cb2so201224666b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 09:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1764869612; x=1765474412;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0lDLQ+xA7ysn2tBqrY2+zSp+wk4p+4NHexxAKv+ifrQ=;
 b=CS3NUIWcMtEsDT1RkU+6RPfv93MgAJRstN4+XQ/WcSvga02FZPy2mXdP11JYGMJFj9
 nTgqszEiL18nDBCZVIxR+lbT7fNPogDO+Q7fLBZjFpUWfujzCYp/cqzir8ITSQPlfZ/t
 lb0foJWvXg3BfQEvbQ/XYU4/KueetQ5Tgp+xM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764869612; x=1765474412;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0lDLQ+xA7ysn2tBqrY2+zSp+wk4p+4NHexxAKv+ifrQ=;
 b=TIeigCOn+8MEzQnkqpe4vvRwHM1qWJjK8Yeri7PzFc/L7fTcWWDcpapjeXrVIuE1iA
 4dZ6jLmeSUTUClvOGgjIOJgvgm3Avg+Mx+/DsZP0NCLmgR+Pha3n2p8f7UIhL1BjkDDO
 Jwrb1oTJrXgnmmREd5ufj5ysD/cxNl5/8ZrVZgTMMcyRbyILfsHx+08kZxnuaiEH4FgG
 OoLCJrlcq5QjlnmhzoB7cQVbmA3dX9kWhG1pVXBk2xsAGZnMgpimR1jhXw8l+OIE8A3g
 2MJdkjWnMAYlbtudv4N5RcdwQBAyxc92xvaSpD9ZdwjLeACcMeqL+WhrOz286CrZARTs
 Wz/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjbS3sVGu9gv3umxvYBxIJIa0FTWnbs+R1UitJr0wDsKOTbb0A0H72s0GikT8mOrdhGavYhhhBKuM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnRJp4j/byNIsMoGkODAMuBk8IPJHsomf0C5ekByxiqKybtNRY
 Kkeq9XD9lweL5CfeQZjHRsMiA0V0NhHP5s8TKKUFxeCpx/IwNIycF/MLXKiE4DxadPfX5Q93d6U
 jOk7WBvDC
X-Gm-Gg: ASbGncsFdyf+NfyNN4hlSp4yG5QJ/UIPkmFpYAJSjWuTk1CxFzgKoRy4vZZrUV0jAE+
 3eB7pRV1DYoEcCsDKoifx6kUodUvgYY8md4D0CKZBcjZDaJj+XupIyfBHssWT4PoWGrHMIepZZX
 S8CcoubjLBMiS+e7guHBDEogvMj+97fEOwsozAQnnWQuC6YuMyVQiqlTi9OshkQmKdPaMsZv888
 2x7r117Z/VKXIZmQP6OdQ/ATn8n38g2B0fQi5QZwosQMISyWH2Fe604WbkxhObctHxOPKafo6tr
 3sXV2j8XMcfhMmsHElypr0Lt1Udi78N9wY3XWasc4fCgRxG5J1hxiJCvXHYNv3isGSD3A2XfRkr
 ZHF3h+Mj466C2g1k+9l8rzSB+nv4Gj8RTd5CbSy2PSi6vRJwIFyNKOlWvFhd4EsU5x+0tzyRWMU
 ibssMBkAqCgQFZGimV8wR1RXzyjslSRa3YAWwWA+PMqvKlDXcMVA==
X-Google-Smtp-Source: AGHT+IHWBADzgrQlNNy412YdRuyTyuxd2ezCj1N3p3tSL4E2OWl9JzJ2oNWbjOZolE4XhrB30CLRqA==
X-Received: by 2002:a17:907:7f9e:b0:b79:d24b:474d with SMTP id
 a640c23a62f3a-b79dbe85764mr723064366b.16.1764869611707; 
 Thu, 04 Dec 2025 09:33:31 -0800 (PST)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b79f49a897fsm179306666b.51.2025.12.04.09.33.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 09:33:30 -0800 (PST)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-42e2d5e119fso581540f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 09:33:30 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWhDMMiZDT7YppYHopYYzPotMVlrqT8U6y9O3xYK48szuAEyaE8oGFhmBKrmJbbCt+vOWuXpGVJVKg=@lists.freedesktop.org
X-Received: by 2002:a05:6000:26c5:b0:429:d725:410c with SMTP id
 ffacd0b85a97d-42f731f65b5mr6719489f8f.44.1764869609762; Thu, 04 Dec 2025
 09:33:29 -0800 (PST)
MIME-Version: 1.0
References: <20251204094550.1030506-1-arnd@kernel.org>
In-Reply-To: <20251204094550.1030506-1-arnd@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 4 Dec 2025 09:33:18 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V6-14spgnDi6Lh+-jbRMtfNzdsH2F39nL_tED9AnUYsw@mail.gmail.com>
X-Gm-Features: AWmQ_bkYmWATtrOgY5TzAEo4tGK07RtcL_A-y-rTzF0HqvFScjaC1OXDbb89Mgo
Message-ID: <CAD=FV=V6-14spgnDi6Lh+-jbRMtfNzdsH2F39nL_tED9AnUYsw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: novatek-nt35560: avoid on-stack device
 structure
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Brigham Campbell <me@brighamcampbell.com>, Arnd Bergmann <arnd@arndb.de>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Anusha Srivatsa <asrivats@redhat.com>, 
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

On Thu, Dec 4, 2025 at 1:45=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wrot=
e:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> A cleanup patch apparently by accident used a local device structure
> instead of a pointer to one in the nt35560_read_id() function, causing
> a warning about stack usage:
>
> drivers/gpu/drm/panel/panel-novatek-nt35560.c: In function 'nt35560_read_=
id':
> drivers/gpu/drm/panel/panel-novatek-nt35560.c:249:1: error: the frame siz=
e of 1296 bytes is larger than 1280 bytes [-Werror=3Dframe-larger-than=3D]
>
> Change this to a pointer as was liley intended here.
>
> Fixes: 5fbc0dbb92d6 ("drm/panel: novatek-nt35560: Clean up driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/panel/panel-novatek-nt35560.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Whoops! Not sure how I missed that in code review. Thanks for the fix!

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-fixes:

[1/1] drm/panel: novatek-nt35560: avoid on-stack device structure
      commit: 1a7a7b80a22448dff55e1ad69a4681fd8b760b85
