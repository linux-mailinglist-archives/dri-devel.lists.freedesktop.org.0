Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFC6A4DFDF
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 14:55:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC0E10E5D2;
	Tue,  4 Mar 2025 13:55:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ezMSoVjg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2080.outbound.protection.outlook.com [40.107.243.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA7910E5BC;
 Tue,  4 Mar 2025 13:55:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bo+SHqn9Tws/HU4dU1w6Vpa+TDVhisauiN31Vd0UBFUDHVrL5jfsYoZXgyHpW4DwuU8UoZUM8Aewm2RbT7R2RQJohE8CtVN76fKPZWYmr3ZKngp44fou3AaiH4fcmN6UhloxCsrC3900OTGy4D0KxHfz/VYL2PKd7MTJlsT23eyhM6UOyVGHl/5qdOTIlD3ypQKMXkaG8m27/IOLQeQyglgDmLWLY3ELomqp7laEq5M82vY5elN8AMy4V33gmqLFggHcbIOHAurih4gEkpVV6JyqOcO37iNInBd/EDfh0DO7Kqm+rbbwGXrcxJDZszEk/G7AjA78vppPJeEqGat08A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XgW2OlT414OYt9eoVnnxSyIHem8CaSZ9N6r8fJ5Rwy4=;
 b=foGCrWF+9R9/MmHBMBZ234od4/MzpWCQQ7mKgMDIkXTN056+9w8fdWsM4PJzes6XxyY4C3f2rVgMoTBY/Jv+Ul8BsH+lcnhj+tG1IgfjHbXN2XUsI+bLw5b8e902zzp1Ax+sAziPgCgybVbI0FbSZg5qfdF65RgwiKZ+aDl6a3B6bVu3GOIJTNdT7gB5t2FNhgyolIwbe+WHrHhNrXkQO1oE5CY4EsGD1msqo0v9r5VGZ3x916PKOCOMsliSgWDDtLJ2N3R6u67OA3r19nuaMDAJfg6119lgh/9JbHwz7rwjlhTxOEq8TsQ1h4/Bv8jJSBiQMJ9BzuDTZPgWHy8DXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgW2OlT414OYt9eoVnnxSyIHem8CaSZ9N6r8fJ5Rwy4=;
 b=ezMSoVjgLerTG2ovicXG+5viiU4foITxMa+koRzyGbFHL4uwrhVncuyFhyha/Ocm7L5pBf+To6/2P81jjjRRb3cvsnEkyfg6Ww1KBaDyE08oA7pPGFRznEWfOveOB9QHPLMJFDpLi8NmEYBJ8Kb9Tu9EoRtFmFuV64qD7UrXXC2XNKClFjcit/Q39k1/Cd+nnYdJiTwvbFnmjMqPTKd11B7W43pjJP/du1LDO0BBdmlGrSWO1EO/HO3aEaSU16Ebm7tHf9iPkOvkLges3R4/vPjqnla3V/0fA90RROXRMBUeteMdxGZLE5wBeDzN4NJhJ9Qm1XXAJIvHYD3th7g6jQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by DS0PR12MB7874.namprd12.prod.outlook.com (2603:10b6:8:141::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Tue, 4 Mar
 2025 13:55:02 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%6]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 13:55:02 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 04 Mar 2025 22:53:59 +0900
Subject: [PATCH RFC v2 3/5] gpu: nova-core: add register definition macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-nova_timer-v2-3-8fb13f3f8cff@nvidia.com>
References: <20250304-nova_timer-v2-0-8fb13f3f8cff@nvidia.com>
In-Reply-To: <20250304-nova_timer-v2-0-8fb13f3f8cff@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TY2PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:404:56::26) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|DS0PR12MB7874:EE_
X-MS-Office365-Filtering-Correlation-Id: ca6a5628-8c05-423a-944a-08dd5b2428f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aDdQNm5LbURsK0FIRGw2NDU0TytVRXhqTXhrWk43NTIrbzNUOWo0MTVCS0hs?=
 =?utf-8?B?ZzI5eStyanB1SThDVFVsVTNUck1pc3NtcTRGZkpidzViZGJxamtxZWVRQ3VZ?=
 =?utf-8?B?VDR0aE5qLzRzR0lGOFdVSGtoUGJtYUxjYWZ5bjY3UG4vMmhTU1JFazhlMkEv?=
 =?utf-8?B?cTkzOVVLQzB3NjVWNEpRcTl1Y0s3YUdsbEFyc3NqekdybFdiM1pIODFoM05P?=
 =?utf-8?B?WFRoM2EyNDB5MHBmTFVES2RDTW9hTUNPOHRzODdNWnc3QXo0ZWRhRnUyWlF6?=
 =?utf-8?B?WTZ4QlRZeldrSkJaNzBTci8zV0ZCUGhVOFVSYkRnSnlvWkQ5eDcvUWdJcXg1?=
 =?utf-8?B?bWZDbWF1bktwZHIrdEQycWhwQUpzZjZqcWRrYW5ka2ZSNVRKaEFCWnJsKzFm?=
 =?utf-8?B?Q0JKbTVpZjBLcU4rUlNyZTIvY2tLcmNpbHBUK2ovTVYvWFA1cWRKemVOczB1?=
 =?utf-8?B?d29XakZuM1VuNWEySGZjMVRUOWRtYlZwT2VFS1ZOeTlvVzJvdzd1TVNJNjR0?=
 =?utf-8?B?MDg5Z1FlcU5ncy9aUm1sblBrVVJjMVF4NDluSkZOSHJDcm1DN2daUDduTGRp?=
 =?utf-8?B?SlRab2EremthWDNRVVBHK3JUUkM0OHJjTjcxdVFpbmZsblp4NTBWRUNmaHY0?=
 =?utf-8?B?azg4TnUxamJRZk9SZjRqcm9GUzVFQmRmZHJRMlVhbndiVVdNck81U1ZxQ3Nj?=
 =?utf-8?B?RzZMV0NUOHl0VUJwZ2krRG5pQlptZWN2Tnp3UWFBNjByd2Vwd3c5WVVSck1Y?=
 =?utf-8?B?Q0YyZ0FVSklCbU8yVmswUFpqR1RCUE9ndTNvNHJzOGlSdWhtWlZDMWRWQzgz?=
 =?utf-8?B?eTMrTkdEOEgxcTA4L0ljdEVYVjRhWkR4RERPYkpjVzB2UWtDVmx1d2NJZy9X?=
 =?utf-8?B?UzJocW1rZ2FzNXRrVDVXb1NNcUc0eUVXRDgyd3NWaVlyL1lGUndOdHR1RytX?=
 =?utf-8?B?NVU5SmV6cDUyQUpiUDVBNEc5SjdRYnJqOXRLSjdWMEIraHkvb2FhOEwwNG1V?=
 =?utf-8?B?blpKb0o5bzRyZGxiVDBiWnoxc1FoWWRpSFMxbU1oUzIzU1pJVThTb1lyNzNX?=
 =?utf-8?B?cFhGazE5d0NhTVBrYWVpdkZpZ1Fad3NwQ3dqTC9CY3ozTEYyOHNtVkFFRmRx?=
 =?utf-8?B?QkZpWmlQQWNBNEl5WVNOczE3L0prZXFXOUxPa2hrVkw3K3p4TnpEUlpFbEMx?=
 =?utf-8?B?a1hOUDNJZGtiVzV2cjVyUjk1U1BDQlRMdVBqNGc2dDNsZC82Z1E1OVlZMFpW?=
 =?utf-8?B?V1luTUV4OWNhTzV3OFpoS1dEd0NlS3loU3hZdlVZcHVIU0V6NnFlaW54ZXdt?=
 =?utf-8?B?OVhXcGEwYnlsbWxmVHMxNWt1bnBxVVgwWGExdERHcTlncFdoLzVLTTY4Zzha?=
 =?utf-8?B?VmRBd1h6WS9IclNiclI5NXA0NVNBcE1vRDNGcWo2VGdqY09JNUdhVHp5ckpN?=
 =?utf-8?B?eU1ncFEwNFBXK0VYWE96MmY0TU9ueTNIUm9XY3VENlYwSFNnWDNRR1NXTjF0?=
 =?utf-8?B?T0dEQ0YzTmp1cmdiallkdFlvcmpFZlJLQVRxZEFSWUJydW8yZ2VWeE16Vlgr?=
 =?utf-8?B?NHR2SE5BekxvWm9sZUNlOExEVUZGc2tpZVVuODFVRWhEcEUxNHlHNEtxMUto?=
 =?utf-8?B?RnlISE11SDhiTnRBTkhLMDRlT1VEMFhZaTJyR25xMTNFUUZRd3JFU2hmVnhQ?=
 =?utf-8?B?em9ZMXRwbkx4Y2p0UXVRdlA4ODdqaUp3WUxpSlc2ck50SWlkS0NDRXh2djJH?=
 =?utf-8?B?aFJaKzVseitxM2YvT04zVlJPU0p6clcrZ1cya1E1ZEllaXk3dlVaWUNCVUM5?=
 =?utf-8?B?VUhDQmxyNjd4eklNNE44UHlNZnlkU2NlU1l0S2pHSEE4OW44RXlPbXh1YjNx?=
 =?utf-8?B?R2hpRk1NRmlaZktZQ1QwZ3Ria2p3d2tOR3FnQkhtc3Q1RDdxemFZNmIxb2VO?=
 =?utf-8?Q?ciBdX6OGy3M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXp5aCt5eVZQei9QSCtCbG5aaExJeEcvdUJDY01aSWI0VG5POVVsUUxaeVZD?=
 =?utf-8?B?V1hZUDkyQ1lidUtKWWVpZ1JjZTd5RXdiRTRSdlA5dWYyT21RZ1FidHRUZGJz?=
 =?utf-8?B?UzgyS1BnNGczaUFxaDhoL29UKzFmT2JkZnQxQ2g4ZnVlbHdzZi9JNFpBR3ha?=
 =?utf-8?B?aXlpR3ZtY1RTN0RzUTcrT0ErVENwY1FjbDE1M0RCQ2FNeVJtMHlWMlEyYnJC?=
 =?utf-8?B?bHE4d1orNU5pejZJL3FVVGswTEdEVkVxS2RNbjFmM2YybVdWZDB0K3d5WEhO?=
 =?utf-8?B?ZHZWcGtkcEFyVWxCSUFkYW5LS0d5bGNTZVFsdGJDRDhOV3V0WTgxckthNDRV?=
 =?utf-8?B?QXh4dXhmQnNIekg0QkRad2FtcjBhdHIxRkhyVmFtVXRuRmNzSVR5cm9YUHlH?=
 =?utf-8?B?N2x5bWxyWmJJVTNkemh5a01PdFVKOG5OT2hRZkwrWWg4anVVbFRNSmN1UEcv?=
 =?utf-8?B?dzJ5MGI3SVh2MkRCa0dMaG4yWUJmdnF1RUtQRi8zL3NrdXZPR2d4MDJWK1Zh?=
 =?utf-8?B?UFV3dThBSU1QcDZqZThSa2g3aG03TTBDVDZIUkxuRUdOQ1BDbGRwa05FR1ZN?=
 =?utf-8?B?d3JwSjZ4WjhwV2NlYXdOVXJVdzRoeHh5a3dzVzIza3NQc0gvbWJpMzRzOE83?=
 =?utf-8?B?ZjU1SjkyZFJaOHd2c1dxUjlnMjNwWGZGTXVzam41NDVETHp3K0NwbUZnaHZG?=
 =?utf-8?B?eXpEVW9TdVdsSlFTTHBrS1QybW1sSnBMd3ZLZGwzdVFLZ3pLenc5VXpBY0Nw?=
 =?utf-8?B?cjIxQ3dET1Vwbk04ZWZnU2Y2RUY0cHJNYWtNNWo2Nlh0YngyWGZjaGZxcTRi?=
 =?utf-8?B?Z2wwZnZCdmtCZldPcG9xTkxrY3hHUXdaQ2tjY21QNzRBOWI3Snk5N0hGa2Nt?=
 =?utf-8?B?UzJyYjZsOTY5ZTBER01XVkpySndwMFJxWmt6dGR3Rmp0ZTE5R1VoYUNLU0Ev?=
 =?utf-8?B?VThqbnh1b0IrWWhvWlNUTTNJTThGWUMyQ3YyK3JWcUJRSExJR3paTjlkYmpz?=
 =?utf-8?B?OHhzbUFsODJGbU9lbkdHcGVoWTRGSGgxU3RsUTJGVExLRVF4aVRvZ2ZDemRL?=
 =?utf-8?B?N2VGaFNpZ2hzTkd3T2lxaEo5UzEyMkhDN1JoeFZ2WTViaGIwWWFNaVFpOTJp?=
 =?utf-8?B?RE1MMFY3OW1VRGg0Mzl5clFnUWllTldMY2Q1TE1TcWtKMmp5SFRubTNndVJQ?=
 =?utf-8?B?a01XTXhaUXQwWUJmbU1FaDlvbURta3JON01jRzhOSE9VdE5DTHZzblFQMEY2?=
 =?utf-8?B?UWhOWFRKbzQ3WTdURkd0UG5jNE0xa0lnTHFNRDlJUGx6Mk1BOXZJNUZRRjVl?=
 =?utf-8?B?dTAwT1QrRlcwVFRNb04wUkEzOURBUE9RWEZkT3ltQnZiaCtHeUhmYUFVNzVV?=
 =?utf-8?B?WHpUQjVkeE9Ia3E5SEFUb3R2TlFrVmZsbGQ5UUZLOHBIQ3JOMFdlNWZ1Kzkv?=
 =?utf-8?B?TlBrRE81c2xuclNvaHNCbm8wU25mM2M5eEZKOVNsL0s5OXdsbXpBQlpVOVZu?=
 =?utf-8?B?SGIxQTJSNnV5d1VvS3Q4c0RlT2R5dElFcGZTc0svNjlWakZnc213dHNYR1Zh?=
 =?utf-8?B?OG52VkJ4MHRwT1ZOZzNPRXh0dkt6NkovZjhLOXNwc2tqMXR5YlpFZU5ybjVK?=
 =?utf-8?B?ZTlyencyc1oxNmpkQ2RLTFdNV09mRjUzUW5lQW5yTm5TODFXQlMrRnVBTTZU?=
 =?utf-8?B?VEtXVG5IZ1BNd2ZPdkF0QmU1VUdQd29qTEM0NGMvT3JlWDV1bGJncGxaRHBZ?=
 =?utf-8?B?TmgvbjJBVWR2eVF6M1B4L3R0cjZxaG1lSzgzSFhEbE1id1g5bWU5N3laS2VI?=
 =?utf-8?B?UklEMDluOEp5T0hnTEV4YVFCbTh4a1NsOVlXdDdNUFN6bSs5UDdpcXJEZjZH?=
 =?utf-8?B?dDNtSHBTYlVKOWhEU0pUelltR0RyR3NFL0JIYXY2Y0NHL09LTDRibCs1WFNz?=
 =?utf-8?B?cE11cWtxb0F1aWhwSzJDNFJOMnlkcDdZZWc3OEFXZW9HaGZ2ZDQvUHJ5RGo2?=
 =?utf-8?B?K1lZNDUyMld5M3JvTzVFclhDZEd2MjdKN2J5Z1p1SmN0QWIrMHQyRGJjRW1P?=
 =?utf-8?B?cEhCVUdHRTNPSmtTTHVtbWpOQnJ1VjZzbjdMcHZ4ZHE1bjhXcDF4ekV3VE8w?=
 =?utf-8?B?Q0dyYnQreHVZRVJIdFRpYmgwaTUvRGZjYnd0WjNoNXpYcG5RR245S01Ra2tV?=
 =?utf-8?Q?2mbMCb4ZFISoUrnTtpB5HjHEtXEFS5xwto6d+RNQh9oc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca6a5628-8c05-423a-944a-08dd5b2428f5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 13:55:02.1724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k3P2nmZm+dZ1a98Ha/GzW3nCTzWYFw+l2nP74asoZHufV1GoNl334t/8yGNs94OVAg/uwSXnI5ax/NtmQ4tWRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7874
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

