Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B901CB3C85C
	for <lists+dri-devel@lfdr.de>; Sat, 30 Aug 2025 07:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E41C310E053;
	Sat, 30 Aug 2025 05:47:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mexV4gm2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC6C10E053;
 Sat, 30 Aug 2025 05:47:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yXrjeUa4x5dnqD2IHLFEYNOpVO7WHyMX5O2loOmxrLhrQ9A2ZvUB1Ir2hk9oGzeNgkEQYe+hHlu7yjhUsidw7Z9fUXZl3m2G/+jAMz3gXreXN1LExwyMf2dGcT/QKL+tNy3n2gynjAFkDpWZbTiEo2L5trmcM3P7rFQdRkmDQQ/+tXtKqjNXq16URJcU8ARISYiic3me3xzd5ZpbBfgjteadMoqbHM6x+mxy+ZjIOaathAw5DeuASbrADuK1YwlCYfc0McGX53VEoGiNiBmgVY2R7aOkrQAJ4v6q3qwBH8Cotpem9wf16JfCOlutC6AWxLRsQkjNP2vXmB+qrQCLiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wIqjUfV00jWhoyEO4VsJSNzYSxKY3QwAuevBrjTtixo=;
 b=Y4EypfKrI1/kMvjEzBG0M/pb584rTCt/2MjYen5m9tOWnSsXWUJXPb1OVVjBe0Dam/LlIW2iRB01jpOO0yW+32OackLzyKfQF4g+3NpXqTQo/rJSqpXxxVSVu7oEVICZ5XuNtz+M7GQ1lFNMFXrY5Ap6jniwMYNGTS/o7d5ZSqEx7+DV63xqpVskchmnbhF/yekMEblrGARM1qQZvU2m/OnXmIVd7weFoR29y7jt4XTcDYkK8BrpZCN02lEzF5wylbZwiwTmIeDT7Ylffhq7+nIgVnX6SeXTpCrHZvvXxotSxRNLorAEhmTLhlVqyBssqfRLPQTIThm2lwWDj/SorA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wIqjUfV00jWhoyEO4VsJSNzYSxKY3QwAuevBrjTtixo=;
 b=mexV4gm2B1YVtdVVtbF85cdnRRpLKyX8F0ZofFP4ZzpPhkC53UgPvTLnhe81CDN/1tUjL+oDiYy9b+iMW37VEby948W/DpT4sf/JhKUgKZVLEoVKmUl2hL8N8MOFQRF7hV/yV/TcCF9fcr2VginmnjH9zvpEeQ30LhV4lQMh/OJX53s6q+Glc+3hZEc3u9dJbs29jXs8/wQDNQCeQ+Rm4XYg6qcESqGq9P4wwzLJdtq0VJ/jvcELjc0B0lSI0t7tfd6qT3b6Saj2dFVv8ruU+5uxixfC3maF0UqHfPy21MBCuUUQJq0tlFA9QM+zra+mE//sZ2ZW/cljqy7kO877kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by DS7PR12MB6360.namprd12.prod.outlook.com (2603:10b6:8:93::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Sat, 30 Aug
 2025 05:46:58 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%6]) with mapi id 15.20.9073.021; Sat, 30 Aug 2025
 05:46:57 +0000
Message-ID: <33168c6e-0dd9-47f8-865f-061be48d48f2@nvidia.com>
Date: Fri, 29 Aug 2025 22:46:54 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] gpu: nova-core: compute layout of more framebuffer
 regions required for GSP
To: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
 <20250826-nova_firmware-v2-8-93566252fe3a@nvidia.com>
 <e091c6c1-98f8-4876-b2f1-c928da7aa7eb@nvidia.com>
 <DCFCSPF1PTLT.2A4LKV4TAF0JU@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DCFCSPF1PTLT.2A4LKV4TAF0JU@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0105.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::46) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|DS7PR12MB6360:EE_
