Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF41A44C192
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 13:51:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF796E1D5;
	Wed, 10 Nov 2021 12:50:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C155F6E157;
 Wed, 10 Nov 2021 12:50:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CsqviLvIoSx/yr4RxvdRBZUxBdAxoquirRCffXQJgKcdsU+yu5wO8NUp8U/SNhKpTT9oVpsGNyX4d72V0HmicmSzhjVuLC/6iEmlnWPzMk9JJi8A2/YLN9o0oja7/ueE4NIfjyPqtjaI2I0R/7feYi9AYCEVthDJgtzwZJA7x6YbV/+VT8KDS0Vw9/X+aGMo1ssL9pGwKw7GlY/Wrl9XdgR7xLE2WAA1j2rgQp9luFft8kwkUIAca14UZbeDlDzXGmykJjeDDSeFOb4afitz7gvUEshSbRVLqFWQcERLj7vmBogqnWZ3yDd8vntyKWSYywk274f7stJiJB7UnO44qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWz9Giz8wmrCzqsipGPVS1Bl16FIxxsEkMfoJQYbudQ=;
 b=LrBvsLfHS9NFHDGoXL+XdfD1TQqSIUI7GuNVbeMqWijaY91gE8Cf6kpep7BnYpxUR7XRZdLudJ+IFhxRZW8tepq7lKw3j9yJ7SfS+b7tK5s5oapUeZhO9E4tNchkXjvgl03VaKM7kPNLH0g6qPxc7moaRjns299qY6Gum/0cBcDlePoZyo4q5SkwMaA6j+eyhXI0A0OV1xbBbuF5TKXDxLxDNv9qTIO1gyCpLUFDt5Nz97wiVrKn5rPZH38dW2ivHR72XBpVZSmAL8r4bTRYxYL9LwJaSzQY+0/4rw0RmGnt8GfPuzbonFdKiQXbJFenS0uofKQkenVTyVGS3Bctdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWz9Giz8wmrCzqsipGPVS1Bl16FIxxsEkMfoJQYbudQ=;
 b=NYk32OuvbfU8f2wSt4Q9sSJwVC9AjYakHAlSIFR8Ak1vzZy5wk3WQaWgQ+Iqh5GXqNO6UD7EKowKW8FW55NFo5Q877BG6JranNN7Q+IWVZzqLAChwZh0ZKIjF8KzW+cTWjMQaio1NxqtZ5RrtDyqwDtZV/rJnwa4APwyFQBDgCI=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM5PR12MB1275.namprd12.prod.outlook.com (2603:10b6:3:75::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Wed, 10 Nov
 2021 12:50:51 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::710e:dfc2:4247:8568]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::710e:dfc2:4247:8568%12]) with mapi id 15.20.4669.016; Wed, 10 Nov
 2021 12:50:51 +0000
Subject: Re: [PATCH 2/2] drm/sched: serialize job_timeout and scheduler
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>
References: <1630406139-19621-1-git-send-email-Monk.Liu@amd.com>
 <1630406139-19621-2-git-send-email-Monk.Liu@amd.com>
 <YS4nlkpjeitiwFy1@phenom.ffwll.local> <YS4oMrFTj0+wmMbY@phenom.ffwll.local>
 <BL1PR12MB5269292A3E9E6014043C280E84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <CAF6AEGsELL5WmxJKqyfF69OnVaK6+SnAREvjtFSHBZrm3Gdp7g@mail.gmail.com>
 <YYo6U6D2dxQ7Y6Gn@phenom.ffwll.local>
 <CAF6AEGvGQP-6eNevDyS9sXg+6qOKMrG7h5rwhKO=v8L5mQOiUA@mail.gmail.com>
 <YYuVyRlAATYO4ptP@phenom.ffwll.local>
 <ec8352f1-e473-683b-ecc6-9969c50c4bac@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <35f4af98-e897-a4c2-6928-01226979c171@amd.com>
