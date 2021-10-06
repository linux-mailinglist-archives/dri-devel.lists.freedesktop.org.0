Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D0E423802
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 08:32:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D016F61D;
	Wed,  6 Oct 2021 06:32:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282596F61A;
 Wed,  6 Oct 2021 06:32:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXjaoSLgW1TwWQSm19LEsIoIkzvOtMhaGd0duDe09izs2PCBTV2yzdlIOBlI8S1Xldrm9wI1/2NOTA1Yi3mRRyCNllxxyZjo+4menl2toOLfmJ8GpML60kuZguKhy5r37l0eP5YhB3iUOmawjGagvMHnLxr+vZtWjyRFLfcVCh8XL3ZPPIjg9Wxogxe9T9cPwB43NvofsIy32jtQQEJdoSjcd27hjIDW0EKUAn62lSEUf96fLLsf0idK+7kfP55wSsmZop3GiV2rszZJvCqPMT3tOZx2gxCVX7Rqa4DQcUTWur9H26BsN34XLPbGIUojOFAQCf5pNSxUlITeAdiqog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DOvWuEoIjiZA7EMSLzinl+4Qf5PkhADkSkgnmO9eP/g=;
 b=k52Z08nmMHuGPbEvjwZikAVPA5A9pHC/9EkkW1wSkdqDKO3VoAjq83FgkO7zajfhbDXoAT13uqrXmU/G4yRe9VF/bqGop/9NtIp8RDgQYOOoHRUAgFBGdIJ85wa4FNmlY2bPqvS3fkAAEKV/JF0D6luB4nq+hh0OwOm9RmzI2Y/1DoDLeym5WM7dDLPB49pLnQxXUA68IZem9gKCvTz7N4dzHiooTstYq/6y7M3BnJg/2QKFkakbvqm3SEG35vH/SnNiOWgznOfV407H1ist9Dj/3nwLonmThBgg+L5qnT0kPCyBdEnb9u14ayMAw/jKpsGuGJufS2s24JPvxETP1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOvWuEoIjiZA7EMSLzinl+4Qf5PkhADkSkgnmO9eP/g=;
 b=DYdAfQFYTVqT5KCgALplsnP3r2GX7XOXU4C4YmfPbKCmMBlFk+5Y6a+ryXk1UXN2XSgWJi+9bFJi0nB/gpu3+6qQGSH5LWEHaZqw3JnnGSd3Kj0yCVyP/Nejdl9jGx7YN6oeI49ThnJcw/jS8iTl+j6DXqUI0LZznO9u7XugkLU=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3930.namprd12.prod.outlook.com (2603:10b6:5:1c9::19)
 by DM6PR12MB4356.namprd12.prod.outlook.com (2603:10b6:5:2aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17; Wed, 6 Oct
 2021 06:32:39 +0000
Received: from DM6PR12MB3930.namprd12.prod.outlook.com
 ([fe80::591a:8986:aca2:c560]) by DM6PR12MB3930.namprd12.prod.outlook.com
 ([fe80::591a:8986:aca2:c560%3]) with mapi id 15.20.4566.023; Wed, 6 Oct 2021
 06:32:39 +0000
Subject: Re: [PATCH 1/1] drm/amdgpu: ignore -EPERM error from debugfs
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Das, Nirmoy" <nirmoy.das@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>
Cc: shashank.sharma@amd.com
References: <20211005131115.25595-1-nirmoy.das@amd.com>
 <ab673b77-e8b7-94a4-76f6-588ad9e472f7@amd.com>
 <182c1454-102e-cf2f-80eb-09baa57f8e82@amd.com>
 <45342056-8e15-bdb0-0237-d11476bcc8fa@amd.com>
 <af8ba141-1581-4b96-4ef4-bc82111e213d@amd.com>
 <36880798-83c8-5566-dfe8-a18b9c4783f6@amd.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
Message-ID: <84a62bf8-65e3-0b3b-91ef-bef5f4060601@amd.com>
Date: Wed, 6 Oct 2021 12:02:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <36880798-83c8-5566-dfe8-a18b9c4783f6@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN1PR0101CA0068.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:d::30) To DM6PR12MB3930.namprd12.prod.outlook.com
 (2603:10b6:5:1c9::19)
