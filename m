Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A393BE5A8
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 11:32:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04236E869;
	Wed,  7 Jul 2021 09:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDEEE6E867
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 09:32:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KRQILkR9yzBcGOIGuOcw0/4VpHmnQiQgskxBfF23c1Z36NhtYxN4jSr4WGoXJdnmIZHMKAFxfvhabM9+D9LQ/o36WwZGoo4+W4LX/rNOfofDMWDjiQU7LdIAnVbksdDUnZH7rquvbo9bAOf9giKZPYe6d1F/0nFW3bXTSAdzQGS8Lynds9NGJSmFCIWfHo2wD8jadFJLdVUlPgwNiwNimW47nwvJgoZh4RDftZ7tkW7HXbBxefSTF0cJKlFaQ38C1vrWa7YnX+EAYZc5U+DNB+tit9d+PCkfLu5dw1/C5cnBxaH0D68frKU1esebnhiqt8FnPF9oEph5eRjHZmvEKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GMNczpKDSrCEkNRmYgdzizlCr5M81Z6f29qQkTPCyLY=;
 b=ZYJqyaJZXlK+td+8QA+y93oAoNTHSZxWzjrjem4c2Tv8OrgcCM6/27KQv+lyvTyNuW/3FrqWTQ2YQy45ulXGmQRBxiy+IpVBBF/txDr44NE0nmwhw2wiSkNx2b1yuGE1G0zkx+VXO/8a7t2WGms0WvHjBPcUv3mXS/emJNWSZStC0VwaAL6helpR6xLqorkKyKzi8a3wf5U9bCIR5sqdLrMQZrf37h2xNIP8lS36llZNsXC0dRGNKI2aX4ahOIqImDnlQQoBvuiKQaNLtHELebOPb8fXKt6PgVTTnQylMm5eTOKaftXOjm5WzNcXp/NP4lxYNr8D+2l9QoAafXpUZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GMNczpKDSrCEkNRmYgdzizlCr5M81Z6f29qQkTPCyLY=;
 b=VKSy6kqAeuVp6j4UVRfg20IZOqFitzRrO1hB9w4Xx8ojZiqvrfWnlvrrzIw97UmLqeiFotVc6CdOBjdIuuxiy80+hOlR63clWflveFrLvydQNn5ACIGvviK5TyVqehUKR76RtSAblgc6iomG5NPtzewOQhhNFLwG8pBpMdexirU=
Authentication-Results: kvack.org; dkim=none (message not signed)
 header.d=none;kvack.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2481.namprd12.prod.outlook.com (2603:10b6:207:40::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Wed, 7 Jul
 2021 09:32:33 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 09:32:33 +0000
Subject: Re: page pools, was Re: [PATCH v9 1/5] drm: Add a sharable drm
 page-pool implementation
To: Christoph Hellwig <hch@infradead.org>
References: <20210630013421.735092-1-john.stultz@linaro.org>
 <20210630013421.735092-2-john.stultz@linaro.org>
 <YOVL1f4m+8ly9fyM@infradead.org>
 <afea8c13-ef8d-7eb1-c362-8d6d1649751d@amd.com>
 <YOVUX1ZmZ3YZpjic@infradead.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <84a2ab1d-e76f-2cd3-39bc-6937586d7e47@amd.com>
Date: Wed, 7 Jul 2021 11:32:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YOVUX1ZmZ3YZpjic@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: FR0P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:7671:3328:2129:96b5]
 (2a02:908:1252:fb60:7671:3328:2129:96b5) by
 FR0P281CA0046.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.8 via Frontend Transport; Wed, 7 Jul 2021 09:32:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78539980-894c-4037-d5d7-08d9412a2645
