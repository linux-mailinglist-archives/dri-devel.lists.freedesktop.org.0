Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD912C5D4ED
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 14:20:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ACBC10EA6F;
	Fri, 14 Nov 2025 13:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="J3Z2bmYB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010010.outbound.protection.outlook.com [52.101.46.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F4610E23F;
 Fri, 14 Nov 2025 13:20:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yOufkaL4YERe9Wna4L6l2wOEQ9T54Ta7Oo79DUtQJ1h5p2eETdNyLMbTNSsfJJOxQ4MxuK0LYHlZ+6XMJSzRtCEvOvz5z7OA614uEbDvr6zu3ONxebUeqqvD/kFBr+kGfY2ZAXGIoFoexjbyvgz5WwctEYTC7HwNejQoCzvhpG6SXsVp18KRZNJC7cxB8WWP3u9Jm2/fNNKG5QZ2HfYmnfroy65VN/UTbHzMi2nQ2I12DXeACZ/5UGSmw3cDIxBz2fjgEr7Igh+LZrUuJJRfRscjisX0e4QdsafUFzyQxYTuF1nDed6LBDoN+lZXJ50oWVYE3wikO/Z9P2dj8qHT/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSFut5RiJZt2Io/z1RjryoNiMY/3C35RwvaCh3hXd90=;
 b=iPjDkWcUXUtjfEIOcP85+PXhE9xIzhHWa11MeR4WJRtQK8tsD+Qrf02zi8Dmr0ZkF+0ItvZdMCtndryAzYwSLG9YzKqy0MU0JHJc3bCmkK0vjt2Wufk3n/TopLiUbYIYVUM85d6il7GFaZ5pxHOgyZvw3WJxjQ1AT1U+V8aW+KM+KTG1KqhIr9/Hq/mtYyHmyuyZJrVTgC4P2W4CNhA8nV8Jdce2CwU4tTQ6NALD4dZ5n+i/zBlcjbc+26IEyjibrWSOmyZrUUlVS4nfX+vKC++UM97YZB8YFAMMlTuvHUmekaeXfLAfSz/stA1mYy84eJV7O3eN5AXpC4yZR+u1PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSFut5RiJZt2Io/z1RjryoNiMY/3C35RwvaCh3hXd90=;
 b=J3Z2bmYBVNRafx1piyzWONSV21IL+58i7rZ/m24/kudFaMvtW0889GLzseGXLzuc2FUhy26S0tGJeIgIC8uIV1vmOYcof2X0sqT4Px9ANkCzmAgwID6R/3Jk0ZjwxgZpaSgRVmxxxukBhiuJBlnsQbdq6/5ob4yklM+nyaKqngtGlacbb+2qzjMSPy5F+CN5SCt/dznTDqA5bxRDxByH7360f51lkNM93bNgVX8r/i1qgEvlqokDLSUZIqmkyMDXPZwmmFCjq534uQBK9KjM4N/K9G4afqVoTO1YxKd2NqRTLxuC37EQ+I3fdxIi5Aj9X91q7FmnJBan0zf11aQ23A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB6119.namprd12.prod.outlook.com (2603:10b6:8:99::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.18; Fri, 14 Nov 2025 13:20:19 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 13:20:19 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Nov 2025 22:20:15 +0900
Message-Id: <DE8G5HIWJKX4.1R72KJ3LK04OY@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Lyude
 Paul" <lyude@redhat.com>, "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v9 00/15] gpu: nova-core: Boot GSP to RISC-V active
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Benno Lossin"
 <lossin@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Mikko Perttunen" <mperttunen@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251110-gsp_boot-v9-0-8ae4058e3c0e@nvidia.com>
