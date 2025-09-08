Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 342D4B483B6
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 07:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F4F10E087;
	Mon,  8 Sep 2025 05:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="S/PMQ6EI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2041.outbound.protection.outlook.com [40.107.92.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4761510E1F2;
 Mon,  8 Sep 2025 05:45:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ft+yT5BPpr8kVnP8hcr2uZ/vXreu60kZvYzZW5zQb7cPjqNK8VUXJckxhKAoOxYSYpVlhUL1LSE6Gp+bnGwneIITR8W6M5VeDtGS1IWgCDUCHwSWnB6O1vlp13dceYRi/uhAYBx6Q699g4VD9nArxq01nnEQ0pwO4/cxh+Sbj2lcugFeFa8IM9Ar3EZmlYKggmnGKQFK8bAl+F06zfoa7c0h328H+CS1j74JOtAm2QJPox8mpptyKgArHHjxqNwkDw/ZGoK/ocgdNwPlJpblqgCucUUy9cw6wyzrdzKZ4oQmROPpIDvHl0uDKjHaDBNVUWVXVlWxSpWRXr8FNwK0xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1oXlh8aKe8UOPIontawLbcRbt/aYxs28oLQsmjmaumI=;
 b=BOGD8wGYemNSpcGi5RlYoAjvlEx0vfiS/BcFAlYm6zj/TeF3x2wd3UQXmhLTiKwsGdcX2cd8Zn9+56od9yHtIV3NGFV3boG/eFoNQ0l8apOYohuGw7a/0OnEmC8595+l6reygOdc/1FZ4y+5zsh6pf/IQZi2IrRPsWclCpcuPj6eVnZZVMNsMveBLuPxwvFIYFnm6YI4a4HXzJHekwOI18/gQbwp1VTmoUIz8xBYYgqeW3jzFgGQ6pqHgmbfTU0G0UfOH/3BC3ePIJ7KUI+M0dY1cW/Yuj8aSr8hlj9C3exjKDnndBURs6yEFNIvQkwEoYV11hXmoAAma6O7+wAKqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1oXlh8aKe8UOPIontawLbcRbt/aYxs28oLQsmjmaumI=;
 b=S/PMQ6EIL+QobOn4ifb56OQ5U/TFd/I6q0m6+JcD3y7VmXrJwdPUA1jWpZf83aN9JFmycSKbBVjWhLAMBni5ujnIs485U1GNqfhbI731cfbCYzm3KfcSwJQ0ODEz/YFjIo4sZqTVLUNQVAEG9cWLpipmYMad4mAuIdfjQeHiE8v2derqHnV2ZaPGYRQiDmdq8xDjCnvLfPHkderG2ZOjmrR+yNtQhxTcJj1qmJ3NfmLBRilV3jdNy03U5neGAyM9TPSPqlOkdacfR/DK/lXaSFLO8oongba02cTejTtmZBwmq1ymz4VHTL5VUcIv3nTKM+cLTW+Fos7gaGFw2a5DDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB6048.namprd12.prod.outlook.com (2603:10b6:8:9f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.17; Mon, 8 Sep 2025 05:44:56 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 05:44:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Sep 2025 14:44:53 +0900
Message-Id: <DCN6IC0DP3J4.3KR3OJEM0YCCF@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 05/10] gpu: nova-core: gsp: Add GSP command queue handling
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250827082015.959430-1-apopple@nvidia.com>
 <20250827082015.959430-6-apopple@nvidia.com>
 <DCKUEPRW2VR8.26NJRPDYG2DFK@nvidia.com>
