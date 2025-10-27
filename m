Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02061C0DB65
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 13:55:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2954E10E483;
	Mon, 27 Oct 2025 12:55:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VoRsN8dR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011018.outbound.protection.outlook.com
 [40.93.194.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 688CE10E482;
 Mon, 27 Oct 2025 12:55:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tjWmAXPoZ6M2Eid/Knbhhe4Do/j9JFfAJSkLUeB30KcQjSix47rP/XEHZjMEX8sP4UvEm7ZbqK0koPm5ai5g7xja8T0stbdhjP6HLgPvbg8gAasfAfvZqtiS8RHdEVqVdNT8MbnQpiNIwChZWko91Qn0ftCo2fQ6R6M4erE1Es2hzHtYqIM23v7R3JbmSlAQnzK5ABTjy/gXE0bcSdSLQ17W358mXENQK03sDl/UovI4rnKtd2mn6iL+adErAJrb5Ei5vs2wC+RIYVeavg941O7EcNeXf2OhfYaQq+h7b4l4vFkric+NjpzSWElIi1v/6smaSCM29o9tIgKP4pT+/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9YB/L9umpfdeblimmxbATO3ZlBhPkAdSQPbCw1mLF4=;
 b=LJaaiUXL2z/Fq05CAoykn4pLibrB1PUq+tcAKJhBp+WNOCjFom8OOb11ZYGBy8FLOpe1dfHT0zkdNuuFSF5v+gU1slfVmJKd45WEUZfjTThLjd+CpZcnmXXN0vkWyYk4/cjJ+0OLTeeCJm5Aameyw+jlqf3/efeO8O7D37UorKlhFXzpOGBEVvdbs6XbUxdpWMXHYimVNy9h5TsPodt8UD6fxMUxis86EeV54GScrqO9e0aedbUuCFQKObpWYgms/AXr+6ujQRei5QhWLPt0P3PYiX/rPIAJktEmJZQLyHmKDMsM3Uo8yLwsusy2qe0WTtvM4CIQLv2RzqyBHjMVYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9YB/L9umpfdeblimmxbATO3ZlBhPkAdSQPbCw1mLF4=;
 b=VoRsN8dRDvbVnlAWY6dvs12TjXS60crNcIH1LSmCNyTrP0C2vO08a6o9i2ti4fxjbRDUJ2u6WyoX6JBahXraaK7gXOSNlSQ7z17h540D99jU5+5jkz+r4VF/fpw1yvv+r6UmrJFpGijK/IYeoV3NYpeLjUryNg5DlQ2Jqexsm4/MI5Xbg4i/fKrWdBiF5PExoqWPf/9BAPdQUdS2hic8D68MOYnEyYYMaiJXdJxDw6ISj7swIuz8F8BsSeiVUpbv3PBHyFX8cMUOAgcfAC4f/n4fed0ge5Xtb8R9bw3QcjKajceutEqluZJat2TTUsn2sseMTz2bbBZDfAho60+0CA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB5863.namprd12.prod.outlook.com (2603:10b6:8:7a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 12:55:12 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 12:55:12 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 27 Oct 2025 21:54:47 +0900
Subject: [PATCH v2 7/7] gpu: nova-core: justify remaining uses of `as`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-nova-as-v2-7-a26bd1d067a4@nvidia.com>
References: <20251027-nova-as-v2-0-a26bd1d067a4@nvidia.com>
In-Reply-To: <20251027-nova-as-v2-0-a26bd1d067a4@nvidia.com>
To: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYWPR01CA0021.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: 91d9bac6-3183-44b3-7321-08de1558113b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|10070799003|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWxLcFhiODZhOWhadW90alRvYURXWWwrNGdQWnV4Z3ZVYmI0eTFEdmdkR3g4?=
 =?utf-8?B?dk1pQzJBMStSRjFsNDVGREc5T1l0OEYrMXBucG1rL3BCUlFDSmE0VTdsWE5p?=
 =?utf-8?B?UzViZkZQdGhzMWdQa0REK3hRTmxuVTJpTTgxaUdUSE9IaTNWYlVtT2RncENY?=
 =?utf-8?B?TWF5SGdrTC85a3Avb1VDMEg3TUdkK2VvTncxNU5WeTI3ejArd2Nva2RMc2V1?=
 =?utf-8?B?NTJSR1FCRTJOSytaRWNHVk5JS0JTUDBValJUbjA3SGtMS3hJM2hwWTRoQVR0?=
 =?utf-8?B?Ynl3WmtEandOb3RWai9qYkJuc25QYkFBVkRMa3B3VXA0YUM2djJNeUo2VGZk?=
 =?utf-8?B?dUk1aS9sMjc0Y3MrVUtuNUgxVDhNczdiUklxTHhyU0IvRUNYZmpqZ1hkOElV?=
 =?utf-8?B?K2JMakZZNlVJVWZrOVh2NEx2b3I0OHlXbGNPYnZadmd0NVpkdE9NRjNqSzdr?=
 =?utf-8?B?cWZhbHdSUEM1YTRlemovcEEyY0ZyRklyU3dxdzBQNk1PM2s1M3N3bXdUQkQ2?=
 =?utf-8?B?OXF0dHRPQ0tVTnl4ZHp2Z3A0Vzl1cVlINjZZZkM4SG5wMlFXemtwN1F4eWJ3?=
 =?utf-8?B?UWgvNnl4clFMMFZvZWg2MVhRMFBQSGlzMTlqVS9jS0I3R0x6ejVoRHNzV3Ji?=
 =?utf-8?B?VjZrTlhjYXliWkw1UnlGVWVDaHM3ZTU5SnRVa25lOWFGalpzQm1ZT2kzb3B5?=
 =?utf-8?B?RU8yY01nSTgxTGJTV3lMRktJM1pSekxQUitZdHgvUzlpb3ZuVjc4VkNrcjM0?=
 =?utf-8?B?anB5OGpjTzlpakNNMHByY0lVL21yWVNsNWVJNkh4NHdEemJLbUNWWkNOYWFN?=
 =?utf-8?B?Uk1MSmsvYlUwUWhkMHIva0p0bThqdUpnTjh4Ukd6T1JTcUZ5UXhtaXBvUmtB?=
 =?utf-8?B?a1F0b01pRGVzK29CUk5YOTljUDV3LzJQNXVnZGE5dUtHZmYyTXpPUDNEUFZ0?=
 =?utf-8?B?ZkRvd3J2RUV2TmhsNmpoUmQzcnM5dlduU21yTDFNM2pMR3Y1UkNhbnJEMFMr?=
 =?utf-8?B?QzFvM1ZUNmpvQTVaektubzF4TW1jR3NNSlpubk5YRXZCRzVPTjNRSGdnM1Ba?=
 =?utf-8?B?RDNEN0VRZ3oxRzBndlBlZWdBN3dsUzY5bFpMcEdYNnp5ZllDTVBobFR4Uk9K?=
 =?utf-8?B?UENsRi95K1NWWEpLcVVRNnN5WGFGR2ZITVBQRVZFdWNMMWZlc0dSd05XZSs5?=
 =?utf-8?B?Z2VicmhiQUxOSzNjSzVNMXZpSkZkUXBGR3dHUjN5ZXBkL0trd3pVY3pLV0JQ?=
 =?utf-8?B?M0R1aWFoS2V6OGQ1d3dpc3NFSmpFMmJGQ3JYeW5mSGQ1Qk5iSTVTMzQ4T3Zi?=
 =?utf-8?B?K3hiZTR5SXBBNWcrcE5xL2VmK1hSbWt3YVphUERhU1V2b0hSTVdtaUdvaUo1?=
 =?utf-8?B?YmVPbUJCbzZGUDg0aVVndFYwWjlGWUlNL2xvTVpNWWhHakNkaW5zMDNCNHQ5?=
 =?utf-8?B?LzVBV2tVNldSdWVub1BHUzB2SnliTDRiSWp4NGhMeUZCazVKcm10OHVWTmFM?=
 =?utf-8?B?dkkvVXN6a3ZsTmpXNjJGMkozSTlSSEtwQW9JUyszRW9hTk1Ib0ptR2djT3FM?=
 =?utf-8?B?WWwzd1lFWVZrRm9lL1pKYk5LWHYvMitsK25hTU9PSXJzanNGMmRDTHJrSWdX?=
 =?utf-8?B?cEdua1VXT1I3VzBuNlloZnhuRDBITVdOOVEwN2xjYTQrK2N6a1dndnpXSHlr?=
 =?utf-8?B?cktvWjRFT0NBMm8rbGFzU0xpa0dRZUNJbjdjUWJyWk04MUIxb09GaFJ4T3RW?=
 =?utf-8?B?a3dnZEdNR203Z0c0NTh1blFDMW5meVE4RHhEdFNLd2NIS3Npd0haZFovTlU0?=
 =?utf-8?B?aHJVTXl5U1ZUNk5LSno0aTFqeDczZFhzMXJBVVlOYTNnelpEMWtPdGt6TU9S?=
 =?utf-8?B?VGZqWEU2Tzlib0h2eUZUOUpsejFPZVlXQXRscUdMUkNtYjNBUUtKTUsvWTB4?=
 =?utf-8?B?VERiSjF2UTJMRmhuTkJjM1VveGd6UDEydXhseGtiQWtoZUdRUEtTbWtIc1RW?=
 =?utf-8?Q?0yByFH7L38EA3FbOFDYMjWT7aXLL1M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlNmMWd6UzRGdE12NGh4Sk9PQlY2NVA3cjBFZnRrbDJMOVlEZTkyRVBRTnZn?=
 =?utf-8?B?YjEyNU5XK2k5TWQ2ZG43VWM3ejJlb2psU2ZzUDh5SmZFSmg2ZFg3aFlrS0N6?=
 =?utf-8?B?dWc0YnR5L2tZVFVzQmhVSU96cmtORVJyS0pPeVhHYVhoZUhwUWhMQ09HMnpY?=
 =?utf-8?B?QjI4V296ZG50OXg2dGIzS3hzdXNsZDdHN1FiVXJPdG5yRXA2Rk82Z3hubXh1?=
 =?utf-8?B?dXVoZkpFbEpENlFaTDBhMFpwa2xhTEVlQ013aWRWNXo1SmYzVEVKODZoMFEz?=
 =?utf-8?B?ZUsxbkhlM1htRUZQakJsQU15dmoxSUFTSWNsNUszb1ZrWDBnOUpKUldlTFc3?=
 =?utf-8?B?Y0tubUx0NWNuYUhDRnFyOExKZWJHZWtzWmExckFFQjJKNVcvWTJzWW96eTdQ?=
 =?utf-8?B?Y1YxckNWV01WZDRjQ25NdTM0QUNzV3dYOWpxRkxzS2xLdjNxbnExZ2I3L1NH?=
 =?utf-8?B?R2J2TTc3blVsWWVLeHpnRXRPcnJGQmdpVVc2TjVQSjk0QUF0U0ltRTZ3U2Fh?=
 =?utf-8?B?UVcyaWQ0UmZjNG4yWlpRTklzaFY4ZlVSUFhEWUpvSmN6aDkvS1F4d0NKUmJG?=
 =?utf-8?B?QThsZ3RiSWd3b1o4Q2UxdDVGWlpBZ3ZKWFZmM2FXMlFWbDB6TWlhMWdKSk9n?=
 =?utf-8?B?blVwUzF3TGMrN2Q2YmcyKzFsZTcxWWNaN1AyNkRQTTUzVDdNa1JRUWdEd0po?=
 =?utf-8?B?QllPeEVIbGc2U3BIeW5UVDNRTlV2Mmpubk1uYXU0U0ZrN1o0WUI3UGVSYXdE?=
 =?utf-8?B?bzdRNDd2SkhBdDBPN204Ym9kOGczTmNXTWdrOE1WSzhtb1owNEdTRTIrT3ps?=
 =?utf-8?B?TW80a2RWR0k5cHpuRXZrbFAwdHhGb3ZHZ0NQNEhHVHQxcmtYTFhZVzNmcmp2?=
 =?utf-8?B?UHNuaXg5VVQ1YlEya3l1VHZWeFQxU1M3bEFvNndVYm5KbUh1UFppRmFhZDM3?=
 =?utf-8?B?WW5meWFQbU9QTkhNaDB5V1UvUjRCdTBnWXJXY0h0UXlYSFc0MmJReDUwQ3Mr?=
 =?utf-8?B?KzhxcDBkMnpyMkY1ekNvb3RvbzdkMitCYTlTZVR6Ti9mWWlKV2x0dXZsM0dK?=
 =?utf-8?B?Qm4wdy9NUXBCRUIxa2t5NjRzNjF5Tkx6NHRNR3FMeUhoZUdsWG1BNUNIZ0FF?=
 =?utf-8?B?dW1ra2s2Ni9PTXN0ejJWNisvUVlFMkwwNXowTENPeHVxNkFNcGlNVW83MGV3?=
 =?utf-8?B?YTlVeTZJT09BbmpHWGo2ekpldEM3Q2JRKzRFR2hUNHMxYjFmaEQzN0NpaDhN?=
 =?utf-8?B?ZGh2S0plZzRsTWpnK29sYkIwNTJnbko3TWMxTzNMUGpmZ2Vra1BSYTVVRXpr?=
 =?utf-8?B?QnNSZEZYc282NUpqY3g2NmRvcVBzbnpDMWlGdi9Dc2R6VTJXcDlFUjJQZnEy?=
 =?utf-8?B?SzNtRER4NDFVendkdVM1M2U0RnlwTUQraTdCYlQ5d3BQZGxSVzVab1JyNFhw?=
 =?utf-8?B?Rnlyd3RFMVNTdEdYbHl1MFhiL3loTngyNldHRG16eXA2K1pybVhQVkxDWWVM?=
 =?utf-8?B?YUlWV3o4NjRETzQ2TzNVNUlNRmhxS2tUekNFVGN0VTl5NFZpTHZJWTdnTHlP?=
 =?utf-8?B?SVgrSTdiMlBaYThQSEdML0NvaFdGbVhGakxHK2hFQVRpbXRzR3c5bGh5ZzI4?=
 =?utf-8?B?amJDVG9zc2tiNU1NYmhCSTd3cHdOcW4rMXhUZlBIMDFvamZiaDhNakRxdFdF?=
 =?utf-8?B?b21qY243TmdkMGFtNHhLREVFMDVnUFR4dk5zeHRCTS84blI1UGNZU09pTVNU?=
 =?utf-8?B?N2FEMmRrU0MycWk0R2RkTUdnU3ZBdW4zVVlib0FyYVBzU2xTeGh6KzNKOVo0?=
 =?utf-8?B?MGY4dnRrUGRYVEV2aEFHVlRGZ1lzY21LZ1JtOExRK2d4WU1WeVZiRzlwOG52?=
 =?utf-8?B?YjF1NTJxRzFoK21YTm16NUIyS1kyNjFqT0JIaDBmOU8rZ0p2MW5MaUhTeDJj?=
 =?utf-8?B?OHVsd3ZqWVpGZFNvaExJMFlEU2EwZHZZU1dqRTVUUDh6azlCdFAyMjZ3M1FX?=
 =?utf-8?B?ZjcvbFlvbCs1THYzelFvRThBQUhoQ0t0Qm1aSzVLamsxeFhWR0h2QjJpcHV6?=
 =?utf-8?B?VHM5VDhtV1MxbTZ0WkpTajJKWVhleTV1c05KUTdpbzRDRXRrUGpiTXZxUHB3?=
 =?utf-8?B?cHY2Y3d5a3pUdlFCLzZ0VWJkRW1JTDloT1VGSjR1SUFsczlxWWJrWFN1SDV6?=
 =?utf-8?Q?YteA27aQp6zSLhn/eLmkJ04U5df46+bWT4kecZgYrP7Z?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91d9bac6-3183-44b3-7321-08de1558113b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 12:55:12.5573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oIbNBOr4LYhqKzR8+BUDjqB8Ef9u2hTlasAfMGOk7LKScjcatQAWd5GzrOhT6qZpcaDsvKUwvsar9WE3kTBzpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5863
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

There are a few remaining cases where we *do* want to use `as`,
because we specifically want to strip the data that does not fit into
the destination type. Comment these uses to clear confusion about the
intent.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs         | 4 ++++
 drivers/gpu/nova-core/fb/hal/ga100.rs   | 4 ++++
 drivers/gpu/nova-core/firmware/fwsec.rs | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index a44df1ac8873..7f6c7091c9c3 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -479,9 +479,13 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
         // Set up the base source DMA address.
 
         regs::NV_PFALCON_FALCON_DMATRFBASE::default()
+            // CAST: `as u32` is used on purpose since we do want to strip the upper bits, which
+            // will be written to `NV_PFALCON_FALCON_DMATRFBASE1`.
             .set_base((dma_start >> 8) as u32)
             .write(bar, &E::ID);
         regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
+            // CAST: `as u16` is used on purpose since the remaining bits are guaranteed to fit
+            // within a `u16`.
             .set_base((dma_start >> 40) as u16)
             .write(bar, &E::ID);
 
diff --git a/drivers/gpu/nova-core/fb/hal/ga100.rs b/drivers/gpu/nova-core/fb/hal/ga100.rs
index 871c42bf033a..b9389fa382e5 100644
--- a/drivers/gpu/nova-core/fb/hal/ga100.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga100.rs
@@ -18,9 +18,13 @@ pub(super) fn read_sysmem_flush_page_ga100(bar: &Bar0) -> u64 {
 
 pub(super) fn write_sysmem_flush_page_ga100(bar: &Bar0, addr: u64) {
     regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::default()
+        // CAST: `as u32` is used on purpose since the remaining bits are guaranteed to fit within
+        // a `u32`.
         .set_adr_63_40((addr >> FLUSH_SYSMEM_ADDR_SHIFT_HI) as u32)
         .write(bar);
     regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::default()
+        // CAST: `as u32` is used on purpose since we want to strip the upper bits that have been
+        // written to `NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI`.
         .set_adr_39_08((addr >> FLUSH_SYSMEM_ADDR_SHIFT) as u32)
         .write(bar);
 }
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index ed82e74ccdc9..ecef4cc78942 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -161,6 +161,7 @@ unsafe fn transmute<'a, 'b, T: Sized + FromBytes>(
     if offset + size_of::<T>() > fw.size() {
         return Err(EINVAL);
     }
+    // CAST: `usize` has the same size as pointers.
     if (fw.start_ptr() as usize + offset) % align_of::<T>() != 0 {
         return Err(EINVAL);
     }
@@ -184,6 +185,7 @@ unsafe fn transmute_mut<'a, 'b, T: Sized + FromBytes>(
     if offset + size_of::<T>() > fw.size() {
         return Err(EINVAL);
     }
+    // CAST: `usize` has the same size as pointers.
     if (fw.start_ptr_mut() as usize + offset) % align_of::<T>() != 0 {
         return Err(EINVAL);
     }

-- 
2.51.0

