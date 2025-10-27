Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7129C0DB56
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 13:55:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4312010E480;
	Mon, 27 Oct 2025 12:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PmUAkkCD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013059.outbound.protection.outlook.com
 [40.93.196.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67FA010E477;
 Mon, 27 Oct 2025 12:55:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MT6sheelP6d1P9ycz7gXYfg6BZUWUCCrIA4nEe5x14uuJFOlyevzWfvKN6r8HRTvR1ko1yedUJnZy9ZOg7WzfzDOdVbQjBPv0W+5gaZfj2SgGliIySK9RdZQc0/9QoO6zR+K6VbOdp1ybznzgykm8Pbcp4a/U3WCg0yE3/NfuPe27KlvyKxMQMg0MmC6QwYpu3gU6xfN9bzMOz+kM1/dHfXxZ//4fOipU3FCdAjMf38Z6Gn8uyPzrrAJKQOK2HvuKuO46ROBD8pWV5/WsRFfvN9kP66g9aXwOcbRwawW7IF64D7MqHm8XKAoZwy2iW/nSmLGxTAzgmQjMIWnNPGzaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjqFs444tv3AYVJw7werj3Jkg4M0YLjBvmfrVFIwAnc=;
 b=hsJFjvNDeinFjPLEgrAyaLa7WhBs8WGHIIj36NXsMaqVViTe2M9xFKM7dr5dM+2UrbnqOjaFmU8DnNvX4cWz703uhMPSMFhvf7bNp40nFGxgXt3G03zDMKJiRk62uL9V/G8fdFX4Tk0GKn6HhnJyvN45mXui8TdPXWyshINTSr2Su71bOOm6J02JlkqSecDV+KYEbrD0vWwcY0IwcZOkxNPHfXJUxvW4fY+NnUfBXxRf35smLFzupZU7CV36m+4wZmTeW3a10VNy+Aymfuwt24VrX6pQdBCwXyMvd6fTUkEbVLzEuyUwJPz12sIs7TFH0F5ovy3QGy5ULZeQ7MxIag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjqFs444tv3AYVJw7werj3Jkg4M0YLjBvmfrVFIwAnc=;
 b=PmUAkkCDqSv8w/ddEDK1g0zCdgy6EupOpW5dNDmoIgKhqlt8UYfYnGsGNpYwUXM2CmBOSLmtuoP+Ag+uU8rEWzWs5Hy3nl+Zx3YSCVYePWgKtO8NwTZmfQoOoudMMggs2WbhH5RG9ZNj8FwGkB6o/sVBPo/eyiM0rHDMKuhZbqFBIJoIMW232/W3tpYfYI5Y0BNROyi5R1pvlce488QMoFu3Mk6uvTlJ88u1CwwXRB+MjAPeHU6jVhtcqBLketx8VuTGygfRZAmfq+KSh+U9W9p4uyH4FmLbL2RS5rAqrmtvNMfnr2q/ewREWcjDX247mDaO6JGCx7vF57LmFHpHYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB5863.namprd12.prod.outlook.com (2603:10b6:8:7a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 12:55:01 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 12:55:01 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 27 Oct 2025 21:54:44 +0900
Subject: [PATCH v2 4/7] gpu: nova-core: use `try_from` instead of `as` for
 u32 conversions
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-nova-as-v2-4-a26bd1d067a4@nvidia.com>
References: <20251027-nova-as-v2-0-a26bd1d067a4@nvidia.com>
In-Reply-To: <20251027-nova-as-v2-0-a26bd1d067a4@nvidia.com>
To: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P286CA0075.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36d::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a8af99a-79bb-45c6-8edc-08de15580aa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|10070799003|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djcrUUxmN1BQcER1QndLRUx4THFiYnh3cmtiNHBEME5WK0h2OG1NYTNiZVdk?=
 =?utf-8?B?MGh4elp3WW1SVVB1Q1FpdE94ZzBaTDFPMkIzemp1cUZHeldEdldCL2w0UUh2?=
 =?utf-8?B?UUlxb0xXbkJHV2FHV0lTcEU2clJpcUVUQnRpSHYwdEVnSkpmdkNKR3prZW5z?=
 =?utf-8?B?OWhKZDFLc3NhemZoTnFWeUR3V0owQ1hlS2RJN1ZWZExuUlBIWEthZEo0dGR5?=
 =?utf-8?B?N1pBRU9LaEpFRE5SeUJWaUVXckFZYmx5ME5YOXdKNnB5UnlPcVZ3TzNoVldi?=
 =?utf-8?B?T3lTbzA5V2sxRVZLdkxFZDVVdmY5MGN6Y2Q1bVpMUUc1NElJY2JnTzg4bExk?=
 =?utf-8?B?TTJzQVYvdlhPUkswbS94SWpJVytBamZ5TWdVYnN4dUdoR3hKUkZoRHJWVUxF?=
 =?utf-8?B?SFkrejJCREZIM0tDQTZFVTRRZmd4RHdycEhhVnMxYk42cVJrUmdlM0tYL0ly?=
 =?utf-8?B?TmpzUFZJUVJPMkFNdUVMeGUrZno1cnpMOURvVWl2OGRUWnFvdlN0a0JqWFJ3?=
 =?utf-8?B?YjdzR2RNbGpGTk4wSmZ2NEJUS0lJcURFSDhsVWRPK290b2x4ZXRadzAxVVRi?=
 =?utf-8?B?LzBnK1NVZFRPMjVLS05LNk5nb0FaSVk0K0EwZE5WM1YvK291aHhoV3dQZlQ5?=
 =?utf-8?B?VXZ6a09WVVZBSExVN1FhditUdWMxN2Z0NnZDNURRTlRIQTB0ODVIRWhmRWdJ?=
 =?utf-8?B?QTliVTlQaCtZaWw1MzVjSW1seldOSCtwRmZZTHJlQlBJRnlUUG9WOEhnQVVG?=
 =?utf-8?B?cW1YSlB5Tjl4YWM1MHpKYVc0VVVvZEdBQ3lOYkxXNWp6dVF4RlRBdVNLMGZm?=
 =?utf-8?B?OU5jWEtlSUdodXNQdUIxSVRRY1I1VkpTOE9yVG1nZitvY3l3SkJZRjA3a0t1?=
 =?utf-8?B?MS9TcjJETXhWblc5YWFXWm4wRWVNTVJvYWNwdHc5UDdIRVE5Z1ZxK2NaaWk2?=
 =?utf-8?B?YW5zKzU4VFhkVHVOME9sNDZoeFBoR3RKY0ZVUWk4UmZ1YkFYTXQ2c2IwRlhj?=
 =?utf-8?B?M2REK0ZUVFprVGhRZmcvVmNobjUzT2M2WGgwWWZ5dHhoZkxOV3ZFOGc0Z2Jz?=
 =?utf-8?B?WS9QZFNueTNwR0ZNUHdaVmZqUnRnZnlxRWh2M2U3NkxEd1NXUHdVZDBzMkh1?=
 =?utf-8?B?QnE3blVnMXM3TzlVUmZmSjZRRmtYZmxIZ2JzQ2tFUlZiMmZCcy9kdld6VWFk?=
 =?utf-8?B?TGZMUjFJQ2dKWFhsTHplWUpLYXY1a1NFNHY0OHE1SUY3NTYwMlZ3c1IyRC9p?=
 =?utf-8?B?OEcvYUJ5V3dZSFROWkJvM1FnZHQ0S0hwU2NHNzY3dmJlSk1ibGhVSnpJeFZN?=
 =?utf-8?B?alRGZW1qWFovVm01U3JXQlBjdXJUZ3pxM2pBeVB0TGJVK3FWMmVzdEx5RGZJ?=
 =?utf-8?B?V1pXNUs4WFh3RFgvOGMzdFJ2L3F0ZWQxWW9yWnJ3TmgrZE04aTdiREFxTGJX?=
 =?utf-8?B?bEM0MGI5YXpYRml3SThkaWxTOTNLdnJLNFRCMEVZQVlLWmFsb0F2M0tqSDZH?=
 =?utf-8?B?QWFPVnU3NzA5OXArTWNiUkozUlNQY0hjUkJaWDV6TWwxWittN2hOUS9SWmh1?=
 =?utf-8?B?YUVDdnVxSUdMVUJDc0FlRUxSblcyOCs4UkZ1RHJOekQ1L2xpSmtLSnlvZ1pt?=
 =?utf-8?B?KzBkQnNsRzRsTG5ETXdGeG5KY24xMWtmTGc4ZEtnUXZxZms5cEVQYjVPNHZj?=
 =?utf-8?B?aUpMYXNxNms2QS93OFIxNVJXbWpkUGRMQTNWMUt2UWNqTlUwQWx6dlQ1UlJz?=
 =?utf-8?B?R0MzMUVGUzFmcmpFY2RvWUZPQzNYNmRMMDFqemJsMnFmUEtmRmExbWc5dmE5?=
 =?utf-8?B?aVZLNkpvRnRJeGhoZHJkc0hCS3Axd3l5cXc1N096R21ZVVpuWitxME56WHlM?=
 =?utf-8?B?QjdiOGxqNmhVRkRhZEExSjZqRmdieUQrQ3BzQkwzU1VoR1hKMmg5Rm1SMlk5?=
 =?utf-8?B?eTRFTStaOHNGMDNyRWM3R3F4ck5PM1VLZWpXaHE1R3NLdTU5SXFjMXhFaGRC?=
 =?utf-8?Q?8D+J9FRP8xuR1KOOzxq5md+XgAWE6M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXRnYjl2a05SaUx1cEdoM0ViSWJGVm5ua05NK01pK3l6THowaEtEMUhOcDBs?=
 =?utf-8?B?L2k0aisxR3B4aFg5TXJGdTM3cE9EdmxCL1FpR3JOOVpPK0JJc01kMG43U0Rk?=
 =?utf-8?B?VDZlajJpUEVjaFpQZkliNDZZVUUxT1Fyb0JkbzByMnNmcHF2ZlFGK2lHRnQx?=
 =?utf-8?B?dTFiN09zU2EvbjVuMXlGak9QaDM5Uk9XbWtxRGplem96M1B0MkkvOFc1OExS?=
 =?utf-8?B?cHRWTFBOcVBacThCeWNpM1lkVGQwbzAxS3ViRDhxQW82cmJhckNVVE9wV0J0?=
 =?utf-8?B?MXhjMFFlYjM1VG42dHl0SjNna3pDbVVFRVV4cWM1SHJVeHRTK1J4OE9wbEFO?=
 =?utf-8?B?NlYwZjVsRCsxcHpSd3dWK3FoT1U5NVptUDhNMWJSOWNyQm92eHJDVEFza2FT?=
 =?utf-8?B?UnB5cExIdi9jWkZDZnpZbUxTWndLZHN1YWJmbnRjRkJ2Zk1SZWVNVGRXcTlk?=
 =?utf-8?B?ZnBUb1Z1NFZWQXJHL1RhRDE0OTZlUlJGMnMrMGo1TjNFQ1VubkFjMit4Qk5l?=
 =?utf-8?B?NlNLcTFPUHdoc1lwQ1luSGhGRXZQT08zOVRBS0lqYjVndjFiS0cwQk5hTGgx?=
 =?utf-8?B?bDRieFRETmdZZXBWdVNITzVDbWRFRm5FakwvUFNvSTlEL3VFRUtncUpTVTQx?=
 =?utf-8?B?VTBNSnBNM2x5WDFsQi9oR2ZEamw3cWxWWnpIbDBneDgzcjlnVHZuTXhLTkVK?=
 =?utf-8?B?MGZvT2QrTGRqSnJCRGZSMzJLSnc2aE9kb3JZWHhRdzF4dk1ORkpIYzlXb09O?=
 =?utf-8?B?NDRYZXUxYk1LWDdYSXBybHNxcVo4NTNaR3FzcFVqZllaSkJQMFNIY1BRSGVa?=
 =?utf-8?B?MHNaL0d3czRBU2t0NXoxV2JwQTNhSWx1S3psc3pjejROT0lyYy9lVnJrRHAv?=
 =?utf-8?B?RVlzL2puZ1drcnVoTEsrYkR4K2VRQTFpMW55K3VlZG9mOFF6MVhudFVKQVdG?=
 =?utf-8?B?UXdKN1hnazREVG0vRVNocmlraldncStXaHBiRnV6Z3djRTdicE9SZHdKM1dj?=
 =?utf-8?B?VUUybTJhd0t0ekU5NEU0eWlkaGV2aFNheGk5dTVCNlhZN3VOMGNsNno5czF4?=
 =?utf-8?B?a0ZmMlNHTE04cHVHQjhFdkVNSC8vR25QdTRDV3hUd3FzdGZTTVBjMExtUTd1?=
 =?utf-8?B?T29yZWVMTkpvM2grWjluSEgxYVU3NnpBVGpONmkvU1daQ2xrV0t1dUhOOTJk?=
 =?utf-8?B?QWRxZStkWkh3QlBWdjUwOWtXREJQYThlTmxDeGFzeG5OakJWUCt1NXJiWlR1?=
 =?utf-8?B?cU5yU3czWnk3TFpWbCtMWlpNN3ZXRnp5ZnlGRFJlT3NHZ2VFRUlWSG5TbjlQ?=
 =?utf-8?B?SUM0VmpUbzNOdmJDRncwVnFrMlZCR2RkVVN6UVcrcyttZUljZGc5c2pVbEdB?=
 =?utf-8?B?NWJZdEoxWkxXV2sza0dpMlVQcG5DaU52RWJhVGxVelBSWjlJTzJ6a1ByS3dv?=
 =?utf-8?B?Zk1Ga1FhTWZaZXE0UVVzaGp2N2puU0ZvSEZ6RnRISnVqOW5mSWtRWmorVkxy?=
 =?utf-8?B?aWo1ekV6UWRHWXJQbnRrN3ZZWGtKVmdlejJ6TTdaNG9vNHltMlF6V1FnM0J1?=
 =?utf-8?B?YlY5WktIUEU2WHRCMDFOdmlHdGN0OHJFaXZjNnh3UHRXa0xZenJFQm9GMWxX?=
 =?utf-8?B?d2FPeEg1cmdqTlppWmlLUE9va3ZxMlh4UkZ2YzdJem5MYTFiQWVXRUhFV1Fr?=
 =?utf-8?B?ZHhDTE9Ea1dlclVrWCtFNzE5RXBnU1lHaU1vU1Q0OE5LTWlVdWJPU3UxY1J4?=
 =?utf-8?B?OTdwZjg5WVlMT1NncDRaekxqV0N4bUIrZzJzZUNpemhqTjRWOGQwd21PdDJU?=
 =?utf-8?B?ZGkwNG1obXg2NDhQajFPOVNYYkVUZmsxQnptWkQ0VHVncWNWNFBveFRTU2Rs?=
 =?utf-8?B?cFdpVTlYdUV1L1hLbm5yRDRuM0hZOUtSZ1RaTk8rbExjekoxdzd0UUpSZVpu?=
 =?utf-8?B?dVMwOERPbFJ5dGZrM1Q2OGJwd1BnWjM2dTMxa0g2dkNqcDdKditwN2NqYjZu?=
 =?utf-8?B?V2ovYSsyOFJvNWlqZm9IdVFoZEdFendBMnUwU3dNUGZBcU80VVo2Vnk3aCtN?=
 =?utf-8?B?cjRpUGllbnhKSEVmU2R6TjQ0N0liSHdFYUlvQU10Q2Rwd09JcTVCZTMxRmlE?=
 =?utf-8?B?RWJ4SkNTM0o1bkRoMkdReWhhS0p1Zml2d0JFdWIvaEtyT3duenpITWl4TDNC?=
 =?utf-8?Q?mPJcW5XguzyV/kmBGw4InMIdm87miJEnQI0+5TJq1QQW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a8af99a-79bb-45c6-8edc-08de15580aa2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 12:55:01.4594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A9wjsGvckjLx7uj82xMva53ETd7U43vHxQ1dLMtUrTjggwqgZL5vFzwZizgh3HzkDOsENANnVIkimhUtkzZcRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5863
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

There are a few situations in the driver where we convert a `usize` into
a `u32` using `as`. Even though most of these are obviously correct, use
`try_from` and let the compiler optimize wherever it is safe to do so.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/fb/hal/tu102.rs   | 16 +++++++---------
 drivers/gpu/nova-core/firmware/fwsec.rs |  8 ++++----
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/nova-core/fb/hal/tu102.rs b/drivers/gpu/nova-core/fb/hal/tu102.rs
index b022c781caf4..32114c3b3686 100644
--- a/drivers/gpu/nova-core/fb/hal/tu102.rs
+++ b/drivers/gpu/nova-core/fb/hal/tu102.rs
@@ -15,15 +15,13 @@ pub(super) fn read_sysmem_flush_page_gm107(bar: &Bar0) -> u64 {
 
 pub(super) fn write_sysmem_flush_page_gm107(bar: &Bar0, addr: u64) -> Result {
     // Check that the address doesn't overflow the receiving 32-bit register.
-    if addr >> (u32::BITS + FLUSH_SYSMEM_ADDR_SHIFT) == 0 {
-        regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::default()
-            .set_adr_39_08((addr >> FLUSH_SYSMEM_ADDR_SHIFT) as u32)
-            .write(bar);
-
-        Ok(())
-    } else {
-        Err(EINVAL)
-    }
+    u32::try_from(addr >> FLUSH_SYSMEM_ADDR_SHIFT)
+        .map_err(|_| EINVAL)
+        .map(|addr| {
+            regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::default()
+                .set_adr_39_08(addr)
+                .write(bar)
+        })
 }
 
 pub(super) fn display_enabled_gm107(bar: &Bar0) -> bool {
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index dd3420aaa2bf..ce78c1563754 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -291,7 +291,7 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
 
             frts_cmd.read_vbios = ReadVbios {
                 ver: 1,
-                hdr: size_of::<ReadVbios>() as u32,
+                hdr: u32::try_from(size_of::<ReadVbios>())?,
                 addr: 0,
                 size: 0,
                 flags: 2,
@@ -304,9 +304,9 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
                 } => {
                     frts_cmd.frts_region = FrtsRegion {
                         ver: 1,
-                        hdr: size_of::<FrtsRegion>() as u32,
-                        addr: (frts_addr >> 12) as u32,
-                        size: (frts_size >> 12) as u32,
+                        hdr: u32::try_from(size_of::<FrtsRegion>())?,
+                        addr: u32::try_from(frts_addr >> 12)?,
+                        size: u32::try_from(frts_size >> 12)?,
                         ftype: NVFW_FRTS_CMD_REGION_TYPE_FB,
                     };
 

-- 
2.51.0

