Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F0A42A058
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 10:50:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E6C56E7DC;
	Tue, 12 Oct 2021 08:49:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2087.outbound.protection.outlook.com [40.107.236.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F085A6E7DC;
 Tue, 12 Oct 2021 08:49:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLjDD8FKTsW003oEMkubEENXhymvgjmiE2vQPdmbfKxYiyub8iJHpsmVRWXvwj8O1Cz1lAf8ymJGILphsRrfDdKANjXVTVodZDlynegnFe+dDqeOx3fJD8OByE0enY7ZKfM+GYQxdqhnBhjtWWo0uq/BQWy2NgVsKH+bN6pq6HdE63VpUUUOBX5Qs2i2UtDT8B6WaTijOosD4NK61dy+gCekLyhz4GLkUYtQf5fA7MztBubCBbK1V5u977CmtH193ZeycZdcGHlfHCI4diky5hg4SFF90KldHr52pkoo0ssu1bARVpTz3mYuzlkS9gaG0sVzxRmUa5KzgYLl2dBl1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6cn5d+zkJIrJIIQwnC6kqBf47NSf0oGt4INxtTwE/G4=;
 b=nqMNrSnfjS2q7ZPpCIYjR6vi6ZdSMhSpcksYaFky3q27MzBD+OkSW+xYbbG/eEDjqjuhCMS32Q+OxAs0sqF/vaRdYDeIU3kK6oDFjX69SuGDamLeMhABdCd3T5k1ybjb3HXGiy3oj9lYI5Bl0vX0kbBiaexqer6xGxY0VbMmboBZJOsdNivaVxmnm/r72e8vAGb2oRKuFW5ROOLl837DnfVEgE2PU3O99iz63SHo0qNmi4miIQrZ7WvBnB3bf6bAnrmJkNwgb9QSOVpZlKUyHIoum46C4rixAr6UYzq/Eiyzf5XKrGBMlDT+gLdqPoPUyasAmbGVFsXIMObbzNVl9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6cn5d+zkJIrJIIQwnC6kqBf47NSf0oGt4INxtTwE/G4=;
 b=nAF9qO4p/JKhM4oo9j9Vq3+CuUECBTsjod4fTXEJf+ffjT8M3qrHq5HtBdqKP0+6GzbxQcuq7abx3PP1aqrizUsW8w8hL7Bt4J0LSPpvy7ICHSTSBCABC/WGR0QPwncJsOS6iKHW8CN/+qol1cpO1eT8RlAo4aMk5dSpUniRm7o=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM4PR12MB5279.namprd12.prod.outlook.com (2603:10b6:5:39f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Tue, 12 Oct
 2021 08:49:55 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::555a:2980:a5c2:8d29]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::555a:2980:a5c2:8d29%8]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 08:49:55 +0000
Subject: Re: [PATCH 2/4] drm/ttm: do not set NULL to debugfs dentry
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20211011190607.104618-1-nirmoy.das@amd.com>
 <20211011190607.104618-2-nirmoy.das@amd.com>
 <f98a7c4d-0d2c-4ae2-fbc2-e3085dfb3e8c@amd.com>
From: "Das, Nirmoy" <nirmoy.das@amd.com>
Message-ID: <6baaa89b-d441-84d4-1519-88eecd7b7afe@amd.com>
Date: Tue, 12 Oct 2021 10:49:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <f98a7c4d-0d2c-4ae2-fbc2-e3085dfb3e8c@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM6P191CA0002.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::15) To DM4PR12MB5136.namprd12.prod.outlook.com
 (2603:10b6:5:393::23)
MIME-Version: 1.0
Received: from [192.168.178.88] (217.86.110.202) by
 AM6P191CA0002.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.25 via Frontend Transport; Tue, 12 Oct 2021 08:49:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b530bdb-81ed-4216-a494-08d98d5d4387
