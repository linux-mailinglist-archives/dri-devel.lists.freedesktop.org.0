Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8397AD7BDC
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 22:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E48F10E185;
	Thu, 12 Jun 2025 20:08:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SdNd1dpw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C16210E182;
 Thu, 12 Jun 2025 20:08:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o2Yj3BNgfqOsrF+XdvJ45VSINDwCa8A5kUNOQrWF2jKVcfmFoyYC3AGneLQvA88GQfMoMtB7QIycch4A0cvWmOXb+SNCMVln+LkL7sohKMnkZTBiAvBNY1Y/zp8PUsnZn6gG+9slnIlDl+nrswFfB+F9dnWXF+H/pbJcd5wKCVLByPwcZyb/blp287oaM334JdC+qsqCACV1nyUe/7uWaLSnTbup97b16AjGOavkAhXhg/wiVmOPdiubQ4v19XZK0OFMeSQP8Du/GNQnPbqcle4B/zslfa05V4SAA2g9BBG793GChyHAnhge3W4+UKSYd0ZDiBAGJ2WFFtS3zvmgwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+foqX2XwhyrrMRThsSaXER7U62FOgZ/4yNLBI82NflI=;
 b=uku3baDzwCVhFryIGnbgvUFUSs4v4Fuk/kwSX6yg7TBLwDsvB6SOt3FzOCuFkf2R9BeMbcRpc18d5ds+8vIdNC2WDkbIw+ni5QNHprIq7orhLkIbKinFCtTFlLuIFwyYBv5FJuc2NQAg2h4WJ34NC4UtFwTF3lILnLQt05RhYVk7q6oW0eSoKmljjgkD7Wp7IabNHkl3m5spYOR7mi7kXuQTu1v1DpiGO7lXWetJCzaXs0QXCnHUTRJlpb/vPEYEBL8WbbSAvYWXF8e5PeS2Z9TPWxA9F9HVuadI3MPrpUDq151tHjUJbKq0ZGgsbStbCUkx5ciscYTVUHAW8ILTvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+foqX2XwhyrrMRThsSaXER7U62FOgZ/4yNLBI82NflI=;
 b=SdNd1dpw/RjfeSaQM9UESiQlcbbRBlwzs/rj227kYD9dF4E/BgU7ccaBGsx7yYitF9n+W0PolM/mdEeuT1BAxDxPUUByMO5qIIM/d+i1OVnuLQR6XXnknzQfg3oJlnGJPZLn1d5FVusk6dXWK4U1d43eXoMQvqXHu0NgOB3is6THVq1fLlrmjpRggPaU80NG76CgYLIyuXjRBg2/CVqyUodVB22s7WkinDF22My5Ivpeceb39jgFOWpCUUw+K2vmbHyfXjAs5fNaBSvu0+EISZn9ebhdJ/1ig4WhK88R7Wm/XZoHpBXdUhZlFiBFvD8fM4i7cs50zE0KPhLMJtF7SQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by DM6PR12MB4388.namprd12.prod.outlook.com (2603:10b6:5:2a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Thu, 12 Jun
 2025 20:08:29 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%4]) with mapi id 15.20.8792.035; Thu, 12 Jun 2025
 20:08:29 +0000
Message-ID: <529736c9-15a1-4777-be30-cc9aa9d11a87@nvidia.com>
Date: Thu, 12 Jun 2025 13:08:25 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/23] rust: add new `num` module with `PowerOfTwo` type
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Benno Lossin <lossin@kernel.org>, Ben Skeggs <bskeggs@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-4-14ba7eaf166b@nvidia.com>
 <aErtL6yxLu3Azbsm@tardis.local>
 <f8d9af76-fc1d-4f7a-8dfb-a0606e44c56b@nvidia.com>
 <aEsy8XDy6JW8zb6v@tardis.local>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <aEsy8XDy6JW8zb6v@tardis.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0045.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::20) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|DM6PR12MB4388:EE_
