Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DA57724D6
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 15:01:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36CA510E02D;
	Mon,  7 Aug 2023 13:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6884810E02D
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 13:00:44 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20230807130042euoutp01f8f550cf0fdfc9fa253836df434ba130~5G2Hig6RX0107301073euoutp01E
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 13:00:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20230807130042euoutp01f8f550cf0fdfc9fa253836df434ba130~5G2Hig6RX0107301073euoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1691413242;
 bh=RbBgubQsPAS50zzxV357PrWQ/JmyXMU9ivRmmu3kwjk=;
 h=From:To:Cc:Subject:Date:References:From;
 b=a+MGBurvBh6nNgbeeVl8D76wuEPzD6BGcl+WXvZeWhnvLHkkVTmBdzB8Wmf+exA0g
 un6DqyLvXPvRTVIooGbDq2D9+8xpRYpgw1q7A49fHoYu2nHFFC0h3K9b4sE3mICa7/
 7HiGio2yBV4vshefsoBC81M7c+YGkb5HJpWE2UFg=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230807130041eucas1p20cc37c7878709059ce4270004b74d25b~5G2HGvewO1721517215eucas1p2Z;
 Mon,  7 Aug 2023 13:00:41 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id B2.A0.11320.9FAE0D46; Mon,  7
 Aug 2023 14:00:41 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230807130041eucas1p1bf8380490bcf76a34d2c09bfcbdb757b~5G2GvKBTd1350313503eucas1p1D;
 Mon,  7 Aug 2023 13:00:41 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230807130041eusmtrp19bc1f22bac4d68ae07f884a9d9b5a722~5G2GugT8u0044800448eusmtrp1c;
 Mon,  7 Aug 2023 13:00:41 +0000 (GMT)
X-AuditID: cbfec7f4-97dff70000022c38-06-64d0eaf9d6c1
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id DD.69.10549.9FAE0D46; Mon,  7
 Aug 2023 14:00:41 +0100 (BST)
