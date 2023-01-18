Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3086716A3
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 09:53:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0284210E6CD;
	Wed, 18 Jan 2023 08:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A57910E6B6;
 Wed, 18 Jan 2023 08:53:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k8zbT1YTA0KyRP89r4auDrtEvPdowsGobwF0S+r8MbEpO6M2tpXk+hGrssm3gBcvXpcbF+3m61pPs+fQ5xzLra30TaAGuA2Fdkac+xPrlIh7fGvVbGasSzJvXBjgNpzGhkSQGezleOsaO2UZH9VGltBZLNlmlg+PE5zKUAehJ3rTI2Pkyhd4VZhoY2XIl4hgGuZdHqPX7l6P88CAjtSFL2t+rqrINkGffo2RqG0C1HKUZtsDaEGBGd8LHT7++brArmTMUpI0ep0VTgV0kbqlaTdZ+plYCbtV93C26mol3aQ4xMFT+YUa9XIPRGP2FtDOUez+eXCIcvZ4mJC5HbpTUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XqdvrV0ZXXCodz8TNWpIpXTJahxoGFblslC6DH8DjKE=;
 b=Nbc5nJx+3d6Vo1SwRc8gJWOKK3zlgEORM/BK1c5mXj6hDcL6YJcDLZlZtVbY6feyLn2Xlv1hnJpcLYT1f5W4cDCY1wulYAH9tBKpq4NWFRfDpzTGZ7R5mRxWTd/FaQZZqBN1xOORxR2LmtZKLtMPb+MqkMlyfXYXfUwsVTHBT6ljuyATdcmpDaxr1agXiUIkDvVjrPmHh2lGIzjl2gQpl2oVQETZVvh0pjk9E5VtkD8Mj14d467EaFPV3FZVMR/Z+dnB3ZLceVYcUJpS5zMsZbjgUDq57y/GLLxAi0rOe5jw6goYXTSr+9R1eufYBiIiHZ8b/pGhx19S1JA26L/2+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqdvrV0ZXXCodz8TNWpIpXTJahxoGFblslC6DH8DjKE=;
 b=QQ6BGrozos43EmiI366/D4vzC1r9I1GjxQdQ1JoQIK4rcVlq9zk46lccTZRE+9Wr0xgayLN2CRPaWXBJ6R9/Li0PHQkd5dxEoaHbAiLZbnPxaml14Si9m8wXe1o/iI91twZxpsjNwkZlRDtnx5Yuz4u33YLiBxN8xHQuBjco7kM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by BY5PR12MB4870.namprd12.prod.outlook.com (2603:10b6:a03:1de::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Wed, 18 Jan
 2023 08:53:17 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::500a:d02f:5ceb:4221]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::500a:d02f:5ceb:4221%7]) with mapi id 15.20.5986.023; Wed, 18 Jan 2023
 08:53:17 +0000
Message-ID: <db4fa0fc-c9a6-9a48-c45f-1d655b30aff9@amd.com>
Date: Wed, 18 Jan 2023 09:53:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH drm-next 00/14] [RFC] DRM GPUVA Manager & Nouveau VM_BIND
 UAPI
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, daniel@ffwll.ch, airlied@redhat.com,
 bskeggs@redhat.com, jason@jlekstrand.net, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net
