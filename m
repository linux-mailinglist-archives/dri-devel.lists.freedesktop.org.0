Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1A84A785B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 19:57:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2D710E3A1;
	Wed,  2 Feb 2022 18:57:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2060.outbound.protection.outlook.com [40.107.102.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA83D10E3A1;
 Wed,  2 Feb 2022 18:57:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nzqr1KZXP90lIAjP2CQHu03o7bwbm6/rkZAiH5ewXuPVQZucTRBDyj/5Kt7J4zZwmYc5cGwoH+h1OJEuXIxHweZm5mTzXtmI48W6gt03jz74ATpgfH2acLoS7ub347DSdY7RpV+hxeCgamoRL0axkMZphpAH3PuZRPpVUR2YNx1RmDQkKh16K8OxjVYB46D2GHMWp+VKOwTq9lLHUgOtqXOxcOnr4gCXpCF+l79Bvlfnapzj1bm7rYteCsJaPTRx9cXx77nYUmVetBF3YsA1U6UBz+Qvuzjt3+TX0gVBKSV8IZWcMxM+rhpo5d7jvKE9affcAUIrIzdN2vsohFKeXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DvE/nliQIFAliMfZYD2caQHMhh9dm8sK3wikmQFwgVo=;
 b=InfgQloUDMfzBwJFeox1tm3FBaH6u6ekWQJr95u0/eB2WXwIdN3I5C25VdgwLpETMgF7j9HF06QDmD9LkzFr6j+RM4WYgf849L/Zk76G/geD5XvrfZMDiX1F3q/CxLDCTiyCmf+avqs51Z29V5bvysFd0ORsTKj8VTfz6DCHBrY6sKqj8rw6ziepVL69be60Y6IjGOBc+t3GTDg7ej5GQZgP4PfzFqayArqb0GS3WRwcdiuTAEWNmds6WoT5AQKQAEXb1A1xq/qJ326WxjsiyR3qKb2+qkF7tUEuH62iGZfSGQYihKjIDx40yDiRsnbZdF96htf1RfgwZ20AzzJ5iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DvE/nliQIFAliMfZYD2caQHMhh9dm8sK3wikmQFwgVo=;
 b=qSHa8Yxc5+5ejiiY7SutSncGJLZbLbkkQD3X9aMG6BAXj0MZ5StYSgCRQ1uaEp1wKTCpFNY8fW0lnwgGWBJDSwpVw13xadnxIImxGYLAR5PtkYjs5cxqwKZkE8TUnTwN++uI0tkp2bDqYzH76UFztVdSgLQ7lVS2/WAcMwVktwY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM5PR12MB2536.namprd12.prod.outlook.com (2603:10b6:4:b3::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Wed, 2 Feb
 2022 18:57:46 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::a105:faab:243:1dd3]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::a105:faab:243:1dd3%11]) with mapi id 15.20.4930.022; Wed, 2 Feb 2022
 18:57:46 +0000
Message-ID: <630601d7-b409-ec99-732f-dd961f737b0b@amd.com>
Date: Wed, 2 Feb 2022 13:57:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC v3 00/12] Define and use reset domain for GPU recovery in
 amdgpu
Content-Language: en-US
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220125223752.200211-1-andrey.grodzovsky@amd.com>
 <22cc504b-8f40-2c11-c783-ed4548e092b2@amd.com>
