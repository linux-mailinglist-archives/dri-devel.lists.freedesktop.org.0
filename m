Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D492FBB265F
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 04:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1ABE10E767;
	Thu,  2 Oct 2025 02:51:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="by8jGujH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012026.outbound.protection.outlook.com [40.107.209.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D78C10E155;
 Thu,  2 Oct 2025 02:51:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KsBBVHuTSe4IzmmieDPA43/i8x/s15WIkocCp4aiz4RPCkORlulJooU0u/QJ2YUD9Wusqo7Ht779ndNOioT/ycM7CK3xo5I1Fd5CAYXHPEunMGR5cE01JnxfZe1FHxhq0id7IIuh71AG9Op151bTra/mTHTCSU7oEanO387ENmX2kjjobGGloLSPSunyFC7VTeKVV7cw0E/qiUvA0NAYYDhUiOIHMsFlRp5CzH1nK1rXw8Tt1dSOi9BN5oeBfBExeQ5VBwrjxmgG6w7aET1Hs5qw8wQBsme6+/Ydiql1biIeFbRbQROcVJkD6b95DlVyXAamwbPF/8kdE4jnfmLXtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KXFR9x/Ii3t+k83B/j0cayntAzOswM4VVx2y9C6rOcc=;
 b=UUNLRLfLY8pSjvp8ynweJZ+TFx+H1K1pqD0ZEDwAC1MGHYVSnA9gxCNCZeE6ks8VmQiRry5rRGTiNfupg2xeYUGPTwjPtPEMdwXBhnHqfSR0eXsoNaaqD9T3KHPj9Y56kbBCieHXfdpc732VnBwuJDIw/SbUwzQ4rqzQolSnbKVVTUGh6EsELLqlVb4JcQ3aImJdK7aWNPL0bj3bQ9/0IbLcf4XAjMGxKYvDOlO8/b7wgKUPK6V1yXINeX/i6v7HeGih4jB6U3Xl0ZUBXOnTQgFZ5PuLs+zVclgAdVRxbUkXnHxG0BqHtWZTs65mmZ59cNoHxaG9sle1CsXc2JScAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXFR9x/Ii3t+k83B/j0cayntAzOswM4VVx2y9C6rOcc=;
 b=by8jGujHwm/yC9AI+qT839F1JKQsvnE63XZ5eIH3LdqENcOHcL/QcZVMeBuRuZoadZVXDs2ThvzXyqy+pSz4bf72PNF5G3wAn6y87E8bblFJXJRavaLYAJm0cmUEadfzv9pQhcWGvYBxN3XgC4ttGHoImRdWJ6kiVWBoTNaHWUAyfRgeBrbObo1YspDkDEYEX6+K8DnDPF/x5KOKJZ4Gk/j/giyg+BjSn5g5EvCNdo7GMzfeKlg041GDzCbIZfjt5Aa4Q12d8fhl+OMwjcAhFSd88B+NKuUEWw3qXYaIltDRoGBGD8ppnTWUmS9H2mylzlsqD2p+Dssdt18sHL364A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH8PR12MB9838.namprd12.prod.outlook.com (2603:10b6:610:270::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 02:51:11 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 02:51:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Oct 2025 11:51:07 +0900
Message-Id: <DD7HUD8WZAHD.12RKL7EGBWBFY@nvidia.com>
Subject: Re: [PATCH v5 6/9] rust: bitfield: Add KUNIT tests for bitfield
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Elle Rhumsaa" <elle@weathered-steel.dev>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Yury Norov" <yury.norov@gmail.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Andrea Righi"
 <arighi@nvidia.com>, <nouveau@lists.freedesktop.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250930144537.3559207-1-joelagnelf@nvidia.com>
 <20250930144537.3559207-7-joelagnelf@nvidia.com>
 <DD7GCYCZU3P3.1KK174S7MQ5BW@nvidia.com>
 <d238d9b7-8ec5-4063-8217-885d951d2f0c@weathered-steel.dev>
In-Reply-To: <d238d9b7-8ec5-4063-8217-885d951d2f0c@weathered-steel.dev>
X-ClientProxiedBy: OSAPR01CA0218.jpnprd01.prod.outlook.com
 (2603:1096:604:28::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH8PR12MB9838:EE_
X-MS-Office365-Filtering-Correlation-Id: bb6fecf3-15b7-4cd5-efb9-08de015e8b68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzI3c0IxWGFDQm8vaE81SzJucFFmbVZFRWxQL1R2SUVleGllaVZucVZqdVBF?=
 =?utf-8?B?WUNRRzJmN2pnNmRNakFxTTJjMVM0NUhjMWV0MTVNVVFoUEVOV2FDclplMUNK?=
 =?utf-8?B?ekQwU3pLZUgzbUFBTXNFQnhKYUljU0w3bGxRSExSK0crSVNQT2N2T1Jsem9s?=
 =?utf-8?B?cFBDcTNzYVFrZjZOVEU4d2hESFBOZnZCZGVJSHJqVlNrRFpHMGRWa3JJUldY?=
 =?utf-8?B?TkRxWGxtOE0xSFRyVklKZnd5TDNjdm82SHQvTkZNZkMySzJ0ZFUwTW5weEho?=
 =?utf-8?B?SUF6d0tNYWFHVWpjZ0FxTFlSQVpNNUlmcDBRRmNBdE80S3BqZWllRENpY0xw?=
 =?utf-8?B?R1pjcml2ZjJ3S0tyM3FDVHNHa3ZPUUQ0OG5rdng1VlZGVnlxZFVLK0E0VFhX?=
 =?utf-8?B?QkdYZWdvbGp4bUxmeG1SbEViUUozU1hhdmY0SVlKbUJ0SFRWcFdHZzFFT0J6?=
 =?utf-8?B?cG5sU0FRYWt3b2hxbmVPc2F2Q1B3SklTY1ViVDN3WVkyR0VXQ0c0bGVuU1lJ?=
 =?utf-8?B?VExPRENvaDNEazNuKzh3NEkyNng1MlcyQUxEMUgzRm9OSXpzRkt1V3krc0d5?=
 =?utf-8?B?b042SkZkb3YvWEtCWkVwMWo4YmJqYW10b2o4NGs4Q2duYWhUaGdWRUxqamJW?=
 =?utf-8?B?ZTFDMWNXMjM3Um1wWDdzREtoc1dJQWNQRXBGZXJjZk9tT1djTFdOMzZhcnlO?=
 =?utf-8?B?MWtSdUQ2bXFmdk8rV1N3MXdBVUh0WkJwNkgwZHdTVzFiV1o2dEFnLzBoMlJK?=
 =?utf-8?B?VjJmYlVSbHRPRkFJbG12a3lPdzA5TWtLV3ExMjRXcUp4clkvVFlDcmd5NmlB?=
 =?utf-8?B?WTA3MWF6bTVoRmRLUDJOQng0Tko1MTlaSUpKMWtTOTJ5cFRQNzk3M3FyOFB0?=
 =?utf-8?B?MmtpOXhwUnBqekE2aGttd1JsbnluN0N0MUluYTlYUXEwWlZhck1uMDF6bnZ2?=
 =?utf-8?B?dEVVT0FHTFJzc1FLNlN4cjJNMHVFa1JrclkvellFU1hzdUdsU3NaQ29MYjZO?=
 =?utf-8?B?ekpBR3RFOVYzUGhTbnFUZjhBWHFuMDNySnJzV0l1d3RBcEYyaWRrZDB2bWlJ?=
 =?utf-8?B?N1dKVlJSOGQ0bmVKeUovZ0F0K2RJajdZN0ZCazJUTC9PMVFaRzZuWE5XUkRr?=
 =?utf-8?B?QU1xYjREVjFldGpYMkdPb0YwT29sQWxmVFNUN3VMQVNnaGZsRHVWOGVGWHlq?=
 =?utf-8?B?WHp1US93SDNuUGI3a2wxbGFJSi91Q0tUWUg4K2tTOXdTTGoyQ2R0cjJtanRP?=
 =?utf-8?B?dnRmaXpPaE9waW1DczI2eHJwZnhjOVREUUpjYWdiSDF4Qnd3RlJYTmVJMTV6?=
 =?utf-8?B?THBwUDJJZFUvN29nQnRScG0zRmE5Rk5hV2JCNFRSdnQvYzJsMlZlR3QyL3p3?=
 =?utf-8?B?V0dmeElFT2VDWXRWYjUvcFJxK01YcFMrMWVJNklLZ0FjK0l3ZlpJK0tlSkVz?=
 =?utf-8?B?WnNTT2prY2ZValluU2RkVmJVdzA2elNhNG11aTAzbnZtY3U4UkVGb1gyU2xC?=
 =?utf-8?B?ckh1N0pUT2hnN1lkVDhlTXd3VWJBWnVDZTRLTkVybHhvZkU1alJ1bVoxVmVj?=
 =?utf-8?B?NXpMNzdyTGJwd1AxSU90bnp4c0M0akxRMXdvTmwxbXJhVDZmTXl3QWN1eEl5?=
 =?utf-8?B?VndlNmQzdVZ4d1NJSjBmOHpIOHkrQ1REYm9nOHJBM1EwZ000SnJyVWxpNWhr?=
 =?utf-8?B?Z1dlRkVUS0I3azZqQUNrTjBOeXJiRzhyUlVIUGw1STl0ekVrMXFoUFZtWklD?=
 =?utf-8?B?S2hOSEJOZzdyYjBCRG0vRWZYMkx1VUNEUWJnWjZFWHBmbDgzaldCOWcxYmhh?=
 =?utf-8?B?MVpKNDF6R0Q5cWZ2V2dENHFPcnp2LzYraDA4UllyUG5TZUZDbzRzeWRFM0Vp?=
 =?utf-8?B?RGxYTkg2ckQ1OS9kSkk5bkJDbWZuZytaZ3VZWkF4OXhyUm5YWmhyVkFNcHhk?=
 =?utf-8?Q?91mooX5a+q+a5FR72vHm6QGmYFPjhOWM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SE9Lb0xqVHRIc1NTdmR5RlpoUTBvYnVQWENScWlDQTVKN281UVZ2VkgzOVFG?=
 =?utf-8?B?bmVjV3NubENMWEtkOFNBcGxzNnFlME9BSnJ2YjhqMHgwNS9WdXFvRi9qWDVH?=
 =?utf-8?B?UlBEMWhxZnVJUE42QWd0cm5ORHR1TzhBVFpyWXM2WG9uYWRFSXpEMWx6SGlM?=
 =?utf-8?B?WGkydzNwb21QSFNKdlZGQ2Z1Mk9jV3NWcTF2QU1lcUw0VEpHVlNKRmFZYUNm?=
 =?utf-8?B?Q1puSG9RemdkeEI5ckhRVlZYQUdmcEgyZnVTa1FaMHNKejk1amE4SjM0dU4w?=
 =?utf-8?B?b2pLUnY1bndaNm52Sy83K0lJemd1c2VjblJWSWFLb0UzQnR2MGNzSlNVeENQ?=
 =?utf-8?B?VFZRalZYc2RMRlBPMDRpaGhGbVI3NTNPZ1ozMFIzZVJrN2poUXJsSWprcTdB?=
 =?utf-8?B?RnJ5TFU1Wmp5N1BUUithb2liK2MwZis3V2R3OSttN3M5akZVY1JZcks5SjRm?=
 =?utf-8?B?YmdSbXZiQUhFdjlyejgvTjB5SHlDRngwUE1uN2R3VzBla2EySEV5bUJoakZE?=
 =?utf-8?B?RGxKWEcva2cvSitCUGYwR3R4bW8vcDRId0NGamZhV2NXM0dkNndIZ1BXeVNy?=
 =?utf-8?B?M21hMDY4VEhsQkZtOU95b2dOM0hnSmgyVHZjQS9WSk1nd1JFaktRbFpvOVZE?=
 =?utf-8?B?QmMwWkFJMEtMWkphYk9hQVlzZTZWbGJJNHV3VzlvTEkwWDcvQlJvejA0Vnk4?=
 =?utf-8?B?Ry9ETFREOVJLWkNYY0Y0NkZIeFp2TVlyaG5uLzd3L0ZDQVNIRWptblp5aTd4?=
 =?utf-8?B?bmJ2ekVvZlloR1pZTkpEK3ZvV0M3Znc0MUxBUzg2L3hIZmpUc2p6MjNVTVhl?=
 =?utf-8?B?NFBiVTgvNVluOHgzSExVaSthTWN1dEFtRHhKaEF0UXo3dnVNS2FiQnU4ay91?=
 =?utf-8?B?R1QxSXhlVFl3VnNBOWpCZzlrVGMydDhBbnQ2S2UwK3NnZno2NXRxeWxRUHVS?=
 =?utf-8?B?MTNIVmVVYlRLZzZxa1g2c240THIxQnpKQmtYZlROYy85aFVwakNMck94VzZL?=
 =?utf-8?B?bm51S0d0a3BlNHNIRDlxNEhKblVNNDd2M1FGQU1FZVVnM0FScktpckFOUnVZ?=
 =?utf-8?B?Q0lNYkxZVzk1WGQ2V3h3eXcrdlFGLzMra0pabjdXbTBZaHlnSWR2eE9OcHVF?=
 =?utf-8?B?UENENjFFaHFWRER6OGRlZzNEV21XOEZ1UkRsMFNTeUUrNFcyZW04MmNQWW1W?=
 =?utf-8?B?aHBDa1BMV2tRNzR4SVdwZDNBSllzVm5FTzk3K3BZUldrbkhKRy8yRVF5V0Yz?=
 =?utf-8?B?d3g3bHRTc0tTV3N1YTZqcEttSGdGc0dUMmp6WlJNeC9rMXMwdVYveHJMMDMv?=
 =?utf-8?B?YXU5eWJhVHV2K0J5Q1VBdmQrOTBlM3RPZHpxZU9YTzdCN0hUSXJ2b0UwRW9k?=
 =?utf-8?B?ckFXM1lmTnlnaFhBL0dvSk42Sy9YTWlDSmRRK2dzRENId2YxUGlESEZtQkF4?=
 =?utf-8?B?anBQN1lEcVNIV1lvbE4yeGNHa3h1MWwxTUtSaHpxS29oL3FPeUlLL25rVFRP?=
 =?utf-8?B?SVZRTnU3VUdVRnN6TCtjVkx2TGN0L0tXUFN3N2h1UitoQ21uajlDcjJhNDE0?=
 =?utf-8?B?UG0wcWZoUE0vdmMyRjFWaCtqajVqNnFwalIzYnl6WWJSYVNpcGRjWW9iUHYy?=
 =?utf-8?B?RmZycFY1endKZFpnVGFXSTc2R3RLenVXMi90TGk1amRRRFVidXdMdXZIcTVh?=
 =?utf-8?B?WUNSZ0xLcE9iTWR1b0VhS0RIbVFWTFJmUklSTHBLNGxlYmpBdXlyWVA4cVpB?=
 =?utf-8?B?Q254cGlWL0lpc0N3QzRsWnlVMkpxT2wwQ2p0clNRRmgxVjN0MXRoMXNtaTl5?=
 =?utf-8?B?eHZQZjVNd1M5Y1VYeHUyeWliTFZaK29xaDJlVG9RZVppQmY0elNvTjlWeE5u?=
 =?utf-8?B?Qk56OUlWa2NZTkxrSkRkOWx1S0Ivck15MW12ZGljdFJwa1VJSzUySEkvTUtY?=
 =?utf-8?B?dnA0R2F5dVUwcithdVk1MXVXR1drMWJnZ21Wb2xlcWU5S2k2VzNaRmtmcVkw?=
 =?utf-8?B?c0xTZTVEUlpaY0Q4MzJRYUFMZUtYY0I1V05hR000K0VpZnRzc3puZ050ZC9w?=
 =?utf-8?B?NzBvK0QxS0UrSVN6bE5MbXZyeHB2UVk3VnJDSXBsRytSN2JZTFRrY3dlRUJm?=
 =?utf-8?B?SElkK1NnNE1ET25aVzdXU3VLU1FqcDRNQWRZaVJVTDY2Mmp2b0xxOTFsQml0?=
 =?utf-8?Q?+HoBsQTqPsGBwlfQ4Nw4sYjYX+kI3HlYMfLst6JS7dVf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb6fecf3-15b7-4cd5-efb9-08de015e8b68
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 02:51:11.2317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: agy1E+NJfMhb6FKodnaWPdJ3TIYBbjGeKyl29Q6hYz3UDAw6NS0d4wuAATgYny/t6nXYN6jtbazN/vuZ9lB7lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9838
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

On Thu Oct 2, 2025 at 11:16 AM JST, Elle Rhumsaa wrote:
> On 10/2/25 1:41 AM, Alexandre Courbot wrote:
>
>> On Tue Sep 30, 2025 at 11:45 PM JST, Joel Fernandes wrote:
>>> Add KUNIT tests to make sure the macro is working correctly.
>>>
>>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>>> ---
>>>   rust/kernel/bitfield.rs | 321 +++++++++++++++++++++++++++++++++++++++=
+
>>>   1 file changed, 321 insertions(+)
>>>
>>> diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
>>> index fed19918c3b9..9a20bcd2eb60 100644
>>> --- a/rust/kernel/bitfield.rs
>>> +++ b/rust/kernel/bitfield.rs
>>> @@ -402,3 +402,324 @@ fn default() -> Self {
>>>           }
>>>       };
>>>   }
>>> +
>>> +#[::kernel::macros::kunit_tests(kernel_bitfield)]
>>> +mod tests {
>>> +    use core::convert::TryFrom;
>>> +
>>> +    // Enum types for testing =3D> and ?=3D> conversions
>>> +    #[derive(Debug, Clone, Copy, PartialEq)]
>>> +    enum MemoryType {
>>> +        Unmapped =3D 0,
>>> +        Normal =3D 1,
>>> +        Device =3D 2,
>>> +        Reserved =3D 3,
>>> +    }
>>> +
>>> +    impl Default for MemoryType {
>>> +        fn default() -> Self {
>>> +            MemoryType::Unmapped
>>> +        }
>>> +    }
>> Tip: you can add `Default` to the `#[derive]` marker of `MemoryType` and
>> mark the variant you want as default with `#[default]` instead of
>> providing a full impl block:
>>
>>      #[derive(Debug, Default, Clone, Copy, PartialEq)]
>>      enum MemoryType {
>>          #[default]
>>          Unmapped =3D 0,
>>          Normal =3D 1,
>>          Device =3D 2,
>>          Reserved =3D 3,
>>      }
>
> I would alternatively recommend to provide a `MemoryType::new` impl with=
=20
> a `const` definition:
>
> ```rust
> impl MemoryType {
>  =C2=A0 =C2=A0 pub const fn new() -> Self {
>
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 Self::Unmapped
>
>  =C2=A0 =C2=A0 }
> }
>
> impl Default for MemoryType {
>  =C2=A0 =C2=A0 fn default() -> Self {
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 Self::new()
>  =C2=A0 =C2=A0 }
> }
> ```
>
> This pattern allows using `MemoryType::new()` in `const` contexts, while=
=20
> also providing the `Default` impl using the same default. It's somewhat=20
> of a workaround until we get `const` traits.

That's an elegant pattern generally speaking, but I don't think we would
benefit from using it in these unit tests.
