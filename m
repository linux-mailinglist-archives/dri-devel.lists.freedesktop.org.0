Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5553DBB4155
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 15:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44C710E7E6;
	Thu,  2 Oct 2025 13:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="j/t5yZOR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010031.outbound.protection.outlook.com [52.101.85.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5700A10E1B1;
 Thu,  2 Oct 2025 13:49:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gpd3r98Dsc/OGpCHdSipe1POTkZWogpqI1bL7DahsERcMvAy4ShSeWmfX6Cw/aeQxDLb4BO60ST8Ss32xaQU4DKmpbNfdhVngYSBwdZZyxWJstFN0vrZJdRgcgTtBJoOLpMMZVmu2PEzD6GMBuXbbnUSuVTP6/E5belg2kODHKOQ6k613GX80NWXR2iZ4Pa9LVZ3n9a0ho8swJff9SP5ihVmtCAxQmUW0yyVTRsSRXUeAPTBrlEV6y2iOUfCsIgVjxXM9g5Mblvkq5QgTwjobRrBcRrWoVB++nzGWEZqtLBcsg9LbDHN42l1M+S366yve6oWnaIxHoahsKXYZbSTEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cUxNMyot8WovzXEJh9GR33LC4OKur9mSzUNAvKSwsNc=;
 b=VvSHsBLcKHZ2ZSIr+MQKZrqJhIJ+6jSwgDzv7v80jI4G05aDeZZmdtb6ac6neJspbA7dVYfJRcTEbmQ+gPjC2CAuKyfd9HT4AE2KlBQ5IBTP7XyTfaUhW1i0SW9ImzIZlc4zcx8bRMh/n3X2OqSk/NcCyW5saDTDvbgLWsyga4avF+/6PF4G7mcgDfH2O+jDW3mgfJZ13/5K2KhaLOg5UoeB+5G+zbWbUGKh5AMy6HFUrinKC6VaBRzDdZEOaamZL5ofbO71IwfCQPlcO3ofB6q14f9Ts9+r+HnR3kKG539T3DWSS1jP5JWi7Ts9cxeEKz1jPQ4urX/Mrol3X4Ehjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUxNMyot8WovzXEJh9GR33LC4OKur9mSzUNAvKSwsNc=;
 b=j/t5yZORNbBSHPmIulc5SpR+wlWOMMVwk6R0Nh75B9wA5SDajVZM/Gtnzd0VZGNtYAFbIwacveUo+7C517xNKNFqwN5F2jFBQI/Ptn2TLmq11S2l3X128XTL7Ak1okPulAc0sd6NEDz/kD1q3c7IvrNuwBGPlbAGum47d+Z1uH5cdw9Mgf6Vl8PNkC5ES1YiJkZzr5+iRbMHYcx4dTe/LM0Zq9V5FUrbFd+yBkuAh8qMcUZ0Ro5VtP/xnWVetzw5QZu7D0SeYUJQEGd/zWfipdS8ucODtK74E2wQe3ZiW4BQyLRJ0HzLLZGQ1Cfe+GWx+/hncUAdPBbSyLwUGujKrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA0PR12MB7092.namprd12.prod.outlook.com (2603:10b6:806:2d5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 13:49:07 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 13:49:06 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Oct 2025 22:49:03 +0900
Message-Id: <DD7VU4239GS2.2MKVFPBFEY1R4@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v3 08/13] gpu: nova-core: Add bindings and accessors for
 GspSystemInfo
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alistair Popple" <apopple@nvidia.com>, "Benno Lossin"
 <lossin@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250930131648.411720-1-apopple@nvidia.com>
 <20250930131648.411720-9-apopple@nvidia.com>
