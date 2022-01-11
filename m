Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AED48B7CD
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 21:04:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3E110EE9C;
	Tue, 11 Jan 2022 20:04:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2066.outbound.protection.outlook.com [40.107.95.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A49310E29C;
 Tue, 11 Jan 2022 20:04:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bOzrC7rgyWshAZ/j/lxK9FJl8xeRP3v0KlXH8ULCacW6ERi2ySjp2KfhkNwGPTUl7Tw+bHiY+rWEjHCUZNE1laNcsDJmFhVxaKN8jHqxmYutndDsbT1ef04mRQpu2N2MOWXv9y4f4adFuG76QN3Mxwr4HH4pzffG8tpG2dm+k60iFCOb7ERode7Cl12M0VQVsmZIeji9TEj3Wsq1aSUKbsaxGFp+qbkbzUSV8la7pIMosSTN3RG3ZKuS73ZIebV+Y84iY6RBIGmPU/tGj17gNYHA/Yi36i3EaoJqGbMuyHYax7YLWo04hM4j+LiCahRSuOfiuRz7FqbOWtg6R/Poeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d69ZR47isuqm3bSidvxyb7klILUUZcrKkh/ySSxAacc=;
 b=UQmuNQfGvtDUp/ixzty5uYuM3XEtLTbMe/Vx9YURgSfw3oX60f34HdGHK8EtFArPIexhZcdgmfyHipKvYuajEVg67lG5QUU7beQ7FfFG4HlunLmOkyWYmG9nj7ZeMm2Q1Z6qewO8y1E7SBoOVx1fnpVGRa3r2u1feN44DSrxth1ORe7xHUQnVTkgYfmtSivZPt99F/f7MXoByRrgDnWLgzdpdysxQZLpwlbyGv/cFtHX4yGsgWlUZ2tcEjMcq3tDoGuFBdFq0qR7x6O7RXC+NlBdmbPyFlc8lFlMgrYXN64bzssuVO7gRT5IY6eb1vzo0g4sMSLTNrByalHbCaH8jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d69ZR47isuqm3bSidvxyb7klILUUZcrKkh/ySSxAacc=;
 b=VfL91Tc93Ai1LrfYXcF37fVgrnmG6znY4073qGbTvO3a2O7a0xKprzVDZh3xAi1Sk4qX0oe56cw3JO5/mCI8IWIptISOzL+Qu5EYiGkDteqiIiE0JsOxTHbPiv9RXuY/kbZmtFHtP236jUQ+v0lmNXoLW3Rj2k/sgbmPkM3AhYE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MN2PR12MB4391.namprd12.prod.outlook.com (2603:10b6:208:269::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Tue, 11 Jan
 2022 20:04:25 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c411:8d69:9007:aed6]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c411:8d69:9007:aed6%5]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 20:04:25 +0000
Message-ID: <08c59761-bfe8-aa15-ba85-ee4a77dccba8@amd.com>
Date: Wed, 12 Jan 2022 01:42:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v7 1/6] drm: move the buddy allocator from i915 into
 common drm
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20220109141951.134432-1-Arunpravin.PaneerSelvam@amd.com>
 <7b7db015-3673-c5d3-baa1-e0282aaf864d@amd.com>
From: Arunpravin <arunpravin.paneerselvam@amd.com>
In-Reply-To: <7b7db015-3673-c5d3-baa1-e0282aaf864d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0095.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00::11)
 To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8693ee43-4bfb-4036-c3fe-08d9d53d9091