Register data manipulation is one of the error-prone areas of a kernel
driver. It is particularly easy to mix addresses of registers, masks and
shifts of fields, and to proceed with invalid values.

This patch introduces the nv_reg!() macro, which creates a safe type
definition for a given register, along with field accessors and
value builder. The macro is designed to type the same field ranges as
the NVIDIA OpenRM project, to facilitate porting its register
definitions to Nova.

Here is for instance the definition of the Boot0 register:

  nv_reg!(Boot0@0x00000000, "Basic revision information about the GPU";
      3:0     minor_rev as (u8), "minor revision of the chip";
      7:4     major_rev as (u8), "major revision of the chip";
      25:20   chipset try_into (Chipset), "chipset model"
  );

This definition creates a Boot0 type that includes read() and write()
methods that will automatically use the correct register offset (0x0 in
this case).

Creating a type for each register lets us leverage the type system to
make sure register values don't get mix up.

It also allows us to create register-specific field extractor methods
(here minor_rev(), major_rev(), and chipset()) that present each field
in a convenient way and validate its data if relevant. The chipset()
accessor, in particular, uses the TryFrom<u32> implementation of Chipset
to build a Chipset instance and returns its associated error type if the
conversion has failed because of an invalid value.

The ending string at the end of each line is optional, and expands to
doc comments for the type itself, or each of the field accessors.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs  |   2 +-
 drivers/gpu/nova-core/regs.rs | 195 ++++++++++++++++++++++++++++++++++--------
 2 files changed, 158 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 7693a5df0dc11f208513dc043d8c99f85c902119..58b97c7f0b2ab1edacada8346b139f6336b68272 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -164,7 +164,7 @@ fn new(bar: &Devres<Bar0>) -> Result<Spec> {
         let boot0 = regs::Boot0::read(&bar);
 
         Ok(Self {
-            chipset: boot0.chipset().try_into()?,
+            chipset: boot0.chipset()?,
             revision: Revision::from_boot0(boot0),
         })
     }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 50aefb150b0b1c9b73f07fca3b7a070885785485..a874cb2fa5bedee258a60e5c3b471f52e5f82469 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -1,55 +1,174 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use core::{fmt::Debug, marker::PhantomData, ops::Deref};
