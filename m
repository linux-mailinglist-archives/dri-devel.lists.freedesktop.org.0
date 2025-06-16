Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D0EADA8E9
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 09:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 446F910E2C5;
	Mon, 16 Jun 2025 07:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="ZtOO+vnD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id F086F10E2C5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 07:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=QT
 5fsjS9Lz3AShnH5A3u+1b3BD2GU11+T0Ix+o9fY7M=; b=ZtOO+vnDTtbQ65Dw+j
 vZdyXew1FwnVduvbk/67OybXxFzhccJEg5pW98ryT7UwvLQB1OuidCVLChB3qHj3
 v1VheAQBDjX/LLb5SeId3GaC/oEyKLWuEZUVQ7yZXSVbgW4mDYIhnfO2WnJ2XLsK
 yOsbn2Jn8E/QO90ZYEzBy3JHA=
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id
 _____wCXq3hDwk9oF3UMIg--.6743S2; 
 Mon, 16 Jun 2025 15:05:43 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: neil.armstrong@linaro.org
Cc: conor+dt@kernel.org, quic_jesszhan@quicinc.com, krzk+dt@kernel.org,
 robh@kernel.org, sebastian.reichel@collabora.com, tzimmermann@suse.de,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH 1/2] dt-bindings: display: panel: Make reset-gpio as optional
 for Raydium RM67200
Date: Mon, 16 Jun 2025 15:05:16 +0800
Message-ID: <20250616070536.670519-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCXq3hDwk9oF3UMIg--.6743S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jr1xuFWkGrWfuw4DGr1UAwb_yoWDZrg_JF
 Wxu3ZIyws5AF9a9F4qyw4fWr13JwsxCrWkA3Z7XF9rKry8KryUKF97J34Yyr1DCF47ury5
 uF93Wryavws2gjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0bVy7UUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqAJuXmhPvU+hAAADst
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

From: Andy Yan <andy.yan@rock-chips.com>

Although the datasheet of the panel module describes that it has a
reset pin, in the actual hardware design, we often use an RC circuit
to control the reset, and rarely use GPIO to control the reset. This
is the way it is done on our numerous development boards (such as RK3568,
RK3576 EVB).
So make the reset-gpio optional.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 .../devicetree/bindings/display/panel/raydium,rm67200.yaml       | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm67200.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm67200.yaml
index 54c9c0ef45ecc..97b7fbe05c077 100644
--- a/Documentation/devicetree/bindings/display/panel/raydium,rm67200.yaml
+++ b/Documentation/devicetree/bindings/display/panel/raydium,rm67200.yaml
@@ -42,7 +42,6 @@ required:
   - compatible
   - port
   - reg
-  - reset-gpios
 
 additionalProperties: false
 
-- 
2.43.0

