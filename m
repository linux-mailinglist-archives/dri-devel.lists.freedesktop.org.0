Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 503D3AF8FEC
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 12:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 510D110E9E2;
	Fri,  4 Jul 2025 10:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PseH37yR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CCC010E9DE;
 Fri,  4 Jul 2025 10:24:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DTslpezUCNn2TmoN2HFg88C6A8zCZ6LQOZy7TZl13eeBNmshz1d6w4ryxAK3+2ZzLEZUaycl9R00hLEoZLdRNUmaHx1M699LWABupbiSyCTKxRlyi/7aFIh1ZcuKt0H0vR22DjOvUSybzwavaHbfFXuFDRnN5wPR3neWVdM7NM2HsmwUi8AXMjmh/cHBZ8/S5Calky79BMcgXZ9juIGs8zKxe0UYPCLOzv9tf8y9v1RIPXC0EGB03gxaq5XOJdDeoDKRElq9iBeuTBl8vbfVzonK1EFHRreN55SlAFaDXWxm58hxZC2ABqhr0RkPhFcxYyg1nMBEPYa3upFkofeTAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSkbFQCwLxTP4n3YAaiYlLkBMGuCzkS6YranpnIuSdY=;
 b=AFXT3H5dpsiBeQZJ8h7ZfWL+zSoZNXCNcDT8ksh1RSY9y3u1/pzV0S+nQjKOCcUjFtvodX9LyP4AbdMxTZnJOQGn5nkC9aO76DBVNNrFCmChYz9XasGyy54usM8+7H+HeDe8LP3NUAVbzHqGqgD+3Vug/hHsTyDQ35CA6Q4o0jl0mVAYRgUt4DkjptAr0QDMVwv0UFwojH6DW66uq8AIzglvldF3MOqiK6UnVhrBw8sKyd2cXy9FH4A9doN/jHJKMJuqIz1dlPNPgYwubFWxJddsNatJ3knEHV6TR98gqCw0NOphrglJGp3Jb38VOcp18iwoupEem02+8j6ndcgNsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSkbFQCwLxTP4n3YAaiYlLkBMGuCzkS6YranpnIuSdY=;
 b=PseH37yRzQ3rcKbWM6n6EdxUDVxEq9OV93d4yBRS83r4PpWqzWf8v53jsY2GEMph6C7Vbqe5zFkMByCII9UJshGe+nHC0J0/TL9vuvW7EScr1rD8uy5UdJtDPA4QXcBPRkYnjSIcJ1hxf+G5d+HsM8YWrQyODwlVz+K2vsu8gig=
