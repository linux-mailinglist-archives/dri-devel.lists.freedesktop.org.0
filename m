Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5A3C98982
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 18:49:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8D610E439;
	Mon,  1 Dec 2025 17:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="XgakEoke";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2050D10E439
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 17:49:50 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-6418738efa0so7491955a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 09:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1764611386; x=1765216186;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YjHx+/RkP+oD6eZvyiUE3nXyrGDBrliKfWOauWnm6JE=;
 b=XgakEoke7rU1n75EEuDHjkXVXWJ5LaYae3XVyAfYIE09HpJEX9sB54m5O1juQIskJa
 Z9unCeOlgP62iZ+HUT2ShPwKfsIZHWaVwKMWjpOZsSHL8WDwoY/GUZ1hYpGCRKv01TbJ
 +0sYRMv0NWrAhULf1wc4d9pXvIZK4rwkfbnN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764611386; x=1765216186;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YjHx+/RkP+oD6eZvyiUE3nXyrGDBrliKfWOauWnm6JE=;
 b=BNDJWkypifJz8U3LQbrqP7j41mw7r7mSTMKS7Sx7jG+mLC3+IOOlISh1Q3lnqxwGax
 raVNImLzmLrEgP0DPGQ0uHZAuaCJogIEYlaff/Vv9BELKV7KI29n+/lYLA389MTar+uq
 w/dkZ1H+D9Vt8kJZEFlWQ6UiLft0w+sXCSaIfepGBOiZgc7t4Zd2oWlDPcNYNgwJSrdo
 frLJA7hDjrEyFWHMhd6PSkxZMuSwqXughtn0OCAinKpWe0oPwTVVhMn9rbmh+xSqZ1i5
 odRV5U/F70nrzMwTfWgIwJ6bLoW4BhusRoK8mcxmjcnFb043i2Xg86N835d9C4eUM+UR
 Sz/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnHBNZ/y09F6XBQASD0wNVPpdMb9xi5hnTAwUQ+wVB05Qniv8ekBn8q6NHIpdzJDNt/UJEl2X/2Dk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx22iq9AvC6YMbvWxDb4lkvElccUVxCoMseoBP47Ft+sLyoYML+
 zjMrV9/KJ33sFbjiAXZYX0oYTjB79f9dO9I6GpvU+S4jYMW30Rphq4GSNhWMiDGC3CDAgPRroQ7
 zkATWdg==
X-Gm-Gg: ASbGncvCwTOeH5KcdibDJtlye6qq2136l8Vhs6nW8RbwJ2PF6ZqsT538usZ6EQ80tPb
 Y+Q5NXH2a66xD9wAyUtNmTaFODCBknZ3naUwLVq0dTqq62D3gbR+o3l/zg5GHvIREkeJs4VKH+L
 k9kUCoqI1Q82BAimt/LVoIqw2WIZuSRdoQ+WqVWoHF7Gf165T4SVrDDZxtXoC4LVzOiwHqLtlUm
 vUXtyDExk5VS7t+SoagI8iFyHUj33sazLfAVnxqixSr9V8oCN1qa/2sqdpvW7kFdvYTLuPOh904
 dOzq3sGhUGEobqDwi4N2SM8n2ZfbnoL+ha2ZXV7cUtsk57i2wO8iBV5dHlUlQk/S6lLkrlGwLoX
 5Kbdmdu5ZT8J1Y98eVDtxKWrD7jEk0j3SoKKLX1TznJyjR7rl1G0HtmZS7FyUtI/nxuI26rCYcM
 C0XNmmBix9ta0v0IhBHHzwfyf8QlXSzyHnsNrjISgb7gt4XV3KnGmMXK79r7WV
