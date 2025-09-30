Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8993BAB6DD
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 06:55:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A824710E4BE;
	Tue, 30 Sep 2025 04:55:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JWeYTyRO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012010.outbound.protection.outlook.com [40.107.209.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6340210E277;
 Tue, 30 Sep 2025 04:55:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cWc8blRjUwfJp1AfuL4eFiwuuJUPS+iV49lYi/+VrAVC8hstBzVK8cZDU5EgzGMbAmibNQkwOM/YYdcNHd8YecSNQod3RgiV6U7hLQPBIUZjznl6RB5mBBbxjsOS51CVcqpRzPWVEBagz6V2HYTo1ttrF/3k62U4I/kQbiqdOl363VL9pRgmHXr85HZxLw9Hf7SkxmYOwKwC1r1BOM0NCRFQ+jMlrphnJNHNFmkl3+KZKYyG5bJiqingld8IITxmfGjAlcm5RvMq9LYC3GedpFxkYxQy8BINqJ9ajJ63VwaVUE2IgvVE6zYQKy7uZxWca7V0+s5WCAdGWDJUt3qoOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQm4az6Ie8VkSO/4xM9CzF7kvr1mKWIbtDzKc/wCu/4=;
 b=j0ZNUE4Bp0ccu9C/qmNNqhQS/0iGUYOJ6oMTVbx9OtTkpHx6iPKfXNwq8Vw3H1NknGxqmcjxhCSf7qUqnb8fr7slaRu5l7xVFjyPztEjRFr1iRQYZs2XX8tM2LBeBXWIWxi+ASGkCn7v61MRp+lirrLFIweeLPoLcwvXXuz9YSEg6bgOIy8emOSpP4EaXXs2TmCdipYTVgzHEWqAQdFys+OZ38nmHw4jT3HH/JyMpJ8POLApwJ1k/MNnD8ZsmMW+ywcP35qV00CTLbBWATjPi6cGdDgXIfHLYfMUapy2ECZW7edv/pme0q3LygFesvZt2aH45L5SCfS6wYgEIw0Lgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQm4az6Ie8VkSO/4xM9CzF7kvr1mKWIbtDzKc/wCu/4=;
 b=JWeYTyROgXjmtXazEM8e6m7cuJz20wi93B7Q5bVxqmhG8F2TkuRKkN+0iQXkTu0/sgRrBgCYioeWd3APcktlUdSb4UJDrR3xEj57YZqjpJpG74MuXX0mWF4z9a+tlV46+tkB/RNp+5hqSbo3QP092QH0j6jBDFOtmbQHRUau6XLyLdkLdj7HYdf2v06AgUs8z0dZ+aTO3JFUfu9/ZgiFu7SCFrKCiimkopNJ4McwIq9Hw8mqw4Th5RfI2dsf6GuhUVhAwZTD5jXpxjy6Tbbk5/8WvCrjZFtwSUNgh8OFLGCwRh+jnjJMX1+OPQYQk9Q18yai2m6cVuLbxPGxjXPqtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PPFACF832414.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bdf) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Tue, 30 Sep
 2025 04:55:16 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 04:55:16 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 30 Sep 2025 13:55:00 +0900
Subject: [PATCH RFC] gpu: nova-core: use the TryFrom/Into derive macros
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-nova-tryfrom-v1-1-0cc1bb507047@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAKNi22gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDS2MD3bz8skTdkqLKtKL8XN1Eo+S0REMzy5S0FCMloJaCotS0zAqwcdG
 xtbUAL8mILF4AAAA=