In-Reply-To: <20250930131648.411720-9-apopple@nvidia.com>
X-ClientProxiedBy: TYCP286CA0088.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA0PR12MB7092:EE_
X-MS-Office365-Filtering-Correlation-Id: 9486cffb-614a-4e81-1d2a-08de01ba7499
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dEtsUUpvay8yQ0ZnTUQ0L00xajRNc3poMEtjNTEwUFdxNCtxVTFldDNOcWJZ?=
 =?utf-8?B?dHRtWll2OGpTRksyb3MyVHg3ZXN1bXcyZ240WmIzTm5reWQ3R3lFWHFtVGdp?=
 =?utf-8?B?Uno1MUFaRmRuVEZyWG1UdVVwMnl3NWF5b25SSGhPeWtMek95NE1sU05IUHZ0?=
 =?utf-8?B?bGIxbE1UTWVVcU1KeFBjOWF6NHRhU1VrZWNjQmFFRTROWndsNHVCNVVtL1h1?=
 =?utf-8?B?dVJhTkVmbXZUdkpXZGpQRy9kV3FvMWNPTk5UbnlCOEpESWRZL1I3U2U0d2Zp?=
 =?utf-8?B?SGtNbUpsNWtweEVUWDZuNC9wYmNWK2E3OG9SRitxZnM3bWhxYW1iYjd2d2Jp?=
 =?utf-8?B?L3J2WGg0OFJMUCtBTnc1RHpDQzRLUjhiVkRSQWFFZTBHdGFKRmdsdXRyVTFG?=
 =?utf-8?B?M1c2Mm9FQkJjdGlobnlLeGZVQlpyK3Yyd3pycFJuMVdiclFiVjFnTVdhRjd6?=
 =?utf-8?B?b3JMOC9VZjNKb1FUelAxMHN3RldOQWRZRXd5OUc0SHdtTGMrUEtYVGJBK3JW?=
 =?utf-8?B?d0ZUOXpmanB5VG9rRWV1YjlmSDNmUXMySEhna3U2MTh3Z2lxRVI0Vk5DY0Jn?=
 =?utf-8?B?U2JxQ24rc1d5VjllajViNXhmRS9HR2Y5U3dMTHVUYTB1OUR0cE9hOExmQ1FQ?=
 =?utf-8?B?ZnhzeGdrOXhoc0hFYVpsdHJTU0xQWTZzM1VmZU5iOW1WR1NnTEpBT3I3Rmcx?=
 =?utf-8?B?ODJveHhqajBTRDVweWIxNjZLd0lGUDBjZ2FNOG9wekJzNjBhSXhZMUxsTVVB?=
 =?utf-8?B?UkVnUWVuQU1qMWZwNGxuZnllTU4wNzJTckFwNFhweVJjNmVXaHAxYlJiVmdP?=
 =?utf-8?B?b1ZGZVVEMGJBam5xc20zaUhCOGp0V0x4U3dNR0FUeTlNcnkxSUg3dElGRVRR?=
 =?utf-8?B?MzZlQWltK2NHWmwyaTY4RWl6UzFhUW5uV1d6SlpLMUd4SG5jSnp5bVB3Q3ZL?=
 =?utf-8?B?VzArSzhCS2JHaWFnM21LY3A0ai9URFpxOENOQ2NLQzM0dkFNRjVNQ2o2MEpj?=
 =?utf-8?B?SmxvM0wvcmFQR1JraEZ0M3IrRXRuWjhMaGI4UmpiVk1IMTAwTUNzQVV4RmV6?=
 =?utf-8?B?bWhDNHFFcUhHeWxZNUl3ZldaTkVmR3VVc1FLTURzZ1l3OUhGN0RGMVhzU3Rq?=
 =?utf-8?B?M0NkSUc1WC9Hb25RNFBQSjU4UG5IYTRKcXBTdmkxd1NsWkkxUG9iTzVHRGJj?=
 =?utf-8?B?Z3ZJQmMvckI2Qm1tMWdEeGlQdExmSkpmQXpCZE9hRVBwUGp5K1dBc014VDhr?=
 =?utf-8?B?SFdYVDI5a2ttMUJkeFNzaDhtdXF1R3I3cXExc2xJQm50TXZkZmxOWFRkejFF?=
 =?utf-8?B?Q09kTHdrbmFtOGRvcDdYSUk4alpKVEZJMXZCMzMvUkN5OXNWQ2JUM1dSTzRx?=
 =?utf-8?B?c2tHSjZHQkJDckxYTHkwQndML0F1a3JPMzZTZzVLcWtrRjgxK3pjSkdtLzFj?=
 =?utf-8?B?U0J2UE45MjR4aWFTZHhhQ29iM081clMxNnhqMUt1OC9iSVV4SWh5SU15WXRV?=
 =?utf-8?B?U2laRXZJV1EwS0xwYVE3Z1RxUjMrcWdmdnM4QjRQSytIaWtzdW14aDBKWWJu?=
 =?utf-8?B?K1EzUUFMcmVUMlFoZDNYZzhCN0dmVkVRK3hETmMzOXlNSnAyY21xVVhVcklr?=
 =?utf-8?B?YzB3c1dTK0dXOWFRN0pMQUV6bGYwdCsybE40d2JGRUVLS1pPNkFReUtnUUtW?=
 =?utf-8?B?UktwSjd3QW1kTUJhRjh1M3J6RTZGMG9meitYeDI1dDV4azN4RHg2WERJbzF3?=
 =?utf-8?B?bUFIdkRteWEzRjNvc1BHMUtPcy9VcXpSM21rcmg3L3VvZVdSdVBJb2grMGsw?=
 =?utf-8?B?K0RHYkd3N2VuNkg1eFdaS3IzSnA5dHN0azFGVWJnZmJ2TEZzQVByNC9tdW0z?=
 =?utf-8?B?WkZyTUJTMU1SbE53c1lpUWxIYnBnVFp1bDJLbERTc3hoUmVvV1ZFTVQ0SWJP?=
 =?utf-8?B?T3hvTWtQK3pYTE5CemZmb0tXSnAvZHNiUjdWQ2s2Y0twbm9qaGl0RGlyRDVr?=
 =?utf-8?B?OWs3bXVNVTZBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDJBbFZNTUVqTUVUcE9qWUFUeUNKRFgrOFZrZ0NlSVBIUHVreHJSZmtjcmJ6?=
 =?utf-8?B?N2NMVFdLcDFXSUlvQ2dBUEwzMlljV0V2MDdPLzFHaGZockNET1dhaHBYSk92?=
 =?utf-8?B?aHUvcGMxMkUwcTViT2JrRVBDa1FFRUg2VzY4RldrcU45U2RMWUNvK1dSNzdl?=
 =?utf-8?B?STJ4RE9lR2thVGh6WU1PVGVYM3RFQXRSOEhJdlJ4TUVPenVuMUVjalFabUlY?=
 =?utf-8?B?Y3puNlpscllWRExtTTNRWm0wbzRONzZIU3lNcE5LaWZzOHNNZzlZNlhOTXQ3?=
 =?utf-8?B?ekdoRVZ1ckVoQUtKYVNLUWZqelp1K0Z5eDZ2NGdxZVBWb1lSUlBoVWJUaE9K?=
 =?utf-8?B?KzdKY0ViTk5BSFdWWHpyL3RFM0hCN2h1YnlBZWhUdXVKQTBjSnNEdTUyTG44?=
 =?utf-8?B?Qk91WVhlTEJBQlQvVEpQaUNrMFNXWXp1NVM0Z2xGSm9tVVhtV2hCUUV6QkNK?=
 =?utf-8?B?NG5NOER3bTFGSmFITkdKZTZCNzZtT1BlUHc4cUZGMzhPelNaWkc3VFRSbHdn?=
 =?utf-8?B?WjRXZTVhVU5BamNSV3EwVzlhWU40VVlrcGpoeHRKdzlCeHhYcERYTVdRdG01?=
 =?utf-8?B?YVY1VFYrSnlVSWhma29rd01iVXM4RFVHZUpxYU54dUxuLzNMS3hPeEVyZzVB?=
 =?utf-8?B?NnBxZE1UMUk4NFBsTUNQUGFINXhkNVcwMVRkeWs3LzN4Z0J4QnZuQWNHRmI3?=
 =?utf-8?B?U3ZxMnZKNnVCZTZDL0JLb0FaOTU2TVEzSzBXVkx3eEIwSkUzbG5ocjZkVFFm?=
 =?utf-8?B?UDRMbGs2b2lRZHlxRVNUOTFoZ3lPdk1lcDBNWmhTc3BiRTVnM0xZb2QzV0I3?=
 =?utf-8?B?aEl5QXVldzB0akZPSkpqREkxb1RCVmFjeEhRYWh0WStTeXNoWHJaNmdjaUx2?=
 =?utf-8?B?cldSaHVWeG5DdXdEQXhTWHV3MDlXZC84N0psRnhleCtJTmdnWjdpN3FwNmJw?=
 =?utf-8?B?NElVWG1FRVpsdGZLZTRXN25xclRSdmVSQ2RaZ0MvWFNlM3ppR05hb3lTREdI?=
 =?utf-8?B?clJ0WklLTEdrb1E5SG5tUWJUUzBsV0hxaEtFbjJwR1NTUjBwYzF5MkpiMURw?=
 =?utf-8?B?Vko5TzRTTmR3eFozVFF6Y3ArTTR4ZEY3NHE2a2Q1Y0hvdXJ1c3h0YUZZQWZZ?=
 =?utf-8?B?Sk1TQmZDOEdkQ3BaM2dmeXVlZ1NPOG52bDFqY3RiUmN1VVJOVlQzVnN2amlo?=
 =?utf-8?B?c0pYcG5IRTNFZDhpdGVUQUZETmowZjhpa0NSRWJRSWxYVmlJcXRPSVRxME1E?=
 =?utf-8?B?dVdWaXIrWUFGZVZHcVVQMXZ2UFZlVWVlVGc1a0k5TE0yRE9idWhjcklLSmlB?=
 =?utf-8?B?L08xaE1YL2xhMGlBdmNVVjFORDc3TVRUWWp5MDNrby96bmRmY1Ewc0dvaXN6?=
 =?utf-8?B?bTI0allpUWRpVlc5eWx5ZHdveXY5SW5ZdkpLK2VNSXZVQ2JLbUc1WERMMTFu?=
 =?utf-8?B?dkNsUEVUanJsWUdhMHJ6cERNdXg2VGZTNVI5bFJwbG16WGxydVdzak92amlL?=
 =?utf-8?B?MTdLa01NdytnN29zMHJJazM2empQS1JkM3Z4L3MrK3BKMXNuMm0yZVlEZE1E?=
 =?utf-8?B?UTdsS21jakQ4eWIvOCsxOWZ6MTV4cUhiM29waDh5YTNESTJQR3hObmx6L1Fx?=
 =?utf-8?B?MDhnM0FtZHF2SGRyS21XbndnN3dwUmVmS09yREk4TE41a3dtUnByRG12NVow?=
 =?utf-8?B?NG1oc28vbXZtaTlWQ29oN0dIakg5dmVhRXd4czk0L1AzVktObU5pbkUraWw4?=
 =?utf-8?B?MHZJclZhbXgzS0FqTlAzMmErcjBKUEVlNFM4a2dJaTJqZTg2VVhTSUVOaDk3?=
 =?utf-8?B?bHUxUFFXQnp6TmFKODQrNU0wUTFsVnNCQjlpOC9jSTh6NXJSaFNMb1MyTGtW?=
 =?utf-8?B?aVZad0NIajFjRE10NnQ0NnRYOFhCaVF5NExkWDc0OENnUDRjc21lalk3eUVH?=
 =?utf-8?B?RjdqL0FsbWxpdm53dDBRQ2Q3NHduTWNjazcvcHordSs0eVNaaWdTNTFOZnJH?=
 =?utf-8?B?SVdHbUpEdURycXR0cWY3N0ZvQSs4UnpqdU5FamMvU2YrYlVNaEdMcUVYQk8r?=
 =?utf-8?B?Z2RNeUdKdGprUkd3K0haUkh6aWl4K2lFVWw0VmpISngrVVRINjhYZ2QvSFBh?=
 =?utf-8?B?WFNKN1BJamk5VDB5TzA5YWdobVNSYTdvYWE4azRSYzE2NWlKSkJ3NkpjQ2Ir?=
 =?utf-8?Q?h5it8hHnInA9RnokfR4n5T93MFCaP7SPHayWoGJUNzHz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9486cffb-614a-4e81-1d2a-08de01ba7499
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 13:49:06.8992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4bGOAYSoxbTXLK7od+EQGoTcFkQjNZLfPS0fY+JAMHvrb+ZztxkJY71LIWxaIYoIsS6Aq2nyPtelH4DLvx8B3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7092
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