MIME-Version: 1.0
Received: from [10.252.81.250] (165.204.159.242) by
 PN1PR0101CA0068.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:d::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 6 Oct 2021 06:32:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbe2bcf0-b041-4f3b-9c9a-08d9889317d0
X-MS-TrafficTypeDiagnostic: DM6PR12MB4356:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB43567A661F1A4BA51519971197B09@DM6PR12MB4356.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P/57Nq5GVqVA6PV1QuT83k858oY1YHHVVzeF0L6pSn6TyYBytc6X3oWA+s4qKQajb24WpJexp/ap/7goPxHTVC/KSdu2ecA12BXxX4w4Gi1IXLoZFOkO5aMINiQ2rJxVjYQCwr4AybE6FRnX0rTPrAwNheNtKGYfcvOaXgKoZKT0MyyAA3UCTf0pbzOlnIc32ZB8BQGbu1M1gOBOPWNJma8Oas+UJls+A6jawbPtyJ/n71SPU4uL/G8RyJJVYcvDvbbsnBWthzfyPOyYlWvDc9Tu5kzuapY0pMHXEWDBgWs+4/Q3GptA0c03ZuCAhlRykkpY8koz7//Q9tx2RsI9Hf7cvgA6waow2b4pjXAF8BtkZPZygnKjw/UEW64T8rftMJdiKNS1jy4H/AuP0cLeCqg6Iwy2g5v81+hyHTXWHKeZzLwMuR4d++8oJEXYQAMCPOL+w/oMiFP8hW8vYAESbmcdZHgrU0KoiqKqczFvJ0h5ocjvehHNMPJ4rGJT+KR1XNjeSgXNPaTKK+ErGrkhSsOEQiveX3BOLG5cq9mw0UqFLwSe3VmmBGzL0h1id8nwsagASle2CFrh0n2NEIg6a1PzvaB0wpRB20WI7RxYe1j3VJaUmhkARxqIV4FVp0WrLs53WgcMVxFpz5Mp5sIZ+RamoPmA9NVrChc+7aK1mfXY72EkKHIZuEgOdfOPqf7DfrcZMAMkIUKLriXiT+kyxMp6UJONj+eqEPYTVxZUAWEo8uCmyZXpYGB5K8Xk3Suy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3930.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(6486002)(31686004)(83380400001)(86362001)(508600001)(316002)(66476007)(66946007)(66556008)(66574015)(186003)(2616005)(16576012)(4326008)(956004)(31696002)(110136005)(38100700002)(36756003)(2906002)(8676002)(53546011)(6666004)(5660300002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckcxUG01T0s5Y1Y2ZlpKYmlSTy9HNUt1RnFWUEROQjkxb0J6Y3pjaC9NYkhw?=
 =?utf-8?B?RzlZZGIvUVl2QjlmNXFYck45SlE1bUNSSVordE1qZE85WG5ZQmRhUEt4Y3da?=
 =?utf-8?B?RXNhWk1HR0RibmhjYWdTR0tTcHpJKytSUXFrK1B1amd2TDJ2d1BvaXFDK0ta?=
 =?utf-8?B?bXM0MGtPS0s1c1R1YlRqMGYvSUZhT3ZRcHp5cmNhRzlYVVY0NDgyUDZoZytk?=
 =?utf-8?B?WEI1WEllNWFzRFpYRzBPTWNOQUtHMkNMTTl2ODhiWC9JT0JNZUtsWGZNcWJo?=
 =?utf-8?B?TFJld1ExM3lOSmlzU1BRTHVQMWZsNVhvSThVRkNDNkY1RTlnTEkvLzd4OG5K?=
 =?utf-8?B?R0NUWStIUTMyTkJpS3JuSG1PRHNESU9uR3plWWdtODU0VHF2VytzRXRyeGNq?=
 =?utf-8?B?VUFDZXBxbEZQNXl0WTRxSHd2djlTdVFLdzBNbkhuZlgra1I0VUoreWpnbVdt?=
 =?utf-8?B?bzJPSktEUVUxWEFRRnBNbHZPb2hVQmM0aWxXNW9hZFJpeEtMejV5Y1ZYeDB2?=
 =?utf-8?B?N3Z3VGZzSUtBM2lSTzUvYzdJeHhDNTFieXY4ck0rUnhwOE1udWZFTXlpdm1B?=
 =?utf-8?B?MUwxQk9MUUpSMXFSb3RXQ3JrWjNaU21wZURMY2RXZjhmQ1M0RCtrTHp5UEVZ?=
 =?utf-8?B?RlRzeTM5cXc2OWsvZ203aTY2QWVUWStqQm9NU2FSZ2VLUXNTOGFqellyd0hn?=
 =?utf-8?B?TlBtMmMwSFF2N2dOM21jZTZ1L29LU01Cd1UyL1FTWXNKU3ZWWWExdzk5c202?=
 =?utf-8?B?ZVhZczBZdm1KV1FxUEpOQ1J0OFNaRERPaUVsMVAySE9OSWRGN3hadHM3TWh2?=
 =?utf-8?B?MDBUVTNGcU11ZHVUTHpBdmxPNkVQV1hzSUh1d1ZQbzlFUEs1UEtFY29sN3o3?=
 =?utf-8?B?dENtQ3d6eVJUNk1HMk92M1FDL3gwbUxlNXl4elYzSThEckdrYUQ1VVlBMFBy?=
 =?utf-8?B?UjlxcEMzMXRPYk42MS9kMG9BK1h5N1VTRXJrKytRTUR4eWRJeEpoWW5wK2tM?=
 =?utf-8?B?S1JuNCt0VldyaEFjSXdrMS9xUWJOV25lK2o4RTlDL0crSHlFTUxjU1QwVm5p?=
 =?utf-8?B?a1RTdHZCN01YNE9YQXBDelJhQ0FKakFPTWpqTEVYYVc3Yk94QkRmbG9qdjhS?=
 =?utf-8?B?dFVYQzhZV3B1c3JhdDRhZmZmT2o2ZWF6cjBtNmh4K2czcjQ1ZUI5R1U5Y2Q0?=
 =?utf-8?B?ZE14UldVNW5keEYxKzFlb3Z1cXBpZFA3dzBvdzZsemhPZWtlM1F4OFp4cWcy?=
 =?utf-8?B?VFZlK3ZqUWJlMVE4eFFSOE03L3kzM0VOTTdNa2ZWK2tpcW1BNFVQc1FjS0hy?=
 =?utf-8?B?eGJ0aktFcnlNd0xHV2dsM2lQNlNsK2YyalRsZkNLZHpMdXNlOXU4ME9FRFg1?=
 =?utf-8?B?eUhuVXZMOEVNM2pNckVsaDBnRTNYd0oyOWtQWW5oZXNrRTVvMHYzbjNQbXhy?=
 =?utf-8?B?SDZKTXlwVXFRUmhTYTJvOHZ3TW11MjlCYjJGSUxqR2p4R1pzVWJmZ2lTa3ha?=
 =?utf-8?B?bXZFb204VTlHL1g4L1VUd0tvNlQwSFJFNUVwZTBVRWxOTTZEVHppMHhoT0Ur?=
 =?utf-8?B?ekpsMEo1VEhtUEFrT2hKRldaQmtCbHloOXZxWlgzU3lFT0g3K1E1S21CWEt5?=
 =?utf-8?B?dUx1bkJtTU5TM2NReWVXMzIxSlRqcGZUcEc0WkswZVV5Q0o5R2ZKb1JaY0Rl?=
 =?utf-8?B?dm5McjBER3NDc2xiaXNxSmRtSzFmRS9sdTQrZ0IzTlFFcjZ1QjZFNTEyWUNu?=
 =?utf-8?Q?mCLFvsaWdbENENheNIXOpgOd+EBSHvmcEwAZQui?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbe2bcf0-b041-4f3b-9c9a-08d9889317d0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3930.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 06:32:39.2042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rQaPJYNjsmWyqJzl386V6LvQN/bEzyzz0opXasdiUrHjFUZYLu7ggcC2hvsHyu4n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4356
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



