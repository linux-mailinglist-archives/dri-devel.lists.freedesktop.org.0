Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 527245159EB
	for <lists+dri-devel@lfdr.de>; Sat, 30 Apr 2022 04:52:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C31110E232;
	Sat, 30 Apr 2022 02:52:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6318F10E232
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Apr 2022 02:52:15 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C6FF283F04;
 Sat, 30 Apr 2022 04:52:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1651287134;
 bh=tl4A5gPB/I5i4tBUFIUH4jRYqzdu1/YjNfWorswf3W0=;
 h=From:To:Cc:Subject:Date:From;
 b=e5GFUlJs+NUHv2rn/IQcyQZLdSs/yAMTqQSNcaOgXIa3aMwxFhSnU1We+CxN8JIZH
 FdhF+MA+hWA5a5BRZSnZ4KHZVg/bV7smc8ep/FDWByqBempagBSjA4ujmYnXAXXQoJ
 q3KEXFGFAilvOWgsNKPMPfV5jCTndx/H5qA9zRhLfZbL9bEZ/yJ31bpn7f3SlJQ+sA
 d8YMgI7BB1PGqWPHHNc3xZbfYVmPHUBVeNkhe5Mx1tKci6XUF0ceNIUVY7j9KyLn3Y
 3ljzNMSeygXpN3X+L49gqItnyWxpglAGkXrE+tCEnUss9zwVoIbIkZd7x2/OrxM8wi
 7808LkGkyeIIA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] [RFC] regmap: Add bulk read/write callbacks into
 regmap_config
Date: Sat, 30 Apr 2022 04:51:44 +0200
Message-Id: <20220430025145.640305-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, robert.foss@linaro.org,
 Mark Brown <broonie@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently the regmap_config structure only allows the user to implement
single element register read/write using .reg_read/.reg_write callbacks.
The regmap_bus already implements bulk counterparts of both, and is being
misused as a workaround for the missing bulk read/write callbacks in
regmap_config by a couple of drivers. To stop this misuse, add the bulk
read/write callbacks to regmap_config and call them from the regmap core
code.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org
---
 drivers/base/regmap/internal.h |  4 ++
 drivers/base/regmap/regmap.c   | 76 ++++++++++++++++++----------------
 include/linux/regmap.h         | 12 ++++++
 3 files changed, 56 insertions(+), 36 deletions(-)