X-MS-Office365-Filtering-Correlation-Id: 82bd5867-2a02-4547-aefc-08dde788a1e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3RuQ2dETzRUVHU1enppaE52TGhsd3hoWXFOWkZ0d29XMzMvd0ppWW8xUVda?=
 =?utf-8?B?RDZ2ZjZPcXFmNWlxSG9lZjZpelpJWkxzajc5aTg0SFIrb3owZS80ZDBuWTJr?=
 =?utf-8?B?T3RWSmo5N1pZUmlxeEFNdkE5OEhzSFBNNGZNdXR3cUJpcHdPUXZTb2VyQW95?=
 =?utf-8?B?dm8vSVVnckhXb0xBL0JoOUhqQndiMFlSY1pLTXdqTUE5NHFGSkpCQjdwVE9C?=
 =?utf-8?B?TmNob2xXSFA4Q0tzaHFoRmJ5RERiZWFHcWZlRFF3Wk53bHFDNkdxN1NIa1NZ?=
 =?utf-8?B?VERFbWp6T0hvcWRWaUZic2VGMGJzaTNDSGdaOU9xVGVVQmxIWVVaT0RhbDJ4?=
 =?utf-8?B?aTI4NUtvbnU4SkJXOFVFUHBScE91QWFNMkNUM0dweXNlNVlLeGdHSEtxWUxQ?=
 =?utf-8?B?MTJlTGxhaTllZElyaEJTZGRHd1VCS2hYUnJwNUlsZFpXb3VURDFDUHhSZkRs?=
 =?utf-8?B?dGh2YzBiSU1xeGNMVFpZeGNFYU02Mnc0bG5vMkFObjIvck0wUzdzcmpNRkZY?=
 =?utf-8?B?ZVlhU3R2UDc0WkI5N3piUFMyZlJtS1B3REdIWmJDc1VZZmpiTGk4TmtpWXVw?=
 =?utf-8?B?eXVuZjF2SkI1RjJzSG92L2JyazhnRWkrZzFoS1pHTHNsOHY1T3Z0VFZnR0lt?=
 =?utf-8?B?ZDF3L3I4ZDB1NTR0L2tYZlE5ZzFVVWw5VGMyWVFraXorTG1uTDJLTjJOOWVp?=
 =?utf-8?B?OW9ROE1yeTYybVVoODNjRVV4c2ZoaS9QSkpENEFYcjFicXNPNnNyS2lIUnhE?=
 =?utf-8?B?NGhEcGJqM1ZFdXgxckNIa3FMYVcwQTB4UnFWMHJzUGlZdTRjSVBNN214MURG?=
 =?utf-8?B?bk8rV29oTDlrU1h5b2w2cEdhOVA1dTlZVE1OZ1U2Zy9aS0lVRkYwRlhVYnFZ?=
 =?utf-8?B?c0pvdVpsSXM5YlhUTHJWME9TbVdtczFkRE1FSjNWNWtkN2NsUy9xNmRLOVJJ?=
 =?utf-8?B?aUdTTEJyU2FtaFdGSEtOSkU1SmpKN1phc3owaWQ3MVFHZVNheHVIL0Z5Vjkw?=
 =?utf-8?B?SUhRMG5pSzRsNlJvRGoxOFNmeDlnK25HS3FsdFB5dXkxNU5RRWF0VlQ4V21z?=
 =?utf-8?B?UzZqVURXWUg2Skh3N2hMb1V4V3JOWUFEVzdxUGkweU5GdlkvVklUcTNabHZB?=
 =?utf-8?B?eis4cjJGLysrNGI2c1FGQ1dSaVdnMjY2bzBLOTRyNmp1Ylo0WGFuVStCTzk1?=
 =?utf-8?B?OG9hSjZ4M29NekE0V0FPTlU2U29ZMVEvTEVta0VUNU5nK2s5WDgrWkl4bXNT?=
 =?utf-8?B?TFN0S0tzR1ppVmQ0bloyQ3I1bU1jVWtzMXk1OStwWnlqOEIvV01XQlN5b0Qw?=
 =?utf-8?B?VHhaL2EvajB2enpWYTV2WmErem1pcEQ4cFdwUGh0VmlxRDVac3JQWnN3MHBh?=
 =?utf-8?B?MlJFM0lvbit0TDJVUG1GU1p1ekFLRmF2YWdBdjBnMzJlNTY5eWNnSzhwRWhG?=
 =?utf-8?B?eisrc1U3ZEE5NjhQMHRxSUM4czBERXpvVUhxbnJDckRWSkhUdVd5cVE0NHYr?=
 =?utf-8?B?STJuOFB2NWtLS0FHTHM2cnlEYUxhaHhZTm5wWHZDRFN1Wnh3Z0NNZ0NzQ040?=
 =?utf-8?B?bWZTVW44cUUzbk1nOFcvU0lHbGF6c3YwZUhLUWFGc1lNbjJkTFlSZ1c2dExi?=
 =?utf-8?B?ZW5pT3hEUFhadThwMDlIUk9aYlR2ZllTWW93RUo5L3lDcUQ0QWh4a1ZoSDhG?=
 =?utf-8?B?TEgrcWRSTnBZSmVFYXR3aFRpenVMa2k4NXAxZURLU3pUVlNJNWFEUUxzQitB?=
 =?utf-8?B?a2NaTkczZkhtMDU3T0RnUG1LU3dDcnRPS2pzdXFNUUhYZUNoNkkzNjQxQ3Ns?=
 =?utf-8?B?SUZKTDQ5M0RaSUY3M0diTE8zVnM2ZGZ2NkJOZkRhS1gwS1NqNWJsZjBRRUdp?=
 =?utf-8?B?VWZJSjJPUWNTSkpXM3loK0RDM2JqWlJtRUpLLzc4VnNpN0IvMjRvOTdqY1Fa?=
 =?utf-8?B?QWgrM0NhMHhtdnQrR214cm1FdmxGY3p1OFVKU2N4MEdKbjRFajcvMWlUdk1n?=
 =?utf-8?B?ZXB1a2RxOUhBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5968.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azEzR1JSYUtnZHRGSDNyQVdCR25UOHk2ZEpJYjUxcS9xVUcvenpoV3FpN1Yz?=
 =?utf-8?B?ZlJ6SStGZCtIa2ZwTXBxSGZVdWJTcm5LS2NEdFpucDRidFNQK0hvZXordWxT?=
 =?utf-8?B?ZFR3QTJYZVhDcnRCSWZLWGphNU5iTzUwR0dXUEdSS3dNUGhUdEtyTDN4L2N2?=
 =?utf-8?B?OVNQQzBFME9wTkhsTUVsQkt5WmdLaVp1b3p6ZXk3OEhRekhFZk5ZTFFMQ3oy?=
 =?utf-8?B?NUVMMUVYbUYyRGkyQ2Y2MGZTM0dmbVNjTEs2cHRIV2FtdDVsdmo1M1pwTzVL?=
 =?utf-8?B?Q3BWU3c5MkxFYWtzNk9vd0V4ZklkcWhqRkM1cjdrZ0ZMWG9pTFFqQUpPUHdR?=
 =?utf-8?B?eldTSmR3eE5PdkRYcnQ2MzlicG5DZVZYNUNzeUFFM2RUSkRVc2l5NlZMQ3lz?=
 =?utf-8?B?VDV2QWtLTGtCa1hBRGdxbEFsb0RLWkpVL295MGRTR0xDYmcyWGlVZU43SlVE?=
 =?utf-8?B?YU5ZUjUvaTVndzc3YnpsSUcraVA4eW55SDE4QkM2aXFRTDFLOVFLNlFld3Rh?=
 =?utf-8?B?OFVpTXJhNFhSWVRaTFlGWGhGckhiTG9EbSsrMGF0eHhPR2hVYjhrMVlyL0lw?=
 =?utf-8?B?dFZHY1RQZG80VUxmeGwzN04zNjN2c1p6V0xBMmw0a3Vkb2VXNjUxSURVMUlk?=
 =?utf-8?B?MnJ3bklaQ3g2ek5UQ2QvQXdQUEFIU2xyd1Q2RXo4NjZVaWhaQ0dSYTduTGFG?=
 =?utf-8?B?cFBOTGNsaEwwSFdNVFVLUDlqaGp6QWh5Zmd2SnhBdFNVSTJlZWt6RnorOE5D?=
 =?utf-8?B?MmtiNDRxS0MwUUJ5Z25qa3poWGoyUi9HUTIyWGpwTWN4dEp6WXZVQVBNZktj?=
 =?utf-8?B?dmZ6bCtMU2x4cEh3NWwrdUFtMGFKU1JrbTJkVGVodGpjNkt3K01nMEd6WlQ1?=
 =?utf-8?B?U0xxSHJkdzB6R1A4TmJZQTN6TnY1OWRqamFna1FvU1BoVlBJeHFXSXpGZmZX?=
 =?utf-8?B?cFBRNTFuaVIxZWRwM2JLcWsrV0FvL3hDa3RTOThid1J0aWZRSlAwc09WdTJr?=
 =?utf-8?B?RUIveEs5c3pBbDlFTVUrM0VtSWVmSkJVeXFncngwbnc4bmpxcUpXc1NqMnIx?=
 =?utf-8?B?UXBkYVJDeTI2UzhaNnpOZEdyWFZQRFZEWGovb0t5Tk1tb3pjOTZYbktkZ3lS?=
 =?utf-8?B?b1JIZ09nbkw4SERPS0FEUTU3dGp4T0NLWTIxb3FWNm53WDc5cThzZkttUGQx?=
 =?utf-8?B?VDU5NjluVjFOSUhXa3ZQMWRxZ3ZZV1lmZjE3aERUMWdEemlIZGMvZDRzN2hB?=
 =?utf-8?B?YUNMMjBLWWY0K3JXWXRwTkI1d21VbHMydTN6QURxNnJyTlpGT29jMTIzTm1B?=
 =?utf-8?B?TkI4ZndFZ0JCblVVaGRTNzd5bFprZ21xS293bVIwbDkzM21ucmFnT0ZINFFw?=
 =?utf-8?B?RU03bTVlQ3VpckNMd0pTY1BvR2IxOFBZNDNMcTdkRkgrNi81NllLNGlOU0N5?=
 =?utf-8?B?TTUzMjlBemJiRGJUMkxrcW45bkZxNTdRNW1GZ1BxY3dkUDBpTTdMSlhlSUdI?=
 =?utf-8?B?ZmJCdGljVEw5bkdIVi90anJaakt1TEZPeGRvOUs1S21uOEpPUWhnOFdhanc1?=
 =?utf-8?B?aU1VRngvV05HS2dpTVRReklLVFBiSnFXVFNrMnZhUmFHaWI1c3V6UFc5Ymtr?=
 =?utf-8?B?RTNzbnllZjYxT091aTZ6bnFxdGZUV2dOK0VmZ3Y0RGxYQzJWajdwcjlIQnRi?=
 =?utf-8?B?cXY0RUc1QlBKeGJ5ZS95SEZBZXBqbTV1RVpCT1FGZGpRa045TlJpc0kwcXBo?=
 =?utf-8?B?NzRmb3l5UHR5cmE5ZEdUMVNMeld3cXpGb3BEYlQxU1I2RktFcmw0ZTZYMFpJ?=
 =?utf-8?B?MUhEOFJLbGVkQTV6NXJQcC9kVno2RzRIYWtjQW4zOURuTmVWSGZ6ZlpUNHhM?=
 =?utf-8?B?am1UUnBUZTAzSzIzQkpnVUZNNTN3Um5OUWhjWjhDdUJHRTlpb2k1NE9HL0VI?=
 =?utf-8?B?d1l0a0o1QkExTnMrc3RabmpGeXB2dWoxZW4wUFRMaHZvRmdCdGI0aDllRjN5?=
 =?utf-8?B?dngzR1J0ZWJheXpVdXMyeElaQ0JkMUpMUzZhMUx6WkRzdzJ1ZlJhb3VkbDRm?=
 =?utf-8?B?MFd5QjJlVEdaRXR4L2hWdzEwSXFSVlJ3cWFpVExoUHdHZzdidUt0SzE2WW40?=
 =?utf-8?B?OUwyTG1CWWpGUGlhN1RteXFjMStJcmM5MC8yZmdtWDN1REJWNGJGbDdLdTVV?=
 =?utf-8?Q?iGj7KCuFnR+UBULC4FA98vc=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82bd5867-2a02-4547-aefc-08dde788a1e6
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2025 05:46:57.6307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I8BT9Tf9DHr9Gu/nCPrwU5D6KRI5RVCZ9PxwoA1IS8RiIljpE8euaT8x68jR1hBW080IAUt9cNrEjSngDaPrtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6360
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