X-MS-Office365-Filtering-Correlation-Id: 3337d31f-54db-48a8-6db0-08dda9ece5b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?blpIa2JNeURnL1Y4c2Y2UDVjN0kydFJpNWk1NHFJQnRxWmhManNiSlVjNU5z?=
 =?utf-8?B?amFnTnFMVTY4TXVRbWxzY1l6YnMvcHdxVHdnMEh3aVFPYTIxY2thWVZOdWRh?=
 =?utf-8?B?b08weHgzQTB3SGppckV5cWw3RTlhNUFVTjZXUGk5T0N6NXgxQ1ZOYkxWZmFa?=
 =?utf-8?B?OUpZTWFXRFJwZ2VVUGlFYkJXOHQvSURSTVF5TEJlc3djUi9iWTB3bUVJY0pZ?=
 =?utf-8?B?cTlCM09TMjU0NmdBNkY0ZmhUcHhuNzJkUzJIcnE2Sm9IemhWeFVoQUpMVTJi?=
 =?utf-8?B?eHpKUkdub28wZDlVcDdTVVZBSDdHL3VzNHJVRGpPTE9KTDZRalEzd2lnMzA5?=
 =?utf-8?B?czhDRDVNRHhFVjhMTkRVRTkyaEhOcXg3Z3M3czlSamhLc2tORCtJQVRXTkVH?=
 =?utf-8?B?U3ZVeVJkb0pZN0hzVEwyMHFVNnRuaVpwa0NxZHljMXJDL0t0czMySE9hRFBG?=
 =?utf-8?B?NHFkc1ZPSDlnSHh1d0hLemZVUXJ4Zm1KRnRuMGlzUkY3L1dUeUlxblZVQUlu?=
 =?utf-8?B?YWljM21QSGY3YXFSeTlDeHVHOXFRTWVmU3BuMUNaQjBMSm1Ja1pRRXVJL2k2?=
 =?utf-8?B?SERMeHdJTi96cmpzSDFLQ1F3ejlyK3R1T0puTnZRS1AyM3RVeC9ZS1lpczJI?=
 =?utf-8?B?bG9aUjZLNDBodGM0OEJrVlBTaUNwOXBkNnBxLzRoT1VYUlRxWTgyNHRTTkJo?=
 =?utf-8?B?cTFML3RENW0yYjBMNTd4TFJ2QUNtTTAyTVltSFdWcFlFakE3amxvRUdiMWNL?=
 =?utf-8?B?bElCQmhzSjNrR05UcHJxL1BhM3Jic1JkSE44SXg1Z0s2NGN4bEtnVWIrNFNu?=
 =?utf-8?B?bTMrb2UvMTNoRXRaWDF1UDlKVnJaeW5WZ3FaNk82UlBYUjZCK1VMalRmV2t0?=
 =?utf-8?B?ZmJqWXl2RHFhSlpOeHZmV2RaWlRGN002N2VIbWJyMUdIQnVQeEZBWXhxbVpB?=
 =?utf-8?B?Z3oySER4Ky9jNVJpTWJXUmxyNjZIcE4xcDl4MGp0M215QXVQd2FHUERtYUI5?=
 =?utf-8?B?UC9IV0lkaFdFY2VmYzJwZzhJR3h3UURLQXZEbGYyb2FodzhFMHdBWStGRjNo?=
 =?utf-8?B?QkR4Q1FjVmk5SVpzdE8vMnNoNzdjWDlrK1lwRHFuNTU1Q3RkdVRuRW93NC83?=
 =?utf-8?B?cWI1SlJ1elJGOHlJc0xydW1jMVNyblJwazIwODJaZmtNRTd0Wi8vM2ZtdnRq?=
 =?utf-8?B?Tzk0bm5jVmpROHhxWEdncmtNSGUzaTZQOUttTXNpQXV6RHNFcTl4U3g0d2JR?=
 =?utf-8?B?RU91NFJOb1VBdGtaTmRTOEx5S0RxWHF1bmZMZ09mQ2JBQURVR3o0cXdRQ25K?=
 =?utf-8?B?eE9aVzZjZzg4VmFsMEtLcVN3SGNPSzlBTlM5R0tJUjQwamNvSHVhTC8rRFB1?=
 =?utf-8?B?N0RwSllESk1vS0Eyb2t2eENhaVhKaUYvbTJtZHhOSFQ4YmMza0NqU2c4c1R6?=
 =?utf-8?B?SmNBOW9MbDhTRG5INE51S29rdTdXODZZck9lVVF1aytLMUZZM0srSGJpeno4?=
 =?utf-8?B?RWx0QkJYZnhBNkpnL0pTYk0vYjQ0dDYvbEZiWG8rYnNPN0l2dDEyNXRVVW5q?=
 =?utf-8?B?WmtvelBiVmZXcWNoaU8rYjNPQnBCdUpDcVlsTnNaYkVhd25hK2dYcnRSUTI5?=
 =?utf-8?B?UHpPMEk0VzFCR2JhUTVpaHFDMGNhUEVnNXNaakZwbUdIeTg5RU5uMmh2NTlL?=
 =?utf-8?B?TkdUbnVSeDFmSGs3NklKeVZhSSsrc2hNMTBZTUFhby92eTVaY2o5bm9Oczdt?=
 =?utf-8?B?TktRaHF4cUszUzZpbzVYMHU3TERPRktNTjZjek9NZlVPQmlzYUE3Y3ZtUlc1?=
 =?utf-8?B?N3JURVNSYmhocWhHd3ZmU3Btb09vV2VtTkNmOFZML3kzUzF3aUFhekdIcDNk?=
 =?utf-8?B?eDRTRmtva2RBcndva3FXTlB3QW8rUzJTWGxqMEI2N1d5bmozaDkzeDFLNHVw?=
 =?utf-8?Q?erc9V5jc8+0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5968.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUdRK0NPanJuRGdYd3d6K3FsandhbGQvQm1PL2RFWkRVellOTzN5STJVZC9p?=
 =?utf-8?B?aVdVb3JrZDlVQ3NWaEN5bFZidmQ3bzNvUG9TdmwyOHRaUS9IU0JKczEwUmc0?=
 =?utf-8?B?WXRHM2ZjalV2VVczQXJoOUdsc00yTWQyRFBiY05wY1hrL0JWdlNGZHhqYlQx?=
 =?utf-8?B?NS92anlGUjV2NzFxcUVTcGwxYklYYndFWlZDUng4K2R1VldNVXVyTDNsU2Iv?=
 =?utf-8?B?YWMrcjFpVG5TNXhXbHp0aWFtYXNFaXU0N296ZDNYeThpWVJXajZiWHpaT0Ni?=
 =?utf-8?B?MHlwZEVTZlNDd1UxZUNJRTlsc3FGa3lxSGZxMzljUkxGNnVtSnBLVVBYUVNJ?=
 =?utf-8?B?cExRU1JXekJPZHVKTWtna0hPM2oxMG9GMUNONXo0OHZBaW1qUk9Xam9HR3pE?=
 =?utf-8?B?R0U4YUhHZENTOXVCeXBrb014SUNhZDhSQTlHMkRZL3h6dVFVOVhVcmk4TUN1?=
 =?utf-8?B?RmJJcjUvcWtKWDU3M0dOU01INVZYbUhJbjMyUGVTTW84SXlyb2MwMVQ5M0RN?=
 =?utf-8?B?Z1RCU2VnSlRvSDZKVDUxRlg3bW02SUxpdXNWcTI1aFdLeEpXT2c4S1ZqZ1RX?=
 =?utf-8?B?MmtaQ0d4UmY0SC9DcUdrczNOcVdzSG05MHlpZk5uRU96MVRTaUZhODd4eDhL?=
 =?utf-8?B?RUthaWdzNy9EMGI5S0RHdFFDVmZ6d3dSZEpZclpuNkxweHhCdWdqVnNHS0RE?=
 =?utf-8?B?WHVNTlN0Ukk5QldpQUdNUHhFTVFlSEtnRmVvanpCTndBekFJQWlnOHYvYmlR?=
 =?utf-8?B?ZDJRS2NmZjltSmxCWXFIdVFkaGlUWWNQS2JJYnFhSWJQNWcvTXNVREdxbHdI?=
 =?utf-8?B?RmRpQUUwTkZxUjZzd0gwVlJVdDFmVVJFYS9kazVhcFhsNm9sUXVpQitFU0cz?=
 =?utf-8?B?NVNzMnVZeTE5NXp4MkpFbk93K29vajF3QWFkM1FQb0wwcXh1VVhnemZNU0w1?=
 =?utf-8?B?RWVjNUtxd1puWHRRVEVwY1VpbTczQ2YySHVqSmVGQU9UNE5tVGZqRVR1YTF4?=
 =?utf-8?B?NkoxY1RFMU9ZNjZLSlE0RlhHNXlrTmZuZEhER1NzM2hsL2tLVXR3Tk44dHQw?=
 =?utf-8?B?bkUzd0xyL3pkZjJ0U2J1Tm9HQXhudFFPUllFTjF0Z01kd1JRQjVkUytzSUtz?=
 =?utf-8?B?emU4QWJieFdlL1k2RlN0cTVtYWtjbXlYazVXOG1YVWVBOGhFKzRsRWx1RXVF?=
 =?utf-8?B?ckVPdU1EcXJnZ1Q5KzE0ZjIrSDJDV05sQnlnL0NOWGhRclBHWGM2MkVDdWI0?=
 =?utf-8?B?ZGNCQzR5Sy85Q1NhMU5UcTlrWGoxU0tyRElqd3p3UkI3Q1FQL3RKN2E4L01t?=
 =?utf-8?B?K0JxSld0UHYrTkNxekIzVXpTRTJDOUJuM0d6S0ZzU3dIYjlCNXVlcUtXd0M0?=
 =?utf-8?B?UUt1OGFoTDJxZHJMZWZ1YjFudXlKcDZEbFVUZ0t5MjhISUg0d3g1eGZCbVVG?=
 =?utf-8?B?VGc1cnFQaFZzOGtLYVFkbDh0TzU2eG9PSXRNakxVS3FNWVlSMzZHUWxvUXRM?=
 =?utf-8?B?TExidlpUb3ZNL0o5UGtzUEVIdXc3Ni9DRTlCdjN5WUhDNTRpM2IrZFczSVhw?=
 =?utf-8?B?VngrUkZqQ1hoZmxCQnBFNTBGUml4UGJzZ0s1N01kWjhOaUNXK3BseGc0YTcz?=
 =?utf-8?B?ME9PVzFLemxoS3lYeGZzNk44RHcyMmhwbjFkcUV6Q2NFaGRlZjlBc3FyRkY5?=
 =?utf-8?B?d3djMG4rSFBKaFlEcWdSMjYwY3ZQa2xqcDF5dGlGS0JBL0M0bUpmSkpCRW8z?=
 =?utf-8?B?eVhmYk54VENNbnB1N0NUSDFDYkV0dlNHWmd4YWF5dlJXQkkyNTA3aEtrYVBP?=
 =?utf-8?B?elN2eG5tRVp3aEVGN1l1a3g4cXNBVmlvcnhrR3puRE1oeW1TRU96Z1dFdUR2?=
 =?utf-8?B?OU9tUmg1cGdLNHZZVGI0NktyR1R3NGh2TFF4L3ZYY2lWOHFzQUMvUmFHOGsr?=
 =?utf-8?B?dWF5dmQvZ25PWjRNLzVhMU1uejlydUE4Yy9OdW1mUS9CL2hBVUx3ZmhYamJ2?=
 =?utf-8?B?endmYXhaazZBOHJyb2pSVEJXMkJUblZwZ2E5YTNDcWpnZXFCMXBtSlBJSm95?=
 =?utf-8?B?dXZuOGc4eUlETVBCOSt1TUd1WWZ2aXZ4ejdMenBCQm1MbUhvc2x6Q3d1ZVRw?=
 =?utf-8?Q?DskyY1esDpx92n32jte9XG4VG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3337d31f-54db-48a8-6db0-08dda9ece5b5
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 20:08:28.9845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P2YjIuNzSM8RUeT2BhbrdZZJrHCg22Hgyeipxw+3qMWyTqJ5v9rL9kxFsXHJTW47+aEYAiZ6TXmweFNdvG4EVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4388
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

