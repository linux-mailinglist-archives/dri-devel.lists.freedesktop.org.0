Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C64C0D7E0
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 13:24:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC31910E464;
	Mon, 27 Oct 2025 12:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QiZG5RtZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013009.outbound.protection.outlook.com
 [40.107.201.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A51E10E464;
 Mon, 27 Oct 2025 12:24:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQU70yElwglC7nH5JVI4ZjocWHhM/3gLyECWO0ypSCfNE0nKdiPiEHspAzALw/r3p6YYaAK1qrtyjJKRQCReQbTPDNRuJCP2qlw4GuDhwSzCbS5YH15xS8SIWwrspcnVnvwbo2dvbpcAkOrhjYDIRnzeYP2WvTiLiZmswQRMBIqq/huxkI5zQPVgzamfF/bJG2CyQieF5YYHyD3kC9aFlDJNv6tNMQHykQyKx2PTiMd+7NELQKml8IDDkSP197e1OU7cRBdeQEwjYfGqUiPOvwUQtiyGG1Vr9nt/lZb4JwoZR0qJieAz0KSB7UF5VtOrSlaBu8QUkJkh2pTF0Tpevg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJ3cbXcLiNbX+ehGbCsCLR045v1UwFiZ8onxuE+URpw=;
 b=xtZy57yRaR78QoS6iTJp3qTMSihCuHO+a9S++srFvsxPoJFWlkTk3ykJlfjfjMKqQ6/tswKKnRIfyW12oc8chRldCAc4ZDrrbLqD/jqciBMe7zEPIrRQSlsX520wvG5qHoQdq86xdN/WEuFroo8p8d2PC7dbtOlHq02D5SRweVABSGM5MZYVAq1o02kYnT4FQXKFHmaIxDVadJvt3haUoNlyvUBF1pcYxqEo5yRvO9hTC2xKWdyvZdmMquQIxfXITW+Qq2U9HupY/07c6sZtcR4AGs/JzFgBqphasV5H9KeK0QhyM7IIYccs+eDAPFXHoUbQO9RmhCzaDhs21mfftQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJ3cbXcLiNbX+ehGbCsCLR045v1UwFiZ8onxuE+URpw=;
 b=QiZG5RtZ0IQJhKPWGqFTng12V8cQpPzFKJlCQP8pTkPaIKfYQubxdkupTKEqjx6cCXo5elY9YBTRJ7s158wXN87b2YA3wDMaTuMrVowdKxBVN8DOuJQekxHI+iD/1os+fhpS6yiUsv3tbcHOAiaGWrLnKOZwp3VlED3Sg3evhazGByAoaKJ55uYwkD8PvvToZyLNOsqLlEJVcvWMw981NeAEX33LH48me+hqadlIyansFz25tQh0BgwGJ8/oHDXVHy8ITSkOFdtnrG8d06V9zeS6jIZjjzNXZHvte/JLigjoLBWTCekobIrddyYInuatZRAejynQ+OkO82ECAOUK/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB7711.namprd12.prod.outlook.com (2603:10b6:208:421::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 12:24:37 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 12:24:37 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Oct 2025 21:24:34 +0900
Message-Id: <DDT3P1OF2JD9.2PS7PL80L5KWQ@nvidia.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 0/7] gpu: nova-core: remove use of `as` for integer
 conversions
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251026-nova-as-v1-0-60c78726462d@nvidia.com>
 <c64447d9-3e9f-40d4-944c-327f3f7e26ba@kernel.org>
In-Reply-To: <c64447d9-3e9f-40d4-944c-327f3f7e26ba@kernel.org>
X-ClientProxiedBy: TYCP286CA0310.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB7711:EE_
X-MS-Office365-Filtering-Correlation-Id: 02590572-a059-4c3e-e85f-08de1553cb6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODNOd2diMVA4ajBEcng5VnVvdTk4YzFpcm5yZ0pZVUhoRis1bEo0a2VrKzhC?=
 =?utf-8?B?dGcwYWh4cEhqSE43d004RzlsS2V3bVBuS0dVUStRS3BWSklXRC9JS0JXMEls?=
 =?utf-8?B?dnNsVGM5SnBkQkFjanB0UHp0RUJwdFQrZ0dHQ2dqeUptQU5VTjI0UkU2azIx?=
 =?utf-8?B?RlQ3RkJlb1liY0hGaTlWbUhEWGxBalZkbVBjRnNpVlNhWStQb05DN3A5K2Ew?=
 =?utf-8?B?czV5cE4vQzRIRUFWbTZWY3UvVExQcmNvcW1JSHJrdWJFUXV5Q2hYQ3VpV1pW?=
 =?utf-8?B?TndkYTJLeDFXeHllaEJYMm94czFZZHlRTnhPYVpzcUEzZk9CRldjZVNYWjJI?=
 =?utf-8?B?bVEzOTlJOEhHSzFTZklFa1FsaWt6MjFsckhJVklwTGE0YWlxc1RhTjZjbXdX?=
 =?utf-8?B?bWY0dTlCVkxKcmpxaVpPNG5HTDNLQk1semkyelRwWnpiUnpUWS9uYTdJbThV?=
 =?utf-8?B?Qkh1andQVXNoMzFnMnRiZHJKd1hpVEJmc04yc1lqcmQvbmxBYUtqeERzTmpx?=
 =?utf-8?B?WmZRbWUxRmphUmd4b3M0QllYQlFCUE1vNWRKbktxYVRsVDh3eklCUkVWNXNt?=
 =?utf-8?B?MkhNbWxZeXY0VmlQRTVYa0Z4MWx4eDJvRjk2OEYwR0FhNU14U0ZtSkpGUnc4?=
 =?utf-8?B?MWcyL2tHRjllallFQWZrRTl4VlNCTmpLV3IwTzBvV25LTjAvS1VuajdaUG0v?=
 =?utf-8?B?azlvUlE2S3lFWmFHdTFsczlId1BreHpNNnlDbUpCcllMalhyUU54V0hIVXRV?=
 =?utf-8?B?cWk3aFBPUjFIM3d3bTNJMFdEWXUwZGZiemdNM3dIVTBmMFFoY1ljT1l1dkVp?=
 =?utf-8?B?OHNualdFM3Y0b1FBTXJHRU1laDRYaVpsZzc1Ui9Pc2x4MWovak1RQjhyS2ZC?=
 =?utf-8?B?MnJ5Ny9raGk4bmJldXZRUXBsWXhtSGJFN3VBMnlJUHFPNUtJeU5zM1liVWNH?=
 =?utf-8?B?VS9zYnpXMFEweGpZc2krUG54NkFITUdyNDROZzNxeWJZOE1KV2pRN3VDbXpU?=
 =?utf-8?B?emdQekdyVkREc2RZKzJHc1ppUytRQ0tHVDgzbU82VG9QWHZSeXgwaEl1RGRx?=
 =?utf-8?B?ZzVHMEJhQ2RxYnlZN01YRjRkTldYblNmVUJ4UEN6U3VqeGQ2M2dHdmIwT0Ru?=
 =?utf-8?B?MG9rYzRFcE5wSEFmaS9rKytNN0RwblJUVmlRNHdsUVlmdVJRbHVMQms3T0Iy?=
 =?utf-8?B?dUFYajY4cjhxUCt1MzM3MTNVUDlScjA4RGZDaVhzNFJlY042dUZja0ZBL0JM?=
 =?utf-8?B?RGhaenhOdExQTzJsd0lDSE9lSGV1SWdzdFVRVU82RGJndGJ1NGdJUDdyUm9B?=
 =?utf-8?B?dVk5SStCL1NOL25hQ05KUXdzNjhCcmFwL2J5VWJ5SVNycUxvSjNONnFhMlI4?=
 =?utf-8?B?VXlsdG1CTThVM2REQ2JjNlhZZjRJcmFjWE5sMFFGODZqa21hZ21jckx2R2xW?=
 =?utf-8?B?UjNaTVlsaGNtekFjSzZBT2lZamorQit2VjJoSVpWNllvSTJIeUF4Z0FLVTF6?=
 =?utf-8?B?SGFDUlp0QWszR2VnSUMxSDlOUGIwbGVoZ0VKQU5xUUgzSno2NHFtcTBPRzJy?=
 =?utf-8?B?MXlTb2dncHcxZGwvcGV2aDFvcnlNWCsrQXg2N3pXcWVSS1VLNG9IcFVkVTE3?=
 =?utf-8?B?dXVWZHdjeWp1bWdmM0NoV3ZwWnRDUUlpUDNLbzZWRldHUkpMSjBvZGZJY2xq?=
 =?utf-8?B?ZlJNWWVUVHdHU2QvV2VrUjAvNXl0c3d4VG1MQkI2OGhuN0RCbVZzN2czK1JI?=
 =?utf-8?B?QVRWc0l3ZWtuMmNMQXZsUzBNcTl5b1B4djV1Y05aWnNFclorOFNHVE1aZ28w?=
 =?utf-8?B?ZDBhdGNKQzlPdjF0b1Uvb0hjOEpiejZvQlZjVHFpOUZhNHJ0V2pHaGRqZlEy?=
 =?utf-8?B?VE43UmNUNzJKRFZHUHduT0NsT05vOUZiYTNXY3hsSUtiNGdzUDFPUnNUZzg3?=
 =?utf-8?Q?r1y7HSgawaE6E3WNTWK9Rg5NRmySa4Fd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVBiYTdMUkRmcng4RHVkU3BmZndkMzJWM0dtNVV0SExjK0dlOE5CeFJPZnJF?=
 =?utf-8?B?WlppZHpJRXV2cGtVZjVVdnJJNG1yL2ZaZ0JxVHRnakxoL0x0MjZ4SzJvZy9q?=
 =?utf-8?B?KzM5emg2YzZSdGtzQXFNMUVCdmU4ZklSYm9rbkxQRnQ2VFg0ZXdidkpWd3RF?=
 =?utf-8?B?K1JyclhNUmwyTHd3U1BJYzV5ZGg2UjdhYXJQWGNqUXB2MDduR0NCQmNmR3R3?=
 =?utf-8?B?a3o5QVZ5SndFcXA0ZUMzcDBVdm5mTEx2aElGbjh2K0ROcjZDWXNSMml6Q0dE?=
 =?utf-8?B?TUgvVjBjWlFZZ2FQbEt0UGl4MjhjdmR0ampNWDc3VWZXMGdHYlo3V3BoNVRz?=
 =?utf-8?B?REs3a2J0T01WRXNtcnFlcytHTjQrOXhoVEpzemxISkRqa29scFdITG9FWFVT?=
 =?utf-8?B?Z3ZrWjdLZm8xVjNKOUtweTI4TFhyQ0ZIUXAzQUVsa3Y2VGE0Sld6WVBFYmRz?=
 =?utf-8?B?a2lNTkIyWmVDSUpwMHVSZHk0c2pkKzdKSFlacEVvR0h0Qk9YTC9FVHMrSDZY?=
 =?utf-8?B?cXZCNTNvYTNDTUhJd2J3azRTbUhjclhPVTZrOVNnNzZLZ21TSG95cE9lUmZF?=
 =?utf-8?B?RjRKdEVhM3AvM0c0emM5NzhlSVVpR0xjdFpUMzNPZnJ3alpJbjJFRW10aUtz?=
 =?utf-8?B?b2RJd0RhWEkvQ3dMa0NxYVhPbVBQSnN2eHNvKzBybHN6Snh5NE9xNkkvUkNU?=
 =?utf-8?B?NGNES0g1ZW9HSW56SWk5bGhRTGNSR015UVQvWHNWcDk1MWZscHNsZXdiWmlj?=
 =?utf-8?B?UHZxeGF6WWdqY1NoRllBNnR4RVNQRmY4MzR1bkRrRE9lU1V0QVNUeVp3M2xu?=
 =?utf-8?B?cGlrZDBMa3ZUbm9jeEd6azNnWCtvOCtJaWJoNTQ2N251YVZkUk1LNkRORCtK?=
 =?utf-8?B?c0hwOURPOTRHSXZOTnBzRmxmZUlkUndLVXJlQXFUWmpiUlBhaHVLem8zUWFw?=
 =?utf-8?B?NGQyRHdVN3ZVNFdTejVydCtMdGRzRzNZRE5DUlF1N2FoYy9CZU16d1E0WmUr?=
 =?utf-8?B?YlpuRmw2cjV1eEtwTVlMR0p4czBXbnk3c2F2RlpnaVJueEViNFBTQkhLN2xR?=
 =?utf-8?B?aDF3eVlmbHJuTzNGQ3htZUdXZm1sUTZEcWVTODJqRGhjUWQyWXVFbmxvRnpQ?=
 =?utf-8?B?RFZjTnZzUHZsZGtqTlVkTW5FWEtYeEFGVzFyQ2NlaHNWMkRmRncrNkkrQU5C?=
 =?utf-8?B?aTdlTFc3Vm9XKzRDMWlhRGZvdlk4MTZVUHVIWlRBTXhybERKR1M2OURrNFZS?=
 =?utf-8?B?TlNDV2RTMzQzTkc3ZXI2OUJDYnVRd0QxZ2NUS3BIcjY2ZTEzYmFoUjJXZGxv?=
 =?utf-8?B?cTFBZklxL1BaZER6UDkrSFlqKzhPQi9OdGJIWW9lcHlNS3lVd3JjL3ZYbTVK?=
 =?utf-8?B?NTlOYXpCRU9Sa2NsejFXcXFQRzNWakI5c2Zicjd1S2pCT2JqTjg2QVJQL1Rz?=
 =?utf-8?B?UzkrMXdpUnRhUit1WThKYjB4b1J3cDloR3NySTlyOGtPclVhdFA0bUI5VmVl?=
 =?utf-8?B?N2hxakF3Ti9tZ1c2c1l3b2tsVVd4VG1mUlQ4Q2FtNWRxdFVMR0xUNEVuSHV3?=
 =?utf-8?B?T1lWZlNBWmJPRW9HbWpQSGdZb2RHWitBRmpRUDh3elQ2YXZra1FEby9PRXl2?=
 =?utf-8?B?b00zeHEyVWVNWFEwRzVjZ2xrRkFkWDFPUlluZEJ0NWJoeGlIZ3NZR2lHZnFq?=
 =?utf-8?B?cUhnVk05NVp4TDVMUDAzVG9TakV0anRWbzQ1UUVhOFg1cnhHWml3bVhZYXJY?=
 =?utf-8?B?WTZiYzdkRFJ6VE9HNFRXbFNWZjFzR0tNZGlVL3NuYmEwYWEwN0hNSlVjendr?=
 =?utf-8?B?T2VIb3FGend0Nm02c25TVWEyZWlCUUVPcHdtdHViSnpMUzNKS0JtV1RCL3Bz?=
 =?utf-8?B?N0tNRDFZQWJ1ZHVFbEZvS2JQejJEV004cTdhT2FqTDdTalB0ZEhVdTVna2dZ?=
 =?utf-8?B?ejF0elFlZVZOc2FTN0ZMYmtHYzQvdTJmUjVhOUFrK2FBZkVqekI0Vjd5Q1Ns?=
 =?utf-8?B?NmhTNzhlcHlQaFJNV3FoeXhEcmtXRGdrSHhFZEExdmFkcDFEc3NmQlRxTFRz?=
 =?utf-8?B?WFZGVEhzT1V3dG9rRlZJcjBRUmVkbGwvbE9XamNNZGlMOThGM2Z6UzhKN0tD?=
 =?utf-8?B?YjQ0Tk0zdFNNNDVFV0NOWE03MGtWMDhOdFI0Z1BZWjMxaWk5NEQ5ZVR4T2Yx?=
 =?utf-8?Q?BPRNdFQ4MLcI5igo71Ol92REepwl/iuT80j/KktrwZcr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02590572-a059-4c3e-e85f-08de1553cb6d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 12:24:37.4205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /S33MLqU0++XUsB8ApFeSyi8bc5MEwpMBRPN+aUoPEfppxKui6OHRgYyoUmmWtJga1eb6At9VGuKrWxRq2WN8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7711
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

On Mon Oct 27, 2025 at 12:35 AM JST, Danilo Krummrich wrote:
> On 10/26/25 3:39 PM, Alexandre Courbot wrote:
>> This patchset tries to eradicate the use of `as` in nova-core, by using
>> existing means and introducing new ones.
>
> Thanks a lot for working on this cleanup!
>> The first 4 patches use the already-available `From` and `TryFrom` trait
>> where it is possible or advisable.
>>=20
>> The fifth patch introduces a new module that proposes conversion
>> functions for those that are infallible under the current build target.
>> This is done through a set of const functions, and the `FromAs` and
>> `IntoAs` extension traits which, as their names lightly suggest, offer
>> conversion for those types on which the `as` operator can be used
>> losslessly.
>>=20
>> This new module is put to use in the sixth patch.
>>=20
>> The idea was first suggested by Danilo, and I hope I captured it
>> properly. :)
>
> Yes, this is what I thought of.

Great!

>> As Danilo suggested, this could eventually find its place in the kernel
>> crate if the implementation is deemed to be fit, but for now let's
>> review and let it mature in nova-core.
>
> Yeah, I think this approach makes sense. Though, I think we want to move =
this to
> the kernel crate sooner than later, it's definitely something we want for=
 core
> code and other drivers as well.
>
> Depending on the initial feedback, it might even make sense to do it righ=
t away.

Moving to the kernel crate sounds good to me, but this work has been
initiated from the Nova GSP boot series and is now a dependency of it -
so taking it through another tree than `drm-rust` would delay the GSP
boot some more.
