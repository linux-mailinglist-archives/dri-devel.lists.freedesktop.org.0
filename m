Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F569B0425
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 15:33:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1843A10EAE3;
	Fri, 25 Oct 2024 13:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="M6MnQW+0";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="M6MnQW+0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2056.outbound.protection.outlook.com [40.107.249.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6652C10E0EA
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 14:55:19 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=IdQ438bddBQ7Nx1MySYOfhWkI1I4O9nhxI3qcYV8Q348smFLe/kjmyY/fzjsVs+Ht1KNrvkCKrm8rbUE5jds/dJ+1YpVXJKje1tn+zvD4H1GtzcXNKi5wS9RR/raeFPx4tRdvTcwRPp2WkH7v/DUXyajAb5m2ob2SJAQeItjQa+PwDDsYELtiIcvT0kmnkRhlxcLqFBgGr871DuBebqYuaAOZ3Hzgv7/qjwUhNUfiFIuGarADbM8vaBDknwDl507/VVVgj3c6l0k3cqK+neXBlS79oUeMeFPa0y5kakXGcnpI4aFi5T0BBja8wWj1YlJ4wfg7tu6UEV9NBYGsSSE7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W1k6AHKcebCqZS9bf/ulWbnrH3kW6rKUZhzlMa753s0=;
 b=O+g1xR6OS88EOVBuw6blm5m3GfWpUSWYh4H4C8Iym3n2u3zAX6YcaTJehFB1yYjK/RCOfhKg7R54rqu7XMj7Qpb2yUHshIqUGgFOggxenepXfS10jg5ueVKMsi1xNno418MpxWat0PuRlbRlgwlfQVccfGdQ2KRqiG1PVhcQSCQ0WwqAXGbvN8i4mTB6OffO8fl5HTGLgUU5n7ZlN6ngy8pDoTRJSygdHELvzkx5bjw/90YWHkk8+DLrvk/fon3dRauiC/7SGC8j9FZDfPWnsDca3HLU51LhjuhMwSENNgAr/5ugoWoel9/ebJnJ9k89lRMRNWpekzAP6iY9yBcoIQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1k6AHKcebCqZS9bf/ulWbnrH3kW6rKUZhzlMa753s0=;
 b=M6MnQW+0PXO0/6idWH9wqnWl4F2w6w7oh0n8qm+WpggiADi2aNCe6vDTgwX31uLhqbl1xlpZ8lOKvLsCBKyxtvp11nf/c0zyAdTxpzmYbE4UNXYhPNmM0WpISuYMiv9qygz96TVDaUlgtMmyl3Vd/R5z5AXjmm4UT+1q07jPgxM=
