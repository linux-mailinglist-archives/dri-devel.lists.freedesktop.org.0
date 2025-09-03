Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 959CAB41FE6
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 14:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C631810E051;
	Wed,  3 Sep 2025 12:51:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZFFajYG1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF02210E051;
 Wed,  3 Sep 2025 12:51:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cFbJSXR0xYkkcdJF0GvUAmI2UlescLSEhL2s6BvfWpbeyYRR6A9BeirSkBjQcTN2MxWNzevpU8sk0Tht8akdmjKUEqjaZNUE8XqKCAOyv9t+5cDiL3avmXR7WKiplbDUoDRCB4whMyqKDurAwGJ4r/GfTcmT9sVVjlhGu1bHQ7+QTOT79x6uNVWMEWZ5NPEvrLeDs4p8iySbDmKqq/MFaYq8UnDdZLYqoBS2EP7JFdkwn50UNMsP/hqupyVduGWO65Ygc1tt5bDmEs53fMY1sFkbELQPEAWaVfVsAzNirjpIZpfV+4SDBeYc4AGYEEjTQ1D5DpsR3ARx+y6MJSCQJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgsbHsheFR2iXaCJ5x2JXa25Fh1PQjR1HUEuo8pwUPc=;
 b=fmdDmfnZDIcw3XTFbW3aV5p1Np31pN6AIeE0Mo5TyhUrZETJleQhXxMcCyzKCv+TKxC4fruYi/c0gADmGrgFfxML0PjVLeRXDbzni2OkWl5XQ13Nzmgf+ATjod7eRweMPDM+nxfbtFVQmYTdZmxFjgTWG+F0T5rVJtKqSjcqwp4YkQPoq6sPFuOX7F8ZSkBzyBb+mO0suiEnpXmpeg3CwWUHIvh5HBh6DhExpVQ3m8ZgliHNboR9R+t2Hdg+q+KqZymV03pwu7kB8bXwQCRxR1PECuQQwkZQKAdesE2A5h3BIHVwaBhbXDrS+Q1w/dh8xZSBlhrJNIV/iHPG9jTpgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgsbHsheFR2iXaCJ5x2JXa25Fh1PQjR1HUEuo8pwUPc=;
 b=ZFFajYG166rFQ5YBex0LaqRQpXTFqK7sWCDhVzgel3jTVkY+wODdAk45B1zdtvCFoeEDArglBheH2I9pjt8goJLt+GE2XGdkD1G/qcXiVFv+QesZuPMBzukhCHEqduFS5fgFUa6BhMs7x5uf6QhT1BicDlADmz+dsdYdgcQtk85Q5N+Bs6bAcX5HzYf1OXGUhsvTamSAB/ZyC8ONqGgLP0GBKzS2iXvBiXLoxwwQ5OCqEj/F8BcPCVMCMwis6/ozJnCB70nOLbQm4syHPgiRc3HRLizR/TjLVket8mbKeGubPHS4JGlbiC3QG5L6HXEDQQEFHeoeh9veoWNYaBHHkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6418.namprd12.prod.outlook.com (2603:10b6:510:1fe::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 12:51:23 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.027; Wed, 3 Sep 2025
 12:51:23 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Sep 2025 21:51:20 +0900
Message-Id: <DCJ6G4DJ1JSY.1U6II6SNMZAZQ@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alistair Popple" <apopple@nvidia.com>
Cc: <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 03/10] gpu: nova-core: gsp: Create wpr metadata
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250827082015.959430-1-apopple@nvidia.com>
 <20250827082015.959430-4-apopple@nvidia.com>
 <DCHAPJRPKSSA.37QLQGAVCERCZ@nvidia.com>
 <iyjecyybwyilem2ituw6esmufid72cximthc5qo2fgdpzz4fko@cb6n2vcrptb5>
