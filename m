Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0671B93C390
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 16:05:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54FB910E818;
	Thu, 25 Jul 2024 14:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QjxLC0P6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DA210E810;
 Thu, 25 Jul 2024 14:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721916349; x=1753452349;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=czB05BS6HT4dbgmuzTPUCyCXBiBfJbeYHzptJ2vMm3M=;
 b=QjxLC0P6mWUacLFm0Lr6kASr0OPR1zCWL+9ZRstma/osGMY2rGN6lcD7
 mb7v7kJLafB0FT8BltOk3xgwIds0+9Lbe61qm+oDERfu3q+0OhVA2OOGf
 IrptJvBNBYK7Y96yofau6Ey7nWwTQOtSiaw3BLu7JnXs5+06OyezGkt91
 70gxGZ6BtZmftstde0bBPJnTEQDnEwkhf94iYTMnKlXvejJ4SnciapZLt
 u7sfr+nnJwyMSlDcdxAryg4pUxWhCQ+33r+dMH1JcA5yA1D+6Z67JtRZN
 JlqV15VA9NE+Kd6Z2eD/BUuFGpeK7XB/9Dwhy9qQw3K5Jx4YnGDvsi8np A==;
X-CSE-ConnectionGUID: jelsctnESIizvdRP71GF3w==
X-CSE-MsgGUID: V4mZGlG7TUysS9eDxSczlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19504834"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="19504834"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 07:05:48 -0700
X-CSE-ConnectionGUID: ogA/3wwoTk+PwhcmRK7zbQ==
X-CSE-MsgGUID: 1p3D7sPcQq+3cniM0KbWYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="53007762"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 07:05:41 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Mark Brown <broonie@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Tomas Winkler <tomas.winkler@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 05/12] spi: intel-dg: implement mtd access handlers
Date: Thu, 25 Jul 2024 16:56:50 +0300
Message-Id: <20240725135657.1061836-6-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240725135657.1061836-1-alexander.usyskin@intel.com>
References: <20240725135657.1061836-1-alexander.usyskin@intel.com>
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

From: Tomas Winkler <tomas.winkler@intel.com>

Implement mtd read, erase, and write handlers.
For erase operation address and size should be 4K aligned.
For write operation address and size has to be 4bytes aligned.

CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
Signed-off-by: Vitaly Lubart <vitaly.lubart@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/spi/spi-intel-dg.c | 152 +++++++++++++++++++++++++++++++++++--
 1 file changed, 147 insertions(+), 5 deletions(-)

diff --git a/drivers/spi/spi-intel-dg.c b/drivers/spi/spi-intel-dg.c
index 2ffc2d61fdc8..dc4d6c573522 100644
--- a/drivers/spi/spi-intel-dg.c
+++ b/drivers/spi/spi-intel-dg.c
@@ -174,7 +174,6 @@ static int intel_dg_spi_is_valid(struct intel_dg_spi *spi)
 	return 0;
 }
 
