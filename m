Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAE1561F82
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 17:41:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF6010E5A5;
	Thu, 30 Jun 2022 15:41:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2055.outbound.protection.outlook.com [40.107.212.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B1410E5A5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 15:41:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XRRjUKjNFxmtnrimdLwThjfQmEnRkSLpcIhAhivt0EwaY+gpSGwifT9oxFikWvWmVE0AJPFuCsFMh6ieb7CmMJdx8j9192vgbDBbWK/XjZabT908idcqGHx5bibI0KdnHm0DAH5CZHfcp7aQcbbnpxJG1ETQ7MNdlibQYN9/gjbGYZy102cT+B8EngORpltBdhyL+mq8dTYGKG/FzJKA8nRZzabiRgovDkNbF2s1k57ClgzGdkZuJN6/8i9mwcK/WUUAFkM+uxKQOrrECbremGMS1UULaZkQGixsb142FVcSDI/kLHHlYSpy7K7OMA3UQ0lb1tsFPngizU8QIi75hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGpFuOPq3CiY8XAlngDLZbjzsjY3rB/GNsrrQkp0Vs4=;
 b=L32AaVqHxtpx46ZVt4ytFuZViIhen41xVkuMPz4sSeJSliN9LI87iU/q6UYGyEU+LIy/kidcW9jbnSJ1WBVxgJl6efdrmn2+9o0M4v+1iguGEP9aYWJI9q0V8CWsdir/lcPc0QYzCMbVMKJ9GH2asmPJoAjQ4uwd95faHZFSDchLw1OEfd1ANvSa0++TN8vu/QeqiJc8sqE+mDrd2zjQO6UcBVyz/GhaB5BrQamXKCfwSpRoH+dcXg5nH9eeE5UIvIoLfyrWD1q5mH6B1NJGK5kAKXxt2jq1wWMF1e84ndir9PVHHBIpaGhFUKZCI/mC1C5SW/Bft5n3yxnaqfHnVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGpFuOPq3CiY8XAlngDLZbjzsjY3rB/GNsrrQkp0Vs4=;
 b=a+lGMtXK0i1L+cHkItqixCM6zW5VcNyi/5d7IS544TBFQhFZF3jsVBPTOkcHzfmHesGMsgI7dFVhtaMsZN4CNT9961F7UF7/oCS46NM8IkN4l6YNWLvG58JCnhUhHKzPeE8yGzDumOZ7L40262CTQyovgQjqqd/EvtpWuzs7aC0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB2844.namprd12.prod.outlook.com (2603:10b6:5:45::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 30 Jun
 2022 15:41:43 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5395.014; Thu, 30 Jun 2022
 15:41:43 +0000
Message-ID: <726ae6db-2b39-9593-2fc4-4f482e7db583@amd.com>
Date: Thu, 30 Jun 2022 17:41:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1] Fix: SYNCOBJ TIMELINE Test failed.
Content-Language: en-US
To: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <20220629060236.3283445-1-jesse.zhang@amd.com>
 <8499b1f1-cd39-5cb4-9fac-735e68393556@amd.com>
 <DM4PR12MB5152BA76985C98A0AAB033E2E3BA9@DM4PR12MB5152.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <DM4PR12MB5152BA76985C98A0AAB033E2E3BA9@DM4PR12MB5152.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR0402CA0020.eurprd04.prod.outlook.com
 (2603:10a6:203:90::30) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea2a4f5b-304d-4187-c15c-08da5aaf07f8
X-MS-TrafficTypeDiagnostic: DM6PR12MB2844:EE_
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jt9ce5Ct2MN5ajbwK0Iu0ThV+28PpgZbyvCEwFJSDK/quiZAPhiqT86gTEdpMKPKmNvIfM91rQSNImF5IaZcb0zuDP0MCU8D5xzc32GuGNOohGkkimJKjI3HWXJ2Rh8KUHm9Nr2cr+YiTJEcZomhO1KOk4f5SFi/+MlY0uhR5tLkUqHSm8RiuR04linVODvhGjuJhsceqKrZXkb9g1KaU19g3L4t2ui5I42V2/+Vb1ihFIVGke6Q2Ea+Ib7rzRTTDUmR8vkLZLrsU+NkIordd0txU48KpBagEikOeBF8a0qznvSNrMSlaFbw7DnjppWt8ou91leGoF7a8XpPZs6FHQx7dKahqyz5VAaspjHTl7sMqTOhYdfUdgy9y24CFusmgP2qCQLaz1WgGVigf724qD/ifc8j9VKKsu2enmzZzXhYKMTpYjOCoEF5BF7EEHtS5OAo0hZ/Cdu2JXafu7nCbvRn+VGdhHTxsDWUuQckDtVi1NWG1RHqS3qH77VtSXDcxpFR4PPt6TvcRcyP5gvHhgPNpycSSghd3XoGPyrzu0Y/vYcs4Y4wYrzFsiEgZQgyeF7od5wGIYA8gc7pwMWib/M0lQE8t5g+NopESytxW3RPwDQ3aEXgeWIJWgRqxpfK+w9W+6Mogd13YDKAbbu1xi5K+3gXvv0fZtIEZyyd2ysLL5IFurXmY0AQxRLM2Ika5Xa1uxGFxz1JgGf5/3/rCryRtYKFTEi9j9OLLm6SoDKGrKNLwVZT6egsnuwPF71JtXqQbj1lP/6oOPZB3FGwDTz1Wlfs3GZQL8Pbv9qwBNRT5rqTdNFYIPH672B5YzzBmZzgBa3rENC0wajR1Ck++rY7GfxZE3EjjstADFrbHVe7nRMWHMYmhaZOLx8YVXEuJlVnnItXoHlVCdT/5B7vf81LShEAN4gh63lSKidQ40c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(136003)(396003)(376002)(39860400002)(346002)(83380400001)(186003)(66574015)(2906002)(966005)(41300700001)(66946007)(478600001)(4326008)(8676002)(6666004)(54906003)(6486002)(316002)(110136005)(7416002)(66476007)(5660300002)(66556008)(8936002)(6512007)(31696002)(86362001)(38100700002)(53546011)(31686004)(36756003)(6506007)(2616005)(45980500001)(43740500002)(473944003)(414714003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUQvU1Q0aVVXenY0TE1RN0Npb2ZtME5GQmxncEV6Nk1CazZvUytXeXNrbWZ2?=
 =?utf-8?B?Qm5hSnBGZlp6aXNzRDBkVEd6N3dSYmIwMy9GUVZyWEllbURpV0xHVDc0SHhZ?=
 =?utf-8?B?L1VPSnNnZ2FoWm9pb0owTktiU09hU0NscWliTGFZTGxwZ3U1NUdvV2lWY3gw?=
 =?utf-8?B?N2xlV0dFMVJQUmZMK1NuVkJsaWVQdHZucklaZ3ZhdmlqTkdQdExUVlppSmM1?=
 =?utf-8?B?N2J3R0psV2ZNOHY2TkFnbmZWcUplUGFsZEtBVlp5eGNON0hMZVphR014R0Np?=
 =?utf-8?B?K3NTcVU3VzErY0ttcHU0bUJpdjRvSVJMWC9hSXZXVEhkeGs0dkt4N2h5c3p0?=
 =?utf-8?B?RDRrcEsrV0p5RFdhWUhXT0lIcklUL2M1VGJmRnUyWDBhNEtENDBxdTZCS0Zy?=
 =?utf-8?B?eDVXdGhUbTEyL1Y1UXFwTFdCejBxSXh4Z3ZKK3F1SEplc3IxaWNGeFVXUGh5?=
 =?utf-8?B?dVZoZzYvMGZlNjZlbTdSK2llNWViVS96NGFjYW9oTFEvcDZxVEVUOUdlaEtt?=
 =?utf-8?B?S0MxOGRvUlB3M0R1NjZUcmduOHlTQ3N0akgvc3ljSzJtWllJQmVpRUM2V1pC?=
 =?utf-8?B?bTJEN0JKa0xzUjBobjJJY2IxTG1xWHRLTWtFZ2NVa3RoM0JlaXNXbDlLMnhz?=
 =?utf-8?B?SmVNWFVLN1E3cWNMaERaUU1zWmFqcXdvUGRLeEVNNGlCcTFlZEV2SkgvMTdu?=
 =?utf-8?B?THBSZFdYRlZwZ2ZVdVVoYnF1dVpFckh2U1ExZFJ6OTVSSEtYTWxJM3p6VWl2?=
 =?utf-8?B?K0NlWkdvUTh0cVM2a1g3Vlo5RXMzNE5SNThTVzFFejh3c1FqdjB6Q0RNV2Ro?=
 =?utf-8?B?VG1MSHFDVG5rMU1KQVNhR0ZEVkhzSklINUtwb0RkbmNkNEZUczJkZkxxQ09T?=
 =?utf-8?B?SG5UZmMvZ0ZMWVN6Q2d4TEVwbE5JUlFLaVd0Q28zdVhOcTBmWkFnZ2hLdyt6?=
 =?utf-8?B?UHJYRmFvYTl5Y2lUZzB5czJYOTVCVmh3eXpZdVFWbFBLRzNkVThkeDByckF0?=
 =?utf-8?B?OHYyNzVTZnpzVkxZTzNrUTkxZEtmN0pab2NvOEN6NmtCbHBKQ2J6VWhmYzFw?=
 =?utf-8?B?Wm9iWUl3ais0SmpER3pJMkJKbWxqckYrMzNaRjdtMU05TEdYVnpaOEJ1VmxV?=
 =?utf-8?B?ZUh3aXZpTjNSdDFjY2xRYXFJcW9HejlVWHNQK3FPY2J3Y0JDWWZMWmRpRitv?=
 =?utf-8?B?a1ZqeDRlbktxOC83V2drUi9MR0VvY3lIWFZsRkN5OW55Umh5MXd5MlB0Umds?=
 =?utf-8?B?aTlITlc1a0lPWU9aSjJPa0ZKZ1JmRm14OFhRZzM1MU9xUHNuN3VBRjJnVWs4?=
 =?utf-8?B?OEhBalBidU5RcXNJakxvMjBod3B4UE01NG5yNGhrOEZxQ3djbmhoMG5qZTRC?=
 =?utf-8?B?UzdFQ3ppT1RCUGU2WXFKb3h1dFBobTAwT25McWcySW1oY0N2bEtrRklpcERr?=
 =?utf-8?B?azF0aloyUEJUcnNNc2Y5a0pBeUg0ZkJBT2wrUVVIVkU3bmwrQmZ2R0tWNEho?=
 =?utf-8?B?MDBZZkJzNlc3Q0ViR1ZwOVNLZFg1WE9tYnEySkxPdjVWWnlBREtTb21DbnUw?=
 =?utf-8?B?dTJsWkZJbVQyMVFiVjdFVS85Q25OTk1BSTNDYjdPVE1YNzdQZFptWG8yaUN5?=
 =?utf-8?B?cTAzNXNPSituVEVQL2lqMVlkOFBnczJVVFd4UFVZWis0MStxWFNMaW8yU1ND?=
 =?utf-8?B?QzNuNjRnTWpvSDd1VkJsTTJ3dlhJWFZQY0Uyay9RUnpqOHgrMHV2bUdUd0pS?=
 =?utf-8?B?R2J0Y3JWYVkrN3c0YmJCeWJ6d0RxS3BKcUNPMXNEMW44SSt6UHVJZDd2OElJ?=
 =?utf-8?B?R1MrQ0F0a0hMSlFOUk82QmprdTFVb1EzVlNRZ0kxVDl1dXRLTXhiMno0WXhm?=
 =?utf-8?B?NGFjMkFteitjT0psc29HeWl0M005UXZWSG05K29SN3BnSE5adnh0M202RW5Y?=
 =?utf-8?B?VTN5TTBXbHorampWakZma2l3WU5EckJOSXBrdkJ3OUg2WnNvL2QwSmJPcnBZ?=
 =?utf-8?B?bGl5WGEraE9acERYVzN6R1hJRDZmNWljT2JtdVMzVGEyclc4TkFzTjdWRzhk?=
 =?utf-8?B?MXdyMklWUXZvRG1lZEJDampVVGMyMllsRXMrbmNuNWF0UWZ5eFVyUHBjVitH?=
 =?utf-8?B?Y09sTDNGRGsxM1k5a3ArZ3Q0bTI5SUxSY2ZxbTV0bzFCTEQzME13K0VnR1Jn?=
 =?utf-8?Q?XMfCaFiwvHGkgdmP4fAbD6b3rkQF85z8XcSyRGGV4Eue?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea2a4f5b-304d-4187-c15c-08da5aaf07f8
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 15:41:42.9615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B/DhgCD0lIWKGjax2OppuoY6p+0m48/yhHfMt8o1Pw1LAlijdUdUWb4eL8kpp8iM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2844
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
Cc: "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>, "Pandey,
 Ajit Kumar" <AjitKumar.Pandey@amd.com>, David Airlie <airlied@linux.ie>,
 "Hiregoudar, Basavaraj" <Basavaraj.Hiregoudar@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Nirmoy Das <nirmoy.das@linux.intel.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jesse,

yes, I know that's a well known bug.

The Intel guys have already narrowed it down to a missing 
dma_fence_enable_signaling() in the syncobj code path.

I strongly suggest to work together with them to find where that needs 
to be added instead.

Regards,
Christian.

Am 30.06.22 um 17:26 schrieb Zhang, Jesse(Jie):
> [AMD Official Use Only - General]
>
>
> Hi  Christian,
> If we remove the following patch, the  "syncobj timeline test" can pass.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=721255b52700b320c4ae2e23d57f7d9ad1db50b9
>
>
> The following log is provided by AMD CQE team. They run the amdgpu_test tool on ubuntu22 (kernel version 5.15.0-39)
> Suite: SYNCOBJ TIMELINE Tests
>    Test: syncobj timeline test ...FAILED
>      1. sources/drm/tests/amdgpu/syncobj_tests.c:299  - CU_ASSERT_EQUAL(payload,18)
>      2. sources/drm/tests/amdgpu/syncobj_tests.c:309  - CU_ASSERT_EQUAL(payload,20)
> You can get more detail information by the attachment.
>
> So we need fix this issue. And if you have any better solution to solve the issue, please let me know.
>
> Thanks
> Jesse
>
> -----Original Message-----
> From: Koenig, Christian <Christian.Koenig@amd.com>
> Sent: Wednesday, 29 June 2022 5:12 pm
> To: Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>; broonie@kernel.org; alsa-devel@alsa-project.org
> Cc: Mukunda, Vijendar <Vijendar.Mukunda@amd.com>; Hiregoudar, Basavaraj <Basavaraj.Hiregoudar@amd.com>; Dommati, Sunil-kumar <Sunil-kumar.Dommati@amd.com>; Pandey, Ajit Kumar <AjitKumar.Pandey@amd.com>; Nirmoy Das <nirmoy.das@linux.intel.com>; Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>; David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Sumit Semwal <sumit.semwal@linaro.org>; open list:DRM DRIVERS <dri-devel@lists.freedesktop.org>; open list <linux-kernel@vger.kernel.org>; open list:DMA BUFFER SHARING FRAMEWORK <linux-media@vger.kernel.org>; moderated list:DMA BUFFER SHARING FRAMEWORK <linaro-mm-sig@lists.linaro.org>
> Subject: Re: [PATCH v1] Fix: SYNCOBJ TIMELINE Test failed.
>
> Am 29.06.22 um 08:02 schrieb jie1zhan:
>>    The issue cause by the commit :
>>
>> 721255b527(drm/syncobj: flatten dma_fence_chains on transfer).
>>
>> Because it use the point of dma_fence incorrectly
>>
>> Correct the point of dma_fence by fence array
> Well that patch is just utterly nonsense as far as I can see.
>
>> Signed-off-by: jie1zhan <jesse.zhang@amd.com>
>>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>
>> Reviewed-by: Nirmoy Das <nirmoy.das@linux.intel.com>
> I have strong doubts that Nirmoy has reviewed this and I certainly haven't reviewed it.
>
> Christian.
>
>> ---
>>    drivers/gpu/drm/drm_syncobj.c | 2 +-
>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_syncobj.c
>> b/drivers/gpu/drm/drm_syncobj.c index 7e48dcd1bee4..d5db818f1c76
>> 100644
>> --- a/drivers/gpu/drm/drm_syncobj.c
>> +++ b/drivers/gpu/drm/drm_syncobj.c
>> @@ -887,7 +887,7 @@ static int drm_syncobj_flatten_chain(struct dma_fence **f)
>>    		goto free_fences;
>>    
>>    	dma_fence_put(*f);
>> -	*f = &array->base;
>> +	*f = array->fences[0];
>>    	return 0;
>>    
>>    free_fences:

