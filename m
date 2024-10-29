Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 073039B49C6
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 13:36:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7FFC10E648;
	Tue, 29 Oct 2024 12:36:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="UQqBdOtm";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="UQqBdOtm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2047.outbound.protection.outlook.com [40.107.241.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D74410E648
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 12:36:03 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=pOfLtLaW/TMavlX0WWshDmaZ7DMGMsr1CzgTRct6EN5QxxdYdvBtzcf6Ed0ehHO1G+7reg2C+FS+stJ5Vq6E2ZEI8mbEpw9QOtqaPO4YnxO4eHXIcMoKYRcSPSgf5mpWb1mHqidlFf9iNjOeSczBwfp7SPOTBbZOKttctYfLg2CXz85Lb6nGAHw3hf/hUQ3lhJMrkbi7m/vbZFVraXT52g+l9bpwAnHO6zFFaxLLLWv6LHRxbSkK5vuaV49k0OBhEVc8VSd1l9jyek09d/ffBtdHNFtoX6U4/0qGu1wMmUKkR6wc/2mrnjMIajQ/3Q8IRiQHrKz9fEhsRYlQ2I0mNQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X5QvkRMpJhKeUObPT3q/ZP6Zupgv6gFCtptCwtAiKEk=;
 b=sGUWNaQ0s62f0T9jjLb47P0UNzm1IrDMTSkgx6oLQguHA/sDBq9piQQS8++OP4SN8uzq4iLAJ6DWxIqztzvBFpRmI19TTDFebyQq/JFkIMq663zFUn5EwY+vIFcfiMwag69SkQ8DjqhhRTULKUweNygexUsxvFpqNizfhi0U6k5vIV14fA3ncIt3EV3Iy/iMMS27zOZ2+ZAmHRwExcefYe80Xv7Sy4yy+Q9ws1FHJKkLMrvzeNt8XfuxlXFLtFMnZ+PMOovLQDCO+d+3cOpKkZwz0mZa4McC0dC8kkWmcpqORDyw4/bkl9Rqj/5Pg+OFY1pBm+Ia2YQfQPjoJARFRg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5QvkRMpJhKeUObPT3q/ZP6Zupgv6gFCtptCwtAiKEk=;
 b=UQqBdOtm9S1UuRRGJABdvL7dggsDvJIniogrHZ2vkgzYf6ZmYu9UwIX8TC4ij2XJHw10WsuqxU/dqgRxQTfIrINSORvgVn1TMrv5W0DiFOe53Zg+EwJa0yVNMrEH3KyK/S0/9zhab7Pgz61jeALfr+bscOrx4/mtcM/A3TwfmW4=