Received: from DU2PR04CA0219.eurprd04.prod.outlook.com (2603:10a6:10:2b1::14)
 by GV2PR08MB8318.eurprd08.prod.outlook.com (2603:10a6:150:b5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 14:55:11 +0000
Received: from DB5PEPF00014B9F.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::6) by DU2PR04CA0219.outlook.office365.com
 (2603:10a6:10:2b1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16 via Frontend
 Transport; Thu, 24 Oct 2024 14:55:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B9F.mail.protection.outlook.com (10.167.8.169) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8093.14
 via Frontend Transport; Thu, 24 Oct 2024 14:55:10 +0000
Received: ("Tessian outbound 99870d44e01c:v490");
 Thu, 24 Oct 2024 14:55:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 717ff9876fee20f5
X-TessianGatewayMetadata: /arqyLPVBFlv2vFa+ySf3E7Qt4WbzNoYTKAxL09H8rUbD7+GsW/VBcAM0569anH9Jn+18wziLLWIBbdsW6OTR+Re7UWgLl4/9F0YzHlDUsU714nSdp2sQQ7p3DthtplMidhcAYUWwT2VkhP3Yh28HMvuGf8N8msHMO/PhDJoRqI=
X-CR-MTA-TID: 64aa7808
Received: from L054ac04ffbd5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 205136E1-5B90-49D7-8BC9-5B130364E637.1; 
 Thu, 24 Oct 2024 14:55:03 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L054ac04ffbd5.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 24 Oct 2024 14:55:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CqN0uibQmBxx7VFfOefsRJkb5sdbxmMrAJ15BGsEw91BDp3yvoTAeDffrrQHYk8DQXeNWL87inA2jCLmA56MIU4Gho200Csi+/KNa+2irGcc819QUkmhsx/7f1yhHdNkZ4+XsXJtYLXTCanXzgXj4Qag7ix+vpUz91qzBobypYps8eqtOXP4xNec+N4KtbYIZg7SK8YPAXRw39jQZLYe1R9QaJCgnP3VgEVMfsbJT17yLosoO/kaUC2G+KWynXjo1dESZhpRYrIjmNoeA5GSG1iyO51f4wwohEB0s73RJ6kiDk8dTOot/mxbHP+sb8ICqLYxBEC/KG0pFh9kZd6lLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W1k6AHKcebCqZS9bf/ulWbnrH3kW6rKUZhzlMa753s0=;
 b=gRgQzs+wfkuYlBM7MNb6I0Bzr6+I4pBH4NM4nxEkRgbu+QWRWwW6Os3HYhPBAT36LxTydXnsx1pS7tKOsE9fmsdEPHEBMhPHKoYVXTVrA8kzP60KWb1MwgRLhuoGT16lddRdweVsi0uGP+fWNOsZjk9/KwfelANrKQYP8kGCnfzPjWa2A6VzI1fqKgLTmQC66ygHaPPq4jGVkomePwxZ3pQnfXHQA83avhcjLwb1jCQs3ozQkMuNv1LM+mY0b/ZI1kO8m/9g3ni0g8q2bJntTAigRxfQs7BtS7xom06I7beIurKN7gcnmsIjzZcDF7s5yopvbMObTQz8P5vC++Nj/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1k6AHKcebCqZS9bf/ulWbnrH3kW6rKUZhzlMa753s0=;
 b=M6MnQW+0PXO0/6idWH9wqnWl4F2w6w7oh0n8qm+WpggiADi2aNCe6vDTgwX31uLhqbl1xlpZ8lOKvLsCBKyxtvp11nf/c0zyAdTxpzmYbE4UNXYhPNmM0WpISuYMiv9qygz96TVDaUlgtMmyl3Vd/R5z5AXjmm4UT+1q07jPgxM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by PAVPR08MB9650.eurprd08.prod.outlook.com (2603:10a6:102:31a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Thu, 24 Oct
 2024 14:55:01 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd%3]) with mapi id 15.20.8069.016; Thu, 24 Oct 2024
 14:55:01 +0000
From: Akash Goel <akash.goel@arm.com>
To: boris.brezillon@collabora.com, liviu.dudau@arm.com, steven.price@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mihail.atanassov@arm.com, ketil.johnsen@arm.com, florent.tomasin@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com,
 Akash Goel <akash.goel@arm.com>