In-Reply-To: <iyjecyybwyilem2ituw6esmufid72cximthc5qo2fgdpzz4fko@cb6n2vcrptb5>
X-ClientProxiedBy: TYCP286CA0287.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6418:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cc43ad7-f127-4cfb-fddf-08ddeae89659
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|10070799003|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3llR2JvYlQ0UExaN2RraGRCQnZsSFNWTkpHc3N6NnhQeTFRVHZtWE1Nd21H?=
 =?utf-8?B?WHFKNCtMbzVnRnJ3QjVWZnBpalNKSEhTU3Zmd0V2WllEODhzWnUydWc1RWNB?=
 =?utf-8?B?TVIyN0E0aHdpSDRaaXV6c1Q1UGFJNjl4QmdYeDFTRENwM0VBVVNQdFpFa3E2?=
 =?utf-8?B?M1dyVmJaNjNYWVlIR1JsOXQ3RVV1K29JRzFaVFFDQlkySG5jSmZmaFhuL0Qw?=
 =?utf-8?B?ck9wUjIzSDZNUEF6RGhCZVNhOWhmcXJFZnV3aFhjUTNua3RCc3Yza0ZpNTdI?=
 =?utf-8?B?WkEra1RGeWExa29nVlU0WUtBTlBNdDFTSUJJdDJhdGJhTS9MVVpuZTBYUHYx?=
 =?utf-8?B?dThxWDZ5d0FScGFVYTUwQ25GeFpKVnJvSVFZQWc4ZzZxK0wxVmIrclk3N3RT?=
 =?utf-8?B?T04yVGlBRENqenJpeEpET2dINmRNWHFyQmRFZ2tNRStZVHlJU2hFR2lEY2Jq?=
 =?utf-8?B?WHpkQU1HQUo5aWhrMVJGTkZMVitBSXFNRXBHVWNGTGRhTWp2VEZIdWpQZzVv?=
 =?utf-8?B?UURCMUdLZ1hzSVdmSHB2L1Z4SGpGbVFWbXlSUFJqNUQ1RVNLd051b1g0TVg1?=
 =?utf-8?B?bWxyYWYzck9DQm5zOCtJb3ZOaGFWVVFHaDAzS2VyVndwWnlUc29Fd0tTalp3?=
 =?utf-8?B?VHBJcmE5R3dZVGtIZTVpUitzTURyV2x0eFYyM0J0UW13MXdKMUFyM0VCa2ta?=
 =?utf-8?B?Y29YRU9lTVdyUm4rbnFBTmEwaTVISzRIQVpuUm5ENlNhVzd3YlJ0N0dlNVhm?=
 =?utf-8?B?RGh2RDYwN1pybzIrT2RIUG5ROGVTNllINFlxRVdJNW5TNEdmOGNnRmltY05v?=
 =?utf-8?B?d1ZVeUY1M0gwZ3JaSHE0WWNXSFhkOXVydTZneUJvUVlmaG5vTHkvNlhCeUE1?=
 =?utf-8?B?Zk96aFZCdzhaSnFOUlFESWNjcUNic3pnVUpJSEt3dXlLVU01T0txMDBqTEVz?=
 =?utf-8?B?SURPZ3pPKzNocGozaGhKRGlOVEV6dFVuTnoyeXBvK2V2U1pPNGxNeUVodXpr?=
 =?utf-8?B?Yys2aktzTHY5TEVKdzl0aHoyQ2kxcDlvaFlxY09nS24wR1pneVk1ZWk1bm9n?=
 =?utf-8?B?dU41d3Z5SVBDWExOWVBFZEFwcGp6NFp3d0Q3OE9SaTZQTmlTcFVCMzJkdENr?=
 =?utf-8?B?L0ZPbEIrNlNoNWxpaEM5TDZRUktOcW40SGQ5WGYzbTVZWUpMTFFmNVRTNmwr?=
 =?utf-8?B?UWlNUTZlVkRMWGNsNGNBazNPaUhBRGNMZnFqcmtjYjM1Tm1KZElldDVhQnk3?=
 =?utf-8?B?d25DWDc1emhoKzYxZDdnb1JBWmJpVXNYdWt0bVIzUlVOZmp1Ti9yVmlLTWx0?=
 =?utf-8?B?Ym0yYnpXcGRoVCtldFd1ZmxIU1NYQzdUY0U4Wm5PeWo5ZnFXY1QrY2ZXZ01J?=
 =?utf-8?B?VXE4Wm1jK1NzOFFLWWdoNTQwQlZUTnE4cWU5VlJxeGdpNkVoMWdoRXEvRDhU?=
 =?utf-8?B?RXRQQmF5RWF2WkVCaGg2akdwd2NoTzAyWFZPUUJ3RnRRNWlwVG9mbllEelVi?=
 =?utf-8?B?V1B2U0hzamhtSE9VV0pFREVzbVhKUU53QlN6MGlBUjVNVXNhMXBDazFzdXda?=
 =?utf-8?B?QjNHcDFrdDd1ajJxWUtoTCtQTGJGWGdzelFnRGMvUTkrOTlQeVVpTkRmdXdV?=
 =?utf-8?B?ekZsWTZjMmZ6c3JPcENibGUzRitGbWxUMTN6ZkFPMENhNUhYZnV6WGVudUd3?=
 =?utf-8?B?bzhTMXgxSU4rSVRDYXlnYjNRanhUQnJMc1NtcWVOOGZaZER2WGM3SlE0dHpx?=
 =?utf-8?B?NlIrOW9FRGJ6bVlydEdHRithSzJnaisvbXhVeWFVUHFPWENlcHJabmtzSHF2?=
 =?utf-8?B?OGRKNjFYbldYTmhEUGl0VWxFb1lYUlJVZVRUSDQ2ZzgxTnBqVnlmeTZJcXR2?=
 =?utf-8?B?UmV1UERTUnBueWlHeHh2cDR3L1ZTNDZGYU5SeHpIMzQzTXZ3b1RyUzBhRnVK?=
 =?utf-8?Q?b0rhTfhf7xQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(10070799003)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTRSVGg0YkluK0xMSm5qK3hSWmFqdjNoTlJDdjZOZE1lVGoxUkxiTzBYMHdP?=
 =?utf-8?B?Z2lSWXlaeUJFZ1I5anNSUnFxdWFsTWp1ZWJrWlFGbDFOMTFXZGtJMTBsb2Jh?=
 =?utf-8?B?OHowaEFOMmwyMjFqYnd5WGRXYXJSQzZIcWEwU05RLzd2OUlqQVp0aTdad1JE?=
 =?utf-8?B?NVY3a2hnc3JiK043YXZkZnNxdXZ0bzZqdlFZbGdIeFNHRGZXYWtsN3RyUE1i?=
 =?utf-8?B?UHZ5SnJoSTQ0TkRMODhLZFFrb0xRd0hyTEZNWVhTM2I0WFJoUThYSkNOS1VF?=
 =?utf-8?B?cUYwUVBPbDJydnN5cWlXNTdFcW9FMy85Mk1reGZadWdJSitJSlJDcWZKRHgv?=
 =?utf-8?B?SVBVYjJ0bDVuVFRoT1B0S2k2RjhNajY5Q1FkWjhDZ1V0K056VUtFeitlOHZ2?=
 =?utf-8?B?TlU0RFBDY2N5QlRON25lQ1Fwcyt3elgxQXAzb1FDcXZWbUFQb1Q3cDNIdDFY?=
 =?utf-8?B?SDA1U2hYcnhoRWlvRkEwKy9aQ1VYVVQyOUx0OUJVSGpwcm1BSFdqd3g3Zmpk?=
 =?utf-8?B?Vm9KYllVVGNZTVVnL3dIVDY2RnpkSHEwL25kL3ZjS2w4U2grK0Zha2tzMnR4?=
 =?utf-8?B?SmxJQW9XQTliZW5rMDJKS3ArSUpWNE5hNFgzWGV0RTRaRU5YSTVXNXVkSDFr?=
 =?utf-8?B?QXMwZDQrY1lLcUFkM0w1TmhTMW52b3F2VUxSNE9tZGlqcTEvK0U2RGx5SWxL?=
 =?utf-8?B?dHo4eVNvWTdURU9SNkRXNUdrMVFuS04vRFFxbnBEcTRJMUJmaU54NFBPNEZa?=
 =?utf-8?B?RGE1MG15d2FFdmN2Y3lMNWYvRnZTZnRHVkl1SXphQnRsa0hwa2lLMkNXMzMx?=
 =?utf-8?B?NHJqVnFvYXpGZm1RMFFQZFVRREMzQWF0ZldvMEhZaDhoUmpueDc0OEU1ZWQz?=
 =?utf-8?B?cFhiV0JGQTF3MHRWWHlyNXllTHpnaXVPWm9sNTlnZUZqYzE4V1M3cDNDZDRH?=
 =?utf-8?B?WEZRazZyaU0yRnZPWnJXL0lkMmYxVUVUNHhpSzc5bXVwWk1Ta3dBVGphYVVJ?=
 =?utf-8?B?d0NxTGFyMzJ4S3I5NkZhRlJHcjB0eExHS1kxREkvSW8zNWJhcmhOd2xNRnRQ?=
 =?utf-8?B?K29melVWWDJUOXZMT3JBeHVXenlObGhaUk8zRUE3SVRJeis3SXcxdGYra1pY?=
 =?utf-8?B?OWppUnlzREdZYm93Y1prektidXk2ZkJFU1ZvL01jR2hnMTRFSFgyWVlUWGRX?=
 =?utf-8?B?SnUrVFVXTkZ5b24wTGxDVVc2VDhBOW1PZXV5YnNjSkE0ZVlHdFNVMFZXTWNv?=
 =?utf-8?B?emVEcWhxdjhUL1Z1QXdDeHM5UnUyMUZ0dGprY0tmQklUaDNsTTlkUTdwam5m?=
 =?utf-8?B?cU9kWXNNWGx4bm9odklVdXJOK1JTRWpSZ2dhRlF6cEdDN1pzdktwRXdtMTNM?=
 =?utf-8?B?QmpMc0trMFowQnphbE9sb0hyTmlsZzM0WXZPU1ZTYi9uMnhNUlpjM1d3eG1J?=
 =?utf-8?B?aHZ6T0liUENZU0xtVlNTVG5NYitUUUJ0TmhrNnZpRmQvaVRvcTZIOHB4cDNn?=
 =?utf-8?B?ZVVoOExtS0J4Zlllcy83SDdMM3I5QVpwZjNscEZ3MEpaVlZaSkg4d1kvTVYy?=
 =?utf-8?B?MVJaL2M2d0dUUit4QW1VaWRuZm15TW1FMWhrc1RPS3FldVIrQmgweDNSR25D?=
 =?utf-8?B?eFg1WDVuY0EycE1FTVplWUdGbXhzVjdRWVU1QW5LNkIrMHBhWEdRU1djenNi?=
 =?utf-8?B?SkQ1QkNaaklEQ2FKd0xLOXNCUjJ0dTVZQXRVcjNwUkZXOTF5ME9JK29aejBr?=
 =?utf-8?B?MzdyYmxNM2k0OTRWSXJ3MU5qY0cyR1d1NUNBK3lBQ1AvZlJ0eGIxdHVJZlZV?=
 =?utf-8?B?SEJCS0ZwR2JRZGJmMkVpYjE4MlVTZXZZb0M2bk1WS1QzKytLdnVVMDZiSmsz?=
 =?utf-8?B?Y254VVc0bHFZWFJTSGFHSVhtZzNnY1NiTmplNTRYekZRYUQzTkgreVNLdTQ0?=
 =?utf-8?B?MkFzUzJFa2wxdVRKbzc2Z1NNQ2RkV2NHMWJzUE1JaGlvdytORzJoazh1dHIx?=
 =?utf-8?B?MFF2eUhVOGc4bTFING95eEJRUnlzZVZpMXQ5eWNyVzc4T0Z0dGxhcE1acmFX?=
 =?utf-8?B?YU0xSG9MU3lESlZpYlRxTjlhUjlPdFNrUlNLa3VRUlNGaFpCenVwNHRmdDRs?=
 =?utf-8?B?R2F5cml0UEo2ZFdqVXFDeVg0eWRweC9XVVdlMk5IK1EzV1RsUHdaUDJOWEVk?=
 =?utf-8?Q?jmgpXl7L5226limQADLgf+6JDRU+P0mc/WGSeA9uqZyH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cc43ad7-f127-4cfb-fddf-08ddeae89659
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 12:51:23.4179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zXywmIM3J2f+Sf3WPcKxAPJYN/FJkpKz0M7WkOzDWCDlzpQp/Efp3Vlw/rsGeM4ByaLPFaJ6qXjZ0PTIAcGrmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6418
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