X-MS-TrafficTypeDiagnostic: DM4PR12MB5279:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB52795ED29862F3F681D4A3088BB69@DM4PR12MB5279.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BD4zmKdUkBhzei7LNf37I8OpvMHi8/GSSXbq4RmYIeu5rwCzsQBpMhyC5lD5k5HmuLQqzv0A8Kl+HaI9WMvcoS6J2TJqeEDap/hXMFTr1ZX8hWWtgqmcl0VfCasroU2YdoYjWz5MI/9X7KeeUqQrWjwRm9U2dS+ijdA2GwHq6fkyzo98ZSeHM57DjxOk/1V/jTzQvWOIO6FylM5a+DeLirPN9FXq3l6+wfL17GC2TQhMmzY6XJiX9UViFOBc9IDBoDXIcJsJ6EPffkDCIcXvMhwEUXKioTsrR/NnJbMrxc1Pa/VBjHwP765L+1c2+OVbdzgVYGXYDTdy/gj3txcSaNLLH64hzKRgkcAmQLH4nAW5AyEXfFvxcuMfgoBZhvYssguQyH5j6xhnsCwgWiUwbNKgHyMBVGiJL0hWRoGzlMvkV8u/5HRBwbspwEdoAdMEtyD9ag3WNHtzb8ZO0dZhO9yPGNdin5CV8rWuaczpWc+wSA5Kups3rYeOD56UK3QGkHDVoCKeXtE4NgCz8LOOPYYmBUHWXseqBki2x6f/IzxLg5o6TeD5kz+pJtmJqkeUsSaEqI4BNni9PBqwTgeFHIRd5HsEfULcyxwiFCbjm4wQoi+c0EVthIfBmPEhEn2V/jU1r/PQyG3uQwLXGSdfEfe6BbZBtjbWuGp2yUNP3Fm+3Vpqk+Srm7SrxoppEOYfOOh0UI0e4ueqzHgnHfkyAWLM9nFeGDgrctThGv6NxtY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(508600001)(5660300002)(16576012)(66946007)(4326008)(6486002)(54906003)(316002)(66476007)(8676002)(8936002)(2616005)(36756003)(2906002)(83380400001)(66574015)(186003)(53546011)(31696002)(86362001)(956004)(38100700002)(26005)(31686004)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFFQdGhaMUVKRFZaNjcrbUtsQTZvNFc3Z2RaSnZEMkpSM2p6bEUycFJkanlM?=
 =?utf-8?B?RndDRFdHUzAvZkRscEEvNkJMOTliV3VRd3R2WkVFQUdueTA2dk5LWkovRlpi?=
 =?utf-8?B?WUpFRkVGNTlGZUd1T21FZ2owZEh6dXc1T3dUazNSSUErOUNaanBaSG9ZeWJR?=
 =?utf-8?B?bDQwSU85c0F3Q3VyblRiTXR0Z0dhODZaQlJzVVQybFJIMkZJcGJ1MU9Sem10?=
 =?utf-8?B?VFVuNjQraDBrZkp4UGYwYWdEeUVJVFd2MGlPVFBRdUQxYVBsUE00bk9hcWZ5?=
 =?utf-8?B?SHBOaEdkS2pYSTBmR3Uyb1RteGllNEdOVVFmY0NFK3VjdThRVVJMQ2RpNHRw?=
 =?utf-8?B?WDE5TlJ4OVpKL1JZL3lQeDNCOUoweVNMRWlJUEpML2RkaDFPMmlNcWxGTFlJ?=
 =?utf-8?B?UmViSlc0M2pOYklsYzlLbmlta3ZlcllnSEhvaThudDVmZG56S3k3WXAxOFo3?=
 =?utf-8?B?dGxMZUlvcFRxTnVxWDdDY3VmaURBbmhvQlc2MGVYSEFvbEVvcHRwOWMxc2Iv?=
 =?utf-8?B?ZnN5S1piWXhieXJONWdIYkN0bDdtTzh5b1JvdW85V0VocXlFWkM0b2RvRjRT?=
 =?utf-8?B?dFh3VEJiMStOUmRETCtTUldVZjc4aEhCMHZRdVY1QnhQcEtHZ2NUZURWSVhT?=
 =?utf-8?B?ak9udGFKa09QVS9VNUlEVGZCOEp6cUovVGdldCtNM2EvOWpyc1VQeFRhc3ls?=
 =?utf-8?B?VHhkbnAwS3J2TEhhbHl3am1FM2l2cHlrMC8ycDhGbjBMbnlMZjVhMXcwNjli?=
 =?utf-8?B?OHBlN0RkTDN4ZUJBaGNlbDVvZFBseHZvMlF6SGZlME5VeXhWeGhkK3ZmeVZQ?=
 =?utf-8?B?VC9YSVBwR3kvV1o1WHhYdFBldGh5bzFiTVQ5RkdybVF1M3B2Y0hMUVFnL3Bs?=
 =?utf-8?B?eXdJRytrT0tzeGRJL09ZWXRaOEJPbThaaTR5VGtRTkQ4ZjNROHJDUWYvSEt5?=
 =?utf-8?B?cmdBbkpyTFRMQ29uYTdiMGJkZFZ6ck93VmdMY2UrUnNBL280elBiKzdsNm1H?=
 =?utf-8?B?VnEwaHhreE0vcDZVMUxLdnA1VmNLMkZ6U0t6M2l1YTEybmthc2JuSmt2d2Yy?=
 =?utf-8?B?UDMySC9mNkFDV29GeVBBTkd2SjdtdEhEbTZ6V2EvRFJIR0xVN2EvbXBMRE95?=
 =?utf-8?B?V1YrbjY5dW9sQWtpT1RnK0VpdnpWS05qTWVLYWhLdlA4Sy9ZaWJhbFJROCtO?=
 =?utf-8?B?TnpmRytxRTJUdEdCdXExLzYwNURNQnR4MStIUlI1OHFPTmU3YkZpSmpMWUtq?=
 =?utf-8?B?VTFBRGwrbHFXMTFtaU55Tnk0Tmo3dVhOZVZQNTJBSWVTNjFtRTVYZnZBZWVn?=
 =?utf-8?B?b2puUmtpZk9WcVBia1hHUFNsWHhaZnI2NHJBbTZOcjNTZ3VXaUlNekU4UWlE?=
 =?utf-8?B?bURNZElaVFpXSSszYVpZQnFreDYwS1BjSzJ4cjZiTis4eFNCQVJTSlFhTk05?=
 =?utf-8?B?cjBRT1pPb0wyanFvK3dmeUJMMUx3ay9hNG9lb3VzQklvdmRsaDUzTWUzUWRj?=
 =?utf-8?B?bWVnQ0x1aXd1U2paOEErUnYzMGVpVkc4YWQyOTh0c21MNWFUcUFxb1dxL096?=
 =?utf-8?B?b0h1bm1LeW1YekZUQjhXRGdZWWtxSHo0ZnNIYWhHM1d4UjhVRmhlelArdTZS?=
 =?utf-8?B?RnBOSFBxQWk4bitGOG1qNG9WMjJFN1dMZFpIQy96YWJEQkt1NWpZZmJkamZo?=
 =?utf-8?B?a0VtdnRvSWxJUmJFRnE1QVhSbUQ0dERsTFRIbTZETHJEcjNNcWdDRXZDS3Ft?=
 =?utf-8?Q?jJBx25mFQKibAhoNMe3iXwgM8Y4zqM0Bf8JwYCj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b530bdb-81ed-4216-a494-08d98d5d4387
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 08:49:55.5109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3j5oSQvg9pgPYiNMUWvz2GxmEptyUvttDX8XFcWqum4txX7/GxlxbXsU9+1Wm6ug+jhNDICeQ7ZEdnMJn8Ihaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5279
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


