Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 580FAA9B6D3
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 20:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965B410E18B;
	Thu, 24 Apr 2025 18:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MtuUxiup";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC7D10E18B;
 Thu, 24 Apr 2025 18:54:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+Cfhinpnl3TgiM6dyMwCcnJE47BLtKQt0b9dHVtB6Fk46b3wQM/sYBSxUSRXePzeKYHQwVQOYaV2+TnoHmoKHKibmk61jj8ZVY7Uu4H7N5ajla/FHAR/frll2w06s6suON2SJolEpIrvybjtmpXIqTF2vEqm+OuHjX28DqE70CAUXW0mCC4pur8Po0kXGbLMKjicPoMIIQeTHdw6bo4YRQ1w9nOSqR4Bcgxo8bDpapDx259M7ZIQpo73OTOYXOzSPil/L2q54AQ8+p12mX6/RT3vIZeJ1CGW2srb5SCKxqexWTAIu+dHlh4O5Pv4Wn7dZv0pRulff+cLW3HEIFV5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LNVUgNl8V+RqY8CzOMT6XPhC8ZpBFul4WdcDEiDr2w=;
 b=a2ZwiOX+4uwrrYr7VrtJE3SNY9HlxzISpLI75RxFx9CxSAbjI5aEszbx96udEwOY0QuKHvXqjKu0VaIIB0J1RZxuYkmQI/0nOCEU2K25AE8+rREL6MP2SvNLrRH8n4wJqgmVmv7XYEBOjfUzC6gfhK7WrjxYn/Gr5rU2vwwhmaO186JUOp1dUQ/Hd+mjXvRN1Sot5Vd/QDajCvkvwRd5nCZVgVqPWmrOlhyjgf5va2hZ/FamJT7n/gn+/dJjBuNAPUzbVRqFhGl7K3hwR4EnU4D8tDFt/R3vYO3td5a0MklqrnS28BGGrYT8yk+ZOoNCpFxqXh1gWguO51f/1v5b8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6LNVUgNl8V+RqY8CzOMT6XPhC8ZpBFul4WdcDEiDr2w=;
 b=MtuUxiup527Pt7unS5Vi91aIc6Oj23A5VNMr7AsFE5TZDFzotmcg+8mGpBDlZLchxmfRfMIKTi98VmZrZepYwYMfEsia55RiOoW0KHC2erLn/YzOW8mduSti5mkrAektohTrBU5/5h13PeyjvNBS9qGtOXk5Pdiqicyr0SHUzunbObran5L2hsfldzwAWcSuYKmtsiL3wrpVKFMITOJGkU7FpCm2QHPtMsmV/aK/DNaNvmV56kes8eZW5x75GTtASYGWhDwn6Wha63rAJMU4fwFMe+nbWURHIah1GqlnXpekgxgSa9nlVbgs+gPK0T1dEqXN46ZPREpetp2tcj0NHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Thu, 24 Apr
 2025 18:54:46 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%6]) with mapi id 15.20.8655.033; Thu, 24 Apr 2025
 18:54:46 +0000
Message-ID: <7f3aa4b3-a24a-41c6-b75e-61e0e6e11ee3@nvidia.com>
Date: Thu, 24 Apr 2025 14:54:42 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/16] gpu: nova-core: Add support for VBIOS ucode
 extraction for boot
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
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
 dri-devel@lists.freedesktop.org
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-13-ecd1cca23963@nvidia.com> <aAjz2CYTsAhidiEU@pollux>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aAjz2CYTsAhidiEU@pollux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0543.namprd03.prod.outlook.com
 (2603:10b6:408:138::8) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW4PR12MB7165:EE_