On 6/12/25 1:05 PM, Boqun Feng wrote:
> On Thu, Jun 12, 2025 at 01:00:12PM -0700, John Hubbard wrote:
>> On 6/12/25 8:07 AM, Boqun Feng wrote:
>>> On Thu, Jun 12, 2025 at 11:01:32PM +0900, Alexandre Courbot wrote:
>> ...
>>>> +                #[inline(always)]
>>>> +                pub const fn align_down(self, value: $t) -> $t {
>>>
>>> I'm late to party, but could we instead implement:
>>>
>>>     pub const fn round_down<i32>(value: i32, shift: i32) -> i32 {
>>>         value & !((1 << shift) - 1)
>>>     }
>>>
>>>     pub const fn round_up<i32>(value: i32, shift: i32) -> i32 {
>>>         let mask = (1 << shift) - 1;
>>>         value.wrapping_add(mask) & !mask
>>>     }
>>
>> Just a naming concern here.
>>
>> The function name, and the "shift" argument is extremely odd there.
>> And that's because it is re-inventing the concept of align_down()
>> and align_up(), but with a misleading name and a hard to understand
>> "shift" argument.
>>
>> If you are "rounding" to a power of two, that's normally called
>> alignment, at least in kernel code. And if you are rounding to the
>> nearest...integer, for example, that's rounding.
>>
>> But "rounding" with a "shift" argument? That's a little too 
>> creative! :) 
>>
> 
> Oh, sorry, I should have mentioned where I got these names, see
> round_up() and round_down() in include/linux/math.h. But no objection to
> find a better name for "shift".

lol, perfect response! So my complaint is really about the kernel's existing
math.h, rather than your proposal. OK then. :)

thanks,
-- 
John Hubbard

