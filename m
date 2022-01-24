Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F405149856D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 17:55:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C9A10E37F;
	Mon, 24 Jan 2022 16:55:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D486210E281
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 16:55:40 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 10-20020a9d030a000000b0059f164f4a86so5601677otv.13
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 08:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eDj9YtrL+ME/X2nogJu52e1JjwHXOpFB8AWWGPpN1JI=;
 b=mFvJkRflVMDxfhilop3n9rxvfDmP9BLPXOUunIlHCZ0Xb9y9Ct8IxqFF8rwK469lCm
 KNd50fy+6iX6SJc4AnCBNCrWinPWrZllHsjTCq/S2JBPLb1Fh0Xi6tATKKE7erd/KEop
 Q895XDQnVqwakbu7dAG+gaEyBVuv5/uHjtGQquhJ0ZAuMd8FGRlNp3JsZ+WddCEvdc2o
 SA4cUOrs3H6g5jKBY4lJc0Byhcri9T6H5g0YhQIrR/7VCnw3atyr03X9NzMu8tURvqBm
 KgSjAKpZXzdR18JFpsLFpX2/2YiqEPZAATvRYBEx3OhedscwGW4cfcSYTbOEvCE2AhDD
 D3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eDj9YtrL+ME/X2nogJu52e1JjwHXOpFB8AWWGPpN1JI=;
 b=k8U8vdFeKBg8rxUw6K3B6rAjkTgwQXHnYpKN//IL7CrsF1Zd8Cd5nZj6tzj+D1q3OO
 hWFSfK9WrGel1KhtuTvtChScAUsm/F1oUV2uAjWzcg7ODXiDhdvQwcTX63zxzrxQEUsN
 zebtAJJ0yZIUO2Wf2jrouBM/tjyc7ucpTF57n4u8aI3aVqZmMA1DU2/TnDJiF9ztOQDa
 SVwik4d6Mbgn0jOX61iLGA/dwoQgf2x0aUSv6jVkK8PmRZjCaS7DdoSsI7hUPgG52gvI
 3nb9iMXha0+og0FoFGBQL0nqXezLnKsK69Xit8S9ouUtxSwdAyAtgj3AMPcpnW23/62R
 ze9g==
X-Gm-Message-State: AOAM531oz9XKJLlmombBllfKo9y0VQAEz+Jj3U/yMrMVLJ7pyfvucJ1k
 NtiP1mep6DgbO8RIAi3pH1sX/OtKrPs=
X-Google-Smtp-Source: ABdhPJxc+R5TUybGMgkLTdOCbd88m7UuIygCYWDxjJSp/RRfiTE1CbDPHurAbusUCHTR37gsZpmKdw==
X-Received: by 2002:a05:6830:2461:: with SMTP id
 x33mr2805442otr.368.1643043339780; 
 Mon, 24 Jan 2022 08:55:39 -0800 (PST)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id v22sm4418370oot.10.2022.01.24.08.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 08:55:39 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/6 v2] drm/vc4: dpi: Support DPI interface in mode3 for RGB565
Date: Mon, 24 Jan 2022 10:55:26 -0600
Message-Id: <20220124165526.1104-7-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124165526.1104-1-macroalpha82@gmail.com>
References: <20220124165526.1104-1-macroalpha82@gmail.com>
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
 emma@anholt.net, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 airlied@linux.ie, robh+dt@kernel.org, thierry.reding@gmail.com,
 mchehab@kernel.org, sam@ravnborg.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the VC4 DPI driver to utilize DPI mode 3. This is
defined here as xxxRRRRRxxGGGGGGxxxBBBBB:
https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#parallel-display-interface-dpi

This mode is required to use the Geekworm MZP280 DPI display.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index c180eb60b..3c58ade25 100644
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