On 10/12/2021 9:09 AM, Christian König wrote:
> Am 11.10.21 um 21:06 schrieb Nirmoy Das:
>> For debugfs directory, it is recommended to save the result
>> and pass over to next debugfs API for creating debugfs
>> files/directories. Error conditions are handled by debugfs APIs.
>>
>> CC: Christian Koenig <christian.koenig@amd.com>
>> CC: Huang Rui <ray.huang@amd.com>
>> CC: David Airlie <airlied@linux.ie>
>> CC: Daniel Vetter <daniel@ffwll.ch>
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
>
> Please also add a comment to ttm_debugfs_root that this can also be an 
> ERR_PTR and should not be dereferenced.


Thanks, I will resend with a comment to ttm_debugfs_root.


Nirmoy

>
> Apart from that looks good to me.
>
> Christian.
>
>> ---
>>   drivers/gpu/drm/ttm/ttm_device.c | 6 +-----
>>   1 file changed, 1 insertion(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_device.c 
>> b/drivers/gpu/drm/ttm/ttm_device.c
>> index be24bb6cefd0..225ae6b0b4c2 100644
>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>> @@ -77,9 +77,6 @@ static int ttm_global_init(void)
>>       si_meminfo(&si);
>>
>>       ttm_debugfs_root = debugfs_create_dir("ttm", NULL);
>> -    if (IS_ERR(ttm_debugfs_root)) {
>> -        ttm_debugfs_root = NULL;
>> -    }
>>
>>       /* Limit the number of pages in the pool to about 50% of the total
>>        * system memory.
>> @@ -108,8 +105,7 @@ static int ttm_global_init(void)
>>       debugfs_create_atomic_t("buffer_objects", 0444, ttm_debugfs_root,
>>                   &glob->bo_count);
>>   out:
>> -    if (ret && ttm_debugfs_root)
>> -        debugfs_remove(ttm_debugfs_root);
>> +    debugfs_remove(ttm_debugfs_root);
>>       if (ret)
>>           --ttm_glob_use_count;
>>       mutex_unlock(&ttm_global_mutex);
>> -- 
>> 2.32.0
>>
>
