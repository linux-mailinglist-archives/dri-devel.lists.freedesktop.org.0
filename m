Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC53389245
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 17:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 281FF6EDEF;
	Wed, 19 May 2021 15:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 120286EDEE;
 Wed, 19 May 2021 15:11:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gzx74i3MuGTXLSe1KJhAWJbSF3pOTbyyBuzOq0xvJZ0nqRMiGqGE5JsM5J2W7mO8Kkm+G2AzQvhk73bopLorhEWazt6SCZ4RqWmyHTAvtudOmPXG7MCYbzR7bUMM6GVgg9eCE5Tk7pz2NfGznEjQ6Z/2mdr+9ASTbVsZR2OUerG1hbyaP4cfe5BHVlzPmLZgyVxLCshdWDpC3Gs2DBAvBE81kpQZS2L8SeqWiZ3Om8haXoHWXtRZc7e3Hywdlh1XwsWh9/jJLN2iIIQ5ZRuUsfTbi8USJACFXEPRF1Hto8n+4S5+Adhz5hADSw0HcLCct2+TI75R2pnuY8lujf64hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOh7ObzbcVq5SjNAEZlzXE2ZQGPCwa7800IsZS/LtfI=;
 b=Wiea7bnBfheTzq2Cmi3658i1JUFRDGZJTwm0fLai2ncSZeeA8Jl1xu6AFRR8GTAyZglcGaB/SVRi2oVzj6wgjJ19gu1OTvQegVfwH5JvuHFDTBdlGjuFLOXzNbgECK/vKgh9wjj10788nX7qzUhAyBRfhIBBK8lNcufvMIMIicJbIryHaTufLSjqQtZOsZLlpSzcX9dBRQEEYhqrjMB8RTzEWKJiFkuTtTf69Y9i5B7EYuaEeRUrJCiUSb5HBMkSUgBVtqNdQjBFckcgPnaeVvLL7z58q/AxgulvbNGqMm0lZSS/U9z6hzcj3P+uwjvoJ7w9mJafw+l//XchTiptTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOh7ObzbcVq5SjNAEZlzXE2ZQGPCwa7800IsZS/LtfI=;
 b=xIyrLH/osXlq/rVHnDqI3LzTfcuVYHlxX840LjwD/IJJ2ulm02zLRXwyCq6h7+Yzw4NcSomZZoy18Z9HTBPRtPe38DQD3yZCegWJx7kOMBjm7hepP5O2LgWcOP94WBeDSu7baqu5BnJayNbYTFSmqLxqBB329nRi7gjUIPT4nHo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5210.namprd12.prod.outlook.com (2603:10b6:408:11b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 19 May
 2021 15:11:14 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd%6]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 15:11:13 +0000
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogW1JGQyBQQVRDSCAxLzJdIGRybS9hbWRncHU6IEZp?=
 =?UTF-8?Q?x_memory_corruption_due_to_swapout_and_swapin?=
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20210519022852.16766-1-xinhui.pan@amd.com>
 <c7f28ef7-c0a1-ff76-2b48-4559a8e0e593@amd.com>
 <BN9PR12MB5163D9CC209C0B9B02CD8A5B872B9@BN9PR12MB5163.namprd12.prod.outlook.com>
 <DM4PR12MB5165E11F06A62127A32E9F0B872B9@DM4PR12MB5165.namprd12.prod.outlook.com>
 <075eaedb-ca07-83fa-7c1f-6b94ae5a4e6e@gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <0dad9214-57f4-f36f-40b1-7e7f7f52d1b2@amd.com>
Date: Wed, 19 May 2021 11:11:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <075eaedb-ca07-83fa-7c1f-6b94ae5a4e6e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [142.186.56.206]
X-ClientProxiedBy: YT2PR01CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::20) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.186.56.206) by
 YT2PR01CA0015.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.54 via Frontend Transport; Wed, 19 May 2021 15:11:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ddca751b-5832-4a14-a269-08d91ad857ab