In-Reply-To: <22cc504b-8f40-2c11-c783-ed4548e092b2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0014.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::16) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 238deaa8-5978-4545-a72c-08d9e67de650
X-MS-TrafficTypeDiagnostic: DM5PR12MB2536:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB2536C88A860457FF4EF22AADEA279@DM5PR12MB2536.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F6LMno1nKpkB8SYf5SMI4UbMuBtm+5BZxb07sNcViYsVkuR8xIjaJv66SyBbJJxpTVOrgZ3LE3s4sGwarZazhIuFKON1VU574nM1IdJ7Lsf0k+3XFHSAm96u8WjAeA+jN6vReIm5WyVpMi7664WrIkByC0v1UmwR6zuChfeDyeaPqg6vFiWuwjpVrFi8/OnRxhns/ctqGclS8pefMMRZHcZTqwzGmXi1Vn6iTOUPpa8ud8qtRc4s86LKe6tzATI69JnLLc+YPwsc2XCZwLM0+KJm8Dr35lAwVfwKcXYA1TmHkKMj0B61d0lzCG+p5oKnmFz86thjFE2jm2CALYK/VWA27fo6iX9aDqVH3IWiuBFeM5ClvWBvMAUFIMsMMO52zGj2efPRhhffKPAbxxTDMKGsr4PDV9iGWyoU0LSGMThhUEVz0gfrUcH3cI+YXUWTvnMC0nHwJ8mC5W/EZQQBDA3aKTzTqnNA9Rz80WvLARJ5vxDT/vj0fl8XSxVFRUF90btsfwcwkhTuRAKa5gSA7JKvU9VKUy96occNSCxCyQWOv76J7I6wT277B7xR4a5Q3ugwwQ7AgIgKHxXrc3zSMv82nlXGAqJc112HT3lL7Wh2wWeEt0ov+I1f7MffYXKJJw5eiMK8G0v0exVZwtiERhn38af70dzIpV975dC1R1XuxLiTb3CKv7lj88PwgRRvO1F+0g94l0IVIvjt31gBvf07LWazTw5ZXHgkULsBC89K/HsYj+yIdzjsyxXqlNJX5D/uKqjt+AI5KPdvdjCoB+86dXPg/mv47Zgp10JlHhUmmFKANkt3xF5OQGMjymXAiWzynV8lfZc3WrCl4U6AsG7Z8tYDz50SPuk1R8nVuKQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(4326008)(5660300002)(36756003)(2906002)(44832011)(31686004)(53546011)(31696002)(6506007)(6512007)(966005)(8676002)(8936002)(66476007)(66556008)(66946007)(186003)(508600001)(86362001)(316002)(38100700002)(2616005)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnpoTU1lVHRZa1U0c1N0bWlhUzg0WUhBd0hkUjcwTTduL1doZGpTaUkzZTZR?=
 =?utf-8?B?Vmw2Q3IzNENlMmVPOVRZYmJrTHJyMDZ4Q25TVS9RcVdPNEZaakhlU3dIeG1y?=
 =?utf-8?B?NzJYSGozL1g2cHN1ZTN2WXI3NFRMRlVpdXZEVlZHYnJaRHNMUWlaUnZJOTZl?=
 =?utf-8?B?NzYyL2JmS204a0kzUC9sajNhSlA1ODNNck9vTGdCSXlKV2JFK25PaU4zRXNr?=
 =?utf-8?B?RjdFZjkwYlpHazR1elNaeVhzZlpHR0hVUHZlNjdiK0crUUthUS9hck1PVjVv?=
 =?utf-8?B?dmQ3cWhtRUthdjhuRjk1bWVXUDVhM3I4WEtWUmZNT2VpQTNTbFJSaUlDYlJV?=
 =?utf-8?B?YUVjV3RWV1NGTGhWM2FILzMzRXMvTmZGN0cxWE5xcVVCT2pCeXg3S2FCc3I0?=
 =?utf-8?B?L3NHNDdVaFhNaXVZZE9iTG9XNnJrQ0wrVEE4c2ZjbzlZby9lZDhycHdXcFVT?=
 =?utf-8?B?TlZvSTRnNGl4V0VWTlJMMHA0Z1lQZ1RnRlExTmRNOEIwajlZc3lSZzVxS1Vz?=
 =?utf-8?B?eW5tWWpsRjllc3lMM0FLN2V0YXd4VWY0UlFrWllLMVVRM3BtTEZMR2RkaGZu?=
 =?utf-8?B?L0JFSmI0dzVyQ2lrRHJjUVJtYUlIV0JqTWU5cSswODlWRVJFQlNFU3JUWkI2?=
 =?utf-8?B?dVFMcFJacmIxckdpRmVVcFozMjllSUNXaXExWjhDc2MzZm5GNi9PZTNPUUlD?=
 =?utf-8?B?ZEcxS0EwMmRSNExQeUp0cnBXaVcyUitWRG9yY1k5ekRkTFozclJ6WTVKZmN6?=
 =?utf-8?B?dmhOR0dRSTZBRXR3ajRJblpiZUxGK0txMUlQcUthSUZEU2VEOEJjUkNraFV2?=
 =?utf-8?B?M1JiYXRiT1YyQjR6VlBJZ3g5bUxWYkJTUnl6cWpBTzJEZHVDOFpSQm8vU254?=
 =?utf-8?B?cjE4TlVPSFcxVzM5OFVpNlNRS3Z4RXpKd1BFajljSTNBYzdqRDl0OTZXdEht?=
 =?utf-8?B?eElINWRENEcwYm1uVmxKN3lXNjU5aVRlNDBwQ01vWjB3K1VieFlkRVRNWmRM?=
 =?utf-8?B?REQvdGhIOG4vZ0pyV1EyTlE5UVRtbHJwR1F1NFY2Tk01OTZiZ1RPMm9udy9k?=
 =?utf-8?B?N2pSdWwra3lMUFMycVNSaENlc3loaU9Bb0dveVFsRHJ3c3JmZ2l3WmplSHU5?=
 =?utf-8?B?cmR2UFVPb2dKYmNENlh4b0YwaXNZZ0tDa0d6c3gyS0Y3S3RjSjNEWkgzb25X?=
 =?utf-8?B?MGhseXAwK1RETnZ4TTdpVnZlUEUwM21idGZUdHRWZkVSS2FQaTJSZCt1TTJB?=
 =?utf-8?B?dStxOS9RcmlKazF2L3h4Zmo1bCsybW4rZmNOemlTTVlNREhuT09rSmF1M0k5?=
 =?utf-8?B?bWxLYkt6VTM5OGxJS2xqaHlpdmUwMm52SjVHZndkSjd3c0wvL0FvVjdKWUZ0?=
 =?utf-8?B?MWN1YlZrelFmZkk4OHJQZS94OHBTVmhkV3R4eFVmbWhyeUYwalZRSjEvRzhm?=
 =?utf-8?B?WTl6ZU9McUlvQ3c5NUtlSkh5T3RmTDdzT25vcy83U3pxQ2QrVkxKOHgyNDJl?=
 =?utf-8?B?YlhIYlNUS1pKeW15VEJYcFl6M0JkSXhOMXNSdWpvZGVVLzdWbFNzMmU0NXlU?=
 =?utf-8?B?eEdhazZ0RjladDdoV3YwMVFZUjU0cGpyTzlQeFZhelRDN09Vb1J5UVpUR3R3?=
 =?utf-8?B?eWw4TEFkSVdnTWVhSG1mQ3FaTXBkdy9takNENnNKT2xBWW9qTHU3Q2Z1OTVT?=
 =?utf-8?B?SStqcVNlV3pvcS9ROVhHYjdOcjdIQ0pwMFByN01zNU9VRENvWGFMY0ltVEV3?=
 =?utf-8?B?MkZESU83MWhqQ2xXQld2UXVMbXBJeFhiK2hNanQ1RFFibWs2V2J3a3gvWXNE?=
 =?utf-8?B?UWQzY1NvYkZkUDZCVVo3UzlwK0VRZ2E3ckRsVThMeTZyQVIxY1k5OWE4L0Yx?=
 =?utf-8?B?dE5nakpON216a2VyZFdWMW1UT3p0allRbFJpNm9qUWdWWGtaM292NzlKbjZW?=
 =?utf-8?B?MlZJVHlJbmhHaVJGbHowRnlyTHJRbGhoUGtXMkRxZFF3c0licExuUForNFRE?=
 =?utf-8?B?UUg2ZjU4d3B2N1pqR0NNM0FaWE5jKzUvdjFsQ21lbUdMOGF2NWR6Q1N4SFpH?=
 =?utf-8?B?WGtGalMzTDUwRXE0QkpZUlc5UTd0R0JoUU4vMW54bUduZm1WamxHeTdyRGt4?=
 =?utf-8?B?dW5wUXdTY1ZNK1hkeVV3U25KajFJVk9TelBFbllrbkJwcUsyYWpMbk0wNytF?=
 =?utf-8?B?NEpXRnFJeDlvOFVkYXNZSCtxYkZ1RTFPSE4ySzVyQ1lQeEdtK2pHcDU4ZnYz?=
 =?utf-8?Q?84Jgh+6shqi53FfNBXXkTMqQx8DympcvlR1EdM0CHs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 238deaa8-5978-4545-a72c-08d9e67de650
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 18:57:46.1950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o3SJ76EEAg+zay26BBmKZ1maO7SxQX9hpX7/xUxsEqHsfn+R1O1P3fVE+d+1TUfgQdIKUERZT4QP9C6YLXVp1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2536
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
Cc: horace.chen@amd.com, lijo.lazar@amd.com, jingwech@amd.com,
 christian.koenig@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just another ping, with Shyun's help I was able to do some smoke testing 
