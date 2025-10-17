Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C77BE654E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 06:46:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9616E10EAF4;
	Fri, 17 Oct 2025 04:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VpDcG1g8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010045.outbound.protection.outlook.com
 [40.93.198.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C46B310EAF3;
 Fri, 17 Oct 2025 04:46:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GYPusFxLh7HKI/7llFcd2zScRTBWGQiSV4FQkD/aS1RoQsoHgSmadocbCXRs1UE7N9R4aZGFT41gHg/MLGzx1r60C4Lvx0PNY0sgKwhGGnEd92pCZBf38v8PsectguvPC+gOphSjgO6NutG5kMHhpSp1aOu3BXEXf+bNl+obmD0iPI7w/u4Pwf03aHEIKceWDFts51WvNl/cTHYZlXaufK3Ruqtes/q3/s/KRufzNDUDyCH1fRQ8xiCZPpeMQpKglWVhaZKOBYj2K6lAd2PoqxXchfp1xNSJlFRpi4IMqqjz3LiYtgWP5iHeMsmWujmtIdQzGgpNlQ9UK1qkcuH5TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pfreCQLIri2JzvM6k8CZV+DKazp60+D5cFHd//WpZ+0=;
 b=vNMwCNQCX+FESFUsXMHzKzYaJymOCLH/oKHo5Yi+1pC/pbEg6nSBMJNuon8YgsIDJ2+KiUWiDqd+OkaOrrfR5zIopYxadoRqnsfNn07t3uO2KlHzArd1EchM9Upz8BmgXTMTje1RSxIcBjAoSvjEsZiNjO4KobGSa55IBenq6Ev1y3om6y3nXmtttaG5TX12THT6QX9Y1omaCLE+SZWleGia9v9gQCSfOeT8epIZfcwVvG3MCu5ee9OmGuQ20QWP3M8RIWG3c0K/7M4TTYN+yPaCW3AK0IJPwTD06KhqF2YHbwTFVzTtrURfv+fKFK4rbdyuAMb6rl/cFQptAFkdiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pfreCQLIri2JzvM6k8CZV+DKazp60+D5cFHd//WpZ+0=;
 b=VpDcG1g8+hqJaQdWIROrPkOvIVUT0JPc1X9cCAjWgsxgJxo6lxxy/AEWduSoO1g5KVmyGMUKmEvzgm6Z37HxR49BfSxsyBNA75nXHqLQuC0GhHUDZoVLXSgsbhz0wdoTRHnPcd3CQbZv5Sqr0WFn3JGvmEqhGUDTibz//3HK1mQewDprIiLqOV4oEWAslvwqs2sNsBA1Pp7OcMIv9IUaz44sWTE0cYm1Kf4HdOi+uHc+nuvhEbTclKvAF/07pD65v3b69/Njb/pDqPEi3wEdRv4x0I9h8dC8XHapdHePeSgoGrxf70fi/QjEqDrqFo7Bda+k4dFn8fvmrWfFtaPxgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH7PR12MB5856.namprd12.prod.outlook.com (2603:10b6:510:1d7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 04:46:04 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9228.012; Fri, 17 Oct 2025
 04:46:04 +0000
Date: Fri, 17 Oct 2025 15:45:59 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v5 04/14] gpu: nova-core: Add a slice-buffer (sbuffer)
 datastructure
Message-ID: <kddcagu44v2a3lbxvid6wppm26wkx6ippxwa4nkaqppci5unna@oguriptlzthn>
References: <20251013062041.1639529-1-apopple@nvidia.com>
 <20251013062041.1639529-5-apopple@nvidia.com>
 <DDJJ4P7ED3LJ.6YD2M62RB5VY@nvidia.com>
 <CANiq72kpgPT8=-UPj8Bez_ui=MTVauCPg7CabDau=jxOB8qdow@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kpgPT8=-UPj8Bez_ui=MTVauCPg7CabDau=jxOB8qdow@mail.gmail.com>
