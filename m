Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 092FD9B7011
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 23:54:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D84E10E14D;
	Wed, 30 Oct 2024 22:54:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="aU1RHlCF";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="aU1RHlCF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2071.outbound.protection.outlook.com [40.107.21.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 952B210E14D
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 22:54:43 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=MXABjEvqwzRIRS/AfBqn7JLdHQtChiQciGPtyranDvyA8xiSq5kgxo8K2bpYv/hlRtP/Ixj6x+pnoUFbEWkkkYaMhN8ndRWqAivkHHh1Aa1Lal6S2b3VlUulCOYvrVCCSh7SeXSQyHfkeXEEzUiX6Q4sE/VdJLwc83KN4KGTyjKYTR+THCw2yGLoHe7T7hNz21rzrgD+gChPgzSFXrkcBZOVX0nUpYgPjO/9lysb9kNafQIo3JUz2rIHvz1eepiMMfdZUOOkxki3iqTeOg1vvadAm+JroE9+9e7QOe0r1q67hdFGLbax33s0ZP2FzKD8+849vSW7JKoVe6Zxrj+5NQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sK4o6Tefj4JpBNHe4RLQZrUUgg5f7o5vfnlnfGnlzgw=;
 b=rgVgLXvWZPh1qOyJjd4Cflbt8yC+fhAB7ABOKw2YjDQACAesJP+Kud8il9vMNY9GvZcBNDYzfdW62Hd1pf3Dq/kAcvHfvhq+WMGU4MbTcuHiHwt0/lvGX/jFQ1W2pNbRJK9qfHdPNVx55XpP0b2jDP6OKen1SPC8KBzHih3v5+P9Ih8wzGP3gjutGO03SDkevNoMt9nlliHnf5bGWZQalYfGcH7V9KfZAhQ9W0fhhxIlF+o6mbr/x21+Ku9rvcqJx0/+c1LNOF/X+0W5uCVVWp0ApNCTpuK1m79P9x5i+WF/E2z6iFfYpdA6w6wLak7KVcED3gnQf4rjMIwVycMHVg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sK4o6Tefj4JpBNHe4RLQZrUUgg5f7o5vfnlnfGnlzgw=;
 b=aU1RHlCFbhTMmdMigIvxSpqrvd2uaz9VhRJ3iSW3jHjOiKuGWNvHI9g32Q2WV+KogPsOlrnbT9v0s/tXR0dPB5UD0ViGEBpPvoJUPGq4sEefI5ITm3uHMJVpsqTbzDJ+vgdPzWqgBYLeOQ+8ZeNkUjHmbYwHXLhmXwJeKTa3j9M=
