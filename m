Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D0AC948A5
	for <lists+dri-devel@lfdr.de>; Sat, 29 Nov 2025 23:44:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69FE810E22C;
	Sat, 29 Nov 2025 22:44:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bdtHBTNM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013019.outbound.protection.outlook.com
 [40.107.201.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4EF10E218;
 Sat, 29 Nov 2025 22:44:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c3VAQD1ZGYhjzVtpj6DDpvL/31tRRXts42xNWUTKK443YDuEeinOMTBzs/1xHM/FbCnlRDQCNTnC55tBphjIPrn2aOMZzw7MJ0srVZ1YSTLbLc3WvW3rfOO4Pg0x4EmHjv/eHN6pcPb1fymE/58j69vvIxiaXJHTo/fweZNI9ONzIaJ0lL6LXh9wup8EBIkBDtCEF85/2o7+wMktbGGX4ryZtrGUsF9h67nYGlfjHXVns+8rbfc/WPvaskRea6z3BBsEXLvIf9JngkI/FKPDTIT9w2aBc94hhbwPsUx/1zmHAaWKIZpxAbFTIrOQTUbokZnO0TvuKpnM81FdwjLEkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=azjM+IdRt5/KcWGA4zZrE0LSG8F+HZ/5X7lh8TJiS1s=;
 b=M+BLv/NN+Mpd986HPIH3WWCDeF1H5ZdYPtkoitzMStS72O8ICKAjRhMlCmbkd8LC1mk7L9iH4Gc5GfsOLuQlip60bOuxYx/6HqT5duldFR8P7T+iJL0//qEfe9YRWcQLE48Ebj2tsGBabAJtN3utb/UZoew6L2myFcrf2x7n7gkSXp7ivHNOMhQ1i3siUc2UlTIEe1vbTPL6iCUPxgZ4U0jL2H5hT+9qyUw4howuf7V9Vj8a7PTYsuKq8GzRYKBeYyxjoi5XybJJG3dD4Uc5TCgGqIygLz+COZiDdM6gyNDYu9zbgT+jlOIplFNYqjg7YoiIFSJOkxMpOHIB9uFiQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=azjM+IdRt5/KcWGA4zZrE0LSG8F+HZ/5X7lh8TJiS1s=;
 b=bdtHBTNMaMQWaM8wCKcJ6PzRBxOtBFlcc/XexmobEwxcYo81dGqwCLkqLzWPBbMZ2zFq6LQBmgm4F6vyEiFMbDBKgblX2HBuQYrDNBQf2KBSk5bVoG110FaWLmG3sNWMEo643Y3APELacNJbaLsFH3Daot2exe+lmT1lAQYjp1674ilVgxoZFQ2yphfpSSWg3Lcth51K+q4lPA4qL0TZ1l1RhYYl4gEpYHYpr52LdUIMyYp2WBltDF0vAgi9UE1EnygDvpIh340K09oPkpwxc4/+iYfJGRR0V/qoaODaD8zERtDTwQ4TJAIEotcxLRIhYDwF0WuR8ta+u/C0+s7dcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB4150.namprd12.prod.outlook.com (2603:10b6:610:a6::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Sat, 29 Nov 2025 22:44:23 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Sat, 29 Nov 2025
 22:44:23 +0000
Message-ID: <b79fc5fe-3682-4439-b669-663e234943b5@nvidia.com>
Date: Sat, 29 Nov 2025 14:44:20 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] rust: helpers: Add list helpers for C linked list
 operations
To: Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "gary@garyguo.net" <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 "tmgross@umich.edu" <tmgross@umich.edu>, "simona@ffwll.ch"
 <simona@ffwll.ch>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, Timur Tabi <ttabi@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 "elle@weathered-steel.dev" <elle@weathered-steel.dev>,
 "daniel.almeida@collabora.com" <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, "phasta@kernel.org" <phasta@kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251111171315.2196103-1-joelagnelf@nvidia.com>
 <DEHV08MPF9CH.1GZAWEGC4AVF3@nvidia.com>
 <095D38BD-A8AA-4BC3-8C24-9454964EB8F8@nvidia.com>
 <DEI89VUEYXAJ.1IQQPC3QRLITP@nvidia.com>
 <F3A7E1BB-883C-4EF4-B245-8E9DD329131F@nvidia.com>
 <03003f10-00c0-44dd-b9df-5763cc1e715f@nvidia.com>
 <7529a7b1-b204-44cb-bb34-57161e6b7b8c@nvidia.com>
 <DEJIUDQ3ZGPA.2UIPTGU4WT7RW@nvidia.com>
 <7627f224-5fe9-456d-8981-8b3799e332e1@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <7627f224-5fe9-456d-8981-8b3799e332e1@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0191.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::16) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB4150:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e39dcca-e191-4371-d4e1-08de2f98d7a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXIyNnZwMno2aDF2U2ZMeGx3VnMvZFg5T2N6NlVOdDA5NDJCd0hpOXQrL1I3?=
 =?utf-8?B?WjZwRG1FRTA1bERtTlZXM0dXdDEzYUx6RkVrOTFxVG4xaUJSM3NmYW5od3da?=
 =?utf-8?B?bHhBeVM5NXpzdWNLUkJLaXBEUWRZRk4wWk0zbjUrbVVJTllPQkpVbjc1LzRi?=
 =?utf-8?B?NzR5Tjl3WURuSjNXMW5QWWVLNUpGeldCU0tMY1ArcmJCSDNLVXFQbWlIWkhI?=
 =?utf-8?B?dlVOaWxtT2M5dHdZK0Q4Q2lZMGkzdEpDcnlBRGZ4MFAyWUZ3T2tPVmNqRzRa?=
 =?utf-8?B?cmRFL0pBTWhkTkFvOWliejJvSkFTQURHYURNZ3c1Vkk5T2Mwb3B6RFlBODdZ?=
 =?utf-8?B?cHlnWmh1R0g5VUlQVTZNWFJ6WkozMnhFdlJzSWN2aGY3d1ZBc1FwRXdvTEMv?=
 =?utf-8?B?TXE0SzFQOStQSFlCTGFlRnVVQ3QyYldiblRhZ1lSQlRjMko5SitSVVVjeC9l?=
 =?utf-8?B?TndNNmphMDdyR2s2VlVOQmNGYU9hQnloYWpsZGI3U1BKSXZBeFRtdlVEZVpv?=
 =?utf-8?B?TDhRRlJMUVRRZDk3ZVMzdnZvUmhxK3lrNnE4WjkvYnB2ZmtrbXNGNGxQRTNC?=
 =?utf-8?B?TUV5MWs4c2o1OEVQNUFCd2dpMyt6ZGZNb1M5aDV1VkpXRXFRZUxucGZLYVgv?=
 =?utf-8?B?cDErTHpnVmtQM05LdEJnakhZRGhLanFodVR6NVN4clduZGxwUHBjNTZJQzZh?=
 =?utf-8?B?VmlwNkM3NVdHUnVrYXNXbDAzME0ybFBZZ0tQRVFXb1FNY2pJK1VVYjg2RFBy?=
 =?utf-8?B?c1R0MlhvRFVpYWlaNFhZSkp6b1hIVEc5a3lwVU9lMHNncnVJYyt6S3JKUThq?=
 =?utf-8?B?bWZYK3V0dVFJbFhueWRVdkl3b1lQdzBVL3VtTEZ1N28wVVVyTXMrVVRLWEdv?=
 =?utf-8?B?T1JTSzY3V0I3b1kydFRHZ1F1SmJQOXR5ZmFiZldNM3M5ajVGbzV5QXJqMHVL?=
 =?utf-8?B?dGxydjRiMFlSREY2b2lzQjE3eG5UbjZTazVKc0J4U2JzaVhOK3hoVTJ2TlVR?=
 =?utf-8?B?V2ZHaHVOU1BMSlFlY2FVZ0FxcGg4TFRsNW9IVzE5NHk2SGw4Q2gyRnp5UURH?=
 =?utf-8?B?NStKaDMrQmRuOFpaV2FMbDE5ckdzRlFyVFVTUTBnVGxMOHJOVnk3QlhFektD?=
 =?utf-8?B?WlFFYXpiMlRRc3Azc2pBZnBzWWErcWZ1cWlxa2tkeXJsRWtWWHVDTHNZWE9R?=
 =?utf-8?B?U3JNMFdyeHlYT1RacFdyRDh1YWIxYk90dUZZS3dIN25SRFJqbVR6MkxqdEM4?=
 =?utf-8?B?SFJvY2hVajZJYjFUYWlrQmkxRGtManlMOWdyUUdrdmFCLzBNTUwyZVlBN2Zo?=
 =?utf-8?B?QTZJdG1CZFUrREc2NkdOTVdIeVNUbStVUnFTbTRBSDhicVhPRzhtRFEzeE5Z?=
 =?utf-8?B?b1g4cDRQa2MzTXhEZTVyY0RLM05leHJqU1JMQmNzYTdUMXc5RnpzVjVjRkxk?=
 =?utf-8?B?bURIUUY5c2hWekRmNFp6YWpKOU5pV3NMbHl5TU42M3d4TGxlWU9lMTl3bDdS?=
 =?utf-8?B?MEFRVE5IRmIydWZWYWNlY1BBdVRtQUU0QVRxM0UrMllQaEVsYjhhTzYzK1R1?=
 =?utf-8?B?SG5kZ0M4NWJXTngzOEk0M3dJYnJSV1F0UWhoRCtFZy85OEpFcHorL2c3UmV5?=
 =?utf-8?B?RVQzQmx3UHZGUjFXMjBXSzk2TG1CUG9aNVlpb2VZUFV1TFdRYTBLK3A1WGxp?=
 =?utf-8?B?RnA3SGU4aVQ1d21RNy9Ud3pOSkNlTjVqODhoK25TNS9YMFd2U2dIYkkzY0Ju?=
 =?utf-8?B?NERVODVFQ1NpNzQzdEZSRVhHWi80aGI5R054TlVObTJxNHZFeHBsNmM5WjV5?=
 =?utf-8?B?eDNXUk5DTmE2UlQ3TW1yNDJHYWZMZHJDRWZPcmJRcEZLcVRjZDFKa2hUYVc1?=
 =?utf-8?B?TFRPL2Y0Zm9QTlREYVBtbGswd1VOMjlTeVJ2N0s4UVE4NHJpS2pWY3orREIx?=
 =?utf-8?Q?syb5wOQN4XSN9XXq/oVm2NWNyOmMT/10?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXgySnlwcFlJNUpQL0hrYzdKQ3VpVnc1UXdqeW1LbGQxMXBXSFM0aUdrQ25V?=
 =?utf-8?B?N2pjTFlENFZIMWFmVU81T2JrM29tZnB1dWxONmRvNHM2SDhTT0tlaUdnV3dz?=
 =?utf-8?B?aVR0V3RPaGJkM29XVVQvYjBubXR2MDRHR051K2Y3OUhoWFBUeTk1bkZaQnll?=
 =?utf-8?B?QmxkU0MyNFpQL2xSanFuUUpyOGRLRmhRTUhDNzgyK1lpdXRKNmJYbVU3MTZs?=
 =?utf-8?B?SjJlYklqRHRpNjRoQWFqVzRad2o2d0lnZzRxaDBoSWFWWERYbmFkc2tMV3Yr?=
 =?utf-8?B?L3B6Mks0ZUFpVWNLUFhGZHAzZ2M2WjJDSEFRR05XMkxNa2JtM2ZIdGZ4Nzc1?=
 =?utf-8?B?UGJsQysyaFZKNktXUVlTMFEzQjgyV1BJWnpZQWdaOGZsank2KzZ5SGsvSXQ5?=
 =?utf-8?B?Rm50N2lZamxtY0ZHcUtzSEV5Rndtb0daTHNnTk14NGlOVU5saHUyZ2lnTFhC?=
 =?utf-8?B?c2x2UlE0V0VjWjh3VzJiNnh6ZGJwWFdYQ0hOcGFSQ01LbERTSVMrU1Q2WCtP?=
 =?utf-8?B?dDNIaUtxME9TRlA4dHBuREZPcmx5VjhXWmZtY05HRER3UXVSK3NHWVYxUE9F?=
 =?utf-8?B?eEhSM21uWTBqU29iYklyUnIrMVg0YXlUSklHbjVldTlEWlk5b1ovekN2Q29E?=
 =?utf-8?B?UUkzNlFmTmlwNCtZZldRSVA3cTRkZ0hyQ2NVRTJNRm54ZlVTQVJCekZhZ0dl?=
 =?utf-8?B?bnZSeW5MdXFCN3NUZWF6WW9pMkRLRmJOdEVnT3BFVldxUTZSM1VMbUFOOUFG?=
 =?utf-8?B?NTlmV2lleXNJYnM3S0g0MDN5dVhXNEpYOHBMN0lrV3pKQjFZdTZIbXU4allr?=
 =?utf-8?B?ekpBRm0vMVpjNGlHaGdqS0cvdFlBaUR0ZkpoTWlORGRCRFgwVnE3Q2tYaXhK?=
 =?utf-8?B?dHF1NUIyOFA1Qm1ia2lsS1B4a2M5TTBybFR3Z05Bbm1EWjhjMnZwQVVNeEEy?=
 =?utf-8?B?aTQxN3liakNaVXAzZ05pTEN4U1A5WjVPeXZvQmZCUUVES3VJSjlGWCtkdmdz?=
 =?utf-8?B?VlZzakNVYkJxaFdGSU5ZTndmaWcwRlRISVFGclFnMW5HS1hYakY4WlNpN0Zn?=
 =?utf-8?B?NXhyWTZWRUdBSnZpbzBmUkN3U29kZDZ4RUN3SmNEbnRPQ21tWXVjVTFFSkhk?=
 =?utf-8?B?UnIzdjl6b0lBbm13ZDJ1Rmg5VWdmUlJ6TWVXc1lJNUp0cnFuM0VsYlJtV29n?=
 =?utf-8?B?WnNFaFBzeVQxY01iY0NXRnVubm9UaS93b1BlZzZhQ1JsWkM4bXRjeVhpM09B?=
 =?utf-8?B?RmFwb0YwSndwb1ZLR2lyZzh1K0RMc2VkRytTd1A0djZIejN5WktlNHRibW1T?=
 =?utf-8?B?ZkttL2cwcnZPSm83eU9RdUNzc2NDOTVlekdHRXhIL2RWVzVhL2VKYVhUZVdk?=
 =?utf-8?B?a045aEg2amc1K1NpZzMxU0JmbWxXSnRqekkxM2xhYkNCUUErZnpjZ3dxR0Fw?=
 =?utf-8?B?MytvaVVtbDc3aXBNZHVkUEJXR0txUnd3NWNhT001M3Vzcjd6UXlWTWV4b3Zq?=
 =?utf-8?B?aWcwOGpYeEZaT3F4L1FoK2U5SnlydzRDUDhmYThubGttTnR0amRjQkxoMzhr?=
 =?utf-8?B?SE05bWplejhuN2V3MitVOFlDMk10QTVGbUJKV3ZMb0xyVVh0TTdlb0ZhUGxm?=
 =?utf-8?B?bGpnZFhEeGJkcjA2MEJtRGNUVHA1SWlOdS9xdzZBWWdFazZBWjlQOWdpc3Nv?=
 =?utf-8?B?R0h3djdXU25iZDhrcnFiRDF0cnNhOEZiYU5hUmI1WWFTWHJNQ05ZZHNjMFdP?=
 =?utf-8?B?dmhiSVdYR1BjeTMxUHhwUXUyWDlkblUzV2N4U0c2S1ZOUm1zVDIydDl4Q3Mw?=
 =?utf-8?B?K3JFYVZ5aDgxVDA2ZlQ1eDF6Z1VlMmxBVFI4blpLcDZqSC9uZkVWYitRRDJ3?=
 =?utf-8?B?NlM0dzg3cTNUa3VyMlpGT3Fac2ZjMU05bFVWU0NDenJOckNzQTIreGsvWGk4?=
 =?utf-8?B?cHQ4SzhpWXY4TkJuRTdyMGdqN2s1akdNa3ZyWWtjMmpjbC9GRC8yMkl1SGVW?=
 =?utf-8?B?bkpIbzdhdXl4ZFNKT0tMT0Nnb1JYc0MxZFJ1cE5objE5UmlxbUJQM3V1R0Rz?=
 =?utf-8?B?U04vOVp2MDlsRnZvNHZ4WEgrajR3aXlSMjRaZ1liaHliZjdvM1EvV2dEN1lK?=
 =?utf-8?Q?AJaIgJaGG3yqkLe/4VpUX8scv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e39dcca-e191-4371-d4e1-08de2f98d7a6
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2025 22:44:23.4719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WeUlPY0475fOf8yBVaqpNtn4q08EuQfXWVSJO9IVgQg9xQ4f8eTwM4tgug3BRIhZfkBbOpF1dhdbf8cjXazS7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4150
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

