Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B94B5633F
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 23:30:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E4ED10E1F4;
	Sat, 13 Sep 2025 21:30:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qj253Yqf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4224810E1F1;
 Sat, 13 Sep 2025 21:29:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E1Mg1GE5+K99C8BsgQCQvzyKAGy6c49aSAXqqyxSLwshP3XDMSIIO6uWYEGija/z8VwjFiNRVjf/vGet2IqojS1IaKyP2/IbvcdeJo4AyKUNIwtkyHFshnVpKegpMni9ybKcDg+E7FoGeYIv1AbA78KdfopRqAVdBaqwhguQSBPE/pMQvRjee8rRPquu80FroZV86Svj2DXsLW8XKm2SoRprSmRv/D0zJcpOP7kyO2t9B6TCjeRsnTyeob7TixR+cfCCyKBbrEpr1e004BjADZxuC5P9Sp+HLtR13NG1v7hlF6+78o5dJExJEp+w1kneZs4dbn1e76VybAveZwh3mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+c2S/N8t/hWI8QICP2Mm021TTiaG2f6UG7qfcZcREAw=;
 b=S7dbJ/EICTJkDLrFVfV/2JERt7KNqKhU9UEo6qp50ZxNOk45nIeCienyq6MspniURo571mdThvdTkGK60ShCRWQVQl9mKNDPWeezAjXKqCOtr4osnxGyXpLXLutEcUtVwktQx+zIexq4QZRft5ic2pZJpIcK5FyqrCp2otsaYlKGPcWfegB29lbrHoJOe+dM2K8xCOSjopHFl7DGFdU+HUdCoeqigrKxsO0pWv9BWvjaXz3+012Dr8X6vrHb8zfvQUh8OGkW+FPz/tiD/KnILPwu2E14NrucZv/4vG1BUSk5pvLIp1dqtZ1OJy+tjhQHEyC798QIte9uTxrn4hGv4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+c2S/N8t/hWI8QICP2Mm021TTiaG2f6UG7qfcZcREAw=;
 b=qj253YqfdZmkqWufYMojGGskauDx8wYZTyzOuygeuE+XbKXDdhp584xPc3dlC/I0RqrsN3vJuNu5pIQSiKSnYpEkwNnzW4IHGNDB45xnrMcnP5FLY7rsDevvV6f7qtdoPSFATbskbHIgvOQCtXhQ1xp2IjFED/izWuADtOyGDpB9OvAAacscuFFRgZCIJrjWXD5QXmGyFWN/hH3oUu6Pg/jjc8GlG/LKK+df2ub5oBjZWkg4Drlsql+GQ7AEcUenZmC6NxV281Q808loC8cqmS8aEUTrf1GGPCvLktVr1WW7nuqXctojhD+Dc5E6dO0NPKf8YOl784gEAgmCANSZUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by SA5PPFCB4F033D6.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8e2) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Sat, 13 Sep
 2025 21:29:55 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9115.018; Sat, 13 Sep 2025
 21:29:55 +0000
Message-ID: <b1aea815-68b4-4d6c-9e12-3a949ee290c6@nvidia.com>
Date: Sat, 13 Sep 2025 14:29:54 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/12] gpu: nova-core: move GSP boot code to a
 dedicated method
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Joel Fernandes <joelagnelf@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
 <20250911-nova_firmware-v5-2-5a8a33bddca1@nvidia.com>
 <e1755470-587b-4a43-8171-3d031b7fb4f4@kernel.org>
 <DCPYQNZG1OJK.2EE4JWJAROK57@nvidia.com>
 <ce74db34-77bc-4207-94c8-6e0580189448@kernel.org>
 <DCQ074EMFNIK.1OJLWJXWZLDXZ@nvidia.com> <20250913010226.GA1478480@joelbox2>
 <DCRPJKD0UHDQ.IOWSOB2IK06E@kernel.org> <20250913171357.GA1551194@joelbox2>
 <CANiq72n50MaMXeWdwvVOEQd3YEHbDRqeeRzbdY8hPnePtq-hnw@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CANiq72n50MaMXeWdwvVOEQd3YEHbDRqeeRzbdY8hPnePtq-hnw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0287.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::22) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|SA5PPFCB4F033D6:EE_
