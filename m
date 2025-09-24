Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10825B9C3F2
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 23:15:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7494410E118;
	Wed, 24 Sep 2025 21:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UPt8zQXF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013035.outbound.protection.outlook.com
 [40.107.201.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 652E610E118;
 Wed, 24 Sep 2025 21:15:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FppCPeWH5j5r+BRGNFGEfjkUZ3KI1JAUNNVQHViU7fEJVTST8Lm9DvrszDXGxIFFWV7G/ttNHMggupeb9ET5I1eSYzacTAC3MGgMC13WY3AoHp+e8Eksi4XlEgMJseofrRjyfaWccpx35cKub302uktHC4PLKyvGj/VVGKLsZGKyF5U9ILxqXbvQw5pXXD7yGn77O6AbgYkcjzUD8CyzywrCPnRVUNzLuwEjJDKdcdjGgrdXhkx3FmiW8Xy5LDDZm0VvTUMEd9aGelcoX9+2CUL6cZvvJZ+iKFUy4kR+5O9sciYIFh+nYyTDmIaGlKoyVTJ2p1397e74UHiCrpHZNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+veoGkS2TRts6SU0KE6xLxk4W5GXogPRBwfqdxzSoV0=;
 b=tGLK3AEsVAIMPGTunhqGaNDK0BlmmYOlhO/EGLKjCFeNsRr6+f0SL8tk+jQO4c+WcEPxGBECjrmjdd2M7lj0u+0ztZSU+H0Sh7PnFkZqs7j8zj3fz7ahwOESTL6rQPo5jTY+Ehl8LaKJQqRHpoIgm0MR6/t4JzpncfIVqMPOmrQtUwcn8xNooODMgejUNxJvrhnrnmicBmeNQSGzLaXGS8ZXn+SiQmk5r68Rg7m6zboMUpfZF1LreXfFYkRIiwSlpy3rEy3jnOwgDfKAfJnIWxJbselQm7AvhMbw6h5cAV/6EPjVcQLHgWoa5rmqO6QZCAbR4VzPqv87QHXkbZlfgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+veoGkS2TRts6SU0KE6xLxk4W5GXogPRBwfqdxzSoV0=;
 b=UPt8zQXF/8KoLQQPk/5SyUJSaPept2E7mpZNrbTSCTiwtVoGCDtawwckBC2gYQSmqQa1DKwK1geqO/viglADWDQJ3Rn+mJRPUHpzcEQMPBMLVf3TLtmTMRnRw/0iEs0Z8vC56MLaKNtAHLplEL5CLpRdJ1F/SoxLAVUhawcI0pPLq+uoy4m0xCqHCPJI24VLOMRrhXYz50rvbtUpdcfseXp5YgRJOIA0gRmtcs1RZUZYkD9ySMqno06tBdcwns6WIq36RNyl/BTZbJHGll2HZTov/jI6QsJ9daVu5DDkaclg0SeJOtMjvjwQ0AjSX4KpfgRe+ja5bdc5qXZ3HlsOxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by DS0PR12MB7772.namprd12.prod.outlook.com (2603:10b6:8:138::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Wed, 24 Sep
 2025 21:15:33 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 21:15:32 +0000
Message-ID: <e99d8012-4fb8-4769-a85e-626653701ac2@nvidia.com>
Date: Wed, 24 Sep 2025 14:15:28 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] gpu: nova-core: Create initial Gsp
To: Lyude Paul <lyude@redhat.com>, Alistair Popple <apopple@nvidia.com>,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-3-apopple@nvidia.com>
 <8c754dd68b7caba32888a5b33fac4e4c5c8d6991.camel@redhat.com>
 <5edf3123-4721-4a02-b5b8-9556804b248b@nvidia.com>
 <99fc315a007f9e54dc57772093fcad71bb82766f.camel@redhat.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <99fc315a007f9e54dc57772093fcad71bb82766f.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0038.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::13) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|DS0PR12MB7772:EE_
