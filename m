Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB61649CEDA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 16:47:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A19D10E3C2;
	Wed, 26 Jan 2022 15:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2089.outbound.protection.outlook.com [40.107.236.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A646F10E256;
 Wed, 26 Jan 2022 15:47:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajTcSzfuz4q8kgLG+ltop+L5GK6h1bb1+J43Ney74tuL3lNdD3uRmbwJYYQK7RjlDKVp6axA2nBBrBjbBCvYSWhK112akh40Ea5lsGz/eW4MJxlo/uUugQLWAFWQVadcjTsanffDa75ZVSIqLo6/U7e/Rghq/t9RlL9RzxPD5bOrBpl0UrDXynhznEEBSwQd+8Jpr1ZZRDu2foBoy+8BGICZLLnSiYtutHlhAvJIjtUrcITRjeGJmgzxHJGArhYpMjEx+7ePVhVe+E5yAOdfhw5FBGK74Tto0ullbayHOyWw5FGfd2EnVuF4Su0yTWcCrKQ3FwlZU1XnXuGd9HI+2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0/ex4bD+SKveMI8G5RQQWJqFNEW0zL3uj7l3+oGpQk=;
 b=JmYvplUA+4hWqxjc+isgDQN/pfSmNQ571TGNq+CrZpsIX6YqeulsWi7Hoj0S0fgdYq8v2e5aH9VXjS50+bqWfS8WShh33RyO4slKMdNPfdWJJXM2ZLbkE3WE79SbpzFedGTD2nLSv0+nhWiFAZFZ73huaYmEFLNhW6UMIlu0lU69SMoylfJOGMzuyCJkecsyhYteHUcdNapHiZslrwY+ud3I7WM2TWK3r0xXVh93mI3pvh5WSZtyRErKPR/EHCwvksPswXHe20sAje5rq2Sh/HWkB9UDH9/g6NrjNWhf0mC+1gNrnLvCdgNsZjHdhGp0ZO2T7pN5qbjAjZzamfvKHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0/ex4bD+SKveMI8G5RQQWJqFNEW0zL3uj7l3+oGpQk=;
 b=mhYD5ddMI1O1ivkr5irz5NEeD5Aj6o8/oQz0yl2Z/u6JLiKwf9PvzWzFE6AYEfCbQceG6nbHXO7OzXuCfuLOklg+fwPfQVcDy2XE/ZLdFQ4HBasw11Zj/UanqnXPzNdf5JclMA39l53Ml85JVHXYnODX71VddNZvYh1aszmFiJ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM5PR12MB1628.namprd12.prod.outlook.com (2603:10b6:4:7::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.17; Wed, 26 Jan 2022 15:47:14 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::a105:faab:243:1dd3]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::a105:faab:243:1dd3%11]) with mapi id 15.20.4909.019; Wed, 26 Jan 2022
 15:47:14 +0000
Message-ID: <4f4055ea-686a-d71b-4ea4-01ca462da3f1@amd.com>
Date: Wed, 26 Jan 2022 10:47:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC v3 01/12] drm/amdgpu: Introduce reset domain
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220125223752.200211-1-andrey.grodzovsky@amd.com>
 <20220125223752.200211-2-andrey.grodzovsky@amd.com>
 <83d7433c-30e0-6aa0-a9a4-68c9ad8f81ec@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <83d7433c-30e0-6aa0-a9a4-68c9ad8f81ec@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:208:236::22) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc4703b3-120e-46e5-8de2-08d9e0e31f8a
