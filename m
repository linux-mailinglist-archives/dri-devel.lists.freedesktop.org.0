Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA5EA25B0C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 14:36:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48AA810E4BF;
	Mon,  3 Feb 2025 13:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="FhHUUcGc";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FhHUUcGc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2056.outbound.protection.outlook.com [40.107.20.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0CBD10E4BF
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 13:36:47 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jG8JP2TpZBaXUcAgM70rPIIyWsfAjB276GOZRA8si0iga6HM8ohvBPTcjQ6iLyB5aRQfBrVcHqNJvB94sV1YyaxRXnLTiNcgPATcYGJ0qFOLEO0OgdJghiIXeNxRFNzNgRwd5yjy/wxbA4opkU3+HTWSgGxaWaABKZ1v4lQVSr6LATxEECAk8rP3uQTmUB+B6t2LnZN2uOvFd9LKoi3ojzB7DB8e9WGWcF5+TQu5t7EgRpFD3uEUgI25cpWF/AX0MJ1vLfYSRZI0Sl1HfvG1+6xseYoLLXj2PGWRJmMLB5XJ/2NYhzaMRMJ/D/MdCaIV23LzEI8EtvsYwS02jsi4OQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytOIF8/G+tK40t7/ZaXrVLgKW+kAlxeNdM7zLKYcMQQ=;
 b=g8sTq8IUQT5i2SgNg7gL5VOBKeCNRzX7QGuZabuFhmAQf5q6YYX/BhfeUdku9oK4JB94PpodBGWcROM5eTxYk1dxT827qAder9nimBNO2a5bdiNNH7h+3E7a34MyMgoFuR8QtqDSx724Oqeco7kdmGHUj/3iorht6IaRKMEXcR7aih1dIPJzEoCSGD+uO+X3rvAqjDrpWR+tIE6eT/OqnBHIHl7RrAvO2PlePH2cXXyIQUppkz+LlxsfCOzIF20tk3mZkJX7Tn+1hHLmsLuXH1eis2fNeDPXbxyYgbiJQT3u0/vlgFqpeAkIUAsxn8cmzj0EjkUJwzT0A+fDaIeByQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytOIF8/G+tK40t7/ZaXrVLgKW+kAlxeNdM7zLKYcMQQ=;
 b=FhHUUcGc4FJllCThRJPwdNgjbNqNW0KDLJXW0qPjiKKuFKY494O/nsV7tTLXGf2V0o6Ke7WlMbra8ktERLBQ/FKEUL315pNCEOvAdO0nWP44YEv5o9xqkznJJ0j1NtOyxgxRtvdruYmtZM/VuXrAEC4f8VjZ9juxQ96Tw5wcj2M=
Received: from DB3PR06CA0020.eurprd06.prod.outlook.com (2603:10a6:8:1::33) by
 FRZPR08MB11137.eurprd08.prod.outlook.com (2603:10a6:d10:138::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.21; Mon, 3 Feb
 2025 13:36:43 +0000
Received: from DB1PEPF00039233.eurprd03.prod.outlook.com
 (2603:10a6:8:1:cafe::d3) by DB3PR06CA0020.outlook.office365.com
 (2603:10a6:8:1::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Mon,
 3 Feb 2025 13:36:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00039233.mail.protection.outlook.com (10.167.8.106) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14
 via Frontend Transport; Mon, 3 Feb 2025 13:36:42 +0000
Received: ("Tessian outbound ca1ab514ff10:v560");
 Mon, 03 Feb 2025 13:36:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c516da758971352c
X-TessianGatewayMetadata: mi7oNd4h6a9Jom0jyV9mXnwvUBnxLKa6VOm4o0P88K0/IhBsDfsE+kOaKfd8en0KkXWDWkpXP3vOUqbGNTILWyCHr49HElYGcUFG1ZVsDIHrFoxp1d/SuYMOayfSDQjEL+KkKq2d2BDkvBI8PX9vi+iZuMPpdmrbs0g6jnsiGBI=
X-CR-MTA-TID: 64aa7808
Received: from Le8426c48ec50.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C4B78B34-881A-4890-BA3E-FE2180A0F18A.1; 
 Mon, 03 Feb 2025 13:36:30 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Le8426c48ec50.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 03 Feb 2025 13:36:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PGrlnR7PLYTcI5XoL66WdjBm86oxFRKi1wnludWCLb/PfYvdPiJV9aFV1PgtsImJoUSCu6D4j89Mf/itpUQKfIsA0Lr2uJ1t83VqWVdoS9stLU9P6H1mgfMV0vhkEZqSE3HQSmQ2TvHJmrG/WuOETuFEy21pJC+5fSUwLzBSFwX+VgobNpbMgMxoU4lM0Bq84UY4/XkZlB9vCG/rVfGVOMTSSc8w6KAu4LxSh9q3dykujvsdtDXZMru1BIckbvKZ5dwr4EstIPC74DXEV99GH1P3QObQdJXv/EvIfo/BYEEs7zcemD88h043dTBOM8a8bvylbop71ZSVWW7mxzLMlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytOIF8/G+tK40t7/ZaXrVLgKW+kAlxeNdM7zLKYcMQQ=;
 b=IPkzqLp6YWpvNkShImiy6QVPXHFsVFD+/wjPp9LDdY/vhZX1eMw45JvHRP1A0Azn8ssbtEO9kVIuZFvppAkkugnXQ1K2NAb03BNW5zfGqO79/u2T5p/Kbv0KEiSyh2HBMC4GTp0HvKdb7mE+zcFzCSOCvd3f3wb7A2Dpm3FkbHz0NxRMVw/WrkjngtSIEXHf9Dwl2ALZp2C3EM379dzCvwlOrfFHC8+9Bivok8ITwbRHgyfCZYG7nwAA6/2h2KBwZ2JErJ8KujUFnxnTqETzxMmcrEe7/lATvSUFs+GV0TdHxznrsYvdP+XFh4dq1RxdAzRpzGSmT4jxL4nvmPjmwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytOIF8/G+tK40t7/ZaXrVLgKW+kAlxeNdM7zLKYcMQQ=;
 b=FhHUUcGc4FJllCThRJPwdNgjbNqNW0KDLJXW0qPjiKKuFKY494O/nsV7tTLXGf2V0o6Ke7WlMbra8ktERLBQ/FKEUL315pNCEOvAdO0nWP44YEv5o9xqkznJJ0j1NtOyxgxRtvdruYmtZM/VuXrAEC4f8VjZ9juxQ96Tw5wcj2M=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS4PR08MB7925.eurprd08.prod.outlook.com (2603:10a6:20b:574::8)
 by VI1PR08MB5360.eurprd08.prod.outlook.com (2603:10a6:803:132::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 13:36:27 +0000
Received: from AS4PR08MB7925.eurprd08.prod.outlook.com
 ([fe80::8ef3:b027:e22f:1ea7]) by AS4PR08MB7925.eurprd08.prod.outlook.com
 ([fe80::8ef3:b027:e22f:1ea7%7]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 13:36:27 +0000
Message-ID: <be8e6b9f-c3c6-41d1-af9c-3dcd102f0fe3@arm.com>
Date: Mon, 3 Feb 2025 13:36:25 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/5] dt-bindings: dma: Add CMA Heap bindings
To: Maxime Ripard <mripard@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yong Wu <yong.wu@mediatek.com>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, nd@arm.com,
 Akash Goel <akash.goel@arm.com>
References: <cover.1738228114.git.florent.tomasin@arm.com>
 <771534be8dfa2a3bdc3876502752f518224b9298.1738228114.git.florent.tomasin@arm.com>
 <ats2unrml5a7vbpdrqrzowodrsfj44bnubpbujg2igk3imeklx@nrpmg5oeq3gz>
Content-Language: en-GB
From: Florent Tomasin <florent.tomasin@arm.com>
In-Reply-To: <ats2unrml5a7vbpdrqrzowodrsfj44bnubpbujg2igk3imeklx@nrpmg5oeq3gz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0401.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::10) To AS4PR08MB7925.eurprd08.prod.outlook.com
 (2603:10a6:20b:574::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS4PR08MB7925:EE_|VI1PR08MB5360:EE_|DB1PEPF00039233:EE_|FRZPR08MB11137:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f28d728-679d-4e18-9196-08dd4457cb93
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?OGVkYndjcElRUGF3V0trZ3diNjZrdk9zZUo4QWdHNmg5aVAxc0lINFd2WG01?=
 =?utf-8?B?N1hNRFk2RHFvV0VLV1hFZExlSWRlWldSaHZMTzZtRlZ2NzduUVpFUXh4NkdH?=
 =?utf-8?B?ZlJCM2plN0FhUFNRZEM3Q2ZwbVlIRnV0TU84WVhWOHYxSlBnZWlLR3hrWGNo?=
 =?utf-8?B?UlRhQXIrNnJMUjVJL0hhem5aRDEzcE5EaXV3dmJXWE4yWmE0L3NaYjA5Zlp6?=
 =?utf-8?B?S204Y0k5ajdtYzJsVjRSV1RzWUQ2UTFOODlhSldpUWZ1dGlyTVFGY0hFRnZP?=
 =?utf-8?B?ZGFCcUFJQ2R1MEhYQjNuOEtQZ3hZZjZ0K3BJRVhrRlFVMjRuYk52bG4yY0hM?=
 =?utf-8?B?VFFHRXQyNlJ3K2VuQTZiY2dQNGZvQUpkVXRpVHVBT0Rib3M3Smg0OHpGVk1a?=
 =?utf-8?B?TjRpVzJmSHZ6Q2NpMDNqanZtYUUrZThLcmlCd05zWTF4VjBwazdNU3VHc3ps?=
 =?utf-8?B?UjBzQXQ2YlN0R0pDVGs4T09YTG5CM0ZYOU9ZOVNWZ1ZQbVRzeUJPSWNmd3NN?=
 =?utf-8?B?UnJPd1VCVXUrWCtia2NseUI4bVpYVnVtU2N2QnQ0RjFYVEtDcDZnSUtzdVgy?=
 =?utf-8?B?VWNPVVRjTGZZU1ltVXNOa3pNd2FreU1XRTlPUzZxM1l1NHdzQTcrNGZkc3Nm?=
 =?utf-8?B?elhNWEF5Qzd2a2wzald3S3oyeUZOYTI0aGRUazZ3ZlhyeklTek4rbzdpNmxl?=
 =?utf-8?B?cWhac2RJTkhyYUtXKysvank4UlRkYzE0SXl3M0lwRUJwYnoxMlFsaVNkTVRF?=
 =?utf-8?B?MHFtU2M5ZXFER0NRbFEzRVJDTnk2SUtoRkY5TURvYmxpMGFqQzBUcmNHYWJP?=
 =?utf-8?B?UlMzZ0tkZERlM0ZKU3RRUVdDK1RMZ0RoQ0lvNWZmd2J2ZDNMRTlnaTNnT1hW?=
 =?utf-8?B?Y3ZvdzNzNGlxY0pSRlpIZE5SVjBoY1p3bWt0dDhkZnRmd3FlUDFNbDc0cEJs?=
 =?utf-8?B?ZlMyMlZRTDJQMDR6dTFGczZ2K0QzTVFnOE03NGhNWXE5ZWNINTFtZ0VzVXVZ?=
 =?utf-8?B?dCs0Y1BKM1crK3ZJZjU1YlQ3Q3pQcmZ4ZHAzR2RNZnRRZ2NUMTZKcjZEUEFi?=
 =?utf-8?B?TndVekRTY05GY3c4VDIweTBtdkJGUWVWZjVHUTdjclA1V1NEYldJc3JWdkli?=
 =?utf-8?B?dXFwMHdWOGN3VEwwQ1R2TksrSVJmZ3BFaHRCbVBQeVVhZDR6UXdValVKNHFG?=
 =?utf-8?B?NFhzV01UYmhxRjVSbGpVYm4xZ0UwQVJqSDBiNncrY3NSOVh6QUZXeHp4WEUw?=
 =?utf-8?B?TWJzT1ZsQS96b3FnNE9hOW1rMkM1dkI2SHdHUXJzcVo0NlJYKytsWEMyK05P?=
 =?utf-8?B?bDhReWlpME8rRGd0RkpCeHRRNHZmcUpIVk8wM0YzT2NqWHdCTWhaSFhlMXRJ?=
 =?utf-8?B?ZUhYSkhxM291STdZZ2lsTkdWWVdENFdGOUdsNnM3Wi9OYUdoWHJWWHZMVita?=
 =?utf-8?B?VVRPL2E2djNrMlpDYjhXOG51OVlQQTRrMkhlS0lmOUJieStZLzlCRlc2TjlX?=
 =?utf-8?B?VEV1RkUxQ1hvNWFIUm9XT3JaemRCeFJuc21IOWRCT1UxR09mekE4eVVCblo1?=
 =?utf-8?B?NFoyRVdQS3pSM0RaQ09RMjA1S3FWUUNhY2MwZXZ4RHI0NUxId0lrNTNscEha?=
 =?utf-8?B?bUFuQWZIWUwwR3JBMExoUWtyd25CUzQxYnZTTkJVeXdzS3RKcTNCK0dIZVZo?=
 =?utf-8?B?eUdtUEs3eHRQNmxtL0hKRStiV3JDVWRHd1ZoczhET1BYZS8wU2hyMnZGS1B5?=
 =?utf-8?B?VGVUYU5CWlMrQWtOckovcm5NTVZSdkFjdVRSdUdjbGpIUkdHOVdML3A1UC9D?=
 =?utf-8?B?VjBMM1Vuam1SUWZjcnF0UT09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AS4PR08MB7925.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5360
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:574::8];
 domain=AS4PR08MB7925.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5ab6a181-4a5f-4395-949a-08dd4457c236
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|35042699022|82310400026|36860700013|1800799024|14060799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3NGekdqQlA1L1lINlFYYXp2dG9pZG5YbW5oeGplN0lHbjBPbTA3RUZncFd0?=
 =?utf-8?B?dzgybS9uMncxa0NSejY4T0U1cUVacnFTeGJQeEM2WnBadE9yczZEOXZ6d0VB?=
 =?utf-8?B?amVDRjQ0amc2SEp1OHY1U08wYjd0WHB4MHVGTzA5K29iREQrUHJvSE1nMEo2?=
 =?utf-8?B?aHFvQWhUbjVhQ0EzdGo4RU1HMEZOYnBpbHFUYlZrbDE0bDdnakc0ZVVBRlVx?=
 =?utf-8?B?S0JtK2xVWFQvdGdhM1N6aWh0clFra2IxZThuRlFqOFBCM1NpSU5jeFp2Uk40?=
 =?utf-8?B?MHRSRzVCeGFuZ0ZPSWcxTGh6a055dG1PM2lFSTF2MHFEeTN5WTRTbG1DZ3FY?=
 =?utf-8?B?V1JHMmVnMzVOMDA5bFhrZllLVEJHZ2lVTVJ2VjgyUldrNHl0REViZEttWXpQ?=
 =?utf-8?B?MzdtRGxQZ3MzSUhJdUZyazBxU1JST2xDT2JVZFRLa0RKTHZMeU01bjlsRFlC?=
 =?utf-8?B?TkRzaGpxWHZOZjdoY2RnRjlpQkdvUFl1V3YvVFZFdnR1TytTMnRETTVoYWFY?=
 =?utf-8?B?S0xwNXFkRGxXa3U3aXZSMmxCM1lsaml1UFl5WDBxNzROMFZzNXJJTk41NWla?=
 =?utf-8?B?ekhTWTl2aFRZSU9Ick1wV29YLzc3d1pGZVZ5T1pnd3l6Y0xtLytwc1Noa1oy?=
 =?utf-8?B?V0tTOFRSTWZoRHhWamxqRzVBTG53RGRQaGp6a1JTT1c5MVNGMWVIaWlFMzVY?=
 =?utf-8?B?SlFGdUxlTjJRN3FFaVVTa1U0d0xTcjdIQlhVTXE5aGxWQzQxWExnWENEOUZa?=
 =?utf-8?B?U2poMFp0ZEJBNFFERmh2U3pna2Z6Zk50Q1Z3L2FhcGdYNHFRbnQ3REhVOVlL?=
 =?utf-8?B?MFB4WHd2OGZ5cDYwN0l3dmxXY0xPRE0zbXhDZ1RZR0FoRGNXOUVyWWZRYXli?=
 =?utf-8?B?anVYc1kzdXYvYm9RZkxWeTA0OVluWGxSVHE0YVVia000dkVaV2pFSkc1dXcw?=
 =?utf-8?B?THliZ2padlprSXQrb1JmbTBGeVN0K1VrR203dElrTHZzWWZ5UGhpdmtGRzMx?=
 =?utf-8?B?R205a3JZczhwTFdIcWhMSndONWtFR05CWTh3TkhsMklWQUd5dnZzc285endn?=
 =?utf-8?B?OHBqM3JPMWJreSt4d1h1TXVoWTI1V1VzcnV1WnJzQ0dtUG5WYVZlRXR5WVJ3?=
 =?utf-8?B?QzVlRFhkbGhyUUJrNzM5T2gzajNFWFZNL3pOYmtRMUZYRnB6V20xL2NLWWox?=
 =?utf-8?B?aEk2L3BvaytEb3NMRkdGbVVxU3ZZZFhGa1Z6d1VaeTVUYWQxbFNIemdPalBL?=
 =?utf-8?B?ZCtkRW9hR09QbHhnVFZRbnZWQ3l1ZHZ1OUJaZUJxM3kwMUx5NzB1eHFmK2Y0?=
 =?utf-8?B?VjZ5Y0g3MDZuSVo0TmxKeGR6Wnd6cEdpMjNUenREcGdXL2EyKzY1aWJBam1l?=
 =?utf-8?B?YndTajZpOU5sTDUvVFNOMDNoWDhoRndVWmZwL2d5NWcyc3BkcDF3dUp2WjFy?=
 =?utf-8?B?NS9XcEZTdDFWSUJSNHhheDZyUTIvcDJ2UlBUUmZYWmpsdVJVdHdnMTI1TUZ2?=
 =?utf-8?B?WlFla3lUZFF0VDB6YXIwYzdDU0hWcG5SY0MwVEtPQnM5SlhVQkhhaGlwSFRo?=
 =?utf-8?B?LzZWTDR2Y0c2WXBOLzFnNWU5Nk1WK2dUZ254ems0ZCtrdHU4OW1MMXl5UG9L?=
 =?utf-8?B?YkhsbzFpZlpOTDJBT0FsTFRmNUZ0YWRjVEtlK1pMSmpNbytWWFdhRStpanVx?=
 =?utf-8?B?OVBOQWo3WjR2SWI1YzNUK3pMaUp1UHV5MFFXZ01JQnNFLzUzSUhqbU1VZUd5?=
 =?utf-8?B?RkFUQkQyZE04VVJSb2ZpdTRCTDJLWUFTWkpMUXEwOEF4a3hTR24vTjZNYndj?=
 =?utf-8?B?QnlxNWxOUVVUQ0xDQlNoRXkwRHh4ZjJ6T0Qya3R3dzZtbUcrQ3ZBVVF5YzJ0?=
 =?utf-8?B?VGVWdDE5WkozZGs0bG1RUUlGYXAzRTNTODZESkZJN2laMjNHd2RtZTNKejJR?=
 =?utf-8?Q?uEF55edZNuQ=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(376014)(35042699022)(82310400026)(36860700013)(1800799024)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 13:36:42.4611 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f28d728-679d-4e18-9196-08dd4457cb93
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB11137
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



On 30/01/2025 13:28, Maxime Ripard wrote:
> Hi,
> 
> On Thu, Jan 30, 2025 at 01:08:57PM +0000, Florent Tomasin wrote:
>> Introduce a CMA Heap dt-binding allowing custom
>> CMA heap registrations.
>>
>> * Note to the reviewers:
>> The patch was used for the development of the protected mode
>> feature in Panthor CSF kernel driver and is not initially thought
>> to land in the Linux kernel. It is mostly relevant if someone
>> wants to reproduce the environment of testing. Please, raise
>> interest if you think the patch has value in the Linux kernel.
>>
>> Signed-off-by: Florent Tomasin <florent.tomasin@arm.com>
>> ---
>>  .../devicetree/bindings/dma/linux,cma.yml     | 43 +++++++++++++++++++
>>  1 file changed, 43 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/dma/linux,cma.yml
>>
>> diff --git a/Documentation/devicetree/bindings/dma/linux,cma.yml b/Documentation/devicetree/bindings/dma/linux,cma.yml
>> new file mode 100644
>> index 000000000000..c532e016bbe5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/dma/linux,cma.yml
>> @@ -0,0 +1,43 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/dma/linux-cma.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Custom Linux CMA heap
>> +
>> +description:
>> +  The custom Linux CMA heap device tree node allows registering
>> +  of multiple CMA heaps.
>> +
>> +  The CMA heap name will match the node name of the "memory-region".
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - linux,cma
>> +
>> +  memory-region:
>> +    maxItems: 1
>> +    description: |
>> +      Phandle to the reserved memory node associated with the CMA Heap.
>> +      The reserved memory node must follow this binding convention:
>> +       - Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>> +
>> +examples:
>> +  - |
>> +    reserved-memory {
>> +      #address-cells = <2>;
>> +      #size-cells = <2>;
>> +
>> +      custom_cma_heap: custom-cma-heap {
>> +        compatible = "shared-dma-pool";
>> +        reg = <0x0 0x90600000 0x0 0x1000000>;
>> +        reusable;
>> +      };
>> +    };
>> +
>> +    device_cma_heap: device-cma-heap {
>> +      compatible = "linux,cma";
>> +      memory-region = <&custom_cma_heap>;
>> +    };
> 
> Isn't it redundant with the linux,cma-default shared-dma-pool property
> already?
> 
> Maxime

Hi Maxime,

Please correct me if my understanding is wrong,

The existing properties: linux,cma-default and shared-dma-pool, do not
allow the creations of multiple standalone CMA heaps, those will create
a single CMA heap: `dma_contiguous_default_area`? Other CMA heaps will
be bound to a driver.

I introduced the "linux,cma" to allow creating multiple standalone CMA
heaps, with the intention of validating the protected mode support on
Mali CSG GPUs. It was included in the RFC in there are interests in
this approach.

Since the Panthor CSF kernel driver does not own or manage a heap,
I needed a way to create a standalone heap. The idea here is for the
kernel driver to be an importer. I relied on a patch series to retrieve
the heap and allocate a DMA buffer from it:
- dma_heap_find()
- dma_heap_buffer_alloc()
- dma_heap_put()

Ref:
https://lore.kernel.org/lkml/20230911023038.30649-1-yong.wu@mediatek.com/#t


Since the protected/secure memory management is integration specific,
I needed a generic way for Panthor to allocate from such heap.

In some scenarios it might be a carved-out memory, in others a FW will
reside in the system (TEE) and require a secure heap driver to allocate
memory (e.g: a similar approach is followd by MTK). Such driver would
implement the allocation and free logic.

Florent


