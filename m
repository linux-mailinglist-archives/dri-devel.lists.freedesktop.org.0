Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BB348365D
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 18:41:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F8389F89;
	Mon,  3 Jan 2022 17:41:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F08A89F73
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 17:41:18 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id be32so55862018oib.11
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jan 2022 09:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PX+r/4GPJoULnjzCN3QguRNvA76vq0GHYjHcEMnDNHk=;
 b=QBo8FGPIErTnDaPOUO+V1UZUpJmBN53itHS+ssQgzOvdbuVVhdiyFARdcyeXo/lNXk
 FsBuO7Xa5qG1lzoeu6E6NSsGrc0GKKLyVN3BUAw6Fx1todd+8EEcXH9ZCxOc5F63c9KU
 GNGb6SgzpoUivRh3RuufBcjEI17yqA7sLo5x8fDmpzma1isfHjID4qbqZOaO+2x6Ddl2
 rSLjF1m4/LfZ/OJsXQCd7SHO2klLD4MGu16fA/EoHCfijEpSoDbR9nGFGZR1Qd3ywzU1
 /cBbukM6edQ4rFOSXyoYrSD8/DV8q80HTQhV6phUTZzMfMKMaHr7UD8uLQ4WkoW+bBYC
 0iOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PX+r/4GPJoULnjzCN3QguRNvA76vq0GHYjHcEMnDNHk=;
 b=ntBmS1MB1uBCfnyF7sMxLBpUvC38YRb1OunVzo6HGW3es7kyWm1CmFXhDjv2FRZ3kg
 k4rn4cq/yPahWW1Pbe6XfdIPasBdR7iYl7loogd3us1zD5qHz2imVC9b5/KqRuWgMyaK
 QpfLTNXlkWwuE3M+6E1KzUfnqnKF1fSurYxHqqM0u5vgDU+BrH5G3VVFNGFQVoXA/vEC
 DvfcDl9vB+WA9/hSh3LAp7whV1zNqv4r4YMwYLBTh2mpzD2wx7+j1Hd9+pRgPWqZwuJS
 vHupiYkG8p0gjHceXkidIw6McGfOJi+5/bK4iypSMMDaNkURaUR4Wr4O+A7jkbxp0P1K
 bdOA==
X-Gm-Message-State: AOAM533tQiZ1kmXSzPxk7sHsK+XWxJ5iRxRojzg2TlL3tAQ7LThsMXPs
 uTYoTNRSZW5heL09k+vsYYnFbewy6l8=
X-Google-Smtp-Source: ABdhPJwvw6H+cCKImuwiy6SfQz3ArlRSXHygzeGhqXXrh+/vi/d0nJ/jRgUGZ2x8fh5iIJfMbwmkAQ==
X-Received: by 2002:aca:44c5:: with SMTP id
 r188mr38082488oia.177.1641231676809; 
 Mon, 03 Jan 2022 09:41:16 -0800 (PST)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id s6sm9368864ois.3.2022.01.03.09.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 09:41:16 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/vc4: dpi: Support DPI interface in mode3 for RGB565
Date: Mon,  3 Jan 2022 11:41:06 -0600
Message-Id: <20220103174106.907-6-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220103174106.907-1-macroalpha82@gmail.com>
References: <20220103174106.907-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 emma@anholt.net, airlied@linux.ie, robh+dt@kernel.org,
 thierry.reding@gmail.com, mchehab@kernel.org, sam@ravnborg.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the VC4 DPI driver to utilize DPI mode 3. This is
defined here as xxxRRRRRxxGGGGGGxxxBBBBB:

https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#parallel-display-interface-dpi

This mode is required to use the Geekworm MZP280 DPI display.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index c180eb60bee8..3c58ade2549e 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -173,6 +173,10 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
 			dpi_c |= VC4_SET_FIELD(DPI_FORMAT_16BIT_565_RGB_3,
 					       DPI_FORMAT);
 			break;
+		case MEDIA_BUS_FMT_RGB565_1X24_CPADHI:
+			dpi_c |= VC4_SET_FIELD(DPI_FORMAT_16BIT_565_RGB_2,
+					       DPI_FORMAT);
+			break;
 		default:
 			DRM_ERROR("Unknown media bus format %d\n", bus_format);
 			break;
-- 
2.25.1

