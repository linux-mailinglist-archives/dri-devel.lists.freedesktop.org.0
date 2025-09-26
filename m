Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE98BBA222C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 03:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B921910E298;
	Fri, 26 Sep 2025 01:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="U23WzJYC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012048.outbound.protection.outlook.com
 [40.107.200.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED3010E298;
 Fri, 26 Sep 2025 01:24:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tjq5C+00OvIX4bXN3WNjRXx8wDh3BYFDRSpHrEZmdKG3hpCdgAZaxAD7YdAvuXBL3g7krQRAERKteAJqbBDogeXnYUg69gtkXpPEAfB2/HNqvm/lxiH08VyYbMS4rvpDKdCG6/l3S/U+WjfbhDavNEFLeFguXUY53dLVxkzfAsRvq6kXdY4Yih3yeYFcLMwVjjTHhpyFqP+rp++/S72Vcln1DWHqYQ4tTtdeMDKBxScs/UxBQLuu/r/7U1nGvp5bvJw6mG9vyls7rSYyQL257JzQJ7Em+nIN9BStGLR3VhciUj6H+Xc8xXEzkf3daQtZsC1i4n7WivOgpUDAYKhWcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/NjyEfC/NXkeW3MgwBgYWYMEsggNtbK5DeA0QTRzFY8=;
 b=lb4Yy0hr0vNtA9b+T+Vfy7F62d6eLCsLuMsJY3AL5FmMEBSrArfgYRb44Bu1OnT3RD42SZRy0ZrJM6RkRGQ7knZrDfT+pT9fhSUz3gtRSu69G9oR5Gypbjn2t199/wk2XzJyGjadb74AXZPtldocAlJW6XpqfWSaeadSFssSbAKUPpczO+WWtjwCvUH/A/UppxP3aM8okUqJWssXn7SJVo5rlXwtuVe1QXWg8c6OkhSNRONrXm8/3TV1zDRVYH04CdQCU7p53Um0oTT8J9LNgZu/k9/Cx60EB1VoDI/SMv7QkQsFVxw0z7l4gtgLnR18UNtB5eF4cwspU51N/5nbnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NjyEfC/NXkeW3MgwBgYWYMEsggNtbK5DeA0QTRzFY8=;
 b=U23WzJYC/FKIxXaKSxsbHKXERYx5U5mOZNvY41ce+i3j6be87c+z92BmxdLU5eK6h+jVViFrelTOQJbeXH+GLXNv663vcjsgieaJnJTtVhWtou1En+NodERcbKbmjKJpRdem6kQbs7w2XV+euXtFehGHCnth2AGvpQcLw+9hg6b86qE6ktyf451kWXFyrliOfKjWFO1QJeK7vxrWYoi5fcXvS+qp+nu19eb2CmpJ++1rXFCM9H/d7JKzl/U68Ag5P8gbA9oov+VwWW2vnPnCpQlv7c9+GKXGXqG17e7SMMSCJD9vsrq07hu1JoZ8Mk/n+B5RG9TJnveW6m/tWfvU4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB8370.namprd12.prod.outlook.com (2603:10b6:8:eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Fri, 26 Sep
 2025 01:24:23 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9137.018; Fri, 26 Sep 2025
 01:24:22 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Sep 2025 10:24:18 +0900
Message-Id: <DD2C8MKHDRCA.1XRV8RNPCXAN7@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v2 03/10] gpu: nova-core: gsp: Create wpr metadata
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Lyude Paul" <lyude@redhat.com>, "Alistair Popple" <apopple@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>, <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-4-apopple@nvidia.com>
 <e024e964c5e79b1c86dadcb8c19d14d175bcb0a7.camel@redhat.com>
In-Reply-To: <e024e964c5e79b1c86dadcb8c19d14d175bcb0a7.camel@redhat.com>
X-ClientProxiedBy: TY4PR01CA0078.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB8370:EE_
X-MS-Office365-Filtering-Correlation-Id: a5d9abff-eeb6-4978-08e6-08ddfc9b6c44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0VnekhvNURSL1h5UlpJaE5HNCswcGYrOFJlY0UvcUdJK01lNEtyb1NjMkpY?=
 =?utf-8?B?RlFKTFViYkNkSzROdW00cjVvaXRIU0dyb0liV28yRnhuMWZINVVKRkc2Zmtw?=
 =?utf-8?B?V29Yanllb3VPcExMaVgrZlY2c25leWh0OEx5ZUFSR0tXSlFCVW1JZGhjVSt5?=
 =?utf-8?B?Vkl3U1NPTnlWM0ZjdEZ1ZEE2UXZDSVNmd01uSTN4ZnJuaXM4azVaWnlUcjJq?=
 =?utf-8?B?ckl5RzYyamlvRzVaSmdVR0h3akMweVdBY0xFbGJKNVl2Uk8xc0YwVllUYUF2?=
 =?utf-8?B?SDN2T1JITnRrY3BVREROY2ZJUFl5NURudG91SThBRmpGZmRERHR2N09CRit1?=
 =?utf-8?B?dnZBMnpKaFg4K3JOQkNWdkNaVExIWjJ0THJYRjJoRmkrNHdXZWlnaEpzbHdW?=
 =?utf-8?B?cGJTK2VwTllGZWxnYUdjU3htVlFsMzI1VHU3dUdsakpMSEhaWmJMNTVYMytu?=
 =?utf-8?B?aGZhcjF0Y2Z6dHBpRzdISzZHeXpMMFhKRFlpZ2ZNU09SYlZ3dUlHVmFUQUsv?=
 =?utf-8?B?Unp3VHJmU0Z4Z1ZBT0tKUkVzYjczRFZGUXdUbGozVWhIWXZHWGM3WXRpUkkz?=
 =?utf-8?B?K0d3cHIwTDhRdTJVWStWMzFUVmM1bHN4bE1KRXpMdlh4STZUTERabHIwdUI2?=
 =?utf-8?B?NmRJVnM0Yk42ckJhRHNKaFhiN2lDYnBkZmJxak1nM05uQmNnd0pIZkRjcmlW?=
 =?utf-8?B?WldlZHZhcklZSFdNd3Jod3ZZZU5rdERyYmZRVFRub3JDVkxkd2pBUUNmR0hS?=
 =?utf-8?B?TjVXbGNhZC95RWozWUlxZTRBUlFZd0Q5VDI2ZkJhWkQ2aEFlSkRwU01IV3lS?=
 =?utf-8?B?SGxBS245b0lVS3pZbTJNSStMZFRZT3ZQK0ZZYi9nM1k3YmYxbThZb29pR0tF?=
 =?utf-8?B?czdlUWFZak9XTENOWHhXbVl2QlVIUGpYQWJUb24zL1lRTm1zanJ2UUVHWVhS?=
 =?utf-8?B?bzVCcTFhQmNYNm0wTUt4TGpuTlRkdzBMcWJzNlZNVktVeGJsRFZnS3dXUXV5?=
 =?utf-8?B?blBiL3dUVlc4S0kySnh6cnM5S0ZqcWQ3aWJrUDh6T2lSRnlSSVZ3azF0TXlm?=
 =?utf-8?B?V2xiTGJRb2U1OUdkQmdOSGN1RlBuTjJ0NzdNS0RHcUEreFk2UFRnYzd3TFBZ?=
 =?utf-8?B?bkIwVCsxLzRtYzhHWlhMU255TGtLMGcvQjBoM1d2TGdpbGl6NllWUUhjVDJn?=
 =?utf-8?B?RzhVKzF3Nkk5S0FDSDZ3c2xzUDRITjMwbzRYaWtQNHl6ekdtaDVpZnRZd1kw?=
 =?utf-8?B?eXh3RFZUQ1VRanZNYWQ2a0xLc1hTMlFRcnFHeDc5RnZ1OG9Hd3d6ZHorc0Qy?=
 =?utf-8?B?K05KakN6anJKN09KNHExeG5vZVNaTHFmb3IrMVk4MmE5WHNKamJrS1dEK3d6?=
 =?utf-8?B?QkFGRFRtWVQxeE12NXhSanlDN3NyNUdTQzFNcTFzcm5TNkdQQmtMOWFMNC85?=
 =?utf-8?B?bkx2NTlidTFIV1dRT3dxV1pzU055SmJlL3Bsc0dCY1gydGhKYnNiOWRPZkdP?=
 =?utf-8?B?RXNFR1I3ZkpPdUdqeWFYS1J2MlB6bWY2NnJUeE5WdzB1dk1abmdHVWJTSHA4?=
 =?utf-8?B?emVkc3A3YVl2blliQXhFVTlKU2lTRm13OG9ZeWRZVy9tM21xa1VQVFQxSVVp?=
 =?utf-8?B?MXJZMFFOWFppL09INnBhVzd4S0JDaFBTNXFRYkIydlNzRUtBT3RLblRaQkJz?=
 =?utf-8?B?bjBhVzM0azhDNTgwK3BuSFFKWDZsSDQ2YVk4NVd1MFBBRkFub0pLdFlvZkF3?=
 =?utf-8?B?ZEM3K1czeVAvbXkwbFduZ045OTk3MnFsV2Rad0JPM3M2dnRQUmZBQnhPT2gx?=
 =?utf-8?B?U0RhYjJNRzdGWksrS296QnFrS1dXVDlxTXphUVp1bUZFbVlnR25xY3ZJQUxy?=
 =?utf-8?B?bll1SDlVUUUraExKZEtlMUpmWm0xNmhPZ3YzZEpJMTBGNk95TXJ6SHNDUTBk?=
 =?utf-8?Q?d5Ir7fKth04=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0RYRnVzdGFpV05oRWhad05wcGpwZGdxcWE3K2NtTWJ2amlKMkhEclM0N0dK?=
 =?utf-8?B?cHNGa3EwRm5CV0NlbVcwaGlPcTU0YUxGY0Z1MEovWEk4ajQwZU51ZW9JZkZH?=
 =?utf-8?B?bEQ5bkNTU08vYnl0MUxHckFFdmNhN3ZUYTNucG5hQlltYVNOMEFKdUFzVHVY?=
 =?utf-8?B?SjY2aXNsU05YNExCZVV4bzFVa2xHV01rYjNjYmFyTW5UZmdCQTQ2UXNMNGJ0?=
 =?utf-8?B?NXZYMWdqOFplNmtXOEpvNkFWaTJpQXZKSVhTczVmSzdoMUNtVGN0U2xyNkdM?=
 =?utf-8?B?a2EwNXNiK0srTHNoSEFGYkp0dUhOOGtWc242c1U4Y0xzZWlBd0IvdnlxY0F4?=
 =?utf-8?B?MmJLRWptS0YyaW1wM0dkZTZXTDRmTkpwMnJMQTRzNS9LZFpmS1ZpelRUdFRy?=
 =?utf-8?B?THQ5L210SEJSRWlqUGZhVVRLbVBwcTZlcDAzNnZuQzlpZXp5M05qVlFRTDRq?=
 =?utf-8?B?NE51WmdrTHk4MmQwQVNHbGM5OU1BejFrd1hkOWN3NGIyUklvek9TcWMrRDRM?=
 =?utf-8?B?cHhLcHJtWU9BRHBjNXFGb0tPYVZ5R3h6cUJtbFU0VkxoNm1JVmg4d3RGSjBF?=
 =?utf-8?B?cjdXVkFuUisxUGxXUUFkYkFtc2FjQ3JkVmJPMlh3UFZtNlFtc2Z1eXVEZzl4?=
 =?utf-8?B?Yy9yZTFmdEplUEZiT1g3SnZXbzNKT0JZanJIaEZPMHk2UHpwcExZU0JBaDk4?=
 =?utf-8?B?ZzUyY3ZCazh1LzdUYXdaNUR2RnhUbUhSTTJvSXNDT0t1QWtnNU54VFl0YzJk?=
 =?utf-8?B?dHhZV20zcFBSZ2pNN292bFpvWjJtZ3NlTnNoM1dSK2Nhd0dVamRqNktPTDQz?=
 =?utf-8?B?OFdvTjBVREtNRk1Nb2dzNXZFZit6WEMrR05oekp5Y05aZUxIc3dxekZTM0Rq?=
 =?utf-8?B?aUJGVW9pVDUxNDJGRWRHemVXZDVTMUZVSkMvd1RlWnVMekFmTGxDUW1NamNu?=
 =?utf-8?B?d2d0WEtvU1VEdTlSbWtmT0tWbjhNdzhTL2hRVUNHdW1Nd0tnTFhvcUFyYW42?=
 =?utf-8?B?SkNkQVdqQ2lxbUxlRW9VeVlSOGpUaktZN1hzNVc1UHhmU2N3enpCa05GekZv?=
 =?utf-8?B?SCt2Rkx3MmpZdERYUTZYVk9nRk5jd0R3ci8wSFkxUlFGb2JFOVRWTzhTQ2pT?=
 =?utf-8?B?ZVRFd2hlaWMzVWNNQ3Q5bWhqQy9lT0Z4MGIrOUpQSy9BcWdEYlcvakk1eldH?=
 =?utf-8?B?aW05NWNFTjlpNkRXZGpXTmpJcDhGcjlFRUNRc0RDS2xkS3QrM1luVFVkYlNH?=
 =?utf-8?B?SXJKRm9xZ2RzN2FJNzhoQ3Z6NmppNDZPaFR5aDJIcXVQNWp3ajh2ZzlzRzdp?=
 =?utf-8?B?T0ZsZFBoUEhMcmNlT2ZPWHdwK0lBSG1kNzZSWGFZdFNyanpqYStLVzlpeUl2?=
 =?utf-8?B?NmE4S29mck9hZFlqWVZZZk8xWnpaSWptV1VwWFdJRU83dGV2eVFYUDNQY1Rp?=
 =?utf-8?B?Z0JmaDBGVENSQVBaTUxEc2RhR09FQzh4clJaVDk3bFlGS1pIMVdXNEh3bndL?=
 =?utf-8?B?TEZoMlVwNFZhSTJIZXd2RDF6Q3c0ajdLbU5iWUFuZit2YU9IL3YwZmJ4bG5v?=
 =?utf-8?B?YjBYQU1SdnVVdS9HQWU3R09nY0RudnlRRXJ6NEVpZXhDZVgveGEwYS9zY3k1?=
 =?utf-8?B?bk5CRzNtenhEWTBlczZqMTlnRUx2REU2WEpWRlc0TXErRldIcHFnRE05ZGRU?=
 =?utf-8?B?dk44K1lUZ0dWMXlWOTlGemU3UjVmVVRRaXBteDJzRTNxbHlQbmRnOFA3bFNF?=
 =?utf-8?B?dzVYejhPb3h1Wm1Bd1ptNUxZM0hlczgyaXZtK0pJNUVhWWRaWkRWcjNtUlZv?=
 =?utf-8?B?T0QyeFZkZjM4SGZvVjdRV1JKd20zdnYrTldxUDlwSmJ4NEVuRFh1MUlBZUY2?=
 =?utf-8?B?cWxycS9EdEI0TkRLUjNBWVc5d2xKd04vYzJaSzNjYm5VUW5ZMHV3blU0dVA1?=
 =?utf-8?B?d1NHMjFmcE9hNEVkNkVDODhTM0RHL0hxNnVINjJ4Q0duYysxRU5BVWhaS3Bn?=
 =?utf-8?B?SFUwM1A3ZXZCRldJbUdEbE55Z1oxaGFscGo5R3pUZWhkcStjSnpDQkxONnkz?=
 =?utf-8?B?c1RCMDM5RHRpamF6UEswNFoxRnZGMkhab0JrcmNrdUJLaWJiL1QwaStyRDh4?=
 =?utf-8?B?MU05STBxU0s5WFluQjRTc2NCZU5Za2hQZEloYjM0V09ULzFKTVZhU2RVS2hC?=
 =?utf-8?Q?dTngztluSQGLm30CXYYOg/uXPApk7wi8l0yXphbBOO7X?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d9abff-eeb6-4978-08e6-08ddfc9b6c44
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 01:24:22.8218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HKdVyA856nWKj+NJFDRa8JvBG61rmXJWE3MeC772pBKizP9MhzYTXHDkWmUUXcceP2SNBBg48nKk4KG06kaoBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8370
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

On Thu Sep 25, 2025 at 5:24 AM JST, Lyude Paul wrote:
> On Mon, 2025-09-22 at 21:30 +1000, Alistair Popple wrote:
>> The GSP requires some pieces of metadata to boot. These are passed in a
>> struct which the GSP transfers via DMA. Create this struct and get a
>> handle to it for future use when booting the GSP.
>>=20
>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>>=20
>> ---
>>=20
>> Changes for v2:
>>  - Rebased on Alex's latest version
>> ---
>>  drivers/gpu/nova-core/fb.rs                   |  1 -
>>  drivers/gpu/nova-core/firmware/gsp.rs         |  3 +-
>>  drivers/gpu/nova-core/firmware/riscv.rs       |  6 +-
>>  drivers/gpu/nova-core/gsp.rs                  |  1 +
>>  drivers/gpu/nova-core/gsp/boot.rs             |  7 +++
>>  drivers/gpu/nova-core/gsp/fw.rs               | 63 ++++++++++++++++++-
>>  .../gpu/nova-core/gsp/fw/r570_144/bindings.rs |  2 +
>>  7 files changed, 75 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
>> index 4d6a1f452183..5580498ba2fb 100644
>> --- a/drivers/gpu/nova-core/fb.rs
>> +++ b/drivers/gpu/nova-core/fb.rs
>> @@ -87,7 +87,6 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
>>  ///
>>  /// Contains ranges of GPU memory reserved for a given purpose during t=
he GSP boot process.
>>  #[derive(Debug)]
>> -#[expect(dead_code)]
>>  pub(crate) struct FbLayout {
>>      /// Range of the framebuffer. Starts at `0`.
>>      pub(crate) fb: Range<u64>,
>> diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-co=
re/firmware/gsp.rs
>> index 9654810834d9..67b85e1db27d 100644
>> --- a/drivers/gpu/nova-core/firmware/gsp.rs
>> +++ b/drivers/gpu/nova-core/firmware/gsp.rs
>> @@ -127,7 +127,7 @@ pub(crate) struct GspFirmware {
>>      /// Size in bytes of the firmware contained in [`Self::fw`].
>>      pub size: usize,
>>      /// Device-mapped GSP signatures matching the GPU's [`Chipset`].
>> -    signatures: DmaObject,
>> +    pub signatures: DmaObject,
>>      /// GSP bootloader, verifies the GSP firmware before loading and ru=
nning it.
>>      pub bootloader: RiscvFirmware,
>>  }
>> @@ -212,7 +212,6 @@ pub(crate) fn new<'a, 'b>(
>>          }))
>>      }
>> =20
>> -    #[expect(unused)]
>>      /// Returns the DMA handle of the radix3 level 0 page table.
>>      pub(crate) fn radix3_dma_handle(&self) -> DmaAddress {
>>          self.level0.dma_handle()
>> diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-=
core/firmware/riscv.rs
>> index b90acfc81e78..dec33d2b631a 100644
>> --- a/drivers/gpu/nova-core/firmware/riscv.rs
>> +++ b/drivers/gpu/nova-core/firmware/riscv.rs
>> @@ -53,11 +53,11 @@ fn new(bin_fw: &BinFirmware<'_>) -> Result<Self> {
>>  #[expect(unused)]
>>  pub(crate) struct RiscvFirmware {
>>      /// Offset at which the code starts in the firmware image.
>> -    code_offset: u32,
>> +    pub code_offset: u32,
>>      /// Offset at which the data starts in the firmware image.
>> -    data_offset: u32,
>> +    pub data_offset: u32,
>>      /// Offset at which the manifest starts in the firmware image.
>> -    manifest_offset: u32,
>> +    pub manifest_offset: u32,
>>      /// Application version.
>>      app_version: u32,
>>      /// Device-mapped firmware image.
>> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
>> index 0185f66971ff..2daa46f2a514 100644
>> --- a/drivers/gpu/nova-core/gsp.rs
>> +++ b/drivers/gpu/nova-core/gsp.rs
>> @@ -13,6 +13,7 @@
>>  use kernel::ptr::Alignment;
>>  use kernel::transmute::{AsBytes, FromBytes};
>> =20
>> +use crate::fb::FbLayout;
>>  use fw::LibosMemoryRegionInitArgument;
>> =20
>>  pub(crate) const GSP_PAGE_SHIFT: usize =3D 12;
>> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/g=
sp/boot.rs
>> index fb22508128c4..1d2448331d7a 100644
>> --- a/drivers/gpu/nova-core/gsp/boot.rs
>> +++ b/drivers/gpu/nova-core/gsp/boot.rs
>> @@ -1,6 +1,8 @@
>>  // SPDX-License-Identifier: GPL-2.0
>> =20
>>  use kernel::device;
>> +use kernel::dma::CoherentAllocation;
>> +use kernel::dma_write;
>>  use kernel::pci;
>>  use kernel::prelude::*;
>> =20
>> @@ -14,6 +16,7 @@
>>      FIRMWARE_VERSION,
>>  };
>>  use crate::gpu::Chipset;
>> +use crate::gsp::GspFwWprMeta;
>>  use crate::regs;
>>  use crate::vbios::Vbios;
>> =20
>> @@ -132,6 +135,10 @@ pub(crate) fn boot(
>>              bar,
>>          )?;
>> =20
>> +        let wpr_meta =3D
>> +            CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, =
GFP_KERNEL | __GFP_ZERO)?;
>> +        dma_write!(wpr_meta[0] =3D GspFwWprMeta::new(&gsp_fw, &fb_layou=
t))?;
>
> Not something I think we need to block this series on, but this line does=
 make
> me wonder if we should have a variant of dma_write!() that uses
> CoherentAllocation::write(), since I think that would actually be faster =
then
> calling dma_write!() here.

Can you elaborate a bit on this idea? Would it be faster because it uses
a non-volatile write in this case?

On a related note, I wish we could make all these accesses to
single-instance coherent allocations non-fallible, as this is a pattern
we use often in Nova and the only thing that can fail is
`item_from_index`, which we know at build-time is valid as we are
accessing the first element.

So if we enforced a rule that `count` must be >=3D 0 in
`CoherentAllocation::alloc_attrs` (which is not currently enforced but
would make sense imho), we could maybe add a new variant to
`dma_read/write` that matches a non-indexed expression, and makes a
non-fallible access to the first element of the allocation? How does
that sound?

Or we could also introduce a new type for single-instance allocations if
that makes more sense.
