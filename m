Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97062573238
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 11:16:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D4292C28;
	Wed, 13 Jul 2022 09:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2FC92C28;
 Wed, 13 Jul 2022 09:16:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Myi5V9ent3hw6tcN1Q9oe2heZstlfV1RAKRlhijmziS78xy5NGm+Ovt6tAETSbpD42eYCiGHtL7J+eOpdDFL5FRAaxSq2QyQtDwhfbxNtJw6kYEn81T8WwYe+n3vx99fdpvW2TWSwSez7rf3QNYhcqHeIrjFpcEQwFfVAsExAdM9Y6hKNjTOknUsQbF7pO4QB0PGqqHNl5P1ST0F/h1zU2pPrHgZ3KADecnQeeHKW4Df3m6hnJrTiN+1UDrRS0kkG6ZjWFUhI4LWK27KI5RKx9yV0UY0K6cEvGQAm/ainIMAID8v1BdWg2FAPOAQzRxFbCoAeROUpPzHAo0SGlSddg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwDJlc/fGh/sgVPByC3NrvKekI1/ufmOsRN5KvVN8rw=;
 b=LFF29v1SPGixebHlLRr0p21DGBBVnLaxYQHzxb6XaUWOv3TMbwGJXoHp6D+3gKMy/r7xEVQq+bqBznPG/arMLeT20go2OBBduQX0qLvllnxeH6OZpBUD9RkjTnvmHoUfT+eDVkeZzjqBPSHmlmFHjnaX+7h928Ibaw2Lv2+WX9j23TKKCsQj5RhTLdgW71POjZCK14QUhD99NBiPpm8chbSH6Sv2lGnUINDjz5F2ldNXx5iyr7dlMPdHyxuYdXr//8rGdRxCjIKrQ25sm5EohBGKxu/P7hPW1Tbk/+YCk0AkBMfsxXCYy43BGEbgj/5vQIW+nFSXKzholG5GJStE1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CwDJlc/fGh/sgVPByC3NrvKekI1/ufmOsRN5KvVN8rw=;
 b=vyA7JdVEdCinewBEH/VsHBrh36qsoEH9PiPnPwlruKiexv1O4sD6vR9VAbmL534wjIuDxdqVkudjZ8d979dxIOkOlYTOyJhswWckGGG5Nimq6FgYiOb8fqp+q/LqhlAInv5dZCe3R4Gzwv02/ZJulJt4aDVGgh93twWF8QJlKD0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH2PR12MB4167.namprd12.prod.outlook.com (2603:10b6:610:7a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Wed, 13 Jul
 2022 09:16:05 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5438.013; Wed, 13 Jul 2022
 09:16:05 +0000
Message-ID: <9aa8538b-d535-4de5-6e07-fd81d2b3db33@amd.com>
Date: Wed, 13 Jul 2022 11:15:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] drm/syncobj: Fix sync syncobj issue
Content-Language: en-US
To: "Das, Nirmoy" <nirmoy.das@linux.intel.com>, jie1zhan
 <jesse.zhang@amd.com>, broonie@kernel.org,
 dri-devel-bounces@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220707102953.769684-1-jesse.zhang@amd.com>
 <22a21338-305d-bdf7-0079-df67fb030fc7@amd.com>
 <43192086-b9a6-387c-4a29-ea28aa65a3b4@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <43192086-b9a6-387c-4a29-ea28aa65a3b4@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR0202CA0058.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::35) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d20fc1d-dc00-4b09-13f4-08da64b0509f
