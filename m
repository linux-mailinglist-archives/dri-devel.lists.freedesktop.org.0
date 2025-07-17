Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37913B085A0
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 08:58:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B62C10E6BB;
	Thu, 17 Jul 2025 06:58:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="Elip9N35";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F1D10E6BB
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 06:58:11 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-74ce477af25so451083b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 23:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1752735491; x=1753340291;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nRMZHukFq/Fz1BxRKYe9su1Usquvr1NXauedg+WKKBk=;
 b=Elip9N35MuZuYODVe9d1r/vI3HSPmACjMlf2/E1uybPauL7Md+NQh74rhHJ1h/hr0T
 zEack0PjSAHN6tn/Yl8PYTFKn/qUy2SJ1L40dBeZfkWWtrsU5tyiUaQ4uqCFxUnIqYFx
 OK9KpqBwVDtubcpiXVr+rbC9HgIT6oW6DyZJJFCccnf7IMD1GyNYwHjjfNGEgWViRzum
 gU6QXuPj06IV32XKAE+8HSqxy42r60q16c0YpLYe7R61CD1JWleJ1bG66mZ5z1/Ix4X0
 G7hIBtOn+4A/zEh5phTY7N4osSlIS7f0GPghRTCJ9wKLcsV87t0o69ITEi8BiBux/0eF
 /3gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752735491; x=1753340291;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nRMZHukFq/Fz1BxRKYe9su1Usquvr1NXauedg+WKKBk=;
 b=DKeKphOggJ7rtP5AqCx15W63vCRMoZwx4V/3fkyy9r8iMQsiXmvZ6Y6JwZy8jqQ/vb
 Vy4RBDH0Vlv1Ajczkgkg9JcVMUgT+bbdVBHXQOhV1lRBPmf1H3P4oZHz10g0nSrpAnka
 9BMjwGhzb6sAy26VMR8+DuPhhY8O/IDIGazE2cdiXk8kJJCMglejfACkHb82G8quANPi
 Pg5I5+a40WwYJiTsHD0ZMTq/Enxgp4zuT9FvAlFSVNmm8HYFVIV3TmdnRni5VBdgEEaG
 GUYmKZiQwmDjel5hsqKWZbqoMsj43FTXuKqennaIlsbHmKKT+hIVA5T+mWh2EyuQG7sE
 fC9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX32+fruG6NFIC42zjLk+w/yKFwPg0AXxIWnnPTxleb8RclIdF++bKYxXO5bzRLGBK6sGq+6UMon60=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHGFM0Pl3IH56Gy97B6kA+MTOUHanJlnaO0+hb7T95OgAn4NKK
 6lwx0lm8x2ryi7AQ6lkExdxaJ7Ud772/Lul6YJVXy6kwp7yOdDP+eOSG2Uc80bbubkQ=
X-Gm-Gg: ASbGncuke0CWCGmn64RYLwjoHz1aARbhqfj+h42vD/lBUjFInkGsGQtpEkHbwxaiVfi
 CfbmnuwNkcDKQ+FAcjLvLU5GYFi4JhIeyvWbYND4As/dWu8epoZSzVJK6WkVF4eGp9nc6kjQmlf
 ExQlC6svVkFaJhtKXYuTLzbadQd1W6a4OVWRg6zjzgXDajqCHy94zKMLIYPWYPlwCjBywOh+0Ld
 DwDB3tw1AqBoE0LDJFscRA38Ph012aBvXN1xtmuTXzRyg3FM9Qz85ouHI4gScreTiL0+ExyHYDo
 GchBlm/i0Xj14sbIOHmC/g3lJBFy7g1s18/D3enkKAghQWOyRhPhwjZZfmVp8TYRvN485k0irqL
 8pbPkXPAkE319767Wjx27v/dIG+XKwnMieh5z+SJEM6Y4P8+fUq0u8g==
X-Google-Smtp-Source: AGHT+IEliMbgtuTCQXNVVOMflDMHgY0pux0knysFK+gpotQ655Tfx39EtFZBf6v78DQtGzuRTvmzQw==
X-Received: by 2002:a05:6a00:170d:b0:748:2eb7:8cc7 with SMTP id
 d2e1a72fcca58-75724677639mr7982430b3a.21.1752735490724; 
 Wed, 16 Jul 2025 23:58:10 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f4bc51sm15157293b3a.116.2025.07.16.23.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 23:58:10 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org, tejasvipin76@gmail.com,
 diogo.ivo@tecnico.ulisboa.pt, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v3 1/4] drm: Create mipi_dsi_dual macro
Date: Thu, 17 Jul 2025 00:57:53 -0600
Message-ID: <20250717065757.246122-2-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250717065757.246122-1-me@brighamcampbell.com>
References: <20250717065757.246122-1-me@brighamcampbell.com>
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

Create mipi_dsi_dual macro for panels which are driven by two parallel
serial interfaces. This allows for the reduction of code duplication in
drivers for these panels.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---

In case it's not obvious, the indirection between mipi_dsi_dual and
_mipi_dsi_dual is meant to allow for the expansion of _func in the case
that _func is also a macro.

 include/drm/drm_mipi_dsi.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 369b0d8830c3..32da8861f9de 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -431,6 +431,30 @@ void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi_multi_context *ctx);
 		mipi_dsi_dcs_write_buffer_multi(ctx, d, ARRAY_SIZE(d)); \
 	} while (0)
 
+/**
+ * mipi_dsi_dual - send the same MIPI DSI command to two interfaces
+ *
+ * This macro will send the specified MIPI DSI command twice, once per each of
+ * the two interfaces supplied. This is useful for reducing duplication of code
+ * in panel drivers which use two parallel serial interfaces.
+ *
+ * @_func: MIPI DSI function or macro to pass context and arguments into
+ * @_dsi1: First DSI interface to act as recipient of the MIPI DSI command
+ * @_dsi2: Second DSI interface to act as recipient of the MIPI DSI command
+ * @_ctx: Context for multiple DSI transactions
+ * @...: Arguments to pass to MIPI DSI function or macro
+ */
+#define mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...) 		 \
+	_mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ##__VA_ARGS__)
+
+#define _mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...) \
+	do {					       \
+		(_ctx)->dsi = (_dsi1);		       \
+		_func((_ctx), ##__VA_ARGS__);	       \
+		(_ctx)->dsi = (_dsi2);		       \
+		_func((_ctx), ##__VA_ARGS__);	       \
+	} while (0)
+
 /**
  * struct mipi_dsi_driver - DSI driver
  * @driver: device driver model driver
-- 
2.49.0

