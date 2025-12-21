Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5CBCD4614
	for <lists+dri-devel@lfdr.de>; Sun, 21 Dec 2025 22:50:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3207410E416;
	Sun, 21 Dec 2025 21:50:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="hBzQcDun";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0DFA10E416
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Dec 2025 21:50:50 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2a0b4320665so51836285ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Dec 2025 13:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1766353850; x=1766958650;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I8ESPuhbHJz02YptQK1tw7Lrl7Cucbn6A3EDj5euzbk=;
 b=hBzQcDun9/cT8oEB+LpBE5wL1PQhSCo1iYaPe5HzTaqBQ28EUTjvfEzUNZGb2jKb0J
 IX3FEGOsKMyXdgySLgS7XnMpzBWWyxFpTlNWzpwnIOXV/+kQq5r3/lrX0Nst5SUXdnez
 /qbsvssKBoZwpFNGttV+htSTfKO84+f9xozecIVD+tNMwhRSMrz7XD/WIz+lIhzNzy09
 0aPbL1tYD+zKgtaj9bkYFv90Ix3IEgsJrX9T40/z7YXdWtuwpC88UY0nuc+1EWZ+20C6
 fF28UkpLmXkDbm7nVBIux9Bm4Ck10Bt/MWsRemU5d7B3fYbx309l1UM4t9qpiqSeKVt5
 lI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766353850; x=1766958650;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=I8ESPuhbHJz02YptQK1tw7Lrl7Cucbn6A3EDj5euzbk=;
 b=uhY2BEAA4+LSyjLa/G827X1ZfyWF1ANhz7NOyIgqOHV40pe0DSxjsTT6HWTjqlRtbv
 M04+vXd+KG7IVamCCXGKGC5N1DTETLXg/fjBSUFP6ZrLwEAM6Ju8OjYN2jYg1lJwGExD
 Wh2BSRzHo0Xuds9cqnw4Cbi/mHGqCxuGMDuYlGJPBYKMQVktwWbg8UxV0ujDqsmsm206
 2MClm9XA8MZayF7AQaT6fjuaRvX4x50q+wVr5Ma2OPGyIjgR/HOqRNOH8sf/TfjBmMAe
 VB0EwNKlGcXaILmSGMXQTi8ZEPErilGILMZU5C6aZhyJT8Q5fnctgUpquG6SFxUGZugD
 pqNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOgEqwWF4zRJx1IUok3/2F7JHvYjgd1Al7qLizMh3gMnKojRVuQoQuS7kmpecS9oatO+N8jD799ko=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzoX8xP6A3QBkX9NHBgHFKK4Xtx1jzsdmemvUu/YIcHdr6i8MO
 rU4imdDXXf8NF3/PRD7ka5iukgr7f8jGecQ7oehvpkZntjl4rD4rZtApuuoH4qx4TSMBe+86FMm
 4GidzdJ8Vmf7gh2rw9Wvt8caizYvt0rE=
X-Gm-Gg: AY/fxX5IuPYgBf9QcwwYNiZtExAuCThPUbez4Vm4MwVNttYzIJR3Yqt2nE+3sPrgjHY
 IOIOpGreETyH08+hJXu7K0baTUxtZWmaXmulm9/puWy/M0m53TY9q2HQAR7neoACTOFkhPdpYGF
 WpKPJQ4kjUk/Wqvf2YyNXHEopjM8blcWGGMz0Mpci03NXNR1oStb1VBLWOO9PFM2zAGKv0hSanW
 zQikNsLvGRXCs95iPpMgTRt8Rptpn7QgIOseIQee+Mw0nRyJtrG0s6SzCtGX7jZ8UoU+JALO0GH
 0Pn9gKxHx1Aib+4qysxgJEV9k3+D
X-Google-Smtp-Source: AGHT+IFmGLO1ppe7sd+ZWkCXr5M/lVGVTY4CkYOHQyHuMOoqYtObXJlv15dAaXOXobOy5zBtPFDXPUKZsDC8LF455xI=
X-Received: by 2002:a17:902:d2d2:b0:294:f310:5218 with SMTP id
 d9443c01a7336-2a2f1f904a0mr102182675ad.0.1766353850211; Sun, 21 Dec 2025
 13:50:50 -0800 (PST)
MIME-Version: 1.0
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
 <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-11-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-11-b5165fab8058@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 21 Dec 2025 22:50:39 +0100
X-Gm-Features: AQt7F2oD-fq9YbJ8bBaEtNQvS-l_6JEvIhNv2LhoefMzto1ImTx3Z1Dec3fhOSc
Message-ID: <CAFBinCArG=-pNRHZTdZX1CDDPrs02zpRJ29GSEUA6TcUckQvww@mail.gmail.com>
Subject: Re: [PATCH v3 11/22] drm/meson: encoder_dsi: get/put the next bridge
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
