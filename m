Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B283C72AB5
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 08:55:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B7F10E6F5;
	Thu, 20 Nov 2025 07:54:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="id2t+wYy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011070.outbound.protection.outlook.com [40.107.208.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37EDF10E6F5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 07:54:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aqtKGo8gDUuCeD/IbskpA3sCr7PrYpAX66k3CcBM5gZYKbNQGEQ4LOrrH3AES9c+iS5L1/aUakhh62jHq2arYE0mKNYt365b3d0Q09durg7tyljKggysTsclLb/dM6QKKOw9FjwpU3oXKiauAdbSBhYFqJ0D96x+cIyxulDjDOAwYpuo4/8Ksd1ElTSyoatsk5Vv9tYXQf+UdYInwpd9H+2eU8mEIqC/0SQflbr2/XoJUQbjbKH0LZmxe5Q4TzEjKW6mjN1azfs2eIG2jyCjCUjnfMuGAIb+EJRcL3xNurqQEevfF01wYQece5EXJBtHH90++AkYfTIS8rG4doz9jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pad6igYdvd3ravLoQeU4mGzsCHjI2hMmiOJa8jkjDiA=;
 b=gCJscsHT8MSxD9uYIoYmNX6vKe8bmccgIx9Ds51d2cy+D8JyOX44PduRLbmwybM8obecIjYz50JwteVpKJ7kPQCSsg3fWof9Hamv6R1RXofPzEiFLnbSECz2MX29GDkb4E9jxh8copl/tTc5B6yJTceTmiUmV1IHgU0IuUktL6AgwnfTpZjJvEDL7a9jmoINDpNni1S9ttrf/9NilJwmaOTn7hr1dIpu1sgwVWMH8Ev3+q82/gaPSDDz7PgPV6eSGieUsuVDrs8zJ71snUVC/u90IL28pX/fAA+7I19w5Lrnzx2ASLXRPwkamOVLfFawif6MaCOgN8DKXiYv7t1jkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pad6igYdvd3ravLoQeU4mGzsCHjI2hMmiOJa8jkjDiA=;
 b=id2t+wYyOvxycLMb5MZMTJH8ZDvK4l38dARjF68b9iZK4G+vfNeSBezirgdmOe6hQ6EvKFKPl6dhDCj3OKHeJsc+beecOskDXQls0/rBryKRNUDEGWt51yGjfCiGmPooMq/jrvUk4cb0IVbW2aLi3SomseXguxbQzyu4bYqXSwY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH0PR12MB7929.namprd12.prod.outlook.com (2603:10b6:510:284::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 07:54:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Thu, 20 Nov 2025
 07:54:45 +0000
Message-ID: <209499e2-6a06-4291-ad4c-77230926c665@amd.com>
Date: Thu, 20 Nov 2025 08:54:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] [PATCH v8 06/11] dma-buf: provide phys_vec to
 scatter-gather mapping routine
To: Leon Romanovsky <leon@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
 Sumit Semwal <sumit.semwal@linaro.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>,
 Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 kvm@vger.kernel.org, linux-hardening@vger.kernel.org,
 Alex Mastro <amastro@fb.com>, Nicolin Chen <nicolinc@nvidia.com>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-6-fd9aa5df478f@nvidia.com>
 <8a11b605-6ac7-48ac-8f27-22df7072e4ad@amd.com>
 <20251119132511.GK17968@ziepe.ca>
 <69436b2a-108d-4a5a-8025-c94348b74db6@amd.com>
 <20251119193114.GP17968@ziepe.ca>
 <c115432c-b63d-4b99-be18-0bf96398e153@amd.com>
 <20251120074137.GR18335@unreal>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251120074137.GR18335@unreal>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH0PR12MB7929:EE_