+
 use crate::driver::Bar0;
+use crate::gpu::Chipset;
 
-// TODO
-//
-// Create register definitions via generic macros. See task "Generic register
-// abstraction" in Documentation/gpu/nova/core/todo.rst.
+pub(crate) struct Builder<T>(T, PhantomData<T>);
 
-const BOOT0_OFFSET: usize = 0x00000000;
+impl<T> From<T> for Builder<T> {
+    fn from(value: T) -> Self {
+        Builder(value, PhantomData)
+    }
+}
 
-// 3:0 - chipset minor revision
-const BOOT0_MINOR_REV_SHIFT: u8 = 0;
-const BOOT0_MINOR_REV_MASK: u32 = 0x0000000f;
+impl<T: Default> Default for Builder<T> {
+    fn default() -> Self {
+        Self(Default::default(), PhantomData)
+    }
+}
 
-// 7:4 - chipset major revision
-const BOOT0_MAJOR_REV_SHIFT: u8 = 4;
-const BOOT0_MAJOR_REV_MASK: u32 = 0x000000f0;
+impl<T> Deref for Builder<T> {
+    type Target = T;
 
-// 23:20 - chipset implementation Identifier (depends on architecture)
-const BOOT0_IMPL_SHIFT: u8 = 20;
-const BOOT0_IMPL_MASK: u32 = 0x00f00000;
+    fn deref(&self) -> &Self::Target {
+        &self.0
+    }
+}
 
