Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF5C976C63
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 16:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A2D310EBAB;
	Thu, 12 Sep 2024 14:44:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="BL7ZYzkB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3A210EBAB
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 14:44:38 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-71911585911so878953b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 07:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1726152278; x=1726757078;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SnjQo2l57VNy0/9b9V7jPtL8zuWKJeeYd2oBfdE66r8=;
 b=BL7ZYzkBTKnkooLIok5gv/KSuGx56NWN2wR7+Phwsrk5dMnP3J6Ex8OKuXducgIGdc
 H9+jS9gOljmiuXBWr674EaM58utowJqda/H6fqVMRkbz2Jy1fVZlhHa1m3fCSJdbb56a
 qmZesmX8m2cryOoQZiQsarIBtV828iDxsgo/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726152278; x=1726757078;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SnjQo2l57VNy0/9b9V7jPtL8zuWKJeeYd2oBfdE66r8=;
 b=cBvzeZE5+RjWTSOFpQYBOlyG8/03o+F33oVuh0jDg5bGiFtw/US2YN6WuquFqPgsU2
 j+otHWAQePw6/mjQ2U5ia8Kkxf03q2DzXWMgDXJBpT8Rdd/7bLU1esEvFujLo4LZBUBQ
 xJxUXcDmkgzffHXV6LdeL7AeSAPpDKFCkLpwt158uAZzR+kJmgwHexlV4RVPmdglQ+MS
 9U7zu5roY95gW3o2D6jQ+BcBVoFF+7IfLbpiw4eU/z3nYGfRoPxKylAtVUjtIB9csra1
 fZFFuiUJrzYkuqkxQvWRnySE/9gU41IqNFzzM+BOR7f6Q0jvv/UwrPtUPTZR7eLjn80U
 qvYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlsSJzWWze9YBVdDbymDbLrbuC8B3GtiS8UfbSty0M11uvm2HEcDP6zeTJ4tmVng8i6JUSVwn6T2c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlVihd+CJEu+DMxsCVt1bfUHQlj5gwcWe9doFvgEOuofXnJ45p
 hyq2xxYHkfelIoiduJUzHJR9HGAi9lxqTv93MbqQef1AsOumKBTp1oiZ+cRUd4Ykxskx0PoZyQE
 =
X-Google-Smtp-Source: AGHT+IGe8UZsXDErTlsFVsKEqocto9ktULRfXcWaq34cYE7rYYe0pLbf4dzAsufnELC8pqE5fNjDew==
X-Received: by 2002:a05:6a20:ac43:b0:1cf:36f2:21e9 with SMTP id
 adf61e73a8af0-1cf76358fdfmr3795202637.32.1726152277655; 
 Thu, 12 Sep 2024 07:44:37 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:8638:897f:b6cd:8c44])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7db1fdee186sm1826269a12.85.2024.09.12.07.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 07:44:37 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 CK Hu <ck.hu@mediatek.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Pin-yen Lin <treapking@chromium.org>,
 Fabien Parent <fparent@baylibre.com>, Jitao shi <jitao.shi@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH 0/2] Fix dtcheck warnings for mediatek,dpi binding
Date: Thu, 12 Sep 2024 22:43:57 +0800
Message-ID: <20240912144430.3161717-1-treapking@chromium.org>
X-Mailer: git-send-email 2.46.0.662.g92d0881bb0-goog
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

This series fixes two binding schema errors in mediatek,dpi binding.
The first patch adds the power-domain property to the binding, and the
second patch adds the port node as it's required by the binding.


Pin-yen Lin (2):
  dt-bindings: display: mediatek: dpi: Add power-domains to the bindings
  arm64: dts: mt8183: Add port node to dpi node

 .../bindings/display/mediatek/mediatek,dpi.yaml           | 8 ++++++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi                  | 4 ++++
 2 files changed, 12 insertions(+)

-- 
2.46.0.662.g92d0881bb0-goog