X-MS-Office365-Filtering-Correlation-Id: 8583f03c-9988-4f8d-6772-08de280a11d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QU1leXpqdDZqVjBuQUZCSFBsdDhndmd6ZzFqZ216NWs2S1FHTGcyeDhibXo3?=
 =?utf-8?B?aXJKWHNueFhYbkUweDIxM1ZkSW42cWI3dkhZbTRMd0NXYXlRWEUyNUtlTDRv?=
 =?utf-8?B?S2tkK25TbzZKdnB6dFRoUnhRSVdNd0wyREs5a1h6QVhBMndZTVFkQUVtakhL?=
 =?utf-8?B?UWF2cVlTQSs2RUhlalM4YTRKVWVjREp2UDYzNGpxSGlTamgzMXpqaUwyQkZW?=
 =?utf-8?B?eDRjWUxXUS9ENTZyZHVsSjFSN2grRXBCU1BrbFg0ZlpOV21KL290TFJlWGIw?=
 =?utf-8?B?NElnTCtVNVZVSTlPUjBmN0pubHBJMjhYczhBcFNzdUI5YzVUWGp5VWJXYUgx?=
 =?utf-8?B?Y051cE13dkN6bE9KZXZTVGkvSHVOY041dWU3MkF3T3c0SHhGKzVFdEQ0dk82?=
 =?utf-8?B?YWNHUSs5WHJWRS9iWnBJRW1UK3lvVXhNL3Z0b2hQUER0UHd6dFZkOXA0Mk5t?=
 =?utf-8?B?N0NpSVNHYks0ZTNSRWRITm1xVVllTWUvYjdwRFArMXROc01mZWxIR1N5UzFP?=
 =?utf-8?B?UVNXUkNKaFMwSHQ2NGRDOWhNK3lseHgyc1BkWWdpMDBEVy9Sc2FQK2pnU1hC?=
 =?utf-8?B?L2NhY0VwM1g3aDRGZi93bmh4UjF4SGNQT1JPK0hMZzNCS1F1U3llMDNtTUp0?=
 =?utf-8?B?VldxN0p4d3RSNDNXZk1aYWp0cFg0dnliM21KMTZzNzhrYUxXSG82YnBHWlJp?=
 =?utf-8?B?MGVwaStvTVFkY1YyTzh6TW5HMkZNQWhUZHdadVplVXp6bWdhN1I0RTd3UnNV?=
 =?utf-8?B?dXlWNnc1UHRaN3Y2bHlBMFdWMWFPNnBjWGNiWkZIOXM4MUdiQTEybmJpaGJl?=
 =?utf-8?B?UVM5eWRzdFM5SyttdnR3dmlQQlJtS0xsVDZ5bWVMTktLTmdUanJYV2ZnVmdT?=
 =?utf-8?B?NGxzTmE1QmhrOXIxdXVHZjhyOERSYTc5bmxFVmZtdmYweEVMNzV1RW9QeXl6?=
 =?utf-8?B?MXhVVUZsY3BaZmJ2ekhSWUFoVEVvQ29YeWFpRnNrdEgreHRjazFwRkdlc1hH?=
 =?utf-8?B?VTJURVRBOXFEYVVVUWErY040K0pYTWFWdjJId2lYcStJQmU3ZW4ydlZXM0RI?=
 =?utf-8?B?T0VWMHQ5T2I0V25WT1B0SEJxSHVTdElCSEd2RUx0V2xRcWR2ODZJcTBUS28z?=
 =?utf-8?B?dHhGakNzRmFsTnJEUFFpVDJmT3VTUmxiVzIrUXZFY1pJb29URi9HRGZnTGRJ?=
 =?utf-8?B?bUVBdGlubStIaFF5VDJoMENRMHV2Q0xVbU9kNkFqQ2NXSWtwMGttZXZ5UEFE?=
 =?utf-8?B?eUU5cWtUeEZyMkNIQXBSYTNIRis2WmwxeHBTWXRGSFkrcWVDSHBoM08yTnBX?=
 =?utf-8?B?OVAxY1pEWjNselM1UlZBbUxvYlBqNjducHB1cXhHbGdFTWJRQVVCZUV1NWZz?=
 =?utf-8?B?VDVvYlJ4REo2K2ltd2E1eDJaWTVWSXcwR2JjVi9UU3dIQ1dEalhNeVY3SElr?=
 =?utf-8?B?cGpZclFqNDNRNmpMN25vc0gzelhhTmg3STg5Y0ZuTTBVMDZrMEU2djFZNzMz?=
 =?utf-8?B?UEdlUk5KY2kxZmNHNUNkQjh3YjdEcmx0Q280dWxGNmNCR0JidUp6dWxGWjMy?=
 =?utf-8?B?bDdiWGFYY0l1UU1IRTYvanlTbGFuNTgvWW95R2R5ZVdMbUM3eExXNnJJNHdL?=
 =?utf-8?B?YURmanlNTXNIaDhEOUFNTXhqV3VsWWVhbldxbUJzUGpVeitDSUN4TzJTaFkv?=
 =?utf-8?B?K3NNcFk1aHlKb2tWcGpKV1NrbEx2Sml2b29IQks3K1IwckNRVU9kMUdGRW5K?=
 =?utf-8?B?NHUrYndIa3lNc0l4dTNSRnZPQUIyWSswS3lIYnlyU3VCcHAwSTB0UEFFeUJT?=
 =?utf-8?B?Y1ZXVDh4WVY2dk4ydi9vb0xlNE9VTFRESThGSWorb0Q4R3lSN29ZMUsrcm8y?=
 =?utf-8?B?dkxCQVYxWjBlYzhZL0ZKMWF4L0pRNURDS3NQYVdTaGViS0pUVFNrclhuT2V0?=
 =?utf-8?B?QUs0NXpkZFd3aEVTZk43SUZvNzg4ZjV1MDY2Zno1dHhhZHMrT0RTbnRpaW9F?=
 =?utf-8?B?ejg5SkErZ0VRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YW9od2lod0R4SlQzalBDWFJ1bERFUWN1SzhkbXlCYzdrUzZNcGwzc2RmNFRq?=
 =?utf-8?B?RHJJSmpLNmtjUzhqdEwwTWtDTE43ZDNTeXIzNEF0a2xzbEVnWUdldThqUEtm?=
 =?utf-8?B?cTduTFNPQ1NieSswcVBod2Yxb2lsMnZGQnVZSVlFLy8zOFVpdEZ1UXZSaG5r?=
 =?utf-8?B?L3RvREZER3BRUXhOcGxYSCt5bFBhWXJzd0ZvdVBpU21vTkFBdmVyWStjWldH?=
 =?utf-8?B?K1Brb1ZQZUxrclViT0FwK0FOcUI4MkFLa0F2WUZyZ0psSENNOHc3Zm0vRlgw?=
 =?utf-8?B?VDhHL1E1dk5NNGtPaitIWjNUR0RDKzBMays3Qm5pc25UK1F6VTJ4VjlBeWs1?=
 =?utf-8?B?cHBPcGpoTWZlcVo2UThsMDJ6ZW9aRVhPWW5xc0ZIdDIrdVcwS0hReWJncnN4?=
 =?utf-8?B?dFhqWGNOUHdWMmN5R2J3ZTdqRElDU2ZVYVNBNzh6enJDTzFwcE1XVkY1aEFS?=
 =?utf-8?B?UU5keTJIT3hpU09XemxtYlMvbE1TOE4wMGJ5dVZkMWNxbzJEMTE4em5rZmFi?=
 =?utf-8?B?RlREUWhGWkZibk9YbUVOeXlwMmNvTzY2S1hveGRwNytaaWVTdWZkYm9WaEVK?=
 =?utf-8?B?SVVhaXg1U3IxTUhucnQ4b3dXME56YlJNT2VrbytFNGxTa2lucmdNM3dCU1da?=
 =?utf-8?B?OWFHSFlFZVhralhKQXpnSVBESFRkSzJrS1JVTkZQUHA2MGlvdXdNdjFYN1lm?=
 =?utf-8?B?VG9EWGE4b1pubG1oK2llR2htWlJUL0M0MWh0bWo0M3VTL1RneEFBd1dML1Z4?=
 =?utf-8?B?czNBMFQvaFMwd0dXUVV6TlFjNHBWcENnY0M2TFovS1BldGVZTTBHUWlXNWVB?=
 =?utf-8?B?MUVta3lYSWw5blRnSVg2dWpWK3hmK3dNTUVuTEExYkRhdWtST3NoSkZiYisz?=
 =?utf-8?B?Sjh2ZDMyMWJhdU9WZW03R01TL21SMkRwSWt2TWFpMzlTQjdUTEVVSFVRaXZB?=
 =?utf-8?B?Y3l2dm5pQytjTzI5UFRHRE13RmJYa1k3YmdrREN1R1dDZldVb3BQRGsvdFhL?=
 =?utf-8?B?SWtrUXExbmdnUVdMWFZYMytwOG9kSG41Zk9hRGkwaUxiU1U1UzlmM2tzTkZl?=
 =?utf-8?B?ZTErT2t4NXNvSjkyNUN5bWd5WjB6YitHRmcxbDl1THduL1pYL1pLQkNkLzIv?=
 =?utf-8?B?RjNuem5qUkdFbkhyWmJNZnFmTHlhN2tVVGZhTnpWSnl0bDNJRmdQeWRPMExY?=
 =?utf-8?B?OEdkM1cvMlBkQWEvUmNJVDU2ZnNPTnl1RGRnSTBsbU11QWc0UXQxZFgyTEdO?=
 =?utf-8?B?L3FRQ0dOdW1iOFUrNU1HYjFTa2ZOeU1NM09PWUdhZmNkN3NFVXpQWUNBUkpS?=
 =?utf-8?B?TEp5MzRKZ3FpN0VXWkYvd04ySy9uVkRXa3VNTFVYR3VGcDRTOHhXMmN1T05B?=
 =?utf-8?B?OXpsejZlNWo0T0JyTmR5Sng2NThRb1Z5UGJqZU5IaHk3WTBiWjFQa29rc096?=
 =?utf-8?B?dys2OHNtMU5aaFFtSmxFZzZqdHl3U1Znd3Z6RHplbkRyTys4MndieDQ5UG1W?=
 =?utf-8?B?NE5LZDl3V1dHTmpjRDRRYzJtd2JTeVlTVExmNmh2dVNIMkxIbURQMVg3ODZV?=
 =?utf-8?B?VDkwMHFGbGxrY1dNa2oyVldIdk1NUEI3OENzYzE1RzBvR1lxR3BEYWpBa3ha?=
 =?utf-8?B?amZGUU4xSU02TlJ4MkUyalhmS0VkV0N2SFppR21RdDJUK3g1cTNrdHNOQjdU?=
 =?utf-8?B?amhXczZhNlU1SzVHV09GL01vc1dpYkdmUVJZeU1ZcEdkQnlFTTg3TFBBc2dp?=
 =?utf-8?B?NWdzMnhBdG5iVlhBOXUxbzVLb0hqeDFLaE01bGd5YkUvZ0haNlQrWUhUQ0ND?=
 =?utf-8?B?M1czYlVWMVY5enBZZnB3bnN6ZWEyTnFZL1lZWGhIdzlYWXhKaW4ySEFzRjN3?=
 =?utf-8?B?LzRtSnJvWURsYUk1ZU94REZhNGVCdk1rVlRKOWNDTVZHOFVJQ3ZJaVBMYWdD?=
 =?utf-8?B?MUxnMDFOcFpQaVFhUjFxSUtTc29wM2F0bWEzWkU3andJYjV2R0NLTjhaSyt0?=
 =?utf-8?B?ODE4N2ZRUXAxRWpvSGlzQzZGSjF5dWwxeTZEbXdQek1Ma3pqR1NMakl6MjZv?=
 =?utf-8?B?V2RCZmxHSDl1eXdlM0NyK1lEa0d3WWdSMVRENnZncmtsMnVsMjhvNHNOT2tU?=
 =?utf-8?Q?Cu/c8Fm+a4znytHl8tE5S0qZI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8583f03c-9988-4f8d-6772-08de280a11d3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 07:54:44.9769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j4T3cMQ2Cx3Xf1U4lOtBUZ3aNCga9JLnUdkkiMO4e5zpEQ1nqTGqzowHaoD0F6lZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7929
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

