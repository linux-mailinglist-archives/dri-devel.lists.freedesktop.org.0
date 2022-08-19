Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A22599D08
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 15:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813C710E39B;
	Fri, 19 Aug 2022 13:47:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5430310E39B
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 13:47:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wt1nHgXzZlFltks+psRMPiMI3wmK6OGtZ0o6H2vXpuvZrdMVLgbqs2vFB8q9cMVDs/G4reD2XrfVwTo7nSzi+5oQVmPwBFBCBtA77yEj4J6Q/5wzZHHCL/USBCGvLeon47F5G8HenNKTzT5NqO9kNPNYDzWxU6gQHe3/pXwQvlgwmUmFSiR8IC12my9XA+wEnD51kY68q2ho9sBTtnBgpso8JsngwNa/qzP9bosW+C+dBP9OqRl0Tkbs1dNvZx3JfXpKjtyA/iKIJQKZIHxz6MglFO2izWVasRi06oA6eN8909yUvJ9jvB4murjA8w2mFTd6JSEFmRiSdLaPrdE05w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G0bApUwGzZ62xoLPrc+Py928nVwE0rH2AGfA1U3PlJU=;
 b=l+gM2d+Uu0mAwIq6y4TEmFk9bOyAZrA6dJn//E7mYpFsAjHAuZ/DrcjupjKYE71ydLz0W5hB0V+8ZKZRWfKkFbUP/q1kIkZerZLk/mFPSh11fVvzetBbu0ygccJS7KOiQuWJuQGeqGFGh5YRQOB0oGRIqSykbWvpKHw5M98la6LJhvyj+FBMVwy/vEtNq5h+NdOUL/23YRhHX9Ezyu6vwLizN38ddq4fiXbYYzaXUmccGT1n6/1yoPW42qRd7wphJ4g7Le1E6P7g/gF6CuwjZ2En/2ebKNFdT2PbGrA34NwuEvNsMFwdERl2lKPoCDLBtfqTuPXg6OuxPXVpiNwSzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0bApUwGzZ62xoLPrc+Py928nVwE0rH2AGfA1U3PlJU=;
 b=dJfGzMkINEM3W5n3dciWp5m6dWuHgxz1sdHpm5wClE4Vlz+s8QzkJkiE01XHfUlLPdj1vanPMm/KC7URJKy5Orq3mAeYBd8KPAecxXj0IKSqkXMQPLr+6Y+kwvdmvnYR4xlJEdBzgXDd8eDPIteG+CW0xwTFOJO5QA98Gyt7iWE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4047.namprd12.prod.outlook.com (2603:10b6:208:1de::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Fri, 19 Aug
 2022 13:47:29 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Fri, 19 Aug 2022
 13:47:29 +0000
Message-ID: <77d47856-4b01-cfb6-bdd6-ccb3f68014d9@amd.com>
Date: Fri, 19 Aug 2022 15:47:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/4] Allow MMIO regions to be exported through dma-buf
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
References: <0-v1-9e6e1739ed95+5fa-vfio_dma_buf_jgg@nvidia.com>
 <921de79a-9cb3-4217-f079-4b23958a16aa@amd.com> <Yv4qlOp9n78B8TFb@nvidia.com>
 <d12fdf94-fbef-b981-2eff-660470ceca22@amd.com> <Yv47lkz7FG8vhqA5@nvidia.com>
 <23cb08e4-6de8-8ff4-b569-c93533bf0e19@amd.com> <Yv+MD44ET211LMIl@nvidia.com>
 <a29de43e-2dec-fd27-2e24-31af1d3ce470@amd.com> <Yv+SfymnK9RF0qTA@nvidia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <Yv+SfymnK9RF0qTA@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 136e4f94-f388-478a-479a-08da81e95bbc
