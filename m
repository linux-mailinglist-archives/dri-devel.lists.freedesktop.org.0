Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B989ECAE4F2
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 23:17:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE40110E2F4;
	Mon,  8 Dec 2025 22:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="l0893ZeL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02DC110E2F4
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 22:17:55 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-b77030ffad9so724024866b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Dec 2025 14:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1765232272; x=1765837072;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DX08k1HaBqK25l86LD+r215S7jvK51DBBdPZ2bH5c3s=;
 b=l0893ZeLPYeXfqPvwyWiNEMFmFwSN8Uyhnyyg95wV8fadJiQEffw83B1IU9fuag9lf
 mxtxXuR7CfJo4ghRAVNiVYXCHv9/nELuZlJTdVYbODe4NWVbLKlAL//8SDqkeqsYZ/jm
 7d1igwOiIjXKblsuQ13TPstwDVf1/uGiLm9gM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765232272; x=1765837072;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DX08k1HaBqK25l86LD+r215S7jvK51DBBdPZ2bH5c3s=;
 b=JikCJKI/smQIk+nmhDWaDsMrSFvRE/rfsCQ+kilo5cJU5+c6O68NVkqWzB8xRZapb0
 xdZZOqg/xuJxeBvSEp/Pns2YJdxeKsFFrE6t1UqedmVPYXytM0ULlVBF9KVr5n/rTzYo
 qhE7Z1OiS89kgg0cs5b3k+2FR4BPcTWXAnhzpdw4E1UXohdcj+4o9G+6MNp5QdVY3Ln1
 wgb4nOz7hgu3XHnfx1p1UwBAm2EHFCm20tyukSmec+f+JHvB06SrQZVaCM5+yl2y20SS
 KGvYaunvMEmNgtJZUj7+7yzxNWZiB0n4pT93LZ3FDR9TrqkVkvYzquxdz9SDznzgnrrb
 s7dA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxNNHWQToCO2GPyjgyJSCenDSei/kAO7Xx3qAolQl6aj85cug/8KFy40TMLZAOYxqxNGRxeJ6MeUw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbePcdsVoG9X92zprtNyXiIvp6RXGvxmsAxMxsihKi7Xh1/Ahf
 UR+E7f0J24gABkUoidsgS3mzbxZzct0Fnd7+NTC3GiybSCscIG7WDU1vn/aiyY+KwFFlnjp0ZgX
 Bj6n9mg==
X-Gm-Gg: ASbGncsdnwdCbqG9yk4ZJOV2vU5LqPV4+EYCD8Im+fjH7dRG6meWwc0ITkhyhHlLg7l
 t9c6dvtcWiKKMwjnF0pTiWrpitMm+dwMAuM2/8sOS8s8yn+MK/C1QrAy8hZpAgbR6tRKkVo5x0M
 2bSa4YBJP6KEoypuR2oN4gKnhyEHROzEh07poC3W7K++VyOtaN1kkGVae5X5d8lb8zZf9SobTcc
 sH4hicHt1x46Nzpg/UPq0IrqM1QFxikSwc8serwpOd9bDDHQ1cij4sEJ8zsjpKrxn3xA6LgkIZ6
 XA401YcrAIZOm1hWw+ZcmY5CPqdHyWRNu2YijTtso6Y+yYlrhdqmYbYOX1DJcsDlTygZAxOQ4jx
 DOcTgBxbkS7mXqJ12Yv+eiCYm13jaR0gLaK4q5Jrc5+qSt53P8azWU8q+p2KPtm9+wZj30WNL+U
 TpIOEc2kmTzf3wTfgpASczyU2KaVk0657AdVF+W5+RmV4LVZVqAdGMTngCWWG8
X-Google-Smtp-Source: AGHT+IGCsj1oQoB/HqRlj89//UN9IOZoFC74GCdaDHh1Y48aT3Qa/i/OvnmeVoaleixzt1G+QQGANg==
X-Received: by 2002:a17:906:c10a:b0:b73:880a:fde8 with SMTP id
 a640c23a62f3a-b7a242beb86mr894792966b.12.1765232271634; 
 Mon, 08 Dec 2025 14:17:51 -0800 (PST)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647b3599050sm12074065a12.17.2025.12.08.14.17.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 14:17:50 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4779cc419b2so56526945e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Dec 2025 14:17:50 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVSdS1DjcE9YqA/+c6464ShvIIh52mUqrbL0b9nFIgtCZuUe3+L7cyldIN/UtnPz8ZmRa3Tu2CekxY=@lists.freedesktop.org
X-Received: by 2002:a05:600c:a00a:b0:46e:1a5e:211 with SMTP id
 5b1f17b1804b1-47939e277b9mr98342385e9.21.1765232269644; Mon, 08 Dec 2025
 14:17:49 -0800 (PST)
MIME-Version: 1.0
References: <20251206173739.2222940-1-val@packett.cool>
In-Reply-To: <20251206173739.2222940-1-val@packett.cool>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 8 Dec 2025 14:17:38 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VPgtYxoJK-EAn6VWXkbx8bjP+40APhytzCQSj0uZKzTw@mail.gmail.com>
X-Gm-Features: AQt7F2qUFoDEKkWLKBU_cD6xWF4L_ecyKGRqmzfIlP5wDI5e1UPXz7DpfTcu9vY
Message-ID: <CAD=FV=VPgtYxoJK-EAn6VWXkbx8bjP+40APhytzCQSj0uZKzTw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add AUO B140QAX01.H panel
To: Val Packett <val@packett.cool>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
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

On Sat, Dec 6, 2025 at 9:38=E2=80=AFAM Val Packett <val@packett.cool> wrote=
:
>
> A 14-inch 2560x1600 60Hz matte touch panel, found on a Dell Latitude 7455
> laptop (second-source with BOE NE14QDM), according to online sources it's
> also found on the Latitude 7440 and some ASUS models.
>
> Raw EDID dump:
>
> 00 ff ff ff ff ff ff 00 06 af a4 0b 00 00 00 00
> 00 20 01 04 a5 1e 13 78 03 ad f5 a8 54 47 9c 24
> 0e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 f0 68 00 a0 a0 40 2e 60 30 20
> 35 00 2d bc 10 00 00 1a f3 53 00 a0 a0 40 2e 60
> 30 20 35 00 2d bc 10 00 00 1a 00 00 00 fe 00 36
> 39 52 31 57 80 42 31 34 30 51 41 58 00 00 00 00
> 00 02 41 21 a8 00 01 00 00 1a 41 0a 20 20 00 a1
>
> Don't have datasheet access, but the same timing as for other panels from
> the same manufacturer works fine.
>
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 415b894890ad..b71cef842ea7 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1913,6 +1913,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0xb7a9, &delay_200_500_e50, "B140H=
AK03.3"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0xc4b4, &delay_200_500_e50, "B116X=
AT04.1"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0xc9a8, &delay_200_500_e50, "B140Q=
AN08.H"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x0ba4, &delay_200_500_e50, "B140Q=
AX01.H"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0xcdba, &delay_200_500_e50, "B140U=
AX01.2"),

As per the comment above this table, "Sort first by vendor, then by
product ID.". 0x0ba4 isn't sorted. I've moved it to the right place
for you.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/1] drm/panel-edp: Add AUO B140QAX01.H panel
      commit: bcd752c706c357229185a330ab450b86236d9031