Received: from AS9PR06CA0563.eurprd06.prod.outlook.com (2603:10a6:20b:485::28)
 by PAVPR08MB9258.eurprd08.prod.outlook.com (2603:10a6:102:308::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 12:35:58 +0000
Received: from AM2PEPF0001C70C.eurprd05.prod.outlook.com
 (2603:10a6:20b:485:cafe::23) by AS9PR06CA0563.outlook.office365.com
 (2603:10a6:20b:485::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.29 via Frontend
 Transport; Tue, 29 Oct 2024 12:35:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C70C.mail.protection.outlook.com (10.167.16.200) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8114.16
 via Frontend Transport; Tue, 29 Oct 2024 12:35:57 +0000
Received: ("Tessian outbound 57fa7becdebd:v490");
 Tue, 29 Oct 2024 12:35:57 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 41c5699cc24ed2ab
X-TessianGatewayMetadata: katM5Gx88UH25zWNrAJLrf2n7pw9WSEBLY3MSxvP/fC7zXphzuw+ZOEnHH/UrqVnJA9z/KUEVkwUYUAPH2ga81KEidwz1KuqaYgxzpe9tJ75tR3Mb/0eJ44VPe3hVrqy/bylhk1SA/vGJcXQXN3BC2OcbdW7E12o631BRtdaDeI=
X-CR-MTA-TID: 64aa7808
Received: from Lc5f603043d8a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A7CF6E1E-DBCB-4741-8BCE-89524BF3D732.1; 
 Tue, 29 Oct 2024 12:35:51 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lc5f603043d8a.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 29 Oct 2024 12:35:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zDRYwPgeIit724Vd7zin0Pe3k00UNbqu9QUQeEEkgVInh06laOTui5PaiaX0JTR8q6AP0SkDotcy0QSMDtYU/AjRLcFDzFwQNM8jOyLDiC6NhVBMn63CXf9B1+kCmq9juZ++2i+KhkeJ85a2hMPcWerdcWCQCY+ouBo0fPcGPvdMiLQsLxNcEXOpUmA/54Mo9FoqKpSXrLFTydBgWq60FWcr9EqCEv7XnXoRRcxpzljYfFwwtDCv+RDd6NexMGIKC2jpTucK1dQJYOCA7CTAtO5iiLDB3buGBRstlNXLfgvzbk42k/COinryslyWkK4cDE3x7DukcaKx23Wg+npFfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X5QvkRMpJhKeUObPT3q/ZP6Zupgv6gFCtptCwtAiKEk=;
 b=nTz2U4ZoInrPwr6k0peqyp4mVodIuRN7n16lMn3iaxhQELOIdOFZNX7RC6lvrUo0x8VQvJVXA55Np/xTFdsTbh/Qcx+6LAM9P6CibOPjS6rHZVaxNtSeVR/J/pat7PBCh+elNMQVBgSOaUorsl+idBomHsblfTqgSeL4/VU5X+5rjMkkuXjyL13HlG3EVabgM0/+wMw4vBDOP2lREyITkgoQZP1WBIIzqVbllI55JoN0yCUDKhntjF/ceFqUyA52HNMqlBEkvij6yWXWPjvM/YcM6FPQm+SME6xRnRWXAh/DoH7x8LO0NM4ZWobGNCsOYrnbpA8HZwpzW1VnttdEOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5QvkRMpJhKeUObPT3q/ZP6Zupgv6gFCtptCwtAiKEk=;
 b=UQqBdOtm9S1UuRRGJABdvL7dggsDvJIniogrHZ2vkgzYf6ZmYu9UwIX8TC4ij2XJHw10WsuqxU/dqgRxQTfIrINSORvgVn1TMrv5W0DiFOe53Zg+EwJa0yVNMrEH3KyK/S0/9zhab7Pgz61jeALfr+bscOrx4/mtcM/A3TwfmW4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com (2603:10a6:20b:290::9)
 by PAWPR08MB9066.eurprd08.prod.outlook.com (2603:10a6:102:342::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Tue, 29 Oct
 2024 12:35:47 +0000
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c]) by AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c%3]) with mapi id 15.20.8093.027; Tue, 29 Oct 2024
 12:35:47 +0000
