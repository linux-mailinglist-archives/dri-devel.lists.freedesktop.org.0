Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 468043FCABC
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 17:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30CCB6E0D7;
	Tue, 31 Aug 2021 15:23:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D1166E0D9;
 Tue, 31 Aug 2021 15:23:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKX4lhnajy8+Qc8r1yrPh52T91zYIH7v/xEu5CbDTM1rabO2sqwqnIS2W+o/R5CWCrF3CAPaRYT0bn8uXHpwQ+psHNrgQ1v4IsW5LtybKR848E+bvHVyN53BLwY+61WH2y/BLoTqPVFfrmxd1iAV4g0oT0jmobuJzE9abzjoj1CLZImKHNf4ShK1vPFWQNyiZAKd0DsfqaM41F9Xev+HdTsW5wJvfOAbOGs2TAk1s86pXxrJt+MQsnrGWlUp003aZMo3wntKKjfxpI77sH/alIoA0VCbW9ABDyQTVN1q9inbJBaRHLVi15AQJtW/8cnpFxcRqpmeeKRWgPNHqLmNLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=auUplN/e8gi4BDOMnOFU/Jp6TZD+QIS2beV/qxb39RA=;
 b=X3/gBMIIBHyZ+Ise3Hy2yPb3sEMDNT51e3K09ScSPeHU26M5up9ahIeA9n4njyaWrvbMCdexN8fU9tdBr10qAQ2jc3rbU9rIkDO2O0eescHRoWcnd+imAK0U5c0Ia7JjhJ2u5OJ7/cNpmKRn6ktXT3qWuOlsW+g61uvyBAG++vmMfXO6jXFeoKS/jiof3fOxQPjfGkuYYv27A/Z+TcLLvcML+8glpyaGH0fs8l0b6iMja9XOSTfuGRdhioIJQ8WKwPCxnCNVlJxFcO50yzbC6U4+7exPreaTeMLQrh2dM90x14JE/Zu7buq7Q0uFJxjMBJmMN9VGAbenu857yYhGQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=auUplN/e8gi4BDOMnOFU/Jp6TZD+QIS2beV/qxb39RA=;
 b=UogNNOc+ByqwpxlEO1faLT+TSVniy+ypA38GeNsp8r19XwWIz9WqWSNajvSYg5FEHxaaSHfaZk3LRoGmjpveLqQkI+Syn2TpOJSXLvHnO7q/cdK7tcDIG9oYSqSeENrxosIXqKeghP7fQGRc2sqkagDo75FzZSAYtXi9ohlmeqc=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN1PR12MB2349.namprd12.prod.outlook.com (2603:10b6:802:2a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 15:23:26 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::c4ac:2505:5bd8:295d]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::c4ac:2505:5bd8:295d%6]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 15:23:26 +0000
Subject: Re: [PATCH 2/2] drm/sched: serialize job_timeout and scheduler
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Monk Liu <Monk.Liu@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, jingwen chen <jingwen.chen@amd.com>
References: <1630406139-19621-1-git-send-email-Monk.Liu@amd.com>
 <1630406139-19621-2-git-send-email-Monk.Liu@amd.com>
 <29be989b-c2a5-69b3-f0b8-2df52f50047f@amd.com>
 <YS42tI6qAUb3yqOk@phenom.ffwll.local>
 <11d6acb1-ce9f-372e-3993-232379436e4b@amd.com>
 <YS4+1evCjyCA50iP@phenom.ffwll.local>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <ab9aa89a-c057-b1f0-d02b-3d79f50e97e8@amd.com>
Date: Tue, 31 Aug 2021 11:23:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YS4+1evCjyCA50iP@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT3PR01CA0119.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::24) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:b95:7ef3:48be:2d7e]
 (2607:fea8:3edf:49b0:b95:7ef3:48be:2d7e) by
 YT3PR01CA0119.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:85::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 31 Aug 2021 15:23:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00d36fe3-be33-45f3-f1e0-08d96c934793