X-MS-TrafficTypeDiagnostic: MN2PR12MB4391:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4391424033BC1B25A546779EE4519@MN2PR12MB4391.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xtuTqCJg2Bm9ReQpURo+JqhwQxMgkQDTK0t0OPOlJjYOsa66pCNPXqcUjs6QErD2bnGpXNd4YJGx6O5q7SovoKFgdfK8kp+phP1fskcO0NAuUoup2uRwpLy3PrmVyENlVGAZU/wY+DW8yB/NKvBKb3YlmfGX4NqCuh9cugZe+eopcRQkwTMHRA55TR6r4tKHJSroXUuHfRmtvu+nJIKP2pZmcvIXWUJ/862oEcZSvvV5CpC794+Y62BIbIO80N86XRRE0In2KUMg0DPDkpEEc3LCGAVAFE+9Ij6Y5JU78FzxgKetyY4dSQ0tzUzcp4/ml9CZcx40M8WwYNcEovGn9P0lhJmwjNU9ZimyWBhdCBUuzrb2TirnKoV2REFJYPxTgpn1aljkQWpyEaWo4N14Ekl1Fbr2dU2oC4zTzCFjB+q5zoxE8NoiE/Lkb7BWsal3WwvYEHq9TBUjFKlYJLfKni4y6uC4w2LQxLfft5rzEGZ+4akTx+sokHgQgqyy2/OkIUl81JK8htHiDTYondRp0hcJK9WyKyfcAEBZ0xe3oflgwJavXnBnOFaMd7ygOVZ7BioRUhJss3GxshpZ50XkoFrqOWEGlsz2gKSoFlEsVN7uPoFiuD4xQjUbVW4AdsMx0uNJQakk10M8Noeaul11N2zJUsBNZqCUbOSbqEASVClrmYd5JFlGqw7Rmvrt/JoMX7sfuYR6ktQfP5hkSHijugB1SxFTGXOsLORgoKDmtX8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(6666004)(66476007)(53546011)(66556008)(2906002)(66946007)(6486002)(6506007)(8936002)(316002)(186003)(31696002)(31686004)(4744005)(6512007)(508600001)(4326008)(2616005)(36756003)(86362001)(66574015)(8676002)(26005)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V200VmFHWVdVTXA0enFIL2JyZWx0QTJyOUF5am9yY1dMT1F4MDd3NWNhc01t?=
 =?utf-8?B?WlkvdVFtYWk5U1FjUmh2NnRwZDRacG1ObnhyS2luTzlNQlJHVWRzd3JFVzJI?=
 =?utf-8?B?MHdlNXFyZGR2eGhiRFhzUlFud1oyUjRLRUROdktJUm0yYlJJRFJNN3kydDc4?=
 =?utf-8?B?TE5pVk1nRFhnK3hzWHU1WTJlc0pyZGVydUlvSVdpWFoxMTdGWTN4NDA4NTl0?=
 =?utf-8?B?Q0RmVm94YndvaFFhNEZHZWFvNzM0OWtQZUxES3V1LzVWNDY2OEtxMWN1aVhG?=
 =?utf-8?B?Ymp3SmFYbUZMdEJJOU9RNldVVU4yYVc2WUMxN0EvTTlNN3BsK0RpWE5JcWhm?=
 =?utf-8?B?bGgydmpiL1JudEN1M3JhbnBOS01GRmJPRkYyVnA1aEhGN0FablhMS1BsQ3lh?=
 =?utf-8?B?b0FQVGhFdUY0SGppZTNCZXM5YUx5N2toR0E3L2F2RVdvdkVrK1NIMHpQL1lZ?=
 =?utf-8?B?cXJPUFdSWTNlYTJrcWdEOW45S2dkTWQ1dThDR1g5M2RuaFIrdlFGZ2FJVnBw?=
 =?utf-8?B?QWt2ZWk4TGJQM2hITlhDSmI3RnZXTzFIK2JVbVJxVkVmUmd2NEFKQ3drbHpG?=
 =?utf-8?B?N2lvbGRHS0FWeHc4cmRxelg3SDA5MmpMNG4xaFFNSW1NaW5OdGNyR1o0cTBq?=
 =?utf-8?B?TUpzdWZvdUIvbVdyUFlRbGVGcFRZN1BGOXBPL21CR2k4RWVnWUFpbXM0T2tQ?=
 =?utf-8?B?TUk2VHlBNW9VejI0bU9qUHhkRGo4dzIzRnVUQ3BOWkNVRDJzSnVqTnZieHBN?=
 =?utf-8?B?eTVqOWtvbndYVTJzbEpaREVQL280RHBJNlA5d004ZzJWKzlpODZIUnUrWk9Z?=
 =?utf-8?B?VDdqUkVyUWczMDZwUGRuVFpmaHV3Y3gycVl5Q3NpOHBPN3hVVEtia0pjYzcz?=
 =?utf-8?B?NkZINFhwdHJPY0FyNTFFVFhCamNwRUUzYWpqUS9FR1RQK0JpMVZLd1pDYk5D?=
 =?utf-8?B?WThJY3dPbWtHcHVKcWp5Nm5MTHVNTEJvb2t6Y2RtSFFEYTdlRHhnUkF0N3dL?=
 =?utf-8?B?UUhrdGlKWWZXblJpTzhha3MxTjRybEY3cUFEVXc0MDNjMVdJZWpuZFFZSER1?=
 =?utf-8?B?bGVlKzk2R3NTVFdEVlRKNCs1TXplcnhmOGhlcC80aG5pMG9kS3BKMXd6WFJt?=
 =?utf-8?B?Ymk5bm15Rmlwb3ZiNlhQV1lua0RjbnFMNjhSdE1ZQzloUUNvSzVlRlVnV0gw?=
 =?utf-8?B?T2k2dnRGc1lXMEhCNzRzYkZlU0gwZUlEYm1EVTVuTzhJTWRxZFJDSnMxSndD?=
 =?utf-8?B?c2o1MW8wamh4aHRHMzZEajNrQVNCclkrcDdnR2x2Mkt0M0JXUHpuNmdPT0dl?=
 =?utf-8?B?Z2wvUzNVTXJUYTBQaWQ0Z3VaNytIZklMQ2RidjZDekNsN0tpMkdUWnZuQU1O?=
 =?utf-8?B?YTZMWGh2UUQ3TCtPWVhPQTI5YnY0Rm5QaWdGT0drRXhzZmR0TGRzWkZOY1A5?=
 =?utf-8?B?NGJGVzEvZENSdElkTTNKNXVQcXRwRFQ3RmFjanJMdU52ZzBLZWxkNjV5V20x?=
 =?utf-8?B?NnN6bWdsdEFTcE5qT2NxUXRzNmtyTWUwZ3h2aHJjZkp0cms2TzYzeVdzUEtQ?=
 =?utf-8?B?RGMzcnNUbFZPUWQ4R2pSVTRzV081ZmNMdEwvWDZiTUhzZ2tuditWT2RDSnZo?=
 =?utf-8?B?RzQ0dXk4R3hURVNiWmNZOExnWlhBNS9ldGU2cWdLUjh6aWVJVU9IdjJsM2Uw?=
 =?utf-8?B?V05ZbUZCUnZKZE1Rc0VkV2JISGQzd0VhQ1h6Uk9NazBXUWk4eUJ5QUZiaWhQ?=
 =?utf-8?B?VjY4VUtXVzAyQndYUTNqc1A1MGpLcGltZTdPS1d2NnoxVE1hazB3Vmp1QmVU?=
 =?utf-8?B?U09vaVRQMStvSis2Qkw4cHFGWEhUSUhZYThCYU9FQVJ3Ymd0OXk3WVZVVVIz?=
 =?utf-8?B?cGRWY29KWnowL3dIL2Q2a2FGenpaVFlVN0IyMlE5Z0FYM3FvWDNlYllQQkQ4?=
 =?utf-8?B?U2I5TGI4a0tycW41NE9QL0src2c1L1lqN1JNY0VCd2E5R3lVUjFXWGpXT0Yw?=
 =?utf-8?B?STc2bEZnQUVKS09hTzA4OTh0SjVRcHhZSVN3N0JtSEcvNnRHOG1WRmdRV2tB?=
 =?utf-8?B?dVpINmIwNmc2elladXk4ajJuRmdrOEtianoxUFdJeDlBOG10NVkxTVpxOWdh?=
 =?utf-8?B?NWFMejh3aFpIU0xPUkc1WkppZUM2WjZBYmNMQTFvbUxlN1lFOTZDU2NNaUVi?=
 =?utf-8?Q?7Z/jdPzhh1AlklzQ1rc3c2E=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8693ee43-4bfb-4036-c3fe-08d9d53d9091
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 20:04:25.0453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: chPWcpd0lRr9hU2EOZK152wpOMNpiIZP5yj1O/uUqUNOTTWo46HrcOxtLQVy2CQDxUdS7H/z6z8vxe//g3z2Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4391
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
Cc: alexander.deucher@amd.com, tzimmermann@suse.de, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

yes, I will use Dual MIT/GPL

Regards,
Arun

On 10/01/22 1:33 pm, Christian König wrote:
> Am 09.01.22 um 15:19 schrieb Arunpravin:
>> +// SPDX-License-Identifier: MIT
> ....
>> +MODULE_DESCRIPTION("DRM Buddy Allocator");
>> +MODULE_LICENSE("GPL");
> 
> I'm not an expert on this, but maybe we should use "Dual MIT/GPL" here?
> 
> The code is certainly MIT licensed.
> 
> Regards,
> Christian.
> 
