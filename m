Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B26FEAA5EBB
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 14:59:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B2E10E835;
	Thu,  1 May 2025 12:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VroCPL6j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E289210E82C;
 Thu,  1 May 2025 12:59:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ycCI73J/i1ZBCmzyXEziExZfqCW4PrFWh5BVmv/0d0I2H31O4QMAfcHh9YvUNugBXrtdqWyzgQAitQPnZ5vyeF58Cndt2rWz/h0bl2nXpSRee1rVK0xXlVfxBmrIiNbXkhTaPm1TPiebjT+6bCl2N4nZAxILttFJmArbJbOF/nSjViedrpWi36xMPyjG/CAU4/Y4ojqIoDpYGrXOJeGA4lDTJnmqqTpx51FmuLN/zy/x5dnlPSZrIyxPSHadntIKCukNS4XcmL/YiDV5CqYiDrLE59U1xB8C4iDP4p3VRG/Rg43uPwofsEwRNa2947k/BQRQFACoydnof0m5MYiLFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9D7hgGidXi0uZjxMlb6R0yRO5LvyMTcGxJnRhFsI/AY=;
 b=rA4QQ/DuM2Al0cyIdjshckyGFFK7XLGC3WWu59u0+yNoGm3FCnIKV8mLhc84byBWP60TUcIe1iRqecBWNui5zGMpfbOWnSx1wOs02NKxz00JXNNhdHUAAYTtAx0MKvxJYoVDgnLjZ5qT72NM4DbjeEqAKAPxI4Y5KZSOLtMIVjgI/mwm9G2zAziYqyvfGwvOB/6aFdSCSBwftq2iJ86ZejYaL0oQK3Q9cJU9BROZMDygvr82A4pMDASrMDEV12X7aDS4d0XkkrHkDskbqQI06s0YBNjMH5kmA2nUrXH/EkHvxLWrZdEmEEbJg9sZcUwFkqIzm/uyEDH4NCbc0maW4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9D7hgGidXi0uZjxMlb6R0yRO5LvyMTcGxJnRhFsI/AY=;
 b=VroCPL6jgROajDzSSVrgpjo2XbcLZLyYa5xDk6dygaL9Q23wKtavOwYewrUw6+fXwwWJkCwyr31rmGrAsN9LpcjnBGH3UKe5KxTWG5n7ktVax+mgLu4mShbdXnQJNdOqyKLdBZd5nbA7Nnxag/OmuHnsZBlj0qVrBDexTmegoNF9xOKgi+npaRvFyr6yAdLcnbH3ItzqVXsyQxVYKVYUsQvt0U8J3AT/46NxyjJa4Er/iJcZWH8SLWXD27h141JqB0m4OyFQ6P/Yut3Q0dZvKp/jGdbdWILTijvUQVlKNUyJprLQseS/HeeA/gEvVohdoHHyHIOizgkbFblRzGv2og==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6442.namprd12.prod.outlook.com (2603:10b6:510:1fa::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Thu, 1 May
 2025 12:59:09 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 12:59:09 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 01 May 2025 21:58:24 +0900
Subject: [PATCH v2 06/21] gpu: nova-core: define registers layout using
 helper macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-nova-frts-v2-6-b4a137175337@nvidia.com>
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
In-Reply-To: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCPR01CA0101.jpnprd01.prod.outlook.com
 (2603:1096:405:4::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6442:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ecd7718-0068-4202-2f42-08dd88aff697
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7416014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STR1NXY1djZlSmdkN3BSWjlZNmtGTUlwMHdMKzdYaCtrZWN6RHI5VFJGNGtQ?=
 =?utf-8?B?V1lzQllBaTBTL29SUmFQOHgyT2d1Q3Ewa051cTZaWTFiYXBlczBWUkJ5b1hW?=
 =?utf-8?B?Y2RVVE1DUWZvekU1K25HbSs1RXJSaVdjQ2FCRXlPVU5nZzArekJ4U0gzRW13?=
 =?utf-8?B?OFpPWk1xNnlPSzJNcllZdmc5aExwbmhOQkdVcFdsQmtiNlpEWWoxUWhpTlFj?=
 =?utf-8?B?RnVHZ1pKM21VVDR6M1M0VC9BTkF4TDRmYWFqR1lUV1BtNXpqWDYydzR3OHI0?=
 =?utf-8?B?Q0dMaG1UdldpUVQrN0VEdXpYVGF0UUFGeURhcXM5dHlXL3Z1aUlBQ1g4bk85?=
 =?utf-8?B?VDM1WjBHSVg0TGdjeWZyT1EySENtcUt6emo0ajc4K3VENW5Na0pXbWhiY2xF?=
 =?utf-8?B?SmhzL1dsUEVBREdIenl1aDJ2ZDNvQUc5NjdwanZnQ1BEOXdlaFRXTW5QSG1j?=
 =?utf-8?B?TmNqV1A3SmNzaEpicVY4bXJ5NmFiN1VUVTAyM0I2aGt0R05acm9CamljTk9Y?=
 =?utf-8?B?ZGtDR3pzOHg2d3dkL3ZqNHJoRTd1SENpSzk3Tms1dnNBdnlRQjRiR05IaVFS?=
 =?utf-8?B?WjdXS0RWUUxxUmgzZmk3UXdPYUxIb3loY21QRDFaamEvdzE3aW40clI2WmRp?=
 =?utf-8?B?N0xpL05PbkFXbTVxbHBySUhKUmNsMDEzZnlTWmZzOVFqam1uUmVmVFNtMzJ0?=
 =?utf-8?B?MEhxdEY0cm5SbmFiZWZQd250RmNCY2JxMm05RHhhOHhOaSs3N0ZkOFplSTNq?=
 =?utf-8?B?dDVGNEVuRjhqbHNvOE9odnRRbUdNV0h2bXlYTFA1VFVaRWF3OEZtNGhDajB3?=
 =?utf-8?B?K1p1aHBkMmF2V3F2RFl3ektZRmhHZ3NNMEdCS0tIK3V6N3d6TlhXSjZCVlBm?=
 =?utf-8?B?cVhBaDNodi9QLyswQlV1R2VKR09uaTYzeVRzbWRLSVVpQ2pIN3oveVV2blZm?=
 =?utf-8?B?bnBsZDE5SytrWmozWnZObis3K0dNQ3BQM0t0R0U4V0FkSTdrby9nMjRJS3Rq?=
 =?utf-8?B?c3VvWHZBOWpkeTR2WFFzMERZKzZyNTQyUU4vMkdqNHA3T3AvT09BL3QyaG1k?=
 =?utf-8?B?ZzhCWVVtWnUvRHZEWmpScVVTZWtLMjBOY2xtWW9PQWJqUjJqREdRbnRSblNN?=
 =?utf-8?B?KytnQ2tFWUZsdU1pdnVUc2txbGNiMitJQXI0SmUxUGxQRGxjZTJlWDFmNjZJ?=
 =?utf-8?B?RTJEbGp0dlhiazkvT0FKallJd1VPZFR1UE1DTU40bG0wR1VHTmRwMnpsZVk3?=
 =?utf-8?B?V29rSUg3UlpqMUQvdTd5Vlk5TkVMMTlLemMrSUF3Mi9MYVo0Mnp5ODdUUURW?=
 =?utf-8?B?SFNyMStubmZjWmtQMXZnVUxIVU1iaFF3aXlYdUVBWFBZQjZSNmxsTlQwVjBP?=
 =?utf-8?B?ZVBJWUt5NDJGa3R3OU1hSlh4TEExbW1JSVdIRjg0N2NvQmc3TzRHSXBwSUpM?=
 =?utf-8?B?T3RsbmMvVjhYSjRjVHJZWmdWVm1sSUx2aVNLYXVVaUIxT0EyR3NGTGV2Nzla?=
 =?utf-8?B?TXVhMzBKQ0FXRlZRR29za3B2bldDSWFQRFlHam5OWU5ZeXk2bUtBVS9KRDRF?=
 =?utf-8?B?MFZlcXp0czVrNEtEVnkrMnFsQS9EVjErejR4Y1FJdU92YXV5aDkvZHFuQm5h?=
 =?utf-8?B?UEY2bXRRck40NFhXbDB4ZUlLWlkwVEdQMnFMUUw4QjJRMFZTcFBDQjFZUjFL?=
 =?utf-8?B?MTcwVWEzUGdPR09aNloxNFV4OHNKSlhZaU5IWGFDYUJFeGZmNUZuWkpHR29U?=
 =?utf-8?B?TXJlOHdSbkh4QjkyL0xiSkxFNUJnbXBiWDFnU21JYS8yd0FjM1N4S0JKa0xV?=
 =?utf-8?B?MllYQWt6UjlIY1ZqQVR4b2lManR5TW9MV1NQNkY2QUVSbjJQSkt4SWNCbEJs?=
 =?utf-8?B?Z1pVQjkzYlB1WmhWalA3N0JPY2dNdU9nRGo1QWxyOGZ4NlllWHlZYXMrcXEy?=
 =?utf-8?B?eUxnT3NhMEI2QzNaTHI3ZC8xa3lQUWhyOU40UHpuQWp4R0dudk1GZ3EyaGda?=
 =?utf-8?B?OEFGM2pja0l3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1lERTZqMUhhdkhZeU9Ba2JHQkpGTGJCWHErRzRDWDB2VzYxdjBualptSFdz?=
 =?utf-8?B?alJwV0RGZXBTNGdXcS9MamdSSU9DTWttY0xWazJKbVI4RWdoMnZjOXA3VHUz?=
 =?utf-8?B?aTV1L0F5RkY4Tkxwa0Y2REpzWDFzVlNPVUlsVndZZGRvcG9UTkhnN2lzSHlt?=
 =?utf-8?B?bFZyZzAvcEx0d2grbmxmOVVPMjNyWlkrMEw2djY1a1JFcmRkTWNmSFMzMEln?=
 =?utf-8?B?aWVsNy8zK3hqS29XcWR5SFdDaWkwdWpTM0cwZXN4azN5azN3TU4xOWw5R0hX?=
 =?utf-8?B?RGNZcVk3S1htNXJoR0dpT3c4cER3YUttYjZNU3lUWEtMUUVDdThnbTY1WnlC?=
 =?utf-8?B?QWJZSHRpTHJ6eHdPVTdXWksxMzkyVldrdnA2TlhGZ0NpMGlIZHNIcGZRYWVm?=
 =?utf-8?B?VzBDRGVUTktwbkdYNy92VGZXbWxCUDZYekFVM0R5bUxiczZVcTBJZm9SY1Bq?=
 =?utf-8?B?Tm5McFo4c1NsckhVaEdqWGo2YjBxUXJadGVVK043dUs1dlNOb2kwZ2plSXgz?=
 =?utf-8?B?ajBmdlBlMDBWZTlpeFphZS8wdnVwMXhjMG9yUlNwRWlpaGEzWERxVnpDazFN?=
 =?utf-8?B?SnRIYmJlaE5jcCszN1hmSlc5L0Z4andYTVNsTjR5NUNOVWZSbDBtMHIzNkpK?=
 =?utf-8?B?cXFSSkJENk16QkhPMFlxWG9YUkpPY01kQ2xoREQ0dG1xaUllUEU2bXMxbEhU?=
 =?utf-8?B?NWtGQjM0bmphRDNUcU5GUTQ0ZUJsb3dNYTl5M2JXNmFpb3VFR2pVYWxDcHV3?=
 =?utf-8?B?VHZ2bkhSRll4a3ljNWFuS3JBM0JIajRJeVpRN2t6S2lnWWNWV25KWHV4ZVBZ?=
 =?utf-8?B?dmVFRnZWZTFXai9EZCtsaGJpYmR6L2hpN2YyL2EwZXVOZE9oeFZQeXhtekNT?=
 =?utf-8?B?K0kxamFiYlRQVkhLUExLUG1pZUwyY3VKRUxPYkM3Uy9XMmh3a29VcEFFQ29P?=
 =?utf-8?B?ekIrK01KdjhBUjN4QjBadEEyUHFmbklnbzA2eFdlV2g0QTl5SDkzYU1QOWxT?=
 =?utf-8?B?NjZWMmdtTHBCaThmZHN5N3R1TjNqL0ZYR2cya0tDNWNJblViRk56ZFJTU2tK?=
 =?utf-8?B?UFAvVTI4dFAreUplbXRlUUloWmRFeDlobGkrYU1wODhJelFUZFYwVVBFTjNw?=
 =?utf-8?B?M1NadXloMkhqKzNONDRFQ1RMdEJ3dkhRcWhKN0pZVG9ZeER1UUJGYjF2OWll?=
 =?utf-8?B?cXVDMHNzdWdOamZWUGdiSUxsN2lRa3d1NHA4Q2FWMG9VZjlQUldJU2ZHTXRL?=
 =?utf-8?B?UXlvelZVeTRIeFlCcVllWjJZcXpiU0NpNGFveVpNZnlxTHZyMmdBcFNUOHRv?=
 =?utf-8?B?NTExWUcwNlVaeFFiTFlQQjFBMXh2c2tGaWRkaDhPbUM3MmUxakFIYUNwbjJm?=
 =?utf-8?B?T3NoRUNYQS9yOXJLYXNxNkNwTENqd0ZBQ3J4cmRzenBhMUZ3RUNTMWNMRzlK?=
 =?utf-8?B?NGNnUUR6MUVMc3dNL2F4UEsyS0x6ak5kRTlFbkdpWVB5ckNUR2c4OWlaL2Vn?=
 =?utf-8?B?MmNtU3FwQUhURGtQTXVUbDh6V0FoaUo4dkgzSHdBTVFUOWczVEdtUzdvSHJK?=
 =?utf-8?B?Ujc0RjNJWDRhUmxGd3hiTU1LSGZjMkVXUHNVT3ZzWWxmNTByQTJ0U1gzUFVL?=
 =?utf-8?B?K3JqMWY0ZFVXN0xoaW5OVXI1VzdvODRyMG11a01vakQwQzBmYzJBSGRNclpv?=
 =?utf-8?B?Y2NrL3FkWnBER3RxR2hWVGVwRHVyc3FCMXZPK25ZM0VmL3FwejRqVTgzeVN5?=
 =?utf-8?B?RXAyNC9IVjU5azFleE4raXJzaHBVbXcrdWRPaWx6RkFGR2hoOU9pRWZRRWNS?=
 =?utf-8?B?aVZCSkVSbmZVYUVOdVdRZ2NDN201ZjFQbHNWUHU3UUZxZVBiTUwxM3RKcy9o?=
 =?utf-8?B?S2FvMFdGMVVjaWNWcmlmSWhMNmRqNC9PeGtpYXJGazdDa0RWSDdMUWxzcGxP?=
 =?utf-8?B?ckxzUTlVZmRFeWxvZlR6U0dLK1NLR3cvbHNSbjRHR0pSb2lrQ1FTcVhyLzFL?=
 =?utf-8?B?a2Q2eHRsU2hYdlJaOVNLWFk5ZDZ6anpKRk1WWFhRREZIaGdHOEpoUDJVamlL?=
 =?utf-8?B?WGk4YlpPQXhBaGE3TnR3cHNHWndrK01Kd1ZoUXJmZUJLZzVaRWpIdXNkUUc3?=
 =?utf-8?B?MnZvc0QvbmhvNmpMZHJ4ZjhZZVJaR2ZrcW1Bc1hESktqMGNaNDJnWE1YZ29s?=
 =?utf-8?Q?yJFa29R2o7lZd2fOVKjVJHnhBGn5sOvZbV5Y6S4YlZQb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ecd7718-0068-4202-2f42-08dd88aff697
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 12:59:09.5494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RPFGX2466LkHCq17z+aZMIAADAiV42HuWHTi7NY9WfxiC1i65sZWgR8yuxipBeHdEadggnAGGnUfh5UT+ZmysA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6442
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

Add the register!() macro, which defines a given register's layout and
provide bit-field accessors with a way to convert them to a given type.
This macro will allow us to make clear definitions of the registers and
manipulate their fields safely.

The long-term goal is to eventually move it to the kernel crate so it
can be used my other drivers as well, but it was agreed to first land it
into nova-core and make it mature there.

To illustrate its usage, use it to define the layout for the Boot0
(renamed to NV_PMC_BOOT_0 to match OpenRM's naming scheme) and take
advantage of its accessors.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 Documentation/gpu/nova/core/todo.rst |   6 +
 drivers/gpu/nova-core/gpu.rs         |  10 +-
 drivers/gpu/nova-core/regs.rs        |  61 ++----
 drivers/gpu/nova-core/regs/macros.rs | 379 +++++++++++++++++++++++++++++++++++
 4 files changed, 402 insertions(+), 54 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index 234d753d3eacc709b928b1ccbfc9750ef36ec4ed..8a459fc088121f770bfcda5dfb4ef51c712793ce 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -102,7 +102,13 @@ Usage:
 	let boot0 = Boot0::read(&bar);
 	pr_info!("Revision: {}\n", boot0.revision());
 
+Note: a work-in-progress implementation currently resides in
+`drivers/gpu/nova-core/regs/macros.rs` and is used in nova-core. It would be
+nice to improve it (possibly using proc macros) and move it to the `kernel`
+crate so it can be used by other components as well.
+
 | Complexity: Advanced
+| Contact: Alexandre Courbot
 
 Delay / Sleep abstractions
 --------------------------
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 19a17cdc204b013482c0d307c5838cf3044c8cc8..f95f095baa68c9f7ffe3b1e615548aac5c2a0c6c 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -112,10 +112,10 @@ pub(crate) struct Revision {
 }
 
 impl Revision {
-    fn from_boot0(boot0: regs::Boot0) -> Self {
+    fn from_boot0(boot0: regs::NV_PMC_BOOT_0) -> Self {
         Self {
-            major: boot0.major_rev(),
-            minor: boot0.minor_rev(),
+            major: boot0.major_revision(),
+            minor: boot0.minor_revision(),
         }
     }
 }
@@ -136,10 +136,10 @@ pub(crate) struct Spec {
 impl Spec {
     fn new(bar: &Devres<Bar0>) -> Result<Spec> {
         let bar = bar.try_access().ok_or(ENXIO)?;
-        let boot0 = regs::Boot0::read(&bar);
+        let boot0 = regs::NV_PMC_BOOT_0::read(&*bar);
 
         Ok(Self {
-            chipset: boot0.chipset().try_into()?,
+            chipset: boot0.chipset()?,
             revision: Revision::from_boot0(boot0),
         })
     }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index b1a25b86ef17a6710e6236d5e7f1f26cd4407ce3..498fefb52f33bf01518f19d32287962f1fdc3224 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -1,55 +1,18 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use crate::driver::Bar0;
+// Required to retain the original register names used by OpenRM, which are all capital snake case
+// but are mapped to types.
+#![allow(non_camel_case_types)]
 
-// TODO
-//
-// Create register definitions via generic macros. See task "Generic register
-// abstraction" in Documentation/gpu/nova/core/todo.rst.
+#[macro_use]
+mod macros;
 
-const BOOT0_OFFSET: usize = 0x00000000;
+use crate::gpu::Chipset;
 
-// 3:0 - chipset minor revision
-const BOOT0_MINOR_REV_SHIFT: u8 = 0;
-const BOOT0_MINOR_REV_MASK: u32 = 0x0000000f;
+/* PMC */
 
-// 7:4 - chipset major revision
-const BOOT0_MAJOR_REV_SHIFT: u8 = 4;
-const BOOT0_MAJOR_REV_MASK: u32 = 0x000000f0;
-
-// 23:20 - chipset implementation Identifier (depends on architecture)
-const BOOT0_IMPL_SHIFT: u8 = 20;
-const BOOT0_IMPL_MASK: u32 = 0x00f00000;
-
-// 28:24 - chipset architecture identifier
-const BOOT0_ARCH_MASK: u32 = 0x1f000000;
-
-// 28:20 - chipset identifier (virtual register field combining BOOT0_IMPL and
-//         BOOT0_ARCH)
-const BOOT0_CHIPSET_SHIFT: u8 = BOOT0_IMPL_SHIFT;
-const BOOT0_CHIPSET_MASK: u32 = BOOT0_IMPL_MASK | BOOT0_ARCH_MASK;
-
-#[derive(Copy, Clone)]
-pub(crate) struct Boot0(u32);
-
-impl Boot0 {
-    #[inline]
-    pub(crate) fn read(bar: &Bar0) -> Self {
-        Self(bar.read32(BOOT0_OFFSET))
-    }
-
-    #[inline]
-    pub(crate) fn chipset(&self) -> u32 {
-        (self.0 & BOOT0_CHIPSET_MASK) >> BOOT0_CHIPSET_SHIFT
-    }
-
-    #[inline]
-    pub(crate) fn minor_rev(&self) -> u8 {
-        ((self.0 & BOOT0_MINOR_REV_MASK) >> BOOT0_MINOR_REV_SHIFT) as u8
-    }
-
-    #[inline]
-    pub(crate) fn major_rev(&self) -> u8 {
-        ((self.0 & BOOT0_MAJOR_REV_MASK) >> BOOT0_MAJOR_REV_SHIFT) as u8
-    }
-}
+register!(NV_PMC_BOOT_0 @ 0x00000000, "Basic revision information about the GPU" {
+    3:0     minor_revision as u8, "Minor revision of the chip";
+    7:4     major_revision as u8, "Major revision of the chip";
+    28:20   chipset as u32 ?=> Chipset, "Chipset model";
+});
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
new file mode 100644
index 0000000000000000000000000000000000000000..a08d4f2aa0a32b00e80dae4e6b2c79d072241734
--- /dev/null
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -0,0 +1,379 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Macro to define register layout and accessors.
+//!
+//! A single register typically includes several fields, which are accessed through a combination
+//! of bit-shift and mask operations that introduce a class of potential mistakes, notably because
+//! not all possible field values are necessarily valid.
+//!
+//! The macro in this module allow to define, using an intruitive and readable syntax, a dedicated
+//! type for each register with its own field accessors that can return an error is a field's value
+//! is invalid.
+
+/// Defines a dedicated type for a register with an absolute offset, alongside with getter and
+/// setter methods for its fields and methods to read and write it from an `Io` region.
+///
+/// Example:
+///
+/// ```no_run
+/// register!(BOOT_0 @ 0x00000100, "Basic revision information about the GPU" {
+///    3:0     minor_revision as u8, "Minor revision of the chip";
+///    7:4     major_revision as u8, "Major revision of the chip";
+///    28:20   chipset as u32 ?=> Chipset, "Chipset model";
+/// });
+/// ```
+///
+/// This defines a `BOOT_0` type which can be read or written from offset `0x100` of an `Io`
+/// region. It is composed of 3 fields, for instance `minor_revision` is made of the 4 less
+/// significant bits of the register. Each field can be accessed and modified using accessor
+/// methods:
+///
+/// ```no_run
+/// // Read from the register's defined offset (0x100).
+/// let boot0 = BOOT_0::read(&bar);
+/// pr_info!("chip revision: {}.{}", boot0.major_revision(), boot0.minor_revision());
+///
+/// // `Chipset::try_from` will be called with the value of the field and returns an error if the
+/// // value is invalid.
+/// let chipset = boot0.chipset()?;
+///
+/// // Update some fields and write the value back.
+/// boot0.set_major_revision(3).set_minor_revision(10).write(&bar);
+///
+/// // Or just read and update the register in a single step:
+/// BOOT_0::alter(&bar, |r| r.set_major_revision(3).set_minor_revision(10));
+/// ```
+///
+/// Fields can be defined as follows:
+///
+/// - `as <type>` simply returns the field value casted as the requested integer type, typically
+///   `u32`, `u16`, `u8` or `bool`. Note that `bool` fields must have a range of 1 bit.
+/// - `as <type> => <into_type>` calls `<into_type>`'s `From::<<type>>` implementation and returns
+///   the result.
+/// - `as <type> ?=> <try_into_type>` calls `<try_into_type>`'s `TryFrom::<<type>>` implementation
+///   and returns the result. This is useful on fields for which not all values are value.
+///
+/// The documentation strings are optional. If present, they will be added to the type's
+/// definition, or the field getter and setter methods they are attached to.
+///
+/// Putting a `+` before the address of the register makes it relative to a base: the `read` and
+/// `write` methods take a `base` argument that is added to the specified address before access,
+/// and `try_read` and `try_write` methods are also created, allowing access with offsets unknown
+/// at compile-time:
+///
+/// ```no_run
+/// register!(CPU_CTL @ +0x0000010, "CPU core control" {
+///    0:0     start as bool, "Start the CPU core";
+/// });
+///
+/// // Flip the `start` switch for the CPU core which base address is at `CPU_BASE`.
+/// let cpuctl = CPU_CTL::read(&bar, CPU_BASE);
+/// cpuctl.set_start(true).write(&bar, CPU_BASE);
+/// ```
+macro_rules! register {
+    // Creates a register at a fixed offset of the MMIO space.
+    (
+        $name:ident @ $offset:literal $(, $comment:literal)? {
+            $($fields:tt)*
+        }
+    ) => {
+        register!(@common $name $(, $comment)?);
+        register!(@field_accessors $name { $($fields)* });
+        register!(@io $name @ $offset);
+    };
+
+    // Creates a register at a relative offset from a base address.
+    (
+        $name:ident @ + $offset:literal $(, $comment:literal)? {
+            $($fields:tt)*
+        }
+    ) => {
+        register!(@common $name $(, $comment)?);
+        register!(@field_accessors $name { $($fields)* });
+        register!(@io$name @ + $offset);
+    };
+
+    // Defines the wrapper `$name` type, as well as its relevant implementations (`Debug`, `BitOr`,
+    // and conversion to regular `u32`).
+    (@common $name:ident $(, $comment:literal)?) => {
+        $(
+        #[doc=$comment]
+        )?
+        #[repr(transparent)]
+        #[derive(Clone, Copy, Default)]
+        pub(crate) struct $name(u32);
+
+        // TODO: display the raw hex value, then the value of all the fields. This requires
+        // matching the fields, which will complexify the syntax considerably...
+        impl ::core::fmt::Debug for $name {
+            fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
+                f.debug_tuple(stringify!($name))
+                    .field(&format_args!("0x{0:x}", &self.0))
+                    .finish()
+            }
+        }
+
+        impl core::ops::BitOr for $name {
+            type Output = Self;
+
+            fn bitor(self, rhs: Self) -> Self::Output {
+                Self(self.0 | rhs.0)
+            }
+        }
+
+        impl ::core::convert::From<$name> for u32 {
+            fn from(reg: $name) -> u32 {
+                reg.0
+            }
+        }
+    };
+
+    // Defines all the field getter/methods methods for `$name`.
+    (
+        @field_accessors $name:ident {
+        $($hi:tt:$lo:tt $field:ident as $type:tt
+            $(?=> $try_into_type:ty)?
+            $(=> $into_type:ty)?
+            $(, $comment:literal)?
+        ;
+        )*
+        }
+    ) => {
+        $(
+            register!(@check_field_bounds $hi:$lo $field as $type);
+        )*
+
+        #[allow(dead_code)]
+        impl $name {
+            $(
+            register!(@field_accessor $name $hi:$lo $field as $type
+                $(?=> $try_into_type)?
+                $(=> $into_type)?
+                $(, $comment)?
+                ;
+            );
+            )*
+        }
+    };
+
+    // Boolean fields must have `$hi == $lo`.
+    (@check_field_bounds $hi:tt:$lo:tt $field:ident as bool) => {
+        #[allow(clippy::eq_op)]
+        const _: () = {
+            kernel::build_assert!(
+                $hi == $lo,
+                concat!("boolean field `", stringify!($field), "` covers more than one bit")
+            );
+        };
+    };
+
+    // Non-boolean fields must have `$hi >= $lo`.
+    (@check_field_bounds $hi:tt:$lo:tt $field:ident as $type:tt) => {
+        #[allow(clippy::eq_op)]
+        const _: () = {
+            kernel::build_assert!(
+                $hi >= $lo,
+                concat!("field `", stringify!($field), "`'s MSB is smaller than its LSB")
+            );
+        };
+    };
+
+    // Catches fields defined as `bool` and convert them into a boolean value.
+    (
+        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as bool => $into_type:ty
+            $(, $comment:literal)?;
+    ) => {
+        register!(
+            @leaf_accessor $name $hi:$lo $field as bool
+            { |f| <$into_type>::from(if f != 0 { true } else { false }) }
+            $into_type => $into_type $(, $comment)?;
+        );
+    };
+
+    // Shortcut for fields defined as `bool` without the `=>` syntax.
+    (
+        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as bool $(, $comment:literal)?;
+    ) => {
+        register!(@field_accessor $name $hi:$lo $field as bool => bool $(, $comment)?;);
+    };
+
+    // Catches the `?=>` syntax for non-boolean fields.
+    (
+        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt ?=> $try_into_type:ty
+            $(, $comment:literal)?;
+    ) => {
+        register!(@leaf_accessor $name $hi:$lo $field as $type
+            { |f| <$try_into_type>::try_from(f as $type) } $try_into_type =>
+            ::core::result::Result<
+                $try_into_type,
+                <$try_into_type as ::core::convert::TryFrom<$type>>::Error
+            >
+            $(, $comment)?;);
+    };
+
+    // Catches the `=>` syntax for non-boolean fields.
+    (
+        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt => $into_type:ty
+            $(, $comment:literal)?;
+    ) => {
+        register!(@leaf_accessor $name $hi:$lo $field as $type
+            { |f| <$into_type>::from(f as $type) } $into_type => $into_type $(, $comment)?;);
+    };
+
+    // Shortcut for fields defined as non-`bool` without the `=>` or `?=>` syntax.
+    (
+        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt
+            $(, $comment:literal)?;
+    ) => {
+        register!(@field_accessor $name $hi:$lo $field as $type => $type $(, $comment)?;);
+    };
+
+    // Generates the accessor methods for a single field.
+    (
+        @leaf_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:ty
+            { $process:expr } $to_type:ty => $res_type:ty $(, $comment:literal)?;
+    ) => {
+        kernel::macros::paste!(
+        const [<$field:upper>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
+        const [<$field:upper _MASK>]: u32 = ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
+        const [<$field:upper _SHIFT>]: u32 = Self::[<$field:upper _MASK>].trailing_zeros();
+        );
+
+        $(
+        #[doc="Returns the value of this field:"]
+        #[doc=$comment]
+        )?
+        #[inline]
+        pub(crate) fn $field(self) -> $res_type {
+            kernel::macros::paste!(
+            const MASK: u32 = $name::[<$field:upper _MASK>];
+            const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
+            );
+            let field = ((self.0 & MASK) >> SHIFT);
+
+            $process(field)
+        }
+
+        kernel::macros::paste!(
+        $(
+        #[doc="Sets the value of this field:"]
+        #[doc=$comment]
+        )?
+        #[inline]
+        pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
+            const MASK: u32 = $name::[<$field:upper _MASK>];
+            const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
+            let value = ((value as u32) << SHIFT) & MASK;
+            self.0 = (self.0 & !MASK) | value;
+
+            self
+        }
+        );
+    };
+
+    // Creates the IO accessors for a fixed offset register.
+    (@io $name:ident @ $offset:literal) => {
+        #[allow(dead_code)]
+        impl $name {
+            #[inline]
+            pub(crate) fn read<const SIZE: usize, T>(io: &T) -> Self where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+            {
+                Self(io.read32($offset))
+            }
+
+            #[inline]
+            pub(crate) fn write<const SIZE: usize, T>(self, io: &T) where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+            {
+                io.write32(self.0, $offset)
+            }
+
+            #[inline]
+            pub(crate) fn alter<const SIZE: usize, T, F>(
+                io: &T,
+                f: F,
+            ) where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                F: ::core::ops::FnOnce(Self) -> Self,
+            {
+                let reg = f(Self::read(io));
+                reg.write(io);
+            }
+        }
+    };
+
+    // Create the IO accessors for a relative offset register.
+    (@io $name:ident @ + $offset:literal) => {
+        #[allow(dead_code)]
+        impl $name {
+            #[inline]
+            pub(crate) fn read<const SIZE: usize, T>(
+                io: &T,
+                base: usize,
+            ) -> Self where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+            {
+                Self(io.read32(base + $offset))
+            }
+
+            #[inline]
+            pub(crate) fn write<const SIZE: usize, T>(
+                self,
+                io: &T,
+                base: usize,
+            ) where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+            {
+                io.write32(self.0, base + $offset)
+            }
+
+            #[inline]
+            pub(crate) fn alter<const SIZE: usize, T, F>(
+                io: &T,
+                base: usize,
+                f: F,
+            ) where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                F: ::core::ops::FnOnce(Self) -> Self,
+            {
+                let reg = f(Self::read(io, base));
+                reg.write(io, base);
+            }
+
+            #[inline]
+            pub(crate) fn try_read<const SIZE: usize, T>(
+                io: &T,
+                base: usize,
+            ) -> ::kernel::error::Result<Self> where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+            {
+                io.try_read32(base + $offset).map(Self)
+            }
+
+            #[inline]
+            pub(crate) fn try_write<const SIZE: usize, T>(
+                self,
+                io: &T,
+                base: usize,
+            ) -> ::kernel::error::Result<()> where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+            {
+                io.try_write32(self.0, base + $offset)
+            }
+
+            #[inline]
+            pub(crate) fn try_alter<const SIZE: usize, T, F>(
+                io: &T,
+                base: usize,
+                f: F,
+            ) -> ::kernel::error::Result<()> where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                F: ::core::ops::FnOnce(Self) -> Self,
+            {
+                let reg = f(Self::try_read(io, base)?);
+                reg.try_write(io, base)
+            }
+        }
+    };
+}

-- 
2.49.0

