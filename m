Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9789C90B9E3
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 20:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC8510E4B4;
	Mon, 17 Jun 2024 18:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZyJshFnJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2074.outbound.protection.outlook.com [40.107.102.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D8110E4A0;
 Mon, 17 Jun 2024 18:41:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fWIrwjIh9V/w7eTKe0StmbIkzLomGVjYmG+cOEq47SUSeohSeSWHoQO2stNb0p3nJtsVICl9X3FnE0HU4vsiG7P+MttIwrpA8PvwyxEvLjCbqCHSo4nwBE4PmG0OwPWKql/W0aJbCsEB+bS99UcS9n/LO0W833e7lvYaYUXbY6xEs9oXlrXmynuKTMakPjxTBqB4mmwnT8k8WEehSTsZTp7dY18brxvqhh4Et8Mvn8/uJIMtLJzwjtC3SPM7K4NxoMSAzzWiLWheK4KAJFoJDCQkF/20ad7X9xbrrlErCK8Yx72Xm/aujZbhr6wZjxUnPgIlLSPr0qsI2XHTUeCacg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0UNAL6FrNB7qG3SGzPhSVsgfz2rCyeNWlbwH0L0obZY=;
 b=lHGP09yAvalGeOdZWxXqtV+qLJf/9KF8NHnW+dFQ3r3cwVF7ADr2kb2G3/fI5Pr7KvW/e8PAPGMADpVU/6MeyE7IxBhzpG6KcBoYDOoy/f/HH0Riw46/fueUTX8+lbGXwqFgIHDbBFbdSou4TYhlkCSChRL5thucB7Jpjni5a3sD4EqIaRvn5aXG5r6mv2LujOiN1kmgJyzGHbXKJwuP442NHIH8KXxuqy+RSAJJgRHidkD2qMhMDI92GL6faRNayRkcxKF0OT8pAh/K2aLyzDBuqYepFvOOpkW/tiPLV5FqHJT6fH20ZT/32bsfC8LnU82+KamK1ZWAsBgQGWxCNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0UNAL6FrNB7qG3SGzPhSVsgfz2rCyeNWlbwH0L0obZY=;
 b=ZyJshFnJT3bLMdmnovtck3+XezYlxn34GySol6nTOPfIdRV62NxvTP+FjWIJwd4zfirB/RzsCvLWtzmmrol4pKaqe74XaxnLMhYAaUr0yT14rsPfqatO/NaV/cuFWzDfPGaIK7vcCrSNhB90K9s/P4mfvnAdozuToh+vlkDIJoymVPsY23MCi5CrYp2lAb7zsVYXnVY/UwlQCKc98Krzdk37sEUnxwYedjt+qRTYu/X3CF8mGELaj/oln8b6a5fYTvJCLqNzOvHrQsVZBug3tYIsUqICctgd1JuwUkHj8aOECmi3WK/EJlPm2WNYqhiNbYRY415+KIoymFnhC2/Qlw==
Received: from SJ0PR03CA0273.namprd03.prod.outlook.com (2603:10b6:a03:39e::8)
 by BY5PR12MB4035.namprd12.prod.outlook.com (2603:10b6:a03:206::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Mon, 17 Jun
 2024 18:41:53 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::64) by SJ0PR03CA0273.outlook.office365.com
 (2603:10b6:a03:39e::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30 via Frontend
 Transport; Mon, 17 Jun 2024 18:41:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Mon, 17 Jun 2024 18:41:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 17 Jun
 2024 11:41:37 -0700
Received: from [172.20.75.190] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 17 Jun
 2024 11:41:36 -0700
Message-ID: <f5dc9d9e-23ac-4dec-a76a-c2a44ae158f4@nvidia.com>
Date: Tue, 18 Jun 2024 04:23:17 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] GPU driver with separate "core" and "DRM" modules
To: Daniel Vetter <daniel@ffwll.ch>
CC: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20240613170211.88779-1-bskeggs@nvidia.com>
 <ZnBARgjk-83NXC5S@phenom.ffwll.local>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <ZnBARgjk-83NXC5S@phenom.ffwll.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|BY5PR12MB4035:EE_
X-MS-Office365-Filtering-Correlation-Id: 11a8384d-6007-42e1-9940-08dc8efd2856
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|376011|36860700010|1800799021|82310400023; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUNlNnZzZnVJZHRPT3ZPeUtRSmlXc0xSOGl4R1pROHlCYnlEbC9OL2xoYy8w?=
 =?utf-8?B?Qi9lVUVKaEJzUkhXbElnREhBd1V0ckZNV0todWJsYWpkN0l4MXkyR00rbWZV?=
 =?utf-8?B?NGRMdmE3TSszY0Q1UkNYeHA3QmNPajlvSE1IbEJscEk5UmtONURkRWxPQkxZ?=
 =?utf-8?B?QkdDazZZSTE1YXBoZEFRay9YLzdLUC9YUzY3RWtrZU1HT3ZKeVl5L1UxMHZ0?=
 =?utf-8?B?OVluN2VJMUdVV3dRb0FXZnQrS0tha1hXSlAybEpXSjNVanNVazRvT3JOUTN3?=
 =?utf-8?B?enBKZ2RZcnU2Z3lpczUzRmhXQlEwbzNGZEZ5d1dCOWl5WGR5U3BGSEdaenNK?=
 =?utf-8?B?S09SZStHNG1OUEdWWnZCaXIxTG5CUWRUL0hITzg1SlV4WE1qOUZIY2NxcWpO?=
 =?utf-8?B?OVNoRnhLQVFrc1pqVEpZeDRjdk1vK0doL3F1VHFmdlFzS0RaanlBMTF4Z0w3?=
 =?utf-8?B?a1pYcmhMMExxNmdOa1NWQVgyb2hlT0lQNUl4TTFpaXlDbkduTTczRVdCYkxl?=
 =?utf-8?B?SmIyaGwxZDZoU3FtZmx2cWtZN1pyZzUra2lPSTg0T2VhY1NtaDRQaEs0SWdM?=
 =?utf-8?B?UVJGU2ljbWxuSXZPNjRaTk51TFh2dWUwNVEvaFdvcXBPV01ISjdIblhYb3FS?=
 =?utf-8?B?RDY0UmxJTWFZajluTTAzaG1iR2FSVmljMmhFZ2FGY3gyRzlHakhJQTRyMmxp?=
 =?utf-8?B?b3ViTGJVRzVrdjBGUkZGaWpsRUJjVHpDenU5aUFBVlZTUEhlYjV0MnlWTlNj?=
 =?utf-8?B?VGcvNW93d2J6RE5HY01WeWxlMENIWnAyZWlqK0FJaHFTcmJQUHRMZ2xyNXF2?=
 =?utf-8?B?eVF6Mnh5MXhSbG4xTUdmTTFwcCtHZHFldFZoa1ppRGZSTFo0dWkyWUtvbG9x?=
 =?utf-8?B?VTR0ajNZcjJ3VEdtdHF0Nm05RldkeU50WWRHWEFYQmRyM2cxOXQxNzJvK3Nl?=
 =?utf-8?B?ZEtEMUVUUHMwNllzYmt4SUY0cy9rbnRoZVJpb3kxVlNzZ1h0enMyYlJSNHp5?=
 =?utf-8?B?WWFWSmI0NnVQVVhxUURkWFZwYUZ3UktQeTQyYUhXeTJxb3hEWG0zeEsxci9T?=
 =?utf-8?B?d3hOcmNhWVBGd3FJRGxJTkFXbGIyTGlnbFhWNmpNc2ROM3Q3QTVsSCszU2ZI?=
 =?utf-8?B?ejJLQU1xdXg2VGY4UHM1Szc2eWFlRGQvSjF6cVdTUXF1bHdWdTBnUTY0L1I2?=
 =?utf-8?B?NmphcHhXdXdxUkUySGovOEpybU9UOFM2dDNBckhEZm5lWUJJVjFPZ1padFJU?=
 =?utf-8?B?YVA3ZjJadlRCRXJVWnBOS2FtSk5WU1J1emFibC9rTnE1dDZwdFRkeGFXNUtm?=
 =?utf-8?B?Z05GWmM4VjlVMTh4cVA1Sm0zVk9xM21sUXFzSVBBZWNtS3NJb2JESEV0VTBV?=
 =?utf-8?B?V2htYThaTXFuUldweU9xajZadmRTQ1M3dE9UTll2UEdnT2Q3MUpDSjRCM2x6?=
 =?utf-8?B?Q0lGMUFGbXlrV1FvbVN0Qmk0VHVlaHNZVHZyOVRlVWMvYWx6RFV3RVdUL2hE?=
 =?utf-8?B?K0hpV1lTdnBDaVlzeWs3c3NDcCtXVmJVY1VhMHFzRC9xNnZMT1Evakh5UFBQ?=
 =?utf-8?B?My9mRk90Rm5MTWFiTm9HUmRpNUV5OU5hTjJCVnl3ak9pNFJWL0ZpczhRWkFu?=
 =?utf-8?B?Zi9iSUZMQjMxbjBQNjEyZFpSbldsb000OXoyZCtHYWc4RDI0TTQrcnA3Q3NI?=
 =?utf-8?B?VzZBVnQ1cDJrYWtsQXhPM1lPZ1JVYjZmU0R0L2NRTmI0U0ZTbDBsenZGOXFz?=
 =?utf-8?B?UG1GOUQ1Z2ZHaVNPVTBVUUN6MHk2VGFXbmFvemNMVFVRbzRaeGl0WUo3WklJ?=
 =?utf-8?B?SzdYNkowaC9XRVdVZ3VSZ0JkM1R3dzBlVVMxUGZUek5XRmpIbXkwOVBjK3o3?=
 =?utf-8?B?UHB3MlZ1akVPM1Y0YjNBWG1vRFhIaldvR0RZOFZ4aER5ZHc9PQ==?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230037)(376011)(36860700010)(1800799021)(82310400023); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 18:41:53.3151 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a8384d-6007-42e1-9940-08dc8efd2856
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4035
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

