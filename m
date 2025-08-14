Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCABB26CB0
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 18:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE5B10E8BA;
	Thu, 14 Aug 2025 16:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="fCW8G+nN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A028A10E8BA
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 16:41:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1755189694; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=X1ayUfJQ6DxKLvbCksPYrzsQ1oIm5hH5yDRN7Fzl2+xnSKb75olCwJxaA/yQ0aScftXy0n35mHg8yrTAqgYVd2VO5/L8jbHUxeq4fYvolC+AMRkoGcUaVnNrZ2nc/DQn8hA8SIJIL9RcZqzz0bCmd2v9WQT1LcH9UHlvcaPB3PM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1755189694;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=AwlujCsaw8JXky+XOEnR5Sze+0NX6gB9xBd1ImD69wc=; 
 b=QztjuIkxQ+vcm9bl0gledOSkKyuDUK/Q1oD3jKYmAXCHh+AG+57kLcO6nDKNg16RKNt0Dv04QHvF5jzANIxx6z1jflYzervjhYko4Gl3qXXEvW3qlR8dpYu+7shPVj2uElYZeFJDEAFk4mhMJ6I0ANzW1bCmHcvD0UUHW7aQfNg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755189694; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=AwlujCsaw8JXky+XOEnR5Sze+0NX6gB9xBd1ImD69wc=;
 b=fCW8G+nNHHF9yikS2mp/9LCxUozS2xPJPLd+QFK+1CAu1C4LTGcpX0XbeqC8yLsV
 bI/0PUMiq1UpygIuJy2XsaUCBWwOuhNmU40Y7DNgmaw409yvLSNTVJ2VaO+sR72JQcx
 F4TjYwgULnZLhqb/BgpME4gat07t5Wqq3Pg3ge8hdyyL9NRb9o4okdBRxHtRvdy3Ilh
 YtkfSqmLGQbXtDiVGC+kX7rKBASL/kOYP8kVdyRmAhhdS7CLnnHSaLvJ7qX0nn0GAqt
 5MNEcwQL4rPpDHikfN+x/r5zGAnYJD3QcBM0SC35octLEmiUEpaR9u1EHKCyGvXOXGc
 KI1MFPVgXA==
Received: by mx.zohomail.com with SMTPS id 1755189691631781.4424820957234;
 Thu, 14 Aug 2025 09:41:31 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Icenowy Zheng <uwu@icenowy.me>
Subject: [RFC PATCH 1/8] dt-bindings: vendor-prefixes: add verisilicon
Date: Fri, 15 Aug 2025 00:40:41 +0800
Message-ID: <20250814164048.2336043-2-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814164048.2336043-1-uwu@icenowy.me>
References: <20250814164048.2336043-1-uwu@icenowy.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

VeriSilicon is a Silicon IP vendor, which is the current owner of
Vivante series video-related IPs and Hantro series video codec IPs.

Add a vendor prefix for this company.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 77160cd47f540..215c6b71b9717 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1654,6 +1654,8 @@ patternProperties:
     description: Variscite Ltd.
   "^vdl,.*":
     description: Van der Laan b.v.
+  "^verisilicon,.*":
+    description: VeriSilicon Microelectronics (Shanghai) Co., Ltd.
   "^vertexcom,.*":
     description: Vertexcom Technologies, Inc.
   "^via,.*":
-- 
2.50.1

