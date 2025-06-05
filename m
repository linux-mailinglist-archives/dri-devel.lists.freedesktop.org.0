Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F535ACF3FD
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 18:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A4510E31F;
	Thu,  5 Jun 2025 16:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mFDsYk3K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2053.outbound.protection.outlook.com [40.107.237.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6734110E31F;
 Thu,  5 Jun 2025 16:18:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UEHrYAtXnFWn4Xf2B7XDGcw/JgPBSIdjMI2DIWcgJCJnxGyiKaCmbktMSnxGFfbPQURxil5kBvQX2ITxcCruEMyr6uAfd83NqihaTD5mTyPWCFC9Uo4hdzzFqI6nF0uqOD3H0GbA8fH8uDZsSI+GeUuCAQyH6WB3VOtuzSKg6sNnCmc/MeRz0ZHPxlhYk2MVKFmzzHpR9R85rdWxddtjqbJuvR7Voj++l+bvNb6ZWU5C08tr5Sxz/ulf3QKPOLh2GJ/erE5tALCWIu3lxA8Lv6CGDFnqXm4y5OWAyUmYVU2zu294D0izow45ZHF3OOZHYTQfc6HDogbQmxJH0reFTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/2tRyt/9oS6MR87ypzSYMYsbR3VIy/ZgAVLv+C2ceE=;
 b=twQJRqXNoUn+/ChYNfyb9kdqUKDLm+O5se0wk+hHmI0I7SXzFRV4/Y7ZSMd1ixZfg9lmE+2oOC1I/4Xh6h84EJlXiTmy8G+JJzs2JjnliP2/v0Un+gRGU7kFkjMRc46DuA9sYrWoEFKl4Se9hTCidxkNznaYy2a80sBkoYTnG2NjlsjZXhh3CXC5gA3sQtNo1OdPpVoI9rVKJVXZqJivwMGwBLV793AJsPlZr1jWeIae31r7py+iPO24fLAqo7Rh/sQPsjdn5PpuqPMmsxKHqCP8ctP5dK0xErjjjTs7S3SoxC1pA4lBY6Kw6djlurcUWoG/TLrXwlpaj80mOmqvbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/2tRyt/9oS6MR87ypzSYMYsbR3VIy/ZgAVLv+C2ceE=;
 b=mFDsYk3KdYR2oi+8LJFGzNVN7aFH4d7gWqblfTn6x769ZkEBfZTOJMsYEr5gdVtQKiJBYXXJoDPbICkPddmv+76JpfmEmcKgaQxoCG7cL/oto5GjVSEUfViIC/XeHpqyhMbVxIP+lbPeCxrmOzlXAZsObZgCfTZ/Be7FqlwlnZfSDPbnMhhymuQJW1V4WrSGYK3omLxBTEPyTGcSigRN4kf19W0oOcD56RHWx5H8Mt9i9C67NmOOQaXQ0Umjjr2wx812LXN+1DgV2DegpIERrx5rp6xyTsG0Pbd403kFjlTJkAMT2Klf9oqJ4DAkCreUCYBxP+VvsPMHVnFxn7V0cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by LV3PR12MB9165.namprd12.prod.outlook.com (2603:10b6:408:19f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Thu, 5 Jun
 2025 16:18:34 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8792.034; Thu, 5 Jun 2025
 16:18:34 +0000
Message-ID: <f7ad74ed-924c-4d9a-a9de-a224613e6941@nvidia.com>
Date: Thu, 5 Jun 2025 12:18:31 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/20] nova-core: Add support for VBIOS ucode
 extraction for boot
To: Lyude Paul <lyude@redhat.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Shirish Baskaran <sbaskaran@nvidia.com>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-16-05dfd4f39479@nvidia.com>
 <ab30d5f1-d2fa-4e75-8153-b2d3870a70a1@nvidia.com>
 <6befacfd53aa58d55310a36b314d974ca3fcf043.camel@redhat.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <6befacfd53aa58d55310a36b314d974ca3fcf043.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN0PR04CA0184.namprd04.prod.outlook.com
 (2603:10b6:408:e9::9) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|LV3PR12MB9165:EE_
X-MS-Office365-Filtering-Correlation-Id: 04e0ea0d-22dc-49f7-529f-08dda44c9e97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2NKU1dWUzEzeTN0NTRwN0hST1c4TGlZNENoMzdZMkErbXE1aXAxV0dua3FJ?=
 =?utf-8?B?QmI1WDJENzNkYll2SVZ6R1M4Q3VoamFKNUJDSURSVlplWE9oV1RXQlM0K2Iz?=
 =?utf-8?B?R2N3M005aGF1ODFqdDZsQk9XVmFSY3doZUNadzN3US9obEhnMENzSGxmb3Aw?=
 =?utf-8?B?SkFNVzVWZ1JYeTExcGl2LzZnUjE4NlJHS0xGUlArZGpiUUE2VG9lZitsblMr?=
 =?utf-8?B?Y3lkczdBU0ZEQlF2UWxlaU9MQUJwMVUvczMzZUJWaGdNNzVYL3hsaGMyVndm?=
 =?utf-8?B?ZFA1Z3NsdVdtWk04VXZuVkJHeWVSL082YVFoeWJHbXZVZjU2d04vK2xMNTVv?=
 =?utf-8?B?Mnp4ZWpUUEk1YTEzbkNkSEs1cTg4RFNNRXd3ZTNiaytTbEZuMkFVa1B5N3FH?=
 =?utf-8?B?MWpqZ0VHenFUU0RjSjN5NStnQzBHMXMxdy9MT1ZBWXorb0dlaXpMb2w2MnVP?=
 =?utf-8?B?cnhzZXNsR0RuL28za0lnOUsvRGlDYmFaZ0ttRkwvaEZUa1dsRjhmWExneHd0?=
 =?utf-8?B?NVp4bVFRdEdmWlBnY2ZHUlB0S1h2OUJFdGpJQlBrdHp5NmRtbUNJTzRldjdm?=
 =?utf-8?B?ZmtKajVxYmdRZHd3M29CZ0RFMDJmZWxGbGNXbUZnVmR4REsxZ2tjMjlOODVr?=
 =?utf-8?B?QkRUVzhXUkRQNmM2UDZiMHFTa2RxczdWQVQrSk1VdkhzT2tOcjhzeml4OWtJ?=
 =?utf-8?B?Qm9QY1Q5eWNYK3pEZ094RmRtQXdVbm5jalRKV3BXd3Juem1oZjVQaEZ2aTZK?=
 =?utf-8?B?bFhaTS9UZmFLbTRDMnJHUExtS3NGNVREWTIxeTE0SnZzdWRYbjlYc3ZpaFJ1?=
 =?utf-8?B?SEhTRHUzWENZSnRWZlREYnd0Y0J3dS9DTHNKaU5TN2phNmcrVGVaRUhDVkgv?=
 =?utf-8?B?K2ovV3dhNVRvbGttamxUL29oaWEyNkVnM1V0RlJycTNVS2ErNHphN1BwWmlK?=
 =?utf-8?B?VGQ4djBzTVhRWmVuc0VOekJ1N25zdFZLbTZVTjhJZEVNdDF1WlZTYVVnTzBV?=
 =?utf-8?B?OE1mMHFtVkdqR0hISXZ3ZUVoamFPOEsvVXdXVVVqUm5PTE1CcmZ6TEVMNW9F?=
 =?utf-8?B?cUtGSWRkNnVYWE5aSGhJZlNYK0dEWkozSkxPckdKM2ZwSGp4R3BjV2sxQnFn?=
 =?utf-8?B?Mk1zYnNCRGRTWW9vVEZ1UnhKTW81Uk1YaGRidGdZc3dKS2hUMTd3Ri9MM2Ur?=
 =?utf-8?B?ZHFlZ1ZCZEtSdmpGc2Y2OTRJY2pyMmNLckZFanpvUUxXQkl0alF3QThROXdU?=
 =?utf-8?B?WmVYTHh2VDF1VHU1MkNjY1NDSkRrUHdwQStTME16MEtraEcxQU5vZFNHSWt6?=
 =?utf-8?B?cXVzbUxBM01oRVJGVTVYOTA1dkVXeU9FNjlMaUQweE9oRG1JNlVESUR0ek1M?=
 =?utf-8?B?Q3NwQXFSZFBMU24xQWNJUDY4TjB4RC81SzJxMkZrZUhyMldoOEJsaWQwV01q?=
 =?utf-8?B?Snh3SlZ1SEk1QUM0cUkrbHVMZ2Jpb1FySjhtdm9ZRUJUbWZhR1ZmbEJMM3ls?=
 =?utf-8?B?VjJrU1lrT3k1aUQ4WmQxUlB5RXd1NmtCK05kdjRiNEFSMG1hUVpxN3Q3Rjg0?=
 =?utf-8?B?dFM2TE84MHV5eWRLb3Rka0FBOXRmR2xka3BKckx6b3B1cWlYMGtsTzFlMjZq?=
 =?utf-8?B?cTUzc2k4Mld1MDJjdnkxSEMvZVgvTkkxSmNNSGcxblN2VG5FSVZONHJUbm90?=
 =?utf-8?B?ZjQxeTZ5QVYzWHpZbE53c1Q4bTNaditram5ETGVkcG1JNm4zUS9OVStrNTFE?=
 =?utf-8?B?dkZIc0tzU0NFWDFFVXMrb1FROVZWaEdnQ3Y1Nmx3a2hWY3FlS2xCUzg0dHZZ?=
 =?utf-8?B?RU9vRFRLdk9jVllZYXptZUFRci92YUQvTy91WUMyMG5WdzZTVkhkeWVkSTEz?=
 =?utf-8?B?YTZVT20zVWZTb1dhT3dhZzgxMU9iZ2xBeTFhdW1yM25nMWpGeU4xZVdtQWxV?=
 =?utf-8?B?S1FQWTVjRVc5WlhCbCtVL0M1VGZXN2ZuU1NIdjFlWjhLcWJJOU5RYkhmUEY5?=
 =?utf-8?B?WlJvc0lwRy9RPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1VpVWMwTDJwMWoxYkNyVTFoanZaME9hbEhLdTZTc1dPRlYyRVlNSCs2dmNI?=
 =?utf-8?B?M0doRGo5bEdRVlljZVd4WExmY09jUVorMjVJUTQ1cWRLQ2Q3dmJkQzEvL2JG?=
 =?utf-8?B?c1J4R1M0ODdvRGQzWGtiUXJjQzZSY1dPU3hFS2k5Y2RWRVZmQzYwT1IwUVJQ?=
 =?utf-8?B?VDBCQ08rYjVMVDBnc3hlaXhueldZd2JjNzVpUVpVdlpWSkl2Mk9iMXVNc0k2?=
 =?utf-8?B?QWhIMU9tbzlhdW5ETCtmajVyQ1gvbWpTWDdqUHo0RWR3RitjdXBzdkJDUng4?=
 =?utf-8?B?bzBwbStoc3FZK0RaMGFwM2R3amxXZ0NobkxqUHIrRk9ZQjY5MEVSMS9STE1E?=
 =?utf-8?B?V1dMMGc2YlpDd0t0NHZlN21lQ25GcUM5cUFpY24yUkdiaUphTDQ2VWdTMkJI?=
 =?utf-8?B?OFNvVjZFOFdxZ1lTNDF1cGk3Ti9zNnVyWGF6dUNsZlJFdW1YNlJQSlkvbWh5?=
 =?utf-8?B?TVhqdWxTQWRGMVZNT09lRnN1Qmh0ZUc2ZDFzTW1UaUpqbU5UNElyVzlwbXJz?=
 =?utf-8?B?ZDhndHNuYmdoUXpzTm1NRjB6T0xXOEw5S3NnbWJtTElhZUYwWHorYUdYR2hp?=
 =?utf-8?B?T09kMzY1Qi9TQjBoRDZHekt0U3ZWUDgrOHpsRnRrS3RudXhyUHFIeEc1eFlS?=
 =?utf-8?B?K0xrOXJjNytmeC9Kb2pHd0dkcUVUb1puRjZmWTFyb1pyYlVuWk5wcTBDSkZ6?=
 =?utf-8?B?WWdGZFA4Mnl6SDI1a1hydEMvbkpzVGZlSTRqRm1uaUt4TmIxZFhCVXlOOWNj?=
 =?utf-8?B?TVdiYnFnUjAxUkVqUVNDK3IwLzVBVDdJL3RaQVhnRG9rYm1KZ1VBZmRXd0Nm?=
 =?utf-8?B?NnpuREhpV0JDVXZzemNjbzF6amdlL1BxL2F5NlVmaXFIdytja1o4VHNUdlBq?=
 =?utf-8?B?T2VTaUR5QjIvakZ5eVNtVTNXVWxiY3JybWh0Mis1VXBhMDZjejBpNWo3aTNB?=
 =?utf-8?B?dFc5V3JsNmdYVGhIN2lPK2Y4TFovRW9xYTBxc3RRTWJWeW5iWHNxTG1DN2R5?=
 =?utf-8?B?RXdxajBzQXZiSEdObUxyQnhqeXFDa256Z05OYm1kNFFuOFppdzg1MEdCY1RV?=
 =?utf-8?B?emJNS0tXWGZad2YzRHZKTDdNSzFITEZVWDZ0V1k3ZklSM2NPTnFKNjM0cmN0?=
 =?utf-8?B?SHcrOTRUUHpDTXkzeVhNMzkyT3NOYVJYQTBRUWMvT01uc1VLaWRmaVVJcjh4?=
 =?utf-8?B?QjNoa1ZFbjBnYW1GY2lkZTNtaFczUFZJem1XOVVOVUdQQm82Vmxvc2FOWFRX?=
 =?utf-8?B?L0Q3YnpubURkUEdKRGwrVlFDaTBFcVBIRHAyNWdMTnUvalFobHVtd0hhTEF4?=
 =?utf-8?B?c0NPZElHNkVPUTJ0TnArUGYwMUpVcmRONkxyNFU0SGJjcUhncXZ2cEVQUDAv?=
 =?utf-8?B?elVXaWYvLzl3RXd6RGRxS3NTTDFWd1JpMWhmVmlxTDFFeHEweUo3Z3psQlZ5?=
 =?utf-8?B?V1NFaU1tdnd0SUIwSGFDS29VTVZTWHU2TkNycXczQ1JQYUhRbGU5WmNUUWJW?=
 =?utf-8?B?aTd3ZDJwQ3JhZGlrTHZwdEhLVm5RRnRHT0wvWHEyUmxreThpN3dWUzhnN3M4?=
 =?utf-8?B?WUFzaFpFT1RlcDJOYWNxVk9EdGVEM1U4eW5xb25BRlV5QXVwUEt2bjNLeHJR?=
 =?utf-8?B?MnQvc0Z5bEZmZHY0M0VFMURoUys3VlZOQm1ib3FMdVBJRVBnc2VrUlc0SWRj?=
 =?utf-8?B?aXJ5YVoxd0J3ckk3ak1XQU00NDZaRVZpTlZGdjZHOFBuR2twZmMxb243bm5q?=
 =?utf-8?B?SHFxNXJxa0NOd3FHQzhnV0FLTFhDZzc3RlI1bjJMazl2Qmh5WFEySUZyQ0NQ?=
 =?utf-8?B?Q05VNVM3UzN1bG5mdE55QjM2bElxWnRvN2xxSjZiajZVckhKRnB3dk5qQjdq?=
 =?utf-8?B?MlZyYjQwNTJ3UUY5bjk5eHZaYmZUOHFkV1B2NE14Tmh2MDh0Smw0QkJ1d3Mx?=
 =?utf-8?B?czNMV0xCa1c5YTVzMktjNXBzN2V4NEZMUHJPazkwVkYxcWVBMDVEdzNsVFRJ?=
 =?utf-8?B?RkhWTDV6WHZqMmxHSWsxTkxLcTF2OUdUZElMNlJDc05McWNzalNXbDBhVUtQ?=
 =?utf-8?B?OG53NEpxS2RITEUxT24xUC9tbmUzTVNzOVdEbitTaW9YVXlKUlRidWQxWml4?=
 =?utf-8?B?Y1UzckEwTTBNTHFOTmJHUGNzUTNFYW1qYzc3SGFjK1czUmN4ZGllL0ZXZDZt?=
 =?utf-8?B?UVE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e0ea0d-22dc-49f7-529f-08dda44c9e97
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 16:18:34.4182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xNjMGgFfZKQ7KsRnSn/Ey0LOUngF9btBu/H1roLXmEL9V0Hw+iINYHiWZWcSuYXLxCr7fTQuWx6o9MKkNK4CiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9165
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



On 6/3/2025 5:15 PM, Lyude Paul wrote:
> On Tue, 2025-05-27 at 16:38 -0400, Joel Fernandes wrote:
>> Hello,
>> I split this particular patch into 3 patches:
>>
>> gpu: nova-core: vbios: Add support for FWSEC ucode extraction
>> gpu: nova-core: vbios: Add support to look up PMU table in FWSEC
>> gpu: nova-core: vbios: Add base support for VBIOS construction and iteration
>>
>> It is code-wise identical. Alex/Danilo can you pull these 3 for next posting or
>> applying?
>>
>> git://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
>> tag: vbios-for-alex
>>
> Thanks btw! I'm a bit worried with how big they were I might have missed some
> details during review lol

If it makes you feel better, it has not been merged yet so you can still have a
say in the code (not that fixups cannot be done after merge too, so...). ;-)

Thank you for the review!

 - Joel

