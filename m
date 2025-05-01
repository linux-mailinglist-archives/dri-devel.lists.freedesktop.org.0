Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC84AA602A
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 16:41:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1966410E861;
	Thu,  1 May 2025 14:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XVcLRWT/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2085.outbound.protection.outlook.com [40.107.236.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B5E10E861;
 Thu,  1 May 2025 14:41:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZjZgg+ZF8ZHAZqXMPjEIkb2/crzMKLu+CPJJvMj5KXJBN8Y0rRY6Faf34wEWnah++C20PRg6za/EUV7bN3rG0TZaZAnPvC1Ee867pgRfZsJMPH+JxMZzaqShHpsi+ZOKZI9HoNDYZS4CoYhefE97IUwBep/rbvewAH4T2anwDLnRBQvw4oXmpvOdFoBTvf3GnxO3Spagl9/0iIvxb+XiUsf04BcgE/DvDyDBYIHhI2uf+nY6uw/XCtTKfvO3Mis06ngepr0Vm/G56iwxzSsRfc+yhlK0ZbCtG+at3h1oFPEwftU7bUkNrpOIf/GmG19buCkN1O5UCFi2GYiFQSJmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMB/8Ow2UR/Spr9fvu7R3LuoT3bHMaAKen9E5h15/+M=;
 b=GbrMsfWTK2xgmOynwHo4N8P770FlDjzeEmkzlXwPQkO9+4AqDCZypf8hh1KyhyfYPJ+1NeujR9MxM9SxqPi8TJN99HsNEjSBm29kMLqw0i/w7SAGXIGdMk+8MXOhhDC2cqwLo1d9D7n3o3ARa7GEfnc0KeM4B0E1EOJACzQZYd5jf6UjdC4Yxfxq/BPyUuBviJbji9LOlGh0OY6GwxJYz1GzesyWhLz06wy6dV+io2ugd8w63d00/y3EY6JUGAxHqU2b0QTJVsTicL5UQWYM1kbb1z2dIb03NN9YkiWeyve3cR650RZxoz4mHGzaaL6FF0Yat9x1ugIALBzzTyP2MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMB/8Ow2UR/Spr9fvu7R3LuoT3bHMaAKen9E5h15/+M=;
 b=XVcLRWT/e0OIUWK9hwEtUh4Jm9Fi0W9KHB1Qg8io8V8NWD9Qt1DzDfp8ldmCWBFwSAFSZ+iCArbZ1g3881EADJcfCB9tV97TavdkqCXy9jXXvCjJkNqesFRwO92QD0ESYCQms/Y2U65YXTVSdiDxfKM0HZRT1tHo2rHbzQHN4c/EBmPzl7AIC2Xx1fJAP/bzd74+5zqLXTeeWh4rtYbZIu62BxOwv7B0/02QLcjdxt0nvzH6ZbF2GqSMNC97wwkGvX00lbEeDV5NcbdGRwznJDikJzAR7KA4flaG9UzIQSVMc3x7FuvFHzq5tdk0D0eRn96HfTfNb1noYVrrvwNg6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA0PR12MB8253.namprd12.prod.outlook.com (2603:10b6:208:402::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Thu, 1 May
 2025 14:41:19 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8699.021; Thu, 1 May 2025
 14:41:19 +0000
Message-ID: <f18a9db5-d2e4-4f14-bfa1-dd6542d3d733@nvidia.com>
Date: Thu, 1 May 2025 10:41:12 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/21] gpu: nova-core: add falcon register definitions
 and base code
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, John Hubbard <jhubbard@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
 <20250501-nova-frts-v2-15-b4a137175337@nvidia.com>
 <20250501135234.GA687268@joelnvbox> <D9KW0GBF05DI.CYOUTQ2TD1XD@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <D9KW0GBF05DI.CYOUTQ2TD1XD@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::10) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|IA0PR12MB8253:EE_