Message-ID: <4ec4b53d-69e6-44ee-ba1f-9d4e671368ed@arm.com>
Date: Tue, 29 Oct 2024 12:35:45 +0000
User-Agent: Mozilla Thunderbird
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, kernel@collabora.com
Subject: Re: [PATCH] drm/panthor: use defines for sync flags
To: Erik Faye-Lund <erik.faye-lund@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20241029094629.1019295-1-erik.faye-lund@collabora.com>
Content-Language: en-US
From: Mihail Atanassov <mihail.atanassov@arm.com>
In-Reply-To: <20241029094629.1019295-1-erik.faye-lund@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P123CA0021.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::9) To AS8PR08MB6263.eurprd08.prod.outlook.com
 (2603:10a6:20b:290::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6263:EE_|PAWPR08MB9066:EE_|AM2PEPF0001C70C:EE_|PAVPR08MB9258:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fc980f4-c48f-40de-7bd2-08dcf8163d41
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?Z1JtUjNMK205NUlXSXFWcG5VbzJFa0ovUkxqOEJXbHlDd2dWMmt3TWFIS0RJ?=
 =?utf-8?B?WFBkWjloUlFncXYrYisyR1FJRkdQa0FKL1VtT0FBK0dlbjFTUDVIcjNKTU9z?=
 =?utf-8?B?YmsycEQxamxINXF5Z1VTZitITHgxa01oazJ0K25STkhRbU1mcjd0R2xwa2hl?=
 =?utf-8?B?b0hRSXN2Mkh4TGxOYWRRN0JlOVpUN3RacjU2bW9JWmIya2NTaDQ4cCtlUFBs?=
 =?utf-8?B?NGIyTW96c04yOFVzOU1rQnZjUGVBRlpaY2lhMzdtcHZGdW56Mmw1Tmh5aDd1?=
 =?utf-8?B?VUJkOElDWlc3Y2dSeFY5cEU0Yjk5d0s4bnRSQmdlK1lzc3RXTmVjZURzZmtN?=
 =?utf-8?B?NDZLQlJDNXN2VWVJVXhZcmRONG04aStrNEVLVnUzZUhJckFYeGxWcHFYVVdO?=
 =?utf-8?B?ZFdBNHZQTUVqdkp0YzdjVUJ1aGJuSGFCQjdwakdGTVQwdHZ0ZlZvMDZQbEZM?=
 =?utf-8?B?YmhkZFU2QXVaSElxbzczaitmdVZQSmM4U1pYYi83TU0vUHhTaENrRFVLeGhU?=
 =?utf-8?B?ZHRZajhhZk0wYVBnMFM5YTBqQloyZzFYdEZjVGNUaXJBNlhRNTl6MmZWRWFN?=
 =?utf-8?B?MDhRZXFhRGc5ZVFKNHpsaTlDdlZzWHBxcGlhSE9zbDFVVDAwT3RpRFQ0aksw?=
 =?utf-8?B?NStXUWZ5M1dzS2pVVDdIdmQrb1VFSFlkZkpOU09wbEdKanVINmUrK0Z0NDVP?=
 =?utf-8?B?YjYrVm9wallYT2hZZUFCYWxHS25PZkFMVlh0bDNSMlRPNEJyZmc4NjBIcnFq?=
 =?utf-8?B?QkZFdXB4TXhZQm9vVVdQa0ZYOWhSU1ZQNWtLaWZFK0UrNWVRLzVCRzZPVDlm?=
 =?utf-8?B?MU9lWVp3U1QzNEt1K1dwRVkySVhSa2VLU2FVcFNYUzRKdEVxTVZ5Tmt6NGFX?=
 =?utf-8?B?aGRLQjVwOTFPaDlGY25jR0tDL0lsYjlxZDc2alkrbTNSdC8zS0o4ZWtvQlJM?=
 =?utf-8?B?a25HU0NJNnVQWTJNODhTUEN0QUVmWjJ0SHJ0MlZDTDB3SnNKd3pSeUplaktH?=
 =?utf-8?B?TDNqL3VXU29ZY2pJNDNMcFVQNThnS295NkRQWkVBMjRRNGUyaUx0Y1dPQWwz?=
 =?utf-8?B?MjN4a3ZlZ1VneityYVFlVTRyMGJxRml4Qms5WWlhRTV6R2VZUnRPdFFqQ2dS?=
 =?utf-8?B?NG5yVWRUVmJDdFJKeHdvUG9UZEFoUFhPa2hPdjlHNENmdk1sdjRGSzRTS25D?=
 =?utf-8?B?RGd1UlI3RVUzdmZadi9XaDhWZ1o1UlZ2bEoxMnp0b3RkK1ZJTWFxd3JEUzZn?=
 =?utf-8?B?WGxwYmkvL1l1OWRaR1hKMGc5eDlCZ2I0MGJDKzNMTkp1SER1Y21WWDh1b2pr?=
 =?utf-8?B?L0pIVFBtclQyZTczelV4YjQyWXZsV01jcnN4K0xyR3RsaDhINWRzVGphUENr?=
 =?utf-8?B?Ukp5Qm9QTklkRTBzQzFmeDRRRWJHWmtrTzJ1SmwrMnpZd0R6L3dQbDZzNGx2?=
 =?utf-8?B?VXVwTG9TdFRXZ2FRV2ovZnFWU3BwSXQ4Z3FOaW5GY0Y0cmJGM1R0eUwwczIr?=
 =?utf-8?B?a0xFakdncmFmRUhLeW0zVjg5b2k1dWN4NGdpemhkTS9rSWJLMnZXMmJlaE5J?=
 =?utf-8?B?bTQxU3crdmtRQlhheHVoRU5VZHBvZVZOZG9sOHBMZy9WUzI2WWZrRXBldTFG?=
 =?utf-8?B?cDJNMUNtZ0h5Njd3Y2FFbXNXUGRVTnVBdzM4cFFZY3g1eXozSWFWbnRBNTVu?=
 =?utf-8?B?MjhaVk0xQlNGOWMxVWVYNkJDanFJUml3V3VKZjRoYkFXd3hNUXAxOEVBQWhy?=
 =?utf-8?Q?8agokjDDMITrBG8uaZkG56RrrTrVdL33+5qBDdb?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AS8PR08MB6263.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9066
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:290::9];
 domain=AS8PR08MB6263.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C70C.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 982eb4b8-95c5-464e-e1d3-08dcf81636ab
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014|35042699022; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWMrY0p5LzMzUWRqQVhzUDVPUExkVHM0Z1QxVmwxaStrTjczeUU4am84WCt2?=
 =?utf-8?B?Q3g3b2ZtU2ZUbnV1QURHamU5czBYcDJpZHkyV2tDVWprNmQ1Qm5JRW9QVWtm?=
 =?utf-8?B?TUJqYk9FOVE4SGVMMXQwc0xmcEk5eHZWdGF2MThCQ2NPZSsxSXMvUEhYUVVF?=
 =?utf-8?B?elgvQjhRUDVDM1RlT0c4THJmZC9OVFB1RkhYV0RyVFQ1NE5rZmRhN3hCa2p3?=
 =?utf-8?B?WEZNTWRFRlk3R2hydjQ0Rk1TWUVjdThvbXkrOFRQdC94QWwwUFJNUXhrbTBH?=
 =?utf-8?B?cXJtaG9FMTBobFdDemRnUnh5QmZ1THVoTUxmelF0N2xWcW82OTVWMFNKQW02?=
 =?utf-8?B?VGlWUFVtTGxxdHlzUzdBcU9rUktWalNkWXpIVEdteVUrdW9CUUQwQURmZkR5?=
 =?utf-8?B?MXBoREVUTlF3amJwLzBDT2JrWTlMUE5JellJckZocXd5UmFicm84VUtBRFdD?=
 =?utf-8?B?LzcvaHlDUDV6Z21iOEdLY2Nlczl5ZmNOaHNsc2NodTBIUFM3N3ROQStDcTRK?=
 =?utf-8?B?L0o0U1RvSG91TkhFOHBqZUFHU2swY1JHOVNpUGk1ZTY2Z0pYRnYzK2Qzemc4?=
 =?utf-8?B?ZXdINitZYXdrZVEzSkx6aEN1RFpJRElSV0pYWnFOWjViVEdPbXEydzNpM25V?=
 =?utf-8?B?SENqcTJEQzB6R3pYOGJOeWdENnF2WGVxc3RjRzhoYTRMcDZZNjJLYnJ6WUpP?=
 =?utf-8?B?NE9ubHRTQ1YySWk4bkpqWWhEMHFjK1lIcWJLdDBiY2ZaNjJONUtiNG5iK05M?=
 =?utf-8?B?T0d0b0ovZVZPd0l6QkdnQTd4bG9KVk8yQzhpKzFEYUlGdmFJN0dWd0ttaGVJ?=
 =?utf-8?B?ejluN2xYOEtXZ25pZEd5bmIrQW9YMEY5VGRKejNJUWpiNTJySlBQRDRBZElT?=
 =?utf-8?B?cTNJazdpUVVpWVhLd1l4akFKTitKYzRlNXZsS3ZKS2RVR1lJWWpVV0JoVUhx?=
 =?utf-8?B?dUIxQVAwTmM3Zm1ETUJva1RXd2QwNEVybWpQQ3RvR0lFbzI1aHVScUdQbXZa?=
 =?utf-8?B?UmlDTTN1cVY4SlFuSWxRZEVWWkpObnpoSTN1bXU5WEUvTXRNUWt2YjVjU3NO?=
 =?utf-8?B?ekpjSGJOdFB5MUxPQTZ0dlZhUTJ3ZDdySVNQUHFLaHZ4QzA3S05EOE5IU2hk?=
 =?utf-8?B?T2syOFp3Y0pZSmZDT0l0bnhyM3JCWWx6cVhBMWo4UWpUbXhub0ZiaGZ4dlJm?=
 =?utf-8?B?QXB4amRhK2xzbkwyU2dJeU85SmltZzl1bHIySU9vQWFqeHVWMFR0Y1ZFTWs1?=
 =?utf-8?B?OEl4SVNjc1pzbHpqemJFK001OThSZDlFRGhpVmxzbzB6TWYzTDZUWnNMODBP?=
 =?utf-8?B?QldQQkhobUM0V0hrVjJNaUduWHp6Y3h1emN5akZOcjUyMjBCbng2TlRGcFF0?=
 =?utf-8?B?bmY2blVQY1FOanlKUlhLeUZDbWUrY3JNODNOOWxJUTE1RVh1UXE0MlJMYkpE?=
 =?utf-8?B?dEFHVGd1WU1sdHRyVG1pYXRvUUR3M29aTXJqbEtNWlJYQjNTQWx6MWlDVlNy?=
 =?utf-8?B?ZnFYZzl6eUtPcUR0bkpUQmNRcU9qQklMMll0Z3M4bkFNWnVMaGxXdFVhS004?=
 =?utf-8?B?NUczemJWc0t5Z1liUHVzMVBUUEZkbWpZYkRFdTlXWk4yYXM1aHJxbkJLOHVQ?=
 =?utf-8?B?ZU93MG02TW4wbG9LN2ZTRnh2N2JTT2FvWUpvSnJYWnJQR09SUnFudnJxRlM2?=
 =?utf-8?B?cHZ6dEdoTG9lWlRJUjgyczhpRUIyMkFySDBKTFhNMExBYzVVei9la0V5MTdw?=
 =?utf-8?B?OUdXY3JBcklWRDEwckFjTEJJNk1HYTdySSsvQ0E0ekZmYlNnYkhPeTlzMzVx?=
 =?utf-8?B?TzVGWWpQK2ZMMTJQU2ZLQ2orK1IyUTBEcU0vcTMyWWY4YjNYRWxIalp2Ulg1?=
 =?utf-8?B?eExSc0M0TzR4L1F4UFRnemJMQU5JL2l5cjJEVHpqdjQyZkE9PQ==?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 12:35:57.9969 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fc980f4-c48f-40de-7bd2-08dcf8163d41
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C70C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9258
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