X-MS-Office365-Filtering-Correlation-Id: ddd4f2c3-bc4d-4309-27f3-08dd83617b63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTgyTkd1Q1VMSXdkOFFXbFpmMm5hYTBMTGVpM3BhNVJjQ3lZMlBZM0FtTmFr?=
 =?utf-8?B?Rk9ncC8vN29HVlQ4V1NDWkF5VTZ5dnFlNFQxWVN6M0gxRXBidmoxKy9NMmwx?=
 =?utf-8?B?TTBkdm0vajlWZHZOYkYzMm5oNVFjQUVkcG9PcDU1eEw3dFdFb3JUUzI5NW5l?=
 =?utf-8?B?VU1vVEl0OWxJb0tZSTdXUS9FU05IZzV5SHpaWWliMnU0L3piSkdXYW91Q0RG?=
 =?utf-8?B?RjlyM0RUR3VobTZXYVpGNnd2cHB5UUx5NnRDWG9ad2RXMjVtSlh4Qnl4QnRN?=
 =?utf-8?B?Q2c0c2VOMUh3bnVIV0J2b3hNL0s4bkJhK2ZWU21paHpXN2FLdWlBRjFPRnBy?=
 =?utf-8?B?d1FVL0tEZis1WGxxMm5DNU9zMVNiVzM3a2JhZzhjZlNaY0V2ZVVxaW1mSnBB?=
 =?utf-8?B?ZW9IckR4UjJWMWQ0ZVduVWJ1SGh0V0EzV2RrTUQvTE01VmhpZ3dXN0RSSmQy?=
 =?utf-8?B?OHUwdzROS0J0c0xMb1Yrb05zOGtyV2hobk1ZQVZOS1dxYnFveHduYyt0TDdE?=
 =?utf-8?B?VkNWc1B4aUY4ZlVEcW85UEY5VUpPN25UWFRjS0VXR1ZQaEVDaEVDazJVZUR1?=
 =?utf-8?B?dXExUnc1dFJycEs5anYwUEJQeXJEcW1pM0h1aVdxQjRIK0xlVHVJVGZMVk4r?=
 =?utf-8?B?MUpqMzZXeXU5YmI1VFRQUVIrNWU2QjdLZDFsblgxcU9Ienl1ZmRockoyWmtm?=
 =?utf-8?B?TWN2Z3ArRll1S1VweThRSmU2UlhONmRvMkxhTC90dVFxSkdKbm9HSDZjNUlI?=
 =?utf-8?B?VmREZ0NsM1lyK2xwNStsUnVUc3l0bDBUYUQ3U0JWNm5LYUhwQjZwbDRlZ0c5?=
 =?utf-8?B?aklzOE5icExuNFphdG9hVVVxOXQ2R2ZvbFpvbzFYWFNOeGhGU2JxUGtSVVF6?=
 =?utf-8?B?WTB2NVJnSTloM0lmS3VLTlc0U0dUWjRqemVOOWs3YUtvMVcxaHlEYWw5YjAz?=
 =?utf-8?B?anNVRXc2QWxIZGpvdVBKOVVKTE5vRFNiVHArQkYwSS95MDFIUlZFVHhJWDcv?=
 =?utf-8?B?SVRhbTJjOHpJR1lXcDlzbG0vb3hKVTNlbmFHMHZuYm9Idi8rZzM3UHRHaHU4?=
 =?utf-8?B?Qm15ZlRMNnhFVTZJZGFZVm9vdTVUVjNIQkw5alRwcjdSanNwbVJjbGZjNzdQ?=
 =?utf-8?B?K01FN204cnBteEQvdHhzdVF4ODZYUGFaNlh1NlVJZ3dkdmRFZXhva05iWjZG?=
 =?utf-8?B?SFV6NURSekxGZUN1dlFWb1lxL3JoTHI4WVlmS3VoeFdQd2x5bVBZSTZXMGtE?=
 =?utf-8?B?UUJtbnNUN2l3NGx2bndBclNGUWRaU3IvaEw1M01IcFNrcWxLL1hZMlQrNkZY?=
 =?utf-8?B?bUZGM1JYZWJub3ZkdEEzZzRwN1orQjdTZ01ocXFaQmcyUFc1NnhHN3hEL0cr?=
 =?utf-8?B?TVE3eHh1S0NmMklJMW5mV01NV0RrYnE4aEtVdkJKaHl4TEtpaU9VN1dycTRj?=
 =?utf-8?B?WUVXeG4rOGR3Ni8relRZa05oU0YzQjBoSytMeFBwM0gyZWk0L0d3QjVmWFFQ?=
 =?utf-8?B?dWRGNWhaMDFZbVBWb1A0MzkrLzlpRWxDTzg2REk5U095NFNPUEtDa3AveDcz?=
 =?utf-8?B?Sys2Ukp2WTJCSzJidkNoSlZWazkxR0ZxQWFBVW9YWkJGcEs0R2VaVTBiUjFm?=
 =?utf-8?B?a1NMdlp3ZDJnQkpVbVB4NmYwSnI2OWozd281TjgwNTNZSFJ4bzNrR0RhRXZR?=
 =?utf-8?B?eG1ybGsyRUFLQXlQSUR4d3RONEo4OUhNaXNzakxLczRQYkpzL1paRkozUjFO?=
 =?utf-8?B?YnZIMGJTTUQyV0p3UTdjM1B3SXdPUG1vSkw2d2xXdUxrOWtXWERlSXdueFk5?=
 =?utf-8?B?YXl6WndoYzRwL1Q1VmlVUC9pSUU2MkJWY2FnL1pldVdSZDNwb1RKUmZnenAy?=
 =?utf-8?B?T1EzMTJ0MjQ5Rm1ESm9KWmgvUnZDRXEyNE40OTNueHM0OWhGK2Zpc0EzR2M2?=
 =?utf-8?Q?DMrXVNMuGVw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2pSQXhSaGtodTlOdTZEeFVuWjRXRVVRTVMwd0p6elMyZS9XZ2pDejdqNlFp?=
 =?utf-8?B?eS96alpqQis5L1FkbGJSMjdKQlA1Rm1SSnZBNlJsa1N3SWx0b2JDR1czelBm?=
 =?utf-8?B?anlaL05OeE9mbjQvSVRBL0tlTThGOWtCc0c2TVhzNEttVkxKMndiR3FFWURN?=
 =?utf-8?B?My9PSzFSamFhYTRTN3krNklxQXpDVDlUZmQ3dXB6Uk9FYXF3MHlFMHJqY2dP?=
 =?utf-8?B?T3gxdktYUFY4VTdmQXFrd1RPOVp0cEZGd1BwdElRcXFLWUNBRWNhRmxPamtp?=
 =?utf-8?B?cVZkcktzd1VrclpDbFU5RkNmK0MwMldoSFp4c2xFcXF3empoMStSMDVJcytJ?=
 =?utf-8?B?bFpHa3ZPNVlhZGdpNWh1NzVpR3BmUHI5bXR3dkJSRExzUHRHaHYyMnlacThi?=
 =?utf-8?B?elhhYWpVOVBKK1doOVVReXU5S1Q0emkzRW9RVlhYdldJTWpDQ0QwcWQ0T1k5?=
 =?utf-8?B?YjZMbU9ZeUdhcXVzYTFHaE52YVlrMVdRRDk0aDJ3UXUvUkJEaWFQUUk1Tmx4?=
 =?utf-8?B?QUQ5cTN1QWNvYmFOVExOenErTng4S3ZpRFhRZVpIYnlRVk9iYm9ZOHRXU0k0?=
 =?utf-8?B?VjJLdEl1OVpXdHJVRHBqNHdodXAxRXg3NlFxVlpqQzRxNWtjQkJseVJVb1E1?=
 =?utf-8?B?VlhMUzFiOEIrYy9HRnlNTzVXNDUyUk9LMU9GZTl4aElQSlVhVDdlWFNwaHMy?=
 =?utf-8?B?YXBMdnBmd24wVWRQRVFZcGxqZEw4NjJUWDdBeTRpYWFyWUF5VmFJcnp6Tnhi?=
 =?utf-8?B?MnQxbTFqTlVNemMvNXc2aUsySitjKytjV0Njd2NJUnRyWVdxbDNaSnZ2cDI5?=
 =?utf-8?B?N1FnQXBKM3U5Ulg1MngwK3BSdHhPdlJNd3BNUnE2a0Z0NndVK3JrWDAxdTZS?=
 =?utf-8?B?aERNUExMdUl6ODdZQndKWDM0ZGNLdnQ1eVdxMlczL0wwQjFtMUljK08xUDhp?=
 =?utf-8?B?Nit5SUJIZW50MWExYjZXRTJwamRCWm5KTVFPaW5oS0ErVHQvcFhROHd2cXIw?=
 =?utf-8?B?eDAreU81bGxxYkJNeW84VG9QTXBBT2lRMURkUFNUNDVLdzRERFJqMlNyalRW?=
 =?utf-8?B?MzhuQ29DR1VkMURSMWJYLzBZTWUwd3JNZCtOS05RK1ljM3lLQklZN3dwblF2?=
 =?utf-8?B?by9UcDMycDFDOERCUkc4QkdpNTQ4REtYM3FQUmx3UkNLUHhteVdHVnFvRHI3?=
 =?utf-8?B?M1RSYzBhdEZDdmtOelpKd3Z3L29HazBVeHNYUS9Cd0pCRTdNZmsxREVpVG9Z?=
 =?utf-8?B?cC9sczQxdS90emM3bzFFTmZQSXlOZjlGdmRYNWgzWG5uZ3pJRk56YUVncGV4?=
 =?utf-8?B?RmxER1RHVmlVMVVNa3BrOG1pbk1HS1d5YVd5TVJSZExRdXBqSW1Fd0lZdUow?=
 =?utf-8?B?VTJUQUsxMEJhSmRsZ0IzclJETnpSUytQd1pDNWFIQ2VHRUxmYStVMldQQjVh?=
 =?utf-8?B?enk0K2MvdFpTaXhVNWZDTVhXOWdVU1pkblROZUJWM2p1SHpIVlYybUZwK2Ro?=
 =?utf-8?B?R1diYTgxUG1qUnppejlkMjRnMXQ1bW9TWndPSTV6Zk9lcVp6b09RV3U5MU5u?=
 =?utf-8?B?alJVeEh1THZkTGVwQ1B0YzVma2RRKys3L0Q4VHRjUjB3UjNKNTcxdlZHSHlm?=
 =?utf-8?B?TFJWMzJRU1ZJSDZsTmNYck40YkpLam9SV3pMRjFYOTkyN0txc0tJSVlwdURR?=
 =?utf-8?B?c3NrZHlnbS9OL1dYM1RhWEd4OGtKN3Jld1NZQVh6VGxoM2oxbWhGU2NJS1A0?=
 =?utf-8?B?c0hscDF6U0M1TTI4ZlRDb3FKaUV6OUVuRlBCTkt5VUdhZ2xlVUFQNE5keEpz?=
 =?utf-8?B?YTV6bks2akIrZmxRVHJUVGg3aitVRGJTZ3U0cGJpeUI4RTh2R0hPaEpvTkRt?=
 =?utf-8?B?bGl1RTBmMExBNjBUam04UURneVdZamlPWFdnem1YZ093aERZR09NZFdmY1FK?=
 =?utf-8?B?U0dESG5vWklXczFjc1dvM2pieTBSVFJOdjhDTEJOQmF6R2YzNHpsV2QvV1Zh?=
 =?utf-8?B?N1ZzaWlXQnRRZGVjRUhlTmZXMGxhMGZCNmtYUk5hREZ5clpwQ1dmOFVGSUpS?=
 =?utf-8?B?akRTVy9LWTc1UGprRHlNdWhjK0JoU0hUbXBobDRHNlRrT0NiakVNWVNGYWZX?=
 =?utf-8?Q?oceCAlGGiGNYcvfDCP+AuXybD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddd4f2c3-bc4d-4309-27f3-08dd83617b63
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 18:54:46.3408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EaqALOBXs26F3/LX7/9b1745xKSEGU5TYT3iGdeyokmWCuO66EzA996Y7RJ7FU2VQQrO/r6lLf3bxGkar+XK1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7165
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



