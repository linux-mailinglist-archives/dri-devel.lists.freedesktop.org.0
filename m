Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B91485103C7
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 18:42:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3764E10E891;
	Tue, 26 Apr 2022 16:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C27110E852;
 Tue, 26 Apr 2022 16:42:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D11iL4qbHjGTC+E6BG7IK7RenE0qOz2dEbtb5DFGobWH0JufgpC/W4q0dAbpFbs3qwcSBF4G1d3OWSZHGvjsw/Df5Clu/zGplnJm3RDZL/m5L9L4+KV1fI/biI6Blf9STfGfWnHgRrFxgv9EXNZ8BV9P9QKmPujjFSyJkpEmooqbnhCfjFiDauQaJMnhziMRA3Apw9spWq0Rwjbg/bOqZnp3sHLtnZPZ8A/U66i71YfJ9KkJQC3scozv8tex5jBrCEVDRcwGwY3ORoIfuh2Yirw8ko5G1tU4TIoNdEIUtUWteN3/EVCdkxa/YS+eJPEDmMzxqk2gDm4ZVTIghm1D8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=27xBjlTIdlt0lMpHY3V/tRukUQsOidCbB0zY8J5cLcw=;
 b=SwNCaAWgDlV3QL9mTsBmKaobFmML8rJJNg3faxkT19MA4+j5vIsBbf5SNUYiuZC7O4id1tfTrYG2ZFT9AOAPouG5W4HwY8g6ZCfSC7W8ivjFYt93AozD5oKN1EdrsfNQnJnRov0Hj2FXwzc1H784bM21nClQvjRm1hR831WsQg41p6zE9OMX7R7wqrmqmMk6HC8FfaxT+AveN+iJEYFrCuLBj3QIsIDcMiKUo6zSyMl3RE0itx2VuGB7oXLVnl22zzPRyzfLyMKxqH23OB3TIfpCREGGBOVi/ZYlpCSRMr9iz2PZ9Mk+lKLpet/bIfs9uNtVBMzUO7+56RqVRTlYdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=27xBjlTIdlt0lMpHY3V/tRukUQsOidCbB0zY8J5cLcw=;
 b=Gb9mLznioTorZnlMwTTkWy+OA5t/vSChj0pdaFGAqo3u2JIq9PIuJeRpl+gu1Kvu6Y0SrGfAeNqTvBRoBQJm6eKPwkeoqcptP+iQNQwtmHII4ADQm0WHpEJG0dPlf+YMO+R+6+piRm86kxY+s4CVFnCPSvb1lWTMuMAKIJzXq1o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH0PR12MB5404.namprd12.prod.outlook.com (2603:10b6:510:d7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 16:42:25 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 16:42:25 +0000
Message-ID: <ffe7dbc1-8a19-1e19-402d-27efc8e55b39@amd.com>
Date: Tue, 26 Apr 2022 18:42:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] drm/msm: add trace_dma_fence_emit to msm_gpu_submit
Content-Language: en-US
To: Chia-I Wu <olvaffe@gmail.com>, freedreno@lists.freedesktop.org
References: <20220412212558.827289-1-olvaffe@gmail.com>
 <CAPaKu7Tv1Mxt7Ao8kH2-MZDBK7EB0D41COJD8Sjze76t_o-qmw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPaKu7Tv1Mxt7Ao8kH2-MZDBK7EB0D41COJD8Sjze76t_o-qmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0037.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25d2d790-e7d8-40a2-02b3-08da27a3be1b