On 10/6/2021 11:49 AM, Christian König wrote:
> Am 06.10.21 um 06:51 schrieb Lazar, Lijo:
>>
>>
>> On 10/5/2021 10:15 PM, Christian König wrote:
>>> Am 05.10.21 um 15:49 schrieb Das, Nirmoy:
>>>>
>>>> On 10/5/2021 3:22 PM, Christian König wrote:
>>>>>
>>>>>
>>>>> Am 05.10.21 um 15:11 schrieb Nirmoy Das:
>>>>>> Debugfs core APIs will throw -EPERM when user disables debugfs
>>>>>> using CONFIG_DEBUG_FS_ALLOW_NONE or with kernel param. We shouldn't
>>>>>> see that as an error. Also validate drm root dentry before creating
>>>>>> amdgpu debugfs files.
>>>>>>
>>>>>> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 10 ++++++++++
>>>>>>   1 file changed, 10 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c 
>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>>>>> index 6611b3c7c149..d786072e918b 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>>>>> @@ -1617,6 +1617,16 @@ int amdgpu_debugfs_init(struct 
>>>>>> amdgpu_device *adev)
>>>>>>       struct dentry *ent;
>>>>>>       int r, i;
>>>>>>   +    if (IS_ERR(root)) {
>>>>>> +        /* When debugfs is disabled we get -EPERM which is not an
>>>>>> +         * error as this is user controllable.
>>>>>> +         */
>>>>>
>>>>> Well setting primary->debugfs_root to an error code is probably not 
>>>>> a good idea to begin with.
>>>>>
>>>>> When debugfs is disabled that should most likely be NULL.
>>>>
>>>>
>>>> If we set primary->debugfs_root to  NULL then we need to add bunch 
>>>> of NULL checks everywhere before creating any debugfs files
>>>>
>>>> because debugfs_create_{file|dir}() with NULL root is still valid. I 
>>>> am assuming a hypothetical case when debugfs_root dir creation fails 
>>>> even with debugfs enabled
>>>>
>>>> but further calls are successful.  This wont be a problem if we 
>>>> propagate the error code.
>>>
>>> Yeah, but an error code in members is ugly like hell and potentially 
>>> causes crashes instead.
>>>
>>> I strongly suggest to fix this so that root is NULL when debugfs 
>>> isn't available and we add proper checks for that instead.
>>
>> This shouldn't be done. A NULL is a valid parent for debugfs API. An 
>> invalid parent is always checked like this
>>           if (IS_ERR(parent))
>>                 return parent;
>>
>> Instead of adding redundant work like NULL checks, let the API do its 
>> work and don't break the API contract. For ex: usage of sample client, 
>> you may look at the drm usage; it does the same.
> 
> Yeah, but that is horrible API design and should be avoided.
> 
> ERR_PTR(), PTR_ERR(), IS_ERR() and similar are supposed to be used as 
> alternative to signaling errors as return values from functions and 
> should *never* ever be used to signal errors in pointer members.
> 

One escape route may be - add another export from debugfs like 
debugfs_is_valid_node() which adheres to the current logic in debugfs 
API and use that in client code. Whenever debugfs changes to a different 
logic from IS_ERR, let that be changed.

Thanks,
Lijo

> Regards,
> Christian.
> 
>>
>> Thanks,
>> Lijo
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>>
>>>> Regards,
>>>>
>>>> Nirmoy
>>>>
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>> +        if (PTR_ERR(root) == -EPERM)
>>>>>> +            return 0;
>>>>>> +
>>>>>> +        return PTR_ERR(ent);
>>>>>> +    }
>>>>>> +
>>>>>>       ent = debugfs_create_file("amdgpu_preempt_ib", 0600, root, 
>>>>>> adev,
>>>>>>                     &fops_ib_preempt);
>>>>>>       if (IS_ERR(ent)) {
>>>>>
>>>
> 
