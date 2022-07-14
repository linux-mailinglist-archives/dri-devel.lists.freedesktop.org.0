Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BC55754EC
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 20:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314F51131DB;
	Thu, 14 Jul 2022 18:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2044.outbound.protection.outlook.com [40.107.95.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D3A112FE9;
 Thu, 14 Jul 2022 18:26:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YWKtSsilNlGaJM3Q2v54YjXUsBvUdx4P7reG0aN3YrEwCibmJwb2O4CinVf2+KUeDDWMo+IYcPP2wpTolk9Pt/EivXM09mj5EFvlWhRsYqXQzSAwg/OBEEHjWc92OnJdSztmUlPlskTE57kKMqsuvsmUfaMJOUnDI4In9EhiKcg518chv3YwchhcwT1xVDbPdZZJhaKMutDtBqdsh8ClTheQimDilVjPyrsTjiH/lUYrAX6eil8pJ+HKnzkRZ+TQx1iBzv2oLJzVPLjr4m0ePJyt19X00FiybCn0/rDkuANK4IXDlui3jMoCFrn05dfD1kMlGLJNW2xhwYvblhCuKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZbylRAAjoVwSL1Tv5mraNjYKwPtzFOJSt+r8Iw1FJ8=;
 b=M5KUED+RU6WiPZRbhZdJV0bRKb0ziR9zaXvqGihG5WRzWuefGjL/4olkBrODNXxODsv9dgMX3U+rMcKtC6Y6dJJ1RyjOvwL0gjmflhQ62602HxLErjEACvcQwK1/Rri9QB0Z8BZCcKpgVeDlwXOVQuQ6obTCVNNX2Klj3htl5Ngj2N4jxSULcEQp3B9xTtsyACpEFHjwzH6NmIssKF3q2lU+nmfkxUuuiGjuOs3Kr17215AdEvdofscvlBPYmLLQ1zjHe3a91OkFGwQnaYAWFhhD2yHT8YNlP7dYVdU+so7pThLkLkObOpVmcoEmkP0JUpCkvZj8js/fv12sqbjsuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZbylRAAjoVwSL1Tv5mraNjYKwPtzFOJSt+r8Iw1FJ8=;
 b=HmDQ6UJMczI2eFe8XyTgTzdX6w+IwUwbJ87+tYjKe8PiUKSZIu/FUtMFHAPLsdS6FezGNPfG55Khjfy9Woa3dEeGN864Jr4mLw+kKiBGxMY/stKDGNktI6rTqZpoyaSz7lKQw4PAeS4b2JVtfwY7Cq3HmUeUs5f+l+mlX9V8y3c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by MWHPR12MB1951.namprd12.prod.outlook.com (2603:10b6:300:113::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Thu, 14 Jul
 2022 18:26:00 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::9da9:705a:18ae:5e91]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::9da9:705a:18ae:5e91%9]) with mapi id 15.20.5417.026; Thu, 14 Jul 2022
 18:26:00 +0000
Message-ID: <f5545b0d-4413-7919-deb5-c38f5d833d21@amd.com>
Date: Thu, 14 Jul 2022 14:25:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 01/10] drm/sched: move calling drm_sched_entity_select_rq
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx@lists.freedesktop.org, Marek.Olsak@amd.com, timur.kristof@gmail.com,
 Yogesh.Mohanmarimuthu@amd.com
References: <20220714103902.7084-1-christian.koenig@amd.com>
 <20220714103902.7084-2-christian.koenig@amd.com>
 <9bfa0ac5-b3da-8682-25d7-b818faf9a1ec@amd.com>
 <49b28cb0-ecc5-836e-aa57-1ea133f8d2a8@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <49b28cb0-ecc5-836e-aa57-1ea133f8d2a8@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0146.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::15) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab27e952-f5e8-4d2d-ace0-08da65c64d54
