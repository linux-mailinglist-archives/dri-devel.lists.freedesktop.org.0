Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E226B56170
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 16:12:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 367DE10E201;
	Sat, 13 Sep 2025 14:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QzW19uwD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E66E310E200;
 Sat, 13 Sep 2025 14:12:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hRq13M3LVWmrIlPdZtjuHgr2eUymgaEdbL+tDalPgpA52oeAX0uOQFQpcsok1HGX2Lv5vWX0MD2GXJBW9+NWKLjj/9CwgeP1nFXgGUthluCbIJYnMMgkrl58RcblqNUQy6NbJoQIvb/sZgnywN1BM7DEmy9gdY05PRUS9Co33MTI4R9Yje7/+nteYxkN5iz+DUXYw3g+2+3XP+xUOASwkeJeSsG8kx0Dcg0ibyFoPKoqNUPBt+xm3ac62lsdNlRAi8qgebB/lDto8h57gIUzABf9dLE8M/SQi5uk9iDQ7L5bFDYUmBpdg8ZgSte2j3yDbjH1EhUQj2rrqeocR1NbXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PbmQECNgkB45qPm/64VKevzlchVeT9mHL8QC+SknfsM=;
 b=JxA4VoOyqwWyfjMAqn+LBhI7cBI3IR5M1M+6Yd4H552hJ0gvJ9YbiyFFoqESXv6ASe7KHQMnTRUEcCyVyYfxq2HaekCoDCYiDd2d7yU8aj9S/U+rM2XQGfQ+Nu4ZGrcYZyFiaALXJVXkIY9sn8iuYwzEy6t8C4yiOEoXN91YKv68ZPN4Hg+UGAcK4+K+gMNjN8JG5nLAIDbthtWQ98rz/yBmnLr67h/0RRjwQbOKcT+QkhHH8xRkx4lrC3s9Nq5p4FONogctycnWlU64Wre0KXGm18B06ibhwZ7SmAc04rYjmMOLrQn3H/aKWWiTrhua6Dot/YgEzhC7F2USNPDlJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PbmQECNgkB45qPm/64VKevzlchVeT9mHL8QC+SknfsM=;
 b=QzW19uwDZOsUHIBZCOxrRpGtWrkx5ktIH56tcKJzXqx9VnZ/IfIO4DY0o9HYsVTaBHjcUu6VLyYfUVHadlFaFRSv1Kp4pUB7dI8RaNFJEHyrKKpru8AKkGNq57YOrX/DCPrcxGBOdGdOvFTcbodkbkB7BbpB1oKX39vOEaKs46lbrTnKC5ooATF96SA91bz3zENYgFgg8LuQdG+gknWzPQi4+6R7QMqF7U3ncYHH9Qz8SR6KAEDTECyn3hqe2Tq8BhVdYQNkmkHUQ44by+3LbJK6o5mHIhjwndA8Cshl/nroMwVChiF/girFkm+ouJGHLkWLq+xJjDvo41VAG7j6XQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY1PR12MB9583.namprd12.prod.outlook.com (2603:10b6:930:fe::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Sat, 13 Sep
 2025 14:12:49 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Sat, 13 Sep 2025
 14:12:49 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 13 Sep 2025 23:12:21 +0900
Subject: [PATCH v6 08/11] gpu: nova-core: firmware: process the GSP bootloader
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250913-nova_firmware-v6-8-9007079548b0@nvidia.com>
References: <20250913-nova_firmware-v6-0-9007079548b0@nvidia.com>
In-Reply-To: <20250913-nova_firmware-v6-0-9007079548b0@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0305.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY1PR12MB9583:EE_
X-MS-Office365-Filtering-Correlation-Id: d1635cec-0cf4-4f4c-07f4-08ddf2cf9e90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TktTb29jWGhydEYvQzhHMmhDVlVRNDhuQU9IcUNWa3JFemp5aTdHdFRHSmlq?=
 =?utf-8?B?NUxUU05uMnl5RmJRUVY5Mno2VGF2ekIxVWFra1FVYWE4cjZWTzVBeXdaZkJF?=
 =?utf-8?B?U2t5ZnVkK3RjY3BYa2hxQWRhMjBGOHRsK1ZtV1doWmE5NWxIOU9BUlVDZXdr?=
 =?utf-8?B?KzNSTXdJM0p6b2xicFZEbFYyUzVEQi82eWk3R24xM2VnTTdBQ3hFYkZIeHFG?=
 =?utf-8?B?T2lJRHhnVWIwTHJhT2doK3VWWUJJVHVmSGJoK2wrdFFPVEh2a3owRzMySWZU?=
 =?utf-8?B?YlNzT0p3dWh6a2ZFeUhqeWQrcXVHWEhoNm9neXhtdENBQVIxWUp2bFp1dWxI?=
 =?utf-8?B?Znl4NkY5bmZ6TWVCd2o1VGlGdnlBUkQxZDREYTRubzY5T3VMMUFJNWxDenFM?=
 =?utf-8?B?Njk1cDd0T0ppTFQ5MVZKeHNSMFFyUDI1dmw4UysvWmJwWSt0bW10WnlpYnQ2?=
 =?utf-8?B?QXdXeVhzN1pjMTVrZXlpSmlNeDQ5dmhFS05NcWNFRGtuSnBzZzF0elRHTitC?=
 =?utf-8?B?SmQ0aWdYaVlaUW13TmI0MDdWeVc4ZXNqNmRJY0IvbzAzc0Y3UE1PVk1jRUFj?=
 =?utf-8?B?aEJ0RjJRTTNpZHh1TzdtTnlocXVxZjdab3JCZ1lRSGxNVHRXc3JrMEJudGFH?=
 =?utf-8?B?YjVRWnA0ay9TOUhOV1pYVlJwUUtmTUpyNHBhTWlkTmY4SzQ5NUhoZ1VEL01F?=
 =?utf-8?B?OHIyYjMwdVp3U0QrakNkaml1RS9jeUNya0ptMUpFVTZEeHdXYkNxYmNjQ3pk?=
 =?utf-8?B?YTBEOFY4K2NTOU5WSW1MYVlaSUE1YWYwQjNTQWVZelRqSVdNUkliUHpraUdV?=
 =?utf-8?B?cnNwMUs0ck05WGpnc0ZrM1MxTEpkUm45cVZ2ay92dU0rRUIwTmFFWDdKQldZ?=
 =?utf-8?B?bG1kVWhYdzFSclJRc1h2SVlRZFdFb3VoSUhFMW0xTDdXUFpWUU5aTkZtWnB3?=
 =?utf-8?B?bHZyb3hsMUxxSFNraVdHVk9qZFUxbll2QURRYWZGVG9PemVVb3A0bElvbXg1?=
 =?utf-8?B?U1k2Z0xTcVFLWEVNWHA3SGxZN1hDQnhWUXE3OHV0RW1YSmZCWFVSd3d1Ym9E?=
 =?utf-8?B?eUp0SlRvVFFRYXN2aXlYRWxmNVN6KzlQblVsTDFrRFZTTlEzMlB0TzBwamRo?=
 =?utf-8?B?MnJFNCtjMWhKRkx3ZGhkU1h6aFpmU3ErYitPbEdpeTJCUU5KeHF1dDVUdzFC?=
 =?utf-8?B?MGk0bzg5aitUcnJVNDBkbnBSVmtLNU1rdVVmSkVQWWZYR2Q4TkVCeTRjaEZy?=
 =?utf-8?B?aG5pOTNBL3ozRmpYL2FCc1QyOTNtZGMyZEo4QVRkY2IxbWtSRnNiZVByUEFG?=
 =?utf-8?B?bWgvMTgxYWNkY2lZYm82dlNheGhhMmR5a21rVDVKOWZFUjJxNXFBVnZ0NnlW?=
 =?utf-8?B?K1VNRWIxYjgvd2I3YmFXSnlNRzc4a1pDMFY4QjNrMkY2SC9FbHorY0JvTjVk?=
 =?utf-8?B?OHRhUXM0SkV4Y2dKeDZmNjJseGJGZEpSRU1SeXYyMnVGaHdBdFdlYlVhMUFK?=
 =?utf-8?B?SlZ6NUtLeWpZbFhvUGV5am5ITDhQUzA1OUxFeFl2UDRDZi82WUg5Nkp1aXZS?=
 =?utf-8?B?MkV3VkQzT05yYXhRb1FIWHVObjRuV3VzN2ExTXl6NWozUDVtMDNWL3cwWE9F?=
 =?utf-8?B?MjVHb0ZjSTVrYnJDTGs4VG1pMGlsdzFweFV0UnhkR2hicXozNjBMOXFOV09X?=
 =?utf-8?B?OUphV3VSNldHL0h0ZVcrb2ZRWFZRcjZIdHlNc1lKUVFleWptUHBRWGNhWmZL?=
 =?utf-8?B?cWJVbW9GdGFORG43WXQzb1BLRHg1MkhtOXltS0FpeDl4ZWZqRjFuK3Z4Z1VC?=
 =?utf-8?B?bGJnMXVNQVVHUmtHNXdOVXVTd0NZK3N4N0FLKzRqbU1ZM255SUFIdU9YV3Ro?=
 =?utf-8?B?dDZxSFZFODhBTjN4QTJvWnYxMlk5ZHNQTE5DT3Z0bGlUS0VvOUJWdlVwZWtu?=
 =?utf-8?B?VFY1TWl4cCthaHRxTWQ4OW5DZDBKVHBUK1A3KzVFUG1GK1UzLzNGOHFzMGpv?=
 =?utf-8?B?Rkd6WTJVRkNRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2VvU25oYVA4OWVEb21obEltajUyQkwraWwxRGovVlJ5VXNFWXA2Ym83aXFJ?=
 =?utf-8?B?QS9kbXRXNnFqa09HLzBiWkFTb1pQbGN3TzZsTXBjTzR2Mng3UFgxYnQ0VVpv?=
 =?utf-8?B?eWpwYm1rUGo4YTJQZFZuUVhDbEhKQlRHWWhzdkltZ1BkalFGOTJXUG4yUlJI?=
 =?utf-8?B?RHlwOUdGYlB0YmN3WnZvNy9YSmZ4RzZ5YzlNTzRmeGtKaGZqWUJVVzF3V1lk?=
 =?utf-8?B?S1JoT0U0anpISHoxdkFNanJvRXR5SmZjRHZ0aEZNSW5FNDNyS2RkL1IrSDVI?=
 =?utf-8?B?aUJMWFlhQXJFemJQVmZpWVpzOTlqSllEZzZrT2JwRUNIbWl2VTZRZGJULytJ?=
 =?utf-8?B?Q3hUcWg4Q2RIVElCRERaWXVJQ0FYU1QrRVNYTkEzTHQyV1ZYdnh4N2FKcWQx?=
 =?utf-8?B?Z1ovNlVkRHBKN1FNT25XS093aG83d2ZmMHpIdFBKQkpyRzBFZkc2bVNYY2Vw?=
 =?utf-8?B?djFoL3VRbmtJSVNwTDlOOWg1V2FCMk9WUlluNGU2QU5Qd2xoNnhqdkV1aTFX?=
 =?utf-8?B?d2ttWksxT0VNeit1Zm41NG9neks2UEVMR0Q2SW5Hc2M4V00wcnpKQ0lYczUv?=
 =?utf-8?B?d0szUngrOG00b3FyeGJRb0RSaUI5cS9ONXdkSmNCR3Z3enZMT3g1a0ZIV3M0?=
 =?utf-8?B?OGtGd0RvdU02c25mTEpSaVFld1VUd292WjNyaU1mSkF4T25xUCtKSjZJVHRs?=
 =?utf-8?B?TWltMldWZk5OUjhKSGwwZVZCQlBmb0tUKy9HbGVTSkJFZFpMSi9pdWFoZG1V?=
 =?utf-8?B?TGp2V2c2TGp0ZEtES0xpU25HM1k1QU5aWUt6UE4wRzc4MVU0MUFsb2pyNU8y?=
 =?utf-8?B?TVdHdWozSTNJYXMwbjVyVmlYZkF2akp0czNJa2tHZlNzRmJXZGE4VkNKOVpF?=
 =?utf-8?B?Sm90aEc3U1BXeHl6RXZJazVoVU1LZGYxVUl0ZnZtb2NGU0xMU2xPdU5BamNS?=
 =?utf-8?B?Z1l3RW5GS1hvZmtiV1FLQzZ4bVcrQ2FRQlFSSmhiK1l2MjlUQVl0VUxjUXpt?=
 =?utf-8?B?NTQ3Q1pVWjhCM21tcTRkWlV5c09vSFlLL2tYWWhwMTRuZFB3UVZYN3Q3Rklv?=
 =?utf-8?B?b2o1Qlg2b3dxOEZHVC85aExQbEl4T0R1TjdhbWlFWE5CRWVqMktNbzA3bjF3?=
 =?utf-8?B?SWFiN0Z0Z1hVejdzYzJFU2R5b09ndURmV2lqcUJYb3E2V0VHMC9nY2U5dXcv?=
 =?utf-8?B?aTlaKy9zdEFzVWkrMHd0Y2tPT0Z3Nlk1QW9meE00Y2FjakxCQUloQzNVdXo2?=
 =?utf-8?B?V0gzNDBaS1lFTkhOUVdvR0w1cFJKR21UOEg3K09YUlRKaURPRkF6cU55WnpN?=
 =?utf-8?B?N01pRUJ3aFNaeUVDRzlORDBnU0NTUjJYbU16S3o4RnNqaWFRNm83ck9Bcmx0?=
 =?utf-8?B?SUZ3b01nOTYwbVpMZXVvUENYYmNLRlZXaGJnTFAzdzBkQk1iNzV0TUVMWkli?=
 =?utf-8?B?OG9Idm16cGdzMmZqbm9mM3ZmMkZlVGd3RDJVYXNRNkxFVmdTM3Fhc0RkU2RC?=
 =?utf-8?B?ODd0Y0IrY2NCcHV3VFB4NUh0TzZhcVMvRmxyaDdCRzdDV2wrTjhncGgvdU8r?=
 =?utf-8?B?d1NnTmtTOWo2YlEyS2g0QmxsVE1jN3RLR25XWFlMZ3BRaThWY2FUR1dOc2Zp?=
 =?utf-8?B?YzRjY0kvTTBPWnZrUHRoWFhlenQwb0grUGEyTVNUQXJaR2pQU3JpRUlEU3lr?=
 =?utf-8?B?T2lUc21RUkFSMzRmUHlwNUozU3U0Tncwdi84cUVnc2xnMmJlTVFsZFBOdnN5?=
 =?utf-8?B?aGRzRTVSeG52NmtKRDgxY1VQRkZjNjlpeXpPN1JLUkhiQkNJYWpkdzdFbkV1?=
 =?utf-8?B?WXk2eHRadmdPTS9Zc1BMZlIwNkhpSnpOMVUxalpsS0YzRWhWQ3ZZckRFZnVE?=
 =?utf-8?B?K3JYTFQzSHU2NzFJRFlGNk8xNU5BcWc0RE1ZK2JDaVd0UWxQeVo5QXF3Y2Zh?=
 =?utf-8?B?Y1I0MCs3Q3FJQ1hJbHdNUEc3djVkdDJSSW5Na3l6ZGRWd2NZZGNsWHQ2NS93?=
 =?utf-8?B?RlZzYnlJNThSd245bjh2U0MrZGFVQ253WXpTdUc4LzRreG5NUEQraFdjVGw2?=
 =?utf-8?B?TnZUSlQyc01VTS8vTFkyOXJTSjlHbUxqRXlBc1NUbVFvYkdDSDREZ2xtZW01?=
 =?utf-8?B?aEplS255Y2hVRHhEMmdQeGRhY3Q0SjFDQjJPY2xSZ29GWTZzRGFlcjg0dkto?=
 =?utf-8?Q?goYa9wvNtRe1TEZPQlKuhgn3mso4b+dSRdGMxjI9ZXjh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1635cec-0cf4-4f4c-07f4-08ddf2cf9e90
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2025 14:12:49.0251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TtwuO4Awsvzy7+VJI0dVCQWGOWcIVYm/FDiY46YyKNqjq1AFKSSbuCKt/l92BLlXY1mmaQnz0Mh+ZOvjfe6iTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9583
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

The GSP bootloader is a small RISC-V firmware that is loaded by Booter
onto the GSP core and is in charge of loading, validating, and starting
the actual GSP firmware.

It is a regular binary firmware file containing a specific header.
Create a type holding the DMA-mapped firmware as well as useful
information extracted from the header, and hook it into our firmware
structure for later use.

The GSP bootloader is stored into the `GspFirmware` structure, since it
is part of the GSP firmware package. This makes the `Firmware` structure
empty, so remove it.

Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs       | 18 +------
 drivers/gpu/nova-core/firmware/gsp.rs   |  7 +++
 drivers/gpu/nova-core/firmware/riscv.rs | 91 +++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs            |  4 --
 4 files changed, 99 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 10200d11bbbfebd5abc05f2b03151ff0614fb5a6..dc9645a789b0b542ebd1adb4a8c19ba089bbc931 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -15,11 +15,11 @@
 use crate::dma::DmaObject;
 use crate::falcon::FalconFirmware;
 use crate::gpu;
-use crate::gpu::Chipset;
 
 pub(crate) mod booter;
 pub(crate) mod fwsec;
 pub(crate) mod gsp;
+pub(crate) mod riscv;
 
 pub(crate) const FIRMWARE_VERSION: &str = "535.113.01";
 
@@ -36,22 +36,6 @@ fn request_firmware(
         .and_then(|path| firmware::Firmware::request(&path, dev))
 }
 
-/// Structure encapsulating the firmware blobs required for the GPU to operate.
-#[expect(dead_code)]
-pub(crate) struct Firmware {
-    bootloader: firmware::Firmware,
-}
-
-impl Firmware {
-    pub(crate) fn new(dev: &device::Device, chipset: Chipset, ver: &str) -> Result<Firmware> {
-        let request = |name| request_firmware(dev, chipset, name, ver);
-
-        Ok(Firmware {
-            bootloader: request("bootloader")?,
-        })
-    }
-}
-
 /// Structure used to describe some firmwares, notably FWSEC-FRTS.
 #[repr(C)]
 #[derive(Debug, Clone)]
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index a7eda9ca0d2193c944060bdb04f6fba520def01c..9b70095434c61f30927463d0c869fbd666e7ef7a 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -9,6 +9,7 @@
 use kernel::scatterlist::{Owned, SGTable};
 
 use crate::dma::DmaObject;
+use crate::firmware::riscv::RiscvFirmware;
 use crate::gpu::{Architecture, Chipset};
 use crate::gsp::GSP_PAGE_SIZE;
 
@@ -131,6 +132,8 @@ pub(crate) struct GspFirmware {
     size: usize,
     /// Device-mapped GSP signatures matching the GPU's [`Chipset`].
     signatures: DmaObject,
+    /// GSP bootloader, verifies the GSP firmware before loading and running it.
+    bootloader: RiscvFirmware,
 }
 
 impl GspFirmware {
@@ -164,6 +167,9 @@ pub(crate) fn new<'a, 'b>(
             })
             .map_err(|_| ENOMEM)?;
 
+        let bl = super::request_firmware(dev, chipset, "bootloader", ver)?;
+        let bootloader = RiscvFirmware::new(dev, &bl)?;
+
         Ok(try_pin_init!(Self {
             fw <- SGTable::new(dev, fw_vvec, DataDirection::ToDevice, GFP_KERNEL),
             level2 <- {
@@ -206,6 +212,7 @@ pub(crate) fn new<'a, 'b>(
             },
             size,
             signatures,
+            bootloader,
         }))
     }
 
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
new file mode 100644
index 0000000000000000000000000000000000000000..afb08f5bc4ba87a30a8200706391426bda85ff50
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Support for firmware binaries designed to run on a RISC-V core. Such firmwares files have a
+//! dedicated header.
+
+use core::mem::size_of;
+
+use kernel::device;
+use kernel::firmware::Firmware;
+use kernel::prelude::*;
+use kernel::transmute::FromBytes;
+
+use crate::dma::DmaObject;
+use crate::firmware::BinFirmware;
+
+/// Descriptor for microcode running on a RISC-V core.
+#[repr(C)]
+#[derive(Debug)]
+struct RmRiscvUCodeDesc {
+    version: u32,
+    bootloader_offset: u32,
+    bootloader_size: u32,
+    bootloader_param_offset: u32,
+    bootloader_param_size: u32,
+    riscv_elf_offset: u32,
+    riscv_elf_size: u32,
+    app_version: u32,
+    manifest_offset: u32,
+    manifest_size: u32,
+    monitor_data_offset: u32,
+    monitor_data_size: u32,
+    monitor_code_offset: u32,
+    monitor_code_size: u32,
+}
+
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for RmRiscvUCodeDesc {}
+
+impl RmRiscvUCodeDesc {
+    /// Interprets the header of `bin_fw` as a [`RmRiscvUCodeDesc`] and returns it.
+    ///
+    /// Fails if the header pointed at by `bin_fw` is not within the bounds of the firmware image.
+    fn new(bin_fw: &BinFirmware<'_>) -> Result<Self> {
+        let offset = bin_fw.hdr.header_offset as usize;
+
+        bin_fw
+            .fw
+            .get(offset..offset + size_of::<Self>())
+            .and_then(Self::from_bytes_copy)
+            .ok_or(EINVAL)
+    }
+}
+
+/// A parsed firmware for a RISC-V core, ready to be loaded and run.
+#[expect(unused)]
+pub(crate) struct RiscvFirmware {
+    /// Offset at which the code starts in the firmware image.
+    code_offset: u32,
+    /// Offset at which the data starts in the firmware image.
+    data_offset: u32,
+    /// Offset at which the manifest starts in the firmware image.
+    manifest_offset: u32,
+    /// Application version.
+    app_version: u32,
+    /// Device-mapped firmware image.
+    ucode: DmaObject,
+}
+
+impl RiscvFirmware {
+    /// Parses the RISC-V firmware image contained in `fw`.
+    pub(crate) fn new(dev: &device::Device<device::Bound>, fw: &Firmware) -> Result<Self> {
+        let bin_fw = BinFirmware::new(fw)?;
+
+        let riscv_desc = RmRiscvUCodeDesc::new(&bin_fw)?;
+
+        let ucode = {
+            let start = bin_fw.hdr.data_offset as usize;
+            let len = bin_fw.hdr.data_size as usize;
+
+            DmaObject::from_data(dev, fw.data().get(start..start + len).ok_or(EINVAL)?)?
+        };
+
+        Ok(Self {
+            ucode,
+            code_offset: riscv_desc.monitor_code_offset,
+            data_offset: riscv_desc.monitor_data_offset,
+            manifest_offset: riscv_desc.manifest_offset,
+            app_version: riscv_desc.app_version,
+        })
+    }
+}
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index d2395335727a1f7265df0a5703853cfcd2550965..5da9ad72648340ed988184737219b14771f31b7a 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -5,7 +5,6 @@
 use crate::driver::Bar0;
 use crate::falcon::{gsp::Gsp as GspFalcon, sec2::Sec2 as Sec2Falcon, Falcon};
 use crate::fb::SysmemFlush;
-use crate::firmware::{Firmware, FIRMWARE_VERSION};
 use crate::gfw;
 use crate::gsp::Gsp;
 use crate::regs;
@@ -175,7 +174,6 @@ pub(crate) struct Gpu {
     spec: Spec,
     /// MMIO mapping of PCI BAR 0
     bar: Arc<Devres<Bar0>>,
-    fw: Firmware,
     /// System memory page required for flushing all pending GPU-side memory writes done through
     /// PCIE into system memory, via sysmembar (A GPU-initiated HW memory-barrier operation).
     sysmem_flush: SysmemFlush,
@@ -211,8 +209,6 @@ pub(crate) fn new<'a>(
                     .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete"))?;
             },
 
-            fw <- Firmware::new(pdev.as_ref(), spec.chipset, FIRMWARE_VERSION)?,
-
             sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, spec.chipset)?,
 
             gsp_falcon: Falcon::new(

-- 
2.51.0

