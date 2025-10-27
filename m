Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3575BC0F334
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 17:14:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E7F610E4ED;
	Mon, 27 Oct 2025 16:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="GrNZmB+F";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GrNZmB+F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011021.outbound.protection.outlook.com [52.101.70.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F0A10E4EB
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:14:24 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OsbrpS0ZjWdklABzlFLHpJVX0WSEXD7HTr2hqZxJmBy8hrL4gJf01rmKlDWqHrlJlvnHWOMy5LNk5PwFqvT3acjG+CL5frY/+lbg0kx5DgXUaJvTa/tbjx5ZBnrCpNwocPe0ubEC+4wasJGKJ3vF4QtTLP2FVcpUYFzqE84PndZ3ViLWfoMnOwmsK0WzdK7rq2SZguLCNSWYqqi7AEnk3pt79SWA3ZvTGuM05yRqT2elyJD0hsdPka3IhrpjV0C1xB8taMZkfgJmvFlS4jYW9+nto9PB0ufWtB4hcDojwts1FfE8glGB98JnDXph4/TngyY8ajYOYldW7nS8bDVmcg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Jmrw0tdQkdM1p238HpCwZlvslKvE5rn8wqJ1rtx4Nk=;
 b=Se8IAzHXBbu6FvpVkr/G720ecfDq2kEaypencFjKI9VbTqOUdqdCjopBCVXoM6rnFrlwkjWG/9W7tjb/Y9UJ4NdzLNrusK/ba6vYVo5IUhOeUAJQ6QiORsVdw0AfDOCA/p8XU1e1L7g1tGWH3LLA322qxoRlgk0wjMoKcscfAFt0Lb/Zf/CfpDjaVcMSgxIz1SlT4rNYkSLdNf7EJ0r1eHCte///x6qnXABzK+kkeL966YBbf6pzgObudOEBbpmHFcmVINutFqXoQXVXFFW+D/EcZChPd8q7PyoG+D1NGNK64iYqD38uYWETcz262IwupcIz24GdeCsi+7GL0cLQNg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Jmrw0tdQkdM1p238HpCwZlvslKvE5rn8wqJ1rtx4Nk=;
 b=GrNZmB+FLt+WeDd5A/0Yrj0CFy4oRr35F6g3Uqra5pwdDc+SS+G2J/6eYAv633nCCE+2SYgEAx6su2SxyddRKb6rmRl8ZbenomscJuYQLUJHChcZxV5F5rckX9uksqthFgekEqtdlja5OaJV4YOphLTKhhazM2Hvg3wjq4Tfyfg=
Received: from PR0P264CA0154.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::22)
 by DB9PR08MB11242.eurprd08.prod.outlook.com (2603:10a6:10:5de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Mon, 27 Oct
 2025 16:14:17 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:100:1b:cafe::6c) by PR0P264CA0154.outlook.office365.com
 (2603:10a6:100:1b::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Mon,
 27 Oct 2025 16:14:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F95.mail.protection.outlook.com (10.167.16.4) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.0 via
 Frontend Transport; Mon, 27 Oct 2025 16:14:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uFXrJ0/QmRl/VjjTS2EtJBewaz/eBw/sYdKTHZUymlThnG/+Sl3erkpcC39kWzwRncJuQRZmBk0mJlXMJJmM52fCf6DH54P+YBxzfzNhM9ir4t40GOFrMaU1jSce7Dt7lTAxxTM3meRkykpcTWnkg7x3YjDQK+673T+t37fRSOgcXm8D6LHpSuNZQ1LVlakYbU1ay0Q8TMg+5puDaLELoWUjUjVGNBZv4EKegUXoruN9iPr85ecumBFosER7NaPI4IFYnWL9neuD1tJ5ty8R1mMmd3Fwfh6VQTI6o8YecxeOKrgAjma4kZeRM5x7b0miSdSS0VWTJmPJR2jslUwiMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Jmrw0tdQkdM1p238HpCwZlvslKvE5rn8wqJ1rtx4Nk=;
 b=qRGPc6bLU1RzI2cDUy2djrhmNW4KiqGzIcUjKXngXjBcIHZXKCkb8uj7TWS39ntO5R5Tl2c3lM1yl+8mm2Yut67stWhTo+IRi3BHBHkXZYhXnBizG+8fPA7svR40vSPaahbAOeWuvVlnV3zxE7HAhsMqIgKvvvXLCcb+Hfj/i1cDhgNezJO2OjVWvMJjpXVKaYwWrIWKJ8cQyVahRjL3HeBtDSk6X88ItJB0zOZa6kvovByFkcZLIfB0svGTnvOxkBtteD7wkmQL0Q1Ogh2p8p8YR/+lyNtAkCF8b3FGO0yNwMPSnAw8jOEDkbNelss4JgKPDZu9IrpvcQTkWhV22w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Jmrw0tdQkdM1p238HpCwZlvslKvE5rn8wqJ1rtx4Nk=;
 b=GrNZmB+FLt+WeDd5A/0Yrj0CFy4oRr35F6g3Uqra5pwdDc+SS+G2J/6eYAv633nCCE+2SYgEAx6su2SxyddRKb6rmRl8ZbenomscJuYQLUJHChcZxV5F5rckX9uksqthFgekEqtdlja5OaJV4YOphLTKhhazM2Hvg3wjq4Tfyfg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by GV1PR08MB8498.eurprd08.prod.outlook.com
 (2603:10a6:150:82::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Mon, 27 Oct
 2025 16:13:44 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 16:13:44 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/8] drm/panthor: Implement L2 power on/off via PWR_CONTROL
Date: Mon, 27 Oct 2025 16:13:30 +0000
Message-ID: <20251027161334.854650-5-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251027161334.854650-1-karunika.choo@arm.com>
References: <20251027161334.854650-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0002.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::8) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|GV1PR08MB8498:EE_|AM4PEPF00025F95:EE_|DB9PR08MB11242:EE_
X-MS-Office365-Filtering-Correlation-Id: 66c901b8-8ad8-430c-cd49-08de1573e0a5
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?C6viH1CLaKUOSXOZm8jTxCY/9wmZQEf6NIs/sbe1foUegs/y+1+D5vXv4Klh?=
 =?us-ascii?Q?5DtxRezs3US+WRPCVvM2TpxSNXZ2XH6ms234MI6Daop9WjfXK6SWNZLgC+0u?=
 =?us-ascii?Q?kDPN4JeNQxtK1FLMA8fz+Lfm5HttdRgAc14IjpEnT+VKVeq0IVa7s6C7kxZO?=
 =?us-ascii?Q?re6uo8jxfhtTvrZd+2OxlFnCI8LZA8xPAsKyKE+OtayZTfnD1S22zhX/Zm8+?=
 =?us-ascii?Q?XBnyBsDY0FvDzT11Ng3JsLDtb550NKbiHOFtASf1rukPWmzu9dxp5BmduUOS?=
 =?us-ascii?Q?Q1Z5XWCpj/7tAEA4vLNyBFqKXFFKUxAJjW7g+jfGQsL3OhvHHciOWH7o+RMg?=
 =?us-ascii?Q?PmKfWWks+G1X9f5FFlUr3oNMExA89zs//fmIllqQkODzb4sLdHGGkmHhZQ3Z?=
 =?us-ascii?Q?SYEsONBFQdW2wWnLdC3fadSxBJrVWMnebzWipQV2NFE3Ya378biXT4Eoz3Yo?=
 =?us-ascii?Q?A4eVQpF4kawsO//Tmgt6BHphWVRJJWyN2wDBAu3anrZW3IHkx7iZPUXvAfcr?=
 =?us-ascii?Q?zLr4uVThotqZvyyCzofF+3YlvJbTprWxGhP/kloeI1psznVd3vgwqZ6zYBQf?=
 =?us-ascii?Q?DHASb6r18fXwAqpGFWiMKAlw2b1GUb8LC5fbrNKCu5JwgI2wS9YuxBhW6Bos?=
 =?us-ascii?Q?JC/PRl6qGRwf/UcNWtwEbg6RS7pHYmowNHO7Fux4zygynW8h81CMn3kZ6MYK?=
 =?us-ascii?Q?iLPEnxu8xuvWoln7FTVTVL3ip1mHBxu+JqOzVoSdk+z74Y3QR+23NYaMS3Fn?=
 =?us-ascii?Q?SiyvYhSWSkNijS35rFQ2C2M6SG2sqDeIu0KVM4uiCaWg/pUZo1hVcwp5Mjzs?=
 =?us-ascii?Q?3A/iKI7KTWYJHgpa5Www/xkZV9yJ9e8C/xdWCl75H+0atm+trmhPAwqIWUrS?=
 =?us-ascii?Q?6mJfo5gSq/CmZ5S5+VTWtdZpjJbMDGIvxOe8+wOCAx+JvWg/GBKgVrH0g5Hc?=
 =?us-ascii?Q?PPFzTc7JqGmqizmoUa9Ia1afdRO8GKNKmFWJcO0kBwOlu2zfMyLINasSlNgr?=
 =?us-ascii?Q?oIz8Qcht2uhffVb0MmxxupDQ5jlviJ0Riwvp5XD+ta5b0qNV/OFqrT2rIr7q?=
 =?us-ascii?Q?KtwaQuDIDjRCLXt5wXdPtlomKzoUVfR0EaiUiF7rJ5aSas2+/JtjzfxRSSrU?=
 =?us-ascii?Q?OLrI6aSF94Kx/QanSRe/P5RkxJV5gwpzSUadWFKXi7La/dRHm9OrA7DzRYFU?=
 =?us-ascii?Q?TuPnvclj7mK5laE3wBmgsm25X98ofCtIpDoD2PCb8jl3HQcp+qiIW4IUrkrX?=
 =?us-ascii?Q?w+uEy4ClMOJS5tBjyJt+nty7IicoMsfn1HivY3+I5FfYxK/zf+fAqqeoh4fR?=
 =?us-ascii?Q?pQk2LYMIO/9Q0sz6eK/X6iddHnJ+guWqPiCeuhN44gdMSiX3yBAK32Iv68u6?=
 =?us-ascii?Q?7ECUYUTJNcrJG60nQ2QFlybT7goajGgffRua6nv2NSnFHob1106L+ePNdBaJ?=
 =?us-ascii?Q?ABeSO8AVwf8qlriC+RSIcISdO2+LoW44?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8498
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6e8fa215-1176-461e-27ae-08de1573ccf3
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|14060799003|35042699022|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zlCLXmrnxWl5x9+mMqYxze5QNqqXT/49ZIUaJUAG4LdThwVZYlPW5r9Ug46i?=
 =?us-ascii?Q?GGocdfYhBUVrDBj50NquMaYUoqpcJpruNl6i72Kj+scFstP/EcHWelSLkY8j?=
 =?us-ascii?Q?UI4CrjJnpFNsLSFBeF4/eI2yOwdN7SbDNoCZxsMl2w05ZqJc/bdLRqus7O25?=
 =?us-ascii?Q?qUQJIFTjKn/pMzlRa8pKaPl0xlRBezUMuP+hcjfeth7LxUVCypnCU1Gi/6d2?=
 =?us-ascii?Q?zjT7oEQf5No3QUVlv72BCvbEQB5+HGXvCP3Z/bQX+wO1Pfl8OSVajJunIZaB?=
 =?us-ascii?Q?lMWHNR6uQxlNjwvcajFfX3ua8tsEvXDZQ1ew6ATei0525YjE19H8gOmuVklw?=
 =?us-ascii?Q?YwjMzBExalzyd6NFc9HcF3JR94iS9Qadpmf/k9UOxwZcvn1NhtZmlf2NvfrC?=
 =?us-ascii?Q?0Kea+EaUGH4DQTtZvBVcSnrdJ35H8+FSdOsKC3kNA1f5wKSliZfa/vC0Rkh6?=
 =?us-ascii?Q?tpfCWbsR+LWJg7u4uR+MKGJNHke1vLP+n97GXmJKqBQ/t0hx1w3JgJ8wP4yZ?=
 =?us-ascii?Q?tw1Azr6/KoDPNT0bUBTzjFSkF5rCgTr64Af4zFnXDzWxt5HoMBFODecC7E2q?=
 =?us-ascii?Q?UQ5ZpfVt6h1IJsX75bXSX5oToKspfrDmi0/UJRalpEb5u+bNQ6y/rZHEkyoW?=
 =?us-ascii?Q?J7CVUWQLSiGmE042DMUqKfgDMbELBK9FQzhtCt3tP305MajAj8M5VXm+9TtC?=
 =?us-ascii?Q?s70u5xrX2gkpVqjURes9LE5bWHYj2xJlF1ZJ1y3+T5Lzh3MLiWpz8r0F+Z9L?=
 =?us-ascii?Q?t6yJJnG/aI6H5XsQP6NCt9JqALSYMM1dux95QzYehU7BtUK2ZAsYi5/hnHNk?=
 =?us-ascii?Q?aMSbB3e8KzAKOnqzvayWESbBQ1Rl3Te5DTrTJmdFEzfKbJSt68XJ5CWH66t+?=
 =?us-ascii?Q?tJk2yq+uets8VDWkDcdIT/PQp0tQSOj2e6nNkxepFuMsP39Y9bgnG4eA9W7J?=
 =?us-ascii?Q?r5PbS0d8BsuDAti4UI66uG9I8SfkY4de7j1unnkhYmMVFoM0qhFHYYsU+3A2?=
 =?us-ascii?Q?WvZwtOtEd4HL5ODlr5IzXJRewPpsIwJ4Sl7Jo0tIIDMQ9YkDKoDJgGSepfOG?=
 =?us-ascii?Q?QXJhZKDbFsBnWQTXiS6hXAt915CQZ8ov7E9IZRH3NvJ48/WnTMTupKAzTxtH?=
 =?us-ascii?Q?qtWaQx/tnlVt6drRqfsFUUL9mtHSPsXuxH1Wrr4MUW+g+dZfNy2DKTkxASNv?=
 =?us-ascii?Q?SBMTUMUhRsmpmsdDLhkpSj1paT8dJnbS0kzdLOGUjK2EX1L2ZoumPFiiRL4B?=
 =?us-ascii?Q?Dulal0e0vrVcpVHtBqLEZpTZSfCuEaC/hS1ZVu48T+aWyVmTAQAlegKXA+zl?=
 =?us-ascii?Q?rahWj2fwOYIYwD4EcrNf4bB7AEA1/DSV1SVPu49xTZyLEwKfR9PDEedetIRZ?=
 =?us-ascii?Q?DsPwn+PPsYYfMuhqgPjeMXdKCgWV7ApJ4tEf6U/TZ2o7IFJ3QZLKJfTr13Zz?=
 =?us-ascii?Q?GXmiJ4SHZ84g9lHEOy7L4qNe/5ZSuqPztjiyRKX2Wqyn6lds/tcMLFzv0yMA?=
 =?us-ascii?Q?//2sBLbO7GE8fEwpBtfm9n3DbkQuoZJlWSjQ4VmZOBzTP3fJwPGMs4WDawdu?=
 =?us-ascii?Q?HCInQhtQFTchIvOkm8M=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(14060799003)(35042699022)(36860700013)(1800799024)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 16:14:16.6601 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66c901b8-8ad8-430c-cd49-08de1573e0a5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB11242
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

