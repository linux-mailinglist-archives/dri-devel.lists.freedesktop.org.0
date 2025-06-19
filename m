Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9664CAE070E
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E320A10EA47;
	Thu, 19 Jun 2025 13:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MVZ0Tj0t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2052.outbound.protection.outlook.com [40.107.102.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A7210EA47;
 Thu, 19 Jun 2025 13:25:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Na5wZoNLRSIUf2VSh4Pup7UUxC9sCR2l+hHMUseRqA8wzXmIib1UoCANPd2OYaRO9aWn+s83Nr95Wt/HkNkUi3vERJUjjkn8FreN68b1i++s3i34JWa5PDIxl7muBdMIc3Vys4wXTo9OJDdziBpNVWWw4+RilIMD4LpeMU8mA2u+l0orKSz8jamdNLbceCKMbnAGFVPHDe54oCoGtq4ZkOiHTgM+WrPugGHixWS+MiaoFaEuhEAh4Dad/awr4CsDLjoDi3BrYyhvToPDOiYvnEyzh7NP743gWzlmrkY/xPPCyeT2oCmuzb/bbQmFaJlVShMct+MGRvQGDMP1WydWbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gVdeOSaK6oXuDuSmZ9ja//bAAloMWQc1ufxN4SDGV0U=;
 b=IaI11dl50fE9JmKDRbNI3r+/REEhxJGcg56Z68Fygginxqzxj4rApDvWp/zyVHgb4utNrWwm1wEsyIpDt55cuUCArR7pOEf4kt1F3pvHta10ERW0VbNLobWgF5s4KE//f65fjud3R1rwgVmIpM4H2jy0euslTCWGZSy5/yPTXLmip9hMspaSGjqxU5L2VA5mruEnQvUeVCXAWjSeghQJlOSb73jO8PpNZNf40Sp+VGiqThI7Las0d/Gw7en8QcpigQajnBdXkBCFqEiuoJ0EGnebwabY/1cFxSiweN5F0oUg5gwjCPeVOsgQ/SN6VfFFdlRaQPMyGApDmTxdTp7Aaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVdeOSaK6oXuDuSmZ9ja//bAAloMWQc1ufxN4SDGV0U=;
 b=MVZ0Tj0tdb9HvyrO8wHZwZ44U3AHQN48zt2GAGW2E2oo8uvZwpj3xMsvc0XamXngTOAZ7OrvdPzDJhrIUDxyAsej1EpyPMLBXgE6hlTj9QqXT3s722CuDraRICXKoslRWcEi7XW3hos+Y42AJFvS2y3QuCuXtUjSmwKRXm6bsKUTwpuA5ZczIJiqjiHWvCTWcIzo8UmzPdm/v7Ea7MI1QO2ZYfHyCRbaEOrWlE48Yarn24NUqdEb10UeG1oF4m3LFx9V2/5yA5BdkhPMV7L/aEVyqRR0sLbOzPmT4VzXT1CJ1uUGMe2Js/2ntJXI0HwS4WpVR46cg57EZJrwMtl9nQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB8122.namprd12.prod.outlook.com (2603:10b6:510:2b7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Thu, 19 Jun
 2025 13:25:15 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 13:25:15 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 19 Jun 2025 22:23:58 +0900
Subject: [PATCH v6 14/24] gpu: nova-core: register sysmem flush page
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-nova-frts-v6-14-ecf41ef99252@nvidia.com>
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
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0186.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: f50b5af5-cc47-4e25-25c1-08ddaf34b9e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?clNYRUJNZlAzK2xJOTU0alFBQ2ZGMnJYRGYvVCszc2hBcHNiMkswT2hScUUz?=
 =?utf-8?B?dXZrTGErM2VRNkNLaEp1WEhwTUFWN3g5TkNSQlNjU2NuL3FDd0I3TWNYSjVQ?=
 =?utf-8?B?aVJkbDZ3T3Vxc3pDMlpFRER5UVZla0hVUzFRV0NtS0xnU1JqcDhmckN3d1No?=
 =?utf-8?B?YWREcmN0elZLbm5UL0ZuTWFwMFB4YVhrSlFCUFVSaWh6WVljMW4wUDhoYUx3?=
 =?utf-8?B?azVvRTNMbzFyR3BwZ09hYUhpMzZBQTN3YnV1Tkp5alhTMXYreEFzVWNLblMr?=
 =?utf-8?B?cnpPdTZpVDJJMlpvUm53Qmc4MzBJQncvMEFWTERjeGpQQmtFRXM4VUtnY2hz?=
 =?utf-8?B?V1p4cVp2N0NtdU90M1dtMWpNcWhFY0VnK2JHeFN4M3BHc25lNmk0MmQrUDNy?=
 =?utf-8?B?ZW5HTTEvMitDZTVOMGFTTkNFRnFscGNwNHFlL1lCWEVSdG1rYnR4NTRvKzN6?=
 =?utf-8?B?Q0ZUeDRRbnhvS0tTbVpVRVZsV3ZSSWN6eXRINDVSeDJlKytsQWExQ2V0ZlZn?=
 =?utf-8?B?eXoxdC9maVhrTEl2NFZIV0JaSXRTaHBxbnZJL04wZEFVdWlNcktSMWM2cm4x?=
 =?utf-8?B?bGMrTjNBTXhvVitGOExoeDIrSWhYUWFIdTNtWTlQM2wrRmRGWEZ1UGd2MnBX?=
 =?utf-8?B?NTBwRnU0RHpoTUtnMS9wQzF2Q1lFOVJDUWxPMlJrd0w4NGFQVStIOWhMMVBK?=
 =?utf-8?B?OFhQVzVudTJOdzFUQnMwMUtBTWl5dXNYMWd1T1l3aGYzOVQ5cUl4NUk2SXht?=
 =?utf-8?B?ZGdmNVVVMEdmWW5uaURxZ0YyQzRGUzNZcDhuNDJzaHJEQzRzS3E3Tk9Fblp6?=
 =?utf-8?B?Z1RRYVFpU0I1cWRWbnR1S2xnaGJQT05ZUkllVDdDa1ZpWWVuVlZRVGwxTTBT?=
 =?utf-8?B?U0pGY1NDS0ozVkxLcGlvNWpEcUZ3U014VHZUZlJNZ3AyUTNoaU1ESWh4QTFn?=
 =?utf-8?B?R09GQzBvVGE5b1BHYjluZ3RCc1VZOEJlRkJ3YWNzRzFyRU5lVis5Vk85ejJy?=
 =?utf-8?B?LzJGL3IrNlUyWHkzbVFDVWtsdUNqeFB3dkhuYk1zWWY3LzRmWFQ0MEpwaEow?=
 =?utf-8?B?UkczVUoza3EzdWVxZm0yWUwvaTVBeDh6UkRlc0FrdjNxTnFUTytQZ2lMVWpS?=
 =?utf-8?B?Y0pHQnp4dFpzbXN1RXNyYnZnUTFyenl1WWRNaUh3QWkvRGRLY0kzZHp5amh6?=
 =?utf-8?B?OWMwSWN4eUFQMFJjazg0OUF0cFVNYURmZmZraU1lOVpuOUt2NG5MNW1iSjhQ?=
 =?utf-8?B?bk5tU1RhbzZvZXc3b2U0WGw0SW9CYWNmZXZRbnJCZU5VdHFEcHlyWXhSSGs1?=
 =?utf-8?B?bGx4VEZZaUhPbmpSblY1L3dnVUxkRitJeEZMMGx6RGhXdnNRQmk0MWU4Z201?=
 =?utf-8?B?U1hzeW9IUkZMYXJzazF4MGg1NXJ0TkVIcHo3MkxrS1hIYVVyMWk4WlNZdWNM?=
 =?utf-8?B?QUYyTUEvRHNJVDlpTDRUMW9WTnljRnJScWhoOGlkUERVaTVMMEhCbEo3Vk5n?=
 =?utf-8?B?QU5GQU1Kd1JmUHh4YVFPT1FPWVFnQmVSdnN3SmU0QlBRd3BZdzdUMzVxTFRE?=
 =?utf-8?B?Z0FyclJrRDRGVzhUVUwwZWRGSy8raEYxaTZFK3orejFHSlRuK3hlVTZ4czN4?=
 =?utf-8?B?MGVEUExEeklTL1BJNTFZRE04QmxEbDdid1g5N3YzYzJuakt6SzRMUGFNMXB5?=
 =?utf-8?B?WjA4T0IxSTA1MHJkR3hTSEdWSVhJTVRqcUpBcUFUZ1JFcnlnZ0xWZGV6M2g1?=
 =?utf-8?B?U0paTlZ1djh3dTVoR0Q4UmZBNW9ZTzVncmxPREFkRnZhT25MU1h1YXlldXV3?=
 =?utf-8?B?N2NBdHA2ZEZGT1l4M3lIdnM4WTdLYXFoY29zMXZtdlRNMEVUSnJvU0Q1bFVZ?=
 =?utf-8?B?TnFiRit3WStEbzEvQlRia3N1MWZxaHFZc2lCS0VUNStxTjh4R1dRM1dKVHl4?=
 =?utf-8?B?eEVxOVk0ZWdQY2NxQmFEUjRsZkNBL09TTWhjWGVVVlZTUTNMNUIrcGJIcUFt?=
 =?utf-8?B?YmVDcXhrNGNnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmUrUmtGZVpkRVVJZnNNWUhPSEoxYUhUMVBEekpLcktWaGR6VExrVVF6a2w1?=
 =?utf-8?B?dkR5NDdoSDZUNWxRM3lkdnRiYVQwcUdZZmRRQm1CSzdwNEJSbE5UZGhzZCtW?=
 =?utf-8?B?eUU0MVBZS1BsbXhUeENPaGE5Slk5REt6ZkxLNVgzTE5yaTNnL1Y2UzFBenc1?=
 =?utf-8?B?TGJzRFBVY1hlQnd0K3dqZFRQN01EOC9BZ3dsUTZ3STZzQmtnYlg1YUJWb0lV?=
 =?utf-8?B?cS9kNnRabWJMTEs1UXlvUWx1NnNWZ1NxS0Z0aHRPa0J5TWYxYko2SGEzTWky?=
 =?utf-8?B?N2VVclRoQzY1aStpd2VMSW92N1Z1eGU0RHpUU2MxVVNSTVRjaVI3RGF1T3VM?=
 =?utf-8?B?OTFucStSQnozSk9FWWpiczJRZDErL3VkejczM0JScjFOT05mVjd4c2xvZWNM?=
 =?utf-8?B?a3JDTFRhdzI3YTgxWUwwRHBrN0dJbzFXQUZiaWdIWDRRejc0V2d0MjJFN1F5?=
 =?utf-8?B?NFZPemt5aFhLalA2NmFWMUdQc1lneG1rcUJGK3dKeGhvaE9lWit3VzRoR0tq?=
 =?utf-8?B?N3BmclVjYklrV3cya0hDLzJXQVlKa05RUllCUHJqcmtSeS9pT3dNcUIxbW16?=
 =?utf-8?B?ZDZvN2xqcG85M2ExK2F6TFhGZ3pRWjlscmtHWjl6WG5DeVVObmFmYW9PQ2ky?=
 =?utf-8?B?Nk5aUmRPbmFSZTM5Y1kxMjN3YkhONmZicjdOT0E1YnYwT2NDV2JobHU3VkNW?=
 =?utf-8?B?bVB1dHhsY3FTZk9qZCt4Sy9BemJXbnoxTVQxOEtVdC9YNjd3WkpmUDJLbFFW?=
 =?utf-8?B?dXlwbm9UOFh2eGpLb21xZ09zZitrUDh3c1dlcUFudGNDQUgycklabWU0L3lC?=
 =?utf-8?B?ZUdLQWVRQ3Nya2FNQ01VR2dwWDA3TTJNclpvLzhOd3RMdW5EbVNkTHVFdDM3?=
 =?utf-8?B?ZUxQY3VnUncwNE5aL0hMVnZqS2g1QXBjaTlXUXhjSnRaTE5UNEtIc0JPOHFW?=
 =?utf-8?B?c1BzVmRtU3dyRXlNeXJZUnA2am1YWnU1WVc4M1NabTRoUFVkVkRPVXEvalpy?=
 =?utf-8?B?b0VUMnZmbVdmOFhZZXdWWHYzeWM3Si8zeUhYWVlMZkZlQ2Z6R2tOcE1iK0VS?=
 =?utf-8?B?dWJOalRjbXBPay9DQzAweDRSSU1WVDF1Ykc1L1lJYm1DbXBwdGJUK2g1YmlQ?=
 =?utf-8?B?cVhpa1BVVGpqb3dFb2lpYU1LUkJwWGhmVVB0V2pPNkY0d0JpQytHcGkzQUVm?=
 =?utf-8?B?eG5rQmF4L3pReHZVbCs4OWFkcXpyQm5zb1NtR1hBeCtHUUlMcU1NVFNxZTZ3?=
 =?utf-8?B?aFpiNStQTjlyd2tzR0hsU1pHREV3OWkweGhPMTBMOHdaTkRnOERxWE5OZlV1?=
 =?utf-8?B?Mm83c28vMkNENW1xcXgybXlucG5OU2p0Y09vOXdQVVN2bERNVUJTR0VWMnpy?=
 =?utf-8?B?WW9KTjFxb211YkpBcmU4a01adzBZMUp4Q1lXdks3c0JmajZXSHRQejNyblls?=
 =?utf-8?B?alVNWXR6NGlESWlzeG12THhJMk5FSkZsZ2VCb2pldTJGZG1nNWNYM3RBRzQx?=
 =?utf-8?B?cnp0QTh5VlN1OThJWEJMdUMycitrTWZuZ0NIS3dMTmZBYWlhSFdaR0NNdzNE?=
 =?utf-8?B?cGNwOHUvKzFJZFdvZzNhQ3lKZ2xQYlJlZmFLRDh3UWQ0T3I0UVNHZ0tDQWFG?=
 =?utf-8?B?V2YxbGVlL2xWRVVhakNiZHVheHc3d2ZoK1VWSis0ZlNXbU5oUW1XODAwU2xi?=
 =?utf-8?B?MG04U3JpOVNNUForYzdseFNJcG9SR3RLaGRodlovVEtrRGhRVkNUZSttenZK?=
 =?utf-8?B?aWdERHlrendyQkxEbzN1UXBHMHZNdVhZUXcycUYrdTAvVlNLVVJTbWRMRml4?=
 =?utf-8?B?eEFQYzNVdVhHQitqRjYvMmwyRHovMEN0d2JWUk5vNm0rZmNYZWZEMzNRdlE4?=
 =?utf-8?B?dzlnaUR0UTJDZ2FqaVBWTEpxbk5TNFoyWTJZdXhBQzVPZUlkNzhwQm9WZXVF?=
 =?utf-8?B?blN6Q1NnU1VEeHVuMzdwZkVLcEppR1U4TUEzYW1QNjUrbGhKVVQvL3VydG42?=
 =?utf-8?B?VGM0Ymp2NFJ2aGozUXlrWm1RT0xsU05aZGNkRkNIc3Vub0EyS0hnaFhtZTky?=
 =?utf-8?B?NkhsV3pNR1JwYjBaRzJhTmxVRmtmNDhwTnR1NjFZbnA5ZWJjRGFNam5EREJZ?=
 =?utf-8?B?N0dPMDJsays3RFhBWFdWYk9UNmRJTkNQdzlNcm9wMC9lTnJ4QWhQWlltdFJH?=
 =?utf-8?Q?Hv1fgQHkVCxOXFiCdRDGmSB+w6zpYDDGQt2xqTFV6Nc2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f50b5af5-cc47-4e25-25c1-08ddaf34b9e2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:25:14.9848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pBk5KpZFEXHuMCeBncGTtgqb4temf2yRPf8kKgQAabQxF9Mjtl5+sBCTkucXtXBwQkzcUrXwm3fhOVvE+/br/Q==
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

Reserve a page of system memory so sysmembar can perform a read on it if
a system write occurred since the last flush. Do this early as it can be
required to e.g. reset the GPU falcons.

Chipsets capabilities differ in that respect, so this commit also
introduces the FB HAL.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs           | 66 +++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/fb/hal.rs       | 31 ++++++++++++++++
 drivers/gpu/nova-core/fb/hal/ga100.rs | 45 ++++++++++++++++++++++++
 drivers/gpu/nova-core/fb/hal/tu102.rs | 42 ++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs          | 25 +++++++++++--
 drivers/gpu/nova-core/nova_core.rs    |  1 +
 drivers/gpu/nova-core/regs.rs         | 10 ++++++
 7 files changed, 218 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
new file mode 100644
index 0000000000000000000000000000000000000000..308cd76edfee5a2e8a4cd979c20da2ce51cb16a5
--- /dev/null
+++ b/drivers/gpu/nova-core/fb.rs
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::prelude::*;
+use kernel::types::ARef;
+use kernel::{dev_warn, device};
+
+use crate::dma::DmaObject;
+use crate::driver::Bar0;
+use crate::gpu::Chipset;
+
+mod hal;
+
+/// Type holding the sysmem flush memory page, a page of memory to be written into the
+/// `NV_PFB_NISO_FLUSH_SYSMEM_ADDR*` registers and used to maintain memory coherency.
+///
+/// Users are responsible for manually calling [`Self::unregister`] before dropping this object, or
+/// the page might remain in use even after it has been freed.
+pub(crate) struct SysmemFlush {
+    /// Chipset we are operating on.
+    chipset: Chipset,
+    device: ARef<device::Device>,
+    /// Keep the page alive as long as we need it.
+    page: DmaObject,
+}
+
+impl SysmemFlush {
+    /// Allocate a memory page and register it as the sysmem flush page.
+    pub(crate) fn register(
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        chipset: Chipset,
+    ) -> Result<Self> {
+        let page = DmaObject::new(dev, kernel::bindings::PAGE_SIZE)?;
+
+        hal::fb_hal(chipset).write_sysmem_flush_page(bar, page.dma_handle())?;
+
+        Ok(Self {
+            chipset,
+            device: dev.into(),
+            page,
+        })
+    }
+
+    /// Unregister the managed sysmem flush page.
+    ///
+    /// Users must make sure to call this method before dropping the object.
+    pub(crate) fn unregister(self, bar: &Bar0) {
+        let hal = hal::fb_hal(self.chipset);
+
+        if hal.read_sysmem_flush_page(bar) == self.page.dma_handle() {
+            let _ = hal.write_sysmem_flush_page(bar, 0).inspect_err(|e| {
+                dev_warn!(
+                    &self.device,
+                    "failed to unregister sysmem flush page: {:?}",
+                    e
+                )
+            });
+        } else {
+            // Another page has been registered after us for some reason - warn as this is a bug.
+            dev_warn!(
+                &self.device,
+                "attempt to unregister a sysmem flush page that is not active\n"
+            );
+        }
+    }
+}
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
new file mode 100644
index 0000000000000000000000000000000000000000..23eab57eec9f524e066d3324eb7f5f2bf78481d2
--- /dev/null
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::prelude::*;
+
+use crate::driver::Bar0;
+use crate::gpu::Chipset;
+
+mod ga100;
+mod tu102;
+
+pub(crate) trait FbHal {
+    /// Returns the address of the currently-registered sysmem flush page.
+    fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64;
+
+    /// Register `addr` as the address of the sysmem flush page.
+    ///
+    /// This might fail if the address is too large for the receiving register.
+    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result;
+}
+
+/// Returns the HAL corresponding to `chipset`.
+pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
+    use Chipset::*;
+
+    match chipset {
+        TU102 | TU104 | TU106 | TU117 | TU116 => tu102::TU102_HAL,
+        GA100 | GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
+            ga100::GA100_HAL
+        }
+    }
+}
diff --git a/drivers/gpu/nova-core/fb/hal/ga100.rs b/drivers/gpu/nova-core/fb/hal/ga100.rs
new file mode 100644
index 0000000000000000000000000000000000000000..7c10436c1c590d9b767c399b69370697fdf8d239
--- /dev/null
+++ b/drivers/gpu/nova-core/fb/hal/ga100.rs
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0
+
+struct Ga100;
+
+use kernel::prelude::*;
+
+use crate::driver::Bar0;
+use crate::fb::hal::FbHal;
+use crate::regs;
+
+use super::tu102::FLUSH_SYSMEM_ADDR_SHIFT;
+
+pub(super) fn read_sysmem_flush_page_ga100(bar: &Bar0) -> u64 {
+    (regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::read(bar).adr_39_08() as u64) << FLUSH_SYSMEM_ADDR_SHIFT
+        | (regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::read(bar).adr_63_40() as u64)
+            << FLUSH_SYSMEM_ADDR_SHIFT_HI
+}
+
+pub(super) fn write_sysmem_flush_page_ga100(bar: &Bar0, addr: u64) {
+    regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::default()
+        .set_adr_63_40((addr >> FLUSH_SYSMEM_ADDR_SHIFT_HI) as u32)
+        .write(bar);
+    regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::default()
+        .set_adr_39_08((addr >> FLUSH_SYSMEM_ADDR_SHIFT) as u32)
+        .write(bar);
+}
+
+/// Shift applied to the sysmem address before it is written into
+/// `NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI`,
+const FLUSH_SYSMEM_ADDR_SHIFT_HI: u32 = 40;
+
+impl FbHal for Ga100 {
+    fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
+        read_sysmem_flush_page_ga100(bar)
+    }
+
+    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
+        write_sysmem_flush_page_ga100(bar, addr);
+
+        Ok(())
+    }
+}
+
+const GA100: Ga100 = Ga100;
+pub(super) const GA100_HAL: &dyn FbHal = &GA100;
diff --git a/drivers/gpu/nova-core/fb/hal/tu102.rs b/drivers/gpu/nova-core/fb/hal/tu102.rs
new file mode 100644
index 0000000000000000000000000000000000000000..048859f9fd9d6cfb630da0a8c3513becf3ab62d6
--- /dev/null
+++ b/drivers/gpu/nova-core/fb/hal/tu102.rs
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use crate::driver::Bar0;
+use crate::fb::hal::FbHal;
+use crate::regs;
+use kernel::prelude::*;
+
+/// Shift applied to the sysmem address before it is written into `NV_PFB_NISO_FLUSH_SYSMEM_ADDR`,
+/// to be used by HALs.
+pub(super) const FLUSH_SYSMEM_ADDR_SHIFT: u32 = 8;
+
+pub(super) fn read_sysmem_flush_page_gm107(bar: &Bar0) -> u64 {
+    (regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::read(bar).adr_39_08() as u64) << FLUSH_SYSMEM_ADDR_SHIFT
+}
+
+pub(super) fn write_sysmem_flush_page_gm107(bar: &Bar0, addr: u64) -> Result {
+    // Check that the address doesn't overflow the receiving 32-bit register.
+    if addr >> (u32::BITS + FLUSH_SYSMEM_ADDR_SHIFT) == 0 {
+        regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::default()
+            .set_adr_39_08((addr >> FLUSH_SYSMEM_ADDR_SHIFT) as u32)
+            .write(bar);
+
+        Ok(())
+    } else {
+        Err(EINVAL)
+    }
+}
+
+struct Tu102;
+
+impl FbHal for Tu102 {
+    fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
+        read_sysmem_flush_page_gm107(bar)
+    }
+
+    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
+        write_sysmem_flush_page_gm107(bar, addr)
+    }
+}
+
+const TU102: Tu102 = Tu102;
+pub(super) const TU102_HAL: &dyn FbHal = &TU102;
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index e44ff6fa07147c6dd1515c2c6c0df927a2257c85..768579dfdfc7e9e61c613202030d2c7ee6054e2a 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -3,6 +3,7 @@
 use kernel::{device, devres::Devres, error::code::*, pci, prelude::*};
 
 use crate::driver::Bar0;