X-ClientProxiedBy: SY5P282CA0137.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:205::11) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH7PR12MB5856:EE_
X-MS-Office365-Filtering-Correlation-Id: c84ac9ea-0484-4f6a-bb14-08de0d381469
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007|27256017; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1hNOTlzQlRkOTZLdjhLZkhCblc0NUZ5ellzOURGQ1hsM3EvanBPN1BlVXFq?=
 =?utf-8?B?YWFWaXV0S1FlWUVWU29SVVdaMEVFa2Z6bVowd0RWcVh6cWZIeWc0L2lvekNR?=
 =?utf-8?B?NE8wZmtKY3FVVWVmbVAxR0ZTazVDQmhJWWwrQ3dMNHdJMk5iRkgwdlZraFd0?=
 =?utf-8?B?M3NSMjlleituTEFUNzVVclhTdGRzanhBVHNjZTdyU0IyOWdzdGt2VlppYXRh?=
 =?utf-8?B?cENzd0xXUS9EcHdHV0xrLzNiN0IzcVZoanNkbzVjdEkvbXhVK3pkMHRwd1Zl?=
 =?utf-8?B?czlqZ0JwaWU4eDI3VWJ4LytFZE1vbkp1MmlHM2JhamgzcjZLMGhWRENnQ0NF?=
 =?utf-8?B?aUtOOGpqMEtleTUzNWpLRVlhNHBiZHh4YWNxb0FKQnJ4NGF5VHpYMk90clBl?=
 =?utf-8?B?SHRYSmlDTnJDNFRDbzRoRVh1dWVqSXNHSVpVa3dqYXMrNFVuakV3N3ZwNXBo?=
 =?utf-8?B?MmZzQUNwdXB5UlNvNVhRNFN5MHZkcjRmcTFPVDBNMlBXbktBa0JvTGFyczRo?=
 =?utf-8?B?LzdtTXM2QVpZWm9ScGx3NnBsbG1uYk1WUVdiOVRWMXB1MWdHcjNCMVhCMFdo?=
 =?utf-8?B?K0xEaC9zUi9FZWtUWEkrOENQQ1VnQWZ4YVJoWmQ0OWtnTngvOGQzQzVDVUxl?=
 =?utf-8?B?NXJpbE5ob3dnVGpGVzc3Zm9zc1lmK2ZVd2hOSE5iVjJaSC9YaDNKays1UUE1?=
 =?utf-8?B?SUF5ZVpIc3NwNXZBcFI3SlhEci9pNEp0alRxelRkcUNkVkNyVGhDTWJ1cDJX?=
 =?utf-8?B?QTN6bDdDcmFNUlJYUFY2YW02dG5hS0dGU1hWaDhheGYzRXg0NGJFMjZiTGYy?=
 =?utf-8?B?VTRURGtXb3p3aTBuVUtjN1FZLzJweWRhb0V4RDFScVZrSVkwcmlCUHNRRWxo?=
 =?utf-8?B?NUFCK3VuRTFyNjVYakE2K1Uwa0FnNlRwWlBORDRpM2hqY2NtV2dKanA0ZkN4?=
 =?utf-8?B?Z2UrV0dkYXYvMGtteCtGRTdtWmgzaTNJSnpQSUxzUEF2a0hWVXNGZktEbVRy?=
 =?utf-8?B?RmxMRzJXZktGNmhBZXI5NjgxV1BiOWptNlhrVnRianBmN2ZiWWdsd1pMWmNx?=
 =?utf-8?B?MFpuRlNMakwra2ZXbHVIeVRIV3o5RWJ6S09QRUZ3SUtCT2NKdzh5SFBjWGFa?=
 =?utf-8?B?dW9tTlZZTHU0ZGhWQjA2RU9VS1Uvc1pZb0RUd3hURE9JTldzY0FoQVdhbkNB?=
 =?utf-8?B?TFYvaHRGYlYrbmE1dmxJSXFjb2lnK2xuSHdNWDZickl3Uy9jT1B0UjRESEFV?=
 =?utf-8?B?Q3BQeTcxNjVHRCtJTUUyNFVvSFIybEx5M05RS2UxR01MUXI1Q1ZQT3lMbW0w?=
 =?utf-8?B?UEVWbDNIQUQ2RlJjRVFNV0lydWZLWkJOQWt4RXAwbmNOZEg0Nnh4VEpUcWRx?=
 =?utf-8?B?QnI3U2pTNFluc2NXNVpsbFdCKzY0bktKV3V1eVdsOHZrUVpFb2JtdTh0Uk94?=
 =?utf-8?B?eGNDcGNCN0dlaHhURTB3NmVXVDRZRUdqeXdZREdCSVVsK2tWYjJZZmQ3TFN3?=
 =?utf-8?B?VVl2emZHUDN5Wlh0UkJIeGFlZGhNcjIxWHQzYlJvZTdaV0M4clZCdjhxRmdN?=
 =?utf-8?B?RzB3ZTh6MlBpSUtUM1dxM3czdFdYWmk3Rkh5VWI0LzNqQWxKYkdJNWlTWXhs?=
 =?utf-8?B?OUI0QkdndHluU0lWaDdwV0ZzR2l4UmpmeFR3M3JEa0YvZ3pUN0pSaEVmSFRV?=
 =?utf-8?B?Y045Q242VVBQMnlXRUpMTTNZdi9MZmxFbWtuTFhYMlZ3YklXSkZ3MlIrQ3pF?=
 =?utf-8?B?cWF3RmUxUUdVZUE5SldGdFlVd05BWFZnUWltNC9rczV6TUNRK0hTRFhEdG1D?=
 =?utf-8?B?dTdkbFAxRUpubmEwYmRIVEFNRW5naHorTnJZczFlT3N2dk01NmVqZDA5bFJC?=
 =?utf-8?B?VWdiRTgveVBTSk5uQmFQQ2tWZWNPRGd0bnQ1VTJ4blJtazZwOVlBUlhQWHZa?=
 =?utf-8?B?eVdSVVc0NXJHdzVla3ptMW4xeS9DN010UEo0UGI4OGVZSHpQMkpWMkpocThD?=
 =?utf-8?B?ZDBrU0dCdmRVT3lFL0UyVE9odmptRmN1VUszdXRpVEJxWXNHbStJRnFkc2tR?=
 =?utf-8?Q?efisuN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007)(27256017);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djhIUEJFSUQrZy9LOEI2cVZVRzI5MkovbFRuZHlsWENCYlBJRmxseitVaEZr?=
 =?utf-8?B?Q1JSSHdwK0lKb3Mybk1YODZ4dWt1ZTBBdWVidXhwNzNFQkR6SjNqdlB0S25C?=
 =?utf-8?B?V0xaMHZqWndvQkFiVFVLZGtTdW1qVHZBZG0rT2dYMlExMkxRWUZ3ZDlNNUZH?=
 =?utf-8?B?bjNFNVRSSzRLVUllbkpaZktNTmZ5KzFOanZZU2Z6SVJHWjc1dUxIWDh0UXQ4?=
 =?utf-8?B?VFNVWWR1USt0WWxTTktzYXo1RExtVTBCdEV1Y3hkN3hKcU9WL0JTY0hLR2VX?=
 =?utf-8?B?Z1UyQTlybjI1NitMU2k4VUlTRG1KUlkweTRsd2FRMjZxZUpZMm1Obnpua0JY?=
 =?utf-8?B?Q1k2Z1paZTRVNHF2aTBRMCtUQy9lWjNYaFhTWDZqcHp6aUUvOHplZ3E3RTFK?=
 =?utf-8?B?eTRWT2ZTTGFYMldidFlXUmJ0aThSMWU1Z0ZDbTdTUlgxZGRWZm1xSm05RjJL?=
 =?utf-8?B?dU1WTnVoVVplNU4xQXlWck9kN2JBbWc3T0RhaXlmS2ZNRVdTYnd5S2MvQysv?=
 =?utf-8?B?azVjb1E5R0NGRWo0S2krOWRRREFLTVN4d1RZbDEwVy96QXB0ckZXWDdpVEVH?=
 =?utf-8?B?RjNPdVJJZk1zd3FTR1NvK1pxS0RHY1NVODQ2SVlSendNMjJNV2lXZWFhRmZu?=
 =?utf-8?B?bU02RStvUW5NM3B1dFBzd092VEtjQmlMM0JkN2pCSlRIV2JwcmwvZlJ0dks3?=
 =?utf-8?B?OVZYQ0V5RmlnekpGL09mWExtWStpSnB4VGZVZS9HRFB3Umt3Mkd6VHlReHNk?=
 =?utf-8?B?RDhTTCtWejVmWTNNdWVycUdRMTM3dWJuMm4wcWZOc2dkaGRCTW9sRUdzRE1N?=
 =?utf-8?B?SWRxdTRiaEZRTzRrMDRxRzZvWHdvZWtvT2xIdm1Idm1aR1hOY1h3QTlZazNn?=
 =?utf-8?B?Zmk0bk1tOEwreGFZR1BoSXl4eGI1NWpjcThoa2hrWUV5S3M0OGNZVGt3SUZJ?=
 =?utf-8?B?d0RwK1JsemZidW9ZRlUrNjZiTmZwdEtwYUtTUURYOGVGbld4eTEzUVFadUJw?=
 =?utf-8?B?TURTQWlkS3JZWUtIbXpSc1pTK3FHa0xaTXVpTWpFem5keEJWMUFKL1gvNTRW?=
 =?utf-8?B?SzdvK1VDTGFlU2NUbGl4VkJFSUlSN0U1UWtXaW1jcllobHlTTU5VL2VKdG54?=
 =?utf-8?B?Z0VzNmRrak00bm52Uk5YakVyRkRKTytKaUJ4aThSdFZTNlpFTmNHQ3VUd2dt?=
 =?utf-8?B?dlN0WW80cit5T1krQXU1dU5lNUJ3WEhCRmhGSzV1V0ttb3graEVsQWRvamth?=
 =?utf-8?B?Q01XeG1pS0U3aGxwOXU5V0RIY1dBekJPSTAvV2w0NjEwNTFPME5NR3B5S003?=
 =?utf-8?B?OWVhL2IyZTF5ZnV2Y0twTUFDaGV3ZWFYeW1OK2xnN2VIVFNIKzdSL1ZTTTZZ?=
 =?utf-8?B?MVg4eGl6QTM0OENFTXRWZTRWaUVUemtDU1BIWHZuM1h2bVFCMXRTeWNTUy9Y?=
 =?utf-8?B?MlNCRmhUZ2VaQUFycVlnQS9VWDFxSGI5UnNtYmtNWW9jeWYvZEdPY2hYODNL?=
 =?utf-8?B?NW83V2ptc3g4R3UvcmlHK3pSQWNZWE9QQ1ZaQkVBOUNmYVp4UndEcFZLc0Ri?=
 =?utf-8?B?TEtjVkt1TXlMN3BDUHV3M0RaYXFlRmRMM0kzbks5UFVFU2lSb25qem04TjMz?=
 =?utf-8?B?Mjk0NE9UeVdzQVVHd2IzNC9qTURWVG54eHE4Z3FnZ0xWOTVaSWt3UndSRnZJ?=
 =?utf-8?B?QWRmOWtKaWpHWUh5Z0RUdktPdVRXc1FUYlFWbUFRTmU1cGhZZ2I1Rndva24y?=
 =?utf-8?B?UHhldVR3Ty83NzZkSFYrQ3ovOHc1UmdjZXZkWjJvRHpCcUU5N3dwanlxK1R5?=
 =?utf-8?B?d2xRQ1R1Y0VnelcyRWo5RzArT2c1TDNqRC9KVjFhWnBrT3J0NG1Xd09oalBn?=
 =?utf-8?B?RVN6U0lDRWEzK2d5MHBjb1hlbXR3OGpOb1Y3cVFXVy9zTUhNcWNvVnEyd2ha?=
 =?utf-8?B?by93TS9MMnczZHFHRjk5b3A2TTE0dUZBcmpobWJtNFo0aDNxZUxJL1dCSHJE?=
 =?utf-8?B?bG5iTktGQ05KMkJ6ekF2d0RLL2YzdVh6MlZSWk9lbk5PdWtLQjVaZURDd2Rk?=
 =?utf-8?B?TnRQNzN2a0tPT3NBS1VIWW9Sc0VXVXZZZUY4SndaQUkzR2t5M0liTHdzWERJ?=
 =?utf-8?Q?0RD1OUvstf+VpDFNH5I8iyFBf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c84ac9ea-0484-4f6a-bb14-08de0d381469
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 04:46:04.7488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AvAYx2zV1+KQyJHNcPiRp1pKJV2Y6ScvVoO5YGMKZTN2YZnfVFkruWGqrU4Vw8Ok2Ixsvh6ThZxm4iUHQN870Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5856
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

