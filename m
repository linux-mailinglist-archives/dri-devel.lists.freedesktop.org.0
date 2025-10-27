Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBB9C0DB2F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 13:54:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0485C10E47C;
	Mon, 27 Oct 2025 12:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dbtd945y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012017.outbound.protection.outlook.com [40.107.209.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF5C910E487;
 Mon, 27 Oct 2025 12:54:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WNHpeGXw0+G0lNlgZKcFH50rZyEDOFRdgbY4nM+cyzBYEZQgnc7butHdo4NR9oBS6KllNBZ0INCeCseNvQb+Xbp7DVFd6LLykct+Tfg5IUTE39XUiZK89btVhdMM0zSVbVpPsJgsCWiXa4w1C727IJ1ddSeEYdOQnNX1clRgLQ9SZpqp3hhioBZayWb7CgCtA0UuRPc4xqLG4n7y0MGHkAiiCzB9qE+Ly7SNZ/NDn7sB16InM3E4QGi9ljcPyFo9H1hjFVzlUvMXAXWnzAXVnuATgpeM3lHsTZ0RFl9Qwfd+80/sg/VJrfmOFqXR6w4UQMjiLwFdozPxoE6CrcgcXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nB0k1iR0EFysAqaeJ1jQWp//rU/nEUWpLTQXKzF2csY=;
 b=NEFy999+mQRp5afvJAPHeYQJoBun+Jeycb19179xGPIWXepEqgFRIVW222kdzPKSSN3LT2AWq9CbZEtJcqnsteXlPTt6QlP1O+T1FhxkBD7AKwEojhpNxFO5NdEPmds7LIKSPQmjDOsdZKBJfOBrJivmwPZW2uhudrY5zNJgPsgGtLSR2mSiGSdlbmyXWZLNMHTO1K883CJ0zhMFYbeJcwvYa2HUOboRKhEXA6LJYBhmrXB1x8Zji67QSCCWrKNFeosBJ02z3U7TETFkNc2nk+TUZ5/5AiUAfnFNEARtm9wgX8TufSDEvqQLOJSziSk9J0P1NZ80HvNgT+zVZSKoMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nB0k1iR0EFysAqaeJ1jQWp//rU/nEUWpLTQXKzF2csY=;
 b=dbtd945yy9ym/LDowCHm8VQb7OVa9impz4uJoD7IML2GuUAb1L2p6sghisucKFdDN/i8OMCm6HBmxhC8fa+LL4RBCC1PhKX8zRpFSk53sKUKuLkWDSOKPUxKbI/wFWzgyj4OlVWOII47zUwqXAc7hqcrUUWvkapQLzDfBO37HVqV+kn8KGBZTsXvdIH/0vzxxOZdmsb6Liky0cP7uqYue3pDYon8bxHZqa35mOIy74sW/jAzoCBTvWXOpVS6WGao4m72YXk8BjhhMFVKCFeQU9Pb+eGNXEH7TZ9ScFnS+ka4RV7RTbmhfZvTUUgNj0/PR/UGSIs6vWhMkJMxO6qyiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB5863.namprd12.prod.outlook.com (2603:10b6:8:7a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 12:54:47 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 12:54:47 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v2 0/7] gpu: nova-core: remove use of `as` for integer
 conversions
Date: Mon, 27 Oct 2025 21:54:40 +0900
Message-Id: <20251027-nova-as-v2-0-a26bd1d067a4@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJBr/2gC/z3MQQrCMBCF4auUWTuSDDEtrryHdBGS0c7CRJISl
 JK7Gwu6/B+Pb4PCWbjAedggc5UiKfagwwB+cfHOKKE3kKKTVkQYU3XoCk7s2WhD00gO+vuZ+Sa
 vXbrOvRcpa8rvHa76u/4M+zeqRoVW+bEj1lgKl1gliDv69IC5tfYByDAES58AAAA=
X-Change-ID: 20251022-nova-as-8ece4142872a
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
X-ClientProxiedBy: TYCP286CA0027.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: 97e52d97-5b39-4ed5-0500-08de155801df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|10070799003|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K0VINDRIMXlWR0pONVhPeHhXNDNjTWx3ZWh4Q0xMVWFBc0JjRENic2gxeXBi?=
 =?utf-8?B?bHZGS3BHSnJETXp5UDVyMzhjYjFOUFl6aXNJVFUvYmMxMG9hMW5wRG4zVXdk?=
 =?utf-8?B?TmhqNjduS0hzc0d5bkRHN1Qyd0tDejNiZGIxNm5LR1I5Q1M0TVpDN2UwK1gy?=
 =?utf-8?B?YjdDMSswaUNEZi9ZSk5UejhhTEVWcDFYUWtOdTB1a2NvZ3R4U0Q3U0EzU0N4?=
 =?utf-8?B?cFBBbE5hN1lQR2s0Z21OSklCMEN2Sk53OTBNWjh0a3VLV1J2UjE1UDJnN2ZK?=
 =?utf-8?B?aHB5czlEL09QWThKVTE3d3VvU0hrTVdBbk00aTlpeTNWcmJTbG15RDVEeXU4?=
 =?utf-8?B?ZVNJL1hkRWVDOHJteUxrb3RaMU45RWJXd1pFT2VoaXkrejZpQ2Z4NWx4UkQ2?=
 =?utf-8?B?S3BhWm5lNG5FRmcvQWZmMHovZjFrN1c2T1hoOEdySDhVS282ZXhZVHdMZFZQ?=
 =?utf-8?B?NHUrZzEyUStOd29qQi9GTU0rbFFnaDA4UWc4RTMxTll6U2M2TmlyODdHWUk1?=
 =?utf-8?B?ZzhwRmVTTTZOclE2S1NOSU5pekhyMnFKK0tuR0ZsYzV4NkFrbm8vRnhiT1JR?=
 =?utf-8?B?VDkvazFvVUpqcjlVTFZ5NWpqclFkZG9DK0Y1SEdxOXFHYVBKbkNsMEFDQ1lX?=
 =?utf-8?B?ZU1Na0FVT3NtQWl0T0dyQlZUN1lZaFFYcnJ3VHlVTWVZMndZeEhYUEpaNUFw?=
 =?utf-8?B?Q3R0Rk1yVTJXRTI0K21YT01zSnczbTVkclc1ZXBJTm9RNENaaURxMUU2dXFr?=
 =?utf-8?B?THJuZWdkWFN1MVpkMGwrUGgvTnVGSGVkWnZROFd6eUNZYlZ4NkU0ZjZ1a1FH?=
 =?utf-8?B?aHljQktOUGVuRnhaMzFkaXJMc3BKTkxlcm5FcldabHRqbThtbEkyUzVuV2c5?=
 =?utf-8?B?Nm91VUpWaGFDNG9PeHVhK2lWNCtZNytoaUErWStRSG5xOWdyYXRaY2lWVHNC?=
 =?utf-8?B?MEJnME5lTlE4V0NDcDBPc0lwM3FBc1p0RFNORjVhdmw0WWE2dFNMZVpHTWtL?=
 =?utf-8?B?cjJ5YmdLSW5TOEY2QWlBV2FGTU16ZFdTeTRaYnVuczVSS3RKT3pkM0g5V1Vr?=
 =?utf-8?B?cTVsa1BUMi9yeUllL1phRk5ZQ1J5d0FrbUtjWmRoS1dnZE9ZdnZZUVJEVjhB?=
 =?utf-8?B?bEhvMG1jWWc4dlEwYzRTNldtOVpNMXp6NGNGREFNUUwxSm5nclN0Nk5jYlkz?=
 =?utf-8?B?UTJqYnk0ODcrMkRxSGZUUnRoL01JWUZKbWdXQzlkTVFvNDF0Nk1mYVlZZUJa?=
 =?utf-8?B?eTNpRmJZZGdsS2RLSW82bnpXcjhyVGcwYU9VQzBFaXZtSWVsMVZPM0Qvc252?=
 =?utf-8?B?a2hyTGdHZmM1ZVd4R0ZGTjVSRi9QdnhmMHBzd3VhaGtOWVV2dWhDNmhFZkp2?=
 =?utf-8?B?UGpsQ1FYQVlrYnNyalppei9YL1dKcEtSRW4xODhueTBZSEpQeHFneUViaHlm?=
 =?utf-8?B?MlpNeVVobzczRVNtdHFvanU5eWJRd3lIRHpNUlZIUitEQWFxb2ZTVDhxVnli?=
 =?utf-8?B?QzN3ZjlsR3ltZGl3QVBZYUxCQkRjWHNtZXRFR3JiQVJQcWR0U0RodkxRcVJt?=
 =?utf-8?B?M3FnQm55ajcwOU5XQnBkQTJtVCtCS1lIUGdSTTVHbUJCUlVTMTErelJmeTFv?=
 =?utf-8?B?K1RkOGFrcklRVU5xdzJ1SWw0NEpZYUtLSUI0cXpLLzRUclFHTjRjWEpSQ3FI?=
 =?utf-8?B?MGxJWlBQUnZwNzFVd0JDVkI5WE1sMFVaaDZ4UElGcG9IbDE3UU9RQlJJTTZL?=
 =?utf-8?B?eUp6RnBKNlpQUGpPV1JBajRHcmc2K29yKzBOdEdOUkpIWlBvMHhhL3Z3alJF?=
 =?utf-8?B?RTJGL010OTVXWTgwMjhic1ZvWlR5SWg2TjdRVTcrU2dyY2dRYTMyMldiQThs?=
 =?utf-8?B?dit3aDlhb1VkQ1ZpcHZzZnNDb1U2dVNyNmF4eVRpQlB5dG84elpobzRmbU51?=
 =?utf-8?B?QVY4VHVkdW0wbzl6M1VWcmpRazJaSnRDV0QyVlpYM21vMmhJN2VFUmtnQm1x?=
 =?utf-8?B?N1F3RWpZR1dFbFgzc2JPOUV4YXZkZ0tXZjk3KzNZQm9HU20wOGE4RWxGWDNh?=
 =?utf-8?Q?ovrEwG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGJ6KzZFT0JtRFhobnZHUmtRc1BrNmFRdVhIZU43cW9wOXhTT1ZRbjh3Zi9O?=
 =?utf-8?B?VncvMmd4MERZK0txTHhSV1JnWlE0NFlMS2Jwbk9HZFl0bG5oY1JMU0dlV0Zl?=
 =?utf-8?B?ajZpTlpqelBianlsMmVuMGFJK29SU21ZQkJadUx1d2wwanhHN3pxZFhxK3lD?=
 =?utf-8?B?RWtCVE5aemtZaXRZK2QyU1lReVpMM21QajVqL3RZeTVtLzBUMmQzMW1CZVRz?=
 =?utf-8?B?R1NVbnJXNWtIT3VOWHZGd0VzZWVXVzZ5V3luUzFUMWZ0anY5N25pamRzUDM1?=
 =?utf-8?B?Sy9GMUptTjI5MmxySXRWR1pWSUxuRis2aldIbFk0L1c3dGpjQlFQc1hpdkNU?=
 =?utf-8?B?RXZoQXZqbjdCSzJBUjRvRmVhVXZaR05QalJ1MFF0TzY4SjBvcG5JYXJGQWg4?=
 =?utf-8?B?ZnN6TGw5Y3FzaGR5alo3clVYNUtkQUx3MTMwRkVvZVNxV29QcWcyT3VCd0sr?=
 =?utf-8?B?M3pwSk56KzBOYm5vQ0srS2NRTjBhTXlnSVhlQ3VaS08vTCtXQmlOZU0yck9V?=
 =?utf-8?B?Vmo3a2JBTnpLT0xLRW5BcFZJdkVkVTNyNDBrcjBoQ2JvL29GeHAzT1hIZWI2?=
 =?utf-8?B?V0wvUDVTZmJDVHVjcWlGSFQ5T05Qb3VkMno2TTZQU0JSWlA1b3pnUG5rVmZi?=
 =?utf-8?B?YWxuUmRDTFVaQTA3MUFVVHBGb0NIK0VuU0tYNmQ2N1UvL3BnY3hMMjlvMzI1?=
 =?utf-8?B?K1RKby9MU3pCbWZBcGRLT1FVZUhZYjJBSlNoVkdPaDBQN1NPTlJjdVhTa1BW?=
 =?utf-8?B?VkVSN1E5aTVuaGhTVXVDS3Z2R2dvTXBuNnMwMXlUSHFOOHMzbEhQUitOQnFK?=
 =?utf-8?B?QURjVjRxSm1UZkhQQUV0Z0FpUWJOMitGOHBtY0dYTEpEMmhYT1d3T3pWb3dt?=
 =?utf-8?B?K3Q0SlJ4c0tlNDFTME8yam1JaVBmL0YxMDV1M2U5dm1SMm5OMXVPaG50OXZp?=
 =?utf-8?B?Qmt4c0FienVidXMzMmlFenNWQ1dUak01TWxDOE5GNjBJMm5vdVExYVY0SENE?=
 =?utf-8?B?cWJTdWY4UGxOaWtwWk91ME5vS25LK3JmcDl1VWxGa2E2UzhEYmRSN3VrSDlJ?=
 =?utf-8?B?Y0xYTmpsZjZxTk9iSk05dlBvUUNBM0V4Rmp0WE5CV3dQZ0ZEbk9lVHB1M1Nq?=
 =?utf-8?B?SjlpM3Y0OGE5UTZvUHFySmpzbHU3cW0rN2JXU1ZHNEhwUncveDQ5Vk5XWjh5?=
 =?utf-8?B?TGQ5SStjeGJ2WWJ3S2dQN1RYL3BCWDlSZTVSZ1B4VlJ2ZEtYc1ExelhMdzQx?=
 =?utf-8?B?NUE0c0cyMFpDMVA0UVZwSXhEZ2tTVlFNbkx0VHZCZUh3aFBsSzIxbDA5bmph?=
 =?utf-8?B?TitUS25TL1VGSUovOWk5SFMxYThabS84U2VXRjQ5Z2RHVmN3eU9NME9QRUlI?=
 =?utf-8?B?RHZmKzRGZEU1ZVZ5QituQytnOFoxMThOdklPbk81ejhBTXQzaTR1bGhubDlN?=
 =?utf-8?B?OW1Md1ZqdFR5WEVYeXJDV0hMb0U5WENxTTVWS2swSUdvbHhXNlBzbkhzQjVT?=
 =?utf-8?B?NnF1bDZtZk1EU2ZTb2RBL0ZrRFByT2l1ZmlVbHNINnhUZFZzT0ovbHg3UWla?=
 =?utf-8?B?S01qMlROU05sOXE1K3JMUWwrYUdiMXowVUxxcFBVNjZEbndmclV5bmpJU0xv?=
 =?utf-8?B?bVVTWngwUUlPaVZuUlBFUHpxdDdWcWhhRndSMVlySjF5UElMdTd2eDN6cXJl?=
 =?utf-8?B?cC8wT1o3MlF6Sk9vRWpuelppMnN6Wk9rWThIU3pxdS9nQkozcmwyTHZFbHNp?=
 =?utf-8?B?eExjSE8vcmx1YTMwRm0yYkV1RkpmZnY2MlpPUWd2MHZhNm9ieGVoK0JyTVdh?=
 =?utf-8?B?b0JrRUZoa24xcXUwSHQ5cFJwaDgxeWl2QVdsclIyR2Z1cklIWVNOVzJCeDVY?=
 =?utf-8?B?K2NwT002M1BJbUpLcGM4MEplV1J1ZDFNNWdYRmYxT1pMMXNaVXlOek4wUkoz?=
 =?utf-8?B?RGx6WWFibTVvaDlUQmplWE5zZ0V4MW1IZDUyWnhKOGlYNkVSS0RtVlBjWk11?=
 =?utf-8?B?NzZzZ3ZCR21EM0VKRi8yQlNFQTNlMmh6NHJpbmxmWkRlL2lTVVhXQzBJQzQx?=
 =?utf-8?B?UEg0NlNrSDJUTmdqaFJlT3VpKzl0UnpkaXpWQVNocGdZbUJUSHFHYU84OFZk?=
 =?utf-8?B?Y1dsYVBwb2xUdEpQdGhld1FDVTJUdG9UNVVpcWkyRENJQjZVdVkyWGR4RUYr?=
 =?utf-8?Q?NiwI0FhOqetUSrOt5gxzW6H69GH6ZH0pRf/WHyydctki?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97e52d97-5b39-4ed5-0500-08de155801df
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 12:54:46.9511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y+SN+EVmYB1PEpDGDFCvjV/nmaneV9Jhy8B+6rA4TBbC0ti3/JVsMdM8Z47Y67pubh/+WSbRwdmt6FBDSsHugg==
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

Thanks for the feedback on the first revision! This second one should be
a bit more exhaustive, thanks to the use of macros to generate the const
conversion functions.

Using the `as` operator for integer conversions is discouraged, as it
silently strips data if the destination type is smaller than the source.
Many such conversions can be replaced with `from`/`into` or (when
justified) `try_from`/`try_into`, but these traits cannot unfortunately
cover all conversions satisfyingly.

There is for instance the case of converting a `usize` to `u64`, which,
in the case of the kernel today, is completely lossless but cannot be
done because the Rust standard library does not provide a `From`
implementation for conversions that are not future-proof.

Still, in the kernel it is very practical to be able to perform such
conversions when they are safe to do for the current build target.

This patchset tries to eradicate the use of `as` in nova-core, by using
existing means and introducing new ones.

The first 4 patches use the already-available `From` and `TryFrom` trait
where it is possible or advisable.

The fifth patch introduces a new module that proposes conversion
functions for those that are infallible under the current build target.
This is done through a set of const functions, and the `FromAs` and
`IntoAs` extension traits which, as their names lightly suggest, offer
conversion for those types on which the `as` operator can be used
losslessly.

This new module is put to use in the sixth patch.

The idea was first suggested by Danilo, and I hope I captured it
properly. :)

