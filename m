Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DYZI22PcGkaYgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 09:33:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E38BC539FF
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 09:33:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E53D410E705;
	Wed, 21 Jan 2026 08:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Vk2deEeC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011005.outbound.protection.outlook.com
 [40.93.194.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B501010E705;
 Wed, 21 Jan 2026 08:33:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=teIBefKFNd4FhnO7DRqpn5vomGSFGfjO/W4ahStVoVu69mMIr7WJFzmXqJ+GCA9BR0cMdaiYu5aWrEM5W1hdUOge04ZBjLiZnyC6OqVTBpqu7EObHxaGos32p0L/NWh2O+0oNdJAME9zPnZuPtuFVtkCeHlSS4u8YY98vgWgi3y/WYMFwZ2RWgJohy/EI1avFoK1cAWenBO91A4vAYPVyxlWmErxaG6kkDjo7Hzcv/5nVtPLbvBJFI7GCWPBHmL7HDKJ5z+9wxj8aBmr7vj1gbJVpeOGFpEuLfdmBF3CzvSUBOUDlV/9SrBjiqCL0Bx5l7BiUJ1uFRtUWhpmxFm5lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ClBS+oBA9W5t8/yley4yGCiyQpZDtw903Z/EEcKauQ0=;
 b=B/cnli3cF6WAf+P76pEXrCclXNnhLsh9ClB42+x+SrL7e8k7vyv/rE6J03eH4GjREd95OfmpqVItLtgOa9qWz2IlvePzftC1vwNBKYi/v7pEdn4NdQORwbHpSyN63PUQ9LuBOEQw0YVCRbmPqVxbq49jaZTYWycmhECqpZag5WJivXi+FnOqvpA7rlXlRP3aGmYb7LaJtaEq3xLZyGpWAFWjKYtqfCh9+0ePR/XyVRy1DUl80a2XhubNGAyJNKtAmFyd7u7LokUnaId8wqwiVju+AZuvLBwCVJa/0VZqaE3Sp8LaEkGDtlVnethxne8kPwgsNS6txWPN4wFC8OPSZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ClBS+oBA9W5t8/yley4yGCiyQpZDtw903Z/EEcKauQ0=;
 b=Vk2deEeCJvvKlHVtPtTU0WV3wPdbCQbXIbgkCsub+DLJBhUoi4PAUGcrhdnqAhm8QzX1zZQr55swZq7HtPlO6XjHEYEvXOlSiJ7tieohoA7CTHU6bVegnfbK8mOxpByz/7hFqQT39Xb0PwtnwYN9zWKHMITb6Kyu4SmyBXUvyzA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PR12MB7531.namprd12.prod.outlook.com (2603:10b6:208:43f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 08:33:37 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 08:33:36 +0000
Message-ID: <59762c7e-f00b-49c6-bfab-ff647d3fe05d@amd.com>
Date: Wed, 21 Jan 2026 09:33:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] dma-buf: Rename .move_notify() callback to a
 clearer identifier
To: Leon Romanovsky <leon@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Alex Williamson <alex@shazbot.org>,
 Ankit Agrawal <ankita@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org
References: <20260120-dmabuf-revoke-v3-0-b7e0b07b8214@nvidia.com>
 <20260120-dmabuf-revoke-v3-1-b7e0b07b8214@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260120-dmabuf-revoke-v3-1-b7e0b07b8214@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PR12MB7531:EE_
X-MS-Office365-Filtering-Correlation-Id: 328ffb78-28a2-4a17-a353-08de58c7c55f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmhoN3hUTmhtR3Q2SnBqZ1dIL1FqSFIxS3ZiTW80blVxRlg0RGJBR2ZYanZr?=
 =?utf-8?B?dDJlcmhOT2VUMlpZY3hhN1E5d1VKV2hjUnIvUCsrbVk0NmZTTCszTDBhMjZy?=
 =?utf-8?B?dnZpZE1ZNzRBNEtkdUxIWmZZRDY2emJJeWpmZFU2SUh0bFpSclVrNVNtMXJ1?=
 =?utf-8?B?dTFmeGIveDE4MGF0S3JiWWRRYUtGQU9aWkZNQndueGR5eWdneEtsMEpJYVN1?=
 =?utf-8?B?SGZnVGdUWEpBdnVBa2laWWdSTFVxYXFiR3VuK3B2SXd4YUxOOTFrdTBSUGtJ?=
 =?utf-8?B?R25ocVRFck9sNGxXYXY1aFA3cnlPR3ZocVZUT0ZzMzQwR3VOMEx6S05zN1FT?=
 =?utf-8?B?MTh3KzZDNXY1U3ZkRUFaY2FHM2RaVEJBYVZ1WVd2KzJ1bENGV0JUOWRwM2Rj?=
 =?utf-8?B?VGFvc0tRMGJHN3BLOHVYblhOY1hhK2lFckFQVThZckljMXZEMXR3LzNkS0pF?=
 =?utf-8?B?SDBlWllhbU9UN3hpT0RaQ251S0hNTCtOemxMV2VhNkY5RTUwTVowenlTbG00?=
 =?utf-8?B?YWFpVzJUUnZHVzNqT3dzQ2JmSWNFbGZvUmhTM2tFRnZxQ0ZKcmJRTlhuK0VI?=
 =?utf-8?B?VGd1cGx5TVY1RkNKMFVYY2VwczlhY1FkMGI4elM3N3JiUDF0REpqcmRDOFYx?=
 =?utf-8?B?eml6ck5wVjcwWU96OG5EMS8yWmJLZkFBaXZxVTVtWFpoUFZyclhaLzdJNHJs?=
 =?utf-8?B?ZEhsb0hlVVpaejY1OE02bWhZTWV1OW9PaVk5VU5McFI5SnpiSDJlVWNKMXNY?=
 =?utf-8?B?Qm9weExaT2NyQUVscy8rNE9nM084VVY3L1BxazBmMEwyY2d0cmhmaXI0SWYr?=
 =?utf-8?B?ejdZMWNCbTBUcVVQV1dQa0RpMWNxQ3J1RG9pc3ZwcUtTaXJOK3JCdDRtV3Nh?=
 =?utf-8?B?ZzkzeHhOaGdDUHZCTmcyUHh6TVorSFgvNEpad1BtTmlqd3N1UXJMU2JBSE0w?=
 =?utf-8?B?MHV2ekdCTW1sM1FkN0w2YTg2YTVkWDBMcHpieVhDZnpZQ3N1eEJPKzdCYndP?=
 =?utf-8?B?T2Z3eXhVTXZUZUdZR1VoNC80RHd0Nno5T1ZJbzNYNFNKUzB5ZnRJSkhPSmdQ?=
 =?utf-8?B?Slc0VW9Kd0tIVUZnakNNL1V6T0duV3hFZTVxSS8rbnNCenFSTGR5SW1VK3Jl?=
 =?utf-8?B?dU9SUEU5eXJybXh2aHZ0WHdzNUNjWmRlK3AwMmx0SlIzb2NPSVVmMEE5eFVS?=
 =?utf-8?B?dHZkbjJSNU5odkFZSFVEV2hZOXVQWThLWEtLdjA5ZXBtWGs0SFhTY0U3SldF?=
 =?utf-8?B?dE82MkFjbUVqRk9VeklOTmlDbUVxRGNSWHVkUytRbldjQXhNQ2hsRExaV3N0?=
 =?utf-8?B?YXNVa1B4RitjT3JTbjhhSGJmYmpqSE5sbFQvamZ1VXJqbDhaNFBGdVBxYmw5?=
 =?utf-8?B?MVpmVnJaUUowRHZ1MklEUFpjMHdEWWNYc2ZBVEdkb1d0YVg5K2oxcVBxaGEr?=
 =?utf-8?B?dVVROW1haSs4TTBuZDdaMFV1N3llR2VJYVN2bktKaHJCUkdnMkFFdTlQWjlm?=
 =?utf-8?B?NkNPNzR1cEE1UmNibWRuSW5UVEcyS2E1ajJuUFNJWDV1Zmt5SE55UVJQdTJH?=
 =?utf-8?B?RUw3QlRGZ1ZBSWN3VVM1V1ZxTjJkMFRKMUVNRG9xZGVRdVlEdVR5R3E0Vmtq?=
 =?utf-8?B?RzdKU3BqMG9SaHpaSEgvVTllNUdVNlg1emNoRnpGSWswaXdGL21Kc1QrVGQv?=
 =?utf-8?B?NlE1Tjhld3NLb3lXSUZWMGZXakh0VTZjakNKTWN4aXYvVGZwemFpQ1RTK0V1?=
 =?utf-8?B?aTJWaHZKTFBYYi9qcG1sSTBMb2dqc0xaMEpJOEtaN0RWb3VrZ05Db1NGdS9i?=
 =?utf-8?B?eTA5NHhFa0tuZ3NuaEhQbXZxWWNyQ3ZWczlIak9TaEF0VEpOZVZMVHNQQlFW?=
 =?utf-8?B?YXVWWlRpSlExaHo3bDgxdFpWU0U4eGNxWUp1U0NSY1UvVmxSRm5CUzlxZFFp?=
 =?utf-8?B?b3VTOVhxWHRLaitJN3BDQjI0L0k2aFNkdVozMVJzTU5GQ2xjWk5nbUwvZmpU?=
 =?utf-8?B?UTdlek9BR2RjSy8zVWNmdjBBOW5EY2R0bTFIYUlpbHhocFhHVTVLVnlYUnZm?=
 =?utf-8?B?M1h4bnA3TDlBNzhnZEhWb1ZUSldXaWU5UjZVSCtsQWhwZldJbEhlTnp1Nysr?=
 =?utf-8?B?NWV6czBIQ0ZvVGQ1WnZSQXAzK1JKWkxDK3JHOTVlS2hoaW5UaWlWa3dTazVO?=
 =?utf-8?B?MkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWh5YjdmNXJKbmtReVRjK1FUdzRvWmZkakVteXN6Y0UzKzMvdk90NjBhWDlr?=
 =?utf-8?B?eThoc2NsTm4zQ0lubzBxMnM3ck0wUUJTdkd4b3ZnNGRWYlUyaERJMkVRSER4?=
 =?utf-8?B?cFIxOVl0WUdRcC9RU21YM2J2NjNPRGlrZUgxdWwvWDJ2NGlKSzdjWW9qV2lT?=
 =?utf-8?B?eE05TGk1Z01tczk4cDRtWjhzOGFkQ0lKajQ3Tmk4MjZMaWYwU1FlZU16N1l0?=
 =?utf-8?B?U0lvVnJsWUk4U1JScTZ4THpHN1dXK28zRzVXVE5Zbjg2OU9RM1FDS1FzNytY?=
 =?utf-8?B?OE1aUTZQMTh2Tjh4anVKcVkrTUVPaXFxd0RjaGY1U1lYRkNNbWxYdFZ5RGs1?=
 =?utf-8?B?QS9QTStJUisvdHlyNTBLVHUwNk1acDFBL0JaYmFXSDBBSnZNOXVoWWoxSjBx?=
 =?utf-8?B?aTdabzA5WTlZais0TWRaTDVnM0hZOHo1enN5bkVnZEpUWFFEYkdaMk93VGh0?=
 =?utf-8?B?dDhpOHpzdXNraWRsczhjZkRoZ0ZHREZtTVBNZVJ2RU9jdTBLaFBhSWRXcHpY?=
 =?utf-8?B?QUVnQzZ6Rkp0QllCV3BaR1k0Y2o5M3ZLYTFzdXl2c1EyWVljZE9lRTBmMmJY?=
 =?utf-8?B?Q0JCSVI5dnNZN2RHaTNwZEw0OVJTR1oyYWJ4bkNkZE5Bd2JHYzRIazVwSlFw?=
 =?utf-8?B?UkNIOVJNNXArOU5DT2FyWncreVJET3RncmhtS1dIMnhoaC9YL2h4SktIWXVo?=
 =?utf-8?B?Q2NwQ1VNWXB2OHZHVUdvSHhLR0F0VmhzcWlyV3J1dElxdDhudUgzaVl0OVY2?=
 =?utf-8?B?ZlNjVTFsMHFycjdpNHEwOWlKWXkxTnNQVzJvcjJrbFZhbi9MUXQxTEVJQXBn?=
 =?utf-8?B?alRRYUd1aVAzanJoS2N2bXNiQysrTTF2MTliNmxyYk52SzJFbE9WQlcyUnhn?=
 =?utf-8?B?em9oTEJvVGZrNThtU1NBVXhpV3RqWEFIc3A5MHppMWE0OW52QndFTE8rUFBX?=
 =?utf-8?B?b1dCWTl2VnB6b1A5TDZzb1RxM3BPT3o2TEpiNnlLN0VWNkFDaExlSDRENXdm?=
 =?utf-8?B?TGN3bGFpd3c0cWMvTWZQQkZ3d003VkY0SkRlMzE2L1h4Zi9jRHcyYjY1U2RB?=
 =?utf-8?B?OTJiRnYyNXhNQU9EWEU0c2J1U1dOYUVncGJjdDB1N0dkMUdxMlU4NVZKMW03?=
 =?utf-8?B?bEZOVlpDT3RET25HUDNhazYzR2pVMy9VVHZzcHFjQ0JnOWNHbi82dDhVcEdG?=
 =?utf-8?B?T2NRd0VuUlY0TnErM1JnTGRaaDk2R0dvcHVjNWUxRDA3UjZtQ3lZOUtTMS9X?=
 =?utf-8?B?cFdNYUZYNXJKWkVYdzhBUE1OSm1qckhkMHcrbWJVWUpmbEtZdkdzMHdrMFRp?=
 =?utf-8?B?R1NNRDN3ajlkeXd6RXI1VElTTmlueXNlWGhxek9lOWs1WFArNXMvZC9neXdE?=
 =?utf-8?B?TWZjK3oxN0pPYmluc2k1VG5wc0tDWVc5Y0JFVlhPcUlReFRFNnIrTTNtV0RK?=
 =?utf-8?B?eWN1RXR6OU55eEI5WUd6eWU3NHhoNVJtRUk1ZkhyQk1FcXRPenhTZHorNTBQ?=
 =?utf-8?B?Qk5jdDhOdkhncTZuMGhxd2R5RWZpbzhvWlJhNnIvMmpyWlpVWVd0R05MVW1L?=
 =?utf-8?B?Ulo3cDBkZTZXMGg4ZHBSbDg0bHJBejlJM1NBSFRwT2wzZCtMSlFJVVFJSTdv?=
 =?utf-8?B?YzZSdlpxcE56bUgrSm1yWVRybEJ1c2duTEpJYWxQY3hQZi9uUWgyMjV0bDNH?=
 =?utf-8?B?MnZ1VHNMNmc5Y0g5eEIxK2E2a25BNzFPSHFIWnBOSTFXNEt4Vzk2Q2hxNVFP?=
 =?utf-8?B?OWgxWEdLYm1abVpnV1ovNTZ3WVEvdEhaME8rMnBlNGdQWFdJeDNWSG5RY0JP?=
 =?utf-8?B?VEJLMjdXMGVnYjV6eXU0TGRLWUpTd0UzZUZiWTB1QitxaVg0N0ZCTEd6ODNZ?=
 =?utf-8?B?SmhUUGFpbVhCQ2xZT2cyMnpBREV6WFF4NzZPaitIUGJTdEZBNTNrVEdTdzVo?=
 =?utf-8?B?YkI3NWJRUGRJN2oyL0JpSmRVcitPWXVUZmdHUEVQcFhiRG5vQ3cwRlNhRG9H?=
 =?utf-8?B?RmdGSHhwdkh0TzlhSi9QQktQWWlpZHpnd3B0TTRlVHRrNE1ldFRSUUY2Yzdn?=
 =?utf-8?B?Y2NrbHFBODJwdGlKeHdzdGpBMjhmQmhnSjdvTEtIMHprN1V4SDFlV2NEbmFw?=
 =?utf-8?B?MmhNcWV0NG5uNWF0SmZJZUErSU1OOUcvZE1SSVZ4cUxQaUZvZE9wY3FvTFUr?=
 =?utf-8?B?K2dJQ2wyT0FmTGJCY2xndEZjdlpBQTY3MTFHdU5ZalJtR2RxdXJrUllIR0Vk?=
 =?utf-8?B?d0x4emtvbDFpeE45WVFPaFlXaHc3T2Nta1VxcFFNL2xmdERaeGk2dVZ1OHZB?=
 =?utf-8?Q?uvjtKdD1+d7JDgFnls?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 328ffb78-28a2-4a17-a353-08de58c7c55f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 08:33:36.8621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IiXV6pAOAbeuvLyD/omQzKuzoS5sOLIIW/+RqI+o7hwcnMmH3OstJiWn7ej+97mg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7531
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,ziepe.ca,8bytes.org,arm.com,shazbot.org,nvidia.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:email,amd.com:email,amd.com:dkim,amd.com:mid];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: E38BC539FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/20/26 15:07, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Rename the .move_notify() callback to .invalidate_mappings() to make its
> purpose explicit and highlight that it is responsible for invalidating
> existing mappings.
> 
> Suggested-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/dma-buf/dma-buf.c                   | 6 +++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 4 ++--
>  drivers/gpu/drm/virtio/virtgpu_prime.c      | 2 +-
>  drivers/gpu/drm/xe/tests/xe_dma_buf.c       | 6 +++---
>  drivers/gpu/drm/xe/xe_dma_buf.c             | 2 +-
>  drivers/infiniband/core/umem_dmabuf.c       | 4 ++--
>  drivers/infiniband/hw/mlx5/mr.c             | 2 +-
>  drivers/iommu/iommufd/pages.c               | 2 +-
>  include/linux/dma-buf.h                     | 6 +++---
>  9 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index edaa9e4ee4ae..59cc647bf40e 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -948,7 +948,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>  	if (WARN_ON(!dmabuf || !dev))
>  		return ERR_PTR(-EINVAL);
>  
> -	if (WARN_ON(importer_ops && !importer_ops->move_notify))
> +	if (WARN_ON(importer_ops && !importer_ops->invalidate_mappings))
>  		return ERR_PTR(-EINVAL);
>  
>  	attach = kzalloc(sizeof(*attach), GFP_KERNEL);
> @@ -1055,7 +1055,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_pin, "DMA_BUF");
>   *
>   * This unpins a buffer pinned by dma_buf_pin() and allows the exporter to move
>   * any mapping of @attach again and inform the importer through
> - * &dma_buf_attach_ops.move_notify.
> + * &dma_buf_attach_ops.invalidate_mappings.
>   */
>  void dma_buf_unpin(struct dma_buf_attachment *attach)
>  {
> @@ -1262,7 +1262,7 @@ void dma_buf_move_notify(struct dma_buf *dmabuf)

Thinking more about it we can keep the function names as they are in the importers, but renaming renaming this framework function as well would be really nice to have.

Regards,
Christian.

>  
>  	list_for_each_entry(attach, &dmabuf->attachments, node)
>  		if (attach->importer_ops)
> -			attach->importer_ops->move_notify(attach);
> +			attach->importer_ops->invalidate_mappings(attach);
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_move_notify, "DMA_BUF");
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index e22cfa7c6d32..863454148b28 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -450,7 +450,7 @@ amdgpu_dma_buf_create_obj(struct drm_device *dev, struct dma_buf *dma_buf)
>  }
>  
>  /**
> - * amdgpu_dma_buf_move_notify - &attach.move_notify implementation
> + * amdgpu_dma_buf_move_notify - &attach.invalidate_mappings implementation
>   *
>   * @attach: the DMA-buf attachment
>   *
> @@ -521,7 +521,7 @@ amdgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
>  
>  static const struct dma_buf_attach_ops amdgpu_dma_buf_attach_ops = {
>  	.allow_peer2peer = true,
> -	.move_notify = amdgpu_dma_buf_move_notify
> +	.invalidate_mappings = amdgpu_dma_buf_move_notify
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
> index ce49282198cb..19c78dd2ca77 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
> @@ -288,7 +288,7 @@ static void virtgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
>  
>  static const struct dma_buf_attach_ops virtgpu_dma_buf_attach_ops = {
>  	.allow_peer2peer = true,
> -	.move_notify = virtgpu_dma_buf_move_notify
> +	.invalidate_mappings = virtgpu_dma_buf_move_notify
>  };
>  
>  struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> index 5df98de5ba3c..1f2cca5c2f81 100644
> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> @@ -23,7 +23,7 @@ static bool p2p_enabled(struct dma_buf_test_params *params)
>  static bool is_dynamic(struct dma_buf_test_params *params)
>  {
>  	return IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY) && params->attach_ops &&
> -		params->attach_ops->move_notify;
> +		params->attach_ops->invalidate_mappings;
>  }
>  
>  static void check_residency(struct kunit *test, struct xe_bo *exported,
> @@ -60,7 +60,7 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
>  
>  	/*
>  	 * Evict exporter. Evicting the exported bo will
> -	 * evict also the imported bo through the move_notify() functionality if
> +	 * evict also the imported bo through the invalidate_mappings() functionality if
>  	 * importer is on a different device. If they're on the same device,
>  	 * the exporter and the importer should be the same bo.
>  	 */
> @@ -198,7 +198,7 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
>  
>  static const struct dma_buf_attach_ops nop2p_attach_ops = {
>  	.allow_peer2peer = false,
> -	.move_notify = xe_dma_buf_move_notify
> +	.invalidate_mappings = xe_dma_buf_move_notify
>  };
>  
>  /*
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index 7c74a31d4486..1b9cd043e517 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -287,7 +287,7 @@ static void xe_dma_buf_move_notify(struct dma_buf_attachment *attach)
>  
>  static const struct dma_buf_attach_ops xe_dma_buf_attach_ops = {
>  	.allow_peer2peer = true,
> -	.move_notify = xe_dma_buf_move_notify
> +	.invalidate_mappings = xe_dma_buf_move_notify
>  };
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
> index 0ec2e4120cc9..d77a739cfe7a 100644
> --- a/drivers/infiniband/core/umem_dmabuf.c
> +++ b/drivers/infiniband/core/umem_dmabuf.c
> @@ -129,7 +129,7 @@ ib_umem_dmabuf_get_with_dma_device(struct ib_device *device,
>  	if (check_add_overflow(offset, (unsigned long)size, &end))
>  		return ret;
>  
> -	if (unlikely(!ops || !ops->move_notify))
> +	if (unlikely(!ops || !ops->invalidate_mappings))
>  		return ret;
>  
>  	dmabuf = dma_buf_get(fd);
> @@ -195,7 +195,7 @@ ib_umem_dmabuf_unsupported_move_notify(struct dma_buf_attachment *attach)
>  
>  static struct dma_buf_attach_ops ib_umem_dmabuf_attach_pinned_ops = {
>  	.allow_peer2peer = true,
> -	.move_notify = ib_umem_dmabuf_unsupported_move_notify,
> +	.invalidate_mappings = ib_umem_dmabuf_unsupported_move_notify,
>  };
>  
>  struct ib_umem_dmabuf *
> diff --git a/drivers/infiniband/hw/mlx5/mr.c b/drivers/infiniband/hw/mlx5/mr.c
> index 325fa04cbe8a..97099d3b1688 100644
> --- a/drivers/infiniband/hw/mlx5/mr.c
> +++ b/drivers/infiniband/hw/mlx5/mr.c
> @@ -1620,7 +1620,7 @@ static void mlx5_ib_dmabuf_invalidate_cb(struct dma_buf_attachment *attach)
>  
>  static struct dma_buf_attach_ops mlx5_ib_dmabuf_attach_ops = {
>  	.allow_peer2peer = 1,
> -	.move_notify = mlx5_ib_dmabuf_invalidate_cb,
> +	.invalidate_mappings = mlx5_ib_dmabuf_invalidate_cb,
>  };
>  
>  static struct ib_mr *
> diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
> index dbe51ecb9a20..76f900fa1687 100644
> --- a/drivers/iommu/iommufd/pages.c
> +++ b/drivers/iommu/iommufd/pages.c
> @@ -1451,7 +1451,7 @@ static void iopt_revoke_notify(struct dma_buf_attachment *attach)
>  
>  static struct dma_buf_attach_ops iopt_dmabuf_attach_revoke_ops = {
>  	.allow_peer2peer = true,
> -	.move_notify = iopt_revoke_notify,
> +	.invalidate_mappings = iopt_revoke_notify,
>  };
>  
>  /*
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 0bc492090237..1b397635c793 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -407,7 +407,7 @@ struct dma_buf {
>  	 *   through the device.
>  	 *
>  	 * - Dynamic importers should set fences for any access that they can't
> -	 *   disable immediately from their &dma_buf_attach_ops.move_notify
> +	 *   disable immediately from their &dma_buf_attach_ops.invalidate_mappings
>  	 *   callback.
>  	 *
>  	 * IMPORTANT:
> @@ -458,7 +458,7 @@ struct dma_buf_attach_ops {
>  	bool allow_peer2peer;
>  
>  	/**
> -	 * @move_notify: [optional] notification that the DMA-buf is moving
> +	 * @invalidate_mappings: [optional] notification that the DMA-buf is moving
>  	 *
>  	 * If this callback is provided the framework can avoid pinning the
>  	 * backing store while mappings exists.
> @@ -475,7 +475,7 @@ struct dma_buf_attach_ops {
>  	 * New mappings can be created after this callback returns, and will
>  	 * point to the new location of the DMA-buf.
>  	 */
> -	void (*move_notify)(struct dma_buf_attachment *attach);
> +	void (*invalidate_mappings)(struct dma_buf_attachment *attach);
>  };
>  
>  /**
> 