-// 28:24 - chipset architecture identifier
-const BOOT0_ARCH_MASK: u32 = 0x1f000000;
+macro_rules! nv_reg_common {
+    ($name:ident $(, $type_comment:expr)?) => {
+        $(
+        #[doc=concat!($type_comment)]
+        )?
+        #[derive(Clone, Copy, Default)]
+        pub(crate) struct $name(u32);
 
-// 28:20 - chipset identifier (virtual register field combining BOOT0_IMPL and
-//         BOOT0_ARCH)
-const BOOT0_CHIPSET_SHIFT: u8 = BOOT0_IMPL_SHIFT;
-const BOOT0_CHIPSET_MASK: u32 = BOOT0_IMPL_MASK | BOOT0_ARCH_MASK;
+        // TODO: should we display the raw hex value, then the value of all its fields?
+        impl Debug for $name {
+            fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+                f.debug_tuple(stringify!($name))
+                    .field(&format_args!("0x{0:x}", &self.0))
+                    .finish()
+            }
+        }
 
-#[derive(Copy, Clone)]
-pub(crate) struct Boot0(u32);
+        impl core::ops::BitOr for $name {
+            type Output = Self;
 
-impl Boot0 {
-    #[inline]
-    pub(crate) fn read(bar: &Bar0) -> Self {
-        Self(bar.readl(BOOT0_OFFSET))
-    }
+            fn bitor(self, rhs: Self) -> Self::Output {
+                Self(self.0 | rhs.0)
+            }
+        }
 
-    #[inline]
-    pub(crate) fn chipset(&self) -> u32 {
-        (self.0 & BOOT0_CHIPSET_MASK) >> BOOT0_CHIPSET_SHIFT
-    }
+        #[allow(dead_code)]
+        impl $name {
+            /// Returns a new builder for the register. Individual fields can be set by the methods
+            /// of the builder, and the current value obtained by dereferencing it.
+            #[inline]
+            pub(crate) fn new() -> Builder<Self> {
+                Default::default()
+            }
+        }
+    };
+}
 
