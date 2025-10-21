Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD7DBF799D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 18:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458A710E237;
	Tue, 21 Oct 2025 16:12:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="EY3nEraE";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="EY3nEraE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010043.outbound.protection.outlook.com [52.101.69.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82EE210E611
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 16:12:10 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=E3zQIx49q4+eH8c4MBcEyUpDTdzRRW+6kivHjjkJ2Rt4hsoM0Y1k9cgM8Fy2PAMrmtxKlhAUL5lfGaoLz5pZk3J+1o2C7ye65u6YQZCi8wqmxxVqfuGRtwMUHLaPcCA2RMg+t+FxyYj3SHp6nzPRI8Ob7GnUOHH3ntwBJA62pRqpdWXt0Tfs4M6b0397h8EACPCvQbaATijxEj7X8Ddx4Ct1wO1NDjpYx+OpdjwFhznSW/yKPbZsIQdzzvj9DHt7zRb1vrTjiOuYU0o4Hy65T7D7r5jVD5yAVYN2UUbdqD1hdqIGEXpyry4qdLBUvPP057/Zm/6d8z0KzyHqhFk7DA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/c+NhDxISpEly1JM6PfDsyZ0zj/4CSmkyJovvOgmw1c=;
 b=npAgRhiNqYQ5V4dbSW7+2a5iwwLjtBMAWvc4Vx2G/tNgl0JM9aFR10We3fe2Jf2KWRjCswaT1LT9etYEngOnclTnpS8xu/O4jom7SSIK84ibN5yWOQC4IjfX6mYBd2/jjKFRVFx17QtY4Eh+OM5EguKnFNurQKVe2YkBpovTdt/6S2iajllig+BBuBRrkjruJGExuLP30W8DWjjERbYWRMsYE1k+xvS1DMEDNcMwHmdyxxuhLfaWBmx2txobuoaMxZR5iqgwVTCaj75/zVYd3qmjWtxZrm8kNYWe5cDgFFDjHcUqLQ6w0A8lVrR9bt7IFfzd6Nrnx33a+8AF8LE71Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/c+NhDxISpEly1JM6PfDsyZ0zj/4CSmkyJovvOgmw1c=;
 b=EY3nEraE905QmAJFJMYfhrylMYBfH9wgHRKGKYz3NkHG5YY28MmEOZfdmopXSAI5w6J82w9fO28LZ3o1kq+BqYvZnBlTwAjikvWVV9p0Z3mT3Fx8CfGnEjSU9u8fXcdMkLTYdiWBX4NNfxYqW0LjSb2Ke4yk3IPPBZLQqLf1j5E=
