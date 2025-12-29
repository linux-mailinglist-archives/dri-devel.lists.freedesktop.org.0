Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A334CE67C5
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 12:15:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4705210E3E3;
	Mon, 29 Dec 2025 11:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QJcmbd5L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D9410E3E3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 11:15:30 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-42fed090e5fso4151461f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 03:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767006929; x=1767611729; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gpnL12+10WMDZ/zLbFzfXl87AByZQny2Cqko/Ftm7i8=;
 b=QJcmbd5LLXKddqXbqs0363yRCcElXhllkSaLlRD0SXORBub4xd0t3P1o+syD64mYuJ
 oNTTaZ7OkdcU7qNeJmF0bf3Fd1zTC2tqvIBMk7+OJbrjUTRlwW7HMwNJNa2qYuAXWNqT
 i/BXH2LWo0XnVqlz9lCShiA+wi/FXq8LWNS0j5OZoWs0AokyeNdld3m/fV7HdLLC1x6W
 gWmiGI5xQUTcY4g/CNp8sXYqS1ehk/W4/0L9JzJrsB7uC/cMrS1+ERBEqzK/5UQwb1y3
 ciC3oRXLFAkm66Z2SOX8/Zc4utINvsXzlifksoApC1b2qZqpIq0jzwWwjTblysN9sN8N
 umOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767006929; x=1767611729;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gpnL12+10WMDZ/zLbFzfXl87AByZQny2Cqko/Ftm7i8=;
 b=l0xv2J3y/Gw8upUuDnj1wl/s4v61poqls6J8ZtMRSpqUxO0g00bFJGbSHge+OkwMgc
 tq2yYu60j+N8/6xdJveYXIYdZVsouHNCQ/1+W2OlYUA8qzzr/r10PRd1zvfXbFgBRGge
 XdXV181WlIBr4xkJko2xD6D+w1tpIgp90pJ1Onipds08whwVO1i0QBc8SDEwGwFzKTEv
 Z2OG9opBHE1Amaizlc1bLIp9ylVO6qzVLiYnYXncY4idSLjXXh+fEdqfj9uQ/mQ8y0mC
 HY9FrjVrdRxGkRziYEGQh3a1PuPWvdX1DbJLW/OZ7elvoAHR4oqLxjAwTF/aFxsSOixJ
 K63Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfTErSliJina/qH51wmUtbZODzcQ/AgFWJ1GCOF3xXCmckLPdTNWAygaOh5XAs6ZpHuvy6KTpN45E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwN4oEZM13hbOEYledBB7anYzuiD8kdA7N7CQf7mMmH2ZTvCN0c
 JXNlrR7B4uAdRWtdsag1lMi6yj6jBZh/pKGSEgHzMajRFG6uffWcWEtk
X-Gm-Gg: AY/fxX5aQh1Ce28tw6c39ZLGEd9SrhjmKfpZefMlkyktV6291WaXsL5e5WlSK7ITa/y
 T8orUJckxDN1ooq1+LOc3m6lPUuJj28TjxIroNy5e21b1poyRG4+NFNAHYs2lQK+PF5IaKSPLjT
 BNswRZ4oMFHID3KNvgf3tbx1zmnZLNnqT593+YhUPz1e8z0vrl6nb2r954e70JuZPqwbgDSbmqd
 7JuE3uKshqSolgPaMLmT5tKyfse3W13daH1toHs3/250I3Q+rA6P8fy8knUYRmXC4TUpPyx7hNf
 BxklsoTJkDYSIGNiajpGFjl2YfPu1AkgzxogjcXMJPHSKNMO3j9jH6jRxfeg7uTDMMsOpdjQKMA
 C6sV05lUtxSVRyCW6/f9+ozrL6biIqt5OHH5hS6/XXJnt4+fALkmNW0FgwNLl1DUat4fXHsyjYh
 6ZfkvMwxM0ajz8TSzyYXQTz+zUArCfbUeFBHz+f8pkFzC4uSMfT4VQchkjF3GvcCtCtvl1yMNWP
 wrVKjWqupsF7d9458Ng