References: <20230118061256.2689-1-dakr@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230118061256.2689-1-dakr@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::7) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3589:EE_|BY5PR12MB4870:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e63386a-a7ad-4fb7-7bc9-08daf931711f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5+P2WbvDedU6ONkj1L7g++3nvuyCXAD4r1ehW7Hu15DFiHUANaB9vvRUo7LLZZb9aJwkWoa8XGHlE83mV5YOlPsXwXmf11zJR5GzQ7m+0AiWkasY6xKWArL/IGxkV6UVqmNuyA/x1C/tWr+2VfV6sztlxlRZkVMcHuDyy2nKH2ANXgwDiq9UbR80vdy5HV+QGu0qnVZlBTjEg/TAMbgP7uZbD0uGaJmomsQcq6Rk/Qx5LuTnc3VN8s8zawzvVXLXaxGhIR5j5bb5TZHYPtdzkW0tLjmNalNFup++/hD5oC8C6li3jNk6HTl3NGi1vIufnsBQfoV5FxJ0sip/M5e5sUoRsnM1xKZM+oAgmR4nvMEZJgjg3zP0LwyZ9vT8kRWG0vgGCa4iVi9iW3wGn3z0rOvZg0xc7VgOggKkLBkba2XrDP8VsFHroHS6IYFg2ORg2G1RhMWI0MBsMWUzmQj3OGcSwEM3M8gNV9spe9clJCInm/lU+syqdawlpHXIj77EWpuy9kUBvwQ8f67duyWymlNNlUICndEgPQi7GnqDSKdcSAsv3IuqVxIqXdbDzoWA/kBJFVoE6sHNtR5WfQ7ufj4TzXVt+IO74xnCFuwdwSoXoDyryWtVpknhzC2i/3kmfJJ2QahdCkydQlfM3b+V9z48oY7J7Q2QBCt3K3Kc0Cbi0/5GW7+ZHkDjWaIob9l3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(39860400002)(396003)(346002)(366004)(451199015)(31686004)(86362001)(2906002)(7416002)(66556008)(66476007)(66946007)(8936002)(5660300002)(31696002)(38100700002)(316002)(6666004)(66574015)(6486002)(966005)(6506007)(478600001)(36756003)(41300700001)(8676002)(4326008)(186003)(6512007)(83380400001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2NQb0FzVmgrQ3JvRFVyOVBvWTFMN2hEanNTdVZrTndTK3FabFFnSVppSTFv?=
 =?utf-8?B?allYZnEvOGVuWHlFZk55M2JrejRQL2IwaEZXYTZSZFVkSDEzWlBBbHVoZjZG?=
 =?utf-8?B?VlBMQ3g3QjYyVEZoak9KSlN4cGtqUmU1NzFXdzJpWW1Zd1FxTGdHMHozY3RT?=
 =?utf-8?B?ejl3aFR0d1FaM25zdnlOR3N0c0ZzU0wyUEVaQWdsckVnZUpqQTdFYWVkNHVQ?=
 =?utf-8?B?S3RJVEZSU2d1djVyeElSOUcvdWU0RFdXcUlmbUo4a1F0YVI1bDAzbmhLdVIw?=
 =?utf-8?B?dVorYzlNeFhoTk96OVhGMkU4YTZta1FXMFdEZWI5UGpwYTUzRms0MHZxSHly?=
 =?utf-8?B?NTMxUUhabWdhdUYzbkVaUUt3dWMvd0Y1Vi9SRDNPc0VjamU2RlZqNG93QXJU?=
 =?utf-8?B?K2l4VkpKZ0JnYWtaUzFCRGhvZ29VQjc3NTY2LzBPcWZtKys4Q3JnLzk1REky?=
 =?utf-8?B?N3FwMHhCdG5WSWtRK1cxUkdmTEFxaDVpTjJ0ZzU5T0kyWTU2N3poL25icTJI?=
 =?utf-8?B?ZDJxdzFrbnQzaWs2QisvN0tJWFZMSTU1eitvN2tEZW9QbU92dk91OVNqdW0x?=
 =?utf-8?B?cVZrNEk3UXVncXlpTTdSaTVmYTlyVFVRNWFiM0VyQnJXZXhZemlwN3ZEZVFM?=
 =?utf-8?B?RXdVNFIrSVpmRVBVV2FKUElJQmZ5aDhZanFoRkVNUHBlc0VhUGFOU05TOExl?=
 =?utf-8?B?aTNqYU9Ka25nQU1aNzYzKzJnWFRMenNZQStsb0JVY1FBLzkvMXFwWDRhVzFE?=
 =?utf-8?B?aFpnbmx5Um9qd1ZZdUhPY3ZtcW5EdFc2TW1IelZtQmxQR1krbXNTSjZsbGlo?=
 =?utf-8?B?bWZFTWNGVDlWRER3WUtyM3B5TWFKWlk5S3BwM0JlaDlrc3JnZkV2UFF0eitJ?=
 =?utf-8?B?bUFTMWFtYnNtQXdyNTlDY1k4eERXaFBZQ0RvdCtJaEFSWEE2aGdHNmJHWUdJ?=
 =?utf-8?B?Q0VRby9ZZk9sQlc2UGNGVERuQTRaT1duekVjWTQxWHB1UWN0RDRhbUgyd1Iv?=
 =?utf-8?B?VTJoTG55ZGVXWnhOL2xVbkFXUDlGVnhPNWFMQzIzYkRRb1JHTklQaXo1YjJs?=
 =?utf-8?B?REs1UXdSdEVGTG9HQmpGSXliYW5iYTJkakV1NEdWQ3pMVS9oVjVlUUZzUDUz?=
 =?utf-8?B?Tk9IRzVxT2RtUXNhQkZCOVREdzg3SEk0KytBZEo3R2g2NjFSUFRDUHU0Z2h1?=
 =?utf-8?B?bU1XTGJrOWJLbzZRK2tZMXVZb1ZxMWJmVWtJK3BJYmwrM1l3K0JTa0NINDlF?=
 =?utf-8?B?L3Rka0RPNjI2MG9pdklVOGRZK2pVQVBMenVDWWRYZWtoeDlBUWRlUElmWFoy?=
 =?utf-8?B?S3lQd05CaytJMU50ZkFYMXBxZVZvMEh5RGU0Q2RuTG8wTVoyVkY0R2tVeVl4?=
 =?utf-8?B?R25YTm5SNWNlSnR0TW5BRjZPZmNDVkdnR0Rzcm9xcEhNTEFxSXB5ZUNpMVVU?=
 =?utf-8?B?OXFyVHNqZTR1eTRJem9RTWF4WXdEWHFuOXlXdk5FL1NJWnlYclpQMFFXK1ZS?=
 =?utf-8?B?aG5kTVhPaVhqTFR0cElNY05KekRERGRCOEd6VHcwVVE3b0lFUTdndFN2ZEJT?=
 =?utf-8?B?eDdTNTRyWk9LSXNkcmRJVVVzM1J6K3BDd0FUR1dlb3VxT01Jcmk2VHU1eDNB?=
 =?utf-8?B?V3lGWmdOUDNzODY4V1pzMmgwOEUxemZPeVVyVUlQSHNqbU9hL0tsY2M5NkRI?=
 =?utf-8?B?UTJIUHlGSnNpekhnbkZlOWdxNVZYZUlXY2JaQ0x0MmpPcjJwZ3lWNHZLcU9u?=
 =?utf-8?B?M0xub2lIQUVkMFgweGxMbC9aYW83R2YvK21rZFhvR1VvKzhIZTJTL241SDlm?=
 =?utf-8?B?d2Vmb0VTaElaa1h4RXhuRjZjYVppb2xTaFRQd2pUdUo1dlI4WU5yUEVLSnhH?=
 =?utf-8?B?dzNPUDFTeEQ1UTczV0sxa1N2VU9semltWGJNUlNycGh2RmowT0FpUXhwWnBx?=
 =?utf-8?B?M0RLd1dYbVhLeEo4S0o5S3RKbjBmK0hWYVQzM2ZEVXNFeEM2Mkx6Rm9GdG5y?=
 =?utf-8?B?clplRFArT1lQNDZvVHExQzc3TW9DVjJoaFRFNXZBbXl0M01lcXZqS28rOTgw?=
 =?utf-8?B?cFl3bzdvRG9hWVErbnFPdkE1ZHdtaUUwZS9uQUxrbXBReHAvRFJXaWlRcW43?=
 =?utf-8?B?Z3NmVkdQQ1N0bkVNUi9GZnQ0ZzR4R2ZLeTkrL3h5UU94K0I2RWlZcE1KUFYx?=
 =?utf-8?Q?ly6slsrCTSAvi8aI4G7bZBLOt8dPQOl6xT5qXTt9u9iN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e63386a-a7ad-4fb7-7bc9-08daf931711f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 08:53:17.4667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hIB/RDrMxqoxHvcU3gHauuNKhK9L4CQMWFAVg14hugmZBxbF4lT2R1JRLgw7nvwV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4870
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.01.23 um 07:12 schrieb Danilo Krummrich:
> This patch series provides a new UAPI for the Nouveau driver in order to
> support Vulkan features, such as sparse bindings and sparse residency.
>
> Furthermore, with the DRM GPUVA manager it provides a new DRM core feature to
> keep track of GPU virtual address (VA) mappings in a more generic way.
>
> The DRM GPUVA manager is indented to help drivers implement userspace-manageable
> GPU VA spaces in reference to the Vulkan API. In order to achieve this goal it
> serves the following purposes in this context.
>
>      1) Provide a dedicated range allocator to track GPU VA allocations and
>         mappings, making use of the drm_mm range allocator.