X-Change-ID: 20250930-nova-tryfrom-a2cfa169dfd2
To: Miguel Ojeda <ojeda@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0072.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PPFACF832414:EE_
X-MS-Office365-Filtering-Correlation-Id: f0b44ec5-9412-4e8d-6881-08ddffdd8c4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SlJRNmpod1RzNVJCSEQ3WHVVWlBTeTFZTTduOGZ3b3hDbVRLK3hsYjBTb09w?=
 =?utf-8?B?RkplWUVUcm9ISUpqR2wxMXBWNzdNaWNwVWdsd0xJVXhtZm9LZWlQQ3A4SGZV?=
 =?utf-8?B?bEwvRnE2TDJ0YjVucW91aEJZYjBtRW5FNkxaNlY0ZXpKQ2hUTjA4Wk1kSHpv?=
 =?utf-8?B?L1I5TGVvNi9pL1pnQm9SV2FGQzdUeG9kVkl1R1R0b1pOdnREZGpTRGVFWGE0?=
 =?utf-8?B?Z3lyNm5NNjl6aDg4Z1lpSWpkaElQR2dpRHZjK1dWeTh0dXIxK1k0UkRpVVpk?=
 =?utf-8?B?QVA3MFlkTXRCMGJxQzhkaWl3MXpiUitMc2xlU1hiSXZGZE5IdTdIUW9tNDJG?=
 =?utf-8?B?V2xNcXlYTlFDTHYwaStUUDl1eXNCMzJMZVpOQkluUE91NWNSYk5oZThMNTd5?=
 =?utf-8?B?aUZYS0pob2ZpYi9tSFJ3VTNHd05LOWpHV1B3WTFsUWVud25WVUFsVFVSbjA5?=
 =?utf-8?B?WGxrbUZ3Qll6ejlJQlZaY3hFcDlKZjdrVWxlODJPNXJrRGY3b0k1R2hFa2s5?=
 =?utf-8?B?dVpLM3BOdG9JcXlqRDB1RTBCNmtONjhuUnJPRTBjK0lZQlNFemNZWUI2V0lW?=
 =?utf-8?B?bWtBOWNHclVHS2YrL2Y3UnhlaXpOS0d6Ly9pUU9Xb0dlOU1qanlBQ1VvRFlj?=
 =?utf-8?B?bmJqTmU1Q2JtRStNcmRxYjZoSlZpSnQ3UmdKWlQvQWhaelJXZkVVeDZhbHhC?=
 =?utf-8?B?cGFwQTRCS21rUFNNYTlrUlhFbVZJeWNkR0hoMXk4YU9nQUl1K01LQU1lcmVP?=
 =?utf-8?B?SUFxU1k0U3hRaUpHU1oxTUhVM2FTV0ZsRzVsVFBiWTFsUWg4VkZtc3JBckRI?=
 =?utf-8?B?Q3lGZ0hZN2JxUFhZeUFQckx6TVhQY2NubTFtYnoxbVFzS3BDQ1hUeEl4TG9E?=
 =?utf-8?B?ck1vMGlJdmpaZmE0cFdnekl1N1dRUEpRSk9BMEQ2Z2k5dnFyM3pCWXBYRFhM?=
 =?utf-8?B?aU9ydXNvcXhyaUxvZXdwYlNxcWVqWE03RG42TXdFK0Yrdm1iNmhyeGswNll0?=
 =?utf-8?B?eVExTFRRYjFNQ3FjK1VJc0dJWkxHdkhiYlFTdlVHNlVod1Jic2NIei80eUNW?=
 =?utf-8?B?MDg5bU11eHViejh3cllTVmFqS1h5bWhIOWp1U3kycHc4Yis4enRIM0JFdWlm?=
 =?utf-8?B?QXBGZ24rUUk2bVNPd2J1N2dXNVZaTEpjNmNFczd0SDJkbzhlbkp0ZGkrdGtn?=
 =?utf-8?B?UkcxUUxVcU80UlNmZmUxVTZhc1ZSdmpWRUk5ZFU5aGF3Q1lzRis0TXhQUDNW?=
 =?utf-8?B?dFJMQlI3UVFQdUZrZmMvMGJlS1ROaE1wWitObFllMXZZNjJKZUlYSlhaV1p4?=
 =?utf-8?B?aCtTR3g4dDM5TzB4MXNPbjd4YUIyaDE5NGpDQmhXMDFESTNmVEUzeXRRMGg5?=
 =?utf-8?B?U0IvNzZZTDdIamJnQ1pNdytBaEE5Z25KNGhicWR2VENrV2pVTVRIb0QzdGFH?=
 =?utf-8?B?TnllZ3VXRUNQcEt2cEF0QjdtZm01SEJkWWdVaFBrSHUwU3NTUmtMUzRPNXNP?=
 =?utf-8?B?NVV0S3l5VDNwQTArWklPQmxJaW1rRTA2M1hCeHl2SWM5N0daaEh6THNkVWlO?=
 =?utf-8?B?SHlqNTc0Tjc4ZWJBMC9Rd1F3bmZUK3Zya3BXeFFJY21NRWhRYkEwZUZ5bS9u?=
 =?utf-8?B?a1hBS2FrM054N3BFV1U5OW5va0pTa0ZZbVhmZ05ub0IrTXZOVXVLVTVNdVBh?=
 =?utf-8?B?VGtzVkVKVUFmYjNkbCtFcDF0U1hmamtOS3V0TTlOTjJ4ZW12VTg2ekVIQ2NE?=
 =?utf-8?B?Z0JKb0JzSWx3c0JrVFZxS3FWcE0raE9ENk5oeE8wSGRramhzUnFiRHJWKzND?=
 =?utf-8?B?cytHYWZFdk1QNzZYK3AvMTF1NGw0YVBZb2h1OXJBL1YxQ3gvTDdKN1duMDdL?=
 =?utf-8?B?cXFBYm1QOUZpcXFQSGZWZXo2bjVzZ0w1NUprMUYzNmhUNDdyUGFqTTF2cDRx?=
 =?utf-8?B?Vm5Cd3lMYzM2VytIbmxMQ2hZa01vMzFqRER4S0dQSE1KMFNWK2tnR2s3ZXBj?=
 =?utf-8?B?a1ZBRW5namNrbmNiQUtjOGVhQ2Q0cDUvMytDUUd2RUIyR3FxZ0EybjVZeXJy?=
 =?utf-8?Q?bIJjEg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEUya2hkK0tXdE5jRDhHN3pVcDl2R25jOWhxZnBSUzg0M1JoeEhzRmw0NldP?=
 =?utf-8?B?V3NET1RnVVc2STJScjh3NVMwNnFQTlhEM0Z6Vyt1NC9HVEg1UDBGbmZ3SFhQ?=
 =?utf-8?B?alBCQnZVcEoxNm9wZmF6T0U4bGJXRTM5ZzhrTTJPSWxuTU5OUW85bzg5N3dE?=
 =?utf-8?B?T3cydElVSHJteHBxWVhKT0tsRzRPdVFMNWFwYnZ2UjFOeVdSSlI2RmZPd29u?=
 =?utf-8?B?Y1U2STByRW04WENwT2YwMlI5cGJkeitBejk4cWRHcDB1N0VlR2Z5dGlOQUhP?=
 =?utf-8?B?SC9Cd1U3NnJhU2pHblJsWTNGb2tibnR0c0t3NWRSa3NJcDlNby9FMWFrdHRU?=
 =?utf-8?B?TTFmdHdnUjY3eWgrQk1JZmdJbkZxdjlUOHR6MVlTK3lTMGhtRjdhQ3V4Z0Q4?=
 =?utf-8?B?TnlsUm0xN2NUeDVWSjU2V1NZZ2dxcldwVDNrS3NYRUVNQ25vcExyWVhuSGV0?=
 =?utf-8?B?NEtQTFZhdlNDMElBYVJIQVREU05ibDdMQnhDUDk1V1JhWXhBTTlLQVQ5Umll?=
 =?utf-8?B?V0xKUHJxZm1Zb2hFUkgvLzVhaVg2RGkvRHU3eTdrVTI3dTNUL1phWWMxMTkw?=
 =?utf-8?B?QXhWMGhDK2V1Z1RRaWRVQ2d6OTIwWUVYd1hqM0FZTUhhSnUrYlpQREZMUElH?=
 =?utf-8?B?bWJ3OTArOTZmK0wwdi90dmplTW1SRzZPZ2s3RzVqZWlBWDRnM015NWVVdm83?=
 =?utf-8?B?K1grTDlOb1N4Y2JlaUZManc4L2Z5a0lkVXU0NXBMa1AzUVRKTU9FWng4Nm4v?=
 =?utf-8?B?ZHZ5L2NBdjRBS3ZJVStGQjlndU1OblNSS2d0aElVcEtvYkFYUGcvYVJlOUE0?=
 =?utf-8?B?bnYyQkxXZjlCSDdzZEIxTVgvOXBsYXVSZVRKVDZja1NTZkRzc094UWtqOSt0?=
 =?utf-8?B?SUFsQmpyWFdpZWdVWXA2a1JuQlhKZG5kaHZjQTkxRm1IV0VpOWhDYVZHT2ZS?=
 =?utf-8?B?ckZaQ29pLytZQ0J1QnppN2hZWlRBUTJqSDhEcmFuUks4c2xyRjRWUHo2TmYr?=
 =?utf-8?B?ems4ZnU1VUpwbFBOTFo4cUdoZ1pQYU1wbXdUYVdQV1hmTkhuM1B0bW83c0li?=
 =?utf-8?B?U01LbVJHVlllMUswQW1rR1U4d21HRmo4VkJDT2R3dk9RNnliOGViK2dabVlj?=
 =?utf-8?B?VnVUSWlXMWRyZjQ0RHZjMGh2Y3RlSTltQjkyQ0ZrSmxyM2ZoeXp5blJEZHEy?=
 =?utf-8?B?RjkzNkphcEpPRnpHZkJqQnNJbVJ5ZHdYdDBPN0JqazZUS21rNEtLVVBJcGJC?=
 =?utf-8?B?TFlJeUJROTgweVhlbG5VU0svck5LV0RBTzdYMWc4TTBQYkJwemN1UWh2K01O?=
 =?utf-8?B?cE1uTkt2NWVDZDdxU2U2UFRKSkZjK1FwQ0k3VjlnczRnaEJVQnhxYVFjeFRq?=
 =?utf-8?B?YXNLeXlydGFtWk5xdHpDajVEazFDRmZKeUhuSGhGVXA5Y0RjVldHVlBqNm1j?=
 =?utf-8?B?b2RwaXpES2FpQ1hZckd6ekNtWE9QWjBBREZjRmg5MzJDSFJiMzBLRnhTWVBG?=
 =?utf-8?B?dXVLYjJVRGx0dzVBYWNBMFplT3dZV3NReWR5d2lGU1hQSE9lQnZzVDlqTENS?=
 =?utf-8?B?ZzBlMWlEODJpYUN1ODNUMC9GOEZ5d3lydGt2a0I0SFo5MlJKeG9kTUd3Tys3?=
 =?utf-8?B?bXp4UFZVMVBjVkh6REZ5OWRYN2x3VER5ZGQrNEgvNFgxWDBydEJpdStCS01Y?=
 =?utf-8?B?NjNRdzVVMVkvS1d6eFBKbmtDd1ExdnJRS3lvWU96MXJBdzBjVlpLaUhyOXYw?=
 =?utf-8?B?aUtjYUdwZDRvYy8rNG1EOFUwdHlReDNEU2ZmK2I1ME5MdjlYUGptOVhNL2la?=
 =?utf-8?B?WEQrcTNWSmJWR2JOSW43emtteVMreEdVRTNyeFgwQlQ3Y0ZaL0xjN2YvQUxT?=
 =?utf-8?B?SDBDeXA4SE9sYWtIb3JacHBwZzNWZzV2L3JwTUZjWEFnZWVhV0lWYWQxWm9F?=
 =?utf-8?B?RWExZXBCVFpxOU1OUzQwUTdFOWVqakl4VTdEVkdIVmpsbG5Wa0lRbHhpMG45?=
 =?utf-8?B?a0drRHRYZmJwbFY2TE9LYXFJdEFIbCtMSW04NndPQ0MwRjh6S05FZFR3a1E5?=
 =?utf-8?B?ODZxcGh0RHlMbUQzd0Y4dlo4Mkp6MTltaUc3SDQvVWhwMWlpaC9ES1QzVUVh?=
 =?utf-8?B?ZEpmUUpwT1dkeklhajROR2ZEbENDYjRVK1Uybk9NVk9VQ3Y4WjF5SWhGeTc2?=
 =?utf-8?Q?4M3+EBdszz83Fs0vin+N7KXz3H79q/AYPIZ1XQOEQvOW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0b44ec5-9412-4e8d-6881-08ddffdd8c4c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 04:55:16.5221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x4KohyGT9jB+C+aNXVzr4IzhfYI83ZwiaP2xJvjFNrmItU2zd3oNx0xMkM65mnMSR+nLUbiaTaOZByAPLLBCHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFACF832414
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