X-MS-TrafficTypeDiagnostic: BL0PR12MB2481:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2481EB92C5B3829C5CA707B6831A9@BL0PR12MB2481.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N3iIoopWAiLhvi7D+B41ZN6rkHBd7vFAXyPkR0uGo5owskeBGsewI6tsh0/QUjj2nkJJZuGSvtDHdgVCdhsFvk6TLwvyQ3z/apUIF60I63cB4iwhnNAob06aeJHn69EMSDoENKH1KtwW1Fq5PXfpSgSaOqRJp79hJ6ytgoI2daX9p+DxuAuoIMp5cqDXXx5rh3Xz5JyjKuzE+CnV3nnMp/V3nH2aNSlRhw9LhRJ3Hl/dWkBg5CdswuxdilpUm+iEBhW2u4XanJD7gKY/ixv1kTqNEtzGGpNZIREbJOa6Hfr2lUOBGoaXhgeiS3D7E0AZk3cl5QI4wj4ewUvzBiS1QZke+utwJWNFCu8Wt1aVkKQ7hc0me/9DR+sEXGB+9Q81rnrfeoskbVaSTbJZKTFyLipyrotV3G0Wc9MlIYQDOP6SdGi6jcU1/JLdu4TVZCGd3i7ZQk8lfv1PzKBA+qiSTrITUk2XphrhglU5qosVLdTM0c9nlX9B2yAvSSDIeb1TgHn9tNJoaiBx9F6g0JvPC0wBdE6tnjmGMtAjwnz6LZlsqqdCN/qUffcTj4yfcMukVMigAlnUPo82nEZionfeFkx4Hn9xI5hv/EGrhAIG2Y/gHtsmocPPiBG8fY9OoJTS9AUXs2vU2PdeGZHM8akhJ+g/XCXNJoNEgvQwEefIZlTfNjL8nZxHMUX/RPDUa5CAGdy/rfdSWRk7kvK9yKtsVGQBlEQCunooLmKEGcrJ3oQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(5660300002)(66556008)(4326008)(31696002)(54906003)(186003)(8936002)(6666004)(2906002)(66946007)(316002)(478600001)(2616005)(7416002)(36756003)(6486002)(86362001)(31686004)(38100700002)(66476007)(8676002)(6916009)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEVSTjJsNFVuaFcrRkpFUkowcDlNNlZYNS9LNVRScW1ZT1A3REdudW9GajhV?=
 =?utf-8?B?emNxZ0RuS3JSc2VTKzkwRGhoamJwbjlxVkV5TVdlMDBiYVNKR0FVQmVjOFVT?=
 =?utf-8?B?R1JQSWE3WnhhMzhUSVcveEl2RnE5U1I5dVVrUzM4L1B2MXJWcktjcXVaMTN1?=
 =?utf-8?B?KzlubWd4aEdEdzFOeFhoZ29DQkk3RlF2SkI2M3I3UEpkK0ZGQnZ6cVN4V245?=
 =?utf-8?B?RDdQWUFRK2hPNjdBVTFXRmk1S28zVXJmZmdzM2pZRDRkMHQzbXkreVNaMG9w?=
 =?utf-8?B?NlV1MC9GdEVmOFNweUJ0dlVOMmQvaU1SU0YycDQyLzY5ZlhtRWZwbnZBNnBB?=
 =?utf-8?B?WkNIcTVDY0cwamtmTFh3eGg0TzFXd1VaQ3BZeW9waUtTbzRHcEt6Qk1DQUNk?=
 =?utf-8?B?d29FOXdwbm11VHk3K01GeEFJbnh4NGVnVFRDcThWRWVDS1NmbXFZL3VkOURa?=
 =?utf-8?B?NmF4ODB1Y0NjUmd1R29tWkRPM1QxVVVxd0NBY3cwQ0o1QVhvbWs0ZE9pbmIw?=
 =?utf-8?B?L1kzUk9KYWVKNlA2alNlUm12andlOFdOQ2V3K1ZxdDM3aUNJUjFWYkZkSXFJ?=
 =?utf-8?B?Q3JnRUFvY05HbThvMjNYb1Y1Y3NZQWo0R01EMG5Vc3lRSWJCaUdvSXJYemNm?=
 =?utf-8?B?VFdYVlRTbTNMVXNMbHpJQTBnRDg5NUlnR1lOQStHbEpUdzVVQjI1MGlPOVZ0?=
 =?utf-8?B?RnBkN0xqMlZ6WUQ3WkYyUkJoc2dZd2I0cU1BV09jLzZ3cStYeHZOVVcwK0Zs?=
 =?utf-8?B?Qy95eWFkZXRvcUNjdTZ1RHlCZHVaRHNFRHRCSVFmRVVrK3oyb2ZNcEdZR1ht?=
 =?utf-8?B?SlNHZnJlbzFoY1NxOTFFRWpUbDJsaHZiRUo5VUswSjZwTjhkbHNOQkZIZC9V?=
 =?utf-8?B?dW9PZEtCREVzN3BrRVpiL2hhYmhoT2w2UmMremxEdmxnSWtFSHVvRDNoOXBU?=
 =?utf-8?B?MGttaHlwTHV1MVg3UzVKelhhN2dJQXhJc0s0NVlrUE9kMXZNU3hRb2IzTDlk?=
 =?utf-8?B?c1RvcDZJb1E3TEtlbmVEVlJVSnAvQmJlaFpqVGhsY2lvT0x0bU1uTUxWc3pL?=
 =?utf-8?B?ME5Hemt5ZkNmV1dBNFRFRVVudUFXSG5YcitnTFFaY3RaOXFDaE5Kd0RKYXBw?=
 =?utf-8?B?UWYwSTNNSFJ1NkZBZ2psdkI0a0JNZk1RdkJITWZRbVIvQm00Q255NXFscXJl?=
 =?utf-8?B?VnVnUEc4TUtMUUEwSFkzMlN3R3ZQYm5VcjhLSXMwYm4zcjZRcGJWQmVzVzFR?=
 =?utf-8?B?bi84OEhnS2dCbExmNzd1aldSbFJ0SDc1blNYZ0lhRHI5ODhQR0FJTUViMjRp?=
 =?utf-8?B?NW1qNkltY1FmZWc3RytYemVEb1d0SzUyTW1ESmJXYnlqMnd5eFNBTG5lbDRm?=
 =?utf-8?B?MGdtVGlNQ1hYTW1UblROQkVVZlU5eEJWa2tUWDc4eGFTZURyS1J6ZlpmbEZw?=
 =?utf-8?B?YU9XaUp2R045cSswN1FZekt5Rmc0SHlwWmZqWWVzaGxQL2tlWThPR2NVUys0?=
 =?utf-8?B?bWI3YmMzT0pVN3RyQkloZjV5NjNGcmRQblJtclhZUjdZOTBBQXY0bEtWRTdx?=
 =?utf-8?B?QkNxMFRDN2hNbFgrZnlIYXgzNWxSRXZkcUpGaEc5ZlNOdzVtenB1M1ByYUVD?=
 =?utf-8?B?YzkxRVoyc2xNZzYxZE9qTHJPQmFDZGxEMzJUYkpjNHVVd0ZYU2EvbkgwQW9j?=
 =?utf-8?B?M3FPT3BYTm11RVd4UnhoRXRubk1tVTlLekJXeGdzL0E5SzhxZDVOd29QV05W?=
 =?utf-8?B?TzZ0MFBHeVZLVktyemVGTzhJWjloWmhzeDdKQUdCL1F2VDFaT251Yy9kVWpX?=
 =?utf-8?B?RFRTV1BpWVNKY3NUWXl3QVpBczdGWHRKUVA2Z2dIUXdmMG90UVBaNm5CbytZ?=
 =?utf-8?Q?eA7QEzovkbpZG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78539980-894c-4037-d5d7-08d9412a2645
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 09:32:33.8307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e6tDClUTIahkQ05gYxy5GerxB3ReXbrefFi31DewTGFisqWzmwSHNiolle3hmroo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2481
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