Received: from SJ0PR03CA0008.namprd03.prod.outlook.com (2603:10b6:a03:33a::13)
 by DS0PR12MB6392.namprd12.prod.outlook.com (2603:10b6:8:cc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 10:24:13 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:a03:33a:cafe::38) by SJ0PR03CA0008.outlook.office365.com
 (2603:10b6:a03:33a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Fri,
 4 Jul 2025 10:24:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 10:24:13 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 05:24:12 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 05:24:12 -0500
Received: from [10.65.159.153] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 4 Jul 2025 05:24:08 -0500
Message-ID: <bfaac876-9cab-446d-bfe1-65c961c1762d@amd.com>
Date: Fri, 4 Jul 2025 18:24:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/amdgpu: skip kfd resume_process for
 dev_pm_ops.thaw()
To: "Lazar, Lijo" <lijo.lazar@amd.com>, Alex Deucher <alexdeucher@gmail.com>
CC: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Zhang,
 GuoQing (Sam)" <GuoQing.Zhang@amd.com>, "rafael@kernel.org"
 <rafael@kernel.org>, "len.brown@intel.com" <len.brown@intel.com>,
 "pavel@kernel.org" <pavel@kernel.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Limonciello, Mario"
 <Mario.Limonciello@amd.com>, "Zhao, Victor" <Victor.Zhao@amd.com>, "Chang,
 HaiJun" <HaiJun.Chang@amd.com>, "Ma, Qing (Mark)" <Qing.Ma@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250630104116.3050306-1-guoqing.zhang@amd.com>
 <20250630104116.3050306-4-guoqing.zhang@amd.com>
 <8806781b-90d1-4b99-a798-dd1d29d4c8c0@amd.com>
 <8eb1700d-4d60-4a1e-9d09-718f65baaf1e@amd.com>
 <019a15d5-142f-4761-9408-58c103d3922b@amd.com>
 <CADnq5_PHfNTbLL7Xmb9HFgtZemDVaLSqbrONWWEf9hjwk1rF1Q@mail.gmail.com>
 <1e82f0af-daf6-4dd6-bc43-2969ac970589@amd.com>
 <CADnq5_M_NWSbqJUrBcDy_bARrPcQDDhSvHCKCqEoTWijBWHxGg@mail.gmail.com>
 <84d111fd-f71d-4f4b-ab33-a6ff800731f8@amd.com>
Content-Language: en-US
From: "Zhang, GuoQing (Sam)" <guoqzhan@amd.com>
In-Reply-To: <84d111fd-f71d-4f4b-ab33-a6ff800731f8@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: guoqzhan@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|DS0PR12MB6392:EE_
X-MS-Office365-Filtering-Correlation-Id: 761b1002-ef0a-40fd-9c95-08ddbae4ec19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N3BiV3pMbjdGejJaNmZNMUdBNEx0SlhyNnowOEJJMXBqRFg2K2JuZ3kwZHlV?=
 =?utf-8?B?NUUyOWhsVE1WVnNoUHNxdVFIOHNIc2Q3WDBWWWFXNStlVU9IViswNW1rbFhP?=
 =?utf-8?B?ZVVTd01uRHNzcHhaUzVuS3VUb2pWSWpVZTRwdFVYMStGc3NzNkpScDIvZis5?=
 =?utf-8?B?MTN2bjdCcUt6UmFFbGszVDhQUmkwTHJ1ckpaa1lDRktsVkQ5SFlEQzFHZmli?=
 =?utf-8?B?UXNYMXMzTGxydHJ0SlNKUGJ3Qm9qdkpoNkxDTVVGblpKcWdJbzlmZkxUbnp1?=
 =?utf-8?B?MUVIOGpEZHRISUhvZTdNNDE1ZmxzL0RzREFqd2dtdFJVa05kWGNSTnV4Mkpv?=
 =?utf-8?B?bC9nblBsM3IrVlBBR25NZVM1dXd4OVpHODFpVDNLbVBNQzk3RjNPckJNSWt3?=
 =?utf-8?B?enhsYnovMlpJRmUrakJBNVFNZVVpZC9aY3N6M0JnOENQU3JJbytLOHNhUFFs?=
 =?utf-8?B?eGx4WDF0ZGhYMjVldHNiMEYzSTExb0RZVjh5MGdlckd6SVZ1aVN2a3lEc2JD?=
 =?utf-8?B?WlZxU0U1aVQxcUdmaGVxWUNFZFlPdUpmQnl0aFdxTjdZeStsa1N4d0ZRcXFn?=
 =?utf-8?B?cVZKeVBMSkVkUnoyNlJlVmhZOVRuZitCMnZBM3BxTjZCM1VJQXY2TFhqQXRp?=
 =?utf-8?B?cURhQ2p2eWMxUWJORFYzOUx4QW1nakd2Q2V6akpQYTRBN0dMVlREWm53MVFh?=
 =?utf-8?B?TWtPQ2dlQzFDZWh5RTRyZmxicDB3WXF3OFBNRGQ3cnczUlZWS0pIQkxJcXNj?=
 =?utf-8?B?ZU1YbkdXRW13eGt1RHdTOUkvc2VTNG9rcFNqODNzMnA5V0RkcFRBbE1YL1Fn?=
 =?utf-8?B?cHBBWkdqSHlhMThOR3JjZkpVWDdFVVBRcXBjYkVnamxubUtKQXF1bVRiQmtn?=
 =?utf-8?B?VHVlQ2o0TWxhVUFiZWZqVTU3RVJ3anhRTnBweE82L0tZNy9tSHBseXZKbVlL?=
 =?utf-8?B?SXFDWU1rQkpWMW4xVCsyTVFJbnV0RjQwbjAwQ0YrR1JNR3RzNG9DVUU4L1dO?=
 =?utf-8?B?ZjFBOS9NT0w2VHpQOHlRb3BGQU4wb1pnL3FSN3lHOGVkeWIvT3V1eDVIZjBk?=
 =?utf-8?B?VE5maEdmNytUWkpTdzFEOWdIQndiVW1rN0hCdXBuOHk1SGwzTWkwWXRNSDlC?=
 =?utf-8?B?K29JanlsNCtScFprTDE1RldsVlh1cHJaY2Eya3ZlRENBZ092Yko2Z3cwMjhy?=
 =?utf-8?B?QlhScmN5RmE1eVdPVVpRdVVxaG9CaXhHaG5maGJmZndZRlpobnV4cTVpSUVn?=
 =?utf-8?B?VGhNazZ4bjJyTm1ITjVmdWNvRzkvbUpiT0U3MEJCcGJ4YUxpVjRrQTJaeDdE?=
 =?utf-8?B?Z2s5bVN0QXVxdnFZamthWlBzSlZRTVJHZmplMldTTEZ6Z2FUSVF5cUtXNkx5?=
 =?utf-8?B?REpIdlNKTStXRmlkUW91RmlqWVdSQXh3V1ZDZzJTNmRKeXZsV3pBcktieEl3?=
 =?utf-8?B?clJ4aWpkSHUxKzFBWG1zZCtiYklvU1NKcWxSY1FLQ2xiUWVwM1BVcjB2K243?=
 =?utf-8?B?SkVkZFFCV2V4UGJuYnQ4WlM4MlAwRmx2RXZIYU1yL2RRcElzT1I3bHpFVThz?=
 =?utf-8?B?SnRIbjBFQjVVM3MrRUxTMkNWNFozdU41UjZObHpZTWNhSGlaUHpXNVJKa2JN?=
 =?utf-8?B?cDZBem05RTYvSkFtbml5dnpiMDNsN29XOFE2cVNQdU0yd2JUdzhoakJVeGdk?=
 =?utf-8?B?UXJZK1RoNWtMZkRUaGwvaDI2bm5WNXFzY2g4WVJjdGNLM0ZGdWJ2c3pxeVJq?=
 =?utf-8?B?RlZVaS9NMVlGZE9GMmhBRHZHaG9XeUNlMmFxVlJZQ0F4UVl5U2k3dExmdjN6?=
 =?utf-8?B?WmRKellLdUtNdHBpU2FNQVNwbmdUamJrRWkvN0pVUjRCZHhreENnZHcvVUtW?=
 =?utf-8?B?ZzJaRjBtS3pHQzNZMURGeEJuajl4cDhTcUc1cWg4SFloazlicWZNWTgxeUVS?=
 =?utf-8?B?RzNaZ0NxMVdnTXU0WnNpYWhEUGxqaEtlcGlVTGNBazdwTVNsZFZVR3ZMbm9J?=
 =?utf-8?Q?H+PKd2cSkpKj3fZw5/ihf+qrlDzM54=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 10:24:13.1547 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 761b1002-ef0a-40fd-9c95-08ddbae4ec19
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6392
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


On 2025/7/2 22:07, Lazar, Lijo wrote:
>
> On 7/2/2025 7:24 PM, Alex Deucher wrote:
>> On Wed, Jul 2, 2025 at 3:24 AM Sam <guoqzhan@amd.com> wrote:
>>>
>>> On 2025/7/2 00:07, Alex Deucher wrote:
>>>> On Tue, Jul 1, 2025 at 4:32 AM Christian König <christian.koenig@amd.com> wrote:
>>>>> On 01.07.25 10:03, Zhang, GuoQing (Sam) wrote:
>>>>>> thaw() is called before writing the hiberation image to swap disk. See
>>>>>> the doc here.
>>>>>> https://github.com/torvalds/linux/blob/v6.14/Documentation/driver-api/pm/devices.rst?plain=1#L552 <https://github.com/torvalds/linux/blob/v6.14/Documentation/driver-api/pm/devices.rst?plain=1#L552>
>>>>>>
>>>>>> And amdgpu implemented thaw() callback by calling amdgpu_device_resume().
>>>>>> https://github.com/torvalds/linux/blob/v6.14/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c#L2572 <https://github.com/torvalds/linux/blob/v6.14/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c#L2572>
>>>>>>
>>>>>> This patch is skip amdgpu_amdkfd_resume_process() call in thaw() during
>>>>>> hibernation. it is not skipped in restore() during resume from
>>>>>> hibernation when system boot again.
>>>>>>
>>>>>>
>>>>>> I just found the following kernel doc. Thaw() is intended to resume the
>>>>>> storage device for saving the hibernation image.
>>>>> Ah, that makes much more sense.
>>>>>
>>>>>> Our GPU is not involved
>>>>>> in it, it is not necessary to resume our GPU in thaw().
>>>>>> https://github.com/torvalds/linux/blob/v6.14/Documentation/power/pci.rst?plain=1#L588 <https://github.com/torvalds/linux/blob/v6.14/Documentation/power/pci.rst?plain=1#L588>
>>>>>>
>>>>>> So another implementation is to remove the amdgpu_device_resume() call
>>>>>> in amdgpu_pmops_thaw(), and skip amdgpu_device_ip_suspend() call in
>>>>>> amdgpu_pci_shutdown()for hibernation.
>>>>>> Initial tests show it's working fine for hibernation successful case.
>>>>>> Should I switch to this implementation?
>>>>> No idea. Alex and the KFD guys need to take a look at that.
>>>>>
>>>>>> But thaw() is also called to restore the GPU when hibernation is aborted
>>>>>> due to some error in hibernation image creation stage. In this case,
>>>>>> amdgpu_device_resume() is needed in thaw().
>>>>>>
>>>>>> So I need a method to check if hibernation is aborted or not to
>>>>>> conditionally skip amdgpu_device_resume() in thaw(). Currently I don't
>>>>>> know how to do this.
>>>>> Yeah that approach here looks fishy to me, but I don't know how to properly fix it either.
>>>>>
>>>>> @Alex any idea?
>>>> Yeah, I'm not sure how to handle that.  I don't see a way to avoid
>>>> having all of the callbacks.  We could ideally skip some of the steps.
>>>> Maybe we could optimize the freeze and thaw routines if we had some
>>>> hint from the pm core about why we were getting called.  E.g., thaw
>>>> after a failed hibernation restore.
>>>>
>>>> Alex
>>>
>>> I just found pm_transition variable can be used to check if hibernation
>>> is cancelled (PM_EVENT_RECOVER) or not(PM_EVENT_THAW) in thaw(). I just
>>> need to export this variable in kernel.
>>> https://github.com/torvalds/linux/blob/master/drivers/base/power/main.c#L64
>>>
>>> Provided pm_transition is available, should we skip
>>> amdgpu_amdkfd_resume_process() only, or skip amdgpu_device_resume()
>>> completely?
>> Hmmm.  Still not sure how best to handle this.  For entering
>> hibernation, all we really need is freeze().  Once we are done with
>> that we don't need thaw() or poweroff() for hibernation as we've
>> already suspended in freeze() so there is nothing else to do.  For
>> exiting hibernation, we need freeze() to suspend and then either
>> thaw() (if the hibernation image is bad) or restore() (if the
>> hibernation image is good) to resume.
>>
> If pm_transition is available, we can keep thaw() as we have now and do
> resume only if pm_transition =  PM_EVENT_RECOVER. shutdown() may check
> in_s4 and do nothing.


Hi Lijo, Christian and Alex,
Thank you for the suggestion and feedback. I have implemented this 
behavior and send out the v2 patch list. Please help review. Thank you!

[PATCH v2 0/5] reduce system memory requirement for hibernation
[PATCH v2 1/5] drm/ttm: add ttm_device_prepare_hibernation() api
[PATCH v2 2/5] drm/amdgpu: move GTT to shmem after eviction for hibernation
[PATCH v2 3/5] PM: hibernate: shrink shmem pages after dev_pm_ops.prepare()
[PATCH v2 4/5] PM: hibernate: export variable pm_transition
[PATCH v2 5/5] drm/amdgpu: do not resume device in thaw for normal 
hibernation

Regards
Sam


>
> Thanks,
> Lijo
>
>
>> Alex
>>
>>> Regards
>>> Sam
>>>
>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>> Regards
>>>>>> Sam
>>>>>>
>>>>>>
>>>>>> On 2025/6/30 19:58, Christian König wrote:
>>>>>>> On 30.06.25 12:41, Samuel Zhang wrote:
>>>>>>>> The hibernation successful workflow:
>>>>>>>> - prepare: evict VRAM and swapout GTT BOs
>>>>>>>> - freeze
>>>>>>>> - create the hibernation image in system memory
>>>>>>>> - thaw: swapin and restore BOs
>>>>>>> Why should a thaw happen here in between?
>>>>>>>
>>>>>>>> - complete
>>>>>>>> - write hibernation image to disk
>>>>>>>> - amdgpu_pci_shutdown
>>>>>>>> - goto S5, turn off the system.
>>>>>>>>
>>>>>>>> During prepare stage of hibernation, VRAM and GTT BOs will be swapout to
>>>>>>>> shmem. Then in thaw stage, all BOs will be swapin and restored.
>>>>>>> That's not correct. This is done by the application starting again and not during thaw.
>>>>>>>
>>>>>>>> On server with 192GB VRAM * 8 dGPUs and 1.7TB system memory,
>>>>>>>> the swapin and restore BOs takes too long (50 minutes) and it is not
>>>>>>>> necessary since the follow-up stages does not use GPU.
>>>>>>>>
>>>>>>>> This patch is to skip BOs restore during thaw to reduce the hibernation
>>>>>>>> time.
>>>>>>> As far as I can see that doesn't make sense. The KFD processes need to be resumed here and that can't be skipped.
>>>>>>>
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>>>
>>>>>>>> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
>>>>>>>> ---
>>>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
>>>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 2 ++
>>>>>>>>     2 files changed, 3 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>>> index a8f4697deb1b..b550d07190a2 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>>> @@ -5328,7 +5328,7 @@ int amdgpu_device_resume(struct drm_device *dev, bool notify_clients)
>>>>>>>>                 amdgpu_virt_init_data_exchange(adev);
>>>>>>>>                 amdgpu_virt_release_full_gpu(adev, true);
>>>>>>>>
>>>>>>>> -            if (!adev->in_s0ix && !r && !adev->in_runpm)
>>>>>>>> +            if (!adev->in_s0ix && !r && !adev->in_runpm && !adev->in_s4)
>>>>>>>>                         r = amdgpu_amdkfd_resume_process(adev);
>>>>>>>>         }
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>>> index 571b70da4562..23b76e8ac2fd 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>>> @@ -2734,7 +2734,9 @@ static int amdgpu_pmops_poweroff(struct device *dev)
>>>>>>>>     static int amdgpu_pmops_restore(struct device *dev)
>>>>>>>>     {
>>>>>>>>         struct drm_device *drm_dev = dev_get_drvdata(dev);
>>>>>>>> +    struct amdgpu_device *adev = drm_to_adev(drm_dev);
>>>>>>>>
>>>>>>>> +    adev->in_s4 = false;
>>>>>>>>         return amdgpu_device_resume(drm_dev, true);
>>>>>>>>     }
>>>>>>>>