X-MS-Office365-Filtering-Correlation-Id: 2687fc93-1abc-4f4f-6782-08ddfbaf7ef0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d25YU2JZT1BNZ0FjckpIZWNTZzBuUERDdjVaanBEMHpjTTlBT0ludFRoc1JQ?=
 =?utf-8?B?M2hwdG1QVS9GQlFmWi9yaGkyWFozbEdKbC9wWkQvQlBCZVcrZnc3N2RXdVdK?=
 =?utf-8?B?Q3BsOW11MHdxNEV6MmJNS0JENFcwMGxDblBITCtBZ3NsQlpUQVZ2U3JrSGRa?=
 =?utf-8?B?S3R4bjQ1cXJQMnBrczdCaGFzc2s1dzZDTUdaUFA0K2pySDZGSFJ3djBmNWhT?=
 =?utf-8?B?NCsrbVpESkdMQ3djcjhzVHF4TXhYdkJOa09nZVh2REd1eHFTKysvUGFnUzFS?=
 =?utf-8?B?RG9ucXBwTElscFF2L3NaZnNoaE4zUnc1TmVoRTVPUjBwL2JselVxbmJBN1Nm?=
 =?utf-8?B?NFErVjhIY0RPVEVoS0FOQ3ZjOXZvSDZ4ODI2STk1ZFNiN3F2TVFhQkJ6Ynov?=
 =?utf-8?B?NThLOFd2WG9ONlFkNENYODd0N3didkJRc20wcUhIYTZ4L1Q0TVpJNGtZemc1?=
 =?utf-8?B?VTh5azNwdlZ1Y1RkNWhKRlFpS3NKc3Z0Nlp5aFdCYmE1SFcrRGU2SVdJaW9h?=
 =?utf-8?B?S1Y3aEJWVkM5UWNqYW9Sb1lxeUpVb2FxdUxOSHYvRHFhek5YVDRpL1hOVjhz?=
 =?utf-8?B?MWdLQVlRNEJlRkY3V0Q5d0kxbkIzckdxcWtsV2JvN2Q0TE0zMWQvSGd1YXRB?=
 =?utf-8?B?S1JHR0hYREtDSUZwVTFjUFd6Tnh5NFpUR3BIUEtYL0hkM0RucE9IWTlyRTBy?=
 =?utf-8?B?TnNYdGIxWjRNTGdKTVNtUDlGS05tSVpTMUp1b0c1TkRkdUs5TkoreElJS0xG?=
 =?utf-8?B?aktRWmI2WDNFOTV2ZVdaNVZpNTdmVHoxN1NCWEkrdGxCbWxWZlppelVGU0RB?=
 =?utf-8?B?WHJnNTdLZXhQbGVZUXpBSm5DT3ZJelkvcllQcmVBRXJIQ2hWMXBpYVFERWxa?=
 =?utf-8?B?aGkyZkpPWjVWTklrWEFSdlNKRzRxNU1yYlJCU1JKdGxSYTkxSW9rOEJGSERx?=
 =?utf-8?B?R1RyQWRBRVM3RERibHpmRGQ0YW9FcmZKNzBPcnpVWHJPN2FDbE0xdWk4QW44?=
 =?utf-8?B?QlpDc3NWd1Y3cUpIaW5TSzJMWUpyM1lDVC9KcGsvOWduMWJxNzRPQ011RXdO?=
 =?utf-8?B?UHc1YnBIOXpXbnlHQmFCWll0Y1J2ZE1qSmxVQlBrUTdoc1Q0bHc4V3FObHU4?=
 =?utf-8?B?WXJMcnZ3cVlJOGcybTQraGFMNEhDMTkwUzVxMHVnd0swRWFUZUcvbXhmUVE5?=
 =?utf-8?B?SXZtYU1XM2w0WU5zQkxuMXlXRGVEZ1ozamdXMm5BNXI5bGtGcExtZkpXY01F?=
 =?utf-8?B?a2hQQVJqajhxNmwrcDd2ZEkySi9UTWJXdUdMWGxXVjlxWEdlL3J6Vm03WC8w?=
 =?utf-8?B?aGxhblhycUJBZU9pYzdEUlJJMWtFTkNvaXZiNFhrYlJFQnFxSHVJbVI2bUtZ?=
 =?utf-8?B?bEYzdEV2VEtEaTVPMjBYV01aeCtBVUxnVkFlMnkzVzJYK3E3bEc4NkpHbk53?=
 =?utf-8?B?bEtuVjUrZE1nVTNnakFlc1RhVkdYS2ZyWTVTUXh2dUpyTVd0RWhkdmtMd1VI?=
 =?utf-8?B?QmlLcTBUanl3LzgvSmJUWWJDSjd0RVBac3NaTVdacDRUV1Ntd0F4ajdKUFZq?=
 =?utf-8?B?eTZncmVBWUtmanpMQUpxbXBKOW8wSGhlRXBhbXdwOFF2dXFNSjZIc1JqUit0?=
 =?utf-8?B?cWhQaWsyUStoL3BJZ2VzZGRGaTVOS2EyQTRYc0IvMkQ1Yi9GRTNWamx5NVc3?=
 =?utf-8?B?MCsrckUwcGxXQW1UMExRV25IT2dlbmhjSnhnYU5UelAraWVicDI3aXR5Vk1S?=
 =?utf-8?B?cHlwY3JKK3lkODRxa09tT2hLMHJBbDRTVnQ1M0t1cTVZZS9xVnFvaTRySDVx?=
 =?utf-8?B?a25sWEVmQ0VYaDhyTUtzcE9jUnNObUwyT0QrTVNuR3duL3R1dkp1dUx4cnQ5?=
 =?utf-8?B?NDVPSHk2aE1rME1HVmg4cUovclFtMEkrY2hpU2c3TGhpRWtmTkFNYURSTHhC?=
 =?utf-8?Q?GTxNCd+fg+8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NExSNTBLUlBLL2h4WHJRY0E4ZzY5WU41d2REMHRLQ0s5RVRxVVlBMFEyQ2NS?=
 =?utf-8?B?M0JoNGh2VzdGcXZTVmNPYW5BeDFqL282cXV3UXJ5YWI2MDZVSWtDSGRZZ1Rj?=
 =?utf-8?B?K3VqOHgyUDBsRWJLY05qSTVoV1Y3VHRWMGdPVWNSeGZ3NHNpTnk4MEpxdGhr?=
 =?utf-8?B?N2RyVmhkeU9PZjFHcWwzd0JvZ0x2U0VWZmlJV1Y1czY3TjVJWk5BN1Y0N3lr?=
 =?utf-8?B?MFlGd1hWQUNDZU1KdGUwTUg2M1d1NTBKVUNaWE5zRHk5K2JNWnIwWEo4NVZj?=
 =?utf-8?B?aDJjbGFERUhQUSt3MS9mNjVNcEtqSzhMQ2pqVzFpaWVjcVN1Vmt6UFBSVkg5?=
 =?utf-8?B?azJ4UnRydUVUdTFXKzJacjdxVkZheGdSaHR6UndhSWxYYWpaN0NWN2FjcElo?=
 =?utf-8?B?R2M2bE02UjhZckxaNUc5ZGMzRUkvaFBncGUzaTJhNFV0QlVjNElwelN0dnBW?=
 =?utf-8?B?b2tTUThyRmFZc0pOTTU4SGNuc0s4TXprcnpkcm1FN2VUdldmdGFKTzgzN1A1?=
 =?utf-8?B?UDZzb0J2VWpZQUxHZU5IbStZOUV0R1B0ZGhLTU5WTWtZQy9NMjQ0a0VIekdv?=
 =?utf-8?B?Ri9NOVltSlhqZDZCOUw1WW8vWloyaHFVRmVoaFFWR3ZuZ3U0TG5VdXU2NkNn?=
 =?utf-8?B?ZE9qUUhud2o5RUJCWXhLaVJiMFdsdDFjVkxrMUNjOTF3NlRGd1JnWGxyZkpH?=
 =?utf-8?B?UC9JSllNSmZTODA2aFVZRzdSZ2d0RE1MaEhkZUhvNDFnSHVWVmlWS0dBMkQw?=
 =?utf-8?B?QkxMbDdqM3FxTlR2M1U2WlVSZzhqSFNCaDJJeGM5a21TdTFLSThFbmxCRGJv?=
 =?utf-8?B?dHpJTlAzQ1Y4ZjNvTVM2UitiSHlISy85SUlhdE4xbTNCajFLTnNNSkFodVBu?=
 =?utf-8?B?VnhBV1lYUHhMME5Icmk0eG1vblhXYUlvWktpOG9oVFg2WGNVd2FDREp2VUsv?=
 =?utf-8?B?L2lDVVNpY0Zpa1pvR2RQQnpZQVZMZUE0Yk44QmtlU0dIODFhQURyRTFlNFU0?=
 =?utf-8?B?RHAwekh5SU5qL0dEdFBiaHJGWFBKcExkcWVWUHJWa0ZvTmF0VDc0NVV5d2s5?=
 =?utf-8?B?YkRaeHdUVkl6NHhmTDhpMGlJVWIveTRGNTdHazJhQmJGZExndERoL3pPRllu?=
 =?utf-8?B?ODJXanZHdnBFVnFoQ3EwSkZYc3dDdEhGeTlINFJFaXU1N3RSeEVOQjBadVVB?=
 =?utf-8?B?MitrR0RVUDhuRytKS2tUWDlGdEJpT0d6STZpditLVVFibE45K20wQTU1WWl2?=
 =?utf-8?B?YXR1cS8vTWZDaFJDaTNUU1dDZmwwZjJFNTNNbzJBVGIvSVltV09tT3NCcU9o?=
 =?utf-8?B?bEhzNnk5eUQvdGd1OW9uV3NqNE9aQ1FEMXNyUndtb05QWjNmZ05LeWRLMEI4?=
 =?utf-8?B?YS85L0JZM21BWU5sUzZJWmtuWUoyLzdaTWlsY01DZXF1eXhQZVROZk5MaTBR?=
 =?utf-8?B?eXdXL1dTTXpDUnpYSHNWTlduc3g1UitZdUlrdWswKzFUNGNLWS9ZUWdhdW50?=
 =?utf-8?B?T0F5cE9kTFRtS2RNOUZHSkxVRm5vcitGdjZtbm5SSmxnc2lmd3Q1NVF3RDRW?=
 =?utf-8?B?WFBzNFo4QXFMV1YxL3B5S1ZYUXJzS3VaVTI5Qk45YzBFbUVHWnpPU05LaDZN?=
 =?utf-8?B?NHBnWmFjUFdBNVkwV3dRRW5lZXdtRWxGWVFFRWZhTTlTaFZmNEpHN0MvaDNV?=
 =?utf-8?B?V3JhVzBNSnZPZlAxV3NBOEFoWHZkcjRrN2tybXVrZEhOY2QvN0tMdmFVMWxt?=
 =?utf-8?B?dkZNYXdYUVhEZXRnUDBIczk0MGVZOGxYVncvSk9Eb1FWakllN3hwa3p5QTh4?=
 =?utf-8?B?RXk2bWovRkloK0l0QXFsSmllMGkvUDBmTytINUQ0V2ZtY0RCbmZCL3dzSmJE?=
 =?utf-8?B?YUVzNG9Xenc4ZEhyQjNTcUVYTVR1bDZKaGpncFc1YzdxbnE4OEgxamp1VmhH?=
 =?utf-8?B?TDR6Y3hQcGlsWVNGRWFjM0FodEluY3dKVzNUd1FDNWN1N0xXZHBnS1BMZFlZ?=
 =?utf-8?B?UHI1a00zaXRFZTNrT2FiWHYvMEY3dVpWcnptQkhDaDd3dmhoZHVVR0FHdjQ2?=
 =?utf-8?B?c2liT2lBdkljWlA0blpRbGxkVHRlYlVYcVdJTGNUNXhKZndOZFJxQlQxQ2FN?=
 =?utf-8?Q?uJ4pnVPpKeXSXaFNXOReJ5IAP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2687fc93-1abc-4f4f-6782-08ddfbaf7ef0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 21:15:32.6640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KdJ0rvQvPujMB/6f6FaLFeu8bgpEKDRoCV7VOn9sBjyKw6V4iODoetbEOYwIvoUWqCtryjpeSeIy3uWyL8R2/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7772
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

