Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E24C7A947B1
	for <lists+dri-devel@lfdr.de>; Sun, 20 Apr 2025 14:20:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E9C10E2EE;
	Sun, 20 Apr 2025 12:20:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="b7N4y8H6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD8F10E2E7;
 Sun, 20 Apr 2025 12:20:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bziTsA/sBf+EM8MCyLjdi/aQWpmPoBUTvNFgBAArhOmEV4KOvqBOztVvUnfIZa9PKxmbtGZ5YwTAuhmwop+vPIS+wcw+Z4OP+PYu1Tx/fIirewCDFwppuqrusjBIMue4J5aP4yXQ191URej7zseDxtAnC8XSpVQZt+wweeRUt/ZOpYUgnYePbxyeSW8DI6RB/uj4VGgESF97MzGTsQ8C1g2vB7Vpi04EcPCWQ9IGOtk9U4A8p6owZ4ocoU9+z9ogAtMhjnDoHRMBoZnDJnGUAb2h3pkttrvM7/ONId4AQezpuchzg5hq5MwwYV6ZUKOH98fUElArPwVTAxY6ukat8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ffUlA9YhJCqUAiW65dyyt7h6ajOjIyw8Ht0++Qqy3hM=;
 b=zS/ydvuYX+tv94rUW4YptUqTEZPAXSlmkyO8nrMorCVLKq1yYrstkZG/Z5x3RCIvBm90mSioryTEy+qd0UvUhagW1LDF/N1W7VLZqpk6S/WnQr5L/tHhWn0vXhFrRxUj2Homxedd1sLoNhSamu9Ul4vAjw9HfqUtraIet38FD0DDnL5J890B3glFfwsKSrZZ7ADdOAl4w/sP5dzSpb2n2F1lSFuonaOPYla9LI5nNuOTOmK6WGx4AT+70Su1OgzpuXqgf0gOQUlaQ27xde1FUdPmMlwLPpPmLGLKPHe4OmatfnWFKckGAwVKM9dvynY0ConT0XreIilg184evyr0rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffUlA9YhJCqUAiW65dyyt7h6ajOjIyw8Ht0++Qqy3hM=;
 b=b7N4y8H6fVuLyXQhlYgNPE9mW7dKL9OtDXzZuMC3vKEaB5nSaZtNW4+cXByrKbJO4le+Rk7lCgZ0nCBQvwB53d6BNx9EFwDALxl9VTtxWnQpFyIBchQMZZEHP5w3prLf422f9BWUI71lOK8yQ0ysEWBRy1MaOwMhBsBLY9LbJPxZPYdJZKj2Wlq1/l6oohbNt20bii14PtbTEFaJOzw34mIUwhKPPK1Hos3lvyjzfPxb0dWOVaeG9UNqLnJK/yREIf3F8cn094xR1tVPnOQA/Xr0FHG3T8gOh0jZCb70E4gqSjU8zErlfuMor2c+yTn0ztHqBApBpFy8PAGercjxRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB9175.namprd12.prod.outlook.com (2603:10b6:510:2e6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Sun, 20 Apr
 2025 12:20:20 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8655.025; Sun, 20 Apr 2025
 12:20:20 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 20 Apr 2025 21:19:41 +0900
Subject: [PATCH 09/16] gpu: nova-core: register sysmem flush page
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-nova-frts-v1-9-ecd1cca23963@nvidia.com>
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
In-Reply-To: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYBP286CA0019.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::31) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB9175:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bb92d50-dd66-4334-5deb-08dd8005b7c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0I4VjRLTG42cC9tdGY2VUtpU1Jsdkova092ZHdCSjJsbk1HM1dldnkzR3o4?=
 =?utf-8?B?ZFdsaE1LK0RYWVd4S0ZzYnk5dEVLczVwOEh3SnVXamJQVWRDVHJRdjZvK0pL?=
 =?utf-8?B?Sm9GY0hGaWNEUWcvaHdjRTFFRHBFdEUvWWhKejBSOTVSMHpkcStIYlBYeVdF?=
 =?utf-8?B?KzdlRFUwVzQrdEJxN1QwUEFXV203bU4rUlRUZWFIRGJsNG1qYUhmSXFrNVI2?=
 =?utf-8?B?Z0VsS2VBWVdzWnRoOGxzVlIrRWNtMmc1andmbmM1UHA0aFNnN1NiQ1JwNW40?=
 =?utf-8?B?bFlOWVRCYjhLSmxXRkd1d1ZNOW0zcUdLdDZzWjRjUU9zRWZrOU5CZzhmSEVy?=
 =?utf-8?B?eFJDNXRVUXAweW9FeWVxUzBSb3hQajFickxkbFI3cXBPMXpEajBWL0txM0dO?=
 =?utf-8?B?N2N3TnFqOHk5c3FpbjJCZHVpZGozajFtQ2hiVmtBaCtjMUZqdDNxYllUYlR3?=
 =?utf-8?B?a0V4cm90TVVjNXo1OHB0TXNzbmo3RVkyRnpoVkxweExMc2hJNnp0WE9DZDl5?=
 =?utf-8?B?TVM2MGt0WGRBSE5IbWphbUZiZHRaN0wyem8vT3o4ZHk4dm9YUjFCbXlaekNi?=
 =?utf-8?B?NWh6dzNUanM3M2liWDhWSlVqOXpaT0htZ3BGZE00VXNtdjNFYnl3Q1lIUmh5?=
 =?utf-8?B?NUc1L3dEMkl0Y3IxZkNpMnoxOHZpR2ZRamVDMGsxeUUzZUdEbkJ4MHNqenc0?=
 =?utf-8?B?ZTBLYUhCaC9BdkZCY2c4eUVJZXpkbUg3LzhtQWZNOG0yS2Q3dUZCaFgxUDFZ?=
 =?utf-8?B?TDVMeWg3VTMwcnJLc3R5V2cyeXR0dEM5ZUdDTWo5RmlZM05HRWFMRWVVTXQ3?=
 =?utf-8?B?Q1ZIeExwajFRaGd4azJkaHZBM2xpRWpJV09xamgxVXJxcXM2a1YyRWJKNW1a?=
 =?utf-8?B?alVYMG14emFpclVLU011bmpyakZzQ3QwMnFiSEo5dkVqODFFZEhINThmSGw5?=
 =?utf-8?B?K1BYamJRLy9MUks3a0QwM0JtbkRKRjR5M05yV3AzSVYvYmQ4TkdDdW40YVdU?=
 =?utf-8?B?L3VOZnU5NWxTNjdnbzVlWDY5WURnQi9RYjFJcDkwT0pFUm5Qdm81Nks1elNh?=
 =?utf-8?B?SS8vR3l0Q2tLSnVLeFlFSE5ORUl1cEVRcXBYSG51bkZZVDdoQXc0M0FvSzJ2?=
 =?utf-8?B?dzhwQzNCd0d5UWpFTTBlQ1FNRzl5YWJzYit4cXVjQ2E5K1NWRkV2NTFFVCtV?=
 =?utf-8?B?QjNhV2o0bjZlNzJPSE1BamVvaDVKYnQwSW1FUUp1MVEvK2x5VVVPWGtYK0ox?=
 =?utf-8?B?Ym5ROGZUcUFuRm9nK3lBQUJIN2NkYVp3cGxFdUlCNGx2azBtalUxLzNhM3pD?=
 =?utf-8?B?dG5DRjdoMDBZcDc0MysxZTNSS3hRc2x4R0pMM0lHZC9vY0l2dlJKaWtqZU0z?=
 =?utf-8?B?OHVzdTdIVjlrMXRudUZmMmZ4cHlkODlLTGxJN1ZubWl5NFBHMUhTRCtpQjU2?=
 =?utf-8?B?ZlFTMy8xbFUrYlpLUjY2d1BSNFRYZTIzOHllbXJWOTR4UWpKMTNSNnZrUzg2?=
 =?utf-8?B?OW5jVGVJWHlCOFdDZVZLMForaDQvdC94UVp3Y1RNWGl2dmpXckRZenFnQ0NT?=
 =?utf-8?B?RXZXeFBrN1JwOElPSG1oa2FIeXU3ZlN2ejZITGJabVJ5enZxbmpTTFpXaHl0?=
 =?utf-8?B?ZUdzS0xRajZrZjhSWG8rYk53eE5qNE5jNy9yUUZZb0tPTmdvc0dMaDZyclRZ?=
 =?utf-8?B?MjVSVkgrcmR1TmxDRVpzSEx0NUdCa3ZZOGJEKzNzeDlkZzluK2JQSS81MjdM?=
 =?utf-8?B?VHpQRG1qblJsTXZyblBhYTJsZjJ2YWZiUER4UzJLdjhSSDVZYlQrc0h4R0VC?=
 =?utf-8?B?blM0cnJKQ3JvV0Jpd3JDY2FOcTcwUVlreUxPOG1pajZQeTE1R3lYZEtqeW56?=
 =?utf-8?B?UHhxemVxM1BldjZqOEpnNE1GTWpWbFZidnAzdEFQNFVaQVFOVTN1RzFXNkEw?=
 =?utf-8?B?T3lVZzYzalNBTHBrTC9MY3BiMEc3ekZ4cVB3VHg5RVNaTFVSZEtQcWhpS3N6?=
 =?utf-8?B?R09CZ3dveW5nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R200YkdLUTVwdGhNazlFbGRXZkY4R3ZzV1oxdGFKSUtuc3lIR1Y1N1JWTm5o?=
 =?utf-8?B?bGI2ejg1ZW9zZmxPMFNXOVpjWFZXZWdETjBBTGE0SE1ZcWtBWGQxTlllWFpL?=
 =?utf-8?B?UjE4MEhqbGlBRFRqTC93VUJ3aG0vMDd6VVQyVndmZkdtTFFUWHk5UVZPTFd3?=
 =?utf-8?B?aUd6RHRoUDRqZmxLN1NyVHJ3VGp6RUllYWFzTHlzb3FCM0ZEbXpRU045VjA3?=
 =?utf-8?B?cmoraTBpMjBuQnZ6YVpTTkNKU09LOVIxQW9zV2hiUStnSXY5YUpSNE9PQmsz?=
 =?utf-8?B?Y1MyeTh1SkJxcndYRGJBOFpDaWZ3amJPVCtyaFdSZUNCMFoxNWsvWTMzbVRK?=
 =?utf-8?B?dkVnWTEybDMySFFBMmdtdEZsMmN1T2dFaWVjZ0JJa0o4UHlrajRLMDV5Y1Rt?=
 =?utf-8?B?bGRva0MrQ01lNWlCV0w4MnNkbGVkZnRBbnRXeXppRGsvVVl4Yy9mTGRzUXFO?=
 =?utf-8?B?QzNZaGhuTTlmZjM0Z24ya2wrSHppa1N3eVdzNDFTMTlhN05EM0JLVHMxemZs?=
 =?utf-8?B?NjZmTncvVmxWVzk4cHYrcWh2MjF1bFpmM1o5RCtGL3JTTGV0TnBJUFJvcWdW?=
 =?utf-8?B?VU1hWEZUdE1jVjJPZmFzcVVVb0lreC9Md1JXazJhRFBzUDdMUThtTHZqcmp5?=
 =?utf-8?B?NzdRK05IRGJ1WFFiWEkxK0V6U2w1TXF1YWU5Yk5WTlpUUEVOYlBsZ0hsQ2Zm?=
 =?utf-8?B?dW1UZkxtalZ2ZCt4ZzFrRlFhcllNYjFoeE9RUDkvWk10emtPK1J5SzJvMDYr?=
 =?utf-8?B?L3FONWs4NXlCTDI4WERVdHFFczlXT0VYYzJSZiswdlRlQ002M1FLS1ArU3Q2?=
 =?utf-8?B?RWlQYXVxcGNDSHVBWi92UEZxT2hRcXloZTNOZUZ5bmFZQUMwT1VtRi9YZWpV?=
 =?utf-8?B?dXAwazNuTWtYaWI4cnpnWDdVME54MnIrYkc3ZVI1ZXBUbjUwK1MrL1hqNW5j?=
 =?utf-8?B?cWNZNjdmWXdpWjRQcllPSmxiZlkza1JRM1lNdXZET1BDQ1BVeGVjdnUrckpJ?=
 =?utf-8?B?V0RHc2lFdWVFTmFsdHlua0RWOEpoZVNKdmEwSDVoclpYbGJzR1N6YXhKTDlM?=
 =?utf-8?B?N3d3bWdGVTdBZjUrTUx2UDRBMlZGcGtONEl0Y2hkSjc0Vjc3R1NnU2hCMEZV?=
 =?utf-8?B?ZmpvcksxVTI2UG95UWVDQmNKY3dsS1p4YWQycTRxZmlCdEVVcy9wWXRxYTU3?=
 =?utf-8?B?M3RNdkFYMFU3TzdYR3RXcGVsa3NGenp1VWF6Z2g1SXBnOUx2dC9HTjdDQ3ln?=
 =?utf-8?B?aW5pTWcrU3BBL1JhRDRSVWlHVmdXM1ZGalFtZjJ2VFZUYmVxMVBENjljYkN5?=
 =?utf-8?B?Y09YbzczMEYrQnNIVkxuV2Y0RzcwSVo5THNJbnJGOVBucjBoWFJWN2phU3Ra?=
 =?utf-8?B?akRhdGgzMTFLd0RMc1BRYmlqMWNCR3BtaGJES3NKOTVNSVkvUEtlQ2FvQ3pH?=
 =?utf-8?B?MjRJUHdLM1VTU2tFWW9Hd3NkTlBiWGM3NGo3aSsrNm1EU3dyaThUUGdDTTdW?=
 =?utf-8?B?Zms2RDJPUzFJa0pMRDVWZWVnNlJUM09LMW5xZWJxSTFEL1lYYlZXZll4cGN0?=
 =?utf-8?B?S0xlMDVUQ2tRU3V2dWFJNDhSdUE3clE4WHJSUldwa0c3aWEvWjJ4YnZRakt6?=
 =?utf-8?B?NVZKM1hVaHI4ZVdudmhoaTlSS3VjVmRsTExMdmZDUmxvYk9HOVZDbU82SmVa?=
 =?utf-8?B?SHp0OXZ3cVZWbk5Manl0eStYTUNycjJzQkpJNnZ0dW9nOFc3V0xTajNpRis1?=
 =?utf-8?B?QXkrZ1BFWU14R3FURUx0VTl6bDhPWmMrclMwd1VTUm5kUENCbmYycGFPQm5F?=
 =?utf-8?B?emozZVpOTE16SXMwbGtLOEpTcGNoeUxsZ00yWEROVElYaDRCaHNBejBvWG91?=
 =?utf-8?B?aEluUTEwODNCV3Y0MVkyUjFYWUJrUzIyQkcybWxVbUN6MVdGbU9raXFxckZ5?=
 =?utf-8?B?NjVTLzI1SnZra0Z4ZGw1MmRpV3Z5NWVwUVBxODJDREZpS2NaT0pjL29laHFG?=
 =?utf-8?B?clQvNTQ1b2RVVHRmR0FNT29ZdzJhc2k5T1E2WG5wbXd2SGk3RmwvM21SWmdw?=
 =?utf-8?B?WXhOUmFzTDRBMFNlUzNSeFRUZnhyN3p3RUdaK09yUnFySDBVM0NzMy9rb24z?=
 =?utf-8?B?c2I0OWZEZk9OUWVlemY2bjQrYzBrWjlhNzM1QTR3THB3Ylg3SCs0bFUweTIx?=
 =?utf-8?Q?+bPpCchf/wGLYjRTulsw9qMfyoUoPQL/i5+Wqllrhx5+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bb92d50-dd66-4334-5deb-08dd8005b7c4
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2025 12:20:20.5275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gc4gNs/jRPIikNGX0U/0yjc9FqNjSEvYxPYSKRF49adDUZfogD313OZ+uUTurv6aYU2APLMnnrkJgg+oaM9T0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9175
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

