Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEBE423815
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 08:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 933C96F622;
	Wed,  6 Oct 2021 06:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2089.outbound.protection.outlook.com [40.107.212.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0AE36F621;
 Wed,  6 Oct 2021 06:35:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YBFgAYpZJrfKplyuPAaherB2kQ3IJKrl3lyqn93QhQ0cipm4xPHkNljJJQP/BjNLbrrBFP6Q8BK7K67q4G/Pnmy3hh6VgFkU4Ysg2luxUDN+N3gAxBRxK022Cazdq9WjhXcR5OSES/gR+FE3zoFeRJtLOjWutFaFrONPDydj/8Yq8oBtlZyh2z6rUWSf4VaBA+QDKWZzQhflxKkPPTzu66oAhaL+sC5/Z2uzMgICeM5HZUfToFJ1BSIiYwqnhlNjYb4rYx31dvuGvwdr3kQDhE52L5WgS37SZJz9GWCRZDfOOI6ORvr+SKTt/EzAC+i7jIduKMccTGRiIImMDYOWlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gbv5f0Pc6iR3VN5aD9pZkzD2JJQrGcHP1A4fJOAxf4M=;
 b=ZIyaWdc4515wk7nTovk0tDVQeDI2Ah8FA5SOgPHCEErnVC69hbMbv4sqGYCZqgy9ndiil+jJAVvobhpM7CoeXD2yq28yLeCe3uyNxjRuM2QgogSoOIMbb2Py8nidYm8NMQf6YNLUVAX3uUNW5JMLBDy47oamrNZv3uTFBgm75sk1aJllXOD6l1qcb479K2oaL3VjAsIuPOW6z3D6y4T+NKRhRtAAiWo9YxxD55km7KS0ysU74kT42CpYU+KvMMVJZTXyYyQBlVYb2hksWdbSwR4tKDURF/Taygum50mkqynPiYYI2CoOjflSE0QDznfJyDsaQd5fvkxpUwXfjeE9gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gbv5f0Pc6iR3VN5aD9pZkzD2JJQrGcHP1A4fJOAxf4M=;
 b=qijausB3ZpsAlCYFafWoKacZfpAjB8HRFtm54KosSjk3RIlTipOJZpU6WVSxgY4s01t5NSXHE0SvSoUo62/DbAClF3i7Tk1oVCmdP67wRuIendXMJSamMEvTehPkoyNLi6/KP1Srf1dFIOOaGNRGag1iiTwaOGkvJizB8nNlAJg=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW3PR12MB4458.namprd12.prod.outlook.com
 (2603:10b6:303:5d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Wed, 6 Oct
 2021 06:35:43 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4587.018; Wed, 6 Oct 2021
 06:35:42 +0000
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <43403acf-d6f6-ed4e-2954-f9cdc7ea88b0@amd.com>
Date: Wed, 6 Oct 2021 08:35:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <84a62bf8-65e3-0b3b-91ef-bef5f4060601@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS9PR06CA0055.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::6) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AS9PR06CA0055.eurprd06.prod.outlook.com (2603:10a6:20b:463::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.15 via Frontend Transport; Wed, 6 Oct 2021 06:35:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2a68338-5400-4d04-af85-08d9889384c7
X-MS-TrafficTypeDiagnostic: MW3PR12MB4458:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW3PR12MB44583FA6C76DEAEFE9B4BD4E83B09@MW3PR12MB4458.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:525;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5UtgTKFZJRcjurWi9EhRH1AknNd8E2dQ86q/wtlCjXmJQ1ftCGCzba1873C15gWKLXfYW6/nmO+E7wH4gD/P9zALcNGiAQ3GWXUGgdHpk0hWg5/ljqrlvDlGfIS1Shoo99ci6ZBHAqzRHbG/Zv3OD9c1sBcy4BKVrInX8ZsTwZ78TrPDljOvZcx6OnRZq/oO35D+Oe2F39j6qLGPkvmV3peoVuwN+Bjhg/QNrAWDzIv7Cy+dbLXRzhdDDuU5+vnV3nV7Nv5QxHx35ShHLL9NwObo10RJOIxmy36DUc7L9hufnPr9AWU1sAH06HueGnJrSAK07wBC0LyH10Pyias9+q8+8ohAsVFGh+K+e5oXT6M8DO4bMo/itLXtDJPY5geo2+u4czK1sh51OZLjoClL0R1xKp4ySvp/ES5l+jvyA41Qyxb+YzN+QtyOigDgrq7DgGeemT4a9tuOaDklZkhZ8aGM5EdHzyxJ9xCEF6nzQTFAk6GifLVRDiebTQkNs2xLRBlCVZVD5DxH9lRAxv/kCOM5MUXUNhABk0QCP07N+PjGNgMN/nxgvWHio4hg+WehPEHR9EpZKq1AUfwKY+AMOlAVvTUal/plCHw220gw0GeQbaTuJHLBQ7yujR598rKVKT8UnFKYip/B1heNz2gZ8+ZZElWLyjCUhHeIJtWa+4q2G0gmLPAat0USua4NXhsT5xXcNJfB3WmEXgG7N0noLysI1bF0b2aZ7ohVYGKdudD98hBHyh7bihAVOvmYsuFM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(66574015)(5660300002)(186003)(26005)(38100700002)(4326008)(53546011)(2616005)(508600001)(66556008)(83380400001)(956004)(31686004)(66946007)(66476007)(31696002)(316002)(8676002)(6666004)(2906002)(6486002)(110136005)(16576012)(86362001)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VksxRWZNQVdoTkZ4VGdkZ1Y0T3FGWFVnNnR3WXpqQVphVzRSeVBJeUZWZk9r?=
 =?utf-8?B?OFRRUEJhUFBEbVNHcTIrZ01aTjFnMGtrV2g5N2NRcENyV0RrYmxvYXEyWFF4?=
 =?utf-8?B?UWdSeHdXWHFtL28rNlN5eDNtUkFGU3FDeCtjOENja05pdTdHaitCbXRVUm5X?=
 =?utf-8?B?ZFdsOFIvUDEyRTc2TjVnNWkzVGFxTzlpTmM2THVRMVQ0N3oybVVseUlDcEdt?=
 =?utf-8?B?OVh5TlVOS0VRSFhncmxMZVRYYVYwb3JBRGdoQVJuYklnT2xyRFpSZDFPazJY?=
 =?utf-8?B?c1E2eDFtU1QxSGdSTUR1ZnhzdTFxTGtESHZudHlaOFVIV2xXM0UvN1p2K3d5?=
 =?utf-8?B?b3ZkakRpalU2bFd4SDRuczg2Q29neFpPbW1vU1RnbjBTRWRVTWQvamxndmZM?=
 =?utf-8?B?RldDREh6bDc1OVZtbEtvNFVZTVdrSmZMNU54NitkdGdMcEgwOHY5TmI3Q3Zh?=
 =?utf-8?B?VGJJYmQvWGd0NkRuZ2d2UHJ5WlF3WEE5SytCRDlhRld4THNFUUgxNmY2eUlL?=
 =?utf-8?B?aFBBdmNGMFFMWG4yYTZxM0t1dVhQcnV2c1hmUlpQVWZaVEp3c0NhQi9VUDRS?=
 =?utf-8?B?SURVS25DYXpHSGxFYlY1K1d2cG96K0RYT21kNlcvbFlXZnozZ0FkS2s4SERC?=
 =?utf-8?B?Zy9LNGNIbSt4aUtKd2dtbFdyS3M5M2Q2Yis1Nk4zM2tZMjRjSXlnK3cxdzVK?=
 =?utf-8?B?OXhVNHEzYkIzV3NzbWRPbzFWSFBjakV6dElVNHVCUmx3R0ZpSkl5S0dCUzRq?=
 =?utf-8?B?eWNIQk1jRGQzMFNTSVNLc3c1WW9DSnN6UHorekVyc2g3K3NhZFhDbDNMSENx?=
 =?utf-8?B?SHNtMlArbitGQW1iVFQ3WFZQbmcwZExDYTVFZWFBL0JUcVdLWUFaWHBCWmY0?=
 =?utf-8?B?NWV1SnBCeXM3M2tHRWhEbWFjVC84cWJzQlRJUCsvMG41eWhnbGNPdFk4WVRI?=
 =?utf-8?B?QWlycmxhOWtCc3VMckJaSEF2ZFFHVkhvUnBlY0xqSEU4TUpXNXZwYmprRlJw?=
 =?utf-8?B?a3lMOEVoMVVUVTBkeCtibGdrNDc1UkRUYlBqWnlidWpqNlpJZzBmby9NSHY1?=
 =?utf-8?B?VXd4b041bzJqbkZPSm9IQlprc3YrMlRFYlZlWUpLdVh3NVorQndEYjhkbmxT?=
 =?utf-8?B?Rk1oSUZlb1VpcGpxM0xKNU1HOWdQNUplS2oxOVlvL2wzSXJXWStleGNsazZH?=
 =?utf-8?B?QXZpTmxIS3V4ZkRzMVVneGFtNVRtTHlCZ0pwcFRlTjU5ME9WZ0dzM3RhUHUv?=
 =?utf-8?B?bG9RaW95bkpCcnp6N3lZNnhGUlVrak9ITUlNM1VvTnRzS0lpMFBTbzUxQnFG?=
 =?utf-8?B?bVk4R3owd2xnbS9wVC85RmxkVzRJYmlCajNPTWtJWitKQm5WNkVVS3hrUWVH?=
 =?utf-8?B?ejcycStMeGtkSlcrb1l0bTNDZjhYVzZ0S3YweVR6aVdzR01nQUdvRm41cU9V?=
 =?utf-8?B?c1Vyblp2WjZGdk5MUnI1dFZIMzZVSWlSU2xTK3RIUEY2eHpQUHdvYjFMTHF2?=
 =?utf-8?B?Qk1mYUxiTE5PRWdpa3ZhUlVqcE96MlljYytpM29ZS3lab29YRFlyLzgrZjBz?=
 =?utf-8?B?QnBLUXhveXBPdTU3UW8xZXQrSXpudWhFWUtaZnVuNTNlL2lHSU94NDhFUFJU?=
 =?utf-8?B?RmpkU0E0TlJqbXNaZEk5T0VJbFVZYmMvNElaaVJWby95c2dvNnZqMXVFMEIy?=
 =?utf-8?B?YjZOaXd2WkZHNjZqdldobVlwbm1IdjFRVVdGVmZ6VGdOTzQ4aEdYNit5TXVn?=
 =?utf-8?Q?1mYk0PuTI/ydXtCBhMPd4/I6PrVHmn0zXR86Mxc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2a68338-5400-4d04-af85-08d9889384c7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 06:35:42.0934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tARCDY+hji2N0RMR9eR6yaqNjFKptRH7nUnk4hBTJxl3Av9uJZPjoGOtUoDd6PEw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4458
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

Am 06.10.21 um 08:32 schrieb Lazar, Lijo:
>
>
> On 10/6/2021 11:49 AM, Christian König wrote:
>> Am 06.10.21 um 06:51 schrieb Lazar, Lijo:
>>>
>>>
>>> On 10/5/2021 10:15 PM, Christian König wrote:
>>>> Am 05.10.21 um 15:49 schrieb Das, Nirmoy:
>>>>>
>>>>> On 10/5/2021 3:22 PM, Christian König wrote:
>>>>>>
>>>>>>
>>>>>> Am 05.10.21 um 15:11 schrieb Nirmoy Das:
>>>>>>> Debugfs core APIs will throw -EPERM when user disables debugfs
>>>>>>> using CONFIG_DEBUG_FS_ALLOW_NONE or with kernel param. We shouldn't
>>>>>>> see that as an error. Also validate drm root dentry before creating
>>>>>>> amdgpu debugfs files.
>>>>>>>
>>>>>>> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
>>>>>>> ---
>>>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 10 ++++++++++
>>>>>>>   1 file changed, 10 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c 
>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>>>>>> index 6611b3c7c149..d786072e918b 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>>>>>> @@ -1617,6 +1617,16 @@ int amdgpu_debugfs_init(struct 
>>>>>>> amdgpu_device *adev)
>>>>>>>       struct dentry *ent;
>>>>>>>       int r, i;
>>>>>>>   +    if (IS_ERR(root)) {
>>>>>>> +        /* When debugfs is disabled we get -EPERM which is not an
>>>>>>> +         * error as this is user controllable.
>>>>>>> +         */
>>>>>>
>>>>>> Well setting primary->debugfs_root to an error code is probably 
>>>>>> not a good idea to begin with.
>>>>>>
>>>>>> When debugfs is disabled that should most likely be NULL.
>>>>>
>>>>>
>>>>> If we set primary->debugfs_root to  NULL then we need to add bunch 
>>>>> of NULL checks everywhere before creating any debugfs files
>>>>>
>>>>> because debugfs_create_{file|dir}() with NULL root is still valid. 
>>>>> I am assuming a hypothetical case when debugfs_root dir creation 
>>>>> fails even with debugfs enabled
>>>>>
>>>>> but further calls are successful.  This wont be a problem if we 
>>>>> propagate the error code.
>>>>
>>>> Yeah, but an error code in members is ugly like hell and 
>>>> potentially causes crashes instead.
>>>>
>>>> I strongly suggest to fix this so that root is NULL when debugfs 
>>>> isn't available and we add proper checks for that instead.
>>>
>>> This shouldn't be done. A NULL is a valid parent for debugfs API. An 
>>> invalid parent is always checked like this
>>>           if (IS_ERR(parent))
>>>                 return parent;
>>>
>>> Instead of adding redundant work like NULL checks, let the API do 
>>> its work and don't break the API contract. For ex: usage of sample 
>>> client, you may look at the drm usage; it does the same.
>>
>> Yeah, but that is horrible API design and should be avoided.
>>
>> ERR_PTR(), PTR_ERR(), IS_ERR() and similar are supposed to be used as 
>> alternative to signaling errors as return values from functions and 
>> should *never* ever be used to signal errors in pointer members.
>>
>
> One escape route may be - add another export from debugfs like 
> debugfs_is_valid_node() which adheres to the current logic in debugfs 
> API and use that in client code. Whenever debugfs changes to a 
> different logic from IS_ERR, let that be changed.

Well that would then rather be drm_is_debugfs_enabled(), because that we 
separate debugfs handling into a drm core and individual drivers is drm 
specific.

Christian.

>
> Thanks,
> Lijo
>
>> Regards,
>> Christian.
>>
>>>
>>> Thanks,
>>> Lijo
>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>>
>>>>> Regards,
>>>>>
>>>>> Nirmoy
>>>>>
>>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>> +        if (PTR_ERR(root) == -EPERM)
>>>>>>> +            return 0;
>>>>>>> +
>>>>>>> +        return PTR_ERR(ent);
>>>>>>> +    }
>>>>>>> +
>>>>>>>       ent = debugfs_create_file("amdgpu_preempt_ib", 0600, root, 
>>>>>>> adev,
>>>>>>>                     &fops_ib_preempt);
>>>>>>>       if (IS_ERR(ent)) {
>>>>>>
>>>>
>>

