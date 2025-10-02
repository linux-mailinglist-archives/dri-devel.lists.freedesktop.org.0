Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 892A4BB2490
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 03:41:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4882B10E495;
	Thu,  2 Oct 2025 01:41:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HIuA2QYd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013015.outbound.protection.outlook.com
 [40.93.196.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D287210E137;
 Thu,  2 Oct 2025 01:41:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eyWEJ1z6c8o1F0dRUN9argPsb/9HmzKOKcQB5e+FoyFdwTvSmwrXvEjiXf5DhbbyASY+HZx2Nd2kkVQ4tHUFbQ2K1OTJBrc9XZ4K0BQdaqpy1kkXS9tbSS5jLTEu0F6AnrujSKUbLXeayr5bv1syN32q5J+RKfdUjUtqJkie2DbS6tb5WCvgyqeGkNGTO10fKqHKiUZp/WaskSQWcPd9wwN3pXyTNmrP98i1+W/eEPijkGHbGhSabqQmI2f/bpzIhoF7hYxMp7AUYpEdwkfSog+8DTRLkNcPxGu01747q+2jJ7RkleNgVGKw76qrGhIMA58D4q9FC4ChG0LsUh8e8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EO3bYMWbRLO1Jm0CCLOmGU1akGc5jXSDjAgXH+qEUAY=;
 b=lp+YXqS+qRBe0Ci+Gfe2HW85mus2SPSGOFopi8BE6DJszcw7D/P9IcDoBoAMSmEKtTA4hgcV9uKkJ/3nr/N3emrzXZ+xXsd/rodsRtlFndBGR8k+yOPZV7wVmZCbAXMgc9bgHhmUgfRyxj2vyzN4tv1X/5osdp5+N8U4Wv6oGI+siKIlUUzcUYYQP4yRWnptFmZrkDnyyJMwSEFL/131xQoGuDhwV+HMfGhgLyW/gEXIcRqvzzJdHEsXPRhv8pT7LU2KPvzRfECl+6l88UmsBd2rjDrIwymBFmxZ6vpMwlss0VI+ssKwSO0KsffvKb/AL5/Xfbd0X+IpX/gXEOO3bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EO3bYMWbRLO1Jm0CCLOmGU1akGc5jXSDjAgXH+qEUAY=;
 b=HIuA2QYd8+CHneOFFt21mUV0kolUCHOrQq6WuF9GUv4hn0fItpxzAIDdtICAIjSQHv0FaeFy5gl1V01l3HyK2/2iu8SHoDmJp0TeM9KesEKzR11CtNeB/WWBmShLQIOVj64rLDIk1x2pfxkCqkxhKaJ/VSqtB/hoXW++QyJfw35zwnmQ8OM3W8aYEH0gtMcmLl8wirnC2MFAejbRByThpkCIJnti9YM9HXllyl1aSM1n5FX94yo53Uyr5/O4h0AaoYc14+fGjtGujjDA6mw/gI7ulzheWFUCZEYVqik2vmrNe2NCRzmHjd2l5857wMozRYKQ+iDZB/wFU/3u/OiGSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB7953.namprd12.prod.outlook.com (2603:10b6:806:345::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 01:41:25 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 01:41:25 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Oct 2025 10:41:22 +0900
Message-Id: <DD7GCYCZU3P3.1KK174S7MQ5BW@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, <acourbot@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>, "Yury
 Norov" <yury.norov@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Andrea Righi" <arighi@nvidia.com>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v5 6/9] rust: bitfield: Add KUNIT tests for bitfield
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250930144537.3559207-1-joelagnelf@nvidia.com>
 <20250930144537.3559207-7-joelagnelf@nvidia.com>
In-Reply-To: <20250930144537.3559207-7-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYCP301CA0015.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB7953:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cb3c525-a1b7-46ec-f3c0-08de0154cc77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0VNRmsvMzVLcStFelZrZ08zL2t2dmd4M2RWTlliUGl5d0k0eUFqaXFhdk54?=
 =?utf-8?B?YUdncXpVTkozMHRZRVcvb1l6a3ZENHZZVHJOQ2QrTit2YXRZaW9hbVdFY1ZB?=
 =?utf-8?B?TGtXV2EzTXgzUmRsYUFQdEF6Z0dxYTd0QlJZRlNTaDN5UElyNWR2bVFCSkdv?=
 =?utf-8?B?bFhNSEI0RFptY0IxMHBUZUVPOENEVFU0RzJmZmVIOTRralpYeUowQ1Q1ZURK?=
 =?utf-8?B?eWVvbThSNEdPZE13VkFRT295SXR6ak1sbDk1L2VLTnMxNmszYmdVQW0xM0lP?=
 =?utf-8?B?b0hFL2pmOUp4djhLWU12UXI1UGs1OHNZd1BsM1YvZ3NxWERsNWovVkU2T3Fm?=
 =?utf-8?B?UGVXT2dRUDZYWXFZMEhvSERGNm5YbXVLM3lkNGkrN01PUE9kWk9SdHhqMER6?=
 =?utf-8?B?dGtvcXBNTGprdDFjZHhDN2FmRXk5aS85WE8zSFc1V0c1OEpITUVGNlFyOWZF?=
 =?utf-8?B?R0ZEZlBLUzMza1Z5ejVRMFFRWkVLeTRaSEJlcDU1VU5ZdkhOVU1MSUcvYmVv?=
 =?utf-8?B?WUV1ckhaTm5zWDF4cnJTRXFqaXNPbTcyZkMrSDJDRnAvMjNDVXR5NnM3TVhp?=
 =?utf-8?B?QUZpbS9VK2kxUThReXZ4TGFuZXR5S0FRL2FHVFBneFBwVGRBZVZnUzBheHY1?=
 =?utf-8?B?RHBCSnhITTVWemx5VElMTzZSR1c0c05hWUFtVHlRYk4xQjF0ekNhczRCTStQ?=
 =?utf-8?B?Y1BsYUg3bjJSNE1LbW1WbjRyRkFwVlZ4T2txeHBzUlliSXV6K3VPNU0yQTZa?=
 =?utf-8?B?QWh4OUtIa1RjZ2Q1YWNUSFlRcW9ZWG9WMjhEbHh0VjI3RmdWZ3RtMVJiMkdx?=
 =?utf-8?B?b3MyS0Q4d1k1U3NBN010TlE4a1dqNXMwOXJYeG1PdFVBS1A5VjJ2L3VyMEE5?=
 =?utf-8?B?eDREMUViNWNpSVVwYlk5TUFXa3NHVXFoWmZuU2picjJCTUd4N0JaTEovT0FM?=
 =?utf-8?B?aVhkdHBvdzRKSTZJaUhGRHlvSThsZUZwbmx3NTFCemw4dUV3T2JNRjhuYVA3?=
 =?utf-8?B?bXlhUHBEZU1tRlRtNkwrYVhubmR3MVRtNGhCY25VbGlJYXRNSGdjK1pJRGVu?=
 =?utf-8?B?TUtpRGZhRWtGSms4S3VNdnR5Yy93L3NZUHFENU00UmdSOUxqRld3NFdGT0V2?=
 =?utf-8?B?T3lVZXUweGc4M0F6UHl1S2RESHpjY2plYU5ZQW8yMlJUbVA3QWZtZHgxaUZv?=
 =?utf-8?B?YVZWQUtPemtIWFNMWHJGb0M2ZE5ReWt1dzQ5SzlQcjlwUDNxRnBRUWtUUkRU?=
 =?utf-8?B?M3ZQRXZQMlR4YlprS1ZWL05VWTRwWXFidStNSjVoanZoc05uSDhNWHg4R25U?=
 =?utf-8?B?YUloS1MwQTRZS05MR1VWWUdJTXVpYlFoL3lVc213QjJQNGpMSkcyNVJHL1By?=
 =?utf-8?B?ZjVsYjNEVXpVTFVyc2NQNU5GL3NMN0lBTFNudUdPdVVaN29UL2ZsZnBNTDU5?=
 =?utf-8?B?UTA2ZkpwRTlGMXEzS1dZVnZTMU0rZE9PVWhlUDgyNVExVEN2ckhicTQ3d2hQ?=
 =?utf-8?B?aHZzZFFKbW90NTJCOWhsMFgyTHA3YlJtVXV0YUFZc3IyNFdackkwWC8yYjdZ?=
 =?utf-8?B?Witxd0pDVVd3aTlBWFVGQk1RUDlwMXR6RlJ2djcxZS9sU2pDNlltWkJkdkw1?=
 =?utf-8?B?MTFvOUdDT0hubFJLbHRiRWdkVzFscUtOKzFKS3E2UUVaVi9iZVFzRzZVUXMv?=
 =?utf-8?B?UG96MW5xTXZobzFCeFV6UmJMY3ZVS204NlVVb1ZrM2FMQ25xaWwzUFdhS0g3?=
 =?utf-8?B?VForL1V5VVpnSFRPb0JVenlRTm0vSGY0WGwvQ2NTM3U2bk5tcURheHA5TmlG?=
 =?utf-8?B?cFFsWndmamNQOEdtSHVHbXZKSmEvQXpkU3IyNmpSMGdHdWpmMkcrZldpMnVW?=
 =?utf-8?B?NTA3UWVQS3JsSWFVT3U5ejJtMjNva1hyU29GSTliVFNHZFF3QXJ2QktiREhC?=
 =?utf-8?Q?lx5wKjrDubaSRKB8kakC0kYvOV3cZ92l?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDlmTDk0WWhYaGRITlNSY1NjRnZRQllRZXlCdzdTZUcrV3ZFdDJuRnNUcmkx?=
 =?utf-8?B?Z0pTeG96cU9FVnZhUm5wWjdYQkpHYVBiOC9yNXY3YktsWXNiaFp2Nnd6NEtM?=
 =?utf-8?B?eWc4N0IvVVpDVDA5MHAvem9RTkY5SkZXeVF5OFhaMGdVbFlXZWdoNmw3bDI3?=
 =?utf-8?B?TXJWb3hzc3FrSWlHZ3EyYndaMEswKzQxVGZVeWt2cHAzYmpmRGpVbmpkNVVG?=
 =?utf-8?B?U1NOdFRTZWZtUnVUWXN4NDlxbWNmL2V6aTl3WkNUdWVicTIxc1loT0hVNXJL?=
 =?utf-8?B?eHp2ZWdMcDM2TjVKWVgrQnpIalRTaGl3eWh2NG0zU3hMQ1JkM2pBY09YelpM?=
 =?utf-8?B?Z1VISkZ3UTJkdDJDTEdRSFp6d2Nhb2cxYlJHLytkYjJsSyt5YlFCREJnM0E4?=
 =?utf-8?B?QzlIL0ttZUh5ZVVpTyttNXN4UDRpWmMzbElIbzZacEZXSTBqU0xuOWowMlFr?=
 =?utf-8?B?aExCdjd3NmJVVWZZdmMrVTlzNGRETnNFZnRKVXREam1LbEV4M1NzVDNwdlRT?=
 =?utf-8?B?elhoYllmWGcrVml1bXJoYnZBaklZbGtxSERkS2RRbkVyRytCTzN4bWl3a1RQ?=
 =?utf-8?B?V0FtRnVxQmZaVWZWTWcxTVg0VkhGWWE5d2d3N05sYy8zTVN3czQ2V3JqbzlB?=
 =?utf-8?B?cjV5ZnRnaHgrVkJPWmRLTXA5QjAvYU5TMnFOMC83SGdhSzVZUkVSYTNTbFFh?=
 =?utf-8?B?a0tFYTIwQ3g2cFVOUDhhVlM0MlJiU0FQeUwvQ2ZITE1MbmZGWk5Tam5lVWVH?=
 =?utf-8?B?QUlaVzFrQjBYVW1FbUlhOWVDMll2OS9zc1lZSWVJUnM4V3R4SGJMK1hjdWtY?=
 =?utf-8?B?bEV2cFlKVEFuYXVudStjUDJtOWFINk9FdldEQ3Y1dEIwd3ppZjNQQzV5d0VP?=
 =?utf-8?B?OXltVWlWUG8wTVZqVDUxMXZ5cHVnWGcwUWMydVd6SjdmSmtBeXVFUkhZb1B4?=
 =?utf-8?B?L3NiQzBNMlBZYThoMktyTExiTVY3WjJjMUNZVUIwMkUxNlVFVEcrTTdWOXFD?=
 =?utf-8?B?SEEvQWdTajBJTFR1Y2FUVTBpZnRmcmNTQUpFVWwrTUI3NDZobHYvRmdaSVkr?=
 =?utf-8?B?d3pXRkZhUUNTSGgwbEdQUGRZR1Jtc2oyVmIycDZVdFpYUmFEVnc0RXlOQ3Ey?=
 =?utf-8?B?Ly9vbU1Db1FLL1Rrck5MVkhmakZJdHZtNmV4elN0OTE0czV1Z0d0UjhYZEtu?=
 =?utf-8?B?NzNGTnBMcnlTU3ZBVFhVZEM2ejgwb0hnU2I5WTN6cmhFL0dJV1Y4TGJhc1pi?=
 =?utf-8?B?KzJhd1dkUGZrM29UNElacW4rMXpnV0NoTUd1Nnc4ay8wOUhQS0xTVjBVM1d5?=
 =?utf-8?B?bmdZekF5RlVhazUwZHZCUWJVb00rS1NQSVNvRVp4c1dZSWFFOHlNQytLa3JY?=
 =?utf-8?B?VnZWcG40VnJ4T3cwMTRybXZtdW9DbHFKQ3ExWFA5UE4ya0pITFlESTRaYy9t?=
 =?utf-8?B?SnNQQUZERFNSeFIyUDNyblZkczk2Zjc3RnBBbU5NZEhNTG9zdHo4SlpKQVJO?=
 =?utf-8?B?Wkd0bi9QR3BTYW02UC94aFR4aVEySVB3Q1FkVHJ1b3hIYWw3RVYzQ0VJbC9l?=
 =?utf-8?B?c1ViNFIzK0tETWV6ZXJYOGtpSVVtRWtjVmxVb21OU1VwOVJyVVBMdTlYNkND?=
 =?utf-8?B?bk92dEMwN2VmbHFQalQyT3hZbHRFSXRnTSs4WERUQ0t5VFZkWE9VV0k5WHBP?=
 =?utf-8?B?WmRycHdtUVRtdjFzZjhUdmxoMU95U2ZRUlYwazJCNHVDYnRURS84SWR6TmF2?=
 =?utf-8?B?R2dnL1RDbytJbkVnbHhGQVcwYnZCcUVzSmVHUWJqMnVrTHRVT0kzTUVieXNj?=
 =?utf-8?B?Skh6K0hjcFg2ZUdka0F2ck5Fdmw0bC9YVk9mWDl3TEY0L3UrbWxadFZ0Smpt?=
 =?utf-8?B?ZzBqT1Z6c0QySTdUTTZDd05lOGRYZ1VEenArZUdCbEF2cWQxc0RvQmR1M3FX?=
 =?utf-8?B?MVRpZXgvaGZVTTBiSXBGRWxhRTNiNGttMmp6eUI5UUs5SnNmeXJJVDNsaUtw?=
 =?utf-8?B?NnB1emRIbEhtSnJZdEJCeEprVVlJZXZDQUcxWE1kdHZmNTRyZEhJeVREenB6?=
 =?utf-8?B?bzRtb0NybjFHeDhRM0FWdStNODkwbUp4ekJUMS9CQWVSQWtxR3dmdEpyOXEw?=
 =?utf-8?B?Y3F2amVlVTdlOXBRN0VuYVZ0bGNzYU5KUEZkM29KMmNxdDJKYWpTQnhxQWRW?=
 =?utf-8?Q?8pidY7oWs9ecBBYPI4zbDUmv615gC80erE3kBjWON2hY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cb3c525-a1b7-46ec-f3c0-08de0154cc77
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 01:41:25.5102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZIGqh5BLgg9VthwpEQfavwpf58VLTBTfA9A6MSrvZ1LEJ7TmReqRCz6Arrsv6YA3AsTOhz3W3srn47rpmsRJ/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7953
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

On Tue Sep 30, 2025 at 11:45 PM JST, Joel Fernandes wrote:
> Add KUNIT tests to make sure the macro is working correctly.
>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  rust/kernel/bitfield.rs | 321 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 321 insertions(+)
>
> diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
> index fed19918c3b9..9a20bcd2eb60 100644
> --- a/rust/kernel/bitfield.rs
> +++ b/rust/kernel/bitfield.rs
> @@ -402,3 +402,324 @@ fn default() -> Self {
>          }
>      };
>  }
> +
> +#[::kernel::macros::kunit_tests(kernel_bitfield)]
> +mod tests {
> +    use core::convert::TryFrom;
> +
> +    // Enum types for testing =3D> and ?=3D> conversions
> +    #[derive(Debug, Clone, Copy, PartialEq)]
> +    enum MemoryType {
> +        Unmapped =3D 0,
> +        Normal =3D 1,
> +        Device =3D 2,
> +        Reserved =3D 3,
> +    }
> +
> +    impl Default for MemoryType {
> +        fn default() -> Self {
> +            MemoryType::Unmapped
> +        }
> +    }

Tip: you can add `Default` to the `#[derive]` marker of `MemoryType` and
mark the variant you want as default with `#[default]` instead of
providing a full impl block:

    #[derive(Debug, Default, Clone, Copy, PartialEq)]
    enum MemoryType {
        #[default]
        Unmapped =3D 0,
        Normal =3D 1,
        Device =3D 2,
        Reserved =3D 3,
    }

> +
> +    impl TryFrom<u8> for MemoryType {
> +        type Error =3D u8;
> +        fn try_from(value: u8) -> Result<Self, Self::Error> {
> +            match value {
> +                0 =3D> Ok(MemoryType::Unmapped),
> +                1 =3D> Ok(MemoryType::Normal),
> +                2 =3D> Ok(MemoryType::Device),
> +                3 =3D> Ok(MemoryType::Reserved),
> +                _ =3D> Err(value),
> +            }
> +        }
> +    }
> +
> +    impl From<MemoryType> for u64 {
> +        fn from(mt: MemoryType) -> u64 {
> +            mt as u64
> +        }
> +    }
> +
> +    #[derive(Debug, Clone, Copy, PartialEq)]
> +    enum Priority {
> +        Low =3D 0,
> +        Medium =3D 1,
> +        High =3D 2,
> +        Critical =3D 3,
> +    }
> +
> +    impl Default for Priority {
> +        fn default() -> Self {
> +            Priority::Low
> +        }
> +    }
> +
> +    impl From<u8> for Priority {
> +        fn from(value: u8) -> Self {
> +            match value & 0x3 {
> +                0 =3D> Priority::Low,
> +                1 =3D> Priority::Medium,
> +                2 =3D> Priority::High,
> +                _ =3D> Priority::Critical,
> +            }
> +        }
> +    }
> +
> +    impl From<Priority> for u16 {
> +        fn from(p: Priority) -> u16 {
> +            p as u16
> +        }
> +    }
> +
> +    bitfield! {
> +        struct TestPageTableEntry(u64) {
> +            0:0       present     as bool;
> +            1:1       writable    as bool;
> +            11:9      available   as u8;
> +            13:12     mem_type    as u8 ?=3D> MemoryType;
> +            17:14     extended_type as u8 ?=3D> MemoryType;  // For test=
ing failures
> +            51:12     pfn         as u64;
> +            51:12     pfn_overlap as u64;
> +            61:52     available2  as u16;
> +        }
> +    }
> +
> +    bitfield! {
> +        struct TestControlRegister(u16) {
> +            0:0       enable      as bool;
> +            3:1       mode        as u8;
> +            5:4       priority    as u8 =3D> Priority;
> +            7:4       priority_nibble as u8;
> +            15:8      channel     as u8;
> +        }
> +    }
> +
> +    bitfield! {
> +        struct TestStatusRegister(u8) {
> +            0:0       ready       as bool;
> +            1:1       error       as bool;
> +            3:2       state       as u8;
> +            7:4       reserved    as u8;
> +            7:0       full_byte   as u8;  // For entire register
> +        }
> +    }
> +
> +    #[test]
> +    fn test_single_bits() {
> +        let mut pte =3D TestPageTableEntry::default();
> +
> +        assert!(!pte.present());
> +        assert!(!pte.writable());
> +
> +        pte =3D pte.set_present(true);
> +        assert!(pte.present());
> +
> +        pte =3D pte.set_writable(true);
> +        assert!(pte.writable());
> +
> +        pte =3D pte.set_writable(false);
> +        assert!(!pte.writable());
> +
> +        assert_eq!(pte.available(), 0);
> +        pte =3D pte.set_available(0x5);
> +        assert_eq!(pte.available(), 0x5);

I'd suggest testing the actual raw value of the register on top of
invoking the getter. That way you also test that:

- The right field is actually written (i.e. if the offset is off by one,
  the getter will return the expected result even though the bitfield
  has the wrong value),
- No other field has been affected.

So something like:

    pte =3D pte.set_present(true);
    assert!(pte.present());
    assert(pte.into(), 0x1u64);

    pte =3D pte.set_writable(true);
    assert!(pte.writable());
    assert(pte.into(), 0x3u64);

It might look a bit gross, but it is ok since these are not doctests
that users are going to take as a reference, so we case improve test
coverage at the detriment of readability.

