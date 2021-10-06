Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4803F42373D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 06:51:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F3566F605;
	Wed,  6 Oct 2021 04:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2071.outbound.protection.outlook.com [40.107.236.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D376C6F605;
 Wed,  6 Oct 2021 04:51:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oAgYKBvodOnf8yBPgwDBfBf2zJ7hoQbDb6grY2XHLBpmfosRBLiurEn2pUyArsH0fSPOXiSTtApMRKzBXV4aYuSUfveq9mS/gzS0aS+jKEY98K+xlIauhQ1oJGSeY45e+xx+PI53zsieojU6VpVEVAS7swMSSiPGOzFR2jsgv4jVCVAzq76U5KXH7Hmw8hz4mFGJHC6KpFqQfL8dNC0cjNKA17vJ1O+Y9FIUmy98UCtYfnZsP7W1fh35bb2yO4MNiUPm10rsNshHgLkLdSr3o6DcutBXd06MBNHC3nfkmJzkiClgxC2qwxam49iMHWIyrxHbaH4GzXUaRzhKRBpytw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSJPt1sKe0HUzjeTZafcxZaomsmhT2Fs+9437OUQNDw=;
 b=YE5+tesEPEp5ugbQRFlCjpqx40AvDVYeO/VTWpEzWfE4QRkHjG5i4vyQs0mTkC2X76vvkFrWd9gzWqsks4EyRm9JI45o9WGUXjf1rxzNGeP9dR1y/aN3oxTCTw1dxyy90eqJRLs8b8hND3DIN8c34YLhrqy/2jXt07z1NIVu2Sq4x/lj0h9K20eDbUNSfXMR8d+NLxSMZJ00lbVWu0W1ZYtygrX8e5L11jD3ruuaSZeBjoKZkCcP6bZ+VIkNwJRbXpRa/h+v2KADuoBwrG/TtwS78NLh1tfGzxav9ZTKLYhLIergWtsLmBYUNWi+9sQtt/bcpyv6/Ep8HwGL8qOCKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSJPt1sKe0HUzjeTZafcxZaomsmhT2Fs+9437OUQNDw=;
 b=znWjQXH6Qw7aUYa1OidMCLGtwyeA39/vb6ngfck6MQtsCH7na2DUEtJnBDEshkl+HSA9CfbJW5ZUyzvUgN/PVhmk4bW0eS4h9FVx3uhn5JMmu1a96QMH8gvjehrRCAz2PlhOC2KorqG/objP+T1Sd5wh5HeTw/ZfJTwkcaN92hg=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB3922.namprd12.prod.outlook.com (2603:10b6:a03:195::30)
 by BY5PR12MB3828.namprd12.prod.outlook.com (2603:10b6:a03:1a4::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Wed, 6 Oct
 2021 04:51:26 +0000
Received: from BY5PR12MB3922.namprd12.prod.outlook.com
 ([fe80::9845:21:9ef4:b0ad]) by BY5PR12MB3922.namprd12.prod.outlook.com
 ([fe80::9845:21:9ef4:b0ad%5]) with mapi id 15.20.4566.022; Wed, 6 Oct 2021
 04:51:26 +0000
Subject: Re: [PATCH 1/1] drm/amdgpu: ignore -EPERM error from debugfs
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Das, Nirmoy" <nirmoy.das@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>
Cc: shashank.sharma@amd.com
References: <20211005131115.25595-1-nirmoy.das@amd.com>
 <ab673b77-e8b7-94a4-76f6-588ad9e472f7@amd.com>
 <182c1454-102e-cf2f-80eb-09baa57f8e82@amd.com>
 <45342056-8e15-bdb0-0237-d11476bcc8fa@amd.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
Message-ID: <af8ba141-1581-4b96-4ef4-bc82111e213d@amd.com>
Date: Wed, 6 Oct 2021 10:21:12 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <45342056-8e15-bdb0-0237-d11476bcc8fa@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0165.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::35) To BY5PR12MB3922.namprd12.prod.outlook.com
 (2603:10b6:a03:195::30)
MIME-Version: 1.0
Received: from [10.252.81.250] (165.204.159.242) by
 BM1PR01CA0165.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:68::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.22 via Frontend Transport; Wed, 6 Oct 2021 04:51:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cab34a6-09fb-4846-81ba-08d98884f3db
X-MS-TrafficTypeDiagnostic: BY5PR12MB3828:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB3828182AF1552B8D30D13DE897B09@BY5PR12MB3828.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:240;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NswYVT5TBLeF9ytETQcF97ubCFyUdDFVdRavtizqx8Wg2lmXehsx/ZdgsvyUQe5hr0el5hlRH+eev41aiceU3EexZ+8w+v4bquHRcV3tCWprIOtiCDxIdY2ziEONKUCaxuiSHcvhFFopllnKIV35oJwU/d9k2SD61DP7pyRu2Do40qTUqNiLbs2lqPGpnPskHCWv9hbE7VHgyDVNc1V5GcEWVPXKtW9Eek41Rn89VHuch9MnvG0y4XarSIiyfV6S31ugXUyZ3YGKJVhqUdqw25MhGdSN0OHxgGNad56f9kBXygzl2fDCRPHvrk1imaTwWceeSAhhWE9cxgAPA5WV5xhBF2QCXB6PfPJlHbJLJuoTk97hsIPODJT9UHAn8kK7E00pcVfoujSoPtFhXJyNACsDSCznqqdI881riYnZOlo1vZ8R4yiXffJ63uVSwwz5skWMWqytaUN5aH52InLvP9hjyPtP3m6I3tMxVPCOhyVYEgQ2kaoUcKmpCGa02gmuqLnh/otj4K/DB40TVqOzu3rCEFe1alyz6DZFlACRjmlYnuoWMzExEFJmuVPekvnbL3HilWOlPbsC7RTFjtWLWdSizW//6sw4Gtw4P1mpQJeAF1djF4rgCeqYG+NODLk11dwFRwxxscIkQyYc0j5zTkhJre100tLG19J/idLEjtkQUpBTccBEoxpo0ojF4AhE8Lj4Mgn9bmIltqQbXKcwcf6RKa8rZWj8+FwEDMvsrk14UbiwMwe39ohuNOMfr1Yj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB3922.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(66476007)(6666004)(66556008)(66946007)(508600001)(53546011)(5660300002)(86362001)(186003)(2616005)(956004)(66574015)(2906002)(38100700002)(83380400001)(36756003)(4326008)(6486002)(26005)(8676002)(110136005)(31686004)(8936002)(316002)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REJ4R3dXSDJsQXNCR0wyTWFZRnBaYWIzVEFtRlZUNkQ5UXJyUkFrODZuUGpH?=
 =?utf-8?B?b1RJY1dQZUpOKzlhNDlmVCtDQ0lqbjNBRlN4RVlrRXY2ekIweU15QXhoWk5B?=
 =?utf-8?B?T2l6STZFZTlsNUQ5UnFMQzVHMkpkS29qU1h5OVNCZzZGQ2wxaDRoU2tGWElo?=
 =?utf-8?B?RVVRNUV2VUdSVVJITEI3aTRmZmNmQ1Z4a2w0c0dWVTRMemxMU0pJaEZZemh3?=
 =?utf-8?B?U3o5cG5QaEtFNElnRTZOMUpReEhVS0hsbmhQanBnMTNsTUl1eUlBcE9WaFh2?=
 =?utf-8?B?VVdCVTNCaHRlVURLUHUzYTZPRHNwdVlZTkxyL0lQcFgyY2UwNzFvd0VlSVJ1?=
 =?utf-8?B?QkxaL2ZtSmZSTVcwQXorMjQ1ZVpkVXpDWnJuZTdpbHU4QXMxQ1I3aU1MT2dM?=
 =?utf-8?B?RmNPNU5nL0gyVDQxVmZsUHdyRXZxVExLRmNZTHliaHJFZVVKV2grSGpPOUFI?=
 =?utf-8?B?K21FQW5NbWpDZWYvcEdCbFExVkx5c1c0SHF6ZUtvUFlsdDhDN1Q3eW5UMVNP?=
 =?utf-8?B?cGI4cVh4KzhScXlKZjV0bTRpQzMxa2Frb3Z4WnBCQ0xqRFh6aTk0THVGTFg1?=
 =?utf-8?B?eDMrYU5xMVJlUktOaXJjaVczT0lIcktwUldkUGtrYy9NbnBmYU1QbDJ3NS9x?=
 =?utf-8?B?dklBS3pmOUtUbUw3ZTY0ZjlvN1lwM1JWQ0RVcUI4YWV1ajNuMVlOT0N3WHpR?=
 =?utf-8?B?SUFsdHRFMUlHRHFVdXVzUFZuN0VnZi83OGJHQ3l2YlVIa0VnY2RYS2ViTitx?=
 =?utf-8?B?NkFHRVRYaW8raHhqajBYMmlFYU1VcENLdGxEVkVtN1Jib0pHT05HS2hwdHFi?=
 =?utf-8?B?NG0vWml2MEUxRlhhajdXUnJ2ckdHL28raCs1SVhWZEtRRzdBdlM5dHRZbDI3?=
 =?utf-8?B?VXY4TFJuNkJiTUNLNTZjS3d1YjZTbExkS2ZlNm5nN2UwUWl6VGV1VCtvNUYz?=
 =?utf-8?B?MVUyK0t3eWpuTmNFcDhnbFJaSnZJOUMrTWhUTjBGNzBqdXJ3MytsRkV6U0lq?=
 =?utf-8?B?RUZqSjVVcVkybFJnY09WRTAzdy8yVmFKQ29LaGFnN0RIb1o1OUplTnVxTGhY?=
 =?utf-8?B?TTNEVXc5eGV3U1REd1FRVnBnc0FoRm1lQ0tUR0JiOEJta0ZCQUcrdXlqdzFB?=
 =?utf-8?B?eHNqaVJjczZ3RnR6aGdnVFVocmYwclFFQXJLYU85WXNWamFDdEgyVmJ5SER6?=
 =?utf-8?B?bDYvYWl6R3ZmdnhrcXhHV0liN2xGR2NpUFdEQU9MM1gyczRsSitvVzdBVmxo?=
 =?utf-8?B?RDJxUkhGQ3FjOFgxR3R1aENocnV4RWtEQVVJSDQ1SmwweGFYZnA3OUV1N0Ny?=
 =?utf-8?B?akZoZGMyWWdIQm9heExLeGFrbDFoellmRGZPbWl6Vis1SGdyNEh4MGZTQlh3?=
 =?utf-8?B?WUQxVFBLcXQrcFc1R2lITk8yOTg1S1IrSFdtL3JQNTdRNVhDRVJFVmZvVUk2?=
 =?utf-8?B?R1lVZUxaUHBkMVBSckVYdzFWOENKbGh3a1VWaU9PcHVMM1BQU2RIcXoycEoy?=
 =?utf-8?B?eHZzc05RbVZyNDU2Z01BZWRhTmo5MmJkZHJNR3VTektMYTdjd0JLT25SOFN3?=
 =?utf-8?B?U2loSXdZR0JzM0piTjJ1M2ZzR0FVMGFIdXRuaG82d3RMQklUV3VOU1RROVFi?=
 =?utf-8?B?YXdhUVVHdEZMUGM0a0Z0NjIxQ3pHWmpIbGNkTmNvU1BXZEFpWmVGU1FiWVRy?=
 =?utf-8?B?bHA2ZjVMK2NjWnVpbjBaS2RzQlA5VHhCQXhXUG9BdHQ1QlN3bmF5M3hKZ2o4?=
 =?utf-8?Q?HP0focuSocs1R43HR0PRX3Sw5aiBYtmLNtPHYCq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cab34a6-09fb-4846-81ba-08d98884f3db
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3922.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 04:51:26.0813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SSumZ6z46GhD2iF/K3Wo+S79O+4j+hTSaeo6m5CV7RC3ci5JepyOXUFbJLm3BM0X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3828
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



On 10/5/2021 10:15 PM, Christian König wrote:
> Am 05.10.21 um 15:49 schrieb Das, Nirmoy:
>>
>> On 10/5/2021 3:22 PM, Christian König wrote:
>>>
>>>
>>> Am 05.10.21 um 15:11 schrieb Nirmoy Das:
>>>> Debugfs core APIs will throw -EPERM when user disables debugfs
>>>> using CONFIG_DEBUG_FS_ALLOW_NONE or with kernel param. We shouldn't
>>>> see that as an error. Also validate drm root dentry before creating
>>>> amdgpu debugfs files.
>>>>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 10 ++++++++++
>>>>   1 file changed, 10 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>>> index 6611b3c7c149..d786072e918b 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>>> @@ -1617,6 +1617,16 @@ int amdgpu_debugfs_init(struct amdgpu_device 
>>>> *adev)
>>>>       struct dentry *ent;
>>>>       int r, i;
>>>>   +    if (IS_ERR(root)) {
>>>> +        /* When debugfs is disabled we get -EPERM which is not an
>>>> +         * error as this is user controllable.
>>>> +         */
>>>
>>> Well setting primary->debugfs_root to an error code is probably not a 
>>> good idea to begin with.
>>>
>>> When debugfs is disabled that should most likely be NULL.
>>
>>
>> If we set primary->debugfs_root to  NULL then we need to add bunch of 
>> NULL checks everywhere before creating any debugfs files
>>
>> because debugfs_create_{file|dir}() with NULL root is still valid.  I 
>> am assuming a hypothetical case when debugfs_root dir creation fails 
>> even with debugfs enabled
>>
>> but further calls are successful.  This wont be a problem if we 
>> propagate the error code.
> 
> Yeah, but an error code in members is ugly like hell and potentially 
> causes crashes instead.
> 
> I strongly suggest to fix this so that root is NULL when debugfs isn't 
> available and we add proper checks for that instead.

This shouldn't be done. A NULL is a valid parent for debugfs API. An 
invalid parent is always checked like this
	      if (IS_ERR(parent))
                 return parent;

Instead of adding redundant work like NULL checks, let the API do its 
work and don't break the API contract. For ex: usage of sample client, 
you may look at the drm usage; it does the same.

Thanks,
Lijo

> 
> Regards,
> Christian.
> 
>>
>>
>> Regards,
>>
>> Nirmoy
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>> +        if (PTR_ERR(root) == -EPERM)
>>>> +            return 0;
>>>> +
>>>> +        return PTR_ERR(ent);
>>>> +    }
>>>> +
>>>>       ent = debugfs_create_file("amdgpu_preempt_ib", 0600, root, adev,
>>>>                     &fops_ib_preempt);
>>>>       if (IS_ERR(ent)) {
>>>
> 
