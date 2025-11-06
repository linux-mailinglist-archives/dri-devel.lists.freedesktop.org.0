Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7669DC3C7CD
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 17:37:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2965310E950;
	Thu,  6 Nov 2025 16:37:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jPzsPUP+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010057.outbound.protection.outlook.com [52.101.61.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB62910E950;
 Thu,  6 Nov 2025 16:37:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qbJOY989a4X8vCURsM7W18jWRfaHUvXhP6UlgqHlXgQQ2IXM7ByroanlWwWLRtQRyfYGKHNVZDYhtBw6odqFaFGq7X5pPms1sX7xt4P2vWxmg9ExajnM8nA6HJRFN0va4EGd9CkYvyPI4XA43YXehRrVKnnqFoExjRflV/fj6h/ZUcLtU39hFDMaLzszwCibn50TduKqfEyZr3O0lHYZH/DLha6E2hUfuoPiu+OWMaqI+zekmnUI7OS3Ck8ujLC6gcUK2b39hWQ72JSil3xppj5y4/VN6Rl8Kcb/Afp4trbhjEegXyZktkXM+UNL/05B+QX5IWXzbawuo5LB91DNhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y0rssR9XHGQfdtcziZOMCbj3wCnx+f09ALv6nNnZsN0=;
 b=qtS4l8Bi05ogJiIIHkJUi1vom4Ddm54XN1ylfAV+VyAkiTwdWUu4qICV4W9SCWOY9z2267U/sjgwjLmW5Ex+MDguQa4gm7QIXmbrsDVdQkbIK0Xbdn2c8BTTFudVyJMkelR/zC5u5k6Pt4IR8ZIn5dTvdSuT9i6NSrwt9Wqs+JWZBzeJtXjUHCLd6POmJ1/2fobOg7+rJDuZrjg4W3uZ521Zp8BgbAd0IRpMFoN4w35Oxl+fngSIOGScRRKuRJN1R4dLsRLVBkz8ywBKNiQtkjUIy/gWIn+LMqSXILVe57AUkLq54l8gxCyM8YGzmsikxGPes4VhxxZe1cQ9bBU6Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0rssR9XHGQfdtcziZOMCbj3wCnx+f09ALv6nNnZsN0=;
 b=jPzsPUP+Fo6TYsdjFfpwzNf6YLYz5qvXkxewHo6aDuoprCh6ISuwehaTDTisTHmEcP+yMNjXImapiF+NSlbxayKhN1f0cX0oSHFxytrJcAhYafAklOBYGkotzKsW9zJnHISS4g96BUsdPCfEEbktSOhzY6ngMQaEfPwBMy0Rwgo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CY3PR12MB9678.namprd12.prod.outlook.com (2603:10b6:930:101::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 16:37:46 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%6]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 16:37:46 +0000
Message-ID: <887de3dc-f6a8-46c7-baef-862fe1acaf02@amd.com>
Date: Thu, 6 Nov 2025 11:37:44 -0500
User-Agent: Mozilla Thunderbird
From: "Kuehling, Felix" <felix.kuehling@amd.com>
Subject: Re: [PATCH 11/20] drm/amdgpu: fix KFD eviction fence enable_signaling
 path
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 phasta@kernel.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, airlied@gmail.com, matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251031134442.113648-1-christian.koenig@amd.com>
 <20251031134442.113648-12-christian.koenig@amd.com>
 <febe733b667c1700333044bce8649c6520d69148.camel@mailbox.org>
 <5a770cba-9fbb-4645-a987-afe25e446942@amd.com>
Content-Language: en-US
In-Reply-To: <5a770cba-9fbb-4645-a987-afe25e446942@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0033.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::19) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|CY3PR12MB9678:EE_
X-MS-Office365-Filtering-Correlation-Id: a8ac76e7-8200-49bd-0ebe-08de1d52d0f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V1d6Zys5amV3N0s0VkNhNUZnQVhSYVRYRnI0QnJMVldzOGMxdGpKOEN4cXk2?=
 =?utf-8?B?TXQwazRWSFQ2OG1sdW9ncm43R0tiaE8yQmFqTXdrZ1MxRk5ad1dHMGJIOFU5?=
 =?utf-8?B?U0N3ZVlRcWxUdFFiZStEU1hpV1FYZklSd25BcnpvOEJ0MnpCazJqSG96Wm5n?=
 =?utf-8?B?REZjcE96d2pwdHV3Q1FLMURMRlMzc1JFNXdnbVhubDlab0JUdWhnbVVGT25B?=
 =?utf-8?B?eWgzVU1LTXhHODc4ZzZZZ3E5UUhIbXFQaGU3QlpnRFNQNFhYWlZxa2xrdnd4?=
 =?utf-8?B?YUV5ODRuRkVuazJDZk5EWUZ1aC9HZXlGcTYvM0RTN2tDVXN3a1RINUNJd0Vk?=
 =?utf-8?B?aS9zbWRvMm1Rd3k0b0NrY1Zjb0hRd1RtQnUxWURCR0o5TW1LSWIxUllBdXFs?=
 =?utf-8?B?YU1ORVdESU4vM3hLRDZrYmc0NVRjc0RONk5UemhWQ1hRMUw1NlpKUTE4WFhO?=
 =?utf-8?B?aGs0R1k0ZitsQ2VUWjhXZ1QrbWx3UG0yYUFhbllvbmR0bnFtMUFlMGJLK29p?=
 =?utf-8?B?a0N3YlhIRm1jbTNyME11NmNQZmJtMW9GTXlnMmphOGFwRmVHTEhPdngzS1Jy?=
 =?utf-8?B?VWN6cTZYdUlvdWFUOVNNbVkyd3B6U0RxRGdjOG9DTGVkcEpvMGM5TlJ3VFVQ?=
 =?utf-8?B?eW1nMVFBSWwzMC9EVW1RVDdKWXV6QUFGZmJobHBJeU5WajJlUS8ySFltNEtE?=
 =?utf-8?B?bDhLUUc2NEliZjNrODNTYlRqam40ZVhOejgxcWdFVUxGSERNNGhSL2NxOU9v?=
 =?utf-8?B?VExuNlJReFVZdW8vZm5LeTZNY3F3SUhIWTNGU0wzbEg4Q0FlM0s3czNIRGN2?=
 =?utf-8?B?RW1za043clhlcnZ6L29la0JOL005QzU2cVlkVGhyZmlqaFJrY1MxWFZ0TTJ2?=
 =?utf-8?B?SnFEeGZOYUtudWw2TG91eENzdDYrWGFyMjNYY1AvZURaU2J4T1ljTHllWkNt?=
 =?utf-8?B?WWZ2VTQveTEvRWdnTGJoSUhkR0FxV0dhcHJmckZoR01jSEc2L2ZjdnliN0tS?=
 =?utf-8?B?RXZabmNmcUNFL0F4VVZGZDNUaThVbHdXK09mUTcyZTgxRnplYjRwcGdTc0F0?=
 =?utf-8?B?RkM4UmJZU3Q4WUZkMjNXV0xtWE9Pcy9rOVFZRzZLSlVKR0VKMm9ua3NxY0dY?=
 =?utf-8?B?MzZyREptTDA1RFRmSjhjVW9ab0lQbkRzU1A1Qyt0UXRkcnh0SWNQK3lRKytD?=
 =?utf-8?B?WDdlallYaEd4eDd1MTBYck56N09oaTBaNm1RdlZUYUMxU3RlSlVtaUp1aTZE?=
 =?utf-8?B?VUhYQWdIZ2ZGZWVvZURPU0tpa1pWTW1lNWRiN1NIM3pKZko0SjIzUWUveks4?=
 =?utf-8?B?N2lldTMyUFBNQzlOSWNhU1p0NVBzZ1V6bU5mYzFhZW50cko4VnpSVmhiczli?=
 =?utf-8?B?dWxOUTFGM0gxcDBNamFnajF5dzM5MUkwTy9ZSk5mT05rUXp6eFdWUmMzS1Vn?=
 =?utf-8?B?SU81UVRSbThoNXpNSzNiN0FBUTlhSno1bmtSNkZYZm43a3BaTnk3dzVuUERv?=
 =?utf-8?B?MU5sdnV1NGM3a2tKWXFPeUFKbWZ1NlcyRWlhcWdYV1NzZEhvYzZPeWJVczdQ?=
 =?utf-8?B?bTczQVBnTWhKVGphS09YamRPbitLZy9QUUZQbjl4Yi9hVm5GNmxXUFpidjBi?=
 =?utf-8?B?RVdBeUpzWWZKT0ttU2I5OFJORmdSK0pEN25EeEIydkNBVXFEY0pUYzJUQktZ?=
 =?utf-8?B?UkhrQ3J6ZWdDQlBwS1pxYkdKZ0NZbGtWS2thek5QaWU1WmJRWUtsdlhSaFlK?=
 =?utf-8?B?QVJ5M1hCano4eUZvelZMa2xBcW9RYjVLM3ZFcXJXSlFWL0JJSU92M1Z4b09y?=
 =?utf-8?B?RzFRUmMrS3ZlTUUwT1JocUQxOGdLTFA4aUZZTk1adnUyQTNpVFdkNFg2QVBp?=
 =?utf-8?B?a0xNc1A4U1JoK1BhZVBqbEhPVWNLUHBRcWE3WXFPTTBPNFpjWTZWVVVzZlBk?=
 =?utf-8?Q?wSqk97zD38zjrsOriixVKFk2ceC525iQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHMzQkJPNFRVRU95cGFoTC9UVmM4UEtadlVtOWR3bFFWWXVsRm9aRXQ2a2RS?=
 =?utf-8?B?d2IwNEJmQTR3enVvR2szR1A5NW1oR0J5dXdtOFdrQlp3WGwrTWhhLy9vSUN5?=
 =?utf-8?B?bHQrQnhOcVpxenl3RzB5Y3VxZUxEWFQ2cWtTZ0g1UW1zMnBEOUNmdjlodENm?=
 =?utf-8?B?Wi9xb21UNWIxNnhITFdvRTlUYlZ1V0R1ZGlBbW56L0l6aVZ2QjFrWHhYNlNS?=
 =?utf-8?B?emh5T0tlS3ExelJtZndpalFoc3c0OHZ1MDVkTmZOMW9iRCsrcVlkWmhqMHkz?=
 =?utf-8?B?YjJUTkNDM2gyQThXQ3VwWXQvQm41dHVjYXFGMGs0cW9WNlRBMFgrelU5T0hu?=
 =?utf-8?B?TCs4WTVrRUs1WUlhRDBQM3NyVHpRMTBKRkh1cjBVa3ZoWTdJcjZwSEdiNnVa?=
 =?utf-8?B?ZDhCY2ZrT24zY2M1bDNQNG84eFV0TGc0cFh5RThjRW1HQTZYOS9sVnJySTBu?=
 =?utf-8?B?Ym5jTGkyRkdKRHZrcUFqMmx3WWVoako2R3hSUlBlcVdieG9pb2g5K2FhRTlj?=
 =?utf-8?B?V0FNWCtmSytxSjIyKzVOU21mdVJMVVJxdHc5ZisvdDhmR21sNEtpYjZjMU5C?=
 =?utf-8?B?MDlNUjhWcnU4R0x4ZHNic244cnMvVElHZXQwb3ducE96WktxdVVJVnVUZXRm?=
 =?utf-8?B?b3NNT1ZyL3ZuMU5NeDlEdGQ0c2dLNkREMStsMzZmUU9JbEhzRFhoMGdhcnVU?=
 =?utf-8?B?TnowT0NZRVlqcXZlTXpMeGtUdlRJNG5uekFPdEpRRnRXS0dFQ3JFczdLWHJt?=
 =?utf-8?B?dnAwUUdDSmVZV0JjeVlOR01GeG12Zm1vYXZNcC9YWU04bDRwc2dlaUk1eEk4?=
 =?utf-8?B?UDE0S3BpVGZaOTBvbGMzeVBBaVhHV3ZNUkFrUXcrNjdveWJXaGlrRGdkTjN4?=
 =?utf-8?B?RWY4TWxSVDRmUHJRMUpUZXZkYlhJc1k4WFQxTkFicWxVc2htUjlCV1VVbTRp?=
 =?utf-8?B?aUNaUDhVZVE4MDBwem14QmdiY1FCTjZkMmY4cktFWitkdGlENENLK25oWU1G?=
 =?utf-8?B?YUxkRWVYNXBGMG5tZ1d0ejN4REFWbFlFUkZURUFkN2NmNXV3NFdnMlJPam8w?=
 =?utf-8?B?RjFRTk5SWkNFUVRuK283NEZ3VW02R2JKSjdERjZBWGJ1NXRNN1NKTlorZnlK?=
 =?utf-8?B?VFRtckdLRDBSOStJdFRTeWF4ZnJQQjVVaWxaZHhwbHhabTRuVEFhakNkT3pm?=
 =?utf-8?B?OHdVa2hieTZ1TEIzUjZ6YXFJWHE4MEw4emh2VU5NeHEweDFGT21UWGxFUllj?=
 =?utf-8?B?d2FGblVWME1RZGhxWS9qMXFaK0tBUE45UnZ1V3BkZ0JaZDh5N1NlajRRcEVE?=
 =?utf-8?B?elRSVEE4TTN0R1djZmhiVDRITWlseGQ2YzRpMGNzQUlpQWNpNG5KUDNxZXVr?=
 =?utf-8?B?U0xIOVNEd1NFN09sUVd1L2FpMWF6QURsT2l4Y0JYbm1HRksvYzc0ZFVBNmhE?=
 =?utf-8?B?azVvRzNFWGM1d2ViZjN1bDdwaUlKampEalkxN0d5QjdKbmEyRTNCK2xLV2F4?=
 =?utf-8?B?YUM5SUhSSzYxdkJLRnluNkdMRDF6KzdOVkZCU1hHbDFpNkxBV1NOSWxzSE5s?=
 =?utf-8?B?b1ZwbXA3ZDZiUmVYVGZXTjdKSDRNQThpUWI5S0E3SlRlUkVkNVMrVGlhZFIr?=
 =?utf-8?B?dy83V2xsb2RtdWVQSS9hSkYxdlRLeUM0dVNmbmsyNko1a1pxTzBsT202ZlZF?=
 =?utf-8?B?cXQ5TGtLL01XcmljYjZGZ0w1Y0NhWnFFNHlvRG0yblFqYkVmOUZWdFN5dmJJ?=
 =?utf-8?B?Uk5zUGVIWnpPVEZwQjhJeVZVdjdqd3pVSEM2aHBrNGFDTSs3dDhFKzBNVVhU?=
 =?utf-8?B?d1cvbXRJUWt5TzgwZXFIRlB4RE02bVk1dUVtWDVXK1E5Qk0rVU1YWGNVQ0pw?=
 =?utf-8?B?c05IbE9EdzNTZGlUY3ZreURGa3YrZURhTkQwNStkVi9XTXdLNldvR011NWhz?=
 =?utf-8?B?UUY3Rks4OFE2Snh2TmN2K0dIMUlOc3J0WnN5YzN5QkJtQnZNWE0rUnB2TDdY?=
 =?utf-8?B?bHMrQVJMWHZqdy82RzNjRjhzZnlSR0dyMGc3Zk5zbTBTNWdsb25jUklBakMy?=
 =?utf-8?B?WWVXN1IvL0RSd3V5SURpTUtFSmlFNVFyY1BGaFQ4NEVDWXBiUmd3bkk1Qndy?=
 =?utf-8?Q?/DTwQ9y2tKu7irrD9pDWTa8fS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ac76e7-8200-49bd-0ebe-08de1d52d0f0
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 16:37:46.5640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: up+i7kHoohP8/kkfGjzBPlGEBpq11J9QG5richxIDNEeCx0WKYTdjdjVQysHIhRx6j8v15tpYD55cYcoVM/nQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9678
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


