Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5355BE687
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 14:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E15810E66A;
	Tue, 20 Sep 2022 12:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47BB510E6B6;
 Tue, 20 Sep 2022 12:57:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WqCi+s6ivpXKcdFyXkiPYHWASFjJqApusXwvb5JN+GPRXfIp+8iubKzlxXuycfzXmnLGdgbojFdwzMjkZRLWC/CtNVcrtJd2nhAZ19Igeqcyy/vCPhjMmgkOmFlRejGJWCoHkkxMYR7w3Jfk4dqVHsU+Oq3boL4M98bPOR6BveVXwjFhkjCPGNnYZimd0MQQ6ATx5DIV0JHpTkM1sQTN0hgY8wTzD6rCr1vLbrvfhPGN1mm2rMBfBHyD6zfajc82qmko40WA4jdCQrnqsE6juRq9E6+v29NciHSA9ijxwHHZCG4cRSu+0psQsLa12YbKapvLXlIZcWfYjCCnc8pq8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXSwpkXN02oaJjuNnxues01kGbJcSDrIuzKiJ/YXFu4=;
 b=je2Lix0jd/+MeS6i147XzpbYNKz0jemvzOYwkJfgNagWxLg1/vysbJam81WtLWgv8qk0VdFmNqBH0SpSq2U8hVkFcJRbos1GbTwh24lT8peq2eBIVKbNt/4yDLxRWU4TYAWL2vx1qdImHuK+7lDy1qlmFbZ9PIyufSCgF42Q3pzGqoyanDLo65e/iSMp9MaNtJNSZl5xVjpT0iIMtYYyFnsUH2IwIDgpdNvQFCrZbUUXZYTUEEqRHcUIU9t6o6ZYpJ5X77uIsfedOhPYaZ9XPx9Fidqq40PEhdD+7pKw9IEEsjiDNIuXLbCWKVGkiC4aOW42C6dLpxRRdolZkAesWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXSwpkXN02oaJjuNnxues01kGbJcSDrIuzKiJ/YXFu4=;
 b=ACgxdrBbgxfXllxmYDcKpFh5QLejSz8cLPNl0KkcOFSSJQLwoiK9VHnFadAr9ye0Xcoz2jNpdUw+51LdSnK9FPRI3jmjiDI8BrJiHIzvHcPdXA2BfDQmnMaoyWKdv3qh24uutIzy3dTOF99/GjOsj4hniutVVdJbR00GKoxvVxc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB7600.namprd12.prod.outlook.com (2603:10b6:8:108::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14; Tue, 20 Sep
 2022 12:57:46 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed%6]) with mapi id 15.20.5632.021; Tue, 20 Sep 2022
 12:57:45 +0000
Message-ID: <f5b5b001-a1c7-bfa4-1b59-04c439fc9ace@amd.com>
Date: Tue, 20 Sep 2022 14:57:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/amdgpu: initialize r variable into amdgpu_cs_submit
 function
Content-Language: en-US
To: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20220920122216.346321-1-tommaso.merciai@amarulasolutions.com>
 <3430255f-3675-eef2-92bd-4eb8be582c83@amd.com>
 <20220920123203.GA346517@tom-ThinkPad-T14s-Gen-2i>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220920123203.GA346517@tom-ThinkPad-T14s-Gen-2i>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB7600:EE_
