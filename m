Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B6E423865
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 08:55:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51FB96F625;
	Wed,  6 Oct 2021 06:55:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADEB36F624;
 Wed,  6 Oct 2021 06:55:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYBqjEr3+wN/PemUxtNf7wt0fWP8GTn7hJ88qaD5dseLe8O//OhkjgHJUGMLvViNJ1pxHtwAfVdQbOYrvLYlzLdvLep/gwdBk/xUjraN8SGNZcvf9sufNsEbF3wk5Ubv6kH75ZsYI9EctBsfvgcZhZMNkBdXPJWZfeoNy5eB0fzM/0QxjiKem++cMaAf4LYdac6I7/ZNLa0RhjtFOpuwrY3lO1qNsxJ0+kTFjmUpRU4oD7le3yn1CW04lT6Rc70Mxprdrm6kv93UB67n6UvQp/SlMLJYQVuzp66vzRK8GXNFZ7b3Oq3wrZMe0koHglAzR7EkH7W7vPHiZWT3l8fkZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rrixvHRQwX77p6LUJRIPiIngig4/Zkttlv23Nc2ix1s=;
 b=VNxujFgCDuhx1TjREPVjKtCTzUWdH8KBpRkfhfl8M4A72gqKK148tnyoPaGl/uNETXztyW5iQ3nUYj44T6QqUfY6ZGam0XsJ3e5ESVnBdozzKVizJ32BHQYkPsnx5KTWUjyhD1jN06LYdyzwLojbY5I6a5irSG+ThUEJbK5tiqEZyjrJTfuLVpAhq0yRPQRUMdXMiB0sFQEcaS+dR+JfCXcFcVJAKezQYh+epwguTcLPOyNHbeSrR2cj3Ex7P8VIVbhCDqrCjzuyOJZe/cgrNrlBslp381vCAozS2IFSPAnAzEFsoqJDzW8WmtEkpGrIVAjsArUAnWvIpoK72TTbFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rrixvHRQwX77p6LUJRIPiIngig4/Zkttlv23Nc2ix1s=;
 b=gqhspv1CSb9ES7+ywrcKtqQiXmDW+lcn1/c2nLuNCgKFyWjDlbf3fBV1xxtzAlGt/Nbd758d0Lsgy8PTd+f3mZmbWZQ41BMz2y3wWrO43Y8sausNhlwKAUh3YDK7tVwTfZefG9M0y6WjVlNYH5BdKzevh26j2NP1iyiXyC38+Eg=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3930.namprd12.prod.outlook.com (2603:10b6:5:1c9::19)
 by DM5PR12MB1435.namprd12.prod.outlook.com (2603:10b6:3:7a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Wed, 6 Oct
 2021 06:55:38 +0000
Received: from DM6PR12MB3930.namprd12.prod.outlook.com
 ([fe80::591a:8986:aca2:c560]) by DM6PR12MB3930.namprd12.prod.outlook.com
 ([fe80::591a:8986:aca2:c560%3]) with mapi id 15.20.4566.023; Wed, 6 Oct 2021
 06:55:38 +0000
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
 <84a62bf8-65e3-0b3b-91ef-bef5f4060601@amd.com>
 <43403acf-d6f6-ed4e-2954-f9cdc7ea88b0@amd.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
Message-ID: <a9053dbf-a8f6-2e00-73fe-5e1e6cd0bfdb@amd.com>
Date: Wed, 6 Oct 2021 12:25:20 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <43403acf-d6f6-ed4e-2954-f9cdc7ea88b0@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0178.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::33) To DM6PR12MB3930.namprd12.prod.outlook.com
 (2603:10b6:5:1c9::19)
MIME-Version: 1.0
Received: from [10.252.81.250] (165.204.159.242) by
 PN2PR01CA0178.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:26::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.21 via Frontend Transport; Wed, 6 Oct 2021 06:55:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03afd609-5a36-456f-17f2-08d988964d91