On Wed Sep 3, 2025 at 5:57 PM JST, Alistair Popple wrote:
<snip>
>> I've discussed the bindings abstractions with Danilo last week. We
>> agreed that no layout information should ever escape the `nvfw` module.
>> I.e. the fields of `GspFwWprMeta` should not even be visible here.
>>=20
>> Instead, `GspFwWprMeta` should be wrapped privately into another
>> structure inside `nvfw`:
>>=20
>>   /// Structure passed to the GSP bootloader, containing the framebuffer=
 layout as well as the DMA
>>   /// addresses of the GSP bootloader and firmware.
>>   #[repr(transparent)]
>>   pub(crate) struct GspFwWprMeta(r570_144::GspFwWprMeta);
>
> I'm a little bit unsure what the advantage of this is? Admittedly I'm not=
 sure
> I've seen the discussion from last week so I may have missed something bu=
t it's
> not obvious how creating another layer of abstraction is better. How woul=
d it
> help contain any layout changes to nvfw? Supporting any new struct fields=
 for
> example would almost certainly still require code changes outside nvfw.

It is not as much creating a new abstraction layer as it is controlling
where it resides - nicely contained in `nvfw` or all over the place.
This is particularly relevant if we consider that binding abstractions
are more likely to require `unsafe` code, that we will then be able to
confine to the `nvfw` module. As I got reminded in my own series, we
don't want `unsafe` code in regular driver modules.