diff --git a/drivers/base/regmap/internal.h b/drivers/base/regmap/internal.h
index b4df36c7b17d..da8996e7a1f1 100644
--- a/drivers/base/regmap/internal.h
+++ b/drivers/base/regmap/internal.h
@@ -110,6 +110,10 @@ struct regmap {
 	int (*reg_write)(void *context, unsigned int reg, unsigned int val);
 	int (*reg_update_bits)(void *context, unsigned int reg,
 			       unsigned int mask, unsigned int val);
+	/* Bulk read/write */
+	int (*read)(void *context, const void *reg_buf, size_t reg_size,
+		    void *val_buf, size_t val_size);
+	int (*write)(void *context, const void *data, size_t count);
 
 	bool defer_caching;
 
diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 5e12f7cb5147..879a87a6461b 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -838,12 +838,15 @@ struct regmap *__regmap_init(struct device *dev,
 		map->reg_stride_order = ilog2(map->reg_stride);
 	else
 		map->reg_stride_order = -1;
-	map->use_single_read = config->use_single_read || !bus || !bus->read;
-	map->use_single_write = config->use_single_write || !bus || !bus->write;
-	map->can_multi_write = config->can_multi_write && bus && bus->write;
+	map->use_single_read = config->use_single_read || !(config->read || (bus && bus->read));
+	map->use_single_write = config->use_single_write || !(config->write || (bus && bus->write));
+	map->can_multi_write = config->can_multi_write && (config->write || (bus && bus->write));
 	if (bus) {
 		map->max_raw_read = bus->max_raw_read;
 		map->max_raw_write = bus->max_raw_write;
+	} else if (config->max_raw_read && config->max_raw_write) {
+		map->max_raw_read = config->max_raw_read;
+		map->max_raw_write = config->max_raw_write;
 	}
 	map->dev = dev;
 	map->bus = bus;
@@ -877,7 +880,16 @@ struct regmap *__regmap_init(struct device *dev,
 		map->read_flag_mask = bus->read_flag_mask;
 	}
 
-	if (!bus) {
+	if (config && config->read && config->write) {
+		map->reg_read  = _regmap_bus_read;
+
+		/* Bulk read/write */
+		map->read = config->read;
+		map->write = config->write;
+
+		reg_endian = REGMAP_ENDIAN_NATIVE;
+		val_endian = REGMAP_ENDIAN_NATIVE;
+	} else if (!bus) {
 		map->reg_read  = config->reg_read;
 		map->reg_write = config->reg_write;
 		map->reg_update_bits = config->reg_update_bits;
@@ -894,10 +906,13 @@ struct regmap *__regmap_init(struct device *dev,
 	} else {
 		map->reg_read  = _regmap_bus_read;
 		map->reg_update_bits = bus->reg_update_bits;
-	}
+		/* Bulk read/write */
+		map->read = bus->read;
+		map->write = bus->write;
 
-	reg_endian = regmap_get_reg_endian(bus, config);
-	val_endian = regmap_get_val_endian(dev, bus, config);
+		reg_endian = regmap_get_reg_endian(bus, config);
+		val_endian = regmap_get_val_endian(dev, bus, config);
+	}
 
 	switch (config->reg_bits + map->reg_shift) {
 	case 2:
@@ -1671,8 +1686,6 @@ static int _regmap_raw_write_impl(struct regmap *map, unsigned int reg,
 	size_t len;
 	int i;
 
-	WARN_ON(!map->bus);
-
 	/* Check for unwritable or noinc registers in range
 	 * before we start
 	 */
@@ -1754,7 +1767,7 @@ static int _regmap_raw_write_impl(struct regmap *map, unsigned int reg,
 		val = work_val;
 	}
 
-	if (map->async && map->bus->async_write) {
+	if (map->async && map->bus && map->bus->async_write) {
 		struct regmap_async *async;
 
 		trace_regmap_async_write_start(map, reg, val_len);
@@ -1822,10 +1835,10 @@ static int _regmap_raw_write_impl(struct regmap *map, unsigned int reg,
 	 * write.
 	 */
 	if (val == work_val)
-		ret = map->bus->write(map->bus_context, map->work_buf,
-				      map->format.reg_bytes +
-				      map->format.pad_bytes +
-				      val_len);
+		ret = map->write(map->bus_context, map->work_buf,
+				 map->format.reg_bytes +
+				 map->format.pad_bytes +
+				 val_len);
 	else if (map->bus->gather_write)
 		ret = map->bus->gather_write(map->bus_context, map->work_buf,
 					     map->format.reg_bytes +
@@ -1844,7 +1857,7 @@ static int _regmap_raw_write_impl(struct regmap *map, unsigned int reg,
 		memcpy(buf, map->work_buf, map->format.reg_bytes);
 		memcpy(buf + map->format.reg_bytes + map->format.pad_bytes,
 		       val, val_len);
-		ret = map->bus->write(map->bus_context, buf, len);
+		ret = map->write(map->bus_context, buf, len);
 
 		kfree(buf);
 	} else if (ret != 0 && !map->cache_bypass && map->format.parse_val) {
@@ -1901,7 +1914,7 @@ static int _regmap_bus_formatted_write(void *context, unsigned int reg,
 	struct regmap_range_node *range;
 	struct regmap *map = context;
 
-	WARN_ON(!map->bus || !map->format.format_write);
+	WARN_ON(!map->format.format_write);
 
 	range = _regmap_range_lookup(map, reg);
 	if (range) {
@@ -1916,8 +1929,7 @@ static int _regmap_bus_formatted_write(void *context, unsigned int reg,
 
 	trace_regmap_hw_write_start(map, reg, 1);
 
-	ret = map->bus->write(map->bus_context, map->work_buf,
-			      map->format.buf_size);
+	ret = map->write(map->bus_context, map->work_buf, map->format.buf_size);
 
 	trace_regmap_hw_write_done(map, reg, 1);
 
@@ -1937,7 +1949,7 @@ static int _regmap_bus_raw_write(void *context, unsigned int reg,
 {
 	struct regmap *map = context;
 
-	WARN_ON(!map->bus || !map->format.format_val);
+	WARN_ON(!map->format.format_val);
 
 	map->format.format_val(map->work_buf + map->format.reg_bytes
 			       + map->format.pad_bytes, val, 0);
@@ -1951,7 +1963,7 @@ static int _regmap_bus_raw_write(void *context, unsigned int reg,
 
 static inline void *_regmap_map_get_context(struct regmap *map)
 {
-	return (map->bus) ? map : map->bus_context;
+	return (map->bus || (!map->bus && map->read)) ? map : map->bus_context;
 }
 
 int _regmap_write(struct regmap *map, unsigned int reg,
@@ -2363,7 +2375,7 @@ static int _regmap_raw_multi_reg_write(struct regmap *map,
 	u8 = buf;
 	*u8 |= map->write_flag_mask;
 
-	ret = map->bus->write(map->bus_context, buf, len);
+	ret = map->write(map->bus_context, buf, len);
 
 	kfree(buf);
 
@@ -2669,9 +2681,7 @@ static int _regmap_raw_read(struct regmap *map, unsigned int reg, void *val,
 	struct regmap_range_node *range;
 	int ret;
 
-	WARN_ON(!map->bus);
-
-	if (!map->bus || !map->bus->read)
+	if (!map->read)
 		return -EINVAL;
 
 	range = _regmap_range_lookup(map, reg);
@@ -2689,9 +2699,9 @@ static int _regmap_raw_read(struct regmap *map, unsigned int reg, void *val,
 				      map->read_flag_mask);
 	trace_regmap_hw_read_start(map, reg, val_len / map->format.val_bytes);
 
-	ret = map->bus->read(map->bus_context, map->work_buf,
-			     map->format.reg_bytes + map->format.pad_bytes,
-			     val, val_len);
+	ret = map->read(map->bus_context, map->work_buf,
+			map->format.reg_bytes + map->format.pad_bytes,
+			val, val_len);
 
 	trace_regmap_hw_read_done(map, reg, val_len / map->format.val_bytes);
 
@@ -2802,8 +2812,6 @@ int regmap_raw_read(struct regmap *map, unsigned int reg, void *val,
 	unsigned int v;
 	int ret, i;
 
-	if (!map->bus)
-		return -EINVAL;
 	if (val_len % map->format.val_bytes)
 		return -EINVAL;
 	if (!IS_ALIGNED(reg, map->reg_stride))
@@ -2818,7 +2826,7 @@ int regmap_raw_read(struct regmap *map, unsigned int reg, void *val,
 		size_t chunk_count, chunk_bytes;
 		size_t chunk_regs = val_count;
 
-		if (!map->bus->read) {
+		if (!map->read) {
 			ret = -ENOTSUPP;
 			goto out;
 		}
@@ -2878,7 +2886,7 @@ EXPORT_SYMBOL_GPL(regmap_raw_read);
  * @val: Pointer to data buffer
  * @val_len: Length of output buffer in bytes.
  *
- * The regmap API usually assumes that bulk bus read operations will read a
+ * The regmap API usually assumes that bulk read operations will read a
  * range of registers. Some devices have certain registers for which a read
  * operation read will read from an internal FIFO.
  *
@@ -2896,10 +2904,6 @@ int regmap_noinc_read(struct regmap *map, unsigned int reg,
 	size_t read_len;
 	int ret;
 
-	if (!map->bus)
-		return -EINVAL;
-	if (!map->bus->read)
-		return -ENOTSUPP;
 	if (val_len % map->format.val_bytes)
 		return -EINVAL;
 	if (!IS_ALIGNED(reg, map->reg_stride))
@@ -3013,7 +3017,7 @@ int regmap_bulk_read(struct regmap *map, unsigned int reg, void *val,
 	if (val_count == 0)
 		return -EINVAL;
 
-	if (map->bus && map->format.parse_inplace && (vol || map->cache_type == REGCACHE_NONE)) {
+	if (map->format.parse_inplace && (vol || map->cache_type == REGCACHE_NONE)) {
 		ret = regmap_raw_read(map, reg, val, val_bytes * val_count);
 		if (ret != 0)
 			return ret;
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index de81a94d7b30..8952fa3d0d59 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -299,6 +299,12 @@ typedef void (*regmap_unlock)(void *);
  *		     if the function require special handling with lock and reg
  *		     handling and the operation cannot be represented as a simple
  *		     update_bits operation on a bus such as SPI, I2C, etc.
+ * @read: Optional callback that if filled will be used to perform all the
+ *        bulk reads from the registers. Data is returned in the buffer used
+ *        to transmit data.
+ * @write: Same as above for writing.
+ * @max_raw_read: Max raw read size that can be used on the device.
+ * @max_raw_write: Max raw write size that can be used on the device.
  * @fast_io:	  Register IO is fast. Use a spinlock instead of a mutex
  *	     	  to perform locking. This field is ignored if custom lock/unlock
  *	     	  functions are used (see fields lock/unlock of struct regmap_config).
@@ -385,6 +391,12 @@ struct regmap_config {
 	int (*reg_write)(void *context, unsigned int reg, unsigned int val);
 	int (*reg_update_bits)(void *context, unsigned int reg,
 			       unsigned int mask, unsigned int val);
+	/* Bulk read/write */
+	int (*read)(void *context, const void *reg_buf, size_t reg_size,
+		    void *val_buf, size_t val_size);
+	int (*write)(void *context, const void *data, size_t count);
+	size_t max_raw_read;
+	size_t max_raw_write;
 
 	bool fast_io;
 
-- 
2.35.1

