Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4B7C41FF2
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 00:43:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F9310E1AD;
	Fri,  7 Nov 2025 23:43:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CuFun4K9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010009.outbound.protection.outlook.com [52.101.56.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8E710E12A;
 Fri,  7 Nov 2025 23:43:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IEzRcwN+N6h760++QCbRZIPqM8Fp9d+cCUkm+0zT8LWYP99dk1nF4m5ogXSgFT940hbSln+4NzDDnOSbqHtjJIkZ0DvyQRuvB1KhZG/XG9ZxNt2KZEA8t/SL22pJNGHLIktXYj2XVTjBw+1iMJiqQlDYKfrEPCZrNgH+C1WYhGgcw2kg6Q9oU7XU5u37XCuu0zOyvwUiPGqyRfT7Hqq0HI22eZWW9Vfa//ZAXxmSUDVseeuKo9ykOcQIMrXpOXKbF0NVcLPw0qzJuF2uMr7WZ/RwA5KgS5oZBXrsZheC5zqx/eSRmY0KIyKUH4RV9+PU3FjQJsIyFt0y2aM72V1Vbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jD+xhu1AsLMfvLh5eoe3L1nj02uFVilEHj5Uz5X9Q6M=;
 b=nBqMqNUv8ydujxA6hY8GAowT06lprCuQ/cqYG8VvWpZqGn/E4LpC4O7gUhHasB9zLaAJrl4ZRR7FTXKwmP1bF1k9xJcLBmzZv7V7aIKROUTELD7uD8m6mp3m2iqw2A0YRIqo49QMrMS0KjaHed2R+UIODCU0dTzLh+s5YZGG3X1lmHAjJTb2n9ZjnJAuDdQR0YHDJkkTAXpGf+8+vzcdLPOcvK9YNcxKAm1L/yz7c1tPOWcY4uBLxrRauWMXbzMrlPwbeTxYxAyd9MutA79vq4N6fKL9UoiouIUgD2cgGoNT3JhbkXy4M6Vf2hBWqPm4O49rPlFnurjY2MCcDkZZdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jD+xhu1AsLMfvLh5eoe3L1nj02uFVilEHj5Uz5X9Q6M=;
 b=CuFun4K91x9W09ExlW/VBlMisOZmVpz5tE0fRSik0K2kA3/SgSQ6IhKolp1RQ6NgnTPaA3217JZL/0qCcH61T+ZVlqGr41CPy3IZFf5umwKVo8irLmjG1tfBEMUbN30xZT0I55A49gtAXEcqEWNGUEQax8TiZDyyKglzEA5EMT5l8RQBBHFXO8x+jr5Ck0IcqdWbfUOXCutdlKoDKI56wKI8SCGeX1CK2mD/SZNeNICAXfW76NPGqug24jtSsVZKKO5Q20I/4QljG6O1PH1/J/I9oZfHxeS0oHzFKAKfsAZytnDAVeY+UuBSy1327cN5tlwqjW7OaHOYeL4J+URf1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6642.namprd12.prod.outlook.com (2603:10b6:208:38e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 23:43:22 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 23:43:22 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 08 Nov 2025 08:43:02 +0900
Subject: [PATCH v8 01/16] gpu: nova-core: compute layout of more
 framebuffer regions required for GSP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251108-gsp_boot-v8-1-70b762eedd50@nvidia.com>
References: <20251108-gsp_boot-v8-0-70b762eedd50@nvidia.com>
In-Reply-To: <20251108-gsp_boot-v8-0-70b762eedd50@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP301CA0005.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6642:EE_
X-MS-Office365-Filtering-Correlation-Id: bdbdde75-93a6-4479-c823-08de1e576fbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlhvWTJ6NVN5d09MSFBBRFEzTHY5VVlSVDVPb2RpYk03K3NtT3dySlBSTkhF?=
 =?utf-8?B?ZXFPYXBKMkszaTdCRVRFZ3BNTkErdTBqVjdxQlBDQ1daak91WWM4SVg3cTho?=
 =?utf-8?B?Z2hRQlI1ZFVyME9xUVk0R3BtaHpmM0Y3bXBlUkgvNWFNSkhVNktId3U0NnlX?=
 =?utf-8?B?MUE5Nmw1STgzbHlzYmQranc4cm4xdVFUN2VzSnV5QTlPbW0rTXJ0T1ZST1J0?=
 =?utf-8?B?QXpuUVpveWVRaXBsemY1OTd3TklGWGtWc3AxNVJhNlJkNnhYSDEvVHZ0eitq?=
 =?utf-8?B?b2RiamZQK0JRUlJRU3cxeElGcmxTek5tQVkyNFRuT0FXM0VCZ2xZVUp1QWg1?=
 =?utf-8?B?eE1wR1BZazc3eCttWkJFVzcvazF0SFhxWk5iTkxrUVd2ZU01STNOWVM1MEZt?=
 =?utf-8?B?bzg5QTlmSnVaMjVieVBjWGZWSkJ1Rm5QeTlOcnB6V2RzVlFqUUdJUm5oR3NT?=
 =?utf-8?B?emRPR2wwTVh1RG9KeTRRbGpZbWxRM3dDNjhZYXJwQWp0SGsxejd5WFliTXZJ?=
 =?utf-8?B?cXM5K09VSHVGVm9rZGw3Q0d5Z1hhUTQ3bW9DRXVPemNMV3JGaXRJUU9lR1l3?=
 =?utf-8?B?OFdTYVE0NG81Szc0bVovMVVkbk1NYkNyYlBQZzNWY0JRUFpuVE9CcGNrOXdD?=
 =?utf-8?B?akhmVVBGeERWRnhvSExRc0pRTGgwRXo0QW5GTDZ3eDJwaTdJQk85ck42Uk9y?=
 =?utf-8?B?MWNTZEJ6bVlLUEJUUlNYblpqNjZtUWloTGZUWFN0S2gzMzVHTlRhOEhXUGE3?=
 =?utf-8?B?NFFzRFlCSzc0WUNYMERkTHZjdFZRTmhERE41VE9ZTk5hMldHRjhVTmxUNUh2?=
 =?utf-8?B?emM5eXpPalo3N1YrK3Q4eDc2QVNqWm1vUHZ1dWJBN1BrUEQyNWhwVExJMjZK?=
 =?utf-8?B?Rm84dlV3YjBpK1Y3bUpyZ0hhWkdZcVl1ejJyZ1YvdThCN1JLY0sxSHhEdmIy?=
 =?utf-8?B?S2pWaFhER3NHVU5ONDZxdnlWbjZRNFJkQnlvR1RMcjZqbStXVmI3SHlvZjgv?=
 =?utf-8?B?VWhEdHpZZ2lSei9lRjNueENLZ0gwbnBjZGhERHdlZ05NR0phV3VLaVd1MlFr?=
 =?utf-8?B?Zm5hRHdpVXVHcHl4MmowV0hHRk1UbUFmN2FMU3EvM05DL0ZvaTRLUTR4d1pE?=
 =?utf-8?B?OTcyYUdnM0tTQXNtZTJWb0xhRFlZVE40UVJjTGdsUHBJdEVHVzMrekZHTkt4?=
 =?utf-8?B?VHBDOTFXZXRqc2tFajhqQnBYWjVQTlpFemFQTVdjQWhoYVpaOFZvdTY3RUdy?=
 =?utf-8?B?NjJVS21oa0U2WlI4UndPbVlEejhLWnYxWHN4Q25OemY2bE51VCtsbitRejhx?=
 =?utf-8?B?M05mS1JkMW9uRkErVzJsRlJYVllLQVlXb2MwUlZJb0NhMXBMTzFmTnhYcnAz?=
 =?utf-8?B?bjc1QWltRWhIMmh6THREeUFYSFo5VjZUY0tzcjZvajdQYjR4RXJwdGNyVFQv?=
 =?utf-8?B?MkhXU2RNRGJ3ekZGaTdURnJNc1g5MHUwNDZkVjMrbjdtVGcwdXVidm5iZkhu?=
 =?utf-8?B?aWI5aU9wL0gvSlBCRXoxRmNIdnY4SlFrYjR2STJiRTIvbStPS0dBMWZhajhJ?=
 =?utf-8?B?Ujg2TXc3S0FvZ0tNTmQxUjJvdnpjRE0zbzNoZFQvRDcrNGJhUkxVYzRjOWFi?=
 =?utf-8?B?aWcxL00weHMwdjhLbkJMdVNYcFV3dUVoNEJrR3FpRTFhSWJLNkthdnRBc044?=
 =?utf-8?B?ZTJIb0h6eHJRc21oOEtaMzYwWXZSRWIydm9KWFM3SG9yS0xUMlZnY3pseTg2?=
 =?utf-8?B?WDZoUGplaEFOSUtyWmlWK05hNUxVSm4zVTZBOStDa2ljaDc5ZXBrQkw3ZDQv?=
 =?utf-8?B?T2Y5cEtTUUs1OTlrZVc0RVBEVWxPSGtKSnBCVlkrdCtHRmgvZ0xzNXZlUEJl?=
 =?utf-8?B?UWlFOGZHa0YwVmZ6dDFpcUlrQUdxVlg5SEhlOVpNRnNheVNMdlN4ZENiYTRi?=
 =?utf-8?B?aWFsODlOdWFNNWpFUTlHRnpGWmtMbDh3cG1ZdW8wSXVzU0FrUU9PYnFwbkFP?=
 =?utf-8?Q?ZoXicJKPkWXQ9Wsbe9vj8CvFmJCQzk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWhZZGhnSmdRMHh3SitjSy9WYm1NWjFxdk5GN1NnT1FwR0lwbGJsVGMxSUxT?=
 =?utf-8?B?d29jTm9NakdZT3JCaVdyejA3UDg2RGM1KzFyWnM1a29yVWZRMnFQRFYvanFR?=
 =?utf-8?B?bHYzbmZhQXQ0bEc4VkxpRkFZQmkvU1VqT1NkSng5WFpSSFVvOEJUUkJ6OE0y?=
 =?utf-8?B?akF5MkoyTzFlbXlhd1JUMmtXdWVLbEFWQ0ZTcSs1aDAwZ0trV21YNFZ3cXNo?=
 =?utf-8?B?RjlqMGVxWjBreS9oK0RXM2RQYm8wT1R0eks4dlZ4cXBxVi9iT04xb2tuazgx?=
 =?utf-8?B?cnd4QUFTRnBJbU9zV2tOaW5yaXBIVWtkRWxsQXUxNGpvMGpXMGwzbS8zQmVX?=
 =?utf-8?B?b0hBU0ZhMmgyYnBzUWpxMUZ6K2ZYcjI0dEdiMVFhV2Fnb0NvQVFXOVU1Qkwx?=
 =?utf-8?B?WUVhSGtkamRCbi8zYjh3TldiR25xSW8zUy8wbmJZSkFjaGxaVzB1Q1dXNmMx?=
 =?utf-8?B?enhHSjV6RzRTSVY0UXdSVTZzMzY4S1o0QlZENmxxK2NjQWZ3NVZnT2hNQ0pI?=
 =?utf-8?B?N0RXd25wTUpibW1RVTZmOFlxQ2VaY0tWRE1EYVZoUEtaUG9OSHJMazhnS0tx?=
 =?utf-8?B?MWxKVXJld2owNElCbDhhMk45NG5zci9HUm9HMm1nKy84QTdCTXBnY2loaG1U?=
 =?utf-8?B?NGNxZkpkRlVRM2w5Q2pQcWpramRPZ0R6NlBIbi92emU3djU1VFhQbng5azFq?=
 =?utf-8?B?U1kzS1kxWHZUNFdPRkpNY1RoYXprZ25tQ2JXRjFua2haaDRLOWE5WHE5amps?=
 =?utf-8?B?a1duOHN5QWlyb09FU2ZFdGR5ck1GSDIwSXVTOXNEZmpjWm5yMUF5ZFpxTkZ5?=
 =?utf-8?B?bjk2cmFTSjYwcUFSa1JxOEloRXhCeWQ1REJSWG1PUnY3T3ZZWlh0TWpuSG9I?=
 =?utf-8?B?OWNXRGhVNFl5NE9KOC9mNzcvVzBWampibnlEUmZkOEhRcitFOU1xazRNVTZp?=
 =?utf-8?B?ek9MQk1HWTB3bEZZbm9uZGN5WWtpZkhMZ2gyWTJkTVEweXY1aHo5UG02aFRE?=
 =?utf-8?B?UWxOZjU0R2V4ckNqTXdxRUtwRHkyK2lRc0UreWRhM2V0NHBwSTlNS0tlWFVp?=
 =?utf-8?B?L014ZGZsNXg1NTVKYWFJaGhRQUFKSmVHaWUxNG1DcUpzbjdXRGpEMDY4cHdF?=
 =?utf-8?B?MENZUGw3aHY5b2VpemRsNVoyOTRsalhzOExyS3NRTkFuR1Mxd1BYKzdiZCtr?=
 =?utf-8?B?QlVFWEhWWkljWW9HVmRiU0dBc0MzSGppdmIycTB4amRndmVFRGxNMFpHWVpj?=
 =?utf-8?B?UnFWRENnd2JGcTEwSnVxS3NmN3k4NXJuWmtSaTZIWVN5YXVyZnBZdysreDVm?=
 =?utf-8?B?TThNZS9KbjdnalNtN2YxRjFGZURWZElzbG1xMjRCUVR2Q2NRZnhDbXU3Mmt0?=
 =?utf-8?B?VjBkQnVVU0RWT3ZuOWNzVWpkdUxOWnJhdnFvdFhHRFphNjYyWHgrNGZwekFo?=
 =?utf-8?B?S0VhMjNjNHlaeERhcUpiNit4am5lOTdWY3BCc21tSnhSUXE2eGtLQlVoZ2tE?=
 =?utf-8?B?eGxQQ2Vycm9kSFQwdXlId201NDhNMlgrRmhIV2tTanZIVkF3NTYxNkRwTWxM?=
 =?utf-8?B?bGQ3OUQwSU5pY2FxbmppYjQyaGM5ZkdkWUZhY2E2RWpTT2pUYXhCSStPeGxu?=
 =?utf-8?B?eGRFUjR4K1pSbFRic1FTajN1VEY5VmxwendnamdoQytZTW1aRzdmcWs1dHF5?=
 =?utf-8?B?RjlVeXl5OFJ4RlkwOTRhUDAvVlFNRTVqR1RhTy9menpxdzd4WmRNS2RvL2xv?=
 =?utf-8?B?U256UnBuOVFjaElQNnZGUE96cExTVFVCVDF6VzJIbjAxM3UveTgxUnRFYkNM?=
 =?utf-8?B?dllRa2tHaERsSjNad08zY1Q2VTFKb2ZMRGUrSkw1ekNEOUhRaFduYUFqTnNa?=
 =?utf-8?B?THJuRU5zYnpYVDZHU0M4dkNxU0xoQ1hEWEZXMUVPSHZ1Q3BTMi82VVFHWHE5?=
 =?utf-8?B?WVVvWE9lcXFuME9TTWIwWC9oS1dBbkRSNjBlWlpSaGtCMGo3VW15elJiYkly?=
 =?utf-8?B?T3I2Nkg1NkcvTW55emNtM3FUcWc0RUNoekErK2g5ZFc2eVpiQTZ4TVFRb2lP?=
 =?utf-8?B?TjJPNUhYMUFhL2dXQVQxUytFK2twWCs4N3o2NFBBdTk1bm12MUxsV2FsWVpV?=
 =?utf-8?B?STFJM1RaZGlHd0dCQThyZEltQ25WaXFacG5nenNsWVl2TFVWemFrd1pNblFK?=
 =?utf-8?Q?fZH94K2FrjvCX1PkPoj2TApcAj07g+4XsQ00YLEyX5Sv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdbdde75-93a6-4479-c823-08de1e576fbf
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 23:43:22.0628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n05/9wlR3Hm0q7SSxrclPz6nsd9QIMoz37/JXEflBqDLjoNfolGmXzvJyS5y8dAweQ242otFaG18CZ4LleLd5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6642
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

Compute more of the required FB layout information to boot the GSP
firmware.

This information is dependent on the firmware itself, so first we need
to import and abstract the required firmware bindings in the `nvfw`
module.

Then, a new FB HAL method is introduced in `fb::hal` that uses these
bindings and hardware information to compute the correct layout
information.

This information is then used in `fb` and the result made visible in
`FbLayout`.

These 3 things are grouped into the same patch to avoid lots of unused
warnings that would be tedious to work around. As they happen in
different files, they should not be too difficult to track separately.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs                       |  71 +++++++++++-
 drivers/gpu/nova-core/firmware/gsp.rs             |   4 +-
 drivers/gpu/nova-core/firmware/riscv.rs           |   2 +-
 drivers/gpu/nova-core/gsp.rs                      |   2 +
 drivers/gpu/nova-core/gsp/boot.rs                 |   4 +-
 drivers/gpu/nova-core/gsp/fw.rs                   | 113 ++++++++++++++++++-
 drivers/gpu/nova-core/gsp/fw/r570_144.rs          |   1 -
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 125 ++++++++++++++++++++++
 8 files changed, 311 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index a99223f73367..156d9bf1f191 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -16,9 +16,14 @@
 use crate::{
     dma::DmaObject,
     driver::Bar0,
+    firmware::gsp::GspFirmware,
     gpu::Chipset,
-    num::usize_as_u64,
-    regs, //
+    gsp,
+    num::{
+        usize_as_u64,
+        FromSafeCast, //
+    },
+    regs,
 };
 
 mod hal;
@@ -95,14 +100,27 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
 #[derive(Debug)]
 #[expect(dead_code)]
 pub(crate) struct FbLayout {
+    /// Range of the framebuffer. Starts at `0`.
     pub(crate) fb: Range<u64>,
+    /// VGA workspace, small area of reserved memory at the end of the framebuffer.
     pub(crate) vga_workspace: Range<u64>,
+    /// FRTS range.
     pub(crate) frts: Range<u64>,
+    /// Memory area containing the GSP bootloader image.
+    pub(crate) boot: Range<u64>,
+    /// Memory area containing the GSP firmware image.
+    pub(crate) elf: Range<u64>,
+    /// WPR2 heap.
+    pub(crate) wpr2_heap: Range<u64>,
+    /// WPR2 region range, starting with an instance of `GspFwWprMeta`.
+    pub(crate) wpr2: Range<u64>,
+    pub(crate) heap: Range<u64>,
+    pub(crate) vf_partition_count: u8,
 }
 
 impl FbLayout {
-    /// Computes the FB layout.
-    pub(crate) fn new(chipset: Chipset, bar: &Bar0) -> Result<Self> {
+    /// Computes the FB layout for `chipset` required to run the `gsp_fw` GSP firmware.
+    pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<Self> {
         let hal = hal::fb_hal(chipset);
 
         let fb = {
@@ -146,10 +164,55 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0) -> Result<Self> {
             frts_base..frts_base + FRTS_SIZE
         };
 
+        let boot = {
+            const BOOTLOADER_DOWN_ALIGN: Alignment = Alignment::new::<SZ_4K>();
+            let bootloader_size = u64::from_safe_cast(gsp_fw.bootloader.ucode.size());
+            let bootloader_base = (frts.start - bootloader_size).align_down(BOOTLOADER_DOWN_ALIGN);
+
+            bootloader_base..bootloader_base + bootloader_size
+        };
+
+        let elf = {
+            const ELF_DOWN_ALIGN: Alignment = Alignment::new::<SZ_64K>();
+            let elf_size = u64::from_safe_cast(gsp_fw.size);
+            let elf_addr = (boot.start - elf_size).align_down(ELF_DOWN_ALIGN);
+
+            elf_addr..elf_addr + elf_size
+        };
+
+        let wpr2_heap = {
+            const WPR2_HEAP_DOWN_ALIGN: Alignment = Alignment::new::<SZ_1M>();
+            let wpr2_heap_size =
+                gsp::LibosParams::from_chipset(chipset).wpr_heap_size(chipset, fb.end);
+            let wpr2_heap_addr = (elf.start - wpr2_heap_size).align_down(WPR2_HEAP_DOWN_ALIGN);
+
+            wpr2_heap_addr..(elf.start).align_down(WPR2_HEAP_DOWN_ALIGN)
+        };
+
+        let wpr2 = {
+            const WPR2_DOWN_ALIGN: Alignment = Alignment::new::<SZ_1M>();
+            let wpr2_addr = (wpr2_heap.start - u64::from_safe_cast(size_of::<gsp::GspFwWprMeta>()))
+                .align_down(WPR2_DOWN_ALIGN);
+
+            wpr2_addr..frts.end
+        };
+
+        let heap = {
+            const HEAP_SIZE: u64 = usize_as_u64(SZ_1M);
+
+            wpr2.start - HEAP_SIZE..wpr2.start
+        };
+
         Ok(Self {
             fb,
             vga_workspace,
             frts,
+            boot,
+            elf,
+            wpr2_heap,
+            wpr2,
+            heap,
+            vf_partition_count: 0,
         })
     }
 }
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 72766feae36e..471ace238f62 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -143,11 +143,11 @@ pub(crate) struct GspFirmware {
     /// Level 0 page table (single 4KB page) with one entry: DMA address of first level 1 page.
     level0: DmaObject,
     /// Size in bytes of the firmware contained in [`Self::fw`].
-    size: usize,
+    pub(crate) size: usize,
     /// Device-mapped GSP signatures matching the GPU's [`Chipset`].
     signatures: DmaObject,
     /// GSP bootloader, verifies the GSP firmware before loading and running it.
-    bootloader: RiscvFirmware,
+    pub(crate) bootloader: RiscvFirmware,
 }
 
 impl GspFirmware {
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index 270b2c7dc219..3838fab8f1c0 100644
--- a/drivers/gpu/nova-core/firmware/riscv.rs
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -68,7 +68,7 @@ pub(crate) struct RiscvFirmware {
     /// Application version.
     app_version: u32,
     /// Device-mapped firmware image.
-    ucode: DmaObject,
+    pub(crate) ucode: DmaObject,
 }
 
 impl RiscvFirmware {
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 64e472e7a9d3..aa2a9e6654e4 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -6,6 +6,8 @@
 
 mod fw;
 
+pub(crate) use fw::{GspFwWprMeta, LibosParams};
+
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
 pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
 
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 19dddff929da..979d3391e58c 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -127,12 +127,12 @@ pub(crate) fn boot(
 
         let bios = Vbios::new(dev, bar)?;
 
-        let _gsp_fw = KBox::pin_init(
+        let gsp_fw = KBox::pin_init(
             GspFirmware::new(dev, chipset, FIRMWARE_VERSION)?,
             GFP_KERNEL,
         )?;
 
-        let fb_layout = FbLayout::new(chipset, bar)?;
+        let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
         Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 34226dd00982..436c00d07b16 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -3,5 +3,116 @@
 mod r570_144;
 
 // Alias to avoid repeating the version number with every use.
-#[expect(unused)]
 use r570_144 as bindings;
+
+use core::ops::Range;
+
+use kernel::{
+    ptr::{
+        Alignable,
+        Alignment, //
+    },
+    sizes::SZ_1M,
+};
+
+use crate::{
+    gpu::Chipset,
+    num::{
+        self,
+        FromSafeCast, //
+    },
+};
+
+/// Empty type to group methods related to heap parameters for running the GSP firmware.
+enum GspFwHeapParams {}
+
+/// Minimum required alignment for the GSP heap.
+const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new::<{ 1 << 20 }>();
+
+impl GspFwHeapParams {
+    /// Returns the amount of GSP-RM heap memory used during GSP-RM boot and initialization (up to
+    /// and including the first client subdevice allocation).
+    fn base_rm_size(_chipset: Chipset) -> u64 {
+        // TODO: this needs to be updated to return the correct value for Hopper+ once support for
+        // them is added:
+        // u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100)
+        u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X)
+    }
+
+    /// Returns the amount of heap memory required to support a single channel allocation.
+    fn client_alloc_size() -> u64 {
+        u64::from(bindings::GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE)
+            .align_up(GSP_HEAP_ALIGNMENT)
+            .unwrap_or(u64::MAX)
+    }
+
+    /// Returns the amount of memory to reserve for management purposes for a framebuffer of size
+    /// `fb_size`.
+    fn management_overhead(fb_size: u64) -> u64 {
+        let fb_size_gb = fb_size.div_ceil(u64::from_safe_cast(kernel::sizes::SZ_1G));
+
+        u64::from(bindings::GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB)
+            .saturating_mul(fb_size_gb)
+            .align_up(GSP_HEAP_ALIGNMENT)
+            .unwrap_or(u64::MAX)
+    }
+}
+
+/// Heap memory requirements and constraints for a given version of the GSP LIBOS.
+pub(crate) struct LibosParams {
+    /// The base amount of heap required by the GSP operating system, in bytes.
+    carveout_size: u64,
+    /// The minimum and maximum sizes allowed for the GSP FW heap, in bytes.
+    allowed_heap_size: Range<u64>,
+}
+
+impl LibosParams {
+    /// Version 2 of the GSP LIBOS (Turing and GA100)
+    const LIBOS2: LibosParams = LibosParams {
+        carveout_size: num::u32_as_u64(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2),
+        allowed_heap_size: num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB)
+            * num::usize_as_u64(SZ_1M)
+            ..num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB)
+                * num::usize_as_u64(SZ_1M),
+    };
+
+    /// Version 3 of the GSP LIBOS (GA102+)
+    const LIBOS3: LibosParams = LibosParams {
+        carveout_size: num::u32_as_u64(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL),
+        allowed_heap_size: num::u32_as_u64(
+            bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB,
+        ) * num::usize_as_u64(SZ_1M)
+            ..num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB)
+                * num::usize_as_u64(SZ_1M),
+    };
+
+    /// Returns the libos parameters corresponding to `chipset`.
+    pub(crate) fn from_chipset(chipset: Chipset) -> &'static LibosParams {
+        if chipset < Chipset::GA102 {
+            &Self::LIBOS2
+        } else {
+            &Self::LIBOS3
+        }
+    }
+
+    /// Returns the amount of memory (in bytes) to allocate for the WPR heap for a framebuffer size
+    /// of `fb_size` (in bytes) for `chipset`.
+    pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> u64 {
+        // The WPR heap will contain the following:
+        // LIBOS carveout,
+        self.carveout_size
+            // RM boot working memory,
+            .saturating_add(GspFwHeapParams::base_rm_size(chipset))
+            // One RM client,
+            .saturating_add(GspFwHeapParams::client_alloc_size())
+            // Overhead for memory management.
+            .saturating_add(GspFwHeapParams::management_overhead(fb_size))
+            // Clamp to the supported heap sizes.
+            .clamp(self.allowed_heap_size.start, self.allowed_heap_size.end - 1)
+    }
+}
+
+/// Structure passed to the GSP bootloader, containing the framebuffer layout as well as the DMA
+/// addresses of the GSP bootloader and firmware.
+#[repr(transparent)]
+pub(crate) struct GspFwWprMeta(bindings::GspFwWprMeta);
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144.rs b/drivers/gpu/nova-core/gsp/fw/r570_144.rs
index 35cb0370a7c9..82a973cd99c3 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144.rs
@@ -12,7 +12,6 @@
 #![cfg_attr(test, allow(unsafe_op_in_unsafe_fn))]
 #![allow(
     dead_code,
-    unused_imports,
     clippy::all,
     clippy::undocumented_unsafe_blocks,
     clippy::ptr_as_ptr,
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index cec594032515..0407000cca22 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -1 +1,126 @@
 // SPDX-License-Identifier: GPL-2.0
+
+pub const GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2: u32 = 0;
+pub const GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL: u32 = 23068672;
+pub const GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X: u32 = 8388608;
+pub const GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB: u32 = 98304;
+pub const GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE: u32 = 100663296;
+pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB: u32 = 64;
+pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB: u32 = 256;
+pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB: u32 = 88;
+pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB: u32 = 280;
+pub type __u8 = ffi::c_uchar;
+pub type __u16 = ffi::c_ushort;
+pub type __u32 = ffi::c_uint;
+pub type __u64 = ffi::c_ulonglong;
+pub type u8_ = __u8;
+pub type u16_ = __u16;
+pub type u32_ = __u32;
+pub type u64_ = __u64;
+#[repr(C)]
+#[derive(Copy, Clone)]
+pub struct GspFwWprMeta {
+    pub magic: u64_,
+    pub revision: u64_,
+    pub sysmemAddrOfRadix3Elf: u64_,
+    pub sizeOfRadix3Elf: u64_,
+    pub sysmemAddrOfBootloader: u64_,
+    pub sizeOfBootloader: u64_,
+    pub bootloaderCodeOffset: u64_,
+    pub bootloaderDataOffset: u64_,
+    pub bootloaderManifestOffset: u64_,
+    pub __bindgen_anon_1: GspFwWprMeta__bindgen_ty_1,
+    pub gspFwRsvdStart: u64_,
+    pub nonWprHeapOffset: u64_,
+    pub nonWprHeapSize: u64_,
+    pub gspFwWprStart: u64_,
+    pub gspFwHeapOffset: u64_,
+    pub gspFwHeapSize: u64_,
+    pub gspFwOffset: u64_,
+    pub bootBinOffset: u64_,
+    pub frtsOffset: u64_,
+    pub frtsSize: u64_,
+    pub gspFwWprEnd: u64_,
+    pub fbSize: u64_,
+    pub vgaWorkspaceOffset: u64_,
+    pub vgaWorkspaceSize: u64_,
+    pub bootCount: u64_,
+    pub __bindgen_anon_2: GspFwWprMeta__bindgen_ty_2,
+    pub gspFwHeapVfPartitionCount: u8_,
+    pub flags: u8_,
+    pub padding: [u8_; 2usize],
+    pub pmuReservedSize: u32_,
+    pub verified: u64_,
+}
+#[repr(C)]
+#[derive(Copy, Clone)]
+pub union GspFwWprMeta__bindgen_ty_1 {
+    pub __bindgen_anon_1: GspFwWprMeta__bindgen_ty_1__bindgen_ty_1,
+    pub __bindgen_anon_2: GspFwWprMeta__bindgen_ty_1__bindgen_ty_2,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GspFwWprMeta__bindgen_ty_1__bindgen_ty_1 {
+    pub sysmemAddrOfSignature: u64_,
+    pub sizeOfSignature: u64_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GspFwWprMeta__bindgen_ty_1__bindgen_ty_2 {
+    pub gspFwHeapFreeListWprOffset: u32_,
+    pub unused0: u32_,
+    pub unused1: u64_,
+}
+impl Default for GspFwWprMeta__bindgen_ty_1 {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+#[repr(C)]
+#[derive(Copy, Clone)]
+pub union GspFwWprMeta__bindgen_ty_2 {
+    pub __bindgen_anon_1: GspFwWprMeta__bindgen_ty_2__bindgen_ty_1,
+    pub __bindgen_anon_2: GspFwWprMeta__bindgen_ty_2__bindgen_ty_2,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GspFwWprMeta__bindgen_ty_2__bindgen_ty_1 {
+    pub partitionRpcAddr: u64_,
+    pub partitionRpcRequestOffset: u16_,
+    pub partitionRpcReplyOffset: u16_,
+    pub elfCodeOffset: u32_,
+    pub elfDataOffset: u32_,
+    pub elfCodeSize: u32_,
+    pub elfDataSize: u32_,
+    pub lsUcodeVersion: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GspFwWprMeta__bindgen_ty_2__bindgen_ty_2 {
+    pub partitionRpcPadding: [u32_; 4usize],
+    pub sysmemAddrOfCrashReportQueue: u64_,
+    pub sizeOfCrashReportQueue: u32_,
+    pub lsUcodeVersionPadding: [u32_; 1usize],
+}
+impl Default for GspFwWprMeta__bindgen_ty_2 {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+impl Default for GspFwWprMeta {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}

-- 
2.51.2

