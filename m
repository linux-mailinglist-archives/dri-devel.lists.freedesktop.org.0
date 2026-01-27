Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QC20LsKDeGmqqgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 10:22:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D9E919F9
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 10:22:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D80889E01;
	Tue, 27 Jan 2026 09:22:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="N90pwt/O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011017.outbound.protection.outlook.com [52.101.62.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F3D89E01;
 Tue, 27 Jan 2026 09:22:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQxuoBSwM3D0zC/62PMzHeBKz7hO5J4okJjWO5Y3T8BRi3MEJklBYGS2fkHF0lu/qQMqgdzEJrMt+vfbRXQBXo/5GqqUSpz1T0RDwr2ejxch0a5qcWKDhWNKqS0kdEgvshHHk9iKc18aY8QMl1t0SE55tnKfBuKznxq9BE+yqskwLBUSnfdypCmTGU9O3Oove1n3HV3n4SFIar+8b5SpVY+E2oQsEPF9KZ3zG1KrzN4L8u2rcsJbyJSF1t3O06MrpaDUlp89/xMNKVN0GKu+8TfM8Yy4xhFliI98mzV8nmSPJLVRofT/MGWQ+eBkZii9GD7lfO1TgMJcPKDnevhWiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wz6ALxbQVViw9XnmRCZW/ECMb+KNVFdEF44yOh0Xr40=;
 b=Juhof26wQVucpxXjRklYykz3Fdt7CwYp7kAaVnqtgMVE5rCLq5dAtTw/GAeUqhpnvcEhELhsJxlwgSKRdDy6dLT4Mq+7iKIIS5Nc1+3RKfX7PvCz/oT8bAJaggx7VwlvpMBC5x0ytdcp/WxTTuUfq5HFOjpgM+29YbuknXWVLL1F50acs/aLDNaKIGtz6+WA+eHnwf1X0y3Vy8EysRwKeCrkxYYw+pTJO6FhuU+EArbQsOrcjaTbPNTQRIK4gbVLJkDzHYqSCEV3SZSnUu6z83UxPY4OTQiT/GQtLjgkuo1148PbnJmHztMhyCDL7exSB7ZSbjl592D7Hk2g1c6dvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wz6ALxbQVViw9XnmRCZW/ECMb+KNVFdEF44yOh0Xr40=;
 b=N90pwt/O7omQZrGyjLTaDxFmJ62q324hLsqJmOB3bk6ku9j0nL6jqkxa+xF0XmTUMCRPPOKqmuCT0sNPNXgem3ht6oBZzS4VbphxQnk6ZsVCFNrdRMh03gg+orpefmH+534GVfNeUVwy/f5C7ofHGZNGY7Oj+kVx/BzIktQTEJ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB6749.namprd12.prod.outlook.com (2603:10b6:806:255::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 09:22:02 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.009; Tue, 27 Jan 2026
 09:22:02 +0000
Message-ID: <8e51a794-2c34-4863-b6d2-7af11b205f79@amd.com>
Date: Tue, 27 Jan 2026 10:21:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/8] dma-buf: Rename dma_buf_move_notify() to
 dma_buf_invalidate_mappings()
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
References: <20260124-dmabuf-revoke-v5-0-f98fca917e96@nvidia.com>
 <20260124-dmabuf-revoke-v5-2-f98fca917e96@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260124-dmabuf-revoke-v5-2-f98fca917e96@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB6749:EE_
