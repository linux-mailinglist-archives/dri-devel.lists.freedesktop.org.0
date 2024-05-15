Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D49F8C67F5
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 15:57:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C97B10E3F8;
	Wed, 15 May 2024 13:57:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Oj3FlSFO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 182AF10E993
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 13:57:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 81F8A614C4;
 Wed, 15 May 2024 13:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4CB9C4AF08;
 Wed, 15 May 2024 13:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715781468;
 bh=8ZuUxwBuqIl5xv9FwD6zxHdkEr4bqeDZSbsEsg2zPmU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Oj3FlSFOr68/qWfihvTAujUUhPEGoUh0a2EeRfwvOp8t6TcAJblJSqUhG15QQTajm
 X0ZypIvahxAHTF82FIRmlU2JmeCiZMwvZg+EGvVdwOy+OSOe2xcXF1JXL/koBjWJ8f
 uY1eH1kzAK3EKpSlqeE4zNl58tmABu/OHRqvET7KDksCSKN7RmxdJnLqrBLyDwRdHT
 tj9PWxBrP/AM1H0vdT+uxhTO2BFPXx2o3XWUE0K/GWe/3iVt7N8oPjgzVElc+MOGeJ
 74zzL/+8OcKcEv9NJp/Th0hDHXFns5PI1R9GkALEM+tDghU+PYNfMeHNgQ21rMnH+z
 MvHx0X9dwRxgQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 May 2024 15:56:57 +0200
Subject: [PATCH 2/8] of: Add helper to retrieve ECC memory bits
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240515-dma-buf-ecc-heap-v1-2-54cbbd049511@kernel.org>
References: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
In-Reply-To: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1585; i=mripard@kernel.org;
 h=from:subject:message-id; bh=8ZuUxwBuqIl5xv9FwD6zxHdkEr4bqeDZSbsEsg2zPmU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGku+/3WZlme0eHdaHF23mbWzIrm86HrbRLD7LyCko8rz
 uJ85re0YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEzkYjpjndaJwD3Xp39eISqZ
 bOWhaGUqfPC+tbxHZce+b2VbV6lc4Ap8mKG7L8Nf/dPlvvmn739RZmw4p9u4J+i/zY7Hpn97nvC
 k2mQ5mV6d/XPaqwcblXumnVxr6J4cufGVjJSY2aW6VRcUq44BAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The /memory device tree bindings allow to store the ECC detection and
correction bits through the ecc-detection-bits and ecc-correction-bits
properties.

Our next patches rely on whether ECC is enabled, so let's add a helper
to retrieve the ECC correction bits from the /memory node.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/linux/of.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index a0bedd038a05..2fbee65a7aa9 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1510,10 +1510,35 @@ static inline int of_get_available_child_count(const struct device_node *np)
 		num++;
 
 	return num;
 }
 
+/**
+ * of_memory_get_ecc_correction_bits() - Returns the number of ECC correction bits
+ *
+ * Search for the number of bits in memory that can be corrected by the
+ * ECC algorithm.
+ *
+ * Returns:
+ * The number of ECC bits, 0 if there's no ECC support, a negative error
+ * code on failure.
+ */
+static inline int of_memory_get_ecc_correction_bits(void)
+{
+	struct device_node *mem;
+	u32 val = 0;
+
+	mem = of_find_node_by_path("/memory");
+	if (!mem)
+		return -ENODEV;
+
+	of_property_read_u32(mem, "ecc-correction-bits", &val);
+	of_node_put(mem);
+
+	return val;
+}
+
 #define _OF_DECLARE_STUB(table, name, compat, fn, fn_type)		\
 	static const struct of_device_id __of_table_##name		\
 		__attribute__((unused))					\
 		 = { .compatible = compat,				\
 		     .data = (fn == (fn_type)NULL) ? fn : fn }

-- 
2.44.0

