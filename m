Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 299C41C69B1
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 09:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4326E820;
	Wed,  6 May 2020 07:02:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92CF06E10F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 07:46:58 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 0C4A467DFD34D00D0C71;
 Tue,  5 May 2020 15:46:54 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Tue, 5 May 2020
 15:46:46 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <michael.chan@broadcom.com>, <davem@davemloft.net>, <ast@kernel.org>,
 <daniel@iogearbox.net>, <kuba@kernel.org>, <hawk@kernel.org>,
 <john.fastabend@gmail.com>, <sumit.semwal@linaro.org>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH net-next] net: bnxt: Remove Comparison to bool in
 bnxt_ethtool.c
Date: Tue, 5 May 2020 15:46:08 +0800
Message-ID: <20200505074608.22432-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 06 May 2020 07:02:40 +0000
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
Cc: Jason Yan <yanaijie@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following coccicheck warning:

drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c:1991:5-46: WARNING:
Comparison to bool
drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c:1993:10-54: WARNING:
Comparison to bool
drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c:2380:5-38: WARNING:
Comparison to bool

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c b/drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c
index 34046a6286e8..75f60aea8dec 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c
@@ -1988,9 +1988,9 @@ static int bnxt_flash_firmware_from_file(struct net_device *dev,
 			   rc, filename);
 		return rc;
 	}
-	if (bnxt_dir_type_is_ape_bin_format(dir_type) == true)
+	if (bnxt_dir_type_is_ape_bin_format(dir_type))
 		rc = bnxt_flash_firmware(dev, dir_type, fw->data, fw->size);
-	else if (bnxt_dir_type_is_other_exec_format(dir_type) == true)
+	else if (bnxt_dir_type_is_other_exec_format(dir_type))
 		rc = bnxt_flash_microcode(dev, dir_type, fw->data, fw->size);
 	else
 		rc = bnxt_flash_nvram(dev, dir_type, BNX_DIR_ORDINAL_FIRST,
@@ -2377,7 +2377,7 @@ static int bnxt_set_eeprom(struct net_device *dev,
 	}
 
 	/* Create or re-write an NVM item: */
-	if (bnxt_dir_type_is_executable(type) == true)
+	if (bnxt_dir_type_is_executable(type))
 		return -EOPNOTSUPP;
 	ext = eeprom->magic & 0xffff;
 	ordinal = eeprom->offset >> 16;
-- 
2.21.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
