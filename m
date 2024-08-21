Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 918A7959715
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 11:27:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E422F10E17F;
	Wed, 21 Aug 2024 09:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="XgoDgXwj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7552B10E17F
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 09:27:07 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-202146e9538so43122825ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 02:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724232427; x=1724837227;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5teIJEcm0AV/k2WnKwH/7mKliV2959WnLZFIN1xCsco=;
 b=XgoDgXwjCGRy7ueFWnhnMGZIbauSQbx3TmZnunFGO1WjrR1PjKarqCyeZtuilXQwKk
 lEzdy0bDSBncPeezZ/EzJvaHiLBG6JRbIvGx5RmwCM1g6GtWxaV89EYt2nY9EL6Ff90M
 Ltti9TyCC3DFbNk70+BTHoNPTEl+WhYowkJys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724232427; x=1724837227;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5teIJEcm0AV/k2WnKwH/7mKliV2959WnLZFIN1xCsco=;
 b=nLDm29fSahshPptbOd3E5xQjkTJIOodY+q1cbroEg/Ip3yA3AGeR00edZXFZ1TSi0S
 ADsSzYA31Gwepa96e7baWAKDLqcI2tQuoQyjnRoCK+L7C0v1RMy5NXQqVOm5TujpHvVX
 IlfQ3ZU7tGd7DdcROVu07STl5I9ugcQAkF4biFOvF4Z9l70hQcCpIDfc/XsI+0KZlDdf
 ldbscDhgUHUTTdMANQzf9455xqk+qHZBQnKDTEZV1s6a1+SR9RVzkpXMRYMhvLACoG6D
 9GvaKL+v2TbeD5olnh/+q/Qo5INXw/frrRlAkBMcnkMqMw3/PswF/osDfn92PCCovtML
 IR+Q==
X-Gm-Message-State: AOJu0YwcVUCRC/uFO8wAyWKZKd0JI3gKF5MJRwLsgol3WQRZmwQu6lmY
 4llfJeBE6RUxxUM/mByTVVf54te3eGJDObuDWnG1Vu6UmX4KqxL9QLK/g0hjJg==
X-Google-Smtp-Source: AGHT+IEbt5Bs5xAE6EXU+ozOpdvalfD5bwlOmLZH40RAQn14UF8l3N604XimOQzcaf0Y9RYTSflQ8g==
X-Received: by 2002:a17:902:da8a:b0:202:1a49:d0c3 with SMTP id
 d9443c01a7336-203681c866dmr12445415ad.62.1724232426742; 
 Wed, 21 Aug 2024 02:27:06 -0700 (PDT)
Received: from localhost (185.174.143.34.bc.googleusercontent.com.
 [34.143.174.185]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-20250470617sm37161595ad.268.2024.08.21.02.27.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2024 02:27:06 -0700 (PDT)
From: Rohit Agarwal <rohiagar@chromium.org>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com,
 jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Rohit Agarwal <rohiagar@chromium.org>
Subject: [PATCH v2 0/3] Devicetree updates for MT8186
Date: Wed, 21 Aug 2024 09:26:56 +0000
Message-ID: <20240821092659.1226250-1-rohiagar@chromium.org>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
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

Changes in v2:
 - Update the binding to include power domain in only some
   specific variants.

This series updates the DPI node to add power domain and
adds the Mediatek SVS node as well to MT8186.

Thanks,
Rohit.

Rohit Agarwal (3):
  dt-bindings: display: mediatek: dpi: Add power domains
  arm64: dts: mediatek: mt8186: Add power domain for DPI
  arm64: dts: mediatek: mt8186: Add svs node

 .../display/mediatek/mediatek,dpi.yaml        | 19 +++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8186.dtsi      | 21 +++++++++++++++++++
 2 files changed, 40 insertions(+)

-- 
2.46.0.295.g3b9ea8a38a-goog

