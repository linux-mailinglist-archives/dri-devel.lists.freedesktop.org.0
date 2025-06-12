Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB745AD7309
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 16:03:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081D810E86C;
	Thu, 12 Jun 2025 14:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lbFOv9aM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2084.outbound.protection.outlook.com [40.107.101.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2CFC10E897;
 Thu, 12 Jun 2025 14:03:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wpNLmWI78IZ/hIZunaqL7dJteLSGcVKMm5ASxOE+BuLyoZ301AGzQ7SCx/6JqrpCCyQGUm0FcOQ3MX8PMtAPCZp5crf44lpTXolpc1cBfj4/XJOo0AmeYOaXMj0AxjBo7eqaO/idK2+koT1iCb6RGa9FAjZMdgYRtEF2VyQtSRZitJzHCLsNQTZ7XplJHVus4MdDdsjU/SGIyBnfBAc8l7F9GHD47E5zWqJUp1YwiToygutVj5f3ODmtRqzpDi4On8uQhagHgV0bOsIjtusKYY24hMQFgqjgBnrSJE0izTwNlVcw+heiMlPW3m+R2HHEnys19tWTXonEooxByuu6AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Uk44DU7V+4z+TfwwnC927Lj2VbAdqmocrb9J0ePCKw=;
 b=hCqmIZywGXuSZmDVxF60x5lKfsg95catWD9B19QhAhiR/mUaKUndeu+bbCZ27DceSpdx0UfM90eiuEXzOtGKBCFqUAgtxRLxis5+s1KDEP5ERxvQyf3nv219KvVr2nWOtPKwshSi/pCjNcBwA5oOleQsOm5blsWui7XYF8OauImhYr8Cehr6TdZSpXRIEFcu4bj0/ZmzIIDZsQ+p/OFmrg0TEtaTTWiSwyEQfoZJUh0roWp857TPPj9VefBiVVRDiS9KmfcxaKewvM8FkGuv3IyCO8NNs2+Ur8Vp4BTHYwzMuXEpkIZQZAV4p5Do2RoEM0RRqb7UkbyYGZt0bdUzTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Uk44DU7V+4z+TfwwnC927Lj2VbAdqmocrb9J0ePCKw=;
 b=lbFOv9aM9sRk5xh4rJuKKD/Bi0pP1iTiitPQMQX+fbmXyNNVEAso8ebHbjPzkwO//NUQD05yJicFdDKUNd3Ng8aCx4UoiimFaRFZG8k0w/06KeN2TmfiEl8TNPSfZz3Fst3n7AcFONLaPZmxw9j5FeEXTJKJkGs1K4kn/DqCGebt9Yc5LZIq3Z0gp7UuPoBfa9o9Vonn2IOpE/TXzLvHXorj2smNsp27aPRZ8xjKPcYniP5euPOeumjeXeen1Dx+GK+EDrwAgOU5Z0A7lJXe5kzNXCFcyGnAitvWhhaEdonn2Z7mOzCv3oOCjsmvTYosyfAT8+wdPOI+s/ggP+Aj4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB8598.namprd12.prod.outlook.com (2603:10b6:806:253::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.40; Thu, 12 Jun
 2025 14:03:24 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 14:03:24 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 12 Jun 2025 23:01:44 +0900
Subject: [PATCH v5 16/23] gpu: nova-core: firmware: add ucode descriptor
 used by FWSEC-FRTS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-nova-frts-v5-16-14ba7eaf166b@nvidia.com>
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
In-Reply-To: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
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
X-ClientProxiedBy: TYAPR01CA0165.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::33) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB8598:EE_
X-MS-Office365-Filtering-Correlation-Id: e5be7afb-1917-4f3a-2ae5-08dda9b9e592
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVlkcEdHa1JLTHh2NHNiTzhuK0EwNGR5czBTbWJtVXAvVEdrSFB2c3RTdkg1?=
 =?utf-8?B?ZzVyVkVJLzQyL1ltMnIvTWpZUUYxaVoyQ0tndWFYNWgyU0JNdXo4MVFXeWpE?=
 =?utf-8?B?T1ZnYnphQ2ZqSit6Rk9PUTYyMjBMK1hyK2xPV0lCRjVvZjl5Vms3SHN6YXVO?=
 =?utf-8?B?dmZ3dC9YUnU5aVJRa2lEenU0a2RqYlc0dFRjSE41d2ZZU1NPYU15cDcrWndE?=
 =?utf-8?B?aHNoZ3VuTGJOaGszU0crdzdiNlVSMHhWc3BwTzVHRld0eEt4eXRiOEFrcWlp?=
 =?utf-8?B?YXFXTmp4QmR5c2NpcjZ1Wlc3QWhpZ1pWZnYvc2QrMDhhcmN5TTVZZnJvOEc3?=
 =?utf-8?B?WmNsRXQ0cU9BMFVDSldKcE9pZUZpVG5ESHk0b2NJbThaNnVyaVlveFY0c09N?=
 =?utf-8?B?SmZTVFQ2TFViSTE3aTBFYmcwd1pwKzlvaGZkeGY4R2NNOCtNZDhDQURpeG9u?=
 =?utf-8?B?ZUl6c2lVMGVScmlSZUE5bGlyZERNc2gwR0NyUjE3NTdmdURLNTYxcDVzVXIw?=
 =?utf-8?B?NDdBSm83Yzk3SnpmUldFTldocCtlNEJxeG9QWlJsUUpQN25zT2hyVmVTb0xh?=
 =?utf-8?B?WEpYVzZ3STBoVXdQVm9GR2Uvd2tJMm5hRnFyNEtrMlJyYndoNiswc3oyVi92?=
 =?utf-8?B?UEp5WlFrOE1wTzB1MTc2d0s1VUVtVHpTSDVySmhDNys5ZmNBemJ5TWt2YmJo?=
 =?utf-8?B?bHcrYThJZkpRSEVlVnhveEFKbE9zK3orZ255UUswV0JVOWxpSEtPTzNoUzg1?=
 =?utf-8?B?WHFyYWFHYVR4blpNdXg3YU9xVlVPSFhRNjQvbW93TldyT2ZRQ2hKRzJhZDcy?=
 =?utf-8?B?RlpIakFyNHMxcmhVdERrS2NSNzZaeHoyckkxQUdwemxJamFtK3kyRStVaTZU?=
 =?utf-8?B?aFl4aWhYck91VDdhcGx1ajFzbXAwQTZQY3YyVEVLMUtEcG9OQVl2dloreUhj?=
 =?utf-8?B?NkU1L2ROalV4OGFwVCt4TUlBTU9UNFIzRVhPckI1QVR2c3MzZE5COVZVZmxI?=
 =?utf-8?B?TGE5UGgxbDNNaWErYTdQcXNIcTJjWnFHazRDT1VNOHhtMUZ3ekZva2VhVS9M?=
 =?utf-8?B?d29RaWkrWGNIbVVsaDBBYzN2Qy82UzBnWEZUL211aWlMYVF5TzFYclFiRXcz?=
 =?utf-8?B?MnQyVzczb2FZdC8xNDBEVkxpWUhYV21GcWh4ZTFGem9QNERoeFZpQ2xpK0Jw?=
 =?utf-8?B?ZGNTRHhZSWNkRUpSRUNJQnBobndZZlo2ejFJc0JCWnRROG5qYzJZanlMSjhk?=
 =?utf-8?B?QUtXdytrNG1RU0RJUDY1YlRYdEczQlZiMVBLMFFIR3JRWXdxczdIUFYrNWYr?=
 =?utf-8?B?MWw2QWdNSlhFdk5ZVXE3NVp6Q29KTk50VmFOdU02bkZmSEhhTk5ZTmREVHZ0?=
 =?utf-8?B?ZG1VcjF0SksyakRFTEZoaHVCS1ZYdUdkYnZYUndMOVRFNEppNWkvQ3R0OWhX?=
 =?utf-8?B?eDJaV0hUUkxOV3pxRTA0Yk03OGFiNXFXMXNOTzdOa0pMY3pVU3ZzRDZ0a2hD?=
 =?utf-8?B?VWVVK01MbUIwTEhjTmFGQUpTaWNCakppVCsyTU1LV0pZRzRZY0JxdE1rbnph?=
 =?utf-8?B?NVE3M3RUczZLV0ljaE1QTVFMUE4reFRkanY0enVHNTkwdXZxdURha3QvYmxi?=
 =?utf-8?B?OStJU3RRR2JvNWwwMXg4VlFhWDBWaEt0eUx4Y2crQUxTVEtsbTh0Smx6cElJ?=
 =?utf-8?B?QldUTk5KN1ludzZJZlBIeHJhUStGcU03N1VQcjNsOEhxaXJqWHg2S1B4WXU4?=
 =?utf-8?B?VUZicUdZUnU3MWt3K2ZtL0hFdWhOK2JpU3RLWkZJV1R5R2FPYWRNRS9MSVRT?=
 =?utf-8?B?ekxYZXJaRGZERzRZWGxrMGlNLytQWjZwR29YWjM0aFM4eXRlK0RkUzhwVHBh?=
 =?utf-8?B?cnpmU3VWemRNTlJ3S1Y2MWJBRHdjdFBQZ0l4bU1NOUlMTDRuemZXRi9sRXZ2?=
 =?utf-8?B?SHYxMW9GVllYakV2NGs5dUJVZjZnS29jSFZCZXFOaDcxMXI2a2JScUdqTHJ1?=
 =?utf-8?B?ZUo1cE9DdGpRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHUvb3JMU2JpSWI4MTBOaEI5ZEZpQWNpczdGcGRpcjZWUHgzR3JRdFhWSlgv?=
 =?utf-8?B?c3Q3cDBVRWk4enc5cVlYWXRUeWhRczl4QkU5TDRtK3NxVjVrU09CY3JhSVVF?=
 =?utf-8?B?b1FGbmN6SncyS2xJc3RLKzM5Uk81UzU4M0hDUU1pMURLMEZuYVpxWWJ0YUpy?=
 =?utf-8?B?Nm5hYXF3NFZCZ3RGS3BEdG5DSHdqaVlkcm1zVHh3QktDUVJZM1A3U0xHUCtt?=
 =?utf-8?B?azh6TXkzRjJDUndjRDgyVEtuaTVoZkQ5em9JazYwci9NNFVhQ0ZnMFpoV1pw?=
 =?utf-8?B?T1RjTW53L1psT1F2Q2dESmJZT1NDZ1oybFdER0w3bXBxNVJBaysxTk41ZkRs?=
 =?utf-8?B?bVB5dU5sb1p0ZmhhZkZUd3QyT3VGMENnY1BRQ0dIY1owUW5UUDhJWUs1WnFl?=
 =?utf-8?B?MW4zZmxDSU4zRFR4bWpZdm1YNzdkSHcyZ1NXYi8zWFBPNEExZ1VJTWJGQStX?=
 =?utf-8?B?MFBhMmRyNytDOVhXSXJ3cnZzaHBmT2hUU09ySmFoaWV3bXJ4M3RjQTRxUHVU?=
 =?utf-8?B?c3ZRNHo4ajBLUEVwbzZwNDFUK1pUOHZZU0ZDZ0IyYXhEblhUTU4zVWpnUjJt?=
 =?utf-8?B?N1YvcG1MYU1KU3M5ZVQzUFRhbnNONEhpdXBFSCs3VnJZbnp1Tm9iNkNNVWJj?=
 =?utf-8?B?MXpHNzNmd05GNWloNEM3UkhST2FvclRIVlRDdEpNcFkvU2tocGxxajF0L1Bs?=
 =?utf-8?B?dWhSVWhoWXNpU0dibkZ4UFJnV1N2M0x3UlVTamNXenhoVUhGbHpCeFhlOFNV?=
 =?utf-8?B?SldZYVF1amNpV3ZtOXlrMmZOdXJUTzdwV243NXFnSlpaUjRtdUpwTUJoQ3dD?=
 =?utf-8?B?aDNTNHIxZ1ZmaVpMKzF3TVdkaTJndFlkc3hsQ0luVWltUGRFMzloRTlMeERD?=
 =?utf-8?B?S3VSbXFwU0ZWWUVRcUp5SWgyZWlqWGhKd1gzUEVsMjM1RGhjbDA2RXYydnlI?=
 =?utf-8?B?OVJJcUZBNG9GK242dDFYbGt4QmhWUWxtNWZ5N3R3SE1TS1I2RkE1MUNOd2h2?=
 =?utf-8?B?SUZyc2RTaU5lWXVhME15Mmk4Y3Z2L0V4eHcyQ2RFRENab2RpMFlEN3F6a2o5?=
 =?utf-8?B?T1lUVWVvNGx2VG5vMC9MVm5GMUM5cG9zY0xXNkU0S1dCRFZZU1NyZllUdk5p?=
 =?utf-8?B?SGswQUNWYzY3V0tWeVB4VlREa2cwdWZIdjkyTE5GTFY1WGdabS9VaEpXeEVs?=
 =?utf-8?B?bDBKOGJrdXdnRG55aWpqZTgrL0VqQXdiZE9qZVN6V0JCWWRuOHFZeG1ZRCtR?=
 =?utf-8?B?Yy9ma3o3SzBQbTNrSnIvMDFqTk1ZdHAwUUM3WTR5aC9JVWxjSXZCZzYvOHNY?=
 =?utf-8?B?Uzd2aUkzZzJST2tQNGtYTEZHK3Q4SnFVUW5ia2ZmdllHb1pzT1FFWGtXenVD?=
 =?utf-8?B?L0JVbFM3dFdGbDRRUlNIOGErdnExWm9TTEtSWmNTa1RPNjE4MHhKZUlEcUV6?=
 =?utf-8?B?c2E1cjJSQ0Z2OHM2MlJiTUJGWFZoeGV3MUlyRHJCTXRUUTJBYnJldGhqdnJL?=
 =?utf-8?B?L0Y0RDhYZ0dYS2hIOXFab3RkNnVTb1FlNXRRYWswR085b2hhRVJtMU9KamNG?=
 =?utf-8?B?cHVOZU1wSWJDMVlpTXRCSWUwTko2eXl4NnFyRlR6WkFydE1mbVpYWVJDZENh?=
 =?utf-8?B?a0FHQWhTL1Rxd3lzTmpLVHIwckFHbUoxZ2QvS0lmVG1lUGdoYldDb0Y2SjVl?=
 =?utf-8?B?OTk0M1JCM0dlcERUMVk2STE3WVozeHFjZVc1QjRLN3RJZ2MzazBWcHdkcGNE?=
 =?utf-8?B?N2FYWERHaU9ENmR5TlppYjFoSlpKV1V1SjUxM1dlY3A5clNGNmZSM3NuemhN?=
 =?utf-8?B?MXlKNkllUEhsRmRVV0U3MlEvbWNyV3FCWGg0MVFGRFZUZmZ3RXJiWHhRdmRB?=
 =?utf-8?B?cEVNSStiN1Z3WWp0aFg2ZVdhVjJFdUsvTkhSRVNIMjVpVnZDSXIvNDg4MnlP?=
 =?utf-8?B?aW5hZDhNUXNyZ0xOdmpjd1I4Z1I0OFJWejVRYVdJSVFtTzZLM2lIVjR6SUU5?=
 =?utf-8?B?aHJ5UlhjRXhXSkRUMmUvK2lnbkgzM0VNRDAvZXNQdnJaK2xVV1JGWFVzeDY5?=
 =?utf-8?B?MWxPYzlxQ1hzWERWOWdBZEpUZlRrU2lWbVUvcjZxbzU2dk8zQUI0TDFoRnRY?=
 =?utf-8?B?QVRndEtNbFExcDU5c0RycmI0ek9JazBjYnJQdUZBTVo0UlBuZkp6eWM2bFA3?=
 =?utf-8?Q?fUoX3GYwkTjiuFo4kngRA3NlVVcbH8DpNQnbB97rOxlj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5be7afb-1917-4f3a-2ae5-08dda9b9e592
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 14:03:24.3722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mWySVvpgNmK0Zh4IY5b2Gq/a33h2LrxadfIFTSAqOBuZJXZLepw9TKg2aujaT25p483/AYMN/wr7tIeTyJtD0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8598
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

