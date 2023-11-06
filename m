Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 471BC7E2A49
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 17:49:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F14810E35E;
	Mon,  6 Nov 2023 16:49:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657F410E35E;
 Mon,  6 Nov 2023 16:49:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jCadWu3izWPhswJAGoFjjfUMY7xi7YhP3Tc7d2ZdtJnUJj7+qbnmr+lt+W6je4FjlYUNCorCcHcTX7htGPGJvSiPrpS6or5YgNp3M3/vSZnTZhkXid5kFhNJhsyukmPurqy46SLPqkywCktxjr5fK/mf/3E+u1ew+dRsXEGkOtn4sdl6WnwmIlO6NRrys6byDfYkJfVBJKKZ4cMZmBWvGKRyP7fRkrxQyruyIRLj3RThQSe+fGVo8FC2gAnS52wRqHHdoBZB32SR8SKiWyPkAvjlDzWICObibwl4Ii7OCrrMmm3TAToUZUM1uDnQCzJ9udJY6b1SfdYab9jeXi8MwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79TLCQkQqEKSaW0r46uIWmOQKasp2DarOdJbYdptiAA=;
 b=mjL/B86aqXe+UWt7UfzfUw3FTJJjDSJ6genTx1hvsHXK218n5eWyiNbiS9vlUz81gy46K2DzTX9UHxLfkaU45xNisJyFXggc3wjn7/uZeTxsOZBvYtuSX5Q5uupPUJkrZvap7ZBqMvDNhIlAChM4Gjz/1lZnwCjYfeWxsH5oMwWI0W5KSL3hk5Y8qiqK4nZgaw+nfilYOMTXnrsmOI/XIl7uGhHi89snubaozmjoq2xM/O+N0ZxnQN5p7PiZ3FGFv27BFtiVTSZVG8aVOpgOrdyN+f5I4Y1+Yz7VnnYaw2EP0dYGkpHCHqEibhZ7mnnTIAFFAJ2WKQXEN9mVkg8NRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79TLCQkQqEKSaW0r46uIWmOQKasp2DarOdJbYdptiAA=;
 b=zALROFkPWYm5m/vz84cqEiszZkTSrlt8hJkmVxOjS6n0WbCcLlWF8KJ4t1Dg/VHHedouY72lzsUiYO1DVm8iXlr9ONaS0ATTq9TS5/vMmQholmR3wFNQYUJxDmKGou5BL4InJXpaTNNm2JmEgtDiPQc3HH6DOTBF1FzrrlObyO0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB9097.namprd12.prod.outlook.com (2603:10b6:610:1a6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Mon, 6 Nov
 2023 16:49:22 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a%5]) with mapi id 15.20.6954.027; Mon, 6 Nov 2023
 16:49:22 +0000
Message-ID: <8ab5175c-5ea8-4bc4-81c9-2f37dc15f270@amd.com>
Date: Mon, 6 Nov 2023 10:49:18 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] drm/nouveau: Switch from
 pci_is_thunderbolt_attached() to dev_is_removable()
Content-Language: en-US
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20231103190758.82911-1-mario.limonciello@amd.com>
 <20231103190758.82911-2-mario.limonciello@amd.com>
 <55563d57-60c3-1789-1e7c-5e618fbd6253@linux.intel.com>
 <20231106164751.GS17433@black.fi.intel.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20231106164751.GS17433@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0174.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::23) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH3PR12MB9097:EE_