X-MS-TrafficTypeDiagnostic: CH2PR12MB4167:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VWHKsEnrT3xvqOM6RpDBAnWlD4pLA1BUbb40Tc7BrmOROjfRhXFqZvzuKduqtaPGqvuFxVF1VSidqE4X1mMcfv9BrLPnZPZI1inbdHtzzVEM9u3OV57jb58h2b1Bt8UNwYE/rq0nWHEPuYxI0w6kJc9tALLXaSza6UDzFIK+towtVOJGzcjgt8iavwxsLCn/rKfvlUADFOTDSpzMFy4rA89bOQN8hv8SCLb9iWc/CWTlGWM0RcxCgyRZ+cO0dKKfiDuNazGm9cThRNovzLjcUwim7+9lL7vXfiQ90fcOJ38RxcOFVO3pDWma+6gMbPbATPr3z5IRioUsfaJw2IfUNctDP4SumBmk8cqevhay4TL6cXJIJd8o6if+mf11mi4brI0N2THhaPeXClGP9cQSbW3Sl2VB52z0akGf6mIHM1HvaAMK28hcoHUAGvvAAzh/X/kgcHTDjvc76jwrS3htJSDuETcorH4E4H7gWP+DGEhSdATkH4t91/VKU2YuZyHhc1c3iSSIJcbIMwMv2go42nNb+cI2PP4+puW0ir8lZ2GFuNLYHDtSspYWFhzhs79E4LGj3RlLUMP0LL5NIF6FlbaXZlen7Hz1zq1FyUB4Y30GbvuMmjkBTn39B7Uy80hFItQZOlgYfToRiTTc28pDY8wDW2w4Dpe4RDvMytd0XmuOqqYU+6nDLCcukwonXFN0loetsn6IpQTnNWqx1RhJKI/5O9CVkzCtbsINWDxjlm7/DMjASf/DULI9aC37uxqPQh2fXWLOFHOuDb3f0TF1sqnD7tlRmZNvkfWdQUk55Q8xYdSbLvsa1DCS6HvbW9tS2onAg/HR0hB/RMBuCXDsG21R22ckINKoVsaO+YHSjt8cEdkvfz1nJQtsgrw6i/M9tjrQ/yeEw0QqwhtPrcOF37/9LFcVmiCvHxrVDduiIOY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(31696002)(110136005)(316002)(66574015)(5660300002)(2906002)(7416002)(54906003)(36756003)(478600001)(86362001)(31686004)(6506007)(66556008)(45080400002)(38100700002)(66946007)(8676002)(966005)(66476007)(6512007)(6486002)(6666004)(53546011)(4326008)(2616005)(186003)(8936002)(41300700001)(45980500001)(43740500002)(473944003)(414714003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEpBTmxieFBQY2lOSm5oc2RkNUV1VGNsaVVmeG5oZXVaR3FwbVVPdnZzSVRG?=
 =?utf-8?B?WDFYL1RQQWVUdWVPWXRBRnU0M0FoZHRxYTByT1Y5WEp5V05xNFBBdk5nRGlv?=
 =?utf-8?B?RjZXM1BmeEMwLyswcGtiM0Nhb0ZlSkNkZFhGTnZjNkZ0VDUxdG5uWUJIaFRh?=
 =?utf-8?B?NE9XWU5ZcXNUYWV5dTVWY3FtVGpGYlhkc2lXVzNEbUhyU1pzTVVjeUI2WWc4?=
 =?utf-8?B?NWZDWHBGZ0FRdk13U21scFBxeEszME00bkdOYjN3bktZeEJVZzRSVmw2dDk5?=
 =?utf-8?B?UHZCejFIcVJ3RU12cHBKaTZDRFVUQXEvU1ZxTmtTcjdPenp3cU1kY2pJcGZz?=
 =?utf-8?B?bC82bzFOaU1iY2tHUlBWUDF0T1J4M2R6N2x0VERzWDhQNnREV2FhTXh1cXNw?=
 =?utf-8?B?T29wZml0eFc4aGhiRVFSUm5YNlJ3RUxWY2c1MTlmU0twc29PWnZocnEzck1p?=
 =?utf-8?B?YnpCMmc2WGJvUTNYU2loSzRCMFZFZ2NFL0tZckt3V0dJT08yMjNEZDYwODJq?=
 =?utf-8?B?cWVHd0FvaHdxdExlSEJjd2FTZmp3QmZwN2tGSllkY3l3MTZKdG5SeUozTXBj?=
 =?utf-8?B?ank4czE0MEM5S05wVVJiRnRlSnBQa1BFckw4TERWOXpFdUJHQWdmcUdsWGNm?=
 =?utf-8?B?UFVFa1MvcWk2SDhFYnZCRTJOQThmdGRoaloxeVdla3VZcjNPcWNSTmZGU1V3?=
 =?utf-8?B?aUFuS0NjVXFKVit0N1lqdmIxdmFpYnRSN0drQ21sWUVHdW1ycW9PNUhYV3Ri?=
 =?utf-8?B?bUNIZitCMkROQWI0UVh4LzJHZERqVFhyb0o0aEZ2dXZJdGxFR0xiR3lUZVlh?=
 =?utf-8?B?NFVhcStsc21FUVVjVGxFUTF6NVArdDJOVDRyQVpWUXZReEpTNnljQW83Vnp0?=
 =?utf-8?B?MWlqYmFJUXE1WVA1WXhHNHY5ME5sdmlBeHZxZWxmbno0THM5bHlSVXN1aEZz?=
 =?utf-8?B?dExON3gxYkd2UW05OS9GVHp4MTdqOXkxMExFQlFpNkJSelZCUHpIazVxcTQ2?=
 =?utf-8?B?SWpXTk55OWR3Q1JXQksyYzRoU3N3OUpNRVc2UXpHbkdwNTMrMzl5S0pBYzk5?=
 =?utf-8?B?eGQzUTJQWUhSZVdTNTU5b0l6OHNSRitFQlF1UkovTmZjdUI4UTQwN3FHeFVE?=
 =?utf-8?B?dVZQQllvM3drMWFlSXdHQVQxMEN6aGwxblY5MXBsSlZUcytucnpKa3Eva3JK?=
 =?utf-8?B?M2ZDSHNoMGo2Q21IM0ExQWYyUUlvelpBeUFIVE90bkVrc3JPVll1WDBjYWdR?=
 =?utf-8?B?QUhBZlEzOWJxdGg0NlNWU1E4c3ZFOFExWFNoVUFSWUF2dWpzdGkwNnBjUmpu?=
 =?utf-8?B?V0V6bUJ3Rm05cThOd1paQ1ZDbmJPeGYzZThmYnNyUXIxcHd6ZU0wQkFNVnh2?=
 =?utf-8?B?K0NEdnpqVE42S3hGTDdoVHpMYWcvaWUzSWZ1Q3RtcTZwNml4SWRnODVnMVVB?=
 =?utf-8?B?OU1LMTZkY0Q2cmlsNVBJRHY1NGJSc3BGRDNuTTdCaS9UYTFxUEt4aHdqVFlX?=
 =?utf-8?B?UC9YZ0FHdnYybkE4T0ROaEJOdkVEeFlrbFRYQ25SMk1CUzhNV2dqdi94S3dn?=
 =?utf-8?B?bFgwaTUxZE9oLzBzOWNvZUd2VTEzZUw5MkhjdGhBYXIwQ1NQbVlGK3Zsd25K?=
 =?utf-8?B?ZGlpeGtPMXhidVFPSW5GM0d5d2NOdHp4ZTFFbWJiNzBhcXBTVHgxWk5vekRv?=
 =?utf-8?B?OXVZbS8rcnpnSFZjNjQ1N2FuUG1tWCtkTnZBc0pydWgwTkR6b2JmQlRRbVNn?=
 =?utf-8?B?bFlJcHlUV3dTRGFwMURvZUdGSDdoOEc2OHJxa3ZYbmpwekZrcENFM3hIMkc1?=
 =?utf-8?B?QVpOT0YyTG1TTFBtUlhBOS9qNktOd21ySWJnaUo3VGxlWUR4dnFBYnNSQVRC?=
 =?utf-8?B?N0RhUUFWa1d4SXBSOVhiWUlWdmNET0dLUVl0NXZKS3BGa1BvUGlCTHQxdith?=
 =?utf-8?B?a0ZuNnh4N2d6d0lpM1pEaUhhYy9NSmxEazdrekhxTmFQWEEwQlRQZ0dnR1lH?=
 =?utf-8?B?NmU1cU5qRnVQa2FlUTRMRnFGZzVYTjByYVc3MUlXWCtZYUJGRVdJQ1d0Tzdh?=
 =?utf-8?B?ejNuMXlQdTdmYmRpL2EvZnZOMXFmdEQ3cjR1NXg5SHJWb09VMFRNVWgyYjZu?=
 =?utf-8?B?WmNOZ1M2R2pqcTBTYTlHbU9zTDJRcVNGSWlRZ0hDWUpRKzh4aEJPQVphN3Y5?=
 =?utf-8?Q?aPi0lkY1LXN3zbj9DDOudj8K8z+a4m4WCTatztbxVi73?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d20fc1d-dc00-4b09-13f4-08da64b0509f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 09:16:05.6752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0k7hB+N2VCdrtX97fjaeKf3VkaXfCDO4dFNDeZW6KywOWyLXRA14FgbXhL/Fs8yI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4167
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
Cc: Sunil-kumar.Dommati@amd.com, ajitkumar.pandey@amd.com,
 David Airlie <airlied@linux.ie>, Basavaraj.Hiregoudar@amd.com,
 lucas.demarchi@intel.com, open list <linux-kernel@vger.kernel.org>,
 lionel.g.landwerlin@intel.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Vijendar.Mukunda@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.07.22 um 10:42 schrieb Das, Nirmoy:
> Hi Christian,
>
> On 7/12/2022 12:26 PM, Christian König wrote:
>> Ping to the Intel guys here. Especially Lucas/Nirmoy/Lionel.
>>
>> IIRC you stumbled over that problem as well, have you found any 
>> solution?
>
> I might be wrong but  I think you are talking about 
> igt@syncobj_timeline@transfer-timeline-point testcase which seems to be
>
> green in CI now 
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fintel-gfx-ci.01.org%2Ftree%2Fdrm-tip%2Figt%40syncobj_timeline%40transfer-timeline-point.html&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C722fc33842734ef5c05108da64abac60%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637932985747614383%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=q8JygSVZfGA8cEZn%2BdxVXX79pkpXRjZTS8kBQ6Lq%2Bmw%3D&amp;reserved=0
>
> Lucas found out that the issues got fixed after ec8d985ff26f ("drm: 
> use dma_fence_unwrap_merge() in drm_syncobj")

Yeah, but that's just coincident. The original bug that we fail to 
enable signaling in the syncobj is still there.

No that this is any major problem, but it would still be nice to have 
that fixed.

Regards,
Christian.

>
>
> Regards,
>
> Nirmoy
>
>>
>> Regards,
>> Christian.
>>
>> Am 07.07.22 um 12:29 schrieb jie1zhan:
>>> enable signaling after flatten dma_fence_chains on transfer
>>>
>>> Signed-off-by: jie1zhan <jesse.zhang@amd.com>
>>> ---
>>>   drivers/gpu/drm/drm_syncobj.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_syncobj.c 
>>> b/drivers/gpu/drm/drm_syncobj.c
>>> index 7e48dcd1bee4..0d9d3577325f 100644
>>> --- a/drivers/gpu/drm/drm_syncobj.c
>>> +++ b/drivers/gpu/drm/drm_syncobj.c
>>> @@ -920,6 +920,7 @@ static int 
>>> drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
>>>       if (ret)
>>>           goto err_free_fence;
>>>   +    dma_fence_enable_sw_signaling(fence);
>>>       chain = dma_fence_chain_alloc();
>>>       if (!chain) {
>>>           ret = -ENOMEM;
>>

