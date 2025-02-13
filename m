Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC115A33C4E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 11:16:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFCF910EA42;
	Thu, 13 Feb 2025 10:16:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="QgFHSXTr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE78C10EA42
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 10:16:28 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-38f1e8efe84so245100f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 02:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739441787; x=1740046587;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xmBDEx12/MlSpiH6V4WRagCuKEu5iUiwWGczemVxZ74=;
 b=QgFHSXTrsblXFeWSgz33CDxCRQgrCZYJws3yGM0lCWCVWEizvMbw2wUI3kKIlrcGgH
 FdYlD8c11YV6IkbMD4/C2qr9M1yPSVabGwmjjC9Jo8kNYYh+C7ueaiihre0NAtOrHiZ0
 5SV2UdmVIA07QeE45myykMRHtg7Mp5+1H3iltpvLchRN/wiH2co2HDetm5AWMq6UgPqP
 ZchzM2lM2ettSIz5WSjc0gvmPqSDWvJda5TXn53j/xDn8GD/q2Ymg3ULqEQvvVbzxf8t
 yjCmazvEmVrmtDt8NhDxXZj9hn8/DorUbS2K+n+5nYNWD3GKEWe0+GICnOeQVN7pi6NK
 BQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739441787; x=1740046587;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xmBDEx12/MlSpiH6V4WRagCuKEu5iUiwWGczemVxZ74=;
 b=MkZB6PRk73BYLf9r5k0irOAaeVUtqjCSXvsZPv4fwWYAWWZctPrj2xSEZgT88APseD
 gu5HBl4qkQnynWlvWOIkwhpw1fOtV34zZQ8zUB6d+G9h2U5VjPQmu1a40ILc9xQSuxtk
 Kt+CilC2rcFEQ+UnBGAb0AEuPZD+4FIkhWn+FoCLsTvVARsPSn5DcNJRWyxjjpwzrW0W
 wPHQG0GVbA5CPR0t0zhWqeLc8+LvRvdOH5YPmAx7/AovzA911QJA3Z4RoRGWW+LY6PBo
 bqD/WV8vagxKeJaE1Nn2WwoIlDK3fEMx/Yowqcu1RsjvONDVtnoSvxidMSCADq19dQ+z
 0WCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUN3tr2pBNgFTM4Cgzh/hxWRZo9sk8Y3VLQOh2lyU4Bk5JF+JfJs0nMFHcURqlMzJwqHN3HkK4VBlg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXdTitltIAlzRpQAPdOu3768GAxVG6rS9Ae3LWt+ec7OPwi2UM
 jLn/k5GTzJtfzh700v97GkCRdNKnfxv3SJQfN5nBolPP3GZpEWoPhh/eQENBSqE=
X-Gm-Gg: ASbGncujFzATehRif/X6dHts8e87gy4CawGWiLUcv+98ycyzdicfPScOhzKARRUCpgO
 /zy7kcVkKauVLvy6LJkSrjlfPWNquHF2fmSUKF0GjaV5cqKigeZKDhTtiU4n3n8ZPr542XIo1EE
 P43qNqJprDcGFco4EoLIPIdHu3aEvhKlQTDSgumTbhjMa9BpBnlvAMcrXIITGbAdYsgno073gTR
 72WGC9IT9Neetp6n1IG2CtYvjaCP9ow4nwGqiRiLfHk6Z2f9uKvV32tIfn6ap2BsC+mjVL6ocJW
 K6U860LtOhOHfw==
X-Google-Smtp-Source: AGHT+IEffmNN4Pb9+ARCo3GKUiuLAJbsEVpvuLGQpUwyPZc6Fg0ln2kIswpBpy9K/UypDXBJlkii1A==
X-Received: by 2002:a05:6000:1884:b0:38d:d8d1:a4e1 with SMTP id
 ffacd0b85a97d-38dea3c42dcmr5386478f8f.4.1739441787185; 
 Thu, 13 Feb 2025 02:16:27 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:b617:2c1:fc8c:2705])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259f8602sm1451341f8f.94.2025.02.13.02.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 02:16:26 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: =?utf-8?Q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,  "Dave Ertman"
 <david.m.ertman@intel.com>,  "Ira Weiny" <ira.weiny@intel.com>,  "Rafael
 J. Wysocki" <rafael@kernel.org>,  "Stephen Boyd" <sboyd@kernel.org>,
 "Arnd Bergmann" <arnd@arndb.de>,  "Danilo Krummrich" <dakr@kernel.org>,
 "Conor Dooley" <conor.dooley@microchip.com>,  "Daire McNamara"
 <daire.mcnamara@microchip.com>,  "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Douglas Anderson" <dianders@chromium.org>,  "Andrzej Hajda"
 <andrzej.hajda@intel.com>,  "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>,  "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>,  "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,  "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>,  "Maxime Ripard"
 <mripard@kernel.org>,  "Thomas Zimmermann" <tzimmermann@suse.de>,  "David
 Airlie" <airlied@gmail.com>,  "Simona Vetter" <simona@ffwll.ch>,  "Hans de
 Goede" <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>,  "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>,  "Gregory CLEMENT"
 <gregory.clement@bootlin.com>,  "Michael Turquette"
 <mturquette@baylibre.com>,  "Abel Vesa" <abelvesa@kernel.org>,  "Peng Fan"
 <peng.fan@nxp.com>,  "Shawn Guo" <shawnguo@kernel.org>,  "Sascha Hauer"
 <s.hauer@pengutronix.de>,  "Pengutronix Kernel Team"
 <kernel@pengutronix.de>,  "Fabio Estevam" <festevam@gmail.com>,  "Kevin
 Hilman" <khilman@baylibre.com>,  "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>,  <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>,  <dri-devel@lists.freedesktop.org>,
 <platform-driver-x86@vger.kernel.org>,  <linux-mips@vger.kernel.org>,
 <linux-clk@vger.kernel.org>,  <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH v3 7/7] clk: amlogic: axg-audio: use the auxiliary reset
 driver - take 2
In-Reply-To: <D7QJX632CRCV.P0ZI0WWT083Z@bootlin.com> (=?utf-8?Q?=22Th?=
 =?utf-8?Q?=C3=A9o?= Lebrun"'s message
 of "Wed, 12 Feb 2025 15:53:38 +0100")
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
 <20250211-aux-device-create-helper-v3-7-7edb50524909@baylibre.com>
 <D7QJX632CRCV.P0ZI0WWT083Z@bootlin.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 13 Feb 2025 11:16:26 +0100
Message-ID: <1ja5aq175x.fsf@starbuckisacylon.baylibre.com>
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

On Wed 12 Feb 2025 at 15:53, Th=C3=A9o Lebrun <theo.lebrun@bootlin.com> wro=
te:

> Hello Jerome,
>
> Why the " - take 2" in the commit first line?

Because, at the origin of the dicussion for this patchet, there was
another change doing the same thing [1]. The change was reverted do
perform some rework and now it is back. It was another series entirely
so v2, v3, etc ... did not really apply well.

Just giving a change to people using google or lore to distinguish the
two, that's all.

[1]: https://lore.kernel.org/lkml/f9fc8247-331e-4cdb-992e-bc2f196aa12c@lina=
ro.org/T/#m9ab35b541a31b25bdd812082ed70f9dac087096e

>
> Thanks,

--=20
Jerome
