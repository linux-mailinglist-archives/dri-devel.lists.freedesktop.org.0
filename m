Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC5D4E58F9
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 20:13:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1630210E0D1;
	Wed, 23 Mar 2022 19:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2066.outbound.protection.outlook.com [40.107.94.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC5410E0D1;
 Wed, 23 Mar 2022 19:13:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IPxKW39EUL7G8t67G435Bj88o8iGOLqWBdTaoCPauurevKvwv0jbdTKAchnNQR2dOSU8o79ZuiD+CAYE3fVveLid9txdyXdiBNQ/wn7IH9ev0mJSzjqzuYeaccJZ3NnUOoMbK3j5nmzdrBQboggwfnujgLlJ6KTwptcYFlvtm4bq6yaFS6SJ5xkpTBHlFJbS06roxvypQBfSrJCagDwu24sQrEUm8VwzCyzgvMkFONtwmrpxMCqIxQBlzura1B6D0zLpGLtmSE/oereaupi382N0lfkaJRoub8acJ24fo5cYF3VFryVHyjApWDQ6vnxRdUn6H+QYVUEa6jTjRU6tNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6h3sUz8bhs3D90HGxhp7V/78f7iCFBUvGnm7S5UayLs=;
 b=PkZ78P1W1s21RIevqVW8uh8uQaTuyEkxq66+owuef4QMcWCWN8XV8G1G14F+y5V7tCc9TPu7hWfIAWfrPfi8VKypMG7V5srtlvnemMWf7eA319OQqecsE26obI4ItsTDnKvBgquTzhKnRhx7d1wBldolIKynxM4d7yDMe5yjTXH5oCQ31W5rAn0xhrylruLS+FCg0sFWPCGGSBBYKXVmS660KINadGgZg3FL6Qv608nWxOUxeLUpzmArZSfx0k/xNbiglAtiyrX3uEO5z7kyyTJJO+Bqxg10p85CYmGMFnK3+I+OTvplNSOCEkhqjuLCTIKsU17SyDT3RXmTQrhg9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6h3sUz8bhs3D90HGxhp7V/78f7iCFBUvGnm7S5UayLs=;
 b=OeZeavap3nW+n5qRxDQqmGCxdoTXC8qObL107Cbjbr+5JgfuIbJUXjWwpRDOrlUrtirDnQjXuBVyeAFJyWNE+sjCECwf0s9esD2d/hln/vCDY298S5VjyStQ/tzq57T9fgWXyzIxvrXRVFaAJhZQ1KXMQsDc2vZFRmPXbxDEwXg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SN1PR12MB2495.namprd12.prod.outlook.com (2603:10b6:802:32::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Wed, 23 Mar
 2022 19:13:21 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::4839:9431:1040:5cd5]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::4839:9431:1040:5cd5%4]) with mapi id 15.20.5102.016; Wed, 23 Mar 2022
 19:13:21 +0000
Message-ID: <4d1f3148-c421-a35f-4466-837b63c3958d@amd.com>
Date: Wed, 23 Mar 2022 15:13:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/1] drm/amdkfd: Protect the Client whilst it is being
 operated on
Content-Language: en-US
To: Lee Jones <lee.jones@linaro.org>, philip yang <yangp@amd.com>
References: <20220317131610.554347-1-lee.jones@linaro.org>
 <8702f8a5-62a1-c07e-c7b7-e9378be069b6@amd.com> <YjNNCXc8harOvwqe@google.com>
 <1f003356-3cf9-7237-501e-950d0aa124d1@amd.com> <YjNQA80wkWpy+AmA@google.com>
 <b65db51e-f1ba-3a9b-0ac1-0b8ae51c5eee@amd.com> <YjNh/Ajxgp3mjvWV@google.com>
 <YjsWvy8cT2eOw618@google.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <YjsWvy8cT2eOw618@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::6) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62a93ec8-a809-4c4d-f960-08da0d01323b