X-MS-TrafficTypeDiagnostic: DM5PR12MB1628:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB162826D75D5C7981572EB443EA209@DM5PR12MB1628.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pOb94I3NS0x+p3jTXWGIBFi2v5+b8k6onrWcYaW45NGGZLKwj4XGwelLe3bnQRoHIUTfIm5Xqo8J7YUgSOUZ5x1tOCnl24csJLB1GjBHw6zOxXekcoWXGeIbXzWGsOd2Vpkt9kXfuKRfZKEaICywYuWE/mMcCxa8cr7NnFwK4BEeq+WiGfKvU10H9WNPDi61A+fT0rfHpKdfGvlU17koimT0V89tQ4U2+hEtm/RFMHo8BKsOPPTywkU8MMZ2x3FqtC3i5fP90GVAd/LX9+hkuwBO5JnQd9jxyK78hwdVeJRQHEvk3rxyoVILdaUs6zdl4CSd0APpwTmvECihdN+JtCahinz5api50FFIYnvVLVZoGAuyef8u1XUSmwzhmtM9tBtdIZcBksYgS4PUG3V2MuU+KXxsyttRufvvXMKVn6Ln2p4dxTZMrrspxL/I5ZWKuev5M15zG7uvSVH5h/zH4OXvEwoUxmWLFc4r1/H2xKd9L0jDk8+EvOoOWq1jaor75JEuFyVRvntrUwVlmUB3xd1P5NrYZcauiu1xRWwIz0VUMe5byjW3/fPLVFho9Wk9oDNZ8U2QsYA7hTiJfzJ1hiBinCa7DbwT9nSsWgi0e5YKivfAM5Uc6IZ6TVr9TpnYvN9A049uefTkPIji7lZ8uOh8tX3r5VC2PUINzxvBZuS89RvxU/FzOxpmD3GX33jtPba8nAxj9vQ8VsANULO668ya0sS7efwB3YRZCTgjx8U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(66476007)(44832011)(66946007)(8936002)(8676002)(4326008)(31696002)(53546011)(5660300002)(6512007)(83380400001)(66556008)(66574015)(86362001)(186003)(6666004)(6506007)(2906002)(6486002)(508600001)(36756003)(38100700002)(31686004)(2616005)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUZLWjFudlpMS3k4OUkyMmlvZUhINGRoRHFZdVVMeTVGU1o0YW9uSHNmL056?=
 =?utf-8?B?cGJ3RzcxNFd1WjlpU1dPaFdVNGt6Yjg3UVFCbEpCTGhyNm0wZHFJS3pYWUtz?=
 =?utf-8?B?RUxIaU1ianJtVElNSUpsRFVLbUVvSXV4cWw5Tk4xcnB4YTBGbThMMlRwTnc2?=
 =?utf-8?B?dm5mS29sSDVQYlE5SmNTNUx4YXNETzZwNXF5bDZPWTRlRTZ6b2NwUmxTanEr?=
 =?utf-8?B?eFhDR1RPT05rTXpKaDZBZ0dtbTdWdnBId1A5bnlETVlaUjFRaHh0blJCWUZx?=
 =?utf-8?B?cnpYYmxNekxIWjZyMFNxb2JnU1UwUlBSWlhaZmVqRGJBQ0EyZGc0b2RBSmJT?=
 =?utf-8?B?QmdsRmR6UUNlRGRid0tWVFcyMDVQSDAzOExidUFiSkU3Z25GR1ZwZGc3b1Zz?=
 =?utf-8?B?U1l3bUJ6WTlENjhxZFRac1F6eW9Cd3JYSUkzN1VqZjVvN2tjdUNnSDc5S282?=
 =?utf-8?B?MUg5Z0M1NGl4NHprQVA4b0JEbGw5OXJFc0NHMXNvelVGWUxHbUY2YzhEZDd0?=
 =?utf-8?B?QzJ5dkNOL25iMjVQTTlvU3lUeW00SmY4NENNdXNRb2VUNTN0cE93c0QwYW5U?=
 =?utf-8?B?dGpnOHZzUUQzdWNhK3ltTm1Ed2VFS0N3M2VFRVUyMkxPQU1mZ2JNZzFzMU5B?=
 =?utf-8?B?Z1hZemdoNkU3cWsvZ0dKSUcrcHJXS3dJbDVPU1hQZVViUnYybi8zQ08wN2di?=
 =?utf-8?B?dlZKWndKWVZLeSt4Rkg4NllITnNHekRkOGgxdzgzQnFWSEZyNjVneElpWVBx?=
 =?utf-8?B?UEFzdTc3Q0xnVVcraWFYOE5Ld1pkd2hJRGRYTmZud2VDQ0hoQ1Q0Q0Z6Sm95?=
 =?utf-8?B?aEc0NVM3TVRoZFdlSGl4ekJjSDRVVG0wejZCU2ZYMmlQVnM0Qnd6OEFCdmtq?=
 =?utf-8?B?M1JqRDdEK2duVFJNeHNlMFJUY2Ixa2ZTSWNBd0U5aFdTNisyQnAvczVtTE93?=
 =?utf-8?B?c0NZQU5EZ0RUTmFWQ2g5RXExMFozTVhCREVxUjFqSUg5Vm1xa3orWjBjYU5o?=
 =?utf-8?B?ck1nV2N2cVJjbGdmUm9qWEVRQ0RXbGZDQVRuUTlSUERMNjJINTRnMmhVMXlo?=
 =?utf-8?B?Z2dPbGVZTHoxSGlrM00zTWt2bUZxL0tVUUQvc3ZYcDd1RDBzL1huZVFMc0Ft?=
 =?utf-8?B?cDMvNjhqRjFYMS9xSGFwUG9DSjQ4MVR4QWF3WDIzNFBNdHJOSFhmcE9mb2Y0?=
 =?utf-8?B?TkgvemltMEUwbjFNSXVvbk1TUEJ1VFlNc2NsREs3VWs1OGwrejMvNVlEV21H?=
 =?utf-8?B?b0E4ZFlkZDJNNEFSSDkwTzM5SjY3aEFLb1dSMEtCbjhrZ0huT2NhVTVGZG44?=
 =?utf-8?B?cEtUZXRmbURJVXNVOU1jc0JVM3hPK2s5OHl1TEo3WjdTVUk0WE81SHJLRlkv?=
 =?utf-8?B?Qk9nSVlZYlBIWFJDL2lpUlJoU0NTQzFSTFA1MWp5NnRJV3ZXOC95QW1LL1ho?=
 =?utf-8?B?bHZXYXo2UzJpOHJ6aVQrVEhENmhyd0FTdmV5TSttMHFWdzNvbm9FeEs0dUZn?=
 =?utf-8?B?YWV6Sys4ZmNtSUkxU0V2U3Y4V1JUUmdLVm8rTGtIZXpsSWRlalRjaTF4Um5n?=
 =?utf-8?B?WVREMU9EeHNlOUFOSG9ZQjZwaDJrcGlBZ04wR1owZG1WZlFiSkh6a2owUXdq?=
 =?utf-8?B?bEh4Wnl6OGFJanFkRTFoWlJXaWRLOHNiVTczUEJENGlNaWYwOFBycWpPV3J5?=
 =?utf-8?B?MG1JVndSZnY2WmVraVRtNTQraWxiQUNwazdzdEZuYWp3TEdHL2pxZ3BMcW1i?=
 =?utf-8?B?K2o1Nlp5U1lsNXU5elVISHlzdmVueWFWOXoyOGYwMFFaYVFXYWtPODZLU05V?=
 =?utf-8?B?V3Z3ZENDbzhFOTVpdWkxRTdkY2JNQm5mTEN3bXNnbWFWVGYwTll1WkpnSVBS?=
 =?utf-8?B?aklsYjlpZkVMcFRPYVRvYU9qMmtGVVFDZjVoY29GVWVsbFdPVVdBYjh6djFW?=
 =?utf-8?B?a1BtVmhtMVVGZzZNSGR3WTl1b3Q5VHRCTm5wTkxxbXczZWFsL29WZWNhNHhY?=
 =?utf-8?B?OUZaN0VNVWt0WFFxNHdqWWgwalVJWmtXT21aNDU4TWs4clVBQXJhYVk1OTRS?=
 =?utf-8?B?MWtDdCtGT21QcjZvRmsrQzRaRnF0THU2SnFFeWl2Rk1iYzlmMlptcWF5Y0dG?=
 =?utf-8?B?cm5Ba0tvYmkyN0EyZUVaVW9zUGhmbE1ZMVV2QTRrY1BZZ0d0SXZsbGYxZEc1?=
 =?utf-8?B?OEZCMGF5OElTMVkrZ2JEUlJjRktUVHk0aHBZZlRaYjYzdVBBNGt0V0FUNWRK?=
 =?utf-8?Q?Kziju++dvnPD0qGMV2fecMiz2vigEc1D86R7SCWEZw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc4703b3-120e-46e5-8de2-08d9e0e31f8a
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 15:47:14.3038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dHRUurbdch5YrcMdneeJShlSFN+kOgrjvHxiq9/clyP6jJjjFZyL9ssj4Ws8sLnbBwRiS7DKYLYNPewGmR4TJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1628
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, horace.chen@amd.com,
 lijo.lazar@amd.com, jingwech@amd.com, christian.koenig@amd.com,
 Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-01-26 07:07, Christian König wrote:
