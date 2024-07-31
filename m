Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1EE94282F
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 09:38:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3125F10E483;
	Wed, 31 Jul 2024 07:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="i69gFSVL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from HK3PR03CU002.outbound.protection.outlook.com
 (mail-eastasiaazon11011052.outbound.protection.outlook.com [52.101.129.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A7A10E483
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 07:38:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nWMPPuyKSbAjQO6HDoPPrEd7iYI+uUFeV35XCTChUSYmtyHRSblalWgpOOUv5bmbp4CYCgbGWH5U8A0hdeqPHhWsoXLd5IL2NmGT2oCMqWLzfmuKrNO224tkGOt85gdiFpuFybppwdnR+rdSNIHbjLJ7CufbLtY4fP9QiVQD9PH+dI5KVpqzhe2doqtPjf4uzt7umljMNQ8Hss5pUZrap+6PvoA0W6vww16ujdROMBg5ealsolpO1hxn7I6M6GtXoSKe1/9b1eidviBHWvVgLMAv3h6wvHiJdcfEHMKH8ZGb3QPAWHF7+rl1Ff25Ogmt99G5aA7hBXyewhES4ohenw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ckG3WKdFIajY4ft6VdIEmXtiq/0qclqbB/i5aevI1+c=;
 b=y7G5lWcwtsVPiQQny1LMGBHgwqWTNSg1Euq/jwpvVVftjPfNvV38sJ+Gb5i1huuWwKq3kUwVqUyyBNx4uZIGIvJV7wOb3VIRg3mylQ86NpuDwEugLyYXsPmCAUjfPbmcopv+9l9wYKEca7Ry56q1ZI8xDUL8kiL8bmXcyURpldULRgBvOl8EZmP+v8X/FTEDjYpE88Uejs0kR4e0sf9WQSNTsUgz0ZdbknGmv9U3qA3rVXxndz0qMc6DZzF9VZrCS1Us+PHQOAMDXed50vMxKzOQb4vVSTnOw8u1kfLvSfnLAbhtTcz6axj1HIs7GFkKjVS691AaLnca7F8n939Keg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ckG3WKdFIajY4ft6VdIEmXtiq/0qclqbB/i5aevI1+c=;
 b=i69gFSVLMLDEiwzCJxlo+0MXjHfuX5aJ9+brWtWLNfSZyNwUib2LBGdr3YrocDQZBrB8yKueV6vmJUte1rlxZPCoQTLsCUMsge1a0uVgsA4PaIcMZ8B3kqOkxTILe9Y7GYYCW6fXuVZtX8HBrZ4ZCP4cSFwezdYdI87L8cHmxr0R2/No0qp7IrBjsVRfA3ja1khF6vMf8yNXf87jmMkjEcgXyFbaxDNcVujqjralbR4a3OyTk8bwHQsyVzqa93FDFmsK6/nJsUMIYBJN0X57J2/QHjWjPW5/ZafwoCZxslstms609YBIN6fr4SXx36oqGvENuRsWKtDZ3X+oKM8EVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by KL1PR06MB6069.apcprd06.prod.outlook.com (2603:1096:820:de::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 31 Jul
 2024 07:38:09 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 07:38:09 +0000
From: Huan Yang <link@vivo.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v3] udmabuf: use kmem_cache to alloc udmabuf folio
Date: Wed, 31 Jul 2024 15:37:51 +0800
Message-ID: <20240731073752.1225177-1-link@vivo.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0058.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::9) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|KL1PR06MB6069:EE_
X-MS-Office365-Filtering-Correlation-Id: 032edd1f-0333-4c13-42aa-08dcb133b969
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+kb6xIdKw5XIjt997iQVE/9nGtpkIiWzoQhrap/1pDTNDEjk6V691HWRdlmc?=
 =?us-ascii?Q?EUXNnXmTy+irHtv3cRv+1dnBaiOW6Fv+hky47e2eKQXTjdiyDHWLGPCkeldp?=
 =?us-ascii?Q?a6nsz6uC0o+JlkGoDiOCD8xOToJJMZKCzXhvX8JBU9fiUWkdRe1a5ZfBjjSy?=
 =?us-ascii?Q?mNmEHg1juF8vkyQW7ad3QhldbFZWbmtvFBhTV+80zqPrn1j196AWyrjpT1z5?=
 =?us-ascii?Q?K74C+7XSNvNqFu1HFO2owYqNRQYs3cqEgNLj6ofUXgAD5Qvq9oLM8arnG3dE?=
 =?us-ascii?Q?OaiSj+qZupxWKlRoHDJ7gFF/heC1VFFIveUnQvJ+mvI4iJGxs6fC893IZBd0?=
 =?us-ascii?Q?A+x63BCXPthihBaBZifFHr9omnkClsQuN4CEmInflxMJEiXcM1BIDd83QqPD?=
 =?us-ascii?Q?htpxZ3/q4GwoZEBbPPykhE9aYS7KzXmIjlOhgk5prJRrx2lfi8dHxjKjr5lI?=
 =?us-ascii?Q?rpRt0jOMUGRt9SaTVGHBh8wYgpPD9AEtoA8EkPQrVnXxs6D2VLY+SCEyL5Y+?=
 =?us-ascii?Q?NvgN1AQczowRHppwCscDVn/ZR6OkOxI81Qj7m9oB36kolUh/nHxDl3u7e8ok?=
 =?us-ascii?Q?ubTN+B3zOb6vtuSG/iCkEWn3OweS1esxSQmQmr5uudvD7Kl6DH9muBUw58aT?=
 =?us-ascii?Q?/393sxljn1xO5DXQhBk7x9comAVMbZRk7/Jny8clRnzMVC4L6iWZ5FDip0qh?=
 =?us-ascii?Q?o0/sDbDgR/sGu1AKgMdHpwSi/5uavsv7+QB2kXNvAPKxDj7XcG3JAyCzM2bo?=
 =?us-ascii?Q?KE6ruIuTB6C5YbO+NhbMzRsoyvB59+opseh7E1XrEDGcKukcSv4SHFCPD5Wo?=
 =?us-ascii?Q?XbC5IfUy80VkyHbG21P8hHZKYFgxMEzoyviccOzi+7XpLufCd2u3nlWlSv2t?=
 =?us-ascii?Q?vvTQNBODJcR/xegTcMdDy8jyjSHuLUcs6Arz4oqJmoSXKKD/9Go3jImpn2rx?=
 =?us-ascii?Q?Z0GaYayh91lfK5a1Nn3sC76+w8wgFmLqYt80UT6c2N9Y2iHvW5P8fC7EkfV0?=
 =?us-ascii?Q?kW2Htd8Y2BaEsYWjbOFuzgftgvp7Zc7pbUqX0nDi5mP417/zs9gCYZM7XA20?=
 =?us-ascii?Q?n4PeF1rLS2Tzyu73SrgHdZKl82Nyd+8+5lU/WFcBVgqiz4NjljeUrKoxtGpx?=
 =?us-ascii?Q?q60BrqKNRNsZdaTd9sUMqIFOmPUrrDLNZ1X83UP1k7O8qGnxWopi89KCyti7?=
 =?us-ascii?Q?wuahKJyuZYBv69BreLATYuyTUsIdkk/JYQM8+Y4BV+mavUFy0C3h2fm0chkd?=
 =?us-ascii?Q?4/+f2abA4xYOEN3e+3Usdun60c9c7Bj65iafbHVuKJKj2rV80lAkgggn/5Yl?=
 =?us-ascii?Q?0XC1oOghZmnXwPFjd/n8TNgLl0kvK0iYhDyZEf9r5svxQJKV3+Su8Cdt4YH/?=
 =?us-ascii?Q?XvnMAIRV1ow0dG2shg1i4sxEYGt6nBuflvbxof0qB4NBExFyzw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qzrGJIuVfywqRC7ygNk/UyT37m11yO2WHPk5hAfX/9Uud/zZjvyOMwiTaaAY?=
 =?us-ascii?Q?BwuWgkK/c62QNj8Y889i1GTEunhg1YCJ/LTpP4qiR1GXmmoBhCicb6Cg0nRQ?=
 =?us-ascii?Q?cr3Mx7aMEttTuUWyGy9+fnyDlp/7lGIaDhnm2G89J2lEp6pyJqzL1t3dpf8r?=
 =?us-ascii?Q?cOr4T+Ftra9Tl2v1KrYszJuYL359UFIUcM/nfS6CcGCvxKB8lRNZl7WB4Nyg?=
 =?us-ascii?Q?U6AZau/m50umpm9n6bbrIpDqNhEHayx9wy6Q22eVRq+U2VoMPchxBS8QSYOb?=
 =?us-ascii?Q?bNAsBzKIv4jtZNAcYDK+Zdi1F7qUsWQAkeeZn8lNHWTjwnB5GMcvOWlPP7Wg?=
 =?us-ascii?Q?OFcZje8qx9JhTnRdHm+EApv5j7ZI4IqjMPQvws0mi+9JvHGJ56KUbpYPJEBP?=
 =?us-ascii?Q?h76LBxj0Yu5NAJQtQYLfxDAiPnnNmvOnkaS2NO/6gZq/YPpX0I/VV6IRberi?=
 =?us-ascii?Q?V4BZIeUEpC5ll9SVSaFKkm987SXHdqIrtAoRIo7tZRHIchp+Tez+q7vjbtog?=
 =?us-ascii?Q?TSL02UaKqnNQd0Ake4IgDcNjLTukL+s8DHYr2w6tBaIAFW0EByCrLQqUMjnO?=
 =?us-ascii?Q?6zdfXx8kQ49RJcX/xEBGQMe6yF8Cs1zB2ub3UFYsCnPyHjREJ88VkbcuDn1v?=
 =?us-ascii?Q?r/Lc6GjmIe2Cv34UB0WlcDHPNS59Y9fJfx0o0NE3M0hONRbV3I6YnRjn1Ruh?=
 =?us-ascii?Q?JVhGeudfb8Oimw+P2eu74XK+Gp8ZPzoDvPCswp3K3oWW45wD0DiHPVrg/CHo?=
 =?us-ascii?Q?V+Q1L2/ge2bRUVVW9Csx8ptirW7ADapEm7KVIht67EEAEMjO9irGIrUcnv5X?=
 =?us-ascii?Q?N8IJkz63f/KZouWxBi0WQa2SkC0nWvEku5LbEGgl14IgeZHuM54ywx+stjXK?=
 =?us-ascii?Q?QIWoWl+En7/3WTFAXE1Dhqco90deABCdlDmaO9HKxl3uuodqVtkwZErf8Eom?=
 =?us-ascii?Q?exICsACaVAkBrXhxYJaX9LVrSSWfkuXUk3D8GzuiDapvLIe+rvVzDM0zyb3h?=
 =?us-ascii?Q?+u2yBIgrovLlWcCsMUZxN9jBfckSHukFyo6yUSpM+xH2TmrBCu1lzes8NfgN?=
 =?us-ascii?Q?KhVjC6KBqw5WqDmw1dMGIyaGk3ivPbMFkqa3SFDISL0pjEopnYiBtW3F0qin?=
 =?us-ascii?Q?vTrwa45JzGoGhFaU9F1bAhgSCbpk6FD3i0vHDGE8qxeFPY6gV4rSvciEnbaP?=
 =?us-ascii?Q?UIUE88pwLX8+pjKbHZzKdLeyNCISAqK3UIiGBUYkmXuUqPYhuFmaYkXuybQr?=
 =?us-ascii?Q?4cnbhBrrAew00pRKkvwd4MThGqzDCcEEc1zXZajbWDV/AYq3bIBnu/PfsZAe?=
 =?us-ascii?Q?habQU2NgQJUrLEAzgFWOzJ7EA259YzORh2iPqWwvmCk0UDjPArfk5esvTSH/?=
 =?us-ascii?Q?aW2lAc6Zp5eb/CFNmA9cs9mJtTi4n0Qh6Zp3HiYu5/lT/3RcKfEQoIbTjIv+?=
 =?us-ascii?Q?HEf0YS/q+4KYmQldmgWOA7XMN8jed2w2MFystZDjgRLoCU9xQGkB5yS5Q6ew?=
 =?us-ascii?Q?7gdqjEekjoGQfBYxrJrdOTzash2Z8NRNmE9Iu8sp1KnkmbpLlyY75PN1mYMF?=
 =?us-ascii?Q?V4HfKZYp/Rl8xVVXXNcIz5BM2BpJxPPBA0laTZmC?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 032edd1f-0333-4c13-42aa-08dcb133b969
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 07:38:09.3828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P5OwT8Pt7JxihjFAh6Zhh6Udp3OwRvxqHbm3Yp7j1/YyER5p+0ZTORPFkNi/gNPxtAupCnB9W8ox8G6vbnVzEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6069
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

The current udmabuf_folio contains a list_head and the corresponding
folio pointer, with a size of 24 bytes. udmabuf_folio uses kmalloc to
allocate memory.

However, kmalloc is a public pool, starting from 8,16,32 bytes.
Additionally, if the size is not aligned with the kmalloc size, it will
be rounded up to the corresponding size.
This means that each udmabuf_folio allocation will get 32 bytes, and
waste 8 bytes.

Considering that each udmabuf creates a folio corresponding to a
udmabuf_folio, the wasted memory can be significant in the case of
memory fragmentation.

Furthermore, if udmabuf is frequently used, the allocation and
deallocation of udmabuf_folio will also be frequent.

Therefore, this patch adds a kmem_cache dedicated to the allocation and
deallocation of udmabuf_folio.This is expected to improve the
performance of allocation and deallocation within the expected range,
while also avoiding memory waste.

Signed-off-by: Huan Yang <link@vivo.com>
---
v3 -> v2: fix error description.
v2 -> v1: fix double unregister, remove unlikely.
 drivers/dma-buf/udmabuf.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 047c3cd2ceff..c112c58ef09a 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -24,6 +24,8 @@ static int size_limit_mb = 64;
 module_param(size_limit_mb, int, 0644);
 MODULE_PARM_DESC(size_limit_mb, "Max size of a dmabuf, in megabytes. Default is 64.");
 
+static struct kmem_cache *udmabuf_folio_cachep;
+
 struct udmabuf {
 	pgoff_t pagecount;
 	struct folio **folios;
@@ -169,7 +171,7 @@ static void unpin_all_folios(struct list_head *unpin_list)
 		unpin_folio(ubuf_folio->folio);
 
 		list_del(&ubuf_folio->list);
-		kfree(ubuf_folio);
+		kmem_cache_free(udmabuf_folio_cachep, ubuf_folio);
 	}
 }
 
@@ -178,7 +180,7 @@ static int add_to_unpin_list(struct list_head *unpin_list,
 {
 	struct udmabuf_folio *ubuf_folio;
 
-	ubuf_folio = kzalloc(sizeof(*ubuf_folio), GFP_KERNEL);
+	ubuf_folio = kmem_cache_alloc(udmabuf_folio_cachep, GFP_KERNEL);
 	if (!ubuf_folio)
 		return -ENOMEM;
 
@@ -491,11 +493,20 @@ static int __init udmabuf_dev_init(void)
 					   DMA_BIT_MASK(64));
 	if (ret < 0) {
 		pr_err("Could not setup DMA mask for udmabuf device\n");
-		misc_deregister(&udmabuf_misc);
-		return ret;
+		goto err;
+	}
+
+	udmabuf_folio_cachep = KMEM_CACHE(udmabuf_folio, 0);
+	if (!udmabuf_folio_cachep) {
+		ret = -ENOMEM;
+		goto err;
 	}
 
 	return 0;
+
+err:
+	misc_deregister(&udmabuf_misc);
+	return ret;
 }
 
 static void __exit udmabuf_dev_exit(void)

base-commit: cd19ac2f903276b820f5d0d89de0c896c27036ed
-- 
2.45.2