X-MS-TrafficTypeDiagnostic: DM5PR12MB1435:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1435BFB1F24463F021E55CE897B09@DM5PR12MB1435.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:525;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xkvk0pOsgDH+5RghYHRc5EA2xOGlpvJELzpys8d3C9beaco8haWBvUHDuDN3uNHxlY8Fr+b3l3XjXRq4D5lXP2zTIletfe6VzNRkdmmDAP/oMJ5kqCjUMc6WgHgDTp517uEqYsnqqWhMOYhgElnj2g/5i2w6QyEwCLINjXJNLOXc4P8rlSSS4tMhMMmBFgzXa1thLEbiUMf1qI9fUo9CHk5jRdMPcwwCaWCar8CTpjO5ljmhZU3LXDeQOrwV4sbyAbmk8w7KSDvIDPSlZkKhVBbrzc40YEGPGtBgFua4ZmJrHAP4e6IOAoHxo9vEgm37RYDCMCoarag9CJOKokuCuo67snzqNKK9LVCazqDnkZf46PSsboiBzFc5yNHwGByhPcmmQ5OoT+Ag+RMKqxExs4v6+INd2N/6ZB5issdtikbrHXC2MhBfT3lLJS5paEbi9BwLpiAA4WSFAtTBO/Tn19IGxfAxAjOXlFlHcEIOd5RrrtMz9TYmQpnB1eTI83zEwOWW8Nf6NbM4ipNZu5cqkKt/dVzUNYasY5UAUg3AQmzhdiR8cYaq/iY2RfjEdrWCMPYSycacumOqRQ/A1maaAnZLh8bt5udMZCWkWLtXJmJsuYrw4NB2OwkrBN09NZdnJQzNp2YOmbrDE+IgnzbqA81TW/he3CpuW+NtWjtJ7/1qIrJRyHcmJ0Hinom9WavDk8V2RkiRPzcSl+GHGjN0nMSx0ewqgEME/p201e4PEbbUj5neGXh2bcygO7v+W/N1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3930.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(16576012)(186003)(38100700002)(8936002)(31696002)(316002)(83380400001)(66946007)(66476007)(508600001)(2616005)(5660300002)(66556008)(956004)(2906002)(8676002)(53546011)(4326008)(6486002)(66574015)(36756003)(86362001)(26005)(110136005)(6666004)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTJaSVZhYXl5TXdna0xxanhtMG1sZXpkMEl3SWVJemszL3dpdCtGSnkwS0to?=
 =?utf-8?B?aElOUVkrZk1EUU9HWnFIVnl5TUcyUlJiV0RpMmgxaG1CQlVrQzhKbU44STJq?=
 =?utf-8?B?VFYxQ0ljc2ZMWit5L1o0K1VEazhPY2VZQjdLNzNFZG55R1ZaZlBtZUorV2FL?=
 =?utf-8?B?dGo1eFVNSEo4SUplMFNrR0NYZGlhdXg4NHdlQklZeE1KTUhkYStGUCtpUU1m?=
 =?utf-8?B?eXcvR1Y2djA5dkRtbnlGK0RPK2t0OGl1bHBWTzhvSktDY2JxNk1RalRTcmgv?=
 =?utf-8?B?UFE3emFUVVN5LzE3WHVzYXQ4a3hHUlBvbnBQcGNIdE9rbHU1UTM3Q01CWndZ?=
 =?utf-8?B?WEVibkNGZmlYamtZdnpGa1ZpMUszRmtnV0s1Mm96UzRwRTU1V0RWNDZPTnN5?=
 =?utf-8?B?cVJtZkJxcStMdE1WdkVESGlYSW9EZmRKU0hwM3FHdGxXcWpYTTJ2NFFvRENu?=
 =?utf-8?B?NHA3Z2o5cUxiNjFrR2I4Y1pWcHdzVWQ2OGFVWkZIQXVETVBaLzFaU0d6a0xj?=
 =?utf-8?B?dlNQS01BMjlHWEZWZEpKKys0Z25FYmxXUGJhcnRiRWVRVkFzMDIyb1JEMDhM?=
 =?utf-8?B?WEdPZUtEcWpvd1c3TFpUZDlmMkVVS0NNZXRCNnZIMWlLWlJ0dXZVUk1aQ3dN?=
 =?utf-8?B?NklGYy9FbGlLQWo4Qk03QmRtNjAxM0ZKSm1xWEVIUmUyRFlVOWc4RnNVT1Ba?=
 =?utf-8?B?c0s5NmhjR2Nua1g5OE1zZFFxZ09Wc1d2eWhaWExEOCs4REZTcnc1SWZYenB3?=
 =?utf-8?B?eittakZIN0p2Nnp6dVhKZWplblRzKzRDQXIva1JldkhieE5IcWpQMlBGdHZD?=
 =?utf-8?B?SGJRSEVuZXZpdFdxd1pjOUtYRG1sMUdodjIrR3ZGRC9Pb0NlbUt2elFuT0hK?=
 =?utf-8?B?c09oRXVneGFlTm9oaDl6aEtpcTlVMDJzdmpCU1MrRVBucEtwek5lejM4QlVN?=
 =?utf-8?B?UTJ1K0xrNlhQd0pkcEk4RE5rRlp1dTJiejVsRllBcEtjbDBRRTNHQ0hUV2gx?=
 =?utf-8?B?c1JKTHVlVHdxcEZZR1pwN1l6N2psYVZNRFd0eGI4S2Jva1AvVGljakVlcGc4?=
 =?utf-8?B?Mlk1amwyQU1ZazBCZVVsNlllOWtzK1hZSmk0RExxUEk0OXlZT0VwZGFjUVQr?=
 =?utf-8?B?TE0wZGNuU3hsVU13YlJ5bHArbVlaaTlubU10T2hqR1lQemFTbCt2VEdkMTNB?=
 =?utf-8?B?OHdnWFc2ZFZNMUtUUUQ4Q1dxRFNOQUp5Y0EzUTlUV1JJTzR6YW02anNJeFVx?=
 =?utf-8?B?aWVNSUtldHJoNFFTK0FuWk13dk1WTFRjU1NQdGRudW5ZekJyYVZHQVJNTis3?=
 =?utf-8?B?bEEwL3RaRU5WYlFLOEkrRVYxcnFhUTFVQ0lPVDBNK3pxcTNiTnkzUWFYMmth?=
 =?utf-8?B?N2J3Mnh0Q0tNYy9OTDZFeDZGaDNTc3BMQm1ZTkg3ZVR1cFFiUWtKWC9HOEJR?=
 =?utf-8?B?SXNQNlBmYlI4K0Zhei82STAyKzRCcXpaZlBpbXhyaXFUOWtkeXRxdTJZKzhY?=
 =?utf-8?B?bk5DdFVLZjVYVmxsRktzOW5CMzVzMG9hZUlMQXdZZGRGQzhMWFJ0dmxBQkpB?=
 =?utf-8?B?WDdLNzR6anhMWXZRcU1EZENqZXFwQzgvMGFZMVN4Z2NhWXNrUnJCRTBGdURJ?=
 =?utf-8?B?R2hYa1hiWDRpaVlybldDa0hLbTdEenZQZUkwdEVaYkxHYnRzUlplS1hTVStr?=
 =?utf-8?B?czhFeVdxV05jL2hGNnNPU0xxT1Jjd0tsclJHeldSMWFTY3lnU0xWQ1I2T0tO?=
 =?utf-8?Q?/0hCbpyTMOLnVXWiiwkEKEdb6DA1yqgew51Eqxf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03afd609-5a36-456f-17f2-08d988964d91
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3930.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 06:55:37.9131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 33CpSlpMoF73CL0FmgTcgMy33mie9zwmAgpDSaM2UsmhAv1w1/U9KAUp6GYLDp+C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1435
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



