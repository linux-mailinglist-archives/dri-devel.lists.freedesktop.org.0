Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB67D39EF15
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 08:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4B66EAAC;
	Tue,  8 Jun 2021 06:55:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C966EAAC;
 Tue,  8 Jun 2021 06:55:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BBSFqG5y/yxmxPDD7RBnplFhbXRGwnG+Pdm5rhbDW2Y1UgH60CCrBOuEUna6JeDpxAzZ9LrvCo6w2DAhWssvawHsqGM+pna4kFvZRao+XuuIAZtexO5zviUkz3qJuMOo5Ubn0EMNpHK4iLseatoCEcw3UAbB9XRV99ZBGD86A7XpGgo4/73SEMPNcA4lgkLc1zr8jS0wVXV47wanuh/ZaAmmJn0vxMz0S1MP8UnbYyluegOF7ucLjncG4ajtHBumgmf5qxa9AjsDyAyQ26i4VUJKRVRTuybEFRgzshUiu4NUULh6QBKeINJvFIdPUjdEVejuryXSya0GP4QZyoww6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3axFji0+LJT6aH0ebwO3rSS9xTVPRSjLdfeBLY1M4Jk=;
 b=P566nlSKIHgevTQ424iALU4bELHD/4BkTEco6cJZUxcCUt1ybwBD2JzkuS/Jj4Vt9ovwOwWouuHue3DvWImAsJH+cwNLt+FjcsIB3lFc2dbUHwQwanbNku+L9iRWFPQ1NtdVaO1blTZzLZU7CNxIUgZs6/aYOUopx1+8VoPMP6nz/N8ZLIK29K0BsWp4XzfHIF3yRNzB9MBU0dC/P8HAgONfvkXj07sz22EL90ZZcKxkYmlGnXOAFyeI0chGwdyPmuheDN3GN7kpKTSOO0wUbcA19/gv+WwK67f7ILV7b+ce9qh06tAWlspmC0Kd8/icFYDVvhLx5Jqr5eVXOoCSdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3axFji0+LJT6aH0ebwO3rSS9xTVPRSjLdfeBLY1M4Jk=;
 b=dOVgu2kJNFbkODlPFq1dAOsruRsaAVwgXQS3+obSUmwPZz5uGB2EQmGcqQ3Iof5ZO51UDbpsFN/WtqSgEYhmk3v6OyL+Di/osp/lY0VY2PdA69FUibKJwzkveOZ//mBUNQBMM36RdwcGkQ4VTDnm+RfnZCRkgQ+ruo96+Wdwxng=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4237.namprd12.prod.outlook.com (2603:10b6:208:1d6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Tue, 8 Jun
 2021 06:55:56 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 06:55:56 +0000
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Felix Kuehling <felix.kuehling@amd.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
References: <20210608125046.07c6deca@canb.auug.org.au>
 <22010e38-3686-87ce-532d-4a53cae990b1@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <7b825bc4-9f81-3010-6445-d6708e34a9bd@amd.com>