Hi Alistair, (+Benno as this concerns the `init!` macros)

On Tue Sep 30, 2025 at 10:16 PM JST, Alistair Popple wrote:
> Adds bindings and an in-place initialiser for the GspSystemInfo struct.
>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>
> ---
>
> It would be good to move to using the `init!` macros at some point, but
> I couldn't figure out how to make that work to initialise an enum rather
> than a struct as is required for the transparent representation.

Indeed we have to jump through a few (minor) hoops.

First the `init!` macros do not seem to support tuple structs. They
match a `{` after the type name, which is not present in
`GspSystemInfo`. By turning it into a regular struct with a single
field, we can overcome this, and it doesn't affect the layout the
`#[repr(transparent)]` can still be used.

Then, due to a limitation with declarative macros, `init!` interprets
`::` as a separator for generic arguments, so `bindings::GspSystemInfo`
also doesn't parse. Here the trick is to use a local type alias.

After overcoming these two, I have been able to make
`GspSystemInfo::init` return an in-place initializer. It is then a
matter of changing `send_gsp_command` to accept it - please apply the
following patch on top of your series for an illustration of how it can
be done.

Note that I have added a new generic argument for the error returned by
the `Init` - this is to let us also use infallible initializers
transparently. The cool thing is that callers don't need to specify any
generic argument since they can be inferred automatically.

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/=
cmdq.rs
index 5580eaf52f7b..0709153f9dc9 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -247,12 +247,20 @@ fn notify_gsp(bar: &Bar0) {
         NV_PGSP_QUEUE_HEAD::default().set_address(0).write(bar);
     }

