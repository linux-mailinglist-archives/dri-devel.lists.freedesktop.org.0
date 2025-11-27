Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B42CC8D493
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 09:11:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5BEB10E78B;
	Thu, 27 Nov 2025 08:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JM9orwra";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011045.outbound.protection.outlook.com
 [40.93.194.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F154410E771;
 Thu, 27 Nov 2025 08:11:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4gbN6qIZ7JYHjrxB4KbtnkJMR7x88KsnSPOC+9ZFkJBuhp2TrEfSuipdWSP6nyy12LvHHMj3Xshz5W2kvfY1+bUVYeOarGJPQMEtlH09vUtns7Fj6pSIQ0kQseQNntrZ+XxFQ9MEuUuewG3ybtzwF2RZqfaU/XY5u5tDXy2F2GG6YzhnlQ+xocAr2pw99at9ag5QS/UNgrujJmnbAKw43/24k6ieloXF1DwZz+BRlpH84nMvhamjkzDZkLuliiMQaZUQvhQMXDBSX916IvxlVltGwZ/7cg+WwS/3XyMshnhCtypVGpHft0JsCrp+MztKv7YVsrltKvj714OnrqiIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzRYFlOZ+yt7vCDTUIq9ouqOytX7LPGhlXKA/zsSmIs=;
 b=Fr7lPaoz6fz3FyTkeSYURSQCovMQlDyZr0kzjNkd/qjYBwTTxD8NkxktoAgailGgF6o/vbUhY1f+RYSA09+0Jyb4NUMtcLGRL7B0LtB5w8TCzQ34miOIWM1blyHNGPQPClbA5OXVNeMW5LVH9Ctnx6jkXS8w0IBbmjONJmqdVYGStPE3xKawWsPP2YSe0+9xVrymx4HwnhoZgO6ZTXjS7cj9HU0Nttn0hkn0jC2Rr7p5qhwFv3sEvONrz1KZA/+8hXjCEAQrtOm/N6Hygha0+HeoOaIsEI0XG9F+u1EwZW4jE1HwS9/UnKFh+qJZ3O0pGror8RTRPz4CkXgmjGZNTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzRYFlOZ+yt7vCDTUIq9ouqOytX7LPGhlXKA/zsSmIs=;
 b=JM9orwra3FIXKl9kbk/d/zIyBxhE0xkOyCw8shBiPvgJV2bmO6GmE0q8AEeuV8GwlJ5o2zOATA9D6cM8aUKb5zmN9OFfppwpoO5ebvEKjhPi/8JDZBxYuIOcbokKkl+tYqi+SOp6Rr/ds5lxVkGeYP/Y3h36JBoNIlYhPKlWR4o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB6876.namprd12.prod.outlook.com (2603:10b6:303:208::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Thu, 27 Nov
 2025 08:11:41 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 08:11:41 +0000
Message-ID: <f1864f6d-8403-406d-81a0-00a71495cae8@amd.com>
Date: Thu, 27 Nov 2025 09:11:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dma-buf/dma-fence: Add dma_fence_test_signaled_flag()
To: Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: <20251126131914.149445-2-phasta@kernel.org>
 <20251126131914.149445-3-phasta@kernel.org>
 <aSctt3QFiEIB61Gr@lstrano-desk.jf.intel.com>
 <aScxGDYeNeN1WYja@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aScxGDYeNeN1WYja@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::21) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB6876:EE_
X-MS-Office365-Filtering-Correlation-Id: 307c0ab3-b7eb-4bc3-faa8-08de2d8c9843
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFFNcmh6aWV4bjVWZG9KSEdEMUk3WTMzUGRxT2pKcGNtMlFtSlRNN3JaSzZm?=
 =?utf-8?B?ZWE2SUhYcTNuMXNaUnZCdXBEWGo4K1A3NHRNL3VVSkhrRDNXMjBYMWRxV3VE?=
 =?utf-8?B?RG1HYTdRVDlZL0c5MUhWS21ocFplSThYYXZ5MVRQL241SDBCMDJEZlNBOCtS?=
 =?utf-8?B?MkZuN3ZHV3BuN3o2MWcrdFdURUdaRml4azhNcmdrYnFqVzZ5b1IrNGVlNUx3?=
 =?utf-8?B?bzJha0ZSNERJV3lVb1hkMjBGc2hZSFpqSWJybEw4T09WdVZLNXBrT0xsWXZV?=
 =?utf-8?B?bEp4bzFUcld6eC9idVd4T1FGaVRDK3hqSFUzYm11Rlozc1BxaTgwc3M4VWow?=
 =?utf-8?B?a3UydDdhTWVIN3JrMFRhTVowVUFsWGFiZnRlWitaTkFYR3FuNE9tT2t0ZE9I?=
 =?utf-8?B?Z21lUzNkVnJWaitnVTF5Q2ZpK2FsTnVTSEgyZ215YzFzdXlJYkd1QnVjbDNZ?=
 =?utf-8?B?SjdTL0hwc2xtVlFZeDF6Nyt2bzIwUmhwbDEyYnBNbHAzZUc3OTExUEluTUxt?=
 =?utf-8?B?bnQvN2JLRkFRSmZjZmwrblkyUW5KcG80a2x1emxMUEU2V0NwczZidk13SWlj?=
 =?utf-8?B?RjVEc1BQclV1cmwrUDJBT2VjQi9ocklIaWU1cFZjZ3NPRjVBOGtwbWlGWmxx?=
 =?utf-8?B?V3U4bzBoV1JSelE0Tm95R1Q0b2d0SzcrVE1keW4xNHpzaFY5ZWoyK3pmNVhF?=
 =?utf-8?B?Rzk4eHhXTzV0QmVkZi9rT2d3SnNsaEdEZkhvV09BbExHRWxacWFneW43VCs2?=
 =?utf-8?B?NnRNRWdFcEV5RzJ6QUFoN1dJVDBxRnM4QlpvOWNyaFJLNUMrTmphREQ1cFZy?=
 =?utf-8?B?UW1zbjF3WmR2dXZTU1dQa2syL0dJditqWG5xMDBhdXJtV0RVUzF6eTllRXpu?=
 =?utf-8?B?b01FSTI5TnZCUnFtV2JYcFhFQ0g3M1d4R3k3VUJ5TU4wVzRjUzY2YjBUSC95?=
 =?utf-8?B?WUFqVVgzblh3TTE3Q2ZMaUd6bXZ5RWVxQkFCSjVOMUluVzNKUHcrZ2NMREtt?=
 =?utf-8?B?RzdIais0UUNKanVhOUdIM3dJWDc3UlNOOTNVeUphc2JGYkdIaWV2ZWhNZ0Uv?=
 =?utf-8?B?YStGUVRCd0lYUklEaGhqQXZPUUkwbWZQOVNyTG50QXlhWmtKR3NjVnJMczBJ?=
 =?utf-8?B?TlRnejNldnVYcnExMW8rRndWQkJSWjFPYS85NWdmdU5nR1RxNVlaUVRqYmZ4?=
 =?utf-8?B?RnpGSEsxUk12dzJ1MUdPV2p6dFNiUFhKN3Rrc2FQdjFGYlZKb1hMeW5PMTI4?=
 =?utf-8?B?bC9mTlpTZEI2ZzY5dnhXYkhNS0pMdXdaOU43QUZRdzYreExLRXpScXpIUG91?=
 =?utf-8?B?TlMzZ0I0eFdDZnBBcTVIUzdOdDc3UUJIL1VDMk1rTUZRNjZJUUt0U1U5SlVO?=
 =?utf-8?B?OGNJQmd1Y1hHdDlvaGFKSWt2NFVQQ3FVZUVYQTZaQ3AvUERIN0JzS0F3anp4?=
 =?utf-8?B?VmFvM0l6RFB6MERtVExyQkNPd0laY0pJeEdSQ04vOGNYWktTbXhKVUYwYUNi?=
 =?utf-8?B?QWVxUlZUV2J3c2dPVG1JcGIzd3pJSXd2ZFhWbVhDd3d3bjMrblVkRTlzUGRw?=
 =?utf-8?B?Nk1pREl5RytzMHR4SjdONm9Za1pyWW50M0pJV1BNZWdrekVQNThxRDBpMlRh?=
 =?utf-8?B?cWdBVERDUHBIVGFCSGpDa1ZKY3lJMU1yZGRMYmJKL05sVHEyNW5KY2R1SFpl?=
 =?utf-8?B?ODlaeGxhQ25iNFo0bVluTEwzVDFVV0ovR2gxV0JZVjVjV09OUnhVSWVTckVl?=
 =?utf-8?B?dHVtSkk1aHVuNndyTEJMYTB0RUFLbUtYbUFXcDVCbGN1TkgxTVd2ZEJLbDVp?=
 =?utf-8?B?cTlIOVFwcDIyUFYvcVByL1JpNUFZUWVGM1k5ZUpqR0pMTmN3TWtNYW45OHNU?=
 =?utf-8?B?WE1PS2lwTDVGVWhyYU42bTR1bG5oQ0w4dmcvZjBmZjRVVzkwdTlYUkFGa0t6?=
 =?utf-8?Q?A7q1GwfKnSpkQMWggCAOkdPbltddZfZu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWNaamx0dDZHY3NxRFhqMVFXR2d2QVNqUUNqYUlOckU2NG5haGZqYzZjUGwv?=
 =?utf-8?B?NjlPNTJWb2NXdm1BWXdMZHFYOGhLNUs4anMrdWJjWUZMaURlVTBBc2xhYk5I?=
 =?utf-8?B?aHVEbWp3TXI4ODB2VW5pYnJoQnF0cU9iVi9WSUYrZ28wVVhLU3NBRTZOVmZy?=
 =?utf-8?B?NndMbEMwRXRBTy9rdkF0cUZyTVdXNTVaRnlUdHJ0SlJrMURPcC9kbk91VlVP?=
 =?utf-8?B?N2hkUk9CRVorQXc0QTZ3Zmx0SmJGdDFEU21obDQ5NDlMT2k5K2pCSnhHbmJS?=
 =?utf-8?B?dm8xYkpsd1l2V0IybHRUckZ4Rm9BYTFHOUVRaWRiMmhQTlNpTVRwZ0FDMEQ3?=
 =?utf-8?B?SCtsdk5FS2ZyWUd6MExjdC9JZStjVHJMUktmd1hpM1NpcGJvM3ViS0RUaGti?=
 =?utf-8?B?NVRVb1F0QS9pd1pUS0VDZFRmUGI0NkJ5WnVmbi9OS2dsQ2w4K2ZJajQrYU43?=
 =?utf-8?B?Wlo2UlpuRnJSMFlhSGZEWlRXU3lwWTJYT29yZXJEMVlrK01wbllUMGxqUkhi?=
 =?utf-8?B?eHVHTXRjZUd0Tk5BT09hYkdMSllLUmJvakFnSlNXdWF6VWlGd0U2aVl5cnZp?=
 =?utf-8?B?TFpSREltb2oxYTU0K2w4dkpPY1pZUUl2bVNROThVWTgwMlQ4b2M1MThURFZv?=
 =?utf-8?B?MEgyaG5qVVoxbVFJVnU2RlFleVBDNFRYMkhmRXRrMlpzbzJqdndISTRjaGdL?=
 =?utf-8?B?cDN5dkJkREc4aURNYm1CeWt2UUJlaHFONjExRy92TEZrMTNNcGQxTElqMUl1?=
 =?utf-8?B?Uk5KTkVySzVVZVluRWlTR3lsZ29ra1Fic3laNmFod2crclRMMjdJMzl3RHp5?=
 =?utf-8?B?V0xNaGdLaTF6Q3VEVXFoZGZza1JTZmhIL1ExcnQ3b01kdWRqYXhUd0hETFRq?=
 =?utf-8?B?L0NXWkFUNVhlTnJrRGp2eFd5ZHVzY09HdndvNnk3RHhXcUJjOEZXWXF5LzBF?=
 =?utf-8?B?dkJldnd5SGZPM0FIMDY3Um1xY2V0VVRrSDZ0WEIydDVKTTRZRWlwdFB1Vmoy?=
 =?utf-8?B?ZjhXeWlEU0tJTnpUdFVBQUE3eU9KMWFSRnZKbVhCYXVSUnp6OHErMUJRZmJM?=
 =?utf-8?B?aVdRY2JxOEYrbldCbSs3QmpmUGlZSkE5VW1Hc2tPZVJyKzA2OUhMOGxrUWhK?=
 =?utf-8?B?OEZiK2JaL3doQmlvaXByR1lVSlBJQTVZNVFLTUVhZjJtMFBNZjV3ZXF2ck80?=
 =?utf-8?B?Qm1DV3hGWVZSU0JjZktDT29OUkt3RVZRL3pjd0cyS1p6a3JDYVFQWW9EbndJ?=
 =?utf-8?B?MTAyajVLZXdaTk5PN3VvajZHU3F3d2FxRFAwQ0FIVGxCeUlhSDlnRFdzcjl2?=
 =?utf-8?B?K3o5RFZ3dW5sTGJ4NWRxZjZIMXJFWDd2dVozNDdDUXdtSjRlU1FGenFIcHNl?=
 =?utf-8?B?NFRpTEozWmVLSFdRTFpqSXF5Q3lrWG8vazlTNTBtREhQMUVHNm92L1MvN1E2?=
 =?utf-8?B?aTdYSmJ2K2N6R1NCcXNsZjRWMkxVaWx6ZE5MTlVMNXQ2bzl4dWhPZUEwRyt4?=
 =?utf-8?B?SHVKUG9kaWVYc1RDR3NKOURYSENoWm5hQlJUMnZsTzJRR3ZadVg0cXh4SXpt?=
 =?utf-8?B?Z01IRlVqRmhOTHlXVGQ1TFBpZXc2c2JkOHA4QWZOenFMMEdGaExOOVJJelZi?=
 =?utf-8?B?dzR3VWVVeG9tZWFJTUp6L3UvZGQzbTFuWDFySjBmZmlvOEJZQU5ybU5PelR4?=
 =?utf-8?B?NWlVTWRrQXRIWVNBWUNiWUZ4bHRPRlpqN05hbVg0K0E1RVZmNVJBWnNFM2Vh?=
 =?utf-8?B?bE43eWVaS1pXK001S2psbzlsaW5RQlMwWThBU2pXU2RmVTVyN211YjlJSkx0?=
 =?utf-8?B?czI4ZStsRy83U2lMVFhqSGl4bFdoVkd0SndQbSs2VUFOMVhNb05qdkJnbS94?=
 =?utf-8?B?b1E2amhXSWJwY3U2WWlDbmx4SWt6VWduMDMxMVU3UVF5dEppaVYxR3d2a2dC?=
 =?utf-8?B?amZtUUttdG1ySjQzeXZYWG55Y25xMWxicW9KcFhGOVVQcythY0lxaGMwYWNv?=
 =?utf-8?B?Z1gyOWVNdDBCY3hGcVRTYnI5UWpMWUo5dFA0dGsvMjNxQWxLU0RzUFlCUTcy?=
 =?utf-8?B?b0pHL0hzSkxtaWFJdlBQdUI0R3FRYXJoTzYvWnIwZ3VZOWFrajhBVE9DYys3?=
 =?utf-8?Q?GQWJnHbD6FWmkH/LfBOeQlofB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 307c0ab3-b7eb-4bc3-faa8-08de2d8c9843
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 08:11:41.1299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eafNy5qOGSf3a2X2ttbKXI9FWYGpwLaD3JB9VnoQI/UWsXRkJwKMrrHATbWZqySf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6876
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

On 11/26/25 17:55, Matthew Brost wrote:
> On Wed, Nov 26, 2025 at 08:41:27AM -0800, Matthew Brost wrote:
>> On Wed, Nov 26, 2025 at 02:19:10PM +0100, Philipp Stanner wrote:
>>> The dma_fence framework checks at many places whether the signaled flag
>>> of a fence is already set. The code can be simplified and made more
>>> readable by providing a helper function for that.
>>>
>>> Add dma_fence_test_signaled_flag(), which only checks whether a fence is
>>> signaled. Use it internally.
>>>
>>> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>
>> This is a nice cleanp:
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>>
>>> ---
>>>  drivers/dma-buf/dma-fence.c | 19 +++++++++----------
>>>  include/linux/dma-fence.h   | 24 ++++++++++++++++++++++--
>>>  2 files changed, 31 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>>> index 39e6f93dc310..25117a906846 100644
>>> --- a/drivers/dma-buf/dma-fence.c
>>> +++ b/drivers/dma-buf/dma-fence.c
>>> @@ -372,8 +372,7 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>>  
>>>  	lockdep_assert_held(fence->lock);
>>>  
>>> -	if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>>> -				      &fence->flags)))
> 
> I need to read a little better, I think this change isn't quite right.
> The original code is test and set, the updated code is test only (i.e.,
> you are missing the set step). So maybe just leave this line as is.

