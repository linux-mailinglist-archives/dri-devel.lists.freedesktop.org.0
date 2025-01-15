Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E22F8A1253F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 14:47:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA3010E6A9;
	Wed, 15 Jan 2025 13:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="c/14YQQR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::60b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 839E410E6A9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 13:47:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RNBxr4vxVIVlroMUK+XIyxY8D6QHqaMI/vkFCElgQNBltc6CAWYZQzuPNRRbGN62ZHCma4YqxcV4LI041cY0AMCcYaX4g/4BUuYI2F0pC2giWktjcX65RADonwvYSXZnceL8gQkXjnjWlU4FlsKcrIArEnf+HgIf7uPiTW9s5gsr3dhlmciQ+g2ajI6fn33abJBxqY//hc74M7hHXip+aQFcVLiiRa4AZ35PKjLQRnz6gQfgljCQz8wRRMOJq7SxKlYeGBbuCUp+X3nTMcRApx2NNjNvU9JGfk//NT6UFg3dvlhX/82eN1bk2NTbAgpl8MKSyTc9RKg75Vl+XNo8Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RMaIiZ8ph2Yn04GgAofOc/1BFr4mP6EgdbDycB0+AnQ=;
 b=HBSO7c/JVd5DnODW5/dxF1A9ZSG6JXR0Oc8IFOitjXzBp9m9dzdMaUl2RghXDSteqxs6hKqcPtwsrhFqG2oSYDMj6c9dWt3GlXG9c9x7DwEPTyf0ZZpXBOoDyCW7w0MAgvaafOiSSkV6ZTc1q2SJM2qYroMgyvRf4wz0pTkzjI2BRbPO+mUeiECQ0NWpej24zlKcU1nEHv0qH+77ZeQf38p/u4PiLUjrWG75+VWKg1c8qkPpi2dY6Cy1Y9RBcc1xrRYIRB/dAwRLTaf0shy2CXRZr7ZtePGxFwwcVlO5aYlvr7I/R2hUyrFm/1spQBxbQAu1LaM1UrnFTcUe3I548A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMaIiZ8ph2Yn04GgAofOc/1BFr4mP6EgdbDycB0+AnQ=;
 b=c/14YQQRAwOyOfGcm2eN/7RZdKn0UnhyghYH70XCNNxUjtpz5P/JXMMv/nHBdy99tC58TwxvqGEu505x3bLIYnc/myAHDLW4zcpmjfrnh6QtDC3GUAWyg4q8GBqCkA2oX9mCtokZSCW8lrlp79a6a+ten8XAiW/YFQZj4/fyhWM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB5740.namprd12.prod.outlook.com (2603:10b6:208:373::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 13:47:06 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 13:47:06 +0000
Message-ID: <1afd5049-d1d4-4fd6-8259-e7a5454e6a1d@amd.com>
Date: Wed, 15 Jan 2025 14:46:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, Christoph Hellwig <hch@lst.de>,
 Leon Romanovsky <leonro@nvidia.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com
References: <f3748173-2bbc-43fa-b62e-72e778999764@amd.com>
 <20250108145843.GR5556@nvidia.com>
 <5a858e00-6fea-4a7a-93be-f23b66e00835@amd.com>
 <20250108162227.GT5556@nvidia.com> <Z37HpvHAfB0g9OQ-@phenom.ffwll.local>
 <Z37QaIDUgiygLh74@yilunxu-OptiPlex-7050>
 <58e97916-e6fd-41ef-84b4-bbf53ed0e8e4@amd.com>
 <c823f70c-9b70-441c-b046-71058c315857@amd.com>
 <20250110205454.GM5556@nvidia.com>
 <d213eee7-0501-4a63-9dfe-b431408c4c37@amd.com>
 <20250115133821.GO5556@nvidia.com>
 <f6c2524f-5ef5-4c2c-a464-a7b195e0bf6c@amd.com>
Content-Language: en-US
In-Reply-To: <f6c2524f-5ef5-4c2c-a464-a7b195e0bf6c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB5740:EE_
X-MS-Office365-Filtering-Correlation-Id: 111006fa-a06a-4e02-1743-08dd356b1972
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWpUSWpOazNRa2s0Skg4WVVGS01URkhnZmlpdTB6NlViT0U1ejhpc3pZYUli?=
 =?utf-8?B?MDNLTWRMU0EyeEJlUUEzTVNkNXdkMzM5bm1GWXZHZGRVNVpVSHdSK2g4N29L?=
 =?utf-8?B?c1dPTGVyZ1kwa1JUTEFlVkVhajVoUTl0V3pLZThMSjJYc1l3NHJpbHZrQU1h?=
 =?utf-8?B?aklSRmlPUVZHaXovVWEwU0hLMnhHVVQ3azRXbjQ3aVFaS3JXeW1NUWNablBO?=
 =?utf-8?B?WWs5SzRVMVRRWWFOU21RQmttUDF1RmRZMDE2TkJyNklDaFozekw4bng1WHdl?=
 =?utf-8?B?UEFiRGF5ajRzVGVvVEdSQWRkanFFaVFOWEI5L1lneTJ4UU1lRkVrOHpya2FX?=
 =?utf-8?B?Z0NKQm1ub2hoK3M5OXd6TElJaGVlV1BlZm9aSFNaUnFVbTkycC81alhMN3Jr?=
 =?utf-8?B?aVg4YzNreUdoU3BlOWc0OWZxS29DVEMxVE11NjZydVBPeUZvKzVSMWJhcTBi?=
 =?utf-8?B?QlU2eFlOK0JKUGxIaE03STB0a1NxUHF1a1hMK1ZneGxNZ2JFcUpLVzBNTnY4?=
 =?utf-8?B?cHhDSTB0U0RCS1hNOGQ5TWd2SFU4TWd4T1dETEdML1dGZlBxRUY5cnkyZWMr?=
 =?utf-8?B?TGRjMGxxZWEwR0lQTkJNTk9RMzQzYmpkVGpvRWhydzBva3E3ZFhGTkluNEdh?=
 =?utf-8?B?T3FuU1h1ZWE0YlZvcVdpY0lmUW5EQ0E3Q1NJRDRlVGtUSHVrTVk0OTVDYVRi?=
 =?utf-8?B?cjNSbXFBT2RnbjNNN2s0d2VvOVU0YWlnOW1hV2h3eWtkbTBHM1lUbjNHL1c4?=
 =?utf-8?B?RXlRUUZDTHh3OWx0bWNWb09LN0RzUGVtQkVQSm9aa09PREszeWF4ejZOWVNs?=
 =?utf-8?B?cm84bjdDbVE2TG1xQjk1YzFVRzVkakZsYkVXdnlCM25tV1h6TlcrSGlUNzhM?=
 =?utf-8?B?T2JDZndNMkhwVDNONk9jVjhwZG1RNVk1RkU0eEdtWjlpV3M1VVZFZHllbGhO?=
 =?utf-8?B?dEU1ZWFpZVlHdkg1NktBUENGVWNxenFJZndrWFFKSzc1M3BzVHFDdjlxL0xi?=
 =?utf-8?B?T0RUTERzVG10TUZuRXpLWDZXeWtHUC92aEZ6bytLenNFZFM5TjNuT05HbGJN?=
 =?utf-8?B?aXJCRFhxT2tITFN6cndPMUUrNVIrOU82THI5c2MySllhWHgzUDR3MzkwbElM?=
 =?utf-8?B?WDJNbWtIUTNEL0Rsb1VRUlRVZWNNQ0t6SlJBRHhuSElTdDVObUhWcWgrSnFl?=
 =?utf-8?B?QmZBdVd4cDBKRHY2NWZvem81MUVPS0p6NklMZkpoMHh4dDhOczBtVTVjUjVT?=
 =?utf-8?B?TDVZSUVIN1lwa3BXRUl4Vmt4dFpuOUNDMEhtMU9iUG83elRwaG5xeSs0M3NH?=
 =?utf-8?B?YTY2cVgvVmZIVms2YmJQY3VEVklDVnByS0ZFdkJwdE1rRkJhMElhYzY3TTNz?=
 =?utf-8?B?eTVIMVR4QUNBMG0yd1p5OEM1cUNTcGpkREt2eFNub2JqeU9jNVUyQWtNb1Mw?=
 =?utf-8?B?SkFlLytpelFHbDNiVFVKd2sxME02MG1LV25ubGV2azB3azVvODVHU2t0SkZm?=
 =?utf-8?B?dThlTFdlM1gycTNJR2JzQWsvZnExaFlheVlxTmxBRElhanRnd1J3Y21jN3p2?=
 =?utf-8?B?Z1RuNFR6REFhL0JUZDVlSkdldWFhcmRLaHZqOFBBeCtQckdxU3dFWXBkNWtO?=
 =?utf-8?B?Tzk0UUptZ2xHM3BxeFdhbWFnNmQ5OHZJaURtM3VpNFFWdEFwR0lidnZ5Zzgw?=
 =?utf-8?B?eit3djRpYmlUUlJGTHZUMlFYcVhicjlZVmFFM3ozNDJmUmJQRVVhS29jbmdX?=
 =?utf-8?B?RDRjU3pvOWdPQ2JRN24zT0tHTGgxV2lYYWUrRWErN3kzSEFrRXE4akd5cW4r?=
 =?utf-8?B?THlSWEhEWFlLV2krWkxBN0R1eTlreXF1cnl0Q0d4d1ZoNW9hNVIrREgyeUVw?=
 =?utf-8?Q?1exOv4Rn3rya2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGs2Y3pBWnZSNHhZWnhUUWJ4UHErSDNwU0tSR1kvMEdmdmx4TkUzNnF6aUh2?=
 =?utf-8?B?M0tYYUdudUxoNjJYVGh0cmNWdmZYdis2a0cyOW1TTXNaWE5ZWGNVaXJ6ZjZQ?=
 =?utf-8?B?cUlrYnhCcTVCc2JWdUNXaVNkYW1XVlVvRy9QOEY4WXJxdXBNV3IrN3BjWHcw?=
 =?utf-8?B?UXg5T1EwZFRlLzZlTGNob01EbUVURG5JQTNsamQxaGt1dTQ3T0Zkbzh1SmEw?=
 =?utf-8?B?UUp1TE1ZNS92Zi9uY1B4TnZMZDl6ODJScVpYTjlObTl2bTk4SWNVNDBOTDBk?=
 =?utf-8?B?RXFpeHVKdUw5azgxdnZxS01xQmVyWUJLeWExaXRmbm1xVCtrNW9mRXVxQzIw?=
 =?utf-8?B?OUJZTEpwRWs2KzVnSDNJMG1VSmZsMGZjdTRqQm56eGw1b0NxK2E1SEoxWG9r?=
 =?utf-8?B?ZzRvNGh0ZGJGdFF4VW9RbHZGckNINHo5dDFmRERlM1V6ZTJ1Q2lUbDlWVFZy?=
 =?utf-8?B?UWR3VWpPTDM4bGxLcmI5RTJSVmdLY3dWb3N0UXJvY1VOaVhZbW5SQk0wOEUz?=
 =?utf-8?B?ZDlGZ0ZYSlJKUlE2UXlvckgrY1d0VElJb2N5YlZvangxUzRWSU5tTnNsNW1T?=
 =?utf-8?B?bnMrSzMzOEgrVm05RWFvYnBlVzh4RkxtWmpmbm0zeTg1SFNET2N2aGhIVytu?=
 =?utf-8?B?cmcra3hWZWE5KzMzOVQwSjZLNk84REhsTlRiT0xWdXhyOWZ4Q2ZjYTMyTmx1?=
 =?utf-8?B?T2d1ZTFpRHVkSDRnNXNGajNZMHpuYjAzUjlmTk5TcDBzVWt0MnB0d0k4QVY2?=
 =?utf-8?B?Z0ZIbGhkZ0djeUlmMDZCSzNmUGkwdUJtVS9iVUtYMkVIWUU0NUVtUWtQSlNi?=
 =?utf-8?B?SkQvRDJsdG5PNTNoeFk5cDV0Vk5MdWxtOVRMcjVRUXNtNnhnRVpqVldEcnIz?=
 =?utf-8?B?SDlIbnQxelVoMmhaSWpjWk1MUml6RXBZdDFoUUpWUWhHSHlydTdnY3h4eGRo?=
 =?utf-8?B?a1BKOHVmYkR6Tzl2R0J4VHI2RUo0Y0RiV0dTZXJmeWVNRmFuN2Y5eTcvSnlG?=
 =?utf-8?B?VXBsSlg5c2tMQ1N6QTFSdkQ2bGszYnNsbElMYnB2dWQ4ZkloQmphMS9QUURN?=
 =?utf-8?B?Z2ZOSW53Rm9jMC9IQkJrSC93VkQ4QW5TWXdwWUdDWWdYK1NSK0g2YW9ndFYy?=
 =?utf-8?B?S1lkMS9aeFBFdWFwRDN6UlNXRnNmOUJtaEpPVUU3UXZHWEFxZXJuNjcyQkho?=
 =?utf-8?B?ZEMwLzhIQ3dUQUt5TGFoS0pkV2d4ZnRzbm5BcFdaaW9maExYV3I5V2h3amRV?=
 =?utf-8?B?S3NpWGJEczM4MjhoaFJXWG5HNWJsUHdwUzJCL2ZsaUVSYUlaSUdlNjJEQlpP?=
 =?utf-8?B?dGdKR2FvcjNUSEtINHpvU1NXc001TStxbmsxOUF6ck03UDQ4TkJuWGFidUNh?=
 =?utf-8?B?NWNKVzV6NHBCbnVJTHA3YVJrbzhUTDNQeWRRbHMxakl1TlEyMHZEdXpoM0N4?=
 =?utf-8?B?ckZzL2dyNU0xTk0xTUNLaFl2MFVHZko1dlZMd0EwQmo3QWdsU3BaR2l0NXlL?=
 =?utf-8?B?UkZNZVFiMjNRdnNoTW0yVkhFcnY2THZ4ZTNlTmt1SkZ2dndDRTNhZTNwMEpo?=
 =?utf-8?B?MnhiY1p6SVQxNTRvSXlIVTlud2VQV2lCNUJTeEZEODNuK2NDTjExTVdxWUp4?=
 =?utf-8?B?Z3BYWTJFQkQxTUVBZi8xQjBSdk1lbkt2NXJNYlRDaWZOUzJlbTNuS2p2bGJq?=
 =?utf-8?B?d1JFZ2ZNV0J0N0Y1Uys0NS9POUlqRExFTm9uR2hadkg3VkNOUnZlZm1Xc3hP?=
 =?utf-8?B?VmxGQ04zWXlWSEFpSWplbUdYa2VRVFRoYWl1M2hvSzBXSkFZN2NzMElmOS9r?=
 =?utf-8?B?YXBRdERtM3A2VFM0bWEzRUlWQmREQVl3ei9nZzhQL1M4WWduRmhING5BZWs0?=
 =?utf-8?B?ZGxmR29mN00zUlBhb0pOVzdQdFM4enlYekI0YmFRSkJ6bFprelFQK2t3TDdT?=
 =?utf-8?B?MkZaVUkwVGRCK1JwUzhRUjJlMHp2TVhBSzdVZUhHY2dGREpzVjVwQjQ5Mi9O?=
 =?utf-8?B?MU1DS2JnRFI1M0Y4eExWczFDa09xK2xkWlZENm1GQ1pZVk8wNVpuZFIvZVFM?=
 =?utf-8?B?QnI3WTd5NVlmK1d3eVlNdEMwN1huaHdiM0tDUE8zWFlSYkNzQTZBTXdSYll6?=
 =?utf-8?Q?CkCAc7WJpDqonUa3xud8fjpoU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 111006fa-a06a-4e02-1743-08dd356b1972
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 13:47:06.4283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bD1cDXfB1XBW9xvuuwOIe8Nh4CQZKtu0/cQNHPz1tLyzDS4fjt2VBkNHqOIK4Xzi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5740
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

Explicitly replying as text mail once more.

I just love the AMD mails servers :(

Christian.

Am 15.01.25 um 14:45 schrieb Christian König:
> Am 15.01.25 um 14:38 schrieb Jason Gunthorpe:
>> On Wed, Jan 15, 2025 at 10:38:00AM +0100, Christian König wrote:
>>> Am 10.01.25 um 21:54 schrieb Jason Gunthorpe:
>>>> [SNIP]
>>>>>> I don't fully understand your use case, but I think it's quite likely
>>>>>> that we already have that working.
>>>> In Intel CC systems you cannot mmap secure memory or the system will
>>>> take a machine check.
>>>>
>>>> You have to convey secure memory inside a FD entirely within the
>>>> kernel so that only an importer that understands how to handle secure
>>>> memory (such as KVM) is using it to avoid machine checking.
>>>>
>>>> The patch series here should be thought of as the first part of this,
>>>> allowing PFNs to flow without VMAs. IMHO the second part of preventing
>>>> machine checks is not complete.
>>>>
>>>> In the approach I have been talking about the secure memory would be
>>>> represented by a p2p_provider structure that is incompatible with
>>>> everything else. For instance importers that can only do DMA would
>>>> simply cleanly fail when presented with this memory.
>>> That's a rather interesting use case, but not something I consider fitting
>>> for the DMA-buf interface.
>> To recast the problem statement, it is basically the same as your
>> device private interconnects. There are certain devices that
>> understand how to use this memory, and if they work together they can
>> access it.
>>   
>>> See DMA-buf in meant to be used between drivers to allow DMA access on
>>> shared buffers.
>> They are shared, just not with everyone :)
>>   
>>> What you try to do here instead is to give memory in the form of a file
>>> descriptor to a client VM to do things like CPU mapping and giving it to
>>> drivers to do DMA etc...
>> How is this paragraph different from the first? It is a shared buffer
>> that we want real DMA and CPU "DMA" access to. It is "private" so
>> things that don't understand the interconnect rules cannot access it.
>
> Yeah, but it's private to the exporter. And a very fundamental rule of 
> DMA-buf is that the exporter is the one in control of things.
>
> So for example it is illegal for an importer to setup CPU mappings to 
> a buffer. That's why we have dma_buf_mmap() which redirects mmap() 
> requests from the importer to the exporter.
>
> In your use case here the importer wants to be in control and do 
> things like both CPU as well as DMA mappings.
>
> As far as I can see that is really not an use case which fits DMA-buf 
> in any way.
>
>>> That sounds more something for the TEE driver instead of anything DMA-buf
>>> should be dealing with.
>> Has nothing to do with TEE.
>
> Why?
>
> Regards,
> Christian.
>
>> Jason
>

