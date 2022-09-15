Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 362755B9F5F
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 18:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F58210E1E7;
	Thu, 15 Sep 2022 16:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF2A10E1E7
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 16:05:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eqz+fx9CFl7y7Zml2bSu+s8OoSVz3wA8E86GBMxKJHDUZFBCcAKm440/lHwK6AqZtqJiZJPMX+TlLH+eU8YVKwSFrLrRe5NvQMyusu2HubBVlQLjh/a/9z6IOA/AoAXYBDnRxNxUTCctdigKw55KVN5Vi0sXaSHC0HU4aFLmkkqqCTerCXVI8/fybOopyh0T92L+ERBUKCWYzflkpjOBTy2iJk+FVKQpjcAGdrqf/fJPNgJdti6iTN2DFjGjt4/dfvDwI70N6Co2Vzyjap726A1OWINL4ZguesF7xw6+hstmXkYb3693NE38lOl+7SafaRwkhbCHo0+saDJFl7mwTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMsY2g+18QXgWA3FU7kN1s+ERpqc6Nr+xGv7XeQEsEE=;
 b=edx+apMgy7s6OpMnr2A6Dj/2ruwE5CIJRswDIx4cSrAmral+WNrv75qR6dxFx/vF9++DB4njrWcrG6A5QL5RupoLbrzkWcF3WkLZIgwBTiVsLlkf9fYDhfnRfhDcbWGdy5HJrnjHKp+g+RVfobpgtmfJWLEEbUF3PRT3N4fBDsYdEqbvHV2ju+2ej5uluJ/+Fqw5Gy5l4NtkqOrAUZIMLonCY4RWwda7NDtNhkDh845eZ0OU1JIcHuxEXloTty6lbotlaXZ0EGz1+IHsLNiouf9pdXn9diVOAAv+YyODAHyOC9ybPX/375MNSaIzatFY++5T60YoI/8ljeqDp98jlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMsY2g+18QXgWA3FU7kN1s+ERpqc6Nr+xGv7XeQEsEE=;
 b=FiSNkQ5Yg+NAXqfNvjvBlQVR6RFWIPy617zPpX3JiJ7WLXIR73e9JFiKri0+Ts8mm4TY0g5T0QC8KlSVDXj0R5RBS3Nsd5GXGtPpy3duDjO3pTMoSgQxa9Nv5I1K48UbERUEeom22wvRQHDyNEpG7/GNUGU0fgk1Ct/bOtzw+M8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN0PR12MB6077.namprd12.prod.outlook.com (2603:10b6:208:3cb::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Thu, 15 Sep
 2022 16:05:37 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed%6]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 16:05:36 +0000
Message-ID: <691c421f-1297-cd08-ea70-6750099275b1@amd.com>
Date: Thu, 15 Sep 2022 18:05:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 0/6] dma-buf: Check status of enable-signaling bit on
 debug
Content-Language: en-US
To: "Yadav, Arvind" <arvyadav@amd.com>, Arvind Yadav <Arvind.Yadav@amd.com>,
 andrey.grodzovsky@amd.com, shashank.sharma@amd.com,
 amaranath.somalapuram@amd.com, Arunpravin.PaneerSelvam@amd.com,
 sumit.semwal@linaro.org, gustavo@padovan.org, airlied@linux.ie,
 daniel@ffwll.ch, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
References: <20220914164321.2156-1-Arvind.Yadav@amd.com>
 <d2d81ffd-2269-bdc6-0daa-8f3a99306e46@amd.com>
 <33a16b15-3d3c-7485-d021-ee2a727e5391@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <33a16b15-3d3c-7485-d021-ee2a727e5391@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN0PR12MB6077:EE_
