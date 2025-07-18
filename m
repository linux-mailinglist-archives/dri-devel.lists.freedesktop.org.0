Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FB1B09C59
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 09:26:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7637B10E8E4;
	Fri, 18 Jul 2025 07:26:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aEUznRCG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296BE10E8E0;
 Fri, 18 Jul 2025 07:26:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4t7LjWjSn6Tm1ZAzRNvKJtf3N++lpqkesZl2yAEA7gnnvkR0pXl2KLsHP7ncJeR3/PJgooGVQ9Rurgn0aIgYU1bvGqLeoL5ESeiFkhnmgIEtFeMqAnvHPVTah24QiMCVVsPmRlrIbB8EsnaYck6hko/GJbB2c+xlLpALzDmY3WrnirGEqFN2SADxVIa5MlxeO6WIe3jZ0ckjQdmy9QgJ0Np7ACDCOrpFDiVphmh8cxNC1JfGd7Qx81qOud3YG02Q057HkrSbbjeXzHy9aD11NASeFSSt8yVF69NzEt0Z/MWGI4a4Tqc6zm41GxFUL5R769sq1wQick1tiObMan/RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YuI13+BUIrj0IA8Twbe7hIRsDHWyk70AwumtuTVmGsA=;
 b=VzzXKkd+kSwXD7g7x8L5LU3qUd1fwwfYUHUfJ5KzvkxYYIQ47RAUZ1H8wnIUKWrsFh54sOD5jZBVUZqHLsgBb/uBDI3lebOzNrlEMUX7Hp0NtqKwpLIHbRTcTAV6+ueYhYi8HnolroLQM3t0zu0TFVUF295Kg7IP1ozElopxP7b1ebRs64q609booLiNMsvwkv62W+pcZTmldEthowhknH/lx6sgKbufgIRRp2MmOYE6vQQa2UM3SHc0ZmZ948wEM8/BBIOHBGt4NM+ETHPbQVcbmBFNLQUxADCsKJVFzM3A7ccue7wsDyEXoUIX8FHubq9g39uz9xyIQK0Mk46/BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YuI13+BUIrj0IA8Twbe7hIRsDHWyk70AwumtuTVmGsA=;
 b=aEUznRCGOeC/ZeOXhUMC0KtQ385aTE4on3kU12HwY/wCr0tMFpsweg5GQTzOJYfEeK8VS7ozsxACfwd2J9K4IkD1Xyzz6nnYJSW+fmMjT2BsNIQqC02fGFN+kmOiUWnzIii+sH7n0yapSi8ebzVogZfflXlw5oA1fQR6D7LV0cpLVekozKMeji48byFEvL5EsHuvwRhRrR4b16CjNeUItslLhJ9U9QyY3XhStAlQ4Om9OSSaf2TF3EK0O5vo+z2XZa9j9GbbIGwVoEcLefNEI04x7rW2av67SUJI0yxO3MzPGUZeZAfKdy1UvpbLbff0MLA1esxsc7N+9HSsqX57Qw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4091.namprd12.prod.outlook.com (2603:10b6:5:222::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 07:26:22 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 07:26:22 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 18 Jul 2025 16:26:06 +0900
Subject: [PATCH v2 01/19] gpu: nova-core: register: minor grammar and
 spelling fixes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-nova-regs-v2-1-7b6a762aa1cd@nvidia.com>
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
In-Reply-To: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 John Hubbard <jhubbard@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0062.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4091:EE_
X-MS-Office365-Filtering-Correlation-Id: 54d9aead-7d4a-4cc7-46a1-08ddc5cc6519
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eG1PbTJOQnJVNFBlZlpUdldqTjRtUlczWGZsWkhiZGljWTUzcThHSWgrWXhn?=
 =?utf-8?B?YXQ5anpzRW8vNEFBdm1JTnN1dGVUd3RuZnl4VzVVbkhLOWJlQ25RR3E2UHgz?=
 =?utf-8?B?UXBQaVJDRzRwbGhLMEV3TlJZM1RidHBQVzM5NkI5UEY5dVN2Q0U2dkZGYUhT?=
 =?utf-8?B?UTMyZEpDYXd0elVGcUcyVm4yampncC91Yk1ZTVdieXo2eVAwZWk2Yld6NGI5?=
 =?utf-8?B?UnJaeUNVWjEzRHFud3NDVzFabGNkanRzSVdMTmp5MXdXWTg3YldrbnBrVktL?=
 =?utf-8?B?YjFpWHVkZTA1RXRKclpSamtYbkJoVGJQUTdWWmdWZy9MVGZBUWo2cURUSDEz?=
 =?utf-8?B?RHF6bldyR3JWU3FyK0l1Z2RWdHNHNlpYOWtURTFMZ3BCQVAycTZsa2hsb0l0?=
 =?utf-8?B?Z3Nvcm1xbGpiaW5mNGRMZUU3Uy8vcWVqNXhxVEl6VTdBQXdQbWliM2xZTnVS?=
 =?utf-8?B?aTlrZC9KVGVzNTE4cUlkTTRLMkVXYnd1S0N1UHJRYk5nVmJ2b0NuTEphYzBn?=
 =?utf-8?B?SFQ0ZG9SNVRuZXNpOFdJbUg2U2NNblY2MHg5d2M0NHdkNldvZHZvV01GVk5q?=
 =?utf-8?B?OE1RVDNCZFQ4TFVEdFpmMm5qKy9GVVVsWWVNL2NGZVdaL1lpMXNWK1oxamVF?=
 =?utf-8?B?L0x5VEdMa3lzeXZiRDUwMU1QSmtld1ZSY2FNQzVkN1JQNEFzWXlZRE8wQUgv?=
 =?utf-8?B?WDd5SHBzNlhjQTJ1dHF5emd4VjkvUFJSKzlzMkR6ajROWTlFNURLNWJ3RDRN?=
 =?utf-8?B?eGprZVVPQllVMU1xelVqVFJpbHVtMFUveHRmTlREVlpHSm9ubDRudFBHV2dk?=
 =?utf-8?B?VU5zNllXa054MllsL0RFQmlTQk9heFNiNzZYRis0bm55MHhaRENOSjJ5VllP?=
 =?utf-8?B?ZTJMelp2YUxjUlBndnFjUGdEOVpNZ2h2VnpYUGJmRVEvNlVZeTE2NWhya0wx?=
 =?utf-8?B?YVpJVzJqWWZXWmVLdWtEdGdHeEdmUzRibGw5aWx0TUNoK0pMZVVYYTdWWlN0?=
 =?utf-8?B?bE5RUkpsZWhUTnBGdklDS1B2UHlHVU5WbkdCTmkyVlJ1TjNjRzZKQmg1RHlo?=
 =?utf-8?B?Y0ZFNFhRUXZUOW05M0lZT3h0ZVk2ZWpmVGxkZ1Z6cWlTeWdCUnF1ZDBmeDBp?=
 =?utf-8?B?QnZMMFh5QVo5eFNvdlNMbUM5YzY3cDQ0Z2RtNDViS0ExUlgvczVFZ20zUVNN?=
 =?utf-8?B?b0pudkcxcUJ2Y0tBTDRPTGNHdEk4bnZHc2F1SzlydnZuWG1TMmVpVGt0QS94?=
 =?utf-8?B?VmJxdm1pMk5GdkZ0U3B6S1BZSFRyUEFvbnlVWUlYbUx5NnJ5ZFBNTGhLNjU0?=
 =?utf-8?B?QnNSM3VWc0hoZ1pMWjk3TnJzRjFBclVydy9JcUh0ZnJKeUdxcWU2aVh3YUN2?=
 =?utf-8?B?aDZPandzcjRlZUVGaC93VGZoVHdTdFp6OXFPTHdIM0xlQy9ORGRWc2hTbWtB?=
 =?utf-8?B?SzJyZUdzb1dPZEpYeWJCVnBJQSs2eVJiRWp3czRkeVkwbEFsMHZZRGdXVlBn?=
 =?utf-8?B?ZWp2LzBZQlJ1SC9ZcW40L21ORDI2ZFFBZjdWTWRDR3NrY1I5amNnREgrR2NW?=
 =?utf-8?B?bzd6ZmRQZS9OamVWazNTZ0FuQW9GeE43RjVWUEp1cVExYUFqMTI3Z2V6Uko0?=
 =?utf-8?B?bk0ycGVLeEdWNHZVVllmWmExS1RwVkNDN0o4V3FnNjFDUkxVL3lGUFpHSDYx?=
 =?utf-8?B?a1NjU2gxcXpLWUxEQ0xmZExYeWRhQ3RsN01sOUExWTdsSEdsSkJHeFpQcmsx?=
 =?utf-8?B?Nm1uWUVkbGY3Z0xzQWxFRjlCelZVa1dWalJXcUVjUnhrT3RFemxpTFA2Z0dZ?=
 =?utf-8?B?UlZYSDhUY1hJMUI2SkorTXpXb2xvanBzRjN4a2REQ2FVUGNMSndEVWRwUGZs?=
 =?utf-8?B?eHMwOGZjVndLYlh1Vk84OWI1NXRkRlcyeDFDaGFVWktoNXRIWkd5UTU0cloy?=
 =?utf-8?Q?IZXXDs2sskU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjVXd0xCaFVtcldxeG8vejBGTHBvNUltbVhxOEVGMUlta043bkVWcm9VNktn?=
 =?utf-8?B?aTJKMzljd250Wmwybm5XRWYxV2hyRDBvZmdud3BSQjJWdUo1VWZQNFBLR3J4?=
 =?utf-8?B?MXIxL05NRERxY0x4dnRPQW82UjRmUXRlT0JyZVdKcnVOTEZXekdwbkd6MXVz?=
 =?utf-8?B?ODJEMEFjejk0RVhtcE9OSGZKTVhkRnNrakx4NjF3WExKWXkvSWxNRGR3dDBG?=
 =?utf-8?B?UmM0K1VGcVNCMWFqNjV1YTBiNXR3NWdxZldsc3ZYZmV3ZXJObWV6UW5La1Rj?=
 =?utf-8?B?NkduQStkVG84TU9TdDc3Mm5qalV6WjhMcG4rZzc2cTlSVHg3SSt6cTBVeTZB?=
 =?utf-8?B?UkVYTEdvbFEya2FJTGVxYkZKQzdoNmZDcXlLUWh4SmU0QW5kZTNWazMrM2xt?=
 =?utf-8?B?UkJxVmdKdE0vdVd6eFN5VFAyYkQ0SWRsNUdldWtGRVdwS2FlV2Vnb3hHUGJK?=
 =?utf-8?B?bmxyS2pDbEFBQ2k4V0h0WE1ya0ZLZmpOTFkwT0JwZnJwYXQ4eGY0cnFUMU9k?=
 =?utf-8?B?bzhVc1djWnNKam9DaXJ3emszN3FjelI3c3RGZldXS3JLWEgwUDlEaGgxU3Fs?=
 =?utf-8?B?UGt2NTNSakFNMHVTck9ZcWttcTNpOHlxdFZTSXU2cEtwWEpwVkZUTTU3ckYy?=
 =?utf-8?B?Z0lNU2g0T2E4blgxQ2JsZnlnQ3RFT0ZzMW5COEhPRERldEV2Q2EwaWlPLzQy?=
 =?utf-8?B?eXpyZ2xUdSt3aEI0ek41SXJZOTlsWVFLMHlhQ1VGMERrT2FnRlNINWtaaThE?=
 =?utf-8?B?eVZ3aVRNSTMxSUkzL0VnMS80N3FBZUd2K0FBWW1PbnVjZlpWQjhpbWJPWXRr?=
 =?utf-8?B?U0lQQzZsQlNIbjFWMnN5RDFFejlLcDlPVXhOK0puNHNtd3Zad2NNK0JLWVFQ?=
 =?utf-8?B?UTh2NzROUDZtenQ1OSt4bTFUYnFPVTJDZzlnUmJZbzI0MUxmMTdFZUt0VlN0?=
 =?utf-8?B?d2RCaU5WKzVweDc1K0svRER0YW1yNUlkZkhhNWFxc1NIeXQxK1Fmd1YwTXlv?=
 =?utf-8?B?ZXdMamtId25hVWhZd3FqZ1VuWnJCTFdPK0RyV3BPNHk4cGoyRk93YnJnYnBw?=
 =?utf-8?B?cHd1N2gvT25UUGI1UEJYUy9rUDM5bmxmTFJyQ1d6NVd2dTFvc3JzYmdyV0RJ?=
 =?utf-8?B?L0JrOUVhMmtCcTFublFkOURJeHpENGcvc0kwTVpsQ2R4ZFJETDlJQXZaTlJm?=
 =?utf-8?B?WExIN1dndGRzdVpITENxVmRCMElGS0NpclI3QUlJQngyV3V5YnJ4NE9jQU1o?=
 =?utf-8?B?ejdvZm85YVRBODdoOHp2MEo0RDZ1bU1IbHJMU2dvazBSdlQ2UTk2a05MRWFY?=
 =?utf-8?B?eDFoZC9iUGIxc1dncTV6bFlxN3dJbEk4UFdnNmdhM1lEV3FwN1BUVUR3T0I1?=
 =?utf-8?B?WTUycDVkdml5ZXdQR2dWVTFYVktERmxzeHMvR21weFdlYlU0SzhaKzI4bVBy?=
 =?utf-8?B?U2pkejZ4VmJpSFZjTUNJSjYwbHN0eGE2Z251K2RpWXYrYkp4YksrNEZQaXFB?=
 =?utf-8?B?ajMzdHhGeDMrOHkzdGNYRmx2c3pvSG5meW9WRzdsWWlEQnZHMEhMQXFhQWpC?=
 =?utf-8?B?QW5ZSUpmS2E1YmtmNy9MZDM4UkhBRHNCUjFLeDlpUGExTjYxa0U5a0FoQ29B?=
 =?utf-8?B?Z0JjTm5CaU1CNlZFM3hpZU8xeWxpYkpBTTd4MkJTazRqV2I0Q2d1TW5IOXlR?=
 =?utf-8?B?ZW5jaElDbnhHOG82dGU3Z09RWmErRzV5UXBqSGRLYWNzUzVobW95aXNiSkY3?=
 =?utf-8?B?RFVMd1E1ek5iMmlDNDZqOFRHUXBFSTdCcEpzdDFMSi9WK2w4VXFwWnhjYW9I?=
 =?utf-8?B?OU9iNTRZNlc3QkFkRGhWTVlYa2xPZXZiSWxMSE5pbU5mUW1NU2c5ZEI2eEQy?=
 =?utf-8?B?MDJRRUpTQk9VQUhoemQxSUxMbklQOHpEU0x0S1pob3FOamNDSW9FblBVVnhI?=
 =?utf-8?B?N1BaLy9BU1dBTm9RMWdEL1JVSW0wWWRySkRUejE5S3BnRzRLeGphWnFnWE9X?=
 =?utf-8?B?dm5EdnIvOXBKS3JUTkgwaVNJUkJCNVh4SmNlREoxeGNINHNZY1BKN0FWNXM0?=
 =?utf-8?B?WXJtRzhmdkxOa0ZmQ2xFMlJkK0xGcGxNdmR1VTFxS01oMkFuSnh5eklHU1Jh?=
 =?utf-8?B?cjNiVXNHLzNZR3F0RjBjWjV0clVud0tJbGVYcjVHek9CT2U1WUNObDNJdG5O?=
 =?utf-8?Q?MvfDygBFjMvMXwa+K+s0hgr9o8R+oCVpaQ7KKrmf9ZJ5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d9aead-7d4a-4cc7-46a1-08ddc5cc6519
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 07:26:21.9385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ZlF7yG4/9IhyH5OOt1IZxX51iPWgNyhSDaDmP5yT4i0DLs5S9ck8bLj1Lds7nc1kCRsN8r7xHYAt5yDlgqlWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4091
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

From: John Hubbard <jhubbard@nvidia.com>

There is only one top-level macro in this file at the moment, but the
"macros.rs" file name allows for more. Change the wording so that it
will remain valid even if additional macros are added to the file.

Fix a couple of spelling errors and grammatical errors, and break up a
run-on sentence, for clarity.

Cc: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs/macros.rs | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index cdf668073480ed703c89ffa8628f5c9de6494687..864d1e83bed2979f5661e038f4c9fd87d33f69a7 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -1,17 +1,17 @@
 // SPDX-License-Identifier: GPL-2.0
 
-//! Macro to define register layout and accessors.
+//! `register!` macro to define register layout and accessors.
 //!
 //! A single register typically includes several fields, which are accessed through a combination
 //! of bit-shift and mask operations that introduce a class of potential mistakes, notably because
 //! not all possible field values are necessarily valid.
 //!
-//! The macro in this module allow to define, using an intruitive and readable syntax, a dedicated
-//! type for each register with its own field accessors that can return an error is a field's value
-//! is invalid.
+//! The `register!` macro in this module provides an intuitive and readable syntax for defining a
+//! dedicated type for each register. Each such type comes with its own field accessors that can
+//! return an error if a field's value is invalid.
 
-/// Defines a dedicated type for a register with an absolute offset, alongside with getter and
-/// setter methods for its fields and methods to read and write it from an `Io` region.
+/// Defines a dedicated type for a register with an absolute offset, including getter and setter
+/// methods for its fields and methods to read and write it from an `Io` region.
 ///
 /// Example:
 ///
@@ -24,7 +24,7 @@
 /// ```
 ///
 /// This defines a `BOOT_0` type which can be read or written from offset `0x100` of an `Io`
-/// region. It is composed of 3 fields, for instance `minor_revision` is made of the 4 less
+/// region. It is composed of 3 fields, for instance `minor_revision` is made of the 4 least
 /// significant bits of the register. Each field can be accessed and modified using accessor
 /// methods:
 ///

-- 
2.50.1