Use the new Tryfrom and Into derive macros to replace the boilerplate
code used for conversion between register fields types and the primitive
type they are represented in.

This removes a lot of boilerplate, with the only exception being fields
encoded as booleans which still need manual implementations as there is
no `#[repr(bool)]`.

Cc: Jesung Yang <y.j3ms.n@gmail.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
As requested on [1], this is how these macros are used in Nova-core.
Note that it requires a tiny fix to the register! macro itself - I
haven't included it because things are still moving and I want to base
the fix on the state of -rc1. In any case, the content of this patch
will be identical.

The only case not covered by the macros is the one of types that can be
converted from/to booleans - but I think this one will be difficult to
handle so we probably need to rely on manual implementations until Rust
supports `#[repr(bool)]` or something.

[1] https://lore.kernel.org/rust-for-linux/CANiq72na_d6JQdyZ1S22mus3oom_jz93rpY+ubr4yOuvMY_fSA@mail.gmail.com/
---
 Documentation/gpu/nova/core/todo.rst |  21 -----
 drivers/gpu/nova-core/falcon.rs      | 151 ++++++-----------------------------
 drivers/gpu/nova-core/gpu.rs         |  33 ++------
 3 files changed, 31 insertions(+), 174 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index 091a2fb78c6b53037e902f015f504b8819281860..5d6caede2cd5ab9e5e3923770a7cb974b5826670 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -23,27 +23,6 @@ Enablement (Rust)
 Tasks that are not directly related to nova-core, but are preconditions in terms
 of required APIs.
 
