Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B868BCC0E2C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 05:27:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106B310E69E;
	Tue, 16 Dec 2025 04:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uJZiuvcq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013007.outbound.protection.outlook.com
 [40.107.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270AA10E685;
 Tue, 16 Dec 2025 04:27:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yC/I0CyfK6uqrQXfkIgZSAhn/VjJfPphxU0Sv17E/bqeOxWf4Gpj7DJflMQoyRYhPLspRs+XV90+BpL25xjbqSScrgGDzFOciEPw/6uKGMn0wTIVeNkwh7bcSm1fnOS9m6MdMZ8mETMRmOCozRCg1M9A2Smj+V+Mz2m/2S9rZouFP/OH3xfSNkGTYBv1ZMTHkw3s5Bgci7L4lU5nlY2C6ia2FDIjzVq+lWoGUtKA8kwwUKNS/HKKz/2axPD/ASkUE3ByKR8gQ0+M6RLmDx5Dj4/RYD76uchK773K9d8h7IcvgPCXhv15bxh1SwUeSKOLHEqdV0fZQqLGyvvoq3avmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cwqcrBzvc69hPzsM9kMseTTGXumYvZiqJyMn7FE3Gac=;
 b=F0kuByUAU71BYS7Bc8YCUWuEIdkZ68l7LS5gNQe/aieQoBqfr2TbhGt6EDnpilNwUj2VYZ1dJ8Gij7/KfcKy2JNrjvMWgBQbXcWsKzYdYnhshvDEusaJ+vkB1mlUdX9GhBK0ZZS1IyYqmTO6JOSe3xqsz+AEDh7WDdL23fiC3KcqkPaUWZC0z4srmU5yGSlkAWvOdATcyqJRSNDPPCoY9faQWJkJQMaNiuF2ROOqquB+zmo1bVfWJ5k17KNjLJYo4lKNMYPCVhcILUowxLwofM+7yWfXPPNddCTRkspVacar/PLcnd79fAF5r5YcRMr/iPHmw6WCWvvoxNumcm8+yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwqcrBzvc69hPzsM9kMseTTGXumYvZiqJyMn7FE3Gac=;
 b=uJZiuvcqFgpTRmN3uWuv+c+c4Zm4eOCWxfjWqKVzcExlqVuFh3tQSsTe9kU4DBM2EKW+xKs8DZxpG3pSLEZS+aNh9X4EDOmGKbLVSCQe/2x+waUm7wrJJ55QleAPADydr7TH4u/PfvBMIIRFGi0Sy1n6YosIxptHUInCeWjGmCcqiDYajBydESllW91rAZgvBlxRqbrvJGx5mPSdxIgIIMA9ch8HPlqEkc+DjmJt/ixEs7yGfzQAQ0HCGib0T5hZ84wTyBQbqLMw1o0C2sDGieWlZr8HzZHbnZdxCvQPuyZtwoQJn2mFtDzb6woz1eHOMuFWgwRsSwlqOYMHHQyTvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8754.namprd12.prod.outlook.com (2603:10b6:610:170::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 04:27:40 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 04:27:40 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 16 Dec 2025 13:27:24 +0900
Subject: [PATCH v2 04/10] gpu: nova-core: gsp: remove unneeded sequencer trait
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-nova-misc-v2-4-dc7b42586c04@nvidia.com>
References: <20251216-nova-misc-v2-0-dc7b42586c04@nvidia.com>
In-Reply-To: <20251216-nova-misc-v2-0-dc7b42586c04@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY1PR01CA0200.jpnprd01.prod.outlook.com (2603:1096:403::30)
 To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: 617ac1cf-415c-4b87-5b16-08de3c5b7334
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cFJ4eDNyaG5nWm1rTmF0NUZJOXp3N0UvT2FJak8xeFBRR2pYS1BHVkJWWVlL?=
 =?utf-8?B?cU0xQy9ORENjek0yQXZhdnE2UHF2cGxkSEFNU0U5clEzV3lHR0J6T3htc0NL?=
 =?utf-8?B?YXNFdWx3NVdjcGhjYXJiUDhmanNMWWVLUzI4aWFpSGE4bkl4RHZ2NmhNalY5?=
 =?utf-8?B?Tmx1dUhHNTdYNU1IVjVlTXgvU28zL0loRnNPVlVXWU43c1pscTM0cHVFTU96?=
 =?utf-8?B?ZnprL21nNmRnSFBDTlhHQnhrV3hSOERNRXhQOHZwM0g5NHRQVUlCTm9DZ1FU?=
 =?utf-8?B?ZEllVVdONVZvb29zQUdwUjRCOVM5RVI0MzBOYnhpRUovbkIwTnljNmQxaUEz?=
 =?utf-8?B?YnFHdlhWeDUrQ2NMNmM4ZFlqbmNONU9EYXNFWWFiK2hQRjdxYkx4aXk2aG83?=
 =?utf-8?B?dVJyTHBPd1pYRW5vK0ZmNG5iOTRlN0UwL3RxVHNyQlBOWk9RVk9KQjNzWWM2?=
 =?utf-8?B?QjJhUi9OK25xanBSMGxCdnc2dmdHdkVqdEhLMVdWL3NQdjJUOVlydWFTS09L?=
 =?utf-8?B?RkJCRHZKQW93M2xWWHdZK0RqUExoRUJ2REhGa0ZSV2IxQ0lMc3paZncrakox?=
 =?utf-8?B?UkFhRmhjb1hFdjdQVGlkd0MwVVo1Vm9ZRk96eHBHZ28xaUtTRlg5bkJPOXU1?=
 =?utf-8?B?Vy9lWWJibVpyZm82cGU0bWNkSG1XZW5Na0RGeFJEQ2hHcjdrZkVZR1JFQW1M?=
 =?utf-8?B?bkNhMkllQWg0ZElZci9QbmtxRG0yd2ovZmRpdkM5T2ZVcjFLeVVXSnZZcmVL?=
 =?utf-8?B?MXBvS0k0NGZmT3JZRHpkTnZ2NCt3NW14M0pmNnE0a2pYYnhZT3pCNUY2QlNr?=
 =?utf-8?B?WjB5ekxsb0NqRlZvN2dqNnFzUmg5ZXl5U3hvSUQ1dFB2em9ubE5jZEZRcXlF?=
 =?utf-8?B?OWQ1bm9WVWZzM0FUVXdWeFUxSXU3V3E5ZVRaTkMzbTlOakgvQ0lrTjVZeWp2?=
 =?utf-8?B?aXBRemJpZlhpYnpZcmJHN1drYXdrZ1l5WmtQV0xsc2xoREdoczd5K1N0R20w?=
 =?utf-8?B?ZkZvMFE2SkQrVHhGTDkxR3g5cWtXcE5vODVPeS92cW1YVVh3T3dmVlowdDNC?=
 =?utf-8?B?RGVoR05GUlJIMjcyRWZSNUoxbUpjcjlZN3FuK0hjZ2R6QnVZSjg0TEhJaWI0?=
 =?utf-8?B?SUQ3YURYazFuZG9maUNnc21VYmlraVN4T2IvaFFjblR5TW50YUhkMDF5YlV1?=
 =?utf-8?B?Y0p0UG14ZjhNb2NSWjBJM0Y5cURpbHNTWUtYU1RqNFRjTGdxZHArd2dIcHNH?=
 =?utf-8?B?Tnlsd3IwREpUR1hiWFBsMkcxU1dCTlBOdUNjSnE1RUZlOUgwNTZmSHpmTzd4?=
 =?utf-8?B?VTBOS3RubCtINHQvS2ptdXhkY3lvSEg2RjJLUFZKZTNSb0NCM093OFlBdnlZ?=
 =?utf-8?B?Tk9Ub3lrdG5qZUg2YUE1NzVhVmZmTXZrWUxIN0xCTmxKRXVtWGZGcDdRT1BQ?=
 =?utf-8?B?NTFJZHY4dEtXQ3YxWitTcmVPQlA2L2VUdWVpUEtIWWdyb0lOSlZVQkdiZTVk?=
 =?utf-8?B?dXdkQmJtM3VXcE1BbnJwWmdTTVVxbWZCSmRQWENMZXprREZiWWpPd0dycjNh?=
 =?utf-8?B?WTVKc3lBV1lKdEJCWUh5a1dXQnpIbC95RHM5SlVoR01kWTR4VFFzM3lNOXVI?=
 =?utf-8?B?aTR1MGp0V1NsODNDdWVjNzNIRU1QSGFDZEZLQy8yc1BzZlBSd2F6dis5V1E2?=
 =?utf-8?B?djBSM1dLbENGU2t1QlUyZjBib1JOeE90RVZPM0RMbXFyYWo0SWdTRGY4QmRh?=
 =?utf-8?B?ZE5CbzR4ampsU3NUeTZYTW4wdHd5QUVhY2RqM0JRRFdwM29QbENYMVcrbXpn?=
 =?utf-8?B?N0lBNlk3cnVkOVUzNWFZSHNhZjkzMTBJcFdobkxFRUFiczhBMXpiS3VhWW1x?=
 =?utf-8?B?eGZUQmRQU0JCNUd5WVYwb1RrRUpSSFplcnhlcGdlNTl3MW4wL0JreGEwY3E2?=
 =?utf-8?Q?2sKmRJop9BIpbcShSpYodCZsrqzP88ne?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzZLa3U0K3RnSWJMaDlHRlFMdDJQN2ppS0FvSTVndXphb01XYm0vUnR0Zyt4?=
 =?utf-8?B?SC9LdE1JUEhUUm1CZ0FsdHNpVERJSUZ1UVd0d3VzQzlkUThGY0RXMzBZclY4?=
 =?utf-8?B?cGQ0cHZ4ZFJ5TjVPOW9NL1hyN2V5ZkpyMldzMHkrZkEzR3lkUGRscmtTTGs2?=
 =?utf-8?B?THE2aFp4cUR3amI2bE1uamE5Rm1FYisyc0plZVA4czQ1TFVBL1hWTFhQeEVy?=
 =?utf-8?B?bktyM3lJL1Y3RittcG44M2xYUHB6ejF4RzN5Z2hoTWRUeENSOVBvWTFUT0JT?=
 =?utf-8?B?ZU96SjVtVG9ETDl6M2U3K2JSOTVDWmdNRXdTTVhuS1ptRzg5SXdaUU1qUjU3?=
 =?utf-8?B?NGdxYUh0OEhsVzllU1E2SjBMUUVHUjJmcHNpTS9ITlppeDVIUmVMeHJGdHdx?=
 =?utf-8?B?eXpLMnZicys2UzVLaTA1RTFHTTBjMWhzN2taOGRkTnAwZGRpTkhFWlIrdXhl?=
 =?utf-8?B?UVNDNXVzUW82TFlZWlJFOXN3MHB6OVBsKzR4UGdaY2VVVmZtZnliNERNTksw?=
 =?utf-8?B?ZUpHNGlZS3dzak84dmtSdHpkTVI4OFlUazJhL1Z4MFJSS3pZM242WXE3RDFV?=
 =?utf-8?B?U1pKRlFTaDBHSjkrUnhQeTFrd1dnUTlxNW5adFFOZWtEZFNrdG5VRnlEdDcx?=
 =?utf-8?B?eTY0NDdPUFJrL3NnREZmbkVFamZtV3FWQnljcE5ibTNzZ0hpL0RkZk5TVFpo?=
 =?utf-8?B?a0RwUWZ5MlpKZmRKNjlGNzFtK2NJWGM5c1FjdjRVWHlDR1doYnlZOXg4aXNN?=
 =?utf-8?B?dkRlZkg2ZEFQWjN1VmU0b1RYQ1ZERThPV2lITzNrd1BzWnh6cEFDTnB1TVRR?=
 =?utf-8?B?Mjh5NzVTUDNvcUl6N1BycTZ3d25UZDQrRDRXRG01ZU9CYjduSktNZlFpV3V6?=
 =?utf-8?B?K0VuZjNiQVMwTTVNVno3NlRSalc5V2xKU1FySjcvenVRZC9oSmVuK3U5ZEQ5?=
 =?utf-8?B?TmJVOVFRclZOTTNSU29JU1NFa084aE1oN1FuVnhtZUJHZW14ZlVQZ0NoOHFZ?=
 =?utf-8?B?NGZ6ZlVWa1RxMHFHYWJMNVE0YkIvNFZVTXVudk1zWDhrekhwTHoxWG9xRUE5?=
 =?utf-8?B?eENZNk1qR2cyMEdIV1VUQm1XZDZzSHlUaExPdS9ZWXNrTzRGMDVadjU2YWhD?=
 =?utf-8?B?dnFaMjZQWGdJRkNrTVJyMm8wSkhHdkswZXhqNnBiOTlJcUlmOXBZaUFjQllV?=
 =?utf-8?B?UGJ0eDlFM0FSZFdBbUdnQ05NS1A5TjYzT3VKQmwvcEo2TmkwV2JUY0dpOFFp?=
 =?utf-8?B?bFdpSDNqU2MvVkVIaUx1elhjN1VhTkRSNHc0QTViejVaS1BtNG1DaVFZMEI2?=
 =?utf-8?B?OFpIL3cwbGRoQ0xETTZWb1IzVnZ6cExhYlpDUFYvNmRnNzRDQW15UkFsZWZq?=
 =?utf-8?B?UXR4eWlRSmpBMStvQ3hrL3VoaDRZVVdnOG5uVnZLZ0I5bXVzU3RpYTloSzNy?=
 =?utf-8?B?Z1Z2UFNYejVBZVhHcE41U1pFTVBRUDhYL24zdlhmb0U5bXVBQlpTdkViMWFK?=
 =?utf-8?B?bVV5Y0N5Y1FUb2ZibDQzN0xkeG1vRFlkNkVKZXk3Nk8xcVhXUzVXM0RSZEFM?=
 =?utf-8?B?ejJ3RW5SZnI2K0o0Y2dQZGZ1TXdhV0NQazhqWU5mcUM1WTJ6NFRHS2FJb05C?=
 =?utf-8?B?WjkvdUwrWW0wUDE0WTJSNmdLSHp4d21LR0VGbXVrVkt4VTRWZTlaTytqWTYr?=
 =?utf-8?B?dzd5QUZ3eHExZWZLM2w4MzVsTUIwVG5UTGppcERQTzh0RE9aUHlua2pFOFlG?=
 =?utf-8?B?c1dHeVZnaENuY0Y5QWVpMHBaWkl3NnltWG8yKys4YnpyaEtnOVhXbEtLalBF?=
 =?utf-8?B?R1V1ZU1ITWh2WkZlR3FTbTRJWWRCSk1FK1o5RVZITWNNTG81OC9YS3I4S3gy?=
 =?utf-8?B?NCtKcjNrRUJBNUJVeG4rdW9VZFNZZ2k5QU50THcrUHNTUWVwR01XY0NzR2V6?=
 =?utf-8?B?TWovdWpkWmIydURIZjMyeXNhRHE4Rzc5T1Z0RTlMaVhMcm45NmNJVE8rV3Y2?=
 =?utf-8?B?R281c0txd3VpQ1dUSXZMQTd2WnlYRm1qRkpaWG42K2JkUUR2bGtjNjRlemNU?=
 =?utf-8?B?aUI0bFU2RmFXT0pwdlFQM3pIWG55ZFJjY1laNTZzdlIvUmlNOVo2MmRhV2Zt?=
 =?utf-8?B?WHkrcG8xY2J2YkZTeEZ3OFdzR1FrMHhpL1U5WHI5aDRDUzFGTHJENCtCa3BR?=
 =?utf-8?Q?OluJvmBJ5isCHwPZXiqnMNHeL+COxFLGqx0weKL9AQlJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 617ac1cf-415c-4b87-5b16-08de3c5b7334
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 04:27:40.7084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WGNbzfZZ2upROry0E4yidZFEpURJ93kDI3hlu/mfWDtuKCLkv1JAyeGWjTJPjCzFbXD3/EoHr5ZOFTfQSS8KaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8754
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

The `GspSeqCmdRunner` trait is never used as we never call the `run`
methods from generic code. Remove it.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/sequencer.rs | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index 2d0369c49092..4efa048b9d93 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -147,12 +147,7 @@ pub(crate) struct GspSequencer<'a> {
     dev: ARef<device::Device>,
 }
 
-/// Trait for running sequencer commands.
-pub(crate) trait GspSeqCmdRunner {
-    fn run(&self, sequencer: &GspSequencer<'_>) -> Result;
-}
-
-impl GspSeqCmdRunner for fw::RegWritePayload {
+impl fw::RegWritePayload {
     fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
         let addr = usize::from_safe_cast(self.addr());
 
@@ -160,7 +155,7 @@ fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
     }
 }
 
-impl GspSeqCmdRunner for fw::RegModifyPayload {
+impl fw::RegModifyPayload {
     fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
         let addr = usize::from_safe_cast(self.addr());
 
@@ -172,7 +167,7 @@ fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
     }
 }
 
-impl GspSeqCmdRunner for fw::RegPollPayload {
+impl fw::RegPollPayload {
     fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
         let addr = usize::from_safe_cast(self.addr());
 
@@ -197,14 +192,14 @@ fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
     }
 }
 
-impl GspSeqCmdRunner for fw::DelayUsPayload {
+impl fw::DelayUsPayload {
     fn run(&self, _sequencer: &GspSequencer<'_>) -> Result {
         fsleep(Delta::from_micros(i64::from(self.val())));
         Ok(())
     }
 }
 
-impl GspSeqCmdRunner for fw::RegStorePayload {
+impl fw::RegStorePayload {
     fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
         let addr = usize::from_safe_cast(self.addr());
 
@@ -212,7 +207,7 @@ fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
     }
 }
 
-impl GspSeqCmdRunner for GspSeqCmd {
+impl GspSeqCmd {
     fn run(&self, seq: &GspSequencer<'_>) -> Result {
         match self {
             GspSeqCmd::RegWrite(cmd) => cmd.run(seq),

-- 
2.52.0

