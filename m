Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0A86F01E8
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 09:38:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA2D10EABD;
	Thu, 27 Apr 2023 07:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 375 seconds by postgrey-1.36 at gabe;
 Wed, 26 Apr 2023 07:36:07 UTC
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E327D10E2E1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 07:36:07 +0000 (UTC)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
 by mx.sberdevices.ru (Postfix) with ESMTP id 586EF5FD6E;
 Wed, 26 Apr 2023 10:29:49 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
 s=mail; t=1682494189;
 bh=dHg7xkBb0HnprALeBYDMhRRSgdMSlw6mHB6uPNDkV88=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=Msu/wEcbvYUHe8F7DZlH1U9d7kSCIGKdKqtabrjPgcowqH3dmFdHNEKyHPCcxo55i
 ps5J1CqZhwpGN+txNgtF7qxGSKb25ZJvYcBZMvjIPedilZaNk5IRwtYg3hiBHfRhNL
 SRLvoM7ENjJHRkQS+vHcb9anIr2TLRi/Vs4MEzESPK1GiKep7nBTeHJJBvAyKSup3v
 Y2T76DXCjkpBGw8F7qBnMPeaVSylFev9aF/Kt0F+avTAwHTQvdh+kDoplSWozOEVte
 PIrZpJaCSvOEdH4hrWjTIaozJJClqGlFOxT8vdd9+KHbDkhSXXa6wK1y4TrgAwPRxD
 rzaxeHPagOvqw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru
 [172.16.1.4]) by mx.sberdevices.ru (Postfix) with ESMTP;
 Wed, 26 Apr 2023 10:29:47 +0300 (MSK)
From: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Subject: [PATCH v1] mtd: rawnand: macronix: OTP access for MX30LFxG18AC
Date: Wed, 26 Apr 2023 10:24:52 +0300
Message-ID: <20230426072455.3887717-1-AVKrasnov@sberdevices.ru>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2023/04/26 04:45:00 #21166225
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Approved-At: Thu, 27 Apr 2023 07:38:49 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-mtd@lists.infradead.org,
 oxffffaa@gmail.com, kernel@sberdevices.ru, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds support for OTP area access on MX30LFxG18AC chip series.

Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
---
 drivers/mtd/nand/raw/nand_macronix.c | 212 +++++++++++++++++++++++++++
 1 file changed, 212 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index 1472f925f386..c0d12979933a 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -31,6 +31,20 @@
 
 #define MXIC_CMD_POWER_DOWN 0xB9
 
+#define ONFI_FEATURE_ADDR_30LFXG18AC_OTP	0x90
+#define MACRONIX_30LFXG18AC_OTP_START_PAGE	0
+#define MACRONIX_30LFXG18AC_OTP_PAGES		30
+#define MACRONIX_30LFXG18AC_OTP_PAGE_SIZE	2112
+#define MACRONIX_30LFXG18AC_OTP_START_BYTE	\
+	(MACRONIX_30LFXG18AC_OTP_START_PAGE *	\
+	 MACRONIX_30LFXG18AC_OTP_PAGE_SIZE)
+#define MACRONIX_30LFXG18AC_OTP_SIZE_BYTES	\
+	(MACRONIX_30LFXG18AC_OTP_PAGES *	\
+	 MACRONIX_30LFXG18AC_OTP_PAGE_SIZE)
+
+#define MACRONIX_30LFXG18AC_OTP_EN		BIT(0)
+#define MACRONIX_30LFXG18AC_OTP_LOCKED		BIT(1)
+
 struct nand_onfi_vendor_macronix {
 	u8 reserved;
 	u8 reliability_func;
@@ -316,6 +330,203 @@ static void macronix_nand_deep_power_down_support(struct nand_chip *chip)
 	chip->ops.resume = mxic_nand_resume;
 }
 
