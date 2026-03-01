Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gB1mJEeMpGlrkAUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 19:58:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 395161D1297
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 19:58:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0948C10E401;
	Sun,  1 Mar 2026 18:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kCz0FYs+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011004.outbound.protection.outlook.com [52.101.52.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7C610E3F6;
 Sun,  1 Mar 2026 18:58:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q9PYcU5e/kJDfLNjgblrCYWrhUbrBQIKBqebZ/vIG1z9DOdOMo92d8j8ypT6u58OuuwrVtPy+/Xw6312Nbvgbe0jCQFQg3zhyUwIWG7nDOm7zx+Z89GhBwq4bSFcJXVCwGdmx62h1c+6uzdHJs5iYEiIVzH/mdNPgJjFXdNNABDP8oEQebzWBdod+iBBXpS+fILT0kHkV8ZKNB5TzgbhSAu5C4i5Q8Ado8M6P4eGMWorSZ7xkGU98zFl9sIezcCYwiClHN3ghAtPweYKlFFJK58NtxSWWM/lNJJgTa+7YrZQ1CVSI724BLhLaBtKCcx3YiOExIYDymdlOeA64OLZ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lz4990U5peHB+guUcGVvhQ3px+EmAIMqj2P8VyHOg1U=;
 b=Xmat8gtqFdH4CbdT1UEnECEEBwtacQcq/3UupXxs2U1gwQS8Kxk5N4VCgKY6eGgYNCgoY2VEF0bx3/51+g0Ylm7Nsf7gbIx1hVk2DNQHYklKaZD9U1v71WzSJ8tDrIR/KvIJS1GZdVcOk8OeBLfV0aGneu+ZTUi7P/1gFKLlZzIPBbJ8k8ijQiK6Fr30E/RiUYbtYAn7NZLNn0j4l55LJNPfiBF1javiaAw9+MiKGjIn2QUlJGOvE0QBYg985otIsqxgDj815hPJElyKwSlSo3MBcyr6fWn4q6n8anI0IOylwmOWDmXYiJqLRgSTc/Do8k6xMsDsleowllJjlFuTiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lz4990U5peHB+guUcGVvhQ3px+EmAIMqj2P8VyHOg1U=;
 b=kCz0FYs+r1B4HB6z4hB2g6hY0lGt573Uyuf3r2ky7k/8JBIC9CR7RBLzdetY6BR2zMbjLgyb8FomEQ3FR5eqh6ZMKNsgepBS5sTd4eGTBG5dp26Q+kvsQEMIndRRvWZR+FuDVSUdqZGEkonD+CjxAC8k8v1dU0GBBssVriG6x+zp7lpEEkdEE8VKdR8DurTbqdvU37xpIn+jdRQEP534ccTRv2HyjcYp0RtH5zUksAZMtJMzaMItbGnCq2u4h5Hp/SvueO8GgsQbkCTS2WzKWaRD599rL6mYlUDzGxxrVXi61eHc6Hujp+Et8V208SWl+JvDPA2ZG0c+6nFjP0zOTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by BL1PR12MB5993.namprd12.prod.outlook.com (2603:10b6:208:399::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Sun, 1 Mar
 2026 18:58:01 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9654.014; Sun, 1 Mar 2026
 18:58:01 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@gmail.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: patches@lists.linux.dev
Subject: [PATCH 1/5] dma-buf: Change st-dma-resv.c to use kunit
Date: Sun,  1 Mar 2026 14:57:53 -0400
Message-ID: <1-v1-0a349a394eff+14110-dmabuf_kunit_jgg@nvidia.com>
In-Reply-To: <0-v1-0a349a394eff+14110-dmabuf_kunit_jgg@nvidia.com>
References: 
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0153.namprd03.prod.outlook.com
 (2603:10b6:208:32f::19) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|BL1PR12MB5993:EE_
X-MS-Office365-Filtering-Correlation-Id: 1702019c-4534-4c61-272f-08de77c4755c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: hLdlHQtWwVl5sSjtDwYbtvK8g2bPXBS6BN+v9p7jcHnygkzggK3znVX0onwrj163KdUmnWxZ3ayhPDISEn90po/dkIsHp2FdQqwFC9+QLmkhDWgYgWgHL+gg5R9ftCr0MVzuUhc4+nbDZY9DSsSjPKP2O/RB5w+E287rhrIEf5WFU7yRAIR5ImaAjfH2YuXkyeStaeRWl13rOdnU6MzYizLn2YHzJEk3ybi44fsASZ2ss87esPyC3ej1Ggk/3oSlCmfAbS6R3oQ1sUjNg896r7L7LDXGCvPDdtO84nJuso6J3dBV9REGMLw22cpqnAw6t8s8atXQ3iPaZhEBERvNp05q8i+gIDpNrL8Eb2n5DouDWuDNI+8HEZ1BU2f9pb9wmB4s3RNOAIgPQE+nLgQ8AvjkgNv40JlvJX5ZmoJ5E9OiFL/dDSHgUM4jAfz1OEw28OJH7CW/j1WksVdPVANWso5YnvaaifDl8PWVosh6XHIaDvtlwEw7Pnx750VG7Sd6D6RsjUkkSUjA401hGHkPhBDZNXkbp3PH/F6u5rDqnDak+ofWS7uOMAhpCtvZYddu/l0dVOO8h4uZcLc7gLbg2ruRzVthSZzi7anAstelJV3C7RuIndMtF9w1awvptCX4jEazsmRlokDMc+dLBB5TVhE1+dv84bpI5CnuNYe4g/J9P24JJ/3OHktBFChZa6saz7EOCFsmHO82FYhr5bsjHpa2kWfOp7UlYxv2hsV5Ya3KFrBJeKoFeC283CghcLV8ZU+yvMEB8K8Fk5e06TG5nQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR12MB9620.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1VzbXN3ckJiVGJaUVpRZmFaRHB4dXdibkJFWGFrTzhUMXgyUUdZaTQ4djZ1?=
 =?utf-8?B?ak5JYzgrd2JGQXhyQVU2QnJNd1pGQW1qalVSdzBkTXE1L2NkdHAybmFSTEND?=
 =?utf-8?B?cFBEQkNaRzlEL004QTJDMVlySW9USnV3MmtvMC8zZE0zaGhoTnVpN2ZzdThT?=
 =?utf-8?B?UTRKS0I2QXFPSTg3SUFmdlNVblpBU2JobU8xdCtHSVd1VE5aVmdNQURxM1l3?=
 =?utf-8?B?aXE4QTJpcHQ4RnNDWEJFUHJ4V201UGN1MnZQY0xndGlNZW80bk1HMkoydmI0?=
 =?utf-8?B?dmlxV3U5Tzkxc1Q5dTRMSGdaSWxBcGdUMll1QmJFK25abU13bnlGVktYUEN6?=
 =?utf-8?B?V1oxbWIraWl3Tndia1hWYUs0LzIwWVZyY1k1bTNVOVpMZVhMak1MVSt4SkMx?=
 =?utf-8?B?cU1FYkNZRDI3OTBXUVpjNTBsUXJ4RUYxQXlOeEJWQTUvRjJPb1E0NHI1SmxD?=
 =?utf-8?B?R2QxYWhUWjVNL1ZYa29DbTY4VXFaaGJ6NU9heS8vR2xMUVhYMFQxbVBLRUZk?=
 =?utf-8?B?cU5rckVtRHIzcG0xUGZGYUJ3MFN3WDJ6OElEN1dpTmx1eE05R2liMm13UnE3?=
 =?utf-8?B?eUNKK3hPUldldmM4VUtLU3p4eEpFMWlUTStJdll4b2tScFBJdzlpbldvUXhQ?=
 =?utf-8?B?ckVkb0xXUklhZmhOMk84cDBVZDFINkZ4QjVxc2V3NjNIL0dKS2crRFlpZHJt?=
 =?utf-8?B?TUc1WlE1QmZ3WHlEL1Y2b2REM3hQb25qdGZNL1RRWkRsTWR3QldZZWVGWVpL?=
 =?utf-8?B?UlExQml1SUgyRlhjQ25haGVMdVpVY0lGVTBhdXVhSWViTTVaMHNKc1JsZnhr?=
 =?utf-8?B?cTVoRUVhaTU4ejAwZ2h5RWR6YUZmYjdQRmNIMUxES1Q5OXN5MkdsS0ZkRTAr?=
 =?utf-8?B?NzBkbmpqTVV3bHZ3NWlHNm9KcTFpRnp6RGViaDFrdVBnbVhPamdKYVFTeU5r?=
 =?utf-8?B?QzA2b0JneWR5QWIyNXdUUWc5Q1p2MUdERUtsMzFVMVNYQjB0WVBMSnlkWHBO?=
 =?utf-8?B?TWNOYmFLRGNXN3JiZWFwZFN5NWYzVFR3Qnd0RzI1N1RjbEhvSHpjMDB3Unpk?=
 =?utf-8?B?TGxleFBEaVRLaE1sN2VIaC9qUDJQY2d0UXpleFY1OEpJV21JbVJlckdPY2hH?=
 =?utf-8?B?OG9QTzhHbGIvazVNcHI5WkxGUHA4aW90cytjV0ZVTUQ3SXZ4Mlo2dDdSenpl?=
 =?utf-8?B?emsxS25oUitXWDBDRm42NnJrTHFKZXc2Yi9WM0Z0OTZGN0V2VjMvQk1nQk03?=
 =?utf-8?B?Njd2b0o0YmMrYlR2NVA5Y3ZqVWtGQldpZ0t6dENTYXZOYlhDZUdsWEJOMlFS?=
 =?utf-8?B?bkxKQzZBSk81ZDI5WHNyK1UyWGwra0NROVROYWcrVzhYOHVRcWNDd1JjWFpW?=
 =?utf-8?B?VC9vWlFYKzQyNWZIZVdiTXZqT2ZVNzU2K0hiZGlzcmFoQWV6dXYxZ3Z5Y29T?=
 =?utf-8?B?cjB4VitFNCt6OHM3VGl1dGFESlhnemlSZmlFd2c3WXFNRkNHaFJ6SEhzNG5x?=
 =?utf-8?B?RjdVZ0ZWVUQ4ZlhFbkwvWnFoZVQvOTBIbWxLZU8reENSUnZMSmNVdU16LzJU?=
 =?utf-8?B?U1hWVFhmS2ZDZzRiT0NKWElHK3MvTGx2dkZaN2VSM01LVnMxdklSUmJsMkZ4?=
 =?utf-8?B?OUZPdTNLcWFDMlhRcElaMFpWbEtZc2cydDRVME1XTDZpeXdzWG1EUkFZWjlG?=
 =?utf-8?B?S0J6dDFmaGhUZzJXRWExYTc0cmtHYktVSVJvVG5URXQ1aE9hcDBENEpQQXhN?=
 =?utf-8?B?SUFOZHdaZnBwdDREVHNoaDVISzhEb1FTVzIxdFNSeDBUVmpzTERCekFTczQw?=
 =?utf-8?B?OGluMmowTmpVMk9ISHdqbk8wRm93SkZ0QS9rRCtsaTg1UDlBSDZJa0dhUDZ0?=
 =?utf-8?B?ODZXcjRNcFp5eStZbGhkUVQvOXRUTXVwaTNJTGw2K1RVR0JET0llYzNHbURE?=
 =?utf-8?B?Q3hyUENLb0dvV1ZZcktpRGZKOGwyOE1nUjlvaVQ2RTBOSUlGVGgyQnhYRmYr?=
 =?utf-8?B?OHg3Tm01YW5xSUQxMCticDRkZDJrb0FBMnIvb280b1ZzNWs5Y0xxc3kxT2xt?=
 =?utf-8?B?V3MycmY0VisrSTN6YW1zNUg1aStoOXIxZVRDc2N1RDg4Z2lNclQ1TkVpdmhJ?=
 =?utf-8?B?R3h3K1pYSUVDZDdQMVJuUzd1bFNPcWg5d3pyRXJha2JXOVhhUzB3a1FwSXNN?=
 =?utf-8?B?cklnNUdxU3d6T2ZMK1ZtcG41ZkJUV2lYUGl0MmYrTVJBRmE0U3Z5b0g5MEgz?=
 =?utf-8?B?QXcyL0tPRUV5VWtJL3BJOGd4WXBsSVpZZnpjL0ZZS0t1ZHkrUjBySHQvNEZi?=
 =?utf-8?B?blFRME9UdzR5UFM0OEJabElBNkMvTVF3SVN0TnhlQnBxYzBLV0N3Zz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1702019c-4534-4c61-272f-08de77c4755c
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 18:58:00.4646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1sId4k0YuNzbi5DQe3ykVPcsIGQBgGbfMjoi9hIocoAubRk2VOWNZha21IMaU8Hp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5993
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,lists.freedesktop.org,linux.intel.com,lists.linaro.org,vger.kernel.org,intel.com,ffwll.ch,linaro.org,ursulin.net];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 395161D1297
X-Rspamd-Action: no action

Modernize the open coded test framework by using kunit.

The kunit tool can be used to build a kernel and run it in a VM with:

$ tools/testing/kunit/kunit.py run --build_dir build_kunit_x86_64 --arch x86_64 --kunitconfig ./drivers/dma-buf/.kunitconfig

Along with the other ways to run kunits.

To make the kunit tool work like this the DMABUF_KUNIT_TEST kconfig must
select DMA_SHARED_BUFFER to get it turned on without building a driver
using it.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/dma-buf/.kunitconfig  |   2 +
 drivers/dma-buf/Kconfig       |   8 ++
 drivers/dma-buf/Makefile      |   8 +-
 drivers/dma-buf/selftests.h   |   1 -
 drivers/dma-buf/st-dma-resv.c | 145 +++++++++++++++++-----------------
 5 files changed, 88 insertions(+), 76 deletions(-)
 create mode 100644 drivers/dma-buf/.kunitconfig

diff --git a/drivers/dma-buf/.kunitconfig b/drivers/dma-buf/.kunitconfig
new file mode 100644
index 00000000000000..1ce5fb7e6cf9ff
--- /dev/null
+++ b/drivers/dma-buf/.kunitconfig
@@ -0,0 +1,2 @@
+CONFIG_KUNIT=y
+CONFIG_DMABUF_KUNIT_TEST=y
diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index 8d4f2f89f24e3c..7d13c8f4484dd3 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -54,6 +54,14 @@ config DMABUF_SELFTESTS
 	default n
 	depends on DMA_SHARED_BUFFER
 
+config DMABUF_KUNIT_TEST
+	tristate "KUnit tests for DMA-BUF" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	select DMA_SHARED_BUFFER
+	default KUNIT_ALL_TESTS
+	help
+	   Enable kunit tests for DMA-BUF
+
 menuconfig DMABUF_HEAPS
 	bool "DMA-BUF Userland Memory Heaps"
 	select DMA_SHARED_BUFFER
diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
index 7a85565d906ba1..2e7a1453e2fe04 100644
--- a/drivers/dma-buf/Makefile
+++ b/drivers/dma-buf/Makefile
@@ -11,7 +11,11 @@ dmabuf_selftests-y := \
 	selftest.o \
 	st-dma-fence.o \
 	st-dma-fence-chain.o \
-	st-dma-fence-unwrap.o \
-	st-dma-resv.o
+	st-dma-fence-unwrap.o
 
 obj-$(CONFIG_DMABUF_SELFTESTS)	+= dmabuf_selftests.o
+
+dmabuf_kunit-y := \
+	st-dma-resv.o
+
+obj-$(CONFIG_DMABUF_KUNIT_TEST) += dmabuf_kunit.o
diff --git a/drivers/dma-buf/selftests.h b/drivers/dma-buf/selftests.h
index 851965867d9c7f..2fdaca6b3e92e2 100644
--- a/drivers/dma-buf/selftests.h
+++ b/drivers/dma-buf/selftests.h
@@ -13,4 +13,3 @@ selftest(sanitycheck, __sanitycheck__) /* keep first (igt selfcheck) */
 selftest(dma_fence, dma_fence)
 selftest(dma_fence_chain, dma_fence_chain)
 selftest(dma_fence_unwrap, dma_fence_unwrap)
-selftest(dma_resv, dma_resv)
diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.c
index ad4dfb49dcd9fa..95a4becdb8926d 100644
--- a/drivers/dma-buf/st-dma-resv.c
+++ b/drivers/dma-buf/st-dma-resv.c
@@ -5,13 +5,17 @@
 * Copyright © 2021 Advanced Micro Devices, Inc.
 */
 
+#include <kunit/test.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/dma-resv.h>
 
-#include "selftest.h"
+static DEFINE_SPINLOCK(fence_lock);
 
-static struct spinlock fence_lock;
+struct dma_resv_usage_param {
+	enum dma_resv_usage usage;
+	const char *desc;
+};
 
 static const char *fence_name(struct dma_fence *f)
 {
@@ -35,15 +39,14 @@ static struct dma_fence *alloc_fence(void)
 	return f;
 }
 
-static int sanitycheck(void *arg)
+static void test_sanitycheck(struct kunit *test)
 {
 	struct dma_resv resv;
 	struct dma_fence *f;
 	int r;
 
 	f = alloc_fence();
-	if (!f)
-		return -ENOMEM;
+	KUNIT_ASSERT_NOT_NULL(test, f);
 
 	dma_fence_enable_sw_signaling(f);
 
@@ -53,49 +56,46 @@ static int sanitycheck(void *arg)
 	dma_resv_init(&resv);
 	r = dma_resv_lock(&resv, NULL);
 	if (r)
-		pr_err("Resv locking failed\n");
+		KUNIT_FAIL(test, "Resv locking failed\n");
 	else
 		dma_resv_unlock(&resv);
 	dma_resv_fini(&resv);
-	return r;
 }
 
-static int test_signaling(void *arg)
+static void test_signaling(struct kunit *test)
 {
-	enum dma_resv_usage usage = (unsigned long)arg;
+	const struct dma_resv_usage_param *param = test->param_value;
+	enum dma_resv_usage usage = param->usage;
 	struct dma_resv resv;
 	struct dma_fence *f;
 	int r;
 
 	f = alloc_fence();
-	if (!f)
-		return -ENOMEM;
+	KUNIT_ASSERT_NOT_NULL(test, f);
 
 	dma_fence_enable_sw_signaling(f);
 
 	dma_resv_init(&resv);
 	r = dma_resv_lock(&resv, NULL);
 	if (r) {
-		pr_err("Resv locking failed\n");
+		KUNIT_FAIL(test, "Resv locking failed");
 		goto err_free;
 	}
 
 	r = dma_resv_reserve_fences(&resv, 1);
 	if (r) {
-		pr_err("Resv shared slot allocation failed\n");
+		KUNIT_FAIL(test, "Resv shared slot allocation failed");
 		goto err_unlock;
 	}
 
 	dma_resv_add_fence(&resv, f, usage);
 	if (dma_resv_test_signaled(&resv, usage)) {
-		pr_err("Resv unexpectedly signaled\n");
-		r = -EINVAL;
+		KUNIT_FAIL(test, "Resv unexpectedly signaled");
 		goto err_unlock;
 	}
 	dma_fence_signal(f);
 	if (!dma_resv_test_signaled(&resv, usage)) {
-		pr_err("Resv not reporting signaled\n");
-		r = -EINVAL;
+		KUNIT_FAIL(test, "Resv not reporting signaled");
 		goto err_unlock;
 	}
 err_unlock:
@@ -103,33 +103,32 @@ static int test_signaling(void *arg)
 err_free:
 	dma_resv_fini(&resv);
 	dma_fence_put(f);
-	return r;
 }
 
-static int test_for_each(void *arg)
+static void test_for_each(struct kunit *test)
 {
-	enum dma_resv_usage usage = (unsigned long)arg;
+	const struct dma_resv_usage_param *param = test->param_value;
+	enum dma_resv_usage usage = param->usage;
 	struct dma_resv_iter cursor;
 	struct dma_fence *f, *fence;
 	struct dma_resv resv;
 	int r;
 
 	f = alloc_fence();
-	if (!f)
-		return -ENOMEM;
+	KUNIT_ASSERT_NOT_NULL(test, f);
 
 	dma_fence_enable_sw_signaling(f);
 
 	dma_resv_init(&resv);
 	r = dma_resv_lock(&resv, NULL);
 	if (r) {
-		pr_err("Resv locking failed\n");
+		KUNIT_FAIL(test, "Resv locking failed");
 		goto err_free;
 	}
 
 	r = dma_resv_reserve_fences(&resv, 1);
 	if (r) {
-		pr_err("Resv shared slot allocation failed\n");
+		KUNIT_FAIL(test, "Resv shared slot allocation failed");
 		goto err_unlock;
 	}
 
@@ -138,24 +137,23 @@ static int test_for_each(void *arg)
 	r = -ENOENT;
 	dma_resv_for_each_fence(&cursor, &resv, usage, fence) {
 		if (!r) {
-			pr_err("More than one fence found\n");
-			r = -EINVAL;
+			KUNIT_FAIL(test, "More than one fence found");
 			goto err_unlock;
 		}
 		if (f != fence) {
-			pr_err("Unexpected fence\n");
+			KUNIT_FAIL(test, "Unexpected fence");
 			r = -EINVAL;
 			goto err_unlock;
 		}
 		if (dma_resv_iter_usage(&cursor) != usage) {
-			pr_err("Unexpected fence usage\n");
+			KUNIT_FAIL(test, "Unexpected fence usage");
 			r = -EINVAL;
 			goto err_unlock;
 		}
 		r = 0;
 	}
 	if (r) {
-		pr_err("No fence found\n");
+		KUNIT_FAIL(test, "No fence found");
 		goto err_unlock;
 	}
 	dma_fence_signal(f);
@@ -164,33 +162,32 @@ static int test_for_each(void *arg)
 err_free:
 	dma_resv_fini(&resv);
 	dma_fence_put(f);
-	return r;
 }
 
-static int test_for_each_unlocked(void *arg)
+static void test_for_each_unlocked(struct kunit *test)
 {
-	enum dma_resv_usage usage = (unsigned long)arg;
+	const struct dma_resv_usage_param *param = test->param_value;
+	enum dma_resv_usage usage = param->usage;
 	struct dma_resv_iter cursor;
 	struct dma_fence *f, *fence;
 	struct dma_resv resv;
 	int r;
 
 	f = alloc_fence();
-	if (!f)
-		return -ENOMEM;
+	KUNIT_ASSERT_NOT_NULL(test, f);
 
 	dma_fence_enable_sw_signaling(f);
 
 	dma_resv_init(&resv);
 	r = dma_resv_lock(&resv, NULL);
 	if (r) {
-		pr_err("Resv locking failed\n");
+		KUNIT_FAIL(test, "Resv locking failed");
 		goto err_free;
 	}
 
 	r = dma_resv_reserve_fences(&resv, 1);
 	if (r) {
-		pr_err("Resv shared slot allocation failed\n");
+		KUNIT_FAIL(test, "Resv shared slot allocation failed");
 		dma_resv_unlock(&resv);
 		goto err_free;
 	}
@@ -202,21 +199,20 @@ static int test_for_each_unlocked(void *arg)
 	dma_resv_iter_begin(&cursor, &resv, usage);
 	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 		if (!r) {
-			pr_err("More than one fence found\n");
-			r = -EINVAL;
+			KUNIT_FAIL(test, "More than one fence found");
 			goto err_iter_end;
 		}
 		if (!dma_resv_iter_is_restarted(&cursor)) {
-			pr_err("No restart flag\n");
+			KUNIT_FAIL(test, "No restart flag");
 			goto err_iter_end;
 		}
 		if (f != fence) {
-			pr_err("Unexpected fence\n");
+			KUNIT_FAIL(test, "Unexpected fence");
 			r = -EINVAL;
 			goto err_iter_end;
 		}
 		if (dma_resv_iter_usage(&cursor) != usage) {
-			pr_err("Unexpected fence usage\n");
+			KUNIT_FAIL(test, "Unexpected fence usage");
 			r = -EINVAL;
 			goto err_iter_end;
 		}
@@ -230,40 +226,38 @@ static int test_for_each_unlocked(void *arg)
 			r = 0;
 		}
 	}
