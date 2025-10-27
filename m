Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3C3C11252
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 20:37:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222F410E183;
	Mon, 27 Oct 2025 19:37:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="di9viXEs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013056.outbound.protection.outlook.com
 [40.107.201.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 220AE10E183;
 Mon, 27 Oct 2025 19:37:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mz6IVNtOa4gJ3TxvBKguUtBWFX3yd9sR1Gy6gVJQ01UMopGtqAETUcqEm067h18ltFxHcgAeG4jGWOfT7W8mvyF5UKpfB2ibr/tyo1J0dcC7vQ3Q8+BZ0gdA+pn5EYgs2m2vM0b8tApCHT3EiX3VHHge81I+4ipLsBl0hByxxDE+sLmIdJ4+4iEbnI8k6c1NAhfX0dyCHz6MG+sQboy/DgO4Jn+k/nUnswFJ03wvFRoiGMiwiGjvKCK/p8awS5To785aoyfMcC7URuvM+Tf/EiyePPqO2Ed9Wi0H9586OwltYunVWKs0mcyRJXkp5bdxP7ZAUkVkF56wDucf0OX+Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1yF7S1x4c3lkd+AVt2AaNP0rSknPUPDQKlVdGas8l24=;
 b=nlCIZW3aiQIoRXQix89BgvlugT/DB0oGsNloGJ8NOFiC7SZwZNNGLE2QYRO+U7VnyzuX+/av6EpJq7Nb+eLaRs8hTE+j6DzL7sK1PCkFUKmOGw5OYgKjLYATMFRpPEV0CU6oc5nLeLgQ1hgd82cHwsNDsAI0zv0vPnTTX83DolIFPLl8lK65ZoJLavZ2MomsCJva3O7h8Kx3aBGlZRfp9M4aXbGU4IjvVURer6UBdt6FW/DCzOf62dYKGn+8gUEPruoalZZJX7efwVhkYWHJ9vrVaCpB5ySOF4PxQELXCCChLwZGXg+kGnA/H8vYXBpjAIPFTOQTtUX2y6byvubqTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yF7S1x4c3lkd+AVt2AaNP0rSknPUPDQKlVdGas8l24=;
 b=di9viXEsmTe+Z8+6UEDYQD7Ab26jK6xToMP8+u5+PnKYN0K7jZn1iI6oO0QPr+oQLaW34cZf8mO7TawHMdbXafhEnO+H+7edd4q5eRFAGf0QsETX9eQnaT3LzpyUazMUo4E6IvndIx1ptqZmtZdBlrD/C4j4WDm6+4zW/fCGlyDPQojdbOYRTE3yezElvVdZV4V8T0EWih0z7pjU/1gXIJ5xK9LfS/vMO5JcgV77zol5CZx7UunjKyWg1KGhs0I7FuspnCej/HCkxoq+/9fqsulFNWlyovM7BfIB+nzgFfPuDOu+mE1nkwN8DMiEIUkvmj6VxDyI3lruicJjRhVfgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SA1PR12MB8947.namprd12.prod.outlook.com (2603:10b6:806:386::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 19:37:22 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Mon, 27 Oct 2025
 19:37:22 +0000
Message-ID: <080c5b19-818c-4f18-81ac-93eabc8fe65b@nvidia.com>
Date: Mon, 27 Oct 2025 15:37:19 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] gpu: nova-core: add extra integer conversion
 functions and traits
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl
 <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20251027-nova-as-v2-0-a26bd1d067a4@nvidia.com>
 <20251027-nova-as-v2-5-a26bd1d067a4@nvidia.com>
 <c94dd17e-0e81-47cc-9482-e8743d3bc68f@nvidia.com>
 <10945c03-8642-4c19-b0ed-ffb20c075291@kernel.org>
 <4ec735c2-d0cc-43ad-8184-b30359c8d570@kernel.org>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <4ec735c2-d0cc-43ad-8184-b30359c8d570@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN0PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:208:52c::13) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SA1PR12MB8947:EE_