Date: Tue, 8 Jun 2021 08:55:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <22010e38-3686-87ce-532d-4a53cae990b1@amd.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:197a:8536:afbe:3762]
X-ClientProxiedBy: PR2PR09CA0005.eurprd09.prod.outlook.com
 (2603:10a6:101:16::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:197a:8536:afbe:3762]
 (2a02:908:1252:fb60:197a:8536:afbe:3762) by
 PR2PR09CA0005.eurprd09.prod.outlook.com (2603:10a6:101:16::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Tue, 8 Jun 2021 06:55:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecd1f24a-fcc2-4ab4-5599-08d92a4a76ea
X-MS-TrafficTypeDiagnostic: MN2PR12MB4237:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4237659BCBDF74C3669F8F1183379@MN2PR12MB4237.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PgRYhsyBzoRkFmivRG78VXH2NwGwfdvuiBc61VbrHswGTM2MFL+yogHRdVfTExHS9729W3b0f4HMiPQNPVUnKi6ONhJwioygZuEf0yZSEoktb8lufZAQM4wj6odgVdnvHudQPLscWaOagztXYBJs4+u2HouZpU7he9eqkqixl2THH8ZGrAjGZeYgsz9LB77mlj5c4r7hDUFxGXdBzF3WvqIOvg/SwqUq20aIvpq1PKWL4uUoZvBYG5pdVOHZHT+vQfFWE60YJ+Y/Vu/4fdIC00FmCAqdYZ+Ay5KvUaYWht5DV4D14VsrZ0/+vJ0WGZ1v17y62ZXB93M3PI+U3FIPKnZR0F85wxsWk8D1/9hlunYWq3bGanvQsYZnTlQpygOk3Dw4QehChzjDy0OtohsFEbghQJOT3dMg+ySx6u/YAzHCxY5B5WCp2unNTlAQNWvRgRc6fvp1UYRN8u8ocKhf6Tapl4zoGXymBHTunabV9Wm90PBuhCmDpv2inA0MoCNAJMGFQ8CgeQqAjwpMpAJWyC8fU3RKekWI5MhYHC0jwsnNXAmOb1PE8ZwsB0Nv/0NQPFFHdCjqazltYD0U4mIu3esa7EaVQWCq7Ui9nswmVnM3y4lpnbHUFU2oNtOVYtERVN5pej+n2HBa5oqH71sYoGNFRogf/BhoFV8VavClj/RiFSQl/CyuunimQsLeR5Ry
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39860400002)(376002)(366004)(110136005)(66946007)(478600001)(54906003)(86362001)(316002)(66476007)(38100700002)(5660300002)(186003)(6486002)(6666004)(53546011)(66556008)(31686004)(8936002)(4326008)(36756003)(31696002)(2906002)(2616005)(16526019)(83380400001)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?+74qkdL0g4lg3OhYW6FXimxokW69yt2ooBlm1MLqLDJ+YHgH35qmPJrf?=
 =?Windows-1252?Q?DCC8ZQPv/u3n8SQZu1KtQgljOfdBZ3tOq3aEUZS7CRw5fn/a9CxPnqM8?=
 =?Windows-1252?Q?6GiYPAmsSj0trbF2dLzSpixOTtW6vjydRIy0SU3SKDnaTzM/2c/Q1xk0?=
 =?Windows-1252?Q?w25EaVG9Zh5DyeTLOZnFsR8vdFlffC9XaRcksmvqlwcJXZRFW2WMaBPz?=
 =?Windows-1252?Q?Ku/XUQVuOoPiX3TYU2L6wf9BLHQ8IkCQxBweyxY6SeyiKuixQ7OpOWaz?=
 =?Windows-1252?Q?Awyrv9eo9f7kDaQdYCHzmzXUAT4ii/Jxj89ljSsZ5TL/pxDd/gxl4vwy?=
 =?Windows-1252?Q?8pmhlH77EMAsQRB0eOmM/iIa928+Yz03xogob8lthWKTKmpha5+uQUkq?=
 =?Windows-1252?Q?zoPfeVA4K9g7yoP+PlmyDM8tqkKUABwq9IQ+rzVqX6xAx+ReCbCI6aY5?=
 =?Windows-1252?Q?lkr2I4RFZWAKwGBn/DuTeMSFEHR1zqexcz1ZRReCfDYeyk8E8qovVKIn?=
 =?Windows-1252?Q?z29bUdk8pCoyrARq8tgRcsT1L/MozR9lHw8a30ewLjPKVaeYAnkTMGgr?=
 =?Windows-1252?Q?V+P1MoI2N10NIv5f/Xw7wDU5ExhzOsRkDhYVlmi/4xkPyN78c4SZUL+E?=
 =?Windows-1252?Q?+FEL1fv6DabuLXsOwZ66HLnpax26BqxgdWyT/5u0S6Zsb0jsmYK+KKNr?=
 =?Windows-1252?Q?X/aKVP17PZnyLacb7LqMbJeHnr6UFr6K2BwaC6AAojeLkDwRhiBGCYxB?=
 =?Windows-1252?Q?iyvbq/ghRkPSf+o6gECpKAmzCZ0teOhtVckDXJMaKgSRTrI9MPQLqtqy?=
 =?Windows-1252?Q?Ff9O/rDmHcT7d+Bw2eyW1HCkqo854k2XIPicKZyUJVX2fvYYzCap8LBP?=
 =?Windows-1252?Q?SH/Bu/dKDTRAzrxoJlmvcFg+Yx65BNkHN8vlPEXnvvTnhqnzYOCiujxB?=
 =?Windows-1252?Q?bvGDH0W11kip7ldp1NcvsBiwIucM1SD+mpZiGZq7ePMzWFBTaFzLyMko?=
 =?Windows-1252?Q?WBu8WTJQCdumjUvPQpc4xvxTU7yfcFUnCh0kIVTwp1gn9GntEFVXyIiQ?=
 =?Windows-1252?Q?fLamrtAhaNZJELIfISf/Tp5tnYgE6luLkdkcMRKx/kDsp+BG9Ef+QTxm?=
 =?Windows-1252?Q?i6N8HvpwWcCxcwW3HbJGyQur7iTfhiInMzdP9ohPhtvJ6qnqQcpZCp8H?=
 =?Windows-1252?Q?8iQUZgwJDi9C+VGiwjp14gMFYjqsznGAnj5lrS7ZVA1BJnckfLf66a/t?=
 =?Windows-1252?Q?QzS3BQNyn+n59yjmiZLT2HUwaDUEsfJLhKEYfqqIBIXGOzQZJf/Pm+QB?=
 =?Windows-1252?Q?m2wCsaytLLbdDrlELcET9yMv9jT1W56uZCY9chPGxU31XsTyx42qQu0l?=
 =?Windows-1252?Q?TaKKSupVquLjuYAo/zdLAOaFDYF4/PZVuxRoFn4riWB9Bxw/LrkvF8ff?=
 =?Windows-1252?Q?nF53DIg3SDhwua1inv2myMriZsxL9URk+RlvfjIjuM+YvzREHVvqxrV7?=
 =?Windows-1252?Q?7360+eV8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecd1f24a-fcc2-4ab4-5599-08d92a4a76ea
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 06:55:56.4079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: amTXm17MG6N4HJXWjotJHNfbAGpNO+jCWerlEAblTTYtLWM4DsLWQoDU7p7Eyc7i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4237
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Felix,

