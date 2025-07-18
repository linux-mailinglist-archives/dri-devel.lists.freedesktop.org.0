Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFA0B09C75
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 09:27:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A8010E90E;
	Fri, 18 Jul 2025 07:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HAemG2EX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2047.outbound.protection.outlook.com [40.107.100.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A608C10E90A;
 Fri, 18 Jul 2025 07:27:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gEI8+//Msz/C6YngfKA0K/wxkT8F7zYT1cnGP00EAIQznhDWaCra+d8al1CZD2R6/azvT60LiBhpAYkm6sDT+LQEwwoEG5yT/tLxcyTBrWeU0v5uDrLR9arRsfPrW73+3atpMMfE/pRsngE4nChoss1vXcSiLS+CLc9panGNhg9OSmo4chpSIqGQLU0P/O1rYfpWNg9dLXqSB3Ktt3EwQ4MRQjOMmHkIWQy99ZJhPojMK+xMH7fAOrA72ycIA/HUWu0+C2aHsuxPknEp9iA2RiyE4jXT3KQY9Gsh9tgLK0NcvxQwnqNLi3tB6NlYUfly1XchZuskD5m+dVnpXFywbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4oUeska4CNF8KHvwqN8fjQtZqv/dsTPI5LIL5cTo6I=;
 b=e6dAl7LDK2VKzFBiic2nBPlfp4roVUzT/JCKyaECyq6TLxrW/NILd9JihYn1ptuAuhFwk8OaY0ijZ7hb2hoo1678+PLDUBbrTogDa4udbtWtqXXboKaG996FPQUnc1RzactWb6/8wOk4PBVzhE5CVdQuHo4PALTqXnOeEeL1bIgOpJLViZ7yyscX2hOdh/Qusdb1AyxP1LttthpPvnAlZZgE5dhj8n/mvdRQSYEEiqc3ZLrplX6kjEuUd9Mrx8QLXWdg9a7Gj/oU8X5Hx2kCmnJaX15VQQf01wQvOBwbJnuH2AO7kh/jDBFupnXL/QyQTQyEVcBrF4N3Exd7wMoGpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4oUeska4CNF8KHvwqN8fjQtZqv/dsTPI5LIL5cTo6I=;
 b=HAemG2EXa8tB2M8H/jbWSDyooBqV1l3zAUmG/0574HDHsEaGKmzHEB6k0I9zde6ZuOu8PlmNYQ0eBV8Ghay67WEwISFFyhPwHxFXzdDDMtyw8P7r8gPOartDHDU4uo1xbPJFcW69nDYDPeASKkD3gGXoalhR0Ne4eNG0VOjiRKQmI/oYdEPHRvMGGgyD2vbMQeR/CZHG0gnUSzC2UOa3zqT2h/e6nCn/8LH/PuiIt8kEz07xW7BdUD/yP4etx1zfeWGQhMMGvXoL6YO4+t2zJczH9BILm55kWVaDFeyCgnvq8kyeGp2vs1Fk/DgoAASKsgBC2E1rIARkK0EKncWlrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW3PR12MB4427.namprd12.prod.outlook.com (2603:10b6:303:52::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Fri, 18 Jul
 2025 07:27:04 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 07:27:04 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 18 Jul 2025 16:26:18 +0900
Subject: [PATCH v2 13/19] gpu: nova-core: register: split @io rule into
 fixed and relative versions
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-nova-regs-v2-13-7b6a762aa1cd@nvidia.com>
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
In-Reply-To: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0348.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW3PR12MB4427:EE_
X-MS-Office365-Filtering-Correlation-Id: 5568091d-338d-452b-5f67-08ddc5cc7e71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWF3YUFVZTF4VXNjSE9ocUVsU0VDa0E3RmZxbHMxWmducytnOGlNU1BIU0V0?=
 =?utf-8?B?OE0wK1VhRFBkVVJkSTZNdUQzdmgyUHlTdnJ0ZTJpU2tQZmxtVUNsUkgvR3pI?=
 =?utf-8?B?WGZJalVjN1JHS1c4Y3hJU1hNTnR4ZHIva3F2UmlNOStJQkJGc0NDVWcvOEl6?=
 =?utf-8?B?bFVESlRiaU0rVkZ1RW5IQUtuVERYc2l5L0xvS1lKbVh5bVdyUFE3cFUzck1k?=
 =?utf-8?B?WmVqcnlYdUZvSDRrWmg2Ynh5M1JrSU5icmFUZTNqL2tLYzl2Tmg5VWNTY0h3?=
 =?utf-8?B?SHFNd0dBekd4dEZXUjVuNEFubEpxanB4VmNwbGlzUS9Sa0dYZWErWkl1dnJo?=
 =?utf-8?B?Wko5NTd2UU1IMTMzY3JVM0Y5eENHdDRDNHpnbkZpNFloWDB4cERlUEk2b0sv?=
 =?utf-8?B?VDNZbW5ySmtBTS9aUWhqYkU4ZjRiaXJhWTRhVGt0WWtXa0E3M0tjZDhNTkJZ?=
 =?utf-8?B?aloza2RwNGtHTmx1V3B0QVI0eTZLcHlGRlhLSDhtN1M3eklBY3BlMExybEx5?=
 =?utf-8?B?dnVhUWdVQmZka1g1L2xDeCtHeThSeFh3dU4rZEpSUkMyV0V1N0RyeS80YlF2?=
 =?utf-8?B?M3J1ZzlEdHpWQXhpa3htNmhiL043eno2Tk1KRUxEWWtjenNGSFJSTkZ1NG5h?=
 =?utf-8?B?Vm1ZeU51K3c1MzhmWmNDT2tzSkpkQjJKdFBUT2h5dDM3WjhCZHVweVVuc2lX?=
 =?utf-8?B?Z0F2SnVjc2dNMDZYZFUvTkZacVpHdHNDaHhrT05ZdHJ4cnh0aEF3ZEY2dTRu?=
 =?utf-8?B?ODBYaWFGSGEzbUlUMVZTSnNZZzJYaDM1V0xpR0hWaU1ZbDlFbEJ3ZUpMN1I2?=
 =?utf-8?B?bStiWFlzd3VqaitTV2RIRWYrSHFEN3VUTVZDemFDbW5INzE1K09OMmkvOGc4?=
 =?utf-8?B?L0xaRWhzbmFQT09Ob3NEMnZPWXdkWm4xV2pWS3ZVWjBTd0NMVElCbGRQd1NQ?=
 =?utf-8?B?VUhQWmZmR1kxRjlvMnJQL2M4d1NHNEpmdWZVSUkzcmpxcUdhUGQzRGkySzBj?=
 =?utf-8?B?SUhFV0JRQmFEeks1bStTOUhKQmswWlFkV3o3Yjd2cHNyR2U4L0FpeXBHenFq?=
 =?utf-8?B?TUp0YjgvNCtLc3cxd2NkVGI0d0w3aHkzb1lySWMyM3JLSW9LYWxqOE11Tk5p?=
 =?utf-8?B?Z05hNElMUDZGREsrdWh3aE94Mk8yaUtKU2JwNzlmUUt3M2Z1ODFsVFMrVDhz?=
 =?utf-8?B?OVZnYTFENzNxYkp6ZUJQVm9WNzVLWXI1MktLU21ZU0g3ZnZJTU5LT0taVmxp?=
 =?utf-8?B?RlU5MDFmZzVSZ2ZLaStEajk5aGlDYWU5a1doVG40OFpLVEVJNEY0T3dtRzZ0?=
 =?utf-8?B?N1lpUlBYQnU1VktSSjkzOTZTTDRiTEtMOGRzdGZoY1lGUkVQUWpNczBtTkpn?=
 =?utf-8?B?b0ZGL3R6YzEzbHlsUDlJS1Examk2QkMyUjNDblNHNVE1R0FMN1FVcy91cmpC?=
 =?utf-8?B?UUFoQ0JDRzRqS0JkNEt4cFhlZ29XU0JnVnQ0U0Q2dVJkc0FPRjJuTFF2Z3Rh?=
 =?utf-8?B?WlRuOUlGRjF4QWgzQWE4YnlqSDdqQm40VXRldmlsL05xTm5kU2N0QUNRdlZF?=
 =?utf-8?B?TTdDUjRTREk5cFh4YjB6MTRxR0xMelFXaHVnWlVHbGxuWFJ2em1ydUZQUTFG?=
 =?utf-8?B?bWNtY1VEYzdDcEIvNGpkNnNZZGFXcWg2c0FQVXEzRlRkNXRyZ1NDWjc0RmJu?=
 =?utf-8?B?NE1KUGdpTmRySXQ4aTAwRXR0bng3SkR6YWJmaDF5M09CNWYyMDZGcGFXajJ2?=
 =?utf-8?B?SkxRTHlWcGM2UE90V0o2U2t2amE5aTdEOWVMQjExTWZUZ0RkTU9vbjlIeFgv?=
 =?utf-8?B?QVJlRlNDMzI2cXYrNGRYK3V2QUNIalVhZVc0cU1JNlVsTzUzV0NIdGhvRCt3?=
 =?utf-8?B?bGJoeHArZG11UGFaUC9WUG9CTWwwMitreDdMak5iZ2NSWlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVUyMTBPY3VvWmNzME40eHFkVnA5aWQvdUhRS1pyd0M4bWxkL05ISmQzL0ZB?=
 =?utf-8?B?RnZxZDNNeGFBK2FXdW45d2NrUzBCeTVsYUJ4OWkvMmZ1MHI2WmJPY0JYQ2Nz?=
 =?utf-8?B?L0VNcUpUYmFFK2dSdEVxTHZ3Ui9CNWlGWFYyUmptelBGeFRrUmd0TkdOVE9q?=
 =?utf-8?B?Q0FyOG1vMStNQjZTZ0RvdTZ5emZMK2wxZzJRLzRsZmg0a0JwL25JczFHaFZK?=
 =?utf-8?B?QTVsYzdFRDlGZStJWUVQZnJqaEczUEdHMWZhRE9NdGErR0FYL00rV3dCaUNm?=
 =?utf-8?B?SGFaSnN0QyszcGZxYlJlQmIxVW90VWRTVCtxa2w0RFlGd0dodlVCQm5BWkp2?=
 =?utf-8?B?ZUw3REFiUkhIVS8yd2ZaZFdHa2hUZ2pGK3RQQjlIb3U3NnJwZ2hSYWVqNnEv?=
 =?utf-8?B?dG52STAxS2VDOFQ3QStkRTl0UFBWRDdtRUwzMlV0d1c5YzJINGVJYjFEY1Vw?=
 =?utf-8?B?OVVoSStKNW9ma3ZWM1RESVpSbi84dXg1VlBHd2szUUc1YlUxTXorbVVGb2pT?=
 =?utf-8?B?TVNSWm9vUXcvTU03TjExUkFtOGk3Z09mU0NrbkNyaW5mWE50cnM5dnRtSnpX?=
 =?utf-8?B?d2tlcHhTeEw3SFFVN2xqd1hOdlpEVkFhYkRLZzdtSzFpN1dLS05yVElLdGt4?=
 =?utf-8?B?cHEyWXZNcWdEZ3dHRC92Unk5aGlXQk1wMEdMWWM3VkpCMVFjaGV5d2Z1SnVN?=
 =?utf-8?B?YXBwY2loOFJUeHB1dUVhc0tHSVZSd2I0a2VYMUVZYSs4TWdYMTVGSldXR0Ew?=
 =?utf-8?B?dTErekt2elFnOCtNVFN3ZTcvR0RQODFiZXc2eEE5VVM0NHZJYWhzbDJWa2FG?=
 =?utf-8?B?MkdhT3VmTGpwcG1MSWpSc0YwYTJGTmFDVVRQR24vc1NPZEpzNXpMQUJpc0NP?=
 =?utf-8?B?d3NSL3g0SFdnNURIUkY0OHpHUmJPUXBCd3F6dlB6QzB0bWdpaTR5TGFrYUhH?=
 =?utf-8?B?dis0QjBIUmtvS0M2dUl6OWtQQVRiK2V1dXpRdkx3dmE1aitLQmpmM3lNNElC?=
 =?utf-8?B?dXRXTFhLazF5SFlZV1R6TlFlZXdNK2h4NzNpemEyb0RxQnR0STV1Z2gwUUFp?=
 =?utf-8?B?L0orVE1IRzJXbm9Cajd4NXp5UHhtd2gvSzU4bytQSzhVdkRYdmU0ZDE0dHpx?=
 =?utf-8?B?L0RXeHdnQVNWOFozcWRhOHU5SVhTWExMRmk5SlMyTnZ4SEY2SHhraVcrdG1i?=
 =?utf-8?B?Z3J6dSsyOVhpeWlZT2VSNmp6RlZHSTFUTjZTdDZHNnVBVUNYWmFoQUJ3YnBq?=
 =?utf-8?B?VzN4cmRDWU0rd3hZL1dwZHpwazlrNVVDc2Y2MVpLOWNpWlRqVStublBnckJN?=
 =?utf-8?B?RWQzT3Zza2F0NWMycGY4ZTRMOUVyK0l0QnhqenJ2NG4xbTVkOWs3TDRtUThT?=
 =?utf-8?B?NGp1aDZnbStuYXVGQjc4NjNhLzZQRjNwbEUyWUFFRWdYaXIraks2YytyZ0hM?=
 =?utf-8?B?UW1NRXBkaW5FbFgrcStSdU9YY0hFejhxb09Ca1VEdzdPYkJJVCtuTzdBYmNM?=
 =?utf-8?B?Y01oa2N5YXNFVUtjM2w2WGhRdHM1YlduUkdaVFFqdkxSeVpEaC81WlF2bkpT?=
 =?utf-8?B?L1BxTFFNRTIyMXI0SWkzUTdXaytWNmVwclZCZlNxYWl6dlFvZG9mY2I5eXdX?=
 =?utf-8?B?QzJqZVlUenp6b2VTR05NbjlpZFdEQ3lvbjF5SW44QlVFd2lVaCtyb0RyaU8r?=
 =?utf-8?B?aXdvbFJLdU9jbE1yaEU4aVhvTjNKeUtnUFFhWk9aOUlyU1MyeitVeEZxdmZ6?=
 =?utf-8?B?U0ovZ1JTMlkzUGFiYlN6NGZLRzNjUHRHT3M2b094dzRFeVN0cVBQTXE2aHgz?=
 =?utf-8?B?QnV6SEx2bVZVY3JuQ01OUzJyWUxnbVNNZ01IeHlwcjQveHRpcE5ZVE9nOGJs?=
 =?utf-8?B?Sm5ERWlGYTNZWW9MYXZMeG5uS3hpZEh1aXFDYWcyNE92T1dGcUROcFE1MWs3?=
 =?utf-8?B?c0xDRVVNMThPem1ZazJYY1UzYWZqa0tXcXdIb0FSOVpkWVA1SVhPL0poZ2tR?=
 =?utf-8?B?MEN3bEUxbzhuSWc1OHZjV2gvem5DTE1sbTZ5U0ZlUmtXaVhoK0tUd21FZjBM?=
 =?utf-8?B?ZTdvUVdMdG9telcvZDF3MkVSOTdCTkFEc0RPc205cC80aXNKVTFkaFJSREdK?=
 =?utf-8?B?Z21EYm4wbWR3TUJaT3F3RHVwUlppNS83aEhJZG0xYzllT1QvSXhGbHM3RUht?=
 =?utf-8?Q?BUqery72D17kI8/Q5pM5IIwhZrQVIzKMhXg9JO+QhHqf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5568091d-338d-452b-5f67-08ddc5cc7e71
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 07:27:04.3287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5EUrXCsYmTj23Fdn9mWAcgnozIK7wLDTBJS4ExCgX/wCU7rk/xrg2d+UbL/Jcqcip43OFCt1jk0p4MNRwkq4AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4427
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

We used the same @io rule with different patterns to define both the
fixed and relative I/O accessors. This can be confusing as the matching
rules are very similar.

Since all call sites know which version they want to call, split @io
into @io_fixed and @io_relative to remove any ambiguity.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs/macros.rs | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index f0942dc29210f703fddd4d86b758173f75b3477a..bfa0220050d4ba03c9fcd75c9be1ed8dbaa4f290 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -89,25 +89,25 @@ macro_rules! register {
     // Creates a register at a fixed offset of the MMIO space.
     ($name:ident @ $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
         register!(@core $name $(, $comment)? { $($fields)* } );
-        register!(@io $name @ $offset);
+        register!(@io_fixed $name @ $offset);
     };
 
     // Creates an alias register of fixed offset register `alias` with its own fields.
     ($name:ident => $alias:ident $(, $comment:literal)? { $($fields:tt)* } ) => {
         register!(@core $name $(, $comment)? { $($fields)* } );
-        register!(@io $name @ $alias::OFFSET);
+        register!(@io_fixed $name @ $alias::OFFSET);
     };
 
     // Creates a register at a relative offset from a base address.
     ($name:ident @ + $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
         register!(@core $name $(, $comment)? { $($fields)* } );
-        register!(@io $name @ + $offset);
+        register!(@io_relative $name @ + $offset);
     };
 
     // Creates an alias register of relative offset register `alias` with its own fields.
     ($name:ident => + $alias:ident $(, $comment:literal)? { $($fields:tt)* } ) => {
         register!(@core $name $(, $comment)? { $($fields)* } );
-        register!(@io $name @ + $alias::OFFSET);
+        register!(@io_relative $name @ + $alias::OFFSET);
     };
 
     // All rules below are helpers.
@@ -342,7 +342,7 @@ fn default() -> Self {
     };
 
     // Generates the IO accessors for a fixed offset register.
-    (@io $name:ident @ $offset:expr) => {
+    (@io_fixed $name:ident @ $offset:expr) => {
         #[allow(dead_code)]
         impl $name {
             pub(crate) const OFFSET: usize = $offset;
@@ -380,7 +380,7 @@ pub(crate) fn alter<const SIZE: usize, T, F>(
     };
 
     // Generates the IO accessors for a relative offset register.
-    (@io $name:ident @ + $offset:literal) => {
+    (@io_relative $name:ident @ + $offset:literal) => {
         #[allow(dead_code)]
         impl $name {
             pub(crate) const OFFSET: usize = $offset;

-- 
2.50.1