A page of system memory is reserved so sysmembar can perform a read on
it if a system write occurred since the last flush. Do this early as it
can be required to e.g. reset the GPU falcons.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/dma.rs       | 54 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs       | 53 +++++++++++++++++++++++++++++++++++--
 drivers/gpu/nova-core/nova_core.rs |  1 +
 drivers/gpu/nova-core/regs.rs      | 10 +++++++
 4 files changed, 116 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
new file mode 100644
index 0000000000000000000000000000000000000000..a4162bff597132a04e002b2b910a4537bbabc287
--- /dev/null
+++ b/drivers/gpu/nova-core/dma.rs
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Simple DMA object wrapper.
+
+// To be removed when all code is used.
+#![allow(dead_code)]
+
+use kernel::device;
+use kernel::dma::CoherentAllocation;
+use kernel::page::PAGE_SIZE;
+use kernel::prelude::*;
+
+pub(crate) struct DmaObject {
+    pub dma: CoherentAllocation<u8>,
+    pub len: usize,
+    #[allow(dead_code)]
+    pub name: &'static str,
+}
+
+impl DmaObject {
+    pub(crate) fn new(
+        dev: &device::Device<device::Bound>,
+        len: usize,
+        name: &'static str,
+    ) -> Result<Self> {
+        let len = core::alloc::Layout::from_size_align(len, PAGE_SIZE)
+            .map_err(|_| EINVAL)?
+            .pad_to_align()
+            .size();
+        let dma = CoherentAllocation::alloc_coherent(dev, len, GFP_KERNEL | __GFP_ZERO)?;
+
+        Ok(Self { dma, len, name })
+    }
+
+    pub(crate) fn from_data(
+        dev: &device::Device<device::Bound>,
+        data: &[u8],
+        name: &'static str,
+    ) -> Result<Self> {
+        Self::new(dev, data.len(), name).and_then(|mut dma_obj| {
+            // SAFETY:
+            // - The copied data fits within the size of the allocated object.
+            // - We have just created this object and there is no other user at this stage.
+            unsafe {
+                core::ptr::copy_nonoverlapping(
+                    data.as_ptr(),
+                    dma_obj.dma.start_ptr_mut(),
+                    data.len(),
+                );
+            }
+            Ok(dma_obj)
+        })
+    }
+}
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 1f7799692a0ab042f2540e01414f5ca347ae9ecc..d43e710cc983d51f053dacbd77cbbfb79fa882c3 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -3,6 +3,7 @@
 use kernel::{device, devres::Devres, error::code::*, pci, prelude::*};
 
 use crate::devinit;