X-MS-TrafficTypeDiagnostic: BN9PR12MB5210:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB52103E3BDEC3C1FB855D4FC3922B9@BN9PR12MB5210.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ooaJ1hmBuafvm/rxY9INEav3ukLxoHYXlEkHDoSiVc4yk45i6FMYaRH+G20ApVd+aVwh0vUo77NIIwIYnUNd6w29ZqA1euIqX7SPIFclO97MywS28so/svpXvgYTnlOjLiRBXFmUgB2DdjefDtfNMypFVTv0fEyYOdYPbV5kyjeNf12m7pm0bYibslK9dyB8glKLe+N6wyfk4b/S5rFEe94aYIuR+gnpc7BbrwUSK2h3CFr+LQjp+aoPFpJnsLJL4R5G98R2Sv1V16lI5wbEO4v9mJfbZJMEsQTp+3/0ZkC1GwlEV+lKkNA7LV3euxOTZkDKRkE4f8lo9qxuGIrMp2Q+VsQdswPkLeKeGS0EJsdmqrKTFEa2jcUsSwMkpvAtV603DTW8V3gPtYplNfrC4082gNEZEH15Q2ahM0pko9H9VzxtRR+16YzgBQyeSEzQD0UTqcNRGn5zDlxhu5dVACKqb77B+vR+gvxbPnNLSB1FfBqkYmDEZ5JxIKOLG0Wa8Wt1DigygZEctNzgijb7iVWGuL0sekUn/stw+OfrKRtHr8L4leuCUvkE05VNIfE7K97e6xpPNUJWRovG7vy9iMpBcdqzpQSQzHEHfGUkm4n0CrWfXtBBXgz6h2ghNcQlhSs3o6vi1UiD4ywDIHx+vjdE0zfKx6lubMxLrsC6evcAm8nc7RiveZbqM70ph7uXsHKgXYl2ziB6Kr1oeBuFZB9c40A0AfVoxsTqk8byOGc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(6486002)(38100700002)(86362001)(44832011)(66946007)(966005)(83380400001)(478600001)(31686004)(66574015)(316002)(8936002)(5660300002)(956004)(2616005)(16576012)(110136005)(66476007)(31696002)(54906003)(53546011)(36756003)(4326008)(26005)(66556008)(224303003)(16526019)(186003)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VlFIYm9LT3ZMN0p5Rm1IZmZoVWRBWjlYL09DRjdiZTFlKzVuKysvaW5mY2c0?=
 =?utf-8?B?SVhDVS8xNG5qbE1xaGM0cS96Z1RsRmtjbENNb2ZnSzAxY3dUbVRqM0ljbnQv?=
 =?utf-8?B?bzlkc1BVQ2FKS2lFdjliUXdvUkhPUC9tOGFQMExYNG41TzFVaWVnVGdSMGlu?=
 =?utf-8?B?RlRLT2svSml5MTVCVVJaSG5rTnY5R2lHM3Exc1Flek1nTnNwUDA5bzhkbDU2?=
 =?utf-8?B?ZGEyOGZKcnRWQ1RqWjJGYTVKa2ltdzBqOXVhL2RwSGpublpOTEI0KzZvSzV5?=
 =?utf-8?B?NjRzKzV0N2VwWnoyRm9CVGJhUTdlVFAwejRYaFptdVloS0F0cjBsZmE1SkZk?=
 =?utf-8?B?TmQ1RWtwbHgreC9vYzJPU0ZuK2xyenFwcElXZUhQZXZVYUhlT3hGeFN3TTVH?=
 =?utf-8?B?M0RHK3JaTCs5a0hJTllhZkVzeDl3YjlJUGtBT1c4NytKWXVha1Y0S2FZTStK?=
 =?utf-8?B?S3h5ZnFPU0lxd3FsQmd6a0ZUeHh1MmdqK1R1N0Vkb2g1MitReUcwYUJtU1pn?=
 =?utf-8?B?bTl6Z0dNRFQvNmp2L1hPNmRwOFBtSDYrWWI4bVA4cktNN2x5ak1hYS9ZMWRr?=
 =?utf-8?B?TStyOFQ1c05welFjWE05bStCRmlzcFg3SldiYzE0M05XdHVOU3pKVjVXWjlv?=
 =?utf-8?B?d2EwVWR1RG9MZTZVbS92M1NGVTg2cy9tQmZLa0lzTzZyOFdQV2d1a2UwaVhN?=
 =?utf-8?B?VURwVUgyejNGR2MvMFRHQnFUNFRaYUwxZSsyTUZnRGpxNm44OFRqcWpKUFFD?=
 =?utf-8?B?Mlc0REQ5T2l5N2lmcUdJV2QvK3VyZHJjZXVUWFJGY1NZWTQ0TjlIZ0VJVXF3?=
 =?utf-8?B?SG1ZZlY0ZS9TSHFJcytiYVFzWGF1eG9wajJZM0UvUkRwODdiL0hpdisyUVJ4?=
 =?utf-8?B?VVcxNW9aZ3V3YWRPNk04Z205RGJROFVLdUtPOVR5OERCVjIxODVzTzNsRUdY?=
 =?utf-8?B?cStOWVBnOGIvamY1bXo4eWdhYlVpcFVrZ2VPRmx6TFZVSnRBbjRRVlBMb1Bs?=
 =?utf-8?B?NFBTQjVQZDdWazFsQkI3WkltMHNZMUxGQVh3ZXgzUnJ2NnBocm4zdk1ueXZI?=
 =?utf-8?B?L3RnQWlTL1ZNUHdDbjZXQ0RiUnhFSTZoUk5wNHNFU1hFNVNYQ29QSGx1djZJ?=
 =?utf-8?B?dHdISFlnaW5MRkNGV24wbm01RGxyUWNrTzZrMlZUUmpDVGRBNG0yU0IxaFFp?=
 =?utf-8?B?MDRIN1NyNEVCQnNCTDd0ZFZsQStPQkV1UnI3ZE4wZ3YyRGxPbTNTbW5DWHJ5?=
 =?utf-8?B?SUU1UFZaNzg0R2h6Z09BZ1JUU2ZjUFgvTzJPZFFvV1I0MTFYRXBGOXRtbnNW?=
 =?utf-8?B?ZU9PVnBvYVFzWlFOTEV2SXE1dG5zTWlTUVJwaTlqZ0gyd0RKaGpDUHh5aVpm?=
 =?utf-8?B?b08wM1RmdFlZUVdpeVZkUW1zRHU1a1lmaVJTQVpybzV2Q3dVMWNMTHVQaHU2?=
 =?utf-8?B?ci9VN0dZeGwxdEV6VDNkMzIzOXBNOVhuQWJ4Zkd6bURXRVJaOUJ2V2JyWjBN?=
 =?utf-8?B?d1pJY0plT3FTOGJtdVpZYkdCOFlpajlZSE5DczcvelBWVXIzVDdJNEg2b1Bv?=
 =?utf-8?B?R0oxclhtMVhlcHlNdHgreUZJUWwxT0xhc1Z4bTM1T1pDWWRKV0g2VURmZXUz?=
 =?utf-8?B?WGFyL0Fmazk3N0xFWHBUT0pTVm1LcWxtRUdrcFdZTVhVTENGR29sVmpwcWtS?=
 =?utf-8?B?OG0yL3E4bzhoR1dwT2UzNERuZ3dES3E1S2FSd2toUVhNb0c5cEp4aG5hVmFs?=
 =?utf-8?Q?bBi2/9FYdIbi0HlMwgR581vNZK80MG00JLhxQqg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddca751b-5832-4a14-a269-08d91ad857ab
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 15:11:13.7014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V09J8M5HGbL3YX3ef2EHIGUbRF7msbCf1zTB5r458G6fCKdVGBADHuPvtcL8wXBxW9unNdIcNZ2Wm/ZC1BpeAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5210
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Looks like we're creating the userptr BO as ttm_bo_type_device. I guess
we should be using ttm_bo_type_sg? BTW, amdgpu_gem_userptr_ioctl also
uses ttm_bo_type_device.