Date: Wed, 10 Nov 2021 07:50:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <ec8352f1-e473-683b-ecc6-9969c50c4bac@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT3PR01CA0033.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::19) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:3edf:49b0:8e6:281d:1c64:6e5]
 (2607:fea8:3edf:49b0:8e6:281d:1c64:6e5) by
 YT3PR01CA0033.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:82::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Wed, 10 Nov 2021 12:50:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65725971-cbf5-4519-e32b-08d9a448b99d
X-MS-TrafficTypeDiagnostic: DM5PR12MB1275:
X-Microsoft-Antispam-PRVS: <DM5PR12MB12754F3A207B159189D5B9C3EA939@DM5PR12MB1275.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4NuIllNi8bR7IuJ1bOGvgAM7AerFDeJsbIolcp+goG6qJVEeGSMP/iCcRV5TlmHDkkHHMsizcuU7/xWcvkLdz3c5MFub0qGFjaQWOZCBAxeUwdD6gorTRMNH/ra/6hI/TW0R0arDToYnqaD/F+QJaylfQGjuV84TD61Rzu82McygrhzEFR+TM9dVNF/5n/wVC1Ntga3P6G7VmbJcRBpPfImExYXssYfugEnkY1OmYsWd4trw2HM3PbdiVo548X+YjTNjbKS+7NvMrhMdrF+9ltumJufNA3kr7i8srG7GLAXUOe7Pfd9imfwK//jIJQQvU4VhFWAjNDi3afVldc1KuxYTHiXzgs/CIWe1mKu+mUDV6FDamqVmCzuK8wouBvkNsjrxwrGT/F+BN14JeZboKeR1n/WRb5EpQuck8oxHlpVkrUVs98PCcR3rH+bIj2zlT5QsafXvKNoWeR4sRsZX0IJn2zJx3tesruuT8R1fuDmoSoq3XKMfCidRHiQYK3wSRg23A74SKB0zQex0EgE1jupIUNx+KWBoP7b17r88AH2CTQo3A1A22V8WpR6KFXLTdDzdq3p14G8vThTdncKaHKCj5H5M/wLtgnH7sm+dxoCLVNjH+xdVlJd10VTnnqs/z37aVsfVaJ0UeYtzcEEIZmIugTB+nKmKEPrka5ivVGb0u8QdICErRClQSTCXRfN9rAFCim6sB3Q1Wk6Tkd+LUrkECtoHlbhHRTa4pu7KAJBeCcEosaYhQfcob5HfItvmDt/JZjLpFRL9SysyFW/WqZKUW44hgcldrF3hE9Oak5+QY+qHeExqE3HZV8co6PmW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(53546011)(86362001)(508600001)(66476007)(54906003)(66574015)(66946007)(8676002)(6666004)(4326008)(6486002)(2906002)(45080400002)(966005)(4001150100001)(36756003)(31686004)(110136005)(2616005)(186003)(8936002)(316002)(31696002)(83380400001)(38100700002)(5660300002)(44832011)(30864003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFBqRkZtb1pzandIQmpTUUNTNzNibmJ3azdWK2xWMUFEbTNsN2VYc0Flc3l0?=
 =?utf-8?B?MzZrNU4xWW1oZXpiTEFtT0VycTQvQm9YZ0tzb0laZUIyaXI0cnhSRnA1Qmp6?=
 =?utf-8?B?QWptWGM2Z1RmcUkxS25xTmdJOEpnQjVnUzM2bE1PKzg2L2NTa1NzKzdLN1ZD?=
 =?utf-8?B?dEk5WkNLQU41bnE0WWFDRlp1WHBtMUxzK3BJa1RFRWh6c1dWalExWjg2STBI?=
 =?utf-8?B?WmJBeVU0bmtCWCt2dEZQUFROWTI1ZHoyZC9sL1ZTcWFFWGxnclZVNGJrNWQx?=
 =?utf-8?B?U0poaCsyYVNGeG43NHBSQnZkbVpNN1J3TEpsZkN0YUlJMmhEOEE3TVJudXhq?=
 =?utf-8?B?RlE2cVJickMvYStwTTEvN2VEZlc2TXBocHlyMnhuMFZlUk5TK0MwbFNiK0dP?=
 =?utf-8?B?ZU9jYVRtbUFaVjgrWmtHZFdMSFhqSzRBMHBRWllHSXJEa2g5UUgrbjFUTUNW?=
 =?utf-8?B?MS8xT0lEM1ZVMHFzWDMxOEdHTUptSjRjVVJrN3JIMTM3WjJuV3B3V1IvY2JI?=
 =?utf-8?B?SC9IMGlXeCtwc2lMTis3VE1mZFdXd0lpVG9vOXYycjczem9JdERwTGE1czMz?=
 =?utf-8?B?ZVRKaStMVTVScWF5VDMxNWNUSkVFVW5aUWk4emgrVXA1WjA1dDlaMXoyVHB1?=
 =?utf-8?B?L05ueUZUajhVa3lyRXJvM010ZHdDSE4xc2I3YXdrdEltWXdWT203ZmlMSzhN?=
 =?utf-8?B?c2pIVzFQL1E4VWxmcEFoc293RHFzaWtCdnk4NmdEQkJOdDVZTFZ4ZU8xRjhF?=
 =?utf-8?B?MXB0Vld3bmpWOHBHUWcxTTRLUkRXdWh3SzYrc1JqYTcwcHphOEZJWWNVZWlW?=
 =?utf-8?B?SVJPdWZJZXZTenNTM1hqTktCZFFhQUdEUHVVRGsrRWxreFNZZHhiSHNYMmhO?=
 =?utf-8?B?a0w4bUZpOXVJZSs3SmZVaHJnTHl6YXR6WXh5WXVVdUY4ODJOR0JTQWF1TFFW?=
 =?utf-8?B?bHovWUIxM285U2hyNCtUSXY0WGYyMWUreEpQelpKM2p3b0VKbDhxZm5KWTN5?=
 =?utf-8?B?VzY1TUNmSnN2Ukg2RFB1K0ZnenpKRE1ta1Z3RXMyRUxpTitYVU9lZ2lrVVNh?=
 =?utf-8?B?czRRelhpczVZbjYxRU82YWprMVJVMUN3QW5GWXVqcGEyalhFeUlOL05zQWhy?=
 =?utf-8?B?VUdSZlpLMFF4TW5RY00zRFdvS0ZYa2svTGQxY1BublJ1S0gyL1pPMzlEMVF0?=
 =?utf-8?B?R2U1ZXVqQVJmZkZIblM5cGw0VHVzKzFneFlkcDRBL1ZJQnllSnQxS2hBd1BO?=
 =?utf-8?B?RnlwR2F6TU9Td05WYmt6cUUwTmUrZkIwQXR6Y3duVGxKNG1Eb0ZNVE9XQzBM?=
 =?utf-8?B?ZjhmK3ZIczIzcXlwcmp2cmgyVXRSdm9QRWUvMGVZeVBwWDBUVHpBRlNOZUo2?=
 =?utf-8?B?d2NkcmNLcUxmbXVWREtLd3hmMFhDM2NubFdTYkxEb0VWRGhRYkpLTStIRS9M?=
 =?utf-8?B?cHg2ZTZNeXRDS0JZR0pvK1R6cWFSNVdZZlZ3K08zeWdPU0xUenM3OHZLVE5y?=
 =?utf-8?B?Qms4dlRHakJxdUtsWElMTzJZSnlpQnVMNld2ZDcra0xSSmhUM01IRlRqYzcz?=
 =?utf-8?B?Z29qQ3lSN09hSTVKNXJxVWJHeGoyTFd1eDNRcHdDV2M3Q2VrMm9XQnNZQlVh?=
 =?utf-8?B?WDEvVEs5MHRYbmdQQVdsTTkxRTU4MlRzN2prQ28yM1hUNjg4c0V3d2F5OUlO?=
 =?utf-8?B?MDFaRktxUzZzYm9Ob3VyRkQ4SjM4MmxvZ1p6ZzNCL0dJV25QVHNWbXk0SXNL?=
 =?utf-8?B?dllhVFBxWW9zZG9TUDN5enp2U0hPUG1VRlRCaEVFM2REcnF5Y1BjeHdTdk5p?=
 =?utf-8?B?ZkVGK1gxS2pySXVvWGJxVy85ZUdiUUwrZTZaaW9rd2QzMG1FTm1IKzdGOUsv?=
 =?utf-8?B?b1dNTmxnZUY3SldFT1ZuVEw5Z0Zhb3dBajg0YkNSYzdZNVdGcnc0RnBJaUlQ?=
 =?utf-8?B?L2dQQWFEUktoeFFKaUxWazI4ZnZvK0QyR3NxQmo0ZDlwVDE5cHZ4YXR4ajFK?=
 =?utf-8?B?clljbWZSV0UwQXJtTXByTTcvL3NlYlVUSTlDN0prUHFrV0FubmcxQjlMY0sw?=
 =?utf-8?B?TUorSHNpV1JwcXk5Q0JRdVhDMVlPRVhtTzdkSXdTaU8xUjNaeDJEVEJYTWIv?=
 =?utf-8?B?MVNKY1N5MEdCejhHYzNQS1VGMU5LT05peHZLQzdDeC9VQ1JVcmRabUYrZHgv?=
 =?utf-8?B?TE1PWGx2VFgzSlRoOG5TTEJSZ24veG13UW1UcEFONlpEVWJLdjlUb3RVT0Jl?=
 =?utf-8?Q?ce2GB8FkNYDc8ncFxCJ1Bmr63wIYbeJftfERhBRQgs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65725971-cbf5-4519-e32b-08d9a448b99d
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 12:50:51.1197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vEd6jfnENwPC3VQGAYPvbvU0TsekjUA1xbIgQ2FJuLWe8BDzemE+Kttho16WxSOxf0EHi3FoFuN/AlF+adq7OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1275
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Liu,
 Monk" <Monk.Liu@amd.com>, "Chen, Jingwen" <Jingwen.Chen@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2021-11-10 5:09 a.m., Christian König wrote:
> Am 10.11.21 um 10:50 schrieb Daniel Vetter:
>> On Tue, Nov 09, 2021 at 08:17:01AM -0800, Rob Clark wrote:
>>> On Tue, Nov 9, 2021 at 1:07 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>>>> On Mon, Nov 08, 2021 at 03:39:17PM -0800, Rob Clark wrote:
>>>>> I stumbled across this thread when I ran into the same issue, while
>>>>> working out how to move drm/msm to use scheduler's retire +
>>>>> timeout/recovery (and get rid of our own mirror list of in-flight
>>>>> jobs).  We already have hw error detection enabled, and it can signal
>>>>> quite fast, so assuming the first job on the list is the guilty job
>>>>> just won't work.
>>>>>
>>>>> But I was considering a slightly different approach to fixing this,
>>>>> instead just handling it all in drm_sched_main() and getting rid of
>>>>> the complicated kthread parking gymnastics.  Ie. something along the
>>>>> lines of:
>>>> So handling timeouts in the main sched thread wont work as soon as you
>>>> have multiple engines and reset that impacts across engines:
>>>>
>>>> - Nothing is simplified since you still need to stop the other 
>>>> scheduler
>>>>    threads.
>>>>
>>>> - You get deadlocks if 2 schedulers time out at the same time, and 
>>>> both
>>>>    want to stop the other one.
>>>>
>>>> Hence workqueue. Now the rule for the wq is that you can only have 
>>>> one per
>>>> reset domain, so
>>>> - single engine you just take the one drm/sched provides
>>>> - if reset affects all your engines in the chip, then you allocate 
>>>> on in
>>>>    the drm_device and pass that to all
>>>> - if you have a complex of gpus all interconnected (e.g. xgmi hive for
>>>>    amd), then it's one wq for the entire hive
>>>>
>>>> _All_ reset related things must be run on that workqueue or things 
>>>> breaks,
>>>> which means if you get hw fault that also needs to be run there. I 
>>>> guess
>>>> we should either patch drm/sched to check you call that function 
>>>> from the
>>>> right workqueue, or just handle it internally.
>>> Hmm, ok.. I guess it would be useful to better document the reasoning
>>> for the current design, that would have steered me more towards the
>>> approach taken in this patch.
>> Maybe this was because you worked on an old kernel? Boris did update the
>> kerneldoc as part of making gpu reset work for panfrost, which has this
>> multi-engine reset problem. If that's not yet clear then we need to
>> improve the docs further.
>>
>> AMD's problem is even worse, because their reset domain is the entire 
>> xgmi
>> hive, so multiple pci devices.
>
> I'm pushing for quite a while that we get something like an 
> amdgpu_reset_domain structure or similar for this, but we 
> unfortunately don't have that yet.
>
> Maybe it should be a good idea to have something like a 
> drm_sched_domain or similar with all the necessary information for the 
> inter scheduler handling.
>
> E.g. a workqueue for reset etc...
>
> Regards,
> Christian.