This patch adds common helpers to issue power commands, poll
transitions, and validate domain state, then wires them into the L2
on/off paths.

The L2 power-on sequence now delegates control of the SHADER and TILER
domains to the MCU when allowed, while the L2 itself is never delegated.
On power-off, dependent domains beneath the L2 are checked, and if
necessary, retracted and powered down to maintain proper domain
ordering.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
v2:
 * Updated GENMASK to GENMASK_U64 to address kernel test robot warnings
   for 32-bit systems.
 * Removed panthor_pwr_read_status() in favour of a simple gpu_read64()
   operation on the PWR_STATUS register.
 * Renamed panthor_pwr_info_show() to panthor_pwr_debug_info_show() for
   more clarity.
 * Added additional WARN_ON for an invalid domain when requesting power
   domain transition.
 * Made panthor_pwr_domain_transition()'s expected val logic more
   readable and clearer.
 * Wait on domain power transition instead of failing the operation.
 * Fixed inconsistent error return value vs kerneldoc.
 * Removed confusing drm_dbg in delegate_domain() in favor of a comment.
 * Add unwind to panthor_pwr_delegate_domains().
 * Moved child domain handling logic from panthor_pwr_l2_power_off()
   into panthor_pwr_domain_force_off().
 * Added additional clarification regarding delegation and retraction of
   power domains.
 * Minor formatting and readability changes and remove unnecessary
   checks.