-	if (r)
-		pr_err("No fence found\n");
+	KUNIT_EXPECT_EQ(test, r, 0);
 err_iter_end:
 	dma_resv_iter_end(&cursor);
 	dma_fence_signal(f);
 err_free:
 	dma_resv_fini(&resv);
 	dma_fence_put(f);
-	return r;
 }
 
-static int test_get_fences(void *arg)
+static void test_get_fences(struct kunit *test)
 {
-	enum dma_resv_usage usage = (unsigned long)arg;
+	const struct dma_resv_usage_param *param = test->param_value;
+	enum dma_resv_usage usage = param->usage;
 	struct dma_fence *f, **fences = NULL;
 	struct dma_resv resv;
 	int r, i;
 
 	f = alloc_fence();
-	if (!f)
-		return -ENOMEM;
+	KUNIT_ASSERT_NOT_NULL(test, f);
 
 	dma_fence_enable_sw_signaling(f);
 
 	dma_resv_init(&resv);
 	r = dma_resv_lock(&resv, NULL);
 	if (r) {
-		pr_err("Resv locking failed\n");
+		KUNIT_FAIL(test, "Resv locking failed");
 		goto err_resv;
 	}
 
 	r = dma_resv_reserve_fences(&resv, 1);
 	if (r) {
-		pr_err("Resv shared slot allocation failed\n");
+		KUNIT_FAIL(test, "Resv shared slot allocation failed");
 		dma_resv_unlock(&resv);
 		goto err_resv;
 	}
@@ -273,12 +267,12 @@ static int test_get_fences(void *arg)
 
 	r = dma_resv_get_fences(&resv, usage, &i, &fences);
 	if (r) {
-		pr_err("get_fences failed\n");
+		KUNIT_FAIL(test, "get_fences failed");
 		goto err_free;
 	}
 
 	if (i != 1 || fences[0] != f) {
-		pr_err("get_fences returned unexpected fence\n");
+		KUNIT_FAIL(test, "get_fences returned unexpected fence");
 		goto err_free;
 	}
 
@@ -290,27 +284,32 @@ static int test_get_fences(void *arg)
 err_resv:
 	dma_resv_fini(&resv);
 	dma_fence_put(f);
-	return r;
 }
 