X-MS-Office365-Filtering-Correlation-Id: 6998d31c-ef73-4ccb-9c1a-08dd88be3c2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajVvT1RaekFtemt4MzBMQnQzRlNIWklZME5LOFhFUU9POGwzYWNlSnVHS2hU?=
 =?utf-8?B?NlkwMkt0dHFZVUdUbGIzSm5FUVM2c2N0NFBmTnMvZm8zSkZBL2diU2NIZkhs?=
 =?utf-8?B?S2UyZzhRSElYUk5vM0lMVFBMdkd6ZWg3eEtpeFZVQ20wc3pzNnpiaVhuei9k?=
 =?utf-8?B?NUZDRWZOSWJQSHdpcTA2M1VDVWNWWFJyZkJwa0gyRDNvaVdIVlpiK1Iyanl6?=
 =?utf-8?B?aDRyamNxcHg2ZnpyVWxMTFAxd1p6YlZwd0FpcnE2VC9oQzVTTW5ZY0JoVXRC?=
 =?utf-8?B?c2lydUxJR3pHN25zaGxHeFY1ZFMrRGRoN0gzSG5aVU1KRnhVTU5OcERWOUZT?=
 =?utf-8?B?Mm1CQjRMRkVjZ2dyRml1bndDWnA5c3U2N0hibWliWkFaS0RJNWFNTC9HOG1u?=
 =?utf-8?B?a1BLM0JBUFJHQ1E5aEVkeHlvSFkwdVlpUFl0citjVkVGL21lcnppTDJDNEdy?=
 =?utf-8?B?eDF5aEl1UkpqK2hLeFdLaU9HcUZ6WWp4VzNNaHp4V3M2WjNURjBEeUU4aUIw?=
 =?utf-8?B?d0h1WGVmbzdncUh2cjdqYm4rYXpjQjlWaVRMcUExRHRIcnducEgrRUdjQWE4?=
 =?utf-8?B?S0JjTW8rbFZ4VEUveEY2MnFqQWlsM0JJWE9VaDdBb3VOVFNDSGZpN05BT29i?=
 =?utf-8?B?QW1NZ0ZLM1hMNldRc2ZDNnQyNTdhZS9XV084ZVRzWkhSNm5kNTBmNUtNZEJX?=
 =?utf-8?B?QkllQWxsRjdUU1pXR1BYRzNMa1NwQ3VlN1pwR2pJa0ZqaDhXZ01yK1V5dldj?=
 =?utf-8?B?RGhuY3N6cXlXSW5kNHZkQVh0Qjh6ZUlMeWZCV3VvYnFGTXQ4K3VrRHozMmNs?=
 =?utf-8?B?RUp4K0FtbExOeWx1Ym5JNDRVSkM4eVJ4c1RsdzMzZnlKYTFKTStWYklSWnFv?=
 =?utf-8?B?U1NCTjhGQ2MyS2NnbzJsV2JldVc5UlpyK3lNRElpSi9Kc3ZjWHg4bkJOYWhx?=
 =?utf-8?B?U2pTei9jMVdBLy8vYzczOEIxaEJONU1SZXFXUE5VZEl4R203bkhGZU8xNkpI?=
 =?utf-8?B?TWU4Q3JId3BSbU81UUdFWnRvbldMZlh2M2tzbGZybUtLeWZ2azkzUXNaZVln?=
 =?utf-8?B?ZU1EaWRFZHNneTZJdmxObUgwTFFSTE1MQy9OMmhmb01PRmFDSmpYS3FCcGNs?=
 =?utf-8?B?Mno0YkQvMGpVUWtrd3lRTUtPbVJaRGZDeFFyS2FucGNFNE9ERUIzZ0lLNTUy?=
 =?utf-8?B?cDNyR1p1ME56QXRKZTR5NHhwdjJqQnJzek41dDRhbWc3N3dTaVFkSm56M3NV?=
 =?utf-8?B?cHd6dUZsSGtwT3dIdE1sbkJVN1R5KzV6NENYeWM5RkZLcXNwWHFEdG0wT3NU?=
 =?utf-8?B?T0hBMEhZSFRCQUMvL2FXUXh0dXV2TFhjWnpGc3BQMEVzNmVaaTVYV205djZI?=
 =?utf-8?B?bDNUdHBOSmd4REpyT1FrUFVBSG9zNVk2ZFh0ek9MSlNBNzQrR3ZBYUgrQ3p5?=
 =?utf-8?B?Mm1jMm01M0x3ckVhNzJKTmRhSXRlNGt4dGdNT25CY2YzNnkzajdtS1N4MXp2?=
 =?utf-8?B?YlpzY2xUaGk2elJ5VHl1bkVYT0UrZWdGSmE3MWJ2a2RoeFBZVG5CQXp0bndT?=
 =?utf-8?B?ME9VSGY1K1RpMnJpNFhRZWtSdHBkbjFDR3ZJU1hwMm1Ba1I5NHh1RDNtRDZM?=
 =?utf-8?B?bENWQitWdGF5T3dYUzNNY05acHhVZytZdVZvRVhlUjBwWThPS2xmbnlVZHNq?=
 =?utf-8?B?empiMlVsQ0U4YVdwMVBPTitFVVNRRGlaQ3NTS2craE1DWkFmTDhlQUZIUmdU?=
 =?utf-8?B?M0psamhHc0d5MXRiVGhycUU4QzVZeW13L1RScmhhUFZEZTBMbnBYK3NYUFpV?=
 =?utf-8?B?U1hKL2dSUFVCQUhQU0ZWQlY0VFRnNW5rRGN5QkNJY2Y2Wlcrb01QZk1wVUZX?=
 =?utf-8?B?ZkE5cUt1QW9SQWZoTWVCVXd5aTlkak55c3Z1U2lxaXBMNEJkek9NcXdxcjUy?=
 =?utf-8?Q?2yjeeGL+vjM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzFTNWI5K045OEV5czJQMktXeGt6eWZtMnJsdFc1c0ZPZjU5eFVmaGMrVWhD?=
 =?utf-8?B?QWMvcFpQREpzY21XVHE5a1NVd0MyaWpacHRrM3J3NXF5SlZOWVFTbVZSS1hL?=
 =?utf-8?B?bXBzcDdJbnFET0dyLy9tNTlPazIzakRVMEdoMEdyeGJ6UHJzc2J4QitpQ1FN?=
 =?utf-8?B?S2hJa21yMHlQc0Y3VjVpOWpKWGJ3eU5jWXhOTUZ4blJybWlGR1I0M2dZemVB?=
 =?utf-8?B?eTJ4Z1pmQlF2allTQ0tMcEhJNitYa01JMFcyQnRrWkkrV2ZNWkZDd3FCQTNq?=
 =?utf-8?B?WHNLRXhxcUR4M0tEOUd5aTFWQXlsbDd4ZS8wamZJdVVDWStLQjFsUVlPaG5x?=
 =?utf-8?B?Qk1EbXZ3NHEzUkFvalgrRlcvS2huNHBkZlpOU01MOVBDT2loZnNHVktHTjdr?=
 =?utf-8?B?dVE5VGtBSU1NOStzb0tYY0wzU2g5QUluOGlmNmFDSHh6WmU0eXJXZlhCL0k5?=
 =?utf-8?B?NS9BK1hCYzZCZnp0Qjk4R3NzWDFOZ3dodFF2Z3MwTXdLQnFUaEVVeEp4ekVV?=
 =?utf-8?B?c1IyQzg1ZnlhT2RCQUhKQmdDMS9sSUc5Y1V3bFZXa3lkNnpVdStJNVV1VElj?=
 =?utf-8?B?UFdjQ2ZmYmtiTDB0RXFZTjRlZUx5NjFsdnZycG42Tnl0elpYNy9NaXVwT3Zy?=
 =?utf-8?B?SnF2MU5VU0tTTVhVSnU3TkhGdTVseCtDOGZlS1lROUVqeVdZYVd3enlFd0hB?=
 =?utf-8?B?V1N0UEhCalQvZXhxcWlCczdSU294TjZmLzNHMXBxbzJEVzZxdWlGQmh3aWRB?=
 =?utf-8?B?ai82bTRCVGdHeDcyVGd6eEdkWnVuTTg4M2tYTFJJd2ljejVpS1VTdk5taFZv?=
 =?utf-8?B?bkhOUjlTN2MvTWNXMVltN3FXZ1ZsejB1di90cmRoaGlBRU4wcm5ieGhPbHF1?=
 =?utf-8?B?TmE3OTlJaDVWcVdLQUF2bUUxR0dPUnVNVlJtVUMxQUwxUGVBOXJOczVCdXlK?=
 =?utf-8?B?NmRxb2NpMHZxZDRKYm1TU05ITTF5enVBUUh3bVFVSTRFbklJTitKTC9SS29H?=
 =?utf-8?B?c1ZPMnNsdlVWWFcycXpHbnQycUdCQXVrQ3ZUcjIzSDBNcWd4Q0VDR2tVMU5U?=
 =?utf-8?B?NFE3b0Q0ekRUeGlqV05aMzV3NzVLNUY3bkQ3OGFsMXZUWG9wSEpUK3V6d2J1?=
 =?utf-8?B?NGltZmI2bkpoVGc4SDNrWjlnU2YvTHh6bm9XbVZ1bm5QUWdpRWhNbG1YMXJ1?=
 =?utf-8?B?Z2lIOTIxVU5ZczBuTVNBNlU3T1dkRnZKd1FucVNTTytRVUFXVzQyejdMem1I?=
 =?utf-8?B?RG5Bek02bTErR3M5UExuRVp6MWVPSUFnWWRWWnQwU3greFVEcktQdHlISlF0?=
 =?utf-8?B?Z0lDVXlxZmEyQ2VCV29ZanV2dVVJdlVrVXlRWUkxQkpxVk9qZFpyNXdhLysv?=
 =?utf-8?B?WkdIRGt1N2RkcW55WmFJT000SXRBMkFVemErR3NnT1dzMVNMTzJOam04Q29V?=
 =?utf-8?B?em5RV2lRNFJWUmJENm0zU01GeGltSUlSbVA2alljSkZzZWJncElMVVZydG0z?=
 =?utf-8?B?aFFQU0UyRm42ZDlNUjhpbC96aUkvaHpqNHZRbVEzY3JvRjJkWE1XZG8rUUtp?=
 =?utf-8?B?WHRTVzNCZm9vb0NoZXBSZit5QlozSnFnQlo5VDB1Z1FTTnRMelFRRlVyOHh5?=
 =?utf-8?B?ZVNtQ2VERkVOUGFYZEFYcTRhdXJmNnQrV0FwM2tpNS9qVkFXbUErWmhGb3JC?=
 =?utf-8?B?NjRsR2tLYXd3TjZCUGdCSjJESkVtU2cwYWVkeTFzTHp0elFpbFRRUEhvS294?=
 =?utf-8?B?VVBQaUk0djZoS3ZHMWx6eEpyTHRTbHpoOWxKTWpiRHVSblNWZ1pIaUtmaFFQ?=
 =?utf-8?B?cXcxY29rL3BuQzdIS3RpUWZSMWhXaU43UG9mTW5DUllZQUU1L29tRytsaUNB?=
 =?utf-8?B?M3c2Z1NNcHp4cXQxQnVEQ0o5ZGlhaVRzQzVIYVZDai92em1NZCtiVFRPbHM5?=
 =?utf-8?B?L1VqTmhtNXEzZzRMaFV3bXNxZ2FOTG1MRFkrY0RjZXAwbTdDSGxlZVFPSWJH?=
 =?utf-8?B?YXZSRzg0VE9PMHZYVkErNnlOMlZuM3Z0eFlhaXVjN2t3UmM2eGM3eGtzVWdK?=
 =?utf-8?B?aUxldFFqcnFpSjc3NEpwbUsrcjdKbDV1dDRkVUhJZWpKY1I1NVNvTTBrRTRy?=
 =?utf-8?B?VUpXQ1pFMVh3eEpCTVdYNTBvd1VjNG80V0U0REpJM3N6Y3pJcEl4cGljTWtr?=
 =?utf-8?B?dXc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6998d31c-ef73-4ccb-9c1a-08dd88be3c2d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 14:41:19.2742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SinyjSQ8gvGjJQz0+mnZs5+ZM3RfLf6thC24AR85qMiI3FNKz6ooDWLlAx7f69XXvAdTi4TDi7NyFNe1q7FMqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8253
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

