Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C30EDC0AAA8
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 15:40:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8EA410E2D5;
	Sun, 26 Oct 2025 14:40:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="deFjAz3I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012033.outbound.protection.outlook.com [40.107.209.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1610A10E2D0;
 Sun, 26 Oct 2025 14:40:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zV9HRwe3yxz1y6vbJ7KMqu3Jaa03WMpweerBbrNegratxUV8W1s9bSd8j5Irr9nvEQhfPP49LsD66vVjhtj4NIieQRQMHzHs5VbH39++J46mpvrQHGXzIWU9otFI0hPZJXr6gAIZLmBYzzsiUZsaYB8MhJw3tw0uT1pSukDzL4DZSty/mn23WpXhMeQfoqUItyvmqQ0HPuOax/MDlixl/KVJxnCuVyhrTnPkbhW03i2yq5Gf+9DT105tKIiIc71rRUjv5NRiimhys8QvS7+rU1qfO+gkBinJ6h5XXbJWt+SCzhcbRVNiVJBoTahYwtkf8FAwrJubGusJq+5IqlMAYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2awSFNrIWzqvkLKFSDgZK8UM0seFeut1b3TjnjChETI=;
 b=EvhvnfkP9i4OsrvEjnl1bbHK03zYLeGBxsoDaMaOLTbIZ9laULs36qwit+dC7Ob3eyZhHEy4rqgjAGK9HttVTYjgM17pdhGPkDjtskLhwzj19AltfAQe4lZod/GYwHKnw8xzho3JAiUhum/YVINlKIkhARtipsEIZ2lGcI8SDj9RwrS/Ddp7ZHfd8bfVSQnJo3qk/I7urXnxjR/m9+egfj7oVNGdYLCE3Pp1cmMLXc/XxRU1PhWf/mMtUJVmob9bcg9JiPxqtJJHCxTAg1yeVKjDQ9aDKg/sImatUpNCzHIojROe90HHsSj7n/xvFTNftXAaRlguCg/V19i2LtIYgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2awSFNrIWzqvkLKFSDgZK8UM0seFeut1b3TjnjChETI=;
 b=deFjAz3IWwrd9xEdkPbgYRURqGlW0ZijgA0XdkUM6vvIpOP4yhVV9dqTchL05HYJq5A0tk5Cl+k89PVP+pHIIXWcXWvssjnR3e/ExStjFFmvh4T20SxalMjF57qLIAjAWRhUUFi5+3UWRjnaDgUtQSOOOkLRPsjHYnHmP8WfcBffw7XJOD6PECchem3FJTZSGn4gtlnIUBfpWgdql/NF1wtHeyRpnh8Fth6d91dL8RSaxBx0HMRjd7ZH9HZGjV5HPicDMZrkHzA0SVEj4fI5xA0XGA3jhLnnvQQyI2L+eH7efnhza+NHt3+ite5h1lyBj5kCXgnZbUYamJmxElyJvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by CH2PR12MB4168.namprd12.prod.outlook.com (2603:10b6:610:a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Sun, 26 Oct
 2025 14:40:15 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%4]) with mapi id 15.20.9253.017; Sun, 26 Oct 2025
 14:40:15 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 26 Oct 2025 23:39:08 +0900
