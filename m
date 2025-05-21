Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF43AABEC3C
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 08:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2392710E681;
	Wed, 21 May 2025 06:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cbJkCRpm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D67010E679;
 Wed, 21 May 2025 06:46:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DF9Y6t0d85S4Lfn3QK5hM6X/x1GyIBT2m2Gh/9ljS959tW2WgSNbwSgnRhETxszpdMTG+j4a3kTRaB5DQyd9x50RNsMA8iwPH2x6FbIrDJYq/96WQc3E029/+4wvLD51zYK5a+YzPlhrmDKpCK7Arw+9WfLJ8cu6p0ohkxforl9eJv3LA1VZSPxJmd93/K3qkbFbsAAC41wfG0joaA49ZPjTIaftThfYUeHRk+pXT2hiUwDtVWc4Pgt4QS+OvcNCohhbruNqZKdDAQmeP3w7t8CJ+60bv+qKDdsHYAHy28MqZOucvfZyO3er1hGChhUU5Ts1kzNcDLoEQLcdaX9xFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Awwytkc5PHXiamh9vp62M0mCEBuP6A0dNrQh5SoJzTo=;
 b=kqXU0eGe07JqkXcnYJrN6RwtWrsmIs9Juj0LdvoczkwPU6P/6qNNxLUZZcNRpcuHbn0GoS1z047YesjbectQ0vojrXktTJiXmfiPVJNPtR76at5vtrh61TtcBK8Axa70tr31kvYxcOhwuyXpd8nkZvRUWlKox8jHI/iCs4P3/A+vfnTXSi82UDrdF9ZvZgiUmJR0guSY7GJn5fsRWoxcAlGWbrDuk1GJyaJHEUrOqkuyJUzcb3rqJUbmyI7oI0f1Fc4MUJ4fFGCtx0d+A0vDnUTusG5ofWNZjioYi7J4TEuQOJ8dJ6uMhN6YTH1tkS7QALhsgHAO9ZOdtkHyGZVpdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Awwytkc5PHXiamh9vp62M0mCEBuP6A0dNrQh5SoJzTo=;
 b=cbJkCRpmkXWhOUMRC3jHPJpkwNqkF8JvSMYNWQoGLaJolxZd961lM0XK7WbdZpLVIqQIlQblkB7YJVjd9k5sbk8xndJ7aE3zeV6RbWgXteI/VaWbnp3/HGVT0mJb1ipFt805ir1NBtnllzDb6uojzI19hYQNy4MPMosyZoZFGw7VDK4ToKZw8sXDeo2txdTtc70xfQFgG8X4Hmvtr3UDHnwjKRSjSac4+GwNH9yJ7t/MUrk/+9dJvEVrQx/WyLF8VmkyGKGAAmFacjl6V+EybrDBnf9b0uFlAFTuirhqC4R7lPUOgnxyrR95C4y1YBtvBQSpLWz5sfSE8Wp7XQ5QLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6618.namprd12.prod.outlook.com (2603:10b6:208:38d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Wed, 21 May
 2025 06:46:06 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 06:46:05 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 21 May 2025 15:45:12 +0900
Subject: [PATCH v4 17/20] gpu: nova-core: compute layout of the FRTS region
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-nova-frts-v4-17-05dfd4f39479@nvidia.com>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
In-Reply-To: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TY4P286CA0027.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f33dbdf-9be1-464a-5cf0-08dd9833291b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UC8vUUoveGVHaXYxdmc4cVg0QmZwYU1xa01wNTdrdHducFRWV0ZzYlBxdmN0?=
 =?utf-8?B?a3pUU093RFZkTWtoZHp3NXpOMUZ2azZaSGNYTEpaR0tiSXl5UlgwajhseGc5?=
 =?utf-8?B?QVBKU2t0Qk9hd0dpMmpDVFErTGdjcUhySnhvTUxMcVN3UThubS9FYUVJck5s?=
 =?utf-8?B?ZE9QOXc4bTloQUl1dnRrRll0ZkNIN3ZCUGdSbUs3aCtyZHJEbjNRY3grdkVS?=
 =?utf-8?B?RSsxQXBWMFl6cGFjZTlXMjlTdE9aZEdEbmFVbDQxRDM3a0ZtVis0dFV3TjNB?=
 =?utf-8?B?RVlZTUk3OVhDRlR3V1NFSEF1dk1aalhGMzNvQ1dHcmdWcDJGNStMUDNMTVkv?=
 =?utf-8?B?VDBhYk8yejJwZHN5aDF5TmwxYWtwS3ViN2VaR0VqVFBtd2NkQm5ybDRScU85?=
 =?utf-8?B?UlQ3emlsOTFwcnBwZEZkZE5HNllPQ0VGeVhnQW5nbW0yRVQrVmFFWXowby9Q?=
 =?utf-8?B?SzFEclZVQW1WUm4vMEdNTlBtZ0VjdVJOREtvMTBHU0N3TE5HM0Z1K3FJeEFx?=
 =?utf-8?B?TFBLZzBWcDc4L2pQclNna2lPMllhZzhxb3ZHZWdZR0NIalJvaWtXTWdpUHA5?=
 =?utf-8?B?RzU2WFVCbEs3TGtkbEl0ZDdYdEExV0MvdVl2MkNlNmk3ZVllTlJJK1JZWlNI?=
 =?utf-8?B?dVBXK09FWU1LZkxGdVhjL0lZZVlWbDBYdTQ4MUQ0NS9kTm10RGhTWm03ZTF2?=
 =?utf-8?B?K3ZBUS9hU0I3T0MzcnRKQU8wOWdCaGU1MHltdVIrckFHdmJZYUZmd3Jxejd5?=
 =?utf-8?B?dk1MZk9wNjM4YWJLME5pUGMxQWFZa2w1MVRub0NuelVMc0xBV0hvcGtiWWYy?=
 =?utf-8?B?Y1BOcXhIYkY3bTRvTmplU3NtUXFOa0cxd0pQam5BNkdQd05rcGRwcTdaZklN?=
 =?utf-8?B?NWpDYnl0WDFTZnhMeGplM0tDVnppQUY1VkdadE1DZVBaalQ2ajFURXF1RUV3?=
 =?utf-8?B?VEpBc25ycE5kVVpobVROWVQ0Z2x6QjY3VmRaQThvd2RqYXpHeFN3ZjlZQU9p?=
 =?utf-8?B?VkNVVHBKdDk5M2Nrd3ZHYmVseUtDbkJwWXd5ZUlUUFhDUXZhM1BTL096LzdS?=
 =?utf-8?B?OVRXbUNmU1kxQ2E0eHZFU1BEd1VmcHRwRllwUFZCaXRRcG1kTjRaUG05Smll?=
 =?utf-8?B?akNNUlR4YlZxbUFQY3dvM1lrUFd4QWdubk52eWxvdVZBZzU3Slp4cXIydkpB?=
 =?utf-8?B?SzQwQXFZNS9xVWEvY0s3VFJJT2h5Q2l6dk15SE5rVmJtTXI4MFFiZlRNZEQy?=
 =?utf-8?B?K2hzK3JZMUVSQ3ArNXJTNFNSWTkxcy90TEtMRk1jMDRSem9DbzBQRWNnNktn?=
 =?utf-8?B?NW5ub202N0hvNUpwdGg1MWJPT09yWlBCNWR3U013TnVmcXZlVEt2RDZua0d1?=
 =?utf-8?B?ZWhVUitTUzlyVWRwY1hTTVJNK29DRnh1L0pGR3FjU0FYR3JiQ3lrVGtLYjdu?=
 =?utf-8?B?bTA5QjJjbS9zYkp5KzU5eU1ZbU9UU3pQVGs3VFlISzlNTEtoeHRkU2VhQWNV?=
 =?utf-8?B?ZjJSSDMvYlE1UjN3RlVuQmtxNHhQWkZaQlQwbEt1cWJRUUNFS3QrV1l3aVcr?=
 =?utf-8?B?YUNySnJDMkZhR3JOWkZHNy9DRE1ha0RiNTZoaFc3U3MwRGFUWXlNREx5QnlL?=
 =?utf-8?B?b0k4WVNsSis1SGhpUmk0ckE1V3ZSVFhPa0dhNFMzUFZNVWMxVXNIazNIUE1K?=
 =?utf-8?B?cjVhOUI4bG9vK2dqYkdSVFplSFpCc2xvUWtPRHJkUmxOMDBXWk5yY1ExejRP?=
 =?utf-8?B?N3lkN3pLZDUvZmxOSUNlVXp5cDFXck8vWkRsbHdCU05zd2NrVkFtOVVvK3hl?=
 =?utf-8?B?d3RqK1Q5MVVSSXlHQytRWEdVUkJYS3F5M1lZK3FsdStZQjdnLzZucGVCUStt?=
 =?utf-8?B?NVJFK0t0NFB4Q244bmdrRHhOK25xcS8wS3VsRWt1c05iRzA2WUtlaThlTDNh?=
 =?utf-8?B?aTAvcmNXV3l0U2FBeEtSSktGUkNrYnd2SEthbVdDNGdHOEd0QTFWMDNpeXNZ?=
 =?utf-8?B?bEl4OTFwUXFRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cE9qUnQvYnpKWG5XRnpleVp4ZDdadG5ISEFNRnVRY0tJaWY4Z3p5cllIdXFk?=
 =?utf-8?B?K3ZKRHVScFBTc1hyKzhtRFdwVm1qTHJSanFhM0JrakVUTWwwZG9ndUZDQTlW?=
 =?utf-8?B?L0Q1QkdUa0ZULzM4UUd1by8xWVo2YmR3T2RJYnFZbnRKSkphWUxFRXRUbGtI?=
 =?utf-8?B?dEIyVXB6bWRNT2tsSDZocTFFYWthMXpRL0U5TnFQNTVwL0RxeWlEUy9ncEJQ?=
 =?utf-8?B?L2F0dTJtWHd5THRlS0JESS9Da0hzRnRmKzhOVDdzcVZpYlhDM2cwMytGOEpB?=
 =?utf-8?B?QUl4dUxTTUV3QkFmMFp5WkZMWHpBczlEVTc3aVlLV2l5cXNjS1Nzck84clFn?=
 =?utf-8?B?bSt5dmsyNWNTWEJaUlUwQktweHJscGJWNndPT0NWbVVRVjkrVVhjRW9DNkRm?=
 =?utf-8?B?ZDY4QXUvZzhDMUgxSXZRbWpMVUo0U1IvTEFzMUp1dnpKQWtQdnRFTjdrV3E1?=
 =?utf-8?B?T1NRTldoR0RNdG9qWklEMzBhdEdiTkNjaGQwU2xSOXBtSEs2d1Z0Y1BLRGd1?=
 =?utf-8?B?UHFMNUlHWVdLblJ6R0QwZWlOUmVXNVc3UUg1anZSWVREV0VUR3NwYlRtUmZY?=
 =?utf-8?B?VHJOTVROakpPWXFVZ2xWT0phU1Qvbzd3Wmg5L3VHMXJ5V1JQanZDUUQ2RHNC?=
 =?utf-8?B?dTJ1ZGZwTWwxWmFLY25hV1Bxcy9LVEgxczFpMU4xTGJwUXZwWFNiUHFva1pk?=
 =?utf-8?B?R0Q5azN4R1hicTd4MTEyYjRPMDBhQW5KMVJoMWZaaGVFKzI3S2hiN3Q4T3lq?=
 =?utf-8?B?Skp1OStQYUFvWk05d3R4L3ZHUzd6U1puemwrVDBUL21ZSFpDdnRZSFpRc3E1?=
 =?utf-8?B?YkFLQmpFeGJVWG5NbWJYa0RCWGZscFVQdTk5VDZOdElvUlpHdzdCVmgyM3pq?=
 =?utf-8?B?RFg4L0psYjYxU05KRTFBVnFTSTdLdFBjSnRLeHE1MzRMOXZvUUNnNVAvd0Vk?=
 =?utf-8?B?NTIyUnhmWk9NenZjZDRONDVkYkhhVzc0U1RxMUpEWlRTR2RObmpBYjJMQVBL?=
 =?utf-8?B?bkh4Qmp5RXlJUWhUT2dJU21xMXg0SGp4RTRnMS9nMEJPeWk0Nmk5S2d1SmQw?=
 =?utf-8?B?SGJzYW1jNEZ0bDhuREZRZnRZR1BOTk96Mk1LQjQ1RHA5RFhadnZGZjFXNm0x?=
 =?utf-8?B?MU90MDJFcjhCY09SMFBraFQyL0NXRjFmM3hLUmpHRTcrMzQ0bDZFanp0QUxy?=
 =?utf-8?B?R0dOM0tDaVA1RXNHc2hNQ2VMVCtSTFFHTFlnWHluMnZ0V2lFSHNBTEluVW93?=
 =?utf-8?B?Q0NzT3Nsa05SZGwvaHZiNjl3SWE1d0ZIQlZoQkxPa2tQWFFyVFcxc0tWRkZR?=
 =?utf-8?B?ZW9YajU3bmh3QlNKMGRTd1Y3VGdxbkViVTJTSkVSSlRjS2Q4Sm92T1ZNb0tn?=
 =?utf-8?B?MWpmM2JaQnRpTDFSZHp6a3VPd21lTDF4VUl1dURwaU1heHAvM0doWDFPU0NR?=
 =?utf-8?B?NDFEZVRMakpBOFVrOGtQUFkzUC9OMFFEemlvK29GOTdnZ1RqTnV6c3Q2QUwv?=
 =?utf-8?B?eXlGQ1VHdDlaalNaRjJqMTNENWl2NjRTT0tlWmphVDRCT1UybTJLc3NVa2Ez?=
 =?utf-8?B?aWlDWEhlS0Ywa2VZYmVrMnJIN2twdlJETjhQYmZQRUhRdXBhQ1VoMWFTTEF3?=
 =?utf-8?B?NEhlcGRsS3pxVktUU05ic3ViUUR5K2hBRndjWjdMYW82eWd2UzRPemFod3dB?=
 =?utf-8?B?dTNGRi9ZUWtFSXh5alI3NFpQOGxYSURYckZ1bjdYMWdiMUcyZERWWjgwbWtq?=
 =?utf-8?B?VUhDMUYzRVc5OVEvcTdPZklnaXAzT0taTjl5Z2VTT2lpaVlVTDErOTlJOXAx?=
 =?utf-8?B?ZlhVL3cvYlNHVlduMkZUZ2F1SW1SYWNDeHdZakRhRFJDSzVjU0VYOExQWDRM?=
 =?utf-8?B?QkFzOUZvY3BiRmorVmpHbG9ocU1YZlgyOExQbjhtRTJBNzM3TTNWV21sQXNH?=
 =?utf-8?B?N1dUU1huMlUyZGFiUmNta3BtaDgrZDJNUkZ6dDhJdHh6NkY0aUVRZ3JpdHpS?=
 =?utf-8?B?Z0pBZlJDdER6ajdUT3Y1bXhXTnVCb1BPS0lHSUNRcStJVHVMVmdRMmRlUlg2?=
 =?utf-8?B?ZkMvRFAvN05lOEpMOHVlVlBpQWNUTDJtaUhNOUtFNzZjamFXQ1drMTRZajhn?=
 =?utf-8?B?d2VVVllQM0VYLzRVN2c3eVBqWUZpMG9hNFc5ZEYrTVo5ZHV4WmN1SHV0Qjhu?=
 =?utf-8?Q?EhGXSZajoMpjMKJEnDA25bOAAZMCdxZvCLvvyQ5R5y4N?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f33dbdf-9be1-464a-5cf0-08dd9833291b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 06:46:05.8307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dfuoq6L7kcbK/89PIHAzWqOMFL6MDdT40Ky5ykBRY99i0bpTetjKXQN/uQzECuT3ntMCroHLj6AFwZvdP5/l9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6618
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

FWSEC-FRTS is run with the desired address of the FRTS region as
parameter, which we need to compute depending on some hardware
parameters.

Do this in a `FbLayout` structure, that will be later extended to
describe more memory regions used to boot the GSP.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs              |  4 ++
 drivers/gpu/nova-core/gsp.rs              |  3 ++
 drivers/gpu/nova-core/gsp/fb.rs           | 77 +++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/fb/hal.rs       | 30 ++++++++++++
 drivers/gpu/nova-core/gsp/fb/hal/ga100.rs | 24 ++++++++++
 drivers/gpu/nova-core/gsp/fb/hal/ga102.rs | 24 ++++++++++
 drivers/gpu/nova-core/gsp/fb/hal/tu102.rs | 28 +++++++++++
 drivers/gpu/nova-core/nova_core.rs        |  1 +
 drivers/gpu/nova-core/regs.rs             | 76 ++++++++++++++++++++++++++++++
 9 files changed, 267 insertions(+)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 39b1cd3eaf8dcf95900eb93d43cfb4f085c897f0..7e03a5696011d12814995928b2984cceae6b6756 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -7,6 +7,7 @@
 use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
 use crate::firmware::{Firmware, FIRMWARE_VERSION};
 use crate::gfw;
+use crate::gsp::fb::FbLayout;
 use crate::regs;
 use crate::util;
 use crate::vbios::Vbios;
@@ -239,6 +240,9 @@ pub(crate) fn new(
 
         let _sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, bar, true)?;
 
+        let fb_layout = FbLayout::new(spec.chipset, bar)?;
+        dev_dbg!(pdev.as_ref(), "{:#x?}\n", fb_layout);
+
         // Will be used in a later patch when fwsec firmware is needed.
         let _bios = Vbios::new(pdev, bar)?;
 
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
new file mode 100644
index 0000000000000000000000000000000000000000..27616a9d2b7069b18661fc97811fa1cac285b8f8
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -0,0 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0
+
+pub(crate) mod fb;
diff --git a/drivers/gpu/nova-core/gsp/fb.rs b/drivers/gpu/nova-core/gsp/fb.rs
new file mode 100644
index 0000000000000000000000000000000000000000..e65f2619b4c03c4fa51bb24f3d60e8e7008e6ca5
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/fb.rs
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use core::ops::Range;
+
+use kernel::num::NumExt;
+use kernel::prelude::*;
+
+use crate::driver::Bar0;
+use crate::gpu::Chipset;
+use crate::regs;
+
+mod hal;
+
+/// Layout of the GPU framebuffer memory.
+///
+/// Contains ranges of GPU memory reserved for a given purpose during the GSP bootup process.
+#[derive(Debug)]
+#[expect(dead_code)]
+pub(crate) struct FbLayout {
+    pub fb: Range<u64>,
+    pub vga_workspace: Range<u64>,
+    pub frts: Range<u64>,
+}
+
+impl FbLayout {
+    /// Computes the FB layout.
+    pub(crate) fn new(chipset: Chipset, bar: &Bar0) -> Result<Self> {
+        let hal = chipset.get_fb_fal();
+
+        let fb = {
+            let fb_size = hal.vidmem_size(bar);
+
+            0..fb_size
+        };
+
+        let vga_workspace = {
+            let vga_base = {
+                const NV_PRAMIN_SIZE: u64 = 0x100000;
+                let base = fb.end - NV_PRAMIN_SIZE;
+
+                if hal.supports_display(bar) {
+                    match regs::NV_PDISP_VGA_WORKSPACE_BASE::read(bar).vga_workspace_addr() {
+                        Some(addr) => {
+                            if addr < base {
+                                const VBIOS_WORKSPACE_SIZE: u64 = 0x20000;
+
+                                // Point workspace address to end of framebuffer.
+                                fb.end - VBIOS_WORKSPACE_SIZE
+                            } else {
+                                addr
+                            }
+                        }
+                        None => base,
+                    }
+                } else {
+                    base
+                }
+            };
+
+            vga_base..fb.end
+        };
+
+        let frts = {
+            const FRTS_DOWN_ALIGN: u64 = 0x20000;
+            const FRTS_SIZE: u64 = 0x100000;
+            let frts_base = vga_workspace.start.align_down(FRTS_DOWN_ALIGN) - FRTS_SIZE;
+
+            frts_base..frts_base + FRTS_SIZE
+        };
+
+        Ok(Self {
+            fb,
+            vga_workspace,
+            frts,
+        })
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp/fb/hal.rs b/drivers/gpu/nova-core/gsp/fb/hal.rs
new file mode 100644
index 0000000000000000000000000000000000000000..9f8e777e90527026a39061166c6af6257a066aca
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/fb/hal.rs
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use crate::driver::Bar0;
+use crate::gpu::Chipset;
+
+mod ga100;
+mod ga102;
+mod tu102;
+
+pub(crate) trait FbHal {
+    /// Returns `true` is display is supported.
+    fn supports_display(&self, bar: &Bar0) -> bool;
+    /// Returns the VRAM size, in bytes.
+    fn vidmem_size(&self, bar: &Bar0) -> u64;
+}
+
+impl Chipset {
+    /// Returns the HAL corresponding to this chipset.
+    pub(super) fn get_fb_fal(self) -> &'static dyn FbHal {
+        use Chipset::*;
+
+        match self {
+            TU102 | TU104 | TU106 | TU117 | TU116 => tu102::TU102_HAL,
+            GA100 => ga100::GA100_HAL,
+            GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
+                ga102::GA102_HAL
+            }
+        }
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp/fb/hal/ga100.rs b/drivers/gpu/nova-core/gsp/fb/hal/ga100.rs
new file mode 100644
index 0000000000000000000000000000000000000000..29babb190bcea7181e093f6e75cafd3b1410ed26
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/fb/hal/ga100.rs
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use crate::driver::Bar0;
+use crate::gsp::fb::hal::FbHal;
+use crate::regs;
+
+pub(super) fn display_enabled_ga100(bar: &Bar0) -> bool {
+    !regs::ga100::NV_FUSE_STATUS_OPT_DISPLAY::read(bar).display_disabled()
+}
+
+struct Ga100;
+
+impl FbHal for Ga100 {
+    fn supports_display(&self, bar: &Bar0) -> bool {
+        display_enabled_ga100(bar)
+    }
+
+    fn vidmem_size(&self, bar: &Bar0) -> u64 {
+        super::tu102::vidmem_size_gp102(bar)
+    }
+}
+
+const GA100: Ga100 = Ga100;
+pub(super) const GA100_HAL: &dyn FbHal = &GA100;
diff --git a/drivers/gpu/nova-core/gsp/fb/hal/ga102.rs b/drivers/gpu/nova-core/gsp/fb/hal/ga102.rs
new file mode 100644
index 0000000000000000000000000000000000000000..6a7a06a079a9be5745b54de324ec9be71cf1a055
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/fb/hal/ga102.rs
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use crate::driver::Bar0;
+use crate::gsp::fb::hal::FbHal;
+use crate::regs;
+
+fn vidmem_size_ga102(bar: &Bar0) -> u64 {
+    regs::NV_USABLE_FB_SIZE_IN_MB::read(bar).usable_fb_size()
+}
+
+struct Ga102;
+
+impl FbHal for Ga102 {
+    fn supports_display(&self, bar: &Bar0) -> bool {
+        super::ga100::display_enabled_ga100(bar)
+    }
+
+    fn vidmem_size(&self, bar: &Bar0) -> u64 {
+        vidmem_size_ga102(bar)
+    }
+}
+
+const GA102: Ga102 = Ga102;
+pub(super) const GA102_HAL: &dyn FbHal = &GA102;
diff --git a/drivers/gpu/nova-core/gsp/fb/hal/tu102.rs b/drivers/gpu/nova-core/gsp/fb/hal/tu102.rs
new file mode 100644
index 0000000000000000000000000000000000000000..7ea4ad45caa080652e682546c43cfe2b5f28c0b2
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/fb/hal/tu102.rs
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use crate::driver::Bar0;
+use crate::gsp::fb::hal::FbHal;
+use crate::regs;
+
+pub(super) fn display_enabled_gm107(bar: &Bar0) -> bool {
+    !regs::gm107::NV_FUSE_STATUS_OPT_DISPLAY::read(bar).display_disabled()
+}
+
+pub(super) fn vidmem_size_gp102(bar: &Bar0) -> u64 {
+    regs::NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE::read(bar).usable_fb_size()
+}
+
+struct Tu102;
+
+impl FbHal for Tu102 {
+    fn supports_display(&self, bar: &Bar0) -> bool {
+        display_enabled_gm107(bar)
+    }
+
+    fn vidmem_size(&self, bar: &Bar0) -> u64 {
+        vidmem_size_gp102(bar)
+    }
+}
+
+const TU102: Tu102 = Tu102;
+pub(super) const TU102_HAL: &dyn FbHal = &TU102;
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 86328473e8e88f7b3a539afdee7e3f34c334abab..d183201c577c28a6a1ea54391409cbb6411a32fc 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -8,6 +8,7 @@
 mod firmware;
 mod gfw;
 mod gpu;
+mod gsp;
 mod regs;
 mod util;
 mod vbios;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index b9fbc847c943b54557259ebc0d1cf3cb1bbc7a1b..54d4d37d6bf2c31947b965258d2733009c293a18 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -52,6 +52,27 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
     23:0    adr_63_40 as u32;
 });
 
+register!(NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE @ 0x00100ce0 {
+    3:0     lower_scale as u8;
+    9:4     lower_mag as u8;
+    30:30   ecc_mode_enabled as bool;
+});
+
+impl NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE {
+    /// Returns the usable framebuffer size, in bytes.
+    pub(crate) fn usable_fb_size(self) -> u64 {
+        let size = ((self.lower_mag() as u64) << (self.lower_scale() as u64))
+            * kernel::sizes::SZ_1M as u64;
+
+        if self.ecc_mode_enabled() {
+            // Remove the amount of memory reserved for ECC (one per 16 units).
+            size / 16 * 15
+        } else {
+            size
+        }
+    }
+}
+
 /* PGC6 */
 
 register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128 {
@@ -77,6 +98,42 @@ pub(crate) fn completed(self) -> bool {
     }
 }
 
+register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_42 @ 0x001183a4 {
+    31:0    value as u32;
+});
+
+register!(
+    NV_USABLE_FB_SIZE_IN_MB => NV_PGC6_AON_SECURE_SCRATCH_GROUP_42,
+    "Scratch group 42 register used as framebuffer size" {
+        31:0    value as u32, "Usable framebuffer size, in megabytes";
+    }
+);
+
+impl NV_USABLE_FB_SIZE_IN_MB {
+    /// Returns the usable framebuffer size, in bytes.
+    pub(crate) fn usable_fb_size(self) -> u64 {
+        u64::from(self.value()) * kernel::sizes::SZ_1M as u64
+    }
+}
+
+/* PDISP */
+
+register!(NV_PDISP_VGA_WORKSPACE_BASE @ 0x00625f04 {
+    3:3     status_valid as bool, "Set if the `addr` field is valid";
+    31:8    addr as u32, "VGA workspace base address divided by 0x10000";
+});
+
+impl NV_PDISP_VGA_WORKSPACE_BASE {
+    /// Returns the base address of the VGA workspace, or `None` if none exists.
+    pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
+        if self.status_valid() {
+            Some((self.addr() as u64) << 16)
+        } else {
+            None
+        }
+    }
+}
+
 /* FUSE */
 
 register!(NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION @ 0x00824100 {
@@ -211,3 +268,22 @@ pub(crate) fn completed(self) -> bool {
     4:4     core_select as bool => PeregrineCoreSelect;
     8:8     br_fetch as bool;
 });
+
+// The modules below provide registers that are not identical on all supported chips. They should
+// only be used in HAL modules.
+
+pub(crate) mod gm107 {
+    /* FUSE */
+
+    register!(NV_FUSE_STATUS_OPT_DISPLAY @ 0x00021c04 {
+        0:0     display_disabled as bool;
+    });
+}
+
+pub(crate) mod ga100 {
+    /* FUSE */
+
+    register!(NV_FUSE_STATUS_OPT_DISPLAY @ 0x00820c04 {
+        0:0     display_disabled as bool;
+    });
+}

-- 
2.49.0

