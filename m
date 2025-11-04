Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEF1C313F2
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 14:34:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB9E10E27B;
	Tue,  4 Nov 2025 13:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IrA2lpWy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011015.outbound.protection.outlook.com [52.101.62.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0EE10E26D;
 Tue,  4 Nov 2025 13:34:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PQqUYnGxV/7QIIVIxc4CbBfaxOYVdfTUU21hoSIC0rZuax8Xk5RzxgHDHrNZAeDR3vDEpFHx4AmsVtd+X21MIrKrMI9y7gABtm4ZkjOE7nOodudUlUb/uIc3LWaHOajgi2aGwTvg2ObRxFkiXBSDCIoBzi93mRL2q+efNLDzI1HaupRXRq4pCU0I9kL9MQlEsw0lNkApEX6e5L8GLWb778CNUkqUA/OcbKYDaOq/gHoJmtCVIoL+2VfrfeZPz7ZYBpPPsJlxl+/qKX/+TBo2j2p6V3aWtXL/Nz3cejGC8KPykPOdX6rrgp+5hKaCWroD0r/lafzoeD5KYu1f05lAWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uYlbGD4Xy+FmR4ndKhuPoDl3eeB1Xni2CF0Eh4YHYxc=;
 b=b1G5hBbKc1oy+Bw3VCD3y/vlgHhWLlnkCUk8SsXa+sEfiQMS/wvBG6TXsjEW0buWoBxAU1I4MGZg9uh9HDTyt1phrTZwYfRA49TJbtNfcjABk8sH3/t96ydkqrjlcozPPn7JhYq58Fn6YjhyQ8FtFBpdDMyMdZmYE27MayO9zSK8JXpYAsztfR7i53crO/UanQxO/yjakz/nr+QTFIkTolgaSyJJOqdpLNLBwUf+/wQpAWI5iIjRiEcNs8CzPpuapzFfITBREl2+aG1AY4pHLkE4XwX7WipiudX9SbmQ7aze+RcPpo2yMzpqtjvLZJmSKavQijZAGWTTlLBKdxiyHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uYlbGD4Xy+FmR4ndKhuPoDl3eeB1Xni2CF0Eh4YHYxc=;
 b=IrA2lpWyF2g3tiw/AhEh85SzPQWpmSuI4Pvod33Ox04AIN9c5gSV/3CXfUYcewXtGuhOmSKqoki179utpeBpY0T26VFyyyetX9FBNiMt6KLEvF8FC95r8g4bUKclD+j2EKEEwaD+TP0iA3mglErSupjaYIBFhITs2PGDT2v+gFmKkCt1wc4uXZ/mTgN71zLzms43LTs+A9fp6qhljCix5oDSF3SkAdXkVAfTAAz6fpA9Bw2fe5pxYfQ9BEew1RcWLExZl6AxKo2hbl9vcpcxYXhmyjAjCc9/enT8WFVleyc67Wlle6SP2AssC8be/Rg0tAaHqUtizDH1gHrAB+iZUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8478.namprd12.prod.outlook.com (2603:10b6:8:15a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 13:34:28 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 13:34:27 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Nov 2025 22:34:24 +0900
Message-Id: <DDZY6VI0PXCM.1VNOVU6JXWK6N@nvidia.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v3 2/6] gpu: nova-core: vbios: do not use `as` when
 comparing BiosImageType
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251029-nova-as-v3-0-6a30c7333ad9@nvidia.com>
 <20251029-nova-as-v3-2-6a30c7333ad9@nvidia.com>
 <20251103203138.GA2098593@joelbox2>
In-Reply-To: <20251103203138.GA2098593@joelbox2>
X-ClientProxiedBy: TYCP286CA0290.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8478:EE_
X-MS-Office365-Filtering-Correlation-Id: 893780fb-db80-4f2a-82c2-08de1ba6e049
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cEE5RWx0NldZNFRhWGlxUVMyYkI5VTVRaHlNaU1GMzRVeXNVY3hSLzdOempj?=
 =?utf-8?B?cGdwNGJzVjd3M29aK3pLNjh6c2RUdTBmRWRIWEQrMlArajJZTFhLWUxmb0tU?=
 =?utf-8?B?UEIyY2MxbGlzZUVxNElLeWVUdHV1bDVPRW0rWm5mUFVYOXprTGxSRUt0YWpG?=
 =?utf-8?B?bW95bzJ1cW56TStVWXlabU1wRXpYYzVoTURjVzFZem9teGRibTJFVkh0K1Ra?=
 =?utf-8?B?ZktxNU91ZVZ3dzR0YVN6TXBpYmVTUzFLMlRTS05uc1FZVkZ2L21vQ3hMaHN4?=
 =?utf-8?B?bEgwRUdCbkJZVUFGd1VsaFVQSlpCQWo5UUlhbHNVcHlHN21udjFJeEFkV0tU?=
 =?utf-8?B?KzJ0NkYvbHZOREx5Ym0zU0hWM2QrV1E0djc1NDA1bzVZV1FpSDhhcks3UTFZ?=
 =?utf-8?B?RndEYkdqcGpyRDcyOUFWOUlSOWpKcUd3MzBUUWVIQjdMUGJHUUg4L01DdkNY?=
 =?utf-8?B?VXl5OEs0c2N0RHVrUS82MVJZdDNhSjlwRVJYb3RYaVZmY05GT29yNEE0WVpE?=
 =?utf-8?B?b1YxY05vSkZNOGlwb0ZnTjJ1RFpoUkN4b2FJOWIrM0paY1RlaklBd1hmNHJv?=
 =?utf-8?B?YlVWV3RGbUd6NXJpZURzbGgrd1hOVVhxRSthWVdJLytRZnpHc3FzWHduMVFs?=
 =?utf-8?B?enFXQmpWWVhSVW5Hd1pyQlNTbnpnR1dpMVhNUk81MERocWVQU3A1QmRQaUNX?=
 =?utf-8?B?aDBhWDh4c3FPNVo3NlY2R3dhTW5QcVYyOFRYK3JwL1poOWU0NjE4dzhjMTVv?=
 =?utf-8?B?Q25lWXZDRFNNWmFMbFQ2V0R5YmRqU2dub1FyQWwyNGhJeTlmTEFZTGZZMUlx?=
 =?utf-8?B?QU41NTNZT3hYQ0N3S0g5dnVYUHJrSU5waHBDMlo5N2Z4UmVzbGpxWFdwL1gr?=
 =?utf-8?B?WHlaZ2NpREhXMm1EVjE1a1N2azRxeWtQNlpkczQvWDd3V1hsWVppY1NFamxW?=
 =?utf-8?B?L3Jtbm1EQ2RydHQybTlZeXBiTDd6N1dQSXVMZDBJWlZnZ1JVWUhuSEtOTm9o?=
 =?utf-8?B?MTJkQXRPWk9Eb3RNaTZ1T1FzOGc4QnFmS1IzYjBwanlsK2lhQzdkcWlyQjBO?=
 =?utf-8?B?TmFkSW9UOERtSW1DMytlRGJDUDV1Zk5MQTk2S2hQbzJiZFM4U3V3WFFNZ3pG?=
 =?utf-8?B?WVZGQTBhSHR6b0xqRUhlZTFLZ0tlQmhFSDBoeHlGRE01VmM2aVRWV1FRdys2?=
 =?utf-8?B?bnRyRTVOdlZoaVh3ekI2amxScVhIYTRTMmtUMVdzV29YQ1crUTNaV0JCRW5P?=
 =?utf-8?B?R0lLRzRXTkNwUjBNZ3Uxang1TGlVcmMzUm51SUljNUFlUFlxZlJzMFFONXo3?=
 =?utf-8?B?aUFTNU9vK0ZjTU4yRkEycFNGQ21mZ1dlMkM2bFBKN252Y3EyRlp6MS9pM3VX?=
 =?utf-8?B?UDRSMjI4RzNhR1h3QzNmVlRWWWdLOXlsUW1hV1NvTkJtcjEwQ0VDYjliK0Zr?=
 =?utf-8?B?aGdxTHl3MmkxaWNYd0JRY1gzTDAxbkwzelF3T1ZDM0RIOW9VdkdEclMrWU9L?=
 =?utf-8?B?QXZrbTdGMnhIVmhjbzdYNms5WmswWWNsbHZ6UXVBTS93Y0FmS2loeWVkb0M5?=
 =?utf-8?B?TEtYOFVFM3crN1FTYlhwMEkvRDk2RDNNbWFEdEc2Wld6STFaVWpYOUM4MHhU?=
 =?utf-8?B?dnlVcXJ2d1dVcGJ2WjRORWpmODkwd01QMURBeHVPMGRmaitaTjhESUIyV2NN?=
 =?utf-8?B?MzU1b1JaM043TmZna2hOK1BUUHRTZHB5d3lZbDh6bmlPR2FTZElydnNzYTJF?=
 =?utf-8?B?QzB0TzhFa2tSS1BSYUkrcU5wYTV4VTJxTzJSZ1dIbk9ZN3dybnlEV1p2MXhN?=
 =?utf-8?B?OUtBek1JckRhZDRLWGtZMzRoL3ZOWUg5UkZvYlpydjhQdk5iZjE5dUVSY0J6?=
 =?utf-8?B?S0ZXYVk0OGlkTlRNazlSYXEwK3BqQmZyOW91dklqd3l6QUxyZm5TRzhNV01P?=
 =?utf-8?B?QkwrQmxYOFIzWXorek5pZHJXaUI1WVVEOUYrSjBMaXRicDdWMlBWOVBiYU1p?=
 =?utf-8?B?RThzbWZTUkx3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVZVZ3gwL2JydWxLK256NTdBOE9qTm05cWpYeHFXUjhNVkVNUkhTdVdMSmNH?=
 =?utf-8?B?a2kvQndEbi9uaENhUFNpV1ZYaFI1RStER0loM1NDNXdzMWFPcnRmVDQ3bExq?=
 =?utf-8?B?em16WjFvaGlKWDBYRTJncjgxTU10RmdhdGlyYkZRRlZKN3VuVUszTlFYM3l3?=
 =?utf-8?B?TDhYWVdEUHBLS2pnZnp1ZjJDZTY3enZmOENsQ1YwNExZbDZwZHZrb1hWUWlB?=
 =?utf-8?B?VkQvb0N1bzF6eGF4S2wzWDFJY1R5Tm5ucy94STZTdXF2c09EeHZraWh1Qm5X?=
 =?utf-8?B?UVdNRUJudHhqL2lYbEVnaTd4MUpTVGI2MjNnUDlIcDZrMlYvOVFWc1BwQytC?=
 =?utf-8?B?TzQxc3NuQmprY1EyVFV0UHVhUVdjSUpOeEVrUEMwMnk2RnJLbFVZY0ErcjRr?=
 =?utf-8?B?WUJFRWY3RC9pb3ErbDl2S2xac1RNWGRpOHV0SmU0U3AwOUl0bEtwMUFCZ3Fn?=
 =?utf-8?B?SThEK3NZRysyeEhDd0NBbDhSZWIxck9JZXV4alQyaThOQk5xd0tiSHFFbklX?=
 =?utf-8?B?WjVuVG1tM3dHK05KQnR2TmI5THZRaDhQNlBrVmdPL0ZZWU10dHBFVUhsNWFy?=
 =?utf-8?B?TTZkNzNxeXVtNWtkdHYyVmlXUWtmZDRCMFFyWUhLZ2hpMW9vellFbUs0eWlC?=
 =?utf-8?B?S2x4MTVWemdhQ2lKZ3ViaTByaTJUWUluSlVIT2x1dGZ0MlIzQ0lyMXQ0eGxI?=
 =?utf-8?B?aWFDTlZNbG1Sa1A1Wk1OMmhrT3FVT3FoZFhNdXlRRVVkWlY0TUhreGZCT0Rm?=
 =?utf-8?B?V204S251UGw3NXNnb3BxOGtTc0FBNUNLY2lTMzBuK1NMSU1IQ2dUK0kwNFNt?=
 =?utf-8?B?RkVoTUYwYUhieFU5eHh6WUJVQmxEeDlZWWpWYUtNZ2JaaFFEY1NzNFBVb1hH?=
 =?utf-8?B?RDZ3N1MzUjVRUFBNcjVpaHFSRUZZaHU3ZUFXTUM2d2JvWHdVWHZDZDdxMlEr?=
 =?utf-8?B?RkV2MC93bEdxOW9Hc3EzVWhJWlBHWTVVeTQzc1ZVWHVqaERKWGxUNXVXK09m?=
 =?utf-8?B?TW1INzFoelhLU1RLUTdENHg1dFN0RDJJb1V4YXpGZkgxbUtheXdBMUphVTVv?=
 =?utf-8?B?ck1ERlI2ZStRK3BQc1dvNTRnbDJXOHAwRE9lZ280MjdPbXRuQzc0Rk5Dc2h2?=
 =?utf-8?B?cm9XZ3ovQlVNZjQxQjRZN0lBcU5Yc3BUbDZqSGlsMHMyLzlpSUJ2M2xYNk1N?=
 =?utf-8?B?aVN0SmFoZThkM3JYTGhFWUphKzhFcnRKVlpFOVpYS0UrMk15TnQrci9oWXBP?=
 =?utf-8?B?UHBHWVFCSW93TE9Wa3lLSlhiR08zdmpJV3R0UFhQVW9BcGxoR2RKUm9Ta01K?=
 =?utf-8?B?NDB0L0V2cStwV3UrWnRXTTFwVWhmZmROVkVmWGVJQ2cyTzRBSnJ2bUpRcDhR?=
 =?utf-8?B?QzBYc3psNDMrK3gxZWt6V2xCbDF3WTBGZWJHOHRWV3lWc2d6blhKYkhBS0xz?=
 =?utf-8?B?alF6MXhjcUdTWVZZZWpmOWhpRFZGbGdrSjd4YzM3QkFmeDMrb3JXWVo0STgy?=
 =?utf-8?B?SnNrU0VMSysrRXFTS1BiOElNSU9ESlVmTG9QNDlMd2VaNURFd3pwVDdRK1Z6?=
 =?utf-8?B?ZFlTYngveUQ5c0szU1BhS2dUanZiS3dkQUlubFdWeUt2RmtZajdMV3hDTHZ1?=
 =?utf-8?B?b3VLQzZmelF0b1JwQ3hVQ2swQ2FONXlmTU42YVF5RlpkOGszc0thT0RuWFho?=
 =?utf-8?B?Mzd0YjlIeTE0RTUyOWZjVTJFdDBNL01NRmZYdnhyb1h1blJoalpyaWprZUh6?=
 =?utf-8?B?cG40UzVrcUhOY1BhTXg0aytCWmJHQ2QzVHB6NUZ3ZDRMdHFaODBJK2t6by8x?=
 =?utf-8?B?TVAvVDVkcTlUVEhqVzFWMStxOXB0NVJiYnZ1NFZZczMzaFR0T3VXVERoS2F6?=
 =?utf-8?B?NVViaGpabFZ4dzRhYkUxRVJQREkwVHFYMDhSUUROeXF2NjRNZFpwb0U0c3dK?=
 =?utf-8?B?UEVjYWx6YkVFWUNhbW5VdFo2eGY4b0dQOHJxQ0NyY2UycllmMVRmaTBPR3Bj?=
 =?utf-8?B?UTUwWDVMaVRPMVA0emhlaXZZL0xjenlBWXh5YStiZHNzVnBFK0pIb0hiSjNx?=
 =?utf-8?B?Z3d4dDFFOWQ1ZkFmSS9YOWVIK1REcHd6NFhSekpnWHJ5dlJyT1BCanJ2b3JD?=
 =?utf-8?B?ZHFGK2VsZ3dBUjFrUFltVkNUeXZDOGhGZzZNZS9seW5jN2xiMjMvWlRncXk0?=
 =?utf-8?Q?zIXGoNT99JTBLEAnlyfmfJK++U0S8BXJbJmJhDBP6w4e?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 893780fb-db80-4f2a-82c2-08de1ba6e049
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 13:34:27.8019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tVjL3kjCbTLQQhfnud6hNhqm25WCICUOGpwmhKsDHFK/abNiL/ASVPv8kdFoHi9VL7ZtupOUUfU//KYeEOqNng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8478
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

On Tue Nov 4, 2025 at 5:31 AM JST, Joel Fernandes wrote:
> On Wed, Oct 29, 2025 at 08:12:10AM +0900, Alexandre Courbot wrote:
>> Use the `image_type` method and compare its result to avoid using `as`.
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/vbios.rs | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbio=
s.rs
>> index 74ed6d61e6cc..7c1bf10b2eac 100644
>> --- a/drivers/gpu/nova-core/vbios.rs
>> +++ b/drivers/gpu/nova-core/vbios.rs
>> @@ -709,9 +709,8 @@ fn image_type(&self) -> Result<BiosImageType> {
>> =20
>>      /// Check if this is the last image.
>>      fn is_last(&self) -> bool {
>> -        // For NBSI images (type =3D=3D 0x70), return true as they're
>> -        // considered the last image
>> -        if self.pcir.code_type =3D=3D BiosImageType::Nbsi as u8 {
>> +        // For NBSI images, return true as they're considered the last =
image
>> +        if self.image_type() =3D=3D Ok(BiosImageType::Nbsi) {
>
> nit: Could you add period at the end of the comment sentence as Miguel
> suggested in the other thread (which I admit the initial code also didn't
> have)?
>
> With that change,
>
> Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>

Done and merged this patch and patch 3/6, thanks! I will follow with the
rest this week unless someone screams at the kernel-wide RFC I send for
patch 4/6 [1].

[1] https://lore.kernel.org/rust-for-linux/20251104-as_casts-v1-1-0a0e95bd2=
a9f@nvidia.com/T/#u
