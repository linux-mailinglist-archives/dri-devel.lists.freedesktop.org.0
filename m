Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 459C16CFA16
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 06:20:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075D010ECD6;
	Thu, 30 Mar 2023 04:20:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0CDA10ECD4;
 Thu, 30 Mar 2023 04:20:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M47owAvLIUKmJdWqPGtNuoPOy6ALMUt+ZvDHKtcah5S5GsNmdjdkJaxIHjjRIP0clYA5+5dZyHLbP+cxAPqDWYQPuZ7Kqf2/Souvm8UKariVSXIDGxYYGSvW9Upo1LTfmd7+NQhUjiXYDLPL40U0KztrZB39bg2jv5UcCb2ewcvj+LNC8iiJnIcYdxtVmbiuaq0NVHV95jk1lxiA6GmBNi9WLh3jGD722HMq2/hFZqGH07nlHiat2COlh844R/MIwzMFy3xfdFzEm8kVEjrqxfp2x2zGTY+Ou5LOkL9Qh6HaHgUnZx8epdMROYW5+TLHcGFX1RlAgQK6v0Yd2tCLgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/grjN0ioApOve4PiUSruexnr1tkZbXkca3cPNnTiELk=;
 b=LM5Ahg8U9JWBRDVMHKDcuwMY5JDH3Jyqp8KjOgvF66gRcNZJXNX/ajyaiCXueo+dETJaG+5fYw0D6bs2msefXJHhw9bDuBS4ZmClvUiYl+dmzo4zhwPGOSczH6+rcWLXDMJjkthA1Iq1jklHMSd9WaMLo8kC3CIX2RR0Bl8UVqb8nlpX/h5lSPMxOte51NgyfTsFLIWA8YIH83Wgj/YaD+0dkTQZodW2tXEJ45BMTRNKgdX1vcxS1IL/E/tRrW3jHouXItvAYwAzy+2KAAes3DF7f1YeRBGiRaNsGJ2YxV09gZ5/gvAZbvuuVxhFCPVdXbSJVSymE7JwbKjdGDwPjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/grjN0ioApOve4PiUSruexnr1tkZbXkca3cPNnTiELk=;
 b=P0Weit99as3J7z+mxIhiM2+fEj+7VEeTNU3eW+Mobk9OxsPPtpCEUuUAlFVT3KxbcaVyW5laziolowTRe5vTxos2cosJQ9j3jTiE9dizGJ6NPqi4LYm1rRo33Txn9Kabh6YAqS4iTy9t2dlYPgZI5/nkbZR8f4P/qHiZchozj6Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ2PR12MB8738.namprd12.prod.outlook.com (2603:10b6:a03:548::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Thu, 30 Mar
 2023 04:20:08 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe%2]) with mapi id 15.20.6222.028; Thu, 30 Mar 2023
 04:20:08 +0000
Message-ID: <38340824-9060-c380-d595-c49ef6b8e4ac@amd.com>
Date: Wed, 29 Mar 2023 23:20:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] drm/amdgpu: Reset GPU on S0ix when device supports
 BOCO
