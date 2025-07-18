Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D04B0ABE2
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 00:01:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911B910EA4E;
	Fri, 18 Jul 2025 22:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rvwwX4gt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2084.outbound.protection.outlook.com [40.107.101.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E83D10E187;
 Fri, 18 Jul 2025 22:01:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hTyvJ0yYfWKzpmrQzv3k2vbCz6msY4sTABe9HDwAfQTS0p1pUlxiMKMl6G9+piu+9/eoEa28KwxowkKT8xMrXctgfyDejWdkugQ2uXkjmc57n01ebb/gNTmnETKxOW3KGgXKeJ+Snn/IhLIjmIsm41CoWZx2tH4neXKXcefRNshVe8LBBmhCPDJGz66jlf0kxcdwZ3Q/xPcN0NoOsHRJDs4my0Xmu40e+ciY26E6Sahfd0X7/YJFsH6Dsk15WIBlmD2zXpOO6r2GPtojdi4DJ0GKv8p2s0IA0S+MGIqABJV4+FXFNW72fiu3fEP6RRkLHQ089mCJb1ZBGTz/+Ga/Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oCB0F3+fQowiYLnKaCloMmUSkZ/r85iJKNxb4r5GAog=;
 b=Xl3KuxYYjPccqlOPzZ8yjoqAq1fyrcVk0iII8t8B9V8+I33PagJzwsU3e4Np2LOoRwIN3bNlrY7l3QJbWuDEYtjQFRLPlSvNubFeFNP6jMKZbdhxFNQEWzOc/4x36hOZC54KTBmiztbKY1y0SPinHHAhLtOlJjgCarMtYJBkATmWPvQYuVo0Csk+nE2FYC2zkcnLpVyLPpyZppX/6WwcgfskMfKoQPxUKov4uqg/Tbzos5GFF5+EjmPIAM5+Eh40VFta6IRGwxAy8DRhQ693kXOiGKV8K/kx0qg427whZaNYu3OUrIwvOtT2YCkn0aRwwRGS7BKGNril7j3AKzvxtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCB0F3+fQowiYLnKaCloMmUSkZ/r85iJKNxb4r5GAog=;
 b=rvwwX4gtrepmzfTXwRt6PpGXA7LiMcVvDUNa6DowtHjgq5+mB3OTA0iQJ22XO/ck2FLRrs1dot3OV5EzgsKcRhHIoMrDlDqoazxJKabsa9PLVx1vzSzT42mFiDvmlIN5+RLm0Px2M0W2+Bqqo+zjG0eUnA6LxKT7tc2b27sKZ8M=
Received: from BN1PR10CA0012.namprd10.prod.outlook.com (2603:10b6:408:e0::17)
 by DM6PR12MB4059.namprd12.prod.outlook.com (2603:10b6:5:215::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.26; Fri, 18 Jul
 2025 22:01:41 +0000
Received: from BN1PEPF00005FFD.namprd05.prod.outlook.com
 (2603:10b6:408:e0:cafe::80) by BN1PR10CA0012.outlook.office365.com
 (2603:10b6:408:e0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Fri,
 18 Jul 2025 22:01:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFD.mail.protection.outlook.com (10.167.243.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Fri, 18 Jul 2025 22:01:41 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Jul
 2025 17:01:40 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Jul
 2025 17:01:40 -0500
Received: from [10.4.13.140] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 18 Jul 2025 17:01:39 -0500
Message-ID: <eff0ef03-d054-487e-b3bf-96bf394a3bf5@amd.com>
Date: Fri, 18 Jul 2025 18:01:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Raven: don't allow mixing GTT and VRAM
To: Alex Deucher <alexdeucher@gmail.com>
CC: Brian Geffon <bgeffon@google.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Yunxiang Li
 <Yunxiang.Li@amd.com>, Lijo Lazar <lijo.lazar@amd.com>, Prike Liang
 <Prike.Liang@amd.com>, Pratap Nirujogi <pratap.nirujogi@amd.com>, "Luben
 Tuikov" <luben.tuikov@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Garrick
 Evans" <garrick@google.com>, Thadeu Lima de Souza Cascardo
 <cascardo@igalia.com>, <stable@vger.kernel.org>
References: <20250716161753.231145-1-bgeffon@google.com>
 <CADnq5_P+a2g_YzKW7S4YSF5kQgXe+PNrMKEOAHuf9yhFg98pSQ@mail.gmail.com>
 <CADyq12zB7+opz0vUgyAQSdbHcYMwbZrZp+qxKdYcqaeCeRVbCw@mail.gmail.com>
 <CADnq5_OeTJqzg0DgV06b-u_AmgaqXL5XWdQ6h40zcgGj1mCE_A@mail.gmail.com>
 <CADyq12ysC9C2tsQ3GrQJB3x6aZPzM1o8pyTW8z4bxjGPsfEZvw@mail.gmail.com>
 <CADnq5_PnktmP+0Hw0T04VkrkKoF_TGz5HOzRd1UZq6XOE0Rm1g@mail.gmail.com>
 <CADyq12x1f0VLjHKWEmfmis8oLncqSWxeTGs5wL0Xj2hua+onOQ@mail.gmail.com>
 <CADnq5_OhHpZDmV5J_5kA+avOdLrexnoRVCCCRddLQ=PPVAJsPQ@mail.gmail.com>
 <46bdb101-11c6-46d4-8224-b17d1d356504@amd.com>
 <CADnq5_PwyUwqdv1QG_O2XgvNnax+FNskuppBaKx8d0Kp582wXg@mail.gmail.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <CADnq5_PwyUwqdv1QG_O2XgvNnax+FNskuppBaKx8d0Kp582wXg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: sunpeng.li@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFD:EE_|DM6PR12MB4059:EE_
X-MS-Office365-Filtering-Correlation-Id: 89fce9dd-0c97-4783-f074-08ddc646ad1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|42112799006|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SU1vWEV2MmE4RU5mM1lWdmFhT0F6d3AyeVlnU0k1L2l5S3RWeWhtd0pmVFhS?=
 =?utf-8?B?V2QxT25rS0lnSURmZ2czVHNpckJMT2w1azZkVkFGZURSYlVPc0lBZTJCWjlx?=
 =?utf-8?B?TWxxMkl6QmFoLzVtUGx0MUZpMmlrWXhMQzFCand6MHZLdWd6eFY5NGdFSWxI?=
 =?utf-8?B?NHdOemkvUnluZEdkTzFMcit2RC9WanBIdTNnU0VqL09JMXpBMjZYQjNoYzBN?=
 =?utf-8?B?S21ZREV5blpyc3VIZFAra204Uk9pWjg2bk5udUhmQTRibXUveWJWV1NqL1V6?=
 =?utf-8?B?R2VmQ0xrUHdjY2cvUHM2WTdFbFdCWnpWcldvazQreHJZN2htQk4xcVlhV21P?=
 =?utf-8?B?R1doc0V0WVEzOXYybmRPZE53S3hvaHZaRm1Ddjl1SWhHcFFtd1lkRHQvWStO?=
 =?utf-8?B?ZnJSbVhycjhvSUJrNUZKQVhNWC9yZlBwSGZPNlNSbkNoTHVSa1I2bnNYUWwz?=
 =?utf-8?B?NDRZYXlTbDlNOTNLOTVnbVpRcXRORUpyYVlaY09oS08wV09YeFBQaVVmQkto?=
 =?utf-8?B?a3A0L096ODE1QmtBeUdmL0xxWWIrRkRqZFR2Z210MWQ5bnBhTCtualFxL1Zn?=
 =?utf-8?B?K00vRGg3dDJ5allXbjNwUXIvby9xWTIvWi9oQXZaZm5KSXNBWDV0cXBWN2RM?=
 =?utf-8?B?ajA1Q0dKQjFkb2N6aXNjMmVJcTJDSmFtUVZLaWMza3VxYTNJakFmaGtQSnBv?=
 =?utf-8?B?a051d1VWUnkvZjFOcnIzV0FKTkNnQWNHYndlblpEdHdjLzk1UUZrL0VpWng0?=
 =?utf-8?B?aVZTZk9ZdHRsVTVyVmdvZzNsekhkUzlGSXdreDFmYWl6M1NZWXIyQytoeW5I?=
 =?utf-8?B?cHUrUExqMGE2VUR3MHpoam13YWxwWHl0OUMwbWJSMndCYkFySmV1SlEyeUVJ?=
 =?utf-8?B?anFpTXhoWkxqRWwycGg0K1R6blY5QjgrK1FSeDkyNDg0S1hudTZOcjkvS2t3?=
 =?utf-8?B?ZTUwTUtSVHdPYzVBa1Q4aHVqSXpDRUtFSkdjOXNQelphaVhTT2FFc0Z2VlAy?=
 =?utf-8?B?N1l5OGx3YWUzMHZ1TGJFdG5wN1BKaEhUUmpuRTVrYXpCN29Tdi95QlRYWUxw?=
 =?utf-8?B?UXMxL202RzBvTU90WnpWVm1wOXZJMlFNb0JkTFd6ZzlXMFRHdnpzdEVxOTNO?=
 =?utf-8?B?QTRRSUx1RnZEcGlFdGwrTGtnZXJBblJsaWEvbjBaWW1EYmtUNzNySHMrTHFM?=
 =?utf-8?B?bStEeG1qbFRVRWRHeTdjdFVOc2FZR3VmZm9XOGNPSVNadHJmZ2RkM2RTeExz?=
 =?utf-8?B?Y0dLQkQ1d0pIdW51bmNMY0FXNFpkZWJuOERUL0JVeGl5S25QZm0xY1h0SUVa?=
 =?utf-8?B?YW43R2hIeTQrQTN0MGlZN2ZBNTlMcjVFWVNxc1ZFRVBGVjkyc25DTnhzZytQ?=
 =?utf-8?B?cXY1ck0rRVRlTmlxR0RHcjZRRy81bnVUR0VNdHdEU2lqcU4wNjRuUGxrdm8x?=
 =?utf-8?B?ZDhEZUFmbHRHcFRzWWMyWEwvZjRKS2pkS0h0RUlHanNFcG1rRUM3cmo3U21J?=
 =?utf-8?B?Y0lPc3F2eXhyRUhTY1F5WHJoZ0ZwRUowTEUwTnpONW5LVVFMTXp3YzdOM2Mr?=
 =?utf-8?B?ZDd3YlY5czFGd3M5VWRCRFdsNFovVURjYnd3TEVFT0I5d0tOc0NRQWlGNTZ0?=
 =?utf-8?B?RlN4WnRkN2RjRThDU3k1SVU2WnJCaldiK0RoU0J3aFdQMS9Qd2lkeWNUaVNB?=
 =?utf-8?B?TnZkNGR5MlFnY3NMVVdxUmlMN1RkVThUY2wwLzZkUjMyTlhTQmFSKzFGc3hM?=
 =?utf-8?B?N1pTQmhVN0VkamJCWWIrOGI2L1FpdWlEVFZoTmFuZjFNWWY1VDAzNFBZVEox?=
 =?utf-8?B?R1lDNkZOdnBVV2U0WTJoQXpMNnhYa2pTQ2s1SjZoOWRpNTNVZmRleTBNSmRm?=
 =?utf-8?B?SGc1S290UFRKYk9Wd2ZWL0xkbldQMVUzUGNZR002TnNOQTlOV0VxcURYVnpy?=
 =?utf-8?B?ZUk1STFMWHR1YTY1cFhuUHp2aUk2SDc2MDRqMkpDclF4d0VuV29NamJkcTRi?=
 =?utf-8?Q?lwvIpVaT4FTvLxAFGWjIxGE+ha++7E=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(42112799006)(7416014)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 22:01:41.0357 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89fce9dd-0c97-4783-f074-08ddc646ad1b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4059
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



On 2025-07-18 17:33, Alex Deucher wrote:
> On Fri, Jul 18, 2025 at 5:02 PM Leo Li <sunpeng.li@amd.com> wrote:
>>
>>
>>
>> On 2025-07-18 16:07, Alex Deucher wrote:
>>> On Fri, Jul 18, 2025 at 1:57 PM Brian Geffon <bgeffon@google.com> wrote:
>>>>
>>>> On Thu, Jul 17, 2025 at 10:59 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>>>>>
>>>>> On Wed, Jul 16, 2025 at 8:13 PM Brian Geffon <bgeffon@google.com> wrote:
>>>>>>
>>>>>> On Wed, Jul 16, 2025 at 5:03 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>>>>>>>
>>>>>>> On Wed, Jul 16, 2025 at 12:40 PM Brian Geffon <bgeffon@google.com> wrote:
>>>>>>>>
>>>>>>>> On Wed, Jul 16, 2025 at 12:33 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>>>>>>>>>
>>>>>>>>> On Wed, Jul 16, 2025 at 12:18 PM Brian Geffon <bgeffon@google.com> wrote:
>>>>>>>>>>
>>>>>>>>>> Commit 81d0bcf99009 ("drm/amdgpu: make display pinning more flexible (v2)")
>>>>>>>>>> allowed for newer ASICs to mix GTT and VRAM, this change also noted that
>>>>>>>>>> some older boards, such as Stoney and Carrizo do not support this.
>>>>>>>>>> It appears that at least one additional ASIC does not support this which
>>>>>>>>>> is Raven.
>>>>>>>>>>
>>>>>>>>>> We observed this issue when migrating a device from a 5.4 to 6.6 kernel
>>>>>>>>>> and have confirmed that Raven also needs to be excluded from mixing GTT
>>>>>>>>>> and VRAM.
>>>>>>>>>
>>>>>>>>> Can you elaborate a bit on what the problem is?  For carrizo and
>>>>>>>>> stoney this is a hardware limitation (all display buffers need to be
>>>>>>>>> in GTT or VRAM, but not both).  Raven and newer don't have this
>>>>>>>>> limitation and we tested raven pretty extensively at the time.
>>>>>>>>
>>>>>>>> Thanks for taking the time to look. We have automated testing and a
>>>>>>>> few igt gpu tools tests failed and after debugging we found that
>>>>>>>> commit 81d0bcf99009 is what introduced the failures on this hardware
>>>>>>>> on 6.1+ kernels. The specific tests that fail are kms_async_flips and
>>>>>>>> kms_plane_alpha_blend, excluding Raven from this sharing of GTT and
>>>>>>>> VRAM buffers resolves the issue.
>>>>>>>
>>>>>>> + Harry and Leo
>>>>>>>
>>>>>>> This sounds like the memory placement issue we discussed last week.
>>>>>>> In that case, the issue is related to where the buffer ends up when we
>>>>>>> try to do an async flip.  In that case, we can't do an async flip
>>>>>>> without a full modeset if the buffers locations are different than the
>>>>>>> last modeset because we need to update more than just the buffer base
>>>>>>> addresses.  This change works around that limitation by always forcing
>>>>>>> display buffers into VRAM or GTT.  Adding raven to this case may fix
>>>>>>> those tests but will make the overall experience worse because we'll
>>>>>>> end up effectively not being able to not fully utilize both gtt and
>>>>>>> vram for display which would reintroduce all of the problems fixed by
>>>>>>> 81d0bcf99009 ("drm/amdgpu: make display pinning more flexible (v2)").
>>>>>>
>>>>>> Thanks Alex, the thing is, we only observe this on Raven boards, why
>>>>>> would Raven only be impacted by this? It would seem that all devices
>>>>>> would have this issue, no? Also, I'm not familiar with how
>>>>>
>>>>> It depends on memory pressure and available memory in each pool.
>>>>> E.g., initially the display buffer is in VRAM when the initial mode
>>>>> set happens.  The watermarks, etc. are set for that scenario.  One of
>>>>> the next frames ends up in a pool different than the original.  Now
>>>>> the buffer is in GTT.  The async flip interface does a fast validation
>>>>> to try and flip as soon as possible, but that validation fails because
>>>>> the watermarks need to be updated which requires a full modeset.
>>
>> Huh, I'm not sure if this actually is an issue for APUs. The fix that introduced
>> a check for same memory placement on async flips was on a system with a DGPU,
>> for which VRAM placement does matter:
>> https://github.com/torvalds/linux/commit/a7c0cad0dc060bb77e9c9d235d68441b0fc69507
>>
>> Looking around in DM/DML, for APUs, I don't see any logic that changes DCN
>> bandwidth validation depending on memory placement. There's a gpuvm_enable flag
>> for SG, but it's statically set to 1 on APU DCN versions. It sounds like for
>> APUs specifically, we *should* be able to ignore the mem placement check. I can
>> spin up a patch to test this out.
> 
> Is the gpu_vm_support flag ever set for dGPUs?  The allowed domains
> for display buffers are determined by
> amdgpu_display_supported_domains() and we only allow GTT as a domain
> if gpu_vm_support is set, which I think is just for APUs.  In that
> case, we could probably only need the checks specifically for
> CHIP_CARRIZO and CHIP_STONEY since IIRC, they don't support mixed VRAM
> and GTT (only one or the other?).  dGPUs and really old APUs will
> always get VRAM, and newer APUs will get VRAM | GTT.

It doesn't look like gpu_vm_support is set for DGPUs
https://elixir.bootlin.com/linux/v6.15.6/source/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c#L1866

Though interestingly, further up at #L1858, Raven has gpu_vm_support = 0. Maybe it had stability issues?
https://github.com/torvalds/linux/commit/098c13079c6fdd44f10586b69132c392ebf87450

- Leo

> 
> Alex
> 
>>
>> Thanks,
>> Leo
>>
>>>>>
>>>>> It's tricky to fix because you don't want to use the worst case
>>>>> watermarks all the time because that will limit the number available
>>>>> display options and you don't want to force everything to a particular
>>>>> memory pool because that will limit the amount of memory that can be
>>>>> used for display (which is what the patch in question fixed).  Ideally
>>>>> the caller would do a test commit before the page flip to determine
>>>>> whether or not it would succeed before issuing it and then we'd have
>>>>> some feedback mechanism to tell the caller that the commit would fail
>>>>> due to buffer placement so it would do a full modeset instead.  We
>>>>> discussed this feedback mechanism last week at the display hackfest.
>>>>>
>>>>>
>>>>>> kms_plane_alpha_blend works, but does this also support that test
>>>>>> failing as the cause?
>>>>>
>>>>> That may be related.  I'm not too familiar with that test either, but
>>>>> Leo or Harry can provide some guidance.
>>>>>
>>>>> Alex
>>>>
>>>> Thanks everyone for the input so far. I have a question for the
>>>> maintainers, given that it seems that this is functionally broken for
>>>> ASICs which are iGPUs, and there does not seem to be an easy fix, does
>>>> it make sense to extend this proposed patch to all iGPUs until a more
>>>> permanent fix can be identified? At the end of the day I'll take
>>>> functional correctness over performance.
>>>
>>> It's not functional correctness, it's usability.  All that is
>>> potentially broken is async flips (which depend on memory pressure and
>>> buffer placement), while if you effectively revert the patch, you end
>>> up  limiting all display buffers to either VRAM or GTT which may end
>>> up causing the inability to display anything because there is not
>>> enough memory in that pool for the next modeset.  We'll start getting
>>> bug reports about blank screens and failure to set modes because of
>>> memory pressure.  I think if we want a short term fix, it would be to
>>> always set the worst case watermarks.  The downside to that is that it
>>> would possibly cause some working display setups to stop working if
>>> they were on the margins to begin with.
>>>
>>> Alex
>>>
>>>>
>>>> Brian
>>>>
>>>>>
>>>>>>
>>>>>> Thanks again,
>>>>>> Brian
>>>>>>
>>>>>>>
>>>>>>> Alex
>>>>>>>
>>>>>>>>
>>>>>>>> Brian
>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Alex
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Fixes: 81d0bcf99009 ("drm/amdgpu: make display pinning more flexible (v2)")
>>>>>>>>>> Cc: Luben Tuikov <luben.tuikov@amd.com>
>>>>>>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>>>>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>>>>>>>> Cc: stable@vger.kernel.org # 6.1+
>>>>>>>>>> Tested-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
>>>>>>>>>> Signed-off-by: Brian Geffon <bgeffon@google.com>
>>>>>>>>>> ---
>>>>>>>>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 3 ++-
>>>>>>>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>>>>>>>> index 73403744331a..5d7f13e25b7c 100644
>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>>>>>>>> @@ -1545,7 +1545,8 @@ uint32_t amdgpu_bo_get_preferred_domain(struct amdgpu_device *adev,
>>>>>>>>>>                                             uint32_t domain)
>>>>>>>>>>  {
>>>>>>>>>>         if ((domain == (AMDGPU_GEM_DOMAIN_VRAM | AMDGPU_GEM_DOMAIN_GTT)) &&
>>>>>>>>>> -           ((adev->asic_type == CHIP_CARRIZO) || (adev->asic_type == CHIP_STONEY))) {
>>>>>>>>>> +           ((adev->asic_type == CHIP_CARRIZO) || (adev->asic_type == CHIP_STONEY) ||
>>>>>>>>>> +            (adev->asic_type == CHIP_RAVEN))) {
>>>>>>>>>>                 domain = AMDGPU_GEM_DOMAIN_VRAM;
>>>>>>>>>>                 if (adev->gmc.real_vram_size <= AMDGPU_SG_THRESHOLD)
>>>>>>>>>>                         domain = AMDGPU_GEM_DOMAIN_GTT;
>>>>>>>>>> --
>>>>>>>>>> 2.50.0.727.gbf7dc18ff4-goog
>>>>>>>>>>
>>

