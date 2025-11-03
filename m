Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E11C2BA41
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 13:24:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E66CC10E134;
	Mon,  3 Nov 2025 12:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="X2qSiPXq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD0610E134
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 12:24:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 52CAD4E414CC;
 Mon,  3 Nov 2025 12:24:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 23AA060628;
 Mon,  3 Nov 2025 12:24:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B75D210B5003D; Mon,  3 Nov 2025 13:23:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762172646; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=jWIBKsXwl+lZlSI+m4JdF3FwkWNJycGm6EYh0H2B5I8=;
 b=X2qSiPXqpWSRnWH7izdKgmYPC9Cuxd5s4IeCuS7c4pB77qAbaYcbs3Dpo5k798ISZlkTLJ
 oUV4VlczKvQa5z6ElJkUxJTEE8dyfrGmsvYUOVZ/tgXzBWWL68R4MzBBLeT1nMxFtaD0BL
 ojW9ItGFvw+TJvHqEm/+b6zWWTC1yJV7VoX/RaVHxuh/Y7CJQpuWCjab0bv6ldd244bL9F
 +YwMYra6bQBYWDoRZHy0GhNUqjcgZwvddEfNHSnmq5Ke2A8LS7aayI5c7WU/CRpm65aqlF
 Wzcw2kBn55yIc3y6o4XVWUylDccNGD8HjvQL0ushUpY2W+n3IDMseSE6Las6ow==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Alain Volmat <alain.volmat@foss.st.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251028-b4-drm-bridge-alloc-add-before-attach-v3-0-bb8611acbbfb@bootlin.com>
References: <20251028-b4-drm-bridge-alloc-add-before-attach-v3-0-bb8611acbbfb@bootlin.com>
Subject: Re: [PATCH v3 0/6] drm/bridge: enforce drm_bridge_add() before
 drm_bridge_attach()
Message-Id: <176217263847.134567.5881036101864864671.b4-ty@bootlin.com>
Date: Mon, 03 Nov 2025 13:23:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
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


On Tue, 28 Oct 2025 11:15:41 +0100, Luca Ceresoli wrote:
> This small series enforces that DRM bridges must be added before they are
> attached as discussed in [1].
> 
> This is part of the work towards removal of bridges from a still existing
> DRM pipeline without use-after-free. The grand plan was discussed in [0].
> Here's the work breakdown (➜ marks the current series):
> 
> [...]

Applied, thanks!

[1/6] drm/sti: hda: add bridge before attaching
      commit: d28726efc637c5e76e23156b0c2418d37ef45b8e
[2/6] drm/sti: hdmi: add bridge before attaching
      commit: ebad7a8f3db6c43c29dacbccb1d7615563f4e80a
[3/6] drm/bridge: document that adding a bridge is mandatory before attach
      commit: f8b460262a28060be932078e2b8d9fb8bf99dcf6
[4/6] drm/bridge: add warning for bridges attached without being added
      commit: 76f1a9711b837f90fba91d00e33549ed1364bea2
[5/6] drm/bridge: add warning for bridges using neither devm_drm_bridge_alloc() nor drm_bridge_add()
      commit: 9347f2fbb0183b04070cd7dfde080bfcc54c0f7c
[6/6] drm/bridge: synopsys: dw-dp: add bridge before attaching
      commit: b726970486d81ed3eea09cf9f80f39fe1928a741

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

