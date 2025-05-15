Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B680AB7DF4
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 08:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0129D10E172;
	Thu, 15 May 2025 06:26:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TdJ+zrO6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB9610E172;
 Thu, 15 May 2025 06:26:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xiddnJcpq5w5JItaRG3NZ7UFaCH90fAzphS8LArPhaUbNimZMKMz6jLikwGIarji441KhId88cZqGeheszYhUlKva7BERPGeMLUWjGwFpyAklD1ww9WQViXPoHmPXnDh18I65albK8QMQKyfTCZ1hxmdHBOgce5GGPMvvBr6GzPLLS3xz1jnUNM3/kYhbnkgxVj0hoMpB7j7Pv9NQ7eqaFVM0B7axqnnC0TZah+vmLp2f/WU98ZFPa4ZoD+RCJfuG9gMiCCSkKj2QXPMq8WsYTPApHV0D2BhQucbHgBD3K6Yt78TdDfQhSZsEEPz9V1pbKGtOoNeM1l//QY8/vQfMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BfJ4kWdNRCeyCYnYyazNnBhnUeOoHE/zSCRQH/X6vOw=;
 b=ff7/01xi0IXvJlBLt7lJ6htSrV+A49ALRVMrO/LGmMDV1zDYkjrvKLBXt4l3Qk/ouacGlA5cesERfNdBWWQYDZc6In1BmJvCUKvIh+ZowOHXpcw3FIG8E340ARlZzs3M2/NugArZINlEtWxD5wtAJ0MeUeCLugokqy+md6YWwclDdloYQ3xm50r4xHHwnH8zaoHXVDxgxHKRTRauh7Oz91H6/kZkmfDV8Ei8qP99MgGqh2YOCxSg3BpEe+KQByhMIieHPkeSP3nQ8BNVYM/OBdxY377T11VMFG9SNuhM/UtbMHG87+DuG5GhA8xluvcbUaQxzxndm0kkkpnB7zs0hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BfJ4kWdNRCeyCYnYyazNnBhnUeOoHE/zSCRQH/X6vOw=;
 b=TdJ+zrO6LEVcaYATDJFu08YGj2nXw3Qcc/TRT7bLCHk6vYhUwVUXJPxm7VXKNFHWLaUghHzhCUSe/D0MPoKIx4V+4XRk8LlOUjV5cMLHI/aQC+ECTop0YzdeEmgEE0J8zQ/X7j9nNnUghcPRyPjojq1AuK3baxdKmUkUTKKxYAb4poLFkFl62Awoq/xY9uCAdg/WH7HJkaGCec7mhLZgYx0VEMIhbXWcIEBQp2JGMEjFXoC5Z053Gn0nhE6mFwpH07bXLwPTQRyKUyq2kA0EM3q2uLkZr2slsDKR1z4oe21P9Ob2yJu7nJLar7Ks10lVR6SmJR17JUM6NE2w7R1few==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8709.namprd12.prod.outlook.com (2603:10b6:610:17c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 15 May
 2025 06:26:21 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 06:26:21 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 15 May 2025 15:26:13 +0900
Subject: [PATCH 1/3] samples: rust: select AUXILIARY_BUS instead of
 depending on it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-aux_bus-v1-1-1781b54424e4@nvidia.com>
References: <20250515-aux_bus-v1-0-1781b54424e4@nvidia.com>
In-Reply-To: <20250515-aux_bus-v1-0-1781b54424e4@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0167.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: 424b5dd9-8baf-420d-bca3-08dd93796887
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXc5VWZ0YVpZSG9HZTVOMTIrcWtpV0t5ZmdvanovcTZWbGhxcHBNY2x5MUVL?=
 =?utf-8?B?ek9DdTNuMENsMFJtVFlMQzA4eEROKzVlTWlmNTBiMEFDYlB6bnlqRzNBa1hW?=
 =?utf-8?B?K2RUVER4WHd2R2ZhMEtrMkpvVkVydmNGcTBEK1haMk9wRE1zOW9CaEZIOXdX?=
 =?utf-8?B?SEh4d1V1RkVnMUx0ZVlnQ0llbTJ6TzdtSEdmWFlRV0ZmWTFmWjdIaWFhTEVp?=
 =?utf-8?B?UnNWb2RtQlZNRlAxa0NjZnZBb2w3NGZCTVVTRVZGenR6L1hRNkZIRENFRThI?=
 =?utf-8?B?UnYvMEQreW1VaXpMQXI0MlE0b2VselBTdDIrUCtXekhjVWxlazNyWmN5K25k?=
 =?utf-8?B?SWtablg3MXh3WWsxM2JaSjJ4aHhYaHF2RGhHcWRvUkVNbiswTFBuQlMyb0cw?=
 =?utf-8?B?djlzcmtpbjRHZ2k0WHZSS21FSzNJcktNOXJNaS9lYS9rQStrcXhEVUZ4RmNS?=
 =?utf-8?B?dnhsNTQxMFhpZlNqbkNIZWRIaUI5VmpYVkx1MktRaHRJUmpualJqcmg5Z0Nn?=
 =?utf-8?B?WWFpVVBtUHJEVURWVDVXZmtFanFSdXpNY21ydVpYSTlzdUlwZEx6emJaNGRl?=
 =?utf-8?B?SVVuRjcwNUxjbmEyZnF5bG1JL0QxdnVIUUZQQjgzQmRFdktudGh4Nkw1Y01O?=
 =?utf-8?B?b3B6MTMyWVQxU0JOWS95SDNtOFl1dUpWY0swZ0RWT3pIbG5YYnVLMzJyYmVV?=
 =?utf-8?B?Szl0THJnTnZBOVJkVHAzczkrbnpmNFJUR2FWNzkxUUJid2ZGWG14a3lQYmhR?=
 =?utf-8?B?cVQzVUVBZGhwdkFHSmo0aDRLR1VPbm40ODFHc0RrTk1YVzIzMzB3R3cvUGpu?=
 =?utf-8?B?akQzcjlDWjBaNWZnUjErS1o0YXpwei9kV0Q5QnN1Zm9zYWV6SUZKS29ZREtq?=
 =?utf-8?B?TUJ2QVU1eWFHWkJ4SDVhODNSMUE0ZEFyS0xjdXNpVmRhQ3BlNkhhUGdQbXgv?=
 =?utf-8?B?ZmF2V1Jud29zSXFoZjBZWHlBN1R4RWZIWmxZcXpUVkd1Smp1VHBMWFFHZU12?=
 =?utf-8?B?Si9MczUrdnFrMTc4d1Axb2wrSVJMR1JzcHp6UHM1UlkrMGgwNmhLbTFOU1or?=
 =?utf-8?B?WGliek9VYVJpV281cGt1NnNoV2c2eUsrTmladlgzL0F1TUFJMGtIeUR6b2oz?=
 =?utf-8?B?N0tLVHFDUUZmaDAyektiVUNEQlcrcThXcG0xSllNMkthelVMS0pvaUtpVDg5?=
 =?utf-8?B?VEl3TjBiWm1lK2dneElOQXJxYmJsUUd2eEdkM0orSXM5L2ZodXpTUkt4YW9y?=
 =?utf-8?B?Rlk0RVp5bFFBam96VEpDK0puY2xrdXFtajNvYU03TDNMUEFUN05IVWhQWklr?=
 =?utf-8?B?eSs2b1M1bExoNncxZTFuTVZlVnY2OVFvazRZQUVuVXQ2SjByMWZ5RHMzczRT?=
 =?utf-8?B?K2dXY0M2VFYzT2xNRmhYYURjZ2k0VFhWb0pPZHlySnY4NXlYTGkycTJpZTlh?=
 =?utf-8?B?dlpXOEtiYkNXMFVuREU0M0V0UE5IN09xVXJkZnRtMHYxaE9sMFBzVjU3Ziti?=
 =?utf-8?B?eDdCYi9pQ1RjbTcxL2ovdjRQaTUrY2NLV3dHTFZFd25Oa1laYUVEL044ajIv?=
 =?utf-8?B?MDk1Y0k5SFhwZ0lqL0lhTk1WTkpJa3I2V2NYNUNwbzhZMzdVZ1ZRZlZMN3ZN?=
 =?utf-8?B?VHZ1SHFVanZNWiswOFltVVBjeGxtb2JyNWU3cGdQd1RpZDNwQitBZ0QzWmdz?=
 =?utf-8?B?N2VKcWU4U2c1NmFCaWgrclpqWU1vRE5yQ0ZBeEw0TlhMOGlLZlZWRE5WNHY1?=
 =?utf-8?B?LzJUM2pWVkUrN1Z4OWdUeUhnSXdLVTRSSzh6cFpkL1NLMUxUcTFZTHlkbjIy?=
 =?utf-8?B?WThPK1VqVjFFb0JQNmNUWXhkYm44aUJQWlgrNldOM3RLM0FJL0hyOWFoVVdj?=
 =?utf-8?B?L1QzcVlLTXZyeDR6bWhBK0pvN09UZ2hYN2VMbHlTS0N0N0VqUjZNZTdvTDBU?=
 =?utf-8?B?Q25DU1h3dUZzRXFncHZJQ1k2bnNTY0RXWm9hZWVmQmhYOFBTL3VZZ3VuRkVa?=
 =?utf-8?B?Yk0zS0o2NkpnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWVDZG1JaXRnaE9YeGNiWmNBMmR5NEFGVEtQblVCM3hVWHFIUUpsb2twV3ZP?=
 =?utf-8?B?VkJYbE5mMkFXYjFXdytibkR6cllKMEFPcGwwT0JqWk5tWHQ0Nm90RUUySVlZ?=
 =?utf-8?B?MWdORjlrWVZNc2w4SmExcDkzcUo4cHJ3TXRwRzJkb0tCTjBaeWN5QWJkeDZQ?=
 =?utf-8?B?ZVRKZnk0QVUvbHQ2UjcyWVRpY0ZrbDZRLzF3cXVNZENDZ3BkVmlLczgrZ0Fm?=
 =?utf-8?B?eFNZOUErdlU0VGc2TVNWTmxMOEorQUJmdkJLYnJxU0g5cEp1VC85UWJNNVFp?=
 =?utf-8?B?MkUxV0FEdTRsd01jV1pHcytWWjROK1lIRjF5ZHdFV0ovUkwyd05lNUpUcGpN?=
 =?utf-8?B?VjVUU1FNUEVkNGRTeitIQU1IZWh4NU5sUUV1OFdrbTFOQWFKQTVmWTFCVmJ5?=
 =?utf-8?B?ZTdlbllVOGdZcWJSek9MQmxnNWRDZWl6RExOU054eEw1TnExRHNWMU5USDdN?=
 =?utf-8?B?dnRoVEFFeGw0YnpkcmUzTkhFd0VCOC9TaVhXaXRzV3lnRmlXOEN0bStRZzgx?=
 =?utf-8?B?RTdnUjFWU3BRUUZKZXhzR0k5Zndra0hidVl0Rzd2dEtMRU45a2ZiTUlPcWpF?=
 =?utf-8?B?eXhqVDJta2ZZT29LazBlMHM0cUZ5ZHBLcmtPWVBONmpqSjQ2NUNyVXVWVmxB?=
 =?utf-8?B?NjMvTk9jTmxWK0toRWkybzh0RDlZaWtoR0tNM0VoK0x0TFowZmhqd0E1T2Fo?=
 =?utf-8?B?Si9CWUk4VGRzM0hHVU9DejhkbHUzTUhwM2FVdkNEeDBRQ1VOL2ZDczBXcVRD?=
 =?utf-8?B?U1RBdFpwNld1QmNyaXhLL1M4VUwxOVFST2dYNm1JcWJvMGt1MEVKRTlTU0Vi?=
 =?utf-8?B?YXlFVUpMY0duMnJUa2FHcTFoblpxdUd1bnhxMXBUUkZoZ3l2Z3l4WnJZZnov?=
 =?utf-8?B?Q0xnSHJiRERzWHFzdFhqUFY5NXpleHZpTFZsaUtkY2VjbTNlQm9BU0VmNmRl?=
 =?utf-8?B?YWNyZ1lndTRGcndKTFFsazM0V1ltejZJLzA3YzNSdEVEZURNR2NhbG0zYUtj?=
 =?utf-8?B?QTFieHNiRnVRaWNEZFluNHc5QTJZMHdJcWZUWU1LR0s3MFh6S1hoa01DUW9B?=
 =?utf-8?B?SXhLbDhLelZTT0J5UzlSU0hseUdJNnVOWXdXSTFZWU02QlJzSWlaUjNmWW1X?=
 =?utf-8?B?ZU4xbUtSYmZKSkVMTi9MOVQ1dkViVVRybzhQM3NJOCtLTXlXb0lZQllJQXhw?=
 =?utf-8?B?WFpOYk1tbmpqMC9DS0ZGS3lEY1poYjFvUGtveE5iRnp2dUtQaEs1RnlGZEsw?=
 =?utf-8?B?LzdCMlNycjNLSFJOVldGTVJlYnlOOTBJM2Q3VG12WGtOc25GVnNsTUJ3Y3pN?=
 =?utf-8?B?UitVSkNzNDVjNW1yTk44ZmhrNnNudnI0ZlYrRGVYaWdNWWx2QTZleDZ4dHkv?=
 =?utf-8?B?bEZrOWZ6a1Q2aVFWVFVOY252bmx3Z3hqZk1kVDBiMkZzcEIzNWVQV2thYWIy?=
 =?utf-8?B?SzJadHRqamJlYmtxaGF3L3Y4Z1FSWDdwOXc3MTMrOGluTlpQTzNTY3E3ZXBv?=
 =?utf-8?B?S21VL1h1SzkyVlRzVXF1enI4bHBhSmdqV2pCa0x4ZWhjMFdUc1JkekR3NWFH?=
 =?utf-8?B?T2hmUEgzeFF5OXBhYklYTUdaNTM3MmpwKzV6S3NzemRZa0pFR09KSjkvTXJj?=
 =?utf-8?B?VnczRDc1M2E2c3R5dmYwbVJZV1RMNE54c25JSlVxS21aZnU4WGxoTlpRNlpU?=
 =?utf-8?B?dy92NnRKbGNwSGlTSzFLV1gxVTBoeUhYbGcyU2JSUk9IK1VIRmljNjliZm1Q?=
 =?utf-8?B?Tm5lQlppS25KangzOEllalFGeUx2OTAwV0hNOGs5RG1CNHVWeDZZUmdwZWoy?=
 =?utf-8?B?ZHFZMVEycllpMWJvYzZrT3FxQ2cxK3JtWGZ5MFN2aHhDNEgrMktNNVdaZVNL?=
 =?utf-8?B?T1QxdFoyYUwyRUEySS9va1FSNHRVenhCLy9yV1cwZDUxWkZHL3BFWFcwamtQ?=
 =?utf-8?B?THZEaWNXSmNva3g0WFF2bDdpcHk2a0FueDVPR1RoU0pDcU8yRDhWK3JVdEtG?=
 =?utf-8?B?b0w0UWI5SlFWcGdCUi9LdFdzaCtzbHI5aWJjYTZqSjN4S09sQjVZaG5xTEN4?=
 =?utf-8?B?MHB2TkpPdTZnT0NLNzR1TStHbkdSMnh6MDlhSzBzcGpJNCt3dlU1K1czQ3Nt?=
 =?utf-8?B?TytOY0RYa3VVVS9GUEJYblY0VU4rWUpMT0sxRGtyUmppUXc2Yks3NHhtUE9M?=
 =?utf-8?Q?fYni7zyS1yxTtL1S8s8dscou0Y63rxQEpONOU0kEkQNi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 424b5dd9-8baf-420d-bca3-08dd93796887
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 06:26:21.2370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 52PNyjMVSKThRTgf0wTDUmoZpSRiBYbIhpM2vJTnylwG9CWB5VtibCosYxBnnhCkLFY6VDcT26mwvo2sWqcD4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8709
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

CONFIG_AUXILIARY_BUS cannot be enabled explicitly, and unless we select
it we have no way to include it (and thus to enable the auxiliary driver
sample) unless a driver happens to do it for us.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 samples/rust/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index 43cb72d72631bb2d6e06185e1d88778edff6ee13..b1006ab4bc3c341ef8e25c9b8e865ccf23983a6e 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -84,8 +84,8 @@ config SAMPLE_RUST_DRIVER_FAUX
 
 config SAMPLE_RUST_DRIVER_AUXILIARY
 	tristate "Auxiliary Driver"
-	depends on AUXILIARY_BUS
 	depends on PCI
+	select AUXILIARY_BUS
 	help
 	  This option builds the Rust auxiliary driver sample.
 

-- 
2.49.0