X-Google-Smtp-Source: AGHT+IE0vbeN6rzCM4veHovvu9Pf/mc9Rtoh6p/TZHFSnr8Zy3TLfFyeCCt7YyylPI/JiMl9I3aAOg==
X-Received: by 2002:a05:6402:4407:b0:641:5bb9:fdfb with SMTP id
 4fb4d7f45d1cf-64555cf86c1mr38146162a12.33.1764611386527; 
 Mon, 01 Dec 2025 09:49:46 -0800 (PST)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com.
 [209.85.221.46]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64750a90c93sm12905303a12.9.2025.12.01.09.49.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Dec 2025 09:49:41 -0800 (PST)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-42e2e167067so976785f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 09:49:41 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWUWMVp4rXZW0Lt08aK3rRbmMNLhCa5R0NzWCiGf+90OaCmCecxgqdGH0KWp2sWGKv5DsGdmWZt8Vw=@lists.freedesktop.org
X-Received: by 2002:a05:6000:240b:b0:42b:3661:304a with SMTP id
 ffacd0b85a97d-42cc1d08715mr41861347f8f.38.1764611381069; Mon, 01 Dec 2025
 09:49:41 -0800 (PST)
MIME-Version: 1.0
References: <20251127121601.1608379-1-yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20251127121601.1608379-1-yelangyan@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 1 Dec 2025 09:49:29 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UiwYf3U=mjkEVeyMtsyuXZQoy5buTP8O0k_rUARcO9jw@mail.gmail.com>
X-Gm-Features: AWmQ_bn-T7laNp4qlVi3tbIPZZq0UDtoj14HOFcICyK15YOQ5_L1vetG1Vf5lQM
Message-ID: <CAD=FV=UiwYf3U=mjkEVeyMtsyuXZQoy5buTP8O0k_rUARcO9jw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add CSW MNE007QB3-1
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, jesszhan0024@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
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

Hi,

On Thu, Nov 27, 2025 at 4:16=E2=80=AFAM Langyan Ye
<yelangyan@huaqin.corp-partner.google.com> wrote:
>
> Add support for the CSW MNE007QB3-1, pleace the EDID here for
> subsequent reference.
>
> 00 ff ff ff ff ff ff 00 0e 77 7c 14 00 00 00 00
> 00 23 01 04 a5 1e 13 78 07 ee 95 a3 54 4c 99 26
> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 35 3c 80 a0 70 b0 23 40 30 20
> 36 00 2d bc 10 00 00 18 2b 30 80 a0 70 b0 23 40
> 30 20 36 00 2d bc 10 00 00 18 00 00 00 fd 00 28
> 3c 4a 4a 0f 01 0a 20 20 20 20 20 20 00 00 00 fc
> 00 4d 4e 45 30 30 37 51 42 33 2d 31 0a 20 01 5b
>
> 70 20 79 02 00 21 00 1d c8 0b 5d 07 80 07 b0 04
> 00 3d 8a 54 cd a4 99 66 62 0f 02 45 54 40 5e 40
> 5e 00 44 12 78 2e 00 06 00 44 40 5e 40 5e 81 00
> 20 74 1a 00 00 03 01 28 3c 00 00 00 00 00 00 3c
> 00 00 00 00 8d 00 e3 05 04 00 e6 06 01 00 60 60
> ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 68 90
>
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 415b894890ad..023fbbb10eb4 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -2033,6 +2033,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('C', 'S', 'W', 0x1462, &delay_200_500_e50, "MNE00=
7QS5-2"),
>         EDP_PANEL_ENTRY('C', 'S', 'W', 0x1468, &delay_200_500_e50, "MNE00=
7QB2-2"),
>         EDP_PANEL_ENTRY('C', 'S', 'W', 0x146e, &delay_80_500_e50_d50, "MN=
E007QB3-1"),
> +       EDP_PANEL_ENTRY('C', 'S', 'W', 0x147c, &delay_200_500_e50_d100, "=
MNE007QB3-1"),

Not unexpected, but I guess this is a second variant of `MNE007QB3-1`
since the panel right above has the same name. ;-) This is still the
correct thing to do, though, since it matches the string in the EDID
which could help us if a panel vendor accidentally re-uses this ID...

...pushed to drm-misc-next...

[1/1] drm/panel-edp: Add CSW MNE007QB3-1
      commit: b1ea3babb67dcb8b0881c2ab49dfba88b1445856
