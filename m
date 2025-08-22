Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC7CB31839
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 14:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2600D10EAF6;
	Fri, 22 Aug 2025 12:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UFR2O+32";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2057.outbound.protection.outlook.com [40.107.96.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC08F10EAF4;
 Fri, 22 Aug 2025 12:48:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dKUiFFQ0m3gdP9YorF3Lt9VsxNQFtoZGGOP+gxYQAPx3dIE2TgTVQLLUccuGnlprHAn8k6WonO8FFekCFylJb3Mqjxnlx6l4cmiHI3S5dMVvid25uqTP+nkP2f3VHiaDNNe0+p1dRLKYQiZhiooOyrEBsuMHSIvuLtMxn/jon53u67KBvrYsxBKD9xHLf6p9b+ZiRBrB+h9N75+Pnz9JvErrf//w6tYE0IX2IA6URuKOoJZzUOccM/e6WUKT+sAYHqa+RlhLMVFuZsW6qFRcZfwvqtIDKp0OT5zXpjnknSZvzXs5mhwc8gXLvlkE6x8ZLq9obQgKwICI01L76qfryA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t10/cenAQKg0EYJn8lScSO0ckL/FkVt5D+qDKXDkbIE=;
 b=SIHt1dKa6QemlCZEBU/2pzdchzZ8MNVVZajeM1GeB8y8JGaGrHpYCVQB/B/JVatXKRW3pJHkfk4fxnKebTTS5SfTx7q6xz7HMuEc2S5aadiJe0zm/9SDvZMHLjrr/V/PGPLsmFjuIPiIlhWydNO+0NP3CAKV9HHu4QZO0i+IzYZ+apFU0iKyj5D2mWgmzMlbi63ym8bf5EcMh2qB0/pnyUkNOfy52sM2Yh1KePK/qDG/a2RPsndLNxhHhCM9jlAQrhTcwzePH28dmH6a5YfR7FRMH9joOnekaY1VQA5P3i0qKIr8xCJidKlw5TlJ8e5XXxpKKlovrmZdKggfmULbfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t10/cenAQKg0EYJn8lScSO0ckL/FkVt5D+qDKXDkbIE=;
 b=UFR2O+32cOQCZAjzbd1bWxDl6uj749SCWOeatmkWcs12GAbmzOxoF3s5jMvXNNqsVG2ymdr6zeDkEu627SqMHtdRMgdRSVz8gx37l4AJkbCfxmHI6aMI91HhO3eDnNmE6LI8IbEbZUAtpl3r4FY3GPXiGkQqQnQlQOsCW9POh33CdgpAtO0XDnqNh6wia3Bt3Zemg+oUDpac1VLwyzXb/eNRPfZtKHTL8dZvbbN7+qHt13vZCqoTy5D4B5w6ZPLjS5FLifx8YZM9v6eHIRn/p83FpgwQLlhOIeOV8KwHOsxqDf9+UEK+0lwqTAkZvxqcZS1MAoR6Xm7QXU7V64Q4Ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by PH7PR12MB7017.namprd12.prod.outlook.com (2603:10b6:510:1b7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Fri, 22 Aug
 2025 12:47:58 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%5]) with mapi id 15.20.9031.023; Fri, 22 Aug 2025
 12:47:57 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 22 Aug 2025 21:47:20 +0900