X-MS-TrafficTypeDiagnostic: MWHPR12MB1951:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wn8xgnenqnN9anVaw0z72bMEM3rwu38iB9+kL9069GrjMALfweW8JZwfmGXZaFaR87AgiV9v3B0C4Q3ISrQdfA3nObvYECtl0Ns9P3wHcKkRowXoagqOdkjEYUHYtHWXERppo9u+Gqc+PF5iTmbax4n04I3gPuJHDowL5hPurAYiJkYaPB+FPXfnmT8w7glVhmt/bPQ69cx51W1l5vEYR+bOeA+wbM11N4q4GRK0k6vEkzk/XXzsOR40KU9xuq+01qPHNkrwS06XkipqGG3ThO4Ta5ih+j3PWfy8/puUKetc4zkZ0wBe9bU+KBl4qCAt95jIpMlKfvLrHlmkd1JJMzwKjVTDdNfhMcBdjsuwHtjIFw+D141Ni3SUyB+ZTTHiuab4liCqUbxQEpjjBqRAvZld9XsLqw0C4DOIbDhQTgT+C/oZeXgWkM9QDLxCtHyImQ8bFAVSHMdakxO+CC8WzF4ZxjkwjcMGaVDZ5S4LG/HQC0r5hHhgowPPWoB5itPfcWPhjSk5eRgzpL+NmX8t6gfspwHROOX6CosIccUgA1/syF98Y+y0HnmabQrd3qDnxQbo0RkQm7Q8d/6oG3E1JES7Iq3dMCnFpZvhieDp14RLMNHwU/Tq+zMuxWmzORu5SqFHMpDB5nASwMbGEW7Nic3r/xr9yXp1cSDhm/hr0hPsNDkIovjYD3lOBAHjAntCfSWzx2p01MRstado+dVI9P4mRT5wt8HjN7V7IMNf2HAbfV1yorDUwuT0fy6JXUlBlW+hk6hDVzVvd9gngoAdmr9p0inA52JguAeUliWtEZsuCS86dW/iGm+/1iitzKCPaJgNjBqcS7LlLWW2C8hUIwI07c3+Cix0Qto0qu2nq2c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(376002)(366004)(346002)(396003)(136003)(83380400001)(6506007)(8676002)(66476007)(4326008)(6512007)(53546011)(31686004)(66556008)(66946007)(41300700001)(2906002)(2616005)(44832011)(8936002)(86362001)(38100700002)(31696002)(110136005)(5660300002)(478600001)(6486002)(36756003)(6636002)(186003)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlZwa1lnaVFDR1NISmR3QURSdE5QMUlIRStjbVFocUxZZEN3Ti9Tc25tZ0x0?=
 =?utf-8?B?eWdDYVROWXNoWTF5NVRNcGJyQ2hIbkc1dFplVkZsRWpaUDdxdWVCazQrbzR0?=
 =?utf-8?B?ZkY3Q2xBMCtRZVF3N0NUSXlNNGpvVkQzUFlTdVN1MHBPVEVYS29pZExDZXF1?=
 =?utf-8?B?eUpZSUNKSUFhVldZRlJPQTlLZ2Y2bHlQcGtneXhsbnU3bysrR080MytQMmFJ?=
 =?utf-8?B?MEtIRXhVNXZDM2tRQjVNeHRWdGwzd0Z6NDlyWWo3eG1EeDJ4VCs4cEo2emJF?=
 =?utf-8?B?L2dFSElqR2E2SkFuK0ozakRUTzJjMzdVcUJJQmowMHlZNGgva29KSUVUV1Zl?=
 =?utf-8?B?VjJiR1VOdzZCK3R3eWRZWlZEZStPSldNSHpUNFdzUm95Q3hocGcxQWFaQWdD?=
 =?utf-8?B?MmtyMFFnWW82LzVhNjhJdkdjdTNzb0tPazIzU2VMRFozdXUwUTJIVnNEdkdX?=
 =?utf-8?B?RzlrMHRabll4bDdTektJMnFwVHk5R1hMZExaTzhtRU5ZdXNYMTJ5SURYRVh5?=
 =?utf-8?B?TXVBNEZQbjNiZlI2ZFJBSFJlejRqeGFncVpRSkdOODNHWDdvdE9WY0t2YXNH?=
 =?utf-8?B?QXUvcGtmVGZxNzJIbys4OHFySStQOUlRRFQvK2F1RDR4MlhxNm5Xd0Z2ek5i?=
 =?utf-8?B?UWZTV2lmMEdTQXA0bjVnNnFob0VEa09VSjBCYjNuVENXbTNFbzluSFFMcVpp?=
 =?utf-8?B?TDdLd3FQaTJsRzE4ZG9CS2ZoeFBvRTVqWW9KV1ZMSzFDbndveVlMZEIxeW5j?=
 =?utf-8?B?dlFqNVl5WVpDTlBENmxucmVGWkdoeTBKQ01VVHltVytNQXlOVFpwUEt5MVRm?=
 =?utf-8?B?R2tzajJMMUtUZHNxSG5XUnVncnI1b2kwbFEzQlZzV2JiUjRIL0gwelNxaUpH?=
 =?utf-8?B?R1pOZEZ6WklSVitlQjBobnovMWFwUE4rTnRQOVQ0S1FlZWRNaEFuSlp5a2pG?=
 =?utf-8?B?bzczNUYydVQ5NEFHZGhHTGFCSzlNOTZqK3NuYy8rQTlmc0pJdVFNT2RTaFpC?=
 =?utf-8?B?WC9OUlVyL05JZlBJOVpEU1hmMzdZSVE5RWVOR2xCblpYQVhQZXFJMUN3MjJv?=
 =?utf-8?B?dm9KWEpVaERDSE44eHIzaUdKRmI1RldYZ0pNc1BmdVl1K0k1Mkx3c0RGMDlx?=
 =?utf-8?B?Mkt2ZU5Vdng4WGJUWVZjSitlNUUyQVJYTnBpL2dIRTA5NmVZZTNzZDhCbVls?=
 =?utf-8?B?MWpNc1BwRlJIbjlqZkpIZUZJRllmMzNZMUtwVEkwT09pRFpVa1ZHR3FYdkFW?=
 =?utf-8?B?cE1Qb09jUGtTZUFqelh1RXpuQXBXQkk3SVhrbW9UdERNbDhYS0lwb0d4TXJE?=
 =?utf-8?B?ZFBxSmJiZEVOa1VRdUhpcTM3UnFWRXlCRXVjQXFvU0tWNGpzSmZ1ZkdaTFJY?=
 =?utf-8?B?Zk16UXMyak5abFpGaCs0M1ZySThkZEhFdVRiclFQMWxQYXZMd3ROTDRWYkpi?=
 =?utf-8?B?elpZSWxDaTJRMG5EMmxLdTNXT055S0ZkUmNQeVA2ZWVhZkx3ZjAzUUJDZ0wx?=
 =?utf-8?B?ZEhPdjZwaGIvWlFNSXNScE9nNE5lMUhZZFlYb0dRaGhUZHpYYmpoQ3lpNGV4?=
 =?utf-8?B?RG5QTVVMUXN1WDh6R2l5K3lKNi94cGdzZ09vQzBrMTBZcW1SandRZXNIRFZB?=
 =?utf-8?B?d1BsSVdBMTROYWZUNFFzalZpVlFqN2FXRmlsbnNnb2tvd2owUWU2ZjJrTWw0?=
 =?utf-8?B?Vk1FQkVLUUx3YnVIVnRPdi9zTFNMVGpweS9kRzlqaUdnMk5uam1KTlJTem1X?=
 =?utf-8?B?ZXZkZnJvSFMvaFE0QlFLQlhtQ3F3a2d2cVpHNUtLLzB2M2R0MkRpbUJDVjRv?=
 =?utf-8?B?eUttbGxDK3huQWZIbXk3Z2hteU9tNUxEYTVEcSs1aUFndTRoRDN4VzB6MXZz?=
 =?utf-8?B?TFJmWnZrK1R0THV6WFA1R3VvdEN6a0I1ZnFzTE9WREEyR2xnSkJ6OG0vSjRK?=
 =?utf-8?B?TlM4Sjg5eDBiMk9lenFHcVpBMVkwcEIzNnVIbHlOL01TMFZ2dHV4QTdNZVhq?=
 =?utf-8?B?L0hwVTU3a1R3VSs5eHd5dTZVU2lSYVphRXh6RHlONFZ0QUppWTBIQ3dyVWhK?=
 =?utf-8?B?K1h5NXI5eWU0cUNzNGhmMzdWUE5lWE1OQW51MDErNUphZkhpdVZmT1ZRNm13?=
 =?utf-8?B?b3Yvcm10dCt1TG1DdUVvVEFZNkVYTmp2Vit1b0VsUXlkdVJ2VlBvVGsvNXEz?=
 =?utf-8?Q?ubtqYVg83w86Mzs6mR6iRCPRyKNfgpgBHXIsHmY4HDxY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab27e952-f5e8-4d2d-ace0-08da65c64d54
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 18:26:00.3233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Jx63042PI4pP5jJF8/TBXDLPdnCdb2xGA7PPU7f2UZWluHx2JyDC/iShmRRGecvbEo35Lk6gJsNHTUnsvkwDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1951
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Found the new use case from the 5/10 of reordering CS ioctl.