This means that the ranges are allocated by the kernel? If yes that's a 
really really bad idea.

Regards,
Christian.

>
>      2) Generically connect GPU VA mappings to their backing buffers, in
>         particular DRM GEM objects.
>
>      3) Provide a common implementation to perform more complex mapping
>         operations on the GPU VA space. In particular splitting and merging
>         of GPU VA mappings, e.g. for intersecting mapping requests or partial
>         unmap requests.
>
> The new VM_BIND Nouveau UAPI build on top of the DRM GPUVA manager, itself
> providing the following new interfaces.
>
>      1) Initialize a GPU VA space via the new DRM_IOCTL_NOUVEAU_VM_INIT ioctl
>         for UMDs to specify the portion of VA space managed by the kernel and
>         userspace, respectively.
>
>      2) Allocate and free a VA space region as well as bind and unbind memory
>         to the GPUs VA space via the new DRM_IOCTL_NOUVEAU_VM_BIND ioctl.
>
>      3) Execute push buffers with the new DRM_IOCTL_NOUVEAU_EXEC ioctl.
>
> Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVEAU_EXEC, make use of the DRM
> scheduler to queue jobs and support asynchronous processing with DRM syncobjs
> as synchronization mechanism.
>
> By default DRM_IOCTL_NOUVEAU_VM_BIND does synchronous processing,
> DRM_IOCTL_NOUVEAU_EXEC supports asynchronous processing only.
>
> The new VM_BIND UAPI for Nouveau makes also use of drm_exec (execution context
> for GEM buffers) by Christian König. Since the patch implementing drm_exec was
> not yet merged into drm-next it is part of this series, as well as a small fix
> for this patch, which was found while testing this series.
>
> This patch series is also available at [1].
>
> There is a Mesa NVK merge request by Dave Airlie [2] implementing the
> corresponding userspace parts for this series.
>
> The Vulkan CTS test suite passes the sparse binding and sparse residency test
> cases for the new UAPI together with Dave's Mesa work.
>
> There are also some test cases in the igt-gpu-tools project [3] for the new UAPI
> and hence the DRM GPU VA manager. However, most of them are testing the DRM GPU
> VA manager's logic through Nouveau's new UAPI and should be considered just as
> helper for implementation.
>
> However, I absolutely intend to change those test cases to proper kunit test
> cases for the DRM GPUVA manager, once and if we agree on it's usefulness and
> design.
>
> [1] https://gitlab.freedesktop.org/nouvelles/kernel/-/tree/new-uapi-drm-next /
>      https://gitlab.freedesktop.org/nouvelles/kernel/-/merge_requests/1
> [2] https://gitlab.freedesktop.org/nouveau/mesa/-/merge_requests/150/
> [3] https://gitlab.freedesktop.org/dakr/igt-gpu-tools/-/tree/wip_nouveau_vm_bind
>
> I also want to give credit to Dave Airlie, who contributed a lot of ideas to
> this patch series.
>
> Christian König (1):
>    drm: execution context for GEM buffers
>
> Danilo Krummrich (13):
>    drm/exec: fix memory leak in drm_exec_prepare_obj()
>    drm: manager to keep track of GPUs VA mappings
>    drm: debugfs: provide infrastructure to dump a DRM GPU VA space
>    drm/nouveau: new VM_BIND uapi interfaces
>    drm/nouveau: get vmm via nouveau_cli_vmm()
>    drm/nouveau: bo: initialize GEM GPU VA interface
>    drm/nouveau: move usercopy helpers to nouveau_drv.h
>    drm/nouveau: fence: fail to emit when fence context is killed
>    drm/nouveau: chan: provide nouveau_channel_kill()
>    drm/nouveau: nvkm/vmm: implement raw ops to manage uvmm
>    drm/nouveau: implement uvmm for user mode bindings
>    drm/nouveau: implement new VM_BIND UAPI
>    drm/nouveau: debugfs: implement DRM GPU VA debugfs
>
>   Documentation/gpu/driver-uapi.rst             |   11 +
>   Documentation/gpu/drm-mm.rst                  |   43 +
>   drivers/gpu/drm/Kconfig                       |    6 +
>   drivers/gpu/drm/Makefile                      |    3 +
>   drivers/gpu/drm/amd/amdgpu/Kconfig            |    1 +
>   drivers/gpu/drm/drm_debugfs.c                 |   56 +
>   drivers/gpu/drm/drm_exec.c                    |  294 ++++
>   drivers/gpu/drm/drm_gem.c                     |    3 +
>   drivers/gpu/drm/drm_gpuva_mgr.c               | 1323 +++++++++++++++++
>   drivers/gpu/drm/nouveau/Kbuild                |    3 +
>   drivers/gpu/drm/nouveau/Kconfig               |    2 +
>   drivers/gpu/drm/nouveau/include/nvif/if000c.h |   23 +-
>   drivers/gpu/drm/nouveau/include/nvif/vmm.h    |   17 +-
>   .../gpu/drm/nouveau/include/nvkm/subdev/mmu.h |   10 +
>   drivers/gpu/drm/nouveau/nouveau_abi16.c       |   23 +
>   drivers/gpu/drm/nouveau/nouveau_abi16.h       |    1 +
>   drivers/gpu/drm/nouveau/nouveau_bo.c          |  152 +-
>   drivers/gpu/drm/nouveau/nouveau_bo.h          |    2 +-
>   drivers/gpu/drm/nouveau/nouveau_chan.c        |   16 +-
>   drivers/gpu/drm/nouveau/nouveau_chan.h        |    1 +
>   drivers/gpu/drm/nouveau/nouveau_debugfs.c     |   24 +
>   drivers/gpu/drm/nouveau/nouveau_drm.c         |   25 +-
>   drivers/gpu/drm/nouveau/nouveau_drv.h         |   92 +-
>   drivers/gpu/drm/nouveau/nouveau_exec.c        |  310 ++++
>   drivers/gpu/drm/nouveau/nouveau_exec.h        |   55 +
>   drivers/gpu/drm/nouveau/nouveau_fence.c       |    7 +
>   drivers/gpu/drm/nouveau/nouveau_fence.h       |    2 +-
>   drivers/gpu/drm/nouveau/nouveau_gem.c         |   83 +-
>   drivers/gpu/drm/nouveau/nouveau_mem.h         |    5 +
>   drivers/gpu/drm/nouveau/nouveau_prime.c       |    2 +-
>   drivers/gpu/drm/nouveau/nouveau_sched.c       |  780 ++++++++++
>   drivers/gpu/drm/nouveau/nouveau_sched.h       |   98 ++
>   drivers/gpu/drm/nouveau/nouveau_svm.c         |    2 +-
>   drivers/gpu/drm/nouveau/nouveau_uvmm.c        |  575 +++++++
>   drivers/gpu/drm/nouveau/nouveau_uvmm.h        |   68 +
>   drivers/gpu/drm/nouveau/nouveau_vmm.c         |    4 +-
>   drivers/gpu/drm/nouveau/nvif/vmm.c            |   73 +-
>   .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c    |  168 ++-
>   .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.h    |    1 +
>   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c |   32 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |    3 +
>   include/drm/drm_debugfs.h                     |   25 +
>   include/drm/drm_drv.h                         |    6 +
>   include/drm/drm_exec.h                        |  144 ++
>   include/drm/drm_gem.h                         |   75 +
>   include/drm/drm_gpuva_mgr.h                   |  527 +++++++
>   include/uapi/drm/nouveau_drm.h                |  216 +++
>   47 files changed, 5266 insertions(+), 126 deletions(-)
>   create mode 100644 drivers/gpu/drm/drm_exec.c
>   create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
>   create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.c
>   create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.h
>   create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.c
>   create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.h
>   create mode 100644 drivers/gpu/drm/nouveau/nouveau_uvmm.c
>   create mode 100644 drivers/gpu/drm/nouveau/nouveau_uvmm.h
>   create mode 100644 include/drm/drm_exec.h
>   create mode 100644 include/drm/drm_gpuva_mgr.h
>
>
> base-commit: 0b45ac1170ea6416bc1d36798414c04870cd356d

