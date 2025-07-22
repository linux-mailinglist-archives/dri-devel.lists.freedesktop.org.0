Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 218E5B0DBD9
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 15:54:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B60610E6AB;
	Tue, 22 Jul 2025 13:54:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qhtap4OV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4193810E044;
 Tue, 22 Jul 2025 13:54:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jJl21s/AjCbI+vt0fNVRFyKZSBI+3oAnuN6MpKVUmYn5wX59Z2vAinEISzVKdn/a7263mbFF0vlOhkmrEidnkw34BAo7XiZsLbetTr2lkJHmIhh5EWGvSIr4mMVPM3stJnfHZZvQ8QLSGMx22M5+KzuBkqbW35XvQVo9zkwPxA9Ev1fPtCbbFirooQThffEJnMLu4W8FRQsqUTad83PbbhQ4YefnNQiKaMtVh2eFI1GVyKwB3/1hPvCsn3kMbuYFQOuoAhckpbHmWZz2M9cryj8B4+DnBX6cDk28EfhNIcjm6846kGb1FkfPc63RTXe12qYtusUJwsbnUk/5PWVOjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YwRckLuRM4OiLQ8UkgdakQPLA9xjBC78IuycU/pV5f8=;
 b=dKlcSCQBbwYo5vcJlTngzSrB+MxW44SArA+1xu+RMudxtF1vvE01/JkZDFr8wmJB9hf1lnHlMb453/VcXR/D4h4usUp1bfQxwJgZ2z6Cf16h/F2x6vFiC3+fnu1llO85zJ4e2xoAjDKHN0adZFTCxZGagq3x4/cjlQPK8eiLIJNqvj4k2FSZ1M4FwxepkCFf3kync0JqoYJMFguvWx9fHsg6DxUqslSvwlvL/q9wNkvwWVpdvritmjKLetqaeXnHOnFyHgd9i+96t4yh0QcPSiNxMSYkepkNo9hbGOyLzeX8iJ+VWdtNZyDH1d9g+wHZP47w/S+62nqB/PSLDLWyaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=igalia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YwRckLuRM4OiLQ8UkgdakQPLA9xjBC78IuycU/pV5f8=;
 b=qhtap4OVKC+48xLP1P3wCIrY55n9InsWTcvL4/JgYcRJeKSXAOjf6mWQwYPmiX1GyqC906FFUhAbPxFEMbRuRPGXqEmmLQP+G0O6OItqmf44ePE/VWRcrQiGQk8xbzJT1ZSPIwRqABVOlVyDXuKzTjDcSY5j9EX12RFY+s5+l8w=
