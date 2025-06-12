Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08525AD72EC
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 16:02:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F5310E846;
	Thu, 12 Jun 2025 14:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AeFG49L0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 075B310E4B2;
 Thu, 12 Jun 2025 14:02:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gVXvvZTqtVbqBfIJIVbzZsG71+kUwpGhldV5XfR0waQy9B5ohpyrElU6oXn4uATFx0R2tQuqHCXIIkpBL735XBXmsqh+NfgExx/xnPO815tvgIQaX1Fhl5LjhpSWH10NfjtMeUuwnvfZquHqeNqEHhzqyf9yKpHuIhfREU80bbpIglSMou1ZBtTDZqaV7k1L17v163a9583Og36oPbxlCSCUUf+PLA76Nyrl0Nql4QB3/cyLuv2FkVJm0J97haddYrQlHJGT/aaJgwP5ALgSp7nbbtIN03x3BuzUkM31VYYaSO7BCUkrGrjnsxbDhB0FTZKnVe7JCzDTgkgrz6Yz1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3vgx6glAomZ16EYqyX96pRNhdEF+5Ze25Qw0mz8mFI=;
 b=fDEH+vEiurJYBHpyzXxQ4oYDUBcKK7KLGrkSHjjCIZxXurbZQN4z9yI/5Ijk2IIhLOHPqrY5YKuvTPtZKhReYkQVl6LaXvrxc++xDH2l/3KvLaXuo3H2xBOMzvU6BBLqQxcIS5xKpLtGQ3LP7MXB4nwEGVisIgub/JIX/IB8PqBTT0UuHHxqZ12jpaQy6DxXe3MbOWDArZ7c07S6xtAXgoHk/zCtHlfrmIhmKIqGWxX38fxkHvOFzWHXCv+SFETL1D1xcM7utjg9GniyVywQj0LQZHjEWAniuBi4GskCQL7wn07J11Md55KRyipUcYQF6SUFLB3MATjLrLmX4f8oMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3vgx6glAomZ16EYqyX96pRNhdEF+5Ze25Qw0mz8mFI=;
 b=AeFG49L0j7CSVt/YSTVI6otg9jYfRDMaSUxx9xb/+nEuVJIYG9rLGvOIQ+/qMwLhrcKq7iKvt7RecdVqfzqud3RkV/3qiWu9rFRwaDKo9oUKxnQGAmBXZPrJ3quldo0keg8PwyNdwyUNQEQYjRiW2edD4hvck+u6CNz4Hmj7cX6CaZ0q4YyTcSK0PYleVOxhRdYGkCEzhHmMtWkHu9iq3kglSYRBGwhX7eb4Aw1bdtNHzZy9+bBZfAQIw9Ur3Lj7N8YVV7rRCyUO0xVyuJb2COfQATuPkimX03QZE/T8xBCCI9esaCvZE9PCDdxjOvPpoUX/F59kpHnjq5QjSjPeZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8458.namprd12.prod.outlook.com (2603:10b6:610:155::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 14:02:42 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 14:02:41 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 12 Jun 2025 23:01:32 +0900
Subject: [PATCH v5 04/23] rust: add new `num` module with `PowerOfTwo` type
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-nova-frts-v5-4-14ba7eaf166b@nvidia.com>
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
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0077.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: f22532db-3b7d-4a6f-5813-08dda9b9cc2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?anRjck1VZzIrWVgzU1l3K0RBNUhIRkhJV1I3cnVuVUlLSUt0bWN3NHRNNmhE?=
 =?utf-8?B?TmxFMTdtRWx3bjlSTldsbktkVDFRd1JwSzUwL05ZMDJOOFZnTzQrd1ZWOG1R?=
 =?utf-8?B?RlNpSy9tcm9PRnc5Y3RYeER2aW8vSXdvTGMvUlBHSzBBTlFWM2ZrRjVqZkty?=
 =?utf-8?B?NFlzYm1wSFVxa21ES2hSVTU1am1xbGZ0ejhQNFJXbVBGLytOOTN2dHpmNHBp?=
 =?utf-8?B?cUtYU0c4S3VTZldxeXRpVkJCRUNIdWU2b1dRanZzN0JUYUwyZTNzVUl5aWtH?=
 =?utf-8?B?R3JQdnlsTG50elNPNm1ZeDkrN1E0Uk5zdDRWSlZKd1BZWlJGZDhGYUEvY0xU?=
 =?utf-8?B?YXRsQVJFVnpYaUU2VTRkUmZrS1oydm5CNE5YaHVQWXNiZEVMOHBXdzI5dVk3?=
 =?utf-8?B?bDYwYkZsRy8zM0EwU2RSZTFYUXNPNnFQOTZrL1d2SDZZWTNFa0sydTF6MWhx?=
 =?utf-8?B?U0tMZmxvM3ZoVnl5WXI1RHRodlF6REs0dS9lSURneElSUThJVjFOMVJ3ekha?=
 =?utf-8?B?OFFmU2Y0Sk9Vc3NLWkVxYlkzZ3psSUZ3eldzS2NxRThHMENRbXJrQ2dHUjFr?=
 =?utf-8?B?R0NnS1lEVHQ1Y096V290cDNqWlVIUEZYNklvOWIxVFJxaFd0S3pHTDAvSURI?=
 =?utf-8?B?cGQ5c09oY011Yjk0aWt1dHJpdFVQZU55eDMySldBZG1weVlXT2hwd2hKT0dz?=
 =?utf-8?B?NGFOdUpGK3ZMMzBUdmhFREpaTDBib0ZQMUJEU1pZNlBkcjg5WU50blZ6S1ky?=
 =?utf-8?B?WE8wekdwQlAzVUk4SFQ2WXY5WVMrc2R0bWd3WDFMWWpFdVZ3KzJJbVF5c3oz?=
 =?utf-8?B?QjFOQlNNbTJpSUtialgxYXdXYkN5RWozbFBYNUpzUXdiKzVldCtEcnFlSE9K?=
 =?utf-8?B?bGlFa0pwa2pKRE1OelZFanRobFJ3SmNYOU1jSGVCdytRMlUyZm1GeVdrT2xI?=
 =?utf-8?B?VjlnUERTYjBSeHVpMmVhYS8xUGd2UVR5c2xzS0R4T2dtMTVxbWtnY2tUU3Vu?=
 =?utf-8?B?K2h2bGt3Q3RCUEl3ZEFIZTZtVE93dEtMTHNCa2JkT2tLWmtOUTBEaTN1Tksr?=
 =?utf-8?B?UHl6VFdEemFvL0VONEFjWmxmb2JuNUc5THVmVzMydzFObGxlN1k5LzNUSEdJ?=
 =?utf-8?B?Y29ZYktVQ3YzeVN6ZzFBWXJMK2tDZEN2S3p1ZTNsVzl4dkJncVFrZzB4Sjcw?=
 =?utf-8?B?OTNZRlk0WHVqNitxZW15aWpSL2ZzODhGV0lNSUY1UHVZTm84dEtndGpuSU1x?=
 =?utf-8?B?YzRDSFk5bER0VWgyMGlNQ1pBMFZRbElvRHVMRHhTQ1NjbmloV0xLWkRWcjVm?=
 =?utf-8?B?TWV6aStCVENoczhSSU1KTlcwaVZ3MHhHTzk2NGUrcm9xdlhqRndDSGFMSElH?=
 =?utf-8?B?bHl3N0FhSk43SWFlV01XbkpUeCtNMHdsSXBWUVdId2dkSzBZbkhkMjFiZkxt?=
 =?utf-8?B?c1E5YTZuVUpKUkVCTngrMXQyQUtTZ2QrV214WnZYcUEwN2NDTGFXYmNReHNX?=
 =?utf-8?B?U2pZai9naVIrUVJBZkpXenUwcEZES0IwZ2g3TXd5S3lsRmxGbW1YSWtMcWZr?=
 =?utf-8?B?L3AxV3pZc3JlblpsV0xzU05PT2NCZHlDVWFEaEl0eU8yZml5SVN0OFJtV0tD?=
 =?utf-8?B?aXduUEVaV0pJSFoxU3pTQytFM0tPd0tFL2JSR3hLN1hhSmZrOHBOWTBrWjAw?=
 =?utf-8?B?ZEFDWDc3MUlDL3JMMDRHa1RVTmxwMTlQVk5haithend0d05mTTVoMUt6Z1dI?=
 =?utf-8?B?a0FTbEZJTjZ1Z3h2RFlya0RoSlBTYVB3WUYwWFZTWHRsZkI1WTNpV2xHVlgv?=
 =?utf-8?B?TElnMmhxY3VrTDVxS054Rkd2WDEvRjU4bXFINDN1QlpYMlNYdXJKK1MxZmpF?=
 =?utf-8?B?N0kxRHNaKzdOK2RZOHNmMmtEVVRHSmxjbnE3dWRYeXZmYkZCVzZPSE1Ec1V2?=
 =?utf-8?B?U2dZM0FDUkRJVGFSa3ZRNStxMmx6WDQrcUVycVlKU0E3V3BnbW5ObDVtUzMv?=
 =?utf-8?B?TVRrYUpTRFZnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3hjWDFMOUFIazh4bkc0RzZvSkRyd3BSeVFzVHZENlZ1SmFDdlpCYmErR2pU?=
 =?utf-8?B?TlFnVGxuYWV0dTlaTWMzWEFBWkU0MWVOM1BxOFA3S3JnRUVReWhTbWp2WDQ3?=
 =?utf-8?B?VUFvQURiYU9FS0xZK3V3Y2RzRnUwYmU1d1RxbGU3bFJ4amxLRnVVREk2Ry9k?=
 =?utf-8?B?ODhGcURSZW5WdmhDL0FjeGcrQ3FpbWt5V1dCUCtzZEJENTUvQkw0cFUxZ0M3?=
 =?utf-8?B?OXBVbDlkYnJlMlgxVHVBYTMzYjRFalJxbkV1bDFXTzc4UmFLSHhidk9IV09j?=
 =?utf-8?B?SEI4bTRHbHk1SmRjaUJpM1Y4YVo5TUpaZ3ZFb2svUEZ2Q1RjT1BsWGR5UzVW?=
 =?utf-8?B?RXNDYTRSMWRmRGdyU013cXdYb1dDU05ZVWFRM2E2blpLNitndHNCUTdYaWdX?=
 =?utf-8?B?blBLUVVCc3p2bE4wRWg2Q3RIQ01sQS9TY3Jiak5vZ3Q0NTI5SFdtU2xLcXAy?=
 =?utf-8?B?WDZROW9TNnlYL0NvT3lVT2c1amNjU2tuanFBZEJxT2RGSDhJRjYzVkJKU0VI?=
 =?utf-8?B?NndwNFNGZERiN0xUT3dFdWxJUk53cWpxTExuakttODdXU0dCL252RDl6ZU1V?=
 =?utf-8?B?VkVEdEdvV2d5bzhkZW0zK3RrU1dOU2x6V2RQaG4zdjBOSFFIbHhkS0F4M0lB?=
 =?utf-8?B?ZHpHZ1o3RTYybEhQWlB4WHB4QlllTVBqWHgyckg3ajhQNE1lZHZtRXVTU3pr?=
 =?utf-8?B?VFA5ZTVBMDBSRVl2SW9oU0NtUzQzQWlZMmp6NnBtd0w3U0RGTmJKODN0M043?=
 =?utf-8?B?UVJLZzBzN0ppM1hmWi9JMHZBN0x4L3dwRjhtVi9INGk5VmVlbmcrR3F5NU1i?=
 =?utf-8?B?R3RoNTF1ZVhsaDd2eGxNQkdPKzdGeWpCQWJtdzFwTDVHTkFqcWhIUjdkYnpa?=
 =?utf-8?B?RFJzdXFVQjBMNWExaVplcitRMWlRWDdTMUFjdWdLMFE3dHFDelRJMVVxNk81?=
 =?utf-8?B?bjJaanN0dFR3dy9MQy9xNlhrT2ZabHNzaThCenFadXVlR0RSTThyTUJvMTda?=
 =?utf-8?B?YXBKV1NobnUwSW82SVZTWk9hS2FLMXcvT1h4bG1JV1B2QVJqb0VYUlRwU25O?=
 =?utf-8?B?TUF5SEs1UVhZbk4xK0lkVWpITnQ5Ukl5bEhQd1RsSjJPVzhjVVBvMWhOL01w?=
 =?utf-8?B?Q2VPVlpPckx0aCtEejVXdHVaejhCckNzRjVVZk42bncvVWtXdnBmVmM5blFW?=
 =?utf-8?B?R3JUZk44Vis4c2FmcUZ3b3ljOTBiY2ZPbStXOGI1M0VQanhXU2RZcjZmNzdW?=
 =?utf-8?B?R1R6NzR1NDJpNjg2WGx1c1lYL1NTRkxrZExEdXVLWUNKZW9uTWt4K1VyMHl0?=
 =?utf-8?B?TmxZSjlsNW9KTkVQU0NBdVJnd1N4VDc2cG1RNFE4d0tCY3BWanJNdy8yWXp2?=
 =?utf-8?B?N1dheW1ubFFwanhrWGpFNUFRUWJPNisvUlJaUEQ3ZUlqTytRSTE5OWt0WVlv?=
 =?utf-8?B?Y05xZmtTOG8vMVhWVzR5V1FrWkNjdmdZVGtRa2QxcVkxL0QyV1ZaNldFSmEz?=
 =?utf-8?B?WHpTQnMydDJva2VpUktJZnZ0TUJqeS9rOXgrdCtzYXNHcEZNdnBRaDZVYlB6?=
 =?utf-8?B?R1g1WEY2cUxpcEhNMDlOZkR4REo4L3U5WlZDWkRZa1RxbXVEeWdtLzRlWXoz?=
 =?utf-8?B?dEpwUWRJb2RmYjV1VlUyRmQxVTYvTTBaUytiVUJaY015eTRuMFQveFE0MSsw?=
 =?utf-8?B?VnNTcjRibWdIMlVCTVBWZUoyK1ZmdVNBdE9HRURERGsvcHlOd2pCemJ3aytO?=
 =?utf-8?B?VzhQMEZIUW53RjdDZWJ5VUFPcWNxekQwNmtmVDhSYmdPK0JOZUIvQUNOeThy?=
 =?utf-8?B?V1dWQWJkL2FadVBHS3BQdVZXNUdua01zRkFsRE84bWt6VFd3TTN6endTTmVK?=
 =?utf-8?B?aFYrTHlBS1NkZTkxS0RxajRzRmI1V0pzanB4bDNlSnB1VVh4ZkxzcWVjTitt?=
 =?utf-8?B?MDEvNFQ1RXFzbEwyUCtuYnVab0ZMQWtoalh3QTNKN2wrb0RUTDU1bWU1K3lm?=
 =?utf-8?B?T3pXdXN5Qk95WjNSZnRBSTVZK0JvYlpNQzBYUmhxaVpqSS9xdHc1VVJEN1RY?=
 =?utf-8?B?Z0w3QTk2UGNPckROaExteThVZnVoY2swbVVjUUoyRjJ4aG9jVFpUNHd2Kytv?=
 =?utf-8?B?N3l5alVtanF5VTlOVHhzYzR5Vm40dHpsVy83OGV3OFNoVFJLdkIydXJaSEZ4?=
 =?utf-8?Q?jJ6rhvcSB8vkQD/3b38lkU5SMl7z/VNtpUIMn/uqtIND?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f22532db-3b7d-4a6f-5813-08dda9b9cc2f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 14:02:41.8800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cxU9svuCbXQ7uY86BBcy3gNoQIdUSnaxDHHLo91wMPnyjM+tyiNPIsQlLa4MBvttbYh/GBXcMiCV6BMD0Ocdrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8458
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

Introduce the `num` module, featuring the `PowerOfTwo` unsigned wrapper
that guarantees (at build-time or runtime) that a value is a power of
two.

Such a property is often useful to maintain. In the context of the
kernel, powers of two are often used to align addresses or sizes up and
down, or to create masks. These operations are provided by this type.

It is introduced to be first used by the nova-core driver.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/lib.rs |   1 +
 rust/kernel/num.rs | 173 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 174 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 6b4774b2b1c37f4da1866e993be6230bc6715841..2955f65da1278dd4cba1e4272ff178b8211a892c 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -89,6 +89,7 @@
 pub mod mm;
 #[cfg(CONFIG_NET)]
 pub mod net;
+pub mod num;
 pub mod of;
 #[cfg(CONFIG_PM_OPP)]
 pub mod opp;
diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
new file mode 100644
index 0000000000000000000000000000000000000000..ee0f67ad1a89e69f5f8d2077eba5541b472e7d8a
--- /dev/null
+++ b/rust/kernel/num.rs
@@ -0,0 +1,173 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Numerical and binary utilities for primitive types.
+
+use crate::build_assert;
+use core::borrow::Borrow;
+use core::fmt::Debug;
+use core::hash::Hash;
+use core::ops::Deref;
+
+/// An unsigned integer which is guaranteed to be a power of 2.
+#[derive(Debug, Clone, Copy)]
+#[repr(transparent)]
+pub struct PowerOfTwo<T>(T);
+
+macro_rules! power_of_two_impl {
+    ($($t:ty),+) => {
+        $(
+            impl PowerOfTwo<$t> {
+                /// Validates that `v` is a power of two at build-time, and returns it wrapped into
+                /// `PowerOfTwo`.
+                ///
+                /// A build error is triggered if `v` cannot be asserted to be a power of two.
+                ///
+                /// # Examples
+                ///
+                /// ```
+                /// use kernel::num::PowerOfTwo;
+                ///
+                /// let v = PowerOfTwo::<u32>::new(256);
+                /// assert_eq!(v.value(), 256);
+                /// ```
+                #[inline(always)]
+                pub const fn new(v: $t) -> Self {
+                    build_assert!(v.count_ones() == 1);
+                    Self(v)
+                }
+
+                /// Validates that `v` is a power of two at runtime, and returns it wrapped into
+                /// `PowerOfTwo`.
+                ///
+                /// `None` is returned if `v` was not a power of two.
+                ///
+                /// # Examples
+                ///
+                /// ```
+                /// use kernel::num::PowerOfTwo;
+                ///
+                /// assert_eq!(PowerOfTwo::<u32>::try_new(16).unwrap().value(), 16);
+                /// assert_eq!(PowerOfTwo::<u32>::try_new(15), None);
+                /// ```
+                #[inline(always)]
+                pub const fn try_new(v: $t) -> Option<Self> {
+                    match v.count_ones() {
+                        1 => Some(Self(v)),
+                        _ => None,
+                    }
+                }
+
+                /// Returns the value of this instance.
+                ///
+                /// It is guaranteed to be a power of two.
+                ///
+                /// # Examples
+                ///
+                /// ```
+                /// use kernel::num::PowerOfTwo;
+                ///
+                /// let v = PowerOfTwo::<u32>::new(256);
+                /// assert_eq!(v.value(), 256);
+                /// ```
+                #[inline(always)]
+                pub const fn value(&self) -> $t {
+                    self.0
+                }
+
+                /// Returns the mask corresponding to `self.value() - 1`.
+                #[inline(always)]
+                pub const fn mask(&self) -> $t {
+                    self.0.wrapping_sub(1)
+                }
+
+                /// Aligns `self` down to `alignment`.
+                ///
+                /// # Examples
+                ///
+                /// ```
+                /// use kernel::num::PowerOfTwo;
+                ///
+                /// assert_eq!(PowerOfTwo::<u32>::new(0x1000).align_down(0x4fff), 0x4000);
+                /// ```
+                #[inline(always)]
+                pub const fn align_down(self, value: $t) -> $t {
+                    value & !self.mask()
+                }
+
+                /// Aligns `value` up to `self`.
+                ///
+                /// Wraps around to `0` if the requested alignment pushes the result above the
+                /// type's limits.
+                ///
+                /// # Examples
+                ///
+                /// ```
+                /// use kernel::num::PowerOfTwo;
+                ///
+                /// assert_eq!(PowerOfTwo::<u32>::new(0x1000).align_up(0x4fff), 0x5000);
+                /// assert_eq!(PowerOfTwo::<u32>::new(0x1000).align_up(0x4000), 0x4000);
+                /// assert_eq!(PowerOfTwo::<u32>::new(0x1000).align_up(0x0), 0x0);
+                /// assert_eq!(PowerOfTwo::<u16>::new(0x100).align_up(0xffff), 0x0);
+                /// ```
+                #[inline(always)]
+                pub const fn align_up(self, value: $t) -> $t {
+                    self.align_down(value.wrapping_add(self.mask()))
+                }
+            }
+        )+
+    };
+}
+
+power_of_two_impl!(usize, u8, u16, u32, u64, u128);
+
+impl<T> Deref for PowerOfTwo<T> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        &self.0
+    }
+}
+
+impl<T> PartialEq for PowerOfTwo<T>
+where
+    T: PartialEq,
+{
+    fn eq(&self, other: &Self) -> bool {
+        self.0 == other.0
+    }
+}
+
+impl<T> Eq for PowerOfTwo<T> where T: Eq {}
+
+impl<T> PartialOrd for PowerOfTwo<T>
+where
+    T: PartialOrd,
+{
+    fn partial_cmp(&self, other: &Self) -> Option<core::cmp::Ordering> {
+        self.0.partial_cmp(&other.0)
+    }
+}
+
+impl<T> Ord for PowerOfTwo<T>
+where
+    T: Ord,
+{
+    fn cmp(&self, other: &Self) -> core::cmp::Ordering {
+        self.0.cmp(&other.0)
+    }
+}
+
+impl<T> Hash for PowerOfTwo<T>
+where
+    T: Hash,
+{
+    fn hash<H: core::hash::Hasher>(&self, state: &mut H) {
+        self.0.hash(state);
+    }
+}
+
+impl<T> Borrow<T> for PowerOfTwo<T> {
+    fn borrow(&self) -> &T {
+        &self.0
+    }
+}

-- 
2.49.0

