Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9370497133A
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 11:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1077910E34F;
	Mon,  9 Sep 2024 09:19:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="NJgmB0a0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2068.outbound.protection.outlook.com [40.107.117.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641BC10E34B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 09:19:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BETXIZQmNXMVyHb9d9Huf7+fxN1gz78jldN1r1afP+f373Bi9jm+RgY5seK/90pSmFyOsJ9SqOJMgzxMwEYCRCNlQ9mVBFcut6zQGZts1nEMEG5Ypesb5b+7f2FisSIyjV0rikUZHkB0U/3HTlAT5LXu2aqa2YViVp5r3k7NvIBb/wYBG8r9TOGGIZGVG586nR/ni/u4N1GSHHMnU3bsxGkBl/Ff2vjpLNoLHxdR5ZOdvUil/MRF3LBW7Ie0zlJctYm6hmiDti1TiTBemzIJd2t8y68hBdX5Q9eJeQaFqQm1JJyWosnJ2YhO8zyGWxKnRo54NZGI/p/AKmcHcxmlcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQkwDcoxqOcmBd3NkTTXFHVpXFaDfQknUSNfxlJgkhM=;
 b=YCoCgvzsigTB21pvrZEXbtftBPyZjTQB07deTPOxO5T4fr4QvQeq3TFGi0v/vgEKp+ncH/sMAw0BKrOM3uoAg9BD33DCLRNXgnIJz9FYFuxKL/CBJyhGWeawxIR1AbxPcZD0lK+SAT2RzpBNika9MVWheKRTu7sgguJETbhRKxGG4DObHoGFGsRZ8r+2fYdGiDVYqlFEpkhKAsM69L7l4AS8tDRZucaGJbekf39b/TcaKhZW/z8tITm4LsXoGd2I4efbR84RePJNgRkr+dmHvYeL+dmXvI7vFzFyyuj+RIqRWnqRpE0R1AuIZ4H3xK92LCS0nd9k7QYfzad1EAKoWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQkwDcoxqOcmBd3NkTTXFHVpXFaDfQknUSNfxlJgkhM=;
 b=NJgmB0a0yRs/5tEQmau+5z8jK5bxLtNsvF7sJcYj5Tc0XhGZjwhm4z45ak/zdbgzv7IADzzU1shvIMcHjkXJHhN8hNdWd47Dcs4AYb2xEypLJmSjX0yjNkXsv7ithNffvalZ5g1EWS5nD2rCAz2p51nHrFNC2SQoz41Dx/4vi8A5aYUKF7I6eHMWtk7Mrc3acpHiiaRV5yebjmOcSpfIVFbtq9vl1IBjEbf+VMhr4D8Wwujxe8jGpbx8xyYbdfDSjv992xGcY1aPmj1FLZGHZp2Wy59OApFkTVjLFXIAoKQHd7JcXLOXaQrZ3Fpri5xgTeJsI0OZD7Onk/9JTbO1Zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TYSPR06MB6292.apcprd06.prod.outlook.com (2603:1096:400:42d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Mon, 9 Sep
 2024 09:19:16 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7939.017; Mon, 9 Sep 2024
 09:19:16 +0000
From: Huan Yang <link@vivo.com>
To: vivek.kasireddy@intel.com, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v6 4/7] udmabuf: udmabuf_create pin folio codestyle cleanup
Date: Mon,  9 Sep 2024 17:18:42 +0800
Message-ID: <20240909091851.1165742-5-link@vivo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240909091851.1165742-1-link@vivo.com>
References: <20240909091851.1165742-1-link@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::19) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|TYSPR06MB6292:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e239420-900e-4a5e-7569-08dcd0b079fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nz3B+NMxcAaFo6CUfRuH4lGK5EcB5bnDlfFsXICdlCpy1v9XbTc899x9ORzh?=
 =?us-ascii?Q?WRk6gJXldsqiolb4EYXcFDgWcocbJPRDvPAxJFJ6L1byrHCHsbbTCXZ515wt?=
 =?us-ascii?Q?BOnDRrX4ku0CZqt/3ijCd5pWE0CosFDwtUe4ftvTg/MLqLsoMoEoiYt3S0BL?=
 =?us-ascii?Q?T7kqEiaCexs8V7AtBZO6ojjGsMh5600iJax0VHc249L5wmBdSbVzWToi4HYj?=
 =?us-ascii?Q?NjtBu02gK3+9kcP7I2pF3OMiPqOX2p5gWyBwzvsv1BJC+SWnw1HuzkQz22Nw?=
 =?us-ascii?Q?W9XcmsCDcFl61SFyiomk1Kysv0pyY1HVhdSAcGEq0MIZIKgMiZbc8JyeKGbn?=
 =?us-ascii?Q?S2SNE57WvCiCkbB8m0NfKGSpGo2/B2IMTjPnuXj48YycDrFwY6gSPpQ5cbqk?=
 =?us-ascii?Q?7v+lAo1Zts8l7yDvNyxh59oShc9ZL1NLUVHCQYoX3U4GOOvG9FMJD7Wku+b+?=
 =?us-ascii?Q?f5t+Tb7U4s1PrvCDi3LxKzwI5SOKIgcgiYOLa2zsU14D7punmo1hlzUonlaq?=
 =?us-ascii?Q?vEAZcOetXD9oJbcQgkYsr2LD2KvXU24YLRMxPfhZgIpJjYs6cD79s8eplx8S?=
 =?us-ascii?Q?9dCgzbiEHwksP7GqrgXKwF2TAvH5SKyc2qb7/d09ZAlSrgDy0cRJ3Nu0NDmZ?=
 =?us-ascii?Q?k568eb+TP+wjIN7x22a7aMe1IJXSpL8vXp+SL+clot2xtAeqkbJH8xTuS6KX?=
 =?us-ascii?Q?Xvt1Txasf4XScRGJ0nE9sKNnjJpk8HvShJXVcv19H/Fe6n4h8p5uW1UNz9iu?=
 =?us-ascii?Q?ipSRDqNfTqZAJoY7Ad5ZXFo7Oo3DAN1vrgnPRIfsFEJXCXoRKgXlXXe88gy+?=
 =?us-ascii?Q?UQYdI0Fz4X4WSWDIFjPLxyP7reJzi/i6fNFF9QSW+lGzXk++/UGc2jViPFs3?=
 =?us-ascii?Q?ZxT3G2ymSl87Yb8gVrC+DNfeaAYqUtrnPWuMypPvKV5Gx5e+6+iDYIMBfGuZ?=
 =?us-ascii?Q?fXKTGqQMtL5pZcG00ovfHpMAVIyx1FTxZs5PQyK5pYdrzxt1hsDfKp8aSE02?=
 =?us-ascii?Q?5KBsM6aEkv6t4dyG7C2MWFalYXmYxVWdeM/ewwWJijxldwKf26+GS7lqY/Cx?=
 =?us-ascii?Q?/T9YH7XeqZsAYL4cGDrxkpQXBz2zrHFhiP2lE0NApHVWVi0fVG9X3MC5KFIU?=
 =?us-ascii?Q?M3ZkQj+BTyIdv2TG7Vjan5JOhCIIgx0wwRVOL/ZQKTXmr7fpQejdua9FY2FE?=
 =?us-ascii?Q?hzsPn9VxgiJTFm/g8BXMlNp2Q85NNa40B0suLBysveKutB5K8P8SdDzoUKHh?=
 =?us-ascii?Q?FWS9SlMr+DnmxI7kg+O0st0osQTH9IbdOUtZWwQXUh52slA4PRzfBQDYmWD9?=
 =?us-ascii?Q?H/doMdPwO8WJB6lXaUKRBVc+e3vyHKc0PFfQ9HVnyPhehnnSjtlm18da6w9/?=
 =?us-ascii?Q?R/aTpxU56/YJjDVCM+WsUqIfS0PKT0n/wH52w5zlB6gnUefprw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dgp3SWatAMzytnxsBlnwd3tNHQ8yS7oEcb9YceTnXqLRKFZ8TuuQ8l2Z4+Xp?=
 =?us-ascii?Q?/wklOX+b7QGpz4JwpZeoUNSgDysWDAyofMWZSIoITb688wVlFDSaafoywnUi?=
 =?us-ascii?Q?IfFwlxYfpNz9NnjVdVrtLEKysCXpA7lBnTVrnEjnX55Sf6nbGL9ssNKEsDdb?=
 =?us-ascii?Q?qNFdeMzp3oBtT/w2ylzF3f+F4/wF0TWW5M14Jsjya5OjTIQMu1+MT80Kjrp1?=
 =?us-ascii?Q?eJgi5PfWLCkytjcN5yqEqH6PtSdzABeG9ZpeI0v4Oou6YKglNJ9KNNPCRzpc?=
 =?us-ascii?Q?SsFIr4zXZOGmdsrauT4fizCVR0TbifwSXlVimBVoMV2g2EaNRsLRTAZaaP9U?=
 =?us-ascii?Q?QZtJCaQ5xY4rEUZi3Ewf+CanB/PRzBpVQJUkbzFkdi4qsBR+Dx6JmsbmQjAN?=
 =?us-ascii?Q?xFG9YozzW8oOldZNwLH8P8DznaLrBJ/LRt+RDle6M0o98BcJ5KUA7c5A+xJj?=
 =?us-ascii?Q?67GEIos5bYDLEK46ZE/PaOCqu7/9PnsCE994FRXragO5vuO/qPw2ZUecnOQJ?=
 =?us-ascii?Q?0nXzCEkIrDl11lO3Xb2MZX6bAcKXObnO26mlTCtJafd5C0YThCKod/NOd4fn?=
 =?us-ascii?Q?MUkVZWo8j1oDIrAsgadFmBWUOKDcTnHxyz9SEo3a3BqC+5MXauDolo3M88am?=
 =?us-ascii?Q?PSgYO2HMvN1R+a2q05jDQc4G8+v0Ce1wIlmCCcXdtEP09/M2A4V45AjvqEr6?=
 =?us-ascii?Q?IRdsNY37Tglr7HI3IgJChNERhY0jlru4DgJZfRZHurjGZn+v3IbMll/SOcaY?=
 =?us-ascii?Q?RM3rXFTBvGcqp6FKbNGOQszoVSIwFJb0S00/bh1/vLyKV31KL0s1eHKSVuw4?=
 =?us-ascii?Q?WJV9XF7RBxavNhIoO77MN3r74LIMrHq4dZ3PhCdDN5WpAcT2/lmrpSPDj62D?=
 =?us-ascii?Q?Cr+X3iYUMdGK3BPYZ/kLSnfusQ8tWZcDOhB+PQU3/k18oKdkQW7DwnZIfIAk?=
 =?us-ascii?Q?LCFzWOhF31SVNhT025W88VqA4Y6sQziADpM2lsy+2I3gtl1s0YTFn4MRb9Za?=
 =?us-ascii?Q?piuW2OiyFXVJlDX+kpnyNNB3U/+r1CQu+/fNsVK40+AGtSEn31ArrI+Y1Lq8?=
 =?us-ascii?Q?iQsA7MbPE8WHlYn27jc+YvED5kdUVgLuyCJWSNASDE8o7Zc+VaY+rm8LxTyp?=
 =?us-ascii?Q?+Km0iMinPN513xiXdutXBvGaC52zNFPyhOG0//rrRGccpkSR0LWvP2yHjITu?=
 =?us-ascii?Q?vzgWX/l7gyp5g1Z8aQXX/hkrivHw+IjJKIZdG5fLYRtmLdcwqYtfiz/NqDoe?=
 =?us-ascii?Q?JrZP6YauEZU4Kl8CcqBdP13uOAcjvyxlT60DAa+DzE2UC2L4LGW/RBk191hX?=
 =?us-ascii?Q?v9jvwXAZlzBrva87pJEJg+wG+JAUAaoEpdi49D1kOK5Ul3boyhb6939Q2M6w?=
 =?us-ascii?Q?4Q2YM59XNLlt1dab4SAlUla6IMcqekL/lU5MGFrNENhgpfd1Tk6MkT3yPuQ+?=
 =?us-ascii?Q?jePkj4zGLTMN0cyjwQZ0LXgrNqgAlIXLzjb9vdPfmlT6B4DiIPYhPgdiiSw4?=
 =?us-ascii?Q?KyWiUbqRnDeRe+fPfVvU9OwI69frpx/39mV0zk4u5r4yG6N8qRNDUJewjv7y?=
 =?us-ascii?Q?hXvC3e/GWIIa0gLPVZ9NqJW98q7oyZS2wiYC4uAy?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e239420-900e-4a5e-7569-08dcd0b079fd
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 09:19:16.1106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /7DNR1MfQswOBSfO5c8tAvMdFOvG2RxttpS2J3Foki56fv5ITqgngmBJEdkQT7fj2yJfcfa/nSO7gnZNxYlehQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6292
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