Hi Erik,

On 29/10/2024 09:46, Erik Faye-Lund wrote:
> Enums are always signed, and assigning 1u << 31 to it invokes
> implementation defined behavior. It's not a great idea to depend on this
> in the UAPI, and it turns out no other UAPI does either.
> 
> So let's do what other UAPI does, and use defines instead. This way we
> won't get unexpected issues if compiling user-space with a compiler with
> a different implementation-defined behavior here.
> ---
>   include/uapi/drm/panthor_drm.h | 44 +++++++++++++++++++++-------------
>   1 file changed, 28 insertions(+), 16 deletions(-)
> 
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index 87c9cb555dd1d..a2e348f901376 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -209,27 +209,39 @@ struct drm_panthor_obj_array {
>   	{ .stride = sizeof((ptr)[0]), .count = (cnt), .array = (__u64)(uintptr_t)(ptr) }
>   
>   /**
> - * enum drm_panthor_sync_op_flags - Synchronization operation flags.
> + * DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_MASK
> + *
> + * Synchronization handle type mask.
>    */
> -enum drm_panthor_sync_op_flags {
> -	/** @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_MASK: Synchronization handle type mask. */
> -	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_MASK = 0xff,
> +#define DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_MASK              0xff
>   
> -	/** @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_SYNCOBJ: Synchronization object type. */
> -	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_SYNCOBJ = 0,
> +/**
> + * DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_SYNCOBJ
> + *
> + * Synchronization object type.
> + */
> +#define DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_SYNCOBJ           0
>   
> -	/**
> -	 * @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_TIMELINE_SYNCOBJ: Timeline synchronization
> -	 * object type.
> -	 */
> -	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_TIMELINE_SYNCOBJ = 1,
> +/**
> + * DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_TIMELINE_SYNCOBJ
> + *
> + * Timeline synchronization object type.
> + */
> +#define DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_TIMELINE_SYNCOBJ  1
>   
> -	/** @DRM_PANTHOR_SYNC_OP_WAIT: Wait operation. */
> -	DRM_PANTHOR_SYNC_OP_WAIT = 0 << 31,
> +/**
> + * DRM_PANTHOR_SYNC_OP_WAIT
> + *
> + * Wait operation.
> + */
> +#define DRM_PANTHOR_SYNC_OP_WAIT    (0 << 31)

[nit] 0u << 31, to have the same signedness as SYNC_OP_SIGNAL.

>   
> -	/** @DRM_PANTHOR_SYNC_OP_SIGNAL: Signal operation. */
> -	DRM_PANTHOR_SYNC_OP_SIGNAL = (int)(1u << 31),
> -};
> +/**
> + * DRM_PANTHOR_SYNC_OP_SIGNAL
> + *
> + * Signal operation.
> + */
> +#define DRM_PANTHOR_SYNC_OP_SIGNAL  (1u << 31)
>   
>   /**
>    * struct drm_panthor_sync_op - Synchronization operation.

-- 
Mihail Atanassov <mihail.atanassov@arm.com>

