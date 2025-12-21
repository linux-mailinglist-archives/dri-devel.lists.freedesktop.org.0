Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E049CD461D
	for <lists+dri-devel@lfdr.de>; Sun, 21 Dec 2025 22:52:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC72010E41B;
	Sun, 21 Dec 2025 21:51:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="FBgT5ZWu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A5910E41B
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Dec 2025 21:51:58 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2a0a33d0585so31181205ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Dec 2025 13:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1766353918; x=1766958718;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rCv4G4ZvpwPYN7jvzeJNzTGzYbAJCmcgEYZi8qw+CSQ=;
 b=FBgT5ZWuuLJENILlz2r0R2vwq6JGr03s4FKc+fjqLunlQ0FUrjseOw+7WmgK+Qv6eM
 Nptt4TMm6XUEcXwFLBxNTRrWPoTTnOw1eVTY6ehe+0cp/ds36X6Cl7urU4mLbsZRC9RD
 Kj1m1B7CULjDLkTopr/CvXkE5nyK2B16QxWgCUbuyQ7EN1LCp1zxP9iWvTBSS322+KQj
 aEwzjB0oXjVNoYC1LCKDub87phGd6gIuRdWovJUmyr0guaQzFzBmElqwjiCwky0TlOTf
 C2IajkQwr5mhp+MJHHBU2byt976iuMT/dNayPAgwZDmPScv29oNAbkyPZ2HVwbUKj6eO
 0sPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766353918; x=1766958718;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rCv4G4ZvpwPYN7jvzeJNzTGzYbAJCmcgEYZi8qw+CSQ=;
 b=bgVEyiUvuSFtwPgRzq1lfFpEW4gCsxRwrhjbIxk6kYb+mSB4p9Nu4lEXzIB62StF/N
 VMCwzgcguO68Yy2LRNB637zzvwKfXin9AOJ7M7C2BUtuyeiv2jhcHRiE/KWRVOMz5V/s
 ys2UC0K6wLFitjVi6aLa9ouvfoi4++XE72o0+n5odaG8W4ehYA/Eg/pLksessjQsCXj7
 vZeWtIc3smH4D7drdZwcywsEedV0QT++CLKxJsGb9MV0E/4aOvicnEJu7gNBnA70xJ0y
 PL2fudTJKX8uuo2aCIxxLZgeYwYBW30F8M3HEYOyvqbWLa7eCtmb/UCE54h5wb2HSmky
 NVTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcPydoUpSkT8jjZ0YPRRTzZnT6hBmlh4F3R0pgLsUOrPn1V5ZjlbdHjBSznBlRhFrAx73nedqzgKQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz19jChzKuZa5xe1gT5u8dhDOdKo7SGC10dFs3JL9vVSVp0EA3C
 T/6/NXcgMLDEfYXs764wKhL3nFy2yxNdc8fLPtpXVniD/jAe6cc439SqZTvTAsz82pEHt8nBM/n
 EGaMoU1+lzk1raADG/gpMjbxj+svFfsw=
X-Gm-Gg: AY/fxX7+QBCbvetbkUM/mDPUlhZNTrxV2p3shg0EE4sZO03nf99lDgrJXmy3cEpxpMT
 GWkL4BpdarR6FVu7B2R9/t/I2NLqZTfoS6a9xhWih8jQsUKs/T05g2kMT56Gx3GHHiKhO+0t1ZU
 DJUWoNtoE/99utI9S4XtdVcJx1IvOt0lXlwka3/ORemQ2RCZHFCrFNzEoWcO79Zsk53GVfk450M
 /gXV/LsvcWeOlrQcJF3gkcvkntvRjTidghXmIWX+wiMiRne5FuH3LjBj/o8Mm3G1hB5oUp3DXeE
 UHx5eESn+0v2WJvbibnE/qemMc7v
X-Google-Smtp-Source: AGHT+IFhVsKQ8B8hFSiqKoLGfXbsRY75c2m0MOxZCySUkGexjvaMcQL0jHgp8m1+S1WmJwyBE3X0eYB56oovc6ceHh8=
X-Received: by 2002:a17:902:ccc7:b0:2a0:9759:66fe with SMTP id
 d9443c01a7336-2a2f2735242mr95258195ad.32.1766353917909; Sun, 21 Dec 2025
 13:51:57 -0800 (PST)
MIME-Version: 1.0
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
 <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-12-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-12-b5165fab8058@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 21 Dec 2025 22:51:46 +0100
X-Gm-Features: AQt7F2rrzqrcB2CqEcsVtsm58CwTVijhfO5EKXQK9KI68D9dnI-HolBL_A2auf8
Message-ID: <CAFBinCCUVOYsiwwVmyGtxN=MdqYatAaj-piVO9_E_iZX9gwiMQ@mail.gmail.com>
Subject: Re: [PATCH v3 12/22] drm/meson: encoder_hdmi: get/put the next bridge
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>,
 Phong LE <ple@baylibre.com>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
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

On Tue, Dec 16, 2025 at 7:00=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> This driver obtains a bridge pointer from of_drm_find_bridge() in the pro=
be
> function and stores it until driver removal. of_drm_find_bridge() is
> deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
> refcounted and use bridge->next_bridge to put the reference on
> deallocation.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
And additionally I runtime tested this on meson-gxl-s905x-libretech-cc
where I still have HDMI output, so:
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