+use crate::dma::DmaObject;
 use crate::driver::Bar0;
 use crate::firmware::Firmware;
 use crate::regs;
@@ -145,12 +146,30 @@ fn new(bar: &Devres<Bar0>) -> Result<Spec> {
 }
 
 /// Structure holding the resources required to operate the GPU.
-#[pin_data]
+#[pin_data(PinnedDrop)]
 pub(crate) struct Gpu {
     spec: Spec,
     /// MMIO mapping of PCI BAR 0
     bar: Devres<Bar0>,
     fw: Firmware,
+    sysmem_flush: DmaObject,
+}
+
+#[pinned_drop]
+impl PinnedDrop for Gpu {
+    fn drop(self: Pin<&mut Self>) {
+        // Unregister the sysmem flush page before we release it.
+        let _ = with_bar!(&self.bar, |b| {
+            regs::PfbNisoFlushSysmemAddr::default()
+                .set_adr_39_08(0)
+                .write(b);
+            if self.spec.chipset >= Chipset::GA102 {
+                regs::PfbNisoFlushSysmemAddrHi::default()
+                    .set_adr_63_40(0)
+                    .write(b);
+            }
+        });
+    }
 }
 
 impl Gpu {
@@ -173,6 +192,36 @@ pub(crate) fn new(
         devinit::wait_gfw_boot_completion(&bar)
             .inspect_err(|_| pr_err!("GFW boot did not complete"))?;
 
-        Ok(pin_init!(Self { spec, bar, fw }))
+        // System memory page required for sysmembar to properly flush into system memory.
+        let sysmem_flush = {
+            let page = DmaObject::new(
+                pdev.as_ref(),
+                kernel::bindings::PAGE_SIZE,
+                "sysmem flush page",
+            )?;
+
+            // Register the sysmem flush page.
+            with_bar!(bar, |b| {
+                let handle = page.dma.dma_handle();
+
+                regs::PfbNisoFlushSysmemAddr::default()
+                    .set_adr_39_08((handle >> 8) as u32)
+                    .write(b);
+                if spec.chipset >= Chipset::GA102 {
+                    regs::PfbNisoFlushSysmemAddrHi::default()
+                        .set_adr_63_40((handle >> 40) as u32)
+                        .write(b);
+                }
+            })?;
+
+            page
+        };
+
+        Ok(pin_init!(Self {
+            spec,
+            bar,
+            fw,
+            sysmem_flush,
+        }))
     }
 }
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 878161e060f54da7738c656f6098936a62dcaa93..37c7eb0ea7a926bee4e3c661028847291bf07fa2 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -21,6 +21,7 @@ macro_rules! with_bar {
 }
 
 mod devinit;
+mod dma;
 mod driver;
 mod firmware;
 mod gpu;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index fd7096f0ddd4af90114dd1119d9715d2cd3aa2ac..1e24787c4b5f432ac25fe399c8cb38b7350e44ae 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -14,6 +14,16 @@
     28:20   chipset => try_into Chipset, "chipset model"
 );
 
+/* PFB */
+
+register!(PfbNisoFlushSysmemAddr@0x00100c10;
+    31:0    adr_39_08 => as u32
+);
+
+register!(PfbNisoFlushSysmemAddrHi@0x00100c40;
+    23:0    adr_63_40 => as u32
+);
+
 /* GC6 */
 
 register!(Pgc6AonSecureScratchGroup05PrivLevelMask@0x00118128;

-- 
2.49.0

