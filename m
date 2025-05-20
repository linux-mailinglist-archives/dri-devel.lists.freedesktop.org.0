Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4FAABD10F
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 09:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B3C410E405;
	Tue, 20 May 2025 07:55:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sjLEfNyL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58FE10E3B3;
 Tue, 20 May 2025 07:55:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QPI8kxRzsvaT2pk6MiDC37LZRFdpmQOHbA0djvvTvifw40P99lEI7ybVq0Gx3JeitFPv8yFeLeX/SOiFPFTcR2XVnxD0xC/rsXQpfzw6SRGAmVs/t6eZ2rpJ5UQTMXxTAp8Ts0jdB2dXhRs5ya0I+lBy5DDL869GLVUhFe6alUXAo9+9S+aAFoI10g/wfdIM13rCtCzdr4rrecOIuUA/BzJGGVgUsXAGNsoylNm3Bt/pgllA45AiH1KpCD5r+QAKk/i07mVr21TcxjzM46WdzhWfEtGCq6KU39fyvYObLDTruQx3435PuseMEOY+FHHVHBB6G4D9jt04qjFxBHqz4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGTJKDn75C2oA4+VyEkhJgenXoxNsdxFDxfekg/UPBU=;
 b=RXmigJO3vsrJkLGzfGw0XjJbe94P0+G1obFGpxJGfQt999LAgMT77YDEYsjn3xKIVq2+PsyRnnADmy3tbVMFuYpT9Ie7RJudpzFL+M2zRHUsaZ1ThAdvEhgkQwc3be9g7POSYbT/4UASN3FM0EClGKEhTpEbUUxVcJp2NeE8IM+v3ZPRTPHE+2rxsqFbewzazBgDcP+XrHi98EI8f7XkGXQnQohFGu91VQqRNP0z2WtbXSkQivjtqavyixPl4ZxS4H3D3yRqDM0DhHuUMpfWQa4A1ajnWAN54VL/Wzwfjj4RTYI264JvUMAIOhrYtCdRrTFV+iLmJFsE+ePg8c7rbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGTJKDn75C2oA4+VyEkhJgenXoxNsdxFDxfekg/UPBU=;
 b=sjLEfNyLpR6Nc4Xbz7BSWMqFUQUlvN1g+LbaI5xhTsmV4QQVzlqSe+mCO31bcs2uGEglScmx1pGsAjiKeVH/ygFMhX5xN+QwE2Az2EJRAZXD+5JoAhfZ/y9aXeyHOJ8PA2n4zJfAL5Gu9X/W4S3d86s0cfZrBkL6esCx9FocplIms6G/bL57npz+/9gE/omtJj6ieozos5RccxLXLIwLlUQsVSkd5JYWYW9RrlGQUsBF31ReULA/qQmhTe5/8tOj3yT2QWMqAAxE+6fbTsTdrSeEEjUYiaOVedIf3FXiOZQzl6sB/hKovMCVKe/S0gP7YbeyOvPykxcAfrIL8rRoAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH7PR12MB5805.namprd12.prod.outlook.com (2603:10b6:510:1d1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 07:55:10 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 07:55:10 +0000
Message-ID: <4fee85be-a8c5-4a99-8397-c93e79d72d15@nvidia.com>
Date: Tue, 20 May 2025 03:55:06 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/19] nova-core: Add support for VBIOS ucode
 extraction for boot
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
 <20250507-nova-frts-v3-16-fcb02749754d@nvidia.com> <aCN_PIYEEzs73AqT@pollux>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, John Hubbard <jhubbard@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Shirish Baskaran <sbaskaran@nvidia.com>
