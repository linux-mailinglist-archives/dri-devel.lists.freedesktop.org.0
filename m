Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08178B1207C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 17:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F71B10E9FD;
	Fri, 25 Jul 2025 15:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="RzoRSySH";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="RzoRSySH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013053.outbound.protection.outlook.com
 [40.107.162.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B57810E455
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 15:00:13 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=nYGQquhxF/+58DF9O2BhtmDEUIijyBALdayqZvv9VxprMqdY1HHHio4+qTbtBC2MJhsY/2rWAUrJqLKkIvhublJd0+W7n4q+W0a1zqgl6QKsCfksk8A7PA80E+9cNKLTYhWiAhJ3au82gq/AAR+VOnUHW5ZBbexNNJSK41y6PiOZzHkZJmgsyqW4nv46BVwAQaZuY7rEH84e5H4YNi3sGMlQqITKAE4/15BwaFyOLn3zZGdOb4VdkXxViFbqsSQxrLnDPzYsqF4S2eVR5OgpVof4a6aSAnri6UXVsUYBqeELW05W/yYO6nAvyT3ZmmAfosuGN4/lpOWYmpCxfdy4zw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ODLczy70O9zCHJGh6hiY5hG56rq4beCD2HDIJT6yxI=;
 b=XBhO20B3LI5r5tfrtfcjfkxHI0xCNgcpk71loSEy/WIfkvlOuAGBxvxCX5BjD9Av+J/cpfjZfAZs6inhN+BKT7TXiDJknN2qaTgz4WK5LCSb8xiFBNhD88H8WwdUrU6Fb7Vm3vDPvVWdzIs7sicwjkLjL0shjgdhT03eqgFnJvzs31+4ivP5cVn5cevXTUZD3XdvYeptyFu3IlxPllv5x7EwHMUi3N4TepexGffCcSXW7zvNWTOPnqU8PWV/l+5qCTYLlgy83lGQxvumodAdH1xYL0MegJwcc4ddmprQli1GKgyvfC5cauO73aPKUs5kkNcl7TBeKb3vqhGbcM2Syw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ODLczy70O9zCHJGh6hiY5hG56rq4beCD2HDIJT6yxI=;
 b=RzoRSySH6ffBWIjK4GEHkSjJi08lARZ8CHo5jqS4ao/Qr48m79vuCxG8D6j/bBD0lG4wHBpYSHdEItKVlhzbvwNCh09SHbhMBIAI1Dkr75pfdIIS/GqZdaUDahrYqDWid4zp/DgXXvPmJPDtVOmoQoVpPSFtGHZ3uV83eojmyXg=
Received: from DU6P191CA0015.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::16)
 by VI0PR08MB11224.eurprd08.prod.outlook.com (2603:10a6:800:251::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Fri, 25 Jul
 2025 15:00:06 +0000
Received: from DB5PEPF00014B8A.eurprd02.prod.outlook.com
 (2603:10a6:10:540:cafe::be) by DU6P191CA0015.outlook.office365.com
 (2603:10a6:10:540::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.23 via Frontend Transport; Fri,
 25 Jul 2025 15:00:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8A.mail.protection.outlook.com (10.167.8.198) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Fri, 25 Jul 2025 15:00:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gyqR6RoSxrNpxmQy7Kgzeq4DN8YOpjWyts7msNqHhd4sod3+n2bjJZRinALBCwLwz+DBPGUh2B2JBiPhP34k+kwgFKtx+oSkjpgLV5eR0KNvPRvzfCcheqvQIkQNhzqf6J9zsPazsLz1uHyzgAR5zoK7UkH1jo3HhfLjFHsPXU66O1xWphq30OCabm9Hbjz9qdPxth6ZDVWmSnfuM0qTdFrDfa8bCIfhbJOOwmauNrflF5RVVUEsJtHxZygi6YQGI4BTMIlZt/6TexYoPfVeQDlpv/YTCOJoDg7/jDcRMXu9IFToUxaU9HFOCqt0rTZA4KovCrMa84HYxYndhz5oFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ODLczy70O9zCHJGh6hiY5hG56rq4beCD2HDIJT6yxI=;
 b=jk7WPrleF3LmiMEinLAawMleE0ht/O4TaSPK0luXPBTJBaOWvaIkHM3myPY8NVGqTVe+IpO8NEnzmAe+yvFMQ4Z2hCKXQvvTMVPjjqGWbyhrmS/7V1RSjD5h1chcxwZicP+jo4N3qgxWPqWZlIPqVmCutKNlzJNO8eVFlJsdh7NJkcdUfqolST9iO+dxrubFmcC1n77gbmJRPhGF9ggfmV/t7mJeMDkfkdtMt9+TBCTIr65x6D9HLHOBeLpP2puQ8VcvAMozNoH/qMLajghcISQ4UN2mNzbRZVqAcJFKM1CTQNXs2upB8FbB5RvFz//sTfAgdiRPJDXf26eke/BTAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ODLczy70O9zCHJGh6hiY5hG56rq4beCD2HDIJT6yxI=;
 b=RzoRSySH6ffBWIjK4GEHkSjJi08lARZ8CHo5jqS4ao/Qr48m79vuCxG8D6j/bBD0lG4wHBpYSHdEItKVlhzbvwNCh09SHbhMBIAI1Dkr75pfdIIS/GqZdaUDahrYqDWid4zp/DgXXvPmJPDtVOmoQoVpPSFtGHZ3uV83eojmyXg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com (2603:10a6:20b:30f::8)
 by DU0PR08MB8471.eurprd08.prod.outlook.com (2603:10a6:10:405::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 14:59:34 +0000
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::65e1:f4ac:8b74:fea0]) by AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::65e1:f4ac:8b74:fea0%4]) with mapi id 15.20.8943.024; Fri, 25 Jul 2025
 14:59:34 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: [PATCH v5 6/7] drm/panthor: Add suspend, resume and reset handling