Subject: [PATCH 3/3] drm/panthor: Prevent potential overwrite of buffer objects
Date: Thu, 24 Oct 2024 15:54:32 +0100
Message-Id: <20241024145432.934086-4-akash.goel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241024145432.934086-1-akash.goel@arm.com>
References: <20241024145432.934086-1-akash.goel@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0177.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::20) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|PAVPR08MB9650:EE_|DB5PEPF00014B9F:EE_|GV2PR08MB8318:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ecfe26f-4819-408b-6e41-08dcf43bdbbd
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?VDlZ/mJOEoNsY94F+qCXfgQ47C+PM54oxcgDpRvq09OY8i8rUGteUAOqt2sd?=
 =?us-ascii?Q?7XjJbs0zbwOvSIzGk7ojyJgzaVSkhcGGcquKheSWfYfoN4KTYpp3QqsByOHQ?=
 =?us-ascii?Q?LiR84sjMSVScLww2sy4D6dHFrnpO5j8EdIAePw3Z2kpRDURG0ZyJddJLUl6H?=
 =?us-ascii?Q?kG4+JdC8Tvi9WrVgEVSvnfHnghX6LQfjJhIj1w6eWTfYDWbzr8pF/a/BdOvK?=
 =?us-ascii?Q?PWIE7g48+NoF68QyyfXh74ydSn2UV3Ln1EE65jfipKTKlUQ0WAPjGUSyimy+?=
 =?us-ascii?Q?5EbrOUxuGQKtBB+eTZxPU0pf/oh9Nn4bEAjciLDQ0XZ0PxNOaoLVH1AZTnNg?=
 =?us-ascii?Q?G1iLO3exrbZNNEZmWE57cvCELvmjc/ygN3Dqo/bQIRJ5NC4ksA1RyqtR2/+z?=
 =?us-ascii?Q?JDl8ugerFLEr4Ecs1j1ArnLHloy4jbuU0RQfq/s6+PWPbuqILcf/Ec5qVhOl?=
 =?us-ascii?Q?sdjd7U/EMjZNqXbk1qXYS8Ma4gdj8fdyvRTKisCE5hgSXvmNImi7/OpbIwpP?=
 =?us-ascii?Q?chuh0Hun3tuDbv3qenTSRhgELgQWZmE7170UwRutgCi/uJ1DQUBRhsnOi3B8?=
 =?us-ascii?Q?9+g1/XTEo0lRL5tDpHpf8StxOwbn6wA0StcyWCzQ5KimjQNagWYlvlFrJgaT?=
 =?us-ascii?Q?7drmyiWVQqpw8r/NgzmBMYw4KI7wELg/v0/oXNW8+5WR1pN51K3o1Sqhcioc?=
 =?us-ascii?Q?YjpQW/+xzzWzLfMZNXsZH0q+Ncm2uwFm0Z9AzNWqWN569Qlj6j+Xfq+SRAls?=
 =?us-ascii?Q?vpf8Te+bYii3vREW37JpisY/iafUElX6zZGrgv4i9rGaACx1VOrrTg2x2fTb?=
 =?us-ascii?Q?IvApdkIQ0jtrxWl3Np+M91Z12NH2kBIFuDJzO9EpU7zwO/MinrYn4emTuCQo?=
 =?us-ascii?Q?yybfqUnoROozmbj5ykkcsh762uan7wlFL2YhGzT6aevWytr1bpOKJUpuI2lH?=
 =?us-ascii?Q?ShDhmcpeWOAnPgbgATrdDUWehb4EIpfpbfK1wJWtKZ1tj35cXpX/06dEQN00?=
 =?us-ascii?Q?uwMpnmnOsOq/AEbSGrteErR5cnIQepRjaGN3OTM4J18bUOzolM2DqP1v/nFI?=
 =?us-ascii?Q?YY7QqaLh1GAd+3uG9iJgT7itltK6BKSqJeYwPlhXppLYShe/KW/FCwk1Nici?=
 =?us-ascii?Q?OdqtwAMNtMTod+RWuM2Vke3NqodqNyzFAYL1Y0iBIFn1pN+q3xO3tP7Nn7cg?=
 =?us-ascii?Q?bMTR7wENdn9AdFvJbCHsEtGMfl2uW4hYrbSRIkq34ouB00p3XpzOA41WMm0X?=
 =?us-ascii?Q?xJy8DYS8F8x/uhKZRhgGK6jMjfxOzLfOc0ZH2LHaegMA6o2rUursLC4RfoyV?=
 =?us-ascii?Q?TzeGJMemi9iCdCFdkzcfr2pX?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9650
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:415::16];
 domain=AM9PR08MB6982.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 212e5514-41a0-4060-31cb-08dcf43bd673
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|35042699022|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pjpoeikLY2WjL4eexRrpYdFynje0D+H4e45eiSxM8IQhHk/n2saocgytC8ZW?=
 =?us-ascii?Q?u1OyWTEpWbfhdQWL/CBt3VqW0cHzI5Z/ax1e9Myca/k4LHdyZSrZI4lv2pPK?=
 =?us-ascii?Q?/ikK6mlLvCc3ZTnKwKtGl4Zk1/k/wu97M0OX51V4BTGQSLqKneMJqzA9r0IY?=
 =?us-ascii?Q?RdzJNG3DKRsgh9J8EQXEcewDlX0AmUw8+ASRFiKAnHBpDlsEC7J08c0qdCqU?=
 =?us-ascii?Q?pWceAK+4tFN0YlZztHuCOiKD0Wx2oujEvM6BtRhd3TZZGWsmhNYrGEeZpVpz?=
 =?us-ascii?Q?+obEFgA6djDjYoTX9/Dea8062Vmv6tgPXSBZkmiPHs30L91JJMXK0iC78uJG?=
 =?us-ascii?Q?XIlBj9o9rmAST0ggSgA3PFqJUptHgi8Po7diOZjYEMebn9bafSn4YYrov/dG?=
 =?us-ascii?Q?oQ+QWoU9OQ9caMIXQWCNQtYh9CooadXcPOnJAqn78MCPm6tOmx6t5caoYNrW?=
 =?us-ascii?Q?hyFABEHAPIQLaCbJvL2wfre9xNydaqIjW0FhB5z8btxz9MVG/UZ38jL1CiXa?=
 =?us-ascii?Q?SimYepnP8msE4sZUQA2LpYPKjMPbNRbGjvFXb3o/GU97lDv+6QWjJZMwVyXM?=
 =?us-ascii?Q?XP5vEi+TYF3pCJNu+G2EjGPEOTMuA9L5viyi4yb0b6yQckwOOz+sD0hpzfFs?=
 =?us-ascii?Q?JB737UGPFdGzJBiHygYvi/QyRSZF3ONQ/Uc/tIJwpuhEID6iTBtMIbPYSGhg?=
 =?us-ascii?Q?GlNIwJt1RwAz483NhZdypJClKeMuL8DQOxvgmDXk3Ai41iMxI0leR889DVQi?=
 =?us-ascii?Q?nlvaD5Q5muIWN62QzDjtF3cUaNgOlgsJ9kmK9O/0J928xAJ1vPTnQguktTpL?=
 =?us-ascii?Q?9q95g2kt90QNEn9gS3CYYE5182tkGHRkYqGwsPBM9T74c/NHKtmYBCglD5k/?=
 =?us-ascii?Q?o34vCpfOZbC028MUWfShxVsWWOJLm0UGfaFmHbHDjVGY+rB6huD5wBbvWUat?=
 =?us-ascii?Q?QsM4xfDt60wjV6ZYMPLOZzKC1VHbqMcuDU6oYnFoKGnwNoJ1YrgNDzEbX92M?=
 =?us-ascii?Q?2QQ8CnYhmIkAN2uCCWOmOHILlR3YHh72nPSKgBMgde2m2DSB69BeeVOgt/KD?=
 =?us-ascii?Q?Vfm7DxXdoa+u9Wi0cAhh0EGEahaW3HVG3Fr5JdPFA0wEUCq6AOqqWcmihmGp?=
 =?us-ascii?Q?kn0ebUDvtuql5OdBA0iR6FvNIIWw6WtN08CVwf9DT7GZlzk2yFXYOAy3wY2v?=
 =?us-ascii?Q?v28g1wvKoiCc8iz/8QJ3+FZ47qdEROusAuPJhBfWac6n+FF07ZMjr784Hj+D?=
 =?us-ascii?Q?b9yF8RXlYxFeESpalMXSH2ksdqolBbjkEQ2kRisxe44XK/JZ3my7KVCzLajo?=
 =?us-ascii?Q?U7QRIBRyyNjAVOQa0CWT70N7NYaCpdrCcxUT4rF8v1L/9mCCnAJhYlJOiCEs?=
 =?us-ascii?Q?v8UwZfcQhVf7CVshX/YyAS/p3aCIjjtZLVtf+e49cx7IcwIDcA=3D=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(35042699022)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 14:55:10.6171 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ecfe26f-4819-408b-6e41-08dcf43bdbbd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8318
