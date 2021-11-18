Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FD54557E6
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 10:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520606EC75;
	Thu, 18 Nov 2021 09:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA1C6EC6F
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 09:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1637227214; x=1668763214;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ufYaztoM7btUy9LuPRGwqpeGKIKUMrwofkGEOKopoSs=;
 b=kkAg7vxYDfPi9LE17gU+pF+bWUyMKNa+Qh/dgLlIxUZ6wIu0hqZstFJn
 hK+Pp+mmqC8eTlGxrjGvyghjC6QKLl3GjGNPQ250NpFZipcqPPb5Mww8B
 oNPTYTez4nqPzG9EYbQ5eqwH42NCVWqcQta+UGtB7CJl34WVwElYEyBuV
 UItmMqFIcLi9kotcKWgHx5jxBbRegsjZYJl9BN2jYWWnUnXb8nIV8pyOZ
 vuiyaljfAEHtFJWKM92mMBXATER1VJpa3rYAN7cE+a80dLsbFjMrFpRi0
 hOrCot5nFOgGUYYk8GPPR74Y+WCSqx0iw0hV43iQcw6HJU0RqjjRL903V A==;
X-IronPort-AV: E=Sophos;i="5.87,244,1631570400"; d="scan'208";a="20534722"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 18 Nov 2021 10:20:04 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 18 Nov 2021 10:20:05 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 18 Nov 2021 10:20:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1637227205; x=1668763205;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ufYaztoM7btUy9LuPRGwqpeGKIKUMrwofkGEOKopoSs=;
 b=Wl+eFsIhLEvvwFtAI4I7mL4qDhk7+c4DHRMbPU/FtjW1HSJEHYKwaW4n
 /VjWyKrgxxvFLd3hqaitwARE07pzuuZ9/30tBrL4FasCArYfLSmpl6Irh
 X++9EKyOOI2YyJCZ2yRRApYwhZfcUZhXbvtZ2u3jqsIlejDLTjudfmM56
 k6cWcXmsEtwg/JjR/HcA+E8vE253/qCFcOgdUXfiGuBBpLGgPfpiBy70x
 qrLjkl8iu3gQ7qcUMV8jCogmUTxy/AbP7zL5SH8hyttRjZ1PcZ1oTLb/n
 /CoizWD6cr7KcRrfILS5rCQsVNB4UoZqs8829+DWm/THVbME+eSsCyu+D w==;
X-IronPort-AV: E=Sophos;i="5.87,244,1631570400"; d="scan'208";a="20534709"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 18 Nov 2021 10:20:02 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id DEAB1280075;
 Thu, 18 Nov 2021 10:20:01 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v4 1/4] dt-bindings: display: bridge: sn65dsi83: Make enable
 GPIO optional
Date: Thu, 18 Nov 2021 10:19:52 +0100
Message-Id: <20211118091955.3009900-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211118091955.3009900-1-alexander.stein@ew.tq-group.com>
References: <20211118091955.3009900-1-alexander.stein@ew.tq-group.com>
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The SN65DSI8x EN signal may be tied to VCC, or otherwise controlled by
means not available to the kernel. Make the GPIO optional.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml         | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
index b446d0f0f1b4..c3f3e73f740a 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
@@ -91,7 +91,6 @@ properties:
 required:
   - compatible
   - reg
-  - enable-gpios
   - ports
 
 allOf:
-- 
2.25.1

