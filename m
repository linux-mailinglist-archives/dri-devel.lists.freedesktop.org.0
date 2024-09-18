Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F413497B6E6
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 04:53:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F0310E51A;
	Wed, 18 Sep 2024 02:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="lBSAn+iM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2079.outbound.protection.outlook.com [40.107.255.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB1310E51A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 02:53:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=alXeCrE0lsqZVSGIAAp+gCRhgITvaUZmTxoEejvR68UEou3A8Sbq6hLaiF0vzOpw0jQLimtv6eAoM5CSykomGIT3nHFcsdpvLrZ6YKtwV5Ow0Mp5nO/c0O5W6CNU9HS3CAK3HvOnUUNze9bRslH+NUA6Ylx2Xk51CtoVX3J+x6Ll/6P5bL+rCDHGv3q6DodyiI02INb1iHoSB3kNoROfhWi3gveFjA39WbHG0hHFsx/vixlJSUN3ldcdiAnKHTF3qwdjPvOUUd1gDFiN3bCfHZAwbda+1ge8IbfAf8n4cc4Jp8+NCzmfjR/1Bd7fsH0oyQ+WA3fNN3Trf73RK6MXyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eiAQP2XOZ/W2FfmhMmIpXM39JfU6KKhxAyOVGhBDjU8=;
 b=EUVqMsVtDMQ1729BVz6tgTsoOLTszpaJPZ5YiqHCMjhP1Zv5AboBqY8NzQldJ2dgVwc7Me/ANCP8Eeo7Y8q1u+bWQ8W7lXolB/4u2sI9ax1zTihfptJCTDeTIz5gi7PqwMv6A3qmbRoOXO9TCUqnl3ZDutYdOmscI1m8CMVgRDJKvXhuLW6SjCAg4yPLRHXIRAktVUuj8Y3lGGJUthWhvp767B2FroW7Dfiku7wA5Cx/UUxKAYRu+HcxSaRo4K7HRWQ2efvlC5xowom3Hz3pPAVjjRE7fm0B2/clV8Qzp8FszUmeQAkwM9qXkjqUQlHRbXv0f0KyoJYq5lztossUlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eiAQP2XOZ/W2FfmhMmIpXM39JfU6KKhxAyOVGhBDjU8=;
 b=lBSAn+iMTG3BtMDV8l7M79ReljBM84ez0CT7gD7hSkAetkbXaNlYt//IEUEeOS9ed5KrOXRwFHDmSLJsVwZKwM+TARtNJWJejNfiUIr8LBq4WVnVV53bvFZDRI/snL8Hunfr/iljwek3Ev8MuPkIzJ6DriBgM2IK1J5e4kdXVVxnik17mgZPJ8pNEO75yW2lTSms+E7GryE/nyM2qx1ESw2zTei8nDwju3OUE11isBZkFX3BCfiDXlzhq0nmjrrOs+89ACh7ZmBcpZR0OTVh3v4ibI4aZepUtCtDEkUORkr8Sf+hI3gRv2AxM9nCMolxRyGAIEhwrZcJj3rxE+IsdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEYPR06MB5672.apcprd06.prod.outlook.com (2603:1096:101:bc::11)
 by KL1PR06MB6236.apcprd06.prod.outlook.com (2603:1096:820:d7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Wed, 18 Sep
 2024 02:53:01 +0000
Received: from SEYPR06MB5672.apcprd06.prod.outlook.com
 ([fe80::2f0c:5cf2:abb0:d852]) by SEYPR06MB5672.apcprd06.prod.outlook.com
 ([fe80::2f0c:5cf2:abb0:d852%5]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 02:53:01 +0000
From: Huan Yang <link@vivo.com>
To: vivek.kasireddy@intel.com, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v7 4/7] udmabuf: udmabuf_create pin folio codestyle cleanup
Date: Wed, 18 Sep 2024 10:52:27 +0800
Message-ID: <20240918025238.2957823-5-link@vivo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240918025238.2957823-1-link@vivo.com>
References: <20240918025238.2957823-1-link@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To SEYPR06MB5672.apcprd06.prod.outlook.com
 (2603:1096:101:bc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR06MB5672:EE_|KL1PR06MB6236:EE_
X-MS-Office365-Filtering-Correlation-Id: db7238e7-bb33-49c6-529e-08dcd78d0283
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|366016|376014|7416014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v1kC9CsQTxJ0mHIPVzG/Wsv4vudd5MvZ8Bt57INR/J1gZsQfHs47rgwJAsQ4?=
 =?us-ascii?Q?UANat8vMS6O2L9l51CPa9BItHYs1Ua7BosB+/mfvQ7PkxzXr66UO6w4fCowK?=
 =?us-ascii?Q?40zB1K8mR0ky2ZbcqnAew+jcm8qFpYORih95YVaMtbY5kK9lC5F5QeP9vLvE?=
 =?us-ascii?Q?2IPi5yzDm7WBDYCcscPOw0tcpzgK0zxEEnMI5fun2yI4PePFZ6HztkKYFmIn?=
 =?us-ascii?Q?u3ET15KITrTJ4C/mo3Qq0RAhHc4v+VQ+ffotFJU2JayfJ/CVtwlgsMYW4iQv?=
 =?us-ascii?Q?kCSfJ2tbftbBd9c5wdttCo4laIhV2Ss2KubWb5gGEw2Io44NeZZ9dBDzvkHd?=
 =?us-ascii?Q?WHeRPawCBdYCEno5Ko5fHwwsy0cFnXkpHYJjK88HG7PTiXWdt3UDSC+J9J2x?=
 =?us-ascii?Q?XjNZTd4sdFsTr7CtFEJh0NENWaJKyOQmJ95V0Nfho4bn2DGoINkWh+iFYXHx?=
 =?us-ascii?Q?o/Co4by/duXqcGnTezPAjdOukDJCLSUNpew5R6x0iLDbcWqdAdDiJWrfQMwq?=
 =?us-ascii?Q?DbrmfwRe5bb3/rAoiVJye8uzqFMl9IPwBjFwktKCheEm3ZtopOJjGwHg9bow?=
 =?us-ascii?Q?2oNnWXcvJoPItpjnH0HVAaBrGHjt2wEqrTucV3OGrd5BOw6p3nEZpFRBpxXw?=
 =?us-ascii?Q?1Toe1mg16/Q+ogv92hPIcw/yvpERjslcpz+je+CC+zGrs/OM3tZKFn9CzWle?=
 =?us-ascii?Q?tWCcehb918yjtmBB6yMoXjdKpxwHyQqppIoiqFyxi5T0qfImDMjTbKdvj1Lk?=
 =?us-ascii?Q?3rrZ0G6HvRpj7nuvLLMfCo37qV1xdmSQUMarkcdYBt+HCqqWYBXwjKZfYhGJ?=
 =?us-ascii?Q?7BZXL7+Gyp3Zz8qF9YOFMKGiB+BEURUC2aOEwUszD5gTGB3xDSNj5jmcBiI5?=
 =?us-ascii?Q?qFA8h3VWD7B/OEb22hBTl1ANY6ckjcBSkXFNI6iccQ6x4o5DeM+4ciyZzpz9?=
 =?us-ascii?Q?zSGO6+S4YW3phPZ+GBINtHj9g49+0vWD0MuC0y8SP9MeUcyqzuamOkdZv6jy?=
 =?us-ascii?Q?Z+pmIESsUwB49fqlMN6pOGtTlQ0jrEJohyyk92koeQaa6TlFnejDsHnDjGs6?=
 =?us-ascii?Q?VjXVHgHaTV9lB7i5HqpSmlGhARQIDDF+Oz64NGRx1MBkFEi25eXTwvdgnoQA?=
 =?us-ascii?Q?8sdA1NBnSUVlRDTxuxfaOilorTuJR4VG2ef38MyqbxuH1JeKlImp3kp+Id5j?=
 =?us-ascii?Q?eFfBpSFwc6LATmNGFG4OhTtBEsr5HkgzsCH7cAc7TBZwjn0hjAItShbJis6v?=
 =?us-ascii?Q?JosItVWHTptJWMHgs6vsTrsZ9EMInrhxyLlPZllGiXI/pjRC9zM57LcGueWZ?=
 =?us-ascii?Q?CXMKMSrkEwcUSrbrz6J9/cyPmcrM8U+LY4Bo9PNgKJNLqx9K2ftJsL6l5eZw?=
 =?us-ascii?Q?PEfmu+ypt+rtYKW08usCcZ83HQz6oBpVIpxtlT7JUl/TinowYp4kvp5radc3?=
 =?us-ascii?Q?qcOtoZJ1waU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR06MB5672.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(366016)(376014)(7416014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BlQY9Xq1zxH31eAA4W9V+v75iJiLImO/l29XouU1noceRvs4In+XrXVrFF4p?=
 =?us-ascii?Q?HBB5lPJGP4a4Vciu1bkG6/ogTQryKUNeeqxUbwysxs99SYtkcXj1ixhKWq0X?=
 =?us-ascii?Q?4LTxU63JO5ts/0G0QdBslk85m8YfyJ3shYbAjf6Jr3YoysMk2R3dP8JFfran?=
 =?us-ascii?Q?xFFYj8C61eY6EWDffHWv7CSqR2EspUpdt8JUh3shE3BXyrE52IeI994E7FPp?=
 =?us-ascii?Q?/cwNlFSr0TcguqjIxrQkFBUVrumGTcb8U+XBytBdFcUR+Ij5FCM/leHwfWSj?=
 =?us-ascii?Q?5JELOXkKQbSbTjh4hVLZjYRpjtoHfMOTHySQ+etfMqLL8WyvMTUJuNVb9Bam?=
 =?us-ascii?Q?bSCriWMwJjyMaLArTP75m2GPJAVUUbbKTkFcGA/IDB7lET9+AuTKxiXt/peK?=
 =?us-ascii?Q?8kO38RtKYT7xIhPL48O0vTuzxfj5MIKEuQ9gNtsCXAsl80YXS0WB4kSzCTXL?=
 =?us-ascii?Q?VAu54xXkep8Fk5fRHO/hE8Iaq0C1H6Jhq76ooEisj50QVJb5mi+jH/1n+C/1?=
 =?us-ascii?Q?lDIw5VUaZvNnjTpEmzbalL9J83Y71kdC+aGaM4pCmPl5iFJvLlaEHEdfiaIb?=
 =?us-ascii?Q?l8qCfbB0S8aEJh6MXUoiDfzzPDTXYtIfVJBuaBfG6AiqhyiV1GuzVILNCQZM?=
 =?us-ascii?Q?HJG+zTMIxBlg2MepDTBoVQVG5vXBH9Ra/NAibY0VUZ9LaHNVtzmOrz5AV+gL?=
 =?us-ascii?Q?HJQfZQSrAG3zCnCDkBQ9LzSukudxk0+oAuiZ/yg2isH/aWJVzFnthReWypb+?=
 =?us-ascii?Q?8WanmhctRRS2hQtqQjL20vQmfA4eDrhWeVgojGkMYFDQv5aKIkQ2As8TnFWo?=
 =?us-ascii?Q?+65XRGVciO5xz62w5TYzvQqpDj47VmLBT16eDfsuPr+nhYawPK/9bh9IPZCk?=
 =?us-ascii?Q?oUoWOvKRsDGcJzCZAAnd72/beS7O9lf4rjNZF+rjnXGQSaBh4xm0g7s779Uo?=
 =?us-ascii?Q?xr0VPtUbeARVv3xvPZUUsgU++ReaMhF+ug6D5EUO7cEpXy5tzJ6pzGtNcbqA?=
 =?us-ascii?Q?VyF23+ArlTVGc7CkGCbEu6mGqrRTmMJmDjBOC6e1pFI23wvxLNVxJLUxA339?=
 =?us-ascii?Q?EeujXWKJFRzA4kH7qWiqz1gCf/D9s+Cbxtp5t7mcDjWueoSi3EH3ROEU67EJ?=
 =?us-ascii?Q?kYGgbK9VzWGgtdG5v1Rtq8LFBGtJDx8PO36Eucr1d2ue1Y9hzfYnXq7pdxWv?=
 =?us-ascii?Q?1r5Gad9dUEehtGjtMPy7yOhTmRsacoJSLbJf7WaDPL3AGVaiOiwsaRtSA8g2?=
 =?us-ascii?Q?6b7eDB0u6xrOE9kWPsz7ryanrZdUddiUXSdPIKCI+06r3urZmLBaJ6qjyRM5?=
 =?us-ascii?Q?cZfvWGg0y/FGK7WaYysdNz6X30ULz/T//Dn/h6V65MeBMFd0iXzZhD0QWj9a?=
 =?us-ascii?Q?oySit7n2p3tIiQIFEMO6wwthS32TsBRQ4unwxT8p7GsTJxYId2vAnfTpVDb8?=
 =?us-ascii?Q?5+HI2z63nMGU4dh5wINfm0Q7LuEwsuk4rQE2L40MSy7ZaR7dMH9lroR4lCz/?=
 =?us-ascii?Q?UFlVImP/nQ99hzyDgwnu7zwn87MktfoxIisZDZKtUVxnEA0EDhUU/3kTrW3O?=
 =?us-ascii?Q?hhAjKoiOjCuCIc8wmNDjCsu96mELCwo5MBdt1asG?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db7238e7-bb33-49c6-529e-08dcd78d0283
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5672.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 02:53:01.4094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5EbJbCiHdfJsz0W1YlLe2ByVH4aXufYQjMYQxKSp+IWZeQKf0WOqq7yDvVNXxsaE22j5QoubdRcHHLpeedY9tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6236
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

This patch aim to simplify the memfd folio pin during the udmabuf
create. No functional changes.

This patch create a udmabuf_pin_folios function, in this, do the memfd
pin folio and then record each pinned folio, offset.

This patch simplify the pinned folio record, iter by each pinned folio,
and then record each offset in it.

Compare to iter by pgcnt, more readable.

Suggested-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Huan Yang <link@vivo.com>
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/udmabuf.c | 137 +++++++++++++++++++++-----------------
 1 file changed, 76 insertions(+), 61 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index aa182a9dcdfa..9d58c045b8eb 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -291,9 +291,6 @@ static int check_memfd_seals(struct file *memfd)
 {
 	int seals;
 
-	if (!memfd)
-		return -EBADFD;
-
 	if (!shmem_file(memfd) && !is_file_hugepages(memfd))
 		return -EBADFD;
 
@@ -328,17 +325,68 @@ static int export_udmabuf(struct udmabuf *ubuf,
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
@@ -347,81 +395,50 @@ static long udmabuf_create(struct miscdevice *device,
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
@@ -432,8 +449,6 @@ static long udmabuf_create(struct miscdevice *device,
 	return ret;
 
 err:
-	if (memfd)
-		fput(memfd);
 	unpin_all_folios(&ubuf->unpin_list);
 	kvfree(ubuf->offsets);
 	kvfree(ubuf->folios);
-- 
2.45.2