+use crate::fb::SysmemFlush;
 use crate::firmware::{Firmware, FIRMWARE_VERSION};
 use crate::gfw;
 use crate::regs;
@@ -158,12 +159,28 @@ fn new(bar: &Bar0) -> Result<Spec> {
 }
 
 /// Structure holding the resources required to operate the GPU.
-#[pin_data]
+#[pin_data(PinnedDrop)]
 pub(crate) struct Gpu {
     spec: Spec,
     /// MMIO mapping of PCI BAR 0
     bar: Devres<Bar0>,
     fw: Firmware,
+    /// System memory page required for flushing all pending GPU-side memory writes done through
+    /// PCIE into system memory.
+    ///
+    /// We use an `Option` so we can take the object during `drop`. It is not accessed otherwise.
+    sysmem_flush: Option<SysmemFlush>,
+}
+
+#[pinned_drop]
+impl PinnedDrop for Gpu {
+    fn drop(mut self: Pin<&mut Self>) {
+        // Unregister the sysmem flush page before we release it.
+        let _ = self
+            .sysmem_flush
+            .take()
+            .map(|sysmem_flush| self.bar.try_access_with(|b| sysmem_flush.unregister(b)));
+    }
 }
 
 impl Gpu {
@@ -187,10 +204,14 @@ pub(crate) fn new(
         gfw::wait_gfw_boot_completion(bar)
             .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete"))?;
 
+        // System memory page required for sysmembar to properly flush into system memory.
+        let sysmem_flush = SysmemFlush::register(pdev.as_ref(), bar, spec.chipset)?;
+
         Ok(pin_init!(Self {
             spec,
             bar: devres_bar,
-            fw
+            fw,
+            sysmem_flush: Some(sysmem_flush),
         }))
     }
 }
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 121fe5c11044a192212d0a64353b7acad58c796a..8ac04b8586e7314528e081464ed73ee615001e9b 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -4,6 +4,7 @@
 
 mod dma;
 mod driver;
+mod fb;
 mod firmware;
 mod gfw;
 mod gpu;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index cba442da51181971f209b338249307c11ac481e3..b599e7ddad57ed8defe0324056571ba46b926cf6 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -38,6 +38,16 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
     }
 }
 
+/* PFB */
+
+register!(NV_PFB_NISO_FLUSH_SYSMEM_ADDR @ 0x00100c10 {
+    31:0    adr_39_08 as u32;
+});
+
+register!(NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI @ 0x00100c40 {
+    23:0    adr_63_40 as u32;
+});
+
 /* PGC6 */
 
 register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128 {

-- 
2.49.0