FWSEC-FRTS is the first firmware we need to run on the GSP falcon in
order to initiate the GSP boot process. Introduce the structure that
describes it.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 45 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 4b8a38358a4f6da2a4d57f8db50ea9e788c3e4b5..2f4f5c7c7902a386a44bc9cf5eb6d46375fe0e5a 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -41,6 +41,51 @@ pub(crate) fn new(dev: &device::Device, chipset: Chipset, ver: &str) -> Result<F
     }
 }
 
+/// Structure used to describe some firmwares, notably FWSEC-FRTS.
+#[repr(C)]
+#[derive(Debug, Clone)]
+pub(crate) struct FalconUCodeDescV3 {
+    /// Header defined by `NV_BIT_FALCON_UCODE_DESC_HEADER_VDESC*` in OpenRM.
+    hdr: u32,
+    /// Stored size of the ucode after the header.
+    stored_size: u32,
+    /// Offset in `DMEM` at which the signature is expected to be found.
+    pub(crate) pkc_data_offset: u32,
+    /// Offset after the code segment at which the app headers are located.
+    pub(crate) interface_offset: u32,
+    /// Base address at which to load the code segment into `IMEM`.
+    pub(crate) imem_phys_base: u32,
+    /// Size in bytes of the code to copy into `IMEM`.
+    pub(crate) imem_load_size: u32,
+    /// Virtual `IMEM` address (i.e. `tag`) at which the code should start.
+    pub(crate) imem_virt_base: u32,
+    /// Base address at which to load the data segment into `DMEM`.
+    pub(crate) dmem_phys_base: u32,
+    /// Size in bytes of the data to copy into `DMEM`.
+    pub(crate) dmem_load_size: u32,
+    /// Mask of the falcon engines on which this firmware can run.
+    pub(crate) engine_id_mask: u16,
+    /// ID of the ucode used to infer a fuse register to validate the signature.
+    pub(crate) ucode_id: u8,
+    /// Number of signatures in this firmware.
+    pub(crate) signature_count: u8,
+    /// Versions of the signatures, used to infer a valid signature to use.
+    pub(crate) signature_versions: u16,
+    _reserved: u16,
+}
+
+// To be removed once that code is used.
+#[expect(dead_code)]
+impl FalconUCodeDescV3 {
+    /// Returns the size in bytes of the header.
+    pub(crate) fn size(&self) -> usize {
+        const HDR_SIZE_SHIFT: u32 = 16;
+        const HDR_SIZE_MASK: u32 = 0xffff0000;
+
+        ((self.hdr & HDR_SIZE_MASK) >> HDR_SIZE_SHIFT) as usize
+    }
+}
+
 pub(crate) struct ModInfoBuilder<const N: usize>(firmware::ModInfoBuilder<N>);
 
 impl<const N: usize> ModInfoBuilder<N> {

-- 
2.49.0