In-Reply-To: <DCKUEPRW2VR8.26NJRPDYG2DFK@nvidia.com>
X-ClientProxiedBy: TYCP286CA0129.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB6048:EE_
X-MS-Office365-Filtering-Correlation-Id: fb38dc9d-41aa-4a0e-fb6d-08ddee9ad75d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eks1NGJ3UktmTHV1aVVPK2NTdk05cE50YzQ5aFNzNUNQaVYxMm9FbUEyYzlH?=
 =?utf-8?B?ZHJqTHpoQUpZdkN0VUF4bElkTkh4b1pNLzBTaGxRQVU2d3ZWVVQzWHE3TVY1?=
 =?utf-8?B?TlU2REs0bENzN2F5aWpGcDlzMk54VWVCblJyVXpvTmNBSTFMSkdycnBYYlFB?=
 =?utf-8?B?QlJMbGJISEczQ1ZBNEN1WUpnd0t5K2NSa1FKSGY2T3FiV1IySGVGdEowQ1ZV?=
 =?utf-8?B?OFg3WXBRRTJvOU9mMUZ0S2cyZFdOKzVLVklCZTFxUkVhMTVpZUdIblBVWjFI?=
 =?utf-8?B?RGI2dy9UOFY5S2dtaktRRmczVnN1aFhiNUJwa0tyU2JGM1VmbUVEUmRWeEZ0?=
 =?utf-8?B?OUZpVVVnV2hhOGVJd2tKdEg2bEY2MjhTOCtNNzZLeGJjM2MyTzYzNVR3K0NE?=
 =?utf-8?B?YWU5Y2RPa0xrcWFTR1ZyRUpYdHZ6RFA1cWEvajRJR3RsYXJwM0REcTA4OWlB?=
 =?utf-8?B?em1xWFV4ajVJOEROQXJUVnpjTVJzQmtLSGxOMHQvWjlRNnRlOHByWmMvbnpG?=
 =?utf-8?B?RE1EVzFnYTh3Z1I3N0d1WjhEalBtZ1NMYm1Lb2M1MVFIdmFqelIrNVE5aUIy?=
 =?utf-8?B?bXh2MGliMFlkUFY4bjFDNTREUlFmcVhRMlh3amlFcnN5bEFVZU1KN0JPS2Yz?=
 =?utf-8?B?TjR1aWJjYmFaZjYxcDhWektsR2N4RzFuSXB4K3dQeFBGNm9ZdmJvQWdIK3RP?=
 =?utf-8?B?RTZoRnhtVmhtWDFJelF4TWpOdUMzL1BwOFRLSFlPSkd2bThQd1pkM2lBN1B4?=
 =?utf-8?B?cTk4aHkyZzloT3dvVkIvd0FXdis3RXpjbTNzeVN6VXU2djI1ZGNSZ3VxREFq?=
 =?utf-8?B?QjdmMlQwaFV2OG5Hcm5Zd1NrTXJVVE5sWmNEZDZJRjFSSU9NTnZ1Wk44MnY3?=
 =?utf-8?B?NHc0NWpBK1BrVy9CZmxQYi96eEZNSE16eW5wYituNWVZcGZzSGJvc0hRWEUz?=
 =?utf-8?B?ZUZPcTNqckI0a2lDcXF4anRZM1F1NDlFZjlKbkd2SVgybWMwdTBMSHh5Wmt4?=
 =?utf-8?B?WkhWYkgvb3cwREorV1cyRW9rYkxlTkt0WWtMYzV6eWlOU2tIaUVpenkydmRS?=
 =?utf-8?B?eDh4cURpaXVWZ2h4T3MwQjhwZ2dSMDgyVmVFcHNUQldTbVNkZi9wbVJBTStW?=
 =?utf-8?B?czhxUDRJOHUvNlRBY3hOZndpdHUycjBUcTgrUWp1a3BTcDJVVTBET1U2WEE1?=
 =?utf-8?B?OU9jQ1M0SXgrVWQ4RVF5aXhLbWJRZG9ZWnAvU041YklZazdJYWFWdVdrZXJ2?=
 =?utf-8?B?UElrTURTRUNzQmxmV3ovWlZTUmdoUDdJZkkyNERudlFpc0dKcmF3ZTlFc1ZE?=
 =?utf-8?B?U0gxWHpqMUVoc2VqdHBHQzBDRW51UytKTjhGd1VHeE02OVY4cjdOcUhtNnEv?=
 =?utf-8?B?cnVwU3RjbWN1aEVnOFZ1LytpRVZONFdYdjJQRW9XSGN5ZmJsQTFYemxJNG1u?=
 =?utf-8?B?S3NFdzhEeUEvQWRBa2IzQlRqYlFuUTNGUUFVNktFY0pCS1JpKzdlTGM4a28y?=
 =?utf-8?B?YW9VUGxTWlJ4eVk2SEJZeDA2K2dZc3RzaXNweENJQlJjbU5raGJkbjdPdXBI?=
 =?utf-8?B?K2VqQkFSaHFzVUtSOFpBbmlrejZTaDFSN3pSM3NlTUtGMHREQ2cvTnhaTUxs?=
 =?utf-8?B?eDdSWEdXV3QwWWhtOEJFNnNPaFlLVkw2ZS92c2hTUExYUEFoQksxeWZReVcx?=
 =?utf-8?B?WDkwT3VpWVZWNmRZUUhvdnhPY1NiWjlkM3dpNXNJeEdXdDk1VVZlRG1aemtR?=
 =?utf-8?B?Z09vOERVYXRmS2l3cE1qUGd6VlBMK2FoWlNoaGV1eWtDMFRsSEpqc2FUYXVn?=
 =?utf-8?B?VXhDcnhqWWM2TStqSXRtUUFKdFhjQWN2dXVLbUhWRTFLUE02WHlPYkNhaWFy?=
 =?utf-8?B?a3RlK3BCMzFOYkxpNWxOWGdVWlZtV2pzdW1qNHhQVkRFdWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzYrdmdaUktaZS8yUzhxRFRNM3FxZWFPMDJwZEtHYVQ5RkErczQxWXN3c1V6?=
 =?utf-8?B?Uzh5UUdrSW5tZGNuSHZyTXV5TWdoNWM3NzVoVmU3a2xQWEVzM2R0dnpYUyts?=
 =?utf-8?B?eXZwclVjV0RUN3FVTUlyRXIxcERUbElTRlFZT01DYjk0bXhKZFFPTmlRU1dy?=
 =?utf-8?B?K1ZMT1NhYmU5REhXNi91aDM4RURYWHorU3BFQmdoSXFJcmNmY1BUWGxBMWU0?=
 =?utf-8?B?azNBSkI5b3RueUxtTEJCQ1lqWThEZmZHQUlLUTQrTG1MRmIwemtEZ0lXNHlS?=
 =?utf-8?B?Sk5tWWhBeHBJUlB3elQ1RTFFNG1hT2hsZ212WFd2N1JDRGc2SFBWYmFKUHUv?=
 =?utf-8?B?TVFyMTdPMThrdnpkeU1TSGx5eG9zczFlUjkwUjltT2JRbUQraC9aMlZ6UXJR?=
 =?utf-8?B?OUFDUFpJcEpaRU1FNGs5TDB4RWpyaVVjNzE2YTdwY0M3TUtBT0IzbjZOeHJr?=
 =?utf-8?B?ZXZvbzR3WUttdEpRN3FmQVgrMHd0Wm9mdUhhK2lFMmJvVzlRYlMvZ0xKaU9O?=
 =?utf-8?B?cEJqRUxkVzBnS1psYk1Pb3NacDJwVDdmK1p4eG4xSUZDSm55OGVlQWtvZVZK?=
 =?utf-8?B?aFVteE1HQlVrT3RBb0pKMmRQUkxTbzY3dlZNUmk5VVh1M2NpZnlJZEc5Zmxu?=
 =?utf-8?B?Mzg2YWZiNWVyNnhzcUJXRkI4bFlzSTFodENmOVkxM2UyMkVEYWRHY2ZlbE9q?=
 =?utf-8?B?STUvUkZGS2JXOVVyeXFwOHpWVUU4NE9RU25abDEwTFNTY2lneVo1ejgvQXJZ?=
 =?utf-8?B?OWxyWThSWi95eWFMUVNyZHl1c0g2Y29pSlpvcG5vdUMzQkZlNVA2Q1NqSEY5?=
 =?utf-8?B?bEFTWGt4SHMzMExCa1BVcmNkVkVCUHBqQW13UUNHVmlVYmRoMjFzUG1TVDJD?=
 =?utf-8?B?dmNCZGhnSTFGbnFtY3pMT1J4dEw3eUUzZHNTZEFxNytMTDRyblVUdmt5UzR6?=
 =?utf-8?B?MU9HQUpDUjhUVjdIM25RV1ZaZXc3Q1BhVjhxejVCRjM4b0E1VC9WMEpBS1pW?=
 =?utf-8?B?aU5PUkc1MHB6M21jWHhDdlQ2UWkyWDV3U3VPQzNpZ2gwZWpreUhET3FhZnh3?=
 =?utf-8?B?ZlRQZktwWE9hdjhXL3ZUR2lKTThpR0xsUExicFplN01DbUczWkZ2V0Z1eHh2?=
 =?utf-8?B?ZnpodEhKNy9NVmRJVVlqY1ZQeTZOWG1rVmkwL0lzdEZFUU1qdnFGRDExSDJM?=
 =?utf-8?B?ZERKNmNWZm5mSlBtNHpEVlFCOEFrd290V1h1WEZoWWtWL3Q5Z3FJOUhmUFZ2?=
 =?utf-8?B?OVQ2d3paYk9HWXdsUTAwS3p0cGl6dGEzMWZKaFVmZHpKRFhXZkY1ODRnTjRz?=
 =?utf-8?B?TlZWVkxYTWg3b2VlcU1QQk5DbUlDSGxGdVBQV2pxQ3Z4ei9NeEMvdDRGTEov?=
 =?utf-8?B?MmhyRUIvWUFZNVFhMlN1Y1RDZStlTk94RTA0REhLVENucHVPYzE5dytNSE1a?=
 =?utf-8?B?SzFZRzh2OGxHWHdwZXZrdHcxd1diK3NxZVJWdnpkLzdiTHhDZ3lKQ050TmpD?=
 =?utf-8?B?TnplbCtBZU5tUnYxMTAzQm9SN2JtYy9LTjk2Z040d3NEcHl4WmdBemxaSlZa?=
 =?utf-8?B?STZjcTNmT1VWNzdPUHVidEozek52NUo1VDZJT2dPa0FlM1lIZCszQ3NRaDUy?=
 =?utf-8?B?TGZvUlVxZHBNa1MvSUtmT1dHeGljSTIrZVhOTER1Mjh6SGRVeFRoS09WZnpU?=
 =?utf-8?B?SStaYm1PaWFBam53MnNEdStOdmIwbXpSWklpekFPQnVsRWdlSnRxWFZoemVz?=
 =?utf-8?B?Z1poNWdNMmcxeTJRcTlONWRscnZvNGR5amw5dlJrWE43M01Ha3Z3ZUw1Vm9B?=
 =?utf-8?B?OXBnRkVNY0JkRTkwaWFOZitxeTBYZXI3TFY4U0ZDaU5pb3loMnRGNW1rakl4?=
 =?utf-8?B?SjFEb1dwaVBadnc4Zm10ZDJ0SmxRZlpiQkgzbkVnZEQ3SXB0aXl5dmpkM1BL?=
 =?utf-8?B?aC9jZjcvdiszQWtlYVhraWdtVlRYUDlYKzVoQlEzcGRRNlJUWml0ZkNtb2Rq?=
 =?utf-8?B?TkxUM2VKcHVGMC8rdkhVSVZLMXRFZ1lnbGNiRDMyZ09oMURsVmZBZ1F2K2dH?=
 =?utf-8?B?b0pnNWM3UG9lb1dkdGx1eFdhRWVkeVkvTnJxOTJxMjFhUXB6U053SE53eUp4?=
 =?utf-8?B?VkYrSk10S3ZyY2tpT3E5TGxXZXNITjRYKzJOb2c3dm1vb2s4YTJjUFNpM05L?=
 =?utf-8?Q?fVTMPkFxHGb1/yMFRApCwIUCCOacdfbV4cxcyRnA9Jh1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb38dc9d-41aa-4a0e-fb6d-08ddee9ad75d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 05:44:56.6574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6LG7bVnD/sM6Ufn+F0XuW4sgE9sot+4gbCBxjLCVm4YnPLZJpQndvn1rvNxDGO1UJrnKetoJAGJjpWMaY1rDaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6048
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

