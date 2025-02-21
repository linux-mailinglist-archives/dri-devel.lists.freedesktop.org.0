Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 666EFA3F332
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 12:42:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 435F310EA56;
	Fri, 21 Feb 2025 11:42:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TaXka9dO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31F610EA56
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 11:42:49 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5dee1626093so5723616a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 03:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740138168; x=1740742968; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XkLj3L4dQlpMsdIQhF3lEl4OZRGB90PZA1PEkLCsjsA=;
 b=TaXka9dOMvPgZXQQ/gPEUxnFEywSu5lJcTqWqduNZbJ1xlwkEylIq8U+W8Z+aeCYTu
 u7vYuA+Tn3Vy6AxX0IrQogyVPO8L1TuVhz7/LhgITh5e9X/D6+01HnB9or3bjFFQoSP5
 rjMyiDzDlm9gjNt+ousT7L0thJpmLCT1kYkihmSIVANc2nXZdxN9r+qqasXPC0dKMQcG
 E0WejFDWB60AfmYVWHZ5rNdvMAAD/cty3rgtwaoF7gAVE5hBkSlC6yVAn5IJXiI2W0iL
 kVsLinmqyTEa/QtjFFUNEcp4jInvIFZryEFmSIXhdWCSVvWtO+HyrLijgLBIW7xBNG1w
 7w+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740138168; x=1740742968;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XkLj3L4dQlpMsdIQhF3lEl4OZRGB90PZA1PEkLCsjsA=;
 b=O7mjB8IKB+lKtD+cC+Bz4Cqba6a75EK6WMlW+E20iRbhfJjlKnLzEcr+VlnEFb1PVS
 GzNfoH3MPo+K323qMjytvVtv7+HG+gGLS4RKKwBsPtiPBsIG1SmGpciLk5uC/qu8jOFh
 2vWh+KigbElqk5zYHJ8/TuReXDUQLOPO1cQmxz3ZDfj1LknV3foNIcyRzcJ7uJ14eD4O
 +zTzW3wYENycymW/QIdB/rfTPPec5grT+qNvljgyvbVUFcX6/ZaOhYAEr/EijGjGoZMq
 nas1c4sCfLQ1DHs/b8QwLJTyDxwuB3th55vWANo5TaJxTtCeVI6UyzCyZpRKND88V4X4
 fHgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvIWR7nPSx33KPOj/03g0fda7oFJiIYdIGPw2fcKNz1I0ZHGJ5Wv/LyCPenTaG6u8BM9kS3JP0Cic=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwASo+n9hbFHsO0f8pF6lYrfZm/trwybz9CTXLQSX2zgqYh3EeC
 uXb/A2izlSdsaFDZqNZ6ooMH1l5zhH6EZV7mYE8cXUR1HDnGhM9L
X-Gm-Gg: ASbGncsHWz6ZvKDZReCDb2omida2E+1yHm5rQdr2ukTUeHVFPNShHjNbJUoz+qJRVyC
 rVYNb9/PPuWNZYJi57gibwiUa9+q96vTzRYDP0DIP92O1ENFs7vafDeS0rtPgaKRdEr9+0T0lkI
 529NzdLvg9UZooIgLD8+B2NiE2Ktje1tHLiBUoYqLvMtAHZ+3u8ltFch9vTO4ES5S1388Ro3PYE
 ezrJb62OM9XVVHdnZibYcLbXSpfIRzS+/EGRa10kMoV+4MU0VQUCWBFf8+H/oPuEj3o6sNXlqKM
 gMSOJucp9b+stRwiMnqNn8RmBXMZ5iS+W/gZDNfH4Zj19ZgyhVCrnLRcDOUkP1czOvN3ANc9zE4
 y7a5RfIA=
X-Google-Smtp-Source: AGHT+IGqnd85Z6uUbc80gi8ICKJ1IHVsX+dg/Mm+5UiTzJwBP7TGxu1s6WSYqAFeYjWEnu0FlWu8JQ==
X-Received: by 2002:a17:907:7e8e:b0:abb:b411:5e02 with SMTP id
 a640c23a62f3a-abc0aea5253mr285729366b.18.1740138167711; 
 Fri, 21 Feb 2025 03:42:47 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl.
 [89.66.237.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbad879b26sm789563166b.44.2025.02.21.03.42.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Feb 2025 03:42:47 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH v7 0/3] Add HDMI audio on the rk3588 SoC
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <BA73C4A1-C680-4748-9CE1-4B3B19A14261@gmail.com>
Date: Fri, 21 Feb 2025 12:42:31 +0100
Cc: linux-kernel@vger.kernel.org, Algea Cao <algea.cao@rock-chips.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org, Niklas Cassel <cassel@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@collabora.com,
 David Airlie <airlied@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 FUKAUMI Naoki <naoki@radxa.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Johan Jonker <jbx6244@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Alexey Charkov <alchark@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5E535D58-AEFF-45A4-A1EA-1FA282F366AE@gmail.com>
References: <20250217215641.372723-1-detlev.casanova@collabora.com>
 <B8EF5196-55FB-44EC-B93C-E327C791225B@gmail.com> <2357838.ElGaqSPkdT@earth>
 <BA73C4A1-C680-4748-9CE1-4B3B19A14261@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
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


Small data point: on rock5b switching in dts analog audio: from =
audio-graph-card to simple-audio-card (so dts is: =
https://gist.github.com/warpme/349b27e49bc6f617ef1041047e75adab ) makes =
kernel oops go away with analog audio still working=E2=80=A6

so maybe issue is in audio-graph-card code (or its dts fragments)?