In-Reply-To: <aCN_PIYEEzs73AqT@pollux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR05CA0047.namprd05.prod.outlook.com
 (2603:10b6:208:335::28) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH7PR12MB5805:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aac79c6-f4f2-42e1-bf8c-08dd9773a4bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TDJSMjRTMGZLTU1aOHpDRkUrRnhLZ3EzejVHaWVPZnFueHB1aFdlMmFTMXNx?=
 =?utf-8?B?cUQzdkp5US9lTkUvbEFnVDczMlpGNFhMRjhUdFNEZU9oVHpUc09nakJrTkVD?=
 =?utf-8?B?ZFE5d1EyMnRKRXEvZWd2aEVKK0FCODlmY3dOeDErb2V1WGRhMGlISWlIOXV6?=
 =?utf-8?B?Y3ZlQ0VQNnVRM1pZV1dxbzIyWEg5WUlhZGdQbjFBZ0ttSnJ1ZUhONEFPVUlO?=
 =?utf-8?B?NXRWWkhRMWZyS3hVbURuajVrZWkyRS96QWR0TEZGckROaWp0RThUamNHdVFm?=
 =?utf-8?B?UEFyY1hKaVVZdURmcVNxa0ZBZWRSN0UyQllWMUFGMEhIYy9raWJnU05NQk4v?=
 =?utf-8?B?clQ0bTNtdzdMdk5ZbTBPV3dhaThRUHRnYnk3ZUZkN1hWYmVNa0R5c1hFeUJu?=
 =?utf-8?B?VTk5Zko4QVlhUmZqZUY2ZDdZUkozUGkrc1dpUUJ2cExMb1IxS01JbTZ2RmI1?=
 =?utf-8?B?eE9hV05GanZzeFdGd1BxZ2g1OElnWXIxUHBkMlJUS3pMNXd6UnRjWDRHaGVq?=
 =?utf-8?B?VWNyL0VkZkYyZUNwc0NYZ0xrSXJGZW0xOHR0T1R0dnJva3hWdmExZHZQL2tS?=
 =?utf-8?B?QytRQjNQNUFtempnYTliYkEyMjJmWjNiREk5d2tSS09TYmVST01kZDllbk9p?=
 =?utf-8?B?RjRMbERsRmM5cFBjdXlacTh5Y1FxWTR6UDAvbDZPRWJDd3N1TnVlU2VCKzVa?=
 =?utf-8?B?VlI3SVMzQlJPNzVoRmxadXdvMEs1NllJTEFSc2NHVWV3K2VzUnFvNHFtQWx2?=
 =?utf-8?B?TGZxZFp0UmNPZDI4U0VFcWRZZFQ0UjMrenZSYm8vYXlUWTJvTXBZL01wMHEx?=
 =?utf-8?B?Z3dJd1l2bU5yUktET3lGaWNnWUh2cUhhQ21kd2J6RGtFZjFSNWNHd0gxdlRx?=
 =?utf-8?B?R1BZaTlVajk2MEZwUkMrWDRhQ2FmaGY1QTdmN1BsZXJLeisyT0xBdFlVSkM3?=
 =?utf-8?B?Q3YrL3FvVitOVzNIeFc1YkFLYm0weHA3MTIwRCtyaVZQbWxBUmg4dHVSMFRY?=
 =?utf-8?B?eFUvYzVUZUM0TDVqL3NZWDhKME90Q1pzcFliaWVRZngzSjJjZTFkNlhuSVll?=
 =?utf-8?B?QS9sTDRvMWJ5ZHhudlJYa0UyY3FrNytyK0JQaEFPMVdWaldIa1V3NEpsU0FS?=
 =?utf-8?B?V0xTMHRPMzRja2F2aE5ZS1AzcDJSWmZnVHBtdWlaeUxmZUNINDR0OGlPVUxs?=
 =?utf-8?B?YUVySmR2T2h4SHZqenpheU02M2N1aXNnYUpwSitIcTRiQXpvTHBreVlwT1Rl?=
 =?utf-8?B?TERpdGxOZVJEOXZHZi9idjgwUHplbG4xTGVOS09aejlCaVhDYjhNbXdVUFZu?=
 =?utf-8?B?eWpIVzFqZHhWZWRTTTZDOHk3WVdoSjN0RGdON1dzUjNCdVlVNC91NStoTW1i?=
 =?utf-8?B?U0hUYUNSNE5pYWw1QTYxQUhKdWtja1dDRUNwZkswbCtFbVBFelhIdmhmdFdq?=
 =?utf-8?B?aGRWYVNBRjN0ZzRNSG9wZWYzOE1mT1hXcjk4VFBRL0Q2NVJzM1JLLytMZ2dN?=
 =?utf-8?B?ZFg4aVVkdkwrOUwyRlppWXdBNXFKRUtMbnZLSnZNMHhkNVhFd1BNT2tJVkFp?=
 =?utf-8?B?bGhsRnZMNkk5TmY1TTlLK2NvMS9jSEtZMklaTzUwL0pKSXVpV2JsWjFoUDd2?=
 =?utf-8?B?QUhZVnYyMkl4NjA3dGJkaytVQjJjTHltMUJzSFZwZlRLWDAwTjJNSnRROXAx?=
 =?utf-8?B?ek9QZTVtVXZLWU1lTG9NTTc1c2JscmgxTWVDMjQrNWhNV1Jvb0s3d3FLaTRp?=
 =?utf-8?B?TEtsdmFVL0hjYWNyNmRRSDROS25yR0FuQlRJeWZ3c0hWbHprOFU1cHEzS0tC?=
 =?utf-8?B?OWhZSGI5Z1FlN3dQYW10VVFSNFZGTzlaTzh6WWYweGJYTGZIa0Z4WlNXaExY?=
 =?utf-8?B?cVlyN3Q5ZnhxeHNTWUdaLzFUZW81aUpuS2ZlLzlueEY5Szk0b0VlTDZjMVhD?=
 =?utf-8?Q?Fe+/cGtZd/4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3p1NzFTU3EwTGJWSnIrYW9xYjZYdkp1MWNGYnJZYk4vUExFQVZ4U1QxejU5?=
 =?utf-8?B?bE1ZUy9QUzVPeHNJc3V6Vm1CZFhCRFJOTzBiUEJjSjZsdHBUV1NaUUNUaExC?=
 =?utf-8?B?Vm8yNkV4OHZrcno1OVhCOWlRTzFJQWs3OUdiQTBpRGVBZzh4b3RwVGxNUTZ5?=
 =?utf-8?B?N2pyMmR3Z1E0SFM1T0k0M1d5L2hKSUtPWFplSXkxQUNmK2xkMmM1SytNcGZ4?=
 =?utf-8?B?ZDdzM1VYVlJ4TEZhRHB3MkZYTVpqSzBTb3RlOUs4eXZyR25IUk9Jd3lIdzY4?=
 =?utf-8?B?NDBGRzd3cytoRk1SSFEyZ1lTZjhmMUZZOXM4UDZMMURlbDZGWmQ2Qm1IdGhl?=
 =?utf-8?B?QStUdTdoK2pGOEZIN1VJK2hjQUdZS0NybGxRa0s1Rmh3U05VUEx2SHh2Qzk1?=
 =?utf-8?B?aG1EYkI3UVp4bHlpNGRic2lvNGV6Q21SR1U2ZDEyVkh6Q2FGc3hkYTFsdTZp?=
 =?utf-8?B?OHFJcUFCNVdrNU5LNGZHejhTNFJvSjZCZm1jaHlUYjZkL0RKcEhMUnlxbkJx?=
 =?utf-8?B?U3NxTHFoRFRYcHZRS1crOWJoOHg3bm5NRG1vNDcyekdrWmJQNTlPYUNRR3dl?=
 =?utf-8?B?N1NtcW9LYWtLQlNNV2tDUjgycU13Ymc1cVJyL2t6NGQrOWZBU1VUaFhjUU1u?=
 =?utf-8?B?SVhOR3h6S210TDE3UWl0bjNjTERrUzNJRGI1a0FQQlJpRHVwRytkVkh2R0hG?=
 =?utf-8?B?WHE5TCswbFczVlBKVWdqdGdpSlZZRi9za1UyaXJSeWN5VmI5eVRuRWV6WlYv?=
 =?utf-8?B?Q3hVSUY2eG03N01QR2pCUCtxU0MrYXhYSEF3cUpBNzR3cnlGNFFOL0NWUjNx?=
 =?utf-8?B?c1F3NHhlMzhXWm16bjVaSzJzTzFDelY1UzE5RWxLVEZpY29ScDJnWk5TdS9a?=
 =?utf-8?B?OXBmbVVHUWlrSU10bUhiQ0hIZTZiVE93REcwYmd5OUl2aDlpOWpyaHFwdzNu?=
 =?utf-8?B?SC82Z3BiaFJsWWhyTFF1aEl6UURjbmo3RHV4bmh5d0FwTElpYWNnK0VvbDZ6?=
 =?utf-8?B?SlpvYVAvclAzVDRjRjd2YndFUnlaeFVnanJnMWo1WEpyNEhxWVdHcGRySlhN?=
 =?utf-8?B?ZlViZ2tldXk4YzZMOWhqeVJxVUVTUU5DT2dTT21LS0hRRENoZDhiWFk2Sm10?=
 =?utf-8?B?aklVUHlTclBVZXRhaGg0Z1VQZGlFR2xtYWNIVFpSNzhGV0hWNk5xZVorUW8v?=
 =?utf-8?B?VDYwTHdZclp0S2VkVGxSUGNSK1cwZkwweng5bTlyNE9IQ1VFVGlkU0ZvMG9h?=
 =?utf-8?B?aWY4eDZ3YVlzTWpPWUJNY0JnbU9JNTYwOHppaktmTXJpVFZRK0d4N3Rvc3ZP?=
 =?utf-8?B?R3hzY3NPZFJoT0ZNUU0vU3R0dG1LaUsxUFlab3gvSTFLVzAybUxSQS9WQ0pV?=
 =?utf-8?B?TjlHVU5CTEhaRXJzQXdvbE8zVWl5TE5PZjRUQnNSYTZzQWFGWkZCelJTRGM2?=
 =?utf-8?B?U0R4SUIvQkFKM0tFS3dTMlh2aGFBMGsvTnpLYnU0eCt1REJ4dVR1cW9BU1RK?=
 =?utf-8?B?WkNFK1E0eE9TOHlQRitldE5yNlNsSk1VbHZBZXo5bmdmYXlkMW91QVdkZUZi?=
 =?utf-8?B?V0ZINFNFZWNLMllxeG1HamVCdEs5cEh6YW1LWjdNeUgxVGs1NHgrVS9yaS84?=
 =?utf-8?B?YXl3SHV6UE11N1BKK0lDcjQ1WEJsSEtJb0hGeDdIUTlnZitNM1J6T3RxT21x?=
 =?utf-8?B?dzRucG92QVp0UVE0MS96WWdmdDYzUnoxWGcxSFZ6TW9BaEtvN0tGU1JLK1do?=
 =?utf-8?B?RkJXWkFidnAxeWpXdEx0TWFFY0t2aXEwM1U4emVwMGZoSis1WVRTV2lRSldp?=
 =?utf-8?B?NGZqdTduQkNOcytRZ1dkU25Dd3Vyd2xjTzZGa1NrZ1VYTHNER0pOY25pL2d5?=
 =?utf-8?B?S1hCZTZWU1MzWXdkWHdSUHMrSGNoNVJEUU1uMHhxL3Nlck5oTmNJU3hTcDhM?=
 =?utf-8?B?UXRncW5VVS9iQjV6bUZXM0YrSjNaeE9lOSt3MjhuY3RFbGUrbWlyNXlOaVAr?=
 =?utf-8?B?OVk1b1hQdERwVDRYT3k0VzBUeDdxZlQrMDNaQ3A0R3BscXlGRG0vQmpxTW1W?=
 =?utf-8?B?VDZjK2FEd2NwMVlNSlFJZnpRWjdBdzdNcDdWNmpwNnhpMm5tbnl2VjNlSVh5?=
 =?utf-8?Q?bFX0eFgifdxUm7dUaGUkCUjhB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aac79c6-f4f2-42e1-bf8c-08dd9773a4bf
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 07:55:09.9667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cov+j5reekWUr5StNsrVGt0E+q3gACeUCa29/2WbVKuMUlZ+fwDzd2zvGBX+tNuIiRqKC8yvDYkEXKpsIGnJ9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5805
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

