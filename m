Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF967ABA072
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 17:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2853210EB13;
	Fri, 16 May 2025 15:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="kNZdnzqr";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="kNZdnzqr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011033.outbound.protection.outlook.com
 [40.107.130.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3708C10EB06
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 15:58:44 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JGG/RaEEOfTQqPYbE/w0UHqd6ikUKbCE5u8aSKuWnZGtqOTpBijzM1KWQvnU/ZQ6WmJQA0uhxt4grMBdBCcrfTRHIX/tft42nJT58Q/7C1bfLirQUJRDDffiu4zlQ2NSrxTxm7HMYH6RJmwUPJ30SVrGpNk2e5f1jYneZ45ceQc8hzpT9a4iO7L7bO37q3MKAkwCrSy/Mi1/My2KpiwptoEKUwXEazpfFP7e4yf0K5TpPA4EK8ISMUic5K06f6LGIUF8XARdebN2OTq4XFkARZndIJFkdzpM6gGiV8fFdU2m3n+KiVzHutiVO7UK0zJw3T4XBELe5UZQNs8SprfowA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dbmeB6q7nx42i1bKpe51O3YIWisAJBaSvHjUjyp7Or4=;
 b=bpjFerfS6IrZCo3JFXtmlxyMCG8BYQoiAYWVjXtqwnu1iNq5SC7zGKhV29OBzH/biq6J2t/S1CpFgMbVXxThdA5zf5Evvh5aqqnKF30hrzKAm3qgRKwDGtm7U1x39A0O4Mh3WfgchNcnJcbKZB61jJjAvwvE5yR2EqrlO845HllqwuER81XIuqCaff81D5JAb24wRy4MTJTR0Ap/56Sh3Go4sclUBJJ2dezDSTo6hn3wQlqkW2M2nnbxfkyXIh3rcM+GASqKTM4OHPJfXQETotoVUCq/RrGR43QDJMQUmyqVIJIQPdKpmTFcLlwB4RA/KQD6nIDF7M7omhKZeMNTOA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dbmeB6q7nx42i1bKpe51O3YIWisAJBaSvHjUjyp7Or4=;
 b=kNZdnzqrSUwxZZ2SxDt8BWSwn3+eyptzczcSq7jMt8/rcJbMmj1sjmHe+8XdKqtp/Xc7H+o5c6p2n/KgtXrF/bqIbInZMGRKVSgke2OEEtpVuMUIIGFQXyOytJMuKO0zSzcKxfPp/stzeAamDyOLusO4j9JB5iwPiI5Ojm2Z4sQ=
Received: from AM4PR07CA0031.eurprd07.prod.outlook.com (2603:10a6:205:1::44)
 by FRZPR08MB11161.eurprd08.prod.outlook.com (2603:10a6:d10:135::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 15:58:40 +0000
Received: from AMS0EPF000001B2.eurprd05.prod.outlook.com
 (2603:10a6:205:1:cafe::c7) by AM4PR07CA0031.outlook.office365.com
 (2603:10a6:205:1::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12 via Frontend Transport; Fri,
 16 May 2025 15:58:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B2.mail.protection.outlook.com (10.167.16.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.27
 via Frontend Transport; Fri, 16 May 2025 15:58:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cO9hrzd/4PFDkB5HGHHD1Y349xWw4e3tT/VN61DFQlrsDBFd/u7/j6HRKiu0V8sF9cpw3mSYp/JbtB1T7+t9g/lQs+1Y2NbjaCwaRC9gJMHV8xmNi+bMZGyWYJEjJGLDAOa3lO5nX+Tc+LxBbNstH+NbO8l7BO/aHwilVnEgAkXIdIQXwmAzkqTYNQ/mVQhO3pLEKL2k13vR1EZSXAkzyV4FME9YSUIuoZTPsDMYSQbRmhJatB7GNakql23EtL32UHEvP1yYAX2EwexfoEbSgiJkTJbV33dlNItZqb+X19xvX2hKo/NWQaARbl8QGreKQjRg4gBOmZiCAO6VGQlXXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dbmeB6q7nx42i1bKpe51O3YIWisAJBaSvHjUjyp7Or4=;
 b=BkFTdHGQnHOBHNaUWs2tFjOQJZXP6WAK2kYP6IC88oOv7XT1sGCZTdRY6AvuwYk4UxpiF8axQwUmAzYsVjPsLwS+SXbj0jt4qMME7y3lRiXAEsZHVwVEWouSgbW1eyGSyQbEY2+TC7HPxoSWlUkRi4HzCRlze2+L35bH1uiYsKpJxaV9J6bjEo/0++Vi+zOumOgfSsJww0Xncev4Px8exeq6UqjUaxDvQORI/830rSAwDnp0rx0EdhO9wmWeGXnc1XdlWenGz1U+nvdbl3ze53aNnocVJGa8dOLbDRkO2Q9cVmzGPCv7valdlwbXvfs8zVsE/XA3VrEP7zmzBUEnlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dbmeB6q7nx42i1bKpe51O3YIWisAJBaSvHjUjyp7Or4=;
 b=kNZdnzqrSUwxZZ2SxDt8BWSwn3+eyptzczcSq7jMt8/rcJbMmj1sjmHe+8XdKqtp/Xc7H+o5c6p2n/KgtXrF/bqIbInZMGRKVSgke2OEEtpVuMUIIGFQXyOytJMuKO0zSzcKxfPp/stzeAamDyOLusO4j9JB5iwPiI5Ojm2Z4sQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com (2603:10a6:208:5c::16)
 by DU4PR08MB11174.eurprd08.prod.outlook.com (2603:10a6:10:577::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Fri, 16 May
 2025 15:58:07 +0000
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc]) by AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc%4]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 15:58:07 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: [PATCH v4 2/7] drm/panthor: Add DEV_QUERY.PERF_INFO handling for Gx10
Date: Fri, 16 May 2025 16:49:36 +0100
Message-Id: <90e9521ad4deb13fd098f30ab3edae55cde8b5f5.1747148172.git.lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
In-Reply-To: <cover.1747148172.git.lukas.zapolskas@arm.com>
References: <cover.1747148172.git.lukas.zapolskas@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0226.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::15) To AM0PR08MB3315.eurprd08.prod.outlook.com
 (2603:10a6:208:5c::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM0PR08MB3315:EE_|DU4PR08MB11174:EE_|AMS0EPF000001B2:EE_|FRZPR08MB11161:EE_
X-MS-Office365-Filtering-Correlation-Id: ebb1d074-181a-4fc4-cc28-08dd94928625
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?TXhKVEtHMWZ4dndGYmRqWFhmTWR5d1QwUXd0U21qL3JXWTd5MkJNSmRuOG5Q?=
 =?utf-8?B?OEd3RDYzVnZEOHI3RnhRRGJ4L0J3bG1YcHltM3V0bWJGNGp5SFo3aWdKZENh?=
 =?utf-8?B?eHZrVlUrOEJ5emNUSTRDeHZlV2lqOTBGbXdYRGdRREVxZ0FCa1VsY2RpcGNo?=
 =?utf-8?B?a3lLTVBCdE5zWTQrOVd5c3FJd2pHRzhQeWpMbFdyZi9Ld0JhRkl1cTVkbGxD?=
 =?utf-8?B?ZytWM2FDZ1hZZm1FeWlYUUgzOENjczdRZTFNbEowRHJCK29JVzRVdGhTUDZm?=
 =?utf-8?B?MlhSNEFBaEdpRDlacXA2b1dkQWkzWEdTck9hNzFFVjBjMi9rbFZiZkNvd1Rq?=
 =?utf-8?B?NGxjd1BRd0licUN3TnE5bWNYcERuUVlkaGhFdExTb2RzdmtoSnFIZVFJTmhi?=
 =?utf-8?B?SE5uRjhQcjB2elpRZ1hXZTdhZjY5bmRZOW45R3dzU0hOdHk0VitZODFBVTZq?=
 =?utf-8?B?dXNjQ24rY3k0VmRPc3VtZ2ZBQ2FiL0U5VXRibmJTRHlKckN0ZkpVdHBydnFj?=
 =?utf-8?B?UXJoeTVIVTN0NmdLT1k1NVhIUGRwUVpqbXgwMHZQbjVjNWg4WCttNjZka2JB?=
 =?utf-8?B?SFRLYk5sVHc3MWVHRXNUNnU5c0FOajl5MS9HS1Y2SmVTaGRlY0JHZnVxNGIx?=
 =?utf-8?B?WS9SS0orUDY1bGFEcFAzcnJhYTNzbGVHeGlOcVYwMUlHUUNiaEZGN1AwN3o1?=
 =?utf-8?B?cmZSNEVKMWtXQ0ozQ0c0cHlPcitpb3NwTmNBZ29tVVVjSkkrNkFLRGllOHZT?=
 =?utf-8?B?WmhUa0IwSHRJclVOY1c0d3FBcmhsY1FMWjdaT2R2MjRsRDVDRnJsR1NKbElL?=
 =?utf-8?B?R1hrT1RmaE5oTnVjQy81Q1EyaHR5ZTNYL3hnYVdwN2Y4Yjh3RGg0cHRVclRU?=
 =?utf-8?B?MFN3aHNRcGM1U1pwNDZZeGptbk4wTFhiZTk4YTFWSHBVcXA3Q3FjZDlOaWhW?=
 =?utf-8?B?QlhKS3FORldodFovYTVwYkJnRWE2eVhVOEFoRVpuZmpCOWNBTFlTQUJ4NkRl?=
 =?utf-8?B?N293TGRMTE10cTJuOXpTNk5kV09VZWFNNVlZaVpsQlAweWM0WmxROW0ydUxF?=
 =?utf-8?B?WGEvR1lrYlN4ZDdWY2FhTVBXQ0UrQjZUZERIZ3RMdkJDWDB4K0NNeWhuS1Mw?=
 =?utf-8?B?bmtyVGlMZkt5bURRV2VsanBEWGJyWjg5V1JLSUZiWE9aVE9VS29zYmFpSUtp?=
 =?utf-8?B?S0tPVHRDVlBMQmtlR3FpeGxic2NEZXgrd3BuUFdCQWt0ME5uOGNHWnN3ck1I?=
 =?utf-8?B?NkxUWTBEUVVRZXpYQyt6azJsVmJPRkJVWHN2NzgybTBheGJjTm1EcmNINkw4?=
 =?utf-8?B?Vnc4OHNWK3RYQ3JWWTBQMG1KYlpBa1JwS2hmN0N3WmdFYThOMFo3OVBwa2Vz?=
 =?utf-8?B?SkZWY1hNR2JIaHlWVy9RelllcUYybDZmNy9vVm53aWpXYy9qbmV0YXBmVjhW?=
 =?utf-8?B?ejh2NFplZHA2b1dEbnRodEU3SjFHeWhYQUxlRUNjemt0Szk3dnRCU0orZmFv?=
 =?utf-8?B?bklrSXloUkkwY1VMaWQwQjViL3Q4a004QU1KanYzWWpDL0tjWUVrRDhIcnE1?=
 =?utf-8?B?Q3hua1BRNDlrVndVenU5UVlEdHZjZlFxa0dnYnEyQXZEWDkvOWp3enpMS2lY?=
 =?utf-8?B?cE5FK0lYZE15amhWL1dWelVBcElpZmJFZTdsczVJemsxMG4wekord3UzbmFM?=
 =?utf-8?B?Zit4c1d6cFg5SEhhVmwxNGQyYTF1UVBiTmZ0bmE1czlQbnZRMkNuam94Tit1?=
 =?utf-8?B?QUxYaVk2OEJMTlNHTExOSTJ1NVM4VGhoTUYwdFpzT0tPYlNyOHR5QlprYlBl?=
 =?utf-8?B?QVVKaXhKN3FScUdVMFJsSGxYOGZZbkVnakQrR1pTdXJYaGdMYTcwUVNSLzZR?=
 =?utf-8?B?VDZobTZFSEZCMFdRcytKOUhlTnlpbUZUZ1k1N0hQdXBOV2F3bDhzbjlkWEVD?=
 =?utf-8?B?YlRidFhGbURVdm5rTUlwT2NsQnl4NDg3RmJ1eGNoQURnQUVrdTNoR2VVRWpL?=
 =?utf-8?B?R1NxNWlWYVlBPT0=?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR08MB3315.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016)(921020); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11174
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: fb4fd9ee-f01d-4f3c-645f-08dd949272e7
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|14060799003|35042699022|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WFNKdm1VbjVoenI0Y21SQ2ozRXBnVXF3ZjhHb3NFM3VDb0VQUjZqMW5nU1o0?=
 =?utf-8?B?WWc5ZWZhTXhRdktqZEdlalFGNXd1NUlVTThtcmhKSEJqUDlueHpaQkJ6UmhN?=
 =?utf-8?B?NEVCSmRZalZGenR2VjFRT3hlZlRKSHREakxGSDdzUkcyODRPcDRLQ1Bvb0xD?=
 =?utf-8?B?UG1PeTErSmR2L2ZwTXU2dFk3VG1OTVNMajZ1dkpqRkZaS3AyUU14Z01ZTXBs?=
 =?utf-8?B?NnRLM1creUdDRUFpVk9weFc5NlZDaUw2QnJ1d3B0ak9FVUNzNXVIeGhMTHc2?=
 =?utf-8?B?ZUFEUmR3NU5wSWZDdUV4L2hpSG0yVU94emJXSzlRQ1hsY2poL3c1UWNuU29G?=
 =?utf-8?B?dXpHZm95Z080NDhjdGpkVXBxWnRoV05uVlQrdkkwT2J3dFI3WXdvN3JJWXhU?=
 =?utf-8?B?OWlvcjl3enhNbjVDT2F5TDRsUnBhL1NjQnpZb0hxK3U1WjNMZXBNYS8yOENh?=
 =?utf-8?B?VG9PakhlalFsaTJtSUo3MGNuZHROeHhwcGlXY04xOXArZWJ5RVlSclcrNXJl?=
 =?utf-8?B?S2ZxT1Q5WHFqVGthYXdkc0lMV1FVd3FNbytqYitZMjhKSWU4UzNlTlJWZUdJ?=
 =?utf-8?B?b2ZBVEtuYitiNkFjZTdyVWM1ZmFDcUV4eUMySnphM1hqcEpQeDdzVTViOWth?=
 =?utf-8?B?d2NZYjM5OU9DUExjWkR1bEY0VVVub0M5TGRZQyt0czlIMmxKV0xUT0prTDRh?=
 =?utf-8?B?K3dpVC9tMHFjTDlEUzVEZEdxelBHQnBxYXFhNkhiMEdIZTBmR0Nhd3VVQ2RT?=
 =?utf-8?B?TmdSRWpwcjBPaWVIN0ZhbS95YmhGaUdHRTZURGp5TnlYVUFYM1FwYlcxbU1T?=
 =?utf-8?B?VkVGY1VMcDhLT3BOWHc0WTlBWDZidjQ0T09BVFgyYkUvemdJS2Y2WlJqQ1FB?=
 =?utf-8?B?ZWRlVXpBNU9hUythVFFybWppMWt5T0ZiRGExcnFCcjlpVEhZTHNwbkJqdVN5?=
 =?utf-8?B?MEZrZnc5OEVlbHk0c1NEMG5kdjdoM0t0U1N6ZzhoemdLc0ZWTzhKTXROTkJZ?=
 =?utf-8?B?NWZJdzBDd21BZWpLeHNGK01lUStVaW9pdHEwdWZReHk5NERSazJ6SDdzUDNC?=
 =?utf-8?B?R3puV2NRakxTblZGRmJsZ0NDV1RwZlFweENaQjR1UThxaXIyS3VPQTluUDFU?=
 =?utf-8?B?b0RVSkVBMXV4UG9YMHY1dmtnQmNpL3ZncXhXcmRIZ2RQVkpCdnJJbkpWYmlO?=
 =?utf-8?B?MXFuaU03SXBGN0NybG5PM2YxenJMWVJJOXBLREtjNEtPNUVMUGRWRW5XbHh4?=
 =?utf-8?B?Smh2ZTFGalZiekVhVzVUajN2VjNmSnJkdXNHVU55UU5oajB0UktFYjBiSG5V?=
 =?utf-8?B?ZVRaTlBoalhUOGZTRU1nNEhKUUdGM09ac0lyY0ZQVmVqMjRFN0FZNU1MNnFO?=
 =?utf-8?B?UXhPZHY0YWtjMkhwM2VaWDJBR01IeS9xR3U4azBEdFhXNk1SV29xejUzVllr?=
 =?utf-8?B?U1dLbnBUbXhIcFFpZ3pvM09zZDR2bFBRd29hMEFZbG9LeTNaekdOYzVDNVMr?=
 =?utf-8?B?dDdGcDROdHBCY2dnMDJZZ0RyVUp5VkFyc3hLNFRkWkI5RjFmaHR5OTZ0UnNQ?=
 =?utf-8?B?NTd5L2dlc05WYmVVd3cxM2RFTlIxRWRBYVYxV3pMM0ZaakZuSCt2NmoxbHov?=
 =?utf-8?B?ODM3YjNzODdzN0tDck5ucU44aHNqcWtwazhscE5BcEhjT2t3MzdnRjhWemxq?=
 =?utf-8?B?MHVvWTROclZ4RnRQdk10Ri8wVG9sbGdpOGhRcjh5MzZIcjdndmVnVTZHbEVR?=
 =?utf-8?B?alhWenBHelpJVWVFOU8xTlBuZkhWMEZxczRKQkNiQ3NFV3J1SzNWanNXSWV3?=
 =?utf-8?B?Ykw0bkw5eTA3OEY0R2ZQQ3lMWVZvRjdJNy9PYzB6aE1DcGZudFg4c1lVWUhl?=
 =?utf-8?B?Vld2REd3bjhpVW5QTnFkNWJQeGd5TWlYYW85ZU1YNndiQ09keHdlUnZQVzhu?=
 =?utf-8?B?cnZaNnhUcjFZM1ZSYWlDZW1JWmFoQjVic3Fld3B0QnNiTU1YOUVXR05jczMr?=
 =?utf-8?B?bW5rcEZHeTlTYnpicFM0R3FaL0FSTHViWFNWcGhlSC9qRUhzNWR6bFBRQVFh?=
 =?utf-8?B?cFpCNzZQZm9jMmVxeXkycFNZZmNkS2UxQUlTZz09?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(14060799003)(35042699022)(1800799024)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 15:58:39.2294 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebb1d074-181a-4fc4-cc28-08dd94928625
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB11161
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

This change adds the IOCTL to query data about the performance counter
setup. Some of this data was available via previous DEV_QUERY calls,
for instance for GPU info, but exposing it via PERF_INFO
minimizes the overhead of creating a single session to just the one
aggregate IOCTL.

Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/Makefile         |  1 +
 drivers/gpu/drm/panthor/panthor_device.c |  5 ++
 drivers/gpu/drm/panthor/panthor_device.h |  3 +
 drivers/gpu/drm/panthor/panthor_drv.c    | 10 +++-
 drivers/gpu/drm/panthor/panthor_fw.h     |  3 +
 drivers/gpu/drm/panthor/panthor_perf.c   | 76 ++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_perf.h   | 15 +++++
 drivers/gpu/drm/panthor/panthor_regs.h   |  1 +
 8 files changed, 113 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_perf.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_perf.h

diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
index 15294719b09c..0df9947f3575 100644
--- a/drivers/gpu/drm/panthor/Makefile
+++ b/drivers/gpu/drm/panthor/Makefile
@@ -9,6 +9,7 @@ panthor-y := \
 	panthor_gpu.o \
 	panthor_heap.o \
 	panthor_mmu.o \
+	panthor_perf.o \
 	panthor_sched.o
 
 obj-$(CONFIG_DRM_PANTHOR) += panthor.o
diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index a9da1d1eeb70..76b4cf3dc391 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -19,6 +19,7 @@
 #include "panthor_fw.h"
 #include "panthor_gpu.h"
 #include "panthor_mmu.h"
+#include "panthor_perf.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
 
@@ -259,6 +260,10 @@ int panthor_device_init(struct panthor_device *ptdev)
 	if (ret)
 		goto err_unplug_fw;
 
+	ret = panthor_perf_init(ptdev);
+	if (ret)
+		goto err_unplug_fw;
+
 	/* ~3 frames */
 	pm_runtime_set_autosuspend_delay(ptdev->base.dev, 50);
 	pm_runtime_use_autosuspend(ptdev->base.dev);
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index da6574021664..657ccc39568c 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -120,6 +120,9 @@ struct panthor_device {
 	/** @csif_info: Command stream interface information. */
 	struct drm_panthor_csif_info csif_info;
 
+	/** @perf_info: Performance counter interface information. */
+	struct drm_panthor_perf_info perf_info;
+
 	/** @gpu: GPU management data. */
 	struct panthor_gpu *gpu;
 
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 06fe46e32073..9d2b716cca45 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -175,7 +175,8 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_sync_op, timeline_value), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
-		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs))
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_info, shader_blocks))
 
 /**
  * PANTHOR_UOBJ_SET() - Copy a kernel object to a user object.
@@ -835,6 +836,10 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
 			args->size = sizeof(priorities_info);
 			return 0;
 
+		case DRM_PANTHOR_DEV_QUERY_PERF_INFO:
+			args->size = sizeof(ptdev->perf_info);
+			return 0;
+
 		default:
 			return -EINVAL;
 		}
@@ -859,6 +864,9 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
 		panthor_query_group_priorities_info(file, &priorities_info);
 		return PANTHOR_UOBJ_SET(args->pointer, args->size, priorities_info);
 
+	case DRM_PANTHOR_DEV_QUERY_PERF_INFO:
+		return PANTHOR_UOBJ_SET(args->pointer, args->size, ptdev->perf_info);
+
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
index 6598d96c6d2a..8bcb933fa790 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.h
+++ b/drivers/gpu/drm/panthor/panthor_fw.h
@@ -197,8 +197,11 @@ struct panthor_fw_global_control_iface {
 	u32 output_va;
 	u32 group_num;
 	u32 group_stride;
+#define GLB_PERFCNT_FW_SIZE(x) ((((x) >> 16) << 8))
 	u32 perfcnt_size;
 	u32 instr_features;
+#define PERFCNT_FEATURES_MD_SIZE(x) (((x) & GENMASK(3, 0)) << 8)
+	u32 perfcnt_features;
 };
 
 struct panthor_fw_global_input_iface {
diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
new file mode 100644
index 000000000000..66e9a197ac1f
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_perf.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright 2023 Collabora Ltd */
+/* Copyright 2025 Arm ltd. */
+
+#include <linux/bitops.h>
+#include <drm/panthor_drm.h>
+
+#include "panthor_device.h"
+#include "panthor_fw.h"
+#include "panthor_perf.h"
+
+struct panthor_perf_counter_block {
+	struct drm_panthor_perf_block_header header;
+	u64 counters[];
+};
+
+static size_t get_annotated_block_size(size_t counters_per_block)
+{
+	return struct_size_t(struct panthor_perf_counter_block, counters, counters_per_block);
+}
+
+static size_t session_get_user_sample_size(const struct drm_panthor_perf_info *const info)
+{
+	const size_t block_size = get_annotated_block_size(info->counters_per_block);
+	const size_t block_nr = info->cshw_blocks + info->fw_blocks +
+		info->tiler_blocks + info->memsys_blocks + info->shader_blocks;
+
+	return sizeof(struct drm_panthor_perf_sample_header) + (block_size * block_nr);
+}
+
+/**
+ * PANTHOR_PERF_COUNTERS_PER_BLOCK - On CSF architectures pre-11.x, the number of counters
+ * per block was hardcoded to be 64. Arch 11.0 onwards supports the PRFCNT_FEATURES GPU register,
+ * which indicates the same information.
+ */
+#define PANTHOR_PERF_COUNTERS_PER_BLOCK (64)
+
+static void panthor_perf_info_init(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+	struct drm_panthor_perf_info *const perf_info = &ptdev->perf_info;
+
+	if (PERFCNT_FEATURES_MD_SIZE(glb_iface->control->perfcnt_features))
+		perf_info->flags |= DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT;
+
+	perf_info->counters_per_block = PANTHOR_PERF_COUNTERS_PER_BLOCK;
+
+	perf_info->sample_header_size = sizeof(struct drm_panthor_perf_sample_header);
+	perf_info->block_header_size = sizeof(struct drm_panthor_perf_block_header);
+
+	if (GLB_PERFCNT_FW_SIZE(glb_iface->control->perfcnt_size))
+		perf_info->fw_blocks = 1;
+
+	perf_info->cshw_blocks = 1;
+	perf_info->tiler_blocks = 1;
+	perf_info->memsys_blocks = GPU_MEM_FEATURES_L2_SLICES(ptdev->gpu_info.mem_features);
+	perf_info->shader_blocks = hweight64(ptdev->gpu_info.shader_present);
+
+	perf_info->sample_size = session_get_user_sample_size(perf_info);
+}
+
+/**
+ * panthor_perf_init - Initialize the performance counter subsystem.
+ * @ptdev: Panthor device
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int panthor_perf_init(struct panthor_device *ptdev)
+{
+	if (!ptdev)
+		return -EINVAL;
+
+	panthor_perf_info_init(ptdev);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
new file mode 100644
index 000000000000..3c32c24c164c
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_perf.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+/* Copyright 2025 Collabora Ltd */
+/* Copyright 2025 Arm ltd. */
+
+#ifndef __PANTHOR_PERF_H__
+#define __PANTHOR_PERF_H__
+
+#include <linux/types.h>
+
+struct panthor_device;
+
+int panthor_perf_init(struct panthor_device *ptdev);
+
+#endif /* __PANTHOR_PERF_H__ */
+
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index b7b3b3add166..d9e9379d1a20 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -27,6 +27,7 @@
 #define GPU_TILER_FEATURES				0xC
 #define GPU_MEM_FEATURES				0x10
 #define   GROUPS_L2_COHERENT				BIT(0)
+#define   GPU_MEM_FEATURES_L2_SLICES(x)			((((x) & GENMASK(11, 8)) >> 8) + 1)
 
 #define GPU_MMU_FEATURES				0x14
 #define  GPU_MMU_FEATURES_VA_BITS(x)			((x) & GENMASK(7, 0))
-- 
2.33.0.dirty