-int dma_resv(void)
-{
-	static const struct subtest tests[] = {
-		SUBTEST(sanitycheck),
-		SUBTEST(test_signaling),
-		SUBTEST(test_for_each),
-		SUBTEST(test_for_each_unlocked),
-		SUBTEST(test_get_fences),
-	};
-	enum dma_resv_usage usage;
-	int r;
+static const struct dma_resv_usage_param dma_resv_usage_params[] = {
+	{ DMA_RESV_USAGE_KERNEL, "kernel" },
+	{ DMA_RESV_USAGE_WRITE, "write" },
+	{ DMA_RESV_USAGE_READ, "read" },
+	{ DMA_RESV_USAGE_BOOKKEEP, "bookkeep" },
+};
 
-	spin_lock_init(&fence_lock);
-	for (usage = DMA_RESV_USAGE_KERNEL; usage <= DMA_RESV_USAGE_BOOKKEEP;
-	     ++usage) {
-		r = subtests(tests, (void *)(unsigned long)usage);
-		if (r)
-			return r;
-	}
-	return 0;
-}
+KUNIT_ARRAY_PARAM_DESC(dma_resv_usage, dma_resv_usage_params, desc);
+
+static struct kunit_case dma_resv_cases[] = {
+	KUNIT_CASE(test_sanitycheck),
+	KUNIT_CASE_PARAM(test_signaling, dma_resv_usage_gen_params),
+	KUNIT_CASE_PARAM(test_for_each, dma_resv_usage_gen_params),
+	KUNIT_CASE_PARAM(test_for_each_unlocked, dma_resv_usage_gen_params),
+	KUNIT_CASE_PARAM(test_get_fences, dma_resv_usage_gen_params),
+	{}
+};
+
+static struct kunit_suite dma_resv_test_suite = {
+	.name = "dma-buf-resv",
+	.test_cases = dma_resv_cases,
+};
+
+kunit_test_suite(dma_resv_test_suite);
+
+MODULE_DESCRIPTION("KUnit tests for DMA-BUF");
+MODULE_LICENSE("GPL");
-- 
2.43.0