X-MS-Office365-Filtering-Correlation-Id: 7064fe63-b480-4ca9-39c3-08da9b07b674
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kdxuNOSy5FycO82ggjPvZ2ksMF9Wq1j4roy3hG4S8tL5m2rK6+SZpZfV9NHxwUFhu/R2aXnpS3Kc2ujPcQhxr7pBqil6GxVR0UyF7SG8DYn6p/cg1gV76WRi9e0kcAnVCDUYvBkC1L0jPG5vL33vYzh+ieJh0sW/Z7TRP2kxLsgGpE0QaOYiR7xZItxITkeIVTZPLgR6x+/NpSTz5YRaWN45nsY6qKx/9A7pX3fmjh8qzoWlzpno79RX3+bnprRugWb0kdnVQevnOx1FoRUP9hob0uvZvCWGeKiS6CKb1RJcXpDt6txvrUqUwRjHk4jhh5VFiPabHPPMktnFHzw3IWYARQ91AuWBS4nDXWKk1v0HYa3kcLhb+nalWENvDwsDI/gwvunRqASy1WNPhxhWsIK32qcP1AicdEkQfqF2WZcLNikWXFEovll4O2gBOPauzgaKoeOCAFVlxVm/1385vdmMtOL4q/n+ns/pOtDw5HaoPAmtolqCdjN6XvI8evwVx6LoKWfH5TFtnVN61QUoySjFjVxyaEtv/r02XPfFZeD3BXpJ2/kbzrT47gImA9ev2NvkoL7m5diu3hxUYOpWDZTke3hprYlLdAdWV7X4AwnZXxfs2X9TmbJFd7kgzpJ+jhWHuluarv3BXDwQ7jmjXZ64Ud2tk3cju9mpPe8Uw5ck9LqZpj2hOFFPFA2B6KDskJQCwkGlCXC2ZqOLAZCUsATAx1CG1TGCq5pS6dhCCF/nvMMWVsyOmJTSg2QeXhDzDjkqLDLDTe85x7yCMwaa+hUzsO3+SJx+u00ZLi1znQY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199015)(38100700002)(110136005)(66574015)(54906003)(83380400001)(31696002)(86362001)(2906002)(316002)(478600001)(36756003)(6512007)(26005)(6486002)(6666004)(41300700001)(6506007)(2616005)(186003)(7416002)(31686004)(5660300002)(4326008)(8936002)(66946007)(8676002)(66556008)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wi90Vks4dllZd0czV0Y2NWc4RUNVbjVHYUNDVVBJUHNoeXVEUmhLM0NlcFRQ?=
 =?utf-8?B?cmUxT2JrclcwTHhkMFppTExvTlp4U2JuRGFNN2xRUm1uTVpON3NSeWxIUEll?=
 =?utf-8?B?QWQ1YjFITmpqZWR2M1ZUNGNtbmF5N0xJRjBjV2dtK1dhTVQ4ZVRUL0tzb2Vu?=
 =?utf-8?B?MlVSamR4Qi92eDROdFFOT0pXRWJLdTZqNm1nZ1RDTCt0eWUvNVJ3Rk14Mi8x?=
 =?utf-8?B?c2hxWjYyNnZZODBzRHh2TUtpYnYzRG5xaHFKVkFrdEQvcHZtNkVMS1BVNk5p?=
 =?utf-8?B?c09tMmsvb2lWRnk2c2cvTmlIWFdIMXZwWGlZUGdCU0ppWDNZNjMrc3UrMUI3?=
 =?utf-8?B?bTViaWNCaEE2ckxJZDdJRHRrYzJMNEJiVUxUUldWLzIxdThwWm1Zem9SbkRw?=
 =?utf-8?B?K01OL01lbmh0RlJNM0xnS3Z3WnpHVlFzRXdZR3FwMFNYRFNOc0pIU3dyZHVU?=
 =?utf-8?B?M0w0R2ZXQXAvL2xjNEsxMjNHaDdUcENaUU01T2lvdFAzUEdXbTMwWHhWeEhx?=
 =?utf-8?B?RU5GYkYwRFduMWVQN3llZUF0Qm5HMFJuVE5nRHc2VVNLdjBmWjJDN0E3N0NR?=
 =?utf-8?B?c3dOekxiQUtUbTZKTnFXNjlaQ0pxRDFnQ0lqTWRqZWNMMk1jS3dxaGxQTTZz?=
 =?utf-8?B?eU5tZlJKY1l2dTdHMVcyVlBvYjFYMjA4Vy9aNHc3N2VUL252R1ZnbUtnRUsw?=
 =?utf-8?B?OThjSGVJN1NIUEhEWEU5azdGY0lhd1ZGeG9rYnpCL2diVDVlSHBwVGkzTGJo?=
 =?utf-8?B?Q0ZMTUFOWjFOaURyQUNFV1Z5L0E3TzNkTTRTMUt4Sy9iWGNKeTc4Z25qOGNz?=
 =?utf-8?B?anovZ21jSEFCNGh0a0F3QWgxZE56OU1JMEdmYjZCOE93V0pZVzVZV0dsV2dS?=
 =?utf-8?B?VmVXNGVXNWF4c1NpNWhaNDVRTytiS3VVYmVxKzBlcEdZekNOTWRxdy9YV0pE?=
 =?utf-8?B?bTYzZnhoc0dBWTZHSGhkV2tXZXVKNnJJMm8rTFMvTjlkYnlycUozTXEvRDVC?=
 =?utf-8?B?ZlNIOHZUZTIvbTRpNm1STnF5WjBHdnNQWTNQYm5NMVZCUWw0RzJKVFhOZlQ4?=
 =?utf-8?B?SHVlZGlRdWNSUWswbkxUNVA4cnowOXpnRW42eG1HZEFmWEd4ZXVpYk1lL1Iw?=
 =?utf-8?B?OVNnOEdhb0s2OFZHa1BWR3ovVlROOVJ1ZmRKTy91RmlDalkwa05Nb0pEWFFj?=
 =?utf-8?B?MjhISTRqV1B5YUFGUDRzeWhTYWxWZ2lUQWQ5amhIRmNKRm81elhxUFRtSzZh?=
 =?utf-8?B?c2lCK20rK2IwSG1LMEVkL2R4am9LZU9PQW96cDhxZ2g5Z1VjaXBKQm40RmRG?=
 =?utf-8?B?Wi9hcXpLZ2kzbGtvQ1FPaXdjTVN4ZlhNUGg3eDg0WlF4RjJKSFAvK1RMQnVv?=
 =?utf-8?B?Q3NwZGZmdE92TFh1N2hpNUNkQUtsTk1EeG9QZTQ0VEpTSkNLcDVpTlV4Mll4?=
 =?utf-8?B?REFNNU9EQTlqekJqTFVzUzRpU2dRZjZHdG1aUStXdEVzY0h0eURXSTZyR1Zn?=
 =?utf-8?B?Mk9lMlJGUHpJRVFBQzlyd2VPaTZYbWJ1Z3ozdU82OTdrdS9iZlBvWVRsUWMz?=
 =?utf-8?B?YTV4eVNnWmRJa3psb1gwLzhFYkVBYTd5cjNhRXdxQ3M3NnY5UzQ3dEdSa3Zi?=
 =?utf-8?B?WEM3RWtiNisyWkZycjR3aWpVQmF6K3lMRmVCL0pSMnI5cFNvYUtUTDJ5ekln?=
 =?utf-8?B?VGNpSjY2TEVPQW53Vm1zRktLK2hKcFFKWmVhZC9kQXRNYTZFeENFRHppb1Fl?=
 =?utf-8?B?dHhTdWRCVWh5UkgzTUtWRDJReWRRUlVGcXpnMTJKUEFKUnFpaDdCUmhEZzBZ?=
 =?utf-8?B?TktxdHRqanRoRU9LcDU5b2hPbENEL0E0b2tsWDkwVkQ3QUhtdlZJaUdCcjdv?=
 =?utf-8?B?Y0FXVzFnY25YWFd1QzF4cDdzTzFzZWNaNWovQm1QdlhHdFlqR3gwUVNxanly?=
 =?utf-8?B?cDRCODdkNkdEUUttdDA2aEk4WGpSNDVQbU93Nkd0dlRDZ3J5ZytFQ2p2NTNC?=
 =?utf-8?B?aExVK0pPZjVGRFE1R1FxTzd0RzlxYy9qT2w4b3czTmdCcTNQdlg2MlY4ZGUw?=
 =?utf-8?B?eThoM0ZsTTVhZit1THAwODdYV0IzcU9wR0YrL1RSNEN3OHlNYnZvbGdNbUF3?=
 =?utf-8?Q?M3GU2DHMLLkNs8v+wJpUvUMpA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7064fe63-b480-4ca9-39c3-08da9b07b674
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 12:57:45.7149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L5myRZFE900oBSmV6iWweldCWSbNDluI40n3d4THdXvHV+bvQ8nwW26dDFNu4EpM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7600
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Philip Yang <Philip.Yang@amd.com>,
 David Airlie <airlied@linux.ie>, Tom Rix <trix@redhat.com>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 sudipm.mukherjee@gmail.com, Nathan Chancellor <nathan@kernel.org>,
 Luben Tuikov <luben.tuikov@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linuxfancy@googlegroups.com,
 linux-amarula@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.09.22 um 14:32 schrieb Tommaso Merciai:
> Hi Christian,
>
> On Tue, Sep 20, 2022 at 02:23:58PM +0200, Christian König wrote:
>> Am 20.09.22 um 14:22 schrieb Tommaso Merciai:
>>> The builds of arm64 allmodconfig with clang failed to build
>>> next-20220920 with the following result:
>>>
>>> 1190:3: error: variable 'r' is uninitialized when used here [-Werror,-Wuninitialized]
>>> note: initialize the variable 'r' to silence this warning
>>>
>>> This fix compilation error
>> I've already send a patch to fix this to the mailing list 7 Minutes ago :)
>>
>> Please review or ack that one.
> Sorry, my bad. Don't see your patch :)

No problem, already reviewed and pushed :)

It probably takes a moment for the mailing list to deliver the patch to 
everybody.

Cheers,
Christian.

>
> Cheers,
> Tommaso
>
>> Thanks,
>> Christian.
>>
>>> Signed-off-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> index 58088c663125..efa3dc9b69fd 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> @@ -1168,7 +1168,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>>>    	struct amdgpu_bo_list_entry *e;
>>>    	struct amdgpu_job *job;
>>>    	uint64_t seq;
>>> -	int r;
>>> +	int r = 0;
>>>    	job = p->job;
>>>    	p->job = NULL;

