Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 714B8B0AB3D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 23:02:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB13F10EA48;
	Fri, 18 Jul 2025 21:02:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LZhWK30o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3894B10E1C7;
 Fri, 18 Jul 2025 21:02:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nJblgls3w4KyJH1amXo47CxnoQ5x4Zy0pcKgP2oDX1lm4COup1a/ymPDzbADHntLWWo+a6d2Dh1rtR8jUuQnDEr8el//DC59ldVmJTGWsBx3FzApFgREZnmuuHIVy1lzMBcHpYdVzphy7pj4Mh4Wmu5EAYX25KTS2EuTI3bkt6ZzcwdPv4HXWnScsfLCn2Rnk2Qw9kpkFqxauQi2nlWJRw3Nif7Rhfa+tuokcnev4sr05hBtyjyuVgm2obMey7zAnUWUGjl1FusYiYlxvVC9zm7dAsYGfS/Fuv/sDrlNN/47G31qTMx5PUy5W1QmQAyW1Zp1sUFip5nkPx4DK5VJkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GkO+czA3PknHbaV686yj82z8ahWwhmysWQC3M4rXhSg=;
 b=bhdA2MLkO8ZpprUWvFKbh4bxmsgu5UwsAbwdUwxwOUneXawBCJJCeXWDlM3uFxD01jar5mHI+tDywvmUX5nj6AoumILua2BmFBE9tC00nrW7Qzdo0H9L++lJf3G0mPprpMhpVvXMrlPFgjMTZG13K962ySJxkRtbrmO8HLC4WUWbl/yzc8InDLa8rlp+My1oUtlYOjX2/o/D0KczSBX87jEx6o3SIazVwS1aQHmxWYtB5i2z+tNL6IywNzy7mRLuqtjjJkJIdxU0jOENJmLvo5+Zp4xPDpxQPsrqbQHiJ5IWvGO9VPW5io7E7OPZfASf+JSerEkAqVIMRk9b8T0W7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GkO+czA3PknHbaV686yj82z8ahWwhmysWQC3M4rXhSg=;
 b=LZhWK30o53lCGLhORQpjBRiZaQi3kVKmJgzZCVnqBdLUe13l7G4yAm0HFu+/r/iwZ4Bco3vcGAszoGyQ7LLjRYYBJf3TZKNe80c5QM/rvhZ9QNge0mHDlV82p2t7slNZ1aStPqTjj+CAJDqD3J3urBXDZ8uoW7E7m2f2Oi1kBmk=
