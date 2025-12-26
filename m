Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA29DCDF16F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Dec 2025 23:33:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC8C113033;
	Fri, 26 Dec 2025 22:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PjipeK3f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D61B113033
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 22:33:12 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id
 a640c23a62f3a-b8018eba13cso1104592466b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 14:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766788390; x=1767393190; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=j8CxVX1qWvQ4lkG5RXNtsZNTMQqCg7BcQuj4X8ilrOQ=;
 b=PjipeK3fYCcTwNBIxkLRsIPNJ9Q2TPJ5S4PuNHk5TybKWUdKdTgYexsPAN0qkxM4SO
 QjHDmn3Y507gvZwx2Ji7S4bBvMFC8BA1yPmk2R2DYBZo/OpJS0tLtjDG9HBq9r6una85
 17ZZ5blCqOv8YWRT47Y84LFRd+WPqqqELB2j13Q37AAtq2+k8cYPiS9FpJtCjg20S5AW
 g0O/0j1LtStrzfaLgMVlNnKdvb8XfygJLiSFdARlpJZEHk0aN3k0TQ6BwE3z0K8wUE/M
 1iUE/sI8d/pUTTC3zgQt0mHVoaZikX37B80wQsIbIeolO/JCvGyXxgBiYa+kxYsFUkXv
 mbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766788390; x=1767393190;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j8CxVX1qWvQ4lkG5RXNtsZNTMQqCg7BcQuj4X8ilrOQ=;
 b=SuHImzfqU8/mbHtboMwiAWMNMU6eZrCiSNWWdWBCKILNMiL2truN6XmGbSFnZRxDWK
 uj3AUs/vbrDs+1ZtZu7VaT58Uvuxoc1x5NtApydoj6QuBjvdhvk9r9RLj7JTdxVtT1Pw
 C28bGseTUH1MWM/2+oD9kjiq5+ML+KMI2WZyQb2EFo+NAk2/NqqqJxow4GsPqyMnwMwI
 07r/NKxLxkjKV0zxfc9OWs9qHgjTiTMB0gZCfzD7nS3VMg2nJ+L/JKIZB/I7q6AP0SxQ
 1F/Xm4s9sMq02A/YtjtLa2q9WTEKxE+RMqVH7TBgiiuc4/mqEkRKmuVR3qK7fA2GhinZ
 F74w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRC5au4nX+15OikRe+FnzWW5kkTlGxPzcbddcIvsVaaoR5dgbCxxZISLcb0UIVO2wgFykEjPA21hE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuCYkhmfpUwZiCUzxFfoXmhkqKa1gohBsXez94nX9D8NQswfp1
 23NH7Xh73J6nblNkvwcCyh06PddihPysBfXVevGwCp/bq/Nab3TmSjxW
X-Gm-Gg: AY/fxX53quIELt7SkDqBvkmKGQdfnZ+Cb7Tq+iPs49m9XM1IQNR24VNupFEQ+m1p2kJ
 npWG0kknE6c5b6gza+pUWzj6f9WkRyEXPSl9C2uJ0Dlwrk+/rn2Wzb6WObQilV0L1kBKKDQKSRY
 kqhPOT6JFaA9yBLtL4Wy1W4OEPj3dPgAMsazeEfjKBMq+/CbhUTSTwlMfz1EpK37Kzfd7L4LN5W
 cZAOB7SreRlRPqvb5DPyF8+CFQC3CrAdxODEjvNmampBEvUQLwbFvHKv66yQYsbOltyjJVkWmF7
 j2G89bYoPZ9SeWJN1aRjVaPJRwVgcUucftHmn7f85XMZU7T4r0HQc33bvAjoB1yieAp/Ix1BNIb
 CXkMnnp+JZp9EaV0NDhU7iE8Y3WQ+/q0aIZYyC16TxUsBC0nqHnbq1P9rwXahDh7G60pIX5sfUE
 SF2EJTzvWuVn5tSVlnvHoo2kvB7Q==
X-Google-Smtp-Source: AGHT+IFezj0P6NsDe4IVAJ6GUY/QTGFK6DsM/n4DJGRerM3qHMQMcQsSMEh/LwANi1tYAp72ha0kDg==
X-Received: by 2002:a17:907:1c27:b0:b75:7b39:847a with SMTP id
 a640c23a62f3a-b80372228e5mr2733650266b.60.1766788390149; 
 Fri, 26 Dec 2025 14:33:10 -0800 (PST)
Received: from osama.. ([2a02:908:1b4:dac0:2c1e:db18:2fb6:1aa0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f3ffbasm2519099466b.61.2025.12.26.14.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Dec 2025 14:33:09 -0800 (PST)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Andy Yan <andy.yan@rock-chips.com>
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: synopsys: dw-dp: return when attach bridge fail
Date: Fri, 26 Dec 2025 23:32:28 +0100
Message-ID: <20251226223229.123860-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
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

When drm_bridge_attach() fails, the function should return an error
instead of continuing execution.

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 82aaf74e1bc0..b6fe313ccaf8 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -2062,8 +2062,10 @@ struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
 	}
 
 	ret = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
-	if (ret)
+	if (ret) {
 		dev_err_probe(dev, ret, "Failed to attach bridge\n");
+		return ERR_PTR(ret);
+	}
 
 	dw_dp_init_hw(dp);
 
-- 
2.43.0