Am 07.07.21 um 09:14 schrieb Christoph Hellwig:
> On Wed, Jul 07, 2021 at 09:10:26AM +0200, Christian K??nig wrote:
>> Well, the original code all this is based on already had the comment that
>> this really belong into the page allocator.
>>
>> The key point is traditionally only GPUs used uncached and write-combined
>> memory in such large quantities that having a pool for them makes sense.
>>
>> Because of this we had this separately to reduce the complexity in the page
>> allocator to handle another set of complexity of allocation types.
>>
>> For the upside, for those use cases it means huge performance improvements
>> for those drivers. See the numbers John provided in the cover letter.
>>
>> But essentially at least I would be totally fine moving this into the page
>> allocator, but moving it outside of TTM already helps with this goal. So
>> this patch set is certainly a step into the right direction.
> Unless I'm badly misreading the patch and this series there is nothing
> about cache attributes in this code.  It just allocates pages, zeroes
> them, eventually hands them out to a consumer and registers a shrinker
> for its freelist.
>
> If OTOH it actually dealt with cachability that should be documented
> in the commit log and probably also the naming of the implementation.

Mhm, good point. In this case all left is the clearing overhead from the 
allocation hot path to the free path and I'm not really sure why the 
core page allocator shouldn't do that as well.

Regards,
Christian.
