Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 958B8B5618C
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 16:23:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA2EF10E210;
	Sat, 13 Sep 2025 14:23:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aCzFq3hS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6414410E0C9;
 Sat, 13 Sep 2025 14:23:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W0GtCtIwkRQIv/1xkh4eCwIZ84y+hL09RW/oTO5wCetjs6FkZwuMETh531DA948kzUs7I2P1IaGbnCZoCuemxZ/p5aKKHpA36VTna4uP2HSt5tQee+b9LWlX6wsbc87zD/LHWkksh6AeTmveoZUMPIuXIfRinqSmvVdA+L1Pz9pJDaWiegX6F3X00ggJv26WKQ6p5bY57WQrGEEj1lf7xU9ErnNz+Nm4lXLHk6Bi3G3rucEe6YeLuVHrC3sMihvkkx3LEEnMMwUvIpcJaxJzok3eyw0qqqAXaeRPGEKnRZ9lg11iho1JR8AHhPTNOOYy966pDXEJHkd+T1NEwlYHjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vMJhd25eTfut095g5lnPf3PbCV7PeILISwrpLNy26I=;
 b=w9KwMD2WAh8qosUZekt2lXL+jW4FIZdjm9dRUoyqOtBhKGWstCuqX9koQ3/X/Z68cKM0OKITwAAAm5QtTQo4FJDT8P1HFXkN4AaaBwSX4AXuAzDxqbnFDs+57nzeI3//uFAtQW04cA/aOHMdYzeSA/64WCfKEyljl4Q8sFRSV9wmm0mIzR9WwwSLGfI2NYHb6XpnmT8qzouPViExcwoMtpSor6FdGT+eahmD7mJKr6xt3mhZ7N3Vlf/1TyVKwuWnprT8zLa4pqTyARj3hJmyVhYh4NkzaGm36MTECMGZGu/lzQJ7+z+E0uqadzXixsupqbsWtD3cHNew8u4clpXgVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vMJhd25eTfut095g5lnPf3PbCV7PeILISwrpLNy26I=;
 b=aCzFq3hSG7eCs652LAMdisGNV4+PnP3KHZ6IsOJ1nZoI6x/6jeNBcJAHAjOxg3ZKvQpGTgyp1MZ/uPt1lrV35G4xyAwTqd0pxc6wBZ8ebS14Y5U5GYMC9BlBk+GhzCc7bFIxGPRxVN1Dtcz1dAhJ9gEPhDcGayhGHQv4dwWl5PakpSfqp/k+wCUvskfJi0pLWqEFMoR243cGyrz8SRLRhszwgXOs08pQv6kMubJeuLNeHzr97GYyhe5jDZVzxQ8H/Uxzco9S9j/ZF7+mI0YFkZWisoUWea+9SUVtad+6Xz281KwlpaGcyFhUJodlC1GXn8EB7+TBx8sEMuw3PCBP7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB8983.namprd12.prod.outlook.com (2603:10b6:208:490::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Sat, 13 Sep
 2025 14:23:28 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Sat, 13 Sep 2025
 14:23:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 13 Sep 2025 23:23:25 +0900
Message-Id: <DCRQO2P7F2JZ.2SGL49C8D38LX@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v6 00/11] gpu: nova-core: process and prepare more
 firmwares to boot GSP
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250913-nova_firmware-v6-0-9007079548b0@nvidia.com>
In-Reply-To: <20250913-nova_firmware-v6-0-9007079548b0@nvidia.com>
X-ClientProxiedBy: TYCP286CA0355.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB8983:EE_
X-MS-Office365-Filtering-Correlation-Id: 72438d6d-7dfb-42a4-e30d-08ddf2d11bc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHU5QjUzNEtyVnBuZWw4eS90d0oxNjVOMWtiVi8zU0VFOHhGcjNFSWNUREt5?=
 =?utf-8?B?R1gwUE8xQVpCbU1BYWd4cjFpWEQ1Yy8xZ0VUUnVhV3phWmRaVll5TUU3VUN4?=
 =?utf-8?B?MlptemN4dGNSbjRLcUJuZHphK1VHNlI2ZXpkSnhzTEhyVW4raXdLSm5Ub3R2?=
 =?utf-8?B?eXJVSXdLekNMdDlST3pxc3hib3podjBrK1JHNG91UEljSXAyRzl4bi9ZSURM?=
 =?utf-8?B?ZXlQajZGc3I1Yk5XWlh1Q1l3Z3dxa0ZMUVRCM2crTnYyY2s0TlI3OCszZTVr?=
 =?utf-8?B?NGhiWUM3TTkrUmxMejlkS3pzRXhzekxuWHg4RHg4MDI1U1dURXdJcm52THh2?=
 =?utf-8?B?ZWlTN3A5MWh5SHVSWW1DTVc2am5XMnNuamM2WWtvOUlPdHB5ejUzMW1JbWsr?=
 =?utf-8?B?Um8zTUNmRG0yOFI4T2dwUTdMVmx5MFozU0J5LytsZEJjRUVzbnFRU3dIUWpK?=
 =?utf-8?B?MWJFaGprTHR3Zm9HdjYzT3hqTkNTVWRDN3YwSjNrWDFySEJqdGhSLzRnR3ZB?=
 =?utf-8?B?cXorUXpFMVdPampqM05rNGQwdWRQamI5L2FxMDFBb2k1c3FaeXVEK2hWdjdo?=
 =?utf-8?B?a29KcGYxVjRqdnR6L2trYklnSmZvQmo2QTBYRzlQMjhQSk5ZYmh6TTFOYTZa?=
 =?utf-8?B?MDdpRkVFN1llZUNDd3VrTmRONjJNR1Q1RUZNU2h2MlJaVzJoVDB0Q2srYVF1?=
 =?utf-8?B?NnRZMDZ3RElzTEduWkI4TnQxS2pGYU5tT3Nyd1NybW1nTEg2VlJlM0tUM0xO?=
 =?utf-8?B?bUVtYXAzdHZCNmw4UklpSlpjQmhSK083TU9MM3o5MW5JQ3dJb1pWK3M5N2dQ?=
 =?utf-8?B?SGphdS9lL0pVOW16dGlXVWxwVlBwT0YwcEhPRVJvNElROFZ6a2lzcUVOVHpC?=
 =?utf-8?B?S2lVaWpxN0ljQi9Bek9OT3o5b3JmWWRUVmhPaVVpQmlVQnZXSHdGNjNmTTEv?=
 =?utf-8?B?WFVRUzRkZWlHUndQNkFOM2E0V1hkbGViNmhoYlNXTkdIMVRiMWpROHI5QmxB?=
 =?utf-8?B?ZEFVZ1lrMXVLY2FoRFFxbjg1eUJBT3FOVFZDcFhwZEdKUHowYWo2RFAwNTNB?=
 =?utf-8?B?NzlzelArbSs5TUFuMFoyckdQN2xtNFZVaGFISEpmMXVVejBxMU1UZDZjMTNm?=
 =?utf-8?B?NXRDdXFyNk1LeFJPTGVqWHNZVTdxakdrUFgzcDkxQkxaUWo5UUxneHlOYzI5?=
 =?utf-8?B?ZHBjYzdISXVwQUcxUjlXclNVakdLUFVFYXZYUTN4dGJRTlcyc0M5MUJhZFR1?=
 =?utf-8?B?RGlDbXNoaHVyRk1kWDU2ZnBVd016RFJ3ckNSTTFCdmFTVVk4eEQ2VkZvVlNz?=
 =?utf-8?B?Smd5VmJjRjlqUzlXN3h4ZHlQaHJyREN3THpRNUFpa1ZYRnRhMTlPS3Nub3JV?=
 =?utf-8?B?U0VGeXpJRkR5U3RrNmNHNkZYMjByaXFPWVBYa0RHSkU2VTRRRHpDNmUxUnV5?=
 =?utf-8?B?d080S3N2K1c4MEZPNnd3dGpnWEhvN2p0RmNSQURPaUZ6cW0zMlNMZWFhdG1H?=
 =?utf-8?B?NFdCSWgrNDhTb095cVIvalF0NlJ0WWNmR2pQeDF5VFFHanhmRkY4MU1vOFRH?=
 =?utf-8?B?OEdZdnRtdUtvcHplbzRSRjUrRHRybHVDM1ByK1JrUnQzdkRVZW9KWVM1MHNR?=
 =?utf-8?B?MnluUTRRWjVqSnpndXczQnY2SHVFQWtuL05xY1J2THZjaUd3ck9UaTQ4bnpq?=
 =?utf-8?B?a25oSTB2SVErbllJdTZieDduOGxiUHdWUUMvZldJSUpSc2JyNkxkMlVja1hq?=
 =?utf-8?B?TmZQblFDeU1kdzVVcThoZXI1MU44MzNMYmNkaVdQd3JINEtKVEltNVpOU1dY?=
 =?utf-8?B?MWpnWDVBejZ6MDFKY0x3c09uSEpmdndDb1psYllMeDRYT3NxVkM4OXVqUThU?=
 =?utf-8?B?OGJCOUtjNHJBRDM0QVdZSmFEaWFVejhYUUhELzJKMlFPdWw1ME5xUldwdnR0?=
 =?utf-8?B?d0pqVXdEc0g4d2xKeFhGbUN2OEltUm4yMXFHUXhJZE5RMEZIbVBnWjhvS3Z4?=
 =?utf-8?B?ZFpVZnNQb3hBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YllKTmVEWlRDcTRSQ3ZPQzlWeXBIeTJwekwwNjgxMTkrOEJNUFZhR0NrWm11?=
 =?utf-8?B?MVFzOEpuK2s2amowYTlrQTB5QzlSbC9MRHg4OFY2ZFBPajNGUHRnbU42TVVv?=
 =?utf-8?B?SHU1eS8zaWZRR2ZidVp3S1p5ZGJzVjZqRXNFSHhHeVdUanQwWGE4UlFDenJH?=
 =?utf-8?B?N0tEVm9yMXZGNkFOVVdwSUgxOVhrNFA1QVRRdWVER3ZpU0RoNmZYeldsK1RJ?=
 =?utf-8?B?d2tQWmZRVENqSCtFZDU4OEI4VWJoSTJobWNubXliTzBlbGxDaHhMb2Npak1t?=
 =?utf-8?B?NWpXeVNQNUZ4R3A0RitEOVN4TnVmd3pySjU3MGZjeVVtVVVIVThCaWZpM2ph?=
 =?utf-8?B?Nm5TcHk3VkJtcVpmZytOQ2cweCtZWHBQQzlGMngvN1pQYXhZRmtnU3JQaUFG?=
 =?utf-8?B?S3ZMR0tkQlVJS1FpaUgzYnFXa0Z0WnRMeDF0bDJKTGZ5b051RXdCWWlsb3Yw?=
 =?utf-8?B?QjVxVmxPVVFGcmlnaVFIUWljRzRBMWVIV0NUQUNaUnpWeDlROGRuSEZuT3VZ?=
 =?utf-8?B?bHFZeVRJaVdUNnhyZWxtTXlHK0dHczhrZ3lyL2k2Zjd5dGEyZjhYenJlSEFO?=
 =?utf-8?B?bjJwNjF6RlJ5cllyL2sxN0JUM2NsbTZUTitTVndNUDFPNHlRdjAzOHpaM3Rr?=
 =?utf-8?B?T3k1bXhQOUtFbTBUVm5LU3IyUVN2VUtxQngybkpPL3ZiQ1A0cFhwSnlaVDNk?=
 =?utf-8?B?N1V5Zk5QRVBKbkxhWU16N1lramRQaTBjbVRLK2lBTDg2aWg3ZHNaUGNDY1Mr?=
 =?utf-8?B?cTRJd0p2VHp5S0NSbkFPcTJmanBYRnFQUVhYSTRWQ0xlL3pUMlN1WjdQekRu?=
 =?utf-8?B?ajFwd2dJUjFocmVDODlyR2p3VXV5Z0h6Q2wxQldRQlhsKzFySzJCSVpVRWlj?=
 =?utf-8?B?QkZMaHBGekFHNW5lb1RsMG9kanpaZ0dvTFNZQXRkTmE1elJ3Y3BpMnVSbWZa?=
 =?utf-8?B?SFUwOHJNeEh2T0g1TWMxeGZaYkN1UFNaa3I4OS9jcmNHNFFPaE9YRGw4Y1Ir?=
 =?utf-8?B?dU9mTHVNUnp1d1lBZkpOdGoyK0w2S290TytEOXZpTTlNTlp3a29VVU1iSVI3?=
 =?utf-8?B?VldMZXJ0dlVQZFk2R1NVR0pJOFN0MjFuM0VEZklDSDVFQ2FsWHNpTTJvbzZp?=
 =?utf-8?B?M0tkZDNwM0l4MzQ2RWFGNll6emliRVNsbFFTV1Z6NzQ3c3RBUUFjQlpxWSsy?=
 =?utf-8?B?MGJKZ3ZHaGxQR29ZY21ZTi9YNzRKWm1JcnN6MXZPbllzZGlXODR0MDJJOWxX?=
 =?utf-8?B?UmRIMjU1MDZ3UDExbk5PRWpTK0gyYURUdmJiUnE5cXV6RVRWa0tvQUtwNEtD?=
 =?utf-8?B?KzkyVEJ4THJTbERncVRYWjlGdGdFTnowKzZwMzJpZnpEWitUeVRxdlVXa0d5?=
 =?utf-8?B?QzhXNzdVMU1YOFhvVVVES2IyZ3RJZ0RmY1lCQWo1Z3ZtQ1BZTUtmTHNYVlky?=
 =?utf-8?B?bWhKOXdPem5PNnlHbVo2eGsvZDdQTXRUek92YTJzL3IvRW1mVmRaZGErTnIx?=
 =?utf-8?B?anNLNnZycVprR1VUNmRaQ1d2UGEvWTBGb2paV3l3RjBFRCsxRUVTYjRTOEtK?=
 =?utf-8?B?cHptdHNwbkhoRjhVOStlR3FIcndHZ2ZVWHBOcDcyVkYwc0tTVjgwRnhVVFhH?=
 =?utf-8?B?OUI2RWd5OWpjeENvdm9MaFdNWi9wY296ZHV3OHhNWEQ4U1M3ZTJFZ1lsQlh3?=
 =?utf-8?B?YUl1RlVuSjNzNUZ4RUp0WkpZWnlJVG9sWDhJTTBnelpzRkhoc3B5UllDMnl1?=
 =?utf-8?B?TlZDT2JndnJ6a0JqeVpwRjFFcnpTU2ZIRWJDNGZDM3Bhc3lUaDVrUTExMlVl?=
 =?utf-8?B?YWJjRytSa1Qyb1NxMnA4OTJWdUUwcGkyMnZYZnlxdU5wYkZBTFRWT2ZWNTBm?=
 =?utf-8?B?MkdXQncrY0ViS1MyR2FKWTJkT3pPYXBaZ0xBZVlVZlhya0xmNXAvalF0Sk1L?=
 =?utf-8?B?RzFPdzMrVXNNejZ1b2FGanJyeDFRTWRTeFZuaEhzQmFubFBEQVBueE8xSkZq?=
 =?utf-8?B?SkJIQk5CdVA2TXAwU2tkMUNITG12UmRxbkROc3dudVE0WnRIMTJla3pkaUVC?=
 =?utf-8?B?OGNWWVMrZTVwM2FIWEp5TGdCUFBkckdYT05iNHRqbWxQQmdpKzhDVjNzc0Ro?=
 =?utf-8?B?Zk9OcTBmeUo0VTAyay9tenBKZHJJeUZxRUNOb1dJRlZFUEZPa3ZXVlk5TGxt?=
 =?utf-8?Q?QVs9k+UL9n7pF9lXkCmF5ZIn//UkmlMfThn8IZWWBp65?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72438d6d-7dfb-42a4-e30d-08ddf2d11bc3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2025 14:23:28.6052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PSR1hTVVpI5uLT5gsMMc56x4YhXf4f2DXOPujMn6zQ3EaCofnIcTfzL5pz+e96GFGQEj7kanS4NcFvq/LvzrUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8983
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