X-MS-TrafficTypeDiagnostic: MN2PR12MB4047:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fdpk82PuExZAMVYkMB8OuSPfhLpCg6EBToyvSe8G5tC3DHbI/FLxx34xoE5dTjJQK3AWft4Py/RnqoJOYdg7pG2eNBsQOy0Wg5GaTvl137pcX8M7mbRJRICBF9kDAEWqe6qbaZui4SMSSXVCV2irZvg3lqhl43mR/GREd3uGJwErqJvLkDGJIcPftmcA9qESGX0M3f7LoenXvKeS22TmTxv+nZSisORZBpmkHVM1wdXFuAnTpJNaFzP/DUjv/rfVSefmFSZJWgfWV9k1q/TALTIH/ci5Z/7Z4LF/HbmyXIGr0mggssSZTGeupxUncU3n2J1zSESMQmzPZl/KD65+mWTkhdZ9hRklnZFeYHd2AXS6W4aKFbVB8zxzzlAvqnZJIlhC0+wSHd+3oBt65MI9YpODnSx+CMe9cxc4v147/LbY4wEzeGR1kFSQ+20chNLmw7N9AELSinFIpAfgiVCED2qbDLUAgUds86Zk2JOjfWSsdSVUMwAgyyY++HEtwC3xYGTXZXwMEnhn+UBVHHbsW99hfpqJpGMoVLT68wfFTVM1SvW/LXkll7F1Ym5wO1anWHjXdlUxyRjbcam/etmNnEO6Ogb2eQAtFzzz62852h1tiCjERcM7o0rrpB0jnRCjGmY0OkggAsGd4d5kaBTup+6x1o8IJAV85xvVMTuQu9+wabQmlOaIw/DkZywCaiKMKrbdqWpiek22vVzqRYDPg852dpTi7y6gkOoRP7Fm55uE+Qm3vOLgQQYjjwaZhlHaNdki0EL+Eb/2yDKKI7wjBwHInLqQYRDbUWWf48g22LE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(366004)(376002)(39860400002)(346002)(83380400001)(54906003)(316002)(6916009)(38100700002)(7416002)(31696002)(8936002)(5660300002)(66556008)(66946007)(478600001)(6486002)(8676002)(4326008)(31686004)(66476007)(36756003)(186003)(41300700001)(6512007)(2616005)(66574015)(6506007)(6666004)(2906002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXhSMThDWlpFV29IKzBXQTY0OUVZdmgyazR6U1pISk1hOEdpSnZQQlV4U1dZ?=
 =?utf-8?B?WExpNFdyNFludUtJcDlkbDVoS0tjUmVpNWJ2aDMyL1dseVJ6cldHSGdXMTVF?=
 =?utf-8?B?UEZPME5LZUVLL29Zd1B6V1VqdkJiekxjbHVXWGQvdXNZQllETFdDYWU4OGtH?=
 =?utf-8?B?N1NrZkR5SllPL3J0NDhwcW03U2o2ZitZaHBOTmRPSXU5OUZFbXZWbFJKTVJZ?=
 =?utf-8?B?akNPNU5qRWlJODJuQkFiNnhsM0pCV3hiaHl5MnBXejZIUTkrY1FRREtlN21K?=
 =?utf-8?B?MkFoZ21ZSVJSMmRYYjIwc3JxWTRyTFJINjhEdmEvRjJJYVNxdWdwWE1vZ1Ji?=
 =?utf-8?B?aDdiK3E3aFpLNXpvTEJkWDNKS3lQSjNtTS83SkhFOUtGWUUxTlYvR1g0Q2tj?=
 =?utf-8?B?L20wcGNTZGlBRkJXR2hTb2M1VWk0S004K2xUSUlaL1c1Nm91R05WUEQwR2VK?=
 =?utf-8?B?Y2s3UVZkSUxkWGJsNUQ3eWY5WUxrRC9DdGlWUW5hdU9WNm1qVmdTRnY1MGUx?=
 =?utf-8?B?RVBpdE1sMzN4Z2NOUUk3Y0YyNzczVzBWRmladkE0RXR4bGV5cVRVN1NGbDAy?=
 =?utf-8?B?a2xYbDZ0QWRZbnhkYjJQRm0xeVdENDg2TGV2MWNpZVdud1FTZTZZWUpISTNB?=
 =?utf-8?B?SGdrdnp4bzFPSmZxYjA2UjhqeVNwMkI1Y0xKcnJPdUpvcGQ5c1dZYW9WSE9V?=
 =?utf-8?B?VEJheHdOUXBxNXJ5MzFaNTRXdWVPSjE5anVYRHBSalhiSWJnWVhLRFFER00v?=
 =?utf-8?B?d0ZsdElwMmx4UUplb3B6VUJpZ01nVTVMamI5NWNIb1ZZbFdSZEJYcHVVOVpE?=
 =?utf-8?B?aXl3RkZrcCtzOFQvU3JwUWJzWVdzZjdWZnEzK2Nmc01RYnhlczlIeHpacyt0?=
 =?utf-8?B?aTYwdEtVU0U5L1o2NC9tTUlxSDFhMDd6RlVIYjRId2Z5c3JvZFY5YzdyYnl4?=
 =?utf-8?B?WDZsdUVuRmcxUjdQWFhWTE41NTBTeERSdUpvUkIzaTg1R0p4STVPTFhrUEtP?=
 =?utf-8?B?Vi9iZDF6SUgyY2c4TXJFdEFDN1FKUGE3dHJnRHBTazVhQVF0SFZ3bGdUVkxC?=
 =?utf-8?B?UVhWNVA0RSs3bjNneTdiWkZNUm95YVkwTjR5ZUxiTFBVNXBtSnJTRUcrSitt?=
 =?utf-8?B?bGNwVlh5UU5HUUJWTVA3b2VhUzd2UkdWZzJnSE91SDVCOUJzTUNOYmVTWDVw?=
 =?utf-8?B?b2Jjb1daMmNQdTM0R2hjMEU2YVhyN0d1Q2NxenZydHBCb281VFBnRk00VnJB?=
 =?utf-8?B?Wk4yaGpwWGlSeWY5RGxOMTNUOStYV2FXTStSSndvbS9yUW10bWthZDcyU3JB?=
 =?utf-8?B?U1h5QS9zMWUrQ1UxWmJaQ1JxeldzT2NPKzVkYU5xUU5vR1JEY3k0Z2FYOXNk?=
 =?utf-8?B?Vmx0Yk94dnd4VVVONjc1QzhtRGdyaFQzalQ2ek1QVDg0WXFoc1lQREx3T3c5?=
 =?utf-8?B?eTNENkdkcVpyYW5NZ0x5Wkd0YXlBMTlpcDlXb1VjMjlzRDJPbURhSmJrMExq?=
 =?utf-8?B?Qm56QjlwZ0pIWXZnTW9UdEVGTzU4Qm02clduT3M3S1Y3L2hybnFtMEVIaDh5?=
 =?utf-8?B?SXZtdVR3cEhSYXc5M0Zmalgya0VsdHFMcmdDWnJKc2cwYTVlWHFnMUJmaWVD?=
 =?utf-8?B?SFhWOFpuMGpBM2tsdHZYZk5CZmpYWnphU1BIVVk0QW1HVnRvWEZYajBXcVd6?=
 =?utf-8?B?c3pscFZOdVJBWXorYWV6QzFTSEhKYlNIWklBc1BuV1NXSE5DMzNtUGd0dndV?=
 =?utf-8?B?Sm1FQlIrVHhjUnFlV0NING55YTQ3UG5EdzVKNC9WYW9lREdPcUtPQzFJaHd6?=
 =?utf-8?B?WVhTM3VDeXBvN0paVDRnT2xic1c1M1pEQ0lXVVdtcmduU2pTS29pcGhkZzZq?=
 =?utf-8?B?Q0htK0RMcDV3alpkNU1SQjlISTBJSWFFaVdNRVVyRFd1aytRMGVHNkNQdU5S?=
 =?utf-8?B?cFI3Z0c1UG83dGF6UUJHYTRXWExsem1vd1pZaWNzbWc1aXVNeHN0QXAwOXVP?=
 =?utf-8?B?RmdJUmoxWGd3MkpIVUd0YlZEU3lvRkV3UUlYckszZk5pUkU2eEdFQXBIQmlk?=
 =?utf-8?B?YytsOUp5aytCNXdiRTc3N1EwVE56NDlGcXg3akR0VGdKeFNtRWYrTkhKRXp2?=
 =?utf-8?B?c3BGSVZYWk8wcFNwUnRIN04xQzhZbTBOaHlySmlnUlZWUXR3bi95UzFZR2tM?=
 =?utf-8?Q?h2h1v/WZ29KysPNMtnlCReIKK4x7KQLhOrDCceaWZ5hG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 136e4f94-f388-478a-479a-08da81e95bbc
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 13:47:29.4493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lbBdBZez37dc1hIkJCZIcg+4CJHERZM24o/vX6F+AtN3eoH8/DnM2hY/+vhomBcL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4047
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
Cc: Leon Romanovsky <leon@kernel.org>, kvm@vger.kernel.org,
 linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Oded Gabbay <ogabbay@kernel.org>, Cornelia Huck <cohuck@redhat.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Alex Williamson <alex.williamson@redhat.com>, Maor Gottlieb <maorg@nvidia.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.08.22 um 15:39 schrieb Jason Gunthorpe:
> On Fri, Aug 19, 2022 at 03:33:04PM +0200, Christian König wrote:
>
>>>>> So we could delete the try_buf and just rely on move being safe on
>>>>> partially destroyed dma_buf's as part of the API design.
>>>> I think that might be the more defensive approach. A comment on the
>>>> dma_buf_move_notify() function should probably be a good idea.
>>> IMHO, it is an anti-pattern. The caller should hold a strong reference
>>> on an object before invoking any API surface. Upgrading a weak
>>> reference to a strong reference requires the standard "try get" API.
>>>
>>> But if you feel strongly I don't mind dropping the try_get around move.
>> Well I see it as well that both approaches are not ideal, but my gut feeling
>> tells me that just documenting that dma_buf_move_notify() can still be
>> called as long as the release callback wasn't called yet is probably the
>> better approach.
> The comment would say something like:
>
>   "dma_resv_lock(), dma_buf_move_notify(), dma_resv_unlock() may be
>    called with a 0 refcount so long as ops->release() hasn't returned"
>
> Which is a really abnormal API design, IMHO.

Mhm, Daniel or other do you have any opinion on that as well?

Thanks,
Christian.

>
> Jason