X-MS-TrafficTypeDiagnostic: SN1PR12MB2495:EE_
X-Microsoft-Antispam-PRVS: <SN1PR12MB24957797A8A6FD8D60B6C6FD92189@SN1PR12MB2495.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SbaWcmEITsVPPZl/w607O7pw1+Sf1RQ5tbClZDkbLfOpxhU2oaY/+/1gSxSrQ0bhXNO8NE2m5laL20oQQtKpIa6zC3B3AQluO4PEYo26e69eGNYydAHqKE7FDveucimLklN5sWNOhuCXNYgZ+Ey/EJ+vUkFiGrgyaKId+SefQNI1xwCsmyzKgQu04aAA2cYSKMuE8JnWVmXwjtJSrqOwRg/hnM9MzwmBxOWp+FDdASSzxmySDx39kAqMPqYPVSRSaRTnQH8Us/aijtWXtpSYvZLacyK6v0P+mz/VhdUJGo1fLlEGcgAU54QjVdFPF3LXdmK1Wn/yrkxSYtu6PaLUHRWqEHFJRI9395DHjD1zXzvwznhgfGSxHvWJBrAVkROL9dFkREbwSHM/ELOktfFahIkO6uU/YZcM+35ggL/JS/5rd8EodCuxethnhl1rbAPUsa1eQsQfqq+03ExF+edYcQSoYkad3hwX/DzpIfHy9LNSvzbywjAPV397tOdWmrYtZp0gbVxzldGnjZY5E6lPXd0QQV1DjinD8CgCdknj+0uDmqwmK2Tx0/WOct9DRXtFh6o+dI6cyr6QGoqjuC5pBYzMioPf2TrHg/toEmFryetfyC3zGo5V8Or5gBtrY/YBWOwbGgYoJWSFLzKtcN/DNbjWNS/qVEB1grqfw+cnK4W0OpVQU0cRLE/H45JRAniq4AMDvA7mohiqApiNPiXUE9y+2Y+F2Xx8JShVNqbiuE3GC7IdeN3gfl7qLjeYuiZqYJg9aLwsSZvsQpTVuy8+XQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(44832011)(2906002)(508600001)(186003)(66574015)(31686004)(36756003)(26005)(38100700002)(83380400001)(6506007)(6486002)(53546011)(86362001)(6512007)(5660300002)(66946007)(8676002)(66476007)(66556008)(8936002)(31696002)(4326008)(316002)(6636002)(54906003)(110136005)(2616005)(487294008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dys2dEUxQ21PbXRmQkRGQVNobzRFVzkySFZWQWNURWd3ajZQTlFSejAzUHRY?=
 =?utf-8?B?Q1QvSlF6Qlg5YXdVTkxsSHFOT3Y5ay85aXBJeGlLd2xVUkY2eGx3bk9TbVhq?=
 =?utf-8?B?YXdWNGtTeXVBTjNDekh1Z1pXUFVHUnNic2dRNnpDOWQwSDJwdnFacE1qU1NH?=
 =?utf-8?B?Uk1pUlh1Vi92UERoUmpNMDFRWDl2N2dHRmZsQXk0SjhPS1pJVjdjQWNUbllD?=
 =?utf-8?B?ZG9LT25nd3kwK014b1c4aStzY2lkZlUyaTcxMWxXdHhWYzNSLzdBaWNZdUlQ?=
 =?utf-8?B?dWQwRitNNHFlTTJEK0NOVlJuOEFXQytxOEpQMytqWDREeXhuTEFYM3pRd0FV?=
 =?utf-8?B?dzhRak1PS1NEZEo0SFZoS3lYOTNEbm1keFdqL3JiTjloRWhQeml5VDE1MnAw?=
 =?utf-8?B?dXlYT0dyZXJzVlVmT0p0eU5wNTBmNjgyL2dkVlhTaElRbGhlNXpCdEd1dFVD?=
 =?utf-8?B?bmJwZHNpNEJ3VGxsc0MvNEx3UHA1UGRmYzRmSFVMd2QvZWhlRWdVS04zZmxs?=
 =?utf-8?B?SWNJOU9YMUszQk5ML3d4ZzZJQjF2TTljUi9LM1F5cGRYMjh2Y3lhYTdYVnI1?=
 =?utf-8?B?TDQxY2JEU2hOQ01tYnhXclRIWUtYcklTUGs0d2gwWVF1c0Jmc2VxUTBoMC9j?=
 =?utf-8?B?aVY5dEM4Z0E4b0NyelA0czc0aUZ1RmVwMHdtOHVZN1ZNY3lDaG1adGZET1hy?=
 =?utf-8?B?cDR0Mm9YQkFIOEttb2JZQ3hGcnltT1VsUlpXYzNtamwwQUg0QWlZSmRwUjRx?=
 =?utf-8?B?SUtvbE5BKzEvc0hIOTB2S1g5MFMwVm9BeHFDbGJrZjZya1phNGw0SVFRaFFY?=
 =?utf-8?B?TUtOZ1pBNWpHUXoyTFNYQlNuRFVucHpnMUhXNTZhNHUxMXpMMlNTb2ZsRkR1?=
 =?utf-8?B?NlJ3VUFndXNFL3ZvR1VPN1pkNXJ3NlZKaHRyblViVlFMMjBhMWl5azJjZDh3?=
 =?utf-8?B?RkxFckk4c0s1UDJnYWJDeEs5bzRsR3B2TE1xbSsxQmRiS2psd2hGVnhoS1Ro?=
 =?utf-8?B?Ynh0N3B5YUNpWURZL1dMR3I2ZGRvd1RZaHk0c0FNcGRwV21nRWQzaHZJSGh0?=
 =?utf-8?B?dFJRblNUOHhGN3pZNTBDVTZ2dmZzZzZMSm56KzArVGJ2aytVNkhQVnp1R29K?=
 =?utf-8?B?L3VuVUt4eWJaWVEyeU1tcXRKS3BFZlppK2JoNzRTTGIzbmFSTmVHbVh5NnQ4?=
 =?utf-8?B?cWk3YmtkRC9uMU9CbmJwMEFabDErMnlSU0NRZHBDVE5EOWRKUHBkeGllQW9F?=
 =?utf-8?B?ODRQUHVpN1FuMGVMditpV3U3NU9kQ0lXcG9vRFg0emZLdFBsdHVtTHFXUE93?=
 =?utf-8?B?RHc3VVMxZlYvamVnbVFFZnp1eERIMTY5QWdwUGpOUFlSWkoyTVExVnl1dGgv?=
 =?utf-8?B?cmp2MldOZnJUR0RGRlBYL2xBdnlUMk90V1RsdmJzY2tzRW5lOVdISHpZN241?=
 =?utf-8?B?VUxXcFFWYzhONXBsQzBPNDI1NFV4bjJtMFR2emFhdzFaeFROb3kxcG1kbWtl?=
 =?utf-8?B?Vm9PMUJ4WXRJUGt0YjA1NDJ0TnVvR0c1eXgvbC8vZzVidTdjT3NnblpWWXNs?=
 =?utf-8?B?Z0EyUU9vaHFIT3p6UXNOMGQ4WjVXdHZuSk1ONE1rOG9EMUx1N2FmMWNMWGFL?=
 =?utf-8?B?RFhyU3FhaUExeXhvdmIvSWx3ZUdMTnMyZEFLQjVqeWw1MHFtTm9HWmhVVXgz?=
 =?utf-8?B?YVZTT2FQQnd3bGc4QnpPanJjVzFhVlVmWVd5WGgyR1cvUE5Qa1FjemMxd1pO?=
 =?utf-8?B?M1N2NE51aUxqM3lka2c2ME1iODRkZ1BhamNqYVNOWGFGY3VBUlhOY0JrSG13?=
 =?utf-8?B?L3hETmt5ZGFPZmZhaEhwbytGNFMvQU8valVyb2oxZk5sSC9VR0Rtd1JaMlZj?=
 =?utf-8?B?Qk9aaFo4MmpmZ0trcjJSZXN3RWcxRFlCVFVxRkV2TklIWSs3ZS9ZZElXbHh1?=
 =?utf-8?Q?I59+hJciwBBXNPPt8K064l6gXXrLfcDf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62a93ec8-a809-4c4d-f960-08da0d01323b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 19:13:21.6984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R6jY+17LLuti5wBZ4zrOA/7+n4xFYe/zbPc6pchuiyBq2WJLrbxq6Jv3IzsI7LqDHE3LVOYFtZKjwyzoXuM75g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2495
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 2022-03-23 um 08:46 schrieb Lee Jones:
> On Thu, 17 Mar 2022, Lee Jones wrote:
>
>> On Thu, 17 Mar 2022, philip yang wrote:
>>
>>>     On 2022-03-17 11:13 a.m., Lee Jones wrote:
>>>
>>> On Thu, 17 Mar 2022, Felix Kuehling wrote:
>>>
>>>
>>> Am 2022-03-17 um 11:00 schrieb Lee Jones:
>>>
>>> Good afternoon Felix,
>>>
>>> Thanks for your review.
>>>
>>>
>>> Am 2022-03-17 um 09:16 schrieb Lee Jones:
>>>
>>> Presently the Client can be freed whilst still in use.
>>>
>>> Use the already provided lock to prevent this.
>>>
>>> Cc: Felix Kuehling [1]<Felix.Kuehling@amd.com>
>>> Cc: Alex Deucher [2]<alexander.deucher@amd.com>
>>> Cc: "Christian König" [3]<christian.koenig@amd.com>
>>> Cc: "Pan, Xinhui" [4]<Xinhui.Pan@amd.com>
>>> Cc: David Airlie [5]<airlied@linux.ie>
>>> Cc: Daniel Vetter [6]<daniel@ffwll.ch>
>>> Cc: [7]amd-gfx@lists.freedesktop.org
>>> Cc: [8]dri-devel@lists.freedesktop.org
>>> Signed-off-by: Lee Jones [9]<lee.jones@linaro.org>
>>> ---
>>>     drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c | 6 ++++++
>>>     1 file changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c b/drivers/gpu/drm/amd/a
>>> mdkfd/kfd_smi_events.c
>>> index e4beebb1c80a2..3b9ac1e87231f 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
>>> @@ -145,8 +145,11 @@ static int kfd_smi_ev_release(struct inode *inode, struct f
>>> ile *filep)
>>>          spin_unlock(&dev->smi_lock);
>>>          synchronize_rcu();
>>> +
>>> +       spin_lock(&client->lock);
>>>          kfifo_free(&client->fifo);
>>>          kfree(client);
>>> +       spin_unlock(&client->lock);
>>>
>>> The spin_unlock is after the spinlock data structure has been freed.
>>>
>>> Good point.
>>>
>>> If we go forward with this approach the unlock should perhaps be moved
>>> to just before the kfree().
>>>
>>>
>>> There
>>> should be no concurrent users here, since we are freeing the data structure.
>>> If there still are concurrent users at this point, they will crash anyway.
>>> So the locking is unnecessary.
>>>
>>> The users may well crash, as does the kernel unfortunately.
>>>
>>> We only get to kfd_smi_ev_release when the file descriptor is closed. User
>>> mode has no way to use the client any more at this point. This function also
>>> removes the client from the dev->smi_cllients list. So no more events will
>>> be added to the client. Therefore it is safe to free the client.
>>>
>>> If any of the above were not true, it would not be safe to kfree(client).
>>>
>>> But if it is safe to kfree(client), then there is no need for the locking.
>>>
>>> I'm not keen to go into too much detail until it's been patched.
>>>
>>> However, there is a way to free the client while it is still in use.
>>>
>>> Remember we are multi-threaded.
>>>
>>>     files_struct->count refcount is used to handle this race, as
>>>     vfs_read/vfs_write takes file refcount and fput calls release only if
>>>     refcount is 1, to guarantee that read/write from user space is finished
>>>     here.
>>>
>>>     Another race is driver add_event_to_kfifo while closing the handler. We
>>>     use rcu_read_lock in add_event_to_kfifo, and kfd_smi_ev_release calls
>>>     synchronize_rcu to wait for all rcu_read done. So it is safe to call
>>>     kfifo_free(&client->fifo) and kfree(client).
>> Philip, please reach out to Felix.
> Philip, Felix, are you receiving my direct messages?
>
> I have a feeling they're being filtered out by AMD's mail server.

I didn't get any direct messages. :/ I'll send you my private email address.

Regards,
   Felix


>
