Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB686423874
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 08:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D8B6ECEF;
	Wed,  6 Oct 2021 06:59:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E2F6ECEF;
 Wed,  6 Oct 2021 06:59:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bk17A8wNSUnUyHI3bWP+jeHfUrH2fn9+eiK0lhRUbEmJ+/eGtKSyczW2TKvRcIirx1yGxvtplfZ3x8hkrf4Sa9+6yxknBV6e7S4jZsSd+bR/maLuBwn85RpLg9LeoPHZZtsjeJjiuUusnK+IL4Dbcn1DCzY7m/bCJakr95uomgQguPH3DXkNfZoO34N+Ho5hgqFW4/MAxVKaQk69iu5PRBjj+jJtEbH/jFHhvxo1F330MvgpxzoQoFh4uLhzyVB3YTHBV2/XAVdJsZHlfI4U+Y3Dk6hx4Elu3xKXy7tIGWQ8VwPZ5LQbbPazuvB27LzxuN+8FFVRJYL9NZPVGnWtoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZHR9BAkLgpJduEmxYyDFgG9De3oZz0WSU3eP3YApyU=;
 b=aylMRDL8+SxhAJBJVFGTkiOWMi+jDJ3riHsuGvVOxsW0eCqH7auHlTOUASd6CoMMXvb05xh5y6tOusZA+xwWvSQAoxevNAiJE/4coN4oMuz1UFa/McNXCEYKGk/4Fr056AA2fipsQNzXg343t02bf6jG+Z4Q+DRH7uXwaV01Zll+H0c7xGyS2qlfXiQZ366r3ErY2l8DHSrYH6JmqTY5wOa6Evrzues/XxbliSgwV9ZwtuGlr0LgXNSRwAQd/IMDAnZAhvwinUQ5xzZYGcvA8o1JNZq8NH1gvXBLYkmwlF5S1dSz85c4NIre4r0ZHp+1Jrs56r+6+UWtjaSwmgDDaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZHR9BAkLgpJduEmxYyDFgG9De3oZz0WSU3eP3YApyU=;
 b=jR9CJ2bVf5KOv9VFJ5rBprIhgLYIKVC1sZC5vd62S9VAyIqWQcAew3R3Sp4Xdz/E2H8zcdp85AGaXy8b1o9y/y0vjpPwjLJsh28bVOF/nHgkC9bJN7tePVX8WFwhsK2LTDzvJGqE6arL6/x7Ecmz44Dq/FH8YWS/cnZopt4ubrI=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR1201MB0111.namprd12.prod.outlook.com
 (2603:10b6:301:55::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Wed, 6 Oct
 2021 06:59:46 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4587.018; Wed, 6 Oct 2021
 06:59:46 +0000
Subject: Re: [PATCH 1/1] drm/amdgpu: ignore -EPERM error from debugfs
To: "Lazar, Lijo" <lijo.lazar@amd.com>, "Das, Nirmoy" <nirmoy.das@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: shashank.sharma@amd.com
References: <20211005131115.25595-1-nirmoy.das@amd.com>
 <ab673b77-e8b7-94a4-76f6-588ad9e472f7@amd.com>
 <182c1454-102e-cf2f-80eb-09baa57f8e82@amd.com>
 <45342056-8e15-bdb0-0237-d11476bcc8fa@amd.com>
 <af8ba141-1581-4b96-4ef4-bc82111e213d@amd.com>
 <36880798-83c8-5566-dfe8-a18b9c4783f6@amd.com>
 <84a62bf8-65e3-0b3b-91ef-bef5f4060601@amd.com>
 <43403acf-d6f6-ed4e-2954-f9cdc7ea88b0@amd.com>
 <a9053dbf-a8f6-2e00-73fe-5e1e6cd0bfdb@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5b66b08a-44ef-eaac-9af0-a7114d7162ba@amd.com>
Date: Wed, 6 Oct 2021 08:59:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <a9053dbf-a8f6-2e00-73fe-5e1e6cd0bfdb@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM6PR10CA0086.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::27) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM6PR10CA0086.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Wed, 6 Oct 2021 06:59:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6c32b4f-7eaa-4b39-a1cb-08d98896e128
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0111:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0111A8BD9B6347E88987932783B09@MWHPR1201MB0111.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:525;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FuxZ3mtSuFuZYgzQ7HMqIQBzI4+dFcCzvRd5KQnIFiEM8t+WveaoVdJTGipjDh7Kas/vXiHOoq3VmE9XHcgicshoyz3ULbyWyDr8RDZS2d/0bBwbe11j38+cLcflzKhsbvpWjcuAi0yGLzajL5V6tVAbTI/StQweDW8CwbF6tGhwelqttynjhRIesPNlBNaS7Lvipo6vvWTRw7sN4ZTueMVfLKL0LDxjDMRIlFhXyvoazS2ImpOwgZrLnR8LB7mEIzASMLpOWr9YUHcAbPh0xV8xobA2s1YyUwW1L9TO5spteJXFjjioJ/WYTVf4pGeTIDjd0R264pu3r10PUqjezuyTwGJF/zLt9LVbwWcAE9BKYVjDT6DEYZDKzd9A2uw9h6VnSD2gOz0UdfSRKnG1Fk6QVfxuPmzhdF/0+lUX1vgKCdiAMN20z+BsdMYeQ2Q72LdkI0qVRVGYJzhT2Bed5JN7rnOnMQilCxYDqaAhwK1fHSs+gzHmiCgtzDOwnoYeXsY3KM5OdItfoG+5nMalGjXvOWTslw4TCklB0dJLAwUQlNIiSdeJg4n4PTFiF+xCtpcOhWbyEjvzi5K0ZtCBlfkh8LoiPvZECj8srVAl0iySLDC6dwwHxqglHYIZ7GO6FL4jm46sAjzMg9qdRCLPYVrfRzEvlwATYE5jgmHME/AUTOjQy3H+2GbkPxeqIm/ewxPXSTKhqarUzW/9j9DjX3rRpTUjfY1f0fyo+/HE+KYGN5V4uv0bAFWjbmuxWg/S
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(6666004)(31686004)(316002)(38100700002)(956004)(508600001)(36756003)(66556008)(8676002)(8936002)(66476007)(66946007)(86362001)(186003)(31696002)(83380400001)(53546011)(26005)(4326008)(6486002)(66574015)(2906002)(2616005)(16576012)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDA0aTJ2OEhHa3BreUQ4ZWF1cUQ0Z1FJSWZmd0srY2JBZVBBY1NlcTB6RE1C?=
 =?utf-8?B?NkpaN1h6YkR6cnBtL3djUjVpaE8wbkl1SENKaEhObTF2K2RtaEJyUVZ2d3di?=
 =?utf-8?B?T2UxV3d3RFVSN3h2MFZJK2lzdUJkeW5Sa0lwZE9RTWdPTlk5Q3g0dkNVWnlR?=
 =?utf-8?B?a3ZOTzJTN0dqenhXL0ZnMHBILzJWekloMkpSU2xnTFdQVHFuMGZhZjVuWkhC?=
 =?utf-8?B?cW8xN2dBTVc3MmQxR25YdmFPalB6SlhvcnZPTndLT3h1UzNGOGhxcDAyajJn?=
 =?utf-8?B?Qml4eTJ4WlpNbUIvK2lsN3VkVjBqZ1NsQzhmVCt2THBpQ0hBYm9GZ2tzVllR?=
 =?utf-8?B?K3Rqakd1VVhFbkt1WGZmRnEyNGlHZHF3SG91bUUxQ0RIWlJlK0VzUWwzbk1a?=
 =?utf-8?B?V2ZUZ2ZWUVM5U2RyMkd3c3J4UW5uUGFOT1NVN2dYZmppbnBjeGxwMGtrckxQ?=
 =?utf-8?B?ZEhGMU1MVnh4RU5qTzBPcDlRdVhja3FjSHo4ZVlNTFdiRE1keUZNMEpkZUlS?=
 =?utf-8?B?ZGhlUVdkcDF6UjE4VjJ4ZHR6aXV3ME82bHJwUkhhM3hxd1Q2Q1NlMGt1eExR?=
 =?utf-8?B?a3puN1FLWVVVRFJNTU1tbmJoRktYT0c2RVluaHRMZFBiOHNaYWpRSGRKUGlE?=
 =?utf-8?B?clhLdG1lbTZ6Q1JaZHhicDI1VFJ0VjBQaGZpSVYyeVFFaGNXeHROZmI4cmhv?=
 =?utf-8?B?c2o2YWVneWRRbW94RWtIZjIrQy9JRmp5bE50eFp4QThsOTMvc0pucWJvcWtB?=
 =?utf-8?B?QkxZNkhhZDArRU55UUI2a1pMKzRjeTJHcno2em9JL0pCNGRuYjZhM0ZrRnM3?=
 =?utf-8?B?aEF2SER6Q3p1bSsxbGRUN3Fjd2RkQlRtamZkNU84Wi9vT1hEOG5kR09PMXBC?=
 =?utf-8?B?cnhQUzV5SytYVlJMSDgxZDFieHc1ZnVkbHZWMFdrUWtIZlZqem5hNk4rZURn?=
 =?utf-8?B?QnNjRFZsZzJHUWFDbmFNT2NtMkFIWmovTWxFZXNmZE82cmdSWUo4USt1dXVS?=
 =?utf-8?B?NnN1c0JJMERCRm4yMnpMYno4YXl6ZDZQRWx0aXJpay9aVk9KclAyWTkwM2Zh?=
 =?utf-8?B?b2xTdlFTOTlDcTBxSkQrc0QySUx3bGpBZm14cXl5WGpvek1mMnV1dVpHWkxn?=
 =?utf-8?B?MmtybVBNMzVmSGVxRWpLcCt6VXRLREErTGRxaGJwbG1NZHBNMjJNcG9hSXpZ?=
 =?utf-8?B?emVNWmJOQlNPb0g4QUl0TEtWR1E1Uk1zc3NxeWdCVFdMdlVxN1ZaT2hsczBq?=
 =?utf-8?B?K3plZk1POW1wM1RNa2xOQnQraEN5N3FmTWZsQmxHZkZPMTJieUJ1YWtqZURC?=
 =?utf-8?B?N2Y3OVBuTnU0MnB4amo0QVFteENhMFV2bjB6V3NFM2lrUTRWVllPdWIybjVu?=
 =?utf-8?B?aG53ZmE0ZUdQVU5QMnY0SFhRb0RuWXpPTHNqU09ZcHkyMVlJOXM3U1Y0SUIy?=
 =?utf-8?B?ZEp0dG1BVG5TN1czZmNLV1BibDJreitTWk5LYkhEa1FLVFVDK3FpT2lmYlhP?=
 =?utf-8?B?dTZxS2l6a0pveHZBdXFJQm9NTDR4U1hMZ2NncVVGMEhyN2tjM01SaHhCZDdO?=
 =?utf-8?B?S3oyQlBZUCtRVWptRFo5MTN1RTNPd3BCRkRDd0JyQlFIUGUwd0t3L2NKL3Z1?=
 =?utf-8?B?ZmgrWFpPQlVOMFAzVXpMNkxlY01jeHpZOTU3K0VhSzNIeHVXWjN6ZHg0N1hT?=
 =?utf-8?B?WnZ3aWVvOW84MlljYVJRUjlEdkJhQlN6U0ppNWNNQ0tKMW9obnpCTGpyTFRT?=
 =?utf-8?Q?yGPvAAJIXOLj9IIMZU84LyGLM9/LlONZeea3PV1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c32b4f-7eaa-4b39-a1cb-08d98896e128
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 06:59:45.9051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AQneCRKBN4WIbugujWnQr3Pv41TYr09g1+/6zYhX7pzefjK79shY6G/B/yeeLzEm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0111
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