On 4/23/2025 10:06 AM, Danilo Krummrich wrote:
[...]
>> +
>> +    /// Probe for VBIOS extraction
>> +    /// Once the VBIOS object is built, bar0 is not read for vbios purposes anymore.
>> +    pub(crate) fn probe(bar0: &Devres<Bar0>) -> Result<Self> {
> 
> Let's not call it probe(), what about VBios::parse(), or simply VBios::new()?
> 

Yes, new() is better. I changed it.

>> +        // VBIOS data vector: As BIOS images are scanned, they are added to this vector
>> +        // for reference or copying into other data structures. It is the entire
>> +        // scanned contents of the VBIOS which progressively extends. It is used
>> +        // so that we do not re-read any contents that are already read as we use
>> +        // the cumulative length read so far, and re-read any gaps as we extend
>> +        // the length
>> +        let mut data = KVec::new();
>> +
>> +        // Loop through all the BiosImage and extract relevant ones and relevant data from them
>> +        let mut cur_offset = 0;
> 
> I suggest to create a new type that contains data and offset and implement
> read_bios_image_at_offset() and friends as methods of this type. I think this
> would turn out much cleaner.
I moved it into struct Vbios {} itself instead of introducing a new type. Is
that Ok?

I agree it is cleaner. Please see below link for this particular refactor
(moving data) and let me know if it looks Ok to you: http://bit.ly/4lHfDKZ

Thanks!

 - Joel