> Am 25.01.22 um 23:37 schrieb Andrey Grodzovsky:
>> Defined a reset_domain struct such that
>> all the entities that go through reset
>> together will be serialized one against
>> another. Do it for both single device and
>> XGMI hive cases.
>>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Suggested-by: Christian König <ckoenig.leichtzumerken@gmail.com>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  7 +++++++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 20 +++++++++++++++++++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c   |  9 +++++++++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h   |  2 ++
>>   4 files changed, 37 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> index 9f017663ac50..b5ff76aae7e0 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> @@ -812,6 +812,11 @@ struct amd_powerplay {
>>     #define AMDGPU_RESET_MAGIC_NUM 64
>>   #define AMDGPU_MAX_DF_PERFMONS 4
>> +
>> +struct amdgpu_reset_domain {
>> +    struct workqueue_struct *wq;
>> +};
>> +
>>   struct amdgpu_device {
>>       struct device            *dev;
>>       struct pci_dev            *pdev;
>> @@ -1096,6 +1101,8 @@ struct amdgpu_device {
>>         struct amdgpu_reset_control     *reset_cntl;
>>       uint32_t ip_versions[HW_ID_MAX][HWIP_MAX_INSTANCE];
>> +
>> +    struct amdgpu_reset_domain    reset_domain;
>
> I'm a bit confused, shouldn't this be a pointer?
>
> Regards,
> Christian.


Yea, I see you already noticed in the followup patch - i had troubles 
reworking from first patch, a lot
of merge conflicts and so I just added the rework on top of last patch-set.


Andrey


>
>>   };
>>     static inline struct amdgpu_device *drm_to_adev(struct drm_device 
>> *ddev)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index 90d22a376632..0f3e6c078f88 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -2391,9 +2391,27 @@ static int amdgpu_device_ip_init(struct 
>> amdgpu_device *adev)
>>       if (r)
>>           goto init_failed;
>>   -    if (adev->gmc.xgmi.num_physical_nodes > 1)
>> +    if (adev->gmc.xgmi.num_physical_nodes > 1) {
>> +        struct amdgpu_hive_info *hive;
>> +
>>           amdgpu_xgmi_add_device(adev);
>>   +        hive = amdgpu_get_xgmi_hive(adev);
>> +        if (!hive || !hive->reset_domain.wq) {
>> +            DRM_ERROR("Failed to obtain reset domain info for XGMI 
>> hive:%llx", hive->hive_id);
>> +            r = -EINVAL;
>> +            goto init_failed;
>> +        }
>> +
>> +        adev->reset_domain.wq = hive->reset_domain.wq;
>> +    } else {
>> +        adev->reset_domain.wq = 
>> alloc_ordered_workqueue("amdgpu-reset-dev", 0);
>> +        if (!adev->reset_domain.wq) {
>> +            r = -ENOMEM;
>> +            goto init_failed;
>> +        }
>> +    }
>> +
>>       /* Don't init kfd if whole hive need to be reset during init */
>>       if (!adev->gmc.xgmi.pending_reset)
>>           amdgpu_amdkfd_device_init(adev);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
>> index 567df2db23ac..a858e3457c5c 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
>> @@ -392,6 +392,14 @@ struct amdgpu_hive_info 
>> *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
>>           goto pro_end;
>>       }
>>   +    hive->reset_domain.wq = 
>> alloc_ordered_workqueue("amdgpu-reset-hive", 0);
>> +    if (!hive->reset_domain.wq) {
>> +        dev_err(adev->dev, "XGMI: failed allocating wq for reset 
>> domain!\n");
>> +        kfree(hive);
>> +        hive = NULL;
>> +        goto pro_end;
>> +    }
>> +
>>       hive->hive_id = adev->gmc.xgmi.hive_id;
>>       INIT_LIST_HEAD(&hive->device_list);
>>       INIT_LIST_HEAD(&hive->node);
>> @@ -401,6 +409,7 @@ struct amdgpu_hive_info 
>> *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
>>       task_barrier_init(&hive->tb);
>>       hive->pstate = AMDGPU_XGMI_PSTATE_UNKNOWN;
>>       hive->hi_req_gpu = NULL;
>> +
>>       /*
>>        * hive pstate on boot is high in vega20 so we have to go to low
>>        * pstate on after boot.
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
>> index d2189bf7d428..6121aaa292cb 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
>> @@ -42,6 +42,8 @@ struct amdgpu_hive_info {
>>           AMDGPU_XGMI_PSTATE_MAX_VEGA20,
>>           AMDGPU_XGMI_PSTATE_UNKNOWN
>>       } pstate;
>> +
>> +    struct amdgpu_reset_domain reset_domain;
>>   };
>>     struct amdgpu_pcs_ras_field {
>