on XGMI SRIOV system (booting and triggering hive reset)
and for now looks good.

Andrey

On 2022-01-28 14:36, Andrey Grodzovsky wrote:
> Just a gentle ping if people have more comments on this patch set ? 
> Especially last 5 patches
> as first 7 are exact same as V2 and we already went over them mostly.
>
> Andrey
>
> On 2022-01-25 17:37, Andrey Grodzovsky wrote:
>> This patchset is based on earlier work by Boris[1] that allowed to 
>> have an
>> ordered workqueue at the driver level that will be used by the different
>> schedulers to queue their timeout work. On top of that I also serialized
>> any GPU reset we trigger from within amdgpu code to also go through 
>> the same
>> ordered wq and in this way simplify somewhat our GPU reset code so we 
>> don't need
>> to protect from concurrency by multiple GPU reset triggeres such as 
>> TDR on one
>> hand and sysfs trigger or RAS trigger on the other hand.
>>
>> As advised by Christian and Daniel I defined a reset_domain struct 
>> such that
>> all the entities that go through reset together will be serialized 
>> one against
>> another.
>>
>> TDR triggered by multiple entities within the same domain due to the 
>> same reason will not
>> be triggered as the first such reset will cancel all the pending 
>> resets. This is
>> relevant only to TDR timers and not to triggered resets coming from 
>> RAS or SYSFS,
>> those will still happen after the in flight resets finishes.
>>
>> v2:
>> Add handling on SRIOV configuration, the reset notify coming from host
>> and driver already trigger a work queue to handle the reset so drop this
>> intermediate wq and send directly to timeout wq. (Shaoyun)
>>
>> v3:
>> Lijo suggested puting 'adev->in_gpu_reset' in amdgpu_reset_domain 
>> struct.
>> I followed his advise and also moved adev->reset_sem into same place. 
>> This
>> in turn caused to do some follow-up refactor of the original patches
>> where i decoupled amdgpu_reset_domain life cycle frolm XGMI hive 
>> because hive is destroyed and
>> reconstructed for the case of reset the devices in the XGMI hive 
>> during probe for SRIOV See [2]
>> while we need the reset sem and gpu_reset flag to always be present. 
>> This was attained
>> by adding refcount to amdgpu_reset_domain so each device can safely 
>> point to it as long as
>> it needs.
>>
>>
>> [1] 
>> https://patchwork.kernel.org/project/dri-devel/patch/20210629073510.2764391-3-boris.brezillon@collabora.com/
>> [2] https://www.spinics.net/lists/amd-gfx/msg58836.html
>>
>> P.S Going through drm-misc-next and not amd-staging-drm-next as Boris 
>> work hasn't landed yet there.
>>
>> P.P.S Patches 8-12 are the refactor on top of the original V2 patchset.
>>
>> P.P.P.S I wasn't able yet to test the reworked code on XGMI SRIOV 
>> system because drm-misc-next fails to load there.
>> Would appriciate if maybe jingwech can try it on his system like he 
>> tested V2.
>>
>> Andrey Grodzovsky (12):
>>    drm/amdgpu: Introduce reset domain
>>    drm/amdgpu: Move scheduler init to after XGMI is ready
>>    drm/amdgpu: Fix crash on modprobe
>>    drm/amdgpu: Serialize non TDR gpu recovery with TDRs
>>    drm/amd/virt: For SRIOV send GPU reset directly to TDR queue.
>>    drm/amdgpu: Drop hive->in_reset
>>    drm/amdgpu: Drop concurrent GPU reset protection for device
>>    drm/amdgpu: Rework reset domain to be refcounted.
>>    drm/amdgpu: Move reset sem into reset_domain
>>    drm/amdgpu: Move in_gpu_reset into reset_domain
>>    drm/amdgpu: Rework amdgpu_device_lock_adev
>>    Revert 'drm/amdgpu: annotate a false positive recursive locking'
>>
>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  15 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  10 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 275 ++++++++++--------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c     |  43 +--
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   2 +-
>>   .../gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c    |  18 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c     |  39 +++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h     |  12 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h      |   2 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c      |  24 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h      |   3 +-
>>   drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c        |   6 +-
>>   drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c         |  14 +-
>>   drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c         |  19 +-
>>   drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c         |  19 +-
>>   drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c         |  11 +-
>>   16 files changed, 313 insertions(+), 199 deletions(-)
>>
