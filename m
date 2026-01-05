Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4B5CF4EA8
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 18:10:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCC910E426;
	Mon,  5 Jan 2026 17:10:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="HmRTcwlT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A7C10E426
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 17:10:03 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b7633027cb2so35136566b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 09:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1767633000; x=1768237800;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cLdzgnUrac8d//9Wo0dHJDGtQ7Ib/cT6JFcqdNEEfA4=;
 b=HmRTcwlTuQ0kiGWe4YnVVmDk7/+dhfyiVYptFSFSLMg3pk8HI5ViBcYlN7Zjxz9AgY
 WyEDP80KM5ZDJz/+6BVuccPKLGJ0OX28d8GJZF5+011Q4YWGv2fOO0SEqts9mgl1n2YN
 Dc8j4spb/W/xOqUHl8ZbhHDTXrhPWfBTshYUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767633000; x=1768237800;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cLdzgnUrac8d//9Wo0dHJDGtQ7Ib/cT6JFcqdNEEfA4=;
 b=e3MCwS2kLp+UYI3O69Sg9FmvKv7/PBgLbuafCslnxr1mfLiOcqyIQMgImlwKNnqhqd
 6wuYHJ6/rFKWZC0zM73csVEmsFOhPL3C7WfWTB3CdyYLnO8ubbL3WN0fLXpPvlVnBr38
 JROeI3/V4Ti+fJUlbz2Um17CbMgJ7lrma/UW5friuyfk4Tc4Pf0R6d3UR3tg/6QSW/Jq
 u7TYuwmt8TTkhv68+HnjgV3BWMdb3XMYSbz76x3BKB0OWOM0hAxXzuoSkFHFuzANifDF
 X1bQO7otI8rC50zJGIAkalkRmXo27PHdBVxCmXgjawIuIUFXDVnFnwVf/8mM0RO9SzX+
 S7kA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmPI6TbIH5VmVlp/Gk1bnJ2mLC1fnTwDEN2OgyUuUK2dtwsYj2Gk3qG7vk0gyMortiK5Zn/KpRJHI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyL0O+Ilb2V+ACLVNK+qAGxbvlKV21FZsjeGwf3hnoyW7QsJoG2
 P6Zkv0ZA1/B6xExV93ezQrbs7KYU0QMiRKWqOMuG7sjJChaeANSmZBRLRbqet2BPJgMzANyTxTM
 7FAFrlg==
X-Gm-Gg: AY/fxX5kzscOlW48nrLjMGxXt5bLg9RoxSvwlzXlYiECFagrG8nWRwWTlSkypON17hl
 2IhvUN7ZyiNJ4iED8O2kJeuYIe68OAMbBnBGU6WoERmN+6l0CaEy9fATAe9fY/ojDMIsNDenl49
 tJwyZ1PKECkIf09vSBjD9qNt31JjFy8JHoteP5DvcVT9mgrHxlnM97hNUQQNxFTRluvlU69SWhw
 6yma5bIticQhxNGRera5UYwZGMEkw+iqb+G74yObe6QeyGjr5gFgZlo1WraUN00xa/CWxTtJRgH
 vPl3BCaioEqGykD2bI1NPkQ0VKtQuNmCa4fNcaxbkgl0d7bGtMd+vdh6QDT+rP1YDiH11ipPziH
 a+yc122o25ftwddPx87BB71OR5bOg/vokZUrdT32/WLLDk7Kcexl2IX3/tKDFg2pp6Zv9FY/N9+
 K6IT8XBV+oCU/W2Lwl/aFCjFGoaqRS8+DbdY/4V67SzlcrMNF/Wf6QGINKJT7Q
X-Google-Smtp-Source: AGHT+IEsBSJjlsPI4oGp44y8GSjOUXuRmEku7ifDDkVDN2x/G+0fKwU0ywiJ5BbGhHY4TxrOIYot3Q==
X-Received: by 2002:a17:907:d25:b0:b79:de59:4007 with SMTP id
 a640c23a62f3a-b8426a68686mr45228666b.15.1767633000453; 
 Mon, 05 Jan 2026 09:10:00 -0800 (PST)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8426612903sm47261066b.30.2026.01.05.09.09.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 09:09:58 -0800 (PST)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-47bdbc90dcaso1142965e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 09:09:58 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVU3PsTi9X8mzeqyLQvcOGwWxSZHzOtve9miWh49MBHqQlI77T5iCM5Q4KQrYjCQxoChox43ODMWLk=@lists.freedesktop.org
X-Received: by 2002:a05:600c:1992:b0:47a:935f:618e with SMTP id
 5b1f17b1804b1-47d7f077e9amr567135e9.15.1767632998460; Mon, 05 Jan 2026
 09:09:58 -0800 (PST)
MIME-Version: 1.0
References: <20260105155134.83266-1-johannes.goede@oss.qualcomm.com>
In-Reply-To: <20260105155134.83266-1-johannes.goede@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 5 Jan 2026 09:09:47 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WU7Frn13m96uMYVZUbPgeyeO95Y2uezdUTDLWr+4VRww@mail.gmail.com>
X-Gm-Features: AQt7F2rpXDQrjRq6ybOzsnNl1R3nbfcSkCpQ0Suv3G1RrnGA44oVVsflBN0zycE
Message-ID: <CAD=FV=WU7Frn13m96uMYVZUbPgeyeO95Y2uezdUTDLWr+4VRww@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: edp: add BOE NV140WUM-T08 panel
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
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

On Mon, Jan 5, 2026 at 7:51=E2=80=AFAM Hans de Goede
<johannes.goede@oss.qualcomm.com> wrote:
>
> Add powerseq timing info for the BOE NV140WUM-T08 panel used on Lenovo
> Thinkpad T14s gen 6 (Snapdragon X1 Elite) laptops.
>
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 09 e5 26 0c 00 00 00 00
> 0a 21 01 04 a5 1e 13 78 03 d6 62 99 5e 5a 8e 27
> 25 53 58 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 33 3f 80 dc 70 b0 3c 40 30 20
> 36 00 2e bc 10 00 00 1a 00 00 00 fd 00 28 3c 4c
> 4c 10 01 0a 20 20 20 20 20 20 00 00 00 fe 00 42
> 4f 45 20 43 51 0a 20 20 20 20 20 20 00 00 00 fe
> 00 4e 56 31 34 30 57 55 4d 2d 54 30 38 0a 00 fa
>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
> Changes in v2:
> - Change Subject prefix to: drm/panel: edp:
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/1] drm/panel: edp: add BOE NV140WUM-T08 panel
      commit: 349d4efadc1f831ebc0b872ba1e3a2b7dd58b72b
