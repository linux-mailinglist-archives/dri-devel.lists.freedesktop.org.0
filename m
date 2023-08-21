Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB6B78301E
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 20:17:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A93A10E111;
	Mon, 21 Aug 2023 18:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::619])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB33C10E111;
 Mon, 21 Aug 2023 18:17:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DKP8CgoFZxrcbLrhNvR19pWVuktQkQPhR/o13SoYXIKgLvTfqp0eiBsSgp6zcaNJ3Cxp5xrl9q85QKzjjnDuQhPjBGO01N7KCVMU2fbeSvuDM0R4gcAOjbuK1KgR3IlvoEDewsfzcvF/aO8KQE+Lp0DCQ9IszfupMasWDy5Na06pDenQDfmPnZ58228LLJR6BR9KKU/2b2MfB9JnokL4go72y91RmJt2vlIaRfopuQu6NiceAhklgpNJM5tWrMVrUuYn6BfV6Bb/vBdkUN+RBBD0gUUK0slMzxP0oZQv3g+PXv2Bfb51EyjrtKJX9jZEdlr9eTe/Zun8Ki2VMxeD7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYys7ee6K78uJ4ZYJ9Arec6AQuk5adHfwVNDLTAIajU=;
 b=b1j7f2Fm/IsQv6DKZwY5+oKiBTD4uB9+raKKhvrAs3s/fRpF38DlH9qWZ5I4MoMYEXlA/ONJyYUmJ3goxbnjutCVGR2Gbc7Rm6XkRLEek1mHdgKqXPmZpSZOs65ZTSiNdbX6wG/wS9gchwoZJDCKQm1qzokyqCDprHL8r1PtqvCVJ9fdPA76uUprYd0Nrw8RM5Dr3/K+P65kpGYOcw1WEJYmPFXlokRKmPcHRS6mUH0CcNpxe5mD8OG8TKIuC1jxupQvw0bf6QnD0RVeJpLeONiRWn9KdtpK2zBs/Y2shT6naJoTbjc2+h5+B4pezQ5x0xu4xrkI0jnbtbhIJFVrAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYys7ee6K78uJ4ZYJ9Arec6AQuk5adHfwVNDLTAIajU=;
 b=SQTz4Sl1L4d8NQJqF1toaZ7CG5ObBYi0yxajSZZZsLZcmXNaDFY5tsBdR3EoxQgH3HIkfHa3j/Nw7ArfpKpwyGgcHHF+gX+4Kq+7wqilpAVT8Bvs0ND5AnzIuA9EHqSsc4TuYyvI1+78x2CobFepoNxokdevVOM8xCc0tUJFPYo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by SN7PR12MB7935.namprd12.prod.outlook.com (2603:10b6:806:349::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 18:17:10 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6787:e196:b8dc:93a1]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6787:e196:b8dc:93a1%7]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 18:17:10 +0000
