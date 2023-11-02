Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 480457DF80A
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 17:56:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D3C10E08F;
	Thu,  2 Nov 2023 16:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DB010E08F
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 16:56:48 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-543923af573so2086766a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Nov 2023 09:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1698944206; x=1699549006;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E6E1PmPxdJrRCrp3jKHhIR/orep6iCxyvOLSiJH5wr4=;
 b=cPETcx8GQv2t64EVE2drMVg+pTqBWQalK5vDZcm718HSqNZklb1JRmx+EPGQIjZfP9
 y/cp8D502FrGXwJZgfGxBHZRhMHRiDH0HX5AJzntasto0W68feHGwqfPM9JuV+/JVXI7
 Rmordf6T8osX8MgwO4GILqFZsLx3KMnG+olC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698944206; x=1699549006;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E6E1PmPxdJrRCrp3jKHhIR/orep6iCxyvOLSiJH5wr4=;
 b=XWiPyV62BCXyvdBksEbqOjUcqsS7NXa5NNvAQo3uSdd25+HqaSfYGFWUVWNibPjjeV
 JxCRDKjlf9+Qqt5XjYQ9tDF19jd2CIt2fMY810ReKvITNIgjGw+fy9pcCA1YJGyttfFU
 m6G+C/elKA72rIu+GBgenOdzvToIDoDit6uNdgOZNkomcPbPrJycFg39GCHhtcnSb5SU
 LsqMDI9o8JX1ipTO5Xn+z3+TsCrAQSwjDCLmQ6ZkNB3g1yGaEVTSH+j/NbzY+34rz4ML
 kFqQIvyvsW0IBZHgshd1nLYjZBkrYN4BLEXOsz6i7xaFw5ZWiF92KYDGPrtLV6wWtSLG
 JvgQ==
X-Gm-Message-State: AOJu0Yw1JeduQgp2J17c83mqMc7wAYg9MzsIwlK2z06SEBud5WsnWpGi
 B7N2zqj6otgXw6sEvOVK8IsfJdUe8tdUmuah1UuyhYUx
X-Google-Smtp-Source: AGHT+IEB9N7J/jxr8tOU0PsgxhYgG1WP7qiEEG/KhRR1bAPaXIYkcmcH9daQwlfJwVw4HpIMbbdPig==
X-Received: by 2002:a50:8d11:0:b0:540:fde:5407 with SMTP id
 s17-20020a508d11000000b005400fde5407mr16635141eds.34.1698944206621; 
 Thu, 02 Nov 2023 09:56:46 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42]) by smtp.gmail.com with ESMTPSA id
 o24-20020a509b18000000b0053e2a64b5f8sm95142edi.14.2023.11.02.09.56.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Nov 2023 09:56:46 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-53eeb28e8e5so10182a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Nov 2023 09:56:46 -0700 (PDT)
X-Received: by 2002:a50:cd8d:0:b0:540:e4c3:430 with SMTP id
 p13-20020a50cd8d000000b00540e4c30430mr108765edi.6.1698944205867; Thu, 02 Nov
 2023 09:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <20231101212604.1636517-1-hsinyi@chromium.org>
 <20231101212604.1636517-3-hsinyi@chromium.org>
In-Reply-To: <20231101212604.1636517-3-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 2 Nov 2023 09:56:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XH9gz3c7F0kKX4TnOa0_9-Ji-x-Vqt1AsnXLwsiWMH_w@mail.gmail.com>
Message-ID: <CAD=FV=XH9gz3c7F0kKX4TnOa0_9-Ji-x-Vqt1AsnXLwsiWMH_w@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/panel-edp: Add override_edid_mode quirk for
 generic edp
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Nov 1, 2023 at 2:26=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> w=
rote:
>
> Generic edp gets mode from edid. However, some panels report incorrect
> mode in this way, resulting in glitches on panel. Introduce a new quirk
> additional_mode to the generic edid to pick a correct hardcoded mode.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 68 ++++++++++++++++++++++++++++---
>  1 file changed, 63 insertions(+), 5 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