X-MS-TrafficTypeDiagnostic: PH0PR12MB5404:EE_
X-Microsoft-Antispam-PRVS: <PH0PR12MB5404B4CA5C12DCBE632CC32583FB9@PH0PR12MB5404.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vr80A6vJxBiRhn/dVfQv3ZINKU8s1jQABiWam35WYgXDp1aeFre4KqJ2s5y0gWlUtAr7h4Vd5qbNsVLDshuLg+kgBc1HCbP9sd4miF0zKbLgR4SaVCJR0fiWgapJR3YYsFby3/WHyUW++MdL2jt/2tcgI5gtKzkl3ziSk0Jqz1Y6dvpd5z9bwIBa7ESHbxJh6gZUASP38xO7lRGp6ggZi6D/bU821kzXwLc3bRg+sYCn21BosotvtmbUkkhldrSU3rAve4IcALyDBvUXpSYvLccUbwjRBTCcYQd5sPIzyfHKNDE2XMwuT+jY5kSb2EPRG4JwHLyd+89SIliw6xpGsdf7aD1Deho+ViPqHFlt95391JjhxfLwj/NSfgMMjPp5yK7vgMu+A/YeZtVY3nMuvFfIhbb3h+AR5oQL7WG03hBZWES0WtVMKv6Ppv6vk208nHaFnCcAM+TGXk6RDQCruIDt/crsyk686iRs1jQtRidwdD3cDjqSOsUE3k8R7iGciCqBrXvYLNOv+DTgqb6l5vw1j2TJlcE3spv30m78S/osnrXcOwmD6PRePgLfuFZE/3tYxoHL3mmwFUSPhryoHqHKut8hq9cCKzQSmAgPwVwC/Nh8dPBYQ8Wambx6AwNkJl06ns5vw+q3oaLGKGfeAOdLpbJFzDg3LjOwbZlkbVS9GgFOWtE+L0H9f601VkwvWe9H5872cnoduZeHD2jJKFhjcX1KWzCbho+lTekybfN282e5erY0sNOL0HJz5InH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66556008)(66946007)(53546011)(38100700002)(8676002)(316002)(4326008)(86362001)(6512007)(186003)(2616005)(2906002)(8936002)(31686004)(7416002)(4744005)(6486002)(5660300002)(36756003)(6506007)(54906003)(83380400001)(31696002)(66476007)(508600001)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmRJdEorTDJRR29KNlcrU3VHeHlQUzlWbmpmbmRCQzFTSlVlTC81SEpYc1l2?=
 =?utf-8?B?c2lCV3FBQzdOLzdmc050ZzFxTmFvY3BvNE9rR2dhTEVXWUUwT1ZzVkJyYTFE?=
 =?utf-8?B?ODFYKytBRDRaWFpxdllDMkZWc3N2WjZLSWUyci9qK3laMzNFUnNrSitwUWRF?=
 =?utf-8?B?Y0J4NW9EY2JUSWNING15V3ZtdjZnc1JzUlpmTWQ3b0VmUnN1WldPU2R5aGdW?=
 =?utf-8?B?UHdYV25OaW1VY2Q4aHhkYTNTSDEyNDVWNXU1UU45RWNTZS93NEJqUDdtQVlF?=
 =?utf-8?B?NlcxUGN3OFd1Vk1RcG11ai85dlBkcVl1VXJzK1BobnBuWk5vZjY4NUZXdmEy?=
 =?utf-8?B?WUc3YlZLbkJhRjl2TUxkUmEvZkI3eFdNVW9tWEpCaHhhei9DRmlEWDYwelpr?=
 =?utf-8?B?NmlvTUQ3UkRUd2V1a09SdjFETWF2VEltYlpWc29nK3U5WWE3ZVh4SUpHbEN5?=
 =?utf-8?B?STZ3c0hYOWd0WHdEdDkwcWhGSWRGa2NGZ0FXRHhscG9QTmJCMjNiaU43MnZD?=
 =?utf-8?B?cEZMa2k2YjkyamVGd2pMd3FNelBpazlFb3BSdE1tTitGMUd3T3VRbC9UaG0x?=
 =?utf-8?B?VWkrOW9WWTEyM0IrWWJBeU41emsvRjFqVFRZdDRwSmgrbUJSZ1M4QmZuQ1dk?=
 =?utf-8?B?MTJNWE96dElIanFqMkFLYVFiUTE0TW16NmVybTJoR1pUaVV4ZzZJQVVUazhn?=
 =?utf-8?B?M3hubjlENUlnMmhjRWE1NXltYXNna3RmMTFkMXhvOThnU2ZpWHRTMDZTaUl4?=
 =?utf-8?B?eUpCRm5kZFRTNk9aM20xeWk1OFFnYzg2WTU2RjBEaXBGWGtBVEZNWXpVdy9P?=
 =?utf-8?B?T0lzTXA4UHRGNjBqY0tPR3ZFdlNwdkp4a2Q5c3NwUkJGMVFiblFmaVJpUEZz?=
 =?utf-8?B?cjhNbUZjbmthMHJ4dXR0QTk3aHdPVjlEQlFxVXlITldBdDlocUNoKzU3WVVj?=
 =?utf-8?B?WFU4UWdtbXlxeHArZnEvblFEYlJ5YWJJbWtnN3M3dGNqRUQ0OE44dStxMlpv?=
 =?utf-8?B?eDcyTnBIZklaODdGbGJLcHdnckgyRmRoaFVFb2p1MjVDUWZLU2ZXSjRja2hr?=
 =?utf-8?B?OWhPbzFZVGpKTTQyVUFreFJlSlFzRU5oUGovSE8vQVR6cm53SW9IT2ZneTIw?=
 =?utf-8?B?ZE5mYWZTTm4yZEVlemVKa1FXNFEzNWFSZmlyKzZOWXkxNWpWRmlnRmJEZ1BD?=
 =?utf-8?B?dXhIMnJEVHAyczlFdUtTanR2dkhoTGFwcVRLdm91TFFjdlFIWlNqRkFzRnJt?=
 =?utf-8?B?RHB3SGpMQU9GTEZRUCsrS05waXEvL1dHMkdzQlNacUdvL2RPNHpiMVhYMVFn?=
 =?utf-8?B?SkNCdS9HWDBKUHVWaTN4cGlHeFVRazhuenRxUE9mb1ZlcDVaNDNJK2FnRW4w?=
 =?utf-8?B?WjU2VlRqMVJ2YzlsRkxaRWV6V2JKVXhjWkRwMk5GeUpLeHlGWVdQeGE0ZVZs?=
 =?utf-8?B?cG1UUmRWL3I2TTVwU3pFSlkwRFdSWEV5K29qR3hnakhaQUZwalFrSW9pa0JM?=
 =?utf-8?B?RTA5bHhBWDJXdWNTcTN5TWpqUCsyaVpXLzZVMTJUVHdnUEszaFY4RzNadFdu?=
 =?utf-8?B?ZXA3R3pyOWdrVzA2RGhrWFloSStmMFlRd0VSMnNSQ0I2UlJKTlRHc1ljL2Jq?=
 =?utf-8?B?RGpyYXJJeW4xMW1lUllWemlXcXAxNnh2R0NpdVJJWE1jUXpYVlZyVlZZTnBq?=
 =?utf-8?B?UGJObmdXblYvOFArZEZWNEo5UFhqMTFrc2dvMWhwRGV3Ym9XeE9xdUl0cVpq?=
 =?utf-8?B?ZVEvSjRCZkZJRVYzbFhaYm9oaTIzNFNRS3craitTTVJtZEk2clFacjd5bXVx?=
 =?utf-8?B?bnJGZC95c20rTmdMTkMydUk2ZE1ZSjRGSXpZU2g0ZENKeVBvYXVldm1mREhh?=
 =?utf-8?B?MkIzc2RqR2xJUjlGem5keFJDcDRHZnJidStBOHppYVN4VlZuZjZKc3Z3VzZs?=
 =?utf-8?B?eXB1cVNWc2sxc2JhNGdINitOSEozZmJ4SWxuYXp0b0ZCSi92VUxmclAvMi9w?=
 =?utf-8?B?Rkx1aWJMa3pqall4TU9aNGxEMGg1MUpXZnZhSzJlK2lucDUvMGE0S25mcHZQ?=
 =?utf-8?B?UnNLMWdhN2FWeEdKTmpiZ0YwSExiNHlUYXgxMWdXRWVIWUJSclhrNFJUNnBs?=
 =?utf-8?B?bndHNlVoVEtBZHFpVDdvUEtXUGJCRWU1WXFWQjFkcEdaSzlKVHB6cnZUVlYx?=
 =?utf-8?B?eHRaMjhtczZRcjUzVXlSWXRGNFBOdkU1K1YyeS9SRUFkOUdGcXhrNjFCN1pU?=
 =?utf-8?B?SW9BS0ljcDk3UFJrMllVV09ibEhXa2NHcU9JSkRocDRhTk95MWpOUXNJa2JV?=
 =?utf-8?B?Zkk2YWhRc0dHSGt6YnNzaDJockdNV0dJNzkvUFljbkErUWpCZ3JxOVBvWGFN?=
 =?utf-8?Q?ujH59hmil5ewDQgPqslcCKXS+85w1zOkqAjvdsYwKBCxP?=
X-MS-Exchange-AntiSpam-MessageData-1: 7QP7MUDk23us1w==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25d2d790-e7d8-40a2-02b3-08da27a3be1b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 16:42:25.1127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9wRM3oD78XH85AxOTGdg9eFAbJhYF1kgSZyMAWvl6ovdklkfgcRrF81e+ILmlhqq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5404
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.04.22 um 18:32 schrieb Chia-I Wu:
> On Tue, Apr 12, 2022 at 2:26 PM Chia-I Wu <olvaffe@gmail.com> wrote:
>> In practice, trace_dma_fence_init called from dma_fence_init is good
>> enough and almost no driver calls trace_dma_fence_emit.  But drm_sched
>> and virtio both have cases where trace_dma_fence_init and
>> trace_dma_fence_emit can be apart.  It is easier for visualization tools
>> to always use the more correct trace_dma_fence_emit when visualizing
>> fence timelines.
>>
>> v2: improve commit message (Dmitry)
>>
>> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
>> Cc: Rob Clark <robdclark@chromium.org>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> This has been reviewed.  Should we land it?

No, there are still open discussions about it.

Regards,
Christian.

>
> (Or, how do I check if it has landed?)