Subject: [PATCH 3/7] gpu: nova-core: vbios: add conversion to u8 for
 BiosImageType
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251026-nova-as-v1-3-60c78726462d@nvidia.com>
References: <20251026-nova-as-v1-0-60c78726462d@nvidia.com>
In-Reply-To: <20251026-nova-as-v1-0-60c78726462d@nvidia.com>
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
X-ClientProxiedBy: TYCP301CA0032.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::15) To BY5PR12MB3986.namprd12.prod.outlook.com
 (2603:10b6:a03:195::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|CH2PR12MB4168:EE_
X-MS-Office365-Filtering-Correlation-Id: d04d2ad2-ec33-46e1-a2ff-08de149d92da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|10070799003|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWpqRk9WNmU4d3NSTTFHTERSZll0SHRNUFZUSTcxdC9VdmpJTWNSckVWL2tU?=
 =?utf-8?B?SUNzVk03aGF0a0ExVlhaWm5mMEJibWxySFFyUkFTQ09ERmIwdTZZWUJac25E?=
 =?utf-8?B?U1JpVmFSNXZaeFpKeFRKRUpXbmExTE5LLzR6Mm54QVFpYjYxZm1YQ1dkelpq?=
 =?utf-8?B?c28yZUR6Wm45TDFYS2UwRVdYaGlHWUlBVyt6WE4ra0hnbEVMcFlVcER5YmJ4?=
 =?utf-8?B?OW1lWE92WW5udU02V0lDbGhtNWJIMXBkcTcvODZnaDdIalZXZlpCMFlnUTRI?=
 =?utf-8?B?WmlJMDZZb09nU0VYdHEyYnc1M2diVW52QkxtQkRHMVFFYXd1dFNXSDZrVThm?=
 =?utf-8?B?enRyV1BMYlZpTTUxMnFMSjgxZ2NSVUVuZURtQjYxUXdIVGl5MWl3VjlCWS9O?=
 =?utf-8?B?YlhLNTRPTnBBOGRyaEtPamt2ZE02WEVWNmxmTFJHd3NQTnFNZ1BMNWxPakpQ?=
 =?utf-8?B?a25jM0NaTEFtUGFFaFZTelA5ejE0VkZ6Nm9pdGIxT052TVlkcXl5Nmo0dStT?=
 =?utf-8?B?YmVpZTBNajhXU2xTRnVRY0FBa1kzNWk2M2dHM25GNXNoUmdnbXYxK1VtaVI5?=
 =?utf-8?B?NXdQc3JpRDM0MDczS0YwbytTYWZITnBTb3gzRVQzWVl5QUVDNG53QU01UUQy?=
 =?utf-8?B?N1Z5TEVPejNNODFReTZudll3dkpneEtqVVNxQ3hjSGNWVXA0eTdIcUJUb3Er?=
 =?utf-8?B?bjhvQmp6Vms4MmxiVWlGN1FxYm5KMEpIODRWTTZvYUpERzEzWXpPZi9YOGhh?=
 =?utf-8?B?S1JZb0JRSGFKWXkwVjJ4eEx2R0I3QTJaSFI3MzNDOGowM3A5S1dRY1p2eGVE?=
 =?utf-8?B?VWVVK1F0dUZBdUM5bDd0UXNnNGZPQi9pR2lDT3FvQi9xV2Q1Z0p0N1piQVRy?=
 =?utf-8?B?QktqbHhSVlBqL3hVa2ZWMmxmQ2dMQklobGJqb0t6b1lGSHcrVjZFL3VtK2ln?=
 =?utf-8?B?Kzk3R3FiWTJaMUtWT0RSbmV1aU16b3NaWjJXUmxoM0JVRVRROFpjMHZoMXFP?=
 =?utf-8?B?clIwcm14dDh5RlcvbG5rUUVXRHRGUDdybkJHQ2VTNklEbE1LaFZLNkUvcVZV?=
 =?utf-8?B?N2Q0Ym1YYi9Ba2daSFFMM0EyVmxRcUx2UWh1dW5UWEt4VjJacWVDaVk3Ky9a?=
 =?utf-8?B?bngyS2F6N2VmbVZqenlWanY2ZWhSd2ZvMDB2VmRUM0wzYWp6R2E2ZUZLTGcx?=
 =?utf-8?B?cUs3U0daTG52c2U5dDdiTFdSR0ROUmhHZ1krZWpwWUlNZ0MwZ0VmRkg2NjNB?=
 =?utf-8?B?NE5qVnYyU3VwTk9oQmFBbnhqbWVoMFBOYnovM2tsbmNXMHkrSGtuY1kvSzZS?=
 =?utf-8?B?VFk0dFVjaGkzRFhIek0vMmlzck1iSmlKRm5yZzYzWndRT2gxUzlBZnNEQ3I0?=
 =?utf-8?B?bVdoU0Vsa0syK0ZVOUF4S3h4Y2tNdkVoVjFGVGY5NGdQWXc3Q0dyTDhsMmtF?=
 =?utf-8?B?bUxyWmJWQkFkKy9TNFp6SkQrbFlFc3ZrTmlPbmxaaUNuRlEwV09vN3J0eUJV?=
 =?utf-8?B?L050Vkl5QUNlc0NUdkxZS3VWQ1pYUUw0R2luSWxxWldzTFBuT1hxdGVRdE5I?=
 =?utf-8?B?dkZ1dDFML0F3bUtDdDAzcDB1T2VOQlRaR1hXWXFHNHdvZkNJRmpjMjdVL1lp?=
 =?utf-8?B?c0FNNVkvKzRzNlhxTCtnTXZ3azRPNGxIdFZDTEsyRlEwczYxUGNDRTVleTcz?=
 =?utf-8?B?MkV6SHVyMTBrTkVlODN6bW1qbnVkSGswUXZvelV3RzlsQU40SkJEV3BrTUZq?=
 =?utf-8?B?RkxMZ2VZWFVEWnZTSGowZEF6RGhkbkVMVVczRE5CaEpWZnBqSDR3cjJKWmpP?=
 =?utf-8?B?R3dicGsyc0x5VlJpODJXTUE4Njc2VWEzdFNFaDhVZTJFd21POFU5dWcyZllj?=
 =?utf-8?B?SG4vbDVZY0ZoSFVXeWprVVFIV1VGak5EZHg4MGF5YlNtcHNrSWgrQ2NzcktK?=
 =?utf-8?B?ckhOSTF1RVlCVnNpUjMreUhZb3hjSVBHeUw0c3g2eVZCeWQzdFBuZGdnbDZK?=
 =?utf-8?Q?WNrwH7J8a9zcHq9WPdpDRgNwcewxGI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(7416014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXJpSEJUb20rY3J0K0pxT3JRazc3dVpIWW5iMmprMndoWmZtWG1YdzN5MTRI?=
 =?utf-8?B?NjRad2ZIaURjS014NHpiM1pjVHpMQ1lYcWFvbUdhQzZVbm1Qb2lPUlhiR1JZ?=
 =?utf-8?B?Qi9SeVlNdjMvblduQ1RHcXZrZlRGQ3hpOHFjQi9jYnE5SEtNMEhEZEEyWktV?=
 =?utf-8?B?N1dhT1lrd1ZsVndYdlZGNHEySklkckEvLzM2SzBrdlN1bXpmc29lVFZzd3dG?=
 =?utf-8?B?OTVSK1FvMGVBbTRmL0J1OE91bGV2U0plbUp0R3gzNnZiVVA3a0hMbE5VVWQ3?=
 =?utf-8?B?SVd4bDd0ajVlSnZzdlBhNXVZQjZ5TUJtVStpRjVtVlVTcFppWklIZXJBQlNu?=
 =?utf-8?B?TVFWUTZUKzM0dWs1Vk96bkpLSVVyUHYzL2FudHFCSVRJL0dER1RVN3BXYUFD?=
 =?utf-8?B?OEFEeW9QM2hzWkZLL3dBMnBHaFF6WlBHMkszYlBXLytKcVpHTUswTTFsWDZY?=
 =?utf-8?B?TDJVRTExMFM0ekNNbnQyZ0Z0cndTcHBhdFBESFFTNm9obC9VL0hhTm4rejh4?=
 =?utf-8?B?L0Fra1h1Q2tpOTVDdEZZM082N0lXR0hqNlRtUWRoZDRFSEFRa1NXTHVhQzB5?=
 =?utf-8?B?SS9NTWx5OUs5c3k1a0dObVkrM1o2YXhoekhWajNRd1Z1SW9VQ0QyL29mejRC?=
 =?utf-8?B?Z1ZadkVuTXpRTlUwZmdKT3B1Y2xKdUljREpIVkRtRGphaGdmcjJxc25qMEph?=
 =?utf-8?B?a3RDb05pMG9vblFSWVBENlh2alhIVEc5ZisrZUFKTmswSDFJUzc1bzFXcEdZ?=
 =?utf-8?B?aEUyMlBmOEs3NEVvS2FnbWZmMnFzendYUjJyTGJQMk55cGFLczVSc1FybDlO?=
 =?utf-8?B?M28xajljd0FCQjNKbjN6d0xsQ01UQzU1aFlWR2szUktPcklpQTQ2eVo2YkZI?=
 =?utf-8?B?azZpSGNVS2xMam5zRlFIWDJqZ3p3cCtaaUxGeU1UckdGbWxZWTdvQ0k0VnlD?=
 =?utf-8?B?THllamt4NW9xTDd5ZVg4TlNUVlpqV01CSHBBb2dDVVJyRWlYNmVNbmJ0MS92?=
 =?utf-8?B?WE8xNWJaL2hJdWg0ejVMNXlnWEJxMjVQM3NlUmVuUGhic3B4VGxoVG96cU5w?=
 =?utf-8?B?SjFzekI2ckdkam9CN2dBcjdHQlFaYmZaK2wxY29wVUNBc3htM1N1aFo1Zjk2?=
 =?utf-8?B?YlVkcjZjbTB4ajBmR2UrMFZnWTF2dzB3cW5CakpiNm8wZ2tyaGR0Ky96Zjcx?=
 =?utf-8?B?aHhXMmNhekphaWRtVWdRRDdZdU82Qm04Z0RUTTlhODZEV2owQVJWYXllZ0Ns?=
 =?utf-8?B?MTBDVzRiemhZTUVzY1ZZR1l4QnkzQnMrMEc2SStnZ1V4ZVZmdnpEVm9zNDVz?=
 =?utf-8?B?ejF4dTVNNEN4WXI1a0NQUHhzNzRmWkY1S3FYb3BHNjJCLzY3Y2wvZzZxR3JR?=
 =?utf-8?B?NHBld3oxUmFyb2VlQVZ3YllYaVVlaFFDUThHaytkdXFGTTJtTk1CR3I3eEpE?=
 =?utf-8?B?VkQ1d2VjaHlxWkc4L1F0YjBvQ3JtYjk4Tnp0Z01xK2VnZFJGZUdGcGVDVHNU?=
 =?utf-8?B?RGdseFU0YXhlYUpxbTFCQWFrQ1JDNjFSZWlQa0RyeFlkR3ZjbmM2YVJRTGZo?=
 =?utf-8?B?cUhHNW9hdVNmNU03dlRvVnY5WW5ER3hvd3FvMTZBd1g0RHQyczFVK2xaL0Mw?=
 =?utf-8?B?YitySXBNbmVHZGFNWFRST05QK0d3UUc4RWJNNWtCb29iZ3VjQTZMSGsyUWR5?=
 =?utf-8?B?VjhVM3hacHFQU0RrYUx2ZWhWUmpPUzFKd0RIQmM2ODhyNCtoZ013bFlzWGt1?=
 =?utf-8?B?eGx0bVFrNGZuZ0poalRDQVhLME1aeFJMREpzNUZmU1RUckpGb3c5cXNDbFY1?=
 =?utf-8?B?bU5aR3ZTM3ZzVUVYclVJc1ZKSEl3S1Z6M2JURnBURXQ2OW9qTVo0YngxMTJh?=
 =?utf-8?B?SWE0UUQ3MDduRnVBNEpSQ1pZaXIwOUFTczY4QlJ0N2FXdkpubzd3OElKWE82?=
 =?utf-8?B?dXA5N0tYWWV2eGdqYkFnNHNHOGlkVmJhVE13MStnZndRVFlxMnlwL3loSktH?=
 =?utf-8?B?M1pEZkt6YXUxbHV1SkRUYUhLUHlKWmV3RHI0b2ZxWU5YZ082V0VLdGFWWHI1?=
 =?utf-8?B?Q3VxTTVaUmVIVCtwNUNzWlhJRVFmeVErc3VtazFtU1kwSTdrc3RIclo5SmJN?=
 =?utf-8?B?eThsU3FWanBOM2xJTnlDaE1uZ3JaOG5HV3M1NTlRWUhXVStFQVkrQkZFWjIz?=
 =?utf-8?Q?ziK5vuguodpnBD1EjW/rtb3G7+aFICaGC0ieRen6y0xf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d04d2ad2-ec33-46e1-a2ff-08de149d92da
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3986.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2025 14:40:15.0155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cZVgIcEDUKyt8P83yxk8FxUgWGABtZLsXVxR9Nc216P1nPjQle7xwURfyGMhiUnWE8Mb0371x9JeX7wxgOkqEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4168
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

Since `BiosImageType` is `repr(u8)`, if can safely be converted into a
`u8` but this is not obvious when doing this in the code.

Instead, implement `From<BiosImageType>` for `u8` so the cast can be
done in a single place, with a justifying comment.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/vbios.rs | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index dbe0d6e4a015..a521c0a4df0f 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -50,6 +50,13 @@ fn try_from(code: u8) -> Result<Self> {
     }
 }
 
+impl From<BiosImageType> for u8 {
+    fn from(value: BiosImageType) -> Self {
+        // `BiosImageType` is `repr(u8)` and thus convertible without loss.
+        value as u8
+    }
+}
+
 // PMU lookup table entry types. Used to locate PMU table entries
 // in the Fwsec image, corresponding to falcon ucodes.
 #[expect(dead_code)]
@@ -711,7 +718,7 @@ fn image_type(&self) -> Result<BiosImageType> {
     fn is_last(&self) -> bool {
         // For NBSI images (type == 0x70), return true as they're
         // considered the last image
-        if self.pcir.code_type == BiosImageType::Nbsi as u8 {
+        if self.pcir.code_type == BiosImageType::Nbsi.into() {
             return true;
         }
 

-- 
2.51.0

