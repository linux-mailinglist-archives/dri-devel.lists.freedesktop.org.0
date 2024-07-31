Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC8B942515
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 05:35:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56BF510E0C9;
	Wed, 31 Jul 2024 03:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="cYiq1Hiw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2068.outbound.protection.outlook.com [40.107.117.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B8C10E092
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 03:35:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I5cG3OBXObiY6kDF4IQgziHIOEMjqVWVEQFZeaxLb+CFrV9IbHHpMRTiHSOGWhUGo7GGkbW2Jvlu0HHV9w9TlYVimTbWJ/QNj4+/fk36acjEqknvX6S1ysBWgufyGOlSj0U00mhH1rhaFn6Czym6WjsRFnd9oUbk1OGMAsd9l8pHupZwo5wnPibfQaXn+3yRlKX6MI82tjPG7p73kGzTagr7BRcfemUeQaOKLYQT/2+bbjzNH48cZ0q6Sd4zunUxq8IpWMyOY1GSgjxfyjR4tToyWqjydKKxbjR7a3ENjKu+rpyqpcyrmBYT8AKqKnPQnAJrvMb2nyLXsjbhdmHCRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5vatior3QIBxnjTsWnWYzvzzd+xpPly3AJ4sehktgk=;
 b=v/fLCOUvDL9qN4bRjow0v74I4ngRuL+1B3ob6wUziFGhxZLg2vX9g2//DziArp+9QkMFsMTr6QKoZajYnuduFysMeKsBDDrQ5X3FbIiD6mynHWdT2Oze9JenC6JXtKs4pLBMrSUbeuaC6UVzWGO/DAp6Gs0cLpGqBeiBdiwQQcx0qB9n1j7MjoY/hbU5chgwggj16Wt4hdOwUm2migXxR6ltywR9z/ks3puTgeEBD8UYiX06vcNa2WWghkSaPouHuDOPNjOtf2+oMXfcN1pibHRkD8rGw3QFzRCE79zon57mTXGpM0yuYrhY5dT2II8+uelHoAfKV51Lka7HtMVvmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5vatior3QIBxnjTsWnWYzvzzd+xpPly3AJ4sehktgk=;
 b=cYiq1HiweRqY3ySnx8aTHa7zOebKkr7cwvksLv+l+JCrwGgNhI/D13NwqfValX2N7kzsYdPYN1bOr2LYwejg7FhnU4FIcDJXr9xIGf6qjL8CHKvqUvH7WTxkrpfKY6PJLRWYSTDS5juvuw9a6qReOIdpXgxbkEfLKuYeEjE6FOinsgw5IWIsw4wpZVGYLLPeQ3wJ3RMoFiuTx+AfL1IbWDPpaWHZMaE3R9s80wgj3t+bS8AcxHdczlHiwDx/B1KbVbKkUphAkPQn6ZNDYgnGbMhsGjWgh5W72/IqIKLXdnOOAk07o1wgzpWSHT/zNDBGWOW3x6JbiJJ85hGzpOHpog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TYZPR06MB6953.apcprd06.prod.outlook.com (2603:1096:405:3f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Wed, 31 Jul
 2024 03:35:13 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 03:35:13 +0000
From: Huan Yang <link@vivo.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH] udmabuf: use kmem_cache to alloc udmabuf folio
Date: Wed, 31 Jul 2024 11:34:49 +0800
Message-ID: <20240731033449.1016195-1-link@vivo.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0052.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::21)
 To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|TYZPR06MB6953:EE_
