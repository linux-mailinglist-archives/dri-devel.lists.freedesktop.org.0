Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC334C993D7
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 22:46:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20DD410E495;
	Mon,  1 Dec 2025 21:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uUrQ6RUe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013015.outbound.protection.outlook.com
 [40.107.201.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0161B10E05E;
 Mon,  1 Dec 2025 21:46:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bzUxVSpJ3DkvXH9nd1B3CcxC8Li3YKLjg0VsCVfqzgzJVV5DJbm31isN6Idi27/9tBGpf2ITs2bLao1BkCffpOlH6sRhbeBzQM0u0DPm8nGvuctKHFCqBRmIe3M/GLljFy6JKlSqotly26mUZm2RXZ4mQLCm5kuCWlMv/afpRhVe6bdf0gTjUx4x1Nrdc77QXQKQ8ptLKgsGCBJ94cJbeYmLxgF/hJ5uLZiKRyrqfN75BM6W0daR8DTkGNX9+A3mXY9bC7lKgnd+xH7s3vgyW4r4skRB5RHbL/EMEb5GVSjasuxraVj3yYtny78YN973cLmJfkv7MIN9GgZP5xjxgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZpws9g+Zanr/B+zj16P7I7+zUeJ2589xtI56Z4UBpE=;
 b=qNKOdzrDJQ/7y2Ut7FPADfm6vprJyqQZSlY71PHp2MVjECyBFajm/SEG1iFcmuHv4ZFMntNwZz0srJ5bjpnHiZjcMHLjsHlT6njy9R51DsoTUWHLMr+bUfQxOEm8lvIJ5EmzYcmjE5kPXW1MdbYmPbACWLT3mpD7zh8Bf6IFy7JuI1GlHeG7ffswce64uAES5t4T0S3rTo2CvjyWE74rG/qeK4dP1m+ZoUPhHjZEUBNKQ8PejP8vl7p3lG83GiwUDVoGyucEeRl8iRNfL4AsJKFpPBa4FPY6GNPIJRJH4ohmlxdK9pdUFk72xUe21f+STmAPeQ/Ucun31B915J7coA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZpws9g+Zanr/B+zj16P7I7+zUeJ2589xtI56Z4UBpE=;
 b=uUrQ6RUe3eSQZd6BaqJPVOXxYhfMBz3TQ0Dnwgw1ESTgdL11uVNNd6VaJnttIiaIFMMCv22ih7eH0AXOyK1ZFU0TnjyyKcVKLLO+ySKbmhDmqenNhysXxalAMLSCscyFo8i15DSjlBp3l469/qSI1gLlORi+S6zi1sCdOagLunPNLXDFdatG5q7VdGT44bstz6g7Jpiowa3IJqMf/q8UXBYWnQAYwsQTKCWtNo29ihBUsCiMjdB9qSUuqcIp4TvOHZomSzzrEGs0WWjMDmKPUsukQi/BkvayITTaSf3TaSRvm2NUGPcKhHdLS/KJcwBxNPZWUENNO8JtUPecy+tsYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB9735.namprd12.prod.outlook.com (2603:10b6:8:225::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 21:46:05 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 21:46:05 +0000
Message-ID: <c6c0a327-f657-493e-beaa-c392eca8ce34@nvidia.com>
Date: Mon, 1 Dec 2025 16:46:01 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust: clist: Add support to interface with C linked
 lists
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@gmail.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Lyude Paul <elle@weathered-steel.dev>, Andrea Righi <arighi@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>
References: <20251129213056.4021375-1-joelagnelf@nvidia.com>
 <5B89D953-BB52-4E8F-AC40-1FA33C016780@collabora.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <5B89D953-BB52-4E8F-AC40-1FA33C016780@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN0P222CA0001.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:531::6) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB9735:EE_
X-MS-Office365-Filtering-Correlation-Id: a86d64e1-53b9-4ab7-74fc-08de3123078d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bCtGNlByZURVb3B5eGpadnRNVG1nQm5VTjNOV1NnNU1TZ0F4QTJwZHg4a3NZ?=
 =?utf-8?B?TFpoaXZFcGU3OHRKcHpBeGdxaDZ4L3k4b3hHeHNYb0ZWTWdHbmorc2xHT2FC?=
 =?utf-8?B?SFlnekJPcElPaFM5clk5OXpuZVllK201c21MbTVsaHBBN0dhQVRUeFY2RElB?=
 =?utf-8?B?TCs1eUdoSTEyWUE5ZlY5bndrWHorWXY1dWlSVi9KK1FHZ2FSMXRPWXk5Ly9L?=
 =?utf-8?B?bTh4TkJJSGhGT3l4RnErZVlMWk8yWVpoNjNTZHViWVNmdFNKaXN0R05vTEsw?=
 =?utf-8?B?VXV2ZEFKRFkyb2p6aE9SRDFrZkJvU0p2Z1lYRExNTWJQbE56WjhPY3BMSld3?=
 =?utf-8?B?S0NNclZvRHBLRnB0NVZId0VJODlOQlVEUnYxUjc5WDhJSGVaVVY5S3BDcUpn?=
 =?utf-8?B?OE9ibWduYVRSaHNsUk5HVlNyR0lPWnJKLzYybW9jMkdCWUo1TXRyaW0zNkFr?=
 =?utf-8?B?ejlTS0hOSDJGVHNJRlNUdmlnclZwK3lVY2x0Nm9OQmtLMzRhd1NkNEFyM2Ex?=
 =?utf-8?B?VjNQR0VONEtkS0VqZkYyY0c2N3JyNWJIcTNIWi9qOUtsbkt5WG81RHZmZG5Y?=
 =?utf-8?B?YndVby94OEJZTG9tMnZ0YnFJT01qN0o2WWZrSlFaU24zZ3lNRkZsSjlWWnRV?=
 =?utf-8?B?VndSWkVuM3FKTTVJcjJZKzBvYjN4QkZQbDhMOVdXQXV2bE1MMm5idXVYRTE4?=
 =?utf-8?B?QlhFRjF0RGl1REpmQUpLbS8zTDA5KzNnb0hOeUx2Rkx4NHYwais3RjBvTzI1?=
 =?utf-8?B?aktXSE94UmVQMXppS29aQnNLVVJ1WHdpNEpHeVFGZjZSTGRlaG92Wk1lZWx0?=
 =?utf-8?B?TmJiRTQ2MVdQSitUay9sdnlrVURlRU1jZTVzVitiaG9ERThVQ21hclh4SS92?=
 =?utf-8?B?UkY5MFNyWHl5Rk5ubWEwOWR3UXVPdGRWMWMydm1Nb0hsWVpXai84K1ZjNVF0?=
 =?utf-8?B?eStCMjIzT091L2h6b3FXaDVCay80NFNnNEZlVEdibUNxQ3VoNC80YnE1dUVx?=
 =?utf-8?B?cTlMU1U1NkFZWi9wMkZ6WkhGdWJXd1pvc3YyK1hLWnNUZWdNdGUrZ1VyYS9s?=
 =?utf-8?B?RG1tTVdBVmRSdmZvejcwUjFIYmVjMW1SU2xybU1nRkNEMENmZm9DOFN2WGZj?=
 =?utf-8?B?WlRjdGhHMmMwYWJhMkVzWWxCQnQxdUd4eGJQdjhjZlgwZVArV29raitFWnlu?=
 =?utf-8?B?VGJ2Y29rYmZiNUF1a3B1bkIvQkdNaHNwVEl1R1lSckdkQ3ZuRFZoMzlxbktz?=
 =?utf-8?B?cUNDR2VqY0FnSWZ0cHcydUlRbWdYOWk4dHZORHc1WXZEczlEYUlyMDlZdG4v?=
 =?utf-8?B?b05xN2NTbmdUNjFiODNzdkJETTlJY3g2cHQ4ZmxHYytBejZxekRHblZmeUwr?=
 =?utf-8?B?UHVrNTFPMzdGMytVZjdrbDh4eEJ4RGpveHc5TkliN1NIQzQ2Zmc5QW5Pc2lt?=
 =?utf-8?B?M0JCcHlFM2l0eDRScG5IL3ZUQWVoSllYbDk2VlRqR09YbUl1dzduM1M0Y081?=
 =?utf-8?B?WDdHbjEvU2drckJJcG5hc01NbW5NZVI4ekpaM0dMRE9SMlNBZGpnTmxYREVI?=
 =?utf-8?B?Q09CakpnZFcyZ0thUHptczdyN2pPeCtQMUJvTC8rcnB6bjdCZkdLbnpNaWhN?=
 =?utf-8?B?dVlzMkZpeGUzWVdFWGg5TnlQWCsxK3ZNNVNHeXdzYThFSU5WRFZqUjUyMS9D?=
 =?utf-8?B?YzMwZWtuOVJSS0JlRWE2N24vTFNNL2FuNGRVWGdCZDNkMkFPRzBnQloxOFpT?=
 =?utf-8?B?UTFIaElkNDBBQ01RNlpjK08yTUl4Vy9lTGlycTZNTWhMSWxaTUpNVXpJemIz?=
 =?utf-8?B?NmVJbmR4cGhXUGhPVVN1bXQ1OTNxc2huWFIzck01TWVmRWxLWlJ1eHFScCtJ?=
 =?utf-8?B?MFJXVVcrU25qR0c1NnE4Z1NkQmkzOXNsbnpUNldzTHZ3Vm0yZ3lBSHJyYkFi?=
 =?utf-8?Q?BMlLeBNhj7HGdpBKYsUTJDM7HJvkWwmQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SURNdjZtaEtxSlV4ZDRyMHRRd3NXYTl2bGVkb3VDL0pBMzVnSEtSS0JBaDVn?=
 =?utf-8?B?R3hqclBUM0lTMUZEZGVMZVFQT09KZ3hEMVZ2c2d2QmpTM3VrdlY4Tzdkaklx?=
 =?utf-8?B?M0RLRUtOV1NzOTZSL0o2amZrUlBDOWQwTEFkbDlrbnNLa0pqQXhRK09ZMEdn?=
 =?utf-8?B?dnowSU1zS1ZHaUdsQUhhelJIL2xYUEJUaGx3clZIdmZBcFpaSVZIRmJHZ3Rv?=
 =?utf-8?B?bjhpQ3RkY2syTk9NS2dzbTNFZm9CUkQ3bUhDbDQ5NzRpeGxQMCtyYzBpenV4?=
 =?utf-8?B?NTlLVUpnTVJyTFdoN3VaZitNUXRUTWpnRHd0anpUL0R4eGhRRE5MS1MyNVdC?=
 =?utf-8?B?RWNRYXJ1Z0g2eXVvUlU0bnY4MXFXZnJFa2xyRGtjcWxQQTZRd2RydHBtUmxz?=
 =?utf-8?B?VzR4akdTc2drNmdKOWlXdVROQ1EyNVRIeXhGZWk0cGZwRDJxVzVBV2Y4TmQv?=
 =?utf-8?B?L0hCMUpEQWNoY25makF6YStiRlQvdUE2SGw0c09MdjVwaExGTjltNkZ5Mkcy?=
 =?utf-8?B?Ym5sWllsVlBuR3NvVDJuV1o3b1VJNWUzS0d0ZkliS0duNUxkT1NNUHFzN09o?=
 =?utf-8?B?NFRsNHkzUjU4WTd1Zk9BYnpDQitsUHpqaC9xcEx2WW9YeWJjbVk2dGRqTjMw?=
 =?utf-8?B?QzFKbTRwVTdJMjVpRU5CUzlCVnprS0E3eXpucTVGVnZNNUMvUHF6Vkp1UWRi?=
 =?utf-8?B?RTBWZnBEdTl2bEdIODZUOXlkUWhXeTBzT0pmQll4ZXRsMEZxd0d5T3VMUVB5?=
 =?utf-8?B?T2V2SkRkYzk0QlJxaWoxa0tzR09WaVRrUWRZL3NvclVvWU8vRVBvSWJaTGRW?=
 =?utf-8?B?YTRkaUdxVnFzY0dSTmh4VUEyTHh5enpySThubFVWVFNxUTVZRDlFQ1FOOXp2?=
 =?utf-8?B?QVVDbk9ySzZqM29KWGZXRTZPeVg3cWVvSzlaV0pMZmpwWWZHdkJKTnVDVWtD?=
 =?utf-8?B?OGlPVEJ3QTYvMDllUHFJRThIL3R2Q0RjZ2Y4ZXZSU1Z5U2JyZjJLTXg5dlRL?=
 =?utf-8?B?cWVWaEJIcHpuMFM2cmlRaFh5clgvUHh2TFh6OExuY2NacUUyakhDaWR3d29B?=
 =?utf-8?B?Y2Mrd2FTME9QbWw2bmZZNUk5cnpzWndSanZaYlVTUU5DMitITEcrZUEzamZp?=
 =?utf-8?B?QWNINjRRTUxkWmFqOGR6Ky9tUVRjUUFoM212bHJnTzRGc3RnckRMRGZFT3cz?=
 =?utf-8?B?MkZFZ0NSa3pjWFVSS1ZhYXg0S0xVSllLZjBkOHpWWmMxYnZsMFdqRUxjVVF6?=
 =?utf-8?B?S1JNSC84K3BaajdLbXdCM2tEZnpiak11VFBJc3l2TlU5bXp1Q05saXpObWNI?=
 =?utf-8?B?TGwyMm1Kdm5pUWIxME1ZSGovYnhhQ0MwM1pralJ6cFhBUzJSKzNzVGdMYTVQ?=
 =?utf-8?B?ZzNkWjNnUDE5WGtqN2RDaEVUK2E3ck16cnVCWEZFbWFGSGErR1M4bGhYanlt?=
 =?utf-8?B?QklrUVIxM0d2ZEZXL1N1OHlWbDdCN1E0M2FUSzZHeG9HbFN2cnRBYU9rVTVr?=
 =?utf-8?B?NDYvR1JBTzI0S3MzMW5sRmRuN25mVytTalExTE92M1BJSW11SHowUnZhb04v?=
 =?utf-8?B?WC81OHZDVW1VUGtWeUhOODVVcjBiVzN2aUVuMndaQlU5aVhWd29KUlVXQ0N0?=
 =?utf-8?B?MHFQMFBEbTFxV0lZc3g2cDUwVWNGMmJBSGRwWGRSN1dwd29mempsL0FhZWRx?=
 =?utf-8?B?WXVzdHg0dEhWTGt2UDB4eUErMzdIV2hBRER3UEpIeU9TdjV3cHZGY0Ywenlj?=
 =?utf-8?B?TytsUVBQTUt0dG5TZ3ZpOVBHdThWZ3E4Y0l4aFVzQ0tkSmVHMEs0UCtaaWNp?=
 =?utf-8?B?YkxKN3NQWkk1aE0vMm1yUkZZU1RCYXZVTllLNEhpZkphTGRGMTlwOS9jNVIx?=
 =?utf-8?B?a29oK2xtSVNKYlI2ZWRjRXN0QUpRUEp4ZGo0SVNpdFJDcXlkWDJwM3gxdU8x?=
 =?utf-8?B?bm5CL29qcVhzY2V1bXZKWlhubityN0NFN3VGRHplVS9XRWJnZ3VrSVBqQzk3?=
 =?utf-8?B?aGhyQ1lmZlZyNFNOOWZwbFhuOVVKVjhkWmg3MkNPUnBsSkU3dUhhcWRWNEw1?=
 =?utf-8?B?cGc2eU5wWll6bFVEWDJKYXJNaSticTd2c0k4My9CdSs1djBJWDdyOTVJbDFX?=
 =?utf-8?Q?+MhZ1d6b4Dg3+q/jQlHz7ZHhV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a86d64e1-53b9-4ab7-74fc-08de3123078d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 21:46:05.5413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QbwAu5KwtPVjUDa06fdUevFWnnHXMJH6oZUGPaFW9piGcvSSl8gfKWvsRYULgHFXT6/eYE3yaXiBEQGmIF3T2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9735
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

Hi Daniel,

On 12/1/2025 11:51 AM, Daniel Almeida wrote:
> 
[...]
>> +/// Create a C doubly-circular linked list interface `Clist` from a raw `list_head` pointer.
>> +///
>> +/// This macro creates a `Clist<T>` that can iterate over items of type `$rust_type` linked
>> +/// via the `$field` field in the underlying C struct `$c_type`.
>> +///
>> +/// # Arguments
>> +///
>> +/// - `$head`: Raw pointer to the sentinel `list_head` object (`*mut bindings::list_head`).
>> +/// - `$rust_type`: Each item's rust wrapper type.
>> +/// - `$c_type`: Each item's C struct type that contains the embedded `list_head`.
>> +/// - `$field`: The name of the `list_head` field within the C struct.
>> +///
>> +/// # Safety
>> +///
>> +/// The caller must ensure:
>> +/// - `$head` is a valid, initialized sentinel `list_head` pointing to a list that remains
>> +///   unmodified for the lifetime of the rust `Clist`.
>> +/// - The list contains items of type `$c_type` linked via an embedded `$field`.
>> +/// - `$rust_type` is `#[repr(transparent)]` over `$c_type` or has compatible layout.
>> +/// - The macro is called from an unsafe block.
>> +///
>> +/// # Examples
>> +///
>> +/// Refer to the examples in the [crate::clist] module documentation.
> 
> Missing backticks?
> 

will fix, thanks.

>> +#[macro_export]
>> +macro_rules! clist_create {
>> +    ($head:expr, $rust_type:ty, $c_type:ty, $field:ident) => {
> 
> I think this needs a SAFETY comment, or otherwise the linter will complain.
> 
This is intentional, the SAFETY comes from the caller. This is exactly the
container_of! macro pattern too.

Instead, like container_of, we have a safety header above:

/// # Safety

thanks,

 - Joel