On 5/1/2025 10:18 AM, Alexandre Courbot wrote:
[..]
>> On Thu, May 01, 2025 at 09:58:33PM +0900, Alexandre Courbot wrote:
>>> Add the common Falcon code and HAL for Ampere GPUs, and instantiate the
>>> GSP and SEC2 Falcons that will be required to boot the GSP.
>>>
>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>> ---
>>>  drivers/gpu/nova-core/falcon.rs           | 546 ++++++++++++++++++++++++++++++
>>>  drivers/gpu/nova-core/falcon/gsp.rs       |  25 ++
>>>  drivers/gpu/nova-core/falcon/hal.rs       |  55 +++
>>>  drivers/gpu/nova-core/falcon/hal/ga102.rs | 115 +++++++
>>>  drivers/gpu/nova-core/falcon/sec2.rs      |   8 +
>>>  drivers/gpu/nova-core/gpu.rs              |  11 +
>>>  drivers/gpu/nova-core/nova_core.rs        |   1 +
>>>  drivers/gpu/nova-core/regs.rs             | 125 +++++++
>>>  drivers/gpu/nova-core/util.rs             |   1 -
>>>  9 files changed, 886 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..7cae45645e548bab5b85cb53880898cedbae778a
>>> --- /dev/null
>>> +++ b/drivers/gpu/nova-core/falcon.rs
>>> @@ -0,0 +1,546 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +
>>> +//! Falcon microprocessor base support
>>> +
>>> +// To be removed when all code is used.
>>> +#![expect(dead_code)]
>>> +
>>> +use core::time::Duration;
>>> +use hal::FalconHal;
>>> +use kernel::bindings;
>>> +use kernel::device;
>>> +use kernel::devres::Devres;
>>> +use kernel::prelude::*;
>>> +use kernel::sync::Arc;
>>> +
>>> +use crate::driver::Bar0;
>>> +use crate::gpu::Chipset;
>>> +use crate::regs;
>>> +use crate::util;
>>> +
>>> +pub(crate) mod gsp;
>>> +mod hal;
>>> +pub(crate) mod sec2;
>>> +
>>> +/// Revision number of a falcon core, used in the [`crate::regs::NV_PFALCON_FALCON_HWCFG1`]
>>> +/// register.
>>> +#[repr(u8)]
>>> +#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
>>> +pub(crate) enum FalconCoreRev {
>>> +    #[default]
>>> +    Rev1 = 1,
>>> +    Rev2 = 2,
>>> +    Rev3 = 3,
>>> +    Rev4 = 4,
>>> +    Rev5 = 5,
>>> +    Rev6 = 6,
>>> +    Rev7 = 7,
>>> +}
>>> +
>>> +impl TryFrom<u8> for FalconCoreRev {
>>> +    type Error = Error;
>>> +
>>> +    fn try_from(value: u8) -> core::result::Result<Self, Self::Error> {
>>> +        use FalconCoreRev::*;
>>> +
>>> +        let rev = match value {
>>> +            1 => Rev1,
>>> +            2 => Rev2,
>>> +            3 => Rev3,
>>> +            4 => Rev4,
>>> +            5 => Rev5,
>>> +            6 => Rev6,
>>> +            7 => Rev7,
>>> +            _ => return Err(EINVAL),
>>> +        };
>>> +
>>> +        Ok(rev)
>>> +    }
>>> +}
>>> +
>>> +/// Revision subversion number of a falcon core, used in the
>>> +/// [`crate::regs::NV_PFALCON_FALCON_HWCFG1`] register.
>>> +#[repr(u8)]
>>> +#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
>>> +pub(crate) enum FalconCoreRevSubversion {
>>> +    #[default]
>>> +    Subversion0 = 0,
>>> +    Subversion1 = 1,
>>> +    Subversion2 = 2,
>>> +    Subversion3 = 3,
>>> +}
>>> +
>>> +impl TryFrom<u8> for FalconCoreRevSubversion {
>>> +    type Error = Error;
>>> +
>>> +    fn try_from(value: u8) -> Result<Self> {
>>> +        use FalconCoreRevSubversion::*;
>>> +
>>> +        let sub_version = match value & 0b11 {
>>> +            0 => Subversion0,
>>> +            1 => Subversion1,
>>> +            2 => Subversion2,
>>> +            3 => Subversion3,
>>> +            _ => return Err(EINVAL),
>>> +        };
>>> +
>>> +        Ok(sub_version)
>>> +    }
>>> +}
>>> +
>>> +/// Security model of a falcon core, used in the [`crate::regs::NV_PFALCON_FALCON_HWCFG1`]
>>> +/// register.
>>> +#[repr(u8)]
>>> +#[derive(Debug, Default, Copy, Clone)]
>>> +pub(crate) enum FalconSecurityModel {
>>> +    /// Non-Secure: runs unsigned code without privileges.
>>> +    #[default]
>>> +    None = 0,
>>> +    /// Low-secure: runs unsigned code with some privileges. Can only be entered from `Heavy` mode.
>>
>> This is not true. Low-secure is also (has to be) signed and the signatures
>> are verified by High-secure code. I can/will go fix that up in my follow-up doc
>> patches.
> 
> True, but contrary to HS code, the signature in the LS code is not a
> hardware (or rather boot ROM) requirement - it's just that the HS code
> decides to implement this policy and you could very well have a HS
> loader that loads some code and switches to LS without further
> verification. The point being that you cannot enter LS mode directly and
> need to go through a HS loader first.
> 
> Nonetheless, you are right that in practice the HS code will not switch
> to LS without due verification, and my use of "unsigned" is confusing.
> Let me reword this.

Thanks, I wonder if there is any current example of such unsigned LS code. IIUC,
all the LS code is either coming from either the VBIOS or the firmware binaries,
both of which can be modified/re-flashed. Since LS still has some privileges, it
means that it is a bit of security issue. I think you're right though, in theory
LS can be run unverified but I'd think it is atypical.

>>
>>> +/// Returns a boxed falcon HAL adequate for the passed `chipset`.
>>> +///
>>> +/// We use this function and a heap-allocated trait object instead of statically defined trait
>>> +/// objects because of the two-dimensional (Chipset, Engine) lookup required to return the
>>> +/// requested HAL.
>>> +///
>>> +/// TODO: replace the return type with `KBox` once it gains the ability to host trait objects.
>>> +pub(crate) fn create_falcon_hal<E: FalconEngine + 'static>(
>>> +    chipset: Chipset,
>>> +) -> Result<Arc<dyn FalconHal<E>>> {
>>> +    let hal = match chipset {
>>> +        Chipset::GA102 | Chipset::GA103 | Chipset::GA104 | Chipset::GA106 | Chipset::GA107 => {
>>> +            Arc::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as Arc<dyn FalconHal<E>>
>>
>> I am guessing macro-fication of this did not pan out? i.e. I think we
>> discussed:
>> 1. Seeing if we can reduce/get rid of Arc in favor of static allocation.
>> 2. Simplify the chain of GAxx | GAyy..
>> But nothing that cannot be done as a follow-up improvement..
> 
> Yeah, my macro-fu is still lacking it seems. ^_^;

:-D. It may or may not be worth complicating it though, but I was considering in
the future, to minimize the number of places that need to be modified (and thus
more possible room for errors) for new chipset additions.

>> (Also it is a bit weird that the namespace for chipsets for > GA10x is
>> ga102::GA102::). Example, Chipset::GA104 uses the HAL in Ga102).
> 
> It is a convention since Nouveau (but I believe OpenRM as well?) to name
> a HAL after the chipset with the lowest number when subsequent chipsets
> can also use it.

Ah ok! Maybe worth a documentation comment somewhere as well? Or maybe not. ;-)

thanks,

 - Joel



