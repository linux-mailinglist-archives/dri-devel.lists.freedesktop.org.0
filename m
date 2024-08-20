Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 457199580B9
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 10:19:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A32A10E4F8;
	Tue, 20 Aug 2024 08:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="RcDVwSG0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251E710E4E6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 08:07:09 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-710ece280b6so3911530b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 01:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724141229; x=1724746029;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2IqJ1+bkvBcuO0rX2Lm5C4OmqxXFYhn4ccngQPHsmSU=;
 b=RcDVwSG0I6CUnByGawKVFNmh6HIkBDwvKpHL2AOQIUNX8hhFbCj862/i+EgqnCrp3g
 uXyocfVW6YN5JhEtbeLT/7ttdll7T9fjYmRHLjRd2c3ycycVVjyF6SQnE0vJsg2Bv5Mv
 +qEau5+4Pkko/hIrI5CqxTLYVgavaNbqXb8EI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724141229; x=1724746029;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2IqJ1+bkvBcuO0rX2Lm5C4OmqxXFYhn4ccngQPHsmSU=;
 b=FQaycDfQLPAfXDNr9H5aaDMyycUu+kbFSa7Ei66btos318GzE+uBs3ypZxEhp4AJBp
 f1o6ZHPmTHmmowFIVjd9vrENm/AkdR/edmRciSyu+U7LEH8uDlI1kvwk9O3eKm5mFtph
 071FrVEuS+/PKTeUegzCXgL0Dh0KTpDPxyuhvEzp4fjuTxGF4/ljcYgu4x6X9LqoRzk8
 W/IBZl8ehE8N0cO+CtjTD6LM5c1sC7x0E/cpX+zutYr8x5wrBjkU09oywfN/VpCszIx5
 WTz6Vn7MQPrzu/WkKWEFF2ElNyqHv3lH8bc+rGKBhaXWnyKkz3NZky7ixAkjeQMb+5Kn
 NcIw==
X-Gm-Message-State: AOJu0YzGEFJjOWSAAeX3XzcgaIvK/22qZFK5DG1axTdnAHQ2NSq6ZZph
 ih2kkpplsRmsvfkles+VG4WoHkMc8y4c0ZWfVjpfeuf2WrZzvBCj09ARlZq1rg==
X-Google-Smtp-Source: AGHT+IFsp879gvOCuiWqNYPlJhONwAUWVejcI/mL94YGseUTQfzsKn3hYBaN2GBrQLgP+qt+XwaKyQ==
X-Received: by 2002:a05:6a20:e68d:b0:1c3:ff89:1fc6 with SMTP id
 adf61e73a8af0-1c9050586f7mr13067519637.53.1724141228509; 
 Tue, 20 Aug 2024 01:07:08 -0700 (PDT)
Received: from localhost (185.174.143.34.bc.googleusercontent.com.
 [34.143.174.185]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-201f0303435sm73051755ad.42.2024.08.20.01.07.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2024 01:07:08 -0700 (PDT)
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
Subject: [PATCH 0/3] Devicetree updates for MT8186
Date: Tue, 20 Aug 2024 08:06:56 +0000
Message-ID: <20240820080659.2136906-1-rohiagar@chromium.org>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 20 Aug 2024 08:19:19 +0000
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

This series updates the DPI node to add power domain and
adds the Mediatek SVS node as well to MT8186.

Thanks,
Rohit.

Rohit Agarwal (3):
  dt-bindings: display: mediatek: dpi: Add power domains
  arm64: dts: mediatek: mt8186: Add power domain for DPI
  arm64: dts: mediatek: mt8186: Add svs node

 .../display/mediatek/mediatek,dpi.yaml        |  3 +++
 arch/arm64/boot/dts/mediatek/mt8186.dtsi      | 21 +++++++++++++++++++
 2 files changed, 24 insertions(+)

-- 
2.46.0.295.g3b9ea8a38a-goog