On 11/28/25 1:49 PM, Joel Fernandes wrote:
> On 11/27/2025 8:46 AM, Alexandre Courbot wrote:
>> On Thu Nov 27, 2025 at 2:10 PM JST, Joel Fernandes wrote:
...
>> There is also at least one precedent: the Rust `page_align()` does not
>> call a C helper that wraps `PAGE_ALIGN()`, it just reimplements it. I
>> think `list_head` is a quite similar situation, but ultimately that's
>> for the core team to say.
> 
> I don't think a one size/rule fits all will apply for this. We need carefully do

Case-by-case is certainly a good way to evaluate these things, yes.

> it on a case-by-case basis, for example - if we implement list_add directly in
> rust, we'd miss out on CONFIG_LIST_HARDENED. So for that, I will still use the
> bindings. For INIT_LIST_HEAD and iteration, it should be Ok, though. So I'll add
> that directly in Rust without bindings.

Here, I'm not so sure that even this case is a solid one. Because
CONFIG_LIST_HARDENED is a way for C code to help protect against
list corruption--which is generally going to come from the C side,
not the Rust side, for the most part.

Let the C code have its extra checks, but on the Rust side we can
either add them, or skip them--but I don't think we need to *invoke*
them via the C code.



thanks,
-- 
John Hubbard

