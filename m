Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A60B4FEBE
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 16:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728DB10E76D;
	Tue,  9 Sep 2025 14:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kZfrZQcH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B8E010E76D;
 Tue,  9 Sep 2025 14:06:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o/xrhtFzQZl8g244d3Q8J8SV7J4rO26kApByDYXIVjwRpCTjI0oYOYkie9GimQMYbVrswk7BRBQatPEYEdt+KBZbTw3rE1uJrRxEkumDeRQIT4FXMiPSI45hDXh21Co5ctlh6jx6LUreqosI4iy7NraBIi9u282F4nr0xUmpZFntpJMRmHF0PLylLr0pkRa7qu7ebRlsLWvvP8/eM5iCPTASpV3Wq3L00OMKu36X/dcg9pkgJYEqB69g9i4rLClPBbhCRD4XUTicmI6BDM6kItzlQHZMfJ3IP66aUiyAIWpX90IePzelHWaLTATpEZjox8jpRp2yL/Ycvm03Rxfzzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uj1iQoLOMGKlTVs6OYtI38cfc60EehrVcLNm2SBa4oE=;
 b=mhzdPIieqQr0nnFvz2uAspoKbn2W1L1nXMuE8im6F7vdQ1LExHDfTFVVnGbMquBjxJ1VNzMHb48Mnw+RSaCUZ+MCRMXmUsnzege3sVR4LHw5CzWP0ej8qPfIfdSeWYmB7r1WKlYkNqTuUgqTsSfCJmE5EKCT49OL92KPBaq0rpf9hLr/o+Ron+SLIC2JnTllQK3NnL1r7DyPV2snRbLl9LdF4iHfXpKaFfVbmPy0djNTCRPfxVpJ5Uu0NPrOJkFqPUXiCzJr71OeLIjei5S/T1txAUf9CtPMOsxI94JEEHyHnpTfNBFcWrn3MTG3vyXtndyu22Y97dxyyeAKNST4Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uj1iQoLOMGKlTVs6OYtI38cfc60EehrVcLNm2SBa4oE=;
 b=kZfrZQcH8INQBETmCm8tn9DYu0GuJ5nNLCF/of56WFwI4G9LHkbo7/cW7WQA0bS/cgycSwQxM9HVRbD+OkI6+9wsif/FC2cbUoREAG9TKGIm3nkXfxKMYgF2Q2rdvOcNHQYzcAa4t/MGTXxoq1UzC0yZg3QA2Epv09N21Wz8wtBE5ucITxzrK8lWfCGBZtPrvc4w5h9am/i9ppu88XYisJY9i8RRGsuu2IZ9VrifsmpHrY/uRA3WH2bBigFCzQfrOux+ffSvnkHWGKosQiYkmJneSTEP6zrh4GgUlsBmJ/WCj9WkihMY4KgW2lmWV6hSijTIqTvTK/WLK/bKLgzN1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB7978.namprd12.prod.outlook.com (2603:10b6:806:34b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 14:06:51 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 14:06:51 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 09 Sep 2025 23:06:37 +0900
Subject: [PATCH v4 01/11] gpu: nova-core: require `Send` on `FalconEngine`
 and `FalconHal`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-nova_firmware-v4-1-4dcb433d5fee@nvidia.com>
References: <20250909-nova_firmware-v4-0-4dcb433d5fee@nvidia.com>
In-Reply-To: <20250909-nova_firmware-v4-0-4dcb433d5fee@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0316.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB7978:EE_
X-MS-Office365-Filtering-Correlation-Id: 88eb4667-7782-4df7-5573-08ddefaa1f9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RkRMaUREU3h6SHh5RHU5ZVdVbXZrcURzZ3dhUEZUUXBDc2ZUNDhUbjBxUEtE?=
 =?utf-8?B?U2VCMlVjdXhrMUd2S3crTmVNeXR3MVZVMlNlSGNNS1dybWtJMlUrTVBDN21G?=
 =?utf-8?B?M25ubFd6Y0c2SUw3Tkd5akpCK0FyQXhQMHJtbEtZVEZqR0VyWDhweHBEMHIv?=
 =?utf-8?B?TlF1dGpjUGJNZ3lYbE5MNDJCb0dSZHpMQ2pNZlhwSGdKYjdtdzI5c3FwZ1pQ?=
 =?utf-8?B?bHpOQzVEdmFpNUVtNE9qOHdSVlhlMVRoc0E2WE1SUWMyOGZrM1RMZC92a0Rj?=
 =?utf-8?B?dUV6dVd3THhhb3d1aEIrd0g5aU1sNGxhUVVYWEYzWjh1UnVPQzhpbVV5QTRl?=
 =?utf-8?B?dG9aZmUxV3JRK0Z3dmtlTmcyVHp0TzVaLy95OUdUZHVsUkx1ZHN1d1AyL3pP?=
 =?utf-8?B?MUhGNG9FTXNabFlYY29lV0I5eUEzdHZWMjZjcVQzb0NzYjN0N0NpMFlaS0cy?=
 =?utf-8?B?VFYzaHZVU2hDWk9XRzhqQkUxVDdNc3JqVlpMcHFibmI1SjFaNEdTdU5wRi9R?=
 =?utf-8?B?K01zRDFJTEMwSHRpZVJ6VWJWV0ZDNXVBOWk4OEZjVVlPZU41QjNHUUJUNDVs?=
 =?utf-8?B?QlVXWTZvYTNNY0NhcTlkb0pKWEZZYVgxUkZVZHcxUEx0cXpQeXBFS3BZbUdE?=
 =?utf-8?B?dDB0Q3N0RkoxcEdVNDFpVkFJUFlsVFlVcVkwUU5BcVp2MWhscGQvVmVnK2xZ?=
 =?utf-8?B?R0dtQ0hDbUdVanNIK0dvODJvR2QyVmZ0QmIyQzhZV0xmTU1ESFBQblcyMWNZ?=
 =?utf-8?B?dHRqOFFKMGdHRjd1a3FpakZ4cTdYYU1uam9sTnJ5SjRyeHoxTm5pazFtZHZz?=
 =?utf-8?B?Y2M3RlFEdGJvNVJzZ1VDejdnYUdnOFNFK0hldnZyQjFzYmdKdlhHYjdCck95?=
 =?utf-8?B?MWkvZGY5SmxSUUlzUzg4Sy93UnhnZ3BvZmM4L1N2eCs4UWpGY3l4SkdaTjE5?=
 =?utf-8?B?dHNuMzJOY0lnOUVpVU80d2JoNjdPbHpkZkJFN09uVzkzWlgzUVcxWUxhWVlC?=
 =?utf-8?B?VmVDd1c1TzNZeDN0cjNXbTd0M0puMDI0RjZ2K1JuKzI5R01SbjNQcEFIaElD?=
 =?utf-8?B?S3FWZjNRS1BZTTFPc212MUF4UVZKNVR2TWRrRDBHSVNPTnYyeVphd3kyeFpr?=
 =?utf-8?B?VlN3bWpldDlnNG5NZ2FRTTVTcWduV2dtRi9mMGFnbUh0a0NDL3JJZ1A1MTN0?=
 =?utf-8?B?QUgvTUhvM242S1NVWXlsMDBNS1RjMWd2LzYyM0tsYUpsSEJhSnJrelF3RWVi?=
 =?utf-8?B?TEVCTi8zb1VZc3J4eFhzbWRaNG51di9jVkFSN1dab3RkcE00S0lGWTNicEVW?=
 =?utf-8?B?RHNMWlFvclZMOHBTS0RSS21OYmhkb09BSTNFL0tmWE1TVm5pWUhUMHJjU3Y4?=
 =?utf-8?B?NVpNTVZLaGxVYlVBbzArYjhSeUdPODR3NmtmQTdIYndpTlFyRjBld05tN3d5?=
 =?utf-8?B?dEJNOHlteEtWTUNKYjJJdWo0WFJibVgwOUJGQXN0cVY0VmEwNERYOTVGL1Bl?=
 =?utf-8?B?d1E1dTBIY2dYOFpiZ3owL2p4NTJhVFAyL1BzU0pza0loZ1ZJY214NHA2ZWh3?=
 =?utf-8?B?dld3dHVoTUoxVjc1eEhCeVZWQ2E1WXQrLzJQVnpLTGNHTVVhTUxka3VwTTlM?=
 =?utf-8?B?dXdwMTUzRkpydkhrS3JrTityamdmRmtSWE5zV2xxWUhYbXIvNlZEd3BzS1ZP?=
 =?utf-8?B?UGp4dVlUalRjVWFlWGdkVmU2L0x6eVBtQlZ4NHEwZHJRMW9Jamk1dlN1YW80?=
 =?utf-8?B?cWc3Njg2clVhY3VHVWk3UDJxZkU4TEhZbS9Vd3hMR0dQbkdkQXYwZWpkbVo3?=
 =?utf-8?B?cGY0Vmk0NllTR2pIUGVTSnhYUVQ4cVZVOW8zTURlUUlSRmMvMjdKdnQvODJt?=
 =?utf-8?B?R3A4V3JMazFEQy9LVWJSOGdSNmNSV3dKL1Z2WHk5UkFjZ3B6OTdMTHVhckwx?=
 =?utf-8?B?U3BLMWZjR1E1MVVYaFp5MjVuWWRoQVhqUVRRRzZhSVY2V0dRckphOXg0UDRT?=
 =?utf-8?B?QStxWEJpK0dnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Szc1TzdiSFY5a3pmOG9KNEZYYS9nOVI4SUtRalhxaGl1RC9xamg5MGowbC9Z?=
 =?utf-8?B?VG9UTlg3UkxBdGxWTmtEYWVmTDI1L05SRWJrK2lIenRXSjdFd2FCVzJDSmxa?=
 =?utf-8?B?Z2dsSDBEVXBIemhrRU9TN25ZalRLMmZxd3daamU4ZzlSd0JyalFyQ0lyZHJU?=
 =?utf-8?B?TEZSSkdZRnJNNnRmeG02Qnp2YUNrZmZHQXhSVHJOcGRIeFVaMU1wRWJ4MHVQ?=
 =?utf-8?B?VDdkNEg0b0hZTytHUEhsbXEzVlgzVFBhbWh4eDZIcUZxU2tjNlZZTFdGZGJB?=
 =?utf-8?B?bk1pMlVrazNTalhTNk9RQlNoS1c5SUs2dndDUG5FZ2ZuZkxBYXRpenBWTU11?=
 =?utf-8?B?MkNXeUo2MEhka1pDOTYvZXF3QlRUT2RpWGE4N3grM0E0QUdFS3IxMng4dWJT?=
 =?utf-8?B?SCsrRUFHTDVFMzRrRlRXUEdVWkR0bHgrMTZiN1VwTGg4bzl0UTZqc1BERFZM?=
 =?utf-8?B?U2NCSWFBM3R0c3J5VllQdCtaRDI3cXB6UjM2SW8wSWE0SUxibXFIbGhaZEFI?=
 =?utf-8?B?OHRya1p5SXlTTEpiSDkwMlowVkVBOUhSNjZIWFR5K3NWcmV4ZFVVZ2dRcWlG?=
 =?utf-8?B?bWlRaUhBMEN4S1d1QmlqZU9OTXBOSkJNQ0JVUUJQaWUrcDl6QlNzdXNoUHhi?=
 =?utf-8?B?SkJ1a2t3eTArWEtvS3dML3ZWa0NSZ3FyamdkSkJ6dkxVbkpiODlMRTdRRkdo?=
 =?utf-8?B?blF3SWdLZjQzRjR2dEpqRnRzV2tGbGRMUWtQZGZwTmxuNUtyN0l2U3RKV3Bx?=
 =?utf-8?B?cVJ6OHBRSHprTzhJKzFHRU1QWHl0ZGtiUHgwYzlWeldZQWtyNGptUlhseVpH?=
 =?utf-8?B?OVl4eDVjc3RRNEdQM2dIR0xDcmxVZml3RU9WZWkvT2xzcnU0M1MxYlNkUGlC?=
 =?utf-8?B?UjBBUUpObVVTMWMyd0VVeDkwU1VrdXdWQWxFSFRMeW5FS2F0dWplUmN1aFpz?=
 =?utf-8?B?bndhcGxJcEV4ZXFCYzgrWEtXQUJZT1ZpMUVmUTFRVzZLaUl6cmV6ZmlpVDZO?=
 =?utf-8?B?Zm9PSE1SZEZVNGQzUmIwSjE5OXg5ZGVEQjI5b0t0U01ZWjJzMFU0WWx2dFJN?=
 =?utf-8?B?NlAwVzltWUFDb2M2UnY1eGZGWWZwR2haRlArbHVPNVJHYkVSbEE2Yy9XeGtF?=
 =?utf-8?B?MytIeUhiOEpyMGVMZ2dGbUZJY2Rna1pOSzJ1bHI4bllGeEd4RHNCRjV1WWxh?=
 =?utf-8?B?Q3dHRGpvaDNVUVd6ZUZUZXJMU0h4SkpMMnF4YXhhSVBmMnkwc1N4SFp5Z1Y1?=
 =?utf-8?B?aEt5c1ZLeXNOZDRINGhPQ0VDam9tazNYbHpibENra2RYckYyWW9LV25xT1U3?=
 =?utf-8?B?WkhQSWErQ3U5aC80ekpKQmkxckE1ZDJ5R3hJcVljS3htRGlWT1VQZ1BPeDRC?=
 =?utf-8?B?RTA2V2tINGt1RHlHZWNsTnFBa24zcTJhNUkxVWViQnUvL0ttTUhrWkhLYytD?=
 =?utf-8?B?MVdLUXBPS1lWaWsreEp6SkJySGZTNERxYXpVVEo2UGdjTUV2bFR4VlhHNzZl?=
 =?utf-8?B?dmU2QWMxQUdCaDNHRVU2Sms5VDc4WmhNeFV4UXI4cjBhd1l3TlF5V3VUaU5k?=
 =?utf-8?B?akUyVTJnNVZkV1YrT2o3WWlsK25HV2VrdDV0N3FxUWpqdlJaZThPVlZyMnNh?=
 =?utf-8?B?aGRZYzhRZ01ZZEVvdVB1L29NRnlvZ0JsZVkrRjFYVjRSc3pNTExZOVhRb3da?=
 =?utf-8?B?TElhN2dFK09sQmx6Q3JvaHd6K0JVbjZvRnIzRC9HSHJtT0MxT0pjT3E2SC9h?=
 =?utf-8?B?MUlzYmRVQUJtOTk3SGgrZzNJVFJabStISk4wN21Zdkk4Rk5sU3NRRmtCeWZn?=
 =?utf-8?B?SU1HUFJmU3BoRDM4eVMzaXB3WUJ5ejhjbi9kR2hpc0dQdUlYT3JJblFuOFFt?=
 =?utf-8?B?SmZSbTgvMW9vOFI2SVAybWo2dC9sV281SDhMTk5NZkxxVDFBeHpJcFh2U25p?=
 =?utf-8?B?YkxKOXR2LzMyT1ZrVkVVT25JNXZ5UmlyV0N5b21WYUJpTXJEVmpoanFScGpT?=
 =?utf-8?B?S2ZqU0gyaWNDS2MzcVE3SkVWbmRWOXFKaERvUERRQmtsTEtudjRRTUgxdHVi?=
 =?utf-8?B?UXpqenlZUFJwUzBlL2Rna3lDeDgxb1RHZTkzbmdQM3B6ZTlOdVdPcWJSNFRR?=
 =?utf-8?B?Szhmd3E1bzh0Rk5rTzBLRXZhS25LQnhYMmU3N3orY0Z3L2xWUUxQU3huQjdm?=
 =?utf-8?Q?KfOoEiPa1fyyNLTN7+i7RxZgStRaO5FTqmo1REC09jay?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88eb4667-7782-4df7-5573-08ddefaa1f9d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 14:06:51.2039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XgrPJxjKfvh7a5w6DHtz3XFHKgH3ulkp1wJcqybMDRDLB4+m1oNCQEsiHpBFMnMODVvRA6vXb5SUINqvl08O7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7978
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

We want to store the GSP and SEC2 falcon instances inside the `Gpu`
structure, but doing so require these types to implement `Send` for
`pci::Driver` to remain implementable on `NovaCore`, which embeds `Gpu`.

All implementors of `FalconEngine` and `FalconHal` satisfy the
requirements of `Send`, and this traits also already required `Sync`, so
this a minor tweak.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs     | 2 +-
 drivers/gpu/nova-core/falcon/hal.rs | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 2dbcdf26697beb7e52083675fc9ea62a6167fef8..b16207e7242fe1ac26b8552575b8b4e52f34cf6a 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -286,7 +286,7 @@ fn from(value: bool) -> Self {
 /// Each engine provides one base for `PFALCON` and `PFALCON2` registers. The `ID` constant is used
 /// to identify a given Falcon instance with register I/O methods.
 pub(crate) trait FalconEngine:
-    Sync + RegisterBase<PFalconBase> + RegisterBase<PFalcon2Base> + Sized
+    Send + Sync + RegisterBase<PFalconBase> + RegisterBase<PFalcon2Base> + Sized
 {
     /// Singleton of the engine, used to identify it with register I/O methods.
     const ID: Self;
diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index b233bc365882f9add9b6eab33b8d462d7913df37..bba28845561795914e9a4dba277d72bbac0b37dd 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -13,7 +13,7 @@
 /// Implements chipset-specific low-level operations. The trait is generic against [`FalconEngine`]
 /// so its `BASE` parameter can be used in order to avoid runtime bound checks when accessing
 /// registers.
-pub(crate) trait FalconHal<E: FalconEngine>: Sync {
+pub(crate) trait FalconHal<E: FalconEngine>: Send + Sync {
     /// Activates the Falcon core if the engine is a risvc/falcon dual engine.
     fn select_core(&self, _falcon: &Falcon<E>, _bar: &Bar0) -> Result {
         Ok(())

-- 
2.51.0