-FromPrimitive API [FPRI]
-------------------------
-
-Sometimes the need arises to convert a number to a value of an enum or a
-structure.
-
-A good example from nova-core would be the ``Chipset`` enum type, which defines
-the value ``AD102``. When probing the GPU the value ``0x192`` can be read from a
-certain register indication the chipset AD102. Hence, the enum value ``AD102``
-should be derived from the number ``0x192``. Currently, nova-core uses a custom
-implementation (``Chipset::from_u32`` for this.
-
-Instead, it would be desirable to have something like the ``FromPrimitive``
-trait [1] from the num crate.
-
-Having this generalization also helps with implementing a generic macro that
-automatically generates the corresponding mappings between a value and a number.
-
-| Complexity: Beginner
-| Link: https://docs.rs/num/latest/num/trait.FromPrimitive.html
-
 Conversion from byte slices for types implementing FromBytes [TRSM]
 -------------------------------------------------------------------
 
diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 37e6298195e49a9a29e81226abe16cd410c9adbc..fdc8e512c3f3d4b426d708de17dec0ca522e40bc 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -6,6 +6,7 @@
 use hal::FalconHal;
 use kernel::device;
 use kernel::dma::DmaAddress;
+use kernel::macros::{Into, TryFrom};
 use kernel::prelude::*;
 use kernel::sync::aref::ARef;
 use kernel::time::Delta;
@@ -21,21 +22,10 @@
 mod hal;
 pub(crate) mod sec2;
 
-// TODO[FPRI]: Replace with `ToPrimitive`.
-macro_rules! impl_from_enum_to_u32 {
-    ($enum_type:ty) => {
-        impl From<$enum_type> for u32 {
-            fn from(value: $enum_type) -> Self {
-                value as u32
-            }
-        }
-    };
-}
-
 /// Revision number of a falcon core, used in the [`crate::regs::NV_PFALCON_FALCON_HWCFG1`]
 /// register.
 #[repr(u8)]
-#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
+#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, PartialOrd, Ord, TryFrom, Into)]
 pub(crate) enum FalconCoreRev {
     #[default]
     Rev1 = 1,
@@ -46,34 +36,11 @@ pub(crate) enum FalconCoreRev {
     Rev6 = 6,
     Rev7 = 7,
 }
-impl_from_enum_to_u32!(FalconCoreRev);
-
-// TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for FalconCoreRev {
-    type Error = Error;
-
-    fn try_from(value: u8) -> Result<Self> {
-        use FalconCoreRev::*;
-
-        let rev = match value {
-            1 => Rev1,
-            2 => Rev2,
-            3 => Rev3,
-            4 => Rev4,
-            5 => Rev5,
-            6 => Rev6,
-            7 => Rev7,
-            _ => return Err(EINVAL),
-        };
-
-        Ok(rev)
-    }
-}
 
 /// Revision subversion number of a falcon core, used in the
 /// [`crate::regs::NV_PFALCON_FALCON_HWCFG1`] register.
 #[repr(u8)]
-#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
+#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, PartialOrd, Ord, TryFrom, Into)]
 pub(crate) enum FalconCoreRevSubversion {
     #[default]
     Subversion0 = 0,
@@ -81,31 +48,11 @@ pub(crate) enum FalconCoreRevSubversion {
     Subversion2 = 2,
     Subversion3 = 3,
 }
-impl_from_enum_to_u32!(FalconCoreRevSubversion);
-
-// TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for FalconCoreRevSubversion {
-    type Error = Error;
-
-    fn try_from(value: u8) -> Result<Self> {
-        use FalconCoreRevSubversion::*;
-
-        let sub_version = match value & 0b11 {
-            0 => Subversion0,
-            1 => Subversion1,
-            2 => Subversion2,
-            3 => Subversion3,
-            _ => return Err(EINVAL),
-        };
-
-        Ok(sub_version)
-    }
-}
 
 /// Security model of a falcon core, used in the [`crate::regs::NV_PFALCON_FALCON_HWCFG1`]
 /// register.
 #[repr(u8)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, TryFrom, Into)]
 /// Security mode of the Falcon microprocessor.
 ///
 /// See `falcon.rst` for more details.
@@ -125,73 +72,27 @@ pub(crate) enum FalconSecurityModel {
     /// Also known as High-Secure, Privilege Level 3 or PL3.
     Heavy = 3,
 }
-impl_from_enum_to_u32!(FalconSecurityModel);
-
-// TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for FalconSecurityModel {
-    type Error = Error;
-
-    fn try_from(value: u8) -> Result<Self> {
-        use FalconSecurityModel::*;
-
-        let sec_model = match value {
-            0 => None,
-            2 => Light,
-            3 => Heavy,
-            _ => return Err(EINVAL),
-        };
-
-        Ok(sec_model)
-    }
-}
 
 /// Signing algorithm for a given firmware, used in the [`crate::regs::NV_PFALCON2_FALCON_MOD_SEL`]
 /// register. It is passed to the Falcon Boot ROM (BROM) as a parameter.
 #[repr(u8)]