X-MS-Office365-Filtering-Correlation-Id: d551866b-131c-4469-74a3-08de15903f86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djV4YUxzRllTZTkwRlo3S1I0SVJrL01lL1BYZTdHOE55NEl5cHR0c0M0Y1Y1?=
 =?utf-8?B?ZEU5bXllRFRsN0JYckkxbUVac0lZM2Rvd0ZqaGtnSm1SY1R6ZE1Gcyt5RDNJ?=
 =?utf-8?B?WW51U3JaanFEV1ZaekJrejdxQ3NoNzI3aXI3ekVPM3I2WWJVSExZTk1mdFBa?=
 =?utf-8?B?S09Ua2dKd1JBUGpqcDlCNm5FdE1sL0hSUmRkYkt3UUJMeUMwVjF0M3pNenNp?=
 =?utf-8?B?aTgzcDlTclNRYmlsYzk3MXJzL1lKL0lTL3YrZ0RCTXJXb1VSK1BOeEozUlRZ?=
 =?utf-8?B?RklVZ2JKYkR6VHB0cmwrdXk5eE4zNTdxbEppdFZOR081U1dXSmY0OFVCTklF?=
 =?utf-8?B?VjljL20yZVNHN2xCTlR0TlcxL0pHbzhTc0ZuMnJWMUpNUlNNSGlSVXNTS0tJ?=
 =?utf-8?B?TTFsdXJiaDFTaDh4UmxRZk1sOUlydCtiTVlvYlI1UFllWGlxYk9Tc0JINU5w?=
 =?utf-8?B?RXczVkJxSmo1bExuZGtnMzZFQytGVlQvQ1U2RDZkOE5QcEJxVnRRMnY0MEs4?=
 =?utf-8?B?WmZDZVVrWms1RDhzdUhKcnJpRnZtRTVIZHQrWVFXL1RjZFZGWjRFK0VwZmhI?=
 =?utf-8?B?RUQxSXpJeEw4SE04NEtXS0l0NVBiTHVaU2l5TFZHVWlwYWdKU0krK1hHTUxx?=
 =?utf-8?B?Wlp1T0RVNE8xbzVnVVcrVHZUbWRPZ0xSOW1tMlhYWnFSS0w4ZVo3UkJXSW9D?=
 =?utf-8?B?WUppS3MxZmJ3Nmt6cW5wNGJFTEJFbGNWMUJjS2c0d21McFNIVjBuUTVoSDBx?=
 =?utf-8?B?cFNra0RYUHFoZmZPMnA1TTExYkY3bGR5OFBMQWtNcU8yTkMwQkU1NFc5UW4v?=
 =?utf-8?B?MExKelo4eHNyOTZhYTJVNFlaMEtsdlVsZjRvOTFGUGdxYy9ncE03Ym5jbWZQ?=
 =?utf-8?B?a3I2RXFTSUdSTmhseS9TMzhEYnRrMHVmQmtaNUZFT0dFaUlBL2R3TWQzSUUr?=
 =?utf-8?B?b1d2eHM2aXBGZjVzbEo5NUNQT2FrRXQvV3QyZjlUczlBeUtaME1Za1h1OEVC?=
 =?utf-8?B?UXlSSmFFdjVLSXh1WlVXbnBRQUJQM3RJVzd6THlJYlJnSm5rQlg4TVM2cDhU?=
 =?utf-8?B?ZG5LVWpuQStPVUxQOTlhQlpYV2FtYnUvczh6QlF5OG43L1lJZkkrM2s1SFIz?=
 =?utf-8?B?aHZhZ3YwN0hFOGxlekZnNm4vZ3o5SWk4N0dDK1JPZm5lclNid3ptdExLWCsr?=
 =?utf-8?B?U2hBYWpPTCtWdzhpcDFzNllBM2FJQmtsbzBVWE9USzV5VndVNnpKbHN0a290?=
 =?utf-8?B?NjUrV2ZMeVFQcGNRNFkrcTl6ZTJnRjhMVzNtOXhsZWRnR3hSS3dsOG5aTmRJ?=
 =?utf-8?B?V0E0cmZkMHJMYXlNZklMaFV5bER6cDVZMW1QT251bFBqeTZUNTVlR2xwYVoz?=
 =?utf-8?B?WmY5enppZlBWOTZINTgwcy9iSXVBRSttSHFOby9CMDF4K3FJUm02Nk9ERDRR?=
 =?utf-8?B?WDhtcHZPT2lZTm5XR3ZJTGNMajNJYjh1TzBwbUd2MVRVNTg1c1UxOU9INTkx?=
 =?utf-8?B?MEZMN2FoV2xJTUNySUg1WmR6VlZXNHlhcXB4NTloeEozY05pY01zcEJtRVBo?=
 =?utf-8?B?QnN6V3FoZ25KbjY4d2RwVUtwNW5iK3RSWW9wUVpwQlNHU1lzVXNJM0R5K1dH?=
 =?utf-8?B?aVVjalVXZGZvdi8vdUwvWjUvNkU2eTk5SUljV21MME5LcjJCeWJXMW1IUnFr?=
 =?utf-8?B?R2luTE5ISFVhUW5EQWZDOFhyNFNlMmxVdU1GMGU5Q3ZjMzBHUEI2SjY1ZzVG?=
 =?utf-8?B?UXZjTkF4L0dVdloyeU95SVByTlhZZTBqYm9lS0JZVHJCazJaNURmbWhaN2Uy?=
 =?utf-8?B?LzkvSldCS3hrbHhMSTVkMzIrTHZMV25majlHSkViK1ZVR3NYWHdmTkhzcHJw?=
 =?utf-8?B?dVY4bExHMDJpUFMrdXdUbnFGdXR6cHRBdFJsZitScGlUQ2ludGxpWGN3WUI2?=
 =?utf-8?B?M1BzN2hkMnVSR3hnTmJDaHI1aURJQzcvcElZaFhkQ2E1aXhqYmF3eDNxTTJO?=
 =?utf-8?B?ekxNZ3VrQ0tBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFlxOVRNU0FCRTc2dFh2UmRzRURDS3lra3dvTW9FTGp3TGErYndRRGNFMm5W?=
 =?utf-8?B?QklOemdranFEQ0ZvaXZGQnY3K2NwZ0wreVIyeXpUZkhZd3FQQ1FEVDZNZUpL?=
 =?utf-8?B?Z2YzNU9EWVcwZ1VBMG1zMVpVTTJOWG9EbE9QaVFiZUEzVnN1SU5zK3lWZ3FR?=
 =?utf-8?B?SjdIKzJ2T21xVjVQa3pPSzJhS0doQ3N4VXRneFo0amhZMWZjbkJtUklEbmVi?=
 =?utf-8?B?a3RoRmlRNW81eUo2YnRJM3dtZjRtQUZGaDlJcmJmYWNPVS9XN3J5U21lTytH?=
 =?utf-8?B?SFd2S2ZEN0NaeXBMUk5XbUszaGRmejRJMkxIQUNVeWV1cVVCdHB6S0JycGwz?=
 =?utf-8?B?OFJWSzMrblNic1UyUi8wdDlUQnlYOVhmWVBvK2xGdWxkTFVTTlNsVGlqclBN?=
 =?utf-8?B?TzZHQUJNUWE2S3FxeGZuN2p6VGI4YWhvMDRaTUZlTTNzbGFHVmpDSlZWcmcy?=
 =?utf-8?B?Qk9xR1lRcU9ocmNFQnJSdCtqeTVWTzFQYm53cU1Cc0I2bTgwNENOL0hiZ2Qr?=
 =?utf-8?B?OHhEYzR5NmV3S1pHQjNzemRXMllyR1BpVjhkMW9MT0lpTUNoVWJ4a2lYRWxU?=
 =?utf-8?B?bmc3a29iS3VXbVZHSkRrNVJjMHBGaEpmNHQ0ZTZBTi9ITVB5bU9kVXdqUmJY?=
 =?utf-8?B?a2xIUVViVFd1OXdyNjlJUWlQdnMyL3A2cWRDWm14d0psdmhZSUFtMjJRRHhS?=
 =?utf-8?B?VnZ3NXpiaW41ek0vbjBjTzJoL1JvclRhV1B3aDRTa1FLSENqNUczOEEzUGpn?=
 =?utf-8?B?cldwODdZMld6N1BIZ29CZzBBRDduWEhLZm5tQjZnSWUzRVpzRjNhV3QxWWxh?=
 =?utf-8?B?QVBrZGptTFJvVWlycDI3VG1vb0F6OHdUckpmL3hIOVVaWW02NEw0a21ueXhB?=
 =?utf-8?B?OURpS0pzTXhQUlU3ekxHM0VZbVg1RlhQTm04M0FwcDJ0cmx3NjNzZGp6U3V0?=
 =?utf-8?B?VHhNZzZTQzFjN1hDOUp4N0dhVXpkTnQyOElPK01WaEV3Vks2bXVrYTdjOUlp?=
 =?utf-8?B?WEdldnBkYmt3Sk82K1NqeDJVMW5Xa1ZweFU5eDVyWXJCQnBmam5RcTIrUGx1?=
 =?utf-8?B?SW1MUkV4N01NV1pRYXc0bUVOWTJON2U3TFgrTzQwWWlPeVl2SDAyLzloQVFx?=
 =?utf-8?B?TjdPQnlpMHlNZGdjYzJOYWFQRjMvbWhpZzY1SGVDVHVoL0wwVUFwVktRT0Zy?=
 =?utf-8?B?L1dqbEhlS2xJZVBBOXNDWDZlODFzZ0ZUWjV1MFUrYzNLWEpjQjJRdzBsd2Vw?=
 =?utf-8?B?dDdsTWo2U0ZESnZvQitnY0hVSGZ5cE5aUXNFY3Nmc0dUOFFiRytlUVpZTytz?=
 =?utf-8?B?bTVaZ1N6THNQRkJjZTRReHRLUlNiL044U0E1RkJoZms3NWdaL3Z3eTFIV3Qy?=
 =?utf-8?B?VWVaQXZvN1NMYTdrRzhnRnl4ZUs2TWFWdFQxTFJIOFRUL3RUNEU3TmF4ZmZW?=
 =?utf-8?B?VFp3V3pScVorcXlFRlpMeTQ4aWp5eWhKWXZKRTlwMGh4ZVA2b2RmTHdaenNx?=
 =?utf-8?B?QmZoWnJyV0UweXBzMUloS2NhaEFDbFp6R0NiMHlIejE4eUViU3lWYXZSR3NT?=
 =?utf-8?B?SXE3VVRPTnRkajhrcW9ldFUrNmcxd0Q4RGpKTWdkckljVGJKOENYdUtTQ095?=
 =?utf-8?B?Nmk3QTFGN3piaGNVY1V3QWdnZjU5eFpuVVhjV2xzRldkVEU5MWt3WFRhaXJu?=
 =?utf-8?B?ZVBmT0pGMTRLMzZVY2IxdU5vV0JCY0JoczV4RWdqekNYZnNaa1hlREFxYVB4?=
 =?utf-8?B?MlJtU2VJMTk4enVETUx4WDE2YVVMeWFxMjBlQXJYSGx3VDNlUTRoN3V2ZWR3?=
 =?utf-8?B?TTRKMzFTWEszcXp3L2p3cmo5S0I3ZWxCeitvWnYvZ0pUNDQ2dmdjWnRJb2ZM?=
 =?utf-8?B?aUhEVUxFaGEzOXBxZndYTUxYRlhyRERBNjFuRlhDYnJMVW05RlhKMjV3dnJm?=
 =?utf-8?B?T3hOL3lkRkxHaGUwNXowTWYrUGZWRDRZa2VOT29mKzZodnlKajJVTmlxRFlK?=
 =?utf-8?B?VnVCVU1ibzQvckRsMmRXUU1ma09taGpFUjRQYXVGMFVmZVJIU0ZpdUkxSXZ0?=
 =?utf-8?B?TVFyaWFOdTJPbWkrWGZXd2FxazRyZUdiYm1uYXlreHU1dkh6N3dhaklWVHE4?=
 =?utf-8?Q?0Ql2eVx5IINFL+A7rETO1YhZk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d551866b-131c-4469-74a3-08de15903f86
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 19:37:22.0319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XZCiYkFiKmOv/2NqBsfTy/CofFcnZp5bM037HX7my6GLM/W2o0LDSYM+pL4Sk8LFdnV4riVKTnvRWs0aIxnEWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8947
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

On 10/27/2025 3:28 PM, Danilo Krummrich wrote:
> On 10/27/25 8:23 PM, Danilo Krummrich wrote:
>> On 10/27/25 8:09 PM, Joel Fernandes wrote:
>>> Why not just implement `From` and `Into` for the types missing it then, with
>>> adequate comments about why such conversions are Ok for the kernel, instead of
>>> introducing a new trait? This is exactly what `From`/`Into` is for right?
>>
>> https://doc.rust-lang.org/reference/items/implementations.html#r-items.impl.trait.orphan-rule.intro
> 
> (Sorry, I didn't mean to send the link without additional comment.)
> 
> We can't do this due to the orphan rule, but even if we could I think a separate
> trait indicating the reason for the conversions to be valid is a good thing.
> 

Thanks for clarifying, yeah its not ideal then as the user of the conversion
needs to remember when to use from vs from_as. I don't think its terrible, just
a bit confusing.

Thanks.