X-MS-Office365-Filtering-Correlation-Id: 323bac59-9d64-455c-43cc-08de5d858789
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d01aZmRIM3RxNUJ3ZjJURFJNMUN0cWR3Z0xpaGc4NDRzTjdYWnFtL2JvSWxO?=
 =?utf-8?B?SUwrNjJOOEh3KzhMYUw5NVJUVkNQS05HaEdWQ0d5Y0RDdDZveUJQdFJETFg0?=
 =?utf-8?B?MDBSekZvRENremh3ekluejZVdmt3bDBDL294WjFFb202QVZkRFUrSi83SkVR?=
 =?utf-8?B?Um84UXpwd3FPZS81ZGJ6SkZrczV0L0ljeU0rMnlWd0Fsb3VmQkMvd1N1VGdl?=
 =?utf-8?B?QUxJbENWSWFuTWxodnNYNTlQK3hTVnZKdjVBY1RHOEcyT1ROWGRvN1FXaGNG?=
 =?utf-8?B?STFQSFJkQ05jU3YrUTFEYXJ2NUFRcUs0ODdiY2Y0UzNIS2tzaEdoKzNjR25k?=
 =?utf-8?B?SzkxQkRVWHA4cVVWcUZBVW9zZkdXN2FRa3dIMDE3akJ5TXZybkg3akRma2Na?=
 =?utf-8?B?UXVaRDZFa3lQWjJqZCtZb21OaUZIME42UE90ellFb0JJWFBVbkZnWndFak5Q?=
 =?utf-8?B?QnRBaHN2NTBHV1JYSkZvMGErZ1VUcG5GVWJDakNYcU9hUXZIVUw4THg3Z1Z3?=
 =?utf-8?B?OHlyaktYVW5JVSsyZ0labXJic0hpVUpSMEZiV2x5U0J5SEw5SERjZjZweHRo?=
 =?utf-8?B?VGc1cURQOWJta1c2Mlc2RzdXVlBGRk1tSzFiTElzamNpY3FzcFRkN2g4bG16?=
 =?utf-8?B?ZHNud0pEVWpQK2YxbkUwa0xLbUJaRWZyK1EyYTBoVWVibldoSzRPM0t2MkFI?=
 =?utf-8?B?d2ZVbmtiWlpHeTZJdGlnMVhMaFlBTjk0MjY1NW9wT1VsVXNSVHdWZFVacENx?=
 =?utf-8?B?S2RObnVjRU93R25xL1R4Z2pDdWRjNkZYNUJHWFRaWnRtbHpsWUdMdTIxeTgr?=
 =?utf-8?B?RjdVMzlnRnFwS0tmN3R3clplVWwxUUNCVHViZWUzaXZscGhML2NjejdUazhJ?=
 =?utf-8?B?ZjdnWC9CQThHaUJtMTg2Y0FnR2xUYlBqUlVDU0NmMXZTZEJyTmd1REIraW9T?=
 =?utf-8?B?OTJXRjBqNHFmam04bEpuZHNmL2kvVDRhZXBuQXRaM3BKZ01oSVRPZ3MwMWtk?=
 =?utf-8?B?dFVGQVZPeC9LekprWlp6OHR5SFNPcGM3a2xSUzFKT0ZkWUx0WXhCMnJRNGxx?=
 =?utf-8?B?MEhKdGcxVXVGWFl4VktJWVBKTXI3QlpKdWFlbWtzWUk5RXN2OEk3UERYcTBj?=
 =?utf-8?B?T1kwcWZXS2RkT2N4bE92emNpMVg5SUlCMWlMUHZ1aHFicnFoV3g4MWVyWStI?=
 =?utf-8?B?U0FGUEJ2eFJpbXBnRnFnUGZ2cUdhY3c3cWNqeEhGTmp3Mm5KS3ZWd2xVSVhv?=
 =?utf-8?B?MHdBUHhMOHhCT1gvTks5enNvajZZQThxQUVremVpWGxrU29MeldLaFpjaHMx?=
 =?utf-8?B?Q21qRm8wQTFnTXRxSkF2Q3M4TlMwSWs2eUQzK2dWTlczTGFUck9aN29OS0Z0?=
 =?utf-8?B?QXBPR1k2YVU0QTFxMzAwODRNVGtoUVliTUl6S0pCV3hvd25vY0M0Sm04Mks2?=
 =?utf-8?B?RGtmWEtaSzZsblhrMWhmVzFrVnRoYnJlN2pCRHB2OXpKZ3Uvc2ZHWHVTdCs5?=
 =?utf-8?B?c0xhaUdtNXRadDVFSUpiRUozVWFtcGFLR3FOTTdCK1JLQkpuZjhCYTdnblFK?=
 =?utf-8?B?eVFQWUU3dlFNZzNwdjBDZDVta2lsU3ZmZGl5Rkt1WHN5SmhqOXAwc090Y002?=
 =?utf-8?B?TjZqbXNETGhVT21OcnFQV0p0aGRzLy9HbG5uWU0rSEw5QUxJeUlobWt3VVBy?=
 =?utf-8?B?U2toY2YwTjJxdFZ4Yk1kOEFocHpWUmtXSFBhTFFNWmdhUWRFTzkvcHNMbnN2?=
 =?utf-8?B?ekdLcE5JUTh5OWUxY0lLdnBCMnRvcjlxM0J1ZGNGeGNkeFJtL0w2ZG95ZFFm?=
 =?utf-8?B?d2lwdDdhNGcySWIwQXRSRGR2dXFFMmdES09hVlZ6Rm1oN3IzRHN4R3NXRHov?=
 =?utf-8?B?U2xMZVV3VWNubUlvMlAyNzhha3BmWjdTUVRwTTE1R3Qzbkt2L1pLTUw3VmRr?=
 =?utf-8?B?aURvVng2d1N6VkcwZDhPdlFDWThMNFI1V0tJR3ByZUhiVWxtNXZzUkpRaHJD?=
 =?utf-8?B?K0s5QmxLMjNJUEIwaVBEd3pXbUl3VzNwMFE2cXJleGxTZzNhRkNkVWljMHlY?=
 =?utf-8?B?amVUVWg1ZWtzQ0ozZGoyYkZKNHJkbW0yUkp0a25NOERGU3BUV21VUmVRcGxi?=
 =?utf-8?B?RzRVVXBEK2h4U2d0WWtROERDS2pyQUpzck9BMEJUaXJySlI4THVHWHkybllt?=
 =?utf-8?B?aEE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXFsanpQZmtvZkVnZ3RUYTNiYzVVUHYwbkhENmtWQXRnN3Bnb2UzZ21SYm41?=
 =?utf-8?B?Umxyb25LRW1aRE44WEo1bC9rNEsxNWk1OEdBTmVqUzVkSjNTVlNFK0c2Vzh0?=
 =?utf-8?B?cDJVK2lVTDZsSjJ3SFloNXNxeStDWjBXTGhIK21xbmVWK2c4Nld5emRGMzBU?=
 =?utf-8?B?dytDNzZQYTVxQlc1VjA5QmdJZEVJaXFPcEtDU3kzZlBvanZEYkxSMVNQazhs?=
 =?utf-8?B?OFhJaWd5TFM0MnUxR2krcmpxR1I0L0NOei9CY2RwT1Zsa1lmWlVINUYzM1FT?=
 =?utf-8?B?ZDAyNG1jNEl2cFAyTkU1MFhkSDJ6TUZSTHRLVnBFUXA1TmVQREE5RU94ZUNu?=
 =?utf-8?B?OVp2d0RhMUp2d1FBb1F4aW9MY1duZ0tVcG9ncW1EdFl5MW5mcDRWanFNOFVy?=
 =?utf-8?B?L0VrSE9kOHkvb28yQkpXT0grdmtWcS82anNKL0V1WElxOERSMXU2Mzd2U0Vz?=
 =?utf-8?B?Y0FGaXlPT0FiRFJvMUlKRms3U3prK2w0RjhQUlZ0U0RNcXJHVjdteWNrTGxh?=
 =?utf-8?B?OFB0SStzdXdEaU1nc0R2RVkwVk5JR1BhYTBrMUl4SWxRWHBlYzJySlJWMmpF?=
 =?utf-8?B?RTUvZEk1SjYvcTdKcXVDVjFldCtVbndYUUFTRWF0eklVcTNncTBOdFJPcUVm?=
 =?utf-8?B?cTBzVGtlY1pJMGpFeUxPbmVkc0w2VEpNTTBjWllQem8vZm9kUTluUmZ5bVRR?=
 =?utf-8?B?M2VvOVU0K1AyVU1US3IyMVdYb0I4cVNpUUR3TEZpb3hyQ29YaTdKQnlEeTdx?=
 =?utf-8?B?NjR4Z3k0WFBwbzhON25ZaDcvaWtKemFDeXExcW5GN0ZxWWpmZ2N5eGNoeDdH?=
 =?utf-8?B?ZnpkbkNKUVgvVTFFYmZTUExPdFNYcHNHUTREdXM5bEdWaEp3Yk14ZE1CbVlh?=
 =?utf-8?B?aTZPejVoWnZ3QkdBTVhwajFpM2VBa0RsYVh5WjJvYkxuWGpGTFhpQkFaWCtl?=
 =?utf-8?B?NEF0eU1ZNW5tcjNHQ1FvVUJnaUo1MEFtSWE3RUlJM2ZOaXZPdmpBTWlWbDBv?=
 =?utf-8?B?RmdTSlN5WEpHVEJtR3BOWFFPV3I2MGVGV2lROHk4N2dNbkZGdkh4bXNTSzF3?=
 =?utf-8?B?SGpjdFJpamtJVlRVMFlHdWVrSTJQVFE0Y2NuRGZQS1N1bGFneG5PVVhkdzYz?=
 =?utf-8?B?TmVFMXB6TjVNenZXTkVmVlpaR05XNEhBZ1dFY1dQS2xaWGNtSGhvTnlpMXhL?=
 =?utf-8?B?V1E2S3ZiNnVZUVduUkkvNytneGJpakZVU2tCbjVNb09wdDFidzRnaUhYNFpW?=
 =?utf-8?B?dGgvK2lBQzZiWmdrak1TTng0WW1STG5uRWJuYUYxejRrZDJKdkg3cVd4SnVJ?=
 =?utf-8?B?V21NRXlaejVSdkxMMk13MXkrWkJXbmI3VjNxY1doRVJIc01QdGlpYW11RTFw?=
 =?utf-8?B?WkpNVXBYdFlkNmdMNWtDeWZBRmJHc29BSjdWeDY2NmNNMVVkRDdkMWdKM1cr?=
 =?utf-8?B?VkhuNlI3TzhmM1lnMkVaZXFYQ0pnRlZwb2lsd0RuOVFsWXVnT1Jjd0E0SUVy?=
 =?utf-8?B?TWZESEZtQ3VqNTRybWMyWHJKNFR4UFVjb01Da3NTeStaS2ZqTURIR2NZUlNw?=
 =?utf-8?B?SnFOYmtjaWhpNE41ZC9Na1h5b05WQzhoU0toZ1kwVVFXZkJMZmRXTHA2a1N2?=
 =?utf-8?B?Y1lzcExFTENUbWwwdUhtU2VCMjZ0MGxSL1FObWhlS0ZPbjZuc3IzTXRVOElS?=
 =?utf-8?B?NFVzUzcxUnBSYXRTWWFycHViNkwxOHN5TFI1U1R5T2xsRUxDNGxnUUhySEFp?=
 =?utf-8?B?Qm8vY3ZwUHh6dmJKcmp1MGJTY1pvQUUvZjVnTFpCK09XbXA0VE1WNmRrT3RF?=
 =?utf-8?B?TTJ2OXpSekwyV2M1b0pRb3cxamFHRC92eVV1cGJ1TDZIVUdXeFJLdHBLZEFO?=
 =?utf-8?B?ekJ4OVlocHd1b25Md0V3b3NZcUZTeGhWaEs5eUswdG80RlNKK0ZtbHBkdDFF?=
 =?utf-8?B?UE9YaFpidWx6dEwvZUxyTnNBaDh6bHVPWmw5MWx3WU9LOC9BYWViQ281MDVx?=
 =?utf-8?B?cmZKK3lRNjVHaC9lUnY0QUR2RmJ6c0g2Sk9Tc1dSU25VN1dxSFFneWtQNGVN?=
 =?utf-8?B?bC85K3p3TzRwRGp1bGdxRHRvRkpMWDF2dk5mdDlNUkIyeTFLdHQxeDQzUnJO?=
 =?utf-8?B?bnY1WDVaYmdzYjVrR2FMOVI2RVp1dlU3SjhkTTQwUyt2MXJMa2FUOFNiVXBl?=
 =?utf-8?B?UWJOZHgxOC9rcmVzTFN6UEdYcFplaVZRNFVncE9tYzd3cmpkeENHdzl1WXZq?=
 =?utf-8?B?M2dSNGovVFhTOXBLanJuVkIxZEVQcU5qRzg3ZDJKbVkzTzFNS2EyM0pHQUl1?=
 =?utf-8?Q?panDN1MGX8cfjgzv+D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 323bac59-9d64-455c-43cc-08de5d858789
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 09:22:02.3127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NT0P76g8/EP1t+qxV93/CKryw5uHWoYKAOC7D0y9A++sIFRKnWyniGpqdc9Y8iJG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6749
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,ziepe.ca,8bytes.org,arm.com,shazbot.org,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:email,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 69D9E919F9
X-Rspamd-Action: no action