X-Mailman-Approved-At: Fri, 25 Oct 2024 13:32:50 +0000
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

All CPU mappings are forced as uncached for Panthor buffer objects when
system(IO) coherency is disabled. Physical backing for Panthor BOs is
allocated by shmem, which clears the pages also after allocation. But
there is no explicit cache flush done after the clearing of pages.
So it could happen that there are dirty cachelines in the CPU cache
for the BOs, when they are accessed from the CPU side through uncached
CPU mapping, and the eviction of cachelines overwrites the data of BOs.

This commit tries to avoid the potential overwrite scenario.

Signed-off-by: Akash Goel <akash.goel@arm.com>
---
 drivers/gpu/drm/panthor/panthor_gem.h | 10 ++++++++++
 drivers/gpu/drm/panthor/panthor_mmu.c |  5 +++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index e43021cf6d45..4b0f43f1edf1 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -46,6 +46,16 @@ struct panthor_gem_object {
 
 	/** @flags: Combination of drm_panthor_bo_flags flags. */
 	u32 flags;
+
+	/**
+	 * @cleaned: The buffer object pages have been cleaned.
+	 *
+	 * There could be dirty CPU cachelines for the pages of buffer object
+	 * after allocation, as shmem will zero out the pages. The cachelines
+	 * need to be cleaned if the pages are going to be accessed with an
+	 * uncached CPU mapping.
+	 */
+	bool cleaned;
 };
 
 /**
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index f522a116c1b1..d8cc9e7d064e 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1249,6 +1249,11 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 
 	op_ctx->map.sgt = sgt;
 
+	if (bo->base.map_wc && !bo->cleaned) {
+		dma_sync_sgtable_for_device(vm->ptdev->base.dev, sgt, DMA_TO_DEVICE);
+		bo->cleaned = true;
+	}
+
 	preallocated_vm_bo = drm_gpuvm_bo_create(&vm->base, &bo->base.base);
 	if (!preallocated_vm_bo) {
 		if (!bo->base.base.import_attach)
-- 
2.25.1