As Danilo suggested, this could eventually find its place in the kernel
crate if the implementation is deemed to be fit, but for now let's
review and let it mature in nova-core.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Link: https://lore.kernel.org/rust-for-linux/DDK4KADWJHMG.1FUPL3SDR26XF@kernel.org/
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v2:
- Use macro to generate const conversion functions.
- Use `CAST:` comments to justify remaining `as` conversions.
- Add more conditional compilation guards.
- Link to v1: https://lore.kernel.org/r/20251026-nova-as-v1-0-60c78726462d@nvidia.com

---
Alexandre Courbot (7):
      gpu: nova-core: replace `as` with `from` conversions where possible
      gpu: nova-core: vbios: remove unneeded u8 conversions
      gpu: nova-core: vbios: add conversion to u8 for BiosImageType
      gpu: nova-core: use `try_from` instead of `as` for u32 conversions
      gpu: nova-core: add extra integer conversion functions and traits
      gpu: nova-core: replace use of `as` with functions from `num`
      gpu: nova-core: justify remaining uses of `as`

 drivers/gpu/nova-core/falcon.rs           |   9 +-
 drivers/gpu/nova-core/falcon/hal/ga102.rs |   6 +-
 drivers/gpu/nova-core/fb.rs               |   7 +-
 drivers/gpu/nova-core/fb/hal/ga100.rs     |   4 +
 drivers/gpu/nova-core/fb/hal/tu102.rs     |  16 ++-
 drivers/gpu/nova-core/firmware.rs         |   7 +-
 drivers/gpu/nova-core/firmware/booter.rs  |  31 +++---
 drivers/gpu/nova-core/firmware/fwsec.rs   |  25 ++---
 drivers/gpu/nova-core/firmware/gsp.rs     |   5 +-
 drivers/gpu/nova-core/firmware/riscv.rs   |   7 +-
 drivers/gpu/nova-core/nova_core.rs        |   1 +
 drivers/gpu/nova-core/num.rs              | 158 ++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/regs.rs             |   5 +-
 drivers/gpu/nova-core/vbios.rs            |  60 +++++++-----
 14 files changed, 262 insertions(+), 79 deletions(-)
---
base-commit: ca16b15e78f4dee1631c0a68693f5e7d9b3bb3ec
change-id: 20251022-nova-as-8ece4142872a

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