-#[derive(Debug, Default, Copy, Clone, PartialEq, Eq)]
+#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, TryFrom, Into)]
 pub(crate) enum FalconModSelAlgo {
     /// AES.
-    #[expect(dead_code)]
     Aes = 0,
     /// RSA3K.
     #[default]
     Rsa3k = 1,
 }
-impl_from_enum_to_u32!(FalconModSelAlgo);
-
-// TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for FalconModSelAlgo {
-    type Error = Error;
-
-    fn try_from(value: u8) -> Result<Self> {
-        match value {
-            1 => Ok(FalconModSelAlgo::Rsa3k),
-            _ => Err(EINVAL),
-        }
-    }
-}
 
 /// Valid values for the `size` field of the [`crate::regs::NV_PFALCON_FALCON_DMATRFCMD`] register.
 #[repr(u8)]
-#[derive(Debug, Default, Copy, Clone, PartialEq, Eq)]
+#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, TryFrom, Into)]
 pub(crate) enum DmaTrfCmdSize {
     /// 256 bytes transfer.
     #[default]
     Size256B = 0x6,
 }
-impl_from_enum_to_u32!(DmaTrfCmdSize);
-
-// TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for DmaTrfCmdSize {
-    type Error = Error;
-
-    fn try_from(value: u8) -> Result<Self> {
-        match value {
-            0x6 => Ok(Self::Size256B),
-            _ => Err(EINVAL),
-        }
-    }
-}
 
 /// Currently active core on a dual falcon/riscv (Peregrine) controller.
 #[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
