Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C01C93933F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 19:36:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58DC10E23A;
	Mon, 22 Jul 2024 17:36:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="RI+qrwuJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F3AB10E23A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 17:36:10 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a77e85cb9b4so529114066b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 10:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1721669767; x=1722274567;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eKmnFtuUUL/6/Qz31VCLadtYrbr5QB0/wZevNZHeBHQ=;
 b=RI+qrwuJCHnv/ZtuaCwinEa/mJ68Y5Up2GkxsA2mDhA3eJK1US7x3oSdg4hAjzqwEG
 9U23UGGXXaLx+JX6LxOwyWl1M2Gy6MjMbHRvXpVvBAVVMa+YNz5Hp25uiJbVlxlefYmk
 x+vQtyx0mAjIYLDC/2gsU4LrxMm5+1eFfLEWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721669767; x=1722274567;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eKmnFtuUUL/6/Qz31VCLadtYrbr5QB0/wZevNZHeBHQ=;
 b=pEP3YmecAEvb2tjWN+M2YR1ChYOVEjWeMJHFJ7JdkUeVtyreJAzZpmxF3KjQ4ridUc
 x54d//tvesfGN6qVgntZeu1sNqk/U43jsmvjUrw/1bOiYoTQQELkcGgqnbRjtlyJG/49
 ylV/qn/83w2yRti1vfXrK5kdB8mimYU3UZtp2Q5K1TaAkCMMNd246RESeK6+99JUdta5
 rZYFJ5PyWmDnNjjBr0dRzjuiv48SnqHGijufd07krEANGqfRbyGzwGIVShzAwl9hv+mV
 1I+9X8bOdtG1fPh/61/MDiE/iBcP98hIJaG1sO4JqoZtMl8AAOXwYpH4g0qlhiNnZhZf
 A1Jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcoOAFC34F3e6W67LNyiW314bfvWu1wltU2yGnIvUft/pkqsbTRKWkXzFi91hZeiGDqTCg/hO5BZjAdE4EQ4JIUsivk83g8ABh3/GY37bc
X-Gm-Message-State: AOJu0YxbmmSOxwCp/WT/2vFSuO1Kl5t4XCB3SB8dWJzOG7SiW0wPcJIB
 TdYPc1NejTuCrhCLyNV3ELMQPIzFaChbVTnQ6L7vx8y/Bd2P061DDQYqy5pWamI5L+m/AjlG99w
 wvA==
X-Google-Smtp-Source: AGHT+IFiFElbn+UkWu4RVxRPdDzO3P0igoWIEFPk6qM5HN4reyUXjNXoK0IZAqzTPOJOv2I57VuBUA==
X-Received: by 2002:a17:907:7d86:b0:a77:dbf0:d30 with SMTP id
 a640c23a62f3a-a7a4c10350cmr534269966b.41.1721669766956; 
 Mon, 22 Jul 2024 10:36:06 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com.
 [209.85.128.54]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c8c3d48sm447404766b.131.2024.07.22.10.36.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 10:36:06 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-42725f8a789so2315e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 10:36:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVYloJN1NihVCTSLbVwOJzazYJJH3f8maCqxt5vx8zFm7Fh0FoXU/7Ky68soFxAIRa9Fy3bkParG4JgsxRjYfxYgqHugf6T1g4rpT3ywGz7
X-Received: by 2002:a05:600c:3b07:b0:426:7018:2e2f with SMTP id
 5b1f17b1804b1-427dd16e865mr2883575e9.5.1721669765333; Mon, 22 Jul 2024
 10:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240721100449.8280-1-terry_hsiao@compal.corp-partner.google.com>
In-Reply-To: <20240721100449.8280-1-terry_hsiao@compal.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 22 Jul 2024 10:35:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VJQaf2H8M1D+UoJGtXy0yij86atX5Rk70njW2zGCquZg@mail.gmail.com>
Message-ID: <CAD=FV=VJQaf2H8M1D+UoJGtXy0yij86atX5Rk70njW2zGCquZg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel-edp: Add 6 panels used by MT8186 Chromebooks
To: Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
Cc: linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
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

