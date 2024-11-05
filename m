Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F34F9BCBE0
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 12:29:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5313310E575;
	Tue,  5 Nov 2024 11:28:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AuzfMBOR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E56310E575
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 11:28:56 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-539ebb5a20aso5678048e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2024 03:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730806134; x=1731410934; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lqc3fxtDc2RwHuGGy/EVNQGz4UxO/NG1km2hGQDTiaU=;
 b=AuzfMBORkAtRDnykw49OVFRTcvoSCC5v0u+0S8R3S5aC/J0lrchvp0nBFtCH712Vm6
 dZEPbOasIKfWcF2QXGv3OHIZK5TuBKXxGatzMDgaFWJo/ODe0tRJNPZJEbWJpTjcg+/m
 mwGxVUArSYJxDWL6zWn+w+gMB7sohiT7KCzMtZmCDAVQMUW8bDBdfvDYPmD/RFN89Uze
 dcf/xQr+xs18QaIAVLtKSEY5DLsXGXAnxX7viHusvVr3md7xCIYROVGb5QIhDZyFLDzV
 RBCmAL9yn5ZZIRoGyGmN+fORKRjuMeQaKPECvQgfNtExFaXROEdSgpxQSvyxAjsIKtS/
 4yRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730806134; x=1731410934;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lqc3fxtDc2RwHuGGy/EVNQGz4UxO/NG1km2hGQDTiaU=;
 b=rF8mOEuk8QYXu2I4v84Tn4OFRA2pYkkjMC5KiltbGFD9JTNbEem5cCPUDhnGvuGhHj
 uo0Fs5zxCkyw6JkJx+iw+8xutiBuSRmGHxMilExBPIqJqvrLAYyPcSJmOMpfCfY9nfC2
 2FhPe9cwKEJKLe7BVIWxu1MpmyblzYc+MEmvZr8VrOeG0fVIEHLUNl3wsonxpbBGDD4Z
 7HbUOPG+xMA6kc/dDs5d9wA3cRdibTHmT+B9hBhlB6kQixPpcVMdIN4P7icFAsCdgwtv
 NFqNspgC7r9/zeCaOj7qQctG9Yu/OONFvnzvwOFiGDZUh6l50Lno/NTf2sFuTdD4MGv9
 EWiw==
X-Gm-Message-State: AOJu0YyQnJzo+z6J18VREMLPdWvAOLN6HacpZsRP8jFcxuDYTRzIqh0H
 +dBYv0Kft9TLm8YKDoH3C2cBtq/xMRnWfS8Ix2zreuNZlcNmMAM9BEYP+5s4MIlrxeMEF6qbcGn
 Exj4=
X-Google-Smtp-Source: AGHT+IGazolcFL8rsDXTC+coJxYFbQY28nmJAc6aKVJwz0sBWevsWrSg6NX0J5MzQM2/Ky5L0ke0DA==
X-Received: by 2002:a05:6512:3e24:b0:539:918c:5124 with SMTP id
 2adb3069b0e04-53d65df3203mr7408960e87.31.1730806134153; 
 Tue, 05 Nov 2024 03:28:54 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::7a1]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bc95957sm2098533e87.55.2024.11.05.03.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 03:28:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Liu Ying <victor.liu@nxp.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de,
 nfraprado@collabora.com, thierry.reding@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org, marex@denx.de,
 biju.das.jz@bp.renesas.com
Subject: Re: (subset) [PATCH v5 00/13] Add ITE IT6263 LVDS to HDMI converter
 support
Date: Tue,  5 Nov 2024 13:28:48 +0200
Message-ID: <173080602214.231309.12977765173766280536.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241104032806.611890-1-victor.liu@nxp.com>
References: <20241104032806.611890-1-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 04 Nov 2024 11:27:53 +0800, Liu Ying wrote:
> This patch series aims to add ITE IT6263 LVDS to HDMI converter on
> i.MX8MP EVK.  Combined with LVDS receiver and HDMI 1.4a transmitter,
> the IT6263 supports LVDS input and HDMI 1.4 output by conversion
> function.  IT6263 product link can be found at [1].
> 
> Patch 1 is a preparation patch to allow display mode of an existing
> panel to pass the added mode validation logic in patch 3.
> 
> [...]

Applied to drm-misc-next, thanks!

[04/13] media: uapi: Add MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG, JEIDA}
        commit: 5205b63099507a84458075c3ca7e648407e6c8cc
[05/13] drm: of: Get MEDIA_BUS_FMT_RGB101010_1X7X5_{JEIDA, SPWG} LVDS data mappings
        commit: 34902c2d022f9d36b739189efae3f5fd569983fd
[06/13] drm: of: Add drm_of_lvds_get_dual_link_pixel_order_sink()
        commit: 606410292f54ef08632bdfd5c58974cf4ebc3cc9
[07/13] dt-bindings: display: lvds-data-mapping: Add 30-bit RGB pixel data mappings
        commit: e3160748780c66f32ae5e7c17373c36a4a802bc3
[08/13] dt-bindings: display: Document dual-link LVDS display common properties
        commit: 8cd4937ebfeae03a094e9115ab3286bf01498a5f
[09/13] dt-bindings: display: bridge: Add ITE IT6263 LVDS to HDMI converter
        commit: 0a86a4d1a09185cebe071136599b7da619388f7a
[10/13] drm/bridge: Add ITE IT6263 LVDS to HDMI converter
        commit: 049723628716c7286d6265812567ef1b1ff4827e
[13/13] MAINTAINERS: Add maintainer for ITE IT6263 driver
        commit: 946f2b6a1c1383fb3a16780b425e0ddf40b3a2dd

Best regards,
-- 
With best wishes
Dmitry

