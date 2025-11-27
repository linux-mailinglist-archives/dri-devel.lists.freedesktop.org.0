Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D57C8CDAF
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 06:11:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1122E10E74E;
	Thu, 27 Nov 2025 05:10:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DOuYPjhZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012038.outbound.protection.outlook.com [52.101.48.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 837D010E66F;
 Thu, 27 Nov 2025 05:10:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DfbWflOUCnMvpIMm5y8Fm29VcunrDLtXO46VDx7J5v8cCxlsKCy/1ZrCAwbReeEDifYkBeIBC/MgGKLSEiS8t0kc6aRDPrPL2Orssov9V/Y0JtlNY0UzKq0gz9LmBYqEuRM71/UotRD3+++wzyQfXa4YpWpPyvTcBiQuGJiHfyQbQ1sj/DMeUwFGRPHg8uChIlm5aUaSdNE9mAK0gG/7wrtP/Vyztj2FzTJeER2kzNnItlxKojBwRLMd2pvFdHVrNiY0nrLZJHXL34L53JjXaTu8koWxoBkwgo58hvNpyjCALipWXL8EYxumzOZiJEU+P3Hat+XQwb6rmVU8P4/2ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/NlngqrtHJSW9GwTpLVhipAsYtBlMMKCM/2i4OeUtis=;
 b=H4RSG3haUWjgnQaZdzonmG6Fa//mRTAveg5Z/oGg45/x5PP1yDi59dSc/7Z1LCkN5x6dk8RNM/TtrTXMoXXcVrTGUWEzfIIisEiSG9m69ZMYgNDilHx3mVizGD3QjU+qmw+zwko+lX0XPLavyHMyzTJBGonOUNl8LwqVRHKictLNacVSrbmsZoLGx3bVPLbQdU84gohgJYU05mBWhIrPnnjG910131ImWZx1CB1YG8RPJ+LgpOPMsQfL/nrkqePKVBQ+F03qqWdAzD5ROz0ppNovnk0TOhqD0G50CDvz17b529l9MDsIyGHvr7gMjTdzIOAVUzE4peFQH0qM+UjAUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NlngqrtHJSW9GwTpLVhipAsYtBlMMKCM/2i4OeUtis=;
 b=DOuYPjhZ4rZSEv5WuzgmN4rTmx9kfuqqWbOLpnxeaylHexqyUivWalZrcIQxqA4x0eJMAOsqhrWGDAmyDJ4vhSRhpoJos91Mj1TuMH64Cl9+XRWsVXD92WZZRNESbLDzENMnVLkGH+N+KOaASqNERgWmiZl/fme1xa6KGj8bIhBVBKX+k+Hak9WHMd7MQz7O8Fik9Ec1jeP+o9Wcf7xLtnmZbJ+9YEo8FGkOoKOstLuOVbgIB+K/Y/A1lW42Oh53cz2PjRuzP/WLrqrpSb7RYcaFtXxxKEFPqcfoJ4RDNwRFLUHGxUgqNHegXg4w0IU5S+nhS/495iwzxGO6o+jo/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS2PR12MB9590.namprd12.prod.outlook.com (2603:10b6:8:279::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Thu, 27 Nov
 2025 05:10:53 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9366.009; Thu, 27 Nov 2025
 05:10:53 +0000
Message-ID: <7529a7b1-b204-44cb-bb34-57161e6b7b8c@nvidia.com>
Date: Thu, 27 Nov 2025 00:10:49 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] rust: helpers: Add list helpers for C linked list
 operations
To: John Hubbard <jhubbard@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "gary@garyguo.net" <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 "tmgross@umich.edu" <tmgross@umich.edu>, "simona@ffwll.ch"
 <simona@ffwll.ch>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, Timur Tabi <ttabi@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 "elle@weathered-steel.dev" <elle@weathered-steel.dev>,
 "daniel.almeida@collabora.com" <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, "phasta@kernel.org" <phasta@kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251111171315.2196103-1-joelagnelf@nvidia.com>
 <DEHV08MPF9CH.1GZAWEGC4AVF3@nvidia.com>
 <095D38BD-A8AA-4BC3-8C24-9454964EB8F8@nvidia.com>
 <DEI89VUEYXAJ.1IQQPC3QRLITP@nvidia.com>
 <F3A7E1BB-883C-4EF4-B245-8E9DD329131F@nvidia.com>
 <03003f10-00c0-44dd-b9df-5763cc1e715f@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <03003f10-00c0-44dd-b9df-5763cc1e715f@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR06CA0014.namprd06.prod.outlook.com
 (2603:10b6:208:23d::19) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS2PR12MB9590:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c9a156b-6839-418e-f69d-08de2d7356dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3gxMElXdk1nNXBtR0laWlBtVHhnR3dUdmxOT0lCVnVwdFpmS0xhbFF1dkIz?=
 =?utf-8?B?ejhnWlhnWGQzdU93MWc4UjUxaGtjd1o3SVlIRDJNdU1RMlZTMzhQTVJmejVC?=
 =?utf-8?B?TXZ6YVpPTElVdDNKM3ZtbjJQUDJYaURKYXFVZ0ZFbkJ4WmsyeXZXckpDR2Vh?=
 =?utf-8?B?cE9uTWNuZkRqUllMVnp3ei9GV3liT3ZMVzlpNkh0WHlJY2RKQTZyc0o1VlAx?=
 =?utf-8?B?NDBaMlBMRG91dGpGV0pRMEphbENRWERwMjNacFZRV1loY2dNWmEzY3JVcEF5?=
 =?utf-8?B?RHl3MGNDR1FvUThKUG5jbE9yWU8xcUsyK1gwRlR3MlRyNkg0STZPZjdTR2g3?=
 =?utf-8?B?L1lSclgzbzNnN0lLVGhyQzU2T3NBUVdNYWFNcTA4MEI2NEF4TFRkM3lkc0V2?=
 =?utf-8?B?RnFXaHRHMlZRUzcrL0tyb1NLQTVUZlB0Z2JIeCsyRlF4UnRkUEFBYUcwanZZ?=
 =?utf-8?B?N09vUDBoT1dheHp4MXgzR0o0RWN1VmdFSlZ2NDVoU3cxK3pxcG02QjE1ZEZ5?=
 =?utf-8?B?bFNwd3JGa0FpYzNHOUZOckJvalI0cm9vYTFGV2R3SW9YSjFnM25sMnZSSC95?=
 =?utf-8?B?amcxVnhmZHovWTVZUWQwSGN4WnhEWE0vVzdSMzdobStZSlVWMUR3cWp6a0xB?=
 =?utf-8?B?Rm4vVnBPd01CbGlqL2hxbWJhODF6OXIrWGpBUWZtdmxLVDFkbjBOdE9NOVVs?=
 =?utf-8?B?S0ErZVh6cnZlWGhYNTN3UWV6UGVRdVlGeXlqd0VSd0YraHBqU1RJMWd6NUVR?=
 =?utf-8?B?N2twYk9LUjVOSGRwYWhiQzBzY1pZbm0vV0g4bzFUZWw5cjJEQVpPS09IWXJ5?=
 =?utf-8?B?bFo2RUJqSmRrKzF1aDJMcy9WTCt0ZjRUMVZNVlQ4SjZZN0VNeXM2dW5EUzRU?=
 =?utf-8?B?Ykxpb1FKUmlTdTVnd01USnE3dENlM2FXWGloU2RlUndHM2NrYUJhWms1TXZ3?=
 =?utf-8?B?L21GNkRjKzJuRkZ3RmNrNU9DUk5pcTEzUithTnIzanBSRWRnMnAxV3NaUDJT?=
 =?utf-8?B?eTdCaVpyTWNGZFVNUG1UemxzcEU4bmhTTC90MWhEcWFndXhmcEQzTk1ENno3?=
 =?utf-8?B?Y213ZHJwem5zdW5NZFBSSFE5ajJoS0hUbTJxZFBQUkh2d2o2NTB2czZ4Zk9N?=
 =?utf-8?B?OXhwWFpoMWJiTHVycG55ZmVjUnpaaUcyWW9ua1M4bDJZQUtoT2VRY0FaNi9U?=
 =?utf-8?B?ck1xWFk4Uk5YQ2svQnVZWUNRSkZEaEV3bFZrVjMvenV4N1ZxYWNmZlNYQmRl?=
 =?utf-8?B?V2xGWlVjUVVpYURZdEdQeVArSysySTRtNnpyMTNFb05VMUZUeFpHczJCN0FV?=
 =?utf-8?B?NGh0eTN3emtpeVA1SmdNNWVWOUVYSVNNUTZrcXpEd2ZnaCtDVlFPRDVXZ29S?=
 =?utf-8?B?TUVpdkpoVWVzbkNZUzhDbVIwdXBQYnpaTEpEMkNoYXFkRUZzM3BjaG9JaWg4?=
 =?utf-8?B?TThZeHVrZzFFanFPcDV1aE1pU3h1cEx5Smh2WGtmeFpLb3orODlrU3BVTzg2?=
 =?utf-8?B?SWFISm1sTThPRUNJUXNSMEtESkFRUEhyM21LM1VoR3hzQ0dXMENid1hDSDFR?=
 =?utf-8?B?NEVhS0NvMEhBL2NjcFhWNVo0Sm1LTnJqTERCTGpjWEdTUFc1cFZpTThjSmdm?=
 =?utf-8?B?d09wUFNMaFFacTl0UC81aURvdG9wRVRwU2tNT3dZV0t2bURxdnZXYXBKcG9P?=
 =?utf-8?B?ajkxejU4OTJod01SczNRNTZBYTI1eFE5bStYczQ2MTMxZXlha1p1dnh3NTJt?=
 =?utf-8?B?UWlITk1TM3pJOEl3QzBWaExvZklqMlJySGh2cW13cDBDcHlSTjZGSlZJMG9F?=
 =?utf-8?B?T3ZJUHBSbm9vSzNrVkZYK3FBTHJPYzM3czlFWkZBMmpjZHZFYWxMcnhXZVZ4?=
 =?utf-8?B?allaYVYrdHZBV0hFVHZXMVpDeXhpUktrZ2w3REtudU5lSi9zcXRzQXUwNkFF?=
 =?utf-8?Q?31DvKQpdu0IONRvs5he/+hhxoArLmneg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmpRWTRXQlpWQyt6eU9neGtSTW5RS0ZiK2ZkTjlNVUtrdzhpVkozSVh3TU00?=
 =?utf-8?B?NXpNaXQwMGpKRWJuYWRpdjJNTkJ1SW83bm02dWhsRElXN1QxUWl4SVA0bG90?=
 =?utf-8?B?K21Nd1l2dDNTNjZrSWF1VWI3OTFKSTZCN0ZTNlV4VlRDYi80aEJzYkNQZEJh?=
 =?utf-8?B?UTRnM2pVZmtmbnVmS3FVVU1tbFZsM3hDeGpOaE5hdjFLRDZCU054S0h0WHZF?=
 =?utf-8?B?UkY5Qzd1WldpdUcyWEZVTk8vR3Z5T3lIazVNdDV5enlzTTRQcHU0WTJUNVZO?=
 =?utf-8?B?YlRmcGNwc0YwZldGcFVTZjNEWHIzYVdqNGVzQ000SWpkbEJoZTEwcU9xWU44?=
 =?utf-8?B?MVdFL1BmNUJLaDhabGJDVjFrR29PVXVQTWtOTmFIekRTZ1FHZFloc3ZxVTJO?=
 =?utf-8?B?MzByd2c4S21xWnlaVitCZHJnM3BxSEZwUzhrY3lEV3VtWmpKTkozWkFMSlBa?=
 =?utf-8?B?OHdCcVB3eGFnQmZvRVNxMmFDUVNaZmNrL0Y5UUxRbFZXcXRMRktWQ1BIdWg5?=
 =?utf-8?B?ZkgyYXQxbUJPOG1vWnVvMmtjZURhN3dCdGo2OWM5UGVNYUtzc2JzOW1MSytP?=
 =?utf-8?B?dTdudnREeHczUk5MK1VObDZQaEQ2bTZqUXd1MVY5TTl2b2prMTY4cGtpZWV3?=
 =?utf-8?B?RXRjZmVVS2dRMG5uMjRNSFR1UVhnYVlsUFVaWTJqZkVHKzRySk9MakczWjl1?=
 =?utf-8?B?bVRZMitydWpkUTRPc1B6eVZKRGU3TVJmY3hLdG5rUzZhY2hRQkdUSmZ5SDlT?=
 =?utf-8?B?TnRKWmRYMGtNYUVPQUNFL1RIVDdSeVZGSCtQcElPcGhBZjBacG5kbHNQZlg2?=
 =?utf-8?B?cTJ0bk1nOGV1bDJXRFJyR1Jac2hWV2hGWVJLSEFCNWhqTkhXZndIei8zUGlP?=
 =?utf-8?B?M2FHWWQzZWVLRDREY2dtQ01YbWNIanVoeUIydlIra0hzR2d3VHErcXNETmNR?=
 =?utf-8?B?R1Y2N3pBMEk1aFladzUzNll3bFpCOVNHZVkxZlYrM0x1NURlajlvd0UwT3Fu?=
 =?utf-8?B?MHNXR05sRElzUFVNNnAwRWMxVkRIOCtzRnJWbkhTcEw1YWNnMXZhMG8xOE9V?=
 =?utf-8?B?RTlmOVNNcmhmMUFRVmQ4Q2lrN2UzN082Z2hOZldrbWNGSWovSVFxQ1VlQnlR?=
 =?utf-8?B?WEY1eGk4R2x2dVR1aHdKVjREZjFYRkFrc0ttUVdVQVRHdU9Jd1FKd0tVY3dQ?=
 =?utf-8?B?eVpXM3hkbmg2TlliN3A0RG1nMTE4cXRYSkNQZ3AzcitEWXVTTzFnOXpibmV4?=
 =?utf-8?B?VUgrREhtK2E3MHNGaENRK2tML1lRSEE3eEkrNW1JY1dXU2NEdHZXTzZCek8x?=
 =?utf-8?B?cWhzTXNWR0poaDFGbGJsS2ZPN1RTWFloNlI5aGRKakc4NXNnMElXUTRGQWRT?=
 =?utf-8?B?NE9PVkhFcWxkeVdzNUNyVHRTeFFRZEQ3NmhMbWV0UWtDYTViUSsxcE1jSnUr?=
 =?utf-8?B?N3ZsR250VHpsRDV2NUg2d3VEWXNXZ2YyL0dpWG9samhjbVEvcnVmYml0Vnhx?=
 =?utf-8?B?NXo1T3R3WjF5NGZUWmh6N0RYT3hlMkxzUXkyQURYcGppWjRpblVyeFQxdCt3?=
 =?utf-8?B?cGh3dElLTUFTOXhKSS8zTWtRdFI1b2RiQ1VPTDVjTmx1QU0wUEJubThlMmdl?=
 =?utf-8?B?anprajBDL2JGQkRpL1BFT29nOXVHbDNBcERxWi9RQXlGYU0vRk9KTlFJREZH?=
 =?utf-8?B?NDcvdCswS1UxcjVzazloYkhwQ1d6dHpwZFJhbGp0ZXBMS0lpRWFhdnVpQ1gw?=
 =?utf-8?B?Rk5Ucjc3MEJCVTBnQmZhMGJjQ1JnWWJCdjFzTmUwaFFWMWR2N1I3cHF0RFhU?=
 =?utf-8?B?TTNoNFRYc2dVSWQ3SU93eEdHVjFBbEY0cnNnaVdFbEd4bTRWS0Z3S3BvckJt?=
 =?utf-8?B?UGNvRUIvTzFiQ3AzSUhkL2kzQ1p2ZFQ2MklEbDl4WkNqa2NSa3hpYUVsQWxw?=
 =?utf-8?B?Q1dkdzdQRkhpN296Q3RTMFMxbmNiMEtBQUZNNGlKdEFpTGlUK3dHUDVtWllk?=
 =?utf-8?B?L3hFYkVYZjEyWjhCVXJOR3RqL1hWcjRlbHBlMloyeDRONGNKSzB1U2xDa1R0?=
 =?utf-8?B?ZGl0SjJwQ3VnRnU4WkRPaWtyOHQ4d0ZqeW1COHpXMlVOUEdPTk1vaWhNUUkx?=
 =?utf-8?Q?knKChIxV6OQNklUpWUDR79w0/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c9a156b-6839-418e-f69d-08de2d7356dd
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 05:10:53.7119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N2SkjAa66N2uq3fhO9bomh3NAG/FbtzI4jGYPz6vH92TNeW0wBUdj2hi9UQncAlh2DSh/OzjVqB/pBqXszrCew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9590
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



On 11/26/2025 3:57 PM, John Hubbard wrote:
>  
>> I am torn on this. On the one hand, if someone changes how list_head api works, then the rust side breaks 
> OK, this is not going to happen, at list not without a truly epic, long-term
> effort, accompanied by *lots* of publicity. The list_head API is just too
> foundational to change easily.
> 
> It's been stable since *at least* 2006. The only change since then has been
> to add WRITE_ONCE() wrappers to the INIT_LIST_HEAD implementation--and that
> is not an API change.
> 
> Anything is possible, but this is sufficiently far out there that it should
> not count for much here.
> 
> (though that is easy to flag though via doc tests). On the other hand, we have the function call overhead you pointed and we are dealing with the pointers in rust directly anyway in some cases.
> 
> Whereas this is very significant! We really, really do not want to accept
> a performance loss vs. C, without an excellent justification.
> 
> So I think you've made the right decision. The above is just to help
> solidify the reasons why.

Yeah, these are good points. Thanks John.

 - Joel