Message-ID: <1ab95561-cfd2-f278-7dfd-fb35b00b7371@amd.com>
Date: Mon, 21 Aug 2023 23:46:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/4] drm/amdgpu: Explicitly add a flexible array at the
 end of 'struct amdgpu_bo_list' and simplify amdgpu_bo_list_create()
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>
References: <cover.1692524665.git.christophe.jaillet@wanadoo.fr>
 <5d52550a-92a1-55e7-69ad-92f18330ff48@amd.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <5d52550a-92a1-55e7-69ad-92f18330ff48@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0081.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::20) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|SN7PR12MB7935:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e993aeb-32a5-49ff-9c4a-08dba272d605
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y04ZHIk8Dk3aHCQI3Iy3ZDzHzexLUUgXvCHNEP44JuAP6lWequ01d10GhieC+W8FuiA/cDowxM1lNYVMZwUaZqdDlUjNFQw5OvCOkiKO5EOAW2h/t3/cOXUl61wTSgWIaFN0l6a9DRzFiYbmcUkJuCnCtIG/Sbz/dgJy0z8kN4QZM6GPWq9x4XGEG+vK2teUJVfqXeYAJpYvBaRatI6iYIvPDt0XdVdF6p4o0kWOH8Wlr3VkML12W2ssw2zZhSnkFIHNsn1XrVS0LAoifZVjT8ANcsRKW05rqleZNDkbEwoxAIEegOAZLr8kJi2ajE6WKF1SoL9wknKdBT9yY355Ti8GoH7ORTZtHM2F4SzH3I/aFl8I2jEgvGohvAnE5TFhLwKX0tCslHwBNqpug5eqA5uiXqd8qtFUmdtLT96l9wNXvd2MIPQxBa62epYfp4aXe2T7tWfb7bHRPySHUYSXv/EWLJiAaf7QVYny/7wR+NABaC16CoaNr7d2/WeYj17nJ1/DPVaT74ZNTaHHyEuez8s5i11elMwMTR610grpXo3O1YJt0RhQhCRTrsSv2GlivjJJH8n4Dj0KcdzcOWWtUCiHhRmCl8bGLjMozAPbaHp647JPdhd/sTu7rk1oGeVGdXSjktonBaZ/skFSBhX3RQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(186009)(1800799009)(451199024)(6636002)(66476007)(66556008)(316002)(66946007)(6512007)(110136005)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(6666004)(38100700002)(53546011)(6506007)(6486002)(83380400001)(2906002)(86362001)(31686004)(31696002)(5660300002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWsraWRieXhpZk5YREZkejZnQW5lUnVDRGpaNG9KN2JsV1FYZjFhOGhRU21x?=
 =?utf-8?B?WkwvSWg4d3pjVmsrZWorUW5iZzdvRmgvN2cxWkM5SzUxN201VjhmVUkzWWpS?=
 =?utf-8?B?U25lQnlEWHU3WlNYL3hXNm52S2pyb0x5RHUwUTAvZUg1a09SNjVNenBHcmdT?=
 =?utf-8?B?b1BWdzJ5NlpiM0ZrcWtudnJoZkp0UUgrMnkyOWxsc2RKeVJkaDhOTnZxUVFS?=
 =?utf-8?B?N2t5eDUxRjJmeEpVdjBxSks5eVhzeURwNThFamw2RW44RWsvajRTYVkrZ3Qv?=
 =?utf-8?B?UHRBZmZhTG45RnpmSDZhb3IvaGU2UUkxb29lTlhxY3dHUTZiL1VrdHJpbHBw?=
 =?utf-8?B?UVY2T0R0d0lsNWU0azYvaDA0SHhudjBaSm5qWmZrY1d0UW44NFphYU95TnhE?=
 =?utf-8?B?UWFtOElhUXcvbDNPanlNbDRqd2dYaFB6bW5CUlN4K0hGQ3BSWWZvemc3WlUw?=
 =?utf-8?B?ZGJUWUNBaFVzd3N6SFlUS2t1a2trRTR2b3NoNS8vbnBOYWVtVE5wVGhvWXpF?=
 =?utf-8?B?RFhodjNDbi80RHA0dkRWdjZSakIwdm9Wdis4TVkwbGN3K25TdDY4eGdyZ0NM?=
 =?utf-8?B?UklMaWJTc0RTOWY5SElwa0VrM0N4NGxabE02RGYrRHV3SjNCRGxyMGxMUmdS?=
 =?utf-8?B?VHZlbVRPR0JyNXNqcDJ5SHpCb0ZiSjhTSHpOQzlvV2k0aEJ0cnRWaEN4MWVH?=
 =?utf-8?B?QVNPdjJ1eU9sOGh2Mnd0STcvbW1WK0dSbGtKS2RGZ21OdllUOTY2R20yMld5?=
 =?utf-8?B?QU5xaC9YQlBteHFiKy96RHN5NjBsbmxJV3VDNGFsbHBLV3cxU01SZXZsZ0RD?=
 =?utf-8?B?SEJ5Z0hiTDdvZTdreVd1TWhrTkJpMUYrSlV1MlBsdCtRYUtUSkRPc0J6NTMr?=
 =?utf-8?B?QXl0RjR6c1NNR1FjWDEwaEZOdVBNQlRXNjIzUW9RdDEvYTc4cXp5L3VIdzVa?=
 =?utf-8?B?SHg3MDNkeFd3VFpnZGlXVFU2T2FnMzBKdzFwZ2VVbE5DMlVIeFlFMHd3b0lE?=
 =?utf-8?B?RlN5TS9VdThENkhKT3RQanVIQWNXU0U3VU5sRGVEMlkxTkJXZ2tKR1BNY3lU?=
 =?utf-8?B?Ykg2Y1FuRWdWdXhKYTBreWRXdjNJek54TmsrU3JuOUMvelZ1S2lCM04wNENC?=
 =?utf-8?B?TktCekVkWDhGT1hYUUVRbnJXMkdJUTkyWEtLN21ic1I3NFJJcVdnZ3Vucllk?=
 =?utf-8?B?ZXNuRzV4TXF2a0NiMXN1dkpUMDRQLy9DL2pyYi84Wk1ScWhXejVJa0VhcU1M?=
 =?utf-8?B?MVZ3M2N1eVRIazlxRkkrSlYyNElkbUJBNERFSG5oWXhmWHJXWDllT0JwQXVs?=
 =?utf-8?B?Yk9BWG50Vk5aOUVPNVliU1ZoelZhN2VUcUl2VkZFVGRER2NLZ2diUWVobGZY?=
 =?utf-8?B?TWJ2SGZoQmJwSnpYcVNZT3lxUUVQU3Bxd0pqaU1PQm81dkF5RHBlVlpGZlZs?=
 =?utf-8?B?UVBEa3M1LzRVa1lRaFhyWWdpK1ZNS05VTnYvczlRMFNxd0RDOFRvbHB0V2Nh?=
 =?utf-8?B?YXBYQlNUM2JENnNwcllzaFNJWXgzQ3ZBdGlrMStKcVJ6SEp2RWh4T1ZJZEs4?=
 =?utf-8?B?bFo0Y2o3Q3NxVjVJL0FZd2NIUzBsbC9KSmR2b0gyNW1BVElScUNUMjlHeW1y?=
 =?utf-8?B?RGlBTjBxOTlQMTdNbjBUYVpuWVFGM3hQUjR5NE5tZ1hvY3ZXamcxK0s4K1Zt?=
 =?utf-8?B?YjRhc2UyTzE2ZG43WDcyWStpT1hyV29IRk8zTFpQNzJhQkpXaXNKejZJTmJk?=
 =?utf-8?B?TzJ3VDJPRFdEM0dhcHR2akFuWk0vOUZRN3gwNWxjTEZUdHBzc1U1VnhGSnhB?=
 =?utf-8?B?cGI0eVNBRktTaGxmTDVTeVdFYk85U2g0RWw0V055blJNZGZLU0kzYzFIMGh2?=
 =?utf-8?B?Slo4bnlaSUlqSUYwS0lUbUlUVzdybmpBNnQ2eXRJakZwVUVCUnZUdExxMmFQ?=
 =?utf-8?B?aFpsT2VnVUdYOU5mVGlPeWxuNTVFYVM1QXI2MHAxUDZhRUpueHkvaHpZdjlx?=
 =?utf-8?B?V3pNL1ZGaHF3ai9mN25Xem1GNS9TakpMMUdYY01rRnpacE9rQWFHcWhyNVRG?=
 =?utf-8?B?OVpIU0dMTGUrT2FtVWN0WEsySG1paFhzbERkUUI0dG9BUnJBUHFjV0gvYWR4?=
 =?utf-8?Q?EKqpIfExlLcZ6i9JhuzTXeSNa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e993aeb-32a5-49ff-9c4a-08dba272d605
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 18:17:10.5805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ySkLLQn6DEQV07Zn4JkHqQpVCGaNfveM0RIE+vgaBSbQTkzDmvdcTYbwRi89wGApEGgfRlG/vUL10n7cJ3XeWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7935
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
Cc: Felix.Kuehling@amd.com, Xinhui.Pan@amd.com, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

I ran GLMark2, unigine heaven and Tomb Raider on steam. I didn't observe 
any issues.

Regards,
Arun.

On 8/21/2023 4:33 PM, Christian König wrote:
> Am 20.08.23 um 11:51 schrieb Christophe JAILLET:
>> This serie simplifies amdgpu_bo_list_create() and usage of the 'struct
>> amdgpu_bo_list'.
>
> Oh, yes please. That's something I always wanted to cleanup as well.
>
>> It is compile tested only.
>
> That bothers me a bit. Arun, Vitaly, Shashank can anybody with time 
> run a quick test on this? Preferable the IGT tests, but this just some 
> game should probably do as well.
>
> Apart from that looks good to me,
> Christian.
>
>>
>> Christophe JAILLET (4):
>>    drm/amdgpu: Explicitly add a flexible array at the end of 'struct
>>      amdgpu_bo_list'
>>    drm/amdgpu: Remove a redundant sanity check
>>    drm/amdgpu: Remove amdgpu_bo_list_array_entry()
>>    drm/amdgpu: Use kvzalloc() to simplify code
>>
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c | 15 ++-------------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h | 18 ++++++------------
>>   2 files changed, 8 insertions(+), 25 deletions(-)
>>
>

