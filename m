Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C24C5B4FEC0
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 16:07:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9966210E775;
	Tue,  9 Sep 2025 14:06:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="id8O1qGX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCD310E773;
 Tue,  9 Sep 2025 14:06:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kR2wg5YFRWjdGlW/VNWZ6Qs3tgIQJolTCrp/eJSrtvUXm8Z/joqsWqdPFlXFdEdATswwGhQzxs/5OdxVx1hV/zmy+faPGvU4UIZihOo4dKHHFcUugmbSy2oyktaCRkHZw288vGznuK9O9YsoWvMeLMB0dhzeDtdtNc8B9bv24IBZKvmbJHF08sfHMEuqPc8ymudhJJuz0W9MgQ4YhBQDwbQIp3C3JJiIAzJRxKz7tmGwHS8J5fLvDOlNV2Jz5NpuNUEDo3Eu3FZM5tREMpG+//q/gGSXlJxv+glISE5GUSwhCYwpdCi8BhYa+NVZ82aAEGP8bxDseNg9myiTukx4JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFOshg4P7qlCJxW1W/979UazBYoCqFz471o5CieZfCQ=;
 b=aTlzzDmpZ1yVdQ+9gqNx0NSZrKNPi8ssYh63PeEdReh86FkEj0BU273EERfRPK+EmuAHB47E6+F5NmP77zkhKVYj5GM9lUw3c6QRIOWjWbLY4s5RJv9CQkTYJk+6r9d9dOzx+DS1V6w3vJlL1NpqfycwqTpOxxxRn3eRnwZI9F6A5kggXpYMICM6pPljpNU6bjZhr0RVRSc+Ulz9jjScINnZogTXp7Le+pyQDNQUz+Sr75lFaqPCK9umfkEARHJhT61n10ar+JNhptFibCeLSjE7+KHk/2ZnuGvXySmr6uwAwxEiG54TwUhm1dQfTsf+CboUjMWVsFJniLPCAcxetA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFOshg4P7qlCJxW1W/979UazBYoCqFz471o5CieZfCQ=;
 b=id8O1qGXqW/DbcpRaNLIULSjxDLPRABHMsnQL2Pueb9iWGoJD3Ak8tNGMkAdHts72I4fN6/5AfbLCrovT4dqajtITZZ+G0zGc8S9f2aTAK7am56ccJ9Kj0zfpyIQihOiDlgp/lVurTkENvb6np24kTzi74SyYZEuCp2SpZvYVZns8ppZg580/D3GwZDHchJL2ilcJZZq3ZjwHfFMM1AYAyd/o/vscXFkZCpFAQAvNuLBfYBQsRahQUMEXry8MB10r7n7y1hPoWe0heIg1ybE3KP/V8iA8OKeEwXvVE2oIz0uajIwnyiER16f0fr9+WjGsxyElFWtl55LlEy8dlAR9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB7978.namprd12.prod.outlook.com (2603:10b6:806:34b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 14:06:54 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 14:06:54 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 09 Sep 2025 23:06:38 +0900
Subject: [PATCH v4 02/11] gpu: nova-core: move GSP boot code to a dedicated
 method
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-nova_firmware-v4-2-4dcb433d5fee@nvidia.com>
References: <20250909-nova_firmware-v4-0-4dcb433d5fee@nvidia.com>
In-Reply-To: <20250909-nova_firmware-v4-0-4dcb433d5fee@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0042.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB7978:EE_
X-MS-Office365-Filtering-Correlation-Id: ee18b976-99dd-4da9-3e2a-08ddefaa219d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODBBMURPZmgxQnJEK1g2bk1DMXZVRSthTHJ6RWh3VjVVQTVaQWJZQ3Rsc1pT?=
 =?utf-8?B?SzVXcXJrQ2xTYzNTbHZDbW16eEtCRWZ1eHhJblllWUsvd29iNW5nbmNVMk5X?=
 =?utf-8?B?MWdNM0VTeDlEOGxGL0FZWUFYblJWaTJNNUw0TDVjMGJJNGd4UTlpc0RHYldp?=
 =?utf-8?B?bFBmVW1SRngzN3BDRDhVMlBEUFc3L1B4NjNkYUNISm9leERoTWJaYmVUUUgr?=
 =?utf-8?B?NzFkSEI3Qm40MVpGaWU1ekVJVXl3QkJmemNwc2VsVUtsZG95YU56alpwQTl5?=
 =?utf-8?B?cnkyMmxzTWRvU3k0czJtNk13S2dSZ1BEUW1nMDlFT2Q1N1J4QTU0M05VU0ps?=
 =?utf-8?B?TVhnRzNwWHlGWGszQndPMGd3M2x3dkk2ZjNnaE1BM0ZYRVQ4Ni8yMlNDWHVY?=
 =?utf-8?B?SFZXbXJsbjhoMU9RVWdwS1l3ZjNiOWh2d1V1eGN1K1VXUXdueEJaYTUxL05Y?=
 =?utf-8?B?bEtlK2habGtRTjBWblAvcFR1N0ZXeEovWDNEb2tZekowR2hJWkZrdk9Cb3RL?=
 =?utf-8?B?ekhDaStnVWdkUlhqbGdiWlJlU0tFVVFyZGVZeUF4WklkbHZEMENPWWlkeS82?=
 =?utf-8?B?ei9OOUNTQ1U3RHlMQlNFVTVLenRMazZkTWVNQmhFRlE3dnJkK0F5MitvV3J4?=
 =?utf-8?B?YWJXV2s4M0NsODJqRm1uV1Uycm1qb2cycXZYMml6bGVrS1VJOS9lcFdNdXBX?=
 =?utf-8?B?VEhoVFFxYWhnMjcyTWtMUFJUWkh2OGRFUjNVQUlQZ1lPWUR3VkVSTjk1SDdq?=
 =?utf-8?B?a1RjUU14dVlSQWR4NHhtQlVma09valkwU1B2Yi9xTnhxbHJhME5rZHpPZEJ2?=
 =?utf-8?B?MVNXL1ZHQ0dScTNWOU9kTG1aZjYwWDhjLzBuMzYvYlQvYWU4R1NUQlc3YlZT?=
 =?utf-8?B?OHFTTWt6VWFHN1k4RWNGbDJTMjdIVGlSdndxalFCZlQ1VlJ4WHZMd2doTFNk?=
 =?utf-8?B?MEFlL1NkRlBEY0krMUdObnZwVHpkZ0p3VEthTU5wN0kzZUxsZmxzOWRSTXBQ?=
 =?utf-8?B?aityUExTdHRZejZ4ZjZML1lNQ1A4S1RjYXpnWmI3RE1NSEZqeHU4U3Jxd29p?=
 =?utf-8?B?Z0k0eWxwTnplSU9ETkhKam5uM2pWdGttR1lEcmphTWhqenRhbmdLRUVkK09W?=
 =?utf-8?B?ZHFuQUltUWdHaHJpOFBtTWRMT1dqWUlRR09RcXlMSDJyVWNvNWRCUWk4cDJl?=
 =?utf-8?B?Mk1ja2xlMXRyWlR0NFZNRzZSeCtLNzRVWk52MTZIOHFhbFkrL2dxSzhDSVZT?=
 =?utf-8?B?Q3hMUDdMZEdiV3BLMk9oNDBIcnRHSE1QMC9xTXQwZFZhWmFLeXRtbWliUy9J?=
 =?utf-8?B?STZUbEpYVXQxbkx2bTFmdVdQQXIzRjNkbzc2MThjVGxwTWRvUVpIYjZJZkJH?=
 =?utf-8?B?ODVNR1RDRzBjWXB3a2h0UEk4ODRvVitMUnhsTjUzaXUybGk1QmVBdUlNemRw?=
 =?utf-8?B?ZjJHbjVBRE5HV0d5UHdnV1FkYm1FMWsyZnArc3UyRXAyOURrUnNFdS9RWWZC?=
 =?utf-8?B?b1BRSFd6dGZpK1dRckxrTUtGd01SUXllT2NlY21nY0UyZ1JtVURnMHp0MGlm?=
 =?utf-8?B?WWZ6QU04MFhONUtSUVVsNXJaYlFycTRiTVJCS1JONWJKdEpIdVRydlcyMXdt?=
 =?utf-8?B?bEVnSnNBYmVRdnFkZUFtOERxS3BlNmp6NlU1cVhlUkJBZ2E1OXJIMVI2emlq?=
 =?utf-8?B?Tk9POXRYRHRSSEJJYzNRZ1c1Sm5nemVMRE41cXJLWi9FQzBpNngzSFNOL2RK?=
 =?utf-8?B?MUVQMkRlOGxEMVVmT2ZSbGVCdGFGUm9zY09kd1hmcFNIam5NWU96ZXJicUtG?=
 =?utf-8?B?WkZ5QWNKaUxLWHd4NWJEUDhOaWJybGw5eUhHTzVuTUNDUy92SDlRZmUrSWZz?=
 =?utf-8?B?UkNTbkxGM2hQN05rVlN6anYxTThnODZDbmdjNHNFa0kyMnh1MEdOS1FHb1lz?=
 =?utf-8?B?M202RUc2MXFqWDZpRG83bHZXZmlRSmhFbzZycDdNZ0pFQjNOSGNaU2Y1NFQz?=
 =?utf-8?B?ZFBNWnRhUUVRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2dhVW15aUFOdVM0UndmcXRraU5UZDVpQkE2MHAyL2gyM1dwR0Y2THlWU3dK?=
 =?utf-8?B?THByaFFtSXpsYjJqZzZITDlmemR5U2Y4dTlWV0tLRTlMVXpsbHQ2d2lNdktt?=
 =?utf-8?B?YkJFaDU1UUtncFYzOEg5R0pIUjI0RTBtb3QvU0M2cGlaUGlpOGxaVlBHTDJz?=
 =?utf-8?B?QTdFdS9TTy9FZEtUZnZiUDA0dDZZZUJXTFM4UU5xd2R5K0RadjVLTmpJTVRV?=
 =?utf-8?B?b24zOUhVc3U4Z2RXRUVaeXhKZlUrUEQ0VFRpMG9LQnNtVW1USFNrUEdpMTBr?=
 =?utf-8?B?bU5MOFBvMnZ4OEtaOFVVaW1yVUthU1h1OFdUUEtQdk9XYlBEVXVzb2FRVjgv?=
 =?utf-8?B?VnNoRy9iUTBJM0dGWkJ1ei9JQWdPVzl1TGIweGxDVlNjSnVHRWNmbHk4S2JF?=
 =?utf-8?B?ZFdUNzRxSlEzc0d4Y1RNcmlWUmJQUzNTRk5vajloR1QwVGNoSzFrUXNoOUY2?=
 =?utf-8?B?dmNiSTQwc2wveGNSTjVQMVBoaXpnTVh1WGhVb2FOaVlKeW1nMnVKUi9mcVZa?=
 =?utf-8?B?bDN4NVhVOGY1VVI1ZTFFbXlQdnhvRTBISjRvZm81U3VHMEg2eGxpbGdNYTFQ?=
 =?utf-8?B?SVE2aHI5WldPSWpoN1pGMnhwNmc4cm9QeXhEOXBtTnhvRzg5c2dlZERKdEVS?=
 =?utf-8?B?T1lpK1lXOGpuM0tZWUdmbWlsR2x3cUpCdTkxMFVlQ1VoWWI5ZmF4a3ZKQWJr?=
 =?utf-8?B?dXM4L2RtMDZNNDRrLzlVRnV0YnNaQUp5eXJiM2hvdk94Zzg2ZnRqOVM5bExp?=
 =?utf-8?B?VkJvMW84cmQwV1BrMnUyeFVOenREbGhLOXU0YzZjQW1lMnVyVWd5NDg4ZXA4?=
 =?utf-8?B?TVh0Z0xCdnJHUVJJSElCWmtGbFA2Mk9obGdKcDZaQkRnbmtzeloxOXExOG9t?=
 =?utf-8?B?N1BEU08vRCsvRnIvSWlMYlkrSGtZQ3ZacEM3cVVQa0dRaGhFU0lGa1gwdk9j?=
 =?utf-8?B?bU90SG5wRlh6VzBiWGNHcGt0Z0hTRVFaYy9JNEdDUjlHR0dYbEJCbE5FSFR4?=
 =?utf-8?B?RVdleGxEalhYZjQ0K0xXei9DWW9BK1Fxak5XTVNkQXlJb09SSnlLZWpUbFBC?=
 =?utf-8?B?dEl6UGtxZjJndTduMzNENjIvM0JINldFdzgvYUhZQUJjUW85UmtzRTJvMGFD?=
 =?utf-8?B?MWFHUTFwbVY4VERkMzRwcEdVUEZuNVpGUjdONGszWWxsMlpLdkhlb203eTV5?=
 =?utf-8?B?amJ3TnpackJTbnJzbzVpMDI0WW0yLyt2b2x3VTE4bW5od2J3eERDMDd5SU5T?=
 =?utf-8?B?VTcrOTlzcVRCMHhRR0xsbXJ0TGhPYUJuMy91bytLU0x2a241VmVwUDRlQ010?=
 =?utf-8?B?T1F2Y2ZsbWN4M3ZlSktCeXR2V1NWSXFoTGZGZlhxY3NaSzc5YVJNUUNlSFkw?=
 =?utf-8?B?eEg0NEVQWGY0UjkxM25GWTNmaUpVQmYwWnRTSXdjencreGFBdnFGMHBQbDBM?=
 =?utf-8?B?MmVOZWpQNHBaN094VWI0Nm5UNm5KbUpZOHlKak9IZ2NKS0ZWUXpEU2JpaFFJ?=
 =?utf-8?B?MVdVakFJMXhEQTBZNjlzNTJHYkhWOXYxNmptcDN0enFXK3NJUWwzNWYyWnZs?=
 =?utf-8?B?YWs5OEgxWDk3QUQxTFUzNEJaTHFnS0RhMW1FdWV0VjFkcXNNWENGWitPRUMw?=
 =?utf-8?B?dE15UC9aS2RWNStWVE5ERk1WOVMxc2UrY2NkQ0V4T3JwWTlkNjRNUngrVTNN?=
 =?utf-8?B?d05nQlhpR0JIeDF3cUV0MktPUjlKTE9GUVp3NE55bEEwdDZIWWtWZFVwNGVB?=
 =?utf-8?B?aG1aU29ZTXBvSThWc1Ivc1k5LysvYlVwK3ViVFJwN053U1dpSzdpVXBxNklm?=
 =?utf-8?B?MFJoVGpKZkxUVEZKeGZsRDNIRkd0VWxodlRDZlhWZVF4SkJnL015b2NBcUZ3?=
 =?utf-8?B?WGxoQ2FVK1FuYlV4Y2hvQW1YRk5nWE9YUlNRK01jcmZZb0w4b3ZZYks5MlBZ?=
 =?utf-8?B?YUFWemRyQjB5VTV4bHNtcmxSS1NQSVRrZ2JFaVBGRXVqemxEL0JYWWZTaW1V?=
 =?utf-8?B?OStVRVVUWEEwVlZmNkJwTlk5K0hJTERNSTVBeVJJU2VOVnBtclVHSFExaHZS?=
 =?utf-8?B?OS9mWkNRaXRmSVMwSjlkYjZzaHgrM01xZ1JkR2t2Tnp4aDNET0psbXEyQytS?=
 =?utf-8?B?MlpkbEVXUE4yRzNRVTZaKzlWeXNLZGV2M3MydzVYZHhTZ3lhSzQ0OG5oSXUv?=
 =?utf-8?Q?jylyTwgM8MWy/S+XaQpMc0rLK6rGwhEL8nEt0N88nY09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee18b976-99dd-4da9-3e2a-08ddefaa219d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 14:06:54.5365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YvZGVHfD8UtW4I1EgGgEJG+9AMW2kz3MRRFiabTMxHG8DFHx842aDRngpi6UgJ2/l06xTswflrQbXEIpv1lmcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7978
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

Right now the GSP boot code is very incomplete and limited to running
FRTS, so having it in `Gpu::new` is not a big constraint.

However, this will change as we add more steps of the GSP boot process,
and not all GPU families follow the same procedure, so having these
steps in a dedicated method is the logical construct.

Relatedly, booting the GSP typically happens only once in the GPU reset
cycle. Most of the data created to complete this step (notably firmware
loaded from user-space) is needed only temporarily and can be discarded
once the GSP is booted; it then makes all the more sense to store these
as local variables of a dedicated method , instead of inside the `Gpu`
structure where they as kept as long as the GPU is bound, using dozens
of megabytes of host memory.

Thus, introduce a `start_gsp` static method on the `Gpu` struct, which
is called by `Gpu::new` to initialize the GSP and obtain its runtime
data. The GSP runtime data is currently an empty placeholder, but this
will change in a subsequent patch.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 47 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index a0878ecdc18bc9e9d975b9ab9c85dd7ab9c3d995..cb991c7faef5523459367f3b9a7fd9cc29671b98 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -172,18 +172,18 @@ pub(crate) struct Gpu {
     /// System memory page required for flushing all pending GPU-side memory writes done through
     /// PCIE into system memory, via sysmembar (A GPU-initiated HW memory-barrier operation).
     sysmem_flush: SysmemFlush,
+    gsp_falcon: Falcon<Gsp>,
+    sec2_falcon: Falcon<Sec2>,
+    gsp: (),
 }
 
 impl Gpu {
     /// Helper function to load and run the FWSEC-FRTS firmware and confirm that it has properly
     /// created the WPR2 region.
-    ///
-    /// TODO: this needs to be moved into a larger type responsible for booting the whole GSP
-    /// (`GspBooter`?).
     fn run_fwsec_frts(
         dev: &device::Device<device::Bound>,
-        falcon: &Falcon<Gsp>,
         bar: &Bar0,
+        falcon: &Falcon<Gsp>,
         bios: &Vbios,
         fb_layout: &FbLayout,
     ) -> Result<()> {
@@ -254,6 +254,32 @@ fn run_fwsec_frts(
         }
     }
 
+    /// Attempt to start the GSP.
+    ///
+    /// This is a GPU-dependent and complex procedure that involves loading firmware files from
+    /// user-space, patching them with signatures, and building firmware-specific intricate data
+    /// structures that the GSP will use at runtime.
+    ///
+    /// Upon return, the GSP is up and running, and its runtime object given as return value.
+    pub(crate) fn start_gsp(
+        pdev: &pci::Device<device::Bound>,
+        bar: &Bar0,
+        chipset: Chipset,
+        gsp_falcon: &Falcon<Gsp>,
+        _sec2_falcon: &Falcon<Sec2>,
+    ) -> Result<()> {
+        let dev = pdev.as_ref();
+
+        let bios = Vbios::new(dev, bar)?;
+
+        let fb_layout = FbLayout::new(chipset, bar)?;
+        dev_dbg!(dev, "{:#x?}\n", fb_layout);
+
+        Self::run_fwsec_frts(dev, bar, gsp_falcon, &bios, &fb_layout)?;
+
+        Ok(())
+    }
+
     pub(crate) fn new(
         pdev: &pci::Device<device::Bound>,
         devres_bar: Arc<Devres<Bar0>>,
@@ -284,20 +310,19 @@ pub(crate) fn new(
         )?;
         gsp_falcon.clear_swgen0_intr(bar);
 
-        let _sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, bar, true)?;
+        let sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, bar, true)?;
 
-        let fb_layout = FbLayout::new(spec.chipset, bar)?;
-        dev_dbg!(pdev.as_ref(), "{:#x?}\n", fb_layout);
-
-        let bios = Vbios::new(pdev.as_ref(), bar)?;
-
-        Self::run_fwsec_frts(pdev.as_ref(), &gsp_falcon, bar, &bios, &fb_layout)?;
+        #[allow(clippy::let_unit_value)]
+        let gsp = Self::start_gsp(pdev, bar, spec.chipset, &gsp_falcon, &sec2_falcon)?;
 
         Ok(pin_init!(Self {
             spec,
             bar: devres_bar,
             fw,
             sysmem_flush,
+            gsp_falcon,
+            sec2_falcon,
+            gsp,
         }))
     }
 

-- 
2.51.0