X-MS-TrafficTypeDiagnostic: SN1PR12MB2349:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB2349EFDF11E799A43C3FD86AEACC9@SN1PR12MB2349.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UXKdZRea5X4UH4bGHJyJbUpFkFjvPnYNobbI60wJW6EKeOoQqYH5LgIP2nAhb0FMR2TEQLvaKKm6Z+IwRQpJyRtFGnwkJ1/iFB5zZAH7PXRJ6DHPV9U4vfSMKw79gFBNP6V4g7xf8JN10ss+1EsJbbHtpEdPa+U5eDWhi3et7dOUxRJKI+9mnbnud8BW8HTnEWQNKuT8K5v3ldfnXlNbQi6PVUVd75EUWSu5GBpnftVq1d5A9h2IZMT9AIhGU1mVxg//ON1xGqwJI8uy1q9/NJO/j8USC9ugdHbzDQaDv9qHCTkc/MBEsGBIHPA2YOpnTgQBzdAJWj2t/9hCjr4xJJvo9vpqk7J2XhzE8K7dDZf98Ec9UPkGqYFM+gB6k/YPhtR36Zc4ucToK0cxJOMZ7BTELVfPiDx+w2Jc7Izn7PRTSW8CWPbrsL+FoXhpNb/eAIAN6PEey4/QPWwgevita5ycHF0iP3Z7PtgexleDEVut7DH1fS6Jfyfy2NCb9HTEAW8hQ9luRJP6K03765/5V3DUf60qy2P1z/z0w2pyCMQ2JF/quINrGYpNU6DUlJ6TnqR2byEfaFnya8iroeCtePIAdqdZEwhYo4uqMHpcdH6H7UqKI/5jY59q56frHze/wPljSastGr2N3pOFQkFTMBWh+kTKXHy8jdKbCUfCrog+QA8B7guAhXT0MDFribNmGiSWkY43obRfMLZTezP4bDyO/ZnWiNWEZT0I0McNg33H0YXQjdOLLqIbb0QNy7Qy7q3urT9THa4AgzaX4iWIGyEHqpqE2SmtPY8vVpMRYoaFOUGSu4WUQRS6OUL57a9tlewBQoItR+8OWvP5nuGT9kClgWdk5RFvxhYDL9vC3oc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(366004)(66946007)(31696002)(2906002)(5660300002)(53546011)(966005)(478600001)(38100700002)(186003)(36756003)(2616005)(86362001)(6916009)(44832011)(316002)(4326008)(6486002)(31686004)(83380400001)(8676002)(54906003)(8936002)(45080400002)(66476007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vmw5SUdsVTJVeEU1cDdGSnQ0WWw5SlpOZmhiTGp3QlFLYng0VE05Um5YSFZ0?=
 =?utf-8?B?eFFxZnFJV0FJYkQxM3oxbFR5V1ora1laeFg0NnNiOGR4dkFJZWJUbmdFWUN3?=
 =?utf-8?B?cnNubXpEZzR3aG5uK0lGcmtCS3IvcVdCS3c0cXY3bXhUOVlHM0lPVFBIaGJw?=
 =?utf-8?B?SXR0bXNlNjNoekN3ZnVWVy96bTdoU05qdzg0S0JPMUZiQmNzZHUzL2EvbnB2?=
 =?utf-8?B?VXNldHY2S25jRHJaM1c2b2NnVUxHOTdkeTA1dkpjcmRWZHZNYlpLclNFcWZB?=
 =?utf-8?B?dlJ2cXVoMit4RXJpUFY4aDJMeGZxaFBCY1FsZ3dKYzBQdW5yay8zRVhDVUhQ?=
 =?utf-8?B?a1d5NjdzQXgxY3RkWjE0T2JNTXllc3N0cWxIczkxQnJ3bEFvZ0pmRXU5d0g3?=
 =?utf-8?B?SDdhRUUzME40ZWJwYkFzMDhMUlFxZUgwZ2JKWDAwRXNxOW1pMjUvbDVnQzZD?=
 =?utf-8?B?TFE4STZTOXYwT1dWK2hKUDNYaXRUcXNuU1Yvekt5NzJmVWJBai9FVWVSMVFO?=
 =?utf-8?B?QVR2N0V3dENESmU4Z1o5L1NnWWZTSS81L2lqK0M3bXNDekpEdnl2aHFhZHZX?=
 =?utf-8?B?amNUMWJPcGN4ekZlb2hmN3ZhSHNHMVpidkRNekpaNVM2NXEvWG5NWVkrY0pL?=
 =?utf-8?B?SUhCMy8rWTVDUEwzK2pIbVo3a0FlOEg2Y2hzVkpDRXZheDREWTZmRDFRdVNs?=
 =?utf-8?B?MEJydFdMOUlFbk4ra0hudFd6bDZJUTdxbXdpT3BXbG1BRlpML1NNdFJjZy9V?=
 =?utf-8?B?dzN4UG5MTkdMM3JkdmphYm85VWc0LzhROVlMSW45Zm5xTjRMZi93blpyYUFY?=
 =?utf-8?B?NFExckRwSWRXN01vRTBTOXZ3NHcrOHRsSXJxVVQrdmoxMUhXUUhyZHFxWjVo?=
 =?utf-8?B?M2kySzJnamxYbXFiRnFsYXhkU3YvNDRLTE9KWUFScHZadktqQzBwUHVSZXpi?=
 =?utf-8?B?Nm9obElLaEZBb056NmxrLzRXQWVQNTVLdHJXNjVhamlrM0lqZWpBNTRPK1hJ?=
 =?utf-8?B?VjdCNXhhMHZjaVdJMmd3ODRaMGlFTWpmWUVmTG51Qi9xampSNjI3ZEJCR1gv?=
 =?utf-8?B?SjNKME04akJueHdsYzhaSThaVVE4ZExPRFBLTkhRazRac2FCZUhnbFM3SGV6?=
 =?utf-8?B?Nm5pZk0zb1JCOCtPVVNERnFBdzJkcms5K0lTSmZpMDFtWXRiM1pWaXFySlZa?=
 =?utf-8?B?WDBIczBGZGFQUG10cTAyd3lWSm9Wck5QYVp3THNVNkpCcTVvZVFWUEM5R3pW?=
 =?utf-8?B?bkFuMllMMU9jczVKTXZxaHFKZlFBaHpQZTRlTzA5U0lqYXM1QXNwRVVPNjMx?=
 =?utf-8?B?Uk9IWFdEeloxSDB4ajhMK1lRbE00MlZqaHN2Rm9JbGVCTHBYSnI5enRxSUsw?=
 =?utf-8?B?R3NucHVsZmtDckt5eHhQOC9uQVdkb2dqd0g1WXZWWGgrekxxTUNoWk4zdDlh?=
 =?utf-8?B?QTVFUnZNQ2Z6WC9wMUl6QnJwaDZTa2hackt2NGNET1VQdXNxODZtOFA0MUIz?=
 =?utf-8?B?Z1VTak91LzZSQmNaODVFRlZRMDhMSC94OFVoN1hrNXRTTjg1TzhtYzRPWDhU?=
 =?utf-8?B?YTQxT1BJcDZnVWNVckxUcVpmWktlWVBIc0ZGakNkMWVmcWpGSGlLREZjOUdG?=
 =?utf-8?B?blR2R3d0dFNCMVpVVUpKVUNPeHFpZEczRTU5eEtxOEt1czBPbEdRemV6ZFVV?=
 =?utf-8?B?dmFic1ZwVzlQZ1dpZzBiYjg3VzhvSUsxOVp5WGtHNFBrQTlmV2x1YXpKRVZQ?=
 =?utf-8?B?amJVRFpyZ0wwVFlnanhVVWl0eUNZWUpQMW1SZGpKdG9ZazR3ZUdMbE1UUnFT?=
 =?utf-8?B?R2ZmcnlYdG9SU28zVFpFY3VpcDl4UVlaTHhnaVQwY2ZoV3YwSU5NNmVadW4v?=
 =?utf-8?Q?0+Wr5/ho7ASOh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d36fe3-be33-45f3-f1e0-08d96c934793
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 15:23:26.8115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X4aQP+cWxni2+o4QgJocmBKexqAt9JSYACdKrY1qDToqsvZfh8iO2w3/+NDfXL0UA0uiRp493lJTl/s3ugq2Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2349
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


