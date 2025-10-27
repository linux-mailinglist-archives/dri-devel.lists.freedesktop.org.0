Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F618C108D0
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 20:09:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD6DF10E556;
	Mon, 27 Oct 2025 19:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OVKtqUAG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011055.outbound.protection.outlook.com [40.107.208.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B152410E551;
 Mon, 27 Oct 2025 19:09:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nWPriDd+xInvHiwoy2uVg/hD6QFPz0i0qwyuhR2MkIj2LZc3MrwhKOSssUM/qdLux/w0oat+mu8VI1FSzacGlNg4thzP3JBc2w9wBPSHpcW4wMolUhq0iOquT90EjDISQUJT2cJrS0TLRlDx+yhZ4BWsU3oMu0egUeiikIYe/yW3dO5t2XShOgBFbbcwmPrC3KclG0XCtS9XD3rhIjlEugmxOATZM7ZTj4EajwM4MBTzgsjlOHLOETeUGaB9Ib7TKojxcISR7l9cmm82ucKRJLC0ztgWpdMXXAnmTgQr1RLClgqtZNg9RAJgrViVgibceF8sukf6Y5uh6c9AUeouhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZnUXYTMZ3bpYHyLo+FDliPIX4eiMDMpfjavcAqg4Jog=;
 b=xF6Rh0qVX4ySdHR4wkWGoGFV6OnlBbdcfiTpnow42k36IkN3rt7GIOJVmOZU/3BW6G5QtbJ/bRJjmjx7RCa08EynuIrXy6Qyol08WnWaWEmArw0cLFcIMp4WGqN03g958LokDe+nTGXR25iPCqq9TdMGPNIGnOI55GICmNIGUVzO1PgLv4s8PSSSJ+1VI1DUfv7V9/R/dnuAY3QRyc1xO64/AFoeMDOaK3VCUwRMGc/A44T3VIKjOnEH3Eg8n6MEwhP4w/yXWvvVAXPSVTPfVaBD40ErMTWNmp1mNv9Fflrd03b6bpbnWhg+56y+r0c/0cBha7scLIYferfUcs8dxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZnUXYTMZ3bpYHyLo+FDliPIX4eiMDMpfjavcAqg4Jog=;
 b=OVKtqUAGtEIIHpRSWbwyhFTP7+aDsILwOF1CMPymQ+vJaisCIQPhT4kA05nGsMsEo+/ueq8EFZ7WPwbQCZLNIj9TS77+pR4s7iWDYfLeOjMEhlMHR+AhQLQnFoIVFNpwxmx9lK9d6nv+dS90XSVL1d/RHpnyDspgaFAufH5j8P6Qt9velHz1EceaWa2ZhzlYBn1J0mE4EJH/fUmYaT4iKS/EIIRQjgMnLtPZ3O9gXzMdmha25qDBzCLMoeF6tXlyhfBrtX5/rnFaKKyIIiOuJKBZjzLIe5Bw0tdnevhmmbLxbi1BShMrkBfamdVKLIamPlNA6cqC27bNP2/hNPFULA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH7PR12MB5784.namprd12.prod.outlook.com (2603:10b6:510:1d3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.16; Mon, 27 Oct
 2025 19:09:39 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Mon, 27 Oct 2025
 19:09:39 +0000
Message-ID: <c94dd17e-0e81-47cc-9482-e8743d3bc68f@nvidia.com>
Date: Mon, 27 Oct 2025 15:09:37 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] gpu: nova-core: add extra integer conversion
 functions and traits
To: Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl
 <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>
References: <20251027-nova-as-v2-0-a26bd1d067a4@nvidia.com>
 <20251027-nova-as-v2-5-a26bd1d067a4@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20251027-nova-as-v2-5-a26bd1d067a4@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:208:36e::23) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH7PR12MB5784:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ee8f9d2-c2f8-4367-b879-08de158c609d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkEvNFpwT0NIay9TR0JkRUx2cURDdERhbW5xbG85eUtRSlUwcDlwZE1zVXBU?=
 =?utf-8?B?RVFPeHV1WnNmaGJ0OG5OYThPRzNlYkVRT2dPNHBqV0lsZWorMnIwWDhmdlJG?=
 =?utf-8?B?bmRpL3RNaGhXbHllemxCZjVXWWlKb0VXQUxEQXUwSjcyblBQaTR2VWdVVGI2?=
 =?utf-8?B?TTZiRlVWMW1oQWovQnNmaEc0Q1RSQ0VLNFpVL3pyeTJLOUhBOGNlNmE5UjBE?=
 =?utf-8?B?MmYyaVFnUGNYZDdyWDV2SGgyck9uMXMxQjA0YXBNR3ExSWNsU1U1eHBmbHUy?=
 =?utf-8?B?TEk2NXNOTGJZNWRXVFVWdnVmVVJGNWZ4RDh1NnBLTGZnV1hGcUZxODQvZGly?=
 =?utf-8?B?TTVwcm5LcUZSWSs2OGVEVE45ZFdaNTlyWUduZUhaNm1nK0pmUE1VZ0FjQUtE?=
 =?utf-8?B?K3lhNXZpN3c0U0hlWWh6QjdzdnJzMjBqMFVDdE56NFZUVEtoUmlDdDh3N1gz?=
 =?utf-8?B?RnJ3RmY4WHRhdXZ0dFpwdlRZbWJkNU02cUlvbzE1NkNCaDB0VE54YW1VTWRv?=
 =?utf-8?B?b3k4by9Zcnl4d0lQUEVmaFovZ1lSdCt1QllVVEk0Q3pNTk51UzdaelMybmRZ?=
 =?utf-8?B?VXpkcUhTdm9pVzJ6dkgyRG9JN3cwR25DcVZNUGdGR1RXQkRWREZkbVY1dnBy?=
 =?utf-8?B?NExrd3Y2Nk1NbmNHOWs3U1AwemswUmREVFhQL2VQV3o4bXI0cXhZTmVTQ1Q5?=
 =?utf-8?B?VTJyWldiNS9NMlA4WkhwM1VxdEFaMW1KQnhlSG9UN2NhSy8vLzR4dDJJZUcx?=
 =?utf-8?B?WGdlclhGWGxEQklNUWRkVTZLYVI0UmU3MXZzb29HRHBhN0NZc0hFbUlESlBh?=
 =?utf-8?B?MXZIRUd5cGVQc0lYWDRFekxqbzhaSUJhZWF0Uy9YYXNrTXpLTjhQYnZiK3Zw?=
 =?utf-8?B?b1RQSENaenBudjJSUkVqS0NaMnVQMFV4TFcvOURodUU0dWZQTzVUQUJ2MEl6?=
 =?utf-8?B?U2dabWFpMjNmM1Z0YkE5QWZiS0xra3FNYUVEbUFrNGpTb0luMHVQMVVycXV0?=
 =?utf-8?B?TTFCVVo1aWVsaXpTbnBqR3Y4OTZyL2duRGEveFp4VVFPN2N3K1E4eC9ld3Q4?=
 =?utf-8?B?bFZEZ3VsOVc3SzErb28wLzVsYkRDbGlNRTc2bXN4NXUxZ05MbEwzQzNJSHZ0?=
 =?utf-8?B?L1cyWWFFeXYyYjlxNWkrM1hUMkF1aDJnekdrSWhpbGdqUXJra1NDMUNaN0E2?=
 =?utf-8?B?SHJhT1cyQnU1eVZTZ1RBYURCMGh4Y3p1bFdidkdzOFV4SlRDc1plaTkvT215?=
 =?utf-8?B?am1tcW16ZndqalZlRG94S1BLdE1YU3loSDIyZG1KZTNGNDJRNGZEL3p2YlBT?=
 =?utf-8?B?aWFBeElTQlgyOFY4aSt0T0dxdnNpUGI0ZlZaaEhsNjczRVhKd1poQjlVTjBI?=
 =?utf-8?B?YWlLMG1xNHl0ays5YjkrNmhYa3Jqc21jUVRYam1DSVFtV3o2Q1MyWCtHeXpj?=
 =?utf-8?B?NWttemRaeW5TSWxOeHdkTXFUeVh6SXNtcUZVTkVsWElLcjYwa1ZvaFZJeFJS?=
 =?utf-8?B?b3I2b2JtN0R2dU5TSTZLckxwaS82Uno0eW82aVcxeXhmVW1pVDdnRlp3SWRt?=
 =?utf-8?B?WmdxN3Joc3FZRnQvY1I5Nk9mcFdZQWVBdnpDYzl6ZnhHQkNWenNRVlNXbW93?=
 =?utf-8?B?MjJidTZGeGY4OHdvSVNwcFNjVVJ5c2d0M0xuMkZRRVVyakVEeTFIVkUxVEJZ?=
 =?utf-8?B?eTNweTV4Z3oyQWhuZk50WitBR0pwY09ZaE13cGpMQk1sb3B3VkkwWTdDUmxS?=
 =?utf-8?B?c2I4RXVjOU5yQThOMHJNVzNQNGVZd0ZJS3k2MVR6M3Z4VWxId3BHOFN4SFk2?=
 =?utf-8?B?aDkrcENSMGhaNC9SUTlTNVQ5ckxpdWs1c0Vsc2pXSTIrcCtvTVFoenRMMjFv?=
 =?utf-8?B?bzNqQnQ3b3JERjBOUmtsYnQ1RC9oT3QzM2JxSTh3eE4vemliNkQ3MlZjcmxS?=
 =?utf-8?B?NnJla0lOSVc4OC9raDBGNFVPUXNyU1VMMHovTFM2bHF6TThnNVg1NFJjSklZ?=
 =?utf-8?B?MWFoRStUVWhja3RjbFFKa3Q2M3FSYThENFErNzFJckUyekdycVRDUjZnMXVP?=
 =?utf-8?Q?rkIA+2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHQzUHhwS3RDK05HRG1ROFNObGxRUS94NHJhYUc4QkpSTHhwUjQvZTQ5cUhI?=
 =?utf-8?B?QmZVK1BTalE1QnVEb2RqS09YSDlkNW9HNVUxQ0I3bDZjQU9KTE1sOTg5QzQy?=
 =?utf-8?B?TTNKV0tVd20wbERFbms2UkNnNkpvM1ZQNWN0RjhsZ0QrOUx2NWU4NXRERVQ4?=
 =?utf-8?B?TDI0WDFzcWt6S0NNaTdZVC8rT2Z6RWlTaDFmR2M0Y0FjVzBsUDVRMVd4VTVl?=
 =?utf-8?B?YVA4aE93MUFCWndSWjkvSjNSeGJudXIzUWhWQzhsZFJqcmo2NzFnaFpKTDJJ?=
 =?utf-8?B?TUJTUTdVM01zM1hOUG1JcVJqME9TcTBMMXBLZlhzd2pSWG1tRlRPRGhpNkdX?=
 =?utf-8?B?MURmRk9IdGJRQmxVeldLdlF0ZmRjZ3hkN1p5ekVNL1VNOU1kYWZyL2tQR1VW?=
 =?utf-8?B?VXc2aXM4NjVodjhCQXY0QmQ4Ly9iYW1MSzFDS1pRdG5ma1U5Q0RRT0hoT2xo?=
 =?utf-8?B?YmxkUTZzSTY2aUdDN0dSQjVJVEw0eGZ3ZEk1MXdIcHpORGw3R0VhZTFUL1Z3?=
 =?utf-8?B?NlptdEtjN081QThIMDMyTTFHSjdyZFdlOUZoZ0s3NnBmTGdScnYyZWVUY0Nx?=
 =?utf-8?B?aTU5L3l3Tnh6c1R5NzI0bkxoSFp4ZnNsUk4wdXp0VEVDejZ3bmd4SkM5TVBq?=
 =?utf-8?B?RmtoTkxteldHN2pMbUdFeUtoUEJlQ1hnODZZS2pQWHA1LzBWVzk3ZU5wWC9Z?=
 =?utf-8?B?aGdZMmxXZ2xFVnl5dWVZc1JyeVVXS2NmcENEbmpiYW1Vbnd1bkg2eTlmYmVT?=
 =?utf-8?B?QjdCNEtsQS91cm5ZcGVzeHVWbzRhb2RKcjhnTUxzVUFnanR5MDJ1Mi95Mi9W?=
 =?utf-8?B?K3ZiR2Y1dXZaSUFpK1BCZHNBRHh4ZE1wT2srYkFxNHZVdTRHU0VJdTNsb2dl?=
 =?utf-8?B?eVhTakY2N1ZMRVduaHN6TGRyYTAySWRvVFhPbzBqZWNVaFlGWkFvZGZBdHlz?=
 =?utf-8?B?NW9kem43UU1LZHpLajNEV1N5ZDRXalAzRUkwZU9zR0R5SzVNcGFuWXQwYjVr?=
 =?utf-8?B?S29JV2pJcDhtUGVwcWtvR3c0dFcxVTZ5cmZmUjZUL29yS0gvYkNxaWt2aVQx?=
 =?utf-8?B?VzVXWDhwanJXVjFYWTJQUGJyVGRaMG1OcXZvZUhaOVNqaDZMWUw3a202bUxG?=
 =?utf-8?B?cTNobEF2cGJTUDVtTE5rZVpmdTRoTVA4M0VDN2VncURZSDlCOHBGOHZaRDhY?=
 =?utf-8?B?MmRjTFFnNzdxelpvMTlLcE43UHBvNHJqSFJPRDlCS1BiSWN5NHU2MThhM0lF?=
 =?utf-8?B?bExQMGxRaGg5dWtNZzFuZzVCLzNnSkduUStsdWdtYXAzTk5qeFBCSVJuSXZp?=
 =?utf-8?B?MXk2TXdvWC9heEE1c3U3dkwrOG1KbkdEWkhwL3hzM2UveGM1cDVxWHdPdWZj?=
 =?utf-8?B?ajlPMHdIUUNPN2hvUlNCaXQxRk5VN1dlY3JkZFhVZ0VSYmRjVnkwZ3JpWmtY?=
 =?utf-8?B?K2NDUFhNVnBlUXBRSHJBRnZaUjJXOFQ1MWNsMjhKYjVCN0RPVnBLWVNBVkk2?=
 =?utf-8?B?UGVjaXVGN0hGRHYwb0kvUUxyYVNucUF2TWdQZTcvakJFenJ4ZnZZeHN5MkR2?=
 =?utf-8?B?U2VucmdKZVc3R0V6V2JKNTlGcU1qRldhbGxxMU9kOE0xZk5DT3ovWG5WY3F5?=
 =?utf-8?B?V0wra2JHd2xzTnQwNTNHdVRDTTNEUUV3VUNHNjA3bVMxdkxTRzRHTDFFL1lp?=
 =?utf-8?B?bUdwSVJvR0pIWnd5Sm5aTWt4TmdZa2o1Z2plYkpFaVIrSzdINDU1YXEvR21o?=
 =?utf-8?B?Y3hrZFo4T0NpRG5PVWt2YW5KbG9vWHMya28xaC9qeTVKZXllVFF0RGVQdnVo?=
 =?utf-8?B?am5vUGQ5VEg1Q0Q2TFA0Sm9Ld2MzN0cvSHYwRERQMXhDNnB1dE9rYjBNaW1j?=
 =?utf-8?B?MFF0dXJXaFJsNnhGcFpiL2h4L0RuckFEbXJ2dFJ5TjNmcFd6VlNnTTlhNVkx?=
 =?utf-8?B?SFErTlduSTJuOHhLYlNkcExIcmtyUGdZM1U0M0JGekxGc1NYTVpUL0dMNlFj?=
 =?utf-8?B?TTBIaS90aEx0aXpRcjVoR3pLc0FlVm5WR0tDYWdlQmsrcHhxVGZqL28zRlNB?=
 =?utf-8?B?MWFPZHdFWnN1bmoySzZpNTN1S3cyWXNFalRBQnVxTS9kaDdOK3RXZWxqSTU3?=
 =?utf-8?B?VHN6cTVKN1VlTXhwbGlDaTRzNjdNRWhiUkZxWCs4MTNXQXVVbHBKR1NSWEYx?=
 =?utf-8?B?T1E9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ee8f9d2-c2f8-4367-b879-08de158c609d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 19:09:39.5450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d9typ5Oq7GF6KE+AVDFRlcsWsaG0zXWGLp/ENB3t812pim60Q8/O0ufA+PciAxcW3PPlHaRsAaTXfuZCN8KcNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5784
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

