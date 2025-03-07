Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3852BA5635C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 10:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B4110EB11;
	Fri,  7 Mar 2025 09:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iuDiHx3E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F94C10EB11
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 09:15:45 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2ff6a98c638so3169429a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 01:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741338944; x=1741943744; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cTEQtsNDpMTEAuo12CfPbUrfIXkF/+bRSFAzAmu8bNg=;
 b=iuDiHx3EmbRYIBKBoL/0d0FN8UD1lgdldQ0QvBrgaOvuzH7RZahKbmx49vnNg+BCMe
 Sbnc4AGmFm1eyxlnAe9AYtinX26aliIE7N7m1Wp/gMVNvt58jcOdJm8bY+jNf1GqS5pd
 gecrbFDrHX4GIWhkuggJs5s1bhDvzI1V+jCD9W2ovK3pPd3OdH22A8NZ1lRBdgsLCSqH
 iK4jicYZxYAltgOw31T5K2+T+zecw0opoLDeNGv8SXi+4l7CH95OIKYctGtUxnXbJ65p
 jhWaK9pBrCpsSYIGnRjzgHVpgsJi2dC9tbvhIADk4J3gvH4klgvfV/CLvowrc3QKJgoG
 s8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741338944; x=1741943744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cTEQtsNDpMTEAuo12CfPbUrfIXkF/+bRSFAzAmu8bNg=;
 b=LispAK9HFA24SX6iWwbm0rOXURjb6J341bWcnVvoeZyGUnIm40wiGmz0DJQORvuS2N
 n/rojC6Wz5zVxWPzc7D0a65LVzhVKj4Q5AmPYpXw1d56k76jwtpuMFtFnjdzOo2Ri/Mx
 MzdDASFhvAufHfFnGcbGpvqkuUGP9CrHhSmz+imf+eFivgIY9Mrcm6f+6WS9cUVVGH4w
 hk9HTwDwPCOeRk7EF6U5fW7i2apeMCwsPmHL0Ew4dDWrPxQq82Ixqz6iLa/XDIl7opNK
 HorSTT6iFYqg3Vd+oUZJOO/ED90QPi1Vge07jcgyMKwiHdzqidsygcL4n0Yl1IzmGfZi
 Jlfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjNOBxHzpKQU4jLuHYree4lbnlV8hdUWeDZQkxeQXKWVCslS4e9LnJM62HejOf96rF0ZOXpsV0KM4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvYq3hY1Arj1WOeGa7XEuipxmxjuom/AUHdp3UhumDdZw/FlS/
 RWNHlb139tq5P628FQzP2o+7FP9XdrQ25ylChgWv/0+HutcAFlngBEitdQ==
X-Gm-Gg: ASbGncs16AOfJuOkD+EDjuhPzpvAbA2I+OMYGseN/vI5tuwEdsmagUDF6cNxjGk7ZwE
 Ze4KaYuYicUSnnJgm6u5EV112R2kMTRp9zNzniaaYWunGGqc7EjQOH2a7oGajHU3RMR/5lsXC6G
 mrAeB/pbZt5x01zZk40BFUQY7+7ul96rIFCI4wjCXmTG/KKTV3CS+/HY2QHsBE2g5BDwFS6xVGV
 HreTrmeHRWmkBRUxz3OGp/nYlxpoF/GL1J0mEI39DehJCfkCjSh2Y7QeyeT1lfCsfA1wq6QFYcf
 JhE3C2Fjj29aOZxDaE7TrBBMWAw0UMglUM7nN8QVJ50uKSNYJUJmzGbUmKX23qk=
X-Google-Smtp-Source: AGHT+IHPQP3t6+AgORSL6BXyyzUz4ljqlr/LPYND1h52ZOt9zldf8tqnLuWoYqmIFgWN7aKpCbjxsA==
X-Received: by 2002:a17:90b:3ec2:b0:2ee:9e06:7db0 with SMTP id
 98e67ed59e1d1-2ff7ce6349emr4649914a91.11.1741338944384; 
 Fri, 07 Mar 2025 01:15:44 -0800 (PST)
Received: from distilledx.SRMIST.EDU.IN ([59.152.80.69])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-224109de11asm25563985ad.31.2025.03.07.01.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 01:15:44 -0800 (PST)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lujianhua000@gmail.com
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 asrivats@redhat.com, Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH v2 1/2] drm/mipi-dsi: Add mipi_dsi_dual_msleep
Date: Fri,  7 Mar 2025 14:45:18 +0530
Message-ID: <20250307091519.245889-2-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307091519.245889-1-tejasvipin76@gmail.com>
References: <20250307091519.245889-1-tejasvipin76@gmail.com>
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

Introduces mipi_dsi_dual_msleep to make it easier to use msleep in the
case of a double-DSI panel.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 include/drm/drm_mipi_dsi.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index bd40a443385c..d9bc0d79dd82 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -306,6 +306,12 @@ ssize_t mipi_dsi_generic_read(struct mipi_dsi_device *dsi, const void *params,
 			usleep_range(min, max);	\
 	} while (0)
 
+#define mipi_dsi_dual_msleep(ctx1, ctx2, delay)				\
+	do {								\
+		if ((!(ctx1)->accum_err) || (!(ctx2)->accum_err))	\
+			msleep(delay);					\
+	} while (0)
+
 /**
  * enum mipi_dsi_dcs_tear_mode - Tearing Effect Output Line mode
  * @MIPI_DSI_DCS_TEAR_MODE_VBLANK: the TE output line consists of V-Blanking
-- 
2.48.1