On 2021-08-31 10:38 a.m., Daniel Vetter wrote:
> On Tue, Aug 31, 2021 at 10:20:40AM -0400, Andrey Grodzovsky wrote:
>> On 2021-08-31 10:03 a.m., Daniel Vetter wrote:
>>> On Tue, Aug 31, 2021 at 09:53:36AM -0400, Andrey Grodzovsky wrote:
>>>> It's says patch [2/2] but i can't find patch 1
>>>>
>>>> On 2021-08-31 6:35 a.m., Monk Liu wrote:
>>>>> tested-by: jingwen chen <jingwen.chen@amd.com>
>>>>> Signed-off-by: Monk Liu <Monk.Liu@amd.com>
>>>>> Signed-off-by: jingwen chen <jingwen.chen@amd.com>
>>>>> ---
>>>>>     drivers/gpu/drm/scheduler/sched_main.c | 24 ++++--------------------
>>>>>     1 file changed, 4 insertions(+), 20 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> index ecf8140..894fdb24 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> @@ -319,19 +319,17 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>>>>     	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
>>>>>     	/* Protects against concurrent deletion in drm_sched_get_cleanup_job */
>>>>> +	if (!__kthread_should_park(sched->thread))
>>>>> +		kthread_park(sched->thread);
>>>>> +
>>>> As mentioned before, without serializing against other TDR handlers from
>>>> other
>>>> schedulers you just race here against them, e.g. you parked it now but
>>>> another
>>>> one in progress will unpark it as part of calling  drm_sched_start for other
>>>> rings[1]
>>>> Unless I am missing something since I haven't found patch [1/2]
>>>>
>>>> [1] - https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Flatest%2Fsource%2Fdrivers%2Fgpu%2Fdrm%2Famd%2Famdgpu%2Famdgpu_device.c%23L5041&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C86b39a7bbcd34a18c6e908d96c8cf862%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637660174991641911%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=tz7lxvL%2BR6NrpcdfIg1Mjw5lZ55%2F5HTPF%2Fkwu7wqvqE%3D&amp;reserved=0
>>> You need to have your own wq and run all your tdr work on the same wq if
>>> your reset has any cross-engine impact.
>>
>> IMHO what is problematic in serializing vs. locking (with trylock and bail
>> out like we do in [1]) is for multiple TO events arising from same reason
>> like maybe one job just waits for another and once first is hanged the
>> second will also appear to be hanged triggering it's own TO event.
>> In this case multiple TOs event will trigger multiple resets if we serialize
>> but if we use lock with trylock the second one will quietly bail out.
>>
>> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Flatest%2Fsource%2Fdrivers%2Fgpu%2Fdrm%2Famd%2Famdgpu%2Famdgpu_device.c%23L4903&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C86b39a7bbcd34a18c6e908d96c8cf862%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637660174991651903%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=SpirDOLVdw5kIZAq0LHjnB0Qy6apwPLDPFjm61Wc2ko%3D&amp;reserved=0
> Hm so I guess a single wq here, that will hold up all other TO. And they
> should recheck whether the job is moving meanwhile.