Hello Alex,

On 10/27/2025 8:54 AM, Alexandre Courbot wrote:
> The core library's `From` implementations do not cover conversions
> that are not portable or future-proof. For instance, even though it is
> safe today, `From<usize>` is not implemented for `u64` because of the
> possibility to support larger-than-64bit architectures in the future.
> 
> However, the kernel supports a narrower set of architectures, and in the
> case of Nova we only support 64-bit. This makes it helpful and desirable
> to provide more infallible conversions, lest we need to rely on the `as`
> keyword and carry the risk of silently losing data.
> 
> Thus, introduce a new module `num` that provides safe const functions
> performing more conversions allowed by the build target, as well as
> `FromAs` and `IntoAs` traits that are just extensions of `From` and
> `Into` to conversions that are known to be lossless.

Why not just implement `From` and `Into` for the types missing it then, with
adequate comments about why such conversions are Ok for the kernel, instead of
introducing a new trait? This is exactly what `From`/`Into` is for right?
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Link: https://lore.kernel.org/rust-for-linux/DDK4KADWJHMG.1FUPL3SDR26XF@kernel.org/
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/nova_core.rs |   1 +
>  drivers/gpu/nova-core/num.rs       | 158 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 159 insertions(+)
> 
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
> index e130166c1086..9180ec9c27ef 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -13,6 +13,7 @@
>  mod gfw;
>  mod gpu;
>  mod gsp;
> +mod num;
>  mod regs;
>  mod vbios;
>  
> diff --git a/drivers/gpu/nova-core/num.rs b/drivers/gpu/nova-core/num.rs
> new file mode 100644
> index 000000000000..adb5a92f0d51
> --- /dev/null
> +++ b/drivers/gpu/nova-core/num.rs
> @@ -0,0 +1,158 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Numerical helpers functions and traits.
> +//!
> +//! This is essentially a staging module for code to mature until it can be moved to the `kernel`
> +//! crate.
> +
> +use kernel::{build_error, macros::paste};
> +
> +macro_rules! impl_lossless_as {
> +    ($from:ty as { $($into:ty),* }) => {
> +        $(
> +        paste! {
> +            #[doc = ::core::concat!(
> +                "Losslessly converts a [`",
> +                ::core::stringify!($from),
> +                "`] into a [`",
> +                ::core::stringify!($into),
> +                "`].")]
> +            ///
> +            /// This conversion is allowed as it is always lossless. Prefer this over the `as`
> +            /// keyword to ensure no lossy conversions are performed.
> +            ///
> +            /// This is for use from a `const` context. For non `const` use, prefer the [`FromAs`]
> +            /// and [`IntoAs`] traits.
> +            ///
> +            /// # Examples
> +            ///
> +            /// ```
> +            /// use crate::num;
> +            ///
> +            #[doc = ::core::concat!(
> +                "assert_eq!(num::",
> +                ::core::stringify!($from),
> +                "_as_",
> +                ::core::stringify!($into),
> +                "(1",
> +                ::core::stringify!($from),
> +                "), 1",
> +                ::core::stringify!($into),
> +                ");")]
> +            /// ```
> +            #[allow(unused)]
> +            pub(crate) const fn [<$from _as_ $into>](value: $from) -> $into {
> +                kernel::static_assert!(size_of::<$into>() >= size_of::<$from>());
> +
> +                value as $into
> +            }
> +        }
> +        )*
> +    };
> +}
> +
> +impl_lossless_as!(u8 as { u16, u32, u64, usize });
> +impl_lossless_as!(u16 as { u32, u64, usize });
> +impl_lossless_as!(u32 as { u64, usize } );