On 2025-11-06 08:43, Christian König wrote:
> On 11/4/25 17:28, Philipp Stanner wrote:
>> On Fri, 2025-10-31 at 14:16 +0100, Christian König wrote:
>>> Calling dma_fence_is_signaled() here is illegal!
>> The series was sent as a v2. But is this still an RFC?
> I think when Matthew came up with the XE patches we pretty much agreed that this is the way to go.
>
>> If not, more detailed commit messages are a desirable thing.
> Good point, how about:
>
> The enable_signaling callback is called with the same irqsave spinlock held than dma_fence_is_signaled() tries to grab. That will 100% reliable deadlock if that happens.

I guess we could use dma_fence_is_signaled_locked instead. That said, it 
only tries to take the lock (in dma_fence_signal) if fence->ops->signal 
is set, which isn't the case for these fences. That's why this has never 
caused a problem up till now.

Regards,
   Felix


>
> Thanks,
> Christian.
>
>>
>> P.
>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c | 6 ------
>>>   1 file changed, 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>>> index 1ef758ac5076..09c919f72b6c 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>>> @@ -120,12 +120,6 @@ static bool amdkfd_fence_enable_signaling(struct
>>> dma_fence *f)
>>>   {
>>>   	struct amdgpu_amdkfd_fence *fence =
>>> to_amdgpu_amdkfd_fence(f);
>>>   
>>> -	if (!fence)
>>> -		return false;
>>> -
>>> -	if (dma_fence_is_signaled(f))
>>> -		return true;
>>> -
>>>   	if (!fence->svm_bo) {
>>>   		if
>>> (!kgd2kfd_schedule_evict_and_restore_process(fence->mm, f))
>>>   			return true;