On Fri Sep 5, 2025 at 8:50 PM JST, Alexandre Courbot wrote:
>> +
>> +        Ok(GspCmdq {
>> +            dev: dev.into(),
>> +            msg_count: MSG_COUNT,
>> +            seq: 0,
>> +            gsp_mem,
>> +            _nr_ptes: nr_ptes as u32,
>> +        })
>> +    }
>> +
>> +    fn cpu_wptr(&self) -> u32 {
>> +        // SAFETY: index `0` is valid as `gsp_mem` has been allocated a=
ccordingly, thus the access
>> +        // cannot fail.
>> +        unsafe { dma_read!(self.gsp_mem[0].cpuq.tx.write_ptr).unwrap_un=
checked() }
>> +    }
>> +
>> +    fn gsp_rptr(&self) -> u32 {
>> +        // SAFETY: index `0` is valid as `gsp_mem` has been allocated a=
ccordingly, thus the access
>> +        // cannot fail.
>> +        unsafe { dma_read!(self.gsp_mem[0].gspq.rx.read_ptr).unwrap_unc=
hecked() }
>> +    }
>> +
>> +    fn cpu_rptr(&self) -> u32 {
>> +        // SAFETY: index `0` is valid as `gsp_mem` has been allocated a=
ccordingly, thus the access
>> +        // cannot fail.
>> +        unsafe { dma_read!(self.gsp_mem[0].cpuq.rx.read_ptr).unwrap_unc=
hecked() }
>> +    }
>> +
>> +    fn gsp_wptr(&self) -> u32 {
>> +        // SAFETY: index `0` is valid as `gsp_mem` has been allocated a=
ccordingly, thus the access
>> +        // cannot fail.
>> +        unsafe { dma_read!(self.gsp_mem[0].gspq.tx.write_ptr).unwrap_un=
checked() }
>> +    }
>
> Here is an easy trick to reduce the number of unsafe statements: have a
> method that returns a reference to the `gsp_mem` (which contains the
> unsafe part), and have these 4 methods call into it. And voil=C3=A0, 3
> unsafes gone. :)

That sentence of mine is so wrong that I feel obligated to come back and
fix it before someone thinks this is an acceptable pattern. >_<

A method returning a reference to `gsp_mem` would still need to be
unsafe itself. Some areas of `gsp_mem` can be modified by the GSP at any
time, so it would be the responsibility of the caller to make sure that
it doesn't access any area that is currently under GSP ownership.

A better way to do this would be a have methods (safe, this time) that
provide references to the areas that are owned by the driver at the time
of calling.
