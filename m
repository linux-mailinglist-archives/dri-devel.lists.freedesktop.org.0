Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A33244237E3
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 08:19:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E9916F617;
	Wed,  6 Oct 2021 06:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2048.outbound.protection.outlook.com [40.107.212.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568B06F615;
 Wed,  6 Oct 2021 06:19:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W0KDP7Q73cxswKWo6NnJDKWDtFNUUza+rAO7eFlVwTAOxsBsybbAee+m3oIGHf1nZFwUaO+LrYQq0OwRJW2wD4KA4pa0vhObumisfg7tVl8qmA/9VAix3QqFH3L+liCT1nexAhJLkJYXhWAUZGrt5+ctOKlbSalwVc2HIgFqsYBVCbRXU63lazgYI55QaM2n8aKfvpjbNVxq79y/DtMY9YXXffHjaXFoiwyAUv8vJG5Y4DezvMMi+9+8U/NEwp+looQnzmms5Y2P57jFJFOiR+xD4mPAlSUBRhjaq7/twqv9t8PXTO0xi0kEJAKVxxleoFba0u5MhjC9re9X/VxMtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKJiMWaK+x/TB3PpOx8Mph9BOSxph6An+LkkGnOhKwE=;
 b=Jn8BOamL9h4Xw/7BZW0B+Au8/rdKHRpydIpI4UYzIXTTuC8IC+xkhsimbylcQc9GSxfQCPYhWG+bPXcG4Y6dTAalVxsqVyNiiYsvYd38wYAf5ow2a9LI6yxa4U6LRM7MDL5XJ8oMlvDIE16a98MDNs3nkJkXb5+W8pEQQNsD0C4lMRGwQOYFCU0G3BVoiUYSoOeuHRgl429Jgf8WEIyDipboGY65wNFsbKCZuZkAxJWSVFFwxVemBnPgqumDBZa31c2CIPguJvihcv/x62ZP+tJ+vMRavHk17ctvwJtSAYFRrTUzybxYw7N2BB7GcITq1g9NeXZkqaFyb51xIZ/wPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKJiMWaK+x/TB3PpOx8Mph9BOSxph6An+LkkGnOhKwE=;
 b=QZwTVueeqs1KJVoa5+BXtbTQi05umLRLWQ+yDzwJYLsDMjVhqxIs+ZN9QWQ7I+Em/Lya9pI6EnGGfn+zMPhefx0w1I2nM4SEUC7VrFB2Zp6ub2eqVKrua+OmCkMl5h16rFHUVpUigbg28zyVe6ic7c2kDWgpicDgIykjmzoTEXs=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1837.namprd12.prod.outlook.com
 (2603:10b6:300:113::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Wed, 6 Oct
 2021 06:19:24 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4587.018; Wed, 6 Oct 2021
 06:19:24 +0000
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <36880798-83c8-5566-dfe8-a18b9c4783f6@amd.com>
Date: Wed, 6 Oct 2021 08:19:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <af8ba141-1581-4b96-4ef4-bc82111e213d@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS9PR06CA0244.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::35) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AS9PR06CA0244.eurprd06.prod.outlook.com (2603:10a6:20b:45f::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.16 via Frontend
 Transport; Wed, 6 Oct 2021 06:19:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33591e78-9dad-41ad-06e2-08d988913dd6
X-MS-TrafficTypeDiagnostic: MWHPR12MB1837:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB1837A6900022F187C9273D4683B09@MWHPR12MB1837.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:316;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cXEC1p50gTd+CST/LmoY/k6xhjVk7XACozjU862Xg2qmNaaNTW3NpDuLPlBeUx8Yy3ZAU8BbDjGSmVNHufToBhBOqWsAy0JHm+2an3VKUIiyWx1KgxhEUAyMd0Q8Hw0+UDXBRZBf6ZmWs6n4mQt/TKgKDxC6EVSvU9v3UtVodZ4uT9By2rwWVv2L7bpzi732mM5sKfJTMpujR7qDKendWGooen2J+Hr66CFPzdnsI11ZD8RZDmewEBLMdrBEczvZzyHVtUbVk6V6uXJ4wTLioNYSKw0EPr515ATHVBx0Az9geUwBbvGKKlaekPXPESXvDzxCEPO7Izi/rfJcxvW5CLP+cPe1BIASX4teNxDTutpd094zU+qugQY1lKZfw12xtTDh0EK7J5lmjrjnNGOiytKi2u66pJHE0OW9lrdxBL3OcfeLltjslTMxQJtm3duCpmDieia6JbyGqi3pS0p5d0KxHT8ITAPr77/aMihqnvKXNko4jjMlr2UCBMjFf73WHPilFU+a48usvCyR5tSNED5wOJ2RjJBJtaNwF6qc43OQ9aOedg0/vDnk907AUDXK2K5iXMl3bAzmIhmxxi3b5kbrwa8U/sCoCp+fY7fvo5Ubf3YN2NtIGCXb8+RHot+1jpx1SUuWPkIGliKym4xhQG71o5334+I2/82u+LlyBDiuUu+YYe0NkoK+u4aKCSVmz3V2BaS3vyp+RD7gsY5ISlz+J59OQg+TB2JajHkp1iEOcSDMbU+GiOqzP9TYjtj6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(316002)(16576012)(110136005)(53546011)(38100700002)(186003)(956004)(2616005)(6666004)(26005)(36756003)(2906002)(6486002)(66556008)(66574015)(66476007)(83380400001)(31696002)(5660300002)(66946007)(86362001)(8936002)(508600001)(4326008)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVdjdVRKbnNiUUEwajBZZ09VTnZBRVRQMmRXNFV2cGZuUjZYWmQyKytMQ1VX?=
 =?utf-8?B?SzJlVjViMkhlTmRHVXlrZmJXRm9UVEVaa0tPY2NNN05IQmxTN1JMMXphbWdz?=
 =?utf-8?B?OXQrblBVcVQ5VnZqZGVVTnJCTGNFWmlTUkgrYnpBcUkxQ2E4WEY2SVdURHNm?=
 =?utf-8?B?Q0J6ejJJM2FZaUZLTEZ4dituMHF4SDdvcCtIcEsvdFNEaUdhNWJJNmNnNC9X?=
 =?utf-8?B?SzVQdFBlNzA1aEdKaE13dUp5TVJMNDQwRmdWK2I0TTkxbmh4OWp0QTdyMG9F?=
 =?utf-8?B?eVFVMmpjU3VmNHRKNGVxSTBZYmRwODFrYW5sTWcvNk1wdjltVHowMUhHSExm?=
 =?utf-8?B?QzFIOVhWcFdPUkdMOVRQaGxTeGd4eSt3aHFkVENvVWRCVW9tUFE3VGhJUXZZ?=
 =?utf-8?B?K2Z3VDZVUjU4UzdQM1J3NkZLM3diQnQ4SThMZUk3RkRSaUJoQTRXSUxDUE9z?=
 =?utf-8?B?elJ2QUZjNXhKY3UrMFFrYmNvQ3pvWDBHY29sZGppWStwdVFvbEptS1NxQzZ6?=
 =?utf-8?B?UzJVcTNwaDJZNG5rT3U2RDc4RHhoWmF0ZDJ4eWVtaHBzRnRjcE9DTVM4aUhu?=
 =?utf-8?B?NFB1cXZyNE1MQXg4eUR2WW9nd1pDOVNPeUhSTFhRTVRzZnoyUmNvMkFKN1ds?=
 =?utf-8?B?VnByci9qeGZDbzZWVEg0MWFOS3hybzU1WWpaS0ppank3NlJJR21Md0Rqc0dl?=
 =?utf-8?B?MXhNR05TZUtROGJ4K3NVRkJoc29pb3lqZUlXVkk1cjcvcmY4NUlNR3lVVTUw?=
 =?utf-8?B?V1IzaFlaTXFJVVBBZkllREhzRCtWOGdlZEswSTBtTUtpOEd5ekdBK1c3dEtv?=
 =?utf-8?B?T0FOeVdEcUFSRm1GVlFkMXJySXhxL2FDRXA2SWFlZjNKT2lKdlFJZCt4YlFs?=
 =?utf-8?B?TndDUW9yVzNNRStZMG1COEhma2duU0MvUTNYY2xUQnloR2N2MDdBeEdPbFV0?=
 =?utf-8?B?M0kvbjBUKzFKOFQxRnNlb2pOVjdYVGo0YnVIdFNPcG5pczhkU1RhZFR5U2Fn?=
 =?utf-8?B?Vjc2dGcvMllIRzdSaFFOeVByQm41TDR2ZnN2L25rODMxOHVSRXc3ZFZDSnV3?=
 =?utf-8?B?dktTWEV3bG1hUGZQM0Zwcmc0R0E4MnNraXI3QjJFYUd5aG1sdkl0VVV2U2cw?=
 =?utf-8?B?WDRVdzY1Z2lndE9tOFdqekUxdThyYkVPY2NOYmZkMHliUVF0eWF1NXQxaDQw?=
 =?utf-8?B?NUVTck5xb3NmdDlTaVBqQy9mUzkxaWlvYlRkOGlNcWdqdlpYbFVOUHhxNFA3?=
 =?utf-8?B?cVNOSWJnVCtNL3lxVndYNjc5R1JkdGh1d1RFWjVJZHlGUUxhZXNLS095bjBo?=
 =?utf-8?B?Wi9KcStva25adWs2YXlXV1FTdlkzcVArdFhJVUdpSWZOOUVIOEVwT1Z0UkRI?=
 =?utf-8?B?S3grMlJNUnU0NXNxclVrL0FrMHNseCtEdEJLQXhMS0U3SlFPVnZQMTN4QjF1?=
 =?utf-8?B?WCtraEhDSzJqdXZueFJEU3Rpb0dUSnowVEFLd2NlU3ZrYkpKUTBmUmxUTnpB?=
 =?utf-8?B?ZndPR1NEUEJhL2Joengzbnl1OGVjTEpBRWc1S205MzhMcDl2K0xlbVphL1pY?=
 =?utf-8?B?UW1tQTlTZGFrWEtSS0NyVEo0dEhFUlg1eUFuRDROMDRvT21kU2JtTGN2SFQv?=
 =?utf-8?B?THltdUdqYm5sMmcyWGd6V1Jmalk3N3NqQzRMU0tUT1JPL1pPL0pLYytPWnc0?=
 =?utf-8?B?c2J0cnVUbENRa0JXekQxeEw3cXdHb0FQYytCcnM1dmdVbE5HdG5JMWdieFlR?=
 =?utf-8?Q?++sShBnKWLRLrL4UrygtF1cePLLpracrfQiF6X7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33591e78-9dad-41ad-06e2-08d988913dd6
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 06:19:24.2536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JKxifvP/8CGww37Ymm6XIZBA5UkLS/FOONtojJEUcPMshwfZPVy04w69Fmo6eVu7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1837
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

Am 06.10.21 um 06:51 schrieb Lazar, Lijo:
>
>
> On 10/5/2021 10:15 PM, Christian König wrote:
>> Am 05.10.21 um 15:49 schrieb Das, Nirmoy:
>>>
>>> On 10/5/2021 3:22 PM, Christian König wrote:
>>>>
>>>>
>>>> Am 05.10.21 um 15:11 schrieb Nirmoy Das:
>>>>> Debugfs core APIs will throw -EPERM when user disables debugfs
>>>>> using CONFIG_DEBUG_FS_ALLOW_NONE or with kernel param. We shouldn't
>>>>> see that as an error. Also validate drm root dentry before creating
>>>>> amdgpu debugfs files.
>>>>>
>>>>> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
>>>>> ---
>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 10 ++++++++++
>>>>>   1 file changed, 10 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c 
>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>>>> index 6611b3c7c149..d786072e918b 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>>>> @@ -1617,6 +1617,16 @@ int amdgpu_debugfs_init(struct 
>>>>> amdgpu_device *adev)
>>>>>       struct dentry *ent;
>>>>>       int r, i;
>>>>>   +    if (IS_ERR(root)) {
>>>>> +        /* When debugfs is disabled we get -EPERM which is not an
>>>>> +         * error as this is user controllable.
>>>>> +         */
>>>>
>>>> Well setting primary->debugfs_root to an error code is probably not 
>>>> a good idea to begin with.
>>>>
>>>> When debugfs is disabled that should most likely be NULL.
>>>
>>>
>>> If we set primary->debugfs_root to  NULL then we need to add bunch 
>>> of NULL checks everywhere before creating any debugfs files
>>>
>>> because debugfs_create_{file|dir}() with NULL root is still valid.  
>>> I am assuming a hypothetical case when debugfs_root dir creation 
>>> fails even with debugfs enabled
>>>
>>> but further calls are successful.  This wont be a problem if we 
>>> propagate the error code.
>>
>> Yeah, but an error code in members is ugly like hell and potentially 
>> causes crashes instead.
>>
>> I strongly suggest to fix this so that root is NULL when debugfs 
>> isn't available and we add proper checks for that instead.
>
> This shouldn't be done. A NULL is a valid parent for debugfs API. An 
> invalid parent is always checked like this
>           if (IS_ERR(parent))
>                 return parent;
>
> Instead of adding redundant work like NULL checks, let the API do its 
> work and don't break the API contract. For ex: usage of sample client, 
> you may look at the drm usage; it does the same.

Yeah, but that is horrible API design and should be avoided.

ERR_PTR(), PTR_ERR(), IS_ERR() and similar are supposed to be used as 
alternative to signaling errors as return values from functions and 
should *never* ever be used to signal errors in pointer members.

Regards,
Christian.

>
> Thanks,
> Lijo
>
>>
>> Regards,
>> Christian.
>>
>>>
>>>
>>> Regards,
>>>
>>> Nirmoy
>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> +        if (PTR_ERR(root) == -EPERM)
>>>>> +            return 0;
>>>>> +
>>>>> +        return PTR_ERR(ent);
>>>>> +    }
>>>>> +
>>>>>       ent = debugfs_create_file("amdgpu_preempt_ib", 0600, root, 
>>>>> adev,
>>>>>                     &fops_ib_preempt);
>>>>>       if (IS_ERR(ent)) {
>>>>
>>