X-MS-Office365-Filtering-Correlation-Id: c258e1b1-2d1e-4772-2167-08dbdee85402
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M7niseFDW9KnQzrw8GspgB2xSZS04Ld02eOl5CT6CHSGw0fAZaw84GNPY2l7SQ/ivJFtlpIPgrbnjDwCC+pmn9Z2mlpHTnFW7ep53jLEODdylBQfyZdqbAIBXPpLVT488oNQXtOeqETlAXfYw/cL0y3mKLtUSgyZJP9QjgrEq2X+xaEOofgiJS57HJmFFEdXlMK4nZiYjUSts2+S7J4iCOHmmLTo3/z7jPgdMQcdeNcrJ/bHRRhWzYtCwNAtPj4t/8ojDuylT6boqwx1aDi8FlTMzOTenp5r/kO9qBbxIgq5V/LZ15lZstlpSCQF+SwwVuU8eEzgA6bCdWb/fonScrGQWhMtfSkmbdYb5c9ciGEcwXIbip1PfSk2Ngnm6KR4jOSi0IoAeiP4n2KBidFwZ0/kdFjQoxQs4NUIPvqk+A5FkMSToaZrct005jOAGgiRptsTNaBEWMgR8cTTjIEoYAvRUQwrFyCDE1CgGlgQ8i4+ppnripTjD7j7gIPrbkRN71cui7LEyMYzs08S7LNrhYWzBa0jj06AaG52LvP22wLpE066JZ0r3a6imrLXHtTmlPXYixI7eoUXvZA0Q5pUTDCS0mMYMfyk0VtzOhnVVW/zrweMZUwesRB/rY0NNvqBSD3C9PhSDyaLJ7kGYZg94g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(376002)(346002)(366004)(136003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(38100700002)(7416002)(5660300002)(41300700001)(4744005)(2906002)(86362001)(31696002)(36756003)(478600001)(66574015)(31686004)(53546011)(83380400001)(6512007)(110136005)(66946007)(26005)(2616005)(316002)(54906003)(66476007)(66556008)(44832011)(6666004)(6486002)(6506007)(8936002)(4326008)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGNkb3dOc0ZqVDM2czNJaEU5aFFLVHlVVTBWZTlxQVBlakpua1lDNGwrUFNx?=
 =?utf-8?B?YldvbW9jSGhNaE5mTGJjUjErSjdhQWF3SUhHYndSSkFtSXdDOXg4Q1NwM1Ji?=
 =?utf-8?B?ZlVHTFpCZmkyYWJIbXpEekVxUVI3bDhOYmducFpQQVBaekhIcWpsa0svcXA3?=
 =?utf-8?B?VCt3Y1o1RHNhck5TQjNLS2pHT1R3czVPRTJqdExTMnBFcnpTOGl6K0ZPUlpt?=
 =?utf-8?B?WGlaT3FJdGVreTNZWGhKdER5M1JqQy9uTFVMK2lOQ3h4YXVPUFhYaXV0TnBH?=
 =?utf-8?B?YU91SzdnWUVxdjdJV3Qxa25ta2ZtRno4RVlqTG51OVlYR2UvVkhhSXd3REgv?=
 =?utf-8?B?cVg0LzZmTnoxWEgvQzNGZk13elRXMWlWdjQ3WmVHYVlKMFJ3L21wcVZlMmhp?=
 =?utf-8?B?U1MxWVhiYUdHenZqeWJ3cGZFQndEdW9OWTFiN004aDNkR1pWWDBjeEh1WG9m?=
 =?utf-8?B?Z3BzVlZqUHhZMkN1WnRlLzdKcVNIbzU3YzZvSW9EK3U2QVgzS2lSK01RaWVI?=
 =?utf-8?B?VmFRWitXMFhYVGk3YldDZkxxaWNlTkJsTElRc05PMWIrcXRlVzZRYk1PbCtu?=
 =?utf-8?B?dDRBMVAyaWRralY1bFJ0bDBkU1VoaXRlZUpqZCtrQm9OMXZOQnJEUmxxY2E5?=
 =?utf-8?B?L1VBWTcxTEh3dGQvK2o1a3QzUU1pb2JueWJKZGhDdFU3NmJDSkQwd2krUWZ1?=
 =?utf-8?B?NHlIUUY0NzgyWm5WOTN6VXVieFdBMkpNNU9wMUhxQ2VzeGFjWXVzUS90a2p1?=
 =?utf-8?B?T2V6WWVrTytjajJhclpCSTJaWkhFRWREMHc1WHJPWXcyZE9Vbk1uR0VydDNR?=
 =?utf-8?B?czFJL1N6M1gzdUpOdkJRVkxsWitpWkFoK2o2clRDZWFORkIvVUQvcFJiYkxN?=
 =?utf-8?B?NVJ1Qi9aOEhRWUdweDQ5clB1ZE0wbE9VWm12YTVFL24rcE9QVFdnNS9MVWNo?=
 =?utf-8?B?S3NkQXdHQmlGbEtrN2hBNVNCcFp5alpBWHBJb2FYSExabVJzakVxM0lPUWQv?=
 =?utf-8?B?ZUt1Snp6OVZvSGNSTFIyNUhSckJIMUhrcEkvbEJwUkJWdXpHTlR2THdWQVhR?=
 =?utf-8?B?aTJGT2NlclpDa21rV0RaejVoU25sbkxnT0tVNXFsQTJrQVFneVZudDNYQ01o?=
 =?utf-8?B?V3hjL3h1K2ZJRUdKdmJWUEorZ2g3eEwwam0yQlJvTWp3NUVVMEcra0ozbzdz?=
 =?utf-8?B?UmhkL1FGVlpLS2pCN1JLVDJhVmF6cU93andFbVpsWDZnQXF4ejZrSmtGYmFD?=
 =?utf-8?B?M1JsSG84Y0lldXh6YzZKOHdha2JLaXEwemI1ZmpiUkw3M0ZIZ0hZc3lObXpG?=
 =?utf-8?B?Mk5xdWwxQ2tsOHBkTnFhdGdOWEkwMUc3b3AyRkV0UmcvdUNVTk4xWS9JTmsr?=
 =?utf-8?B?WWpmc25HU3FaQVNWa3JWYTdQM2xER09ybG9YUmhuMHZOSmVzd0N6ZHJZcFp4?=
 =?utf-8?B?Vm0yVGtCMkpqWkxadXA0dDRVV0hoS3JpOUFRUytXeTZKQlBsUkNBYTd3d2E4?=
 =?utf-8?B?UHNQbkUzNWxDUncvOHlEbjIwRjRNdDF4bTY3a0lONkROYTh6clJ0dkZySU5h?=
 =?utf-8?B?NVYyRFMraHZEWERJZ00wWDVVUmhPNWJLeDREM09wSDgzZEtpaWR6enRSRXRh?=
 =?utf-8?B?V3hOMmg3NWpLSkNvT0FSYm5kYzVFa20wSm5XdW13RDVrODMxTnBJTUdEK3Ro?=
 =?utf-8?B?ZHlDdXB5VkJOQW9ZQldNKy9lQU0xMmpHdnF0ZFVQVVQwa1kwU0QrZDVkbDRZ?=
 =?utf-8?B?S2F4ajMwR2JyZzBXRC9aeVMwS0RtTTRTZnNWSmM2ZjVSblJpTmJYWWVPdnQ4?=
 =?utf-8?B?R0c3MzE1bXlDbCtPTHJQT1gzclFVdXpiM3lNL2ZxNkIwdFpWNjRqSW0vL3oz?=
 =?utf-8?B?dGhSM2dkZExpSFdMREFvSjRidlZqUmhGV3JDRi9VMTBweHJaUU9nRE9VN3ho?=
 =?utf-8?B?VmRuQXBoaWNtT1VPamFZTHhrd0ZUclBya1F3WFNOQ1NwdjVWMy9GZWNIc092?=
 =?utf-8?B?Z3c0Vk9aOHp3Uk5pVjVDWnhFT0NqUXVkTHM3NG5BaW5zc0JLVVJBdnAwU2tl?=
 =?utf-8?B?L1FKbFh0SmVDOXFRK0J1SlcxUDc2cGxWYjIxd0l5K28zZEFyZGlWblZtWTFR?=
 =?utf-8?Q?xMoLelBMAVWn/UDsYsot5kp2W?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c258e1b1-2d1e-4772-2167-08dbdee85402
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 16:49:22.7955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ozmyfd+G8tYhPtqofH0LUjykaFHSbhN22gvyjw7MBE05/FEp4SrZ76Ms1/VHtbS4OM8+IBBxIRl4ChfJmc5jlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9097
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
Cc: "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 Karol Herbst <kherbst@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>,
 "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Andreas Noever <andreas.noever@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 Danilo Krummrich <dakr@redhat.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Michael Jamet <michael.jamet@intel.com>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, open list <linux-kernel@vger.kernel.org>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/6/2023 10:47, Mika Westerberg wrote:
> On Mon, Nov 06, 2023 at 02:25:24PM +0200, Ilpo Järvinen wrote:
>> On Fri, 3 Nov 2023, Mario Limonciello wrote:
>>
>>> pci_is_thunderbolt_attached() only works for Intel TBT devices. Switch to
>>> using dev_is_removable() to be able to detect USB4 devices as well.
>>
>> Please extend this with more details. I had to lookup the TBT change to
>> be able to make any guess why you're doing this (and it's still a guess
>> at best).
> 
> Also please write it as Thunderbolt not TBT so that it is clear what we
> are talking about. Ditto to all patches.

Ack, thanks I will add more detail to these first few patches and make 
that s/TBT/Thunderbolt/ change when I rebase this on 6.7-rc1.

