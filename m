Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF5E9CF111
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 17:07:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B329510E89D;
	Fri, 15 Nov 2024 16:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=thaumatec-com.20230601.gappssmtp.com header.i=@thaumatec-com.20230601.gappssmtp.com header.b="TvXedCBB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B7C810E2D8
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 16:07:54 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-aa20944ce8cso369568066b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 08:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1731686873; x=1732291673;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PtX/norJpaur8PMRuPUdwbYS7QJAjkVDPPrL5lAuhMA=;
 b=TvXedCBBou0gxeZLz9YXhy/cwYy1IL73Y+ZHXuPhsBID527hLuEwDJ/MII8PKOm6Zs
 og75li7zfHAW6dY5xCrhi9Bt0IhUoj/v/EiWFjNf21liVjiY4+Tz1RIn1VXxuJRAnOqq
 rYlhk7D0YIpK4ayjDLQod9UyHWtD7BfCQSWKVLrIV7KcL1FHaET69IVGnzPfetZVG7ty
 YNONjg2ZmzmEP86I5t5gOh9jeW0hlR6ylArOew0/RhaI6bXqtV8pMSivuEcsrvolLeTy
 xoNfefEFYaGm9w8XUNhAemmPKevUufjWQfSU8757IaQ0ncy3mO7XXzZZY28/fGJHeKu0
 C4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731686873; x=1732291673;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PtX/norJpaur8PMRuPUdwbYS7QJAjkVDPPrL5lAuhMA=;
 b=qEGj39hHXD46EbM0LtipoTBhpKKrHvh31pqpyUqCl1st39qClkx/ZK0UygFFPZbe7S
 3byw6eDR4kG1afIZnv1Uv/HD34v5efaiz3ZTv+H3oJq5WGaSAuvDDPh7DL25x+xZlpun
 ox2ZR6GFlD7E5Jh0b+4aYXDfVbJ4QIZMzZeZ//YFvyioO+LO9PEKEJ5SCw4pg6kIeeQH
 PkvDD68NRMPmBrDpaAE8SIKYlLqvnVScUYoGSbpTiSSB2SgBfb3IXdEqwkFgkCqPe+Bx
 wwC7dRYmiOO+fAVKyaLBh7AGjK9fMS2LBoOOcax4iiyWq7iBHk28X9i41W+0YCGm/Z8b
 2brw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCptpS/ivVDhyckc18qDOcur0K2io372Um3jmXVTtflRKasLwc4SyWfnPAr3URRuGGPkvn2sVbIXY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw88Ew49SS3tGi8QNC6DjQoupYxN2bX7i2Hu90sjR/fhx+uda74
 2MntuwOJEMkJJOU+Y1gDpUUeGu3isI0HCJud4JPfcbeGowvrY19TSK5vwYThrb0=
X-Google-Smtp-Source: AGHT+IGMEJPIOdwyAkahoo7NqqbmqWg7xlpnqGonb4ULg0DWOVjLuXCFtaBswEHbbxRDLFj0tsBV9Q==
X-Received: by 2002:a17:907:1c0d:b0:a9a:170d:67b2 with SMTP id
 a640c23a62f3a-aa481a5cf4amr243941766b.29.1731686872580; 
 Fri, 15 Nov 2024 08:07:52 -0800 (PST)
Received: from fedora.. ([91.90.172.13]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e00172dsm194948266b.120.2024.11.15.08.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 08:07:52 -0800 (PST)
From: Daniel Semkowicz <dse@thaumatec.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
Cc: Daniel Semkowicz <dse@thaumatec.com>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tony Lindgren <tony@atomide.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] drm/bridge: tc358775: Remove burst mode support
Date: Fri, 15 Nov 2024 17:06:31 +0100
Message-ID: <20241115160641.74074-1-dse@thaumatec.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
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

DSI operation mode is configured to support burst mode, but bridge
driver does not correctly implement it. This results in bad LVDS timings
when bridge is connected to DSI host that sets higher transmission rate
on DSI link, than indicated by CRTC pixel clock.

TC358775 power up sequence is still broken. This change was tested with
Michael's Walle series:
https://lore.kernel.org/all/20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org/


Daniel Semkowicz (1):
  drm/bridge: tc358775: Remove burst mode support

 drivers/gpu/drm/bridge/tc358775.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
2.47.0