Reviewed-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

Andrey

On 2022-07-14 12:26, Christian König wrote:
> We need this for limiting codecs like AV1 to the first instance for VCN3.
>
> Essentially the idea is that we first initialize the job with entity, 
> id etc... and before we submit it we select a new rq for the entity. 
> In the meantime the VCN3 inline parse will have modified the available 
> rqs for the entity.
>
> See the patch "revert "fix limiting AV1 to the first instance on 
> VCN3"" as well.
>
> Christian.
>
> Am 14.07.22 um 17:43 schrieb Andrey Grodzovsky:
>> Can you please remind me of the use case that requires this ? I 
>> browsed through
>> related mails in the past but haven't found when is that needed. For 
>> amdgpu
>> drm_sched_job_init and drm_sched_job_arm are called together and amdgpu
>> is the only one who supports modifying entity priority on the fly as 
>> far as i see.
>>
>> Andrey
>>
>> On 2022-07-14 06:38, Christian König wrote:
>>> We already discussed that the call to drm_sched_entity_select_rq() 
>>> needs
>>> to move to drm_sched_job_arm() to be able to set a new scheduler list
>>> between _init() and _arm(). This was just not applied for some reason.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> CC: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>> CC: dri-devel@lists.freedesktop.org
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_main.c | 3 +--
>>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 68317d3a7a27..e0ab14e0fb6b 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -592,7 +592,6 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>>                  struct drm_sched_entity *entity,
>>>                  void *owner)
>>>   {
>>> -    drm_sched_entity_select_rq(entity);
>>>       if (!entity->rq)
>>>           return -ENOENT;
>>>   @@ -628,7 +627,7 @@ void drm_sched_job_arm(struct drm_sched_job *job)
>>>       struct drm_sched_entity *entity = job->entity;
>>>         BUG_ON(!entity);
>>> -
>>> +    drm_sched_entity_select_rq(entity);
>>>       sched = entity->rq->sched;
>>>         job->sched = sched;
>