On Sat Sep 13, 2025 at 11:12 PM JST, Alexandre Courbot wrote:
> Sending a final revision to have the `Link:` tags that dim requires, and
> for the record.
>
> This series makes more progress on the GSP boot process for Ampere GPUs.
>
> At the end of the previous series [1], we were left with a WPR memory
> region created by the FRTS firmware, but still far from the GSP running.
> This series brings us closer to that goal by preparing 2 new firmware
> packages:
>
> * The Booter firmware, which the driver loads and runs on the SEC2
>   falcon;
> * The GSP bootloader and firmware, with the bootloader loaded by Booter
>   onto the GSP RISC-V core to verify and load the actual GSP firmware.
>
> There firmwares are involved in a rather complex dance that is made
> necessary by limitations related to the level of privilege required to
> load code onto the GSP (doing so requires a Heavy Secured signed
> firmware, which is the role fulfilled by Booter).
>
> The first 5 patches perform some cleanup and preparatory work for the
> remainder of the series. Notably, the GSP boot is moved to a new method
> of `Gpu` to get ready for the additional steps that will be added to it,
> and the `Gpu` object is now fully built in-place. We also simplify
> chipset name generation a bit and move the code requesting a firmware
> file into a dedicated function in prevision of the removal of the
> `Firmware` structure.
>
> Patch 6 parses the Booter firmware file, queries the hardware for the
> right signature to use, and patch it into the firmware blob. This makes
> Booter ready to load and run.
>
> Patches 7 and 8 prepare the GSP firmware and its bootloader, and keep
> them into a single structure as they are closely related.
>
> Patches 9 and 10 switch to the 570.144 firmware and introduce the
> layout for its bindings. The raw bindings are stored in a private
> module, and abstracted by the parent module as needed. This allows
> consumer modules to access a safer/nicer form of the bindings than the
> raw one, and also makes it easier to switch to a different (and
> potentially incompatible) firmware version in the future.
>
> 570.144 has been picked because it is the latest firmware currently in
> linux-firmware, but as development progresses the plan is to switch to a
> newer one that is designed with the constraint of upstream in mind. So
> support for 570.144 will be dropped in the future. Support for multiple
> firmware versions is not considered at the moment: there is no immediate
> need for it as the driver is still unstable, and we can think about this
> point once we approach stability (and have better visibility about the
> shape of the firmware at that point).
>
> The last patch introduces the first bindings and uses them to compute
> more framebuffer layout information needed for booting the GSP. A
> separate patch series will pick up from there to use this information
> and finally run these firmware blobs.
>
> The base of this series is today's drm-rust-next, with the Alignment [2]
> series required for the last patch.
>
> A tree with all these dependencies and the patches of this series is
> available at [3].
>
> [1] https://lore.kernel.org/rust-for-linux/20250619-nova-frts-v6-0-ecf41e=
f99252@nvidia.com/
> [2] https://lore.kernel.org/rust-for-linux/20250908-num-v5-0-c0f2f681ea96=
@nvidia.com/
> [3] https://github.com/Gnurou/linux/tree/b4/nova_firmware
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Patches 1 to 10 merged to drm-rust-next, as agreed with Danilo.