On 10/6/2021 12:05 PM, Christian König wrote:
> Am 06.10.21 um 08:32 schrieb Lazar, Lijo:
>>
>>
>> On 10/6/2021 11:49 AM, Christian König wrote:
>>> Am 06.10.21 um 06:51 schrieb Lazar, Lijo:
>>>>
>>>>
>>>> On 10/5/2021 10:15 PM, Christian König wrote:
>>>>> Am 05.10.21 um 15:49 schrieb Das, Nirmoy:
>>>>>>
>>>>>> On 10/5/2021 3:22 PM, Christian König wrote:
>>>>>>>
>>>>>>>
>>>>>>> Am 05.10.21 um 15:11 schrieb Nirmoy Das:
>>>>>>>> Debugfs core APIs will throw -EPERM when user disables debugfs
>>>>>>>> using CONFIG_DEBUG_FS_ALLOW_NONE or with kernel param. We shouldn't
>>>>>>>> see that as an error. Also validate drm root dentry before creating
>>>>>>>> amdgpu debugfs files.
>>>>>>>>
>>>>>>>> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
>>>>>>>> ---
>>>>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 10 ++++++++++
>>>>>>>>   1 file changed, 10 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c 
>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>>>>>>> index 6611b3c7c149..d786072e918b 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>>>>>>> @@ -1617,6 +1617,16 @@ int amdgpu_debugfs_init(struct 
>>>>>>>> amdgpu_device *adev)
>>>>>>>>       struct dentry *ent;
>>>>>>>>       int r, i;
>>>>>>>>   +    if (IS_ERR(root)) {
>>>>>>>> +        /* When debugfs is disabled we get -EPERM which is not an
>>>>>>>> +         * error as this is user controllable.
>>>>>>>> +         */
>>>>>>>
>>>>>>> Well setting primary->debugfs_root to an error code is probably 
>>>>>>> not a good idea to begin with.
>>>>>>>
>>>>>>> When debugfs is disabled that should most likely be NULL.
>>>>>>
>>>>>>
>>>>>> If we set primary->debugfs_root to  NULL then we need to add bunch 
>>>>>> of NULL checks everywhere before creating any debugfs files
>>>>>>
>>>>>> because debugfs_create_{file|dir}() with NULL root is still valid. 
>>>>>> I am assuming a hypothetical case when debugfs_root dir creation 
>>>>>> fails even with debugfs enabled
>>>>>>
>>>>>> but further calls are successful.  This wont be a problem if we 
>>>>>> propagate the error code.
>>>>>
>>>>> Yeah, but an error code in members is ugly like hell and 
>>>>> potentially causes crashes instead.
>>>>>
>>>>> I strongly suggest to fix this so that root is NULL when debugfs 
>>>>> isn't available and we add proper checks for that instead.
>>>>
>>>> This shouldn't be done. A NULL is a valid parent for debugfs API. An 
>>>> invalid parent is always checked like this
>>>>           if (IS_ERR(parent))
>>>>                 return parent;
>>>>
>>>> Instead of adding redundant work like NULL checks, let the API do 
>>>> its work and don't break the API contract. For ex: usage of sample 
>>>> client, you may look at the drm usage; it does the same.
>>>
>>> Yeah, but that is horrible API design and should be avoided.
>>>
>>> ERR_PTR(), PTR_ERR(), IS_ERR() and similar are supposed to be used as 
>>> alternative to signaling errors as return values from functions and 
>>> should *never* ever be used to signal errors in pointer members.
>>>
>>
>> One escape route may be - add another export from debugfs like 
>> debugfs_is_valid_node() which adheres to the current logic in debugfs 
>> API and use that in client code. Whenever debugfs changes to a 
>> different logic from IS_ERR, let that be changed.
> 
> Well that would then rather be drm_is_debugfs_enabled(), because that we 
> separate debugfs handling into a drm core and individual drivers is drm 
> specific.
> 

Had one more look and looks like this will do the job. In other cases, 
API usage is allowed.

	if (!debugfs_initialized())
		return;

Thanks,
Lijo

> Christian.
> 
>>
>> Thanks,
>> Lijo
>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> Thanks,
>>>> Lijo
>>>>
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>>
>>>>>>
>>>>>> Regards,
>>>>>>
>>>>>> Nirmoy
>>>>>>
>>>>>>>
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>>>
>>>>>>>> +        if (PTR_ERR(root) == -EPERM)
>>>>>>>> +            return 0;
>>>>>>>> +
>>>>>>>> +        return PTR_ERR(ent);
>>>>>>>> +    }
>>>>>>>> +
>>>>>>>>       ent = debugfs_create_file("amdgpu_preempt_ib", 0600, root, 
>>>>>>>> adev,
>>>>>>>>                     &fops_ib_preempt);
>>>>>>>>       if (IS_ERR(ent)) {
>>>>>>>
>>>>>
>>>
> 