Can you clarify about this ? What job should be moving ? The dependent job ?


>
> Also unless you use hw semaphores the job shouldn't even start before the
> deps are singalled, so not sure how this goes wrong?


What about a simple example where
we actually can submit a shader on one ring and a simple
WAIT_REG_MEM packet on another to wait for the shader to write
a specific value to specific memory location. Here you have both of them 
started
in close proximity and no explicit dependencies involved (at the 
scheduler level)
and yet if the shader hangs also the WAIT_REG_MEM job will hang.


>
> The vm_id flush stuff can make things a bit more fun for your specific
> case, but in your specific case you have to run all TO handlers on the
> same ordered workqueue anyway (because trying to paper over this in other
> ways doesn't work imo).


I didn't get this one.

Andrey


>
> So I think this should all work, no need for tricky cross-scheduler
> locking.
> -Daniel
>
>> Andrey
>>
>>
>>> See
>>>
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdri.freedesktop.org%2Fdocs%2Fdrm%2Fgpu%2Fdrm-mm.html%23c.drm_sched_backend_ops&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C86b39a7bbcd34a18c6e908d96c8cf862%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637660174991651903%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=uV4s%2Fsu%2FKabZvsRMd1PAyd36JRSz91aPfYEn8PlvFlM%3D&amp;reserved=0
>>>
>>> for the ->timeout_job callback docs. I thought I brought this up already?
>>> -Daniel
>>
>> Yes, this discussion is a continuation of your comment about serializing, I
>> mentioned before that you proposed it.
>>
>> Andrey
>>
>>
>>>> Andrey
>>>>
>>>>
>>>>>     	spin_lock(&sched->job_list_lock);
>>>>>     	job = list_first_entry_or_null(&sched->pending_list,
>>>>>     				       struct drm_sched_job, list);
>>>>>     	if (job) {
>>>>> -		/*
>>>>> -		 * Remove the bad job so it cannot be freed by concurrent
>>>>> -		 * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
>>>>> -		 * is parked at which point it's safe.
>>>>> -		 */
>>>>> -		list_del_init(&job->list);
>>>>>     		spin_unlock(&sched->job_list_lock);
>>>>> +		/* vendor's timeout_job should call drm_sched_start() */
>>>>>     		status = job->sched->ops->timedout_job(job);
>>>>>     		/*
>>>>> @@ -393,20 +391,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>>>>>     	kthread_park(sched->thread);
>>>>>     	/*
>>>>> -	 * Reinsert back the bad job here - now it's safe as
>>>>> -	 * drm_sched_get_cleanup_job cannot race against us and release the
>>>>> -	 * bad job at this point - we parked (waited for) any in progress
>>>>> -	 * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
>>>>> -	 * now until the scheduler thread is unparked.
>>>>> -	 */
>>>>> -	if (bad && bad->sched == sched)
>>>>> -		/*
>>>>> -		 * Add at the head of the queue to reflect it was the earliest
>>>>> -		 * job extracted.
>>>>> -		 */
>>>>> -		list_add(&bad->list, &sched->pending_list);
>>>>> -
>>>>> -	/*
>>>>>     	 * Iterate the job list from later to  earlier one and either deactive
>>>>>     	 * their HW callbacks or remove them from pending list if they already
>>>>>     	 * signaled.