Even if a new field is added to `GspFwWprMeta`, there is a good chance
that the parameters of its current constructor will cover what we need
to initialize it, so the calling code outside of `nvfw` won't need to
change. Of course we cannot guarantee this will be true all the time,
but it still covers us better than the alternative.

And then there is the question of if/when we need to support several
firmware versions. If we start having code in `gsp` that is specific to
a given firmware version, this is already a non-starter. Whereas having
all the abstractions in a single module leaves us in a better position
to use trait objects and virtual calls, or apply proc-macro magic.

>
> My thinking here was that the bindings (at least for GSP) probably want t=
o live
> in the Gsp crate/module, and the rest of the driver would be isolated fro=
m Gsp
> changes by the public API provided by the Gsp crate/module rather than tr=
ying to
> do that at the binding level. For example the get_gsp_info() command impl=
emented
> in [1] provides a separate public struct representing what the rest of th=
e
> driver needs, thus ensuring the implementation specific details of Gsp (s=
uch as
> struct layout) do not leak into the wider nova-core driver.
>
>> All its implementations should also be there:
>>=20
>>   // SAFETY: Padding is explicit and will not contain uninitialized data=
.
>>   unsafe impl AsBytes for GspFwWprMeta {}
>>=20
>>   // SAFETY: This struct only contains integer types for which all bit p=
atterns
>>   // are valid.
>>   unsafe impl FromBytes for GspFwWprMeta {}
>
> Makes sense.
>
>> And lastly, this `new` method can also be moved into `nvfw`, as an impl
>> block for the wrapping `GspFwWprMeta` type. That way no layout detail
>> escapes that module, and it will be easier to adapt the code to
>> potential layout chances with new firmware versions.
>>=20
>> (note that my series is the one carelessly re-exporting `GspFwWprMeta`
>> as-is - I'll fix that too in v3)
>>=20
>> The same applies to `LibosMemoryRegionInitArgument` of the previous
>> patch, and other types introduced in subsequent patches. Usually there
>> is little more work to do than moving the implentations into `nvfw` as
>> everything is already abstracted correctly - just not where we
>> eventually want it.
>
> This is where I get a little bit uncomfortable - this doesn't feel right =
to me.
> It seems to me moving all these implementations to the bindings would jus=
t end
> up with a significant amount of Gsp code in nvfw.rs rather than in the pl=
aces
> that actually use it, making nvfw.rs large and unwieldy and the code more
> distributed and harder to follow.

If we want to split things more logically, I think it's perfectly fine
to have e.g. a `nvfw/gsp` module that contains all the GSP abstractions,
another one for the sequencer, etc. As long as all the version-specific
bits are contained below `nvfw`.

>
> And it's all tightly coupled anyway - for example the Gsp boot arguments =
require some
> command queue offsets which are all pretty specific to the Gsp implementa=
tion.
> Ie. we can't define some nice public API in the Gsp crate for "getting ar=
guments
> required for booting Gsp" without that just being "here is a struct conta=
ining
> all the fields that must be packed into the Gsp arguments for this versio=
n",
> which at that point may as well just be the actual struct itself right?

Which particular structure are you refering to?
