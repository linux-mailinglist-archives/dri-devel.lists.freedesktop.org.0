Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FAAAE070D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C58710EA45;
	Thu, 19 Jun 2025 13:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="l1fq/RoX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2082.outbound.protection.outlook.com [40.107.101.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C12210EA47;
 Thu, 19 Jun 2025 13:25:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=txz5ZnKdEMTnI/Dw9JjPKIMQye5LsKQnKhtRFxo4pHMmNMnyET0/Lbk2lyS6ui4bcFWaH5jaR3oAUyeWQXVaUDNPxVhZxzuoOzdWH9eP8fBHMNlSTRhlKcYtyJsAGlGT5CT7HkNkNMw7jF2OG+AvsM9q5jfvtZpNADaBAIFz9mLDylc16TSePqWNsM9BoO5UXEEEplPu68TXy4jnP4BOeuUE7iaBgIpP1BlJYKXRhL7hORi/XfCCfrtG9zuIdurN/odL7iIVAkka9rBEClRumJINwFhvQ13L74DzbQv4Z1Km6Rz4Twr3h0MHCwua6L5puzOsUgAwrGQHOm0z3DjjwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfJbH/ZhGXwlZOxN0riKJtDHu6rs6f6W8vPOAcOauTY=;
 b=qDhRbGmz37qm+OhDlaQxMLKfP7NEjeb+SEix0YON3UXukRj1MXgQxjz+9SmQGeng3VyE1ET3EytnyWDTIHfCWUmz0jXXyC1ZUBAkO+PdH8z+lMNAUTbG+sF41SY/5JDMmW1WZ2RocgOhS5qoJxGXuqiR/g2fed/rkWewy8uPBLiPfAjOpDTGvuDcEphFpG8HeeM2iqfhVtbuyKTXV6f2FmKHIf2VBoewTb2qIfvFKastWFlBlemepxlFsfMxhCPmzc99pZ/uy1tdIJLiOM+LPGTkCoulxQ/nrpNn0EU0AdAOHaCobR9qL7H0iT636OdlrCsa216UHsLPvqKMzCMQ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfJbH/ZhGXwlZOxN0riKJtDHu6rs6f6W8vPOAcOauTY=;
 b=l1fq/RoXkXnIarwUq7Rya+dnJj1CYC2QWTBipODpJLV4CGt+mNo7/laujrF5worxCW1HbPVXS+uvhI8eYpewVvUUe1vLxcG79TGZXiH7QP6USZgbfT0P1OositFN1GP2TLPXeYtKZXDFgPur6Kv0rGGP8HlMmwCRpCCpsmA1P3a994ZJZS+24U4IM12kBBELt9jcsCjMW4cIrOG57dm/h3Oz5s3c5sbgCgV4ujvXoWTI2p6lP8+ueHmvzzstK2aA+cNQ16lkApu6LXy6mL7VVnOuMTLa/nuatsQX5grNREIU8ZvUXNKyiWpNIUwGtKfk28Hjj2pwVhXOukAbTjaiVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB8122.namprd12.prod.outlook.com (2603:10b6:510:2b7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Thu, 19 Jun
 2025 13:25:12 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 13:25:11 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 19 Jun 2025 22:23:57 +0900
Subject: [PATCH v6 13/24] gpu: nova-core: add DMA object struct
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-nova-frts-v6-13-ecf41ef99252@nvidia.com>
References: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
In-Reply-To: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Benno Lossin <lossin@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP301CA0061.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: 84cca4a3-080f-423a-0084-08ddaf34b80c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTZlZkpHRkFnUHlleS9pWWlCQ0pYaVRPSzRZVlMyM1ArTkN2MTFlYXNzVFlJ?=
 =?utf-8?B?UnJDQVA2MnlCdkxoN1pRZWFETGhxcFBRL1ZMQU1qYTkzb1VBZHZGY0xvOWll?=
 =?utf-8?B?bDl1THB1cDVZMEd2Wk1KbzNMbDRlSUNXSDZaK283Y2JHRE14dFl0bC9TeWVi?=
 =?utf-8?B?S1Q4ZlhUUnlWSzUrUVFqMnZHbDIxM0tEYXlqU2gxaUFiRElkWjcyTlBPdFpu?=
 =?utf-8?B?dUNjRDM5ZkZXaUNuMjl4dDJSc0pUUHI1ZUZBbUpWc3B5ZFdWbk5sTXM1eHRk?=
 =?utf-8?B?RzBkWnZrS2tQei90ZTB3U0tnd3dPVXZYb0ovSVhaU2FINitWSGFLWGEzR242?=
 =?utf-8?B?OVQ0aEVUbkRsekFjQ0I4SnJMNlBXQkRCeTFzamIzQ2R5NWlFUkhQUWxWZnFa?=
 =?utf-8?B?V0hjODkxUEdMUUU2VFVNanlhV3JJVFBDMXZHUFRwNnlWSm5leFY3NitZUWNK?=
 =?utf-8?B?YjB3L0FJZWNLN1RhRUFVMERqZmJidVd0ekVuRVV1MHlkdnZkNmJvUEZORjlR?=
 =?utf-8?B?ZEFuOXFwN09WK3pES01NWXdLakhzV1F6bFEveFRham9KWUp0VUtFR0NWZlhz?=
 =?utf-8?B?S1JaUlppdE9FeFVaUkJFRFJPUUpja2ZIUUhEVG9TZUt3b3J5eDNuSGlBN1I3?=
 =?utf-8?B?NFFHUVBoVktCWU5STHpJTHQzVFhKMDk1MFFDbzN3K2ttZ2daYUo5am5tbnpH?=
 =?utf-8?B?bUtlbCt6dzZGRlZPQ25DbDBZRnZURVR1N1UrSkZDaUhQZVVXNDZFZWhOTzNq?=
 =?utf-8?B?c1JvbllOMjBRd2pnQ29QOHJ5V1Q1WTNJdnlhaFNNL3FGdHlhNG50elFzVVQ1?=
 =?utf-8?B?TEd4ZzQ4UTV5dnIrK0tjUjMwWTI4TDg3NGpuYTJDUERnRU83YW9XSzFUamU3?=
 =?utf-8?B?dVFIa3h3d01icUJRdDhOZEwyQlZSTHZWMnRSWjdIY2s4VklPYUhXTERmczJx?=
 =?utf-8?B?blpaR3E4VUJiMEUxSVRWdVRLRkQ2MjRQTkw5QzZqOE5tS0dweVRHSUdXT0dv?=
 =?utf-8?B?S3VoOFVMZ3hUTExkT0MwcWIrenRTQ1JiUCtDYW4wVHZ5dVVCVGhzMDEza1M1?=
 =?utf-8?B?UHcwMzlmRnR3T0FGaE5SRE5xL25HdG9wTEQrcTUwYWZBWHFOVTBreGNQelpU?=
 =?utf-8?B?N1Jjb2ZuemhXYlFjR2ZGbWRSa0NpZlJOSzc3TDJiRDBLRTZpY2JuU3ZIajRX?=
 =?utf-8?B?aXlsWnllMk1WeTBTb25FeGxncnFKUUllV0lqcUtmUHlPaTdhclRiL0F0NGNO?=
 =?utf-8?B?MlM4TnlDUDlMbDBFdWM2bzBmK0tNQmtQcGI5NXlEbElYcGRndEYwTzBlL2Vj?=
 =?utf-8?B?WjRvNEo2OUpkeHlCVnNTaWN2ZlFCQWRvVkhVYzhXQ1J0SkZZZW1zRWlrSWlE?=
 =?utf-8?B?V05PZzh5RmlXYms0Z1QrbXU2VDB6cWNCa09uTmpyVGJNUFdjWHFoOE1jLzEx?=
 =?utf-8?B?WStoYzVNYXVjM3laSVVIU3VkdE0yOGMxVE1Cc1E1blV4OHNFM2NmVjBTdXZM?=
 =?utf-8?B?R3pVc0V1OUtrU1ltSmlKN2U3SWRlQzYxWjRxR1lrbExEM25kVlFGWTVQWWxi?=
 =?utf-8?B?SGVKTS9CcUFabHByckdsZDNRSVhSZVBHbkMzZk1sOFFTK05QekZud0p4c3Fy?=
 =?utf-8?B?a0YzWU9sUk1WWkdPQkx3WFJkTEptbzlxcENIMERrM01BUmh4MlFtT2ZUY2k4?=
 =?utf-8?B?VXRnZGMxSnhwUVBaa2x6bGRiVDNVanFHZExBRFd3Y2p1V2I4aHVSRHVvVWU1?=
 =?utf-8?B?ekxTZ1JPcU5TVWVWTUlsS0JuMDZXa1hleTRFV2Z0dDhkUGdTd3V5WnR5Nml4?=
 =?utf-8?B?eHJ1QmU1MFJtL3JHSmlSanNrc0F2NWJuSGxFVzlwU2dVa28rTytnUlBCc3VK?=
 =?utf-8?B?ZStVYlRGbyt3eGZ2SDRXQ1ptcFdjWmltbXF6U3ZaNkRXdXJvVGQ5eHJYVEdY?=
 =?utf-8?B?TTh4N3JBTnl0U21ZajVTRW9mcG02ZWhNc1NGZjNsdUdzRWdhaURGMU9UYTZj?=
 =?utf-8?B?VXNUbDRId1JRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjZYTVpJRXY0UG1oOXJYeEsvbjhMUUY5Q293VlpWc2JTT25XRDJpR3NOSnRs?=
 =?utf-8?B?eEMyM2IwNDZBelRuMmg5NjRnNDl2QTltekpNcnB1emNuMHFWVDh5S1Y1TXI5?=
 =?utf-8?B?RnQyNSszMkNHY3c2ZXA1S1lqQ2s3MG0rV04reVF5WnNkZHZvTHVqWS9vcnJH?=
 =?utf-8?B?UDB6emYrY2dVT3pkdWg5ZXYzbHhwdVdKcTJhLzdRekpqTmxuamJzT2wwV2sx?=
 =?utf-8?B?MzlMMHJTb091akFaSW9VVStWYllTeWJuOEtYd1MreFpJdmJzV0ZMcUhsN3ls?=
 =?utf-8?B?QnVRNVRjdVdsd1ZNcHRXL0tFWG10dlR6TUdQTWJEQ3p5dkVnL0RMTUl6ZC9u?=
 =?utf-8?B?aWhpZjdsRHgzTFlpNmtlZjVnMENuWmw2NkNkOXJQNW01OGM3Z2d6bHZQY282?=
 =?utf-8?B?M3VRd3N1a043bmJIa29CdGdTa0RxeEtzWmF2OHBTak9FQndPNUlXeUMrRjVX?=
 =?utf-8?B?Q3pLTjJZL09GNVdubGVWdlRjbXozeGticGtjRkNFcktpWk5NSXBxaXM2TkxT?=
 =?utf-8?B?cUxhS0FtVjZEOW4yVVZlSXhBbVFETG85VGZ1MTRDQjRwUklZbTNwQWkrZUN0?=
 =?utf-8?B?Z1hqQUNLUllkeXlwN01SY3U2VG5YaUpIMzlzOU9OY25iNTI2YWVzMDFEQ0JP?=
 =?utf-8?B?S1JBYWxiS0VEL09HdzYxNUI1cDdKN0pVVGkzdStxdlp1MGRKa1lCUjRqaFE0?=
 =?utf-8?B?OC95NGNTeEk1eXhIeVllOW55SnpEamRUdk0wTVNTTVNCQng5S3Fqci93SElj?=
 =?utf-8?B?VkhiMFZ0Wk9kZTJsMHlwcElER3MyMjZuL2o3TkJsNG5yRDVPVnlkMjFrQ0Rj?=
 =?utf-8?B?K2hTdXI0azEzUEY3bDJCR090aE5UK0UyTzhscmxrRDJ1V3lyNmIrZHJKTll2?=
 =?utf-8?B?TVltZXgyaUt3Umk4VFV5T1Q1WmdYOUxqUzh4VHFGTlArdVk2ZkZHQ2lPQ1Js?=
 =?utf-8?B?anZ5QUNDRHlUeDdVcUs1MXhSNmlYMW1YUEljSExUb0Q2S3NLQllEblZyRnl5?=
 =?utf-8?B?WEFpeU5oaEtQaHA4NTAvOGJld211MTlhYXl6cWtkOGJwcnBQR2tNYm9mM0RL?=
 =?utf-8?B?QnRBaE1qNitqSlZEaU5tNHNNMjJUOTB0dzFESDVHUjBPeFBYRTlreXJoUm41?=
 =?utf-8?B?L1UwVExDMGNQQnBKazZYVlVaQVlPb1Z6UTUvMVpyNmpxTnNNM25wSDNHNHhu?=
 =?utf-8?B?MitzTkd5b2RnMXFkZkZkTVBObWNZR0dxNGNyOVRHOW9Tb1p0MGtyUi96NzBS?=
 =?utf-8?B?RVVKeDJVR0FoazBBVGJyQmt1T1NHSVZxSTRjU2FpN2ZtTS8zUVVCa1VSSzQx?=
 =?utf-8?B?cEhpQ0dnTW85MElsUExiYzlNdy9iK04xWVhEODNnK1pSS1p3K1JGbWNCcHgv?=
 =?utf-8?B?N3p3V2NLbUlIaTBmd29OL1JEcEFjUEt3UDh0a0gxM0dUMitlK3E4WHJKV2Ir?=
 =?utf-8?B?U0ZpQmNBY1R0MmRNbVBzQjVmUEpjYTF1YTVCYitSVFpnd0J2aHJRZzRNbGZt?=
 =?utf-8?B?Q0Y0bjhKcy9GUk1SRGxIQkRsL2s1Vmx6V2NNRG42QnV1TlVBRis3VmttdHlI?=
 =?utf-8?B?MUxkajMvQkV4TTErcUZSekp2OXNBS25KVk5VY2IrWk40dUZHbFJubmRJZzh2?=
 =?utf-8?B?TzF1Qmh5YjRlY1dPSloyUjB4Y1I1YVZLRjI5M1V4RjBoaU1UZlpZOXVmQkxS?=
 =?utf-8?B?cC9CajBCWHZZN0prTTcxNkVDTGRWWktZT2NKVnhnZ3VndWZFZENVR2MyRWFL?=
 =?utf-8?B?YUVlNzYyYW9TTnBUWE01NURYWDRJTHFKNityK3NhbHMvMnVsOHgwMCtld2dN?=
 =?utf-8?B?L2x4c1VZRTdyaEdpZVFvVkJ2Q0JFTGhPTTUvd3llckhXdmhCZmMyOHBPaDl2?=
 =?utf-8?B?REVRVlZteHQxUXEyWVAvSHJkVkU3cDFJMkxUbVJkbjRSS0FhQkVPMEpvWlFE?=
 =?utf-8?B?Y0RxSUJTdEl1dk91VVNVTDE3bk1XY3Avb21mNnIxQ0V5YWhIamlUQUU1ajVp?=
 =?utf-8?B?eWxudjhIRVFHWkhuSjBvYjVQMzQyWEFhT1djOStUMmhhMjhMZFRyMkUxWEpI?=
 =?utf-8?B?NHZCcUVRR2JJaThqRll2QzNpMSt4RlFNNjBydGx6dFBJWE02a3ZocjgzamZQ?=
 =?utf-8?B?RFh0RGNtYXFIdnVUc0xMQnhVMzQ1YTRTZVF1ajV1cHRBRjJJMVg3d0Q1N1VW?=
 =?utf-8?Q?Y/PzrsSpwWnFmli+Y04WHxQZRjxF7Amzo4rMdalroQkC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84cca4a3-080f-423a-0084-08ddaf34b80c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:25:11.8770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jT8RRaRIEBUePRBa/yaO9v5aLfoA0RYgjLpfIo2BLI+CeV3691twbvaZNv1WkoxlxF5Byfq3iIJtrKcZEj9aVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8122
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

Since we will need to allocate lots of distinct memory chunks to be
shared between GPU and CPU, introduce a type dedicated to that. It is a
light wrapper around CoherentAllocation.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/dma.rs       | 61 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs |  1 +
 2 files changed, 62 insertions(+)

diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
new file mode 100644
index 0000000000000000000000000000000000000000..4b063aaef65ec4e2f476fc5ce9dc25341b6660ca
--- /dev/null
+++ b/drivers/gpu/nova-core/dma.rs
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Simple DMA object wrapper.
+
+// To be removed when all code is used.
+#![expect(dead_code)]
+
+use core::ops::{Deref, DerefMut};
+
+use kernel::device;
+use kernel::dma::CoherentAllocation;
+use kernel::page::PAGE_SIZE;
+use kernel::prelude::*;
+
+pub(crate) struct DmaObject {
+    dma: CoherentAllocation<u8>,
+}
+
+impl DmaObject {
+    pub(crate) fn new(dev: &device::Device<device::Bound>, len: usize) -> Result<Self> {
+        let len = core::alloc::Layout::from_size_align(len, PAGE_SIZE)
+            .map_err(|_| EINVAL)?
+            .pad_to_align()
+            .size();
+        let dma = CoherentAllocation::alloc_coherent(dev, len, GFP_KERNEL | __GFP_ZERO)?;
+
+        Ok(Self { dma })
+    }
+
+    pub(crate) fn from_data(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self> {
+        Self::new(dev, data.len()).map(|mut dma_obj| {
+            // TODO: replace with `CoherentAllocation::write()` once available.
+            // SAFETY:
+            // - `dma_obj`'s size is at least `data.len()`.
+            // - We have just created this object and there is no other user at this stage.
+            unsafe {
+                core::ptr::copy_nonoverlapping(
+                    data.as_ptr(),
+                    dma_obj.dma.start_ptr_mut(),
+                    data.len(),
+                );
+            }
+
+            dma_obj
+        })
+    }
+}
+
+impl Deref for DmaObject {
+    type Target = CoherentAllocation<u8>;
+
+    fn deref(&self) -> &Self::Target {
+        &self.dma
+    }
+}
+
+impl DerefMut for DmaObject {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        &mut self.dma
+    }
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index c3fde3e132ea658888851137ab47fcb7b3637577..121fe5c11044a192212d0a64353b7acad58c796a 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -2,6 +2,7 @@
 
 //! Nova Core GPU Driver
 
+mod dma;
 mod driver;
 mod firmware;
 mod gfw;

-- 
2.49.0