Content-Language: en-US
To: Kai-Heng Feng <kai.heng.feng@canonical.com>, Evan Quan <evan.quan@amd.com>
References: <20230329095933.1203559-1-kai.heng.feng@canonical.com>
 <76853776-ddfd-2fbc-a209-ca4f77faa481@amd.com>
 <CAAd53p7sgowhaFS1b7MM0F0kf14sWf6jbF9T__=4BAMM8bnz3A@mail.gmail.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAAd53p7sgowhaFS1b7MM0F0kf14sWf6jbF9T__=4BAMM8bnz3A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0346.namprd03.prod.outlook.com
 (2603:10b6:408:f6::21) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ2PR12MB8738:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d701f79-ddeb-4866-e147-08db30d60ba5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mPZWpnIPNurxSDHbX1mH9laSBe+D+5I8vcV2R2yaojlkiVsRtB75Q7LQ+XB53agjMQ1kb5sqt5WMuL2MqaFOdvvUnCVlHH2yL2uP3Sw35bM/HL6gpZrcLASO+F8jbDKIiYlnNlvMJ6XJvoa7m45IKHiSIHqCKkbj8HGb+GiTLJfCUebSBvCa5xHC4G4AQ6nPq4Mc8vfWKf3caE/XORfMyQgXsZSZbFRPivHazXFk84mwcQBt/jDLnLxTvzmvuKBPRDV8vabYf7x/98Cgilkw2a0IZ1lm5gyq0cr0JW1ANe13ReFE8HD//kuTtB/l1dojpNgEVGGpKvDzSlgpRzJAxbR4IJ99034SMiTxdUOxxLX4e7qGy5bypgBcL6wfHPgbaR7CmNDsDykzmM9mDMbPBcm69XlkX22eBrvXLOr1l8nk4cBLND6qkwnjhp6D3vKtSmJLK5mCDHq/qAKthsoIZx6/OdaGTJgyf/66gT12/YQYUmlzJu4vEGHu5lUr5vz49GaU67ChZgHWtR7xSSU4IbaODWMCLizvASZx0uRNI97zeBKrL//HnbJft/R+Q1RPGM4sW8aVf2rzD1rlfhMu4coEpjUGUeSV0DVvS5bfxZ0rYL4d7eI9V3/v3VStcxVr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(451199021)(31686004)(66946007)(83380400001)(66476007)(36756003)(86362001)(66556008)(38100700002)(2616005)(5660300002)(8936002)(8676002)(41300700001)(7416002)(4326008)(6486002)(966005)(31696002)(6506007)(53546011)(44832011)(186003)(2906002)(478600001)(6512007)(316002)(6666004)(110136005)(6636002)(54906003)(32563001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEw5OHBFbklJMjVpTWRhdjFlcFVJejlYcjRIdGhSb01mZFI0Zk1XbzFYdk5J?=
 =?utf-8?B?amYwUjR2MG9vMmU2MjhYY0FZeG1PajVpcnNibU9NQUZ6eVJjRjc2aWt3WGJJ?=
 =?utf-8?B?UXlmeGRON1lSUXhyOTBldC95ODgxSm9zVUlzYlRGTGU2czZwU0tER3A1ZGdk?=
 =?utf-8?B?bG5yaGw3NFBzSDdRd2FFYTVuU21ZZC9pWE1RbGxhTjNsaTVxcEtkVzh3dXU1?=
 =?utf-8?B?QmQyUytaakJ6ZEduR2ljVEFEaWwybS9qSUFUdXdMKzBOakNxMyt6cFgzVmJh?=
 =?utf-8?B?b0lYUGlXb2x2TUpzYS9pTC9VZXZISzdrMlN5TGUxNWY3b1Z3YU9ZUnRMcFFy?=
 =?utf-8?B?MkowMTFmWnhjMUNEcGprM3JSZFNBdWMxbmpUbE13WFBtVXhpRzlTc3prWG9U?=
 =?utf-8?B?SVBob2pCaWVxR3B6Rk1PSDk4bzlDQUN0ejBuYjkzT3VzRENOQnlIbUtlc3hN?=
 =?utf-8?B?bTBVV3BIK1BBZFdMQVJTVW1qejJJSFYvVDFMS2grdzF4NVk1UTRjRFJNQjQv?=
 =?utf-8?B?VHlZWVIrMEwwdjJ6cXFWWmlyUEV6UFlJenNhRUE5eWxCaS9tV3d6ckRtd29X?=
 =?utf-8?B?aFhuUXplenVZdEoraHRPbi9jeXR2SkhXclJnTEZscHZkaW9DOFpBaXNIdzNr?=
 =?utf-8?B?d0RmWUxCU0IrZ2VxdGxDRUl5YnJMQmlvK1hqeFV4ZjNQU2QvaXBxU1ZlY043?=
 =?utf-8?B?OVFiTFdvY1ZUay9FeWNTeFVKQ1MreWlXUWxwZXhGWGVBTUI2SHVuQnhFUHp6?=
 =?utf-8?B?ZWxKUGFYV3c0d0lib1NraWlrZS9XWTN6NUd5MTNIbXA5eVZTNE5kbC9pazJT?=
 =?utf-8?B?Z0NyNW0yUmNzMjNtcU94RE1uZjRDS2NCM1dzZ24zbkp5UTk4SHpCakdHN0Jq?=
 =?utf-8?B?ZGh1cHZZVzdYSzNWTzVSTTVBa0QwckJOdEZJTjNkNGNRS0twL2N3RERhSXlG?=
 =?utf-8?B?UmZHeEdJUCt6Z1lRMG42alhBbmlJbUttZzNuUWVwZUhZWUpjNG9KcVhGaXd4?=
 =?utf-8?B?WmR0MEQwbjFKWm81NDBhdkV3eVUzejZQOHMvU2xaUzJxYUZPWmlFRUMrcGxq?=
 =?utf-8?B?VWJQbHpOSm5oM1FSc2lZekZ1N0tqVzlic0o4cG1sMnBzTnd3M2pDLzZGUHBC?=
 =?utf-8?B?aWVZbmQ0dWx6MnJST0NtSllNVXN1dWpHalhHck8xRUxiMVdhRlh5UFFiTVdQ?=
 =?utf-8?B?aW5DQ2Q1UDF1Rjg0MXVLdXBaWDNtWFlHK3daNXN5LzEzQTN1a2ozL0p4Y05M?=
 =?utf-8?B?Q0RoSitqN3IwOGZMT3JqSXZCNXlPVEsvVnoyUTRnZ1lXV2ZTdjBKUWZJSEZV?=
 =?utf-8?B?enY1NU5PTlFjL1E1dmV0aFBUSnRuQ0NZam5SZ2E1UEZWMkZwTFZFTXgxSnhM?=
 =?utf-8?B?R2RZRVdKazU0RStPcTVCZHJZVE9yaHYzcUR1S3RsVGVkbE1QN2FHb0VtTGRj?=
 =?utf-8?B?cFVoTnJ1dDUxM2d2Vm85NjJiMTd5TUdwZ240QjA1c204SkE3eUcrdSsyeEhW?=
 =?utf-8?B?bU1uM3A1NHE5bCtzY1JRdXovYmxuSlM0akRzTWFiRExmejRtOTlPNlpmK3hS?=
 =?utf-8?B?OXc4dUczamZ4KzladDA0bTBjeGYzRzM0Q2pjU21Vcms0UUNkWVdpZkNnMFk4?=
 =?utf-8?B?Y2JOSC84ZXl6a0dvdE5zaGFEKzIrR0dpMjd1cTF6OUJCYXBxbUZpd2EwQTFq?=
 =?utf-8?B?M2hjMC93Zy9JSHRSZjlEMSszMEYwSVdicUd0NEFhd3NrRXhvUmk1VW9odmZj?=
 =?utf-8?B?VEcvOVBzOUxYeFJuSk1wQWt2VVlWYVVkUEFQREU1TkR0ZEh5Y0pTWlA2Uloz?=
 =?utf-8?B?bnVzbVU3ekh0REd5RU5SWXJma1N2R0w1RVV6V1kyWkw2TVJRZnEwWlR6Wjk4?=
 =?utf-8?B?eGZ3UFVRK0JPSHRsMVNqYU8wU0RLNjhocXduQThubms0UFoxaEVHMDhXNENG?=
 =?utf-8?B?a09WWGlFajUyeEVxaUpPVHlFRXhpeG4xOWJCaitsVGF5djJyZC9PY3o4Z05l?=
 =?utf-8?B?NDZicWcwZk9HY1dpQnY1Q1ZXYzc1R1M3dHlsOXJiVnErOExacU1DKzBkSVlM?=
 =?utf-8?B?YTZUeGNDeGZQdjB1VysxWUYzK0NVSnB0UXlmcnNzTHBKdkNiQnFnMWNSZkNn?=
 =?utf-8?B?bWJsMkh5cmtvZEw0eWpYNE1VTjdONFBReWZxT0hKMzNnM212ZHEweGlGYVQv?=
 =?utf-8?Q?d3zy+8DHgWRoXoP/1JIrvnhXE6tLJp9Rq9FkLg3HLDi4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d701f79-ddeb-4866-e147-08db30d60ba5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 04:20:08.1877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wf7QhA9Ik3cRVe6HxNUH1JT/axLUxm4i1n4fUjM2vtw6OGR/TSvq+vdpsH/YX66GIG8it8f8LDLRzPitnZbuFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8738
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
Cc: Jingyu Wang <jingyuwang_vip@163.com>, Xinhui.Pan@amd.com,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <mdaenzer@redhat.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>, Guchun Chen <guchun.chen@amd.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 amd-gfx@lists.freedesktop.org, Jiansong Chen <Jiansong.Chen@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>, Tim Huang <tim.huang@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, Hans de Goede <hdegoede@redhat.com>,
 Maxime Ripard <maxime@cerno.tech>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 linux-kernel@vger.kernel.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/29/23 22:36, Kai-Heng Feng wrote:
