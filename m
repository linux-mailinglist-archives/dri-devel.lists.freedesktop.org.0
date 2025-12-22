Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4754CCD5A01
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 11:38:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD0D10E0E7;
	Mon, 22 Dec 2025 10:38:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="AsUXENs5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B49D110E0E7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:38:30 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2a137692691so44419905ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 02:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1766399910; x=1767004710;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RtYAJjQTwxOFdnR190NRlUogWwYsXWlIsU8SdM1astc=;
 b=AsUXENs5SXL3WvtPktQ71aU0srGHWAZAnynCP58Kla6WlrUOJ34BzgGhWUoEz3Xm1x
 3htbC6wfX2tTLnhqoAKbMTeQihfemAlGf+CJfisr5wOZVf1De83KTN/lI3ikNmqaWXnB
 ram6Cjkl9pLTB0mGm8klqtEsMFxZ/1A1pjA4j9ljg0xb6Pngr7P8bYUkyOXyXnL9kTPl
 aqT1ey22dEhi8Kblel+EcCp3IRJqFb5BBS773hdsITulByZr1ZUYh17L+Ojy6mtad9K5
 Vl9uNcBOOfPxyrh8sWinyui2mJSgtohKXA9JErlQ6kZwqQGfjuUWnPlSxriAGPmeGgOj
 iGvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766399910; x=1767004710;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RtYAJjQTwxOFdnR190NRlUogWwYsXWlIsU8SdM1astc=;
 b=j1XhTPUcQ2rh12fg7UXt9wvT9b+i9ZSwFGo5xvARitGhZIaaxkXSDqmwYZZ92ag2c9
 khWysu+n+ah/r70atNHrPMKvmDImXXJo88vXZWgAyVjY8CZQ3euZcGUTGvXsqVforsiH
 fZynERv6qGDyHk5DX0FL0yqTWWM5QSM1w6zeyw9QwpXWz+O+VvJT7F6gCLdFBJ6CF2Zz
 C/qDSNwvxgPB3eaJsryFMTrxb11kq76PqQIiDuXDGfFmzxBSbQAwghM4llsjdxNCCLt+
 ZFd4r9StMlgLQpzWAihc36O0Obd50rxKRyrCXO7qoRJ+po+aIeQ7u/9whcr3+CzCCOw9
 OyJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrJtHFumrrKj1XuRp5kSFs1mVlBITV+8Xi1cOUx+4/eQodOZRw5so1kGuEy0FhpEAazs0oKFTCscU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmTIUYv4zx0psSE3aA3WJHvh3dF3jxqDGmnd6ghdMHzZddr6tv
 I6SXVD2ByHYMvdTNNakL1CttFMgpJ0MA9Q00g3CmPpI+ksS2RrkE0FEj8Q7maxe5KlB2MFT7sbd
 oDKPIkx4KCuiy85pRERCSK98ZJ7hFAAw=
X-Gm-Gg: AY/fxX4IORKKPbm3FSTC5FvIMpM94DHWhnsemMqVRd73LW+xyz2q7fMQSKcE1lnSYUY
 vDDSWRduOLwLRHcDQMd9BUn3AbQCg4euW9lWzXvAYvpyf9NM3NdFTE/qnvavrusIMJ1n0oLHIXi
 51b0BXVThyARAcXf7iRR5m5eAna43fHK9Imo7/cRErUa16kMuhxqC0FopfVWndpcC7HfMOUJBk5
 zP90HhZ3WLAYkPhH6hDG09uF0uaIlYOXpJna5iKh7DmtfZI8vqiosGHbOCY7Cmx9ASJswiIacGe
 OXQ8YWtyB0r68bti10uVxk7RMd6D
X-Google-Smtp-Source: AGHT+IEO/ZgFQp5AyfAAtwrHxXoiHa/X/03D0WDYxc4kBLqyULymzY/eR1r0RM8KzOikMvm9YYXtJ3AkgKqBI277jTk=
X-Received: by 2002:a17:902:f552:b0:297:c71d:851c with SMTP id
 d9443c01a7336-2a2f2736bc0mr91265875ad.36.1766399910127; Mon, 22 Dec 2025
 02:38:30 -0800 (PST)
MIME-Version: 1.0
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
 <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-12-b5165fab8058@bootlin.com>
 <CAFBinCCUVOYsiwwVmyGtxN=MdqYatAaj-piVO9_E_iZX9gwiMQ@mail.gmail.com>
 <DF4KIOREQYK3.2JEGF51OECQCE@bootlin.com>
In-Reply-To: <DF4KIOREQYK3.2JEGF51OECQCE@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 22 Dec 2025 11:38:19 +0100
X-Gm-Features: AQt7F2oefOvD1VauOsJ6RYNy_cI4jR0Cqg9gQFauSbHiZ7j1ecdJHG9Us9r2rRA
Message-ID: <CAFBinCBX+DA71OA79SqrE20Nd=QUrU86SmYGXu0dAYG-R5nZ4Q@mail.gmail.com>
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

Hi Luca,

On Mon, Dec 22, 2025 at 8:31=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> Hello Martin,
>
> On Sun Dec 21, 2025 at 10:51 PM CET, Martin Blumenstingl wrote:
> > On Tue, Dec 16, 2025 at 7:00=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bo=
otlin.com> wrote:
> >>
> >> This driver obtains a bridge pointer from of_drm_find_bridge() in the =
probe
> >> function and stores it until driver removal. of_drm_find_bridge() is
> >> deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
> >> refcounted and use bridge->next_bridge to put the reference on
> >> deallocation.
> >>
> >> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > And additionally I runtime tested this on meson-gxl-s905x-libretech-cc
> > where I still have HDMI output, so:
> > Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> Thank you for the quick testing!
Thank you for doing the hard work ;-)

> I think I can append '# meson-gxl-s905x-libretech-cc' to your 'Tested-by:=
'
> line when I'll apply the patch, to make it more informative.
Sure, please go ahead with that!


Best regards,
Martin