Subject: [PATCH 5/5] gpu: nova-core: firmware: process and prepare the GSP
 firmware
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-nova_firmware-v1-5-ff5633679460@nvidia.com>
References: <20250822-nova_firmware-v1-0-ff5633679460@nvidia.com>
In-Reply-To: <20250822-nova_firmware-v1-0-ff5633679460@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0292.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::17) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|PH7PR12MB7017:EE_
X-MS-Office365-Filtering-Correlation-Id: faed19fa-5070-41d3-d9b0-08dde17a1ec1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M050emh0MjZGN2VSSzM5VzhuNURUSHFyclZRdDhrNmZrL2FrSkN4UkRVVm1k?=
 =?utf-8?B?WWJMMDRWcE9maklmMGRKd3A1L2hCckFpVzQzYjAzejlEUXpOVFFhbm9ZZm55?=
 =?utf-8?B?VXJHWEJCL0lKeWp4SkNGNGw3SUFlZzZ1UlE0OFdCWGxIb3BhNnIrQ3RiUG1v?=
 =?utf-8?B?QWVndFluMVFZUzBodnA0WTNBTDJHMHVPR1NKVTVDTUxHL1A3L0lxMlNEaVhh?=
 =?utf-8?B?K2pPd3ZXeGh4dG56RFJRdVJDOVgxRkdYUWZGTEc1Rmd0SmE0MThKbUw1dm83?=
 =?utf-8?B?ckVtaEFjejNNZWs0TkZwUUpVbXBhU3h3ZXJsVHdEclpwT2xmamprdWNjTWdT?=
 =?utf-8?B?ak80M1NnOGZOL3hvNERIeEF6Z2lzYVJSSndoWXNYRDVxek1wUHZ4YVpaaUNG?=
 =?utf-8?B?Qm9oRWJqdEtJUGZxTzQwSE9iRFhlTEk5NmdKQUVXa1Vnc1dkZkdCSnBRWUx2?=
 =?utf-8?B?YTA5NXZxVEhNYS9CMFUrR2NrQWdYVXMzL2lKWGlvSWNocEE5KzYxeCtIS3oz?=
 =?utf-8?B?SS9XU1BhTk1YamFxcXIvRHJ4dldieWszRVB6VGpoZFkwaTBXM2d6dnprQlBC?=
 =?utf-8?B?S3BNSDhHWHplbW5FVnRQeS85UzQ2dGkwbjZtcGQzdDY1UXMwVUVDOUoraEt1?=
 =?utf-8?B?RnJMWnhSVmlMYmZyRHZIckwxb2c2Ti9FN0IrbHNqUjdBNDI4Sm1ML1BPaSs1?=
 =?utf-8?B?QTdydjBuT1BnRDZpM0QyOGpEbzlYZjJZOFh3UU5jSmYveUpOUVlJVlRkK0tK?=
 =?utf-8?B?R3p0ZGJzdEs4OUtQazAyZ3JoeUFjMjY2MjhycmFwWDhkd3hUeUExQjIxN0Uv?=
 =?utf-8?B?NlhjU2UyVEF1R3pyaVFPN1J6NWdCd0JpeVN3ckVGL3RHZTJxalNQcE5mZmNZ?=
 =?utf-8?B?dUdMdFVUTG4vYjJjV0QzV0tMdEZyMjZPNGdZQnhHMWc1OE0yWmVIT3pXYWpI?=
 =?utf-8?B?YmJ6STRpb29NUmhFL3NOSWxtUkpxWDVtc085SDF6MGNMMWVQSWQyTGdsOWpl?=
 =?utf-8?B?ckc2T283TUF1Z09IMnF0T0VZWGNzbU5WRHBBa1NYNEkzSTVQN095czNhWTh0?=
 =?utf-8?B?VnVrWVdBV0lzUVZ3Y08vdzBMOWxDeG85a3l5NE5wdzhWeWdJYWhKVlZoSksv?=
 =?utf-8?B?ZWh6UWpqdWNGM0tpbHUzQjNVMWczdmd0R0ZaNlhQSWRDeDNoWkJkN2NDQ0hZ?=
 =?utf-8?B?NjZUeDE4Ri8yRUsxempnbkloTVBvelVQNmlSV2l4dk85UllaUXRlNURodjdm?=
 =?utf-8?B?RVVyb2YxTUNweE1LRjJaTDVGZU00eVArOC9MaFFYMkJLWVFsaTI2SzR2bjMv?=
 =?utf-8?B?RGVhcmFRM0lFM05TMzNudmtkNkY2bDQ4c2VIRktDU0VxN0M2RjBCSW4xY3U1?=
 =?utf-8?B?R2hxQ0RNWURzUUFuWG9CZ0phcitrMWVvTCtZeExuRzcrRmwvY1g5ZzUxWjU0?=
 =?utf-8?B?OHNwRWdqdzlSRlVxZFJkMEQzbitCa2VrazNmTDJKNHk0QnZzbFAyd1VIcjZQ?=
 =?utf-8?B?VjlBMGwyd1Jmd1JCZ0JaMkxxWXBYOGgyZ0EyZXA1ekc2ZlB4Z1NLQlFhaEdL?=
 =?utf-8?B?a1l3WHorRVZWYWVJUW9xdTJubG5tTGRMUG0zZ2ZOUkVYUi9Vb1F2dWNNSHVv?=
 =?utf-8?B?UDlPei9WeEJvSi9UVWVwenFWNFRNTXhidjlNRUtEYXAzQ0RnOTFPbzRkckUx?=
 =?utf-8?B?RktSaXZJbmtMMXVRYnBlb3cwc1B4NmlMSjQyNlVhSmZkdHhKTW55N2NOS2k3?=
 =?utf-8?B?cGVieExCc3FTYlNoamRvK1N0UTJOQnRqQjFOeThad1JyQ3N5cEVvTCs4bEdP?=
 =?utf-8?B?Y3pOckJTWFJEYWhmaHNPNWRZeHZwQ2I4V0tqWlZPSDBhNmNqVmJ5bEFZajQ3?=
 =?utf-8?B?SDlKQ3Q1ZEEyeS9YdXhuZGY2d3FYK3Q3OFdERk1XVDNxeFUvdTJVWG5RWjA0?=
 =?utf-8?B?OFByU0xYVG9BUTQ5MDlnQWUwb1JFRkJ3aS8walBibE0wcUVXa09xWDJIREVt?=
 =?utf-8?B?Y0MxWm9LM0tRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OW9MRm9rL2xQa2c2RlVpWVZnY1VKWVVKSXltaWVIa25yTERqSHN2dk1RYXpR?=
 =?utf-8?B?REE5dlNBMmxPU1pHNzNwZWxSWGQyWDlLd1NIREwwMDJhN2ZQOWx6aUZ4aXlS?=
 =?utf-8?B?cTI0SXFFTlYzaXlJTGY0ZzQzZURDYWlVTU1DNzRRU3pYR2doUmZTeFZXNlpG?=
 =?utf-8?B?NlZEbXZwK0tPQlRpNTlSaE90STAvMk1VT3NaWjZNU2VuWDVydzFzZlBPZ3J5?=
 =?utf-8?B?djdEQmRJekQvWTBaTFgyN014UldHWTBlY1VobFIwMjNpazZWNWJUUUFkcVZp?=
 =?utf-8?B?RjhndVJvZGttMGEzY3FXcFdsbHdSS2pDWGNGOWYyZnlDS1RUTDdrZkphOTEw?=
 =?utf-8?B?VnhpYmwvRFc0YXdkSkJrTCtwYUd6cU9mQ2RPaWtKOXBMK050eHoyU1dwdnFE?=
 =?utf-8?B?V1ZFK204Z2lhVDBsQlVaenJiNjZQYTRFYWdOT09hWVZlMlFiOGF6cWUybCtn?=
 =?utf-8?B?c0lCQXZyeHZZZUNGRmo4TUZBQmM3RGNtY1cvczZVbU90MzRlNEVvNTZiM0Zl?=
 =?utf-8?B?VkZnK2R4a2RhOENxZDdaUmVlaFlCYzFZeGJmRmc1REdqK3B2OUtKVTJjNWs3?=
 =?utf-8?B?YW1vMjV4aEtkZmFaMGxVRWlybVRTb1R1Qk5TeTVkNnJ5aE1XVlppLzlzOXBK?=
 =?utf-8?B?V1FQVTBSbGRYeC9hc3JJcU5rZEpKOUxQWUdjN0J3MFhWclcxamZnc1FXNU0w?=
 =?utf-8?B?Yi9PUFpBSDQ0ZnJ0akhSRjBWaVB4ZUl6bkgya3VxeFBSUmJ6eVpvSDMrVjZX?=
 =?utf-8?B?cktBVEZpVjlxaXRGSVk3TFdYTlR2eE1wUmRTZWU5VkJZZFl5dDBBZEtxT2hN?=
 =?utf-8?B?ak9RRnNkTVluYXRyWUVScUdxSFVGNldRSkZKUGR5N0FzdnVGSndQWWcxbDAy?=
 =?utf-8?B?ZkF5OWlZL2xEZzJZMDIzaThlSTh4bk5DOVg4UXMyN21CazJ6bmwxemxNRGY0?=
 =?utf-8?B?d2crMVdJZkd1bWt3OTNhSFUvWFV3aVlDdzFRVHBDZmtFUFhQbWp0ZlRFVzgv?=
 =?utf-8?B?T0w2M1JVcWJCK1BrMjlwbnBnSjRCOEcxbEhqcmlkZGR2NGVuMHZ3Q0dheDQy?=
 =?utf-8?B?c2lyam1UVVN2OGpPYm1uVndLakhRRGl6dHNyd0RzVUhDdnhjc0h1UXd4WDBl?=
 =?utf-8?B?U0h6TzZnWFRnNG5ZVFgycUR6cFFBWWRhV0pNMGVaU1hHSjRvLzhwbHhOV1A2?=
 =?utf-8?B?YWJwK2ZOMEkzcVVlVndVWmhkWVU1TmpOYnVQMUloOE8reFBacGJTOERRMDdY?=
 =?utf-8?B?VytFamFjRGZyYStIR0lubDJRZW5iS3FvUVNqL2tIeVNXa01QZ24vOFYvUmRi?=
 =?utf-8?B?RzlkOGtSYmRiTkFoZWFqM3RacFlGbXpMT2JITHU5SDNxTVAvOVpWKzF3eFk0?=
 =?utf-8?B?K3NJNXByKzFJTDZBd1NMRkN5RGxaNUkrbGkzTGMwN2ZMN2tpUTlTc2FVdXM1?=
 =?utf-8?B?aU9oelIvd203TWdIbnRqemFWaGYzTmU0dktNck84Tk5FV2ZCNmNCMzZPbDRx?=
 =?utf-8?B?ZjZ4WHJYQ3k0WlVZQjJ4aHQweDFCVnVLK1VzYzBWWkZCQTJRYVdhZ0N4VDk3?=
 =?utf-8?B?WGoxQU9jTnlGbzBRdVV3Q1lhZXR3cTdKK3VWaERJYU9WV0FHWjN2Yi92dHQr?=
 =?utf-8?B?c05mK2VDU3VmaFNoQzE3U3BBVCtUMDd0MEIxUC93a2pDTHdpOVYxUTlINkZ5?=
 =?utf-8?B?VWdWd1V4RXROUWJRU3JqT1J1eEM4bGtIWEg2Y1FyakFHQm1Kbm9iVldjVW9s?=
 =?utf-8?B?Wk0zeTRVSFZHR1NCaFNUZEZPNjFXQVZRMnppeVcwRUNPdm4rVlJpUXg2azJH?=
 =?utf-8?B?SlQ2M3I3MVRFOEwvdlpPbXU4QmlXVm9jMGFDWVFRTHFKcmFjRTVzNVEzMUo3?=
 =?utf-8?B?MnZ6S1ZyWk1WRk9HcjBDYU90UXhkVUpQMXpCclNjRkcycUovdkhVemNaNFhI?=
 =?utf-8?B?eW8vR1ozQ2pWNGFhMmdvMC9QWVJhUi91bFRqTFFGTitRWjFyeGR6V2ltVnc3?=
 =?utf-8?B?Z3pkZ2VlY041YmNlRjdGejBxOC80Y3lwU2FXSCsvZlhCWGlTNlJyZFNWVDhq?=
 =?utf-8?B?aEpiM04wNmxpTWx1YVpETFNWZWd0bE9rVWJDdldaMzgxanpVQXc5cUdncWZy?=
 =?utf-8?B?b20rZEd3QkdRYWROTEE5eFJiVjIwc1h5M2ZXbGc0Lzl2WnlRY3NkVWpBUG1w?=
 =?utf-8?Q?BkgWD8hSXug+SVx8W2NMUaFN/aBDhTvgcVgKiDmxxgc3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faed19fa-5070-41d3-d9b0-08dde17a1ec1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 12:47:57.5641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vEc1cMCZoCtzKHgcUnLFjeEyuYEYaKlY3/x3vuWhj9GdufRafZpeKD4wTGRz9cf2lNLUDGYcGvMTicMKJJ44Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7017
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

