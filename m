Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9659AC5BB0D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 08:11:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C3DB10E9B9;
	Fri, 14 Nov 2025 07:10:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ong+0Arw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013020.outbound.protection.outlook.com
 [40.93.201.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6975210E9B7;
 Fri, 14 Nov 2025 07:10:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XyJqdLHTLNdvlK2KMTV+BXAcLKGklr+spnW995I8KnO61nzv9b52d0JhLoIbsE5cfILgtP/tdSmZr7QYjeVmDh8eViY7VaohlAT5tR20oHNTuoKFpypxh1zjj+Nr8ev/T5dBE2G052Qmqo8ZJ8a4dLgpWBnF5bInNs/Hi6oMwjVmFQj4QrRrwCGJ3oGuOZvVPmrMeJwh/DdF7BdVUzz5m9FxsBd8q7tBcJS+5JrSUzzyoAtVLrIlD1l7CSe3O/t/C1nUImc45uYIGspTkG0HoJhJRThW33x/0RdGoee6t0y+T6tHehOgfhflWbZU/KsKpYcZUn2ts6Ffv+gEfXHXOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXXGblDNPpkJwnOfotTZLJH+bVL34xS1liL6RdloPE8=;
 b=xmDe/z/0gwLuaTB5vC/LtddiaGnvBLLMQCvPiZ3abylPd3z3jqF1kO5WDnNAZIroPU9bAnm9Lf9ydkJPCKog0fMSXUCrdlP5FXUJVTAZ7ii220FAJh70GiCeu8biFum86vEXe00Z+AHlxOnjfEswl3yXyVB6SSAHFdf2iwXz+1JJQoKpg6UStjaKP1z6KL3tt89Nk/eBddJOARBXSt8sL2qetwJhkrzFJfq5Bm7DkNHNHL7Nqd4SHpGXgrGCpSWx4BT4iAsE1jhFcAmYXklrzYn3ib/TSca/+TfvhW7CqYr78bSvuS422pKdrHE9WW1LZ5ovITPZz/xsgWK+SdHeMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXXGblDNPpkJwnOfotTZLJH+bVL34xS1liL6RdloPE8=;
 b=ong+0Arwq/LZB8Bm+UDlNGXSy/ptjazIDuro/+MbnUYWXbYf41OCscrF2RFzme3Tb+am+uXgbLEkREnLU66MjvexWd0lC4xYfjKVHqgddJQbqfz+YELYcjquGfxLtD3srmncbe9L27uSBKw5xhyBRxwaHNS8x9r4HlIBKK6TJwxs8gN917CR6xWKY1/Dbirhk1CO7/XS4uQGL02pbVdNJ3oeLqfDTle23miGMGdRaNpyu3/Be4QDVH5m327+3sH2hNKbN0ZzW5mZVzyviUtb+xPHObruoJpHeOc91BBx++x+AHsOQjkdJqKrTIW6lAC3dLbbBzCBk+/QlS0Q1yYyCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB8811.namprd12.prod.outlook.com (2603:10b6:806:312::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 07:10:51 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 07:10:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Nov 2025 16:10:46 +0900
Message-Id: <DE88ALG15C8T.4ASPEWD120P3@nvidia.com>
Subject: Re: [PATCH v9 03/15] gpu: nova-core: num: add functions to safely
 convert a const value to a smaller type
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Mikko Perttunen" <mperttunen@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Benno Lossin"
 <lossin@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Alexandre Courbot" <acourbot@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251110-gsp_boot-v9-0-8ae4058e3c0e@nvidia.com>
 <20251110-gsp_boot-v9-3-8ae4058e3c0e@nvidia.com>
 <13485409.nUPlyArG6x@senjougahara>
In-Reply-To: <13485409.nUPlyArG6x@senjougahara>
X-ClientProxiedBy: TYCP286CA0253.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB8811:EE_
X-MS-Office365-Filtering-Correlation-Id: 51c636c9-7f12-4e43-9ab7-08de234cf0ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eGFKQXprcGkrbmhsbHI4akJUMXdNMmxoRVgrNEJUS0V5VkZnblJub0g2NG1u?=
 =?utf-8?B?dktWQ0RoZjJObXhMV2ZaeTVLSU1UVEc1Y3l1VjFkY1N3WXNtNzcvYnN6TWUv?=
 =?utf-8?B?UnNkSTR2bmpwRHhQampOaDduSjI3OVhVbFpUT2p4OFNObHBhV2Z4OVFVN29B?=
 =?utf-8?B?bjM5VDZWbXBLendDWDRrWDJUWHVPaWM2TzVKWGkvTU9BWVNBZWJzMFZhVlZM?=
 =?utf-8?B?Y25XL21pa1RnS2EzSHNMS1VjZmhJbzI2Nmx1WmRvN00wTmlMQk1VdUxnSmZj?=
 =?utf-8?B?VzlEdENiWHBSRTJyNlhOUGMwR2greVVJS2o0bXhIVHgxNVNLOEVudlJ0Y1hw?=
 =?utf-8?B?S0lLejZ2UTdPS3F5ZFZsUy8rQkttblRHai9Yb2VTSWpSMlRnVHZyMWRMRjZs?=
 =?utf-8?B?RzVwWmtRb1FETy9RUUFYN2hBYXRib2YxVTlNQ1ZWZDRtcXJUUzl6enVjR3d1?=
 =?utf-8?B?ZU0vS1N2NTl1SElob0lNS3UyYVUyMit3M1F4ZTh2STU5akQwMnh2dGNGK1Iy?=
 =?utf-8?B?bXc2WUtuK3VjQzd6ekZ6a3V6eWtkaGFPMDRzZGV3NUQ4Mm5KeTJnTmplOUpG?=
 =?utf-8?B?emRacEhGSEwxOUE1UWlRM1lBaHBoM0V4U213eTNTKytELzI1a2pXNjFLamNZ?=
 =?utf-8?B?UDdUTzEzV2RVeEo1c0VHd1lIUWN2d1lob3R2blhSVWFCb2RuR1liclR5UkFt?=
 =?utf-8?B?b0lZUlFucWlzKzhVaFQxVDdRNVRjZTVGbHBrWU1VWXU0T2QwNjJ4N0F5TTdQ?=
 =?utf-8?B?UXYvb0JIbmxndzVtZVpkNU1ZajRWcHU5cW50UUdYTWQ4WjJ1UXpHUmJ6bVFV?=
 =?utf-8?B?L21zVnl0cjRBVDFSM3lRN3BPWklCODE5NENBSGpKTVNnREkyaXVUQ0ZhZ3pQ?=
 =?utf-8?B?bzJYSzFlMDVXY3NpNmpiTHQxZzJ4RWp1a1BmbFRmTWcvTHhRUVJla0NlQ3RH?=
 =?utf-8?B?ZWU1cWdHMUJRL3ZvYXJKSnpzUHVkY0R6MXd1NGVaWjBjMFdMdHhsUjFTTDF0?=
 =?utf-8?B?VjhvNkpTVWtyU0N5RXVoK0NYZXByZ1FweEV2bzZWOUh5U0VxUHBzNjM4eU9Z?=
 =?utf-8?B?TjBqVmJleThXWXJ0amlWd0Rpem5kYjZmQnlXUVB3SmlHMGFFUDdVVnc3Vkxj?=
 =?utf-8?B?N1hodEVqV0FWSVpla21jOUtwYW9LNVpQcXNVNzdJSWlwcUNLdE54VlJ6eDVu?=
 =?utf-8?B?N2JxdGxhenRQOWthSi94Y2p6YkkxVUwvaXVqN3l4eWdoVWZBZ2YzVmJST0Ev?=
 =?utf-8?B?THk5cXBRd0NnZndRTTJuN09rT1VHM3pXQ2huR1dUK2p2bzR1ZnlNUjkzSmpl?=
 =?utf-8?B?VS93T1Q5aDNJakd3WXZIQ1B6czl0Rm5JV2JCMytNeEVlZTVqSDYvVDdsdDBT?=
 =?utf-8?B?SEh0UGdXcEZ0bkMzR1ZWRFZNVitZOE85dzNWdlRWbXBNd1RRY3hIUW5WOUl4?=
 =?utf-8?B?cGZnczAwQnhSRnVmdGYvNFZlRFRJSmRWOHVzYUROblpSOTNWSm1TNzN4RTJu?=
 =?utf-8?B?dUVuUlY3dDFyWkM0RnVtMzRtTnQ5NkNYaWFQNHBrREplVG40NnhRMS9mcmkz?=
 =?utf-8?B?NXE0K1JGMzVsZmw4VHZxeFJkZ2JPTDFZQko5RXhMMkh0czdCZ09tOHdRN01F?=
 =?utf-8?B?aEJPZlpnN1FoYkYvRldyQ2dBK2wwaW8vR2F4T3FiTlNDaTIySUVQaEd6RzIx?=
 =?utf-8?B?NGU3SHkyaWkyVXhQNS93YmRJVHpuVDVOZ2pDK21hSVU0WEdOMVYzQ0tJZnJE?=
 =?utf-8?B?blVaclNFcXBWcjZFaytTRk9zMEJFR2R6YzZGYnpGZmxqM3NiTVBGNGpkYk9u?=
 =?utf-8?B?OGFTOTBnR1BCaDF2OGdOaHVpcWo1M2phTHNJeXB6VU91NDhuRHEreXV4aFIw?=
 =?utf-8?B?OFc5MmFwWi81cjR1dStyUWN4cy9NMWVuckM0dE9zSWYxZjF0RHpQd1BvZkxH?=
 =?utf-8?B?aFRjaG0xa3gwRWx6Zk02RnJZVWhZREVRNDZsenM2K1YvSXlwMHlOOS9tSmQy?=
 =?utf-8?B?ZDBZcDBFaERReGZrN3V6SFJsdkVUc2hFaUVoUno1MmFlY04wcFkyWk5Lbi8w?=
 =?utf-8?Q?4DYTwf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VG9TbmZVZy9DNnVaVEQvR2NmeEEvUlpYN3ZuTEo5YWptVkNXUERpSXdIZkVy?=
 =?utf-8?B?TEdpME1ZSkY0dHZCZThNNENOalZDUW8wb2R4cmhBQTZUNzkweGpKaUx4M2JC?=
 =?utf-8?B?bGZBc01SbkExa0c0MzZUNU12OGdaRmwwYVBONHd4SnhwTTRHTS9nOFhSdDgy?=
 =?utf-8?B?VEtrZDhMZjRzRnhoZnpjc2F6V3dFdHU3L2FVekdXcmdKRTg3T29SSmcrRkkw?=
 =?utf-8?B?TmkzTUo4UWRGVldOZWZqbXZNR3ZWS0dRa0psaGpLUVZHS3FQaTR2V05CUDIx?=
 =?utf-8?B?Q1V2MlZrMURORUNjMGI3YU5EL3h2N1o4Rk1GZ3M0R0F3WFR0VEdONE5QcmQx?=
 =?utf-8?B?eis3dkVPQlY0N3dreGNtNGJxQjZRNG1IRmU2M1VBTHFSMks0azhmeTZZRkMr?=
 =?utf-8?B?dGN2ekdLTHpWUDJpdzF5RDdZSHdOY0h6SFNIeEI3Nm5tc09zUkZheVU5eVZ5?=
 =?utf-8?B?bWRNaVdobkZQV1dYVkRHYjE2Z01rcUlYT1hGV0R3RmZNQmhwaUxSMFU1dm43?=
 =?utf-8?B?bjBRRHNJU3ZscU54YndNb3YzRTNVc1Ewa1ZodXZabDh6MzVlVkI5U2ZEN3hD?=
 =?utf-8?B?MmNaeFJmYy9ZQ3R6VFcwZGt1NjY2UjBWYjFNcnhPZjVTMkUzTVdlZFBrbW5O?=
 =?utf-8?B?ZDkvazdDQ3o1bjFacWZyRkJJQ0ZxUWIrS3lmaGtiYkt1ZWc4VXFqSGJLS1lB?=
 =?utf-8?B?K3lWeGFzU1pOelFkZ2RxZlpzcW50NkhVU0E5bWZ5WjJjZzFNSDlHL0dabW0y?=
 =?utf-8?B?M2htd1JuR2QzL0o2ZkJkVFdZTWhxMUlJV1U3eUdsb3RnR0RnaU5QdU5tVlFp?=
 =?utf-8?B?WkZkd1p2c2IyRGF5bW5uUFZPU3J2SU5hN2pLcHA2RWF1SXVwbWhNNUZxbnly?=
 =?utf-8?B?cU9RT0tIaEppeXVkeVQzaE05R1ZsbTk5ODA5R3gvOGw0d0dCbVRkdTJBR1pk?=
 =?utf-8?B?VE5BMnhpVFdiZWJ0dXRlSk1OdUU3VEcxVkx6eis2b0RKUnQ0STF5NFUvb1dN?=
 =?utf-8?B?L0pXQldnV1kwek9ScDdsTUx6azlTYVpLc1RoMGVDOXRnVXFTc01JdS9ReFVr?=
 =?utf-8?B?RThrZ0M2WkpYS3FreWFiNm96dVhXdlRoejgvc2lOY3UwYU1VZFl1enJqaklY?=
 =?utf-8?B?ZmhROFRFMEhUUGNtamxwRTluTUxCMkZjTzdCdU8xaEYxdVpwVnE0WWpsR3E0?=
 =?utf-8?B?YUtLZFJ5MDRjT05YQ2kwQ2dQRVNjMGxWNFNQM28zbmR0ZGx6dlB4VE5laU14?=
 =?utf-8?B?OGxEUERkTzF3WURhUGRxRlFWTjM4amttQjFGNURyWlFUWUhnK2FOdUVBWUwx?=
 =?utf-8?B?Tm9qMzZjbEVtNFh4bkdTOS9jbDNvSDdoVSswRC9rL3RwVExoK2kwbjFNbUk5?=
 =?utf-8?B?bFU0NUh0ckl2NVF4QjNPVEY5R0RWWU96d3ZPNFljNytJS1RKNTJGa0ptejRE?=
 =?utf-8?B?U2ZqTFlKMjVpZGlFSEZJSGZGMFFGTzdiTm1BRFlMRndQdkZVb2RsT0NoaHdL?=
 =?utf-8?B?eEFrMENsam9kcURmL0I3STMrMUtmemR6VExwSENNRzczenRyWHpJdjZqZjBC?=
 =?utf-8?B?RnhFSGx3MWVUV28zdWJ4T2pZU2J5Y0Z5QVNvc0F0QzFDQk9KUzJONCtSa2p2?=
 =?utf-8?B?c2tWaGdiQWJReTZKcnpQVlJkcFhYcUU3UFpyNjRkZUZzSkF2U2FDUUc0U2c1?=
 =?utf-8?B?ZXJiQ1NoTk9LaFI4YWw0bVNQY29FQW11RG0wTm5LYmpRQjcrTHhQVkFKVXFQ?=
 =?utf-8?B?YkMrU1NTdkxlRit4anIrOE5RdUJ4Wmcrem16T3dmbGVwdzlmNTgzUUdTcG5Q?=
 =?utf-8?B?azhrcGh5Slp4MStEM3h0N3NzbExDb25UQ21NaWVRbXkvdGVpdHFtNXRsUENH?=
 =?utf-8?B?ZHFldmpvb09PanlrY1R2eEFGTFdtRm9RMlYxc3QrN3VnampYNnFJV1BTTzUr?=
 =?utf-8?B?Z2VPNVR4NjVpTkpSMDlpbXpkQ041ZTlMM0RlK0RQL214YU5KTEh6clhpR2xm?=
 =?utf-8?B?ZEdxUUwySG0yNy82dXZKWDFBMjlvTlIwNy84YTZrMTF6dEhHN1lLdnByUncy?=
 =?utf-8?B?UFRVaWVYSFNacGZKNmpVeklzNEVYanVMVlB5bE9PRUV5NWRCMjhEajhWUnAv?=
 =?utf-8?B?cFAzT1VzWXUyTFpJK3g5YTd2bkdqQ0pxUk5nUVJ0WDVNR21jZWFwc1MvNjNp?=
 =?utf-8?Q?R36zGYsBzRoQIcEw8XsL3j/Lne0YLTDSipOltoN2NQht?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51c636c9-7f12-4e43-9ab7-08de234cf0ea
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 07:10:50.2076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fGlFoed03GUcSxjlikfxT8nfUwsnbwZoxTzPWRs6PVlO4SudFPW3xNJaHlbbDS742CvdD/VeEHEfVsm2j7/a8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8811
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

On Fri Nov 14, 2025 at 3:49 PM JST, Mikko Perttunen wrote:
> On Monday, November 10, 2025 10:34=E2=80=AFPM Alexandre Courbot wrote:
>> There are times where we need to store a constant value defined as a
>> larger type (e.g. through a binding) into a smaller type, knowing
>> that the value will fit. Rust, unfortunately, only provides us with the
>> `as` operator for that purpose, the use of which is discouraged as it
>> silently strips data.
>>=20
>> Extend the `num` module with functions allowing to perform the
>> conversion infallibly, at compile time.
>>=20
>> Example:
>>=20
>>     const FOO_VALUE: u32 =3D 1;
>>=20
>>     // `FOO_VALUE` fits into a `u8`, so the conversion is valid.
>>     let foo =3D num::u32_to_u8::<{ FOO_VALUE }>();
>>=20
>> We are going to use this feature extensively in Nova.
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/num.rs | 51 +++++++++++++++++++++++++++++++++++++=
+++++++
>>  1 file changed, 51 insertions(+)
>>=20
>> diff --git a/drivers/gpu/nova-core/num.rs b/drivers/gpu/nova-core/num.rs
>> index 92a91b9e30de..f3740ab6cb9d 100644
>> --- a/drivers/gpu/nova-core/num.rs
>> +++ b/drivers/gpu/nova-core/num.rs
>> @@ -163,3 +163,54 @@ fn into_safe_cast(self) -> T {
>>          T::from_safe_cast(self)
>>      }
>>  }
>> +
>> +macro_rules! impl_const_into {
>> +    ($from:ty =3D> { $($into:ty),* }) =3D> {
>> +        $(
>> +        paste! {
>> +            #[doc =3D ::core::concat!(
>> +                "Performs a build-time safe conversion of a [`",
>> +                ::core::stringify!($from),
>> +                "`] constant value into a [`",
>> +                ::core::stringify!($into),
>> +                "`].")]
>> +            ///
>> +            /// This checks at compile-time that the conversion is loss=
less, and triggers a build
>> +            /// error if it isn't.
>> +            ///
>> +            /// # Examples
>> +            ///
>> +            /// ```
>> +            /// use kernel::num;
>> +            ///
>> +            /// // Succeeds because the value of the source fits into t=
he destination's type.
>> +            #[doc =3D ::core::concat!(
>> +                "assert_eq!(num::",
>> +                ::core::stringify!($from),
>> +                "_into_",
>> +                ::core::stringify!($into),
>> +                "(1",
>> +                ::core::stringify!($from),
>> +                "), 1",
>> +                ::core::stringify!($into),
>> +                ");")]
>
> This expands to e.g. assert_eq!(num::u32_to_u8(1u32), 1u8), i.e. not with=
 a generic parameter.

Ah, nice catch, thanks! I missed that because the doccomments are not
built yet for code outside of `kernel`.

Fixing it by taking the example from the non-Nova RFC [1] of this patch.

[1] https://lore.kernel.org/all/20251104-as_casts-v1-1-0a0e95bd2a9f@nvidia.=
com/
