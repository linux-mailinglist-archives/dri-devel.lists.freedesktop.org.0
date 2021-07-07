Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5463BE36A
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 09:10:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC1636E825;
	Wed,  7 Jul 2021 07:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B2C6E825
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 07:10:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R+IsS26HG0Nfhts58cW0Zv1E+qp3moP+nCCGIl/kvafUlvkog7hsKJEWnoWpxmPYXnzFmaT6KMAXJge6YsT5BtO2wXWQge5NM6GRT/K/cRbXvIl27+bjXks6UHRoO+QigBC05GhaZtbctB9NivyGBFIfUBXVPtpGlF7RGSV4JuTC71UgXR9rdyyXFOtkDuePUB0xb7S7RVpaRDUnXLa1yBxD6iuCn3QWdakl4YpvED8CEOIVM+FaX3zjamqkzUANOHLG/rO4+oezniKy8Dx+UQx3FhcU+Fnw90/XFIPFxDgv5KA6084YzgjYroRGRrFYu9/GiwCgsUnXTdAVWkW9rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUKtyYK5XN/ODgHfQJDiDlEKn9zXLt5MlEB20+q06nI=;
 b=AcekCOneBtDIWJ9TmPpE5HY7+kSUQyW4h+Pvfh29gLVZel657h228y+BjyRCqZ/xqKM4+hipCoZtGfbrOZPlY8gmhiR8r7DC9dbzvADkLBCiR3O9k1uK7wqMFnUVyoxfXtTy2+wrIBCxsYtbGExiWVSS7jCAaYRB3053UN5pmSi6h/nXNKaf8XsrOh6f0UGLWnehIHlDX8uzXzZRc4sPlMhLb1rl8FhLEJCYqlkK8se/u2fGzHkUv6pZJAGxaoZ2nOy/NmU8r6FXNu57xF9mwajCRiqP2YQTHjsyiXsgblizj11RZ2vgNKs4SBdlOhlm+Lb3NdC9hfoQnfgbVMzJOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUKtyYK5XN/ODgHfQJDiDlEKn9zXLt5MlEB20+q06nI=;
 b=LSFXcQuHn/SgeSmBSuQMaFOkatMgKmah3tGrlhMlYo4axuX2Eq9YKb57GhzZyQ59xjOyQG/fn3RD1MUH4iM2aLm4YJJ/l0E9V2sHdzpHCKkKKYNpjnPAoGVgc3nE6lyz7dcXojEGfDQf1XMMwHAqZgjx23DxgyPQBcFvaDGWWUE=
Authentication-Results: kvack.org; dkim=none (message not signed)
 header.d=none;kvack.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4336.namprd12.prod.outlook.com (2603:10b6:208:1df::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.33; Wed, 7 Jul
 2021 07:10:32 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 07:10:32 +0000
Subject: Re: page pools, was Re: [PATCH v9 1/5] drm: Add a sharable drm
 page-pool implementation
To: Christoph Hellwig <hch@infradead.org>, John Stultz <john.stultz@linaro.org>
References: <20210630013421.735092-1-john.stultz@linaro.org>
 <20210630013421.735092-2-john.stultz@linaro.org>
 <YOVL1f4m+8ly9fyM@infradead.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <afea8c13-ef8d-7eb1-c362-8d6d1649751d@amd.com>
Date: Wed, 7 Jul 2021 09:10:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YOVL1f4m+8ly9fyM@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: FR0P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::20) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:7671:3328:2129:96b5]
 (2a02:908:1252:fb60:7671:3328:2129:96b5) by
 FR0P281CA0074.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.15 via Frontend Transport; Wed, 7 Jul 2021 07:10:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4cca0376-c6fa-43c0-2b2f-08d941164f11
