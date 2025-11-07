Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CD0C42019
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 00:43:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B45010E11A;
	Fri,  7 Nov 2025 23:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HFMamiup";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011006.outbound.protection.outlook.com [40.107.208.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256D410EB9B;
 Fri,  7 Nov 2025 23:43:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eMWBIBaQqPzofmCv5NTSmG1lPQaZYGn54MDMBRItUa4wuwq83NbMo9+XlCERw1D4x3pwfjF/D5YLdH7pYW6oxSbRffHR08jDlvCqchQmZAFTZMzrSHW/OnRRMixUV5TIZpqfZA2aekJzx/8qYkj+DxRqbBLctt6+sICnB436+NQjTNYz4ut4IkU73WuR2fEAGX4964spHi5zo2IoIWY/Fms8XYlrBUaJNw7AAgVoxvRu5ldct3GFv/GNq75GUiFWcc6ZnUclUWZBJUq/xck05XcsHyHoam/yd4Zjzit8QRIMuaftl/Qnjwp56EhtDgcAIJCOF3j9vDdnsNq0WnunNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WenVN1/nbTI/ARz+nvwgYjpOH+aLAUncDQsLZRU6TY=;
 b=L4kqTGzQ5GIa2BiWXtwaiSQ+Xru4C5sDOy9wxc292oL5Y+qCIsNPi5jhVNv/va2BWY2W1992JQQvpoze/hhJnvjAR6tSbgaBXvpEF+3PQS5AD/Q8HnR9b8p3xWrz/d3ixi7nTHFChSiP/ytSaSu4+5l68fiAPAgvkFHQ+o09/dZ1YKCjqYkZDZpCQIqO+LS1p1akYZPN5lCI0TSYSBrWIUMD1+EqMbUhOhwun+GKkH81/11+7Y/EKI/tcP5I4oJ0xI22TB0WzDBAWXiFp3IvMoFSzyXOXeBBuJ+60L26jHF0I/x0P1J7QgrTCrPYvcScbpeO8y3auBsov3mkzs5lUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WenVN1/nbTI/ARz+nvwgYjpOH+aLAUncDQsLZRU6TY=;
 b=HFMamiupXGxM5gWh+ntkVsa4Ty7ATuIDqx0LtA3LVb4pkEgVn1x4tI97ait/AAWJcVjsEhtMDT+QHggZv1/b1crV/ry4yUU8iK/+0PCdbiI+jtspEKGn1CdauAPryhdSGix0uYGyTLXiut3kRO4tOjzKBW/1u07K/Xjl63wyK63J4axwMvXVnXt1RWmBWNIrMcHWn3FCqptdMEkFEpZg3bVwQPM9Hf05+2q4LLj9PZDi7fQ/rmh2kudma3ymDZmC/6XfiZwDGCV8EmwXhialxp1t8/Db+Ztw9PJApFV705Eqh/8j0P7PpuG77npYk0jwY3ei8gbeM2TJS35E86THBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6642.namprd12.prod.outlook.com (2603:10b6:208:38e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 23:43:47 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 23:43:46 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 08 Nov 2025 08:43:09 +0900
Subject: [PATCH v8 08/16] rust: enable slice_flatten feature and provide it
 through an extension trait
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251108-gsp_boot-v8-8-70b762eedd50@nvidia.com>
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
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP301CA0087.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6642:EE_
X-MS-Office365-Filtering-Correlation-Id: 5172a117-d0ad-43f0-74f4-08de1e577e93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHpvSTNIRnArcjJzNlFvb29UYUlLWEJQcnRpMHRYUENPVDBnOE4rbGgxdStV?=
 =?utf-8?B?UFV2cjgyUmRSeDFkMmc2WlJlYTl3VFhsR3dFempNRXhqYlNnTUs4OG84R3ls?=
 =?utf-8?B?QVZHRmorM0liOTBXaGZ2ZGpYNGZWM2hCVzArUE5ZSEowTlJML0JnTkY2alk2?=
 =?utf-8?B?RDBBUnlTMjY2NXY1c3h4L0YzT1hWdlBWUFJyaHdSY1I0amdGNWVBZng4aGV6?=
 =?utf-8?B?ZVQyZkJVUmttWnEvWkFYazRidXFvb1oyN2NNWDV0UWNxVGtYYnhkbUpqNndZ?=
 =?utf-8?B?ZDNUTlJkTFFLWFJIYTdTSmd1Q1U1SDNlL2NxYVV6cFNaN0xSQXJWRndBV1R2?=
 =?utf-8?B?blBzVVNKcXViVHJONk1NYk1YK1E1ZUJ2VSsybUh0MUdJdHVCOE9LR295U1pm?=
 =?utf-8?B?c3NBN0dXdzgxaVNaUTRUWXlQZFpXM1RySk5CQUw2SStacmtCQUp0TnpNMmFy?=
 =?utf-8?B?SGV4NDhWbVYzejd6eWxPTUU5VE9DeDRnUWNmL1NXQUQ3MnArWWN1OVN5MFhF?=
 =?utf-8?B?VTV4dG02OWsraEdaRTcvaE9QOTBMUjBsMlpBcFcxem1WRFJWRnV6MHVkVFhm?=
 =?utf-8?B?S0c3Y0tNUlVUcjdEcEIxS2VkSW42TzFEUGk3UmdWVmREVnVTdDRJcDFiaDA3?=
 =?utf-8?B?QmkxODhQYU9uVXNwVGV1Y002WjJNcjM1NkF5Z28wRDZSQkFieFMxMUlPaFNq?=
 =?utf-8?B?eTBxeHM5bmRpOWlOMktMQU5qYmdFYXBwYXFBV0JqZkp6MWx5bDI0Y3h2bGtL?=
 =?utf-8?B?QzV0WHEycU8zWW1lSXVSVzZ4VFhGSWM2Qnd6dDRhMUlWNFJYYWZWWWFJOHpP?=
 =?utf-8?B?UlhqZThnWWNmWlpnSGx1SkV2ekhJbGhhNUlXQ2h4bjJtbGZTMWUrSzEzbnFQ?=
 =?utf-8?B?aUpZWmRjdjVNUkVIUTVuczB0eDQ1RVpidkYzU2JDQm5HMy9ROG1Cd1Rkbmxq?=
 =?utf-8?B?VGQ4ZFZXcGxOMThvaHU4R2I2RjM4cjUyWjNtS0hhRFZXVUtCZXMrSXBpdlFt?=
 =?utf-8?B?MERsNk1FaVNVcWRrZUt0V0czdktqSTNkNGU2N1FveWY4WUNqdmtMcE5rbVYz?=
 =?utf-8?B?ZjVyTmFYTHd3SE1aRmZmMW9QQm9RWjBGUElkNVV1blZ1SkJqMFFqU20vNFhQ?=
 =?utf-8?B?TFpxcXJMTDRuRlpscFBIS0xKMW5CcmF1UkhWaGRDbUl3Rm9uUHlUdkdmL01p?=
 =?utf-8?B?UVNPKzg4dlE1aDU4YUUvbFFoZURuTzF2QkxyMVhSSDB6MU55SzBhQTY0b05q?=
 =?utf-8?B?UFIydUFQWE9YNWxTVFh1NlpoMWNwdHB5TlB3SFdSeU5qUUZBTU15bG0vdlZF?=
 =?utf-8?B?anJBZzA1MWw1OEVxLy9BTkorMjRyTFk2cUY4VmlCNHJtTm0zUGFsdmNsNytX?=
 =?utf-8?B?RkVraTVqNVlyaWNUL0RIS1BRVHhsamt3Qjh0aVRQWCtqSWRiZmliNXJLdnR3?=
 =?utf-8?B?ZUdmM0NPREF3eWpyTi9ZSU11OTl0RXFlaUo1bjg0OVVVdlpUYUxkYXFqaDlx?=
 =?utf-8?B?ZUpKMFhJR2wvWFY0QkcyVVJYc1RuRUpTWGJlQSttM0x6ajZxaWJ5NERtZnFj?=
 =?utf-8?B?NEpDeitJcUJJYnJrK043dHdsODA4R2NBUVpweHJXUCthR2J0bFVzYXlIOVlq?=
 =?utf-8?B?THI3RUJRRi9KNitMaWxkTjhYZGRVeXpRakVzYmpGajZxOWdUNWVDaEZwOTBm?=
 =?utf-8?B?YTY5V2xxc0xLT00yOXFuTHlZVEJkT0ZxdmN3czFPaVBqeWRvejdKOGpWcjBM?=
 =?utf-8?B?aXJXd3o0Y0pZUmtBdVlSUkVlR0RnWWV2ZU9IVHFXVy92bUd0KzRkTVA4WVRE?=
 =?utf-8?B?QkJLT25DWDNuV0I5Sm4weVFubVN6N1dHZC9XeFVwQVMzNmFWN0o2bmdJNEsv?=
 =?utf-8?B?ZUV6TThVN0JMS202T0Z5R21PbG1EODdLNlF2V0kyWFZjOXpsMExUdk1vclV0?=
 =?utf-8?B?YWFkVVdsdzFCT0ZxRlBLbjdsUi8rZnRaVUlDTk1GangyL2MxYzd3bEJ0SUI2?=
 =?utf-8?B?NjdEWGRDM1ZjT2VNN1VSZlRPTlE3dHZtb3pnSmRFaW9OellSN1pYTHgra0Ru?=
 =?utf-8?Q?I8ntok?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0tXY3FjL2hOWFh5ZWlqOUN6OTlRcG16bEpnUXh4ejU3Z2FOUFgyeEI4ZG5a?=
 =?utf-8?B?bmwzQ1NtZlNGeE9WY29LcXZ3RE9DTUVVTUFvR05oRmFMT2VDSnNFM1FuSmRv?=
 =?utf-8?B?cXM4Z3VRUXpaTlZWL1JxS2VPblpZR3pLRDY1M282YTJxQ3BMODY4UzNBSU5L?=
 =?utf-8?B?OFNSUko1alFoV25CTisxNDliSFJ3WWl5UkwzS2pqOXhYd2F0VVRXM1diS2R3?=
 =?utf-8?B?Z0N6c0lMSVVMbWgwcjRwZVc2R1FBSlZLb3ZBWnpsWE5URzgzdXZoMkRWMnZ2?=
 =?utf-8?B?ZHVGMURJck9qUmU1OVBINGdFcnNFbU5NZXJ4VzBWRkM4YzBTYURtMzJuR1Vx?=
 =?utf-8?B?c0xaRWN0b1BWUUd0Y1FpcGFzWFdGdG5GcDZER201eGV5M3E3WDQ0Zmh5N3VW?=
 =?utf-8?B?Zk1SMTJ6Uk5XekxzWDNESVRINlFjK2NoR0IxdjdhNGcrK0s1Z0drU01VdjZI?=
 =?utf-8?B?T2lMUVdqYjFZY1AwUHRQNmVzL0xDL1BYeWVmRFl4QndVU1hCeFN3SVNONXVH?=
 =?utf-8?B?Sk00MGU2RUVjaThXalBoRUpabVQ3Zm40TmIzVUlRaExBR0NTNnVnMDhDQzRp?=
 =?utf-8?B?TmhJZUtGUHVWdDliZXozalRjR2tuMWRaMW83dnA5M3YrZEoydmZIVE04bnFB?=
 =?utf-8?B?SGs5QThEMk9iNDR4MStBUGh4UXJUV2JLSk5IbFVJdzdQdk5uQ2RtajZkcVBj?=
 =?utf-8?B?SENOMkZsL3ViNjhsU0tvbVA0OUpYTFA2LzByZkhqaC9DT3hpUVMzaWpzbzcy?=
 =?utf-8?B?blIwZFQ0NElzb1lnYnZtRTFKY2JyU0Vrallzbm9STjU5UjZ1ZGJVY3hwTmxW?=
 =?utf-8?B?d1Q1ZGFqZFRlVER2bU5BR0FoOXFCWU1leTAyODNDZDBVNVNSU1loVSt3Zm50?=
 =?utf-8?B?eGxLRFgxRXdrZXFFQ0k0bHI4b3hqMG9lRUpueWJJZElGOGdBZUtLcWFpYjBD?=
 =?utf-8?B?SllMdE1LdkE1QllNL2ZGRXloeGtiencyN2FhYXpHRzRyZXRERkMxcXROcEhW?=
 =?utf-8?B?ZFdpWU5MQnczSG1RVGZsTzA1MVJJUVNoK0Q4OStKNVRNUEpZaGVOVVlzQmtv?=
 =?utf-8?B?K0lCQWNNS3M2ZTF6Mnd2YzlMUDFtMG5wbVA1bmp3V3lvZldkR0xXU2dDTWZI?=
 =?utf-8?B?ZTVhby9uOWxGMlQrMWZ5Q21MaUhQeThjdTZERWxCNjBrU2tHUjMyQkcvSTNK?=
 =?utf-8?B?dVFqZ1hNR2trWU1aNVlyeEJuZG5Kbjc5MXNBZGxLWGxuVTVWYklPQjEyWjNw?=
 =?utf-8?B?VUxBYWtLTXdOVnpUVU5seHpkU0twQ2VJQUZ0aDRiNmo2NnF2K1luSTdjc3g3?=
 =?utf-8?B?dkZyK1NxM085VERVSVNwS1V4WFRLUnVRNTArbFJiNURxbmg1QXRxdnB1YnJt?=
 =?utf-8?B?Sm10YWsvVGRXQ0t3UndjQmRaZmpESUVpVGlONEcyZDZoWWk1a3lLSUJxdmJZ?=
 =?utf-8?B?NGx5NHlxMHZndi9FSGVKVjA1VlJpU0tHdWlCTExRNTVBTEhMSC9yWFI4SENG?=
 =?utf-8?B?K1ZMaDUrN0hxTjVkMnZkSFRYN21vcDVTR1Nqb3o4RldZY3JsWnFqZThtWk5V?=
 =?utf-8?B?MExDZEgvT1RUZWZMRDJManZobDFYc1laUU42c1o2TmM2dFV3aHFlbnJMU1lm?=
 =?utf-8?B?OHZUNUVETk5Fa3JBWkk2UGQzY1B2TkVRNjhFcUg5Tk1jUTg0YzF6QnIzQWpO?=
 =?utf-8?B?T3JUNW02V2RvT1NXdnl3WXhPRUdLSWY1R1g5VG1pSE5WV2dHU0l5bGxPUnJl?=
 =?utf-8?B?RktQbi91ZTFKSTNVTlVjYjFOOFlablYrRDV4dmZ1eXhuU0ZkMmZCUnVCME5F?=
 =?utf-8?B?WnpKMWMyMHZRN1o3QjFPVGlmd1V4SFZyYVpwd1hLSVFZYmdVbnBoNFh4L1E0?=
 =?utf-8?B?alBJZm1LbitrbUVxTmpSTGhaUGYzcE5hZHFkYkxWL085bHo2d21MeE0vWHYr?=
 =?utf-8?B?UlErTkZ3N0ptb21MajNINVE2MzZVV25yY1hTNlpHQjU4QlJlRjVwMEZsUW9p?=
 =?utf-8?B?am8zY0pKcExiTmdCdElkVXRqL0J6b2FOdjJlS0lSb3VPL0tYbm5QRHVqQ2g1?=
 =?utf-8?B?SlZoYnhKMjgwK2ZJVFRHb09sbkIrUnI2VDN2c0hyM3ZyVXgyZkcvcFFQanEv?=
 =?utf-8?B?OVlnVTZoeE9taml0aGVLeHBaOUpPMnF5M1JidkhCREQ5K1FLMWhIU3pXUGhm?=
 =?utf-8?Q?h7zl2tKZw0MQgYabrslvVA2MC4zrW6hDyrqyYfir7GtE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5172a117-d0ad-43f0-74f4-08de1e577e93
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 23:43:46.9115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Ccoz0feOSDHmD+l4o+nQOR1eQaXyzeU8uV1SjmH5YQgNu/0hTMstAo3y3KWiJtQ+PiTRHg7Y3foTc+IcM7tgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6642
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

In Rust 1.80, the previously unstable `slice::flatten` family of methods
have been stabilized and renamed to `slice::as_flattened`.

This creates an issue as we want to use `as_flattened`, but need to
support the MSRV (which at the moment is Rust 1.78) where it is named
`flatten`.

Solve this by enabling the `slice_flatten` feature, and providing an
`as_flattened` implementation through an extension trait for compiler
versions where it is not available.

The trait is then exported from the prelude, making the `as_flattened`
family of methods transparently available for all supported compiler
versions.

This extension trait can be removed once the MSRV passes 1.80.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://lore.kernel.org/all/CANiq72kK4pG=O35NwxPNoTO17oRcg1yfGcvr3==Fi4edr+sfmw@mail.gmail.com/
Acked-by: Danilo Krummrich <dakr@kernel.org>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 init/Kconfig           |  3 +++
 rust/kernel/lib.rs     |  4 ++++
 rust/kernel/prelude.rs |  3 +++
 rust/kernel/slice.rs   | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 59 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index cab3ad28ca49..7da93c9cccc3 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -147,6 +147,9 @@ config LD_CAN_USE_KEEP_IN_OVERLAY
 	# https://github.com/llvm/llvm-project/pull/130661
 	def_bool LD_IS_BFD || LLD_VERSION >= 210000
 
+config RUSTC_HAS_SLICE_AS_FLATTENED
+	def_bool RUSTC_VERSION >= 108000
+
 config RUSTC_HAS_COERCE_POINTEE
 	def_bool RUSTC_VERSION >= 108400
 
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 3dd7bebe7888..2581a356d114 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -21,6 +21,9 @@
 #![feature(inline_const)]
 #![feature(pointer_is_aligned)]
 //
+// Stable since Rust 1.80.0.
+#![feature(slice_flatten)]
+//
 // Stable since Rust 1.81.0.
 #![feature(lint_reasons)]
 //
@@ -128,6 +131,7 @@
 pub mod security;
 pub mod seq_file;
 pub mod sizes;
+pub mod slice;
 mod static_assert;
 #[doc(hidden)]
 pub mod std_vendor;
diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index 198d09a31449..9ee8acc563de 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -51,3 +51,6 @@
 pub use super::current;
 
 pub use super::uaccess::UserPtr;
+
+#[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
+pub use super::slice::AsFlattened;
diff --git a/rust/kernel/slice.rs b/rust/kernel/slice.rs
new file mode 100644
index 000000000000..6ca91a4fd1f2
--- /dev/null
+++ b/rust/kernel/slice.rs
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Additional (and temporary) slice helpers.
+
+/// Extension trait providing a portable version of [`as_flattened`] and
+/// [`as_flattened_mut`].
+///
+/// In Rust 1.80, the previously unstable `slice::flatten` family of methods
+/// have been stabilized and renamed from `flatten` to `as_flattened`.
+///
+/// This creates an issue for as long as the MSRV is < 1.80, as the same functionality is provided
+/// by different methods depending on the compiler version.
+///
+/// This extension trait solves this by abstracting `as_flatten` and calling the correct method
+/// depending on the Rust version.
+///
+/// This trait can be removed once the MSRV passes 1.80.
+///
+/// [`as_flattened`]: slice::as_flattened
+/// [`as_flattened_mut`]: slice::as_flattened_mut
+#[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
+pub trait AsFlattened<T> {
+    /// Takes a `&[[T; N]]` and flattens it to a `&[T]`.
+    ///
+    /// This is an portable layer on top of [`as_flattened`]; see its documentation for details.
+    ///
+    /// [`as_flattened`]: slice::as_flattened
+    fn as_flattened(&self) -> &[T];
+
+    /// Takes a `&mut [[T; N]]` and flattens it to a `&mut [T]`.
+    ///
+    /// This is an portable layer on top of [`as_flattened_mut`]; see its documentation for details.
+    ///
+    /// [`as_flattened_mut`]: slice::as_flattened_mut
+    fn as_flattened_mut(&mut self) -> &mut [T];
+}
+
+#[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
+impl<T, const N: usize> AsFlattened<T> for [[T; N]] {
+    #[allow(clippy::incompatible_msrv)]
+    fn as_flattened(&self) -> &[T] {
+        self.flatten()
+    }
+
+    #[allow(clippy::incompatible_msrv)]
+    fn as_flattened_mut(&mut self) -> &mut [T] {
+        self.flatten_mut()
+    }
+}

-- 
2.51.2