This patch aims to simplify the pinning of folio during the udmabuf
creation. No functional changes.

This patch moves the memfd pin folio to udmabuf_pin_folios and modifies
the original loop condition, using the pinned folio as the external
loop condition, and sets the offset and folio during the traversal process.

By this, more readable.

Suggested-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Huan Yang <link@vivo.com>
---
 drivers/dma-buf/udmabuf.c | 134 +++++++++++++++++++++-----------------
 1 file changed, 76 insertions(+), 58 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index aa182a9dcdfa..fe1466f7d55a 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -328,17 +328,68 @@ static int export_udmabuf(struct udmabuf *ubuf,
 	return dma_buf_fd(buf, flags);
 }
 
+static long udmabuf_pin_folios(struct udmabuf *ubuf, struct file *memfd,
+			       loff_t start, loff_t size)
+{
+	pgoff_t pgoff, pgcnt, upgcnt = ubuf->pagecount;
+	struct folio **folios = NULL;
+	u32 cur_folio, cur_pgcnt;
+	long nr_folios;
+	long ret = 0;
+	loff_t end;
+
+	pgcnt = size >> PAGE_SHIFT;
+	folios = kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
+	if (!folios)
+		return -ENOMEM;
+
+	end = start + (pgcnt << PAGE_SHIFT) - 1;
+	nr_folios = memfd_pin_folios(memfd, start, end, folios, pgcnt, &pgoff);
+	if (nr_folios <= 0) {
+		ret = nr_folios ? nr_folios : -EINVAL;
+		goto end;
+	}
+
+	cur_pgcnt = 0;
+	for (cur_folio = 0; cur_folio < nr_folios; ++cur_folio) {
+		pgoff_t subpgoff = pgoff;
+		size_t fsize = folio_size(folios[cur_folio]);
+
+		ret = add_to_unpin_list(&ubuf->unpin_list, folios[cur_folio]);
+		if (ret < 0)
+			goto end;
+
+		for (; subpgoff < fsize; subpgoff += PAGE_SIZE) {
+			ubuf->folios[upgcnt] = folios[cur_folio];
+			ubuf->offsets[upgcnt] = subpgoff;
+			++upgcnt;
+
+			if (++cur_pgcnt >= pgcnt)
+				goto end;
+		}
+
+		/**
+		 * In a given range, only the first subpage of the first folio
+		 * has an offset, that is returned by memfd_pin_folios().
+		 * The first subpages of other folios (in the range) have an
+		 * offset of 0.
+		 */
+		pgoff = 0;
+	}
+end:
+	ubuf->pagecount = upgcnt;
+	kvfree(folios);
+	return ret;
+}
+
 static long udmabuf_create(struct miscdevice *device,
 			   struct udmabuf_create_list *head,
 			   struct udmabuf_create_item *list)
 {
-	pgoff_t pgoff, pgcnt, pglimit, pgbuf = 0;
-	long nr_folios, ret = -EINVAL;
-	struct file *memfd = NULL;
-	struct folio **folios;
+	pgoff_t pgcnt = 0, pglimit;
 	struct udmabuf *ubuf;
-	u32 i, j, k, flags;
-	loff_t end;
+	long ret = -EINVAL;
+	u32 i, flags;
 
 	ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
 	if (!ubuf)
@@ -347,81 +398,50 @@ static long udmabuf_create(struct miscdevice *device,
 	INIT_LIST_HEAD(&ubuf->unpin_list);
 	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
 	for (i = 0; i < head->count; i++) {
-		if (!IS_ALIGNED(list[i].offset, PAGE_SIZE))
+		if (!PAGE_ALIGNED(list[i].offset))
 			goto err;
-		if (!IS_ALIGNED(list[i].size, PAGE_SIZE))
+		if (!PAGE_ALIGNED(list[i].size))
 			goto err;
-		ubuf->pagecount += list[i].size >> PAGE_SHIFT;
-		if (ubuf->pagecount > pglimit)
+
+		pgcnt += list[i].size >> PAGE_SHIFT;
+		if (pgcnt > pglimit)
 			goto err;
 	}
 
-	if (!ubuf->pagecount)
+	if (!pgcnt)
 		goto err;
 
-	ubuf->folios = kvmalloc_array(ubuf->pagecount, sizeof(*ubuf->folios),
-				      GFP_KERNEL);
+	ubuf->folios = kvmalloc_array(pgcnt, sizeof(*ubuf->folios), GFP_KERNEL);
 	if (!ubuf->folios) {
 		ret = -ENOMEM;
 		goto err;
 	}
-	ubuf->offsets = kvcalloc(ubuf->pagecount, sizeof(*ubuf->offsets),
-				 GFP_KERNEL);
+
+	ubuf->offsets = kvcalloc(pgcnt, sizeof(*ubuf->offsets), GFP_KERNEL);
 	if (!ubuf->offsets) {
 		ret = -ENOMEM;
 		goto err;
 	}
 
-	pgbuf = 0;
 	for (i = 0; i < head->count; i++) {
-		memfd = fget(list[i].memfd);
-		ret = check_memfd_seals(memfd);
-		if (ret < 0)
-			goto err;
+		struct file *memfd = fget(list[i].memfd);
 
-		pgcnt = list[i].size >> PAGE_SHIFT;
-		folios = kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
-		if (!folios) {
-			ret = -ENOMEM;
+		if (!memfd) {
+			ret = -EBADFD;
 			goto err;
 		}
 
-		end = list[i].offset + (pgcnt << PAGE_SHIFT) - 1;
-		ret = memfd_pin_folios(memfd, list[i].offset, end,
-				       folios, pgcnt, &pgoff);
-		if (ret <= 0) {
-			kvfree(folios);
-			if (!ret)
-				ret = -EINVAL;
+		ret = check_memfd_seals(memfd);
+		if (ret < 0) {
+			fput(memfd);
 			goto err;
 		}
 
-		nr_folios = ret;
-		pgoff >>= PAGE_SHIFT;
-		for (j = 0, k = 0; j < pgcnt; j++) {
-			ubuf->folios[pgbuf] = folios[k];
-			ubuf->offsets[pgbuf] = pgoff << PAGE_SHIFT;
-
-			if (j == 0 || ubuf->folios[pgbuf-1] != folios[k]) {
-				ret = add_to_unpin_list(&ubuf->unpin_list,
-							folios[k]);
-				if (ret < 0) {
-					kfree(folios);
-					goto err;
-				}
-			}
-
-			pgbuf++;
-			if (++pgoff == folio_nr_pages(folios[k])) {
-				pgoff = 0;
-				if (++k == nr_folios)
-					break;
-			}
-		}
-
-		kvfree(folios);
+		ret = udmabuf_pin_folios(ubuf, memfd, list[i].offset,
+					 list[i].size);
 		fput(memfd);
-		memfd = NULL;
+		if (ret)
+			goto err;
 	}
 
 	flags = head->flags & UDMABUF_FLAGS_CLOEXEC ? O_CLOEXEC : 0;
@@ -432,8 +452,6 @@ static long udmabuf_create(struct miscdevice *device,
 	return ret;
 
 err:
-	if (memfd)
-		fput(memfd);
 	unpin_all_folios(&ubuf->unpin_list);
 	kvfree(ubuf->offsets);
 	kvfree(ubuf->folios);
-- 
2.45.2

