Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD7AB49B25
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 22:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D96C10E5D5;
	Mon,  8 Sep 2025 20:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="n4mnkBW8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE1810E5D5;
 Mon,  8 Sep 2025 20:40:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UnDM1mF3sM+qk5pbeTLZXxRoVWpUKlO0mo5JFOvUZRKSoy7ewTzVUO47r2EBEsB4SgVXU8213yCrp+SsDKYL50vx9eAm/0RONKy1RJxlcRCqyrdzKM7ImdBOr5pUsC4RDRIIswTKtsKD+a/zUl6j7VkwGLnk5HyYR9ibM70WW1A5z4SvNHhN0CUMpEuHga2DsJ9N+cy369yfauTjykwW+9MZKcSjq9OMa4xpoETUM4cm1dkxtNXgo+35QIYp587uAjT6gzy7VxnLyZgZ8otkhcuR+jDsHC3t5mJRbpSPr/9RQVhk8RL/x7UqXof0T18fi3Aj/WpCPyDAvQTkv0jSBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mk986eQfPKOKKpNS3BnIpV+owt7ZNgyfehvMKEtVF/c=;
 b=tNw1yC7jjK1BJj5fnxHWWMCBg5atsQZrKTJqGYIvgJbu6Lmcpt9oVT+Zqjpv7oG1Dhm2EXs1SslXYMZpOV4/VOuuWKPuLrClSF2gUfHV1/RysSEQtfBA1SGV2T2XzfvBU8GNipZWefGRSlgBLWzuDaY40h4oMYZ6jA9Y4ygq1pr49vd8tCfECUk2FVDiEA0Ql7GBFa56tWUnuqDYEuW+ut+DRfhUYepwtvcdKUj4UfZS3cor3kHvBSHH2dydidZuuFTk4Gba15RPEMbc5wi11DHqxsWKJ7AQYk0Mo3Bdgl4pSfgtx+RPAZbqouGMAX0IClDKEOw+AbW2BEcP4edXSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mk986eQfPKOKKpNS3BnIpV+owt7ZNgyfehvMKEtVF/c=;
 b=n4mnkBW8vpv303aPmQCQBnzEQryiobOuHVt/kms1hQP8wf7lMdyYHmdWWtNEkhFpMGELBdWpiMyAKpedHuxShjvyVnNq+Tcif5p1udqrcz5kKbOUzTEHeqpIGxWUuPon55dItcnNERPE2skl2oJRn0AurJmLxvDzN9yoiJZQkR7etIanRzkKDzhl4KTqNjZgzPsmBUl3/iVnfF2qafj4xwq5HSJsE5d6f4w6c4zmY29aD0IY7yuHlAM2rVbNCfJcI4a6TcWOfWbudky+3uP4oHxlK2r/2ySB3CZt3o8yHlIRDy6C7eHuyr5gZvNOxe1brg44l3GolIlOFKTXXHSwBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7SPRMB0080.namprd12.prod.outlook.com (2603:10b6:510:271::6)
 by MW4PR12MB5643.namprd12.prod.outlook.com (2603:10b6:303:188::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 20:40:39 +0000
Received: from PH7SPRMB0080.namprd12.prod.outlook.com
 ([fe80::b6c2:2d58:b9c4:8a3a]) by PH7SPRMB0080.namprd12.prod.outlook.com
 ([fe80::b6c2:2d58:b9c4:8a3a%2]) with mapi id 15.20.9094.021; Mon, 8 Sep 2025
 20:40:38 +0000
Message-ID: <c31f96aa-d050-46ee-8d73-2e8c36559faa@nvidia.com>
Date: Mon, 8 Sep 2025 16:40:34 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] rust: Move register and bitstruct macros out of
 Nova
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
References: <20250903215428.1296517-1-joelagnelf@nvidia.com>
 <20250903215428.1296517-5-joelagnelf@nvidia.com>
 <CANiq72mx7NA1KD5fw98kba+3oENHW44QXVGO1VmvPPUKin2LPg@mail.gmail.com>
 <a2c990ff-e05c-4d09-aaeb-5a2fc16ecb77@nvidia.com>
 <CANiq72=S-HnREWAK+8kcJkPabPHSzuKD4k7251+Zw-b9==0-zA@mail.gmail.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <CANiq72=S-HnREWAK+8kcJkPabPHSzuKD4k7251+Zw-b9==0-zA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0855.namprd03.prod.outlook.com
 (2603:10b6:408:13d::20) To PH7SPRMB0080.namprd12.prod.outlook.com
 (2603:10b6:510:271::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0080:EE_|MW4PR12MB5643:EE_
X-MS-Office365-Filtering-Correlation-Id: d7b38f0a-0acf-4344-8a21-08ddef17f868
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODdEZE1vWDlsMmZQTlFDcFo1dGM3R0xlTGhCc3h0Rzl2eDZQallDcnBYanUx?=
 =?utf-8?B?eUVrK2xPaURSSnZSSHhmMGlsZDYrQ1JaZjhLU3NDekFnRWlNM2RKY2NEL3Nj?=
 =?utf-8?B?Nzl3RFhtelU0NnZneGNvSlYyUE9USWluUnJxYjVnWnkzUDBZbHRhNHFMMUtm?=
 =?utf-8?B?djR2dFlRbkduQldUY09YOU0xQnBOUTdleXdaRDlEM2N1MnljblpQTGFxbEd4?=
 =?utf-8?B?VEttOFpsY1pydkdmLzNnTmFMcUpJUUd6U01FVXBrSjFRSnMyY0hLcEhqYnFC?=
 =?utf-8?B?WXNCc3laQ1owV1pyVzFSRiswUkd1NVZVZFVjUXZjdHQ4dmM2SHhKK0tUSUlx?=
 =?utf-8?B?L1gvMVo4bU5TK1RUdWdQZnRSNks5KzdSMnpKZmFQeWdKaWUyVDg3dFZkaUpZ?=
 =?utf-8?B?NnBoWUYxdmFzTWR6OTh1dkVRSVpBY2dhVjNFTHo2YkVvendNOVBCSmhmalc5?=
 =?utf-8?B?UmpyMjRQTVZWOUNRcnR1ZmxZTVJ6aWNUYTI5d0szRDMxNGtPb0haY3JyOUhJ?=
 =?utf-8?B?Vi9Tak51RDBHaHhOTHZuaDF4dVJnQnFmTGNsM3F1UG9iRnFYSFg4R1ptWXIz?=
 =?utf-8?B?MCtJK1RCS2dPM212UE1rMUlVcC9nWTJXQlNXZ3Q4Sy81cDRVU2E3R080OTNW?=
 =?utf-8?B?Y3FpMkNCNStZZHNmTEVheXE4d3JQZFVtZFp4SGFvdWdoZUk5TzNBazFqMEJ0?=
 =?utf-8?B?dHdLNXUvR3dQV2dvUDZxbXFqWUJuUk5hWHA3S3dKbVNMNHY4OFUyMlIxZ3Bo?=
 =?utf-8?B?MnowTDBMQ3V3blNLWlhlTFNPKzh5WFNoaHl5SG1VaWdPVWxLV3Y5SkpnR2wy?=
 =?utf-8?B?MTdSMmlGWXZZSHZaNDBWR3lZOUtVRkFqRWJWSmhGUEJzbDlFL01DeHgwcmQr?=
 =?utf-8?B?cjZYM1hSMWFnWExVcExoZVNFQlZiMEtWYnVnb3lVdWdHSXZqbGpxaXRXbXdZ?=
 =?utf-8?B?dEpWenJkazJTc1JMVk1XY0dXakJZRHN5ZnpicXFUNUZnYnA0T1pnb2l6TWIr?=
 =?utf-8?B?NE1tVk90akVPYXEwdW5iYkszNXZrdGlrMklYU2dnSmJRUzRCVFdwd296RWNI?=
 =?utf-8?B?aWZOSUFqeW5GOGdPMjVpMzFMVmVDZkhjdVA4dnI0d0hvQWFvcWp6aEpsOTNw?=
 =?utf-8?B?Ulg3MmlBTnRReXllalNSZVEyRENtMVdmTmpkaUtFSmJDS3FwaDN6b0JnelMr?=
 =?utf-8?B?SkRHZmhXRU5Cb2p2dTE5UjY2eUFIVXd3bGZoV05saVNlWWtmK2lTOHY1Y2Fm?=
 =?utf-8?B?aktFS3hScVY3VUd5MklpOEc4aWZSM295VXhLRTNVeDBibHQ5Vk5hOVQ4eEVU?=
 =?utf-8?B?dHFGekxCbHRKSm9CV3ZQVjR4M1k0NEViQks3R1NKZ0p5MDFld0gvZmdFZTNQ?=
 =?utf-8?B?MjFBWi9qSHV4YVQ1WmltbGlvVDgrc2IwdHFmbEsyQ244MnRuQTUwY2R3M3l4?=
 =?utf-8?B?UElSSGNxSWR6QWRTRWxIMnJjY3hiWE51c1NreHFmbjN6dG0zUGcyM2x3anhV?=
 =?utf-8?B?VUNobEZEOWZ6NmZWVkhaclNuUTVpdEE2Y2NRSHArWUE4NHRQT2dkVjhwSGh4?=
 =?utf-8?B?VGpnbTIzZU8vT3BCZTMxS1hxSGRidDhnT1d4OG15bitESm1LYWIrdTZKa2U1?=
 =?utf-8?B?MUpqdEtvTjN4OUdvZGxvL2VEbnc2QndKcXQvRTJCeUhtdSsrb1RFSkRaUWkr?=
 =?utf-8?B?T21qR1kwWGljeks3c0ZQWUlQYW04a1gvS2Vsa2w5MG9yK0NCa2M1ZU5hSUNa?=
 =?utf-8?B?bWt2anhyMkhhZ0RxeEJEUkdVZXJkYThRK2NUSzBuaTAxcThRSytzb1lZM1d6?=
 =?utf-8?B?cnZsZW5jQmJzVGJaV2g4UW1vN1BZdDZqOVFSMnNSMkFVUGJtTXMzdjBBbWZY?=
 =?utf-8?B?MHRnd1l2MHZtMW52K1lub2w1UUtpT1RXVkg3YTZmZkNJQngxWTlndk05T1ZL?=
 =?utf-8?Q?duH5QKhWGSw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0080.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OE1maVJ0bHU5b3JrK1RSL1dYa3lCT0N6ci84djd1bEZ6ZUhTZnZQc09ZSk1Q?=
 =?utf-8?B?cDVVVytJWEx0K2VUZ2EwVHFWVE1SNERjZHh6TTBaY09Ic2NuTFJhTjdiY3o1?=
 =?utf-8?B?a2dBS3FBZ0NxcWt5c3VnY0FCOWdnbCtsY2p4eTZOUVBGUitBVkpmZlYrQWs3?=
 =?utf-8?B?ajk4eEpOcXBldm0yeVBlOFdjUThvb2NCMXR3b1MyOXlQRDczclhNcmxjQmk3?=
 =?utf-8?B?UDR1ckxzK2VucURSZlNGbzBMZytmM3kzS1o2amdkd3RQMHo5dFRzbzk1ZlJy?=
 =?utf-8?B?RWl3a0FSR0V2WTd1RzE5a1IyWDB6d25RbEU3ckswaDFHNlV0cnN4YWliU2Q3?=
 =?utf-8?B?WllveFQ5OXJaQkZsTGVTcWd2Y1ZIRGZEVHA1dkhRSTIxclhUV0dTMG1TdkUv?=
 =?utf-8?B?NEkrOWZLY0YxTkNCZ1ZSSG82RDVXdTZadjVqcm9rWjhiN0xpSTVlRm4xVG5L?=
 =?utf-8?B?bjhJR3Z4QXpsQWhKNGNYOFhIUkpEOG5hdFIzb21sVm9oUkw0bW5WYXNFaXpF?=
 =?utf-8?B?YmkzTjlvTDZKdlJyd1Jqa0lqUDAwZlpvaDJXajdnSGxyZWlqZmFXTEE5bVpX?=
 =?utf-8?B?ekEva2oyQ3JDVG1RdmFvRVVKNTJwbmNGUXNCUWIwUVcrZEk4U1N3R3hqRlZL?=
 =?utf-8?B?akdlMGE3M3cxT2lMRTBuN292VXZuQWFFZW5RTS92a1FybjZaTlJWMjRNcGlN?=
 =?utf-8?B?endxQVBGWS9maDhCOGNvM0JMK0crSEtaUEFLc1VLMWVWR2gvOWl1Z0wxMzli?=
 =?utf-8?B?dFFPNDh4MmNNMml6a0NZUGVPSGxadFAwbHg0dG11eC91RVBXU2lGT2VtTUc4?=
 =?utf-8?B?T2l1bWluMjczeUtpQmhhOG9XNUpqNEltWDQ0QlI4bVhaZGsydTVzSkNEOFZk?=
 =?utf-8?B?M091WG9GWmw1TGRhSVp3Q0VJVGI4cDBRWHhpNzBlZUgyUVZLU0lxeWRCOEJO?=
 =?utf-8?B?L3REOEt5ZWVOUUVxcDRQWEpjTXJMT2dPamxLZW81OE5tbVlpT3FreDdseW03?=
 =?utf-8?B?VkNZQklmNkdrOCtLTXRwUndLME5hblNBTzlPQ2dmWUpiTUJqTm8yUHpFMFhL?=
 =?utf-8?B?RWpwNXMwaEtXOHZZWFpIdnhwTm9PL3BJUXJWSEpqZGNRNml3N1d2YXlXaCtB?=
 =?utf-8?B?VTBzZElxQ2tPWkxsZmk3M1JlaUJZcjR3NXRTa0ZFQVh6YTM4eXh3RWZqMDBk?=
 =?utf-8?B?SjJtOEdPbExNOHU1UVczdWVNcWY0dTZONzdnU0VzcGQxMW9NeENINzhFM0tE?=
 =?utf-8?B?cmdrdlJteUU2UjMwdzVRUERNcEc4cFh1ektybHhLK09SbWNDajZxV2VRQk95?=
 =?utf-8?B?WGFMU2FGUWVRUGd1ZCtFTDdYTi9OOFlvRGVyQlg2aVRUeXdueEZXUnU2ZXRu?=
 =?utf-8?B?VlV1QTgxRElSYzdSTG4ySDB3MGdoWFU5bFlHdzZ1ZlRGbm1jczlpNW1uVmly?=
 =?utf-8?B?N1UwbXB0V096ZEp4ZVRMTmJHZ0pEYjMxd1BiRzg5akdaVHp4SFJzeHhwdmhS?=
 =?utf-8?B?Z2J3NTdGRTNYRjZpWFd3Q0xaTVd5dnBJS1NqaS9MUUkxRy9TVXJaa1ViMllB?=
 =?utf-8?B?NGNhdFd1eU0rblVUT2xwaU41WEFNQ20wU3Axcmdtb0licjhUd01IUDkwbCta?=
 =?utf-8?B?dHRvZjNYUjZubEhuV1Myb0FlZlpGTmdFTWRYVGM4L3daS3VUbitEZU5tYVUv?=
 =?utf-8?B?a0hDUkxBQ0x2ZE85aGpqamZCMHZLOS9CQ0xxMnhkRVVUczNRTnpUaFpZQkw2?=
 =?utf-8?B?dXh1WFlabTUzclMrUjVMWlRNQk9mK0tkSWppbWNrOHhuQ3pJbm9qRy9XN2RH?=
 =?utf-8?B?bDM5dDZ2Nkl5WDN0Skpva2pBMDF6N0tsaTlmMzVMejlzUElqUmQ2UnRnNDQ3?=
 =?utf-8?B?Nkw1NWVEN1o2YWxTaDV1TFBYNFBGQkZiOU5pNzMxUWZMVTlpbmtVVmQ0RzZZ?=
 =?utf-8?B?NjJkRkc1Y3FCTUp2T1N6Y2MzT2o1b2Q0bWlzbXAwNkRUWmpWS3pIVXZlQUVZ?=
 =?utf-8?B?M25yVTVVRWp2RS9SbHAzb3VoNXhnTHJjcEpwWDFyRitxT2NHRlJzVktqWWlZ?=
 =?utf-8?B?RjR5c1VTYmQyWlQ3REs4VXROMHE0QzI3dGdWNFVleDJ0Tks0UHNsckNET3Qv?=
 =?utf-8?Q?EhQWk3IX1XLRxLYEE4yIvK+ZU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7b38f0a-0acf-4344-8a21-08ddef17f868
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0080.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 20:40:38.8616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rdq2zGr7pvWkHwQIb1O99gkXiaSy6BTMgaoHl6jhYbkUJPwjgyh4m0e7Re62cH3yggsHU0Cl5kDefH2tD1WkXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5643
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



On 9/8/2025 2:39 PM, Miguel Ojeda wrote:
> On Mon, Sep 8, 2025 at 7:06 PM Joel Fernandes <joelagnelf@nvidia.com> wrote:
>>
>> The issue I ran into is, without adding it to prelude, the users of register!
>> macro will have to import both bitfield! and register! macros explictly, even
>> though they're only using register!. I tried to make it work without adding to
>> prelude, but couldn't:
>>
>>   use kernel::{bitfield, register};
>>
>> Also not adding it to prelude, means register! macro has to invoke bitfield with
>> $crate prefixed  ($crate::bitfield).
> 
> I am not sure I follow -- macros should use qualified paths in general
> so that they assume as little as possible from the calling
> environment.
> 
> It should work without the prelude -- what didn't work?

Ah, I guess my intent was to not use the qualified path. But that's better than
the users having to import prelude. Ok, thanks! - I will try this out.

 - Joel

> 
> Thanks!
> 
> Cheers,
> Miguel

