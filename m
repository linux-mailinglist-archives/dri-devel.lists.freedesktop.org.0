Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 850DBC7A5C3
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 16:00:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB74910E89D;
	Fri, 21 Nov 2025 15:00:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="P5I6REGC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012046.outbound.protection.outlook.com [52.101.53.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A43210E89C;
 Fri, 21 Nov 2025 15:00:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mvj/S4IIzll5IIDUAYYZj+jN+Z9vAwEmZ3oFfNgtrtFVpP7r9RiLt/NDSz8nRu+4FB1vWnNszW2n8EIT4xbH3xNUQ8SQlUW6sFFgR4QY40afhqac/9ENaCHwmY2pHVZYYC9R51mwGljxZD/kZ8Wfxj80f4sivxQpkqM4jvaJxcLAeuggpaV3woHYkFC24nd4PbZfkbv/P22jGvXXehw5QyOiU/6lq2xMKxtlTjHYbROLCW/WRYvUd0OQL6DSuTArzckcQtXAi7p7TW4as1uACIMmgP/C3BdC+3nMZl9uQRbrpEsgMi2lh+NGP+awqC3WKOYATqRnHzPZEHUsqZ82Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqkWOUeFhIfhzyQR0Cg7HaGS9Sgvj//nw1QpQZiTE4s=;
 b=Y9VJO2HC3oWx990vMdiQNv37Dn/jdVcfX7M0shTnppOjdh2qlcxLPOjnmeJxqz2g56YOiZ7WkgTPTFYBj4ITWV7nauCwIqK/QV/kDLNn0SaK7SzCO16HQTVIIgw7hW5pAUA79xqA53RuHWt93GCEvH4qYJcuPaaEQkJmD56ekd4kUKvdiJEZhAMrw+v1/o2qilqifc67Rx1DJQ1WeEqJvMKkuFvbem1IJiELwvoTpYHXw+JomkFbgjmqFDq/L2fjK/kjG8Qx8AaOoPGjQbwQv+RFz06vtG9eZosKRfH1xOoGLJvC11mhDbWPN10lxGZAmtsOQ28EgBNEifhb1rOHDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqkWOUeFhIfhzyQR0Cg7HaGS9Sgvj//nw1QpQZiTE4s=;
 b=P5I6REGC81y2LtoPrH/lBS9V0RVwTfHq8e6lIExXkLgMYAJL+ZoAiQEL99kk0UsW7TwdkPadc7qq7qoF8mEP4xfe75tHgipupbSqqd+byb+95Y4Lz2tRUOjQxUv+XimN4TnJ4V6aj1EA7tiv/pQTrgFF6bTmoRxP5WY616/G3TWaRMa+gMWnsiSKZXeG4UiHjQEb1Xhufs/De54gh8gI3ML8JgfnkFBS0XLTz1QD5WQpA0krd4nMz8+pbpzBZ/GHncYVeueCp8zlheKXWFGKCoOuNyDh4yiQOJ1JhJO4EutMdlrBtmxZp1AKMpbFzlO36DkRg5d+7vbEx6MvgJupzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV8PR12MB9229.namprd12.prod.outlook.com (2603:10b6:408:191::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Fri, 21 Nov
 2025 15:00:35 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 15:00:35 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 22 Nov 2025 00:00:15 +0900
Subject: [PATCH 4/4] gpu: nova-core: gsp: Replace firmware version with
 "bindings" alias
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251122-nova-fixes-v1-4-a91eafeed7b5@nvidia.com>
References: <20251122-nova-fixes-v1-0-a91eafeed7b5@nvidia.com>
In-Reply-To: <20251122-nova-fixes-v1-0-a91eafeed7b5@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: OS7P286CA0010.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:26c::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV8PR12MB9229:EE_
X-MS-Office365-Filtering-Correlation-Id: 15dd282d-8109-45c8-dc1b-08de290eb9a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|1800799024|376014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1ZvRnJFeEhXTXFFZ1RjOWt5UHpyeWpLTWU1T0JHU3FJMmdaUThQNXNZeUJm?=
 =?utf-8?B?bzI2OGZuamdjeS9FQkhyNXd4OGxacFZYMEdKdVRFL3NoVFcvdkprSTd2VllP?=
 =?utf-8?B?emFoT3cvVHBBMVFZN0xrVy8yNzFMZXhteGpjUTU5SEN4Vm5zVHNxRUJ1dVhx?=
 =?utf-8?B?MWxiZm9IS3YyQ2xrWG1VRmJtNTlGNUIzSWVMak52Tm1kR0xEeHFucFRwNTBQ?=
 =?utf-8?B?WUxhVW1HU0daV1Y1M2lENWoxNi9Zc09jb0U1UFExd2ErbytwTUkxc01uR1dy?=
 =?utf-8?B?LzV6RS9yc1F6YzB1ejBsak9kTTlwQlJtQ3RBamRVRDRwbW9adFUvR2hkQ0xE?=
 =?utf-8?B?Q09UMklqeDlYQWpNNCtoMGRsSUpxQXk3QjA4WUI3cTNIVDJnVElsb2FXdzJt?=
 =?utf-8?B?UzNBbjZ1eEQ2a2NDQzJrR0RreGV2dTRxekFQOXZ2N04zYnJ0Q09DK0tOMlRF?=
 =?utf-8?B?Unk3dmVDT08yaFpVZlcvRGVOYXJhbUNoNUJOZkRwUTVpVThHTkZhY055L0dj?=
 =?utf-8?B?aFdYQzkwMU9sd2VpNllRa2U5WUU0dDhyWjlzTVlYejhjVklydUtZZXFjQy9i?=
 =?utf-8?B?M2ErMnpDUlpFcVlFRjhtN2ZkT1luR2JibUJBNWJwMEdyWUV1azlka1ZpL25x?=
 =?utf-8?B?ZHcxaDFhOUxxaklONDZ3a3Rka2ZNYXVicXR0bFlHcjNwS2tPRCtvQTVnRjFS?=
 =?utf-8?B?Y3J2VXpKR00wTG0zVjBMdkxkVWFudnV5d0NFODl4VmcxY2kwUW5RTjVKWDR5?=
 =?utf-8?B?cFAwQnJBb1habS9Tbmp1dS80bFNxRGx3djFtdzdkbmJ0MWd2NGFiQmc3dElY?=
 =?utf-8?B?NklMQ0xpRUxrS2NTR0F0MllnMnVkOCtKNEJSbDRtazBvbkZxNUh3OE0yM3Bu?=
 =?utf-8?B?MHVjbmJ6YlZaMjhSVGVCY1JMYWc5SUFVMisreEVrUW45OXNNMTBRWXJXNnk0?=
 =?utf-8?B?YTFJM2ppR3Fjc01CVUVSb2M5ODJGZVhIWjZVUDAvRWkzd0pKalNmY0s3elor?=
 =?utf-8?B?cnRwUlpZcUpnMWdKRnpIRnBiTHpUbmRmQ2NvaFZYQ2NNTW40S3NQZHpWNTVk?=
 =?utf-8?B?VEFiRlJmWlFXNDc0S1dKcm5CUUxzNzR4K0dRMjZCUmU5aVNvbUZTZ2xoMUF4?=
 =?utf-8?B?V1VWcGNzZDV5MS9PWm8ydS9HcDMvTms2UUhYekV4eTNtajV6alhBcXh3bnlQ?=
 =?utf-8?B?Rk1GS0wwVEFCL01GZGQxRE8rN1VXSU1XZjk3OHluQm5xUkNNeCt1S2ZZM3gr?=
 =?utf-8?B?eWcrcWk0L2VGSGtHM1ZyMzhwYkJxbWVEN0x0OS95VkF0SWsrV0FrZ1RJTjc4?=
 =?utf-8?B?eWNTRXNwVTBwMmloYWszK0w5ZGdtMHQ1c1dHUk45OU95ZTRzdXdWeDUzanBa?=
 =?utf-8?B?ZXp1K21rTzBGbFZpaXRHYkpZQ2VQalVqWnJoZlM3Q1pvYnVQS3dvRFB2WmdV?=
 =?utf-8?B?RW1uRnBvQ0wwaFJVZ0xDalZ3d0xOU2lDUFNjSXhuVndMeHBrMm1NNTJlRlg0?=
 =?utf-8?B?cU1KU0w4bXdVQ1RZT3lSaktDaXZFNlBiNU5neWJBSEh4QmxDTFJFd0pYdERM?=
 =?utf-8?B?OXpKeDZYTmIxT2ZSdDlqVFJMelVGM0RYd0FPa01FWitpSlNqaHhTanA3VVNB?=
 =?utf-8?B?Q1YyamFLWmN2Ymora00yeGRwL0xVNExTLy82ci8yTS9KWUhiOXFSeGdhQWNo?=
 =?utf-8?B?VjFaN0M5dVlGbkFVZCtXUndsVGJQYjdJQkFYN3pXR1dSUjNiQS9USktRL3Zu?=
 =?utf-8?B?OUZGa2w0VWZyUkJ5dU9pSUg4eFB4UzVrdU9DUTlJS2l1alN6YjJCL29QRTY3?=
 =?utf-8?B?M2FGb2xQWjBWSS9KSCs0bCtaRHdPTThGbGZIMnpmeG1DanhNbkJ0R2pxeEV3?=
 =?utf-8?B?cEM2ckN5Vm9zSjRZOHIvMWp5eVpHUUtRcUxMVGM3ckJtUW85Z3cxcE1SUEtj?=
 =?utf-8?B?UHJDb1pZWmRyZGxPRHJKRFVrL3NCbzhsZDZMeFFuVmpqRWZTcXJIajlnUktD?=
 =?utf-8?B?cnJhNWpFNktrM1pDTGk5dmExRGdkU0dUcy9xbXkwVno0UGdBUFArSlJ2UmtZ?=
 =?utf-8?Q?EXqH9R?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzBDdDFVaStoc2lwZ2NmQkg3ZWJ3c0pram9PYTZuQzhMaDBFc2NseGhMeVNk?=
 =?utf-8?B?c0lZVzdTMnBMNHdhV1BObVVGVHhrdTJZRzdHNkFwbW9KdHBtYm90Z3IvdjZV?=
 =?utf-8?B?dVBvaFVGWnllSUhBMERDTS9RcldzSElrS2hoRzdtVnhhQURJaXp5RnVMVE45?=
 =?utf-8?B?cUdFTG9pZEVKalA0YjI3Y2xBdkFPUHh0aFBDOVdsZWRRYStpZVMrRHl1U0ty?=
 =?utf-8?B?aHgrQm9JMlZzaC83cWlZa25BRHNjS3JjZ1dQbldHU2NOVUlHcWpYQ09ZMUFH?=
 =?utf-8?B?Mk9yM2k3T1dFMjdGcW1uQjRuZ09mckQ5Y1RUSzM4QVhnYytWbm4xazBkUldu?=
 =?utf-8?B?aUQvTUJCTDVGVi9yYUdoU0c3Sk51dlFwc09seVFTMlZuZ3V6UDRiM0FTZFhh?=
 =?utf-8?B?cDBqSzQ5S093QUNScHcrQ1Y2MUJodFpZWThIWVBnc0hkTGpwSUVxMU43TDNJ?=
 =?utf-8?B?SS8zQVQ3eFV1WEdCOG9oQnd6bThTdE85VW8xbG5OenJVdTNJeVhaRHNKTWVX?=
 =?utf-8?B?ZUYwRFFNYWRZeXBMeGsrbTh2dU5USHc0UjhhQ0JiMWFxdVA0Ny9qdmRYNHlo?=
 =?utf-8?B?ZWRRN2R1cWl6dDZUTHpycDY3UHVQNW1qdnJxT0RCNGF2d1RGRlpsWTJTNFlo?=
 =?utf-8?B?eDFXTlZqdEo4UXM3OGRvaFhQbmQ5NTNHM2hzcVVIR3hnZjJmVUdJd2FSS0E2?=
 =?utf-8?B?dE12UTBLb3FGTm5YMThnVUF4UTVOdXp0NTQ5bFVmNjJXci96blNYdUZhcXNH?=
 =?utf-8?B?bHYvd2pTZFlDdnMrKzRwNFBJSFNpWFBEbmVJQTh0QnJEYTRFZE84dk40ZWRU?=
 =?utf-8?B?S2pjWVEwQSt4S3ZqRTJLdnNQZDBFMmdiM1huOXZ3eWdhK1pyb0FydFZmR1hV?=
 =?utf-8?B?OHBlZ1FKcThWZ0xFaFhmT3N0ZFFETkM3RUh0bGNtT01oQktjZFNqQ3FCNkl6?=
 =?utf-8?B?bFBKNlRwSkRrUjVUYmhJWVVvaXBCV2p2MEVqa3VzRDNBaTBSdFpaN0JEQWdV?=
 =?utf-8?B?UWpTZTdRdHB3b2hkcmc3OGZYUmxicUdqN09qc3g4VFhMdVJlTHhjNUV2clhD?=
 =?utf-8?B?VEYyQU5JYXVYakxXSXQ4WTNSdDArUytTVVhJYTh5c0JVRVJDM3NxWnNML1RV?=
 =?utf-8?B?S09LUGdFbU1IeHFKYzFuQnViK0JISWdsWCtLMmZLWkVxejdLNTI5bEdDQTNQ?=
 =?utf-8?B?VVBmTW5TR3RmQ25TZUlzNWFlSGRVV2UxRkFKN2xlc1oxdEtHYU9xdkZ0UXBz?=
 =?utf-8?B?NFp5VStOdjFOSjVhMUdoOTI4UGtxcXB4dFU5bUxRVjNyLytOVUQvQ2VIOUNt?=
 =?utf-8?B?aHljamc2QXlTZ1h1dzJ6dm5PaytSc3lQbXlOSlBmbTl4MkRRb1V1VXY3aHM5?=
 =?utf-8?B?OFMyeXAyT3ZBcExmZ3g5eVdBL0dYNUROZ2tpUXF0VldSZXhhdVJlNTF6dE4z?=
 =?utf-8?B?V2pWWFhPS1hSZ3pFZUVNS0RUTlA3UTRLR3NZc09mM3RhYWU4ckhnQU5TWDlF?=
 =?utf-8?B?bUZ2NzJUTFVLUVpjcmlVS2J2Nlh5MytkT05QV1VCM1lYTW1wZ1hQcEp6VWth?=
 =?utf-8?B?ZlpBcm1ndEdUZ3pPVWFFNksvcGpvTGpHcVRKdkFqZ2hRSmZiL2ZiaFBJRUJv?=
 =?utf-8?B?d0lwMzRUS2ZlVFB5TVhWSjBSVS9oNXdYNTZLL28zOG9rYlJpbkc2ZTNrYThk?=
 =?utf-8?B?WUhER1lhNk9MM2FpYmduUU15VEV4R3djRmg5bFNMbzNEWkJrYUZOWVJYVjFo?=
 =?utf-8?B?dDRXZUNlazZiL1pJakRoTGQ3TlVTYUo3U2crMGlJaHJmL2JVZ1ZjSFMxVzdz?=
 =?utf-8?B?bEVjTlFiRFJ2aFZ3OGZSSExSSkpYR2psNC8zMmV2U0t6S2pFa3JTUzhwVHk4?=
 =?utf-8?B?TW9iU1RzS0RCLzVrTTg5c29MMlBsR2tUWlFZTG00NTZldWJtcGRPa2RPdWRh?=
 =?utf-8?B?MEV1cDVWaDdRN3ZsU3AzaERCTjA4Rm9oSVRKd0tucEJmbit1RkhGeVVFV0VX?=
 =?utf-8?B?aitpQnB5R1pFdWg4cGM4a2dtenRPT1pDM1NIZGh5bDl4WGwreGh1OHF6WGdJ?=
 =?utf-8?B?eXU5RFovUXdUZ0YvdGJoVlpITzBlUUREOEIyb1JrMEp1ZlV4YlZTUFhoK1R6?=
 =?utf-8?B?V3lFSEdGU2ZIWWFpek5aWTRUMGMrR1ZRWCtCTnhKUytZTXkwZmJDRGowKy9a?=
 =?utf-8?Q?om62YQcKH70epJsAg9saAq6osgVNqXe0Lpdm5ZoZmPEH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15dd282d-8109-45c8-dc1b-08de290eb9a5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:00:35.5890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B7NGv3Qm33rwdaqggt3PMjbKvsogsaSilH9tP+28gPU77mkotVsAQYRZQiRY3HAbpqZ6wh1plaESTNb6lm77aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9229
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

We have an "bindings" alias to avoid having to mention the firmware
version again and again, and limit the diff when upgrading the firmware.
Use it where we neglected to.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs | 58 ++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 252755dbb73c..3baa5455cc32 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -141,8 +141,8 @@ unsafe impl AsBytes for GspFwWprMeta {}
 // are valid.
 unsafe impl FromBytes for GspFwWprMeta {}
 
-type GspFwWprMetaBootResumeInfo = r570_144::GspFwWprMeta__bindgen_ty_1;
-type GspFwWprMetaBootInfo = r570_144::GspFwWprMeta__bindgen_ty_1__bindgen_ty_1;
+type GspFwWprMetaBootResumeInfo = bindings::GspFwWprMeta__bindgen_ty_1;
+type GspFwWprMetaBootInfo = bindings::GspFwWprMeta__bindgen_ty_1__bindgen_ty_1;
 
 impl GspFwWprMeta {
     /// Fill in and return a `GspFwWprMeta` suitable for booting `gsp_firmware` using the
@@ -150,8 +150,8 @@ impl GspFwWprMeta {
     pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Self {
         Self(bindings::GspFwWprMeta {
             // CAST: we want to store the bits of `GSP_FW_WPR_META_MAGIC` unmodified.
-            magic: r570_144::GSP_FW_WPR_META_MAGIC as u64,
-            revision: u64::from(r570_144::GSP_FW_WPR_META_REVISION),
+            magic: bindings::GSP_FW_WPR_META_MAGIC as u64,
+            revision: u64::from(bindings::GSP_FW_WPR_META_REVISION),
             sysmemAddrOfRadix3Elf: gsp_firmware.radix3_dma_handle(),
             sizeOfRadix3Elf: u64::from_safe_cast(gsp_firmware.size),
             sysmemAddrOfBootloader: gsp_firmware.bootloader.ucode.dma_handle(),
@@ -315,19 +315,19 @@ fn from(value: MsgFunction) -> Self {
 #[repr(u32)]
 pub(crate) enum SeqBufOpcode {
     // Core operation opcodes
-    CoreReset = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESET,
-    CoreResume = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESUME,
-    CoreStart = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_START,
-    CoreWaitForHalt = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT,
+    CoreReset = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESET,
+    CoreResume = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESUME,
+    CoreStart = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_START,
+    CoreWaitForHalt = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT,
 
     // Delay opcode
-    DelayUs = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_DELAY_US,
+    DelayUs = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_DELAY_US,
 
     // Register operation opcodes
-    RegModify = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_MODIFY,
-    RegPoll = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_POLL,
-    RegStore = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_STORE,
-    RegWrite = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_WRITE,
+    RegModify = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_MODIFY,
+    RegPoll = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_POLL,
+    RegStore = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_STORE,
+    RegWrite = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_WRITE,
 }
 
 impl fmt::Display for SeqBufOpcode {
@@ -351,25 +351,25 @@ impl TryFrom<u32> for SeqBufOpcode {
 
     fn try_from(value: u32) -> Result<SeqBufOpcode> {
         match value {
-            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESET => {
+            bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESET => {
                 Ok(SeqBufOpcode::CoreReset)
             }
-            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESUME => {
+            bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESUME => {
                 Ok(SeqBufOpcode::CoreResume)
             }
-            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_START => {
+            bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_START => {
                 Ok(SeqBufOpcode::CoreStart)
             }
-            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT => {
+            bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT => {
                 Ok(SeqBufOpcode::CoreWaitForHalt)
             }
-            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_DELAY_US => Ok(SeqBufOpcode::DelayUs),
-            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_MODIFY => {
+            bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_DELAY_US => Ok(SeqBufOpcode::DelayUs),
+            bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_MODIFY => {
                 Ok(SeqBufOpcode::RegModify)
             }
-            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_POLL => Ok(SeqBufOpcode::RegPoll),
-            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_STORE => Ok(SeqBufOpcode::RegStore),
-            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_WRITE => Ok(SeqBufOpcode::RegWrite),
+            bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_POLL => Ok(SeqBufOpcode::RegPoll),
+            bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_STORE => Ok(SeqBufOpcode::RegStore),
+            bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_WRITE => Ok(SeqBufOpcode::RegWrite),
             _ => Err(EINVAL),
         }
     }
@@ -385,7 +385,7 @@ fn from(value: SeqBufOpcode) -> Self {
 /// Wrapper for GSP sequencer register write payload.
 #[repr(transparent)]
 #[derive(Copy, Clone)]
-pub(crate) struct RegWritePayload(r570_144::GSP_SEQ_BUF_PAYLOAD_REG_WRITE);
+pub(crate) struct RegWritePayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_WRITE);
 
 impl RegWritePayload {
     /// Returns the register address.
@@ -408,7 +408,7 @@ unsafe impl AsBytes for RegWritePayload {}
 /// Wrapper for GSP sequencer register modify payload.
 #[repr(transparent)]
 #[derive(Copy, Clone)]
-pub(crate) struct RegModifyPayload(r570_144::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY);
+pub(crate) struct RegModifyPayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY);
 
 impl RegModifyPayload {
     /// Returns the register address.
@@ -436,7 +436,7 @@ unsafe impl AsBytes for RegModifyPayload {}
 /// Wrapper for GSP sequencer register poll payload.
 #[repr(transparent)]
 #[derive(Copy, Clone)]
-pub(crate) struct RegPollPayload(r570_144::GSP_SEQ_BUF_PAYLOAD_REG_POLL);
+pub(crate) struct RegPollPayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_POLL);
 
 impl RegPollPayload {
     /// Returns the register address.
@@ -469,7 +469,7 @@ unsafe impl AsBytes for RegPollPayload {}
 /// Wrapper for GSP sequencer delay payload.
 #[repr(transparent)]
 #[derive(Copy, Clone)]
-pub(crate) struct DelayUsPayload(r570_144::GSP_SEQ_BUF_PAYLOAD_DELAY_US);
+pub(crate) struct DelayUsPayload(bindings::GSP_SEQ_BUF_PAYLOAD_DELAY_US);
 
 impl DelayUsPayload {
     /// Returns the delay value in microseconds.
@@ -487,7 +487,7 @@ unsafe impl AsBytes for DelayUsPayload {}
 /// Wrapper for GSP sequencer register store payload.
 #[repr(transparent)]
 #[derive(Copy, Clone)]
-pub(crate) struct RegStorePayload(r570_144::GSP_SEQ_BUF_PAYLOAD_REG_STORE);
+pub(crate) struct RegStorePayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_STORE);
 
 impl RegStorePayload {
     /// Returns the register address.
@@ -510,7 +510,7 @@ unsafe impl AsBytes for RegStorePayload {}
 
 /// Wrapper for GSP sequencer buffer command.
 #[repr(transparent)]
-pub(crate) struct SequencerBufferCmd(r570_144::GSP_SEQUENCER_BUFFER_CMD);
+pub(crate) struct SequencerBufferCmd(bindings::GSP_SEQUENCER_BUFFER_CMD);
 
 impl SequencerBufferCmd {
     /// Returns the opcode as a `SeqBufOpcode` enum, or error if invalid.
@@ -612,7 +612,7 @@ unsafe impl AsBytes for SequencerBufferCmd {}
 
 /// Wrapper for GSP run CPU sequencer RPC.
 #[repr(transparent)]
-pub(crate) struct RunCpuSequencer(r570_144::rpc_run_cpu_sequencer_v17_00);
+pub(crate) struct RunCpuSequencer(bindings::rpc_run_cpu_sequencer_v17_00);
 
 impl RunCpuSequencer {
     /// Returns the command index.

-- 
2.51.2

