Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8DFB171C9
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 15:10:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3BAA10E476;
	Thu, 31 Jul 2025 13:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="TTeDsStb";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="TTeDsStb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013017.outbound.protection.outlook.com [52.101.72.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC8710E476
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 13:10:08 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=AVUWTKDwihPGPfDwW/uJx4RxXHalQEODBvPX/G4L451EhNA2bYX9NVbdKYR3TlvH7w31dGuu4dpvHutRVCxOknqG7aMZdHB4C/zDQShaGgTd6RhU3Pd4F1yxo+/kTVjYZZEzeuMTC1Q4g8s7DyEcc0vjPD7yLEItLs8U3ftLi7YwcBR6RnzA6rU8RMMUIgvy0Ho0W0ezdNu7OP9ENJkOWRDXCuQXQFdaIFeFYqYp789Kib0OoJG/P065cfixVmro9fxVJ2WJX+DFYHcbBxxnNawSChzPru2rwhNJ9QhNY1yLlC8agNVekvcq9VJnrriOFAzQiuy1B7xYxjrQQ8dBcg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imYSu4OCRV+Ty91ol19L2Siy+f/OhXEgm30qms17p9A=;
 b=D/C83MEh/jLf4C8IXq3d2LF3xa/uDNYH8iW20v3YTE4XurjvfKD0IhS2/yFpmiXoMM6X1u6l7PJQfZJHbHolgfAVolP+13SlktRRz/Vgd84mmeQiyCdsOdKVE13Y/1naxPMh7DPUx6pm2hlixMt4JdjH/qdmURtwLs+mJTViy/kind96CX/S4Rr/kO0KYD1uOh0qzmM+4GD5h+bSvybjaa8Q28zaVZ6rpooJYqBeFTzuxOaVdHhKJwY0eQOEL7B9QDLISyCYTwYZCOcSbLgbAFYYgfwMBzV1OzCk/W+bOTJL7QrrZKz5P0kmkv+M+4zCg9pNSgxHgqjKWE/vh9zUzg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imYSu4OCRV+Ty91ol19L2Siy+f/OhXEgm30qms17p9A=;
 b=TTeDsStbHmFzxtpNciDayEJw/2b6dWmguPHH8k9kYLEBXoTZOlGwgsSx2BNxDcTYL7TI75+Ffv41indb/vBTkhd0kbh+Tzc06/cOTK9qPtAZw67x9Ctpspr/tKqno6wQgj6ofZgR1QOZ6zHWGfjUdeOtlZ41/Atvdojb1EEHv7Y=