The GSP firmware is a binary blob that is verified, loaded, and run by
the GSP bootloader. Its presentation is a bit peculiar as the GSP
bootloader expects to be given a DMA address to a 3-levels page table
mapping the GSP firmware at address 0 of its own address space.

Prepare such a structure containing the DMA-mapped firmware as well as
the DMA-mapped page tables, and a way to obtain the DMA handle of the
level 0 page table.

As we are performing the required ELF section parsing and radix3 page
table building, remove these items from the TODO file.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 Documentation/gpu/nova/core/todo.rst  |  17 -----
 drivers/gpu/nova-core/firmware.rs     | 108 ++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/firmware/gsp.rs | 116 ++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gsp.rs          |   4 ++
 drivers/gpu/nova-core/nova_core.rs    |   1 +
 5 files changed, 226 insertions(+), 20 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index 89431fec9041b1f35cc55799c91f48dc6bc918eb..0972cb905f7ae64dfbaef4808276757319009e9c 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -229,23 +229,6 @@ Rust abstraction for debugfs APIs.
 GPU (general)
 =============
 
-Parse firmware headers
-----------------------
-
-Parse ELF headers from the firmware files loaded from the filesystem.
-
-| Reference: ELF utils
-| Complexity: Beginner
-| Contact: Abdiel Janulgue
-
-Build radix3 page table
------------------------
-
-Build the radix3 page table to map the firmware.
-
-| Complexity: Intermediate
-| Contact: Abdiel Janulgue
-
 Initial Devinit support
 -----------------------
 
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 7006696bb8e8ec0d7fa3a94fb931d5f0b21fb79d..b97fe53487cab12069961b132ba989a88d3ace81 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -7,6 +7,7 @@
 use core::mem::size_of;
 
 use booter::BooterFirmware;