On 17/6/24 23:55, Daniel Vetter wrote:

> On Fri, Jun 14, 2024 at 03:02:09AM +1000, Ben Skeggs wrote:
>> NVIDIA has been exploring ways to better support the effort for an
>> upstream kernel mode driver for GPUs that are capable of running GSP-RM
>> firmware, since the introduction[1] to Nova.
>>
>> Use cases have been identified for which separating the core GPU
>> programming out of the full DRM driver stack is a strong requirement
>> from our key customers.
>>
>> An upstreamed NVIDIA GPU driver should be able to support current and
>> emerging customer use cases for vGPU hosts.  NVIDIA's vGPU deployments
>> to date do not support compute or graphics functionality within the
>> hypervisor host, and have no dependency on the Linux graphics subsystem,
>> instead implementing the minimal functionality required to run vGPU
>> guest VMs.
>>
>> For security-sensitive environments such as cloud infrastructure, it's
>> important to continue support for running a minimal footprint vGPU host
>> driver in a stripped-down / barebones kernel environment.
>>
>> This can be achieved by supporting both VFIO and DRM drivers as clients
>> of a core driver, without requiring a full-fledged DRM driver (or the
>> DRM subsystem itself) to be built into the host kernel.
>>
>> A core driver would be responsible for booting and communicating with
>> GSP-RM, enumeration of HW configuration, shared/partitioned resource
>> management, exception handling, and event dispatch.
>>
>> The DRM driver would do all the standard things a DRM driver does, and
>> implement GPU memory management (TTM/HMM), KMS, command submission etc,
>> as well as providing UAPI for userspace clients.  These features would
>> be implemented using HW resources allocated from a core driver, rather
>> than the DRM driver being directly responsible for HW programming.
>>
>> As Nouveau's KMD is already split (in the logical sense) along similar
>> lines, we're using it here for the purposes of this RFC to demonstrate
>> the feasibility of such an architecture, and open it up for discussion.
> Sounds reasonable.
>
> Only bikeshed I have to add is that the blessed way (according to the cool
> kernel maintainers at least or something) to structure this is using
> auxbus. Definitely when you end up with more than one driver binding to
> the core (like maybe some system management interface thing, or perhaps a
> special compute-only kernel driver).
>
> https://dri.freedesktop.org/docs/drm/driver-api/auxiliary_bus.html