> On Wed, Mar 29, 2023 at 9:23 PM Mario Limonciello
> <mario.limonciello@amd.com> wrote:
>>
>> On 3/29/23 04:59, Kai-Heng Feng wrote:
>>> When the power is lost due to ACPI power resources being turned off, the
>>> driver should reset the GPU so it can work anew.
>>>
>>> First, _PR3 support of the hierarchy needs to be found correctly. Since
>>> the GPU on some discrete GFX cards is behind a PCIe switch, checking the
>>> _PR3 on downstream port alone is not enough, as the _PR3 can associate
>>> to the root port above the PCIe switch.
>> I think this should be split into two commits:
>>
>> * One of them to look at _PR3 further up in hierarchy to fix indication
>> for BOCO support.
> Yes, this part can be split up.
>
>> * One to adjust policy for whether to reset
> IIUC, the GPU only needs to be reset when the power status isn't certain?
Yeah; think of reset as a particular case that all hardware isn't 
initialized.
> Assuming power resources in _PR3 are really disabled, GPU is already
> reset by itself. That means reset shouldn't be necessary for D3cold,
> am I understanding it correctly?
Can we see the acpidump for this system?
> However, this is a desktop plugged with GFX card that has external
> power, does that assumption still stand? Perform resetting on D3cold
> can cover this scenario.