Hi Danilo,

On 5/13/2025 1:19 PM, Danilo Krummrich wrote:
> On Wed, May 07, 2025 at 10:52:43PM +0900, Alexandre Courbot wrote:
>> From: Joel Fernandes <joelagnelf@nvidia.com>
>>
>> Add support for navigating and setting up vBIOS ucode data required for
>> GSP to boot. The main data extracted from the vBIOS is the FWSEC-FRTS
>> firmware which runs on the GSP processor. This firmware runs in high
>> secure mode, and sets up the WPR2 (Write protected region) before the
>> Booter runs on the SEC2 processor.
>>
>> Also add log messages to show the BIOS images.
>>
>> [102141.013287] NovaCore: Found BIOS image at offset 0x0, size: 0xfe00, type: PciAt
>> [102141.080692] NovaCore: Found BIOS image at offset 0xfe00, size: 0x14800, type: Efi
>> [102141.098443] NovaCore: Found BIOS image at offset 0x24600, size: 0x5600, type: FwSec
>> [102141.415095] NovaCore: Found BIOS image at offset 0x29c00, size: 0x60800, type: FwSec
>>
>> Tested on my Ampere GA102 and boot is successful.
>>
>> [applied changes by Alex Courbot for fwsec signatures]
>> [applied feedback from Alex Courbot and Timur Tabi]
>> [applied changes related to code reorg, prints etc from Danilo Krummrich]
>> [acourbot@nvidia.com: fix clippy warnings]
>> [acourbot@nvidia.com: remove now-unneeded Devres acquisition]
>> [acourbot@nvidia.com: fix read_more to read `len` bytes, not u32s]
>>
>> Cc: Alexandre Courbot <acourbot@nvidia.com>
>> Cc: John Hubbard <jhubbard@nvidia.com>
>> Cc: Shirish Baskaran <sbaskaran@nvidia.com>
>> Cc: Alistair Popple <apopple@nvidia.com>
>> Cc: Timur Tabi <ttabi@nvidia.com>
>> Cc: Ben Skeggs <bskeggs@nvidia.com>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/firmware.rs  |    2 -
>>  drivers/gpu/nova-core/gpu.rs       |    3 +
>>  drivers/gpu/nova-core/nova_core.rs |    1 +
>>  drivers/gpu/nova-core/vbios.rs     | 1147 ++++++++++++++++++++++++++++++++++++
>>  4 files changed, 1151 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
>> index 1eb216307cd01d975b3d5beda1dc516f34b4b3f2..960982174d834c7c66a47ecfb3a15bf47116b2c5 100644
>> --- a/drivers/gpu/nova-core/firmware.rs
>> +++ b/drivers/gpu/nova-core/firmware.rs
>> @@ -80,8 +80,6 @@ pub(crate) struct FalconUCodeDescV3 {
>>      _reserved: u16,
>>  }
>>  
>> -// To be removed once that code is used.
>> -#[expect(dead_code)]
>>  impl FalconUCodeDescV3 {
>>      pub(crate) fn size(&self) -> usize {
>>          ((self.hdr & 0xffff0000) >> 16) as usize
>> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
>> index ece13594fba687f3f714e255b5436e72d80dece3..4bf7f72247e5320935a517270b5a0e1ec2becfec 100644
>> --- a/drivers/gpu/nova-core/gpu.rs
>> +++ b/drivers/gpu/nova-core/gpu.rs
>> @@ -9,6 +9,7 @@
>>  use crate::firmware::Firmware;
>>  use crate::regs;
>>  use crate::util;
>> +use crate::vbios::Vbios;
>>  use core::fmt;
>>  
>>  macro_rules! define_chipset {
>> @@ -238,6 +239,8 @@ pub(crate) fn new(
>>  
>>          let _sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, bar, true)?;
>>  
>> +        let _bios = Vbios::new(pdev, bar)?;
> 
> Please add a comment why, even though unused, it is important to create this
> instance.
> 
> Also, please use `_` if it's not intended to ever be used.

If I add a comment, it will simply be removed by the next patch. I can add that
though so it makes it more clear.

[...]
>> +impl<'a> Iterator for VbiosIterator<'a> {
>> +    type Item = Result<BiosImage>;
>> +
>> +    /// Iterate over all VBIOS images until the last image is detected or offset
>> +    /// exceeds scan limit.
>> +    fn next(&mut self) -> Option<Self::Item> {
>> +        if self.last_found {
>> +            return None;
>> +        }
>> +
>> +        if self.current_offset > BIOS_MAX_SCAN_LEN {
>> +            dev_err!(
>> +                self.pdev.as_ref(),
>> +                "Error: exceeded BIOS scan limit, stopping scan\n"
>> +            );
>> +            return None;
>> +        }
>> +
>> +        // Parse image headers first to get image size
>> +        let image_size = match self
>> +            .read_bios_image_at_offset(
>> +                self.current_offset,
>> +                BIOS_READ_AHEAD_SIZE,
>> +                "parse initial BIOS image headers",
>> +            )
>> +            .and_then(|image| image.image_size_bytes())
>> +        {
>> +            Ok(size) => size,
>> +            Err(e) => return Some(Err(e)),
>> +        };
>> +
>> +        // Now create a new BiosImage with the full image data
>> +        let full_image = match self.read_bios_image_at_offset(
>> +            self.current_offset,
>> +            image_size,
>> +            "parse full BIOS image",
>> +        ) {
>> +            Ok(image) => image,
>> +            Err(e) => return Some(Err(e)),
>> +        };
>> +
>> +        self.last_found = full_image.is_last();
>> +
>> +        // Advance to next image (aligned to 512 bytes)
>> +        self.current_offset += image_size;
>> +        self.current_offset = self.current_offset.align_up(512);
>> +
>> +        Some(Ok(full_image))
>> +    }
>> +}
>> +
>> +pub(crate) struct Vbios {
>> +    pub fwsec_image: Option<FwSecBiosImage>,
> 
> Please use pub(crate) instead or provide an accessor.
> 
> Also, this shouldn't be an Option, see below comment in Vbios::new().

Ok, I just removed pub altogether, since the users all within this module.

>> +}
>> +
>> +impl Vbios {
>> +    /// Probe for VBIOS extraction
>> +    /// Once the VBIOS object is built, bar0 is not read for vbios purposes anymore.
>> +    pub(crate) fn new(pdev: &pci::Device, bar0: &Bar0) -> Result<Vbios> {
>> +        // Images to extract from iteration
>> +        let mut pci_at_image: Option<PciAtBiosImage> = None;
>> +        let mut first_fwsec_image: Option<FwSecBiosImage> = None;
>> +        let mut second_fwsec_image: Option<FwSecBiosImage> = None;
>> +
>> +        // Parse all VBIOS images in the ROM
>> +        for image_result in VbiosIterator::new(pdev, bar0)? {
>> +            let full_image = image_result?;
>> +
>> +            dev_info!(
> 
> Let's use dev_dbg!() instaed.

Done.

> 
>> +                pdev.as_ref(),
>> +                "Found BIOS image: size: {:#x}, type: {}, last: {}\n",
>> +                full_image.image_size_bytes()?,
>> +                full_image.image_type_str(),
>> +                full_image.is_last()
>> +            );
>> +
>> +            // Get references to images we will need after the loop, in order to
>> +            // setup the falcon data offset.
>> +            match full_image {
>> +                BiosImage::PciAt(image) => {
>> +                    pci_at_image = Some(image);
>> +                }
>> +                BiosImage::FwSec(image) => {
>> +                    if first_fwsec_image.is_none() {
>> +                        first_fwsec_image = Some(image);
>> +                    } else {
>> +                        second_fwsec_image = Some(image);
>> +                    }
>> +                }
>> +                // For now we don't need to handle these
>> +                BiosImage::Efi(_image) => {}
>> +                BiosImage::Nbsi(_image) => {}
>> +            }
>> +        }
>> +
>> +        // Using all the images, setup the falcon data pointer in Fwsec.
>> +        // We need mutable access here, so we handle the Option manually.
>> +        let final_fwsec_image = {
>> +            let mut second = second_fwsec_image; // Take ownership of the option
>> +
>> +            if let (Some(second), Some(first), Some(pci_at)) =
>> +                (second.as_mut(), first_fwsec_image, pci_at_image)
>> +            {
>> +                second
>> +                    .setup_falcon_data(pdev, &pci_at, &first)
>> +                    .inspect_err(|e| {
>> +                        dev_err!(pdev.as_ref(), "Falcon data setup failed: {:?}\n", e)
>> +                    })?;
>> +            } else {
>> +                dev_err!(
>> +                    pdev.as_ref(),
>> +                    "Missing required images for falcon data setup, skipping\n"
>> +                );
>> +                return Err(EINVAL);
> 
> This means that if second == None we fail, which makes sense, so why store an
> Option in Vbios? All methods of Vbios fail if fwsec_image == None.
> 

Well, if first and pci_at are None, we will fail as well. Not just second. But
we don't know until we finish parsing all the images in the prior loop, if we
found all the images. So we store it as Option during the prior loop, and check
it later. Right?

>> +            }
>> +            second
>> +        };
> 
> I think this should be:
> 
> 	let mut second = second_fwsec_image;
> 	
> 	if let (Some(second), Some(first), Some(pci_at)) =
> 	    (second.as_mut(), first_fwsec_image, pci_at_image)
> 	{
> 	    second
> 	        .setup_falcon_data(pdev, &pci_at, &first)
> 	        .inspect_err(|e| {
> 	            dev_err!(pdev.as_ref(), "Falcon data setup failed: {:?}\n", e)
> 	        })?;
> 	
> 	    Ok(Vbios(second)
> 	} else {
> 	    dev_err!(
> 	        pdev.as_ref(),
> 	        "Missing required images for falcon data setup, skipping\n"
> 	    );
> 	
> 	    Err(EINVAL)
> 	}
> 
> where Vbios can just be
> 
> 	pub(crate) struct Vbios(FwSecBiosImage);

But your suggestion here still considers second as an Option? That's why you
wrote 'Some(second)' ?

> 
>> +
>> +        Ok(Vbios {
>> +            fwsec_image: final_fwsec_image,
>> +        })
>> +    }
>> +
>> +    pub(crate) fn fwsec_header(&self, pdev: &device::Device) -> Result<&FalconUCodeDescV3> {
>> +        let image = self.fwsec_image.as_ref().ok_or(EINVAL)?;
>> +        image.fwsec_header(pdev)
>> +    }
>> +
>> +    pub(crate) fn fwsec_ucode(&self, pdev: &device::Device) -> Result<&[u8]> {
>> +        let image = self.fwsec_image.as_ref().ok_or(EINVAL)?;
>> +        image.fwsec_ucode(pdev, image.fwsec_header(pdev)?)
>> +    }
>> +
>> +    pub(crate) fn fwsec_sigs(&self, pdev: &device::Device) -> Result<&[u8]> {
>> +        let image = self.fwsec_image.as_ref().ok_or(EINVAL)?;
>> +        image.fwsec_sigs(pdev, image.fwsec_header(pdev)?)
>> +    }
> 
> Those then become infallible, e.g.
> 
> 	pub(crate) fn fwsec_sigs(&self, pdev: &device::Device) -> &[u8] {
> 	    self.0.fwsec_sigs(pdev, self.fwsec_header(pdev))
> 	}
> 

Nope, I think you are wrong there. fwsec_sigs() of the underlying .0 returns a
Result.

Also in Vbios::new(), I extract the Option when returning:

        Ok(Vbios {
            fwsec_image: final_fwsec_image.ok_or(EINVAL)?,
        })

But fwsec_header() still has to return a Result:
    pub(crate) fn fwsec_header(&self, pdev: &device::Device) ->
              Result<FalconUCodeDescV3> {
        self.fwsec_image.fwsec_header(pdev)
    }

thanks,

 - Joel