Received: from AS4P192CA0028.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::13)
 by DB8PR08MB5385.eurprd08.prod.outlook.com (2603:10a6:10:119::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.13; Thu, 31 Jul
 2025 13:10:04 +0000
Received: from AM2PEPF0001C708.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::ac) by AS4P192CA0028.outlook.office365.com
 (2603:10a6:20b:5e1::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.14 via Frontend Transport; Thu,
 31 Jul 2025 13:10:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C708.mail.protection.outlook.com (10.167.16.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.8
 via Frontend Transport; Thu, 31 Jul 2025 13:10:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KB2aG5lF8Dn4L8T/Dz6Yz40YeikvGzNb6up9LrMok9UM8e7HDlqsGj+2/NX1YzuBXxPq9XrNtPjNzksWR/NIiQjWYMfYz+RbnjopWg0d2B9fmoR5VMCWF+x/WDKUJmSZU6ddwap5aq9nvXcsTO+aWcH4E/E+sBB5ymOwy/jV7IEYFONm37xnuPue/RgcG038MGUjMbjy5aodui+EQft0qRrtqbT6KDB7E4YDF7+MCcd3tMrhquJJaTfEBcI3JfByFGvjU00TjjjeTXOOFTatW5ULoFLRRL/+jRQPTOMlBTE5zkyomUwRKUSKSuXh72UU065S1JF17oHDfu+FdjiTWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imYSu4OCRV+Ty91ol19L2Siy+f/OhXEgm30qms17p9A=;
 b=CnZXSeNCJK2yA6nrAJvBvL/wDb1klVB3AGDhv1gNZJItSHWUHZD7sDEP1J6cwNRsvVZio74uX1T6U1S2juwM9MZCBh+wEYva/M+EvM8/vKW2pp4rMqog/XIogY7/wJT5hKQ87mv01es1juu82qOCSfwWk/2DttrzOn1d4xT5gwBYvBOQcqHerHhJSRvDNbMyX677uWfYyHpxlYvUQZfMmUZxcUj5cwllSluuvYVVfQEJjknonb7zisUEEaXRdmGVDqhmskyug25hBQ8ApmCqDT3JnaxjpojPBO7iKbqjoU36qnseHjuC1hjUNKKRr3Xqeyz3y+fGblj3iHGIAQpddg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imYSu4OCRV+Ty91ol19L2Siy+f/OhXEgm30qms17p9A=;
 b=TTeDsStbHmFzxtpNciDayEJw/2b6dWmguPHH8k9kYLEBXoTZOlGwgsSx2BNxDcTYL7TI75+Ffv41indb/vBTkhd0kbh+Tzc06/cOTK9qPtAZw67x9Ctpspr/tKqno6wQgj6ofZgR1QOZ6zHWGfjUdeOtlZ41/Atvdojb1EEHv7Y=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS2PR08MB9126.eurprd08.prod.outlook.com
 (2603:10a6:20b:5ff::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Thu, 31 Jul
 2025 13:09:25 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8989.011; Thu, 31 Jul 2025
 13:09:25 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 Dennis Tsiang <dennis.tsiang@arm.com>
Subject: [PATCH v2] drm/panthor: Serialize GPU cache flush operations
Date: Thu, 31 Jul 2025 14:08:55 +0100
Message-ID: <20250731130855.4068574-1-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0007.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::19) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS2PR08MB9126:EE_|AM2PEPF0001C708:EE_|DB8PR08MB5385:EE_
X-MS-Office365-Filtering-Correlation-Id: a1b480e8-5b0e-4b4f-af3f-08ddd0339002
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?qBk3jyKtUjN4IPIvf3uFPbb40ifq8InlmHsS1u4WhENdFsyloRu01vDoEPow?=
 =?us-ascii?Q?05MSbqsE5rS+rXQX9gqzCfHU5mGBHUG/A7C3nFmUYFL7oX1aZQ9dP6ciJaqN?=
 =?us-ascii?Q?htAelJjzR42yZUpPHJnpbJz/0OaaxHHleiXwkTXSfLtKc4O0eHPb2ecQ0dFp?=
 =?us-ascii?Q?L6RuUWJse9glwWYBYNC7Dt3dGQ8lvyz+JUB5RMSUEaPSzTuxnGNxCC46r0xe?=
 =?us-ascii?Q?wGXYlPiQLio+oK6KgASWx4y3mJ9rdnPJixDSH434ceweKq6sdbB3dsxYNv3V?=
 =?us-ascii?Q?YPyS/ZsRPpzbgL2UNQjeUOzaM2z9VQ2hLs5dZaN7N7VrU4DxQoVMFn9+p4o1?=
 =?us-ascii?Q?51gl150GbWQg4Zrx9uZTHrjA7frEt+qDbGn4S0kJ4QDf30LaLHZJv8B29GRP?=
 =?us-ascii?Q?3lS0pxnJNoEnZsI1Tfkdd9C/i7ZeGcKyh/+wrrDZPILN/YdKzRBppClRJBsI?=
 =?us-ascii?Q?HJkR4XVbuqLNJNFdPG8ihyvZcskLT9QwMdxpIrCSGzcG3f7f2KlsNg0agbRi?=
 =?us-ascii?Q?RJ1YMW/H9DVy20V5Y6nEwjYefBz7tHXWpebea7H7FJfq1azJRBdLm9OtRcu+?=
 =?us-ascii?Q?QURYyzVYCEa4gMkWosTCNvGvO59HozViA9tue7e4+lwt4HJgrryzdOpLTapg?=
 =?us-ascii?Q?XhaKOKpFVVrokB7aqjqEXpjcPrwpGlYW4onCKLNeyiiHRrYnedPnW5JiC8I3?=
 =?us-ascii?Q?0KjH7Ha1HAtY3otzw51ulvyxQq18vsLzWCndJLMBf90/UbMPkjbJQ0VjLXj7?=
 =?us-ascii?Q?o6HokQ+hEjKUwMqlhUbJ5VLB3gjeGcBYIwxcaTMkhGdNpILoVT4BY8K34WdT?=
 =?us-ascii?Q?u6KgUYvfRbLO09BaOTFtbDY5L/f0Eh3nV3NI59bmf60L2HWlTvD+QdtzTJ4U?=
 =?us-ascii?Q?YVwq3BApbtAR4fuKGpuaEDcR2tsIXfwMwcjMn6BiliNBnO+CL/fGtyUQXZlF?=
 =?us-ascii?Q?czjItm+kBcacxbN9KQtDs+0Zi0zvFLbWncBgqIh+GMmL7W+KUjZlYDt3xIvy?=
 =?us-ascii?Q?ji8lrtlSgfDKCB9OPgChfA2oVnVoQcv4OnkrY24eVtILTN4uKVKVAiak/IPE?=
 =?us-ascii?Q?R9+y0txUeC48BcQ5g6oRGjpZJoCPJ6UpLjPDLWPWuUkouMS6UXc2xiO3Eebx?=
 =?us-ascii?Q?NCh+FKLqgEdChtQfiiyoo+t/gRgYsiR6/NfbcwLxGXUL3wju/hgiKGSYQXgy?=
 =?us-ascii?Q?S0OHMpqKY9ik0ZYjK8XvJXldzVQh5jAuMB2PwPUFtkRiGcEnqiWY1DP6X7kL?=
 =?us-ascii?Q?OPxPd90g1h1yt5GCuTrO9m5jcBtu0isOEt1YyxfWPPzA964HHS1bRV+f499H?=
 =?us-ascii?Q?b98c5gr9OJ9zT7uU+e3zyyvOOyUpOEES7COMH2gqQRoSYlmERP2+RmK1Wq4m?=
 =?us-ascii?Q?4aHSCoiiugiI8qf+tgkJHhwfWSg5C6CEbuaqwxLjAbwbsqYT6WcoQNVa0R7k?=
 =?us-ascii?Q?LljxEP/nZgc=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9126
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C708.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 12b22f85-4e7f-41d0-a66c-08ddd0337942
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|35042699022|1800799024|376014|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?noc4zem4oeZEqXux3zZlztVbVkE94hRkCFCB23Y/euqixqGVRBJVrmmoxiRb?=
 =?us-ascii?Q?0i9jNrWnleUB7rbFHbsFcMHqEDdAnTmM68OhIVBDspzhkr2wfhEKIm3XfK32?=
 =?us-ascii?Q?SbtVy4QoF7qc77Edh9hMRt1OiZLL/aGN88RaIbB4fl0LP4ESt2pA1DsQQUMg?=
 =?us-ascii?Q?1T33hRGhPkJmvVBrJnMjUpKi45AoVL5aSO5b/9yZ2ltyTaec9nvrJe9gl2DZ?=
 =?us-ascii?Q?edK/dZIpG4BGB6GzU59hvcmByysG+ehNxMAH24EqJYG3DHFBGJokl4T1oxN6?=
 =?us-ascii?Q?Ham2CFx9koMHrbCD2NhgF1ZeK8CQzkHHyWhML39fnjwCmh3g96G6NqCqm/ZB?=
 =?us-ascii?Q?f5qUPk9fqK6bjpOyc3l3MzKgMCA+DXvLgUFSKhQW3/uFPDmCMSdlhVHV64Nz?=
 =?us-ascii?Q?wXS8DzFH+o67Pex0DVxNYKb8+jKtmvfLp68HLiQ9kzLSAB7jgUl6ChGILbpp?=
 =?us-ascii?Q?HPWHF3a933T4XGxhFMEOoqsRwYB7u5FmKMeK6ekv2iFuPTHiQycEI7IpTlHr?=
 =?us-ascii?Q?WmHy/DGzhTCttF0nJITkC+//z0050/FxZC0G9kHZlr5zZaf5HPo7uA7XO8Iv?=
 =?us-ascii?Q?B4AYdUbYXgOJPuQx9DAsMWjYyznNdPNqsEkZNUYPDRSnBqzkPUejM+HmAE1s?=
 =?us-ascii?Q?9y2n6SvWrBHrnFaQC4TqQh+bsf7EkKNYW+8qjrtCO1926JsxeubE2NvDwcrY?=
 =?us-ascii?Q?T/FUpap2iVGG2nzNyFUnh0/VZ8TX6RWKAH2VsZjdlPFh5BJrQG4xtvrFdzvk?=
 =?us-ascii?Q?Xh1nKecagI8p6PV30Bipeo75aAZzlGb/dbo3dgeuL39zsaGDFuhqBa4RhYFJ?=
 =?us-ascii?Q?HQMvLeJSGcOK6XqP9gkfWzscOxAAKCNg3r+UBHWVg2HddxRQTMOZioUKIDBW?=
 =?us-ascii?Q?IEX5EVy1choE+Uq65K2NJtGkvBQegK2bh0sMZXnno0Ro3Igl3f/2ECEIoOX9?=
 =?us-ascii?Q?R6QeQf7AlVvq3GrMM3Y9/0Ju1s06d6rG4XRzCHibMJQi4bxzmSOIm1DDQQJe?=
 =?us-ascii?Q?fyLY6tICDVcwIBkrg3mvo8Q7NgxoOf4ewJQNc0DuP6wMwFu8dcXtFovPM28Y?=
 =?us-ascii?Q?qFhlLlgxwwxpxmzwBghQrj5eUvYZhTm8x4dmataqUj2aGcR1j98ZxTB9eWJL?=
 =?us-ascii?Q?urBfmKD3pLlQFnw5FPhwlZS0eKQEgc0a4Xp6z7olQWtJYSAlVacVQ9hz9IbR?=
 =?us-ascii?Q?2NxjskNl5Fyh5LBxmdv7e7v5Qz/Rqk19SJcX7B+e37195WAf9JxIv/irMNt8?=
 =?us-ascii?Q?psktVhYu6zOj6+XXjDWNTyVNVax1fb/nicVaTSIbX7KV0Oi2u2AKPsfJzObi?=
 =?us-ascii?Q?8hlbc+3Wy7/w/nxULGDz0Qf7cCPHZdiCBReAoy019PNOlEf8L8kqMuOFYWbm?=
 =?us-ascii?Q?9an4G8uxtew5SkAXX6Ng1fquw8ubHmFwfTZtX8GN7cH4l6SfTRUojWZ39QqU?=
 =?us-ascii?Q?hk1sSXSNHWRysBmINjJFgDTnnUNwSHhjKS8Ayq5QYH40YZFhaC4AacjPGqeU?=
 =?us-ascii?Q?CT9mw9+loUhXC0PqMvu0axCa9Z/MUDkBTfyxuQCyONvq67+rg8S+Q1lfKw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(35042699022)(1800799024)(376014)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 13:10:03.3637 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b480e8-5b0e-4b4f-af3f-08ddd0339002
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C708.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5385
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

In certain scenarios, it is possible for multiple cache flushes to be
requested before the previous one completes. This patch introduces the
cache_flush_lock mutex to serialize these operations and ensure that
any requested cache flushes are completed instead of dropped.

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Co-developed-by: Dennis Tsiang <dennis.tsiang@arm.com>
Signed-off-by: Dennis Tsiang <dennis.tsiang@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
v2:
- Added missing 'Signed-off-by' for Dennis.
- Picked up R-b from Liviu.
- Link to v1: https://lore.kernel.org/all/20250730174338.1650212-1-karunika.choo@arm.com/

 drivers/gpu/drm/panthor/panthor_gpu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index cb7a335e07d7..030409371037 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -35,6 +35,9 @@ struct panthor_gpu {
 
 	/** @reqs_acked: GPU request wait queue. */
 	wait_queue_head_t reqs_acked;
+
+	/** @cache_flush_lock: Lock to serialize cache flushes */
+	struct mutex cache_flush_lock;
 };
 
 /**
@@ -204,6 +207,7 @@ int panthor_gpu_init(struct panthor_device *ptdev)
 
 	spin_lock_init(&gpu->reqs_lock);
 	init_waitqueue_head(&gpu->reqs_acked);
+	mutex_init(&gpu->cache_flush_lock);
 	ptdev->gpu = gpu;
 	panthor_gpu_init_info(ptdev);
 
@@ -353,6 +357,9 @@ int panthor_gpu_flush_caches(struct panthor_device *ptdev,
 	bool timedout = false;
 	unsigned long flags;
 
+	/* Serialize cache flush operations. */
+	guard(mutex)(&ptdev->gpu->cache_flush_lock);
+
 	spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
 	if (!drm_WARN_ON(&ptdev->base,
 			 ptdev->gpu->pending_reqs & GPU_IRQ_CLEAN_CACHES_COMPLETED)) {
-- 
2.49.0