+use gsp::GspFirmware;
 use kernel::device;
 use kernel::firmware;
 use kernel::prelude::*;
@@ -19,14 +20,98 @@
 use crate::falcon::FalconFirmware;
 use crate::falcon::{sec2::Sec2, Falcon};
 use crate::gpu;
-use crate::gpu::Chipset;
+use crate::gpu::{Architecture, Chipset};
 
 pub(crate) mod booter;
 pub(crate) mod fwsec;
+pub(crate) mod gsp;
 pub(crate) mod riscv;
 
 pub(crate) const FIRMWARE_VERSION: &str = "535.113.01";
 
+/// Ad-hoc and temporary module to extract sections from ELF images.
+///
+/// Some firmware images are currently packaged as ELF files, where sections names are used as keys
+/// to specific and related bits of data. Future firmware versions are scheduled to move away from
+/// that scheme before nova-core becomes stable, which means this module will eventually be
+/// removed.
+mod elf {
+    use kernel::bindings;
+    use kernel::str::CStr;
+    use kernel::transmute::FromBytes;
+
+    /// Newtype to provide a [`FromBytes`] implementation.
+    #[repr(transparent)]
+    struct Elf64Hdr(bindings::elf64_hdr);
+
+    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+    unsafe impl FromBytes for Elf64Hdr {}
+
+    /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
+    pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a [u8]> {
+        let hdr = &elf
+            .get(0..size_of::<bindings::elf64_hdr>())
+            .and_then(Elf64Hdr::from_bytes)?
+            .0;
+
+        let shdr_num = usize::from(hdr.e_shnum);
+        let shdr_start = usize::try_from(hdr.e_shoff).ok()?;
+        let shdr_end = shdr_num
+            .checked_mul(size_of::<bindings::elf64_shdr>())
+            .and_then(|v| v.checked_add(shdr_start))?;
+        // Get all the section headers.
+        let shdr = elf
+            .get(shdr_start..shdr_end)
+            .map(|slice| slice.as_ptr())
+            .filter(|ptr| ptr.align_offset(align_of::<bindings::elf64_shdr>()) == 0)
+            // `FromBytes::from_bytes` does not support slices yet, so build it manually.
+            //
+            // SAFETY:
+            // * `get` guarantees that the slice is within the bounds of `elf` and of size
+            //   `elf64_shdr * shdr_num`.
+            // * We checked that `ptr` had the correct alignment for `elf64_shdr`.
+            .map(|ptr| unsafe {
+                core::slice::from_raw_parts(ptr.cast::<bindings::elf64_shdr>(), shdr_num)
+            })?;
+
+        // Get the strings table.
+        let strhdr = shdr.get(usize::from(hdr.e_shstrndx))?;
+
+        // Find the section which name matches `name` and return it.
+        shdr.iter()
+            .find(|sh| {
+                let Some(name_idx) = strhdr
+                    .sh_offset
+                    .checked_add(u64::from(sh.sh_name))
+                    .and_then(|idx| usize::try_from(idx).ok())
+                else {
+                    return false;
+                };
+
+                // Get the start of the name.
+                elf.get(name_idx..)
+                    // Stop at the first `0`.
+                    .and_then(|nstr| nstr.get(0..=nstr.iter().position(|b| *b == 0)?))
+                    // Convert into CStr. This should never fail because of the line above.
+                    .and_then(|nstr| CStr::from_bytes_with_nul(nstr).ok())
+                    // Convert into str.
+                    .and_then(|c_str| c_str.to_str().ok())
+                    // Check that the name matches.
+                    .map(|str| str == name)
+                    .unwrap_or(false)
+            })
+            // Return the slice containing the section.
+            .and_then(|sh| {
+                let start = usize::try_from(sh.sh_offset).ok()?;
+                let end = usize::try_from(sh.sh_size)
+                    .ok()
+                    .and_then(|sh_size| start.checked_add(sh_size))?;
+
+                elf.get(start..end)
+            })
+    }
+}
+
 /// Structure encapsulating the firmware blobs required for the GPU to operate.
 #[expect(dead_code)]
 pub(crate) struct Firmware {
@@ -36,7 +121,10 @@ pub(crate) struct Firmware {
     booter_unloader: BooterFirmware,
     /// GSP bootloader, verifies the GSP firmware before loading and running it.
     bootloader: RiscvFirmware,
-    gsp: firmware::Firmware,
+    /// GSP firmware.
+    gsp: GspFirmware,
+    /// GSP signatures, to be passed as parameter to the bootloader for validation.
+    gsp_sigs: DmaObject,
 }
 
 impl Firmware {
@@ -56,13 +144,27 @@ pub(crate) fn new(
                 .and_then(|path| firmware::Firmware::request(&path, dev))
         };
 
+        let gsp_fw = request("gsp")?;
+        let gsp = elf::elf64_section(gsp_fw.data(), ".fwimage")
+            .ok_or(EINVAL)
+            .and_then(|data| GspFirmware::new(dev, data))?;
+
+        let gsp_sigs_section = match chipset.arch() {
+            Architecture::Ampere => ".fwsignature_ga10x",
+            _ => return Err(ENOTSUPP),
+        };
+        let gsp_sigs = elf::elf64_section(gsp_fw.data(), gsp_sigs_section)
+            .ok_or(EINVAL)
+            .and_then(|data| DmaObject::from_data(dev, data))?;
+
         Ok(Firmware {
             booter_loader: request("booter_load")
                 .and_then(|fw| BooterFirmware::new(dev, &fw, sec2, bar))?,
             booter_unloader: request("booter_unload")
                 .and_then(|fw| BooterFirmware::new(dev, &fw, sec2, bar))?,
             bootloader: request("bootloader").and_then(|fw| RiscvFirmware::new(dev, &fw))?,
-            gsp: request("gsp")?,
+            gsp,
+            gsp_sigs,
         })
     }
 }
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
new file mode 100644
index 0000000000000000000000000000000000000000..34714156e40c0b41e7d6f67b7abe9d76659b5d18
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::device;
+use kernel::dma::DataDirection;
+use kernel::dma::DmaAddress;
+use kernel::prelude::*;
+use kernel::scatterlist::Owned;
+use kernel::scatterlist::SGTable;
+
+use crate::dma::DmaObject;
+use crate::gsp::GSP_PAGE_SIZE;
+
+/// A device-mapped firmware with a set of (also device-mapped) pages tables mapping the firmware
+/// to the start of their own address space.
+pub(crate) struct GspFirmware {
+    /// The GSP firmware inside a [`VVec`], device-mapped via a SG table.
+    #[expect(unused)]
+    fw: Pin<KBox<SGTable<Owned<VVec<u8>>>>>,
+    /// The level 2 page table, mapping [`Self::fw`] at its beginning.
+    #[expect(unused)]
+    lvl2: Pin<KBox<SGTable<Owned<VVec<u8>>>>>,
+    /// The level 1 page table, mapping [`Self::lvl2`] at its beginning.
+    #[expect(unused)]
+    lvl1: Pin<KBox<SGTable<Owned<VVec<u8>>>>>,
+    /// The level 0 page table, mapping [`Self::lvl1`] at its beginning.
+    lvl0: DmaObject,
+    /// Size in bytes of the firmware contained in [`Self::fw`].
+    #[expect(unused)]
+    pub size: usize,
+}
+
+impl GspFirmware {
+    pub(crate) fn new(dev: &device::Device<device::Bound>, fw: &[u8]) -> Result<Self> {
+        // Move the firmware into a vmalloc'd vector and map it into the device address space.
+        let fw_sg_table = VVec::with_capacity(fw.len(), GFP_KERNEL)
+            .and_then(|mut v| {
+                v.extend_from_slice(fw, GFP_KERNEL)?;
+                Ok(v)
+            })
+            .map_err(|_| ENOMEM)
+            .and_then(|v| {
+                KBox::pin_init(
+                    SGTable::new(dev, v, DataDirection::ToDevice, GFP_KERNEL),
+                    GFP_KERNEL,
+                )
+            })?;
+
+        // Allocate the level 2 page table, map the firmware onto it, and map it into the device
+        // address space.
+        let lvl2_sg_table = VVec::<u8>::with_capacity(
+            fw_sg_table.into_iter().count() * core::mem::size_of::<u64>(),
+            GFP_KERNEL,
+        )
+        .map_err(|_| ENOMEM)
+        .and_then(|lvl2| map_into_lvl(&fw_sg_table, lvl2))
+        .and_then(|lvl2| {
+            KBox::pin_init(
+                SGTable::new(dev, lvl2, DataDirection::ToDevice, GFP_KERNEL),
+                GFP_KERNEL,
+            )
+        })?;
+
+        // Allocate the level 1 page table, map the level 2 page table onto it, and map it into the
+        // device address space.
+        let lvl1_sg_table = VVec::<u8>::with_capacity(
+            lvl2_sg_table.into_iter().count() * core::mem::size_of::<u64>(),
+            GFP_KERNEL,
+        )
+        .map_err(|_| ENOMEM)
+        .and_then(|lvl1| map_into_lvl(&lvl2_sg_table, lvl1))
+        .and_then(|lvl1| {
+            KBox::pin_init(
+                SGTable::new(dev, lvl1, DataDirection::ToDevice, GFP_KERNEL),
+                GFP_KERNEL,
+            )
+        })?;
+
+        // Allocate the level 0 page table as a device-visible DMA object, and map the level 1 page
+        // table onto it.
+        let mut lvl0 = DmaObject::new(dev, GSP_PAGE_SIZE)?;
+        // SAFETY: we are the only owner of this newly-created object, making races impossible.
+        let lvl0_slice = unsafe { lvl0.as_slice_mut(0, GSP_PAGE_SIZE) }?;
+        lvl0_slice[0..core::mem::size_of::<u64>()].copy_from_slice(
+            &(lvl1_sg_table.into_iter().next().unwrap().dma_address() as u64).to_le_bytes(),
+        );
+
+        Ok(Self {
+            fw: fw_sg_table,
+            lvl2: lvl2_sg_table,
+            lvl1: lvl1_sg_table,
+            lvl0,
+            size: fw.len(),
+        })
+    }
+
+    #[expect(unused)]
+    /// Returns the DMA handle of the level 0 page table.
+    pub(crate) fn lvl0_dma_handle(&self) -> DmaAddress {
+        self.lvl0.dma_handle()
+    }
+}
+
+/// Create a linear mapping the device mapping of the buffer described by `sg_table` into `dst`.
+fn map_into_lvl(sg_table: &SGTable<Owned<VVec<u8>>>, mut dst: VVec<u8>) -> Result<VVec<u8>> {
+    for sg_entry in sg_table.into_iter() {
+        // Number of pages we need to map.
+        let num_pages = (sg_entry.dma_len() as usize).div_ceil(GSP_PAGE_SIZE);
+
+        for i in 0..num_pages {
+            let entry = sg_entry.dma_address() + (i as u64 * GSP_PAGE_SIZE as u64);
+            dst.extend_from_slice(&entry.to_le_bytes(), GFP_KERNEL)?;
+        }
+    }
+
+    Ok(dst)
+}
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
new file mode 100644
index 0000000000000000000000000000000000000000..a0e7ec5f6c9c959d57540b3ebf4b782f2e002b08
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -0,0 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
+
+pub(crate) const GSP_PAGE_SHIFT: usize = 12;
+pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index cb2bbb30cba142265b354c9acf70349a6e40759e..fffcaee2249fe6cd7f55a7291c1e44be42e791d9 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -9,6 +9,7 @@
 mod firmware;
 mod gfw;
 mod gpu;
+mod gsp;
 mod regs;
 mod util;
 mod vbios;

-- 
2.50.1

