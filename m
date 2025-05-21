Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FDCABEA46
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 05:17:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650B210E07A;
	Wed, 21 May 2025 03:17:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nf28bh4j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEDAA10E07A;
 Wed, 21 May 2025 03:17:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SMM0PClhZzLTGJ4vTP6QiiXHccMNUV8TldxcWmZyttbzrs+CP7HrX2GnC/Eqq8ZetJqL+73BYiR601i8KAcCQAd6FrhNmHq/IJUaSmqTpZRK3LoZlzaxFWESLbMIkPH612CqpJjbE0ihaGLeJ5IjqNmpdVqLBE4OU8bh4ueG2SEWiK9EFpKcPco+9yJ2+hJbaL7pQ5J4VrtfwDbwU8lnLX863s8mPv/OmZFObh07Q/ukvsaWQqhENhpIYA/3d9vbiZ/maleAhEtLrDki/lAcw6SuVCaIYVr1zU5ONW6THaAA3XcBMduIynLiZe8t/aRXxjOy+xMRg58mWd32OXZUAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yoj5sSehnX5EShiyYAs9OOKFUTb6kE8YnJ1hBkqXT54=;
 b=kB18qQ5hgpmoM6ug2tEyxsSBmNniDOBVJoiGjP+kAM6mBPnPLlQX4KHxKuN6RXcW2IkEcKPvyjeEtkyxxZMM8lvxLNR1cQuFri1zr7RgCeRIDdafBjeJm6wF8Sqefv6UllyJ0bXb2c3X53OlqWfGTH98LtWydfTyydhh5v3N1iRIOv0s2URvTsLqtzgRMm8S2hRpTbSMDdyUX4nMeMS3X+8I+9CPGCIkqN7r8qD4YFTj0+PmmV/a+EbjIF5aOcD9h+7uSUc+trV95TFvzgdh4L7qsyysLrpYPYvvajKlFuCjWlOL3so+CHXKUt5AjYnBic7OFM6vOwDS1853rvX6Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yoj5sSehnX5EShiyYAs9OOKFUTb6kE8YnJ1hBkqXT54=;
 b=nf28bh4jNG7ymn98JWABL2GwfyJS41PsbKD2Mv7ozLJiRwzPQjZm5IkBMy6gDXzQmt3A2RD56MOfcla9eGny126FV1jwQyLtVgew8Q4YOj/VZ70aQZ9o+wHJnmxTilbMyUPq9IB76TlhkZaoda3WO+HCRHM5zfj7cn5jzA7cYKA5zZs+nFi2+YkcLrbosHBaIWcfThyxQuCojZOSsxdIxDxclV9ePoLztw3KsT/vHdUUDuy7my7x/FDR9IkMlwThmwzmiWdtGxZ4HyKleAbNqNqKCpjmykTabBz6TqTlNgtd5pNtY44ikqCuBM480QAs0PdbJdO6ioV0jcOf5AyBig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH7PR12MB8053.namprd12.prod.outlook.com (2603:10b6:510:279::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 21 May
 2025 03:17:10 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 03:17:10 +0000
Message-ID: <17701f1c-8117-4045-8da1-a578a7082caa@nvidia.com>
Date: Tue, 20 May 2025 23:17:06 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/19] nova-core: Add support for VBIOS ucode
 extraction for boot
To: Dave Airlie <airlied@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, John Hubbard <jhubbard@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Shirish Baskaran <sbaskaran@nvidia.com>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
 <20250507-nova-frts-v3-16-fcb02749754d@nvidia.com> <aCN_PIYEEzs73AqT@pollux>
 <4fee85be-a8c5-4a99-8397-c93e79d72d15@nvidia.com>
 <aCxLyxcERNHKzfvI@cassiopeiae>
 <3cfb7a8c-467e-44d0-9874-361f719748b8@nvidia.com>
 <aCyZPUaPSks_DhTn@cassiopeiae>
 <bdb290d4-b369-4b8e-b78d-8c8d3cc07057@nvidia.com>
 <aCyhkiBTXV86P_GF@cassiopeiae>
 <dcd249d6-7e99-476e-b216-8ca9e1a936e5@nvidia.com>
 <CAPM=9typcavVsj-w_4zaBkU=eo-hsOagHn4cMekCsXPHwLK3Aw@mail.gmail.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <CAPM=9typcavVsj-w_4zaBkU=eo-hsOagHn4cMekCsXPHwLK3Aw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1P223CA0038.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:5b6::7) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH7PR12MB8053:EE_