Received: from DU2P250CA0010.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::15)
 by DU0PR08MB9419.eurprd08.prod.outlook.com (2603:10a6:10:422::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 22:54:37 +0000
Received: from DB1PEPF000509FE.eurprd03.prod.outlook.com
 (2603:10a6:10:231:cafe::5b) by DU2P250CA0010.outlook.office365.com
 (2603:10a6:10:231::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20 via Frontend
 Transport; Wed, 30 Oct 2024 22:54:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509FE.mail.protection.outlook.com (10.167.242.40) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8114.16
 via Frontend Transport; Wed, 30 Oct 2024 22:54:35 +0000
Received: ("Tessian outbound 72f4d55e3d4f:v490");
 Wed, 30 Oct 2024 22:54:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 03d1a4fc004013c3
X-TessianGatewayMetadata: SP4WAxw5ZmtqAlg2KuxKfPEFiP9Rvmb2mSdFiGu0+9pEV8pq2jET1mJfQfMsLaYF7Zs9ly82xeNJlPJhajFYBy9Xczt252vItmr5+OiD3lUV6HdEnRjqRdXC33nh0obQNJ1UyW9Cq6DKnEV5r/krDxLB5nXmbnxIg9cv9SzX8oo=
X-CR-MTA-TID: 64aa7808
Received: from Lfcbceee7cebd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0109A1A9-6CEF-4526-8C5B-03D0795D0DCD.1; 
 Wed, 30 Oct 2024 22:54:28 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lfcbceee7cebd.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 30 Oct 2024 22:54:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EAdnklYQtxd1wCpNw8EEgy3xhZAbHvXrYmLNScJEPdl4auPgZSkBJpYtqdE+Iu0zVyH1u5UpRrtiTk63VfwBF0vzc3wPQ8mhW07sSnQ/0I23WXSyo657Lvgn7wBeNaHGQmT4g/BfZ0hzR7GHo27eZEmT/HaSqEpfLWGpE5mQtp3UKx1afu3dgSN5H17OLpNQcO7THJZE4lQhYSwpSTgVr+n+oORE+qpYOwuxI2Gzejgh4AxnHfDsrJdjKTUEzovHAlORVG8thBv5Mw5JCD6CYCpWnCcJg9i/Q38k/kDuhH7S+MkeIOyKIGW7T5UCFOOBLKXZiVbiBqFPNA1TgG3YwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sK4o6Tefj4JpBNHe4RLQZrUUgg5f7o5vfnlnfGnlzgw=;
 b=VxSFNL5W8aKlRgH3APNCzYZZWkmAYKIult288UxhTyhgwA34fYnvu+Ay8tPTzrmc0ZsKBxnMBsR+OCkL+RmAzpDEAPNdDa6bPm23Hzvd9jifA9EuG1rivhKCIZ6bzYdFRGU+zWFnSN93f0RosnLB0qcmJ9g+sQyGCj6HsrSHcZefCdJ9yka1ceduIozMiAHNAUyh3NUdWf0LXRchAoVTG4mRcj0tC52Q95MKOiHtiH0u1nZI1teHGfLrb5EpE0+05BcEnhdTza02zPGHwGWFZstnuRLosqO4/dCKIxwYn3j3tswwpSuj1BRmUHwFnM+C57ZSmp8MZEUmgTABpHqrKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sK4o6Tefj4JpBNHe4RLQZrUUgg5f7o5vfnlnfGnlzgw=;
 b=aU1RHlCFbhTMmdMigIvxSpqrvd2uaz9VhRJ3iSW3jHjOiKuGWNvHI9g32Q2WV+KogPsOlrnbT9v0s/tXR0dPB5UD0ViGEBpPvoJUPGq4sEefI5ITm3uHMJVpsqTbzDJ+vgdPzWqgBYLeOQ+8ZeNkUjHmbYwHXLhmXwJeKTa3j9M=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by AS8PR08MB6182.eurprd08.prod.outlook.com (2603:10a6:20b:291::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 22:54:25 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd%3]) with mapi id 15.20.8114.015; Wed, 30 Oct 2024
 22:54:25 +0000
From: Akash Goel <akash.goel@arm.com>
To: boris.brezillon@collabora.com, liviu.dudau@arm.com, steven.price@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mihail.atanassov@arm.com, ketil.johnsen@arm.com, florent.tomasin@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com,
 Akash Goel <akash.goel@arm.com>
Subject: [PATCH v2 0/3] drm/panthor: Coherency related fixes
Date: Wed, 30 Oct 2024 22:54:04 +0000
Message-Id: <20241030225407.4077513-1-akash.goel@arm.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0389.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::16) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|AS8PR08MB6182:EE_|DB1PEPF000509FE:EE_|DU0PR08MB9419:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b5b239a-6159-48c9-296b-08dcf935d333
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?t+wCaIUS+aslJmWXRFoi/Zuy97DJJupEQ/aCipl6UIDv3zL7KHrRq+S6uHqW?=
 =?us-ascii?Q?c+WLRqifS+JUtd2jsvRAhXIxRkXOwhygwg2nkZ1Z1eUIppMnK6oC6lLSPtTt?=
 =?us-ascii?Q?Uv/3Uvv1cxjGDgGEpOxR3x1yQGErzywIItfWSm/19RyT0LIm+75HRzOwIINp?=
 =?us-ascii?Q?Go70yxgladgUdFPNrML0l/2SnNOxgLXp7fvUdNnYoFbQC6Jn9YTAL+l89FQa?=
 =?us-ascii?Q?rk1Y0mkhzewPozTzEINUJ4ci2wO7O3+7cRxBY5nu6XOItpo/5nS61VDGz+2E?=
 =?us-ascii?Q?jiUhgpfpCVXXzUjcPIff8CjjAKnbrNuq7FdEjtnmbqsQL/JMV5Wsowb9BmvS?=
 =?us-ascii?Q?271sJzt24zATte4hmOBCfznv7I7lRRJWeHZo+jqEkWfyqjOgZCI9980Y2xXq?=
 =?us-ascii?Q?1T7uFrTl7WZrvGgqaWKE3cLoXB0gQT0zMUefmhO2lsIBS10gSHYC4HVGndU4?=
 =?us-ascii?Q?xk7zXs3iDj/WvIZjI97BSRGPvM+BjoDKChVAsifFPsnhM3wmmvH2BagPTCx/?=
 =?us-ascii?Q?7+N7DtCaQv/8bBP5FRlwiQyw+vBcIKHeWHgwRbUYJKbYZxK6q8bU5ZsuD6Iv?=
 =?us-ascii?Q?9jFBIXmdpyFsJR/EQwPJVErCbvtU4kG9V3o+TO/znTjWXYfAvWhSx+pCPKMi?=
 =?us-ascii?Q?jzYm3OGotg44HzlI1sdDLwCpsKLnf/MU0oXq+R+sphfb8XMu0nDqraU1fFVQ?=
 =?us-ascii?Q?oYBcI1EefSVR4kB6MReMHy+uPjO4T95Wz2bHAIUyP02wfiT3GGDs+j6dvZIX?=
 =?us-ascii?Q?m+F45JglR7QnANnJitjoZZ5G7JPII46c9b9YHRgGL/riOE1HUN2fzijYH7QW?=
 =?us-ascii?Q?LQ88zwpBgQpga8zTZhRlwlz/xBv0tAWvAf5SsmdETLuaUQK3guuyr4LlV0tK?=
 =?us-ascii?Q?TWj5nExigFc2Ma7/iMJXUm5bXPNFzclHL4XvopOfevWH/1JiBhVVoNcJSzRR?=
 =?us-ascii?Q?Juj0e5MZINjnyJ+KfDpCBN+2BsKN5A8QPOTeYteaXU32wp8s1rkg460zekvH?=
 =?us-ascii?Q?VxXf6fpMTLyZ1NbNby9eFE2Rx2GisewG2JHrbUDML4ZyC5H49nnvQ5fC/h2/?=
 =?us-ascii?Q?uBAjyAEvoaaYgdK+S2m0HbzxTSg3I6oJ+ueB/O9N046732v8UK5sj3CEA6ch?=
 =?us-ascii?Q?FypRYU6p1CBeVqSvYwOhQvO7M0st7RoRhjuVmZj8jGH0Ja/UZ6aeapoYfNyL?=
 =?us-ascii?Q?I/EGixAK6a9BSX7YWub1MAHfFaiDw5eBnsdFUSWdN+mAVMQQizBnx/uOD1P5?=
 =?us-ascii?Q?g8ovImmfSvnbAwWUKTCiEFZXM0y+VFhLxifoIvEN8MBmF4T5rFxV+9U6njoN?=
 =?us-ascii?Q?hjTIVEIPAlYgt+tKUdcZ996o?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6182
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:415::16];
 domain=AM9PR08MB6982.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 362eae3d-6668-4cbf-070c-08dcf935cd7e
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013|35042699022; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YxWE2VKywgyRrClADv1aOK0hgEJvIAR4MhVqRdYeBnWZpMPe0cK4PokulnNU?=
 =?us-ascii?Q?TvNy5SvCYggZS8QjBoALAngEWQv9lpbHCZ2+CFZ/Jn//6dz6t8GSlb0rIlqU?=
 =?us-ascii?Q?0lz3R7favroaYQASVOSyBl32njkhCLnxFbEG3JUJWl3o9WTK9njX+Yt3XgTz?=
 =?us-ascii?Q?AC/zW9pA3oi8nIUXObYbmuS+7C+hGPLCJvxzYVo41eCEqTno22vQILwrizly?=
 =?us-ascii?Q?p1UwnW3vDsbBK/By8fLv1yZIQQAI6z3cpbJwt1o6pua1ZOu1au6q/O3iinyA?=
 =?us-ascii?Q?qOXxe522POiJkaQ7tfOmbYjOzNkIAXPBRoELRP6uS3raMGgC9I6an9S/wp/8?=
 =?us-ascii?Q?2QwNiOOBEH+ey2QHpXK8ItnRtZVNaw4RtnwOSfgN6mFPWHfWhk1jN4Ri0QBp?=
 =?us-ascii?Q?KeiA/i8PwdQWMlsx/GxoztuuOSLgmoO4JHAD1sqsg+Y52GhM9aJ7yOiMALBt?=
 =?us-ascii?Q?PhtoiMUTn8uINphL2bBI6eg0s7G0wJUj+DGZHVfqirIRZWll/Hh5WK0MF4+8?=
 =?us-ascii?Q?LOrmAOZyAqxmFDCvugy4Qrbb9BEO586GhfWzcu21wDwlG6fFZNzq1P6gLHp9?=
 =?us-ascii?Q?M2AWiWwlfC+bW3Mzi3q/4sbDSMT2i0u8sCYX79co8ZL8iviINbAlzBaCkNVM?=
 =?us-ascii?Q?V9h6GKfHHSBUQrluiMUHBzNs6c7663TA53AY7M6WhaWF+s0UfZ2dh+4TNuWa?=
 =?us-ascii?Q?UWmtmx9B9Y654u1/60nnziWPTaW7N3k1jzrXVYxjg1EoXdMC93/ca32W1MwJ?=
 =?us-ascii?Q?IacNOh+FIGHlW0LYW4sp4/T9Y23zEAZkO2e8XyA/OUrWjm/v0TjbZAtMYlU0?=
 =?us-ascii?Q?nKsk0ZEeL0uZKs/Y1QBJTD65JxCxIBJ8XFk5lAgakv+VazbJxovvkRIDw8Ae?=
 =?us-ascii?Q?wfNenudILnpQonBN4DQQ2i7cKFF1GKQACxFZQ0JHhSMss0VxshxwC8i/8UxE?=
 =?us-ascii?Q?b4Gu4Rv2/wZ33cmW1kjbc+3ADcvJ8+7j1xMwGrg6Ro/Zvykfs+sLp5wmCHTA?=
 =?us-ascii?Q?8MLwG03cDX0AeyEOnM5CdKQriYhMT1+UFWSX5KzLe6BajTOtfka5JpwX9mQM?=
 =?us-ascii?Q?Zws9OQJIdvdphErCIxU3BcAUAf18kwL4gHckTZr8unEtvA5JQOiUUTwQyl01?=
 =?us-ascii?Q?jMNmAhU7H/2llISCbfWE9YAvcfZAQujWyv5/PVzpb96lw8drV4ZGt6QKgy/H?=
 =?us-ascii?Q?FH76gvlyEKyddCIgA/bMK77Tsl5f87Vjp+QdcYmwxPbSh+wxXqWL0ex4AAHu?=
 =?us-ascii?Q?T1kezrs1naEjJ4sLyytSXcyJ0//NtQgYE8FqZaoIKehcLHhEN+uf1cE9+OVG?=
 =?us-ascii?Q?75S2zEE4gA2Hv4hHq3PKROjvVKOyHbcGhdAlkI/S6w02is3WtFmZ1tqjIAF7?=
 =?us-ascii?Q?FgGGjb8O67vXewZp4H5Qo6Ev3bhnmHoQE7/1nohcdy+8RpWklA=3D=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 22:54:35.1696 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b5b239a-6159-48c9-296b-08dcf935d333
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9419
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

This patch series contains 3 cache coherency related fixes for the
Panthor driver.
- The first fix, regarding the Inner-shareability, is mandatory to
  ensure things work on all platforms (including Juno FPGA) when
  no_coherency protocol is selected.
- The second fix regarding the coherency feature/enable register is
  required to avoid potential misalignment on certain platforms.
- The third fix, regarding the potential overwrite of buffer objects,
  has been prepared speculatively & it may not be required in practice.

v2:
- Added r-b tags for the first 2 patches

Akash Goel (3):
  drm/panthor: Update memattr programing to align with GPU spec
  drm/panthor: Explicitly set the coherency mode
  drm/panthor: Prevent potential overwrite of buffer objects

 drivers/gpu/drm/panthor/panthor_device.c | 22 ++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_gem.h    | 10 +++++++++
 drivers/gpu/drm/panthor/panthor_gpu.c    |  9 ++++++++
 drivers/gpu/drm/panthor/panthor_mmu.c    | 28 +++++++++++++++++-------
 4 files changed, 60 insertions(+), 9 deletions(-)

-- 
2.25.1

