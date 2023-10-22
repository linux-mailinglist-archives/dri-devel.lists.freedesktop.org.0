Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7077D208C
	for <lists+dri-devel@lfdr.de>; Sun, 22 Oct 2023 02:52:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8266310E0B6;
	Sun, 22 Oct 2023 00:52:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792D710E099;
 Sun, 22 Oct 2023 00:52:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HDNVC/kRGs0xtjk+Z7l3IwN3Ao51Pcwa6WuE1nJJ4UVbAjmV8KlDJtxvL75XiehQx9lJxAHjhBiSOz4wZf0VpLvAu6hUHymRYGknBL6qEMWtZLbpeX91WE3sDDQP0j2xTK6C3zf0TIX3dg9TmHiCROLj8nY4xeG+mItc2EV87TlmuxmVPkKP7pUAZgzSUHPXgifPW5EELhtp25guJTQBTdCRh8NZfAc4xLxT9tXwije4oq5NEzb0t3HFMDcdiJi2QqEihh2TjJzYih3M/HuTQmk22XmjnlZvMlw8p+TAoeUeGdJ5rw8tbGS1ko+DeAHY+cdmjfdR/wM2QK27hRLb3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XsIowtnacsR9p+aJs+dKs7KoY6UH0ko0TUc1Szgu9QU=;
 b=hAses/LPZw3VfWAWblGH7AQa7xq+M//wwvXljEG7F5Ix1azL70i81p5HFPgCB21RxS8Vs5HXHgS1dNSXYkw9uQZHMhXoEVvaAIplUgftUdUjVsGufAI6hIIuvT5eH448txuYrVwz/4RZzG7vzBsdQe5eiTBBOjKLhDlMWJs+RZkZtu9nLj5WJ4UmnaR4eCgryCE0aODQCrR9BoMYqaCwrxsKseLK7kVeg/DN1UeJISvf9n8tFLckmvhpta0+QBsWfVIKBC82nh9br/qXj8V/xDYmLUdey0T+dnlKrNayJTEvqlLUjHdFlRfJeXHPHf+VbyBiSxbUikWSMDQZZE5ocQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsIowtnacsR9p+aJs+dKs7KoY6UH0ko0TUc1Szgu9QU=;
 b=wDX6Tz75xKkDCW6H39uEJIHdyLg/Vb/SgHLQbnOsxMGfC0y+V/NioZRusFztV0QFPzEKrDUxIDynIABxA8ngvbTAGMJA+4c2Z2vqz2577USjJHM2glgO70+prR2BzKPwO5Zl49yChXbPsiMHGL0q/6qoVq+7EM9Qa4sHYX0fIjQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 SA1PR12MB6703.namprd12.prod.outlook.com (2603:10b6:806:253::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Sun, 22 Oct
 2023 00:51:57 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef%6]) with mapi id 15.20.6907.025; Sun, 22 Oct 2023
 00:51:57 +0000
Message-ID: <99c1fc19-8567-43e8-9677-a69c5a985620@amd.com>
Date: Sat, 21 Oct 2023 20:51:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.3
Subject: Re: [PATCH] drm/amdgpu: Remove redundant call to priority_is_valid()
To: Alex Deucher <alexdeucher@gmail.com>
References: <20231018010359.30393-1-luben.tuikov@amd.com>
 <CADnq5_MSiZ6ScQyEicyKJnihssXNwNQXDVNHKbF=nAcFyymt7A@mail.gmail.com>
