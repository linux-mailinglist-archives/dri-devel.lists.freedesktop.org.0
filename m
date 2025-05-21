Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C504ABEC36
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 08:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC23510E65A;
	Wed, 21 May 2025 06:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TCuCxyjS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E6B10E65A;
 Wed, 21 May 2025 06:46:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YmLM6H675QI9mouAv2//y6mTMKeu0vyG9zb2z9B2k6QkfGHXhxk4Smfj/mAJeQTmLcAU2w1P0RelGTs1/gnwdGgPN2qyDQ9jL8f1FZynhWabXFN7cw1avVDtfn/mrUi8JkDBQDjw9W4hjb3gCxr0Sx2XNZO202zFns9X8Rx2+UyWUlyB+uB8oiLTOvYO7ZlSoIzbOxqnlPVrL0vMkg73YzmrE46mTuMaHlze3GPe+Xx4Uq6khyZGC6omorDPuYqv/tuN1U+2qfyR3e+1kcIGo27SrR5oBEcINHufxJ6it1dGH7VV92rJr/78mk7sY47CUPI54IXmg5b0QgO41F3nTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CcGOkYWwiHWq26Wp1FL90f3f0ak0D5if2F9t9ljjtrc=;
 b=ZYrFGkMcw7lj8OY8cDlT/2pNQW3130R6V+mShe1q84DfTVFS20Juj2uY2LjOWFByZASJmTOIaYJBRvZSnvev4r52URNyROXxmqmPSPYxNs0C0GudLuS7ZLX3yhUHZN2pBgUi13LepsNcNKXKLvADu+ZZP+Nit4wlQXwtv6Kzj13BN+qRS74wMyBgT2KRaL+N3ypMavUkO71pVqlcHJlFSS5z4lSGIYCbaxCk6Car7R2jUqPEzrkhavqoJ7ImPlWLZq/3iKU3SSneLrjRtpanR6bz/QISIugxvlXb2l+2heiQ03ant5Z08VI+aOvorpr5pJ/uAwi9kUtBuedfcpSAPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CcGOkYWwiHWq26Wp1FL90f3f0ak0D5if2F9t9ljjtrc=;
 b=TCuCxyjSekYYaL9H5Ak1rahUzI+gHRSGw8hlWhuisrHhQOZc4IFgQJHdeHiTWA0UekKobpodxH00A7Jchs9uWBa+7WaRZeBEt7x6Otdo2QIoJmd62KAKUSAbaR8QcFtFa9skmpjBh/nkDFRfxCzTNZ7zjPk+WEAOllbBzP3IGr30t2gZZpLVlNMiO9a/brLLzR52gcFsoc8nPa/kFKSd0OZTZy5bYrkNzKQVfgeEEW0qsLibWtZ9G1PCgumZbdAj+sKlZy/VzWe6BrvNUtn2j/SBd0wPJG3+8ZHcILg2wSHUSqkqAjhp3rtEtA7i+T3vBteglVwkmQdfW3nvlMjiXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6618.namprd12.prod.outlook.com (2603:10b6:208:38d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Wed, 21 May
 2025 06:45:58 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 06:45:58 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 21 May 2025 15:45:10 +0900
Subject: [PATCH v4 15/20] gpu: nova-core: firmware: add ucode descriptor
 used by FWSEC-FRTS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-nova-frts-v4-15-05dfd4f39479@nvidia.com>
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
X-ClientProxiedBy: TYWPR01CA0043.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: d1f3ce44-10a8-4e04-9430-08dd98332466
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWR5UGM4YmZneEkvaHFwUFgrYWZwck9mdTZNN1pXbUN0WTdwc1Zsc2pLZ0kw?=
 =?utf-8?B?cExzNjJWS3U3aUgrWGpITkpkU01hdmVCY0ZPY21iaUtYU0JOTDJJVWF6My9P?=
 =?utf-8?B?S3g3Y1JoUzRkaDhDNS84QTdTb1JNNUNmSkx1anFyb2paOFpjMTdNYUtFRmky?=
 =?utf-8?B?S3JIWUpyZFp3S2ovWExodHRCWjErSWhEQnN4YVJTZGc1WGNNWFNwNkVOckxG?=
 =?utf-8?B?YmRVSHpkNGdoQ0M4amRzZk1TSUo0R2ZFalBXVVpZSjI4dEdjWlZKZEw2WG5v?=
 =?utf-8?B?YXFFTjZRd0crWGZBUWx1M0VDd2FhVVpCQS91RW9iSDJDcnRQbEdBUWorQUZj?=
 =?utf-8?B?cXR3Q0xTQkVSWDhpRitJQ25QTGlVb3dpMVlEVWNVdm51M3BhSVY1SmpLbUVu?=
 =?utf-8?B?NVdGZVFCL1F2bTZveXhyK3FHUEQ4a014V0FhOTVvZklKcXNLNFNYS01PaUFj?=
 =?utf-8?B?c21Vc3RwVUZsOUkyRGtOOWdDU1c5S0RBdVA0MkdlSFdSUElpVHRBRERnWUpQ?=
 =?utf-8?B?cksyYWdMZDNBaVM3eXhrM2NKTDErbFZhb3kvN0Q1d284NloyNTh0MWlkSmdX?=
 =?utf-8?B?RmpHcVRxTWlLRFduKzgwNkRLQ3R5emtRU29IbC9BeGJ1UmJWZHNBN3N2Mlpl?=
 =?utf-8?B?M2lhak5UUVhhSDNHbGhUMVBHSTl4YXBSeDQxTTgrZnNRTGhIbUg4YjRKZkVP?=
 =?utf-8?B?cm5kUVI4SDIzcmlUc1VoSHd4dHZ1d3V3U2VPWGdtbjF1WmtQdTk5NUtZYVND?=
 =?utf-8?B?UGZVMTM2Z0M2eFUva3lLdUZKYWxQS0VDZDZJczZXaFFVdEdnOVU2VkdZLzZZ?=
 =?utf-8?B?cjgxM3NYZGRxVytiZWp2M2YxbWFlMURSN2xyYmpaQVZxTjJvNngyU1RVVW5Z?=
 =?utf-8?B?RHJlSVNXWUJTWnVSdHBkUVprdlU4Y3JBc2pYSEk5WkFxR2NIZXBRVDlwU0lv?=
 =?utf-8?B?ZEVOZ1c1L3dwTmR4K1lGWE9YdFZSTDlPUGJOK1NFSkpFdjRMRUJDenpkaUxw?=
 =?utf-8?B?VTBzcUU4SStidktqNDByMVQvUVl2UnlUbHFhd2RLVWcxMlh1ejBZTlRkT3F1?=
 =?utf-8?B?eEhWdXVMRjM3TElKQ1pXazF5UWtZblM1NlEySVJrYzNvTHQyMHpONjdrOEZQ?=
 =?utf-8?B?bXA0ZWM1eXpNUDFpU3RiRUhGM0t2TUxpN1gxUUdZQzBRRUdVREcyQ2YzOTlT?=
 =?utf-8?B?UjBqc3d2MThLTFllSEVkd0RPWmNqK3p4MGZXd0JQc3A4RUs3TnVYRDFydzU5?=
 =?utf-8?B?MmxpOS80MWlMVFQ1b3I5dzBCK3l6VkR5WnRvekZYenBuajVUMlg4MFBXcng5?=
 =?utf-8?B?U29FakRxRXVqM3Rqd2dUajU5YlJsellSYWc4Z0ZCT0JPbWZQS3hoaFJOY1J4?=
 =?utf-8?B?NUFjOVhmaTJyWTZGU0pEZE11N1N3cndKbCt6OTNXc09YQm1idTBPZVlCb29m?=
 =?utf-8?B?TEVLVHA4ZVZZd2R0YjFtUVlVSUI2RklERjQwYmU4ZndUSlljVWRWdkVkaDZo?=
 =?utf-8?B?dVF6Vkx2dnJXblFWd2xUZVBoSVNUZmhhS0VDd1V4K201S0ZvZXA1K1FOT2hW?=
 =?utf-8?B?N3ptMDhyZkdzSXpiRDh4TVQ1by9DOGtqQmN2VDY1dEpqSVpUaktZN0dwY09B?=
 =?utf-8?B?MmwycGkvbGZFNzJscXdkSzc3YlBodTBKWk1DNGs2UWZpREFJeUZPVWh0aGhu?=
 =?utf-8?B?TytMc0l4cURRQVllOTAwOUUwVlJNcjhiYW1hcTNIeDU1clVJVVRGczI2d3Aw?=
 =?utf-8?B?SW8xbDM3czhKYWtiY0k3K1Z5M0toUDNKdFYwR3hkT3RmR2xNakREd3NndHNS?=
 =?utf-8?B?dDFXcHA5UjhFazBjRmdXTzlxYnVFRmtaQ3ljL1NkYTFaTmZPVnFleFBBRSsx?=
 =?utf-8?B?L2VNQllCQTRXZ1lHZi9VYWRjbnZ4Tmt5VEdZejd2RVYySm9vcVNxTnIxdVBj?=
 =?utf-8?B?ODh5N2FvZUtyV3ZtVDljSU9xV0JvYnNLY3VsbW9URFgrdys2bUFUZUFzL2x0?=
 =?utf-8?B?RXk1allqYjZBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFMzSlZHSXJudGhKODJtVm1PNktjZElJR2xqK2xyREVjcXpXOWlmbE45TGxY?=
 =?utf-8?B?L1laenpVMzZXQXJGVDlGWHY2NGQwNWZiRks2YUxJcjFsdEFCNjBTTnNHSjlK?=
 =?utf-8?B?MTlubHVzZU95QmJHdGxZUWN6dEtHVFNlTU1DV2NKOHQ5NEZSdWtidnBoNmF3?=
 =?utf-8?B?Sm41TkhJU1ZSMllxcFRmTC95YkdsOHFHUFQwNms1YUEzdzNCM2FsRFV3M3RU?=
 =?utf-8?B?L1RTSmtaU0lFZHZGR3p2cmx5ei9nNHJlRzEzaWdDcytVMFh3eUp5REZGV3pu?=
 =?utf-8?B?Y3R5RnVEQWEwVnd6UFF0VStldlhSaVFnOVNIcmlaQUlUblROREgyUGhWcHM0?=
 =?utf-8?B?TWJ1cXo5N2U4OXZ0MjgxODZrQzJYdzQybWFINTh3U2xyVUF3NUszZzVZTWhs?=
 =?utf-8?B?M0FGSCtZU1FwR0tIZVhCSk9YYXp6dEZWQWwwQTE1anVkMkxXMnBRc28wOVJB?=
 =?utf-8?B?VEpyUDBTRzJ4MnI1UmpLOTN2bksvQWtnOTVWTmV0ZzNSaFc5amZtYVZYWmNC?=
 =?utf-8?B?NEFURGpyVVVNayt2TlFCVDZVVFA2S3YvbkYxWlFFWkFEM0VCV3NJU3lrRDRC?=
 =?utf-8?B?SGtBZVJRd2kxRkljS3lUejQ0VVg3d0RIRWF1M2VlLy9tTTg0Ykh3L2VFK0dJ?=
 =?utf-8?B?UU9rN0dqcEg5YlIwZjRiQXYzeFBDai9xSVREYkZrazl3Qkd1MlhmL0E5bkJZ?=
 =?utf-8?B?b0FpRTgwVFFFL1RQc2tYdlE5YnhVUmwvaEZjbDFoeGJRNm03WlJGVUNqelJi?=
 =?utf-8?B?aDNaVWt2MU4rM3FKeTQ4NlppcDJmbXJxNU43ZTU2UlVWUEVneS8wdTVVd0dN?=
 =?utf-8?B?V1RmNWh0eE9DL1RIWGV3WWVxU1hkUXMxQlFDNlV1cUNmdHpnTG5PZ2t2bmZI?=
 =?utf-8?B?T1hLZzNDUnMzWlRmeFRvaFRpWUh2VjR5REh4UkZyV0todzVSaEhBRHhLWDNr?=
 =?utf-8?B?ckNpb0FFY3g2bUpyUHo5dlpCSHgrZkNPWjZWYUFPREFZZlZScGlaKzY4TEtX?=
 =?utf-8?B?RWtGQlJhcjdLREUxL2UwWDF1Q09MRDkyaFVzckF0VHhxc0NGeVdHZjRpenMv?=
 =?utf-8?B?MDE1dzFVbERIb2hiT2RlalN1eGhMc0JldWxHWTNSUDllZVdRUG1ETFNtTUhw?=
 =?utf-8?B?ZzI4akJNY0JnSUsvckpHWVBIcmxXSTJFZzBHN1FKSnRpYWNlR3RTRlhvYjlZ?=
 =?utf-8?B?azNwM0tmUmpqa0tHVCtySi9rd2pzMlNoSTRGdzBxNE1CcUVlMVBJSHU1N1pH?=
 =?utf-8?B?NE5sd2UzWGZYTXBEQlVacmM5cjFMSWNzZElOWW5vcEN4YUVkQzBENThLUTU3?=
 =?utf-8?B?a3gxb3hUQXVtYWRDbExyRG51YWxMcWlZQmdkUE1jWkdyUGpwbWFvSit0Q1NZ?=
 =?utf-8?B?UWtSSFk3eXBoV0Z3VXdxL0xVclBacGZYN2FOVVVSSmppZnBJQWhGR3RqcUxh?=
 =?utf-8?B?YzI3eUZVQTNCUFc2U3pLZzhneWYyOUNrU2FCS1RDMlBHUkdPSWxWUGYyTGFK?=
 =?utf-8?B?L0cwZno1UDF6d2NJbWNReVZGclZUY0o1SmQ0TzRrMmhWY2ZjaUIyN01KVVhq?=
 =?utf-8?B?dXJ1Zm5udlkyNGkvMEdWVzEyS0U3RWNnY0RJczRiYzgyb2QyemRvUjBnYWIw?=
 =?utf-8?B?Q01wU0JHZDNMU2hzdDhRZVFMeC81RENIcGthbTJGcElBK3pGUzVRamt0UVZV?=
 =?utf-8?B?eUFPYmp4elBBUm1pVEY5NXhOUktkZDY2Y2lsazdLdmFybWM4b00wRVZUZUZL?=
 =?utf-8?B?ZDBTOXRodHhnUVB0RmNuUmRWZFVnSWVxbXAyK3VGT3YwTUw5NXpPcFkwa0k2?=
 =?utf-8?B?S3h1ZjBXTVpRNW9Zekh5ZmRtdXRqMm1EU1Flb2c2TlpjYzc1UDFrUHJTZEpy?=
 =?utf-8?B?eU1sMHVjTXJySjU5dnE2QTN3ajhBSy9vQWcwNTY1UGV5U3FQN1VzZjJ1VGdz?=
 =?utf-8?B?RHlZZFJRM2crUWdhSURJODVMYm44SzZnNVgva0IwWmtOTkRzNWNtSXNhZUJj?=
 =?utf-8?B?RjlGdXh6MGRtd0FUSGR5OWxRTXFudTQ1WHMveitrRE5XajB2OXpHM1l0UU5a?=
 =?utf-8?B?WUc0WU5EcVc4NnUwakcxV2pyN3cvWklXVDhNUDk1QTBTN1hEWjhtRjRMWnVH?=
 =?utf-8?B?MUMwT3FteFY3SHowaEFOY3doM21sdzhmRHZSNUh1N3pYeHlMOWFhZTdsOFcv?=
 =?utf-8?Q?5itILjwVGRn1ygC6O0AZu6qGv/RtImKiw+BnFK0xBtvw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f3ce44-10a8-4e04-9430-08dd98332466
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 06:45:57.9269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DxMlhcQmlmJKpcPmy/CTNaPFzUvIoif3jvd6ksyntXeiux6WdsX0bvMZMIwEKfHH0/AGuM4tk9TaCniK+naH3Q==
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

FWSEC-FRTS is the first firmware we need to run on the GSP falcon in
order to initiate the GSP boot process. Introduce the structure that
describes it.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 43 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 4b8a38358a4f6da2a4d57f8db50ea9e788c3e4b5..f675fb225607c3efd943393086123b7aeafd7d4f 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -41,6 +41,49 @@ pub(crate) fn new(dev: &device::Device, chipset: Chipset, ver: &str) -> Result<F
     }
 }
 
+/// Structure used to describe some firmwares, notably FWSEC-FRTS.
+#[repr(C)]
+#[derive(Debug, Clone)]
+pub(crate) struct FalconUCodeDescV3 {
+    /// Header defined by `NV_BIT_FALCON_UCODE_DESC_HEADER_VDESC*` in OpenRM.
+    ///
+    /// Bits `31:16` contain the size of the header, after which the actual ucode data starts.
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
+    pub(crate) fn size(&self) -> usize {
+        ((self.hdr & 0xffff0000) >> 16) as usize
+    }
+}
+
 pub(crate) struct ModInfoBuilder<const N: usize>(firmware::ModInfoBuilder<N>);
 
 impl<const N: usize> ModInfoBuilder<N> {

-- 
2.49.0