Regards,
  Felix


Am 2021-05-19 um 6:01 a.m. schrieb Christian König:
> I'm scratching my head how that is even possible.
>
> See when a BO is created in the system domain it is just an empty
> hull, e.g. without backing store and allocated pages.
>
> So the swapout function will just ignore it.
>
> Christian.
>
> Am 19.05.21 um 07:07 schrieb Pan, Xinhui:
>> [AMD Official Use Only]
>>
>> I have reverted Chris'  patch, still hit this failure.
>> Just see two lines in Chris' patch. Any BO in cpu domian would be
>> swapout first. That is why we hit this issue frequently now. But the
>> bug is there long time ago.
>>
>> -       for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
>> -               list_for_each_entry(bo, &glob->swap_lru[i], swap) {
>> [snip]
>> +       for (i = TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
>> +               for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
>>
>>
>> ________________________________________
>> 发件人: Pan, Xinhui <Xinhui.Pan@amd.com>
>> 发送时间: 2021年5月19日 12:09
>> 收件人: Kuehling, Felix; amd-gfx@lists.freedesktop.org
>> 抄送: Deucher, Alexander; Koenig, Christian;
>> dri-devel@lists.freedesktop.org; daniel@ffwll.ch
>> 主题: 回复: [RFC PATCH 1/2] drm/amdgpu: Fix memory corruption due to
>> swapout and swapin
>>
>> yes, we really dont swapout SG BOs.
>> The problems is that before we validate a userptr BO, we create this
>> BO in CPU domain by default. So this BO has chance to swapout.
>>
>> we set flag TTM_PAGE_FLAG_SG on userptr BO in popluate() which is too
>> late.
>> I have not try to revert Chris' patch as I think it desnt help. Or I
>> can have a try later.
>>
>> ________________________________________
>> 发件人: Kuehling, Felix <Felix.Kuehling@amd.com>
>> 发送时间: 2021年5月19日 11:29
>> 收件人: Pan, Xinhui; amd-gfx@lists.freedesktop.org
>> 抄送: Deucher, Alexander; Koenig, Christian;
>> dri-devel@lists.freedesktop.org; daniel@ffwll.ch
>> 主题: Re: [RFC PATCH 1/2] drm/amdgpu: Fix memory corruption due to
>> swapout and swapin
>>
>> Swapping SG BOs makes no sense, because TTM doesn't own the pages of
>> this type of BO.
>>
>> Last I checked, userptr BOs (and other SG BOs) were protected from
>> swapout by the fact that they would not be added to the swap-LRU. But it
>> looks like Christian just removed the swap-LRU. I guess this broke that
>> protection:
>>
>> commit 2cb51d22d70b18eaf339abf9758bf0b7608da65c
>> Author: Christian König <christian.koenig@amd.com>
>> Date:   Tue Oct 6 16:30:09 2020 +0200
>>
>>       drm/ttm: remove swap LRU v3
>>
>>       Instead evict round robin from each devices SYSTEM and TT domain.
>>
>>       v2: reorder num_pages access reported by Dan's script
>>       v3: fix rebase fallout, num_pages should be 32bit
>>
>>       Signed-off-by: Christian König <christian.koenig@amd.com>
>>       Tested-by: Nirmoy Das <nirmoy.das@amd.com>
>>       Reviewed-by: Huang Rui <ray.huang@amd.com>
>>       Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>       Link: https://patchwork.freedesktop.org/patch/424009/
>>
>> Regards,
>>     Felix
>>
>>
>> On 2021-05-18 10:28 p.m., xinhui pan wrote:
>>> cpu 1                                           cpu 2
>>> kfd alloc BO A(userptr)                         alloc BO B(GTT)
>>>       ->init -> validate                               -> init ->
>>> validate -> populate
>>>       init_user_pages                            -> swapout BO A
>>> //hit ttm pages limit
>>>        -> get_user_pages (fill up ttm->pages)
>>>         -> validate -> populate
>>>             -> swapin BO A // Now hit the BUG
>>>
>>> We know that get_user_pages may race with swapout on same BO.
>>> Threre are some issues I have met.
>>> 1) memory corruption.
>>> This is because we do a swap before memory is setup. ttm_tt_swapout()
>>> just create a swap_storage with its content being 0x0. So when we setup
>>> memory after the swapout. The following swapin makes the memory
>>> corrupted.
>>>
>>> 2) panic
>>> When swapout happes with get_user_pages, they touch ttm->pages without
>>> anylock. It causes memory corruption too. But I hit page fault mostly.
>>>
>>> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 16
>>> +++++++++++++++-
>>>    1 file changed, 15 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>> index 928e8d57cd08..42460e4480f8 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>> @@ -835,6 +835,7 @@ static int init_user_pages(struct kgd_mem *mem,
>>> uint64_t user_addr)
>>>        struct amdkfd_process_info *process_info = mem->process_info;
>>>        struct amdgpu_bo *bo = mem->bo;
>>>        struct ttm_operation_ctx ctx = { true, false };
>>> +     struct page **pages;
>>>        int ret = 0;
>>>
>>>        mutex_lock(&process_info->lock);
>>> @@ -852,7 +853,13 @@ static int init_user_pages(struct kgd_mem *mem,
>>> uint64_t user_addr)
>>>                goto out;
>>>        }
>>>
>>> -     ret = amdgpu_ttm_tt_get_user_pages(bo, bo->tbo.ttm->pages);
>>> +     pages = kvmalloc_array(bo->tbo.ttm->num_pages,
>>> +                     sizeof(struct page *),
>>> +                     GFP_KERNEL | __GFP_ZERO);
>>> +     if (!pages)
>>> +             goto unregister_out;
>>> +
>>> +     ret = amdgpu_ttm_tt_get_user_pages(bo, pages);
>>>        if (ret) {
>>>                pr_err("%s: Failed to get user pages: %d\n",
>>> __func__, ret);
>>>                goto unregister_out;
>>> @@ -863,6 +870,12 @@ static int init_user_pages(struct kgd_mem *mem,
>>> uint64_t user_addr)
>>>                pr_err("%s: Failed to reserve BO\n", __func__);
>>>                goto release_out;
>>>        }
>>> +
>>> +     WARN_ON_ONCE(bo->tbo.ttm->page_flags & TTM_PAGE_FLAG_SWAPPED);
>>> +
>>> +     memcpy(bo->tbo.ttm->pages,
>>> +                     pages,
>>> +                     sizeof(struct page*) * bo->tbo.ttm->num_pages);
>>>        amdgpu_bo_placement_from_domain(bo, mem->domain);
>>>        ret = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
>>>        if (ret)
>>> @@ -872,6 +885,7 @@ static int init_user_pages(struct kgd_mem *mem,
>>> uint64_t user_addr)
>>>    release_out:
>>>        amdgpu_ttm_tt_get_user_pages_done(bo->tbo.ttm);
>>>    unregister_out:
>>> +     kvfree(pages);
>>>        if (ret)
>>>                amdgpu_mn_unregister(bo);
>>>    out:
>> _______________________________________________
>> amd-gfx mailing list
>> amd-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
>