I prefer consistency with the notation in num.rs in the rust standard library:
impl_from!(u16 => usize)
But I am Ok with your notation as well, which is concise.

> +// `u64` and `usize` have the same size on 64-bit platforms.
> +#[cfg(CONFIG_64BIT)]
> +impl_lossless_as!(u64 as { usize } );
> +
> +// A `usize` fits into a `u64` on 32 and 64-bit platforms.
> +#[cfg(any(CONFIG_32BIT, CONFIG_64BIT))]
> +impl_lossless_as!(usize as { u64 });
> +
> +// A `usize` fits into a `u32` on 32-bit platforms.
> +#[cfg(CONFIG_32BIT)]
> +impl_lossless_as!(usize as { u32 });
> +
> +/// Extension trait providing guaranteed lossless conversion to `Self` from `T`.
> +///
> +/// The standard library's `From` implementations do not cover conversions that are not portable or
> +/// future-proof. For instance, even though it is safe today, `From<usize>` is not implemented for
> +/// [`u64`] because of the possibility to support larger-than-64bit architectures in the future.
> +///
> +/// The workaround is to either deal with the error handling of [`TryFrom`] for an operation that
> +/// technically cannot fail, or to use the `as` keyword, which can silently strip data if the
> +/// destination type is smaller than the source.
> +///
> +/// Both options are hardly acceptable for the kernel. It is also a much more architecture
> +/// dependent environment, supporting only 32 and 64 bit architectures, with some modules
> +/// explicitly depending on a specific bus width that could greatly benefit from infallible
> +/// conversion operations.
> +///
> +/// Thus this extension trait that provides, for the architecture the kernel is built for, safe
> +/// conversion between types for which such conversion is lossless.
> +///
> +/// In other words, this trait is implemented if, for the current build target and with `t: T`, the
> +/// `t as Self` operation is completely lossless.
> +///
> +/// Prefer this over the `as` keyword to ensure no lossy conversions are performed.
> +///
> +/// If you need to perform a conversion in `const` context, use [`u64_as_usize`],
> +/// [`u32_as_usize`], [`usize_as_u64`], etc.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// use crate::num::FromAs;
> +///
> +/// assert_eq!(usize::from_as(0xf00u32), 0xf00u32 as usize);

This `from_as()` syntax will be very confusing for users IMO, honestly we should
just keep it as `from()`, otherwise there is confusion and ambiguity around
whether someone should use `::from()` or `::from_as()`. Please let us just keep
all infallible conversions to use `from()`/`into()` and all infallible ones to
use `try_from()`/`try_into()`. No need to additional `_as()` prefix, as it
creates confusion. In the end of the day, the fact the conversion is lossless is
not relevant, all conversions that don't use the `as` keyword should be expected
to be lossless right?

thanks,

 - Joel

