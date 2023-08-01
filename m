Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6302076B8DB
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 17:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0646B10E40D;
	Tue,  1 Aug 2023 15:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2066.outbound.protection.outlook.com [40.107.244.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0622910E111;
 Tue,  1 Aug 2023 15:41:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VKTmRUlH7cDhH7ynHGBfgt3LW5553JpegGQMAvgepS2LsroVOuOxUAC3oIsTawLrFc67UBlelN5gW9hXRWJfqcTMz5AjnUfvTxgYWZUf7CvTk9pd+e75+NO5vb/ekxwwKH882jVLS11BuhxTPFEIoKpt9sSCHXlStznqjy7fE/j1rcIx6Wl8a7QktKnmGaQEvbe/D7Y6m3dbuuReFNM1cKxDJjcRAGzkD26pKgLcbOOy7WoNl6JLP0kv8XvUT33JtimxM4Bn1MrGReBLViuwqkAV4R5cdIydXUl5YUioxJaf6s3BBMvkfInLrClVLnSyjUyVDqvuuHjic2MYBFxCRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cc18luWCZl5vEpHP++az1cLPhb8GTa0L0KNtSYOQPT8=;
 b=hCZ/5oeUZcfS4qMtbqSJqDSNhkF8liHh3BGS1CeRzg07KQx1rioq7rRIWNnyOToTukMCAyvrK94qAP7SJnr6f7DShVpDJnjUq1Gnh8vm3iY/UBEd1+7wnIbC4gkF00rTDnsmJzUmxG3WxWn1ZUFDgFTO18TsbJ/wWl1fMkuIGdDl8F7LVOKpB6Z0mxiHhVixGHWjWmsbHFOvue09Mla1uKyBKIoGV0DQFDSCcH0gq97bgIuKVARLAe5SaoAmMK+SdelPRYvlvp2s+Lx83pJtGpJAxu9lwuJZfUnwvxuMX1fMD6GWzb5wlvBJpv6FTg9QOhdv8/glvuD39Ihq6zJn2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cc18luWCZl5vEpHP++az1cLPhb8GTa0L0KNtSYOQPT8=;
 b=1tcrKdSJQnzGxLBLKn8nGLfjmckXALEKCqcPoZ5WSI5CQo5gntpKNb1SB8CVziOjs+Zq7wqoLLKxxSjjbZmgr5WVphx9X8qdpZ778M+xrIktPi+vJD2HmDFB5S/CKO6jtgX45XxkhwPZTZ2w2pu4v0KOc6auBBb5XtzwrhBfg6I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL1PR12MB5825.namprd12.prod.outlook.com (2603:10b6:208:394::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Tue, 1 Aug
 2023 15:41:37 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6631.026; Tue, 1 Aug 2023
 15:41:37 +0000
Message-ID: <fae0191c-5b67-63ac-8d87-f8d761df9614@amd.com>
Date: Tue, 1 Aug 2023 17:41:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next] drm/amdgpu: Remove a lot of unnecessary ternary
 operators
Content-Language: en-US
To: "Limonciello, Mario" <mario.limonciello@amd.com>,
 Ruan Jinjie <ruanjinjie@huawei.com>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 evan.quan@amd.com, srinivasan.shanmugam@amd.com, wangxiongfeng2@huawei.com,
 Hawking.Zhang@amd.com, James.Zhu@amd.com,
 Veerabadhran.Gopalakrishnan@amd.com, saleemkhan.jamadar@amd.com,
 le.ma@amd.com, tao.zhou1@amd.com, Jane.Jian@amd.com, Hongkun.Zhang@amd.com,
 leo.liu@amd.com, lijo.lazar@amd.com, Lang.Yu@amd.com, ruijing.dong@amd.com,
 trix@redhat.com, Suresh.Guttula@amd.com, David.Wu3@amd.com,
 sonny.jiang@amd.com, wenjing.liu@amd.com, Jun.Lei@amd.com,
 mripard@kernel.org, tzimmermann@suse.de, drv@mailo.com, Shiwu.Zhang@amd.com,
 aleksei.kodanev@bell-sw.com, ye.xingchen@zte.com.cn,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230731132610.2675314-1-ruanjinjie@huawei.com>
 <75d409e6-5ab8-97e8-44c3-a71e5ff1724d@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <75d409e6-5ab8-97e8-44c3-a71e5ff1724d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BL1PR12MB5825:EE_
X-MS-Office365-Filtering-Correlation-Id: 196d03e8-fdd8-4cae-7341-08db92a5cac0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4zLvTnto1xEveshgTveejwrsPM0AIs7KkA0nQXOC6McjWj700/U5IkT3h3inFm9f+hkoVqL18n/47AucUdlWIG9U/xdPjA8BF5H61Y8yeA3dQCXSmQrfrv6Sbkc21PplH4vxz+/sUoL7sxVCdxaGD3Du9K3gYnn0lSZy0fu4p5/OC7o28k05BWFr6ZF8fBXg8vpKw0lXkAfJkhZX219LWh463bpgKkWhEVfZHJg/H8QbhPbzYs8q44Z1COVFc/d4M+1i9XX0Zd5AUjgGYpYsAqkt0+CsWN7gPorreDrhNQrPSTuAhAcq6SstXX08uBQE2NzI9uZ1o/qJYrxZ0AGQ9T7Dstcq3fb7S/r1QiJIrShjOObT4C/6dV+gHiGDhMT3YX3Ne0U1sYmadN++BeZhHnqvBw83tNKsIfIdyNdFbBJxPqzdxPauSraI5NwU2dSbE8TiXkhP9BfPNxTmiTQN3hPAlLnO8ePnpTOdOoQULHbtnHFBtl7r7NP+PDV4etcPl5Rl4NwT/pq1eeybn4TbZZKGmllGbTG2gd9cd0h6uegh3+5PatGWiVjvM4HDHf4Mxw+FdIvfh9O3jAIH8cdb6s1AH+exoasIbcMT9XBmNzZiqnGH85glBnWKJ0DJJTMzbPRo9t0SgGJ4WvVHkpfu1BYQz9aNPKiFU1LE+h8J5XM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(451199021)(66556008)(66946007)(66476007)(2906002)(110136005)(31686004)(5660300002)(30864003)(41300700001)(316002)(7416002)(2616005)(6486002)(6666004)(8936002)(6506007)(8676002)(186003)(53546011)(83380400001)(921005)(478600001)(36756003)(38100700002)(6512007)(31696002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RU1CNFhTSGltMkRwMlV5NXFkVHJUUUcrTWs0S1VyaTQ1V2Z3OFNjRUQ4d2Vo?=
 =?utf-8?B?emJoVWlXaGR4VUliSzRjckNIVEFGNWtNMlNiUUZxMGRvWWh4d1dEemJ1UmIx?=
 =?utf-8?B?QU5KeXM4L2ZYNGtiSG8rOVRUaFdkVzNqd210dDV4QU5JcWxrMkNSYmNYQitX?=
 =?utf-8?B?dk02RlY5aVByMzF0M0M3TTRkTmJXdk9TMmxhYU5Dd3BJbk5MNjNzcUVsTWR4?=
 =?utf-8?B?ZW96YXdZeXlySWJpSkNLOXRkdUhDWTJQNWYwVHQzZG1xVUtKdHpJL2U2MmZX?=
 =?utf-8?B?ZVA1SzArNDE2d1RVcjB1cEh2TVQvY1Y0d0xYSkl5elB0cXIxZTc5eUVyYnYr?=
 =?utf-8?B?OHhsbmlwdFhzRCswayt2QkVUdVZrejZWYkVmRmdrNC9OUVBmTkRiL1dlNFdp?=
 =?utf-8?B?N2dHeDNoTEV0ck1sby80cFJsc1hhTXM3NU16VmtEUE8xV0NDNFFDemRPemhx?=
 =?utf-8?B?Nk9iVW9kbVNGcHUzRDc2eVJpaFlhRkFKNkNxeUZTZlg3OVhLNEs2b2tZaEJk?=
 =?utf-8?B?MU05QWtsNGJIeHNXdzU0dXl6Mm40dWYrTHhid3Ezbkl1UlY1SnNML2ZzQXdD?=
 =?utf-8?B?YzJOdG5DczdVNDJxRlRoRUlTUktGV3lEVHJmVFhheVFtM1U3YkUrN1QxM0tW?=
 =?utf-8?B?N0RKbDVQMlpmQ2N1R3A0dlVmbGE0VFdGN29ENjhhbElVNmtuUGJlVXk1bTY3?=
 =?utf-8?B?MlI4UzlORFhmZlNkZ0ZTWnltb1ZCMGh2TW4ycnU4MEJPYUM5cDFBaDlzOVRU?=
 =?utf-8?B?bi8zNmk4UWhrQXQ0dERsNWgzejQwTm5GalJBNjBmNWhRQlNZTzRkdExBb0Y5?=
 =?utf-8?B?MEc0UHh6emhaWlFYd0NHTmJLcTUyT08zTXhTKytNdURqQlEwR3NGcXhxZmxE?=
 =?utf-8?B?WkdNcUtRSG53OGN3M3dhN2k3WlV1SWxxVlNyUzRoVU9PSzlJbGxzRG5uWWor?=
 =?utf-8?B?aUtmQ0dsdlVGY2h5NTBBR0xFWjVGb3lUNXkyaUhJTlVDZVplWnVxM3dRcjZ1?=
 =?utf-8?B?OEh6azJPeTNSN1lnWUtlRFk2bEd1SVVnc2t6R1RhYWNmaHIwQ3o2L24zdDd0?=
 =?utf-8?B?M1BkVjdwaWtQUkxOc0N6bVNqclVzWGpLT2tXUWpydXZFYVZNVDFMN0txMTFw?=
 =?utf-8?B?VHI4YXRCeHQ0OHd4eis1Uk1sZEMrZUJ1K0kwb0xWR0dFUWlzVTc0bS9WMGlU?=
 =?utf-8?B?bEEvamN6Y3g0OUJ5MkRqTTdhSTYyM1RaZDdBMTROczMvUmoxV3c0UGwyMlZN?=
 =?utf-8?B?aVdHbW9rQTJMcXcxd2oyMGhLdnhqVURWZy9Zc2M0cytCTEVyQzRYSW80SWp2?=
 =?utf-8?B?N3JGVWRlVmRNdGpuUkIrV0N4NkpWSGQyTURsOC9JSURQbGQ3L0dkQ2hISHNT?=
 =?utf-8?B?MkhQbTVHOGI2NURvQ3kxOVNMYU1EZDIzZEN2UTVuaVpHN3kzL3hHZWpEWkVp?=
 =?utf-8?B?T2svMTFxVm90UVF3dVdKenIwQnlPQTRqNTdTb0dJZDFjcWJ1bnlHZ2xrZDMz?=
 =?utf-8?B?L3pNSFRHVHRvYlpNNXRORzZ3cXhYKzYrN0FUOHZxWXUvOGJ1ZGtMM0dxclo3?=
 =?utf-8?B?VFNPeWd2bFd5TEVkUVVkcm9Wd0ZDVW1ENVNURmRmVG52VTRuamRYT2E4a2Q3?=
 =?utf-8?B?RTlBM2ZiKzlldk5WcXZwckd1ZFpDY2FJOTd6ZTJkSnV0SUg4dU5pRVYreEl0?=
 =?utf-8?B?Tkt4Zm5MV05ORlorVjhPTHd0MnRhWFFZMm5HM2pwWVg4Z3doSFFSWFVocWc1?=
 =?utf-8?B?T0lOaWZ4eGhNa3RQZWsvaXRHbGpwVVhuQ3RhM3piRVlvNEd1WFh5WUYrbmhp?=
 =?utf-8?B?Wi9BZnRjSDFTbUlaTElINzZ6WUNwdzhJQWllWWNwUDVEeS82SW9DT2JuVHV6?=
 =?utf-8?B?Z2RmVjdBa0ZQbzE5NmI4TGsvSU5yREV3RnNGcWRlNVU5dGlKUngxNUFqMXd6?=
 =?utf-8?B?RUk4S2p4dHg0bUg1T01OTVZrUFVyRUxlUWdXcDRZbE45WlBwSjNaOXZCQ0Ro?=
 =?utf-8?B?enFuelNsb2kzU2FFUG1oUUoveThyYWVIQ2xjOGZ5Z3pEUnU3bm5GUnNKRGVl?=
 =?utf-8?B?MHBHbGZFaFYxOG9DM3lTQzVzU1FOdFJ6MC93ZytCdGVFK2JtUlhGZld0UXdF?=
 =?utf-8?B?Vm5tTFFZWWRzWFR2aUlYUlJJVnZHNGNzYVE4M05sMDEvcVZKOUc2NVBGZGYv?=
 =?utf-8?Q?xehFlSce6jUzsAgDEbyr1FM6rp+ysWaIFedEbzz2jyE7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 196d03e8-fdd8-4cae-7341-08db92a5cac0
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 15:41:37.5771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DXPNd0HQ9ICxiYoMvTv2lLGF2UxKuFMX2MyhVXlJBNeAgyHG5W5f9J6IMG3mo1xw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5825
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

Am 31.07.23 um 18:14 schrieb Limonciello, Mario:
>
>
> On 7/31/2023 8:26 AM, Ruan Jinjie wrote:
>> Ther are many ternary operators, the true or false judgement
>> of which is unnecessary in C language semantics.
> s/Ther/There/
>
> Unnecessary; sure.  But don't they improve the readability quite a bit?

No, not at all. Stuff like that is very frowned on upstream.

Christian.

>
>>
>> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c       |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c         |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c         |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c       |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c          |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c          |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c        |  2 +-
>>   .../drm/amd/display/dc/dce/dce_link_encoder.c  |  4 +---
>>   .../drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |  6 +++---
>>   .../amd/pm/powerplay/hwmgr/smu7_powertune.c    |  2 +-
>>   .../drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  | 18 +++++++-----------
>>   .../amd/pm/powerplay/smumgr/polaris10_smumgr.c |  2 +-
>>   .../drm/amd/pm/powerplay/smumgr/vegam_smumgr.c |  7 +++----
>>   13 files changed, 23 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
>> index b582b83c4984..38ccec913f00 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
>> @@ -460,7 +460,7 @@ bool amdgpu_get_bios(struct amdgpu_device *adev)
>>       return false;
>>     success:
>> -    adev->is_atom_fw = (adev->asic_type >= CHIP_VEGA10) ? true : false;
>> +    adev->is_atom_fw = adev->asic_type >= CHIP_VEGA10;
>>       return true;
>>   }
>>   diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
>> index 79791379fc2b..df4440c21bbf 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
>> @@ -479,7 +479,7 @@ static int jpeg_v3_0_set_clockgating_state(void 
>> *handle,
>>                         enum amd_clockgating_state state)
>>   {
>>       struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> -    bool enable = (state == AMD_CG_STATE_GATE) ? true : false;
>> +    bool enable = state == AMD_CG_STATE_GATE;
>>         if (enable) {
>>           if (!jpeg_v3_0_is_idle(handle))
>> diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
>> index a707d407fbd0..3eb3dcd56b57 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
>> @@ -626,7 +626,7 @@ static int jpeg_v4_0_set_clockgating_state(void 
>> *handle,
>>                         enum amd_clockgating_state state)
>>   {
>>       struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> -    bool enable = (state == AMD_CG_STATE_GATE) ? true : false;
>> +    bool enable = state == AMD_CG_STATE_GATE;
>>         if (enable) {
>>           if (!jpeg_v4_0_is_idle(handle))
>> diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c 
>> b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
>> index ce2b22f7e4e4..153731d6ce8b 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
>> @@ -785,7 +785,7 @@ static int jpeg_v4_0_3_set_clockgating_state(void 
>> *handle,
>>                         enum amd_clockgating_state state)
>>   {
>>       struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> -    bool enable = (state == AMD_CG_STATE_GATE) ? true : false;
>> +    bool enable = state == AMD_CG_STATE_GATE;
>>       int i;
>>         for (i = 0; i < adev->jpeg.num_jpeg_inst; ++i) {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
>> index b76ba21b5a89..9b662b105cc1 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
>> @@ -2095,7 +2095,7 @@ static int vcn_v3_0_set_clockgating_state(void 
>> *handle,
>>                         enum amd_clockgating_state state)
>>   {
>>       struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> -    bool enable = (state == AMD_CG_STATE_GATE) ? true : false;
>> +    bool enable = state == AMD_CG_STATE_GATE;
>>       int i;
>>         for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
>> index 6089c7deba8a..7c486745bece 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
>> @@ -1918,7 +1918,7 @@ static int vcn_v4_0_wait_for_idle(void *handle)
>>   static int vcn_v4_0_set_clockgating_state(void *handle, enum 
>> amd_clockgating_state state)
>>   {
>>       struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> -    bool enable = (state == AMD_CG_STATE_GATE) ? true : false;
>> +    bool enable = state == AMD_CG_STATE_GATE;
>>       int i;
>>         for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c 
>> b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
>> index 550ac040b4be..e62472e6e7b3 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
>> @@ -1287,7 +1287,7 @@ static int 
>> vcn_v4_0_3_set_clockgating_state(void *handle,
>>                         enum amd_clockgating_state state)
>>   {
>>       struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> -    bool enable = (state == AMD_CG_STATE_GATE) ? true : false;
>> +    bool enable = state == AMD_CG_STATE_GATE;
>>       int i;
>>         for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
>> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c 
>> b/drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c
>> index fa314493ffc5..e4d65de2d0bb 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c
>> +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c
>> @@ -941,9 +941,7 @@ bool 
>> dce110_link_encoder_validate_output_with_stream(
>>       break;
>>       case SIGNAL_TYPE_EDP:
>>       case SIGNAL_TYPE_LVDS:
>> -        is_valid =
>> -            (stream->timing.
>> -                pixel_encoding == PIXEL_ENCODING_RGB) ? true : false;
>> +        is_valid = stream->timing.pixel_encoding == PIXEL_ENCODING_RGB;
>>       break;
>>       case SIGNAL_TYPE_VIRTUAL:
>>           is_valid = true;
>> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c 
>> b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
>> index 1cb402264497..8c73016d2d17 100644
>> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
>> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
>> @@ -904,7 +904,7 @@ static int smu7_setup_dpm_tables_v1(struct 
>> pp_hwmgr *hwmgr)
>>                       dep_sclk_table->entries[i].clk;
>> data->dpm_table.sclk_table.dpm_levels[data->dpm_table.sclk_table.count].enabled 
>> =
>> -                    (i == 0) ? true : false;
>> +                    i == 0;
>>               data->dpm_table.sclk_table.count++;
>>           }
>>       }
>> @@ -919,7 +919,7 @@ static int smu7_setup_dpm_tables_v1(struct 
>> pp_hwmgr *hwmgr)
>> data->dpm_table.mclk_table.dpm_levels[data->dpm_table.mclk_table.count].value 
>> =
>>                               dep_mclk_table->entries[i].clk;
>> data->dpm_table.mclk_table.dpm_levels[data->dpm_table.mclk_table.count].enabled 
>> =
>> -                            (i == 0) ? true : false;
>> +                            i == 0;
>>               data->dpm_table.mclk_table.count++;
>>           }
>>       }
>> @@ -1833,7 +1833,7 @@ static void smu7_init_dpm_defaults(struct 
>> pp_hwmgr *hwmgr)
>>       data->enable_tdc_limit_feature = true;
>>       data->enable_pkg_pwr_tracking_feature = true;
>>       data->force_pcie_gen = PP_PCIEGenInvalid;
>> -    data->ulv_supported = hwmgr->feature_mask & PP_ULV_MASK ? true : 
>> false;
>> +    data->ulv_supported = hwmgr->feature_mask & PP_ULV_MASK;
>>       data->current_profile_setting.bupdate_sclk = 1;
>>       data->current_profile_setting.sclk_up_hyst = 0;
>>       data->current_profile_setting.sclk_down_hyst = 100;
>> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c 
>> b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c
>> index 21be23ec3c79..d6eeef3c58f7 100644
>> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c
>> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c
>> @@ -1103,7 +1103,7 @@ int smu7_enable_smc_cac(struct pp_hwmgr *hwmgr)
>>           PP_ASSERT_WITH_CODE((0 == smc_result),
>>                   "Failed to enable CAC in SMC.", result = -1);
>>   -        data->cac_enabled = (0 == smc_result) ? true : false;
>> +        data->cac_enabled = smc_result == 0;
>>       }
>>       return result;
>>   }
>> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c 
>> b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
>> index c51dd4c74fe9..dfb9573e3f55 100644
>> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
>> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
>> @@ -135,13 +135,12 @@ static void 
>> vega10_set_default_registry_data(struct pp_hwmgr *hwmgr)
>>       }
>>         data->registry_data.clock_stretcher_support =
>> -            hwmgr->feature_mask & PP_CLOCK_STRETCH_MASK ? true : false;
>> +            hwmgr->feature_mask & PP_CLOCK_STRETCH_MASK;
>>   -    data->registry_data.ulv_support =
>> -            hwmgr->feature_mask & PP_ULV_MASK ? true : false;
>> +    data->registry_data.ulv_support = hwmgr->feature_mask & 
>> PP_ULV_MASK;
>>         data->registry_data.sclk_deep_sleep_support =
>> -            hwmgr->feature_mask & PP_SCLK_DEEP_SLEEP_MASK ? true : 
>> false;
>> +            hwmgr->feature_mask & PP_SCLK_DEEP_SLEEP_MASK;
>>         data->registry_data.disable_water_mark = 0;
>>   @@ -150,7 +149,7 @@ static void 
>> vega10_set_default_registry_data(struct pp_hwmgr *hwmgr)
>>       data->registry_data.fw_ctf_enabled = 1;
>>         data->registry_data.avfs_support =
>> -        hwmgr->feature_mask & PP_AVFS_MASK ? true : false;
>> +        hwmgr->feature_mask & PP_AVFS_MASK;
>>       data->registry_data.led_dpm_enabled = 1;
>>         data->registry_data.vr0hot_enabled = 1;
>> @@ -1375,8 +1374,7 @@ static int 
>> vega10_setup_default_dpm_tables(struct pp_hwmgr *hwmgr)
>>                           dep_mm_table->entries[i].eclk) {
>> dpm_table->dpm_levels[dpm_table->count].value =
>>                       dep_mm_table->entries[i].eclk;
>> - dpm_table->dpm_levels[dpm_table->count].enabled =
>> -                    (i == 0) ? true : false;
>> + dpm_table->dpm_levels[dpm_table->count].enabled = i == 0;
>>               dpm_table->count++;
>>           }
>>       }
>> @@ -1391,8 +1389,7 @@ static int 
>> vega10_setup_default_dpm_tables(struct pp_hwmgr *hwmgr)
>>                           dep_mm_table->entries[i].vclk) {
>> dpm_table->dpm_levels[dpm_table->count].value =
>>                       dep_mm_table->entries[i].vclk;
>> - dpm_table->dpm_levels[dpm_table->count].enabled =
>> -                    (i == 0) ? true : false;
>> + dpm_table->dpm_levels[dpm_table->count].enabled = i == 0;
>>               dpm_table->count++;
>>           }
>>       }
>> @@ -1405,8 +1402,7 @@ static int 
>> vega10_setup_default_dpm_tables(struct pp_hwmgr *hwmgr)
>>                           dep_mm_table->entries[i].dclk) {
>> dpm_table->dpm_levels[dpm_table->count].value =
>>                       dep_mm_table->entries[i].dclk;
>> - dpm_table->dpm_levels[dpm_table->count].enabled =
>> -                    (i == 0) ? true : false;
>> + dpm_table->dpm_levels[dpm_table->count].enabled = i == 0;
>>               dpm_table->count++;
>>           }
>>       }
>> diff --git 
>> a/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c 
>> b/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
>> index e7ed2a7adf8f..ff6b563ecbf5 100644
>> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
>> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
>> @@ -1888,7 +1888,7 @@ static int 
>> polaris10_populate_avfs_parameters(struct pp_hwmgr *hwmgr)
>> (avfs_params.ucEnableGB_VDROOP_TABLE_CKSOFF << 
>> BTCGB1_Vdroop_Enable_SHIFT) |
>> (avfs_params.ucEnableGB_FUSE_TABLE_CKSON << 
>> AVFSGB0_Vdroop_Enable_SHIFT) |
>> (avfs_params.ucEnableGB_FUSE_TABLE_CKSOFF << 
>> AVFSGB1_Vdroop_Enable_SHIFT);
>> -        data->apply_avfs_cks_off_voltage = 
>> (avfs_params.ucEnableApplyAVFS_CKS_OFF_Voltage == 1) ? true : false;
>> +        data->apply_avfs_cks_off_voltage = 
>> avfs_params.ucEnableApplyAVFS_CKS_OFF_Voltage == 1;
>>       }
>>       return result;
>>   }
>> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c 
>> b/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c
>> index 7d024d3facef..34c9f59b889a 100644
>> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c
>> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c
>> @@ -295,9 +295,8 @@ static int vegam_process_firmware_header(struct 
>> pp_hwmgr *hwmgr)
>>     static bool vegam_is_dpm_running(struct pp_hwmgr *hwmgr)
>>   {
>> -    return (1 == PHM_READ_INDIRECT_FIELD(hwmgr->device,
>> -            CGS_IND_REG__SMC, FEATURE_STATUS, VOLTAGE_CONTROLLER_ON))
>> -            ? true : false;
>> +    return 1 == PHM_READ_INDIRECT_FIELD(hwmgr->device,
>> +            CGS_IND_REG__SMC, FEATURE_STATUS, VOLTAGE_CONTROLLER_ON);
>>   }
>>     static uint32_t vegam_get_mac_definition(uint32_t value)
>> @@ -1660,7 +1659,7 @@ static int 
>> vegam_populate_avfs_parameters(struct pp_hwmgr *hwmgr)
>>                   (avfs_params.ucEnableGB_FUSE_TABLE_CKSON << 
>> AVFSGB0_Vdroop_Enable_SHIFT) |
>>                   (avfs_params.ucEnableGB_FUSE_TABLE_CKSOFF << 
>> AVFSGB1_Vdroop_Enable_SHIFT);
>>           data->apply_avfs_cks_off_voltage =
>> -                (avfs_params.ucEnableApplyAVFS_CKS_OFF_Voltage == 1) 
>> ? true : false;
>> +                avfs_params.ucEnableApplyAVFS_CKS_OFF_Voltage == 1;
>>       }
>>       return result;
>>   }