that should already be fixed in drm-tip as part of the merge of the TTM 
changes.

Regards,
Christian.

Am 08.06.21 um 07:37 schrieb Felix Kuehling:
> Hi Christian,
>
> I based amdgpu_preempt_mgr on amdgpu_gtt_mgr and now I'm looking at what
> changed there. Looks like I'll need to create a dummy node in
> amdgpu_preempt_mgr_new to satisfy TTM, and free it in
> amdgpu_preempt_mgr_del.
>
> Thanks,
>    Felix
>
>
> Am 2021-06-07 um 10:50 p.m. schrieb Stephen Rothwell:
>> Hi all,
>>
>> After merging the drm-misc tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c: In function 'amdgpu_preempt_mgr_new':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c:75:5: error: 'struct ttm_resource' has no member named 'mm_node'
>>     75 |  mem->mm_node = NULL;
>>        |     ^~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c: At top level:
>> drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c:129:11: error: initialization of 'int (*)(struct ttm_resource_manager *, struct ttm_buffer_object *, const struct ttm_place *, struct ttm_resource **)' from incompatible pointer type 'int (*)(struct ttm_resource_manager *, struct ttm_buffer_object *, const struct ttm_place *, struct ttm_resource *)' [-Werror=incompatible-pointer-types]
>>    129 |  .alloc = amdgpu_preempt_mgr_new,
>>        |           ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c:129:11: note: (near initialization for 'amdgpu_preempt_mgr_func.alloc')
>>
>> Caused by commit
>>
>>    cb1c81467af3 ("drm/ttm: flip the switch for driver allocated resources v2")
>>
>> from the drm-misc tree interacting with commit
>>
>>    b453e42a6e8b ("drm/amdgpu: Add new placement for preemptible SG BOs")
>>
>> from the drm tree.
>>
>> I don't know how to fix this, so I added the following hack (a better
>> fix would be nice):
>>
>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>> Date: Tue, 8 Jun 2021 12:41:16 +1000
>> Subject: [PATCH] hack fix up for needed amdgpu_preempt_mgr_new() fix up
>>
>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
>> index d607f314cc1b..e1a7b3e967b9 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
>> @@ -66,14 +66,16 @@ static DEVICE_ATTR_RO(mem_info_preempt_used);
>>   static int amdgpu_preempt_mgr_new(struct ttm_resource_manager *man,
>>   				  struct ttm_buffer_object *tbo,
>>   				  const struct ttm_place *place,
>> -				  struct ttm_resource *mem)
>> +				  struct ttm_resource **res)
>>   {
>> +#if 0
>>   	struct amdgpu_preempt_mgr *mgr = to_preempt_mgr(man);
>>   
>>   	atomic64_add(mem->num_pages, &mgr->used);
>>   
>>   	mem->mm_node = NULL;
>>   	mem->start = AMDGPU_BO_INVALID_OFFSET;
>> +#endif
>>   	return 0;
>>   }
>>   