On 2025-10-17 at 06:18 +1100, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote...
> On Thu, Oct 16, 2025 at 8:23 AM Alexandre Courbot <acourbot@nvidia.com> wrote:
> >
> > On Mon Oct 13, 2025 at 3:20 PM JST, Alistair Popple wrote:
> > >
> > > +/// # Example:
> > > +///
> > > +/// ```
> > > +/// let mut buf1 = [0u8; 5];
> > > +/// let mut buf2 = [0u8; 5];
> > > +/// let mut sbuffer = SBufferIter::new_writer([&buf1, &buf2]);
> > > +///
> > > +/// let data = b"hello";
> > > +/// let result = sbuffer.write_all(data);
> > > +/// ```
> >
> > This example doesn't build - there are several things wrong with it. It
> > is also missing statements to confirm and show the expected result. Here
> > is a fixed and slightly improved version:

Argh, you're right. I cut and pasted then edited the wrong thing from my test
build. How are you building these? The `rustdoc` target seems to ignore Nova (or
I'm doing something wrong).

> Yeah, I mentioned this one in a previous version -- the section header
> is also still wrong too.
> 
> Alistair, please check the link I gave:

Will do. I thought Joel had addressed your comments in the fix patch I pulled in
from him (he wrote most of this originally) but I can see the `/// # Example:`
heading is wrong.

>     https://docs.kernel.org/rust/coding-guidelines.html#code-documentation
> 
> or other code in the `kernel` crate for examples on how it is usually done.
> 
> It is not critical today, of course, but the further it is from what
> will be needed in a few months, the harder it will become to start
> building the docs and running the examples as KUnit tests.

No, I think it *is* critical :-) Much easier just to get this right from the
beginning than deal with heaps of errors/warnings later. It's just my fingers
that are still getting used to the subtle differences between C kernel code and
Rust kernel code, so thanks for the guidance.

 - Alistair

> 
> Thanks!
> 
> Cheers,
> Miguel