-__maybe_unused
 static unsigned int spi_get_region(const struct intel_dg_spi *spi, loff_t from)
 {
 	unsigned int i;
@@ -206,7 +205,6 @@ static ssize_t spi_rewrite_partial(struct intel_dg_spi *spi, loff_t to,
 	return len;
 }
 
-__maybe_unused
 static ssize_t spi_write(struct intel_dg_spi *spi, u8 region,
 			 loff_t to, size_t len, const unsigned char *buf)
 {
@@ -265,7 +263,6 @@ static ssize_t spi_write(struct intel_dg_spi *spi, u8 region,
 	return len;
 }
 
-__maybe_unused
 static ssize_t spi_read(struct intel_dg_spi *spi, u8 region,
 			loff_t from, size_t len, unsigned char *buf)
 {
@@ -324,7 +321,6 @@ static ssize_t spi_read(struct intel_dg_spi *spi, u8 region,
 	return len;
 }
 
-__maybe_unused
 static ssize_t
 spi_erase(struct intel_dg_spi *spi, u8 region, loff_t from, u64 len, u64 *fail_addr)
 {
@@ -413,18 +409,164 @@ static int intel_dg_spi_init(struct intel_dg_spi *spi, struct device *device)
 
 static int intel_dg_spi_erase(struct mtd_info *mtd, struct erase_info *info)
 {
-	return 0;
+	struct intel_dg_spi *spi;
+	unsigned int idx;
+	u8 region;
+	u64 addr;
+	ssize_t bytes;
+	loff_t from;
+	size_t len;
+	size_t total_len;
+	int ret = 0;
+
+	if (!mtd || !info)
+		return -EINVAL;
+
+	spi = mtd->priv;
+	if (WARN_ON(!spi))
+		return -EINVAL;
+
+	if (!IS_ALIGNED(info->addr, SZ_4K) || !IS_ALIGNED(info->len, SZ_4K)) {
+		dev_err(&mtd->dev, "unaligned erase %llx %llx\n",
+			info->addr, info->len);
+		info->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
+		return -EINVAL;
+	}
+
+	total_len = info->len;
+	addr = info->addr;
+
+	mutex_lock(&spi->lock);
+
+	while (total_len > 0) {
+		if (!IS_ALIGNED(addr, SZ_4K) || !IS_ALIGNED(total_len, SZ_4K)) {
+			dev_err(&mtd->dev, "unaligned erase %llx %zx\n", addr, total_len);
+			info->fail_addr = addr;
+			ret = -ERANGE;
+			goto out;
+		}
+
+		idx = spi_get_region(spi, addr);
+		if (idx >= spi->nregions) {
+			dev_err(&mtd->dev, "out of range");
+			info->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
+			ret = -ERANGE;
+			goto out;
+		}
+
+		from = addr - spi->regions[idx].offset;
+		region = spi->regions[idx].id;
+		len = total_len;
+		if (len > spi->regions[idx].size - from)
+			len = spi->regions[idx].size - from;
+
+		dev_dbg(&mtd->dev, "erasing region[%d] %s from %llx len %zx\n",
+			region, spi->regions[idx].name, from, len);
+
+		bytes = spi_erase(spi, region, from, len, &info->fail_addr);
+		if (bytes < 0) {
+			dev_dbg(&mtd->dev, "erase failed with %zd\n", bytes);
+			info->fail_addr += spi->regions[idx].offset;
+			ret = bytes;
+			goto out;
+		}
+
+		addr += len;
+		total_len -= len;
+	}
+
+out:
+	mutex_unlock(&spi->lock);
+	return ret;
 }
 
 static int intel_dg_spi_read(struct mtd_info *mtd, loff_t from, size_t len,
 			     size_t *retlen, u_char *buf)
 {
+	struct intel_dg_spi *spi;
+	ssize_t ret;
+	unsigned int idx;
+	u8 region;
+
+	if (!mtd)
+		return -EINVAL;
+
+	spi = mtd->priv;
+	if (WARN_ON(!spi))
+		return -EINVAL;
+
+	idx = spi_get_region(spi, from);
+
+	dev_dbg(&mtd->dev, "reading region[%d] %s from %lld len %zd\n",
+		spi->regions[idx].id, spi->regions[idx].name, from, len);
+
+	if (idx >= spi->nregions) {
+		dev_err(&mtd->dev, "out of ragnge");
+		return -ERANGE;
+	}
+
+	from -= spi->regions[idx].offset;
+	region = spi->regions[idx].id;
+	if (len > spi->regions[idx].size - from)
+		len = spi->regions[idx].size - from;
+
+	mutex_lock(&spi->lock);
+
+	ret = spi_read(spi, region, from, len, buf);
+	if (ret < 0) {
+		dev_dbg(&mtd->dev, "read failed with %zd\n", ret);
+		mutex_unlock(&spi->lock);
+		return ret;
+	}
+
+	*retlen = ret;
+
+	mutex_unlock(&spi->lock);
 	return 0;
 }
 
 static int intel_dg_spi_write(struct mtd_info *mtd, loff_t to, size_t len,
 			      size_t *retlen, const u_char *buf)
 {
+	struct intel_dg_spi *spi;
+	ssize_t ret;
+	unsigned int idx;
+	u8 region;
+
+	if (!mtd)
+		return -EINVAL;
+
+	spi = mtd->priv;
+	if (WARN_ON(!spi))
+		return -EINVAL;
+
+	idx = spi_get_region(spi, to);
+
+	dev_dbg(&mtd->dev, "writing region[%d] %s to %lld len %zd\n",
+		spi->regions[idx].id, spi->regions[idx].name, to, len);
+
+	if (idx >= spi->nregions) {
+		dev_err(&mtd->dev, "out of range");
+		return -ERANGE;
+	}
+
+	to -= spi->regions[idx].offset;
+	region = spi->regions[idx].id;
+	if (len > spi->regions[idx].size - to)
+		len = spi->regions[idx].size - to;
+
+	mutex_lock(&spi->lock);
+
+	ret = spi_write(spi, region, to, len, buf);
+	if (ret < 0) {
+		dev_dbg(&mtd->dev, "write failed with %zd\n", ret);
+		mutex_unlock(&spi->lock);
+		return ret;
+	}
+
+	*retlen = ret;
+
+	mutex_unlock(&spi->lock);
 	return 0;
 }
 
-- 
2.34.1