Content-Language: en-CA, en-US
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <CADnq5_MSiZ6ScQyEicyKJnihssXNwNQXDVNHKbF=nAcFyymt7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0149.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8c::22) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|SA1PR12MB6703:EE_
X-MS-Office365-Filtering-Correlation-Id: 12fab432-14a3-4fa6-9a57-08dbd2991665
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gAu2RMEXJQGfxW+y11KtyDXWFJDKmBhV+4H8Na+PHo1CBVrhB8poRW1ZxRKCVFNBX4oAo6HhUi/3mJVbanllN1T4Dr024aXmnVCUaB57FqvxVVq9UMWzK7N8DoBCMEYncFhPUXBzULSDhlt8f5morYU3sk3lsrC5kkX3q3rFA9LBv7Nzo0AP8luQbphOEMpqWd0tqBkwaAkOgFAPcSVCFQOHlfD9C5Ac4rbvz+orD9vTkxD35AVbZ2ui6ZWTnFaR1sqn/JWICHk3RJlXd2uwTBU6V5NGwGVo/aNGFmkBnOrsOrbxXjdpGdEOTKcqc7nHDM6SBDMNONBPDJkMsDUYc4YphlaQbHVMUdPdfuqndS6N+3EjBQpDRwfhJBhVhMDVasA+/AC2X1lzAPdTlnwnXTxSKj6+oB57WxaxJ1pz/44mQl66TNoxdKnCBmMGhZiMwdWlWH21+vOm1Gt7fK1KdbswzAOxrROJC2zJv+LaiZACmKbswyR2KsDopAIG7nKw1NDPdweVXorgVgopyj/aPbEXlWo8grABKp2AdbRXJxndAX11Y7XzKskuYkH2uu1H1kF3KQpkDgdQ0MZZfdhNV1q4KVRK/BfFjJFrfrni2JgiFRKoHKzhY7utoRhaW+Gq9HAujNQl3tL7Nva1vNWI/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(376002)(346002)(136003)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(83380400001)(4326008)(66946007)(316002)(41300700001)(8936002)(54906003)(4001150100001)(6916009)(8676002)(86362001)(66556008)(31696002)(66476007)(36756003)(5660300002)(2906002)(6506007)(38100700002)(53546011)(478600001)(6512007)(44832011)(6666004)(2616005)(26005)(6486002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDJRdk9pYjJBek9rOVhaZmFCSVVLSjVTbG10NTQ5VDdTQ1EwbXJ2ZlBGa2Qw?=
 =?utf-8?B?ZE9XMDZBRm0yNjd5Yk9WRVhiNTVuKzRPTEtGVlFZQkFsRWNSZk1yL2xZWGJh?=
 =?utf-8?B?a2tscnFPSGtOdnAraUk5Qm84V1orcVdSN09pWE9FR0xSQWl2TWkyRklKUHNS?=
 =?utf-8?B?YlA4SnJGdjNkTHdzaVVjVzNlSUQyRjRPdWlZZ056WUIrMFNDZkpQa3FidmIz?=
 =?utf-8?B?dWd3ZXpPM1dSMUR2YUpZQUFEN0pQbGNycTZXU3hLcUV1ZkU2N293TDVIMnpZ?=
 =?utf-8?B?bmJVdkFNU3JVZmdJQlF6QW8yOFZwK1R3NmdnNkw1UDBDWW9ZQ3JXTWdHRWhw?=
 =?utf-8?B?QThJTDdScjRzUldqODBndmZVUEdadjZlam9wMURHN2xnL1pYNWlaay95Znlo?=
 =?utf-8?B?UzZFQWhMQURhVHM3dWFZajZtQlVidXdHYmZDU2hUYW5HcDZQRjNDQTlReUxZ?=
 =?utf-8?B?b3orVXh2djVPV3d5OHl6clBKdG8rT0lkK2ZMTEJ3SVIvQkVnQmxTVWRaYmg2?=
 =?utf-8?B?Y2tEVjZKaXdUdmxlWEFBUUJIWC9BcEkxSlNyZEpNeWdmNUUvSlNmUkxHOFVD?=
 =?utf-8?B?SHZ6ajVObUN1bGU4V2M0NW14N1lQWnN2amU3alpNaGFFdDlUNDBDWWk5RlhO?=
 =?utf-8?B?akw2THorQ0hkYmNxdkYrNXRyc3N2S1UrVmlyWUZjWGlnV0FWTUFzREJ5YW9W?=
 =?utf-8?B?M1RVUE9JZ3pEZE1HVkN1KzlrNHYvcCtiZnRVMEtpcm9COHBEcGFjRU5Ha0RR?=
 =?utf-8?B?QnZ1Y01xUU1ZWksyMXgxK1UxVFVZSWd3S0pwYVI1bTJlR2k0TWhWSVIxWU9p?=
 =?utf-8?B?VWxHTW5McjVWdGJLWm50TTlKa1QxSjlGU1JjRkV0YlI5VVV5TkNySmhuRlU4?=
 =?utf-8?B?akNYRTdHZFZaK3d3azBZYXJMSjg0US9XYWh3TFhSM0l0K1hvS2UvNU5Lc01y?=
 =?utf-8?B?cGZPcUYyN25iOUNzdThIczFRMUlSSHNTMmxlRXFmZndUN3E1NnJIVFErMWMz?=
 =?utf-8?B?V2pRTkRoaFJZZWRCcmUweGtaOWxPTVZhQUlGSTVqZ2ZDU0oxL3dGTDZVYkpp?=
 =?utf-8?B?OVFjamV6VklhcGk1aFdKUXI5SWhwL1JIWTZibW9qeFZDeXA4dkdqcWRUU1c5?=
 =?utf-8?B?VUpqZW9VbkJnaGhKWU1MQ08yWDRTR3lpN05uR1VsY2FQT2lsM1VQQWQvUkpx?=
 =?utf-8?B?aVJ6RUxQcG1Pbzd6aVhwdUUyOE1WLy8rTFMwejlDSmJPK1VpblNQaG5ndThr?=
 =?utf-8?B?b3ZoL1l2V05RTkJNZ3N2R0pnQXRDWjQ4enlFK21nZGZESjJqcjFyelI4cVU5?=
 =?utf-8?B?ZjYvRWVpblY5TkVIMVFsdlZ0VkZLSmphdm1pdXdmSHBXcGNRUmNndzdFbHhW?=
 =?utf-8?B?aDU2UU51cUY3bTZuOXhVWkVHYmNpUmZUU05mM0hXQkJ0TWplV0JTdGZ4d3ZW?=
 =?utf-8?B?VkJsNWlDcWtNTE4rLy9ybjgxRUkrRHc0UlVURXhpYTNJdFYwYUoxRCtNemhF?=
 =?utf-8?B?NFZXVURFTFdqQUlNMmZvaWowbGhYbi9xbDdkMWpVVnJ6eURYZ2pTa1c1Tmhi?=
 =?utf-8?B?dUZ6cTltOFgvWlU4enUzYjB1VGUvV01rK28vbWtTOTgzSDFBZ3hMM3FtdUNW?=
 =?utf-8?B?alNWNTB2MGFCTG9tZnJ2VlBiVlpId1ozdkkwZ0hEMjE2cmZmQXB2aUJMRlhQ?=
 =?utf-8?B?YUxUd01aTG1kYUxxd2s0cm5SODl1bG9kK3lCUHBGQm9RNkF4amVkMmY1bE5E?=
 =?utf-8?B?Yy8ybnEwbm84MU94SCs3Z3BYOXNQcGFLYVFmWkRua3Zzb3QzUG1kOGdGTStt?=
 =?utf-8?B?QWkwQWMzbEttbjh2RG8weGJsTi90SWtMK0t0cnZXajg2eTdEdEJGcWN6bWN6?=
 =?utf-8?B?WUNmYzYxWkNNU3Z1MjE0ODVtK2dsVHNobllkMWdGRURYR1pITFFqeWRuclM1?=
 =?utf-8?B?UUs3Szl4M3dkZ0xYOFJCWTJFTW9KdFBGT0pjU08zRk1XZW02MTk1VllkUzFn?=
 =?utf-8?B?Z05VTkNrMWlUUlFNa0JVa1RLUk1jS0IrdThLcDdEVDhzZ3NvMTI5RU9LZ09Y?=
 =?utf-8?B?cHRqWER6Mk5zenpMOGp1U2hqaFpUaHB2WTdDeGtVUkt3K1pOV1lVcjdRaTBn?=
 =?utf-8?Q?B7auN2THiWnFhFNfk2QIWbsZW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12fab432-14a3-4fa6-9a57-08dbd2991665
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2023 00:51:55.2922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R1CL8N5ocNvMwLvWX37pJ5Oxo8KqlRmOjRJdORXirJFt60bDRZbkyyoYQ7622z+i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6703
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 AMD Graphics <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-10-20 12:37, Alex Deucher wrote:
> On Tue, Oct 17, 2023 at 9:22 PM Luben Tuikov <luben.tuikov@amd.com> wrote:
>>
>> Remove a redundant call to amdgpu_ctx_priority_is_valid() from
>> amdgpu_ctx_priority_permit(), which is called from amdgpu_ctx_init() which is
>> called from amdgpu_ctx_alloc() which is called from amdgpu_ctx_ioctl(), where
>> we've called amdgpu_ctx_priority_is_valid() already first thing in the
>> function.
>>
>> Cc: Alex Deucher <Alexander.Deucher@amd.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
> 
> Please push this to drm-misc since it depends on your previous patches.

Done!

Pushed to drm-misc-fixes, where the other two landed.

Regards,
Luben

> 
> Alex
> 
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 15 ++++++++-------
>>  1 file changed, 8 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>> index 68db924161ef66..4c6ffca97c4512 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>> @@ -56,6 +56,10 @@ bool amdgpu_ctx_priority_is_valid(int32_t ctx_prio)
>>                 return true;
>>         default:
>>         case AMDGPU_CTX_PRIORITY_UNSET:
>> +               /* UNSET priority is not valid and we don't carry that
>> +                * around, but set it to NORMAL in the only place this
>> +                * function is called, amdgpu_ctx_ioctl().
>> +                */
>>                 return false;
>>         }
>>  }
>> @@ -96,9 +100,6 @@ amdgpu_ctx_to_drm_sched_prio(int32_t ctx_prio)
>>  static int amdgpu_ctx_priority_permit(struct drm_file *filp,
>>                                       int32_t priority)
>>  {
>> -       if (!amdgpu_ctx_priority_is_valid(priority))
>> -               return -EINVAL;
>> -
>>         /* NORMAL and below are accessible by everyone */
>>         if (priority <= AMDGPU_CTX_PRIORITY_NORMAL)
>>                 return 0;
>> @@ -625,8 +626,6 @@ static int amdgpu_ctx_query2(struct amdgpu_device *adev,
>>         return 0;
>>  }
>>
>> -
>> -
>>  static int amdgpu_ctx_stable_pstate(struct amdgpu_device *adev,
>>                                     struct amdgpu_fpriv *fpriv, uint32_t id,
>>                                     bool set, u32 *stable_pstate)
>> @@ -669,8 +668,10 @@ int amdgpu_ctx_ioctl(struct drm_device *dev, void *data,
>>         id = args->in.ctx_id;
>>         priority = args->in.priority;
>>
>> -       /* For backwards compatibility reasons, we need to accept
>> -        * ioctls with garbage in the priority field */
>> +       /* For backwards compatibility, we need to accept ioctls with garbage
>> +        * in the priority field. Garbage values in the priority field, result
>> +        * in the priority being set to NORMAL.
>> +        */
>>         if (!amdgpu_ctx_priority_is_valid(priority))
>>                 priority = AMDGPU_CTX_PRIORITY_NORMAL;
>>
>>
>> base-commit: 915718484b8fa1eede4499a939e2e4fc0d85caa4
>> prerequisite-patch-id: a36f628997d923f66da5342e760e8b45ff959fb8
>> prerequisite-patch-id: f15148c302329c0c60d86040571c61d367bd05e7
>> --
>> 2.42.0
>>

