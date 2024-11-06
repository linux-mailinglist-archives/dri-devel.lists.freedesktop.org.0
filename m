Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D65BD9BE240
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 10:20:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDBE610E1AA;
	Wed,  6 Nov 2024 09:20:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aY0jI94Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8938C10E1AA
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 09:20:15 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-431695fa98bso50554505e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2024 01:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730884814; x=1731489614; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=nFpPn0d2yFLk+e22ei9wc3wv5WH7ZWHa4AxPfroJzYQ=;
 b=aY0jI94YM3CtIq9UI0bfld6NQVMtqcZxy0ivmJnzmWqIpaFg6ceKSu49NfM7Je7BR4
 GB8yiDFamo/D6n874fkS9pZmnfhmvsRlpawdJUPrOq50sUtFulynhff+l3ZTEhtvjX2V
 V3bfh7bdBxk1tI4/mnCZHzGlL68VswjoSUTEcvIU0qYEjPU2Xc/ka09rxUt/8wl9NgGo
 h6vrQRoIbhbsflkEhlhUAxW5nChHckyDqLxZ1+zsonozxjULZKB5z25lwq+LPYGqc03v
 cKfQUXT0FkkYQBPGakw2/ee5Jph8+i7jExjH4c/psSArlJf+IbSPaHQG3TtXkYbi5VMR
 xVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730884814; x=1731489614;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nFpPn0d2yFLk+e22ei9wc3wv5WH7ZWHa4AxPfroJzYQ=;
 b=VoSUhIcPqB/UslREUmLd0PCDGHsTY1CUzuWxXIPW45P/uPe/6MOPxTYz+4xdJz1KxT
 tVhnSweMspHBnh0S4g82OFrwb36ZJ2ukdbchD9YByCNnolbNwemVRnO7H269zilyLA6k
 vqIIRiuc76SQAPkktN0cLJKyJHS6xY0gO79RBU+9vDArf2jWkKUpIhKgOVeVjV+8qe1Y
 zBAJ4hUXqITmoFuHNoJ+ebnwFlEkIlbfFpjgVCNRZNKOZkPMt+5r44IKGNJPpqKyeuel
 RKbuCljI9/jBSYmatfgfXnXEJmSMHbs4GnUawz8dXFruxL8sHMTLwYE7UfPcZ884r10j
 BCgg==
X-Gm-Message-State: AOJu0Yy4X1PRbqCKyoMQ0dWYB001yQ5NDMksEQ4lYK2Il89Nw1PcIWmJ
 7sN8JYwMXo8ZH9lAxsfCtGCJfyJSlBlgtcNFuaBLkaj724A6IBegk0xJI6pPTnI=
X-Google-Smtp-Source: AGHT+IEYpLtbvoq+DLNXwR3nRAmR6avtTq4h+YsWpETFhBlqaeNqXWJjhte4lroosj4mGd9kd6ILbg==
X-Received: by 2002:a05:600c:4fd3:b0:431:60d0:9088 with SMTP id
 5b1f17b1804b1-4319ac9acedmr359810715e9.13.1730884813855; 
 Wed, 06 Nov 2024 01:20:13 -0800 (PST)
Received: from [127.0.0.1] ([89.101.134.25]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa6da939sm15286495e9.31.2024.11.06.01.20.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2024 01:20:13 -0800 (PST)
Date: Wed, 06 Nov 2024 09:20:12 +0000
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
In-Reply-To: <20241105-succinct-pygmy-dingo-4db79c@houat>
References: <20241104032806.611890-1-victor.liu@nxp.com>
 <173080602214.231309.12977765173766280536.b4-ty@linaro.org>
 <20241105-secret-seriema-of-anger-7acfdf@houat>
 <CD810D31-F9C5-499D-86CF-B94BEF82449A@linaro.org>
 <20241105-succinct-pygmy-dingo-4db79c@houat>
Message-ID: <7C2A2BDC-07E8-4ED7-B65B-BD7E4E5DC53F@linaro.org>
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

On 5 November 2024 17:39:40 GMT, Maxime Ripard <mripard@kernel=2Eorg> wrote=
:
>On Tue, Nov 05, 2024 at 05:33:21PM +0000, Dmitry Baryshkov wrote:
>> On 5 November 2024 16:13:26 GMT, Maxime Ripard <mripard@kernel=2Eorg> w=
rote:
>> >On Tue, Nov 05, 2024 at 01:28:48PM +0200, Dmitry Baryshkov wrote:
>> >> On Mon, 04 Nov 2024 11:27:53 +0800, Liu Ying wrote:
>> >> > This patch series aims to add ITE IT6263 LVDS to HDMI converter on
>> >> > i=2EMX8MP EVK=2E  Combined with LVDS receiver and HDMI 1=2E4a tran=
smitter,
>> >> > the IT6263 supports LVDS input and HDMI 1=2E4 output by conversion
>> >> > function=2E  IT6263 product link can be found at [1]=2E
>> >> >=20
>> >> > Patch 1 is a preparation patch to allow display mode of an existin=
g
>> >> > panel to pass the added mode validation logic in patch 3=2E
>> >> >=20
>> >> > [=2E=2E=2E]
>> >>=20
>> >> Applied to drm-misc-next, thanks!
>> >>=20
>> >> [04/13] media: uapi: Add MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG, JEIDA}
>> >>         commit: 5205b63099507a84458075c3ca7e648407e6c8cc
>> >
>> >Where's the immutable branch Laurent asked for?
>>=20
>> The patch set has been picked up after getting an Ack from Sakari,
>> before Laurent's email=2E I am sorry if I rushed it in=2E
>
>I mean, this was less than a day after you've asked that question
>yourself=2E Waiting less than a day for a mail to be answered seems a bit
>short, especially when there's no rush to merge these patches in the
>first place=2E

Point noted=2E I should have been more patient=2E As a lame excuse I could=
 point out that the patch has been up for review / comments for quite a whi=
le, etc, etc, but this is really lame=2E=20



>
>Maxime