X-MS-Office365-Filtering-Correlation-Id: f31a1fcb-fcb5-49f4-1002-08da97342081
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m+fLJUREzETq5aTB6bJrdInBzamQk/G4MNkyCHzjhPvAW0LwQEVFvkAqW/QXAAxwxc7qKuxJwjnrzq8N+dnI3jAsAK1bmhb8T2LBN4dh1hhrPYLMw1I5x8STRI6nXFHkZAFCcL7G2XrdSxkiazbXHyulNGS19wG8UXDXMrdOlK/MIrbVkAb1+0nqOf7gTzsP0Mghq7DQKsTSrnWG4lY3gN4oMxQdkEY3+TFWTqc0PuXqy/KZnWl1v14iOxvszYM2BtVsHXvcvhmUdj+D55ICpnU/FpbbvSExdJzgHwXbtWDqJetqIxDTtR5btWw6XvuQoiLOv14E2axiZxAIafs8dl3sh3w7K3iFbyrzfUniU9+sjkZve88h+a7rIKMSJtYdy3Xgi19qziSRkCsawoZ1ZvwobFERD/VZm0XQIKC2Mdd1LNYgr81pZiRc6kBygBTTEvtp023IoeKApJN5OguwtF4vQqFZsGoRSOMv2v8smzWGsXgPP42A/1PReGmLlnilg2TRNP/k7Dlxc7tyM+ye+HkyiHHEhArykJuX/NmdBh9J9tAFRaHU5iJcAY2wKHfc17q46+DQCOswg5YR1m2ayRxQzaITuaGcpFUo+SQxfNvH+8/ETZAScs4nw2U9I7lSxmixvTvy9KUMGCzfFaGn8vjKRq6+BvPo+Z3hyDJkM+kF44a7VBMItrnyU7SfYWkpM3b0aJ3xdStXBFM0xtZSFRERZwuR0xQEB0+UGAZzlxnm0cc8YJVgXGPTrgsKByr9VWPZGpoa+nNHPw26gewSPSA0ATCTjIInqQvKd5FWWXJzH+eTG0+xAdW1tx9HsgOD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(451199015)(6506007)(83380400001)(53546011)(31686004)(41300700001)(66946007)(6666004)(478600001)(86362001)(921005)(186003)(31696002)(8936002)(110136005)(8676002)(6486002)(66556008)(5660300002)(2616005)(38100700002)(6512007)(66574015)(316002)(66476007)(2906002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0NBWnhpNXBhNEJjL1crYmRSMFZpdExVeW5SSTI3VHFqZ292SlRHUXM4eDd3?=
 =?utf-8?B?VVRFRUtzRzdTSzJIRElqS2RYNDNmT25YY2twMDBUdnkxdWo0ZkdWek9DZDlI?=
 =?utf-8?B?a05SNmZaa2tTcUJVeGVtZGczaGlnRjJ6Skdza21uZWtRQjJHWkJvai8rMDNh?=
 =?utf-8?B?bG16Ryt4SUhuck0xSnJlYko4RDZUZ0Y1UHp4Q3REZWdSN0tUS2J2SEh6RzU5?=
 =?utf-8?B?TzdiYVdwbnFnTzhsazl1anBxSlBDaEZwYnVJQko4UmZTbWIyYnBlR2E1UWRH?=
 =?utf-8?B?SnoyOVJMT0dSVmg2eVJBUWdHZ2dTOVVxWEZHYmxoVU0rRGp0VGlZWmd4cTlW?=
 =?utf-8?B?VDkxeFFVSmFPTCtuQTFDbVJiUzY1dy81Mk5Sc1lRclNSTEUyWFlxNWNnRDZh?=
 =?utf-8?B?RnlhZFVtUG4ra1hCVWpMbUtRdk13RVpNRGI4ZFl0cVAzT3JrQi8zVjl0dnp6?=
 =?utf-8?B?dXRDaUVDSTFVWFo3Y1JBN3hZM3lPS1dLSkNEVTdIUE44YWdGL2VET3E4WjZF?=
 =?utf-8?B?MmRRVEUxSit0a1hFSWo0ZGRhdVczSjZyWGQ4dC9pRTExRkVlbnpJTENjdXJ0?=
 =?utf-8?B?WXNXMlRLZFh5bFJydU5sMjZnSE8zS0R4U2Q1dWttdlNrR3ozdFNrQW40T2NS?=
 =?utf-8?B?TnFJY3dBUmg1dmpNeWh1YzNqdEhBQ1FCN2JwaU1PV0ZRNlVDUStpek5jR3F2?=
 =?utf-8?B?Y3ZHS2ZObUo1L0RCdDBBbjIybjdGdmVYanpPSWhqOHNNV2ZjdldxRWFYTVRO?=
 =?utf-8?B?dHZEMm01ZUUxdFVEY3RYMy9GUHNTZmhMS3dqUG40ZjNYQzl5cGlXM2V5c3dj?=
 =?utf-8?B?enZ5ZmtiY3JNVUR4U3lFQ2loSURVWEJQS3M4YjFYRklGeUxsVXdHeGw4UnRH?=
 =?utf-8?B?WHNNY01hMUErZlYxczB3VmF0UnBrTzJUYk8xRHdZVGpVOHlPdVg4bzd1SnN2?=
 =?utf-8?B?RExybkZ4dk5La0pLTzhMbUdOS0R4bmJib0dkcVNhZnBOUCt3TnhQc1lEdUIy?=
 =?utf-8?B?ZnZra2M5T1ROY0dlcXZOZThDUTFaekRZa0ZNSUloZWlJMDRlU0tzVGhxRmho?=
 =?utf-8?B?SGJXZXdON3UxSHAwTjR0WG5DR2NKYU1BTnlBK0xDR2c2M09nQmlubi9OMCsr?=
 =?utf-8?B?QkN5SUdsSVRXOXdzTkpuTG8wV25CalB6RWJZTzQzWExqVU1Wd1FQT2xEN1lU?=
 =?utf-8?B?TjNOUE0xdDIvV3lTVGhlRzc3UytxbnAvck9aTFdVbWJCNTd2VVI1K25Oamo5?=
 =?utf-8?B?RENkWFpRcmU2ZlJ0YytSZHRsNjBuaTBEVWp5SHBkY1ZGMVhqWDJKV0krbmpO?=
 =?utf-8?B?UXU5T3doeDBKdGYzSEEzUDNpWncrUEsyVWdGUlJQbVE2NmpnSU1OclUxbnls?=
 =?utf-8?B?Nk5xL0tCMURZOTE5UFdzTUY2ekV1dmhTZlFDa1htY0psWGpZTVpSYUcyekVX?=
 =?utf-8?B?R2Q5aWh3QnY2MEttTjhhK2VaL1FySVE4Q1lZS2tNK3E4NU1qV3lvY0l5dHJr?=
 =?utf-8?B?d3VsRjBnZmhLRWhaU015SnBPc0R4ekNNUk9uR3Y1bHFWRzlINUY2a0h6bXJ1?=
 =?utf-8?B?VHhlNFZJWmZxc3M4Z1JlSWJiakNsU3ZjY2pRT0Y3Q2xucjZVbU1vRVNjc3dv?=
 =?utf-8?B?V0QxTjcvQ09FRDV6SkRscHlBbjFhaEtOdU1hUFovdzNoUXlIOS9CYXVvMW5I?=
 =?utf-8?B?eWV3RHBlcDQ0WlhkbDREV0owbUllSlhvV1VLQ21aZGJlVVBTTjVCakFmSjNV?=
 =?utf-8?B?QWdSaUl1d1AwcFlXeHBTUTBRNFJvUFFLRC9Gbk0weTRVVE5qelR1OVRkelor?=
 =?utf-8?B?TXg2ZXV0Mno3ZHdkRnFRaFRZVXVRTGN4QncyUjYzM0tEL2hhSUVwaCsvTUtu?=
 =?utf-8?B?ZkdCQWJLL2lRVUp3SVU4alllOGhhbzc5U296bDh5NXpZVE9acWh1NWVrelR5?=
 =?utf-8?B?ZTg4c00rRG94YnJDTWs1Y2kvcHNaMnY4ZkZyVno5ZlBPSWpZaDA3Z3RaZHVt?=
 =?utf-8?B?SzQ3SmlOQ1hQWm1uU2c0VllNRWwzcEhENkE2RXVpaWJQaDEvd0dsSGVPSDlF?=
 =?utf-8?B?eHNuVENnaVhFODBVb2F2OURvQzNUbWp0cTQ4ZXcxNUwxYk5xQTI2OUxxQ3U1?=
 =?utf-8?B?dldYSWtEVExEYklDWWxuZmkyTGFZck93ZFhrRFZjNWZiNVlCdWVGTW5JeFl6?=
 =?utf-8?Q?4IPoyTjx6FL57Ccrr2FRBNIflaOuUEPWerZZR7WgfT0+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f31a1fcb-fcb5-49f4-1002-08da97342081
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 16:05:36.7019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LELJgVmY31/0oFNqAIv9MdPgennMmHtjYHDZxakKp5JbiUNYVKGXt3M1/aSw0PkA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6077
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

Am 15.09.22 um 15:02 schrieb Yadav, Arvind:
>
> On 9/15/2022 5:37 PM, Christian König wrote:
>> Is that sufficient to allow running a desktop on amdgpu with the 
>> extra check enabled? If yes that would be quite a milestone.
>>
> Yes, It is running on amdgpu with extra config enabled.

In this case I will start pushing the patches to drm-misc-next. I'm just 
going to leave out the last one until the IGT tests are working as well.

>> What's left is checking the userspace IGT tests. Especially the 
>> sync_file and drm_syncobj tests I would expect to have problems with 
>> this extra check.
>>
> Yes, IGT test cases are failing

Yeah, as noted on the call please investigate.

This one is the real reason why I wanted somebody to look at this. My 
suspicion is that we have missing calls to 
dma_fence_enable_sw_signaling() in the drm_syncobj code.

Thanks,
Christian.

>
> ~Arvind
>
>> Thanks,
>> Christian.
>>
>> Am 14.09.22 um 18:43 schrieb Arvind Yadav:
>>> Fence signaling must be enabled to make sure that
>>> the dma_fence_is_signaled() function ever returns true.
>>> Since drivers and implementations sometimes mess this up,
>>> this ensures correct behaviour when DEBUG_WW_MUTEX_SLOWPATH
>>> is used during debugging.
>>> This should make any implementation bugs resulting in not
>>> signaled fences much more obvious.
>>>
>>> Arvind Yadav (6):
>>>    [PATCH v4 1/6] dma-buf: Remove the signaled bit status check
>>>    [PATCH v4 2/6] dma-buf: set signaling bit for the stub fence
>>>    [PATCH v4 3/6] dma-buf: Enable signaling on fence for selftests
>>>    [PATCH v4 4/6] dma-buf: dma_fence_wait must enable signaling
>>>    [PATCH v4 5/6] drm/sched: Use parent fence instead of finished
>>>    [PATCH v4 6/6] dma-buf: Check status of enable-signaling bit on 
>>> debug
>>>
>>>   drivers/dma-buf/Kconfig                |  7 +++++++
>>>   drivers/dma-buf/dma-fence.c            | 16 ++++++++++------
>>>   drivers/dma-buf/st-dma-fence-chain.c   |  4 ++++
>>>   drivers/dma-buf/st-dma-fence-unwrap.c  | 22 ++++++++++++++++++++++
>>>   drivers/dma-buf/st-dma-fence.c         | 16 ++++++++++++++++
>>>   drivers/dma-buf/st-dma-resv.c          | 10 ++++++++++
>>>   drivers/gpu/drm/scheduler/sched_main.c |  4 ++--
>>>   include/linux/dma-fence.h              |  5 +++++
>>>   8 files changed, 76 insertions(+), 8 deletions(-)
>>>
>>