Received: from AMDC4653.eu.corp.samsungelectronics.net (unknown
 [106.120.51.32]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230807130040eusmtip1f4ee0c8601668d15f5dbde3cd7dd18be~5G2F8XFGX0362903629eusmtip1K;
 Mon,  7 Aug 2023 13:00:40 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm: bridge: samsung-dsim: Fix waiting for empty cmd
 transfer FIFO on older Exynos
Date: Mon,  7 Aug 2023 15:00:33 +0200
Message-Id: <20230807130033.1530241-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPKsWRmVeSWpSXmKPExsWy7djP87o/X11IMViyT8vi/uLPLBZXvr5n
 s3h41d9i0v0JLBZfNk1gs3g+fx2jxck3V1ksOicuYbdYe+Quu8WbtkZGi/c7bzFaTJp3k9Xi
 c+s/Ngdej7Uf77N6zG64yOIxb9YJFo+ds+6ye8zumMnqsXjPSyaPTas62TxOTLjE5HHn2h42
 j/vdx5k8+rasYgzgjuKySUnNySxLLdK3S+DKODnlL2PBItGKaZdnsTQw7hPsYuTkkBAwkWg+
 cIWpi5GLQ0hgBaPE/YuXGSGcL4wSdyZ9ZYNwPjNKfFnSwwjTsuv7E6jEckaJFTcOM0M4rUwS
 P3ueM4FUsQkYSnS97WIDsUUElCX+TlwFNpdZ4D6zRMfk22CjhAUyJNpvHgcq4uBgEVCV6Fih
 BhLmFbCX2HHvKjvENnmJ/QfPMkPEBSVOznzCAmIzA8Wbt84GWywh8IND4vfyS1ANLhJTW2az
 QdjCEq+Ob4GKy0icntzDAtHQziix4Pd9JghnAqNEw/NbUM9ZS9w59wvsImYBTYn1u/Qhwo4S
 cy5OZgYJSwjwSdx4KwhxBJ/EpG3TocK8Eh1tQhDVahKzjq+DW3vwwiVmCNtDouPnb7DThARi
 JRa9/cw8gVFhFpLXZiF5bRbCDQsYmVcxiqeWFuempxYb5aWW6xUn5haX5qXrJefnbmIEprnT
 /45/2cG4/NVHvUOMTByMhxglOJiVRHjnPTmfIsSbklhZlVqUH19UmpNafIhRmoNFSZxX2/Zk
 spBAemJJanZqakFqEUyWiYNTqoGJJUGT5ThH2jSh1wpPZxb3r2w6pzqr4ofSjtSI36vSS/Nm
 z73TPPdWWKvBf5NUlrCnhTaBmTsz44XXMK5/evXRh8Q7ScebOZiNG5qs2FiXaKSoR1zx9dZ8
 cCBM69s38Z4W/U8yEi43/k0yufyPs/cz3945K5smXknNlEqJqQ17FLR+aaf/hceF6a4Z7Ic2
 7vy197qDia7rev2j3RPrQn+XPXHOE473ntiRM/XBzKffLwqd6bO06vpwsS91D0uw6sJTy3xP
 3zkgMjUxSq7sim41/7RTSx6+Xv6x6lbz7Gt1vTdLdm23f7vSPeJagUphamV44ZkLlwpaHnK3
 HZRf6vVh75yMbvbyr5zHVzhs+NKqxFKckWioxVxUnAgA3jP9tOIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRmVeSWpSXmKPExsVy+t/xu7o/X11IMdi3n9/i/uLPLBZXvr5n
 s3h41d9i0v0JLBZfNk1gs3g+fx2jxck3V1ksOicuYbdYe+Quu8WbtkZGi/c7bzFaTJp3k9Xi
 c+s/Ngdej7Uf77N6zG64yOIxb9YJFo+ds+6ye8zumMnqsXjPSyaPTas62TxOTLjE5HHn2h42
 j/vdx5k8+rasYgzgjtKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnN
 ySxLLdK3S9DLODnlL2PBItGKaZdnsTQw7hPsYuTkkBAwkdj1/QlbFyMXh5DAUkaJF1d62CES
 MhInpzWwQtjCEn+udUEVNTNJvHo/iQUkwSZgKNH1FiTBySEioCzxd+IqRpAiZoGXzBLbPp8C
 cjg4hAXSJGY9FwQxWQRUJTpWqIGU8wrYS+y4dxVql7zE/oNnmSHighInZz4BG88MFG/eOpt5
 AiPfLCSpWUhSCxiZVjGKpJYW56bnFhvqFSfmFpfmpesl5+duYgTG1rZjPzfvYJz36qPeIUYm
 DsZDjBIczEoivPOenE8R4k1JrKxKLcqPLyrNSS0+xGgKdN5EZinR5HxgdOeVxBuaGZgamphZ
 GphamhkrifN6FnQkCgmkJ5akZqemFqQWwfQxcXBKNTAlz27/9DLz/gmFnS4ZMo3H5QO5Hvw8
 5qmmOjGg7+C5m32LhEsSY3+HrDpY0luY/KK+YYPorF2xjzgYXzc0q2YWXJmmrtf2+WfsWnat
 jzcVYnZddvtiM8EgQXPruZUsJv8yCx5E7Zl11UtNr/DETdaCa9YH/nLnCy2Zs0v1Ok+3uPg+
 17OCsj1X9s5wkljwwVKtoYrVOVOprWn3K97aq2tkn8oZn1Gx8Vi6JZvjoVeQzsdXPqrfbn3W
 O3R7PVO0+E8Fm5CrdnPm8PH/Lk27v3DmHpWO6hNfdotuXbhlKeuMX7pzvykrfl/B6nio/DTn
 sXCFAM32NbGm/SqbHwRNrfm5MyRgbf87qw/WZxq+XKxUYinOSDTUYi4qTgQAXMYd8DYDAAA=
X-CMS-MailID: 20230807130041eucas1p1bf8380490bcf76a34d2c09bfcbdb757b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230807130041eucas1p1bf8380490bcf76a34d2c09bfcbdb757b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230807130041eucas1p1bf8380490bcf76a34d2c09bfcbdb757b
References: <CGME20230807130041eucas1p1bf8380490bcf76a34d2c09bfcbdb757b@eucas1p1.samsung.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Samsung DSIM used in older Exynos SoCs (like Exynos 4210, 4x12, 3250)
doesn't report empty level of packer header FIFO. In case of those SoCs,
use the old way of waiting for empty command tranfsfer FIFO, removed
recently by commit 14806c641582 ("Drain command transfer FIFO before
transfer").

Fixes: 14806c641582 ("drm: bridge: samsung-dsim: Drain command transfer FIFO before transfer")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Marek Vasut <marex@denx.de>
---
v3:
- fixed 'fixes' tag, added reviewed-by

v2:
- added additional delay when workaround is used as suggested by Marek Vasut

v1: https://lore.kernel.org/all/20230718131859.3114135-1-m.szyprowski@samsung.com/
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 18 ++++++++++++++++--
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 9b7a00bafeaa..d06401de637c 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -412,6 +412,7 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.m_min = 41,
 	.m_max = 125,
 	.min_freq = 500,
+	.has_broken_fifoctrl_emptyhdr = 1,
 };
 
 static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
@@ -428,6 +429,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.m_min = 41,
 	.m_max = 125,
 	.min_freq = 500,
+	.has_broken_fifoctrl_emptyhdr = 1,
 };
 
 static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
@@ -1009,8 +1011,20 @@ static int samsung_dsim_wait_for_hdr_fifo(struct samsung_dsim *dsi)
 	do {
 		u32 reg = samsung_dsim_read(dsi, DSIM_FIFOCTRL_REG);
 
-		if (reg & DSIM_SFR_HEADER_EMPTY)
-			return 0;
+		if (!dsi->driver_data->has_broken_fifoctrl_emptyhdr) {
+			if (reg & DSIM_SFR_HEADER_EMPTY)
+				return 0;
+		} else {
+			if (!(reg & DSIM_SFR_HEADER_FULL)) {
+				/*
+				 * Wait a little bit, so the pending data can
+				 * actually leave the FIFO to avoid overflow.
+				 */
+				if (!cond_resched())
+					usleep_range(950, 1050);
+				return 0;
+			}
+		}
 
 		if (!cond_resched())
 			usleep_range(950, 1050);
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 05100e91ecb9..18017b3e5d9e 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -62,6 +62,7 @@ struct samsung_dsim_driver_data {
 	const unsigned int *reg_values;
 	u16 m_min;
 	u16 m_max;
+	unsigned int has_broken_fifoctrl_emptyhdr;
 };
 
 struct samsung_dsim_host_ops {
-- 
2.34.1