X-MS-Office365-Filtering-Correlation-Id: 39804e66-ed5c-4e64-cd55-08dd9815f95b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHFSa3pXOWh1QzVuam45WEJlN1pXaXhBY053U3JhMHNUSkNyN0xHdkJtTWZN?=
 =?utf-8?B?eEpjaXAyMTdxa0NiNmwyYUZnc2R6WkJiSXFpZlVUdWRxbXlZL0oyY1FxeDlq?=
 =?utf-8?B?THJ1Tjd0S0hoQlIrenI1ZngwTHJXdE9nT1pGdm9aVXJwK2V3Vldrc0RWY01G?=
 =?utf-8?B?RFdXeGVKdmx5bTEwU1JEejFLdWpjaDBZUjh2Q2NFYzlJaWJ4eHJPSE1IcTdH?=
 =?utf-8?B?WkgrcmQvK3ZtY2xxQ3lqMk13N2VRRmphSDc5REg1STRUcW0vZlozdXZZUDNV?=
 =?utf-8?B?TWNULzV4VlkvNmRUd0FMMHE1ckRlS2tPRlZDTG1TQXdLVGV1K3hENTZLSmVv?=
 =?utf-8?B?MEh6ZWlxNVppc0RudEpPdHhYZmJyQmFqYXZNQXZQMU5wWVZCZ2pEMDArVlVl?=
 =?utf-8?B?anlLdU84QTRoeFN5UVozSWtaSHd2dDUvZWdCMXF6dkxKM28vdWhpNnBoTXBV?=
 =?utf-8?B?ZTRZL1d6L3J6bXVPR3diYVRTSjdrOEhNMXF2RzJQTUw1eHlsT21UTnh1clVk?=
 =?utf-8?B?cEZQWVdZRkEyOXFlUTU1Z3lBb1lxQXFHVUtzWjVpczdkNHNhejF6RUFRZXRt?=
 =?utf-8?B?TU1PU0NLZk9MMkYxVlVDSCtxWHdHVWRpL1piSExRTmRoWjhWQlVtRXNHTVl4?=
 =?utf-8?B?YmN0UGh5Q2FQdHVUdkFGejQ4b2pkYllEVFhoUEd5N1hMdkswVmRXWDBqUmR2?=
 =?utf-8?B?Y0NUM044VCtiU1Z2dDBIdUJlRFpTZ3FnZFk0THJvaWJFNWJ6YnR1cDlVbFY4?=
 =?utf-8?B?c1U3UFpJL3NOaC9sb1RLSlVmcGxUTGw5ckthOGhIaytLcENCTkJEVjVBUmJn?=
 =?utf-8?B?NFR2aW5QQUZTbFBtT01MZ29UbjVzc3FWbmJva28vSGZ5NUNBUTF3QlZISi9a?=
 =?utf-8?B?R2g3Z0hRdXhaMVlLK1BPNVN3NzQ1YlRuUlNHK095NSt4NmdOWm5pVXhaNzU4?=
 =?utf-8?B?MHU4YkRMaWgxelQ4cVlpTHNuYzBGN0JlMS8rajRBQjdVdkIyaityYzJjcHNM?=
 =?utf-8?B?Z2tMSmpKakpoT3lnZHFVVDREV053QXVpbTdsYUcxck04ek04MVR2NkVQeXpD?=
 =?utf-8?B?TXFDbFhER2lmTGxsMytYeGpsY0d1RjZIYUJIOUhuYkE3UmU0K1RiYXFwRlVN?=
 =?utf-8?B?NXhMbEZUM29QbkVPdG5Kb01UazhDamZJZjZ0QWt2QytiUzdNM2NwY25vbXhq?=
 =?utf-8?B?dmdJWXdjK0ZjemFXRGtFb3dJejNHRW93RkREMGkxYS9yNXNiR0dJVklDZXlO?=
 =?utf-8?B?SmlZOEE0WVd0dkRNTlcrNHZnUXdZa0ttdUlRUWgrTVo4ZWJYd1J2YW5YVGE5?=
 =?utf-8?B?b0EyQnhuSDFpYVRrQ01lT0YzMXR1TlU1b3krUDdCTURCdUZjVHZHVlFQSXls?=
 =?utf-8?B?QmlSSlM4a01MTUo5eUxJRmhNeTRlbzZobitPcGFDN2ZvYW5JMkRKQTZwcEp1?=
 =?utf-8?B?ZXdYR0JUTTJGcHYrNE01L0FiVStFM0FFRDFTNDloM3Q3RU9QdDFxRlgrTHdy?=
 =?utf-8?B?bVlkNFVvQWwyMVBlUjN0Z05NK1hNVTB4U1FCVmF2V2o1QWI3OXJ5ZnZ6M1JF?=
 =?utf-8?B?SVF0TGtTUG1GbWM4QisyWCtzaUJ4QXoxY0kvT1YrZHZXcXBRR1JZL0VTbXdk?=
 =?utf-8?B?L3pBc214aWZLZGF4OGFER0NLWW9VWW82LzhubTJlRElxcXdoL2xWTS91TWxm?=
 =?utf-8?B?bmx0bzJrbTBRdjFTOTZqYUlnUnlNWmNWWW03bXpPL2V0bzk4cU1NeStnb1ov?=
 =?utf-8?B?WEEyNW9INWEyanVWdVVlc0E0Sllid3dWbm90VUgwTWV2M0NvdzB5TDNPT1Yy?=
 =?utf-8?B?R2YrNDdHSHkxT1R2SHN1YnZjLytnY0h5QmtvaHRPZElMTHdaWmJSeW5wbWMy?=
 =?utf-8?B?dzVPVW0vV28wdkxhZEJGRHpTQ0hSeDhSNWJ1S1NtcEx2OFpmbGM4dUorejRL?=
 =?utf-8?Q?IFRgGM8vuxo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEoxRFRveXhSb0IwVVkyVUxHbXpxWUtKTjJ5dUhXSVA4Mmp0MHhkOE5Pc2RZ?=
 =?utf-8?B?bEdJbVhsTWp5dzZKVUpCMXRRTWZiTWtzSWxuOVBWTGE4YXFKRVZnZTJnWG9N?=
 =?utf-8?B?R0JrQml6a3F2TklnRDFQYkthalJINFFOcEdvS2prbmlocXNKT2ZXbWY5bDlP?=
 =?utf-8?B?SGlaR0NDVzJNMnF6Q2taK1ZGK05oZmU2emtNNlcwV3dzeHYrR0ZrMk00ME56?=
 =?utf-8?B?ajUvY0N5RW5NZk9uUjBBVTJ3ZnJsc1JkKzk4dUpuOWFjUkw3a0piM244LzBP?=
 =?utf-8?B?elZoKzA0NnhNek5yZEk3MzhZcTV1TkRaaHpPZGdWU2ZoUUNUQjduTnFsRnlT?=
 =?utf-8?B?RU9DMWRacVFEZWRPNXcxaU8yc1N2Mll3R2tYdXFJbmNCL0ZUMVBRbEhSOHcz?=
 =?utf-8?B?ZnYvenNBYmtqRFcrTDZ2eFBtajVpaVdpWXVUeEJHWVZsejBMN2xWT0dla3Fy?=
 =?utf-8?B?STNNQ3Nla1pQZ055ZFdwMVlJbC9SeFdOUTZQUWpxOTMrdDcvQW5GR05Semhn?=
 =?utf-8?B?RTAyS0ZFMHNHYVdXaFMxWFFHNnErd1JzSkhZN0U3ZHR6ZTQ0OVhwS0pCSk1G?=
 =?utf-8?B?dmpndExwZmFiRFQ2aXhPc0ZJMnFPNTVnczBMcjJLZjZwRnEvclYvanYwSjlH?=
 =?utf-8?B?MmF5SHM5TUNrYXJ1VCsrQ0MyVS9NeHNQMERJQUsvZ25ldVZLZGxzbFFubEJT?=
 =?utf-8?B?bFlUZzdVSE9zdFRLeVJ4TnpINDdSOVlkRjBWTE5hTW9WcFA1OGhxNkdCVGEy?=
 =?utf-8?B?R1JaMDl2UTR2NkxnTjFaTXFobXRKU0hIWkVDbUdoZkxoWG9pQXY5RG5LTEFu?=
 =?utf-8?B?QlRXRzdLVithNjNnUVhBc2txSkg4Z1ZMNWV2RWZoakpMdUNXR0tNaUIvZUNr?=
 =?utf-8?B?d1VJOWRTRVk2UjhJU1BjdjhDNmZXUVVDdjlOV1Q4VzZOUk1YZEF5V0tKb2NW?=
 =?utf-8?B?T1ZqOXNYNHJnRVR6cTMwb2k5Um9kUmFpTXgwRTc0WmxQbU16RlVCbW96NktP?=
 =?utf-8?B?T0VoeGR5d0V3K0NUTjN0aW9ManMvRiszd3dGVFdZMGkrNDZERHhxcVVvcXlU?=
 =?utf-8?B?RXVsNzBhUEZHRWw3QjJjMmhkVGMzUFJRYXE2czI4cW5sT1ZSOW5aVkpnVUVi?=
 =?utf-8?B?UzY0Ri8yeVdIQmVGdDhvbktUeStXNTJVV3ZQdjkyY004UXFxbklFVUhMYzlO?=
 =?utf-8?B?N01OM2s3ZVVJY1VEYVNWdTJ2SmtIM1pOMnh0cGQzVTNDdm5QWGoxMlNzTXpC?=
 =?utf-8?B?Vk5mb2JvcHI1TU5wM2REQlMxYm15WjJ0aFVjOVh2ZHdHdmU5NzBLZnVkamNX?=
 =?utf-8?B?WWlNN0MyVU1VVFJiYnBUVXNVcFoyV1FzbGYwNERDY3R1K29tK3lSRTZSVGRq?=
 =?utf-8?B?eFg3a1BkK3d6UDM5VUpsTUF4WmorNERDb1dmK2FlYWRMckVSa3VkTnBNeHFx?=
 =?utf-8?B?WDVaZ09HNTQ1VEgzK2xHLzBVQmZjc0JYaXNENVFPU2xuOUVoZklFTUZnTlBx?=
 =?utf-8?B?Yi81azhycHpteFBIVEhkRWRzQm9JM09TaHNXYTM0YjlIOEtpSm1IZmFBV0xy?=
 =?utf-8?B?b0FrS3Y5OWI4ajBiZk9JTnN2UkpzRkxrLzhQNXNxRnVkNGcyMVNhN011VjM4?=
 =?utf-8?B?enNEK2ZtNVh5ZnVMUUxOSWVWbWdrYnc0VEVlYXBGZnE3Zms4MjJmVGl2RFNJ?=
 =?utf-8?B?K3hEemlFTlozVVBLMDdSWkQ2akQxakVjSCtodzUvUlE1dUFiVmZnV3E0bUtK?=
 =?utf-8?B?OHBzakwxTlZPWWtkbHRFT0NqV1czc2tNSWhpRWc1RkRENVdIVUJnd2V4T0V1?=
 =?utf-8?B?aVpTa01WL2Nxanl5c2JtUEVVdURzcjBiRHBlZmNodUpFZUlueUI0RWRtU1Nv?=
 =?utf-8?B?bGhPVTZxeG5KWmFFeHZGV2JMU3NoUDVYNmUrOFlsSVd4eFR3S3BNSFYvN1RE?=
 =?utf-8?B?ZFJPdEQ5ZkJDWW9YdWZKZjVaUGVSMGU1MEMxRDlRSUcrd1ppK3plOWx1K01N?=
 =?utf-8?B?TU00bUtQT3l5TVBtSHU2Tjh1REhZRURPbXFRYWgxejlvWGJmaEU0NlJrcEhV?=
 =?utf-8?B?bFg3b1NMaC9KamZsdzFqYWk2YXhidjdSWnp4SlFvdGxVK1FYa2xuSzdGMENo?=
 =?utf-8?Q?poCf7qP6kr60BUpFom17QE1OI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39804e66-ed5c-4e64-cd55-08dd9815f95b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 03:17:10.3460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pPJHwlLBVdevKn1ErW3qPKZ6tzRSR8fqKDtPHmb/JR7uXVSRWtY6LT1biGOAveNUdpA/2bUPo7kS4//u4LIlmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8053
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