Am 06.10.21 um 08:55 schrieb Lazar, Lijo:
>
>
> On 10/6/2021 12:05 PM, Christian König wrote:
>> Am 06.10.21 um 08:32 schrieb Lazar, Lijo:
>>>
>>>
>>> On 10/6/2021 11:49 AM, Christian König wrote:
>>>> Am 06.10.21 um 06:51 schrieb Lazar, Lijo:
>>>>>
>>>>>
>>>>> On 10/5/2021 10:15 PM, Christian König wrote:
>>>>>> Am 05.10.21 um 15:49 schrieb Das, Nirmoy:
>>>>>>>
>>>>>>> On 10/5/2021 3:22 PM, Christian König wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> Am 05.10.21 um 15:11 schrieb Nirmoy Das:
>>>>>>>>> Debugfs core APIs will throw -EPERM when user disables debugfs
>>>>>>>>> using CONFIG_DEBUG_FS_ALLOW_NONE or with kernel param. We 
>>>>>>>>> shouldn't
>>>>>>>>> see that as an error. Also validate drm root dentry before 
>>>>>>>>> creating
>>>>>>>>> amdgpu debugfs files.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
>>>>>>>>> ---
>>>>>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 10 ++++++++++
>>>>>>>>>   1 file changed, 10 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c 
>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>>>>>>>> index 6611b3c7c149..d786072e918b 100644
>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>>>>>>>> @@ -1617,6 +1617,16 @@ int amdgpu_debugfs_init(struct 
>>>>>>>>> amdgpu_device *adev)
>>>>>>>>>       struct dentry *ent;
>>>>>>>>>       int r, i;
>>>>>>>>>   +    if (IS_ERR(root)) {
>>>>>>>>> +        /* When debugfs is disabled we get -EPERM which is 
>>>>>>>>> not an
>>>>>>>>> +         * error as this is user controllable.
>>>>>>>>> +         */
>>>>>>>>
>>>>>>>> Well setting primary->debugfs_root to an error code is probably 
>>>>>>>> not a good idea to begin with.
>>>>>>>>
>>>>>>>> When debugfs is disabled that should most likely be NULL.
>>>>>>>
>>>>>>>
>>>>>>> If we set primary->debugfs_root to  NULL then we need to add 
>>>>>>> bunch of NULL checks everywhere before creating any debugfs files
>>>>>>>
>>>>>>> because debugfs_create_{file|dir}() with NULL root is still 
>>>>>>> valid. I am assuming a hypothetical case when debugfs_root dir 
>>>>>>> creation fails even with debugfs enabled
>>>>>>>
>>>>>>> but further calls are successful.  This wont be a problem if we 
>>>>>>> propagate the error code.
>>>>>>
>>>>>> Yeah, but an error code in members is ugly like hell and 
>>>>>> potentially causes crashes instead.
>>>>>>
>>>>>> I strongly suggest to fix this so that root is NULL when debugfs 
>>>>>> isn't available and we add proper checks for that instead.
>>>>>
>>>>> This shouldn't be done. A NULL is a valid parent for debugfs API. 
>>>>> An invalid parent is always checked like this
>>>>>           if (IS_ERR(parent))
>>>>>                 return parent;
>>>>>
>>>>> Instead of adding redundant work like NULL checks, let the API do 
>>>>> its work and don't break the API contract. For ex: usage of sample 
>>>>> client, you may look at the drm usage; it does the same.
>>>>
>>>> Yeah, but that is horrible API design and should be avoided.
>>>>
>>>> ERR_PTR(), PTR_ERR(), IS_ERR() and similar are supposed to be used 
>>>> as alternative to signaling errors as return values from functions 
>>>> and should *never* ever be used to signal errors in pointer members.
>>>>
>>>
>>> One escape route may be - add another export from debugfs like 
>>> debugfs_is_valid_node() which adheres to the current logic in 
>>> debugfs API and use that in client code. Whenever debugfs changes to 
>>> a different logic from IS_ERR, let that be changed.
>>
>> Well that would then rather be drm_is_debugfs_enabled(), because that 
>> we separate debugfs handling into a drm core and individual drivers 
>> is drm specific.
>>
>
> Had one more look and looks like this will do the job. In other cases, 
> API usage is allowed.
>
>     if (!debugfs_initialized())
>         return;

Yeah, that might work as well.

Potentially a good idea to add that to both the core drm function and 
the amdgpu function. and not attempt to create debugfs files in the 
first place.

Christian.

>
> Thanks,
> Lijo
>
>> Christian.
>>
>>>
>>> Thanks,
>>> Lijo
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>> Thanks,
>>>>> Lijo
>>>>>
>>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> Regards,
>>>>>>>
>>>>>>> Nirmoy
>>>>>>>
>>>>>>>>
>>>>>>>> Regards,
>>>>>>>> Christian.
>>>>>>>>
>>>>>>>>> +        if (PTR_ERR(root) == -EPERM)
>>>>>>>>> +            return 0;
>>>>>>>>> +
>>>>>>>>> +        return PTR_ERR(ent);
>>>>>>>>> +    }
>>>>>>>>> +
>>>>>>>>>       ent = debugfs_create_file("amdgpu_preempt_ib", 0600, 
>>>>>>>>> root, adev,
>>>>>>>>>                     &fops_ib_preempt);
>>>>>>>>>       if (IS_ERR(ent)) {
>>>>>>>>
>>>>>>
>>>>
>>