X-MS-Office365-Filtering-Correlation-Id: 645b7240-4222-485d-19e7-08ddf30caeb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|10070799003|376014|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3ZLM01WUkRuc3RVRVh6QVFLOCtmbDB1OHNYeDRILzJGUG5DMDJkcnI5aEpU?=
 =?utf-8?B?UlRsVlAxMGhPVVFaY3FJMU1lekVlano1UHBWZnAvZDNnQ01mckk4ZngrbWRT?=
 =?utf-8?B?eGxtY3h4UElhVVVmcUozY0ZDMWk5eWRtSmxGZmtuYWxrcHNqc1UzckR5cDJT?=
 =?utf-8?B?ZGhpWVZERnZXdlFIa3lPU0Z4cURSb09NeGtUNk9vTUhTcGZvUlZYVW41SHdl?=
 =?utf-8?B?SitPVlpKdWRvR0E2azltQkphdkNwVUxuRFVzVlhmQVUvZG1UU1lrbWF3c256?=
 =?utf-8?B?T0s0UVJjcHUxVHhlMjllU3NadzVTU0Q1U3liVFB0aVRnVkVHekZXZzlHczFO?=
 =?utf-8?B?NEltdDFmMFhzY2lISENFdXdrb0J0aVVJTy9pRS8zSm5BeUxtTms3UzNDcGVo?=
 =?utf-8?B?Znd0eU9DNEV3N1J4YXdxdWxwTFpLcGFmcllYZjMrWHZnb0pNY0RBWnUrVGp2?=
 =?utf-8?B?RkwzKzJrU3hVekVDUDExZkQ3YlZ2QnpaM0FKWnN5WVNyMVJ5eDJOYUFCSzZB?=
 =?utf-8?B?R3Q0MVBwbm5Wa0hxTFFPaEFFVDhHbjNodlhDZ3l6TUtsMjhEVDhQaUZ1SjZa?=
 =?utf-8?B?Z2xRNzdjR0VvTVZBTTJVb0FlQXY3bmF1VTBPbCtkclduSzZKSi9lemVhWGxz?=
 =?utf-8?B?U1lFQTFaenlMTUgzR1QrRUJrMVFwSWIvdDJNQ2xBOVpVTzZhcnBiRHFHbEp4?=
 =?utf-8?B?S3lXK0hyanhOYUQ2UlBYZHA4aFU5NUE3Z2dkL2VoaVhiaU5zNXk0MjJWeFZG?=
 =?utf-8?B?U0Zic0JVWlAzd3pUUFRDUmlNNXpqL1ZaRDF1N1piY3I5Yyt1eE45UGI4bWFk?=
 =?utf-8?B?b28ySWlvaFd1cjRraWY2TFlTb1AyNnpodExxM1hIQmlrVklHMGZkQVV3cmVq?=
 =?utf-8?B?NW9yT0hGZElFZzdCdGlnZjJiMWRXTmRndEUwUnAxRHRXNUVZQ2t0U3VPdHAz?=
 =?utf-8?B?eFhkckFqbjFxeklkU24weGsxUWhnZXJiUWVjZ0tHQUJMNGxMZm04V2syUnJn?=
 =?utf-8?B?cnJuVmhwajd6UGo0aVNYcXdGQmVhL25LQWdnMUdrV3BXWGpqOG5va3lJUEpI?=
 =?utf-8?B?emFyaXVmWmdWdmJob3hvc05QTDNKWXVKRmhITlJZNFhOb2ZQVVZoZHdHRUZN?=
 =?utf-8?B?V1RTT052V1NmMHM3eTV2WU0xUlEydy83eWJkVUhIZmZ3WFdaNW4rbGlKTzQw?=
 =?utf-8?B?ODd0bHRmejF3dFhCVWhSdkRtWjRCOHIyQXlSdkMzTW1DQWZ1NE84eEI1VFNC?=
 =?utf-8?B?MmN1c3BnTjZWU2ZkdjZVVFRFSGQ1czF3OXZZRWNyUUlLRE84NWd0MWxYRDMv?=
 =?utf-8?B?WGoyQlh6NytUbU1ITXM5YkN3VnVXVWVscER0aWJFeVEyaXdrZGMvMG5YVith?=
 =?utf-8?B?RCsyVGtDTGpZeUJRRGhZQkpNNllpZy9CSGQvZzlQMGxjdlNRbUtYd1RCSUhw?=
 =?utf-8?B?QkoybC9uMHUrSHZKSTVtcHk4cEhGUlR4Sy9HMGlqNWZhK2FmWGF0L2dhVFJI?=
 =?utf-8?B?V29jcHZkVkRLWWg3SU9Bb0NJSXhFZEF2TjcvV3h6VEZsZ3lOQTNJcEhhNDZF?=
 =?utf-8?B?UWp2ZFZacjNwRDJDYnJFemxvOEJ0ejZLODk2ZW0xU3RqRWxPSmkxbHRmUUIw?=
 =?utf-8?B?a0NWRXpvY21xdnUrSXo4OTFRcks3dURnTUZWYmpxY2Fnbkhzc1M2b2M5dFlP?=
 =?utf-8?B?Qm1NNzB4T0Z6ZVF1TklRMTdrbVFCcmNPL2hWVStOcFRhNW1QWmxPUm9aRm51?=
 =?utf-8?B?UjdEVjZVaVVZNEJrTXVOaTdubHlYdjZUdktaa1VremJPTml3c3VRRkt5WTJB?=
 =?utf-8?B?ZDlUUzZPNDE1RkVXSWVndmhXYmw5aGo4c3VnTFlpZGpHQy9YVGtrOFlkWlNh?=
 =?utf-8?B?SHdVT3Ruc0dSdW9vSnJrMkxmNHhhVWZBSW9HZ0tIeW5kMVlWU0VwNk9JWVZH?=
 =?utf-8?Q?pbCp1iSi7YE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(10070799003)(376014)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTVmSEw1azc4SjZ6SHI2ZUJFYzE5dWdNZGRDZU1xRkJUSTFzc01qQ2s3b29Y?=
 =?utf-8?B?RFVWbW0wZFZhVEZMVFlOU2s3Rk42WGJxY2MrSzlIZVEyZnVWWmZjUjdFOEFL?=
 =?utf-8?B?L1dJZmJWY3hpdHoyR05GNVVCVFExUEYxQzVNd3VFa0NHVGZxVlFoV2Y3Y1NZ?=
 =?utf-8?B?SWUydkthU3I1SSt4b0NrSG15VHZSN29uYUs4UGNWWHljTnhyekp2alllcFFN?=
 =?utf-8?B?SlFxSVFEWGQveVZJQlo4aFVDUHgzNkQxZnRRcHZZcTVwQUxlZXc1SS9OR2Nn?=
 =?utf-8?B?RkV5eXdMdjRGWktDRlpaRDVLZE9tRWR6MXRVVTJzQ29ocmhoOFFiQTVCUGpG?=
 =?utf-8?B?cWN4NVB2bmJzTXR1cEFwQ3RXUDVYdkloSXdqYW9aRDM5d1JaeDRXNVJpeEND?=
 =?utf-8?B?WitscVZJM1BEb0tvQW4zVVJIYTBFZmFxRHJCOU9FWFh0MWxPaStHYk9LQjFO?=
 =?utf-8?B?VEdMYlVGRWEvY2JIMVZKZWRaOWYraEdsc1J3SGFUK09lczZvUXg1VkNkd0lx?=
 =?utf-8?B?V3J2YUZyS1JyZUFXdVgxMTVSRU11YktvN1FsUGh0OEZ3TEJtbU1MUzFiUHlG?=
 =?utf-8?B?L2U4NXY0MysyNThVR0xDSW9aRFlmaHpYUXY2NlJCMkkxMmRYUURqSXdndUN0?=
 =?utf-8?B?SUs5VU90UEFKQ2pqbGhKN2dqMVhRVnFDWDBXSkZLNi9nRFF6V1JkdVBtQndw?=
 =?utf-8?B?TUloNUZTZEE4OGUrYk1UaTN1TEtGL2kwUWNOaUlIVi9jOWJsS2pYaUlBd214?=
 =?utf-8?B?cjFlcW5FbGpsRTl6bWg1ZVpTc2VOZTRHNW45L2lkdzkyUnZHVWpZRGFxNFk4?=
 =?utf-8?B?UmIyTFFrRjZEa1Y0ZWlKOGFTZXBZS21UR1gxcGlYWXk0YnZFbGVHdVNkYnVk?=
 =?utf-8?B?RCt3YjdOck9pSzRIRWQzYlNoaXM2am4rdVJpWHJjc0NwdUlLZENvakdJQlpt?=
 =?utf-8?B?akdyaXJrcG5RNVRWdXN4NnRPekN4NGpvZFVBYnh3VDgwN2NtNllvbHBsZmJ0?=
 =?utf-8?B?V1I3WDJSM2N2cHFwN1JPUGppWHhZajBNVDdtVkxvQXlDTFBDVXJ2enpIUTVo?=
 =?utf-8?B?ZTZKeWYrUUlXeWdIcHJBR0JCTHcvME0wcHhYeHJYUVE4TlR2RzlrYmkrcnVr?=
 =?utf-8?B?djBZakJ0cEtPOWhWRmE0aDIwbG9xK2liMHhOYml2enBYQ1NHUGQ1ZmNRRldk?=
 =?utf-8?B?ZHd3SHo2TXhGcnByYm8xajhuUEhobmhka2FvQWpVaE1iZWY3M3dHdWhIakNV?=
 =?utf-8?B?cW9CdFdVbVZmNVVLcURMb3BoVzBBLzV0a3ZKaHJ4V1ZrOWVTUElkeXJGMHVz?=
 =?utf-8?B?aVptMHQzdWRVT3JZV0ozQjFETU1zbTFBV0lLVDc0Tm9HVldwb2tlNHVjdmoy?=
 =?utf-8?B?eHJoUWNNOXhKUkZXbXdjYjJnT3p5cE1sTVZiMFdBY2pTM2kzWUloUUh0YkN2?=
 =?utf-8?B?Tkhoa1hzUGt3ZlF2eUpyU2d4YlphUUpCSjlPc2RMSWFhbmIyVUx1VU1VcmhI?=
 =?utf-8?B?bW9Rc3gwMUdUNzRtaHRZeTlIaTZFRW9QVDFpTmpIeTFSK1dqMS9FT0NyaGRG?=
 =?utf-8?B?akhrN25LaDdpYm1HUXBxMTdDakJFTUpmb2dNaDVEMkFXNGlMUDhjTmFKYjZJ?=
 =?utf-8?B?cTZ0cmI4TlJDdkQxbjJXTzN0U0J5Qmc0ZFM5TFpNSlg5cUtQLzB2NGZyVEVs?=
 =?utf-8?B?clFud0JuRkgzTkxmd3FveHpta1lLdDRXbndLeVVPVHgzbWo3a0NTZ2RseHN3?=
 =?utf-8?B?bVpLU090M0xVZm1pQWNaLzdrR1lWcWdhTk1GQURwM21yK1M2V1JsbEVyMkJI?=
 =?utf-8?B?dGF1WEl3UklXZnVSM0ZaeFVXWkZ3RkJrK1lhQ2lFNHlwZjRSbnR1Z0hQazgz?=
 =?utf-8?B?NjVHaWlwNmJROHc1dUxxWjBJYlJERWhCNXdCejM2SzRLcnQ5UFhEMGt0OUxC?=
 =?utf-8?B?Y0M5anlYM3FUOG1Ec0xtT25wd3p0Q2lWZjEzRHhRcTVtQVpTOHNMMlZKQUk1?=
 =?utf-8?B?Lyt1ME56OUZUaXZDaXMwV3RhU1dpUTJEalRNK1M2Z0FyYzZSVEo1NjFCUjlv?=
 =?utf-8?B?NW41bTY3ak9jSmZ0TE5Ub0w5K3hNSndYTFZzaGlPazN0N1BCOWs0RE5xWnEv?=
 =?utf-8?B?WFRmMnhjSEJsL0ZnaHpCT29kbHlIUXFCdkRyajBNU1J5aXRzSUZwQmMwcHQ0?=
 =?utf-8?B?SWc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 645b7240-4222-485d-19e7-08ddf30caeb9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2025 21:29:55.4776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w0m9KoeT30atgm6Xa+Eun70wTvAv/Afqfy853oUOHejpriCgXpXK/Bg9Uesh5Z+8CQKsp/WPF3jQFB4k0cS7SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFCB4F033D6
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