On 8/29/25 5:59 PM, Alexandre Courbot wrote:
> On Sat Aug 30, 2025 at 8:30 AM JST, John Hubbard wrote:
>> On 8/25/25 9:07 PM, Alexandre Courbot wrote:
>> ...
>> We only support one version of the firmware. And in the coming months,
>> that one version will have a different version number.
>>
>> Given those constraints, we should simply remove most (all?) of the "r570_144::"
>> namespace qualifiers in the code, starting here.
>>
>> That way, we get:
>>
>> a) A small diff, instead of a huge one, when we update to a new firmware
>>     version.
>>
>> b) Shorter, cleaner symbols everywhere: GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB
>>     instead of r570_144::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB, for example.
> 
> `nvfw` is the module that is supposed to abstract the currently
> supported firmware version - but in order to provide this abstraction,
> it needs to refer the items in question. :) I don't see how we could
> avoid these qualifiers short of having a `use r750_144::*` which could
> result into name collisions.

My idea here was: "what name collisions?". There shouldn't be any.
Because again, there is only one firmware version supported at a time.

> 
> But maybe we can do a module alias to reduce the diff once the version
> changes:
> 
>      use r570_144 as fwbindings;
>      ...
> 
>      pub(crate) const LIBOS2_PARAMS: LibosParams = LibosParams {
>          carveout_size: fwbindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2 as u64,
> 
> Is that what you had in mind?

Not initially, but it would address most of what bothered me here,
which is having a particular version number all over everywhere.


thanks,
-- 
John Hubbard