X-MS-TrafficTypeDiagnostic: MN2PR12MB4336:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4336130117086455A5E407F1831A9@MN2PR12MB4336.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EAY7l7giWXwCvJDdWy9tnlPIkNCPVQnD2yJEQMXeBvhpHUR0hZ8xkc4ux22ndA5btHvgLcFTu63pSMlrOVEeqYRf9aieR6rTXdgGFGipSFmiJyr6m6D+fMJ72/+FSU5h2V2QCk5xuQD0SxDEvCae10Qq8UEOZaCIn2/AsOAVBQcUhIjmLIMkazKcuj1edpQe0JzwYjfSwXpeOKD8FhgCKZufytV1wBym3HXiJG+nDt0xVT7S8je/AbE0Rr309HavTY+m54TWR1xekePRWuoMX3pxquEfJURgJTR3j8ozXiWuWLOgL48vtvyl16X7ZMMWaLc211DhAmqW/JIa/x2k3IliWNf7CHUyGOthrdvRI+nr57E6+Wyg3WD2TfEl0R1+x8qflfh1KVKMJ3v1/ZcTsTL0rdTijkUbQ6QvyZ/m6A9YedKdnlWRH4Ij7/BgxSC6o40mZ5gnEnvPgzBqDS7TH6Ya5AkN5sf8BrYYLIZuzF3Ejd7fwuRaUHe5udqgm5RyPGccRhrtnQMxD7FfSx/y9eldz/lIEMpEFmiFKh01d8qndyLqHTZifYJJbG4Gs+6NPxGUcbqD2nhycyUr41jqm3qzppBlp592HLfjKXxsiZNWx+PQCtrMeKOCTikIl++Wg0fDfsDxXcUXASz+o3nQkPhO1s8j22MieNrv9BMeOZVlWQ7WiQEO3D8BOSAZQeYzCWI1kj3RBnySUkfJ+3wcg/SSVK8X6kyCgDKoMbD0J/s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39860400002)(366004)(136003)(346002)(8936002)(31686004)(66556008)(7416002)(478600001)(8676002)(36756003)(5660300002)(186003)(54906003)(38100700002)(316002)(66946007)(110136005)(31696002)(2906002)(66476007)(6666004)(2616005)(6486002)(86362001)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0VzSXBJSlU4eVp6OENLa0o1cUFaRDllNHNpNmloaDQyeW5QQTlPaTYyRlFE?=
 =?utf-8?B?VDh2NmNGb1AxaU5SdGU2RFZjNWltUERESTFjMHgyTXdnSHEyV3hGSmhrNm54?=
 =?utf-8?B?TTJZb05pSkNUK3M4T3dFM012MHAwVUZDMEp0ZS9Ib3VZTW56c21XUi84OHZ6?=
 =?utf-8?B?d1ZXM0EzdmVGVDFsbjZ0eUZTMkYwdmRydmJWTW91dnZJbGVTM2ZWRXBaUG1r?=
 =?utf-8?B?SHp3QUJ5aXFYWVB5MUNra0pFRXE2bjNzeXF1Nk53K2FaVHRtRVRIRXN6Ry9Q?=
 =?utf-8?B?YlVsS3pTVWxSZWlBVU5rUWtTVUdqUWt3L3R3Q1JOc3pWNi9KbU5rKyt1VjJY?=
 =?utf-8?B?T0QwVEhMSUpIaXhRalR4cXJJNWNTdHJyMEZuMWxXWXZDeVRIWjdlemYvTmNG?=
 =?utf-8?B?ZzhsTFYzd2EvY2RvRlJWUlVycFhRamRxSSs4SHE4WFE2Q0svZGxJdWVGQWF0?=
 =?utf-8?B?RmlaaTFvdFhMNk5oN0hNa0hTU01WNjYweHVZVXpEN1pJSGRkNEsvZHhwWDBN?=
 =?utf-8?B?ZWZZQ0JWSVhzdmYxcC9ZSHFRanhCdmxsQmJTbVJDcCtUVzhOdjRsZDdlN2Jz?=
 =?utf-8?B?TXBwUGgxWUE4SUFwaWs3QlcwOGZDeU42TElyRlN1UThuQVVOV2QxTURjZFg3?=
 =?utf-8?B?QXUxaDJpd2JtWmp3anpnYkttZWU5UGVjS1c2ejl4RVJCVmdtczBKU2tqVHhK?=
 =?utf-8?B?ellzemVISjdraWlWVW9jQXZ3U256NUdOS0xsUjJ3NTRuUmRUbkdxUHU0b3RT?=
 =?utf-8?B?S0RhSnUzaXlzeDRtdWFySGFNZngxZjhKbnNjTktvYzl6ZmlRbzhlZXJpdE9R?=
 =?utf-8?B?ZnpGTWxDcEpyY3NQZE9Tb2s5RCtXdnFKT1dDOEtIZjk1b2NFbk94NnNnUUU3?=
 =?utf-8?B?R253SjFPUlZhUnkyemdqRkcvckFCeU1lWVlwVm1najQrL3E2R2JtbE0vTm1Y?=
 =?utf-8?B?T1duY1FENUVrRG11Y0xrVFlZc2JpZlduaGxoRkNCVFR6OFJoKytDOTlsNk0r?=
 =?utf-8?B?d1dkODluVnpoTVJXTGVmb1d3bkw4VFFSRHZWeGkrQjhVVlZBRnV5dTZIcDlU?=
 =?utf-8?B?V1pIR21KZWRJZVdXT3lKS2VxZ1pWQWpueG5LYWFkMDBiYW1HRkprbTZxaE1u?=
 =?utf-8?B?SE8xaC9kcHZPei9TeStnOWlVU0ZISlFnY2FCTWdVN2FwK1hpU1FDbnRxN1U1?=
 =?utf-8?B?NngzeXhrNlBpUnJTRDlkekgxOG1ucE9TL0lIUjJ5YXJNenlsaXRnM3FTaXVD?=
 =?utf-8?B?UzdCNzA5K3REYVNjOHVtMlQySGNuRU5rL2h1V01FMDJvOHFObDU1SzZ5SGh2?=
 =?utf-8?B?aktIcjF6dGtLMmZqSTI2WloxWjU4MHlNU0NuOURLNHN2U2xRYUwvMHRCYzJM?=
 =?utf-8?B?OThiWml5a0h6Ky9Oa1k1T1A0a3ZXR3Uvc3JQTUFUMjFKbExYYmR2UVJqVnpO?=
 =?utf-8?B?T0dEaFNPbzA5TEptdllnZXZQMUFjT0tMNjhXMXp2ZUFKZ2ttd0I1aE9OMThq?=
 =?utf-8?B?TGRITm5kUHhyejZlcUdtbmJ3L0w0alpXYno1NEdPQ2JHb05VQS8vdm5VKzk4?=
 =?utf-8?B?cmQ4cHpCaEtTT1cyQit1ZVVJditULzBxM1k2cE1OMjVkSlpwM1VtQlJqVlFn?=
 =?utf-8?B?ZGFEb0Q2WUdsV3VIa2ZlamJYUHBoODVuaFRuZjhvTkZJRVhNdDVZVVZldlZx?=
 =?utf-8?B?bjVzdjdGU0Mxd0R6R3pGeDB6VFExUGZnS29lT3puVjRodXd4NUN2MHNjSTZp?=
 =?utf-8?B?Y214ZUhESUI5RFNxMVlBZFBROXdlUENJSk5LbnA5RktNc3dnNVZSR1RVRkJB?=
 =?utf-8?B?enBranFxd1d0Q2RWM0tQd2k0cUdGZ3RBc0UwamE4UXNkQ1ZvU3dEblBkNFZl?=
 =?utf-8?Q?/ZHC6dsD3c7nV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cca0376-c6fa-43c0-2b2f-08d941164f11
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 07:10:32.3365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ppfygo3HClSx/ALIwQXUXe0v4iHvXa0B4Dh3DDcAij21FV+I5J16+U+u2n3ZMoR7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4336
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
Cc: dri-devel@lists.freedesktop.org, Sandeep Patil <sspatil@google.com>,
 linux-mm@kvack.org, Ezequiel Garcia <ezequiel@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, James Jones <jajones@nvidia.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Mel Gorman <mgorman@suse.de>, Laura Abbott <labbott@kernel.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>, ??rjan Eide <orjan.eide@arm.com>,
 linux-media@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 Daniel Mentz <danielmentz@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.07.21 um 08:38 schrieb Christoph Hellwig:
> On Wed, Jun 30, 2021 at 01:34:17AM +0000, John Stultz wrote:
>> This adds a shrinker controlled page pool, extracted
>> out of the ttm_pool logic, and abstracted out a bit
>> so it can be used by other non-ttm drivers.
> Can you explain in detail why you need a differnt page pool over the one
> maintained by the page allocator?  Fragmenting the memory into all kinds
> of pools has lots of downsides, so the upsides need to be explained in
> detail.

Well, the original code all this is based on already had the comment 
that this really belong into the page allocator.

The key point is traditionally only GPUs used uncached and 
write-combined memory in such large quantities that having a pool for 
them makes sense.

Because of this we had this separately to reduce the complexity in the 
page allocator to handle another set of complexity of allocation types.

For the upside, for those use cases it means huge performance 
improvements for those drivers. See the numbers John provided in the 
cover letter.

But essentially at least I would be totally fine moving this into the 
page allocator, but moving it outside of TTM already helps with this 
goal. So this patch set is certainly a step into the right direction.

Regards,
Christian.