---
 drivers/gpu/drm/panthor/panthor_pwr.c  | 378 +++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_pwr.h  |   4 +
 drivers/gpu/drm/panthor/panthor_regs.h |   1 +
 3 files changed, 383 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_pwr.c b/drivers/gpu/drm/panthor/panthor_pwr.c
index da64fe006a8b..cd529660a276 100644
--- a/drivers/gpu/drm/panthor/panthor_pwr.c
+++ b/drivers/gpu/drm/panthor/panthor_pwr.c
@@ -23,6 +23,14 @@
 	 PWR_IRQ_COMMAND_NOT_ALLOWED | \
 	 PWR_IRQ_COMMAND_INVALID)

+#define PWR_ALL_CORES_MASK		GENMASK_U64(63, 0)
+
+#define PWR_DOMAIN_MAX_BITS		16
+
+#define PWR_TRANSITION_TIMEOUT_US	(2ULL * USEC_PER_SEC)
+
+#define PWR_RETRACT_TIMEOUT_US		(2ULL * USEC_PER_MSEC)
+
 /**
  * struct panthor_pwr - PWR_CONTROL block management data.
  */
@@ -59,6 +67,323 @@ static void panthor_pwr_irq_handler(struct panthor_device *ptdev, u32 status)
 }
 PANTHOR_IRQ_HANDLER(pwr, PWR, panthor_pwr_irq_handler);