Are you sure it's going to D3cold?  Or is it D3hot?  What does _S0W have 
in this design?

>>
>>> Once the _PR3 is found and BOCO support is correctly marked, use that
>>> information to inform the GPU should be reset. This solves an issue that
>>> system freeze on a Intel ADL desktop that uses S0ix for sleep and D3cold
>>> is supported for the GFX slot.
>> I'm worried this is still papering over an underlying issue with L0s
>> handling on ALD + Navi1x/Navi2x.
> Is it possible to get the ASIC's ASPM parameter under Windows? Knowing
> the difference can be useful.
Evan is in discussion with Windows guys about this issue too.
>
>> Also, what about runtime suspend?  If you unplug the monitor from this
>> dGPU and interact with it over SSH it should go into runtime suspend.
>>
>> Is it working properly for that case now?
> Thanks for the tip. Runtime resume doesn't work at all:
> [ 1087.601631] pcieport 0000:00:01.0: power state changed by ACPI to D0
> [ 1087.613820] pcieport 0000:00:01.0: restoring config space at offset
> 0x2c (was 0x43, writing 0x43)
> [ 1087.613835] pcieport 0000:00:01.0: restoring config space at offset
> 0x28 (was 0x41, writing 0x41)
> [ 1087.613841] pcieport 0000:00:01.0: restoring config space at offset
> 0x24 (was 0xfff10001, writing 0xfff10001)
> [ 1087.613978] pcieport 0000:00:01.0: PME# disabled
> [ 1087.613984] pcieport 0000:00:01.0: waiting 100 ms for downstream
> link, after activation
> [ 1089.330956] pcieport 0000:01:00.0: not ready 1023ms after resume; giving up
> [ 1089.373036] pcieport 0000:01:00.0: Unable to change power state
> from D3cold to D0, device inaccessible
>
> After a short while the whole system froze.
>
> So the upstream port of GFX's PCIe switch cannot be powered on again.