X-Google-Smtp-Source: AGHT+IE40zrhw3F6xmyWQeMWTwedY3Ymb2iFUauvsMIwQ1EpFshoVSZdHlAb9Q9oq8B4HsHTN7T4mA==
X-Received: by 2002:a05:6000:430a:b0:427:854:770 with SMTP id
 ffacd0b85a97d-4324e50a1c1mr34072551f8f.43.1767006928605; 
 Mon, 29 Dec 2025 03:15:28 -0800 (PST)
Received: from smtpclient.apple (static.253.36.98.91.clients.your-server.de.
 [91.98.36.253]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eaa4749sm62515969f8f.37.2025.12.29.03.15.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Dec 2025 03:15:28 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.3\))
Subject: Re: [PATCH RFC v1] drm/meson: venc: add support for HDMI DMT modes up
 to 3840x2160
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20251108134236.1299630-1-martin.blumenstingl@googlemail.com>
Date: Mon, 29 Dec 2025 15:15:14 +0400
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, tobetter@gmail.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <A9CFD913-A6AD-4078-90C2-C1E46EF5E74D@gmail.com>
References: <20251108134236.1299630-1-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-Mailer: Apple Mail (2.3826.700.81.1.3)
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

> On 8 Nov 2025, at 5:42=E2=80=AFpm, Martin Blumenstingl =
<martin.blumenstingl@googlemail.com> wrote:
>=20
> Commit 5d0bfe448481 ("drm/meson: Add HDMI 1.4 4k modes") added support
> for HDMI 1.4 4k modes, which is what TVs need. For computer monitors
> the code is using the DMT code-path, which ends up in
> meson_venc_hdmi_supported_mode(), which does not allow the 4k modes =
yet.
>=20
> The datasheet for all supported SoCs mentions "4Kx2K@60". It's not
> clear whether "4K" here means 3840 or 4096 pixels.
>=20
> Allow resolutions up to 3840x2160 pixels (including middle steps, such
> as WQHD at 2560x1440 pixels) so they can be used with computer =
monitors
> (using the DMT code-path in the driver).
>=20
> Signed-off-by: Martin Blumenstingl =
<martin.blumenstingl@googlemail.com>

This is not a TB to kernel standards, but it seems not many folk
have ultra-wide monitors so this is as good as it gets:

Tested-by: Khadas forum user with a VIM3 running patched 6.18 :)

=
https://forum.khadas.com/t/can-not-set-display-resolution-to-3440x1440-for=
-dell-monitor/26271/8

Christian

> ---
> I'm sending this as RFC as I'm hoping to get some comments on the
> "4Kx2K@60" note from the datasheets.
>=20
> I have tested it myself on a GXL Le Potato board using a computer
> monitor at 2560x1440 pixels.
>=20
> This is the spiritual successor of a patch titled "drm/meson: add
> support for 2560x1440 resolution output" from [0]
>=20
> [0] =
https://lore.kernel.org/linux-amlogic/20250927130239.825060-1-christianshe=
witt@gmail.com/
>=20
>=20
> drivers/gpu/drm/meson/meson_venc.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/meson/meson_venc.c =
b/drivers/gpu/drm/meson/meson_venc.c
> index 3bf0d6e4fc30..4abd0c09b442 100644
> --- a/drivers/gpu/drm/meson/meson_venc.c
> +++ b/drivers/gpu/drm/meson/meson_venc.c
> @@ -868,10 +868,10 @@ meson_venc_hdmi_supported_mode(const struct =
drm_display_mode *mode)
>    DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NVSYNC))
> return MODE_BAD;
>=20
> - if (mode->hdisplay < 400 || mode->hdisplay > 1920)
> + if (mode->hdisplay < 400 || mode->hdisplay > 3840)
> return MODE_BAD_HVALUE;
>=20
> - if (mode->vdisplay < 480 || mode->vdisplay > 1920)
> + if (mode->vdisplay < 480 || mode->vdisplay > 2160)
> return MODE_BAD_VVALUE;
>=20
> return MODE_OK;
> --=20
> 2.51.2
>=20