Date: Fri, 25 Jul 2025 15:57:57 +0100
Message-Id: <a339507d6a8eb18b2e5ea0b74543ff9e8f991f4d.1753449448.git.lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
In-Reply-To: <cover.1753449448.git.lukas.zapolskas@arm.com>
References: <cover.1753449448.git.lukas.zapolskas@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0277.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::12) To AM9PR08MB6820.eurprd08.prod.outlook.com
 (2603:10a6:20b:30f::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6820:EE_|DU0PR08MB8471:EE_|DB5PEPF00014B8A:EE_|VI0PR08MB11224:EE_
X-MS-Office365-Filtering-Correlation-Id: 015c8e2c-e227-4f14-2879-08ddcb8bf0e9
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?P2f5E2CvHPYrhnSG8AG6I2bpHeFF3uruCu6ci/Hi3//d+aa4WH5afM7UOvY5?=
 =?us-ascii?Q?WmS1+jgM6Irj9raJxcJfYJ8vlEowCOBt8Lkrq27EdHwDPwPv2zfX/hKjAjp8?=
 =?us-ascii?Q?T58zQaETvIpi/Sw7bAw+0YJJV3yFUswpS4JAVdZNtBMPIcBi1mem/yC7Yxch?=
 =?us-ascii?Q?nVzDflQRR350DUs3d7zM5qVGrs/8xBpT4PJklTuziUljmWMOa3pv4D5GpWD5?=
 =?us-ascii?Q?0rIZgGosdOu+jSM/Ivv9a+1fMiLmgIOLnAotaoQI8JkpQUqFKEFee5h7y6ZX?=
 =?us-ascii?Q?BlbFpYKQO215rNS3UTY4/125R44ojzybUh27bhYnd+ZSYpi6BFdAJ9CycOnC?=
 =?us-ascii?Q?zmNgiiB3WzrYKaTNxsskWjkYDpO3XXPJ/m13nc5z/bPQpq2kI6lrS/X7QdLA?=
 =?us-ascii?Q?babxgO/FAs6UDRI8Af6f9fxeaqCzzmQ4EercK5dxdm8JHpZPhbHnPooYWplm?=
 =?us-ascii?Q?y8E3PImYEflr66AzRmtGtSFSmIuF5dKcCdhPqqAlsK7WEmGYht6z7tjLfouJ?=
 =?us-ascii?Q?/sEzXNwsu4P3hGYbsUl3vW1T+sZOWqzWcir4wDvImRUPM+Qw31RsZa015Xlo?=
 =?us-ascii?Q?saSW8aOHC2VBm0hx6zXFEku8XVHmz5L3TuKE271iFkR8PinW77AYNyrz8rt7?=
 =?us-ascii?Q?9W0Ma8YOP8xxjMu4KAanHSSP4HvVY69yP4Y/VXar7It0n70dpTgSqoTjlTVM?=
 =?us-ascii?Q?BWmLMtxlJV5LkG918aK0l7/uTze/NmeO1Jet17ZYmwHBKqBISKyY8CKoz2Ni?=
 =?us-ascii?Q?VqTYnP60e9+nvDLhjPj5+s1dxOxjEd34I9Am9qlRxDRuXHGVsH3YwdenBJil?=
 =?us-ascii?Q?Dgk3UW/Tci/olJQ7f1HAtzGPXnJ+InHTo/13ObJQqWrG8CDSQglzD3dyCYKd?=
 =?us-ascii?Q?BNviHtlMwbgr0DFJzhP0jKqWDjf0p050ilHLigHGrNEk4nEG841AhaRHBTQ9?=
 =?us-ascii?Q?6562YzxuyfLEtwHvPhbBIpnRbLvvhQaN2u6xn1lnlSVqPCENzaIFX2K8uYsA?=
 =?us-ascii?Q?mysDWxchpkSueryiTpIj9pNDkktGO8R1L4Afuudvm3mbO1C083QWCSc5AufJ?=
 =?us-ascii?Q?w+m0vCK8JPMFFHO7yxoOHmDvZ3A6l9B9b5XskzohUGDGviT2fWj/BC15Sy5r?=
 =?us-ascii?Q?wV6/ilzn1o/GOG3t3EXK4xnXMDswtuocWftWsHPYE0CNfD1rhO2VVpp64CnG?=
 =?us-ascii?Q?EAO+b/VHNsy069f/JJEyPj6hPSqlg+SP8own0TJBD5Yg2gy+mKjvY+ygzb3E?=
 =?us-ascii?Q?KbCyPJArdEYAKmQaWKjqqJtkFqq1OjmIu67BKxmspmQ5ggvb3+a2x0Tjrf/z?=
 =?us-ascii?Q?/nETaQ9q9RSbXyEuIPgGzvZKDNaRmmvSssuap/PJmHF5TMuJ6qCTGz+B4qN7?=
 =?us-ascii?Q?IsXBNPajY2+UnVI6ajWLVPWQ2K6ybxX6E4IxSGkMvapnPHswtQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6820.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8471
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: de64b77b-113f-4d8b-241e-08ddcb8bdde8
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|35042699022|82310400026|36860700013|376014|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?doeVLdvdHDqnud5oNSZAMW3IuIXSIW12OgeGWytL0Rx3WWJMxf5nM/Cj49LQ?=
 =?us-ascii?Q?pyx8qRDfrOn/yroBKYuIb6enlB3AdY7SH6v9YJtbHcJk84/wRAhCzN2R2ur2?=
 =?us-ascii?Q?GF/FPipA/JrNj8nNsUnhwnUGWJb+6V82XmHfxui7JVXvo/Ihp7FuCBqwQZ5s?=
 =?us-ascii?Q?J4cARTz3EuUDxd8v6Ivg2WhpYrT4amBxT6zrCG2W/STLOKgKefivfHntyUxM?=
 =?us-ascii?Q?ZHXkWVLKWNl/Wm2SOtFOLwXdytc+NPgyyPTXra6ICKYDcixEMcMTlcNJj1ps?=
 =?us-ascii?Q?P96LAKZaxFPmXu/30V+r86f9YKI0dN5+VqQFJJMenZ7N0RWTxdlmmEQWZczv?=
 =?us-ascii?Q?D8D9mzP0KErENO87Ph9nL3bfPudw2mpTsPuqisulQUfhUrkoP9nfaddh3cxz?=
 =?us-ascii?Q?EG5VcAn7quhi5uHS0W0hJDqDMd152G0NPVQCJlgVN4vtyb7wVckkRozAv2i7?=
 =?us-ascii?Q?z4eLqJL1xpbmmCjKFNrT7+4LBOX+9f79gznHFhTgGKshjpULbciUnPZtIJvu?=
 =?us-ascii?Q?c/+oODMOK9+/vSBSMLM+ISXw5fhOnFDusaoI8PIQ2gAq4UcrpDF7acA6042z?=
 =?us-ascii?Q?OkRn6T7Ol/Eni07sitpSpzcOtcfCNu2/ALNFJT3C7eUKn4savt6Fx2SBkdnP?=
 =?us-ascii?Q?ooLjMCc+5BZSuL+xNfcZuXeouo/sjPw6hbiRhEN9UIgYjkfFVJOSe2UVKE2x?=
 =?us-ascii?Q?3HNBU34c/7FDPsXWRS5rHoEcAGgJUDHTi1T4qnLzNucPkdkDKLvYyZKAgfVz?=
 =?us-ascii?Q?byKbSFU3avB99E7WLcKpKgMVcwA1YO6OgpwxTb+Ajjx565SXCOO5zfeX0qLq?=
 =?us-ascii?Q?O+oUZQx9t2QNfTRD0LKsmHZNDp4RT7AdIYy1hJx6mnMraCmUWViRP/k4aTKC?=
 =?us-ascii?Q?j/CPx+vK78V2nXEKMM5bx3cQPhxEE+PHNzGQbZpZlDrVHQ8e+BNixD0nq0Cb?=
 =?us-ascii?Q?ZNJ2IjV7BAOhd24O1uf/7xxvLTR9dmCK86x3H8WEvaLCKBR2KtXfk1dqp22N?=
 =?us-ascii?Q?gm9d6Fu++XT9Afzn3gue8DM6Z/HCM4ex3O9VCnkDDQ/etTbWStAxeUD4zAGm?=
 =?us-ascii?Q?10rW2+2GBCflNe76kWgtyxuLvy19RKJlV9heMylbzgAPHo3F84Zyzodf2iOw?=
 =?us-ascii?Q?V9/k4AYv48GG+xwovD//6g+KNwwU04mDSZRm0GEzLrImzxEvwVZpbcd3idMj?=
 =?us-ascii?Q?hZqJzrDoVyZwJSUGAo0F8EIQ9qIkAzR3wJuAwy9FXfWJnTQJVy7pZ25p+NAU?=
 =?us-ascii?Q?EP7PYVylWwqcLHgDxek0D6IQTLBXouYgWSyvYzYImGAMLHBJwMF75Mpe1c6b?=
 =?us-ascii?Q?cOHZ0/SuqGZ7oMDYOqklhSLYNkwAfBT1c2ZextZFW9CTHxmJRM7JlRHU6nHw?=
 =?us-ascii?Q?TYxyPwciSRgdIe2IEjgw6Bgygw0xUKhpy+bqLLk86T7ll9cd/OJSusaws33N?=
 =?us-ascii?Q?igslJhBbrVZBSnXqkkkHoOCKcfKKhGNwDQ8v6U+19PlloYXsmW8HiIYF7vuB?=
 =?us-ascii?Q?qT+Wov7Kf2m/m5gCr0mlnxGDpVnQCwetpdfW?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(35042699022)(82310400026)(36860700013)(376014)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 15:00:05.8093 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 015c8e2c-e227-4f14-2879-08ddcb8bf0e9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11224
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

The sampler must disable and re-enable counter sampling around
suspends, and must re-program the FW interface after a reset to
avoid losing data.

Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.c |  7 +-
 drivers/gpu/drm/panthor/panthor_perf.c   | 89 ++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_perf.h   |  6 ++
 3 files changed, 101 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index ab3e65cc17bd..4bcf257e1403 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -139,6 +139,7 @@ static void panthor_device_reset_work(struct work_struct *work)
 	if (!drm_dev_enter(&ptdev->base, &cookie))
 		return;
 
+	panthor_perf_pre_reset(ptdev);
 	panthor_sched_pre_reset(ptdev);
 	panthor_fw_pre_reset(ptdev, true);
 	panthor_mmu_pre_reset(ptdev);
@@ -148,6 +149,7 @@ static void panthor_device_reset_work(struct work_struct *work)
 	ret = panthor_fw_post_reset(ptdev);
 	atomic_set(&ptdev->reset.pending, 0);
 	panthor_sched_post_reset(ptdev, ret != 0);
+	panthor_perf_post_reset(ptdev);
 	drm_dev_exit(cookie);
 
 	if (ret) {
@@ -503,8 +505,10 @@ int panthor_device_resume(struct device *dev)
 			ret = panthor_device_resume_hw_components(ptdev);
 		}
 
-		if (!ret)
+		if (!ret) {
 			panthor_sched_resume(ptdev);
+			panthor_perf_resume(ptdev);
+		}
 
 		drm_dev_exit(cookie);
 
@@ -568,6 +572,7 @@ int panthor_device_suspend(struct device *dev)
 		/* We prepare everything as if we were resetting the GPU.
 		 * The end of the reset will happen in the resume path though.
 		 */
+		panthor_perf_suspend(ptdev);
 		panthor_sched_suspend(ptdev);
 		panthor_fw_suspend(ptdev);
 		panthor_mmu_suspend(ptdev);
diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
index fd16039d9244..512bbdb0aac1 100644
--- a/drivers/gpu/drm/panthor/panthor_perf.c
+++ b/drivers/gpu/drm/panthor/panthor_perf.c
@@ -1845,6 +1845,63 @@ void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_per
 	}
 }
 