I think Monk and Jingwen already switched SRIOV case to using Boris's 
single threaded queue
interface for SRIOV, we can try to expand this to general bare metal 
case for AMD and on the way
to add drm_sched_domain to the scheduler.

Andrey


>
>>
>> Also there might more issues in drm/sched ofc, e.g. I've looked a bit at
>> ordering/barriers and I'm pretty sure a lot are still missing. Or at 
>> least
>> we should have comments in the code explaining why it all works.
>> -Daniel
>>
>>> BR,
>>> -R
>>>
>>>> -Daniel
>>>>
>>>>> ---------------------
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> index 67382621b429..4d6ce775c316 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> @@ -764,6 +764,45 @@ static bool drm_sched_blocked(struct
>>>>> drm_gpu_scheduler *sched)
>>>>>          return false;
>>>>>   }
>>>>>
>>>>> +static bool handle_timeout(struct drm_gpu_scheduler *sched)
>>>>> +{
>>>>> +       struct drm_sched_job *bad;
>>>>> +
>>>>> +       if (!sched->has_timeout)
>>>>> +               return false;
>>>>> +
>>>>> +       sched->has_timeout = false;
>>>>> +
>>>>> +       spin_lock(&sched->job_list_lock);
>>>>> +       bad = list_first_entry_or_null(&sched->pending_list,
>>>>> +                                      struct drm_sched_job, list);
>>>>> +
>>>>> +       if (!bad) {
>>>>> +               spin_unlock(&sched->job_list_lock);
>>>>> +               return false;
>>>>> +       }
>>>>> +
>>>>> +       spin_unlock(&sched->job_list_lock);
>>>>> +
>>>>> +       if (sched->timeout_wq == system_wq) {
>>>>> +               /*
>>>>> +                * If driver has no specific requirements about 
>>>>> serializing
>>>>> +                * reset wrt. other engines, just call 
>>>>> timedout_job() directly
>>>>> +                */
>>>>> +               sched->ops->timedout_job(job);
>>>>> +       } else {
>>>>> +               /*
>>>>> +                * Otherwise queue it on timeout_wq and wait for 
>>>>> it to complete
>>>>> +                */
>>>>> +               ... more typing needed here ...
>>>>> +       }
>>>>> +
>>>>> +       if (sched->free_guilty) {
>>>>> +               sched->ops->free_job(job);
>>>>> +               sched->free_guilty = false;
>>>>> +       }
>>>>> +}
>>>>> +
>>>>>   /**
>>>>>    * drm_sched_main - main scheduler thread
>>>>>    *
>>>>> @@ -787,6 +826,7 @@ static int drm_sched_main(void *param)
>>>>>
>>>>> wait_event_interruptible(sched->wake_up_worker,
>>>>>                                           (cleanup_job =
>>>>> drm_sched_get_cleanup_job(sched)) ||
>>>>> + handle_timeout(sched) ||
>>>>> (!drm_sched_blocked(sched) &&
>>>>>                                            (entity =
>>>>> drm_sched_select_entity(sched))) ||
>>>>> kthread_should_stop());
>>>>> ---------------------
>>>>>
>>>>> drm_sched_fault() and the sw timeout handler would just set
>>>>> sched->has_timeout and kick sched->wake_up_worker.
>>>>>
>>>>> And since we handle the timeout case after
>>>>> drm_sched_get_cleanup_job(), we know that all of the successfully
>>>>> completed jobs have already been popped off the list, and won't be
>>>>> unfairly maligned.
>>>>>
>>>>> BR,
>>>>> -R
>>>>>
>>>>> On Tue, Aug 31, 2021 at 6:29 PM Liu, Monk <Monk.Liu@amd.com> wrote:
>>>>>> [AMD Official Use Only]
>>>>>>
>>>>>> Okay, I will reprepare this patch
>>>>>>
>>>>>> Thanks
>>>>>>
>>>>>> ------------------------------------------
>>>>>> Monk Liu | Cloud-GPU Core team
>>>>>> ------------------------------------------
>>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Daniel Vetter <daniel@ffwll.ch>
>>>>>> Sent: Tuesday, August 31, 2021 9:02 PM
>>>>>> To: Liu, Monk <Monk.Liu@amd.com>
>>>>>> Cc: amd-gfx@lists.freedesktop.org; 
>>>>>> dri-devel@lists.freedesktop.org; Chen, Jingwen 
>>>>>> <Jingwen.Chen@amd.com>
>>>>>> Subject: Re: [PATCH 2/2] drm/sched: serialize job_timeout and 
>>>>>> scheduler
>>>>>>
>>>>>> On Tue, Aug 31, 2021 at 02:59:02PM +0200, Daniel Vetter wrote:
>>>>>>> Can we please have some actual commit message here, with detailed
>>>>>>> explanation of the race/bug/whatever, how you fix it and why 
>>>>>>> this is
>>>>>>> the best option?
>>>>>>>
>>>>>>> On Tue, Aug 31, 2021 at 06:35:39PM +0800, Monk Liu wrote:
>>>>>>>> tested-by: jingwen chen <jingwen.chen@amd.com>
>>>>>>>> Signed-off-by: Monk Liu <Monk.Liu@amd.com>
>>>>>>>> Signed-off-by: jingwen chen <jingwen.chen@amd.com>
>>>>>>>> ---
>>>>>>>>   drivers/gpu/drm/scheduler/sched_main.c | 24
>>>>>>>> ++++--------------------
>>>>>>>>   1 file changed, 4 insertions(+), 20 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>> index ecf8140..894fdb24 100644
>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>> @@ -319,19 +319,17 @@ static void drm_sched_job_timedout(struct 
>>>>>>>> work_struct *work)
>>>>>>>>      sched = container_of(work, struct drm_gpu_scheduler,
>>>>>>>> work_tdr.work);
>>>>>>>>
>>>>>>>>      /* Protects against concurrent deletion in
>>>>>>>> drm_sched_get_cleanup_job */
>>>>>>>> +   if (!__kthread_should_park(sched->thread))
>>>>>>> This is a __ function, i.e. considered internal, and it's lockless
>>>>>>> atomic, i.e. unordered. And you're not explaining why this works.
>>>>>>>
>>>>>>> Iow it's probably buggy, and an just unconditionally parking the
>>>>>>> kthread is probably the right thing to do. If it's not the right 
>>>>>>> thing
>>>>>>> to do, there's a bug here for sure.
>>>>>> Also why don't we reuse the function drivers already have to stop 
>>>>>> a scheduler thread? We seem to have two kthread_park now, that's 
>>>>>> probably one too much.
>>>>>> -Daniel
>>>>>>
>>>>>>>> + kthread_park(sched->thread);
>>>>>>>> +
>>>>>>>>      spin_lock(&sched->job_list_lock);
>>>>>>>>      job = list_first_entry_or_null(&sched->pending_list,
>>>>>>>>                                     struct drm_sched_job, list);
>>>>>>>>
>>>>>>>>      if (job) {
>>>>>>>> -           /*
>>>>>>>> -            * Remove the bad job so it cannot be freed by 
>>>>>>>> concurrent
>>>>>>>> -            * drm_sched_cleanup_jobs. It will be reinserted 
>>>>>>>> back after sched->thread
>>>>>>>> -            * is parked at which point it's safe.
>>>>>>>> -            */
>>>>>>>> -           list_del_init(&job->list);
>>>>>>>> spin_unlock(&sched->job_list_lock);
>>>>>>>>
>>>>>>>> +           /* vendor's timeout_job should call 
>>>>>>>> drm_sched_start() */
>>>>>>>>              status = job->sched->ops->timedout_job(job);
>>>>>>>>
>>>>>>>>              /*
>>>>>>>> @@ -393,20 +391,6 @@ void drm_sched_stop(struct 
>>>>>>>> drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>>>>>>>>      kthread_park(sched->thread);
>>>>>>>>
>>>>>>>>      /*
>>>>>>>> -    * Reinsert back the bad job here - now it's safe as
>>>>>>>> -    * drm_sched_get_cleanup_job cannot race against us and 
>>>>>>>> release the
>>>>>>>> -    * bad job at this point - we parked (waited for) any in 
>>>>>>>> progress
>>>>>>>> -    * (earlier) cleanups and drm_sched_get_cleanup_job will 
>>>>>>>> not be called
>>>>>>>> -    * now until the scheduler thread is unparked.
>>>>>>>> -    */
>>>>>>>> -   if (bad && bad->sched == sched)
>>>>>>>> -           /*
>>>>>>>> -            * Add at the head of the queue to reflect it was 
>>>>>>>> the earliest
>>>>>>>> -            * job extracted.
>>>>>>>> -            */
>>>>>>>> -           list_add(&bad->list, &sched->pending_list);
>>>>>>>> -
>>>>>>>> -   /*
>>>>>>>>       * Iterate the job list from later to  earlier one and 
>>>>>>>> either deactive
>>>>>>>>       * their HW callbacks or remove them from pending list if 
>>>>>>>> they already
>>>>>>>>       * signaled.
>>>>>>>> -- 
>>>>>>>> 2.7.4
>>>>>>>>
>>>>>>> -- 
>>>>>>> Daniel Vetter
>>>>>>> Software Engineer, Intel Corporation
>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog. 
>>>>>>>
>>>>>>> ffwll.ch%2F&amp;data=04%7C01%7CMonk.Liu%40amd.com%7C298815bea18f4fbf76 
>>>>>>>
>>>>>>> b308d96c7f7a8b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6376601170 
>>>>>>>
>>>>>>> 51194614%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL 
>>>>>>>
>>>>>>> CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=QzgCU7%2BPdA0aWL5%2BJLg 
>>>>>>>
>>>>>>> KeKbGaMMGqeGI9KE0P0LXlN4%3D&amp;reserved=0
>>>>>> -- 
>>>>>> Daniel Vetter
>>>>>> Software Engineer, Intel Corporation
>>>>>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C3c31e06d94674e61f3a008d9a4323fb1%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637721358003695123%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=FMFNbfIxwNG3Tv1p1iHLI%2BpepJgwvsT%2FxhL%2FKZc0eVE%3D&amp;reserved=0 
>>>>>>
>>>> -- 
>>>> Daniel Vetter
>>>> Software Engineer, Intel Corporation
>>>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C3c31e06d94674e61f3a008d9a4323fb1%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637721358003695123%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=FMFNbfIxwNG3Tv1p1iHLI%2BpepJgwvsT%2FxhL%2FKZc0eVE%3D&amp;reserved=0 
>>>>
>
