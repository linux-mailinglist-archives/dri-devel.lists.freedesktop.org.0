Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3254AD1E5C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 15:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C19D10E363;
	Mon,  9 Jun 2025 13:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qpWyOBp2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D777A10E11E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 13:02:28 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-451d41e1ad1so33721495e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 06:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749474147; x=1750078947;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Bh+Zp7cUZNAenLGdWusNvBpvA8IMsAYVSOUkU7ta8Y=;
 b=qpWyOBp26A3HGF8v6pmTF6I+GrgPUEJ9aNGWyL870jdzI9MABI0vS+Vax86cgEwwBm
 xizc64AMNCB+iaXY6fdYy8TTS+gSINS/DNtA0MtzOZsILe6Hntxe8frkQy+d8b3qNiBB
 yJZYnMTF5sQtkA+cvG2+pZcjDowCEm+Lhr8NffQMYLLEOj91J5LS6KeCt8FF1GS4GIKP
 xx3Jzl7eUqi+ScaDIpLj4mA4HEO1wN/3qfrhg55G7hAwSpNHtrIRE693ed7g5NW9ozP5
 oHYO4gyT6VREJJLCXtM/3LMibLmK96H8y1aF/3EJjS3VJF/1UwYwkkxUD7Wuafg1fUsE
 B8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749474147; x=1750078947;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+Bh+Zp7cUZNAenLGdWusNvBpvA8IMsAYVSOUkU7ta8Y=;
 b=NYf4Aks/RnqPTckOyKmGjkeblhBPQdXH5ptpUhKCzDP/8/rA2rgaDalGAuONmoI3FZ
 OxFVlkeYHiZNkJCzRozaIa3oLt8Upkq8buhxshZW3AkjspvgPRb+HwgYg48ygIKtUA0Z
 xw2KQQjuz11Q/1BxWRiLDEp0SSyRT1Kz5UgZT4v18F27+V4Ds5XpKL6xLK5ojMxEbeLI
 QH+iMhBmIqajdBqfD5n0ayP/5c5qe+om8ckCSDpbmHLJe/TaZKeU5LA3ZI8Bzwe8OUBT
 LrDlcb2uFxcc2pI2lXubsh+KI/GMC4VJoNJ8gDioh5w6ho71t4wZcxKL5+xQe25SDbEI
 5T3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnq7zs3ABTSnc0s9khg6eRmZdxt49v7p7aONooWo1BblJukFw/sunMOaqM/j72Mn6X1Q4sZUBtYt8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx61SzmtC+GRp+R4KBZ9P++APvWswJHa/ymR/Pi/beewq9N8gL4
 Tln0kbRJ2xvX7u4mPmo0pSnBcaYUeFOw7NDg1HmV7EJohuBikxBtqRRFItpwPQ72t0U=
X-Gm-Gg: ASbGncu4MlqIKYSsL/PwllHG2X8GlE76SyIPp2buUtl33jyR4BgTS1M/bLW3zQQrZFh
 sqq8RhltmYcY81amJSgNIJ/9q7zhJxkGSl4VsK28N+/oEHx/u7E/4IURnkt/OdL25CohaY5aa/Q
 +JPyK8wOeOdQSbVTfJS8U4kGLnpwFRabp7Cbc8/87/SgotYF1teiZVdqI66cE8tPVblWOtNBsQi
 L8b2S/zt+LUWAG4Q28aHMO4JOw0XPNPh2MFMnfyrgmxYzXDFLPVn78xM4ZFnD2iKwR6gh+N8b5k
 QIQCdEIVKF5yD3nzPKaq2FlIGXMxfZkRsHvQHtMmw6nWThbcI/k=
X-Google-Smtp-Source: AGHT+IEC224y8+mr5qcnD9k9Q2VLvv7fn9ojcXNf/BK82QyxQgrEFMVWAZeFnV10+zDndt5WfXGhRg==
X-Received: by 2002:a05:600c:34ca:b0:453:1058:f8c1 with SMTP id
 5b1f17b1804b1-4531058ffa6mr39477275e9.3.1749474147101; 
 Mon, 09 Jun 2025 06:02:27 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1008:ff30:c454:e59e])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-452137290b9sm110888675e9.34.2025.06.09.06.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 06:02:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Dave Ertman
 <david.m.ertman@intel.com>,  Ira Weiny <ira.weiny@intel.com>,  "Rafael J.
 Wysocki" <rafael@kernel.org>,  Stephen Boyd <sboyd@kernel.org>,  Arnd
 Bergmann <arnd@arndb.de>,  Danilo Krummrich <dakr@kernel.org>,  Conor
 Dooley <conor.dooley@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Philipp Zabel <p.zabel@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>,  Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
 <jonas@kwiboo.se>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,  David
 Airlie <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Hans de
 Goede <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>,  Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
 Michael Turquette <mturquette@baylibre.com>,  Abel Vesa
 <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org,  platform-driver-x86@vger.kernel.org,
 linux-mips@vger.kernel.org,  linux-clk@vger.kernel.org,
 imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 3/8] drm/bridge: ti-sn65dsi86: use the auxiliary device
In-Reply-To: <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com>
 (Doug Anderson's message of "Tue, 25 Feb 2025 08:04:57 -0800")
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
 <20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
 <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 09 Jun 2025 15:02:24 +0200
Message-ID: <1jmsahcbkv.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Tue 25 Feb 2025 at 08:04, Doug Anderson <dianders@chromium.org> wrote:

> Hi,
>
> On Tue, Feb 18, 2025 at 11:30=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.=
com> wrote:
>>
>> The auxiliary device creation of this driver is simple enough to
>> use the available auxiliary device creation helper.
>>
>> Use it and remove some boilerplate code.
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 49 +++++-----------------------=
-------
>>  1 file changed, 7 insertions(+), 42 deletions(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> I'll snooze this for a bunch of weeks and check back to see if this
> can be landed in drm-misc-next every once in a while. If you notice
> that drm-misc-next has the necessary patches before I do then feel
> free to poke me and I'll commit it.

Hi Doug,

FYI, this is safe to take with v6.16-rc1.
Please let know in case you prefer a resend.

>
> -Doug

--=20
Jerome