-    pub(crate) fn send_gsp_command<M: CommandToGsp>(
+    pub(crate) fn send_gsp_command<M, E>(
         &mut self,
         bar: &Bar0,
         payload_size: usize,
-        init: impl FnOnce(&mut M, SBuffer<core::array::IntoIter<&mut [u8],=
 2>>) -> Result,
-    ) -> Result {
+        init: impl Init<M, E>,
+        init_sbuffer: impl FnOnce(SBuffer<core::array::IntoIter<&mut [u8],=
 2>>) -> Result,
+    ) -> Result
+    where
+        M: CommandToGsp,
+        // This allows all error types, including `Infallible`, to be used=
 with `init`. Without
+        // this we cannot use regular stack objects as `init` since their =
`Init` implementation
+        // does not return any error.
+        Error: From<E>,
+    {
         // TODO: a method that extracts the regions for a given command?
         // ... and another that reduces the region to a given number of by=
tes!
         let driver_area =3D self.gsp_mem.driver_write_area();
@@ -264,7 +272,7 @@ pub(crate) fn send_gsp_command<M: CommandToGsp>(
             return Err(EAGAIN);
         }

-        let (msg_header, cmd, payload_1, payload_2) =3D {
+        let (msg_header, cmd_ptr, payload_1, payload_2) =3D {
             #[allow(clippy::incompatible_msrv)]
             let (msg_header_slice, slice_1) =3D driver_area
                 .0
@@ -272,7 +280,6 @@ pub(crate) fn send_gsp_command<M: CommandToGsp>(
                 .split_at_mut(size_of::<GspMsgElement>());
             let msg_header =3D GspMsgElement::from_bytes_mut(msg_header_sl=
ice).ok_or(EINVAL)?;
             let (cmd_slice, payload_1) =3D slice_1.split_at_mut(size_of::<=
M>());
-            let cmd =3D M::from_bytes_mut(cmd_slice).ok_or(EINVAL)?;
             #[allow(clippy::incompatible_msrv)]
             let payload_2 =3D driver_area.1.as_flattened_mut();
             // TODO: Replace this workaround to cut the payload size.
@@ -283,11 +290,22 @@ pub(crate) fn send_gsp_command<M: CommandToGsp>(
                 None =3D> (&mut payload_1[..payload_size], payload_2),
             };

-            (msg_header, cmd, payload_1, payload_2)
+            (
+                msg_header,
+                cmd_slice.as_mut_ptr().cast(),
+                payload_1,
+                payload_2,
+            )
+        };
+
+        let cmd =3D unsafe {
+            init.__init(cmd_ptr)?;
+            // Convert the pointer backto a reference for checksum.
+            &mut *cmd_ptr
         };

         let sbuffer =3D SBuffer::new_writer([&mut payload_1[..], &mut payl=
oad_2[..]]);
-        init(cmd, sbuffer)?;
+        init_sbuffer(sbuffer)?;

         *msg_header =3D
             GspMsgElement::new(self.seq, size_of::<M>() + payload_size, M:=
:FUNCTION as u32);
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/=
gsp/commands.rs
index 69df8d4be353..6f1be9078853 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -79,10 +79,12 @@ pub(crate) fn build_registry(cmdq: &mut Cmdq, bar: &Bar=
0) -> Result {
         ],
     };

-    cmdq.send_gsp_command::<PackedRegistryTable>(bar, registry.size(), |ta=
ble, sbuffer| {
-        *table =3D PackedRegistryTable::new(GSP_REGISTRY_NUM_ENTRIES as u3=
2, registry.size() as u32);
-        registry.write_payload(sbuffer)
-    })
+    cmdq.send_gsp_command(
+        bar,
+        registry.size(),
+        PackedRegistryTable::new(GSP_REGISTRY_NUM_ENTRIES as u32, registry=
.size() as u32),
+        |sbuffer| registry.write_payload(sbuffer),
+    )
 }

 impl CommandToGsp for GspSystemInfo {
@@ -95,7 +97,7 @@ pub(crate) fn set_system_info(
     bar: &Bar0,
 ) -> Result {
     build_assert!(size_of::<GspSystemInfo>() < GSP_PAGE_SIZE);
-    cmdq.send_gsp_command::<GspSystemInfo>(bar, 0, |info, _| GspSystemInfo=
::init(info, dev))?;
+    cmdq.send_gsp_command(bar, 0, GspSystemInfo::init(dev), |_| Ok(()))?;

     Ok(())
 }
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-co=
re/gsp/fw/commands.rs
index 83c2b017c4cb..e69be2f422f2 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -4,31 +4,50 @@
 use kernel::transmute::{AsBytes, FromBytes};
 use kernel::{device, pci};

+// Ideally we would derive this for all our bindings, using the same techn=
ique as
+// https://lore.kernel.org/rust-for-linux/20250814093046.2071971-3-lossin@=
kernel.org/
+unsafe impl Zeroable for bindings::GspSystemInfo {}
+
 #[repr(transparent)]
-pub(crate) struct GspSystemInfo(bindings::GspSystemInfo);
+pub(crate) struct GspSystemInfo {
+    // `try_init!` doesn't seem to work with tuple structs. Work around th=
is by declaring a regular
+    // field, which comes down to exactly the same.
+    inner: bindings::GspSystemInfo,
+}

 impl GspSystemInfo {
-    pub(crate) fn init(&mut self, dev: &pci::Device<device::Bound>) -> Res=
ult {
-        self.0.gpuPhysAddr =3D dev.resource_start(0)?;
-        self.0.gpuPhysFbAddr =3D dev.resource_start(1)?;
-        self.0.gpuPhysInstAddr =3D dev.resource_start(3)?;
-        self.0.nvDomainBusDeviceFunc =3D u64::from(dev.dev_id());
+    #[allow(non_snake_case)]
+    pub(crate) fn init<'a>(dev: &'a pci::Device<device::Bound>) -> impl In=
it<Self, Error> + 'a {
+        // `try_init!` interprets `::` as a separator for generics, use a =
type alias to remove
+        // them.
+        type InnerGspSystemInfo =3D bindings::GspSystemInfo;

-        // Using TASK_SIZE in r535_gsp_rpc_set_system_info() seems wrong b=
ecause
-        // TASK_SIZE is per-task. That's probably a design issue in GSP-RM=
 though.
-        self.0.maxUserVa =3D (1 << 47) - 4096;
-        self.0.pciConfigMirrorBase =3D 0x088000;
-        self.0.pciConfigMirrorSize =3D 0x001000;
+        // Initializer for the bindings type.
+        let init_inner =3D try_init!(InnerGspSystemInfo {
+            gpuPhysAddr: dev.resource_start(0)?,
+            gpuPhysFbAddr: dev.resource_start(1)?,
+            gpuPhysInstAddr: dev.resource_start(3)?,
+            nvDomainBusDeviceFunc: u64::from(dev.dev_id()),

-        self.0.PCIDeviceID =3D
-            (u32::from(dev.device_id()) << 16) | u32::from(dev.vendor_id()=
.as_raw());
-        self.0.PCISubDeviceID =3D
-            (u32::from(dev.subsystem_device_id()) << 16) | u32::from(dev.s=
ubsystem_vendor_id());
-        self.0.PCIRevisionID =3D u32::from(dev.revision_id());
-        self.0.bIsPrimary =3D 0;
-        self.0.bPreserveVideoMemoryAllocations =3D 0;
+            // Using TASK_SIZE in r535_gsp_rpc_set_system_info() seems wro=
ng because
+            // TASK_SIZE is per-task. That's probably a design issue in GS=
P-RM though.
+            maxUserVa: (1 << 47) - 4096,
+            pciConfigMirrorBase: 0x088000,
+            pciConfigMirrorSize: 0x001000,

-        Ok(())
+            PCIDeviceID: (u32::from(dev.device_id()) << 16) | u32::from(de=
v.vendor_id().as_raw()),
+            PCISubDeviceID: (u32::from(dev.subsystem_device_id()) << 16)
+                | u32::from(dev.subsystem_vendor_id()),
+            PCIRevisionID: u32::from(dev.revision_id()),
+            bIsPrimary: 0,
+            bPreserveVideoMemoryAllocations: 0,
+            ..Zeroable::init_zeroed()
+        });
+
+        // Final initializer for our type.
+        try_init!(GspSystemInfo {
+            inner <- init_inner,
+        })
     }
 }
