Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D18422E42
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 18:45:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9025F6E430;
	Tue,  5 Oct 2021 16:45:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2040.outbound.protection.outlook.com [40.107.212.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B1A6E0FF;
 Tue,  5 Oct 2021 16:45:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tq1KQ6a2KUYg18yZZSd2gWF//519Tn7eUOjMNXhjTQKD/DgQFXeg+k180bWnwpRTAwyZ9+lbjig9nd5PhemqNsLHnk5z8wvvpTswSzD4bsIECEfvyJUPmGzt9XcXbxKd2cAR/BcUXyOHHQKJQPC3hir1bn1XsqQGNNd5PX3x236EJvCvX+0j1J6Ji0vrPrb2f43vx8W0AJAy7KFWJm4hEg06SsANKmt/i43+6q7fxeegN9Y1rPLN8Pn1DjnTUdAU2yuF5tlTPvR6FCkKI19HvfbVcPzBXV4ELL0roMX448wYRpZQzEqtmRbLLDiqhjBFGARH7tja7tm0sKo9RMUBNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wk1+4MkdUh4xn8rNF1P3ItXBa4UD0GPKdelwL/pTHws=;
 b=aORumpyFjftOzKrz2VX3An4MeP+ZZQjUeQinTh0jxlprltJmUOTai7ld03ox7vIvvBnVfphQIYbGVzRSqcI/DU/INnlPdyHgYJA6OQXQn9O7vJn+PAp+vl7ic+z0Mwqf8vral4ANPzgOGdCWkVWJBK47vjotmBE1wfXgyHoCy0Th/3T0BMlnTUX+DsAOiAfiPCtjsZTKZn1o9GO8bjmwmdtNq2XFtnZJRmBmNF56+6/mU4o6RBI4bEruLBaImZAkbL61bHmShvHvMRfazGCIU68wAs+k9YIafIq0S8wyIFPca/8qvbAOSj6P45K8SI3vinUrpb3jOMsNdfOQrAfGwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wk1+4MkdUh4xn8rNF1P3ItXBa4UD0GPKdelwL/pTHws=;
 b=v0BqiqjVd6jrB5QDmQlCMRBsmPZHmr3eWVbDLH3w0PqO1OhKoAVrjixGiaMU4H4gNW6BRgILfkm/D/4ahytPrFhpETuE+9ijHXHCFHad/U4W9gFK4qXmYGJZYRbNiO2sInORy7SUl+Gf8z/K6cniB9LdR8Ch70O8+HnZFfR1Kx4=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR1201MB0187.namprd12.prod.outlook.com (2603:10b6:4:5b::9)
 by DM6PR12MB2700.namprd12.prod.outlook.com (2603:10b6:5:4d::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Tue, 5 Oct
 2021 16:45:49 +0000
Received: from DM5PR1201MB0187.namprd12.prod.outlook.com
 ([fe80::451d:d9f8:29a8:63d3]) by DM5PR1201MB0187.namprd12.prod.outlook.com
 ([fe80::451d:d9f8:29a8:63d3%11]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 16:45:49 +0000
Subject: Re: [PATCH 1/1] drm/amdgpu: ignore -EPERM error from debugfs
To: "Das, Nirmoy" <nirmoy.das@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>
Cc: shashank.sharma@amd.com
References: <20211005131115.25595-1-nirmoy.das@amd.com>
 <ab673b77-e8b7-94a4-76f6-588ad9e472f7@amd.com>
 <182c1454-102e-cf2f-80eb-09baa57f8e82@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <45342056-8e15-bdb0-0237-d11476bcc8fa@amd.com>
Date: Tue, 5 Oct 2021 18:45:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <182c1454-102e-cf2f-80eb-09baa57f8e82@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS8P189CA0029.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::15) To DM5PR1201MB0187.namprd12.prod.outlook.com
 (2603:10b6:4:5b::9)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:5130:7da8:174a:3334]
 (2a02:908:1252:fb60:5130:7da8:174a:3334) by
 AS8P189CA0029.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.19 via Frontend Transport; Tue, 5 Oct 2021 16:45:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c09b5996-322b-414a-83a5-08d9881f95a7
X-MS-TrafficTypeDiagnostic: DM6PR12MB2700:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB2700977B51EA89A0B9B8D67B83AF9@DM6PR12MB2700.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:81;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2KrfHpjKefD38JgM5pMGsjNnmc1IW/fIThiv7B8NgVeoCnWSgJPravIUcY+NR85vWNy2iuVam+yGVSVfOguXj7x1Rwh0W5MKof1v81U82/dOUm2M1kguxNaXNS/SqZbfzIhARWXXfBZHz64SSlK5eFa5nlcpLVlothK1iEP3otMOpTg7UcFmxdOIuHXbK4+kYlXfUZVs9z37YWGA2OEJrtL97/xo+gFLHjvwlvb4gIGY5/BkNkxATEGhVNGcT7OfO5oQam4zXnT7lOUnKEoMHs5Q4vRGsN70nKlpmOPJv1It3aZVDkMwyO4HaPA4oHwUJvXfOduWfjTc0Hjfzu7aECu1iweaaiKyxbAJwkFbQF4qgZLTnF9OeydB47gAZ2rXmr0lzFhqrQ/4oGZESR/krsQHqONM5fpx8BMoz/naE0Ckm9kTb9niHusy0i1soxOqofppjsQDJzCcBajIWQvnsq+20KNxm1Zi4xgZFTVZXw67eW9K5Xfp9oMXbvjbEWCt8F5iZvcymZQ7WrJsoLN+DGxGOMZ3GnyqcBnFUQbK7pGa7eqV0ElKSPc/9OTWhBUX0g0bdCDG1/GRZWVj/3tgrb6rwyiFGJncuJp9UHeRWOT/Gly+psgRvBEXah8mGTB9/auNcbhyeH5wuoKXVNM2i9h9gYZu7cZS6kMmwSHbkS+198I09OQoHFjD3oBdUvyC70nM366dYmb69e7LqI3ckPGyNl3nhQ1ZugeKFkCdDZ4L+yTetpeSPEgXSwU84PJX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1201MB0187.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(83380400001)(8676002)(66556008)(36756003)(66946007)(66476007)(8936002)(66574015)(38100700002)(6486002)(31696002)(6666004)(86362001)(186003)(316002)(2906002)(4326008)(53546011)(110136005)(508600001)(31686004)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFdCRVZvVTVCTFp6VXVkblBlQzVUYUZmd1JvVEF6RUJBUFY5ZzdCVlRVVC9u?=
 =?utf-8?B?ZlFOY25XYVF2RE10UE92eXJUZGFPeG04RnZDUEc1WjNNNUFNcjJPNDR0bTAv?=
 =?utf-8?B?ZmpTcDNLYmk0RTA0VDJFVFpJSFdad0ZUT01vNzRJeHVYQ0RvK2pkQkVGS1Yy?=
 =?utf-8?B?cExxNW9Ga2duajU3WXM0ajN3V0tieDBYWTVVUVpCLzFlbHozMFZoR0FaRUpq?=
 =?utf-8?B?ZWlFSjkvWGYzMU12UTRQOEtPVlBIY0tUcm5rcTB6UmQrRUsyN2tmcThyTkRm?=
 =?utf-8?B?NHo5QXlYMUF4MzlNZEpoYzVaeEJIUkhGSElhRFd3dDhxT1Y1OG41bDYwYUZi?=
 =?utf-8?B?a1BVRGxQMTJxTEZuaFZqZlNLdXZmRUQ5N3pOc0pEWFZwb01zWkZ2RDFoUVh0?=
 =?utf-8?B?cVZtYVlHa29uUHNOZU9KczRheTluUnRBc1JiNlk0UGZtaUovYTR2N2FHWG1x?=
 =?utf-8?B?aVJkaDlZRlo0TzZISnNFdEw5WGJCbFZCSTRMKzFzWXduSlJpVE5KNGdackI4?=
 =?utf-8?B?NE9LSVZCU3dkb0hyMmZyQjJYK2ljai9XbXdtV2ZpNW1sRTA4L0tJSy9Ob1E2?=
 =?utf-8?B?ZnhqOXFUVVMwTFRFOWJzRDFWRFlxUWIrcndDazIzOXVubkhnbTJXVzQyNFc4?=
 =?utf-8?B?Sk9QVEdDL2paQURuNkpZMElqekU0SWlXMi9HYkxpMmk0RTFtNnc2SW1lZGRk?=
 =?utf-8?B?Q3BUaGs5NjRjSUJWcTJqUXFQeUczKzEvSWhRRjVNYUVHTytaZmtkSXFuWjVI?=
 =?utf-8?B?TEQ5eG1ZejBiSmQ4UGNwNUk4dVhDTXRWNkRnVHpkN0oyeGt3MlJiSzBsdGdO?=
 =?utf-8?B?ZmU4WFgrcHNZZkZqSGp5bDJSK25IOXo5eFFTZWUzdlo3bU0zN3c4RWlDVDNU?=
 =?utf-8?B?Y3ViMUdVWDNRZlZRNTNiWG1Qem0yY0I5cExuZTk0bUVrcUIrSEhlSWFQUTd3?=
 =?utf-8?B?MXlnb1hUMXpSa3NvQzFrQzRneC8rbGRkN0tlR0NTS2RvaTV5MEZOSFBMTU0w?=
 =?utf-8?B?U05DMkYySEpHWGlnblVNRkZ2MEppdEk0MElhT0ZSa2dxSTJvQk41VFBiYTF6?=
 =?utf-8?B?ZXNxc3VHMnI1M1N5QmVsRkNKMGJPVXpOUHhVV0FKcE1Lb1o0MW1uZGtjNThu?=
 =?utf-8?B?WUJaNEdJeWRPa2Q4R0dMcWF2TWlFRFRNVERVck05S0ExNDFnb2x5cXdQckVr?=
 =?utf-8?B?Q2tEcmNFUUlySlFWdnFZTDZzOHdVc2NZRWJZcGprcC8yd25MY2dtb0gxWjBH?=
 =?utf-8?B?TUJWOGhSdkFZMUJVdkdKcGxkV0Q5WEU0L3ZXcUcyRkZSWVJsYlZKNzEwaU8z?=
 =?utf-8?B?blE1bk55b0QyVXJndExKUVpuaENzZmJBMXkxeE9rVm5vS1hER1lQV2U1Tk8v?=
 =?utf-8?B?RVRmWlBHaENoZVlFYStuMEp4eWwvZUpjQUE0WFdhT2FPTE1kNVRndDIreUhC?=
 =?utf-8?B?dVFxMDZZaUlKajcvekdFcHhuQWR2ZkNTd25UYWNvOGNFUjFiZFA1bkhtNzBG?=
 =?utf-8?B?Q3h3bytMb1QybmpabmpSZjY0SlF6RzhRdlg3TzA4UE44R2lWZUZJM3dOZnFz?=
 =?utf-8?B?aVYxNUNNbWhFU0NHcGJoRGRnZmtpVlphZnVPNjBPeC9STFZVYUtiY1ZlT1Vy?=
 =?utf-8?B?VFJKUEoxQmU0SVhyaVJyay9qdzFhNUZJQWU2b0U2VDhmNC9xa3lDNTR3cCt4?=
 =?utf-8?B?TTBvMDNEUXYwVDg1WTJubk9JTnQ0bDNNVGhkV2hEenBKUHBCS1hDTnVNd0Nk?=
 =?utf-8?B?NHFmSmNlcXRaMWw4Z3Z0c09vclBReVhjYThoWWJtNFVrZmZmc240M1U4NFpk?=
 =?utf-8?B?bHJiY29yaTRaYVZaV0RqUksxZ3ZtNDJtamdYbUw1bkd4d09QekdEbUdiRGtt?=
 =?utf-8?Q?1AQOWhXWyfKbV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c09b5996-322b-414a-83a5-08d9881f95a7
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1201MB0187.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2021 16:45:49.0820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OIa418nCTafA5IOgpXlZmXtrHqvh/nl3oRY4RL2B+urEOb9iQoPSvDxOX2dSvqGZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2700
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

Am 05.10.21 um 15:49 schrieb Das, Nirmoy:
>
> On 10/5/2021 3:22 PM, Christian König wrote:
>>
>>
>> Am 05.10.21 um 15:11 schrieb Nirmoy Das:
>>> Debugfs core APIs will throw -EPERM when user disables debugfs
>>> using CONFIG_DEBUG_FS_ALLOW_NONE or with kernel param. We shouldn't
>>> see that as an error. Also validate drm root dentry before creating
>>> amdgpu debugfs files.
>>>
>>> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>> index 6611b3c7c149..d786072e918b 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>> @@ -1617,6 +1617,16 @@ int amdgpu_debugfs_init(struct amdgpu_device 
>>> *adev)
>>>       struct dentry *ent;
>>>       int r, i;
>>>   +    if (IS_ERR(root)) {
>>> +        /* When debugfs is disabled we get -EPERM which is not an
>>> +         * error as this is user controllable.
>>> +         */
>>
>> Well setting primary->debugfs_root to an error code is probably not a 
>> good idea to begin with.
>>
>> When debugfs is disabled that should most likely be NULL.
>
>
> If we set primary->debugfs_root to  NULL then we need to add bunch of 
> NULL checks everywhere before creating any debugfs files
>
> because debugfs_create_{file|dir}() with NULL root is still valid.  I 
> am assuming a hypothetical case when debugfs_root dir creation fails  
> even with debugfs enabled
>
> but further calls are successful.  This wont be a problem if we 
> propagate the error code.

Yeah, but an error code in members is ugly like hell and potentially 
causes crashes instead.

I strongly suggest to fix this so that root is NULL when debugfs isn't 
available and we add proper checks for that instead.

Regards,
Christian.

>
>
> Regards,
>
> Nirmoy
>
>>
>> Regards,
>> Christian.
>>
>>> +        if (PTR_ERR(root) == -EPERM)
>>> +            return 0;
>>> +
>>> +        return PTR_ERR(ent);
>>> +    }
>>> +
>>>       ent = debugfs_create_file("amdgpu_preempt_ib", 0600, root, adev,
>>>                     &fops_ib_preempt);
>>>       if (IS_ERR(ent)) {
>>