+static void panthor_pwr_write_command(struct panthor_device *ptdev, u32 command, u64 args)
+{
+	if (args)
+		gpu_write64(ptdev, PWR_CMDARG, args);
+
+	gpu_write(ptdev, PWR_COMMAND, command);
+}
+
+static const char *get_domain_name(u8 domain)
+{
+	switch (domain) {
+	case PWR_COMMAND_DOMAIN_L2:
+		return "L2";
+	case PWR_COMMAND_DOMAIN_TILER:
+		return "Tiler";
+	case PWR_COMMAND_DOMAIN_SHADER:
+		return "Shader";
+	case PWR_COMMAND_DOMAIN_BASE:
+		return "Base";
+	case PWR_COMMAND_DOMAIN_STACK:
+		return "Stack";
+	}
+	return "Unknown";
+}
+
+static u32 get_domain_base(u8 domain)
+{
+	switch (domain) {
+	case PWR_COMMAND_DOMAIN_L2:
+		return PWR_L2_PRESENT;
+	case PWR_COMMAND_DOMAIN_TILER:
+		return PWR_TILER_PRESENT;
+	case PWR_COMMAND_DOMAIN_SHADER:
+		return PWR_SHADER_PRESENT;
+	case PWR_COMMAND_DOMAIN_BASE:
+		return PWR_BASE_PRESENT;
+	case PWR_COMMAND_DOMAIN_STACK:
+		return PWR_STACK_PRESENT;
+	}
+	return 0;
+}
+
+static u32 get_domain_ready_reg(u32 domain)
+{
+	return get_domain_base(domain) + (PWR_L2_READY - PWR_L2_PRESENT);
+}
+
+static u32 get_domain_pwrtrans_reg(u32 domain)
+{
+	return get_domain_base(domain) + (PWR_L2_PWRTRANS - PWR_L2_PRESENT);
+}
+
+static bool is_valid_domain(u32 domain)
+{
+	return get_domain_base(domain) != 0;
+}
+
+static bool has_rtu(struct panthor_device *ptdev)
+{
+	return ptdev->gpu_info.gpu_features & GPU_FEATURES_RAY_TRAVERSAL;
+}
+
+static u8 get_domain_subdomain(struct panthor_device *ptdev, u32 domain)
+{
+	if ((domain == PWR_COMMAND_DOMAIN_SHADER) && has_rtu(ptdev))
+		return PWR_COMMAND_SUBDOMAIN_RTU;
+
+	return 0;
+}
+
+static int panthor_pwr_domain_wait_transition(struct panthor_device *ptdev, u32 domain,
+					      u32 timeout_us)
+{
+	u32 pwrtrans_reg = get_domain_pwrtrans_reg(domain);
+	u64 val;
+	int ret = 0;
+
+	ret = gpu_read64_poll_timeout(ptdev, pwrtrans_reg, val, !(PWR_ALL_CORES_MASK & val), 100,
+				      timeout_us);
+	if (ret) {
+		drm_err(&ptdev->base, "%s domain power in transition, pwrtrans(0x%llx)",
+			get_domain_name(domain), val);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void panthor_pwr_debug_info_show(struct panthor_device *ptdev)
+{
+	drm_info(&ptdev->base, "GPU_FEATURES:    0x%016llx", gpu_read64(ptdev, GPU_FEATURES));
+	drm_info(&ptdev->base, "PWR_STATUS:      0x%016llx", gpu_read64(ptdev, PWR_STATUS));
+	drm_info(&ptdev->base, "L2_PRESENT:      0x%016llx", gpu_read64(ptdev, PWR_L2_PRESENT));
+	drm_info(&ptdev->base, "L2_PWRTRANS:     0x%016llx", gpu_read64(ptdev, PWR_L2_PWRTRANS));
+	drm_info(&ptdev->base, "L2_READY:        0x%016llx", gpu_read64(ptdev, PWR_L2_READY));
+	drm_info(&ptdev->base, "TILER_PRESENT:   0x%016llx", gpu_read64(ptdev, PWR_TILER_PRESENT));
+	drm_info(&ptdev->base, "TILER_PWRTRANS:  0x%016llx", gpu_read64(ptdev, PWR_TILER_PWRTRANS));
+	drm_info(&ptdev->base, "TILER_READY:     0x%016llx", gpu_read64(ptdev, PWR_TILER_READY));
+	drm_info(&ptdev->base, "SHADER_PRESENT:  0x%016llx", gpu_read64(ptdev, PWR_SHADER_PRESENT));
+	drm_info(&ptdev->base, "SHADER_PWRTRANS: 0x%016llx", gpu_read64(ptdev, PWR_SHADER_PWRTRANS));
+	drm_info(&ptdev->base, "SHADER_READY:    0x%016llx", gpu_read64(ptdev, PWR_SHADER_READY));
+}
+
+static int panthor_pwr_domain_transition(struct panthor_device *ptdev, u32 cmd, u32 domain,
+					 u64 mask, u32 timeout_us)
+{
+	u32 ready_reg = get_domain_ready_reg(domain);
+	u32 pwr_cmd = PWR_COMMAND_DEF(cmd, domain, get_domain_subdomain(ptdev, domain));
+	u64 expected_val = 0;
+	u64 val;
+	int ret = 0;
+
+	if (drm_WARN_ON(&ptdev->base, !is_valid_domain(domain)))
+		return -EINVAL;
+
+	switch (cmd) {
+	case PWR_COMMAND_POWER_DOWN:
+		expected_val = 0;
+		break;
+	case PWR_COMMAND_POWER_UP:
+		expected_val = mask;
+		break;
+	default:
+		drm_err(&ptdev->base, "Invalid power domain transition command (0x%x)", cmd);
+		return -EINVAL;
+	}
+
+	ret = panthor_pwr_domain_wait_transition(ptdev, domain, timeout_us);
+	if (ret)
+		return ret;
+
+	/* domain already in target state, return early */
+	if ((gpu_read64(ptdev, ready_reg) & mask) == expected_val)
+		return 0;
+
+	panthor_pwr_write_command(ptdev, pwr_cmd, mask);
+
+	ret = gpu_read64_poll_timeout(ptdev, ready_reg, val, (mask & val) == expected_val, 100,
+				      timeout_us);
+	if (ret) {
+		drm_err(&ptdev->base,
+			"timeout waiting on %s power domain transition, cmd(0x%x), arg(0x%llx)",
+			get_domain_name(domain), pwr_cmd, mask);
+		panthor_pwr_debug_info_show(ptdev);
+		return ret;
+	}
+
+	return 0;
+}
+
+#define panthor_pwr_domain_power_off(__ptdev, __domain, __mask, __timeout_us)            \
+	panthor_pwr_domain_transition(__ptdev, PWR_COMMAND_POWER_DOWN, __domain, __mask, \
+				      __timeout_us)
+
+#define panthor_pwr_domain_power_on(__ptdev, __domain, __mask, __timeout_us) \
+	panthor_pwr_domain_transition(__ptdev, PWR_COMMAND_POWER_UP, __domain, __mask, __timeout_us)
+
+/**
+ * retract_domain() - Retract control of a domain from MCU
+ * @ptdev: Device.
+ * @domain: Domain to retract the control
+ *
+ * Retracting L2 domain is not expected since it won't be delegated.
+ *
+ * Return: 0 on success or retracted already.
+ *         -EPERM if domain is L2.
+ *         A negative error code otherwise.
+ */
+static int retract_domain(struct panthor_device *ptdev, u32 domain)
+{
+	const u32 pwr_cmd = PWR_COMMAND_DEF(PWR_COMMAND_RETRACT, domain, 0);
+	const u64 pwr_status = gpu_read64(ptdev, PWR_STATUS);
+	const u64 delegated_mask = PWR_STATUS_DOMAIN_DELEGATED(domain);
+	const u64 allow_mask = PWR_STATUS_DOMAIN_ALLOWED(domain);
+	u64 val;
+	int ret;
+
+	if (drm_WARN_ON(&ptdev->base, domain == PWR_COMMAND_DOMAIN_L2))
+		return -EPERM;
+
+	ret = gpu_read64_poll_timeout(ptdev, PWR_STATUS, val, !(PWR_STATUS_RETRACT_PENDING & val),
+				      0, PWR_RETRACT_TIMEOUT_US);
+	if (ret) {
+		drm_err(&ptdev->base, "%s domain retract pending", get_domain_name(domain));
+		return ret;
+	}
+
+	if (!(pwr_status & delegated_mask)) {
+		drm_dbg(&ptdev->base, "%s domain already retracted", get_domain_name(domain));
+		return 0;
+	}
+
+	panthor_pwr_write_command(ptdev, pwr_cmd, 0);
+
+	/*
+	 * On successful retraction
+	 * allow-flag will be set with delegated-flag being cleared.
+	 */
+	ret = gpu_read64_poll_timeout(ptdev, PWR_STATUS, val,
+				      ((delegated_mask | allow_mask) & val) == allow_mask, 10,
+				      PWR_TRANSITION_TIMEOUT_US);
+	if (ret) {
+		drm_err(&ptdev->base, "Retracting %s domain timeout, cmd(0x%x)",
+			get_domain_name(domain), pwr_cmd);
+		return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * delegate_domain() - Delegate control of a domain to MCU
+ * @ptdev: Device.
+ * @domain: Domain to delegate the control
+ *
+ * Delegating L2 domain is prohibited.
+ *
+ * Return:
+ * *       0 on success or delegated already.
+ * *       -EPERM if domain is L2.
+ * *       A negative error code otherwise.
+ */
+static int delegate_domain(struct panthor_device *ptdev, u32 domain)
+{
+	const u32 pwr_cmd = PWR_COMMAND_DEF(PWR_COMMAND_DELEGATE, domain, 0);
+	const u64 pwr_status = gpu_read64(ptdev, PWR_STATUS);
+	const u64 allow_mask = PWR_STATUS_DOMAIN_ALLOWED(domain);
+	const u64 delegated_mask = PWR_STATUS_DOMAIN_DELEGATED(domain);
+	u64 val;
+	int ret;
+
+	if (drm_WARN_ON(&ptdev->base, domain == PWR_COMMAND_DOMAIN_L2))
+		return -EPERM;
+
+	/* Already delegated, exit early */
+	if (pwr_status & delegated_mask)
+		return 0;
+
+	/* Check if the command is allowed before delegating. */
+	if (!(pwr_status & allow_mask)) {
+		drm_warn(&ptdev->base, "Delegating %s domain not allowed", get_domain_name(domain));
+		return -EPERM;
+	}
+
+	ret = panthor_pwr_domain_wait_transition(ptdev, domain, PWR_TRANSITION_TIMEOUT_US);
+	if (ret)
+		return ret;
+
+	panthor_pwr_write_command(ptdev, pwr_cmd, 0);
+
+	/*
+	 * On successful delegation
+	 * allow-flag will be cleared with delegated-flag being set.
+	 */
+	ret = gpu_read64_poll_timeout(ptdev, PWR_STATUS, val,
+				      ((delegated_mask | allow_mask) & val) == delegated_mask,
+				      10, PWR_TRANSITION_TIMEOUT_US);
+	if (ret) {
+		drm_err(&ptdev->base, "Delegating %s domain timeout, cmd(0x%x)",
+			get_domain_name(domain), pwr_cmd);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int panthor_pwr_delegate_domains(struct panthor_device *ptdev)
+{
+	int ret;
+
+	if (!ptdev->pwr)
+		return 0;
+
+	ret = delegate_domain(ptdev, PWR_COMMAND_DOMAIN_SHADER);
+	if (ret)
+		return ret;
+
+	ret = delegate_domain(ptdev, PWR_COMMAND_DOMAIN_TILER);
+	if (ret)
+		goto err_retract_shader;
+
+	return 0;
+
+err_retract_shader:
+	retract_domain(ptdev, PWR_COMMAND_DOMAIN_SHADER);
+
+	return ret;
+}
+
+/**
+ * panthor_pwr_domain_force_off - Forcefully power down a domain.
+ * @ptdev: Device.
+ * @domain: Domain to forcefully power down.
+ *
+ * This function will attempt to retract and power off the requested power
+ * domain. However, if retraction fails, the operation is aborted. If power off
+ * fails, the domain will remain retracted and under the host control.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+static int panthor_pwr_domain_force_off(struct panthor_device *ptdev, u32 domain)
+{
+	const u64 domain_ready = gpu_read64(ptdev, get_domain_ready_reg(domain));
+	int ret;
+
+	/* Domain already powered down, early exit. */
+	if (!domain_ready)
+		return 0;
+
+	/* Domain has to be in host control to issue power off command. */
+	ret = retract_domain(ptdev, domain);
+	if (ret)
+		return ret;
+
+	return panthor_pwr_domain_power_off(ptdev, domain, domain_ready, PWR_TRANSITION_TIMEOUT_US);
+}
+
 void panthor_pwr_unplug(struct panthor_device *ptdev)
 {
 	unsigned long flags;
@@ -103,6 +428,59 @@ int panthor_pwr_init(struct panthor_device *ptdev)
 	return 0;
 }

+void panthor_pwr_l2_power_off(struct panthor_device *ptdev)
+{
+	const u64 l2_allow_mask = PWR_STATUS_DOMAIN_ALLOWED(PWR_COMMAND_DOMAIN_L2);
+	const u64 pwr_status = gpu_read64(ptdev, PWR_STATUS);
+
+	/* Abort if L2 power off constraints are not satisfied */
+	if (!(pwr_status & l2_allow_mask)) {
+		drm_warn(&ptdev->base, "Power off L2 domain not allowed");
+		return;
+	}
+
+	/* It is expected that when halting the MCU, it would power down its
+	 * delegated domains. However, an unresponsive or hung MCU may not do
+	 * so, which is why we need to check and retract the domains back into
+	 * host control to be powered down in the right order before powering
+	 * down the L2.
+	 */
+	if (panthor_pwr_domain_force_off(ptdev, PWR_COMMAND_DOMAIN_TILER))
+		return;
+
+	if (panthor_pwr_domain_force_off(ptdev, PWR_COMMAND_DOMAIN_SHADER))
+		return;
+
+	panthor_pwr_domain_power_off(ptdev, PWR_COMMAND_DOMAIN_L2, ptdev->gpu_info.l2_present,
+				     PWR_TRANSITION_TIMEOUT_US);
+}
+
+int panthor_pwr_l2_power_on(struct panthor_device *ptdev)
+{
+	const u32 pwr_status = gpu_read64(ptdev, PWR_STATUS);
+	const u32 l2_allow_mask = PWR_STATUS_DOMAIN_ALLOWED(PWR_COMMAND_DOMAIN_L2);
+	int ret;
+
+	if ((pwr_status & l2_allow_mask) == 0) {
+		drm_warn(&ptdev->base, "Power on L2 domain not allowed");
+		return -EPERM;
+	}
+
+	ret = panthor_pwr_domain_power_on(ptdev, PWR_COMMAND_DOMAIN_L2, ptdev->gpu_info.l2_present,
+					  PWR_TRANSITION_TIMEOUT_US);
+	if (ret)
+		return ret;
+
+	/* Delegate control of the shader and tiler power domains to the MCU as
+	 * it can better manage which shader/tiler cores need to be powered up
+	 * or can be powered down based on currently running jobs.
+	 *
+	 * If the shader and tiler domains are already delegated to the MCU,
+	 * this call would just return early.
+	 */
+	return panthor_pwr_delegate_domains(ptdev);
+}
+
 void panthor_pwr_suspend(struct panthor_device *ptdev)
 {
 	if (!ptdev->pwr)
diff --git a/drivers/gpu/drm/panthor/panthor_pwr.h b/drivers/gpu/drm/panthor/panthor_pwr.h
index b325e5b7eba3..3c834059a860 100644
--- a/drivers/gpu/drm/panthor/panthor_pwr.h
+++ b/drivers/gpu/drm/panthor/panthor_pwr.h
@@ -10,6 +10,10 @@ void panthor_pwr_unplug(struct panthor_device *ptdev);

 int panthor_pwr_init(struct panthor_device *ptdev);

+void panthor_pwr_l2_power_off(struct panthor_device *ptdev);
+
+int panthor_pwr_l2_power_on(struct panthor_device *ptdev);
+
 void panthor_pwr_suspend(struct panthor_device *ptdev);

 void panthor_pwr_resume(struct panthor_device *ptdev);
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index 5469eec02178..18702d7001e2 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -72,6 +72,7 @@

 #define GPU_FEATURES					0x60
 #define   GPU_FEATURES_RAY_INTERSECTION			BIT(2)
+#define   GPU_FEATURES_RAY_TRAVERSAL			BIT(5)

 #define GPU_TIMESTAMP_OFFSET				0x88
 #define GPU_CYCLE_COUNT					0x90
--
2.49.0