On 9/13/25 1:37 PM, Miguel Ojeda wrote:
> On Sat, Sep 13, 2025 at 7:14 PM Joel Fernandes <joelagnelf@nvidia.com> wrote:
>>
>> I am not alone in that opinion.
> 
> Hmm... I am not sure how to read this.
> 
>> This should be first-class in a (systems) language, built into
>> the language itself?

On this particular point, and *only* this point: some time around
mid-2025, I started wondering out loud, "shouldn't Rust have some
built-in understanding, in the language/compiler itself, of the
concept of pinned memory?"

Because, after doing a modest bit of Rust for Linux coding, I was
struck by "Rust is a systems programming langauge", vs. "systems
programming often involves DMA (which generally pins memory)".
And the other observation is that pin-init discussions are some
of the most advanced and exotic in Rust for Linux. These things
don't go together.

So it seemed like this is a lesson that Rust for Linux has learned,
that can be taken back to Rust itself. I recommended this as a
non-urgent Kangrejos topic.

> 
> I would suggest taking a look at our website and the links there (like
> issue #2) -- what we are doing upstream Rust is documented.

...and my question was asked before reading through issue #2. So your
and Danilo's responses seem to be saying that there is already some
understanding that this is an area that could be improved.

Good!

I believe "issue #2" refers to this, right?

    https://github.com/Rust-for-Linux/linux/issues/2

That's going to take some time to figure out if it interects
what I was requesting, but I'll have a go at it.

> 
> (Danilo gave you a direct link, but I mention it this way because
> there are a lot of things going on, and it is worth a look and perhaps
> you may find something interesting you could help with).
> 
>> except to satisfy paranoia
> 
> Using unsafe code everywhere (or introducing unsoundness or UB for
> convenience) would defeat much of the Rust for Linux exercise.
> 

Yes. It's only "paranoia" if the code is bug-free. So Rust itself
naturally will look "a little" paranoid, that's core to its mission. :)


thanks,
-- 
John Hubbard

