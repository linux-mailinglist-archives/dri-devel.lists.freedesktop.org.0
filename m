Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CB89BD36E
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 18:33:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B4EF10E0A6;
	Tue,  5 Nov 2024 17:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JFIoif5T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1292010E0A6
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 17:33:31 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-539e5c15fd3so5649799e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2024 09:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730828009; x=1731432809; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=wL1RRdJvbyow0/4Gx8okr/VQzPzKmrgzOSUtxcyZLw0=;
 b=JFIoif5TEJtiPlLznG6hgJgalnMOJysMoQn8KPutQKEItdd/Qrx7HtTohm+joxEihl
 sGSDfXPr75RYNHhsiMyW0lnMdNrsVvEb+eYDYjTbeX7SXg52ZQXUGM96gx43yta+cu/5
 TE2JY8zpAXEH4XyyaWqMdYjel3YBzupm/+TabgieJjr/BKMjEnX41UATkLO03TvJuciY
 bHYjCVrFWxI8cNWWNlrMFwP9FpGkDgsrWCdNqkCWPm3cZ9z6Fb30+tMNqHwP6IZswbMS
 x8Fa/isATToxGN0mY07It4tCp0LmpwDc8UqRmLEvUaYf6FbxqmNmweKNZ+oQSmc/bL1y
 81EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730828009; x=1731432809;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wL1RRdJvbyow0/4Gx8okr/VQzPzKmrgzOSUtxcyZLw0=;
 b=hG1FYiRXr4QahLqRXilOSXIBCj9eKaqLRvJfnykC/O5xLM9U1uQ/y2+FjuaPv8XEAy
 88voH+nrK11E3wSNwawJddf8emtfreV749zVogakyvqfHQULthwqlXA7Y25vYcmafVOa
 56ofHOQRiC84rsTUf0w8VZldlhzLhgSx5G6gmzbv9Fcon/Kry5dclgLIfpi2QMvwXDhJ
 OX50lBXhvPOASOV8Q5CixkGIL+NaieD7tYLg161x57Da5ZzbjhW6Cd5A986W5Ust3Rwf
 SN8mvFMIIRETVojAgwDiv7DoKxrz2BTR/cmpsOXAPcus/lNDsc4X1Ux4VRpZkZK7EXwD
 J5uQ==
X-Gm-Message-State: AOJu0Yxa2CHtUKFZT9uuaNXYZ8CQGx06pPV7vzVA6OzdjXsC4FdfgDXl
 +x9eHpBbshsCKxLWWBMcBVrrEF5+gxiRluckXB/jXPYTN4sX5yMKAyc1Rm9kADc=
X-Google-Smtp-Source: AGHT+IGi18Sva7NE2bGd9ATSS1dZp0tYBcKab71BKwIRnXTz0bTETPbOkVUJ2V8gRDOK6fT7ixUiNA==
X-Received: by 2002:a05:6512:1307:b0:539:f886:31c6 with SMTP id
 2adb3069b0e04-53b34a18f24mr19326836e87.38.1730828007874; 
 Tue, 05 Nov 2024 09:33:27 -0800 (PST)
Received: from [127.0.0.1] (85-76-138-48-nat.elisa-mobile.fi. [85.76.138.48])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bdcbc3csm2221064e87.193.2024.11.05.09.33.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2024 09:33:26 -0800 (PST)
Date: Tue, 05 Nov 2024 17:33:21 +0000
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
CC: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Liu Ying <victor.liu@nxp.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de,
 nfraprado@collabora.com, thierry.reding@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org, marex@denx.de,
 biju.das.jz@bp.renesas.com
Subject: =?US-ASCII?Q?Re=3A_=28subset=29_=5BPATCH_v5_00/13=5D_Add_ITE?=
 =?US-ASCII?Q?_IT6263_LVDS_to_HDMI_converter_support?=
User-Agent: Thunderbird for Android
In-Reply-To: <20241105-secret-seriema-of-anger-7acfdf@houat>
References: <20241104032806.611890-1-victor.liu@nxp.com>
 <173080602214.231309.12977765173766280536.b4-ty@linaro.org>
 <20241105-secret-seriema-of-anger-7acfdf@houat>
Message-ID: <CD810D31-F9C5-499D-86CF-B94BEF82449A@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
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

On 5 November 2024 16:13:26 GMT, Maxime Ripard <mripard@kernel=2Eorg> wrote=
:
>On Tue, Nov 05, 2024 at 01:28:48PM +0200, Dmitry Baryshkov wrote:
>> On Mon, 04 Nov 2024 11:27:53 +0800, Liu Ying wrote:
>> > This patch series aims to add ITE IT6263 LVDS to HDMI converter on
>> > i=2EMX8MP EVK=2E  Combined with LVDS receiver and HDMI 1=2E4a transmi=
tter,
>> > the IT6263 supports LVDS input and HDMI 1=2E4 output by conversion
>> > function=2E  IT6263 product link can be found at [1]=2E
>> >=20
>> > Patch 1 is a preparation patch to allow display mode of an existing
>> > panel to pass the added mode validation logic in patch 3=2E
>> >=20
>> > [=2E=2E=2E]
>>=20
>> Applied to drm-misc-next, thanks!
>>=20
>> [04/13] media: uapi: Add MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG, JEIDA}
>>         commit: 5205b63099507a84458075c3ca7e648407e6c8cc
>
>Where's the immutable branch Laurent asked for?

The patch set has been picked up after getting an Ack from Sakari, before =
Laurent's email=2E I am sorry if I rushed it in=2E


>
>Maxime

