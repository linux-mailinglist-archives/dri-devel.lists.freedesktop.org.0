Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE69AE0706
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BEE110EA44;
	Thu, 19 Jun 2025 13:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sRlNTXCt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2074.outbound.protection.outlook.com [40.107.102.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9315C10EA41;
 Thu, 19 Jun 2025 13:25:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P2q1PmbYNw/ox0/6U1UCyOup98yB8yGtyUovYkMB1DcQ2Lel+439ORbCUj1dLcMY7aVtg6QSfgBJSRJjg1ly0o0/qtYMEyGajUr87KdEnwZ12OoupQBHYMv9SrelXDsMcC9o3z3rLNmtFbUaMy6EQEkRLoMVGFQl7v01LxC+B3QURFESoZ7e9x7H99WHuklZmLpXuSRT1VS8InSEwmJq8YP5cewkWOB1rnEf+X01R1J6mngOA/j4naemFXsptzoDgrM6XbykKg3klaRRbGepV0/+c3xqwG/PBENEV651w31BzuWe+4/tiPkJEIzPzK8ULnmkyOWOuO8nbwKxaOOB3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYszY5mQllyUAJaWO+ZVLuarHoRHSrfIRpg0u4nsoA4=;
 b=ohRI0IBHiOhN8+4evWnqXNjTFnlfJq9dn0qREJSpInN0gl/WiP5GPOtJuk8OQERdLq3udDayXVWD1j8PhAIRydgfABW+ksVaNe/pJb2bk6eV7dGiXjYPE9mynVY4WnkMq+ouYc7YZV55Vq/Ebqy9N+ublnSEhPUYuz/dwKN0Sy2wNaufuxUwFyydIOqrPHkiQHE8kYGRvsaqsYiRQ3s9CmnQm4oAMngGqFOmTPtjWL1fNtAU1p/8aTESF+QWo1gYF9y/NhvpRzSIZFiU2KC7O4VC+t16V7f0YOSJ36/fp22FXT/e9sVkBBvVhwZ8wBVGbn2xKn0v7x63mwvRthZxPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYszY5mQllyUAJaWO+ZVLuarHoRHSrfIRpg0u4nsoA4=;
 b=sRlNTXCtE+5o38hInnZwnNZRUc2Pt56QJX/bdPAboncXcyjbI/xWTeS611KLAauATWJHGmeRJmRLZhFDE89SO/UBOsijowhDkRNnbci/8vcELR/8JhgKm7e1FedZCHGHYRBva5cNpFfGCdyNTRxKlnHCRTFe1cRrY08hpevDAaGsGR1RV+t35N2RBSG8ZBR7m6G+WDdu3qBYJofWxwjZhdSwtX2IEY/gee1ayKFpTE10U6MVTuTnqKdInsNw5zVpX2modmrQi1ANxufBj38UL7wQ5M3bONm0E8v+YntrR+/3zgz7x/3HGFx8Xb15v3danDhlPnE9lky2+7ThyVQe1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB8122.namprd12.prod.outlook.com (2603:10b6:510:2b7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Thu, 19 Jun
 2025 13:25:02 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 13:25:02 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 19 Jun 2025 22:23:54 +0900
Subject: [PATCH v6 10/24] gpu: nova-core: increase BAR0 size to 16MB
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-nova-frts-v6-10-ecf41ef99252@nvidia.com>
References: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
In-Reply-To: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Benno Lossin <lossin@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCPR01CA0133.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: 6df7dbcc-904e-4e41-01a5-08ddaf34b238
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2haZ2NnWEE5amM4NnduemtHQ2VQcExFdDc2TnNyNUdFM2tQY0htbUo4aHZ3?=
 =?utf-8?B?am9ianY0MXhMdmhoYVJ3L1o3YUVpY0RVQ0dkYzlCQUxqUmNkRStCeGd6N3l5?=
 =?utf-8?B?Y3Z1R1JmUHhUWnI2Skdad1Y2SUZiUXdzOE1ZM0pRbFM2bUxSOC94d0lyMjA1?=
 =?utf-8?B?RXpvaGF6eE1zbXZ4MnlYVThDWlFicWxsbTJOOXEyc0JqVnNQdk0ya2FPQk4x?=
 =?utf-8?B?dklXRnlmcWtLQ2lLK1E4YmQzR1dSLzZKVXBYYTkrOEFaWSt2QmhWVGhZakZN?=
 =?utf-8?B?UHM5bFgyYVJ4eXI2cndOalkvbHFDT21HSEhhTTFlQmZlQ1kvUndwV2haQ2xG?=
 =?utf-8?B?K29OMDdVU1BrS3N2QUZ5eHpWQWhoUHdySlpVZHd6Z0N1VWx2U2F5QzMyNkdC?=
 =?utf-8?B?L3kwOEYwRUpZRHZBNGllQlpkaXZqVE15TlNRZ0toSFZUZUI5YlNIVHNnSHpo?=
 =?utf-8?B?SjNoMUpoV29MeS9MQmRGTVc0V3B2aXVoY2xWaHhkTHRzMlIyZW5qazZjVkR3?=
 =?utf-8?B?ZTcxS1M5QXBqMGE3aVFBOGpTVUp2TXlzRHFEaUxqYmFvdGlselVQMWdFUVpR?=
 =?utf-8?B?Qk0zUTRiK2RRSzNRVVV5Mm5ob2FySlZiNGo1SUV2c1lyc05aZUpLeWJUcUtq?=
 =?utf-8?B?bmhmRlVjV0pWU2M3ejVzVDR1Y3ZMYk1mMS94d2IwdmxxYVNDTGxGV0d3bnlQ?=
 =?utf-8?B?R3RRd09QNE13TGlva2VoYlZic0ZRWVNNU3YySE03bWVNYkI5TVlOYlpnWi9W?=
 =?utf-8?B?UllBR0l3d2l2cUZzQTVqekJtbjRUUEpZZTQ3Y3FOSW1wUExmU2dkbnFSTCtG?=
 =?utf-8?B?dUIzZ0I4TWpFT25GR0FnM0NpdmcxdEFPaDB2bVFSOU5HUWFHNWI2eitCOFlX?=
 =?utf-8?B?TmliekRaL0RCYzI0b2ZsemliZmoxaGRBb0gwSjlYRnJYeVRScUMwdXZETGJw?=
 =?utf-8?B?YWNCU2drOVRxQnFDM1lnbzdyU3ZMY0htcDdIYS9Ycy9vTlZ6Vzh6aEpEZnpC?=
 =?utf-8?B?Zjhkd3VPSHBTczdOcEtOYmxla29vbDZvWVlwRjlrbFNCajhBWWpuTm1MUDVk?=
 =?utf-8?B?WHdybW9hREZYSmhUN0tnSmhiYy9udlRQS3ZaMmUyWEVwTVMwUlQwWnBsZk5r?=
 =?utf-8?B?L0JZZlZtVExmbmpKbkxnUXBzV0RlbWdzTkdVNGtGRWI3RjJpcjczdVoyUVI5?=
 =?utf-8?B?SElwQ05rQVVMdVJ4MWFiK05wUzZPZHV0QVNQMTlsVFljcVNGZUdyaC82K0Fn?=
 =?utf-8?B?TVRqK1hkWUlzVm1sK3pzMG9LTW83ZXl3TlVlUk96QkhGQlUzYkZBMEVzN1Zq?=
 =?utf-8?B?NFFTbUZKSW4zY0ZpUG52Q0I2UWdtWCt6b0lERjZhRjZvald2RHgxTEFrNUpk?=
 =?utf-8?B?UER6cnJYaGFRS0hhYnNqQ3pRTlRGaEkvMjZYT2ZwUStFYU9jcWRUZG5IbG1Q?=
 =?utf-8?B?SXQzYUZ6SFpLanZOQ0wxa01oYlBQdHhBWGRLdVkybVVwRkxrQTY4RE1DcGx5?=
 =?utf-8?B?NEFuTUlWc2NyOTlXTWJxaUpKY0ZrcVNCbDNkSC9lUDl3NlZaZHNaYmU4c1dh?=
 =?utf-8?B?amJHQThtL2JLeTdBVlJsTjNnZEtsWmpjbGNRNjNySXg4MHB5STVXemZrbGwv?=
 =?utf-8?B?YVdoNy84ZU83NEJ3YXZhL1RIbnhlc0ZXM2M4RHFEWFlBSFlNK1JWQUs5bzQ5?=
 =?utf-8?B?TjYxYXRyV2lPQmhWaTQxTlgraXh0M1RxU0k0S2Z0aXJsbVVFbGR5SnZ0MHRs?=
 =?utf-8?B?anBRMVFiZ09uL1laL25kUnNERGxNTGp6VGdRcnhyZTM0d2JReEVSTDlrNWVO?=
 =?utf-8?B?cGdBUFdWV2hMalBmMWZNeUtQSVB6TnFLVTFXUGc3QmwvdldlUUNsT0VsRS9i?=
 =?utf-8?B?cHRxQWhxWXBicWhKSVJhdmU2ZmZlOG5zQlhsU2NGUkh3cHlxUGthcmd2bDg1?=
 =?utf-8?B?TWpzbldiRXBDVWVEcXdvQ0VKMjZCY2QyNFhMakVUS1dhdVRQdWYzKy90TlZL?=
 =?utf-8?B?WTBDTm0vTGhBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGFqbWN4WGVqODhtVjhWRUlwL0didEFuRUZ0TWR0WURBbnAvcWxkKzZpNWRo?=
 =?utf-8?B?Mk1ibDZqT2RHMHltLzdPZWVJdENFTFBRWkFQcnQ4bHd4TDgydDkzSDdkMlVR?=
 =?utf-8?B?UlR6UCt2Mk1ia2l0Ly9PME0zSXFodzA3TUVlL0ZQMzlYYmwrcjNLRmcrSnV2?=
 =?utf-8?B?NEVJTmR3Y0RUdGFqR2ZhOFdlUzV5Z3o0cUQ0VUEyZ0k3VTVBV09ES0tHaUh0?=
 =?utf-8?B?UHA5RTdCYWNnSTJsb21XL1AzVTVKUlYxZ2ZJbU5oREQzZXlXbHRIN3NHS3BW?=
 =?utf-8?B?Q2tqbk9UNGlkU0pvWFE1cUlHUDF6VzNDbGNKT09Nb0JvUTFKbGx4YllncWE4?=
 =?utf-8?B?aWZSb3lMbTBBV0xPN3FzMVBvMTNHSlNxWkRPOXNhU0dna2UwUG4zMmorc0Q0?=
 =?utf-8?B?OWZLdExhSW5ydXppY0dTQWx1RXJOYVJjTDNQOGJ2L3JpYllzcXlkM1RPY2Jk?=
 =?utf-8?B?MWU2V0pVQUFycTNHUnNCK3laSzAvQ2IvdmxyTXdRZUlHcTRpb0RVZm5QUjUz?=
 =?utf-8?B?VDk4Q0RvZ1NuM3lFVEZNUUliZ2xZVEdpUldWcDRBVm1sdzlTcEcxUHFoR2Jm?=
 =?utf-8?B?RS8zK3cra1U3TWNPZXRnaWhONFVkLzJieXlhS0lGWHBlVnJBQVJhVWNoTy9E?=
 =?utf-8?B?ZjVmRmozNlMvRWJhNmk5eEwyblFLaGxqU2dkWUxlUEdWdGRaWjVQNEtEV0hU?=
 =?utf-8?B?OVk2eFFRRFNzK3pyNm5CbzVjRlROL3dLam1Cd0xOSEMrMnRadDNHYmFTYUlk?=
 =?utf-8?B?UnI2UHB5T1M0c0dFL09oa0F2dGI0bkhCN001azJlbDZuMnM4a0I0Smk1dGRn?=
 =?utf-8?B?RENjaXp0ZjMyOS9HcFFNaVhMWWJ2bzg0MldaYjM3QVZaSXhLMjN5KytQOC9B?=
 =?utf-8?B?SVA4YXFZcCtHMmJMQXlIdUYyejhwMHVzeW9FQ0sxa2F6dzZwaFk4cFBuNmpX?=
 =?utf-8?B?Ym83Rk9BWnJtelo0ZWRReFMzbEV6djUrcFFDdSs5bjJVSWZWKzRBaEU2N1da?=
 =?utf-8?B?eGlvaXc3eHIvU3ZYNUZmeGVYVVFVN1J6eFJBMy85YytObXY2cUZLTk1hVWRN?=
 =?utf-8?B?VVBVQTBvR2NTNFdPWC9UR3I2eHlKYTZtbHBmQmhodExHZng3UlJIL0Z6dUZQ?=
 =?utf-8?B?OEg2TlR2dUtrSlptZStuR3BaS2ZYQks1SzV0enlkc2dVSk5NaG1BR2NDRWYy?=
 =?utf-8?B?WkRra0VSU3BSZnl6bVpXN1BxQUhtNW13RFpsQURaSFhiTVBwbUo0TkNZUU9p?=
 =?utf-8?B?c3dhdjhiN3pWZHNwWmJUcGJTYWdWeUNvTnhJWGYxWmhEaE1GUVZ3VHpiSUli?=
 =?utf-8?B?eHZTTFZ0QzNWTExRV1Z4SmhsSHJGUmJETUk0QmZLeXgxLzNIT1NOdmF5WnFQ?=
 =?utf-8?B?TWxhZzRQbGFqZFBuRmszdkJwamlST1JiNDh6c2FWUkRQL05MMVN1M2w3c3Fs?=
 =?utf-8?B?cUxzR25ZL1NOMXhIUHlRQmEzUkNKdE85MUdMeG9nRFFuL1krbXRKejUrYkkr?=
 =?utf-8?B?SWNFSE9zRStTOVphN3pjU1ZWMVAvZGxKand3R1AvcG1zWjYya0swRG9vNFZJ?=
 =?utf-8?B?NFpQelgzSkV1RkVmaHZkR0w1YWdWdGRVZ00zRzlPV1lOQzVWTUovWXIxbXdW?=
 =?utf-8?B?eHgzS0U2bGVlbXVCZCtsZHhOdjQ1cmFCQVp2aWJ1Uyt2bUlNT01kS2Z0emEx?=
 =?utf-8?B?cy81dzFiZnJSdVQ1SWRJQ0s0c05wWnJpSDhoRzB6TFpTNVFCOXFOR2xrdzFP?=
 =?utf-8?B?WExaQ1pTaDlzZ1NVS2EvN09PZGloaUFpaFZaMlp5b25XbHMzNmRxVElHQ1lv?=
 =?utf-8?B?dVJZdnVyTmRlSFhpVHRXeDJQMVhFMDFSUmMxUHBZRTdnT0tPbEdYWnZYK0ZW?=
 =?utf-8?B?dXkxSG5KWEErajI0V3JneHliYlU3RUdLODFCZVVtOUw4N005MzFrdkp1SVlO?=
 =?utf-8?B?QjdUeW1sTyszZzd5dCtjcEtKL0hjdVlCTFQrb0JGT2tVbWlzb0dxKy9SNUtP?=
 =?utf-8?B?bkdsU3dvN2xMVytPUWlYRnpiWWhpUzdPRFNRQkVoeHJ5Z3d0SHhUTkpLV2tG?=
 =?utf-8?B?d2V2NHpHbzFIRFExN2lIaTgvY2JGSzFkb2ZQZ1dLVFBiV0FmMk9NeWx4RVJW?=
 =?utf-8?B?Q2hXaTZvSUNXMEdXcENtZXdveEIvdm12T0tET29OZEJTVGJocHBOdi9xTWsz?=
 =?utf-8?Q?9goxJKdTFH2LKytaLX7SKgNvAAiznl4QHiMqOu7rN947?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6df7dbcc-904e-4e41-01a5-08ddaf34b238
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:25:02.2585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GlVbQwbwdW+9xhBvXTyK4SPySIaMfB5g9oRP4npuKNn1za4mNQ6NPmHMPYqTuO7Anr5tJajWa/zLzCqQ4Xlbyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8122
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

The Turing+ register address space spans over that range, so increase it
as future patches will access more registers.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 8c86101c26cb5fe5eb9a3d03268338c6b58baef7..ffe25c7a2fdad289549460f7fd87d6e09299a35c 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::{auxiliary, bindings, c_str, device::Core, pci, prelude::*};
+use kernel::{auxiliary, bindings, c_str, device::Core, pci, prelude::*, sizes::SZ_16M};
 
 use crate::gpu::Gpu;
 
@@ -11,7 +11,7 @@ pub(crate) struct NovaCore {
     _reg: auxiliary::Registration,
 }
 
-const BAR0_SIZE: usize = 8;
+const BAR0_SIZE: usize = SZ_16M;
 pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
 
 kernel::pci_device_table!(

-- 
2.49.0