In-Reply-To: <20251110-gsp_boot-v9-0-8ae4058e3c0e@nvidia.com>
X-ClientProxiedBy: TYCP286CA0334.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB6119:EE_
X-MS-Office365-Filtering-Correlation-Id: 47866f9a-848f-428d-4afc-08de23808e8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2p4akJiOGFTZEsxOEJVWGs3bHQ5WEVxcUduNURYMjNML2M1RFc5Vm1FeC9K?=
 =?utf-8?B?RDB3R1dSSG1TN0xqc1NsY0hyOFFwdi9kUFVMY1k2bGs4N3lncUV4N0dPY3dO?=
 =?utf-8?B?L2t3WkprRmRNYWRmdFJET0ZhbStidXREUHdxR2hNVWFkK0Era1czU2E0dGpi?=
 =?utf-8?B?SFJISWFkRUFLNlFVd210OFloSk1nb2JLNXh0MW9BOTUyNW56UmdtMjJNb2Y1?=
 =?utf-8?B?OENabHZEQU9uVW9vUHdBVk0wSS8vNGJpQlNTUE81Sm1ncEJqTno3YnBGZnJq?=
 =?utf-8?B?SkVZcG9kUXJldUJCcE9ZMXdoL09QRGJTOEVvbVZuYks4cXBJL0NVRWo4dHBB?=
 =?utf-8?B?Tm9UcXJwdlVlVitSdWtJN29KT0JLVWJnM2U2dDlJU0YvNVJ6NFBVR3dacm9P?=
 =?utf-8?B?dUpDT2x6cnYvaEF5SG84MkV1emZSQnR0bTBuaUNuNDlpZk1mbEZKQk9NOGZW?=
 =?utf-8?B?L3ZNK1BQME1nanBRSVkxV2VzNi9JaDllb3JsOCt2L2trSUJZb2kwOHdRUWlO?=
 =?utf-8?B?YWVxalV5VDFvVFcrYkcybVJlSUQ1WEwxdzYvUGo1SllNQjB0VVYrRGpqQlpv?=
 =?utf-8?B?TFV6aFcrUzc4U0lJOFFhRkZVS2xHbkdnNEFneHZJL0RRZkhnQ3pjb2g4WCt1?=
 =?utf-8?B?NlNlOUVkVnUwNGRObVhBUnpWSGhINkZGcjRuY0MvbE9xTFc0bldFODZzbmhG?=
 =?utf-8?B?N255SGF0U2E5RHhpckp2VFd0VjZ4M2wrTWxrY1lMMGs0MzBDTFdOcDQ4blFF?=
 =?utf-8?B?cytZUWNTRmhlOHoxWmk2cThrQXVqL2FOMXJ4ZGdVa09kS3hwYnFyNEdMbHdS?=
 =?utf-8?B?dWJLTUEwMFJHQld6RERhYk9IaHc5emxFTmVMSUFFQ0tjOFpUYUx1SjBqaTdF?=
 =?utf-8?B?OHI4dlc0SkpHOWx5ZHo4SVRrM0VmZyt6aEJnZ3pvQzZhbTVQS2pJai9UNXRC?=
 =?utf-8?B?aTVVYkxxeGYvTUlQMzQ1ZHBDYlZ0RkRWcFF3L2doZ0FlRVJoMTJPaU5DK3BS?=
 =?utf-8?B?OG5JbzU0WmRTcnlabzVVK1I2Uml2S3VXVURBSVZvREMzbUwycGNGT3gxT3R5?=
 =?utf-8?B?UDczL3pSTmRKZllPVXJRYkRLWHgyaFc3Z1ViQ3grMFdjOTdLMkI3NHFJMGZj?=
 =?utf-8?B?bSttT1U4SGZFNDR4S1ByVDAzNWhOdmsyY1dNZGUyc3hDajlZbWUzekdXd0J5?=
 =?utf-8?B?RVVLK1BObFBZWUlMa2pFeFMxT3lnc1o2b2htMCtDaWM5aXFLYVVJU2lkaXQx?=
 =?utf-8?B?cThBNFVGWCt5N1lFdFhwU1Z4TXRwSEp3MHRxNEdFcnRKd0laYmY4b0VLVk9I?=
 =?utf-8?B?djFuSHR4dHhsVjJ4SmZUNmd3TDkzME1MMEVzWERFSzFhMDJyNTNER2czaE04?=
 =?utf-8?B?UkpMbnR2Tlh2SEN1WDF4cGhGcmpNVG5USTFxaDZCU0YzTnhxUmUzMkd1aWxJ?=
 =?utf-8?B?Tm1lY2UxYm41VDFrQ3NDb2ErYnlZOGk0QlRhT3F0TXVla2ZxdTBBM0o1Rmds?=
 =?utf-8?B?OEJraEhGMW45clc0YUtkOFkySTlGWisyY3VOWTNFZk95aHRMUHJQK2F0Qmk0?=
 =?utf-8?B?aE1pS09zOUFxc0pNU2FtYmVjbTgxd0VVaHpCNERjWjZyRTlGaVdVb1BoL0Yv?=
 =?utf-8?B?R29wNXVOLytpQXBTQ0hBR3ZWQmdZN2hNWmpNSENlalovSTJja0ZCbTZyOXpa?=
 =?utf-8?B?L1VHa291WFI0ekF3SlovMzRwc3h6cmYzV3dNSHNUQ1JSMzY2TzRHNWMrcmVt?=
 =?utf-8?B?U0FLcHFMUXlhdUdoQ0FyZnVKK25sd0tDTEd4QUowK0l4eVZCYnV4UFhBS21W?=
 =?utf-8?B?bStZeGFhN0x0Tk0zM2lJTGdTRmFpYzJZWmFnV1hpKzhOc0JwQTZJZkZaSzJR?=
 =?utf-8?B?N3Y1N2x4Q0dwVEt4dndNWDVEc3V6bkVlMUJXRnBFRGQ1QmIrN1l1Q0R5eXJD?=
 =?utf-8?B?dEJQWC8veTYwOVdKV2hIM3pCaFJqM0NLMDEycFA3cVRYb2hIOHI2bHh2bmFz?=
 =?utf-8?B?elNjTEV1V0MwVjJiYTlZM2RMalNFaHhyOTJKK21NY2tsd3lsSU5lWDUwTU5U?=
 =?utf-8?Q?4suPYP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUt2eGxmSzBtUEQxNW10amNsSjFFUzk0NElXWFV0TW4za05MZXZ4QVpaRzdv?=
 =?utf-8?B?Sk0wd1E5Nm9ocW1HYTNNMTJ4MkFZR1ByaHlnaWZ3dHpBcG5JeDRIdXpnR0Rp?=
 =?utf-8?B?cWlYOHNDWjVtd0s1U2NFUzdPdzkrZlFxMW5RbzRUSHJ2WTRoWWZueTUvWUNZ?=
 =?utf-8?B?b2tRZUdXSmJNTmtyVTV2WDRKNGdGMmt0UEdxRktlK1R2ZDU0YTBIVndFYTVh?=
 =?utf-8?B?bjd5Ty9qRlZmenNSaWZTWTZCMFZqSlB1MmlVMzRMOHJFSFFzcTJ6ZWUyK3Qr?=
 =?utf-8?B?dFM5anJTZDdzdHgzWnd6dHFuM285dlhndm55VEUyMUUvbi9HK3U5QmcyTzlu?=
 =?utf-8?B?d3B0NHhjNVVQY09FbE82NWxpS25Td2R4elB3RjZVYlN3bHVSc0JhbWNOajh1?=
 =?utf-8?B?MlNMS25xQ3Bhc2Z1bkx1K2FtNnIvM0k3UndvR1FSRkNLb2lwU0VuK3NkeFA2?=
 =?utf-8?B?S2RpRFA0Um5OOXNYc21CSzFCbUF5T3duZ2NOdXVwSDEyZmFIMUNJdUN1MDhx?=
 =?utf-8?B?VjBWL3BMRXEwdVd5VHhPMDFNSktuRTRkUi8yY3dkTzluenk0elpoa2pQK0xC?=
 =?utf-8?B?R0h1VW1kb2Q1aW1tZ01EWWc2YzFTbytja2lZbERSN0ROMVRuR2lsUUx4Y2Zv?=
 =?utf-8?B?c1ZDVnRNSmtrQnh2bnVWVG1DallCQytjSGFzdDVGaEQ0U29za25jL05JZ3BV?=
 =?utf-8?B?M3pCSEoyaUR6dHNnQmppUjlSbDBLd3ZQZE96aDBPNk1BUy9uTE54ZlN3TSt4?=
 =?utf-8?B?SW1JL3VYRmQ1eS91VU5WNW1yUDhaZjQzYjRzWk0yU1FRUzk2T0Q3QmM3M0wv?=
 =?utf-8?B?OWNxVTZNUWx3bGpwVWduUThoUWwxa0VlUGFRUmlxNVB0KzVxazFzSkxFWkE2?=
 =?utf-8?B?aytYak1Ld1RCeTFBS0lydFMxVmpSWWpVME5WZkloaE5XTTlVSUxsdEFwdWNS?=
 =?utf-8?B?TUpGdzRSTlFuWnZNT3VSeEhBeVFxYWxVSlUwQ09oWkV4eVBodEZLVklEaU5p?=
 =?utf-8?B?NE5BclBKSlVKUmx1SmlXcjNwb1dYczQ2bXZSY3AzS3c4VnVRVWZtZllpOEtL?=
 =?utf-8?B?WXdPTFl0MmhyYW8xUTVYalQzZWQxemMrMFFOOGZOWWhJK0xnTVIrVC9ja1ky?=
 =?utf-8?B?R2Yzc0RhcXZiTDJVSSs3RXIrUHhGN3JVaHdnNXQwMHJISThoeUN3U3duVmNX?=
 =?utf-8?B?UjJDalI3a2xmcUlLMW9oTzZMcnE3S1JYVlVHN2IrM3hsVkFaVVdxVlo4QnBv?=
 =?utf-8?B?alNmckJCU3FlbTYxSTNCVWhWVjEyeUNScnNxVU9qMXI5Y25rMkhMUzZxSEN1?=
 =?utf-8?B?MUhRa2hWRGlaYUcycDVzQkUycWpEYitldmxlcnd4RGdBYmlhRjRoSmpycGF4?=
 =?utf-8?B?TmJSNUhVV0NoVzBiQUNtNUxSM1JDQnVDSWg0WWticTlzTHlORGFqV0RoOW5S?=
 =?utf-8?B?VitZZXd6TGd5REFCK3AzWlltWmpCaEc1alNwN0tWWG02RTVSMzlHanNuN3Yw?=
 =?utf-8?B?TjRXQ1FLSERuMVkzOTRvSFZLSUVxbU05R0xXWEQzYUlWcnZLRWhYREtpcmJ2?=
 =?utf-8?B?RnhoazZ6UVM3YitMaTdmdVgrdjlBOHllZWExZXZQSk92K2labk9zaFFQOUJm?=
 =?utf-8?B?ZThWSDJRZ29PNzk0OFdqc3lnS3VaR1FsZDZ6T2lCd0FFSW8wczV6eHpBYnhn?=
 =?utf-8?B?RGdTQXI3aFZDRlhSaE0rQ3ZMNzBGdFBRZXc1clpGZTlJYzZ4Zjk2N3k1R1Bz?=
 =?utf-8?B?RWhUTnJ4aXpyS1RPRkgvN0VNOGRWNUxGdExBRHdQc3B0NnVsaDhqR2JqcGpn?=
 =?utf-8?B?QXdrM3FWcjBUaXY1MkFuWjd6NE1CZ3VUTlYrQjdMeXgyWVZRalVMU2VjZzRl?=
 =?utf-8?B?a2xnU2ZnZ2QweU91U1hZcmd3OVA5KzFVd3k5UVk2NHBiVHhreUdidlBoM2Fj?=
 =?utf-8?B?TEd5ditlL2huSDYwZkRFcHhLVDhoQ3YyUUt4UEtBV1MrZlMzbjVGTjA5VkVY?=
 =?utf-8?B?MjNCR0Q4UWw5U2dQajdzUms0THJoUkRuais3TWZNUjVqT2poSDRhS3FQR3pU?=
 =?utf-8?B?MWdORTY4ZTM4RGJRVzhQcFhIS0NudnR6aUttWjBPcWdHalVja1ZCRW50QnZt?=
 =?utf-8?B?elhVZnI3YVl6cllkYjBtSzk2c3l2eFdkMzdBNlIvOVpIdjJoQUVtOXBQWU9l?=
 =?utf-8?Q?Re6GPunMtjKQ4U57GzKMTzOVSJD1j1BekowFtSAfRDMV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47866f9a-848f-428d-4afc-08de23808e8b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 13:20:18.9693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gmGUX+pSzOkXrcLrUDqgUt3ZdEHfbkf2cZaKQSu2r8c0NLOo4Vm9z4hixCSvAo09m46UrXXWvJuiGnX9P3Bfqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6119
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

On Mon Nov 10, 2025 at 10:34 PM JST, Alexandre Courbot wrote:
> This revision features a more adequate method for receiving messages,
> and some general cleanup. It looks solid to me, and although there are
> further minor improvements I want to eventually see I think it makes an
> adequate first milestone.
>
> I am considering merging this before -rc6, so it can make it into 6.19.
> If there are reasons not to, please scream. :)
>
> A branch including this series and its dependencies is available at [1].
>
> [1] https://github.com/Gnurou/linux/tree/b4/gsp_boot

Pushed to drm-rust-next after fixing the last issue spotted by Mikko -
thanks everyone!