Received: from DU2PR04CA0053.eurprd04.prod.outlook.com (2603:10a6:10:234::28)
 by VI0PR08MB11081.eurprd08.prod.outlook.com (2603:10a6:800:257::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 16:10:45 +0000
Received: from DU2PEPF00028CFE.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::29) by DU2PR04CA0053.outlook.office365.com
 (2603:10a6:10:234::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.16 via Frontend Transport; Tue,
 21 Oct 2025 16:10:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028CFE.mail.protection.outlook.com (10.167.242.182) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Tue, 21 Oct 2025 16:10:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TCmsh8ke1iVz9nGlYaXQnTVBWCvMDyf/kqKVPRSAU4KXyFYMNkAEWc1V8m0lfn+skzHXKFhZORgDAAtYbS4GLOwyvFTqR2RL6GlnRpgdswGhq1ZOImJ7jVZqqjRbgxL/77H38p7T7VStJj1B02vjeOYlw9aATmtAfVoK4beiuOVNf/GxljH7fODO3xgfLm96EO39b02BC6qrDpqAIkumIOwr3u8Pfu5UdW25UtmIjNwte9jViSjRRWx7/6mZz3Cw+5KfSnM+EPj/2KN1jwr6XOVlWIwiVBxKcJuvCu7wWlVqaerAxrmKvPFT/VWXwodR0z4pK+AVTq71661bcdd5JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/c+NhDxISpEly1JM6PfDsyZ0zj/4CSmkyJovvOgmw1c=;
 b=a1ANkb6QZ8ySS71aCNKBtfTYF7Ph/WJdNcQ7zS9OhAuqq3/zPQ7yBnBoCLu21rUNwfF8Yn84E8NxDBoD0T5ONaykDF2K0tNhY8PBdK6FxwPTkb5uAzonMeaDQEWooinxKFOr+tRsc7nNy0mqfJq8K5k1rWNp2FNvuPokHdbFq6HSzSD1EZZN0Smfb4N+Mecs+IecqqIrwmnqrKxk4QTPNtbdLWgz2qei2uVBWbgIYS9EwfKCqhmHUgUM2CGIEZibkg4dvOYdhUtl/X1R9LfY2Vi6Xp/RzCTODl/baCOgVb2z+eOcYlDEoJu3rhhiBD11V8o673XlqBFwIXoF2fu6Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/c+NhDxISpEly1JM6PfDsyZ0zj/4CSmkyJovvOgmw1c=;
 b=EY3nEraE905QmAJFJMYfhrylMYBfH9wgHRKGKYz3NkHG5YY28MmEOZfdmopXSAI5w6J82w9fO28LZ3o1kq+BqYvZnBlTwAjikvWVV9p0Z3mT3Fx8CfGnEjSU9u8fXcdMkLTYdiWBX4NNfxYqW0LjSb2Ke4yk3IPPBZLQqLf1j5E=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by AS8PR08MB8370.eurprd08.prod.outlook.com (2603:10a6:20b:56b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.15; Tue, 21 Oct
 2025 16:10:10 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd%4]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 16:10:10 +0000
From: Akash Goel <akash.goel@arm.com>
To: sumit.semwal@linaro.org,
	gustavo@padovan.org,
	christian.koenig@amd.com
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, nd@arm.com,
 Akash Goel <akash.goel@arm.com>, stable@vger.kernel.org
Subject: [PATCH] dma-fence: Fix safe access wrapper to call timeline name
 method
Date: Tue, 21 Oct 2025 17:09:51 +0100
Message-Id: <20251021160951.1415603-1-akash.goel@arm.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0063.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::14) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|AS8PR08MB8370:EE_|DU2PEPF00028CFE:EE_|VI0PR08MB11081:EE_
X-MS-Office365-Filtering-Correlation-Id: f2807782-9fab-4e78-6a5d-08de10bc63a1
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?6wbAkGvxB8d1G8F7GebYyT6viXoM8AZa3bJtLFZmaSE+mmi+FkP9DzpYgQpf?=
 =?us-ascii?Q?oQTGiZLAsxjEtke4QFYOS74XJ/tLml/01Pjxl182///pnObR/rvrzmkGKrEi?=
 =?us-ascii?Q?jdEHgGStSpR84DJc84CXboAq7kZZZHonmX0S616d0K2+dwnCX8xdwWFPbkde?=
 =?us-ascii?Q?S48/HWXmt8xhn6Uz5dnPPhwivov0ab55ynZ9oeTMs1Cqqu5LijdWkFWwXFsD?=
 =?us-ascii?Q?NLZocCd68gxOJKJO5ag05rKX1TbM9L+o2I84l71RavKybpsDBn5aZ7r732+g?=
 =?us-ascii?Q?3x7nj1r+iJCpXZRb84YgLNNGCdLKPtX84iLZxA3kovTeHXbpOXC28JbXqzQx?=
 =?us-ascii?Q?l2v+xPcgjiFXOAhe/+6ozhVcqyPNynQkdahV75KQqsamWSnqWu4zhhpX+Eot?=
 =?us-ascii?Q?tyeGDxnwZV4Uxe1g41EBpojaNp3hnNPAiVW8OGrImM00vheOQd9n86cGtUqL?=
 =?us-ascii?Q?gkmCQTBMXnbG68wBKxMlf6Oytwz/XPDolwAdtPG4muVSuk2WZPPbcHV42tPg?=
 =?us-ascii?Q?Hd5N40F9BmCiPVILCwg2RoClme8DSiqjn7JJunMI5e6eu6561HmLS9rt1M3X?=
 =?us-ascii?Q?u8wFePec6NncVsmThVW1lAiCTVxYFeyZT+8wh2GH7QJq8hDmzMesjaOR9syW?=
 =?us-ascii?Q?9oD0SAVggJ0Rtp/fpCv6tjX+/x174Ijv/MoOAVp42a/aPsicfMPierr84dyh?=
 =?us-ascii?Q?nQ8TsnTE3fmQ5iNJGFsVDIv2+ko6AubEDoxls7ocbPQ8eE1FKZ4y740ZJbJj?=
 =?us-ascii?Q?SwzwqGyIW/LxcztW4p1Uooo2Oy6g1RgtCVltK/Ew0uHWIZ5/GvwzCyVZBdzU?=
 =?us-ascii?Q?caTFaTpAG5opobgaFvZaiiHeiii3brudXqvMQEg4U4Rt3dbl8M7sKmNqgl98?=
 =?us-ascii?Q?D9pesW7C6Zjq9VUWvm1K7bZyKBbOzQ0Y1u+MeiwLHLFZnW1JdtQEyRa1418F?=
 =?us-ascii?Q?0ctk7tbPqiA//W7VqfRGhpsB+DOkkI7ceW7m0P57mNl3GAsr5xq4aO2W1Uer?=
 =?us-ascii?Q?qOYwLVZQFpRb3ytsWbW9uk4HlV15E/imfpbN/uRF+Gn8jKwjUAjcEtr9gBzh?=
 =?us-ascii?Q?NR4uyzA4fZbbG/eDFPJYNeGhiUxolbfZGb6DO/KrWys9WU1Gof028/jcqypb?=
 =?us-ascii?Q?PC4lJafQkj0YVAiniAv2/qYnfHWyxzRau4ITbUSF9P/9aBMVJfNQ7oKPTLVS?=
 =?us-ascii?Q?Vx3OYf5YXuZqXS3vNZmWL4CLOEDEsmlsmt3mT6oAA20uwK28ISIqymPRhTNK?=
 =?us-ascii?Q?+OdLAmpT5Mmk5okD1XBJynRsBErKEgpFPMMxoYJB5oyKNiXk083tRVr5s9wQ?=
 =?us-ascii?Q?pHD7sumADJoYqpk0yvhnZtqu3aoSUuDh/BQbq91rjnpCuwXoa1gWK/lp9qTp?=
 =?us-ascii?Q?rSlboIJW+gsW0z/qe/qzEZBWeTbtkvrtQkABjgtkJZWM90clrsBaEGbLgzZC?=
 =?us-ascii?Q?oM9eEoVoVZ4sNoM8Ll+/rSe4RBN0LC73?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8370
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028CFE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5869f847-298f-4406-a5a1-08de10bc4f37
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|14060799003|35042699022|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jl3Njxlc2lzTqVv3iyy4uK85VmIGFigNS2OpWHs96yeTky/HylRUb2MhIlxp?=
 =?us-ascii?Q?uiB1umbJAVt7LlqHis9uVJRhrVdq7M4l9/ofJ6+D071Pt7exXUJs+CUT1jis?=
 =?us-ascii?Q?vrU5+rk6R+4bbc+P2VBEyYLH1Dgv1BXQ4Wog4y9wRgw4WBG2ih8Fg2B/PxzI?=
 =?us-ascii?Q?kLSsEgTy7a4xqAig6bQGio6/MWAFAJwhYXuWLAt9sZUvbjuLzXXSetvgrZPe?=
 =?us-ascii?Q?zLacODceGOs7nT9hrgwHaVy72W4QNhTe+gREqm9TyFMJkrGY67XArKmEHehb?=
 =?us-ascii?Q?mWMlj+dUZsdSTTWKD53BPiq1UZPnn7K0eRbnnuyY+STsL/b9uo6HvcuIxOju?=
 =?us-ascii?Q?5DHzb4jpUg3mgCOfuVID88RB1uOx+Gd462cWzs9oYiL93tpZiAF7K5UiBAdX?=
 =?us-ascii?Q?AUep+EHG/qmxRdqoDAeE0+jCJ89FGCzsp+9T4qRATIlyGEGN3MZ/YDdjvM9/?=
 =?us-ascii?Q?wYlpD2R8H4yJsaxtmIjz1yEbS2Pj6Y9gT4t/KK85Q4lc7ptsToOuOxjg9Bav?=
 =?us-ascii?Q?t0xxmSt9Gm20STl9ae63QtXowcntMr9xOVe+kEuxGpyyBR/KywQY5jRNw+Y0?=
 =?us-ascii?Q?DpwH4IGzbTggJjZodu5w68GzEazp7dmPpdlcdtp2M7rYg1WUkdnj9A3Oz4/w?=
 =?us-ascii?Q?WgdCaWXDZ0mdD+OM7M59Q6h68qoBe8ehvT8EAzekir8rZxc1B+C8RXJ7PTQD?=
 =?us-ascii?Q?4KbNWBdR1sIt4BsBZzZmKbBMLyyOvyrx1Uew6YDaVCXqiaMCkdhyHiAsFLm0?=
 =?us-ascii?Q?IovOZYo4h8w4muzZru0k1toOHJ8grTknmnaxrrVfoaCfCj++kU2TZ/5L+OB2?=
 =?us-ascii?Q?hpnjwC6t1XeKGdUSSCfpLm1tGtGjPTcw/UsBKdk2ibwHTtwTjHKzuO1zyYzp?=
 =?us-ascii?Q?f+mKYaAh91s2mYW2T1hwjqBiVllM31wrGtfi3HMvQZMgF13whqT+m5ELcZ0X?=
 =?us-ascii?Q?gImMYdcy6izNIikHiF0rO1S+8RbSeuXaoSJ5MHMMkc2h6LNUkwZSFRBJWTP6?=
 =?us-ascii?Q?CfXbp1ld12RA4dsr30q2Awp+SdiDSnocoP6aQT2b7eVtWORKf4or0RPvjcfT?=
 =?us-ascii?Q?MQs1//6DVt2Lon3WQX25ImQ8DRsMOBw+BVKDh7+4vRt9/7unMDZKZSBkDDVA?=
 =?us-ascii?Q?8moDwsjERZAf8GFTdCXphKYhGpG5ms6wQMRDyU9y5IBAk1sWOvMva8YYqoT2?=
 =?us-ascii?Q?v6+8iP7emc2r4OZEfl3u7XDSTVIlS8n0ZVFJ9SIhx3x0LLz7Zg+tDScOK55I?=
 =?us-ascii?Q?d1wSQ6TBvSytAoK95G1JGpX8ixojItZurHmp0JcTDRT1FBO++hyxlvTd3gKf?=
 =?us-ascii?Q?ytK4dQ3d2nJhvjM4FnFHCpG6AphGaFSvNT/qr/tfJhWD034Nk1xWIqcGzDzP?=
 =?us-ascii?Q?B336kkMZcOtJ4oCNaj+AlcJpj9RhnuLznoopBeZXiJpNZdwNy5Pz4gEj1mia?=
 =?us-ascii?Q?ehAG2FhvtMNkQYD4XBp8cmIlX1GoXQWFEoyCxE9CyzYRkOOQtNyWiRYR/v3r?=
 =?us-ascii?Q?ALi6conCeq9Tu37s2dm89zmjX4DV3f/0lVZwDGhm4S2URda0I4Uxh4/8yml+?=
 =?us-ascii?Q?g+TGv0sDpqMac964bDA=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(14060799003)(35042699022)(1800799024)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 16:10:44.3555 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2807782-9fab-4e78-6a5d-08de10bc63a1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028CFE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11081
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

This commit fixes the wrapper function dma_fence_timeline_name(), that
was added for safe access, to actually call the timeline name method of
dma_fence_ops.

Cc: <stable@vger.kernel.org> # v6.17+
Signed-off-by: Akash Goel <akash.goel@arm.com>
---
 drivers/dma-buf/dma-fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 3f78c56b58dc..39e6f93dc310 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -1141,7 +1141,7 @@ const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
 			 "RCU protection is required for safe access to returned string");
 
 	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
-		return fence->ops->get_driver_name(fence);
+		return fence->ops->get_timeline_name(fence);
 	else
 		return "signaled-timeline";
 }
-- 
2.25.1