+static int macronix_30lfxg18ac_get_otp_info(struct mtd_info *mtd, size_t len,
+					    size_t *retlen,
+					    struct otp_info *buf)
+{
+	if (len < sizeof(*buf))
+		return -EINVAL;
+
+	/* Don't know how to check that OTP is locked. */
+	buf->locked = 0;
+	buf->start = MACRONIX_30LFXG18AC_OTP_START_BYTE;
+	buf->length = MACRONIX_30LFXG18AC_OTP_SIZE_BYTES;
+
+	*retlen = sizeof(*buf);
+
+	return 0;
+}
+
+static int macronix_30lfxg18ac_otp_enable(struct nand_chip *nand)
+{
+	uint8_t feature_buf[ONFI_SUBFEATURE_PARAM_LEN] = { 0 };
+
+	feature_buf[0] = MACRONIX_30LFXG18AC_OTP_EN;
+	return nand_set_features(nand, ONFI_FEATURE_ADDR_30LFXG18AC_OTP,
+				 feature_buf);
+}
+
+static int macronix_30lfxg18ac_otp_disable(struct nand_chip *nand)
+{
+	uint8_t feature_buf[ONFI_SUBFEATURE_PARAM_LEN] = { 0 };
+
+	return nand_set_features(nand, ONFI_FEATURE_ADDR_30LFXG18AC_OTP,
+				 feature_buf);
+}
+
+static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
+					loff_t offs_in_flash,
+					size_t len, size_t *retlen,
+					u_char *buf, bool write)
+{
+	struct nand_chip *nand;
+	size_t bytes_handled;
+	unsigned long page;
+	off_t offs_in_page;
+	void *dma_buf;
+	int ret;
+
+	/* 'nand_prog/read_page_op()' may use 'buf' as DMA buffer,
+	 * so allocate properly aligned memory for it. This is
+	 * needed because cross page accesses may lead to unaligned
+	 * buffer address for DMA.
+	 */
+	dma_buf = kmalloc(MACRONIX_30LFXG18AC_OTP_PAGE_SIZE, GFP_KERNEL);
+	if (!dma_buf)
+		return -ENOMEM;
+
+	nand = mtd_to_nand(mtd);
+	nand_select_target(nand, 0);
+
+	ret = macronix_30lfxg18ac_otp_enable(nand);
+	if (ret)
+		goto out_otp;
+
+	page = offs_in_flash;
+	/* 'page' will be result of division. */
+	offs_in_page = do_div(page, MACRONIX_30LFXG18AC_OTP_PAGE_SIZE);
+	bytes_handled = 0;
+
+	while (bytes_handled < len &&
+	       page < MACRONIX_30LFXG18AC_OTP_PAGES) {
+		size_t bytes_to_handle;
+
+		bytes_to_handle = min_t(size_t, len - bytes_handled,
+					MACRONIX_30LFXG18AC_OTP_PAGE_SIZE -
+					offs_in_page);
+
+		if (write) {
+			memcpy(dma_buf, &buf[bytes_handled], bytes_to_handle);
+			ret = nand_prog_page_op(nand, page, offs_in_page,
+						dma_buf, bytes_to_handle);
+		} else {
+			ret = nand_read_page_op(nand, page, offs_in_page,
+						dma_buf, bytes_to_handle);
+			if (!ret)
+				memcpy(&buf[bytes_handled], dma_buf,
+				       bytes_to_handle);
+		}
+		if (ret)
+			goto out_otp;
+
+		bytes_handled += bytes_to_handle;
+		offs_in_page = 0;
+		page++;
+	}
+
+	*retlen = bytes_handled;
+
+out_otp:
+	if (ret)
+		dev_err(&mtd->dev, "failed to perform OTP IO: %i\n", ret);
+
+	ret = macronix_30lfxg18ac_otp_disable(nand);
+	WARN(ret, "failed to leave OTP mode after %s\n",
+	     write ? "write" : "read");
+	nand_deselect_target(nand);
+	kfree(dma_buf);
+
+	return ret;
+}
+
+static int macronix_30lfxg18ac_write_otp(struct mtd_info *mtd, loff_t to,
+					 size_t len, size_t *rlen,
+					 const u_char *buf)
+{
+	return __macronix_30lfxg18ac_rw_otp(mtd, to, len, rlen, (u_char *)buf,
+					    true);
+}
+
+static int macronix_30lfxg18ac_read_otp(struct mtd_info *mtd, loff_t from,
+					size_t len, size_t *rlen,
+					u_char *buf)
+{
+	return __macronix_30lfxg18ac_rw_otp(mtd, from, len, rlen, buf, false);
+}
+
+static int macronix_30lfxg18ac_lock_otp(struct mtd_info *mtd, loff_t from,
+					size_t len)
+{
+	uint8_t feature_buf[ONFI_SUBFEATURE_PARAM_LEN] = { 0 };
+	struct nand_chip *nand;
+	int ret;
+
+	if (from != MACRONIX_30LFXG18AC_OTP_START_BYTE ||
+	    len != MACRONIX_30LFXG18AC_OTP_SIZE_BYTES)
+		return -EINVAL;
+
+	dev_dbg(&mtd->dev, "locking OTP\n");
+
+	nand = mtd_to_nand(mtd);
+	nand_select_target(nand, 0);
+
+	feature_buf[0] = MACRONIX_30LFXG18AC_OTP_EN |
+			 MACRONIX_30LFXG18AC_OTP_LOCKED;
+	ret = nand_set_features(nand, ONFI_FEATURE_ADDR_30LFXG18AC_OTP,
+				feature_buf);
+	if (ret) {
+		dev_err(&mtd->dev,
+			"failed to lock OTP (set features): %i\n", ret);
+		nand_deselect_target(nand);
+		return ret;
+	}
+
+	/* Do dummy page prog with zero address. */
+	feature_buf[0] = 0;
+	ret = nand_prog_page_op(nand, 0, 0, feature_buf, 1);
+	if (ret)
+		dev_err(&mtd->dev,
+			"failed to lock OTP (page prog): %i\n", ret);
+
+	ret = macronix_30lfxg18ac_otp_disable(nand);
+	WARN(ret, "failed to leave OTP mode after lock\n");
+
+	nand_deselect_target(nand);
+
+	return ret;
+}
+
+static void macronix_nand_setup_otp(struct nand_chip *chip)
+{
+	static const char * const supported_otp_models[] = {
+		"MX30LF1G18AC",
+		"MX30LF2G18AC",
+		"MX30LF4G18AC",
+	};
+	struct mtd_info *mtd;
+
+	if (!chip->parameters.supports_set_get_features)
+		return;
+
+	if (match_string(supported_otp_models,
+			 ARRAY_SIZE(supported_otp_models),
+			 chip->parameters.model) < 0)
+		return;
+
+	bitmap_set(chip->parameters.get_feature_list,
+		   ONFI_FEATURE_ADDR_30LFXG18AC_OTP, 1);
+	bitmap_set(chip->parameters.set_feature_list,
+		   ONFI_FEATURE_ADDR_30LFXG18AC_OTP, 1);
+
+	mtd = nand_to_mtd(chip);
+	mtd->_get_fact_prot_info = macronix_30lfxg18ac_get_otp_info;
+	mtd->_read_fact_prot_reg = macronix_30lfxg18ac_read_otp;
+	mtd->_get_user_prot_info = macronix_30lfxg18ac_get_otp_info;
+	mtd->_read_user_prot_reg = macronix_30lfxg18ac_read_otp;
+	mtd->_write_user_prot_reg = macronix_30lfxg18ac_write_otp;
+	mtd->_lock_user_prot_reg = macronix_30lfxg18ac_lock_otp;
+}
+
 static int macronix_nand_init(struct nand_chip *chip)
 {
 	if (nand_is_slc(chip))
@@ -325,6 +536,7 @@ static int macronix_nand_init(struct nand_chip *chip)
 	macronix_nand_onfi_init(chip);
 	macronix_nand_block_protection_support(chip);
 	macronix_nand_deep_power_down_support(chip);
+	macronix_nand_setup_otp(chip);
 
 	return 0;
 }
-- 
2.35.0