+/**
+ * panthor_perf_suspend - Prepare the performance counter subsystem for system suspend.
+ * @ptdev: Panthor device.
+ *
+ * Indicate to the performance counters that the system is suspending.
+ *
+ * This function must not be used to handle MCU power state transitions: just before MCU goes
+ * from on to any inactive state, an automatic sample will be performed by the firmware, and
+ * the performance counter firmware state will be restored on warm boot.
+ *
+ */
+void panthor_perf_suspend(struct panthor_device *ptdev)
+{
+	int ret;
+	struct panthor_perf *perf = ptdev->perf;
+	struct panthor_perf_sampler *sampler;
+
+	if (!perf)
+		return;
+
+	sampler = &perf->sampler;
+
+	if (!atomic_read(&sampler->enabled_clients))
+		return;
+
+	ret = panthor_perf_fw_stop_sampling(sampler->ptdev);
+	if (ret)
+		drm_warn(&ptdev->base, "Could not stop sampling before suspend, err = %d", ret);
+}
+
+/**
+ * panthor_perf_resume - Resume the performance counter subsystem after system resumption.
+ * @ptdev: Panthor device.
+ *
+ * Indicate to the performance counters that the system has resumed. This must not be used
+ * to handle MCU state transitions, for the same reasons as detailed in the kerneldoc for
+ * @panthor_perf_suspend.
+ */
+void panthor_perf_resume(struct panthor_device *ptdev)
+{
+	int ret;
+	struct panthor_perf *perf = ptdev->perf;
+	struct panthor_perf_sampler *sampler;
+
+	if (!perf)
+		return;
+
+	sampler = &perf->sampler;
+
+	if (!atomic_read(&sampler->enabled_clients))
+		return;
+
+	ret = panthor_perf_fw_start_sampling(sampler->ptdev);
+	if (ret)
+		drm_warn(&ptdev->base, "Could not resume sampling, err = %d", ret);
+}
+
 /**
  * panthor_perf_unplug - Terminate the performance counter subsystem.
  * @ptdev: Panthor device.
@@ -1878,3 +1935,35 @@ void panthor_perf_unplug(struct panthor_device *ptdev)
 
 	ptdev->perf = NULL;
 }
+
+void panthor_perf_pre_reset(struct panthor_device *ptdev)
+{
+	struct panthor_perf_sampler *sampler;
+
+	if (drm_WARN_ON_ONCE(&ptdev->base, !ptdev->perf))
+		return;
+
+	sampler = &ptdev->perf->sampler;
+
+	if (!atomic_read(&sampler->enabled_clients))
+		return;
+
+	panthor_perf_fw_stop_sampling(sampler->ptdev);
+}
+
+void panthor_perf_post_reset(struct panthor_device *ptdev)
+{
+	struct panthor_perf_sampler *sampler;
+
+	if (drm_WARN_ON_ONCE(&ptdev->base, !ptdev->perf))
+		return;
+
+	sampler = &ptdev->perf->sampler;
+
+	if (!atomic_read(&sampler->enabled_clients))
+		return;
+
+	panthor_perf_fw_write_sampler_config(sampler);
+
+	panthor_perf_fw_start_sampling(sampler->ptdev);
+}
diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
index 5a14854368eb..1044b0a1cfaa 100644
--- a/drivers/gpu/drm/panthor/panthor_perf.h
+++ b/drivers/gpu/drm/panthor/panthor_perf.h
@@ -14,6 +14,8 @@ struct panthor_file;
 struct panthor_perf;
 
 int panthor_perf_init(struct panthor_device *ptdev);
+void panthor_perf_suspend(struct panthor_device *ptdev);
+void panthor_perf_resume(struct panthor_device *ptdev);
 void panthor_perf_unplug(struct panthor_device *ptdev);
 
 int panthor_perf_session_setup(struct drm_file *file, struct panthor_perf *perf,
@@ -30,5 +32,9 @@ void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_per
 
 void panthor_perf_report_irq(struct panthor_device *ptdev, u32 status);
 
+void panthor_perf_pre_reset(struct panthor_device *ptdev);
+
+void panthor_perf_post_reset(struct panthor_device *ptdev);
+
 #endif /* __PANTHOR_PERF_H__ */
 
-- 
2.33.0.dirty