On 5/20/2025 5:32 PM, Dave Airlie wrote:
> On Wed, 21 May 2025 at 04:13, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>>
>>
>>
>> On 5/20/2025 11:36 AM, Danilo Krummrich wrote:
>>>>> If you want a helper type with Options while parsing that's totally fine, but
>>>>> the final result can clearly be without Options. For instance:
>>>>>
>>>>>     struct Data {
>>>>>        image: KVec<u8>,
>>>>>     }
>>>>>
>>>>>     impl Data {
>>>>>        fn new() -> Result<Self> {
>>>>>           let parser = DataParser::new();
>>>>>
>>>>>           Self { image: parser.parse()? }
>>>>>        }
>>>>>
>>>>>        fn load_image(&self) {
>>>>>           ...
>>>>>        }
>>>>>     }
>>>>>
>>>>>     struct DataParser {
>>>>>        // Only some images have a checksum.
>>>>>        checksum: Option<u64>,
>>>>>        // Some images have an extra offset.
>>>>>        offset: Option<u64>,
>>>>>        // Some images need to be patched.
>>>>>        patch: Option<KVec<u8>>,
>>>>>        image: KVec<u8>,
>>>>>     }
>>>>>
>>>>>     impl DataParser {
>>>>>        fn new() -> Self {
>>>>>           Self {
>>>>>              checksum: None,
>>>>>              offset: None,
>>>>>              patch: None,
>>>>>              bytes: KVec::new(),
>>>>>           }
>>>>>        }
>>>>>
>>>>>        fn parse(self) -> Result<KVec<u8>> {
>>>>>           // Fetch all the required data.
>>>>>           self.fetch_checksum()?;
>>>>>           self.fetch_offset()?;
>>>>>           self.fetch_patch()?;
>>>>>           self.fetch_byes()?;
>>>>>
>>>>>           // Doesn't do anything if `checksum == None`.
>>>>>           self.validate_checksum()?;
>>>>>
>>>>>           // Doesn't do anything if `offset == None`.
>>>>>           self.apply_offset()?;
>>>>>
>>>>>           // Doesn't do anything if `patch == None`.
>>>>>           self.apply_patch()?;
>>>>>
>>>>>           // Return the final image.
>>>>>           self.image
>>>>>        }
>>>>>     }
>>>>>
>>>>> I think the pattern here is the same, but in this example you keep working with
>>>>> the DataParser, instead of a new instance of Data.
>>>> I think this would be a fundamental rewrite of the patch. I am Ok with looking
>>>> into it as a future item, but right now I am not sure if it justifies not using
>>>> Option for these few. There's a lot of immediate work we have to do for boot,
>>>> lets please not block the patch on just this if that's Ok with you. If you want,
>>>> I could add a TODO here.
>>>
>>> Honestly, I don't think it'd be too bad to fix this up. It's "just" a bit of
>>> juggling fields and moving code around. The actual code should not change much.
>>>
>>> Having Option<T> where the corresponding value T isn't actually optional is
>>> extremely confusing and makes it hard for everyone, but especially new
>>> contributors, to understand the code and can easily trick people into taking
>>> wrong assumptions.
>>>
>>> Making the code reasonably accessible for (new) contributors is one of the
>>> objectives of nova and one of the learnings from nouveau.
> 
> I just want to back Danilo up on this concept as well.
> 
> When I did the experiments code, I faced the not fully constructed
> object problem a lot, and I tried to resist the C pattern of Option<>
> all the things, it's a very C based thing where we create an object
> then initialise it as we go, and it's not a great pattern to have for
> rust code.
> 
> I'm not a huge fan of constructor/builder objects either if they can
> be avoided, please do, and I tried to also avoid proliferating them,
> but I think for most things we can build the pieces and then the final
> object as we go, it just requires doing so from the start, and not
> giving into the Option<> pattern.

Sure, I am on the same page there as well. For next revision of this patch,
struct Vbios will contain a struct FwsecBiosImage without any Option in either
struct Vbios or struct FwsecBiosImage. This is only logical, because there is
nothing optional about it (in what Vbios::new() returns).

thanks,

 - Joel