@@ -202,7 +103,15 @@ pub(crate) enum PeregrineCoreSelect {
     /// RISC-V core is active.
     Riscv = 1,
 }
-impl_from_enum_to_u32!(PeregrineCoreSelect);
+
+impl From<PeregrineCoreSelect> for bool {
+    fn from(value: PeregrineCoreSelect) -> Self {
+        match value {
+            PeregrineCoreSelect::Falcon => false,
+            PeregrineCoreSelect::Riscv => true,
+        }
+    }
+}
 
 impl From<bool> for PeregrineCoreSelect {
     fn from(value: bool) -> Self {
@@ -225,7 +134,8 @@ pub(crate) enum FalconMem {
 /// Defines the Framebuffer Interface (FBIF) aperture type.
 /// This determines the memory type for external memory access during a DMA transfer, which is
 /// performed by the Falcon's Framebuffer DMA (FBDMA) engine. See falcon.rst for more details.
-#[derive(Debug, Clone, Default)]
+#[repr(u8)]
+#[derive(Debug, Clone, Default, TryFrom, Into)]
 pub(crate) enum FalconFbifTarget {
     /// VRAM.
     #[default]
@@ -236,23 +146,6 @@ pub(crate) enum FalconFbifTarget {
     /// Non-coherent system memory (System DRAM).
     NoncoherentSysmem = 2,
 }
-impl_from_enum_to_u32!(FalconFbifTarget);
-
-// TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for FalconFbifTarget {
-    type Error = Error;
-
-    fn try_from(value: u8) -> Result<Self> {
-        let res = match value {
-            0 => Self::LocalFb,
-            1 => Self::CoherentSysmem,
-            2 => Self::NoncoherentSysmem,
-            _ => return Err(EINVAL),
-        };
-
-        Ok(res)
-    }
-}
 
 /// Type of memory addresses to use.
 #[derive(Debug, Clone, Default)]
@@ -263,7 +156,15 @@ pub(crate) enum FalconFbifMemType {
     /// Physical memory addresses.
     Physical = 1,
 }
-impl_from_enum_to_u32!(FalconFbifMemType);
+
+impl From<FalconFbifMemType> for bool {
+    fn from(value: FalconFbifMemType) -> Self {
+        match value {
+            FalconFbifMemType::Virtual => false,
+            FalconFbifMemType::Physical => true,
+        }
+    }
+}
 
 /// Conversion from a single-bit register field.
 impl From<bool> for FalconFbifMemType {
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 5da9ad72648340ed988184737219b14771f31b7a..4d90c821c5954fe4cf9b1562d853fddf5cedbce3 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::{device, devres::Devres, error::code::*, pci, prelude::*, sync::Arc};
+use kernel::{device, devres::Devres, pci, prelude::*, sync::Arc};
 
 use crate::driver::Bar0;
 use crate::falcon::{gsp::Gsp as GspFalcon, sec2::Sec2 as Sec2Falcon, Falcon};
@@ -14,7 +14,8 @@ macro_rules! define_chipset {
     ({ $($variant:ident = $value:expr),* $(,)* }) =>
     {
         /// Enum representation of the GPU chipset.
-        #[derive(fmt::Debug, Copy, Clone, PartialOrd, Ord, PartialEq, Eq)]
+        #[derive(fmt::Debug, Copy, Clone, PartialOrd, Ord, PartialEq, Eq, kernel::macros::TryFrom)]
+        #[try_from(u32)]
         pub(crate) enum Chipset {
             $($variant = $value),*,
         }
@@ -42,18 +43,6 @@ pub(crate) const fn name(&self) -> &'static str {
             }
             );
         }
-
-        // TODO[FPRI]: replace with something like derive(FromPrimitive)
-        impl TryFrom<u32> for Chipset {
-            type Error = kernel::error::Error;
-
-            fn try_from(value: u32) -> Result<Self, Self::Error> {
-                match value {
-                    $( $value => Ok(Chipset::$variant), )*
-                    _ => Err(ENODEV),
-                }
-            }
-        }
     }
 }
 
@@ -110,26 +99,14 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 }
 
 /// Enum representation of the GPU generation.
-#[derive(fmt::Debug)]
+#[derive(fmt::Debug, kernel::macros::TryFrom)]
+#[try_from(u8)]
 pub(crate) enum Architecture {
     Turing = 0x16,
     Ampere = 0x17,
     Ada = 0x19,
 }
 
-impl TryFrom<u8> for Architecture {
-    type Error = Error;
-
-    fn try_from(value: u8) -> Result<Self> {
-        match value {
-            0x16 => Ok(Self::Turing),
-            0x17 => Ok(Self::Ampere),
-            0x19 => Ok(Self::Ada),
-            _ => Err(ENODEV),
-        }
-    }
-}
-
 pub(crate) struct Revision {
     major: u8,
     minor: u8,

---
base-commit: 299eb32863e584cfff7c6b667c3e92ae7d4d2bf9
change-id: 20250930-nova-tryfrom-a2cfa169dfd2

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