Received: from BY3PR03CA0014.namprd03.prod.outlook.com (2603:10b6:a03:39a::19)
 by LV3PR12MB9142.namprd12.prod.outlook.com (2603:10b6:408:198::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Tue, 22 Jul
 2025 13:54:48 +0000
Received: from CO1PEPF000044F8.namprd21.prod.outlook.com
 (2603:10b6:a03:39a:cafe::74) by BY3PR03CA0014.outlook.office365.com
 (2603:10b6:a03:39a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Tue,
 22 Jul 2025 13:54:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.1 via Frontend Transport; Tue, 22 Jul 2025 13:54:46 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 08:54:43 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 08:54:42 -0500
Received: from [10.4.13.140] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 22 Jul 2025 08:54:41 -0500
Message-ID: <c4f9dbe8-d224-478f-a91f-03a420333fde@amd.com>
Date: Tue, 22 Jul 2025 09:54:41 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Raven: don't allow mixing GTT and VRAM
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>, Alex Deucher
 <alexdeucher@gmail.com>
CC: Brian Geffon <bgeffon@google.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Yunxiang Li
 <Yunxiang.Li@amd.com>, Lijo Lazar <lijo.lazar@amd.com>, Prike Liang
 <Prike.Liang@amd.com>, Pratap Nirujogi <pratap.nirujogi@amd.com>, "Luben
 Tuikov" <luben.tuikov@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Garrick
 Evans" <garrick@google.com>, <stable@vger.kernel.org>
References: <CADyq12zB7+opz0vUgyAQSdbHcYMwbZrZp+qxKdYcqaeCeRVbCw@mail.gmail.com>
 <CADnq5_OeTJqzg0DgV06b-u_AmgaqXL5XWdQ6h40zcgGj1mCE_A@mail.gmail.com>
 <CADyq12ysC9C2tsQ3GrQJB3x6aZPzM1o8pyTW8z4bxjGPsfEZvw@mail.gmail.com>
 <CADnq5_PnktmP+0Hw0T04VkrkKoF_TGz5HOzRd1UZq6XOE0Rm1g@mail.gmail.com>
 <CADyq12x1f0VLjHKWEmfmis8oLncqSWxeTGs5wL0Xj2hua+onOQ@mail.gmail.com>
 <CADnq5_OhHpZDmV5J_5kA+avOdLrexnoRVCCCRddLQ=PPVAJsPQ@mail.gmail.com>
 <46bdb101-11c6-46d4-8224-b17d1d356504@amd.com>
 <CADnq5_PwyUwqdv1QG_O2XgvNnax+FNskuppBaKx8d0Kp582wXg@mail.gmail.com>
 <eff0ef03-d054-487e-b3bf-96bf394a3bf5@amd.com>
 <CADnq5_NvPsxmm8j0URD_B8a5gg9NQNX8VY0d93AqUDis46cdXA@mail.gmail.com>
 <aH90O93xJhD8PXWL@quatroqueijos.cascardo.eti.br>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <aH90O93xJhD8PXWL@quatroqueijos.cascardo.eti.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: sunpeng.li@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F8:EE_|LV3PR12MB9142:EE_
X-MS-Office365-Filtering-Correlation-Id: 9199d2c5-b584-40e4-65ac-08ddc92751bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|7416014|42112799006; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mlo2VTRXQUlpMFB3d2FmM0kwa0duNjd0b29CODI5V2t1SFR5QTE3MkpCdFpv?=
 =?utf-8?B?Rm1KeHBtNmRSbnNQNVJtdU5YQ2NDbnpBVnlVR2tKQTFMbEUvRWpxVmNRK0xL?=
 =?utf-8?B?bVV4N0FKckJOTUt2dnBJS2FCajRsV3RQMk9nekNHbU1yb0NnRXlreklXY25M?=
 =?utf-8?B?eHlaUGF3MXBUMzdsOGQxcmR6ODBickRGbVJPNXhvUEVQMmNRZElzOXdVUmV4?=
 =?utf-8?B?QlJkMFJ5czlMRzBrcHVkeHhIaDEwaUhrSWJuS0dybDlFbnowUWhBRTROVnNv?=
 =?utf-8?B?T21kNnl5TzVpKzMvQUVHQjlkMUZGbTRjVXVkU3pLTnR3bWlUWWdQeUtoNWpG?=
 =?utf-8?B?SU14ektkMUgzSld0RFljaDhia1o4RmVWS1BQVFJZcGh2aUcrMHRneGdTRnRn?=
 =?utf-8?B?Q05ZSnh6eHFuMjBmMVZ1QVpONWJNOUwrQzVFS2NFSzZENU1tbGN1L2dxTHp2?=
 =?utf-8?B?MnE5V093OHFNRVQzM1lYTVlFSkZTdmVjcGx5QU5DQ3BqdVovcS9OM3IyOXpS?=
 =?utf-8?B?Y08rOGhidnZGOGJ3Q21sN3RGUDNaNlo2amx5WVJ1amtGbXY1dUU5L2JSbGc5?=
 =?utf-8?B?QjZ0cEl1WmlYTXJjeWJldzVvRFNlT3pLTnZlRHRjc1FMYTJGb1N6VlhjZ2NY?=
 =?utf-8?B?WVFSTERkL1V0eGJDTERhb3pFSjFDQ1A0N05zQW8wOU5jcHZRTnlaN2xvVHE5?=
 =?utf-8?B?Ulh5V2xQdk5EeU1FTEttRU1MY3RZNkdDWnNXU3EwcWdnNjc3WTZCRWYxZ1FP?=
 =?utf-8?B?V1UrS29RRERXNWlLQi95K0E3UHpEZ1JCQ1M1cWNNcjlQc1U4cHFTWHdRNE1t?=
 =?utf-8?B?d0hnRThCT2tCRkpFejZkRHN4SmxPcWVrYzgxRVFHNFJLMTF5a2xYYmNCajBU?=
 =?utf-8?B?R3BrQUlWcy9VUm92bFkwTWJGQ3pGWE1DVFJ3dVF1ZEIrTEZHQmFqNWxMdjFS?=
 =?utf-8?B?U1BjR3pxbVRSalBFYXNwb3hIaXZkenBkMHFpK0pQUllqZDJxS1dBdHRZY2Vv?=
 =?utf-8?B?eVdDNUkxMGlWeCt5RllqaHhJZEthbFpoQkx0SmZvODVMNUp5YnRXSXVXRzlG?=
 =?utf-8?B?WUhiN3Z4Z0VLZE9GcllnMlZpdEF6ODdLdDRlRHZCdnJvejRHeTVxSVN6eEJI?=
 =?utf-8?B?bHllcWNWRThjS3RtWUdjemJhdytPVHV1Rk1GbXgrZm56NVBGektmbVgzZlZF?=
 =?utf-8?B?Wm9zQVJGL2lNNWxKU2FlMUJsbDl6dVdDQ0NwODRkWXVzbVloc2pjaWErVFpl?=
 =?utf-8?B?MXVBZVk5aXZFWUNpZExmT3dHNlY4SlpxR0ZRb3U1Y0dNZTVaaHZCZC9CSy95?=
 =?utf-8?B?VnpqRkM3RC8rNkFZbGkxR2YxQ3BDL3lTOTZxRW1KNFhuMmxUckIwOUR0a05M?=
 =?utf-8?B?OUowellwbFBkMDlZbm5pV3Y3dVNyU0VnM21XSHI0djhFOTlnTjZpUXlDS2xF?=
 =?utf-8?B?TFZTck9uQmxZWjB5d0FibWFNT1paUUR0SzJCRmFhQ0FwZDRXN0daSVZYbkw5?=
 =?utf-8?B?V2pHVE9aOHFMeTNrWlN5Q1l3VlltbnVnWHRRN05RRC9DbWtPRVEzNDUrblEx?=
 =?utf-8?B?aEZKVGJmNm5wU0phK2kxZGUwb2VsMTNoclVIWlpaTk84WFduYWdNN2ovay85?=
 =?utf-8?B?ZktVMDcwdmlSSlJCN2s5NVdoOWYzNWZwWVBYVlRJOW5XSUI0OEJyU1B3YXFv?=
 =?utf-8?B?SEpTdHFpODN0aE5CTmFTS25FNXp2bnpTTnhNNmNUM1AwbFNaQTRPV2JGU2ln?=
 =?utf-8?B?RHNzbXdQWDV1cU5SWTRIRGpHMTVDZmhFQ0t2VHM1eisvMjdGNmpzMVg0Zklk?=
 =?utf-8?B?b25xQXJkWGhHNXFHUlB5bzNGelpRclhxQnBzblhFbTh0cTNkejBVZE5uL2dx?=
 =?utf-8?B?RXBGZ3FES3FHRFE0V2V2djNOVnhoMzRVVXRycUN1NWVucGZqeERvMStEaXpY?=
 =?utf-8?B?T2RFUlZSVkZYM0JXa1VObVJyNXVhM1ROUFJEVmhML2g2dlFjbTIzZVhYUnhX?=
 =?utf-8?Q?ecj/0CsdBuXszkHEpWAPnfnBOxHwrY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014)(42112799006);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 13:54:46.7541 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9199d2c5-b584-40e4-65ac-08ddc92751bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9142
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



On 2025-07-22 07:21, Thadeu Lima de Souza Cascardo wrote:
> On Fri, Jul 18, 2025 at 07:00:39PM -0400, Alex Deucher wrote:
>> On Fri, Jul 18, 2025 at 6:01 PM Leo Li <sunpeng.li@amd.com> wrote:
>>>
>>>
>>>
>>> On 2025-07-18 17:33, Alex Deucher wrote:
>>>> On Fri, Jul 18, 2025 at 5:02 PM Leo Li <sunpeng.li@amd.com> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 2025-07-18 16:07, Alex Deucher wrote:
>>>>>> On Fri, Jul 18, 2025 at 1:57 PM Brian Geffon <bgeffon@google.com> wrote:
>>>>>>>
>>>>>>> On Thu, Jul 17, 2025 at 10:59 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>>>>>>>>
>>>>>>>> On Wed, Jul 16, 2025 at 8:13 PM Brian Geffon <bgeffon@google.com> wrote:
>>>>>>>>>
>>>>>>>>> On Wed, Jul 16, 2025 at 5:03 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>>>>>>>>>>
>>>>>>>>>> On Wed, Jul 16, 2025 at 12:40 PM Brian Geffon <bgeffon@google.com> wrote:
>>>>>>>>>>>
>>>>>>>>>>> On Wed, Jul 16, 2025 at 12:33 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>>>>>>>>>>>>
>>>>>>>>>>>> On Wed, Jul 16, 2025 at 12:18 PM Brian Geffon <bgeffon@google.com> wrote:
>>>>>>>>>>>>>
>>>>>>>>>>>>> Commit 81d0bcf99009 ("drm/amdgpu: make display pinning more flexible (v2)")
>>>>>>>>>>>>> allowed for newer ASICs to mix GTT and VRAM, this change also noted that
>>>>>>>>>>>>> some older boards, such as Stoney and Carrizo do not support this.
>>>>>>>>>>>>> It appears that at least one additional ASIC does not support this which
>>>>>>>>>>>>> is Raven.
>>>>>>>>>>>>>
>>>>>>>>>>>>> We observed this issue when migrating a device from a 5.4 to 6.6 kernel
>>>>>>>>>>>>> and have confirmed that Raven also needs to be excluded from mixing GTT
>>>>>>>>>>>>> and VRAM.
>>>>>>>>>>>>
>>>>>>>>>>>> Can you elaborate a bit on what the problem is?  For carrizo and
>>>>>>>>>>>> stoney this is a hardware limitation (all display buffers need to be
>>>>>>>>>>>> in GTT or VRAM, but not both).  Raven and newer don't have this
>>>>>>>>>>>> limitation and we tested raven pretty extensively at the time.s
>>>>>>>>>>>
>>>>>>>>>>> Thanks for taking the time to look. We have automated testing and a
>>>>>>>>>>> few igt gpu tools tests failed and after debugging we found that
>>>>>>>>>>> commit 81d0bcf99009 is what introduced the failures on this hardware
>>>>>>>>>>> on 6.1+ kernels. The specific tests that fail are kms_async_flips and
>>>>>>>>>>> kms_plane_alpha_blend, excluding Raven from this sharing of GTT and
>>>>>>>>>>> VRAM buffers resolves the issue.
>>>>>>>>>>
>>>>>>>>>> + Harry and Leo
>>>>>>>>>>
>>>>>>>>>> This sounds like the memory placement issue we discussed last week.
>>>>>>>>>> In that case, the issue is related to where the buffer ends up when we
>>>>>>>>>> try to do an async flip.  In that case, we can't do an async flip
>>>>>>>>>> without a full modeset if the buffers locations are different than the
>>>>>>>>>> last modeset because we need to update more than just the buffer base
>>>>>>>>>> addresses.  This change works around that limitation by always forcing
>>>>>>>>>> display buffers into VRAM or GTT.  Adding raven to this case may fix
>>>>>>>>>> those tests but will make the overall experience worse because we'll
>>>>>>>>>> end up effectively not being able to not fully utilize both gtt and
>>>>>>>>>> vram for display which would reintroduce all of the problems fixed by
>>>>>>>>>> 81d0bcf99009 ("drm/amdgpu: make display pinning more flexible (v2)").
>>>>>>>>>
>>>>>>>>> Thanks Alex, the thing is, we only observe this on Raven boards, why
>>>>>>>>> would Raven only be impacted by this? It would seem that all devices
>>>>>>>>> would have this issue, no? Also, I'm not familiar with how
>>>>>>>>
>>>>>>>> It depends on memory pressure and available memory in each pool.
>>>>>>>> E.g., initially the display buffer is in VRAM when the initial mode
>>>>>>>> set happens.  The watermarks, etc. are set for that scenario.  One of
>>>>>>>> the next frames ends up in a pool different than the original.  Now
>>>>>>>> the buffer is in GTT.  The async flip interface does a fast validation
>>>>>>>> to try and flip as soon as possible, but that validation fails because
>>>>>>>> the watermarks need to be updated which requires a full modeset.
>>>>>
>>>>> Huh, I'm not sure if this actually is an issue for APUs. The fix that introduced
>>>>> a check for same memory placement on async flips was on a system with a DGPU,
>>>>> for which VRAM placement does matter:
>>>>> https://github.com/torvalds/linux/commit/a7c0cad0dc060bb77e9c9d235d68441b0fc69507
>>>>>
>>>>> Looking around in DM/DML, for APUs, I don't see any logic that changes DCN
>>>>> bandwidth validation depending on memory placement. There's a gpuvm_enable flag
>>>>> for SG, but it's statically set to 1 on APU DCN versions. It sounds like for
>>>>> APUs specifically, we *should* be able to ignore the mem placement check. I can
>>>>> spin up a patch to test this out.
>>>>
>>>> Is the gpu_vm_support flag ever set for dGPUs?  The allowed domains
>>>> for display buffers are determined by
>>>> amdgpu_display_supported_domains() and we only allow GTT as a domain
>>>> if gpu_vm_support is set, which I think is just for APUs.  In that
>>>> case, we could probably only need the checks specifically for
>>>> CHIP_CARRIZO and CHIP_STONEY since IIRC, they don't support mixed VRAM
>>>> and GTT (only one or the other?).  dGPUs and really old APUs will
>>>> always get VRAM, and newer APUs will get VRAM | GTT.
>>>
>>> It doesn't look like gpu_vm_support is set for DGPUs
>>> https://elixir.bootlin.com/linux/v6.15.6/source/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c#L1866
>>>
>>> Though interestingly, further up at #L1858, Raven has gpu_vm_support = 0. Maybe it had stability issues?
>>> https://github.com/torvalds/linux/commit/098c13079c6fdd44f10586b69132c392ebf87450
>>
>> We need to be a little careful here asic_type == CHIP_RAVEN covers
>> several variants:
>> apu_flags & AMD_APU_IS_RAVEN - raven1 (gpu_vm_support = false)
>> apu_flags & AMD_APU_IS_RAVEN2 - raven2 (gpu_vm_support = true)
>> apu_flags & AMD_APU_IS_PICASSO - picasso (gpu_vm_support = true)
>>
>> amdgpu_display_supported_domains() only sets AMDGPU_GEM_DOMAIN_GTT if
>> gpu_vm_support is true.  so we'd never get into the check in
>> amdgpu_bo_get_preferred_domain() for raven1.
>>
>> Anyway, back to your suggestion, I think we can probably drop the
>> checks as you should always get a compatible memory buffer due to
>> amdgpu_bo_get_preferred_domain(). Pinning should fail if we can't pin
>> in the required domain.  amdgpu_display_supported_domains() will
>> ensure you always get VRAM or GTT or VRAM | GTT depending on what the
>> chip supports.  Then amdgpu_bo_get_preferred_domain() will either
>> leave that as is, or force VRAM or GTT for the STONEY/CARRIZO case.
>> On the off chance we do get incompatible memory, something like the
>> attached patch should do the trick.

Thanks for the patch, this makes sense to me.

Somewhat unrelated: I wonder if setting AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS is necessary before
bo_pin(). FWIU from chatting with our DCN experts, DCN doesn't really care if the fb is
contiguous or not.

Which begs the question -- what exactly does AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS mean? From git
history, it seems setting this flag doesn't necessarily move the bo to be congiguous. But
rather:

    When we set AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS
    - This means contiguous is not mandatory.
    - we will try to allocate the contiguous buffer. Say if the
      allocation fails, we fallback to allocate the individual pages.

https://github.com/torvalds/linux/commit/e362b7c8f8c7af00d06f0ab609629101aebae993

Does that mean -- if the buffer is already in the required domain -- that bo_pin() will also
attempt to make it contiguous? Or will it just pin it from being moved and leave it at that?

I guess in any case, it sounds like VRAM_CONTIGUOUS is not necessary for DCN scanout.
I can give dropping it a spin and see if IGT complains.

Thanks,
Leo 

>>
>> Alex
>>
> 
> Thanks for the patch, Alex.
> 
> I have tested it, and though kms_async_flips and kms_plane_alpha_blend
> pass, kms_plane_cursor still fail.
> 
> I am going to investigate a little more today and send more details from my
> findings.
> 
> Thanks.
> Cascardo.
> 
>>
>>>
>>> - Leo
>>>
>>>>
>>>> Alex
>>>>
>>>>>
>>>>> Thanks,
>>>>> Leo
>>>>>
>>>>>>>>
>>>>>>>> It's tricky to fix because you don't want to use the worst case
>>>>>>>> watermarks all the time because that will limit the number available
>>>>>>>> display options and you don't want to force everything to a particular
>>>>>>>> memory pool because that will limit the amount of memory that can be
>>>>>>>> used for display (which is what the patch in question fixed).  Ideally
>>>>>>>> the caller would do a test commit before the page flip to determine
>>>>>>>> whether or not it would succeed before issuing it and then we'd have
>>>>>>>> some feedback mechanism to tell the caller that the commit would fail
>>>>>>>> due to buffer placement so it would do a full modeset instead.  We
>>>>>>>> discussed this feedback mechanism last week at the display hackfest.
>>>>>>>>
>>>>>>>>
>>>>>>>>> kms_plane_alpha_blend works, but does this also support that test
>>>>>>>>> failing as the cause?
>>>>>>>>
>>>>>>>> That may be related.  I'm not too familiar with that test either, but
>>>>>>>> Leo or Harry can provide some guidance.
>>>>>>>>
>>>>>>>> Alex
>>>>>>>
>>>>>>> Thanks everyone for the input so far. I have a question for the
>>>>>>> maintainers, given that it seems that this is functionally broken for
>>>>>>> ASICs which are iGPUs, and there does not seem to be an easy fix, does
>>>>>>> it make sense to extend this proposed patch to all iGPUs until a more
>>>>>>> permanent fix can be identified? At the end of the day I'll take
>>>>>>> functional correctness over performance.
>>>>>>
>>>>>> It's not functional correctness, it's usability.  All that is
>>>>>> potentially broken is async flips (which depend on memory pressure and
>>>>>> buffer placement), while if you effectively revert the patch, you end
>>>>>> up  limiting all display buffers to either VRAM or GTT which may end
>>>>>> up causing the inability to display anything because there is not
>>>>>> enough memory in that pool for the next modeset.  We'll start getting
>>>>>> bug reports about blank screens and failure to set modes because of
>>>>>> memory pressure.  I think if we want a short term fix, it would be to
>>>>>> always set the worst case watermarks.  The downside to that is that it
>>>>>> would possibly cause some working display setups to stop working if
>>>>>> they were on the margins to begin with.
>>>>>>
>>>>>> Alex
>>>>>>
>>>>>>>
>>>>>>> Brian
>>>>>>>
>>>>>>>>
>>>>>>>>>
>>>>>>>>> Thanks again,
>>>>>>>>> Brian
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Alex
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Brian
>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> Alex
>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> Fixes: 81d0bcf99009 ("drm/amdgpu: make display pinning more flexible (v2)")
>>>>>>>>>>>>> Cc: Luben Tuikov <luben.tuikov@amd.com>
>>>>>>>>>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>>>>>>>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>>>>>>>>>>> Cc: stable@vger.kernel.org # 6.1+
>>>>>>>>>>>>> Tested-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
>>>>>>>>>>>>> Signed-off-by: Brian Geffon <bgeffon@google.com>
>>>>>>>>>>>>> ---
>>>>>>>>>>>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 3 ++-
>>>>>>>>>>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>>>>>>>>
>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>>>>>>>>>>> index 73403744331a..5d7f13e25b7c 100644
>>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>>>>>>>>>>> @@ -1545,7 +1545,8 @@ uint32_t amdgpu_bo_get_preferred_domain(struct amdgpu_device *adev,
>>>>>>>>>>>>>                                             uint32_t domain)
>>>>>>>>>>>>>  {
>>>>>>>>>>>>>         if ((domain == (AMDGPU_GEM_DOMAIN_VRAM | AMDGPU_GEM_DOMAIN_GTT)) &&
>>>>>>>>>>>>> -           ((adev->asic_type == CHIP_CARRIZO) || (adev->asic_type == CHIP_STONEY))) {
>>>>>>>>>>>>> +           ((adev->asic_type == CHIP_CARRIZO) || (adev->asic_type == CHIP_STONEY) ||
>>>>>>>>>>>>> +            (adev->asic_type == CHIP_RAVEN))) {
>>>>>>>>>>>>>                 domain = AMDGPU_GEM_DOMAIN_VRAM;
>>>>>>>>>>>>>                 if (adev->gmc.real_vram_size <= AMDGPU_SG_THRESHOLD)
>>>>>>>>>>>>>                         domain = AMDGPU_GEM_DOMAIN_GTT;
>>>>>>>>>>>>> --
>>>>>>>>>>>>> 2.50.0.727.gbf7dc18ff4-goog
>>>>>>>>>>>>>
>>>>>
>>>
> 
>> From cce1652c62c42c858de64c306ea0ddc7af3bd0b1 Mon Sep 17 00:00:00 2001
>> From: Alex Deucher <alexander.deucher@amd.com>
>> Date: Fri, 18 Jul 2025 18:40:26 -0400
>> Subject: [PATCH] drm/amd/display: refine framebuffer placement checks
>>
>> When we commit planes, we need to make sure the
>> framebuffer memory locations are compatible. Various
>> hardware has the following requirements for display buffers:
>> dGPUs, old APUs, raven1 - must be in VRAM
>> cazziro/stoney - must be in VRAM or GTT, but not both
>> newer APUs (raven2/picasso and newer) - can be in VRAM or GTT
>>
>> You should always get a compatible memory buffer due to
>> amdgpu_bo_get_preferred_domain(). amdgpu_display_supported_domains()
>> will ensure you always get VRAM or GTT or VRAM | GTT depending on
>> what the chip supports.  Then amdgpu_bo_get_preferred_domain()
>> will either leave that as is when pinning, or force VRAM or GTT
>> for the STONEY/CARRIZO case.
>>
>> As such the checks could probably be removed, but on the off chance
>> we do end up getting different memory pool for the old
>> and new framebuffers, refine the check to take into account the
>> hardware capabilities.
>>
>> Fixes: a7c0cad0dc06 ("drm/amd/display: ensure async flips are only accepted for fast updates")
>> Reported-by: Brian Geffon <bgeffon@google.com>
>> Cc: Leo Li <sunpeng.li@amd.com>
>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>> ---
>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 20 ++++++++++++++++---
>>  1 file changed, 17 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 129476b6d5fa9..de2bd789ec15b 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -9288,6 +9288,18 @@ static void amdgpu_dm_enable_self_refresh(struct amdgpu_crtc *acrtc_attach,
>>  	}
>>  }
>>  
>> +static bool amdgpu_dm_mem_type_compatible(struct amdgpu_device *adev,
>> +					  struct drm_framebuffer *old_fb,
>> +					  struct drm_framebuffer *new_fb)
>> +{
>> +	if (!adev->mode_info.gpu_vm_support ||
>> +	    (adev->asic_type == CHIP_CARRIZO) ||
>> +	    (adev->asic_type == CHIP_STONEY))
>> +		return get_mem_type(old_fb) == get_mem_type(new_fb);
>> +
>> +	return true;
>> +}
>> +
>>  static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>>  				    struct drm_device *dev,
>>  				    struct amdgpu_display_manager *dm,
>> @@ -9465,7 +9477,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>>  		 */
>>  		if (crtc->state->async_flip &&
>>  		    (acrtc_state->update_type != UPDATE_TYPE_FAST ||
>> -		     get_mem_type(old_plane_state->fb) != get_mem_type(fb)))
>> +		     !amdgpu_dm_mem_type_compatible(dm->adev, old_plane_state->fb, fb)))
>>  			drm_warn_once(state->dev,
>>  				      "[PLANE:%d:%s] async flip with non-fast update\n",
>>  				      plane->base.id, plane->name);
>> @@ -9473,7 +9485,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>>  		bundle->flip_addrs[planes_count].flip_immediate =
>>  			crtc->state->async_flip &&
>>  			acrtc_state->update_type == UPDATE_TYPE_FAST &&
>> -			get_mem_type(old_plane_state->fb) == get_mem_type(fb);
>> +			amdgpu_dm_mem_type_compatible(dm->adev, old_plane_state->fb, fb);
>>  
>>  		timestamp_ns = ktime_get_ns();
>>  		bundle->flip_addrs[planes_count].flip_timestamp_in_us = div_u64(timestamp_ns, 1000);
>> @@ -11760,6 +11772,7 @@ static bool amdgpu_dm_crtc_mem_type_changed(struct drm_device *dev,
>>  					    struct drm_atomic_state *state,
>>  					    struct drm_crtc_state *crtc_state)
>>  {
>> +	struct amdgpu_device *adev = drm_to_adev(dev);
>>  	struct drm_plane *plane;
>>  	struct drm_plane_state *new_plane_state, *old_plane_state;
>>  
>> @@ -11773,7 +11786,8 @@ static bool amdgpu_dm_crtc_mem_type_changed(struct drm_device *dev,
>>  		}
>>  
>>  		if (old_plane_state->fb && new_plane_state->fb &&
>> -		    get_mem_type(old_plane_state->fb) != get_mem_type(new_plane_state->fb))
>> +		    !amdgpu_dm_mem_type_compatible(adev, old_plane_state->fb,
>> +						   new_plane_state->fb))
>>  			return true;
>>  	}
>>  
>> -- 
>> 2.50.1
>>
> 


