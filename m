Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0FEC42064
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 00:44:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C42BE10EBA0;
	Fri,  7 Nov 2025 23:44:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JeaaptaB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010018.outbound.protection.outlook.com
 [40.93.198.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9EFC10EB9E;
 Fri,  7 Nov 2025 23:44:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SH8cXIktqwHG2NYFjInklBIbTI3s7JAV2pHfjlMwovU2D8XTnfYvGcu2uZR6+Rwq8TxOeuMiXxjfXofpDvQ1Z2jPCtQFzglnSkVFp2xIg6LqR0QDss8aRRMXwRhJukDXFgBu71NoxyWHY0GjwjCBokYI82AphlkNqLqvDjz5x2a9KWMMMJOWFxTTGZKK9oGZNYLuUsfWJds21EOFmHgdAN0ZByk+ZHInXNwXmCCRXqAyPjngW2Kj76r9a9TqjCyCJTy1F4kYrLuvRcMTyvYRTdKrFFNTCJP/nIPgunPbJqGbAfy8THfLaowFIrcnwme5ACRXZXyiNCcOwbEuOrtMIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TzKP2bowTXivYfSrPuJK4nxpWKJZYvCFlFkzercsdc4=;
 b=FlvvheO4ejVDjpt1cIe10KQlARnyZi07k0CsLZOl3ovF/2MLwo0T55YqL4iwwPoXBI0NjfHczqza2paPHYIOg2sB4C+2q3ICmZUnJW4bxnl5y28k6T/wNlunJHFbLy60NR64yEnBVDP1r0sHxAke+R11VImvyhwRUtw4+awQERGiR7Vq+xDqz23YwgJRZsY+bpwnNDASZZhX6nmv3YfL141vHRX2ZS7QAC8vDLJmWzPIg/aCynuNoF4HZ9DDmDT9E1Q/fXOG7oGpIREAiIDaByqziN37q3N25/iI6fPNpv+OtPWG4yeepOIu4XrD74p17Z2beN06sUGhKrs1hH4P1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TzKP2bowTXivYfSrPuJK4nxpWKJZYvCFlFkzercsdc4=;
 b=JeaaptaB025cepN3dfWLFoiTFN9T03vckZg8pV/GxyYeZBKkP0btdJ19bTLDOdOgrSnEa3FCV62pkFXlqi0ev8KT5s05gTntTSNG9eEcxjBaBh4+owQDmzq1kOD5Xd24k2yNHKhd1flFlPP71Udc8pE/b96m3ndJM5Yv+GRhuIqpaaRNjSOPLw5+RbgBZlfyV4Ang/a8nbd8WV7M6gMAsJOmKlFz+76riUiYk87HPVrRKOEzFyHEnVlDInDkoWj17laRO6xoD94ibSs/KFlPps4whx4/2KkN899HhruhYG2SHS2wtPAgW85ORTT8igqEwK/8YKs8xlOM7Xw6LfCPPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB7906.namprd12.prod.outlook.com (2603:10b6:510:26c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.9; Fri, 7 Nov
 2025 23:44:18 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 23:44:18 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 08 Nov 2025 08:43:17 +0900
Subject: [PATCH v8 16/16] bitfields RANGE doc - not great
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251108-gsp_boot-v8-16-70b762eedd50@nvidia.com>
References: <20251108-gsp_boot-v8-0-70b762eedd50@nvidia.com>
In-Reply-To: <20251108-gsp_boot-v8-0-70b762eedd50@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Alexandre Courbot <gnurou@gmail.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0208.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB7906:EE_
X-MS-Office365-Filtering-Correlation-Id: eb4f8024-8216-4490-ce79-08de1e579120
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzZKeGNDSFBnaXg4aFc3eXlhelhnSjdISHFwVm9TanJVZjlkRmtoSmRIUU0w?=
 =?utf-8?B?Mk5tN2dFZGdGQzg0a0F5VEJDaEtWZGRybVlIUWJLdnREQlNwbHY1aitIaE5C?=
 =?utf-8?B?MlpFa2lETjJiMHB1cWpFYWlUYWo1a0VoakdaWkZWV3Vod21NOU16K1g0Qllr?=
 =?utf-8?B?b1Z2bVpvbjB6SXk0elplVkRINkZIbWFqZ2c5VmNVTEJQT3E0TEJBUG9BakFX?=
 =?utf-8?B?SGtrU1o1OGxrMXZnQU5JY2U4RGlJNHAxeGh3dHVJUmNYMUVlaXhlaWdyY2tv?=
 =?utf-8?B?WEs4dlNjdHdNRnhSbFBoZ2tHNEpYWk9hUDJ6MU1ZQ0RuZFVPcEFtQTZJSjhY?=
 =?utf-8?B?QlRhOUQyaDlaWENSOWtVNEtHYjN2T2VXYitmSHBHR0ZKdHVuY2ZyNEZjUlJa?=
 =?utf-8?B?U2Zib3ZTcGtXYUIvZmtCbzlLaDFUckYycC9NbjVITW5PZllrejZCUUNHeXNo?=
 =?utf-8?B?ZU1MT3FTaDdFS3UwblBzZG05SjBkMVBEMWNOZTdwQjFBRVdQajk2V0NwUG8z?=
 =?utf-8?B?bkV5MU94KzVSRDVUYm90NDZrNjBrV3BoUE02TytyOVJuNy9aeTR0aTZwdWtP?=
 =?utf-8?B?RmhqMGNZbkN1T2o2a3ZYa0d6T3hpeU4vUFNGWEVCVUUxSW4yV09aN1FMdU9Q?=
 =?utf-8?B?UzhlQnYzSkEwalZyaVpnajBrTkRGM0pTTnhna2NrNmx3bmk1Y1RFV2NwaHUz?=
 =?utf-8?B?Z1BPOHBudUdTeTlXU2ljQVd2Z0xoNkxRYWFXZ0pJOTdBTXJNOE42b0hSRm5F?=
 =?utf-8?B?M2NiMzB2Sm84OHVNM2tqQVFxZytKem9kdElQSDcrTm9VNFFkNkpaREphc2JW?=
 =?utf-8?B?ekU3Qko3Uno2aHppYld0T1RpRVozMHVmRFZaQlJQb2Qzb1dlMlBVZTZOeVpC?=
 =?utf-8?B?VTNPaVpxdXlYUlBkRUdvVkt2ZWI1TSsvejNGVzdkc3cwYlJ5RFJQL1BUSUxB?=
 =?utf-8?B?STVzNVdBK0tqZ00ydEpnSkFiUVo1WE5Ba1M1cEo5RUtzZjNPZE8wVnlTV2Nw?=
 =?utf-8?B?UFQybXhpQjh0K3FPYVA0MUVkNnFiSU91MTZrNFZKNWgzWExmN1B1SzBrQldG?=
 =?utf-8?B?TVZ2Q1lpRUpPTWFPaUZOdVhsSVpSMm1SaXRqNzZMMTZ0dTYvSFVGbzkvRmRk?=
 =?utf-8?B?Wmp6UUIrbUdIMVQyK0dkbGsrdDkyTnpQNXVwWk9QZU16TE9XSUI2NkFoT0cw?=
 =?utf-8?B?ZFJvNzBrQ3FjSll1d3VGUW00MGFsNkZzL2xEa1RZN3QvQ0tCajdZRksvTkpQ?=
 =?utf-8?B?K1hmdnFBWWVCc2UrWHEyUjhWZXdValpnSmF0TnFDUnFQK2RmbXZSTFkySWxN?=
 =?utf-8?B?VXBrdUNOZHVWeUFkUVNYTjJNbFFiREVSVVUrQjRxZStsZkZEeWpveEZzVkcz?=
 =?utf-8?B?K2JRSWpXYWZEMWdMbVM4NW5vWnZSK25MSmpjYnFXSnNVRVk0b3liZVZFRmdE?=
 =?utf-8?B?ejhYNmdIN1dzZHdTdnBmdzBtb0d5dVV0QjdXNm1ZYUFvaFJSSjJ5NTBpYnJz?=
 =?utf-8?B?dDJYOEtPWXp1UTR6Y3VXb3pyYmtPejV6WGdWVzRzWUR1OWNwTlExTENqa2w4?=
 =?utf-8?B?U2RpRG5veGVuZEw3SklCS0ZCSWQ3NldYZzltRSt0ck5BS2VWcVU1WVEvR1Vv?=
 =?utf-8?B?MTlxandjTnpoRE1FUFRBY25Tc25WZm9hYWhVL1VUMnhEcUZ5ZXFHUUVJbVZT?=
 =?utf-8?B?WjVLWkY2Uk5wVnlub3dXbHFIc2hRWnc5NC9lTFJ6S3RPSUp5V1dVaU56dTkv?=
 =?utf-8?B?MVEwVXlZc29WQUw5TDhCalE3UG11Ymk5OUVwVkEzampXd0NPdXJQR2JLeGU0?=
 =?utf-8?B?YmRKb0M3dFF1TDQyU0UvS3ZtNjJ0cmtFMFNKeVFLQ3daYnpRbTRYM0lkdzVn?=
 =?utf-8?B?ZXduR2pFYlY3M1ppaGFuVVh0QVIvUjBMY0RabjE4NERiU2lxM0Z3cXpINkdU?=
 =?utf-8?B?MFNxVVVPM3VCR3ZiOVo4S1hwNFNqT3MxenZuaDY0ek9GbU1JR25tVW9pQWc0?=
 =?utf-8?Q?P6z/4S1B0HYNatGXCt6EUjzvl1wShQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWhNUVp1YzJEYVlodHNybmd3L3NWQjRoOHlNSWVoMHJhdGdRaDhqT1RFL3V1?=
 =?utf-8?B?VHZhNWVIOENabGxZQVZNWkhoWnA3VGN5YXdkU0RTOGdOSkQ2THZjc0tmMENJ?=
 =?utf-8?B?T3RqTVgzTjFDWVhvSXpaSUZyQXVWdnBXaW80V2hQaVg0dEI2NCs5VkRyZE5B?=
 =?utf-8?B?SWtRM1c3VDJ6Ylc1VU5NbWxiUjhqakpQc2ZrS3Bib0laYkE3dlRnSi9vSW5S?=
 =?utf-8?B?T2hmaEpMcTJVYkJnWXVZQ3dSUzIxVmIrSVpWVkxCME1EaXBLNW40VlhWcWtN?=
 =?utf-8?B?cUVYaFNNRG81dUZUdzBKZUcwT1p3NGVITVJWZWJ4ekowc3pvVDl2cm9oL2xY?=
 =?utf-8?B?TGI5U2hPVSswT1YvVjF2MHhKbkhHSDZ6K0lXSzhab0Y1L2RxS1BJQ1BEZTBX?=
 =?utf-8?B?NUJKT1FoYnlHV3F1cklTSzNmSzNKRkE4QXUzTEYrM0Nnb2hmY2xnT016MHFp?=
 =?utf-8?B?czlKbldQV0ovWVliVFZ4aXV3cjRzYUttUXZOVVo0VnZ5UjNOMFpwNVRvdXdt?=
 =?utf-8?B?RFZndlNzVVlxK05JKzdEYlRPK2xRNWUvN0lucEM1RVU3YzV0eEVCSENKWUNR?=
 =?utf-8?B?cWtXeGpqUVhhd1JNQnhvSFNmeWdyaDRRcTQrMGdCQis4dHB5ZFJUYVpocTFC?=
 =?utf-8?B?NytCMWZxNWozZndESWQrMCtUMnorVXZjdTBnYmxDMFpsbUtLNjdPZnZjaldN?=
 =?utf-8?B?OE9iQnUwanBQeHl3OTJDSEdUWlZzQTljNDJRL2s4WldLTHMwS3NsVDdEcURF?=
 =?utf-8?B?RDhZdkdOcTVTYUU1cFY1NXp1bTc3TDBSdkJWMUJab3pWWE1xVmdpMWNkazFE?=
 =?utf-8?B?eExRcFJhZnBXZE1pVjZ3Mm9uYTc5akZGcGtLRE43OGswZHFEUy8rY1NnTmpq?=
 =?utf-8?B?YzFoUUFtUzM5aE5BZFdBZy9ta2NLYnZPS0piOHlsbjN0VnRjV2QyQkx2Q1o0?=
 =?utf-8?B?OVN4VU4yb0NPRy94NHo4K21CanBFaGp2UXdNK1U4bnk2THBtdGRTK3NqVUNB?=
 =?utf-8?B?L3h1TVNROXowQWMxQ3JaVzVHSmZvTnUrMWo2RnRMbDVuNGhmV1hCcXNoUmpO?=
 =?utf-8?B?RFRoYTgvRVczaDYyNlBNMlJEN3F6bWVKOW5tTG8vWGJGOXI5QVo2TmE4Umts?=
 =?utf-8?B?WEhQR1N4SUw3UHNCL3hxdkZ2UDZMUVNLTHZ1dUhmSzJhVm9Ic1lCMGZ4MWl3?=
 =?utf-8?B?dEtMYjVmdUl4azlPbnlDV01iV1lRVG9NMDIxa3dQbmRsVTF2cWdsalNCOVdJ?=
 =?utf-8?B?UGF3enFnRUVLN3dXZm1MR1pKRlBrN0NYNUVibDNGcE5POHZhcGVERktacmtk?=
 =?utf-8?B?ck45ZXd1SDcyaTNzUG5Ba3gvS1ltRGxBZmtQVDVUdjZ1WldLUy8vUFpkdldV?=
 =?utf-8?B?MCswSW5nWFJKZ1N4NnJTMStRMHdMaGdEM09GZkNacjh4TkRHMHdGMndFaDJI?=
 =?utf-8?B?dWRRd2pmbVpLRDBPL0pRZjFhSXNrbHZnVFIvTmlrVUMrSWRsWXY2OXlFN2hu?=
 =?utf-8?B?S1NPYitFOU55YjlFSzB2TXY4dlJkMHRwY2NRZXVvSmJTak5PNkJ5RkJsZzBm?=
 =?utf-8?B?QTRUdEZFcGVSWGlBT1VjQjE4bTJ2WS9BcDg2RnlrcmV1ZmZYRU1tc3pkbkxQ?=
 =?utf-8?B?UHQ3d1A1Nm90ZXNVVFBEUTM2cFZZZFcrT1ZocW9YemRZM2ppUlBrUXZzRVdz?=
 =?utf-8?B?QUFzNUltK0xyWTFpL1N5eUlKTlF6VmdFY0FScHpFQkpsNk1vdFNTSHVhYXJJ?=
 =?utf-8?B?NmdBVDgzQXdUajQ1V2NFRFBDUjM5OWpnb0ZPVklVWFovRnZkM1QxOVQ4VVk5?=
 =?utf-8?B?Q3BWcFpPWnFoaUcxNUxYaWE2YU52bUtrcXVINXhIOGk5bnlRZmN4ckpTYzEv?=
 =?utf-8?B?ZUZuNnlmQ3djRXcrMWwzOWVzbm9Ua1haTk9IVitVY0htVjNsaHhFU2h2WFI3?=
 =?utf-8?B?TEFqeERWTUU5Si9KbllhTnRtK3hGWnZiVjRKTzI1d2RacWk4YUZzSlpZbDhh?=
 =?utf-8?B?bFBTV0g4dTJXV29FdHhHazI3ZENIYWxxVkZTdEJQMnFtaVVaQWUzRXNlNk5B?=
 =?utf-8?B?Y2JFVXlHd0NKYk1oY0RYYjBNMkgwU0xyZk1nU0wrL0FNZkJsaGNhbFZnOGQv?=
 =?utf-8?B?bjAwWHYxRDhiRWhPMXRsSTJTMms4Q214cEZWdDJaa3BoUythN2kxUGVBckxi?=
 =?utf-8?Q?aK28q8DbzHhoplFENgDaU8gtIC2E8qzcyFMlbReXdmbs?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb4f8024-8216-4490-ce79-08de1e579120
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 23:44:18.0159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gEnQgdd+aOOU6yTvACBnH5X+tG0+1MurNp8JsFKFqber+qKPYC9bfQHDYq4VVUdvsmI1O4W3+jIIzPQAPPg5RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7906
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

From: Alexandre Courbot <gnurou@gmail.com>

---
 drivers/gpu/nova-core/bitfield.rs | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/bitfield.rs b/drivers/gpu/nova-core/bitfield.rs
index 16e143658c51..90c714ec08ac 100644
--- a/drivers/gpu/nova-core/bitfield.rs
+++ b/drivers/gpu/nova-core/bitfield.rs
@@ -249,7 +249,17 @@ impl $name {
             { $process:expr } $prim_type:tt $to_type:ty => $res_type:ty $(, $comment:literal)?;
     ) => {
         ::kernel::macros::paste!(
+        // #[doc=::core::concat!(
+        //     "Inclusive range of the bits covered by the `",
+        //     ::core::stringify!($name),
+        //     "` field."
+        // )]
+        #[doc="Inclusive range of "]
+        #[doc=::core::stringify!($name)]
+        #[doc="foo"]
         const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
+
+        /// Mask of the bits making up this field.
         const [<$field:upper _MASK>]: $storage = {
             // Generate mask for shifting
             match ::core::mem::size_of::<$storage>() {
@@ -260,11 +270,13 @@ impl $name {
                 _ => ::kernel::build_error!("Unsupported storage type size")
             }
         };
+
+        /// Shift to apply to a value to align it with the start of this field.
         const [<$field:upper _SHIFT>]: u32 = $lo;
         );
 
         $(
-        #[doc="Returns the value of this field:"]
+        /// Returns the value of this field:
         #[doc=$comment]
         )?
         #[inline(always)]
@@ -280,7 +292,7 @@ impl $name {
 
         ::kernel::macros::paste!(
         $(
-        #[doc="Sets the value of this field:"]
+        /// Sets the value of this field:
         #[doc=$comment]
         )?
         #[inline(always)]

-- 
2.51.2