Received: from PH8P223CA0008.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:2db::7)
 by CY3PR12MB9656.namprd12.prod.outlook.com (2603:10b6:930:101::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 21:02:33 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10b6:510:2db:cafe::be) by PH8P223CA0008.outlook.office365.com
 (2603:10b6:510:2db::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Fri,
 18 Jul 2025 21:02:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Fri, 18 Jul 2025 21:02:33 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Jul
 2025 16:02:32 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Jul
 2025 16:02:32 -0500
Received: from [10.4.13.140] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 18 Jul 2025 16:02:32 -0500
Message-ID: <46bdb101-11c6-46d4-8224-b17d1d356504@amd.com>
Date: Fri, 18 Jul 2025 17:02:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Raven: don't allow mixing GTT and VRAM
To: Alex Deucher <alexdeucher@gmail.com>, Brian Geffon <bgeffon@google.com>
CC: "Wentland, Harry" <Harry.Wentland@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Yunxiang Li <Yunxiang.Li@amd.com>, Lijo Lazar
 <lijo.lazar@amd.com>, Prike Liang <Prike.Liang@amd.com>, Pratap Nirujogi
 <pratap.nirujogi@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Garrick Evans <garrick@google.com>, "Thadeu
 Lima de Souza Cascardo" <cascardo@igalia.com>, <stable@vger.kernel.org>
References: <20250716161753.231145-1-bgeffon@google.com>
 <CADnq5_P+a2g_YzKW7S4YSF5kQgXe+PNrMKEOAHuf9yhFg98pSQ@mail.gmail.com>
 <CADyq12zB7+opz0vUgyAQSdbHcYMwbZrZp+qxKdYcqaeCeRVbCw@mail.gmail.com>
 <CADnq5_OeTJqzg0DgV06b-u_AmgaqXL5XWdQ6h40zcgGj1mCE_A@mail.gmail.com>
 <CADyq12ysC9C2tsQ3GrQJB3x6aZPzM1o8pyTW8z4bxjGPsfEZvw@mail.gmail.com>
 <CADnq5_PnktmP+0Hw0T04VkrkKoF_TGz5HOzRd1UZq6XOE0Rm1g@mail.gmail.com>
 <CADyq12x1f0VLjHKWEmfmis8oLncqSWxeTGs5wL0Xj2hua+onOQ@mail.gmail.com>
 <CADnq5_OhHpZDmV5J_5kA+avOdLrexnoRVCCCRddLQ=PPVAJsPQ@mail.gmail.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <CADnq5_OhHpZDmV5J_5kA+avOdLrexnoRVCCCRddLQ=PPVAJsPQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|CY3PR12MB9656:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b803256-3e7d-4ccc-ba8d-08ddc63e6a68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|42112799006|7416014|376014|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eE55SXlpL29yTEdLNS9yS1c2RnpBTWNvM1lYMHNYWW5WTXBJdHNmT3czTTNv?=
 =?utf-8?B?REFGdTgrUjMvWmFPQjlNWEoyT3F4S1p0MzAxUEVzN0FLMjFOVkJXSHQvT3Ry?=
 =?utf-8?B?UkNZSWtxOGc2NWl4amhVWUx0RUV5SXo3N0tXUmFxdE1XdG95ajJSbzVCRFRZ?=
 =?utf-8?B?VURuZVpJNHNVellQei8vNDRpeGZrdXloRjdlem5VYzF5enVlS0tiV2JWWXl2?=
 =?utf-8?B?V3FZTDA3aG1vTDdYMHErenIvbW03ZkdFVlJTTlh5bDVwNXl2a1JncVp0aUt6?=
 =?utf-8?B?MGJjd3B3QXRKbEpUY3NkNDlrREJ4SFZ6RUFHTW44SkZWWGJsQjlpVFovdEFB?=
 =?utf-8?B?blNJTWpqQkl6c2luTUV4WUpwa003RitvVXhYcWlWajVWUWhDREZkcm9TN0k4?=
 =?utf-8?B?M1F2SlhGelFPWThIbXpwTkpCZVFnak9MZmxleEdRamRueDQ5TWVURzJiWUl3?=
 =?utf-8?B?cmJpU2J6YW85S2drRmJXMjFnaE52cGQ1NGpTZUJVZGpCRDliRXY1SmExRW1j?=
 =?utf-8?B?Q2ZSZFBhZlg5alVZY3dBMFZqblptVk91L3I2TldabFByNEdzQzJMTHVUMjU3?=
 =?utf-8?B?MERiNGJxWFNnekYrTHN5TGwxd2NJc2hlcjRzL0RGRkNucWtVUGFYTU1kckhs?=
 =?utf-8?B?SlFIZkx6VkRQUkZ1OFdqM3VMT1FlZVVObUpDbXhZdDkxM0t5Nk5WNjRNUlFF?=
 =?utf-8?B?N2szTjdPL01JU0xMSnBYWVdBMk1saGZlVXBJQUdmWEJVcUdYSjdBOFpqSDI1?=
 =?utf-8?B?ekV5TlhFdDlzeWdOclpiMzRWQmhaWDZyU2o2anozZ1laRHV0ZGwvRENHbzZL?=
 =?utf-8?B?S2NnOE13cWxvUmhiblhpMk5mN0JFTzQ1ZW5FWDludTZnV0FDaEVpc3VhUlpj?=
 =?utf-8?B?T1EzeFowZ0Q0dHJDQXZkRXRYWG9VRGlvR044RndHNTVMMURoVEdVZElnQ096?=
 =?utf-8?B?Q1J6YVdKb3dlSmFGSmdNdEplYSszS2NDcm12OWVraVZiT2xKSGpZWnBBUWl5?=
 =?utf-8?B?Y01xeWhhdi9Fbmw2RFp4OWc3bWFOam1xeGhzSnlXajE0QUk5dnNTbWlNbkxk?=
 =?utf-8?B?ajZveGFBUW96SkNwdXFWczY0UkhNS3JYYUhiSHAwRFRlR2tkZ1pTNVVXYW5N?=
 =?utf-8?B?YzdzeE1VeUxFK0s2VFJNT2srS0kxN3YvdVdwc0ZMWVJtUDU4VG01VEF3aUY2?=
 =?utf-8?B?OEYxWWlnSkVRQ3JrekplSWR5L3hmVEVFVUVZZlZzaDZMdHh1VE9qYTJjZnJV?=
 =?utf-8?B?UDdLM1NsYXpjK011dXMwWGVob091bmgrMlQ4T1JKN3haMkcxbkExcXQ5VEdv?=
 =?utf-8?B?VHpiRVJaUUIvaHJJVkRIRU1QTUNMM1NOVjI4VGtIUldneFVYTmRWblh2T2w3?=
 =?utf-8?B?SlVkVFBDSnIxWW9STlN4aU4wZEl4cFBkUThrZWRidnZZY09ERjJnSkJDaXQx?=
 =?utf-8?B?YkJLVXdWcjcwVjdYamVvVVk4OTJ2YU8rZ2dhb2dPSzZXaUNQajd5RTR0dHV1?=
 =?utf-8?B?eHZWR3JSZ0IzbitpRlg5dVhSaENiYm5jYkZ3dm5IRVB0QUo4VjRFWm40dUY4?=
 =?utf-8?B?Yy91NjI5WEwyTktrT1dwTlhkUE5PdjBaVGhGb0JoY2pWUldXYTYrWDNIZEJj?=
 =?utf-8?B?clRNL0owSnZPNHBrdXc5TTFWY0hpUGVvWmtLMTBwaFc2UlVhemhkWHB1KzVN?=
 =?utf-8?B?MmNtdHd5VzlKOUNidHdtM3lGNUFMWnFXK1VXT0ZLNGlkcmJObUk0Yk5raXp2?=
 =?utf-8?B?WUFYU3VSeUM1bGxHTGY1b0lxUTVZOEwwTnNHT0kxcER5NEJuT1gwZVMwNkhT?=
 =?utf-8?B?TEZ2NGtzZnowR09FYlNvajlGVnlFeUQ1YXI0dmROblVCUFI4L1M0VFNIMzVZ?=
 =?utf-8?B?bHBSNTQ4RkVhdSs0NjIvSFNZSzUxUlVNR3FWczBoNkZxck11SGhINlZ2Zkdl?=
 =?utf-8?B?N1FCNC9NMWt1MnFKZmdjcEtkQ2hZZ1V3OXlsdlpjMitCYnVEbHdzNWxKbHpJ?=
 =?utf-8?B?SFh2VjJkRFBRRmp2Y2xDcnQrcU5ETmdaUUR5c3Z2QjhwUkd0OWJWWEZhR3pj?=
 =?utf-8?B?akUzaG9PN3lMQ09UV3NvMlJzOE5TNk4yOC9pUT09?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(7416014)(376014)(36860700013)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 21:02:33.1329 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b803256-3e7d-4ccc-ba8d-08ddc63e6a68
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9656
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



On 2025-07-18 16:07, Alex Deucher wrote:
> On Fri, Jul 18, 2025 at 1:57 PM Brian Geffon <bgeffon@google.com> wrote:
>>
>> On Thu, Jul 17, 2025 at 10:59 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>>>
>>> On Wed, Jul 16, 2025 at 8:13 PM Brian Geffon <bgeffon@google.com> wrote:
>>>>
>>>> On Wed, Jul 16, 2025 at 5:03 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>>>>>
>>>>> On Wed, Jul 16, 2025 at 12:40 PM Brian Geffon <bgeffon@google.com> wrote:
>>>>>>
>>>>>> On Wed, Jul 16, 2025 at 12:33 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>>>>>>>
>>>>>>> On Wed, Jul 16, 2025 at 12:18 PM Brian Geffon <bgeffon@google.com> wrote:
>>>>>>>>
>>>>>>>> Commit 81d0bcf99009 ("drm/amdgpu: make display pinning more flexible (v2)")
>>>>>>>> allowed for newer ASICs to mix GTT and VRAM, this change also noted that
>>>>>>>> some older boards, such as Stoney and Carrizo do not support this.
>>>>>>>> It appears that at least one additional ASIC does not support this which
>>>>>>>> is Raven.
>>>>>>>>
>>>>>>>> We observed this issue when migrating a device from a 5.4 to 6.6 kernel
>>>>>>>> and have confirmed that Raven also needs to be excluded from mixing GTT
>>>>>>>> and VRAM.
>>>>>>>
>>>>>>> Can you elaborate a bit on what the problem is?  For carrizo and
>>>>>>> stoney this is a hardware limitation (all display buffers need to be
>>>>>>> in GTT or VRAM, but not both).  Raven and newer don't have this
>>>>>>> limitation and we tested raven pretty extensively at the time.
>>>>>>
>>>>>> Thanks for taking the time to look. We have automated testing and a
>>>>>> few igt gpu tools tests failed and after debugging we found that
>>>>>> commit 81d0bcf99009 is what introduced the failures on this hardware
>>>>>> on 6.1+ kernels. The specific tests that fail are kms_async_flips and
>>>>>> kms_plane_alpha_blend, excluding Raven from this sharing of GTT and
>>>>>> VRAM buffers resolves the issue.
>>>>>
>>>>> + Harry and Leo
>>>>>
>>>>> This sounds like the memory placement issue we discussed last week.
>>>>> In that case, the issue is related to where the buffer ends up when we
>>>>> try to do an async flip.  In that case, we can't do an async flip
>>>>> without a full modeset if the buffers locations are different than the
>>>>> last modeset because we need to update more than just the buffer base
>>>>> addresses.  This change works around that limitation by always forcing
>>>>> display buffers into VRAM or GTT.  Adding raven to this case may fix
>>>>> those tests but will make the overall experience worse because we'll
>>>>> end up effectively not being able to not fully utilize both gtt and
>>>>> vram for display which would reintroduce all of the problems fixed by
>>>>> 81d0bcf99009 ("drm/amdgpu: make display pinning more flexible (v2)").
>>>>
>>>> Thanks Alex, the thing is, we only observe this on Raven boards, why
>>>> would Raven only be impacted by this? It would seem that all devices
>>>> would have this issue, no? Also, I'm not familiar with how
>>>
>>> It depends on memory pressure and available memory in each pool.
>>> E.g., initially the display buffer is in VRAM when the initial mode
>>> set happens.  The watermarks, etc. are set for that scenario.  One of
>>> the next frames ends up in a pool different than the original.  Now
>>> the buffer is in GTT.  The async flip interface does a fast validation
>>> to try and flip as soon as possible, but that validation fails because
>>> the watermarks need to be updated which requires a full modeset.

Huh, I'm not sure if this actually is an issue for APUs. The fix that introduced
a check for same memory placement on async flips was on a system with a DGPU,
for which VRAM placement does matter:
https://github.com/torvalds/linux/commit/a7c0cad0dc060bb77e9c9d235d68441b0fc69507

Looking around in DM/DML, for APUs, I don't see any logic that changes DCN
bandwidth validation depending on memory placement. There's a gpuvm_enable flag
for SG, but it's statically set to 1 on APU DCN versions. It sounds like for
APUs specifically, we *should* be able to ignore the mem placement check. I can
spin up a patch to test this out.

Thanks,
Leo

>>>
>>> It's tricky to fix because you don't want to use the worst case
>>> watermarks all the time because that will limit the number available
>>> display options and you don't want to force everything to a particular
>>> memory pool because that will limit the amount of memory that can be
>>> used for display (which is what the patch in question fixed).  Ideally
>>> the caller would do a test commit before the page flip to determine
>>> whether or not it would succeed before issuing it and then we'd have
>>> some feedback mechanism to tell the caller that the commit would fail
>>> due to buffer placement so it would do a full modeset instead.  We
>>> discussed this feedback mechanism last week at the display hackfest.
>>>
>>>
>>>> kms_plane_alpha_blend works, but does this also support that test
>>>> failing as the cause?
>>>
>>> That may be related.  I'm not too familiar with that test either, but
>>> Leo or Harry can provide some guidance.
>>>
>>> Alex
>>
>> Thanks everyone for the input so far. I have a question for the
>> maintainers, given that it seems that this is functionally broken for
>> ASICs which are iGPUs, and there does not seem to be an easy fix, does
>> it make sense to extend this proposed patch to all iGPUs until a more
>> permanent fix can be identified? At the end of the day I'll take
>> functional correctness over performance.
> 
> It's not functional correctness, it's usability.  All that is
> potentially broken is async flips (which depend on memory pressure and
> buffer placement), while if you effectively revert the patch, you end
> up  limiting all display buffers to either VRAM or GTT which may end
> up causing the inability to display anything because there is not
> enough memory in that pool for the next modeset.  We'll start getting
> bug reports about blank screens and failure to set modes because of
> memory pressure.  I think if we want a short term fix, it would be to
> always set the worst case watermarks.  The downside to that is that it
> would possibly cause some working display setups to stop working if
> they were on the margins to begin with.
> 
> Alex
> 
>>
>> Brian
>>
>>>
>>>>
>>>> Thanks again,
>>>> Brian
>>>>
>>>>>
>>>>> Alex
>>>>>
>>>>>>
>>>>>> Brian
>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> Alex
>>>>>>>
>>>>>>>>
>>>>>>>> Fixes: 81d0bcf99009 ("drm/amdgpu: make display pinning more flexible (v2)")
>>>>>>>> Cc: Luben Tuikov <luben.tuikov@amd.com>
>>>>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>>>>>> Cc: stable@vger.kernel.org # 6.1+
>>>>>>>> Tested-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
>>>>>>>> Signed-off-by: Brian Geffon <bgeffon@google.com>
>>>>>>>> ---
>>>>>>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 3 ++-
>>>>>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>>>>>> index 73403744331a..5d7f13e25b7c 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>>>>>> @@ -1545,7 +1545,8 @@ uint32_t amdgpu_bo_get_preferred_domain(struct amdgpu_device *adev,
>>>>>>>>                                             uint32_t domain)
>>>>>>>>  {
>>>>>>>>         if ((domain == (AMDGPU_GEM_DOMAIN_VRAM | AMDGPU_GEM_DOMAIN_GTT)) &&
>>>>>>>> -           ((adev->asic_type == CHIP_CARRIZO) || (adev->asic_type == CHIP_STONEY))) {
>>>>>>>> +           ((adev->asic_type == CHIP_CARRIZO) || (adev->asic_type == CHIP_STONEY) ||
>>>>>>>> +            (adev->asic_type == CHIP_RAVEN))) {
>>>>>>>>                 domain = AMDGPU_GEM_DOMAIN_VRAM;
>>>>>>>>                 if (adev->gmc.real_vram_size <= AMDGPU_SG_THRESHOLD)
>>>>>>>>                         domain = AMDGPU_GEM_DOMAIN_GTT;
>>>>>>>> --
>>>>>>>> 2.50.0.727.gbf7dc18ff4-goog
>>>>>>>>