What is the state of the kernel patches while doing this test?
Specifically does this happen without amdgpu.aspm set?  Or this happens
no matter what?

>
> Kai-Heng
>
>>> Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
>>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1885
>>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2458
>>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c   |  3 +++
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  7 ++++++-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 12 +++++-------
>>>    3 files changed, 14 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
>>> index 60b1857f469e..407456ac0e84 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
>>> @@ -987,6 +987,9 @@ bool amdgpu_acpi_should_gpu_reset(struct amdgpu_device *adev)
>>>        if (amdgpu_sriov_vf(adev))
>>>                return false;
>>>
>>> +     if (amdgpu_device_supports_boco(adev_to_drm(adev)))
>>> +             return true;
>>> +
>>>    #if IS_ENABLED(CONFIG_SUSPEND)
>>>        return pm_suspend_target_state != PM_SUSPEND_TO_IDLE;
>>>    #else
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> index f5658359ff5c..d56b7a2bafa6 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> @@ -2181,7 +2181,12 @@ static int amdgpu_device_ip_early_init(struct amdgpu_device *adev)
>>>
>>>        if (!(adev->flags & AMD_IS_APU)) {
>>>                parent = pci_upstream_bridge(adev->pdev);
>>> -             adev->has_pr3 = parent ? pci_pr3_present(parent) : false;
>>> +             do {
>>> +                     if (pci_pr3_present(parent)) {
>>> +                             adev->has_pr3 = true;
>>> +                             break;
>>> +                     }
>>> +             } while ((parent = pci_upstream_bridge(parent)));
>>>        }
>>>
>>>        amdgpu_amdkfd_device_probe(adev);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> index ba5def374368..5d81fcac4b0a 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> @@ -2415,10 +2415,11 @@ static int amdgpu_pmops_suspend(struct device *dev)
>>>        struct drm_device *drm_dev = dev_get_drvdata(dev);
>>>        struct amdgpu_device *adev = drm_to_adev(drm_dev);
>>>
>>> -     if (amdgpu_acpi_is_s0ix_active(adev))
>>> -             adev->in_s0ix = true;
>>> -     else if (amdgpu_acpi_is_s3_active(adev))
>>> +     if (amdgpu_acpi_is_s3_active(adev) ||
>>> +         amdgpu_device_supports_boco(drm_dev))
>>>                adev->in_s3 = true;
>>> +     else if (amdgpu_acpi_is_s0ix_active(adev))
>>> +             adev->in_s0ix = true;
>>>        if (!adev->in_s0ix && !adev->in_s3)
>>>                return 0;
>>>        return amdgpu_device_suspend(drm_dev, true);
>>> @@ -2449,10 +2450,7 @@ static int amdgpu_pmops_resume(struct device *dev)
>>>                adev->no_hw_access = true;
>>>
>>>        r = amdgpu_device_resume(drm_dev, true);
>>> -     if (amdgpu_acpi_is_s0ix_active(adev))
>>> -             adev->in_s0ix = false;
>>> -     else
>>> -             adev->in_s3 = false;
>>> +     adev->in_s0ix = adev->in_s3 = false;
>>>        return r;
>>>    }
>>>