On 1/24/26 20:14, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Along with renaming the .move_notify() callback, rename the corresponding
> dma-buf core function. This makes the expected behavior clear to exporters
> calling this function.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/dma-buf/dma-buf.c                  | 8 ++++----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 2 +-
>  drivers/gpu/drm/xe/xe_bo.c                 | 2 +-
>  drivers/iommu/iommufd/selftest.c           | 2 +-
>  drivers/vfio/pci/vfio_pci_dmabuf.c         | 4 ++--
>  include/linux/dma-buf.h                    | 2 +-
>  6 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 59cc647bf40e..e12db540c413 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -912,7 +912,7 @@ dma_buf_pin_on_map(struct dma_buf_attachment *attach)
>   * 3. Exporters must hold the dma-buf reservation lock when calling these
>   *    functions:
>   *
> - *     - dma_buf_move_notify()
> + *     - dma_buf_invalidate_mappings()
>   */
>  
>  /**
> @@ -1247,14 +1247,14 @@ void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
>  EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment_unlocked, "DMA_BUF");
>  
>  /**
> - * dma_buf_move_notify - notify attachments that DMA-buf is moving
> + * dma_buf_invalidate_mappings - notify attachments that DMA-buf is moving
>   *
>   * @dmabuf:	[in]	buffer which is moving
>   *
>   * Informs all attachments that they need to destroy and recreate all their
>   * mappings.
>   */
> -void dma_buf_move_notify(struct dma_buf *dmabuf)
> +void dma_buf_invalidate_mappings(struct dma_buf *dmabuf)
>  {
>  	struct dma_buf_attachment *attach;
>  
> @@ -1264,7 +1264,7 @@ void dma_buf_move_notify(struct dma_buf *dmabuf)
>  		if (attach->importer_ops)
>  			attach->importer_ops->invalidate_mappings(attach);
>  }
> -EXPORT_SYMBOL_NS_GPL(dma_buf_move_notify, "DMA_BUF");
> +EXPORT_SYMBOL_NS_GPL(dma_buf_invalidate_mappings, "DMA_BUF");
>  
>  /**
>   * DOC: cpu access
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index e08f58de4b17..f73dc99d1887 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1270,7 +1270,7 @@ void amdgpu_bo_move_notify(struct ttm_buffer_object *bo,
>  
>  	if (abo->tbo.base.dma_buf && !drm_gem_is_imported(&abo->tbo.base) &&
>  	    old_mem && old_mem->mem_type != TTM_PL_SYSTEM)
> -		dma_buf_move_notify(abo->tbo.base.dma_buf);
> +		dma_buf_invalidate_mappings(abo->tbo.base.dma_buf);
>  
>  	/* move_notify is called before move happens */
>  	trace_amdgpu_bo_move(abo, new_mem ? new_mem->mem_type : -1,
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index bf4ee976b680..7d02cd9a8501 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -819,7 +819,7 @@ static int xe_bo_move_notify(struct xe_bo *bo,
>  
>  	/* Don't call move_notify() for imported dma-bufs. */
>  	if (ttm_bo->base.dma_buf && !ttm_bo->base.import_attach)
> -		dma_buf_move_notify(ttm_bo->base.dma_buf);
> +		dma_buf_invalidate_mappings(ttm_bo->base.dma_buf);
>  
>  	/*
>  	 * TTM has already nuked the mmap for us (see ttm_bo_unmap_virtual),
> diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
> index 550ff36dec3a..f60cbd5328cc 100644
> --- a/drivers/iommu/iommufd/selftest.c
> +++ b/drivers/iommu/iommufd/selftest.c
> @@ -2081,7 +2081,7 @@ static int iommufd_test_dmabuf_revoke(struct iommufd_ucmd *ucmd, int fd,
>  	priv = dmabuf->priv;
>  	dma_resv_lock(dmabuf->resv, NULL);
>  	priv->revoked = revoked;
> -	dma_buf_move_notify(dmabuf);
> +	dma_buf_invalidate_mappings(dmabuf);
>  	dma_resv_unlock(dmabuf->resv);
>  
>  err_put:
> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> index 4be4a85005cb..d8ceafabef48 100644
> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> @@ -332,7 +332,7 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
>  		if (priv->revoked != revoked) {
>  			dma_resv_lock(priv->dmabuf->resv, NULL);
>  			priv->revoked = revoked;
> -			dma_buf_move_notify(priv->dmabuf);
> +			dma_buf_invalidate_mappings(priv->dmabuf);
>  			dma_resv_unlock(priv->dmabuf->resv);
>  		}
>  		fput(priv->dmabuf->file);
> @@ -353,7 +353,7 @@ void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
>  		list_del_init(&priv->dmabufs_elm);
>  		priv->vdev = NULL;
>  		priv->revoked = true;
> -		dma_buf_move_notify(priv->dmabuf);
> +		dma_buf_invalidate_mappings(priv->dmabuf);
>  		dma_resv_unlock(priv->dmabuf->resv);
>  		vfio_device_put_registration(&vdev->vdev);
>  		fput(priv->dmabuf->file);
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 1b397635c793..d5c3ce2b3aa4 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -600,7 +600,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *,
>  					enum dma_data_direction);
>  void dma_buf_unmap_attachment(struct dma_buf_attachment *, struct sg_table *,
>  				enum dma_data_direction);
> -void dma_buf_move_notify(struct dma_buf *dma_buf);
> +void dma_buf_invalidate_mappings(struct dma_buf *dma_buf);
>  int dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
>  			     enum dma_data_direction dir);
>  int dma_buf_end_cpu_access(struct dma_buf *dma_buf,
> 