X-MS-Office365-Filtering-Correlation-Id: 881bd12e-ac79-482d-2636-08dcb111c984
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O7FqwNa3K3q5ZGMv7jJoXyetSvQs5lorhLy87FlZ8kp9glTbzZBpcPyyLdNr?=
 =?us-ascii?Q?nINZgRT+RzkBnb3twGb6XwX15CBXq/rR4Gb7/JmabS7q244B7ldxjDlVcwHN?=
 =?us-ascii?Q?3vOdEIZf/FW2RYwyxkmIC5Rk2YFrBsfSMKZ7nhsclROEXlr+Y0jlRseYJ1LN?=
 =?us-ascii?Q?8WvkVRrQwfwaRCO5cc8n/ZuB7jipGVL3GtgQKUPLTyCGOV9v0RSWYYbk6Doi?=
 =?us-ascii?Q?BXevVpb/fioufWdMCWp0angv3jRKqN4ThayQlH5CEpe8WjV8B5D0s4JGjwQC?=
 =?us-ascii?Q?IFFJ59s6foPfIvH0N3YFkqIV6w9dC8qsN9oJiVcDhfLdp4+apUjpME8ZLp9C?=
 =?us-ascii?Q?1u1X9xGzTQOlCuPVdepdjU4LLFiSPk1nUgP1WydA2V3EZdWBMddH4jGy0KIK?=
 =?us-ascii?Q?LtSwZ8HTtgNZRzBvgl0pBRaTvKp7OXF9qDW8UQaByfAdB4AGcrexCLzFrxwd?=
 =?us-ascii?Q?tEvV0w3n7AAm8cmHHHZfvQGlv/dS8g3M0wyd+QVpMZKDpc0qFJACpLtwogjf?=
 =?us-ascii?Q?5PIoScKVh/cMkZDGR2zeMwLgF+8K+12nqMebzIFfMfhqyPhQe9QHS7rsJ331?=
 =?us-ascii?Q?VrLp3DHLNOD2Tu/sZmI4APTULcbt4O090THjF81VWjpt0zMEdRp0cPgcUHP1?=
 =?us-ascii?Q?yBdNPiDhDPGLja3+zXh6Zt5IyBtnulA/X4PpUvkfWrpp6CwfMyz6BLUkM7jp?=
 =?us-ascii?Q?44RB2hSClvGnqs7BZqMIXVNsMcbuWR+1lo8RPfLO8Gycop0G2aRm2t2zImJM?=
 =?us-ascii?Q?j8HO19/r39XMm+pXd3SAQ8caJSIJsooLWYNaWPztWALe0C0Dle5CUIB1y09h?=
 =?us-ascii?Q?lm3Ewg8lPP398ii0M23Q5Z8ysm7pecJD7YW4za5P7YbwxXCoJixQfQf+3w21?=
 =?us-ascii?Q?qvv3bOWi1AOpcPLgBj0HHraSsT+9gTaNBxk/LYEI4/1VAfkjtWg4Ev9N12Lu?=
 =?us-ascii?Q?2ULm+H9WIZvpG8XQozsnQr76VJEQFUOCzwqs6KvSkb2C1nY0PpuBZcJZe7OW?=
 =?us-ascii?Q?d+Y/smg2GQIWwywIqXxA4K0ssEnKiqNb5PE4SyCpoH2n75t+CN2Ndufj4X3V?=
 =?us-ascii?Q?TYGwhaU/ci73QaIxrndYvgnDxaMyAD4CBTbp28j8O/dNzY2m9kV1sOVe5Cek?=
 =?us-ascii?Q?DdRucfdXHqFHZKctMFMXzAthG+C2NpJ+qctaR7h6uVcKoUAdDK64USb6Zz0z?=
 =?us-ascii?Q?AnkRZRFj0+5vn/QJ28wOlu6xaWd9E53i6vxgSBAT8TTd/BT+yU26CiMsHrUS?=
 =?us-ascii?Q?9fGvtx2TAsIHc/kckl+w7KNv4W70zDXeM0dyJKk8HXqp7hHKTISBSPAPJIIb?=
 =?us-ascii?Q?B/BVfhx5HU0JoVhGGA+fpYOlGEybf+H0Nf1MjTm/iZPEwDXNPEFUQigYBRXW?=
 =?us-ascii?Q?8HwsfcHYaZZycqN1QRMKYelk6fxI6Z5ToPx8OuUIPlnMqT3RnA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AQR1yh7CgQ1RhtEkBA0wCFKgduj3wfNjaWrOBp6NFUgf7QZqK3R1uxVuGm2/?=
 =?us-ascii?Q?+nORE7YYpl/49MG7mRYGB8DkyNN/LfB8qTKeP/S0RAnCWOiTMHbWISli5WYt?=
 =?us-ascii?Q?j9XgH7PxovWx0SR8c1K1EkEtORSmchvBs9Xe/M9xZ/rWwpKnUITjf+zPpWFR?=
 =?us-ascii?Q?4Gj76Xa01uLJNssnBHWBpW//fonI4oG3zy0JdgmteI8Zu3Q4Lj3DXA9/vhJQ?=
 =?us-ascii?Q?Ll2VtAbnFIbLT3VPDqD2fLX/o7BOuxf92H4oqCIC8lFN6XCdaTGOh7XAOkzb?=
 =?us-ascii?Q?xFVISxhSb6PCnXQi4ZHI8wkgOfLRxn3quj4yQAKEO2HpqmiE6P2+GghQOlmF?=
 =?us-ascii?Q?3WAul4WYd8lznSBvjAguTd2fp/IDiJ2e6jUW/6gnuUz1+X+pli25IrcD6MTK?=
 =?us-ascii?Q?jyRW5iTy2J9I/zplxenb3w5Lsr520IL3oeyGH9tra/0o6ly2JVEHMg1cVsKj?=
 =?us-ascii?Q?b4awv/AUopqHDNr90e9GtpdzGHm9cGBiDl1AldLAUBQTJ3yhKpr8BS54JSFT?=
 =?us-ascii?Q?gAbBX03ucQzNS9ys6ZlDkLeSFvxZSPvxhu+HWT9HHHSu6VsGxh+MNtZGpnle?=
 =?us-ascii?Q?gfqOK4lBZO5eryif2pigK8+UwAVt0gqdfPTs72FhX1Wm2qklLdYPvQh334Sj?=
 =?us-ascii?Q?nfLKZOD80H5Gyicvbun+7TIGXWVRVafZFwWIvR9ebhu/Y5zGL0x4k2ev7GBK?=
 =?us-ascii?Q?HTBnkLVXdewJrgSQynjz9qDjz71L4QH8kqeKj+lzep2rau65OV/HL/OJO/3c?=
 =?us-ascii?Q?5xZOOpBEQrrisUbqt3Q+cZqCIyMJjVXuZMxtA5Afqdyj46cILChmM5yL5OoR?=
 =?us-ascii?Q?89G+ABwpVoT9rQ1ZyKAr6nnevsCerwmlyw0Xmc6zXKANaQpqzcO1t6V0WXBe?=
 =?us-ascii?Q?UKqD1LpFYigOHTl8dLg6R0YgjPO3VBDKXBkNkIeYSJFSk25rcAbq6YpKXzna?=
 =?us-ascii?Q?6eNzt2CLHxyCiESQutUpiIj/aFuDFU3+nPNm0S8Q/CP2uyehTychTs3XrooH?=
 =?us-ascii?Q?FtOyp/NIaeU0zsuw5UOcLwpqROBJBchPKKh3oKVMb937QiYh+a6GLZW5tHRR?=
 =?us-ascii?Q?AnJp0JZH6SmnrMSFpmWnRTfItGC3jqnDsjISCz4yU9ZLPptl5rdoLSAUn4sM?=
 =?us-ascii?Q?y97kY1L5tfuqXNuisDE6OUEXPVZTLMNcm16VBVrnLuOd8wGPPKE5OaVZk9ch?=
 =?us-ascii?Q?PyTLLteePBdPGEiKWlWAYLyhzZEVfPGuLjk5riGQD9s1jpl/1nYG+l+Kz70U?=
 =?us-ascii?Q?J7OMywEl4iX1gZl6Zhsw53Zz+KkS5JE0GhncxGbBajUI4Aw6aEL+LBdwJXyG?=
 =?us-ascii?Q?9JUVl8U4l7kU7b5zs7zGhrlpvPENbZbzwk9mu6ke44YtXK9OlGImmhAAD7PY?=
 =?us-ascii?Q?88/Ey4+kJ7cbm2phEwKht1bGO8FH3XiZWwRV0i9CLxoaodEWM7Avx9OdgHgO?=
 =?us-ascii?Q?nlmAh4DuJQNVALvr1phBq4Jc4ShqJOfm7P5ZWgbbRQM91RgaH9YyiYXhC3cv?=
 =?us-ascii?Q?BI0qsY0dTtIWK9+RJWlf/1qcYV90+d1pIjYSZ5Oxsb6mQ3OEE+h9ntB9M1S8?=
 =?us-ascii?Q?MI5iXG62epiPX9kSc4TEmftOTEAu+wgUZBwmTimq?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 881bd12e-ac79-482d-2636-08dcb111c984
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 03:35:13.5156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q31jzX3iBbRZM1QrvMSxxr7BF0Q90+H+CCm2yyNF/dVl9TzEzWH9H2huWMBflGGazR11tZaHvaC/sStfSFedKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6953
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

However, kmalloc is a public pool, starting from 64 bytes. This means
that each udmabuf_folio allocation will waste 40 bytes.

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
 drivers/dma-buf/udmabuf.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 047c3cd2ceff..db4de8c745ce 100644
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
 
@@ -492,10 +494,20 @@ static int __init udmabuf_dev_init(void)
 	if (ret < 0) {
 		pr_err("Could not setup DMA mask for udmabuf device\n");
 		misc_deregister(&udmabuf_misc);
-		return ret;
+		goto err;
+	}
+
+	udmabuf_folio_cachep = KMEM_CACHE(udmabuf_folio, 0);
+	if (unlikely(!udmabuf_folio_cachep)) {
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

