Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2141CAA5816
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 00:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C391710E813;
	Wed, 30 Apr 2025 22:45:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FggdyCaN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B4D10E812;
 Wed, 30 Apr 2025 22:45:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qEHfMHN/cwMy1Pf2k6dgrxu1a9SB56+JoyKpPm6w70aasn+Qdh5BTUntJgivxzWV3NSrRxxfE1ZI0TkdRHyFbLVdhB1aDyf1Kwqj+oAbOd5c2Vzl56GMS+RMZPMWEibvplLkrWXhu+u06wkFvDOg7QdaMfVrLegKaUgXf8sNPZMNBrrRoh51cobRfno2vxppHTDEPDwzRCDZI9iXVQMnOhjoxY5DvGYKiJnOuga9E+AuvfcKWwBqLGqyP2+dTZhW+YtbrVMcqDBhL9GQA20yPagW+f/kaiQ7WXszA5r6JED0mIJSRFrTiS4B7WyMlKyYJEp6WJeRU44bkDuPvKdJDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6FuGr6nI2T5GeBMGC5uyvP+uI5MbWg3UCDPBu2y0NI=;
 b=ZMJOaAwVXrSTbQCR2r1bN92yREAN4Ffm6n6KFpF/y9p9A8zMMifbyXvV47jBVhkP8mhDsAx08MlGJBMwOrDeQZl6rXaRhfObJS88PSSiqPWU8aJVlhMxo13a2ClOqeYci01j484M7yn3F0vt7njUayhaeug8sS9cRjeNOkMaaUOHpyWus3asyDxLf7Mh3Ebx78bO1QRHVKCF0nigZjMNTUXAMJv3urdV0uiB5rbvzyrZ8oIE9MtwXxwCSY/vNUXX4NsN52YzBx5PRY92Mxewn8Je+4K+PtYI83zQcInFkFAAAtJQ2gSSCR0nN7YOOXN4kzbMVAmULvslYGfV+eHC2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6FuGr6nI2T5GeBMGC5uyvP+uI5MbWg3UCDPBu2y0NI=;
 b=FggdyCaNwiQd/mMurzdEHVUmaNsco4Fa1TBrLPcFdndeweRmVmJxQIBPPIWhPbG8MnEWZbE2LWRXl/aTkq4w8NxIXNJAPdgUu1J24v8jiQVKE97v5rapUOepxsMBpYVcSHHKpVT/lebQUlPBnnITloe/yJgIimqTdxblIIwVLxQj4FNkb96iZ+jyX5K/r6VhPuTRJxvTMpUebx9ip5iDzs0bG03MslfNrziyXFc+7ENjhgOQIxeFMfgwtS5Da9s8sqWpoZGcYNewkL+/9hABrBej279FcMdRb+lislT88oX+NBbmMD6/U1W5lNrQ8zjpEBclNVvgnHEeldmue4ce4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21)
 by DM4PR12MB7528.namprd12.prod.outlook.com (2603:10b6:8:110::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Wed, 30 Apr
 2025 22:45:09 +0000
Received: from PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6]) by PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6%4]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 22:45:09 +0000
Message-ID: <1f2a6948-8fb2-4eac-ae05-99d007defc07@nvidia.com>
Date: Wed, 30 Apr 2025 18:45:05 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/16] gpu: nova-core: wait for GFW_BOOT completion
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, John Hubbard <jhubbard@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-8-ecd1cca23963@nvidia.com>
 <aAd_PBVB5S5pHeP0@cassiopeiae> <D9J4UK3LWDL6.4TE5O7WM6AIP@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <D9J4UK3LWDL6.4TE5O7WM6AIP@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0918.namprd03.prod.outlook.com
 (2603:10b6:408:107::23) To PH7PR12MB8056.namprd12.prod.outlook.com
 (2603:10b6:510:269::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB8056:EE_|DM4PR12MB7528:EE_
X-MS-Office365-Filtering-Correlation-Id: 3942021e-6b3f-45eb-fac0-08dd8838a8dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QmcwNzlsS25RZzdsZkF6Wm02Vm9kUUtLTnk1YW0wZExtTFhsTzZNaUJmY0Iz?=
 =?utf-8?B?WGJ1U2hFSFZqRWJ6QjRQVzY4QVU3bHFCdFE3eFh3aThQM25IN09RR2N2Y3NN?=
 =?utf-8?B?djR5MzByV0V5QnZhR3piUGRJd3RBQVQyMEFFRDRWSklLS01BamNCZThBeDM5?=
 =?utf-8?B?QzFyK3BQRUlnTFJtVVJscUNuYkdlMVl3ZXBETjkzazFGVzhaYk5xNWlSYmJv?=
 =?utf-8?B?SVdOSkNmV2tIUG9ZaUdtREExZU9UZ0FhQTBqb2F3Q2JzTUtlV0g3M1ZCbmRv?=
 =?utf-8?B?TVdYd2o5Mk5GSUlDNWRtZDdNNkROSUFpd2JKWEdtUDJ0bmM5QmlRWGk2enZF?=
 =?utf-8?B?MTBlR3pTNFpwdjhEMTRGWUxTeXEvUDNSUUdTZVRKaG04NVEwalFtb3JCRzha?=
 =?utf-8?B?ZTg2bmxwcG1IVUpEM3FSTlA3YkJpL283WlEvRFZtWm5Zb3VWd29XNkpiZWlr?=
 =?utf-8?B?cXNxc0ZTWXJvRVNxOUdDdUFEb0FvdjF3VmVHejZET0ZGa3grbzJFT3poMEkw?=
 =?utf-8?B?UmtTN21qSHBlZS9aYktuYWVTZ1JQZkY3QjNIRXlGZzRhVmU1cjYxTHlxRStJ?=
 =?utf-8?B?M1hTV1dtRHpGQ3FtWjRmcFlWU3IxWjFreHhCLzBGTWpDNVQ0N3hld3lxZmhY?=
 =?utf-8?B?WUgxUEE3SnNzdUxMQmFtM3FNck9rUklsNDM2dEZ5bHo4aUFPR3pTQzkrNUhy?=
 =?utf-8?B?WUp2ZUgxL1B5akNMcEU5SWZYR1pZUjR2K25CQm9qSVFTR3ErN3NQTDNhbDJw?=
 =?utf-8?B?NTNNYmhDRXNKOVZ4MUQxVWMvUWVzcmx2ZHZqdENUSHJFTEtJQVBOUFIzUmZR?=
 =?utf-8?B?dVFYVlV4UHZsNXQrNCtxRWtXU0kyR0JySHMxNTJLQ2NxSVp3VWpEaFhuS3Qy?=
 =?utf-8?B?UHlOa0ZlR1FNSTdYckFlTjhkVFI4SXNvd2VuZUh1N0ViMVRkQ1lobU1PM0ZG?=
 =?utf-8?B?aVZXejBkWXdjSjNpc0hHRGNVUFlmV2d6aDRPUTVOSDN0aXR5UzVraE5IQUVj?=
 =?utf-8?B?L2Q3MEg4M0JaNmE3OGdkT3oyTVhodWVDVTdYbVQ1VmVtaEVWWFp3SjIzRUp5?=
 =?utf-8?B?NTY5ZjZBNGVnWUhrZ05YQWhnM2M4VHJNcU1ab01hTHNVZG4xdlAzcnUwMDkz?=
 =?utf-8?B?b3czTHBHSExMdXUybms1MUtySCtCeUZFa2V3OE1Bamt2eWJKcHhoVGNqSXNV?=
 =?utf-8?B?K0lQSmxnQi9tNnBnbndXblprVC9TaythZHRKdHRqdW9WcDJpajAwcFgxdU1X?=
 =?utf-8?B?MlNLQndvTCtTSGE1VXNhcDJZTW5OVVlmUWRQenVuWWZkejRHWkFrRlJzYkNu?=
 =?utf-8?B?TFV1OXNpNDFzeGw5R1hMLzJ1OWFsY01ub0lTajduanNpb1VxMldFKzlMdHY0?=
 =?utf-8?B?NDlMbm9DK004RDBNQXRyeWVpVUE1MVRHODFYc0l4ZWNWWklybjd2N2lCM1NH?=
 =?utf-8?B?aGw4MWJkNzRjaDFFaFVGMCs3ODlEZmNNMkdJR00vQ3J0VmNTNkZoNzk5dysr?=
 =?utf-8?B?aVFObC83YVp1NGJIS3g3bHRwNkt5UFVqTEhEVmFKOVNZV0VMWEhRckY1cXpL?=
 =?utf-8?B?a2FMY1RwQnNPTlpSaWdNWGI4R0pNZFgyU0svSUErTjRIZ3BWYzdOanFSaWU0?=
 =?utf-8?B?MnhTUHVBclRpamlnWVIvdStYQjdhSmhTZjZwUHVyd0tWUlJUTkRBVitOY0gx?=
 =?utf-8?B?L2l5ZnFaTnpZS3M5OXl4MThXTHNuOWpKQXdrUVVMQ0ZZaitxVEhFUG94bnFR?=
 =?utf-8?B?UFN1TFNwTEloR1J6K2c2SURzbzgxZlVPK0ZPdGhZaTZndXBFM0FDV0lFMWZo?=
 =?utf-8?B?WE1Jb1dleUZRUDNWbEo3amJuSHVjLzNNeXpBQmJvdHcvUm0zQVRuTWV2M0NC?=
 =?utf-8?B?NjJqWmtHRlNuWDRoUGxxV2Z5YTRCV01ycGRqdTdnN2ZjcEdLNFAyU2FOS2RW?=
 =?utf-8?Q?US3p9w+lIn8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB8056.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDRTVkMrRjBVN2gvMHJnVi9ZNGVHRXBMbHZwNlhrS0lVd2RibGJLNTFKVDdK?=
 =?utf-8?B?Q3ZxR0w5dWRnVGdTUy9QVnFpekdmVGlyQ3RNcEVxV1NPQ0hiK2dPVEpxYWFq?=
 =?utf-8?B?am5WUzEyaWREdWVwU2UyWHhSanhYMURTTVJyTndXM0xLcXZka045ZFBaSWtt?=
 =?utf-8?B?ZnhHTzlqaHREUUxMYUhUMmxuZnJxTytsZU41N2lYWmZCdWtHZEJ1NThVcE54?=
 =?utf-8?B?VnBrMXh3ZXBnVTRGZU52MWJpdnl6ZzlibnNnN2gxMEpnOTlIeUJnWE9LdXFz?=
 =?utf-8?B?QkNiSHBHVmpUd3B4NlRRbG44Rm5MWUcybDhNejl1c1RQa09RYjFRYWRPT3M2?=
 =?utf-8?B?RDRQV2hYclZxZ25jZTlwN3JLSHByWUluelJBWDY4VnFnbzNQWmIzZ2MrNFhO?=
 =?utf-8?B?cFBCNWMwNjFIUGNNdUhRb3lBUDA1Y3h0MDJaZ29wdW11OWt3SVg5bUFNVFMw?=
 =?utf-8?B?cnRGb096aEg2TVlGRy8wcjIrMWE1RERvVGZkS0Z4d1ZmT2lSMjZFR2V6blpT?=
 =?utf-8?B?WkRldDZ1K2M2MFJnUDFDWVVhc0xxWVZkSCtOOTF6QUlwV3JQV24rdXdBcEtX?=
 =?utf-8?B?MnJNL0FrYStHNHBHQnlLNllMbUoxNDN3eTlETnVHQUdBTXU4RkZwZGEwZVd4?=
 =?utf-8?B?NzlJZ1RQb0ZWMVdNWE1pUXVwNEplNHFUc0dHczVPeDJ4MTU3WS9Od1FncU4y?=
 =?utf-8?B?WktQN1hGM0VBTTBFVVYxZTV1ekU1UmVxVUQvQW1adXp1ekV4dU9XbVU4MDls?=
 =?utf-8?B?eHRDcytXa1pVQVNIalhKV2tSWlYvUTlEOHZpRlNqKzJ1QlE1MGUxRm4xNWRU?=
 =?utf-8?B?bDFRWDBYRC93S3JvcnlCSjh3WVdIVGZmc2wvMWN6ZG9OTk9OV2FZOHRFOEov?=
 =?utf-8?B?bjlOeHJmVnhFYzhBMDYwYzM4WHZRS211ZFJOMnJCWFVCQXBDQnExSGlMOVJI?=
 =?utf-8?B?RWo3WUFYWXRiR2ZzT2ZPTzB1bWJ1MU1JbW1vV2pwdlVHWUdZK2t1UFVPbi9O?=
 =?utf-8?B?YUNBemxqYk9jK2tycS9JMEgzeFFzZHI5Sm12ekVodjNZbm5xTSsrOGo3MktG?=
 =?utf-8?B?QWN4aklWdWRGYmJUYUtsTy9CdDBHdWV0SkkyL1Y1dVJFaG9CeXhVeFlJK0FX?=
 =?utf-8?B?SXpMVXB6U2VtUVJnVzB3Wjd1V2N6MHpDOG9FZTFRSStLTGgyNW1QSDZCZGV3?=
 =?utf-8?B?TnBQUHg1STE1WFlSMnloUFNEcW5uYTUzVktvclJTUENjMGZrWFRDazN2eVZ3?=
 =?utf-8?B?dkNTV3pjVjdyUTEvQkJDZHpXMWRHcWYvLzFtL1duWm9NdHgvRE1xWTZrdmRp?=
 =?utf-8?B?WE1uL21DSEVNM29TeWl5bk1zWEZ2NUNDOHZsZWhQdEQ0c0YyQlQ3cVFuVTZB?=
 =?utf-8?B?Zk41bGVzUUxYU01mMlBMeE5BYU9sNnk5YkFPWHRCTDAycTBhejlIbFI1NUFy?=
 =?utf-8?B?YzlUMHRadHZuVlI2Znk5MmZrL1pDYjR4STUramFObFdpOEJndEZnMjlod0lk?=
 =?utf-8?B?bmI3S2xvMm1jRkoyZWRUbEltOTJLWHBuZVcydUhCWGVQQm90MG94QVpRVTI5?=
 =?utf-8?B?bGlMNjNBKzlvejgyUnAxRWhGOXROQjMyaHM1UDZ2dkR4b2lhOUEzUDlMSzZR?=
 =?utf-8?B?Zy9lUnlGUGx0NEYwQnJDamRzOUIvcEcxeUJMM1ZyYmJoRFcrODlBT2NNMys3?=
 =?utf-8?B?U2dtcCtUalh0bGFybVR5MU10Vk0wT1lJQVYrTXJjakdmMVMxTWJQS1U5NDRC?=
 =?utf-8?B?OFpjSVNvTlJBMTFRU042RGFqWmRqOWxlY1Zqb1MwTXhodTMrKzljSFc2aDVJ?=
 =?utf-8?B?ZFU0blVnb0pnK3cxZVlFd1NiTjRlUzZqQzBHeUNqdUU4TE1oY2IwMCtUNFUy?=
 =?utf-8?B?ejZIczN0c1A4Q045K00yTW9mQk56MGdZRTlvZ1RHcWFuenQ5c0o0SktOOGtu?=
 =?utf-8?B?WENLQkxOeVVHQVZhSDMvTXFVQ09rVGlFMDUzOWV5ekhrbVFJb2dqT09WTjcv?=
 =?utf-8?B?Nmk0YldhOTN4MTZFdkF0YjBzeEdVK0pLM29xUFJndGgwWEI1ekhsUURBd1lO?=
 =?utf-8?B?V0d5ZnVGYzBGbm5oREJhUmpWSERldUw1SXhpeEtaVldOWW03QnFkYzU2d0FN?=
 =?utf-8?Q?dPZWPXQHhpXRv/CDLwwiAvLW7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3942021e-6b3f-45eb-fac0-08dd8838a8dd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8056.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 22:45:09.3024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQjXutQakuZcA3cGkPyN+pU/NyN9QiIjT3CBV9xWgZtaDUz7XzP7+DXPBy8Rw4Waq/bJGa07+pDb+wavR1xAeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7528
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



On 4/29/2025 8:48 AM, Alexandre Courbot wrote:
> On Tue Apr 22, 2025 at 8:36 PM JST, Danilo Krummrich wrote:
>> On Sun, Apr 20, 2025 at 09:19:40PM +0900, Alexandre Courbot wrote:
>>> Upon reset, the GPU executes the GFW_BOOT firmware in order to
>>> initialize its base parameters such as clocks. The driver must ensure
>>> that this step is completed before using the hardware.
>>>
>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>> ---
>>>  drivers/gpu/nova-core/devinit.rs   | 40 ++++++++++++++++++++++++++++++++++++++
>>>  drivers/gpu/nova-core/driver.rs    |  2 +-
>>>  drivers/gpu/nova-core/gpu.rs       |  5 +++++
>>>  drivers/gpu/nova-core/nova_core.rs |  1 +
>>>  drivers/gpu/nova-core/regs.rs      | 11 +++++++++++
>>>  5 files changed, 58 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/nova-core/devinit.rs b/drivers/gpu/nova-core/devinit.rs
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..ee5685aff845aa97d6b0fbe9528df9a7ba274b2c
>>> --- /dev/null
>>> +++ b/drivers/gpu/nova-core/devinit.rs
>>> @@ -0,0 +1,40 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +
>>> +//! Methods for device initialization.
>>> +
>>> +use kernel::bindings;
>>> +use kernel::devres::Devres;
>>> +use kernel::prelude::*;
>>> +
>>> +use crate::driver::Bar0;
>>> +use crate::regs;
>>> +
>>> +/// Wait for devinit FW completion.
>>> +///
>>> +/// Upon reset, the GPU runs some firmware code to setup its core parameters. Most of the GPU is
>>> +/// considered unusable until this step is completed, so it must be waited on very early during
>>> +/// driver initialization.
>>> +pub(crate) fn wait_gfw_boot_completion(bar: &Devres<Bar0>) -> Result<()> {
>>> +    let mut timeout = 2000;
>>> +
>>> +    loop {
>>> +        let gfw_booted = with_bar!(
>>> +            bar,
>>> +            |b| regs::Pgc6AonSecureScratchGroup05PrivLevelMask::read(b)
>>> +                .read_protection_level0_enabled()
>>> +                && (regs::Pgc6AonSecureScratchGroup05::read(b).value() & 0xff) == 0xff
>>> +        )?;
>>> +
>>> +        if gfw_booted {
>>> +            return Ok(());
>>> +        }
>>> +
>>> +        if timeout == 0 {
>>> +            return Err(ETIMEDOUT);
>>> +        }
>>> +        timeout -= 1;
>>> +
>>> +        // SAFETY: msleep should be safe to call with any parameter.
>>> +        unsafe { bindings::msleep(2) };
>>
>> I assume this goes away with [1]? Can we please add a corresponding TODO? Also,
>> do you mind preparing the follow-up patches for cases like this (there's also
>> the transmute one), such that we can apply them, once the dependencies did land
>> and such that we can verify that they suit our needs?
>>
>> [1] https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonori@gmail.com/
> 
> Good idea. Added the TODO item with a link to the patch.
> 
>>
>>> +    }
>>> +}
>>> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
>>> index a08fb6599267a960f0e07b6efd0e3b6cdc296aa4..752ba4b0fcfe8d835d366570bb2f807840a196da 100644
>>> --- a/drivers/gpu/nova-core/driver.rs
>>> +++ b/drivers/gpu/nova-core/driver.rs
>>> @@ -10,7 +10,7 @@ pub(crate) struct NovaCore {
>>>      pub(crate) gpu: Gpu,
>>>  }
>>>  
>>> -const BAR0_SIZE: usize = 8;
>>> +const BAR0_SIZE: usize = 0x1000000;
>>>  pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
>>>  
>>>  kernel::pci_device_table!(
>>> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
>>> index 866c5992b9eb27735975bb4948e522bc01fadaa2..1f7799692a0ab042f2540e01414f5ca347ae9ecc 100644
>>> --- a/drivers/gpu/nova-core/gpu.rs
>>> +++ b/drivers/gpu/nova-core/gpu.rs
>>> @@ -2,6 +2,7 @@
>>>  
>>>  use kernel::{device, devres::Devres, error::code::*, pci, prelude::*};
>>>  
>>> +use crate::devinit;
>>>  use crate::driver::Bar0;
>>>  use crate::firmware::Firmware;
>>>  use crate::regs;
>>> @@ -168,6 +169,10 @@ pub(crate) fn new(
>>>              spec.revision
>>>          );
>>>  
>>> +        // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
>>> +        devinit::wait_gfw_boot_completion(&bar)
>>> +            .inspect_err(|_| pr_err!("GFW boot did not complete"))?;
>>> +
>>>          Ok(pin_init!(Self { spec, bar, fw }))
>>>      }
>>>  }
>>> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
>>> index 0eecd612e34efc046dad852e6239de6ffa5fdd62..878161e060f54da7738c656f6098936a62dcaa93 100644
>>> --- a/drivers/gpu/nova-core/nova_core.rs
>>> +++ b/drivers/gpu/nova-core/nova_core.rs
>>> @@ -20,6 +20,7 @@ macro_rules! with_bar {
>>>      }
>>>  }
>>>  
>>> +mod devinit;
>>>  mod driver;
>>>  mod firmware;
>>>  mod gpu;
>>> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
>>> index e315a3011660df7f18c0a3e0582b5845545b36e2..fd7096f0ddd4af90114dd1119d9715d2cd3aa2ac 100644
>>> --- a/drivers/gpu/nova-core/regs.rs
>>> +++ b/drivers/gpu/nova-core/regs.rs
>>> @@ -13,3 +13,14 @@
>>>      7:4     major_rev => as u8, "major revision of the chip";
>>>      28:20   chipset => try_into Chipset, "chipset model"
>>>  );
>>> +
>>> +/* GC6 */
>>> +
>>> +register!(Pgc6AonSecureScratchGroup05PrivLevelMask@0x00118128;
>>> +    0:0     read_protection_level0_enabled => as_bit bool
>>> +);
>>> +
>>> +/* TODO: This is an array of registers. */
>>> +register!(Pgc6AonSecureScratchGroup05@0x00118234;
>>> +    31:0    value => as u32
>>> +);
>>
>> Please also document new register definitions.
> 
> Thankfully Joel's documentation patches take care of this!
> 
Yes, my doc tree (now 8 patches) includes documenting these! Considering the
register renaming stuff it may conflict, but I'll fix that up. :)

thanks,

 - Joel


