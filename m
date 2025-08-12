Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DF3B21B7E
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 05:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D3FA10E082;
	Tue, 12 Aug 2025 03:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="QtEpT4uS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYDPR03CU002.outbound.protection.outlook.com
 (mail-japaneastazon11013050.outbound.protection.outlook.com [52.101.127.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8815610E082;
 Tue, 12 Aug 2025 03:16:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LSt45Vkw4xO9t/9PwiNltOnN+CD4Gy8qyH8aLxTNIf0XgifC3yvQtrd7o4L4gbNtWW5A6pi39ptBvFbPGJeYy+WaR4/hIgxT4QdeibdjXdQkH8YFhrJKl1Hxrb76loS6P1zVII5p/g8mD0HXZzF7q0fsL6lvnluIhIYYbMeENy4Gb9R0aiErVarHCwIeU8iCPNsGxhHrBwKn5furIhkRsTi02Zl5frD3T4TrDmGhJTks/CCWboexE2G8NgWWx6wOURxrGAIX0I8W9jz2Oha6RlB7CuZiNzHA0blPIWwi8nFiZ/VCsTQvLfSHoRPQ6QVu2os0yLu5ShFbiBIye3UUOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPZWN8+R8/VNfvgutRpLSSt5lz9g1zud+F7zBfhHfQk=;
 b=KLF7z7Z/BqfruKprv1WKJAGHrontErr5nxEuCyyektInZ+2Bu2mvk94ttRQ46ozPU5VKSwr65PwRUcTLd6YNqCtUyN/DB9Wgs/OiR91iBONKqqsdFpQKdiW8xGnQIGADWAK7MUxYa56rT8r8WRaacO6SYLfO8wuYyglkeu13sx9LSdvLKXKkHrP6EU+7TANNCOybNdfvO6+N26dC0n2UqH/yi6bqpXgAqCnkm0tc1SlX02B52oPBmn/wdgCD4MH1JX9P819cMxivU0K/l5qdZSxUOQU64q/MApzK5DKNBr/A3DjSCwUwjMLtnpubuGxgi2v/sP5oNQsY3lcy8WHBaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPZWN8+R8/VNfvgutRpLSSt5lz9g1zud+F7zBfhHfQk=;
 b=QtEpT4uSRvLP6nlIDuy3OIyYI32hsEZoNZcxaL2LKFndSrnePDbbs5mZpA8hv0bUxQGxIys34NmqjVQiNWRe5zcVjbZdf3ArJe8vnN+kCpIgymmFVAnzflQKAvHn3e3z3SiwOOhOClyLWZGzdg4wxyMoXqYClnJWQOjzo7iSGApRH2cdgAC3p4y7PhZOfBbYvayGwTpm1H1inxOJf/3XVL0sitYUZznENLBgqMPnNWwR8Rx55njF/BRFbs8Y/+z1Kxdd9mu/6kwRxODskHigQVmq4c0d6bc3hPXjRKN0lsyeyf8UHtlINdzDhrvuQZ6F/SoP8IxKHPF2gPjqqP/SwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR06MB6020.apcprd06.prod.outlook.com (2603:1096:820:d8::5)
 by KUXPR06MB8097.apcprd06.prod.outlook.com (2603:1096:d10:52::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Tue, 12 Aug
 2025 03:16:14 +0000
Received: from KL1PR06MB6020.apcprd06.prod.outlook.com
 ([fe80::4ec9:a94d:c986:2ceb]) by KL1PR06MB6020.apcprd06.prod.outlook.com
 ([fe80::4ec9:a94d:c986:2ceb%5]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 03:16:14 +0000
From: Xichao Zhao <zhao.xichao@vivo.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Xichao Zhao <zhao.xichao@vivo.com>
Subject: [PATCH] drm/radeon: replace min/max nesting with clamp()
Date: Tue, 12 Aug 2025 11:16:03 +0800
Message-Id: <20250812031603.463355-1-zhao.xichao@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0316.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::9) To KL1PR06MB6020.apcprd06.prod.outlook.com
 (2603:1096:820:d8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6020:EE_|KUXPR06MB8097:EE_
X-MS-Office365-Filtering-Correlation-Id: 65816263-ac4b-48da-f565-08ddd94e9813
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xHGhmlQOWC1TEgNKM+T7FeWrX8U0zs/d3Kxg1csXqu7v1CDhrY+2+jByFBuh?=
 =?us-ascii?Q?JqiVi64KeoCuUwK9gH24xsPrcEObJ0g493PunnYLVBSjfgyufpcig9mrqjx4?=
 =?us-ascii?Q?Gg1T8Xc6ov3g19g50QlGs4p4s1VIAl7VUk8qwHWqj5O8atQscCjao39nOqwp?=
 =?us-ascii?Q?cM1XV+JwMLzpBk3Heu+2rUUkbhG5XyrXXrh3yvyWrhafatmlc27VpR9nDs3C?=
 =?us-ascii?Q?3y8HnQkHosJrVd7aFHeApT3LRtlulohIMdR9+0+rbf/Sq8FrJuneT32+IDyR?=
 =?us-ascii?Q?cfGfuRlZ/ZqosTKELQD+lI71Rzwq2P6+AZT73Rxd4Fzcijz2TXkmKT8zlSB/?=
 =?us-ascii?Q?1vZUyzXrnW4jau3MgO4QKTGdjktzVI7VltezP27fFEemsWSc8eBBQu/uU0GL?=
 =?us-ascii?Q?pRS23j2TFqW4Dsr4hN3+31adg2txpYTYy5HrDDUyAJrWNEDMzSl8UdMvm6ya?=
 =?us-ascii?Q?Jm8/W6+S3wJkxdGqLxQHphPQ9sqy9mZQ0hCYeeVExjVfpTEEh6hPAkLP2xu0?=
 =?us-ascii?Q?866WaQP/3zZWDxpVpfQvRrJGCANA+U6AuVen7AU/VR0jBOwix26oTz28bgsg?=
 =?us-ascii?Q?Pgd8UyuEYHSiA5HcMv4mPojZRYogHK75SCpL1vu6zyCPuwLICYooF8KAH/Kt?=
 =?us-ascii?Q?ZRns9Vp9EcEXjWrPtnHW5XIzHFymvqpS8pC8FMrwJoYWgFgouPANdy23PlmK?=
 =?us-ascii?Q?9U5zaz1Z8x+YAapkIflaVkklBlKALBYCrAAw2BA40r4ccywyRScJOHZd0hgU?=
 =?us-ascii?Q?oq7sfqAK0BgzNgok5XnJEmbKkImie0Z0cZeBUHoblSTkvaHPMETqLVG8/BZN?=
 =?us-ascii?Q?MTUPoHjGJ4ohXilTn0la5JStcj48BvbHjsEhzJP+zuv78Bm8TueVgaKqkC77?=
 =?us-ascii?Q?DV9kMGDO7N4FP8P7J7mK4Ue3zHVPJcZ0tED3MUXsyxE6yNlVME5dEm7+/lxK?=
 =?us-ascii?Q?t+gulY4m417PbzL1DG3ppxv5Y7Jf7qcHS3CyKWIr1qrS7yBOt3JYHK5p/ZMm?=
 =?us-ascii?Q?MYpdw9GGtgOkbGbxYqT0yZKHcIEPnOK8rg8MMLWsbWvSCzq9/W449cCA3uFe?=
 =?us-ascii?Q?/iWokyIPV2mCWBjEfKdxZElLuoqp9igm7zwDyoBNHVHPxOD6Kql3XqKpdgbX?=
 =?us-ascii?Q?FUZ2O52upKHwgZ7Rt8Z0KSARW7Nm37o1FSm5yWWyxpTIHfFN/b1FiJ36QOMU?=
 =?us-ascii?Q?fSQeNhMe67EFWHlNUse5VmZRSaYqXLCHl/co5bc6A/rUs+39vhF3T4bbEPch?=
 =?us-ascii?Q?+XnpyZc1Fg6ZbZ7bdOySS9kgkzK6kfOB33mFr8xO8M7U6wxlgA08Nnkz+8+d?=
 =?us-ascii?Q?vK75AxqJ8vNsBLABddgO75ufRQ0oEC3LvHlP1V2IafMHCCPuzSKeAIetE8Lr?=
 =?us-ascii?Q?iUw4XilqvrJFGdAQtpYfxrsccoGynY8lW9ZwgUmyd1ZFDBZomuUJMlPTjSew?=
 =?us-ascii?Q?7vCG3X1PM1EF9bNlxgOyODu28QQ7djqPpW7bvVjK3uJjQSAL0oB1zg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR06MB6020.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dXjoFPc70wbOiy0vUtWs8q5miEIJn93N7okHl6CoaICTF7IEGZJhVpv8Gg4G?=
 =?us-ascii?Q?3Gl0q0Jt9dORiQ2qPmHoF2No2HTmzjFZQQTvvoUlx4MqfNKEbcqCBUugJfmT?=
 =?us-ascii?Q?bFh81BOh2Aq/Si9ucghoet5mDrmVBKfGcy+bd7W1za8Ca8KHncnQ3g8RqJsn?=
 =?us-ascii?Q?m3VRHn6963CyMLqRrBownUXcAAj2ItX02ALU1AzKnt7Si/eGmfuwsr+FZS/U?=
 =?us-ascii?Q?V5TXCtAX7oevZ25+VowVKCKUFYc4ytjoEf11fJ1ohPP+D2sw/z7HmdOxuV1R?=
 =?us-ascii?Q?EcR3RHfJaMayIH0VCSJdPjTMAwubNvwLtFe787ghP40NcZhcwEHv/RyCG3sV?=
 =?us-ascii?Q?ImZ1iSUDwsEEHvqcAy54LNFhYOYgMc/TCDI/tWtv2B7SBySgI+lJ4jJUXbHA?=
 =?us-ascii?Q?NMiYeJ6WQ5WoT/hrUryR4Op7ltiBp/qidUtI24WkVFXOh8l9Fagr0sgT8180?=
 =?us-ascii?Q?c+q1gxORXpeQszD+hncPS2GCEVSTn/MJxrEC0JUQzwf9PHDHVdApc/JkbK2w?=
 =?us-ascii?Q?EgehNhesY0FEI9cjlCZcY7x32Wykpdgo0vbUpKVp3AIVI+0F3Z+l9thJ4vi2?=
 =?us-ascii?Q?t+EEWFhI37dXeU+FqfaTXbt+Yh8kZHt+6jLHYEkHvM0ckcPAofnPY9RLc4ZN?=
 =?us-ascii?Q?FUMKS+UcUjA3Nu5MJEv+xI6OugLT3EY2Q496iYFNM03DWRCaDZViKKyNL6HH?=
 =?us-ascii?Q?kOnfMNATDZTit8fqEsfSPN+VIoGrEhxM+9BOx/xghH0Dojtv19XawKiVpWrn?=
 =?us-ascii?Q?DeWyps95vSzlHM0es4s92H9EKJ/0GBB2ZXd+BY1UkYNvf8TX1dOoOL7Y6n/G?=
 =?us-ascii?Q?j3Q4w0e7qN/4aGqq8zHV+f+mHPnDdqa6QJ4Agpt+leb8qz/jo4x2RuLC3xNP?=
 =?us-ascii?Q?tisAtmKz57NCJksN+9Nu8mUyXSRcZF3FIuVnjCHyG88+Vy5B9P2/y471Ijz0?=
 =?us-ascii?Q?kYBx3UsbLNrGnmocj25pzmw6SEG1TewwaQctT+vVj+rcZjg1E8ZzxpEx6Dlo?=
 =?us-ascii?Q?YjWeiyHvfiGNv2YSPUuRzrt1VgRk5JAtABeUBcQEbI7asWysV5M2aGEj2uCC?=
 =?us-ascii?Q?UCR/Nxe7X6ev7yr9Nd0mKa9MKA4RU6VXwGwzZ7KJY1tQKL7wrifR1kA0Me6b?=
 =?us-ascii?Q?oCuTfR27NOaWW6PNRUMtu2LgyovCl8fU7lnUac76Anrp4186WzImtjssfJQs?=
 =?us-ascii?Q?8xcoNZZNzLh9r4p/kiBxTkngUzg+pygq0OMd8XT8v6gd+t+MlS5qCSR9y5Wo?=
 =?us-ascii?Q?q8Vn1Ae5DV6dlQaGje3cWYqUC4K1W37gBk2D7UoDOCuOEl430/58zR9SVyHN?=
 =?us-ascii?Q?k8qUs6dVHkkUUgrVvztdhG3roJkTTV6OV7R3ly3vaxO5ujLerO4nr/O9Bk9T?=
 =?us-ascii?Q?vAxHG/goGSTPEt0t3qUW6CZ+thztLwFKml2pG1xyv7PMDLMgTMNx5kwQn+TX?=
 =?us-ascii?Q?FMmUTPJbBMXVl/kq+r8MrZEd9BBJzYif+bQ/0Bbku5UoFNPtZdH7fdmoZ1uJ?=
 =?us-ascii?Q?8jW1GCA93RPsg4omrBqiOCH6Osvy9JajDhX3FScsEdz/iT3t0IdtetywGTWR?=
 =?us-ascii?Q?A1HH35+aBe1r/ZAFhSaiweh8VyTAGj8I6iKJAxf+?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65816263-ac4b-48da-f565-08ddd94e9813
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6020.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 03:16:14.0671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /M/ElFfGOT7P08Jfa4gC4ezI0BHWpOIWxc6m+6emwmA0BdzVkwdTFkzLaU8Mq0WBiyTeSnqfOGEMGQz2q9wcOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR06MB8097
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

The clamp() macro explicitly expresses the intent of constraining
a value within bounds.Therefore, replacing min(max(a, b), c) and
max(min(a,b),c) with clamp(val, lo, hi) can improve code readability.

Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
---
 drivers/gpu/drm/radeon/radeon_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index b4bf5dfeea2d..d66c1a30df95 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -926,10 +926,10 @@ static void avivo_get_fb_ref_div(unsigned nom, unsigned den, unsigned post_div,
 				 unsigned *fb_div, unsigned *ref_div)
 {
 	/* limit reference * post divider to a maximum */
-	ref_div_max = max(min(100 / post_div, ref_div_max), 1u);
+	ref_div_max = clamp(100 / post_div, 1u, ref_div_max);
 
 	/* get matching reference and feedback divider */
-	*ref_div = min(max(den/post_div, 1u), ref_div_max);
+	*ref_div = clamp(den / post_div, 1u, ref_div_max);
 	*fb_div = DIV_ROUND_CLOSEST(nom * *ref_div * post_div, den);
 
 	/* limit fb divider to its maximum */
-- 
2.34.1