-    #[inline]
-    pub(crate) fn minor_rev(&self) -> u8 {
-        ((self.0 & BOOT0_MINOR_REV_MASK) >> BOOT0_MINOR_REV_SHIFT) as u8
-    }
+macro_rules! nv_reg_field_accessor {
+    ($hi:tt:$lo:tt $field:ident $(as ($as_type:ty))? $(as_bit ($bit_type:ty))? $(into ($type:ty))? $(try_into ($try_type:ty))? $(, $comment:expr)?) => {
+        $(
+        #[doc=concat!("Returns the ", $comment)]
+        )?
+        #[inline]
+        pub(crate) fn $field(self) -> $( $as_type )? $( $bit_type )? $( $type )? $( core::result::Result<$try_type, <$try_type as TryFrom<u32>>::Error> )? {
+            const MASK: u32 = ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
+            const SHIFT: u32 = MASK.trailing_zeros();
+            let field = (self.0 & MASK) >> SHIFT;
 
-    #[inline]
-    pub(crate) fn major_rev(&self) -> u8 {
-        ((self.0 & BOOT0_MAJOR_REV_MASK) >> BOOT0_MAJOR_REV_SHIFT) as u8
+            $( field as $as_type )?
+            $(
+            // TODO: it would be nice to throw a compile-time error if $hi != $lo as this means we
+            // are considering more than one bit but returning a bool...
+            (if field != 0 { true } else { false }) as $bit_type
+            )?
+            $( <$type>::from(field) )?
+            $( <$try_type>::try_from(field) )?
+        }
     }
 }
+
+macro_rules! nv_reg_field_builder {
+    ($hi:tt:$lo:tt $field:ident $(as ($as_type:ty))? $(as_bit ($bit_type:ty))? $(into ($type:ty))? $(try_into ($try_type:ty))? $(, $comment:expr)?) => {
+        $(
+        #[doc=concat!("Sets the ", $comment)]
+        )?
+        #[inline]
+        pub(crate) fn $field(mut self, value: $( $as_type)? $( $bit_type )? $( $type )? $( $try_type)? ) -> Self {
+            const MASK: u32 = ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
+            const SHIFT: u32 = MASK.trailing_zeros();
+
+            let value = ((value as u32) << SHIFT) & MASK;
+            self.0.0 = self.0.0 | value;
+            self
+        }
+    };
+}
+
+macro_rules! nv_reg {
+    (
+        $name:ident@$offset:expr $(, $type_comment:expr)?;
+        $($hi:tt:$lo:tt $field:ident $(as ($as_type:ty))? $(as_bit ($bit_type:ty))? $(into ($type:ty))? $(try_into ($try_type:ty))? $(, $field_comment:expr)?);* $(;)?
+    ) => {
+        nv_reg_common!($name);
+
+        #[allow(dead_code)]
+        impl $name {
+            #[inline]
+            pub(crate) fn read(bar: &Bar0) -> Self {
+                Self(bar.readl($offset))
+            }
+
+            #[inline]
+            pub(crate) fn write(self, bar: &Bar0) {
+                bar.writel(self.0, $offset)
+            }
+
+            $(
+            nv_reg_field_accessor!($hi:$lo $field $(as ($as_type))? $(as_bit ($bit_type))? $(into ($type))? $(try_into ($try_type))? $(, $field_comment)?);
+            )*
+        }
+
+        #[allow(dead_code)]
+        impl Builder<$name> {
+            $(
+            nv_reg_field_builder!($hi:$lo $field $(as ($as_type))? $(as_bit ($bit_type))? $(into ($type))? $(try_into ($try_type))? $(, $field_comment)?);
+            )*
+        }
+    };
+    (
+        $name:ident@+$offset:expr $(, $type_comment:expr)?;
+        $($hi:tt:$lo:tt $field:ident $(as ($as_type:ty))? $(as_bit ($bit_type:ty))? $(into ($type:ty))? $(try_into ($try_type:ty))? $(, $field_comment:expr)?);* $(;)?
+    ) => {
+        nv_reg_common!($name);
+
+        #[allow(dead_code)]
+        impl $name {
+            #[inline]
+            pub(crate) fn read(bar: &Bar0, base: usize) -> Self {
+                Self(bar.readl(base + $offset))
+            }
+
+            #[inline]
+            pub(crate) fn write(self, bar: &Bar0, base: usize) {
+                bar.writel(self.0, base + $offset)
+            }
+
+            $(
+            nv_reg_field_accessor!($hi:$lo $field $(as ($as_type))? $(as_bit ($bit_type))? $(into ($type))? $(try_into ($try_type))? $(, $field_comment)?);
+            )*
+        }
+
+        #[allow(dead_code)]
+        impl Builder<$name> {
+            $(
+            nv_reg_field_builder!($hi:$lo $field $(as ($as_type))? $(as_bit ($bit_type))? $(into ($type))? $(try_into ($try_type))? $(, $field_comment)?);
+            )*
+        }
+    };
+}
+
+nv_reg!(Boot0@0x00000000, "Basic revision information about the GPU";
+    3:0     minor_rev as (u8), "minor revision of the chip";
+    7:4     major_rev as (u8), "major revision of the chip";
+    25:20   chipset try_into (Chipset), "chipset model"
+);

-- 
2.48.1

