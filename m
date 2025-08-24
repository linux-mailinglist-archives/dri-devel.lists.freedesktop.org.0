Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B78A1B33046
	for <lists+dri-devel@lfdr.de>; Sun, 24 Aug 2025 16:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D2510E153;
	Sun, 24 Aug 2025 14:00:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mwS3bSNU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B1E910E153;
 Sun, 24 Aug 2025 14:00:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QspmWnebKVeyfWspZqVcbIMeNqedlzXsQBG1js4USihSyWesl8S7BcPaTIxZUjAKV0bSnSTpMOVBUafmw1gYOpfqVdVP3/GoJJx5S6zNAYEgNNeMEeHJHC9tSGQM9Q7QPgZ5FNMTF86QQnpIycbeUtq/KogklFFWExTffSJiE4OsJE0Ghdrwejcg1QLmkhbplw1Hah+KeM7F2b/E84jUrfHt5seSrs2zq4qZo7hPx3NZafj6fCJNnOg2ZmkKlG0+XYK37k9Lv8q3PWfZAAq1v2S6kAdZy6BSqH5KyGs6T8QS559zjssB2XRb/fGULuNkMzVwyqmC3+Bk275eEX/LEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F0yr4XwEbhH8NJ6sip2AmKMhogcy6jq/VjluKbXVpOc=;
 b=WeOSgOIMIJAmudvNIZoIe1DdgqAOQM3tXA1HXL7wuaZNMr3+L1WZzL68uamGTLb6rQvPt6G4kxPajZXZqPqGVWJ3aW9NsKtCQitXCoYBlvLu24WW2aC/Q/tG19ez7EZLFquJk0nqdU1RZ8nSZ/805Ceg9+34gzLqnQ106vrYDDiiz4ZXX5dtxw1n5oEa1ZSoNFrreI+WtxdCiSOlaI/KdZJ9xCXw+c8lWlYvdWzM7bw7g4u54NIxDBvVRww1xwhv3IhgrgTGQqY85L3SS8yolEO1gNXbItFKUAtX6SXffdjn9TqUECeYBjgY8I0VkLbREYEWqqEebLWLbXV+fGbcyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F0yr4XwEbhH8NJ6sip2AmKMhogcy6jq/VjluKbXVpOc=;
 b=mwS3bSNUrkXYGWCLmgfKzLtrqB6PMu2Rj2LAUPu67ImBtTh0cF4Sf6rJA090Q3frRiXpsgSncb+WvNqKL/ETBFC58Pn0PmZ1ONOWWS6TvhyAop9kvd7HjpDW0TDADvJXSJA1q8Lk9HtX4gU7NmERVMV0SgGGBA8MyyjenfkXXo04Z5ENpI5SFD6fDjBifojU/Do9cnuJptMynctqtSWM1ikhJn1AVRQF/XzGnzeRS8qcpUS9A+7DoSUBDVmphHqhRY/tBOyqOUammHsh3wORIlVTnxeTvAMFtIJ+8ECEHrgGVW2u4klrqLOJqYrUKALIqFRjkrmYW4VmlUgv60jZ0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH0PR12MB7814.namprd12.prod.outlook.com (2603:10b6:510:288::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Sun, 24 Aug
 2025 14:00:07 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9052.017; Sun, 24 Aug 2025
 14:00:07 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: [PATCH 1/2] nova-core: Add a library for bitfields in Rust structs
Date: Sun, 24 Aug 2025 09:59:52 -0400
Message-Id: <20250824135954.2243774-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0633.namprd03.prod.outlook.com
 (2603:10b6:408:13b::8) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH0PR12MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: 3517e26a-b042-4769-d93b-08dde3168879
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RG45bi9GUUtkS0duZmU0Y1hCU2FYT2gyaVFwbkNjbUY5YXV0b3QxZVpKOVZR?=
 =?utf-8?B?UStrL1RwOUsyV25FTFFCR280cGVLOUpXYVR0a2pEeVNUSXNVelNhMzhRZkNo?=
 =?utf-8?B?MFpZbVVhRUlTbXRISkQxS1M2eXdoeUtzamNYeFEvL2p4MldLdTJHZ0N6WkFO?=
 =?utf-8?B?alhRSDNjb2FlYlBMUTUzeG5KUDlDYXZwTXRNdFhzbUQ3T3UxNHc1UUljNUQ0?=
 =?utf-8?B?SisvcGJ2eERXNXJTYjRKWEd5eHZneFhvVys5cDVGdnY2VEVnbE93ZWZPUVNs?=
 =?utf-8?B?RlNGMDMzZ1oyK3lUbkFncjF1OGlYRmpPV0ZGNGF3OXZ2MzZSSUFaZWpOQVJT?=
 =?utf-8?B?S2twU2JRZjdjZVR5MlZycEFGK0J1VlBpb01jWjlQaVgvZUgvSHUyTHozQTAr?=
 =?utf-8?B?ZkZ3QmJmelhEZklXQUMzRUErZzh3YW9kRXpkUnZWdUVSbFhuWitwN3JGUnBX?=
 =?utf-8?B?RUUrUzFwNnVrZlVYNVhabjdJMVhwbnJNS2Nuekc2RUxpSk5VeHpVWWtnZXVF?=
 =?utf-8?B?Qk5ZYldyc1FCYzRyVUZMSFBuM1N2ZkEvLzE5WkJmMXdsVnBEay9mdTJ3RGRK?=
 =?utf-8?B?bGhNVSs1QUMxbHdOeWJ4NWlqMnBKNGxyelBQL0ZmY2kxWUlzaW5UWE9qNUpl?=
 =?utf-8?B?TlJ3VUhyQ0o2aWcyQU5qRE94a3hTT3gxVFpNSDZvcVpiL3U5dS9UZWNaSUxB?=
 =?utf-8?B?M1FsWG5MUmFob3krUUdLOFcrZXBTTUJ2MFAwcDgyT1hFSkdCVDh6anF4dFZv?=
 =?utf-8?B?eE96cndSQzM3dVJFZFhkTmlxalVIYXRGSS9PT0REWW5FZnlTQ2hsdEt6K3NB?=
 =?utf-8?B?RFovMmNJbExJZXU2cmt5NzF6WVFLR2t1RmRTZUFjWG5saXdEQUhWcnFaMWQz?=
 =?utf-8?B?S3VuT3FiYmxpaStXSmcrZGV3T3RCelNIOGtvOFdVZHkzTWJsenN3Z0U1Q1VY?=
 =?utf-8?B?QStZUjdub2ZTR1V0b0RjRTdnQ0NoWlN5VDNBYlp2UTI5K253bDlVeVdXZ2hM?=
 =?utf-8?B?MVF3cHhmR21kVzRpTXo2Z2U3bEdFaUFnbjBCaU43czlKOFZESEMycWNNZWhq?=
 =?utf-8?B?U05ib2dqc3I2OEk5T1c4Rk5adnF6S05kdFdyNDZsZ0lmQlpaVXp3SXVkaUgv?=
 =?utf-8?B?M1hsZExNc1Z5WEZ6V2lJcmhMQ21oSVZuMHdNWWVVc0xJcCtxckR6cVZ2ZUcy?=
 =?utf-8?B?Wm1QL1VQN3pXRlU4K0NUWWhkd1g5d3ZzWDhGa0VoQVR0dFptME0wQXR4MVBK?=
 =?utf-8?B?N0tMdjBWSWdYWEVhem1SVEsyRmNCUXlicTJZL0FtTXJYOEhGM1RIa2V6aTVV?=
 =?utf-8?B?bmNJY1lxKytnK1E0by94SU1LVWZrMEh1WXRCcnd4U1F6UmFMQmt5NHNUTm5W?=
 =?utf-8?B?blltRmVJOE95YzVhS0xqWkw0QU55aERVQUpmZStLcXJTeTNxN2NVVFJ3SEdK?=
 =?utf-8?B?bkRHdXVnck9XclFqd1JRQ0NVOXhlNk5XK2dlV1VaYnp1eGI2Znc5S2wvVUJq?=
 =?utf-8?B?eHdvREVqOGZNM3BFWHhGY3ZxMlBrVG9VSkxkWlVoQUM1QTJmc0VyNFJHQlE2?=
 =?utf-8?B?d25KajMvQkVvbVJIY3JpRGpzZk9rUERJdGQ5OTJYQ0RTNXJSTXo0OUhvZFhX?=
 =?utf-8?B?SHIrR3F1b3pmTnhIS2RvdEw0ejQwR1JwVzJBTkMvb3FsaXdQYmtVOXNoUnlv?=
 =?utf-8?B?aHY5WnhnRGFwWW83eEdES3AwT1dtMzhIaExWVU9CUmIrNVV3NDVDN2R1dGhE?=
 =?utf-8?B?VDA5QzgzblNYeEQ0SHdNOENtVUpCNFNaSWJKbXdxTUhxY2dLQW0wWE82UktS?=
 =?utf-8?B?WllZd2RkbHExTFlIVWgzT0x6VTUvRWNqVGZsbWI1REhmTW9kc1JtdmVCZDYw?=
 =?utf-8?B?MVY2YTZDeE9aNDZQbmN6enRIdk0vdUpaaFkrOEVBNm5QZzBicjlERFV3K0kv?=
 =?utf-8?Q?KatIkm5471a8tKWoRMJx0/4qfWC4BaUn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVBqK29RdGd4M1M5NHNhMU5uczhldCtsTzQvYm0vc1dOQ0hvaFEycXhXTVRy?=
 =?utf-8?B?dzc5aUlJdlg3bnAwM1d3dEt5NDZMNERsNGxNcGxpRkgweTNRQjg4aFFLYUl4?=
 =?utf-8?B?UzZ5NXVQNmlKZlhGSWpzeXpqbUdtTy9TcEVSb0wzLzFCYTNCZjFTdHp4anN3?=
 =?utf-8?B?eVRnUFIzVXRyNnIrVlIwczJrdEFYTWNWU2JLdmxwdU04Sm0wNUpXMmpVUlNK?=
 =?utf-8?B?bWdhNTNzM1QrVEZYNGYzdkl6Ny9BODAzRGRaWExMbWlvenc5NGlsK3B4ZFgw?=
 =?utf-8?B?ZXVHUmYvR0Z4NzBWL1RGTlp6NVVFZ0xCdXpyK0xuQ3VNZnZjRlVFbHhZbmhE?=
 =?utf-8?B?dEVUQ2RDdHY0cjBoMmVhbjVQVGcvd3dGeWEwdWtZS3greC94T0paQVRtZG5n?=
 =?utf-8?B?RncvN3BqbTVLd0RxVHlST2U3YlFWcE1sMFF6RkZzeW53N2syd2dRdC9rVTdD?=
 =?utf-8?B?MCt1dE5Rdk9VT3ZWdlgxQ1ZuUTBYWUJYc01TZkJTSlE3M0c3emFRRTlvY0ps?=
 =?utf-8?B?dXl2QXBMdEZKSktndE85Y0dMMlBDSTAybXBCV3UxU3BJV0tCeXpTKytwZHhi?=
 =?utf-8?B?NU4xR3Z1SDFKYXh5ZmN6RGF1elRLdjNEQ1g4bUlsTVNWOTFmajFrTXBiUmFn?=
 =?utf-8?B?MFEzQlNHVklvMCttcmUycnBJZEVjalY4VzVKQjFpRFdCRVZONWNOdUpyd1gy?=
 =?utf-8?B?R0JoYS8vRGdDNXlWdXBqSXcxdWp1ZllhSlZHekdlSWNBYmd5dEk1TlRQYjI3?=
 =?utf-8?B?NFBRQ0pIb0psZkFsUTlSOXJUNTJEaCtEOFFCM1dEUUJRMkdjOTVqQUZqcFZL?=
 =?utf-8?B?bXNRT3JEaWpodTNUUTFsYWVLMzBJalpWc2h0Z2FxSllzM2tkVXFsOTZiRHZp?=
 =?utf-8?B?bXhHVVVZTHJkNkt2TVFjT1VncFJBMlh2R0pYN3JTZ3p6b0djR1MwN1ZVMlJw?=
 =?utf-8?B?bzJVU3ZyK3YzNm1pWkRhSUVOWitldTh2YW1GdWU5RllsakxsN0c0TWthODFM?=
 =?utf-8?B?cWd2N2Q3NC9uTElBYUxDbEZ3eW5ueTVMSWd2RkVabjN3bDRUQTBuaDFRcVVJ?=
 =?utf-8?B?ODBpdFFkRGxzd3ZHV1V4Y2xSUUhvNkRQRnJHOVl2d0V2cUloS25XSDk2YmZH?=
 =?utf-8?B?cDUvRWRYNFlGSFNqM2p6b29ndy9oSE9xODg1ZktmRnF5SnVhODJpdFVpNm1h?=
 =?utf-8?B?NkxqelNZc09Za1ZtZlh6STZSRmE1QStRUDJKSUc5NThXVXoreFN1dHpXdjBv?=
 =?utf-8?B?QUVKRHhjaEdCbENlVS81VXYwcFZHczZxT05KQS9YTDZYcWR2VzR1Z3FDTDJV?=
 =?utf-8?B?cDJZanZHRVplVEczbjlYQTQ0TXpaUHFIVHkzcTg4M0tEbGhoVXJEUUFobTBh?=
 =?utf-8?B?eFViTjJrUEo1WTN6V0hOVEMwN3IyYmtvbWlsVlluYXRzenlhcGw0bjU3WGNT?=
 =?utf-8?B?L0gzbTQwNE5qcGhWZHFtclFKTzJOV1JiOHlKczhRTHA0VGt2K05tOWE2T3ph?=
 =?utf-8?B?aFB6TW9idzNhZmxiVkd1enFMWTFTQXQvUyt0MkR6cSttUTZLbWgyc2J3MmE5?=
 =?utf-8?B?MEcwKzdTU0VFRS90L3NrVTJIbDJOSnRZaEdDeDFjd3lPQ09yeFFmUVJoVENs?=
 =?utf-8?B?djh3R1BEU1hPVjdpT3ppV3I0RE1zOVNlN1AwRXhvYmc5a0p4elNEMWZBVGxx?=
 =?utf-8?B?Nlg5cTBYeUNENXNjMk1MVjQwc0hsdHR6bDl1SG1Sdjdxd2VDVVJVaUNyLzky?=
 =?utf-8?B?Y0xZc0pGOVJrUFFUTFo0OWZuQW9uQ3RYcFBmT3o1ekdvY2F4Mm5nRDN2bkxa?=
 =?utf-8?B?c05kTjk3UUp2WHZKUUErSzQ0NThWUlRrSE81UkUrTkwvQVhnQ1VtcXNsUmgv?=
 =?utf-8?B?eEU5S0xMRmJrTmN3WDhYRXkzNzJ1cUhlQXU1V3B5b3lMbWNyUkUvWW9QYVNs?=
 =?utf-8?B?c3lvZWVVWGFrcS81VzZ6OU53ZHlZRytZcUN1N3VQMzBSNlJCc3R2MEhNVnJ3?=
 =?utf-8?B?SHlRcGlKUm1KbDdCVUpZVnVXUG5Rc1EyOUJ2N0J0d0VSNE1KZkF0cE4zRXFX?=
 =?utf-8?B?RHlxcjNhOUxLQ1VRRW9nVUdrZkR0bTFZNFRrQ1pSZUlISnNJOEtoT0ovY2cr?=
 =?utf-8?Q?bChauwdTmF98EaS7Wk4g2DO1n?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3517e26a-b042-4769-d93b-08dde3168879
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2025 14:00:07.6611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: azi6nrojqCVIu2wEQ6LtwRzWNB98MNAVK/Y2B56rcbBF7p7Ns1hvkOWEZV4Y1GVeOpFiTBNAW9wON0qJS4yCPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7814
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

Add a minimal bitfield library for defining in Rust structures (called
bitstruct), similar in concept to bit fields in C structs. This will be used
for defining page table entries and other structures in nova-core.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/bitstruct.rs | 149 +++++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs |   1 +
 2 files changed, 150 insertions(+)
 create mode 100644 drivers/gpu/nova-core/bitstruct.rs

diff --git a/drivers/gpu/nova-core/bitstruct.rs b/drivers/gpu/nova-core/bitstruct.rs
new file mode 100644
index 000000000000..661a75da0a9c
--- /dev/null
+++ b/drivers/gpu/nova-core/bitstruct.rs
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// bitstruct.rs — C-style library for bitfield-packed Rust structures
+//
+// A library that provides support for defining bit fields in Rust
+// structures to circumvent lack of native language support for this.
+//
+// Similar usage syntax to the register! macro.
+
+use kernel::prelude::*;
+
+/// Macro for defining bitfield-packed structures in Rust.
+/// The size of the underlying storage type is specified with #[repr(TYPE)].
+///
+/// # Example (just for illustration)
+/// ```rust
+/// bitstruct! {
+///     #[repr(u64)]
+///     pub struct PageTableEntry {
+///         0:0       present     as bool,
+///         1:1       writable    as bool,
+///         11:9      available   as u8,
+///         51:12     pfn         as u64,
+///         62:52     available2  as u16,
+///         63:63     nx          as bool,
+///     }
+/// }
+/// ```
+///
+/// This generates a struct with methods:
+/// - Constructor: `default()` sets all bits to zero.
+/// - Field accessors: `present()`, `pfn()`, etc.
+/// - Field setters: `set_present()`, `set_pfn()`, etc.
+/// - Builder methods: `with_present()`, `with_pfn()`, etc.
+/// - Raw conversion: `from_raw()`, `into_raw()`
+#[allow(unused_macros)]
+macro_rules! bitstruct {
+    (
+        #[repr($storage:ty)]
+        $vis:vis struct $name:ident {
+            $(
+                $hi:literal : $lo:literal $field:ident as $field_type:tt
+            ),* $(,)?
+        }
+    ) => {
+        #[repr(transparent)]
+        #[derive(Copy, Clone, Default)]
+        $vis struct $name($storage);
+
+        impl $name {
+            /// Create from raw value
+            #[inline(always)]
+            $vis const fn from_raw(val: $storage) -> Self {
+                Self(val)
+            }
+
+            /// Get raw value
+            #[inline(always)]
+            $vis const fn into_raw(self) -> $storage {
+                self.0
+            }
+        }
+
+        impl core::fmt::Debug for $name {
+            fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+                write!(f, "{}({:#x})", stringify!($name), self.0)
+            }
+        }
+
+        // Generate all field methods
+        $(
+            bitstruct_field_impl!($vis, $name, $storage, $hi, $lo, $field as $field_type);
+        )*
+    };
+}
+
+/// Helper to calculate mask for bit fields
+#[allow(unused_macros)]
+macro_rules! bitstruct_mask {
+    ($hi:literal, $lo:literal, $storage:ty) => {{
+        let width = ($hi - $lo + 1) as usize;
+        let storage_bits = 8 * core::mem::size_of::<$storage>();
+        if width >= storage_bits {
+            <$storage>::MAX
+        } else {
+            ((1 as $storage) << width) - 1
+        }
+    }};
+}
+
+#[allow(unused_macros)]
+macro_rules! bitstruct_field_impl {
+    ($vis:vis, $struct_name:ident, $storage:ty, $hi:literal, $lo:literal, $field:ident as $field_type:tt) => {
+        impl $struct_name {
+            #[inline(always)]
+            $vis const fn $field(&self) -> $field_type {
+                let field_val = (self.0 >> $lo) & bitstruct_mask!($hi, $lo, $storage);
+                bitstruct_cast_value!(field_val, $field_type)
+            }
+        }
+        bitstruct_make_setters!($vis, $struct_name, $storage, $hi, $lo, $field, $field_type);
+    };
+}
+
+/// Helper macro to convert extracted value to target type
+///
+/// Special handling for bool types is required because the `as` keyword
+/// cannot be used to convert to bool in Rust. For bool fields, we check
+/// if the extracted value is non-zero. For all other types, we use the
+/// standard `as` conversion.
+#[allow(unused_macros)]
+macro_rules! bitstruct_cast_value {
+    ($field_val:expr, bool) => {
+        $field_val != 0
+    };
+    ($field_val:expr, $field_type:tt) => {
+        $field_val as $field_type
+    };
+}
+
+#[allow(unused_macros)]
+macro_rules! bitstruct_write_bits {
+    ($raw:expr, $hi:literal, $lo:literal, $val:expr, $storage:ty) => {{
+        let mask = bitstruct_mask!($hi, $lo, $storage);
+        ($raw & !(mask << $lo)) | ((($val as $storage) & mask) << $lo)
+    }};
+}
+
+#[allow(unused_macros)]
+macro_rules! bitstruct_make_setters {
+    ($vis:vis, $struct_name:ident, $storage:ty, $hi:literal, $lo:literal, $field:ident, $field_type:tt) => {
+        ::kernel::macros::paste! {
+            impl $struct_name {
+                #[inline(always)]
+                #[allow(dead_code)]
+                $vis fn [<set_ $field>](&mut self, val: $field_type) {
+                    self.0 = bitstruct_write_bits!(self.0, $hi, $lo, val, $storage);
+                }
+
+                #[inline(always)]
+                #[allow(dead_code)]
+                $vis const fn [<with_ $field>](mut self, val: $field_type) -> Self {
+                    self.0 = bitstruct_write_bits!(self.0, $hi, $lo, val, $storage);
+                    self
+                }
+            }
+        }
+    };
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index cb2bbb30cba1..54505cad4a73 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -2,6 +2,7 @@
 
 //! Nova Core GPU Driver
 
+mod bitstruct;
 mod dma;
 mod driver;
 mod falcon;
-- 
2.34.1