Hey!

Yes indeed.  I sent this[1] series at the same time, which was initially 
written to so that nouveau.ko would still get auto-loaded alongside nvkm.ko.

Ben.


[1] https://lists.freedesktop.org/archives/nouveau/2024-June/044861.html


>
> Cheers, Sima
>
>> A link[2] to a tree containing the patches is below.
>>
>> [1] https://lore.kernel.org/all/3ed356488c9b0ca93845501425d427309f4cf616.camel@redhat.com/
>> [2] https://gitlab.freedesktop.org/bskeggs/nouveau/-/tree/00.03-module
>>
>> *** BLURB HERE ***
>>
>> Ben Skeggs (2):
>>    drm/nouveau/nvkm: export symbols needed by the drm driver
>>    drm/nouveau/nvkm: separate out into nvkm.ko
>>
>>   drivers/gpu/drm/nouveau/Kbuild                      |  4 ++--
>>   drivers/gpu/drm/nouveau/include/nvkm/core/module.h  |  3 ---
>>   drivers/gpu/drm/nouveau/nouveau_drm.c               | 10 +---------
>>   drivers/gpu/drm/nouveau/nvkm/core/driver.c          |  1 +
>>   drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c          |  2 ++
>>   drivers/gpu/drm/nouveau/nvkm/core/mm.c              |  4 ++++
>>   drivers/gpu/drm/nouveau/nvkm/device/acpi.c          |  1 +
>>   drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c       |  1 +
>>   drivers/gpu/drm/nouveau/nvkm/module.c               |  8 ++++++--
>>   drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c     |  1 +
>>   drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.c      |  1 +
>>   drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c       |  3 +++
>>   drivers/gpu/drm/nouveau/nvkm/subdev/gpio/base.c     |  3 +++
>>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c      |  2 ++
>>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bus.c       |  1 +
>>   drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c |  1 +
>>   drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c    |  1 +
>>   drivers/gpu/drm/nouveau/nvkm/subdev/therm/fan.c     |  1 +
>>   drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.c     |  1 +
>>   19 files changed, 33 insertions(+), 16 deletions(-)
>>
>> -- 
>> 2.44.0
>>
