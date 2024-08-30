Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E064E965BFF
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 10:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06BE210EA32;
	Fri, 30 Aug 2024 08:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="eTl1LluC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DB610EA2A
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 08:45:53 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-70943b07c2cso1013543a34.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 01:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1725007552; x=1725612352;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uwb4ryjHwd1WNWOHt2dYb4LFy2usK3hFXIPxUh2iuvY=;
 b=eTl1LluCbMZNpRtLhQy/GdBQWVuT06sM+JUkikb9Vo0RoWp3ZVATUA29bdXlLG8SL4
 pBJwLDUCmLUpL21LJgrbRacN4NZCsTT1LTAvlXTRdTXJbZA2DBu3p2wClo0qU7PZRErp
 fBG0BC8X0FXokoiOUTvGGSsqPuSgNvE7JXDOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725007552; x=1725612352;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uwb4ryjHwd1WNWOHt2dYb4LFy2usK3hFXIPxUh2iuvY=;
 b=PMKFgBPSmhRgjLCgG7p0MO51mwNtIo7lqSvcNtqfMN4gMjyh+/vzVW5ernunQqJio/
 +rlaJnfh6xC3J4EuA7OpUEo+jSOcoEGcGG8XjR0KfJPWkwBuah/nkGaRqCQHK9pEd5JT
 4m0CQTWlFRUZKxGG3jLEXEpZ2E0BX3ra19GE0NmSKO/b7JCwra70VGXx8pQl+6IDgCUV
 vlH3UR85B2Efcn+xxRkr+V360WHzEcwuO6WTI8Oj/Rvv8j7ui9DVWEZVhvsn1fFoeEJk
 aHQb1Q39Y+oMhPI0QkAXPxKXaG+uJtFvA8cujxa7kp6JUYOctL+nyCq9GgHOD0fDsdNa
 Iu9g==
X-Gm-Message-State: AOJu0Yw4w3GqhMP9COCUqJcue0zPPhGtoqQuyMHAR+b+NrGQ3nC6GDBt
 BwcHczD0Lcroiu8f4muN6mjzl77lHTe7gkK49qNagqRWyOcSX1yMbGnBq26NHw==
X-Google-Smtp-Source: AGHT+IGHGLA1gX/XRVCRV3NVqvnH4tc1FAiIFTMavidgJQhJ0QHl48VQRGJQ8UpPf3x2Xi2MLTe3DQ==
X-Received: by 2002:a05:6359:7c15:b0:19f:4c24:d9ad with SMTP id
 e5c5f4694b2df-1b603cb75d1mr694374055d.24.1725007552239; 
 Fri, 30 Aug 2024 01:45:52 -0700 (PDT)
Received: from localhost (117.196.142.34.bc.googleusercontent.com.
 [34.142.196.117]) by smtp.gmail.com with UTF8SMTPSA id
 41be03b00d2f7-7d22e742774sm2467245a12.18.2024.08.30.01.45.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Aug 2024 01:45:51 -0700 (PDT)
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
Subject: [PATCH v4 0/3] Devicetree updates for MT8186 
Date: Fri, 30 Aug 2024 08:45:41 +0000
Message-ID: <20240830084544.2898512-1-rohiagar@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
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

Changes in v4:
 - Rebased on this series https://lore.kernel.org/all/20240603-mtk-thermal-mt818x-dtsi-v7-0-8c8e3c7a3643@baylibre.com/
 - Updated the overlapping starting address of svs node.

Changes in v3:
 - Update some formatting errors in the bindings patch.

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

 .../bindings/display/mediatek/mediatek,dpi.yaml | 17 +++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8186.dtsi        | 17 +++++++++++++++++
 2 files changed, 34 insertions(+)

-- 
2.46.0.469.g59c65b2a67-goog

