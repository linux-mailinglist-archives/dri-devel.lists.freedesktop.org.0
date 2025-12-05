Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FB5CA7963
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 13:38:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7735410E266;
	Fri,  5 Dec 2025 12:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IBQ8NOKb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3547A10E266
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 12:38:18 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5957ac0efc2so2311833e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 04:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764938296; x=1765543096; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+5ey1vEyaFeJo4owzrkg8DDhyLrlTjfQ2w0NshlQyYE=;
 b=IBQ8NOKbRV1DSwC4uVpYRLzx6LsAah5YkotTjLG2JVO5bUVYpvtnnV77ZD5rjGzXlr
 GhwSP2NX5CGNePieGJdcwXxAcVLVgnWJwCEcH5kPmPJeou36EQvpo/seyaCgrHwtTn+x
 sc8ZuNjkkN1Y3ZH5BdwJD/Cy5B/zp7XiR9JND1tHY0mQI8Fw9i8LUBrjtiZhnPbqMO4P
 i/8a4c6wUWevOqan0AX54K65FNsvG6MkD/vlnInjx9hK2ohX+KMHJ8/fWFLm2/6KHghX
 wjwK5/UYQu3c1+mko0C28DSA/CwHwaGWNg3z0nxx1IxsbYZBkhLydGicZsbf4diQ9YhY
 v1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764938296; x=1765543096;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+5ey1vEyaFeJo4owzrkg8DDhyLrlTjfQ2w0NshlQyYE=;
 b=LgjMYuC9GsHKmvMMT19K9C00zL38+Ve7BbFmq1fj2ZfeO48BJegeTGYuf01P4drTlR
 iZi37gjU5nRAnLhT7q8SKHByj/QjboE7Ygdo8k4YtI0idCW1DhSdHPkbMew/JW7Ww6SX
 WWOe1hIy3L5DCXX/BgUvoG3DEwtvlfkzoRqUG9SjAco+aMKMSeGAHGB8Dab7mvmzV8Rg
 snhVnDz25a8S6rjTioIwuttpTlxFjwvTGkaXdxPO/9KC//gG2ku0m6h98YY00vHzwamb
 HGlrzeuSoi+IUVLHhZUoRd2gYjwmziNuOyH6SG0n10AVRqt7UFngJIZ5r6YVbCzGpZdM
 aqlg==
X-Gm-Message-State: AOJu0Yw8O3yY2vZQo+pBLEe9Y8pfdf3SvHr2El5b1yRjhFbE3sokGmBP
 RuMGn3EoAtb29Or5Hn0ZZfrftzWTfRgYvEo1/lDAll73/qXIhCB2jTXPgFqEXBK731iobK/s2g+
 7Vf8o
X-Gm-Gg: ASbGnctpA1M3Y3e2SH6anFXovkI1nxCIpOkE9WJqVLwpkGkGdYWKaSBu8LAR2W1yMYI
 +LLwgkR9ZO3SfnGvILOt3S4Fsy2qm1UdViGvsI9K3Yr0ZGviXYyn9Ph8ID8Otuouy9uqZrofTs9
 OIqITaWNrl1itjSo4gy4aw4c3DWA65jYvdl/TzjfjWrMkE1KI/dJIeU6wlRpU0At7dmTIKTOB+p
 xqYG1Vg58AZdQ5NMt/KjViVSZEx9y626uPtHYjlPqFgjT65Ha1ZnWFNtW3bX1WHExGoh8sRwX2h
 g0mh60axq5cypIfbgoaHMyj6TQLRSfEMoaS5tZiVMiftjnNvAKmft1gkH+GcofTkWnVs3lKPMYi
 uDxCNi9EQ8lmevhCSrCle3cJA4jnIehX+hCUZ/ZTxhmjPzem4QiHo81uIMMtMXcUbtHxkL5fT+S
 fYG/Dpaa0gK0DC+eGBrrW/YwC7QyaFWtGoHQPqyLl1CjIsMHem8MLTyGg=
X-Google-Smtp-Source: AGHT+IGW2bb2aXb80GsQX+9Ems/GXyuy3a+l7wu6YocZqKOXTMs0CQftJf6gYMoE9NHuomun6mch5g==
X-Received: by 2002:a05:6512:1113:b0:594:2e8a:1663 with SMTP id
 2adb3069b0e04-597d3f3e67dmr4010247e87.17.1764938296402; 
 Fri, 05 Dec 2025 04:38:16 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-597d7b1a3d9sm1462351e87.4.2025.12.05.04.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 04:38:16 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Michal Simek <michal.simek@amd.com>,
 Bill Mills <bill.mills@linaro.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 0/2] drm: xlnx: zynqmp_kms: 16 bpp fixes for Xorg startup on
 AMD KV260
Date: Fri,  5 Dec 2025 14:37:49 +0200
Message-ID: <20251205123751.2257694-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
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

Hi,

Currently on default yocto images Xorg fails to start on AMD KV260
because 24/32 color depth gets detected but does not actually work.

These two patches fix the issue and now 16 bpp gets detected
and Xorg starts and draws on external HDMI display using
kernel.org based linux-yocto kernel.

Anatoliy Klymenko (1):
  drm: xlnx: zynqmp_kms: Init fbdev with 16 bit color

Mikko Rapeli (1):
  drm: xlnx: zynqmp_kms: set preferred_depth to 16 bpp

 drivers/gpu/drm/xlnx/zynqmp_kms.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.34.1