On 9/24/25 2:07 PM, Lyude Paul wrote:
> On Wed, 2025-09-24 at 13:50 -0700, John Hubbard wrote:
>> On 9/24/25 1:13 PM, Lyude Paul wrote:
>>> Some comments down below
>> ...
>>>> +/// Creates a self-mapping page table for `obj` at its beginning.
>>>> +fn create_pte_array(obj: &mut CoherentAllocation<u8>) {
>>>> +    let num_pages = obj.size().div_ceil(GSP_PAGE_SIZE);
>>>
>>> Unfortunately there's a bit of a gotcha here - we can't actually use functions
>>> like div_ceil as-is, because a number of 32 bit architectures do not support
>>> u64 / u64 natively. The problem is we don't have __aeabi_uldivmod implemented
>>
>> I recall that we agreed that nova will depend upon CONFIG_64BIT.
>>
>> Does that make this point N/A?
> 
> Oh! I apologize, I must have actually missed that memo :). If we're defending

I do enjoy the "defending" stance, that somehow does feel quite
appropriate at times. :)

> on CONFIG_64BIT then that should be fine:
> 
> Reviewed-by: Lyude Paul <lyude@redhat.com>

I found the memo, here it is for future reference:

https://lore.kernel.org/all/DCHE7FOG5ONY.9SVQATXHGM9M@kernel.org/

thanks,
-- 
John Hubbard