On 11/20/25 08:41, Leon Romanovsky wrote:
> On Thu, Nov 20, 2025 at 08:08:27AM +0100, Christian König wrote:
>> On 11/19/25 20:31, Jason Gunthorpe wrote:
>>> On Wed, Nov 19, 2025 at 02:42:18PM +0100, Christian König wrote:
>>>
>>>>>>> +	case PCI_P2PDMA_MAP_THRU_HOST_BRIDGE:
>>>>>>> +		dma->state = kzalloc(sizeof(*dma->state), GFP_KERNEL);
>>>>>>> +		if (!dma->state) {
>>>>>>> +			ret = -ENOMEM;
>>>>>>> +			goto err_free_dma;
>>>>>>> +		}
>>>>>>> +
>>>>>>> +		dma_iova_try_alloc(attach->dev, dma->state, 0, size);
>>>>>>
>>>>>> Oh, that is a clear no-go for the core DMA-buf code.
>>>>>>
>>>>>> It's intentionally up to the exporter how to create the DMA
>>>>>> addresses the importer can work with.
>>>>>
>>>>> I can't fully understand this remark?
>>>>
>>>> The exporter should be able to decide if it actually wants to use
>>>> P2P when the transfer has to go through the host bridge (e.g. when
>>>> IOMMU/bridge routing bits are enabled).
>>>
>>> Sure, but this is a simplified helper for exporters that don't have
>>> choices where the memory comes from.
>>
>> That is extremely questionable as justification to put that in common DMA-buf code.
>>
>>> I fully expet to see changes to this to support more use cases,
>>> including the one above. We should do those changes along with users
>>> making use of them so we can evaluate what works best.
>>
>> Yeah, exactly that's my concern.
>>
>>>> But only take that as Acked-by, I would need at least a day (or
>>>> week) of free time to wrap my head around all the technical details
>>>> again. And that is something I won't have before January or even
>>>> later.
>>>
>>> Sure, it is alot, and I think DRM community in general should come up
>>> to speed on the new DMA API and how we are pushing to see P2P work
>>> within Linux.
>>>
>>> So thanks, we can take the Acked-by and progress here. Interested
>>> parties can pick it up from this point when time allows.
>>
>> Wait a second. After sleeping a night over it I think my initial take that we really should not put that into common DMA-buf code seems to hold true.
>>
>> This is the use case for VFIO, but I absolutely want to avoid other drivers from re-using this code until be have more experience with that.
>>
>> So to move forward I now strongly think we should keep that in VFIO until somebody else comes along and needs that helper.
> 
> It was put in VFIO at the beginning, but Christoph objected to it,
> because that will require exporting symbol for pci_p2pdma_map_type().
> which was universally agreed as not good idea.

Yeah, that is exactly what I object here :)

We can have the helper in DMA-buf *if* pci_p2pdma_map_type() is called by drivers or at least accessible. That's what I pointed out in the other mail before as well.

The exporter must be able to make decisions based on if the transaction would go over the host bridge or not.

Background is that in a lot of use cases you rather want to move the backing store into system memory instead of keeping it in local memory if the driver doesn't have direct access over a common upstream bridge.

Currently drivers decide that based on if IOMMU is enabled or not (and a few other quirks), but essentially you absolutely want a function which gives this information to exporters. For the VFIO use case it doesn't matter because you can't switch the BAR for system memory.

To unblock you, please add a big fat comment in the kerneldoc of the mapping explaining this and that it might be necessary for exporters to call pci_p2pdma_map_type() as well.

Regards,
Christian.

> 
> https://lore.kernel.org/all/aPYrEroyWVOvAu-5@infradead.org/
> 
> Thanks
> 
>>
>> Regards,
>> Christian.
>>
>>>
>>> We can also have a mini-community call to give a summary/etc on these
>>> topics.
>>>
>>> Thanks,
>>> Jason
>>

