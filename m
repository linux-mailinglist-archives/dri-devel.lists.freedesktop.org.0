Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9379DA19476
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 15:59:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A5E10E6FA;
	Wed, 22 Jan 2025 14:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="c2/HbW5g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9148F10E6FA
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 14:59:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ueq0jxt84xmLv8oxXFiYWBIx5qdXy2xouljCAmMDe6UtVFPgCfOFM2fmb/s/osgngwnHTzPl9fpPTpjGrbt3rTyH2xtsdp9zgj5MamkcBx4Kf5xGFccxQRk0y0738qGy148Rc4ocqS58Mrkq/dCIv4dGatr81WyNLT8gUQMeHlh0ZTMzVB2kWP549KAbNwPrJRAaRm4MZBRhF0nz0ELGRj1hKaEnd9ZOJOOfeJMPr2+cGYzwsqW7ngN5PGoKxml0sK9C5+hOM1ZQJT058Ec2jqkLwbM4HR1DdTjsd8iBtxVFw5sEWT52FuGDoI4AOvyP1MNVGm+Dk8xoz9qr/NHmig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+efFtitZwwu9/7Zn7ZI4QmqVeB4WS/3kdvf65pEQCLw=;
 b=nBBYmqaaSSDLjTY3xL3vkY3Rbp8sURi3IIAuVsTnz2j26oCPXk9pxnDpKnvEx6AZYWRKkrmTBsq8ltSALMQGFs7dy0T3AMYws5Wd+2a7Wm1kn4zc8r/bP4wY5yse/E4l6dp47PckvRfc32hN7aL/LFm+2GSvf0FooLZoY/41fgaJJTar91AMoYoIOKxEPo7nVGBciapyDaMKcrDKTXXkE82xfW/JsbiawHHcEEYi8Zj0irak9mQWISyBNxXlWxRo9kda/ZnnSKcn1vgH2whFpZuPQhXwAD8dw92OnKI86YbyW0Jxox9iXXJGVj+2xe08wgjI5M6eY+Nma6zS/0dd/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+efFtitZwwu9/7Zn7ZI4QmqVeB4WS/3kdvf65pEQCLw=;
 b=c2/HbW5gEGYsFHQs9vMe8AgKy3rmRIsD/4L5Fkc8XYHlhkyrRr0PEiCzwtLWxP+sAjGH9vcozceeCnDYiayF5FCsc+cr7gsHzMqSUQY2SdITbGqWLysA75IsjyWizx47vBIxD9MDY3+JmIPytrWK4VFQarQQsN5fizJXoHOJOHU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB9489.namprd12.prod.outlook.com (2603:10b6:806:45c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 14:59:20 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8356.014; Wed, 22 Jan 2025
 14:59:20 +0000
Message-ID: <827315b0-23b6-4a39-88eb-34e756298d67@amd.com>
Date: Wed, 22 Jan 2025 15:59:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
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
References: <420bd2ea-d87c-4f01-883e-a7a5cf1635fe@amd.com>
 <Z4psR1qoNQUQf3Q2@phenom.ffwll.local>
 <c10ae58f-280c-4131-802f-d7f62595d013@amd.com>
 <20250120175901.GP5556@nvidia.com> <Z46a7y02ONFZrS8Y@phenom.ffwll.local>
 <20250120194804.GT5556@nvidia.com> <Z4_HNA4QQbIsK8D9@phenom.ffwll.local>
 <20250121173633.GU5556@nvidia.com> <Z5DQsyV0vwX3Iabu@phenom.ffwll.local>
 <6612c40d-4999-41a1-a4a5-74d3ff5875c3@amd.com>
 <20250122143744.GF5556@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250122143744.GF5556@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0133.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB9489:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cc47dc2-ca52-4b3f-6307-08dd3af5595c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?am9jM2IwQkZQaFhwWGxmNVdqbStEVWhIb2EvaFlwTDd6UXdPUEpOSlVYNjE3?=
 =?utf-8?B?azdyYTYrb1VQNUI5MHhmbktyUHRVWm9NV2M5ZTBKZmo0eGdPM2kzSDY4VGQ2?=
 =?utf-8?B?bTBDZEdaZHR4aTFZeWJkbmQ5QzNrU0dpZkd6LzRDOFpVMnVET01XUG1DcVFI?=
 =?utf-8?B?dGxuODkyT2hrT1liTFBOWnQxVU9GeUFFK2RzTTNxSS9CVDdmbHJ0c3ZRSkpw?=
 =?utf-8?B?dDNJVmFUSEs4eUN6emRtQytGZDlxZXRaT0xSWHVTTlptMkVTWEwxVnlHcW00?=
 =?utf-8?B?QUhETHdCT1pOS0o0SGRyRy9yQnYzalFkTFk1UE5jUDFCckE4Y0I3ZHNicGNy?=
 =?utf-8?B?dTdNdkRJaGtaZUV2TDUwcU5KNDNiUEtIQmZyVVRPQXpQY1lkMWl4TUk2Sno0?=
 =?utf-8?B?Yy9HMXFFWCtvR3pOdDRlVnBZNnV3ZkQ1SytKWXgrcDNWVWxHU0NOeTdscHV5?=
 =?utf-8?B?YzJYM1Z2MGt3bTgwcUszdUxDMnU0eXBtZVhva2pmdVVEZjN3QlVmLzlZTUEw?=
 =?utf-8?B?eldybzcyVGYxb1VvZFoxOXZ3bDdoVFpkeFdFMjFrdStCeXF5UzZ0SVNwaXEw?=
 =?utf-8?B?UVNLaTRhWkxQTnMxTzRib0hEbTY4aDRGSmsxeUJjTXhjbFFBSUc0YUZuamJX?=
 =?utf-8?B?b3N2QVhkNXNZMlBEVkdXTFhVNlpLaHFia1JWdXkxNlRNSXh0TXNPT0FIeFN5?=
 =?utf-8?B?N3JFbUlIcWIrdzRTaHdGNUJKREtoZnk4ZWlOWXFDZ2ZDWmIrZldBemJZODlM?=
 =?utf-8?B?NWxIWGJERCtLWHhhbjVJMUNTK3BJN2V2akh6QVMrRnp6eURvRmM5amkzZDVW?=
 =?utf-8?B?ckV4UFBKblpMSVZYZG1tTE1zbjlMK3pLbFF1dDBIR2h0UjJVbStjSmRCYlFN?=
 =?utf-8?B?WjFheTVtZXVVaFhmaVhHYmo3cmhpVE9ySlUyeW9GNStvTlh1YlArVHhXU2ZC?=
 =?utf-8?B?RVJRcjROVXJLWFhxOEVUNExUejVjSjZxQk5OYytCd21kL0hiODJwT2o4eWQ0?=
 =?utf-8?B?bDc1NWVWckFCOWNUSW5IZ1BTdklUOUlSb0FBTU80ZDVtVHgweWg5ajlnOXd3?=
 =?utf-8?B?UEJaN0R0dmlmZWJ0SWE4bzI5c3ZYenJBVzFGRzRjUkhGb3d0NDdudmxKdkpE?=
 =?utf-8?B?eDB4NWI0SHZ6WkJjWUNqTHNqU3JMbVF3MzFWbFl4M2FrS05uSG82dTZxdzhQ?=
 =?utf-8?B?UkRIUDVjaXN0bHJHd2tEUWhSWmlmUmJxdGtWTE9xVG1ReWJDdkVkUEFBMk9X?=
 =?utf-8?B?d09aWHpJYkF2RmxIZ1c1RmFmTno3azRCZlo1d0MrR2dJTWp4UzJGZUxMQzVO?=
 =?utf-8?B?d2hXL2dLbVJxcWozeGk4RUhrODJzMGtmazduYnJ2ZkR3OU9xd0dNS3UvUEsy?=
 =?utf-8?B?TnFKejYrVnRSNEJlNlptYjhUSHRtMEdoRW05MVQxNEh6VlJHY2pkVm1UUXRt?=
 =?utf-8?B?QTJ4cExLUnNqQmRMQVI3d3p4M3NxZjMvQ0o2N3hWanp0cVV0SHRHM00ya0NW?=
 =?utf-8?B?U2M1Q09hcEU0bnZRdSt3dnoxaUdCOVNuMjhqTUFyak5hUmJab25IdmZRV0hI?=
 =?utf-8?B?MTlSalI0aGErS1gyWUlpMk14dFV2UDgvUzJrY09MQmxMRzVDRE0zZ3l4bC9O?=
 =?utf-8?B?Mm1Uc1Q5U0t0R1JGTVJjNHZCdXlEUXNCU2ZCSmx4KzN6aGl3TmFkeFhESU95?=
 =?utf-8?B?c05BSVNKVWhBTE9abkVha3lHUXNwT2VEYXY2Z3M2amFCZzFHcUhPMWZPMFYx?=
 =?utf-8?B?eThua3kxMUNFdHRYYWVFMFR1eWFTZXp2QVlLemhna0pPOTVvdkx6Ymk4WW16?=
 =?utf-8?B?RVVQNkNVUFY5dUxsTkVHbHB6ZlhsYTJZUkhWTGVmVnFLSmJsa1hwOUJuVEt6?=
 =?utf-8?Q?ndVuKhhxaBLYs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXFaNDRobDQveUtPQTl0Wm5oeHByRGZDZ05ac0xSeFI5bERETnhrUlRUVmtG?=
 =?utf-8?B?YnlTMDZjY294aGtZSlh0c01tRyt2Mk8vcnJOKzArWHhOQUJEd2IxdE5lcVU1?=
 =?utf-8?B?ZktsSVRNdlNpZGo1ckRaS1BES21QTEsyL0NjUEJaSXRUQnF6Ynd3Rkszb1NH?=
 =?utf-8?B?cUhpKzY3aXlJME00WEhGN3hEOWFRaFZ6TGNDNzAyS25VbFBxRUJXT21oeFNN?=
 =?utf-8?B?REx5NXdMNEJwN3NxR3djL3FVc0Frdyt4ZUluRTZGc3BPbURuNVYweWdHc3dm?=
 =?utf-8?B?ZVJ5MnY2K1ZuaWNQRkNUTllqTEh3YXRsa0hXOGpoYmRPaTNLYStEVjdYNVhK?=
 =?utf-8?B?YWNQb0o4eHZvV3o3TUtRWWVxZUVqSENNWXUxQ1YyeTlUczVFdjZoUVd1WUJD?=
 =?utf-8?B?SWdSR3MwN1ZHcXQwZ0VyZEZERExPMjRGaHdFeDRzVTg0MHhzQjdqNlI1VlNO?=
 =?utf-8?B?UUIwYWZSdzJ5cjZsWmhobDN0TUVFQXpqL2Z5NWNWVDdOWTg3TTZjK3hBUDM3?=
 =?utf-8?B?RjlSYTlXWTRRcWQ0UzhCQzc2OGx2bEN1UG9GSXhCQTk1WHVpeElXZFY4eTYr?=
 =?utf-8?B?VkRyWEY4VDB2RWhLZmZ2YlFuc3FLVEpOS3ZvOXg0L2pmOUhwYjZLNVhzMUJY?=
 =?utf-8?B?RE9hVlVYQWM3M3lUbVBpdGRzZkZKdW1hVkE4dEFaVTQwL1dGYlFwSG1yYWow?=
 =?utf-8?B?NHIxa0RiVFc5UmZTbFJPd1NkWkVuR0VXVDlmZHRRbnNLcFNHbVVqeFI0WStE?=
 =?utf-8?B?Nit2U0hxTFNNUGd2YXEyaDhIc0hXMUw4Ni9oWGlyVEE5YmlWQXRPVEx3aGRt?=
 =?utf-8?B?Z1RSMUZmSkV3VFFxOS9vK013ZGlPaWlDYzVkblRKejBkN0k3ZVd5cXozUEda?=
 =?utf-8?B?dkhubWdvWWgzVzhhZDVMYkJIK2o1ajlhT0RpVlRGZThjeWJhdHc0dFJVRVJu?=
 =?utf-8?B?dmYvOTNMNWIvSkd3WFpOVHVwYjFKOWF4Z2J1UExzc3pncWFMazZVdG44MjBC?=
 =?utf-8?B?Y1NrbmdJWWI0NWZlc2cyQVlYTkJucmZBb3Y5Z20vSG1vaWJLa2h2T2VWYXRN?=
 =?utf-8?B?bHJONUw1T3BycTIxL1Y3OEJKb2UxUGMvZy9kdnE0ckRLQ2wzL0h6UnFDc0Ni?=
 =?utf-8?B?L2FCNUJDL0tZZjZRdFdDY0JiQkpUdkdnb2hjNytNZTl6ZFBvTVdOVEhubG83?=
 =?utf-8?B?ZVE1TGt1M1VVZG1YbHpyRmxPU3J3TzFMSURlTExMSzl1S2o4NndyWDNEZWkv?=
 =?utf-8?B?Zit4R0ROKzRCdUxjazJ3S21oNzJzcnY1d0xCUU9zb25KR1ovdVhPZkdBMHMr?=
 =?utf-8?B?U1JsNzVGTFlmTjNGN2N2aG5zMWVjeHR1NVo2SnpTVVZEQmlmZ2JOUEx4ZWRT?=
 =?utf-8?B?ZFZobTY1N1EwZTNsWm4raS8wSy96ZWloL0ZHdkFXNGVMak8vMEN5dUVOcEUx?=
 =?utf-8?B?MThDUnNKZk5TeWsxN3ZFZ3RXSG5mcDUwUHlLM1YyeE8waU4xdDEySFQ5OTZ2?=
 =?utf-8?B?RVVOVHhEdmF2NFpDS3BGNVBDNThVZTlNMGwrLzFaakUza29IUkdPbjNoNTJ4?=
 =?utf-8?B?MW9kOG5PVTNzdHJ0NnJvTm4xQUkyRXNBT0JkZEhtQ1VpY1c3VzM0WlkxL1E4?=
 =?utf-8?B?Z3hkZVROaW9rVk1GTmNQTjljdzUwTUdBWnpxUGptWWEzWGhqR1FkSHgxbFJX?=
 =?utf-8?B?NlBZWU9peHlVRDhOcitVVXkxcHc4alR6UXNJcjJQSkt4UVg2R3VaTHFIS0h0?=
 =?utf-8?B?cDRKUTVIMXRKUFdnWlNhdlN1Q2VGNEZ2WUcyU3U3RlJXSFp0VWtJdDFXU2tJ?=
 =?utf-8?B?VHVFWm9KMTJZc1loSGpBWkc2bjBGWU9Nc3UwUHh4ZzRnV3RieFp0VllvZE9X?=
 =?utf-8?B?UjRYM1pGUzJ5c3BnRW5zTXlGMDNxWEhGaTNLYjFtemY2OWRUYmxyMmxzdEZN?=
 =?utf-8?B?UjcrR3ZNY3FHd2EwNkRtNFVxNnpkRi94akdacmpOSVBiSmg1TmgvUGRRajcx?=
 =?utf-8?B?a0hyQjkrWldUbnR3bnhrYlljdEIyTmNUNXloRlF3c2J0Y0tBdE42TXU4RzZt?=
 =?utf-8?B?N2NadS9sN29mdHJPNzMyYjVXRW05WHhtN1FtWkpHbnY4ajVUb0Z6ZWRFQldG?=
 =?utf-8?Q?qlQ9Tv3OKRFWvCvLwn3vHlqAV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc47dc2-ca52-4b3f-6307-08dd3af5595c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 14:59:19.9621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d4wEJXyGFdEclo3THjFctmv+A8zJWcBy2WalUFhRzMO1KWX+ymQpmL984DIYrnjN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9489
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

Am 22.01.25 um 15:37 schrieb Jason Gunthorpe:
>>>> My main interest has been what data structure is produced in the
>>>> attach APIs.
>>>>
>>>> Eg today we have a struct dma_buf_attachment that returns a sg_table.
>>>>
>>>> I'm expecting some kind of new data structure, lets call it "physical
>>>> list" that is some efficient coding of meta/addr/len tuples that works
>>>> well with the new DMA API. Matthew has been calling this thing phyr..
>> I would not use a data structure at all. Instead we should have something
>> like an iterator/cursor based approach similar to what the new DMA API is
>> doing.
> I'm certainly open to this idea. There may be some technical
> challenges, it is a big change from scatterlist today, and
> function-pointer-per-page sounds like bad performance if there are
> alot of pages..
>
> RDMA would probably have to stuff this immediately into something like
> a phyr anyhow because it needs to fully extent the thing being mapped
> to figure out what the HW page size and geometry should be - that
> would be trivial though, and a RDMA problem.
>
>>>> Now, if you are asking if the current dmabuf mmap callback can be
>>>> improved with the above? Maybe? phyr should have the neccessary
>>>> information inside it to populate a VMA - eventually even fully
>>>> correctly with all the right cachable/encrypted/forbidden/etc flags.
>> That won't work like this.
> Note I said "populate a VMA", ie a helper to build the VMA PTEs only.
>
>> See the exporter needs to be informed about page faults on the VMA to
>> eventually wait for operations to end and sync caches.
> All of this would still have to be provided outside in the same way as
> today.
>
>> For example we have cases with multiple devices are in the same IOMMU domain
>> and re-using their DMA address mappings.
> IMHO this is just another flavour of "private" address flow between
> two cooperating drivers.

Well that's the point. The inporter is not cooperating here.

The importer doesn't have the slightest idea that he is sharing it's DMA 
addresses with the exporter.

All the importer gets is when you want to access this information use 
this address here.

> It is not a "dma address" in the sense of a dma_addr_t that was output
> from the DMA API. I think that subtle distinction is very
> important. When I say pfn/dma address I'm really only talking about
> standard DMA API flows, used by generic drivers.
>
> IMHO, DMABUF needs a private address "escape hatch", and cooperating
> drivers should do whatever they want when using that flow. The address
> is *fully private*, so the co-operating drivers can do whatever they
> want. iommu_map in exporter and pass an IOVA? Fine! pass a PFN and
> iommu_map in the importer? Also fine! Private is private.
>
>>> But in theory it should be possible to use phyr everywhere eventually, as
>>> long as there's no obviously api-rules-breaking way to go from a phyr back to
>>> a struct page even when that exists.
>> I would rather say we should stick to DMA addresses as much as possible.
> I remain skeptical of this.. Aside from all the technical reasons I
> already outlined..
>
> I think it is too much work to have the exporters conditionally build
> all sorts of different representations of the same thing depending on
> the importer. Like having alot of DRM drivers generate both a PFN and
> DMA mapped list in their export code doesn't sound very appealing to
> me at all.

Well from experience I can say that it is actually the other way around.

We have a very limited number of exporters and a lot of different 
importers. So having complexity in the exporter instead of the importer 
is absolutely beneficial.

PFN is the special case, in other words this is the private address 
passed around. And I will push hard to not support that in the DRM 
drivers nor any DMA buf heap.

> It makes sense that a driver would be able to conditionally generate
> private and generic based on negotiation, but IMHO, not more than one
> flavour of generic..

I still strongly think that the exporter should talk with the DMA API to 
setup the access path for the importer and *not* the importer directly.

Regards,
Christian.

>
> Jason