Oh, good point! I've totally missed that as well.

But that means that this patch set hasn't even been smoke tested.

Regards,
Christian.

> 
> Matt
> 
>>> +	if (unlikely(dma_fence_test_signaled_flag(fence)))
>>>  		return -EINVAL;
>>>  
>>>  	/* Stash the cb_list before replacing it with the timestamp */
>>> @@ -545,7 +544,7 @@ void dma_fence_release(struct kref *kref)
>>>  	trace_dma_fence_destroy(fence);
>>>  
>>>  	if (!list_empty(&fence->cb_list) &&
>>> -	    !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
>>> +	    !dma_fence_test_signaled_flag(fence)) {
>>>  		const char __rcu *timeline;
>>>  		const char __rcu *driver;
>>>  		unsigned long flags;
>>> @@ -602,7 +601,7 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
>>>  	was_set = test_and_set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>>>  				   &fence->flags);
>>>  
>>> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>> +	if (dma_fence_test_signaled_flag(fence))
>>>  		return false;
>>>  
>>>  	if (!was_set && fence->ops->enable_signaling) {
>>> @@ -666,7 +665,7 @@ int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
>>>  	if (WARN_ON(!fence || !func))
>>>  		return -EINVAL;
>>>  
>>> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
>>> +	if (dma_fence_test_signaled_flag(fence)) {
>>>  		INIT_LIST_HEAD(&cb->node);
>>>  		return -ENOENT;
>>>  	}
>>> @@ -783,7 +782,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
>>>  
>>>  	spin_lock_irqsave(fence->lock, flags);
>>>  
>>> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>> +	if (dma_fence_test_signaled_flag(fence))
>>>  		goto out;
>>>  
>>>  	if (intr && signal_pending(current)) {
>>> @@ -800,7 +799,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
>>>  	cb.task = current;
>>>  	list_add(&cb.base.node, &fence->cb_list);
>>>  
>>> -	while (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) && ret > 0) {
>>> +	while (!dma_fence_test_signaled_flag(fence) && ret > 0) {
>>>  		if (intr)
>>>  			__set_current_state(TASK_INTERRUPTIBLE);
>>>  		else
>>> @@ -832,7 +831,7 @@ dma_fence_test_signaled_any(struct dma_fence **fences, uint32_t count,
>>>  
>>>  	for (i = 0; i < count; ++i) {
>>>  		struct dma_fence *fence = fences[i];
>>> -		if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
>>> +		if (dma_fence_test_signaled_flag(fence)) {
>>>  			if (idx)
>>>  				*idx = i;
>>>  			return true;
>>> @@ -1108,7 +1107,7 @@ const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
>>>  	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
>>>  			 "RCU protection is required for safe access to returned string");
>>>  
>>> -	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>> +	if (!dma_fence_test_signaled_flag(fence))
>>>  		return fence->ops->get_driver_name(fence);
>>>  	else
>>>  		return "detached-driver";
>>> @@ -1140,7 +1139,7 @@ const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
>>>  	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
>>>  			 "RCU protection is required for safe access to returned string");
>>>  
>>> -	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>> +	if (!dma_fence_test_signaled_flag(fence))
>>>  		return fence->ops->get_timeline_name(fence);
>>>  	else
>>>  		return "signaled-timeline";
>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>> index 64639e104110..19972f5d176f 100644
>>> --- a/include/linux/dma-fence.h
>>> +++ b/include/linux/dma-fence.h
>>> @@ -401,6 +401,26 @@ void dma_fence_enable_sw_signaling(struct dma_fence *fence);
>>>  const char __rcu *dma_fence_driver_name(struct dma_fence *fence);
>>>  const char __rcu *dma_fence_timeline_name(struct dma_fence *fence);
>>>  
>>> +/*
>>> + * dma_fence_test_signaled_flag - Only check whether a fence is signaled yet.
>>> + * @fence: the fence to check
>>> + *
>>> + * This function just checks whether @fence is signaled, without interacting
>>> + * with the fence in any way. The user must, therefore, ensure through other
>>> + * means that fences get signaled eventually.
>>> + *
>>> + * This function uses test_bit(), which is thread-safe. Naturally, this function
>>> + * should be used opportunistically; a fence could get signaled at any moment
>>> + * after the check is done.
>>> + *
>>> + * Return: true if signaled, false otherwise.
>>> + */
>>> +static inline bool
>>> +dma_fence_test_signaled_flag(struct dma_fence *fence)
>>> +{
>>> +	return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
>>> +}
>>> +
>>>  /**
>>>   * dma_fence_is_signaled_locked - Return an indication if the fence
>>>   *                                is signaled yet.
>>> @@ -418,7 +438,7 @@ const char __rcu *dma_fence_timeline_name(struct dma_fence *fence);
>>>  static inline bool
>>>  dma_fence_is_signaled_locked(struct dma_fence *fence)
>>>  {
>>> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>> +	if (dma_fence_test_signaled_flag(fence))
>>>  		return true;
>>>  
>>>  	if (fence->ops->signaled && fence->ops->signaled(fence)) {
>>> @@ -448,7 +468,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>>>  static inline bool
>>>  dma_fence_is_signaled(struct dma_fence *fence)
>>>  {
>>> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>> +	if (dma_fence_test_signaled_flag(fence))
>>>  		return true;
>>>  
>>>  	if (fence->ops->signaled && fence->ops->signaled(fence)) {
>>> -- 
>>> 2.49.0
>>>