On Sun, Jul 21, 2024 at 3:04=E2=80=AFAM Terry Hsiao
<terry_hsiao@compal.corp-partner.google.com> wrote:
>
> The raw EDIDs for each panel:
>
> AUO
> - B116XTN02.3
> 00 ff ff ff ff ff ff 00 06 af aa 73 00 00 00 00
> 00 21 01 04 95 1a 0e 78 02 6b f5 91 55 54 91 27
> 22 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 ce 1d 56 e2 50 00 1e 30 26 16
> 36 00 00 90 10 00 00 18 df 13 56 e2 50 00 1e 30
> 26 16 36 00 00 90 10 00 00 18 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02
> 00 10 48 ff 0f 3c 7d 50 05 18 7d 20 20 20 00 67
> - B116XAN06.1
> 00 ff ff ff ff ff ff 00 06 af 99 a1 00 00 00 00
> 00 1f 01 04 95 1a 0e 78 02 9e a5 96 59 58 96 28
> 1b 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 ce 1d 56 ea 50 00 1a 30 30 20
> 46 00 00 90 10 00 00 18 df 13 56 ea 50 00 1a 30
> 30 20 46 00 00 90 10 00 00 18 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02
> 00 10 48 ff 0f 3c 7d 0c 0a 2a 7d 20 20 20 00 3a
> - B116XAT04.1
> 00 ff ff ff ff ff ff 00 06 af b4 c4 00 00 00 00
> 12 22 01 04 95 1a 0e 78 02 9e a5 96 59 58 96 28
> 1b 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 ce 1d 56 ea 50 00 1a 30 30 20
> 46 00 00 90 10 00 00 18 df 13 56 ea 50 00 1a 30
> 30 20 46 00 00 90 10 00 00 18 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02
> 00 10 48 ff 0f 3c 7d 0c 0a 2a 7d 20 20 20 00 e7
>
> BOE
> - NV116WHM-A4D
> 00 ff ff ff ff ff ff 00 09 e5 fa 0c 00 00 00 00
> 12 22 01 04 95 1a 0e 78 03 0b 55 9a 5f 58 95 28
> 1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 96 1d 56 c8 50 00 26 30 30 20
> 36 00 00 90 10 00 00 1a b9 13 56 c8 50 00 26 30
> 30 20 36 00 00 90 10 00 00 1a 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02
> 00 0d 40 ff 0a 3c 7d 0f 0c 17 7d 00 00 00 00 1a
>
> CMN
> - N116BCA-EA2
> 00 ff ff ff ff ff ff 00 0d ae 5d 11 00 00 00 00
> 0f 21 01 04 95 1a 0e 78 03 67 75 98 59 53 90 27
> 1c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 da 1d 56 e2 50 00 20 30 30 20
> a6 00 00 90 10 00 00 1a e7 13 56 e2 50 00 20 30
> 30 20 a6 00 00 90 10 00 00 1a 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02
> 00 0c 3d ff 0d 3c 7d 0d 0a 15 7d 00 00 00 00 0f
> - N116BCP-EA2
> 00 ff ff ff ff ff ff 00 0d ae 61 11 00 00 00 00
> 0f 21 01 04 95 1a 0e 78 03 67 75 98 59 53 90 27
> 1c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 da 1d 56 e2 50 00 20 30 30 20
> a6 00 00 90 10 00 00 1a e7 13 56 e2 50 00 20 30
> 30 20 a6 00 00 90 10 00 00 1a 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02
> 00 0c 3d ff 0d 3c 7d 0d 0a 15 7d 00 00 00 00 0b
>
> Signed-off-by: Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
> ---
>  Change from v1 to v2
>  * Modify the description of subject
>  * Add the raw EDIDs
>  * Sorted according to the order
>  drivers/gpu/drm/panel/panel-edp.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

...and pushed to drm-misc-next.

[1/1] drm/panel-edp: Add 6 panels used by MT8186 Chromebooks
      commit: d4b9b6da5777bb03f36f01bb6b05c6cc303ededb

-Doug
