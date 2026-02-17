Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EATGG206lGntAgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 10:52:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 205A314A8C0
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 10:52:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B65310E4B8;
	Tue, 17 Feb 2026 09:52:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ESHq+4wT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010027.outbound.protection.outlook.com [52.101.46.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C55710E176;
 Tue, 17 Feb 2026 09:52:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lgt3ApHVgXrMimv7toOMJIXMOy9427ixiqgrZ2FDaFAWrWMSK+M1nfgijjmjR4r33pa9+K/ff88fJA5Fl0M80QKL+JqPI+KMYs+u28aIuMx+FKVyXlf29WkEjvA00xqHrHcdcUBRGzyTvQ/mwt3gXcz3F1D3r5uGWn++gBL4dJxUo7FGoCJhDSgY/xPUjF5schp3g5wGHN84YyjwH4dRd5EJut41F/u8OHCl3klgC9awGUSveL4eYiotgY7EtLdyXEmFWbGckj9RrpbPpYtrUWcf9tw93/08isNcTpSL3TqVIdQ0MPeHzyttZvSjw0ibC9JrxU6UG/RvxFi1nrv+aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p//N4G0Wn8uuX8gbFSUtGmW3yTk9hr7sN6oQ4alXK2E=;
 b=G7Q9OSz53cXIPbkbIkfEo3k+rBWpvNwHxCCMpfjQVe5rhMV8xXUdLmcXjCxUnw8Eg0pEzAi9B4c5S7iggfrkN8U/IjHwmFhbb7Bre1bzUK8hfi4RJH72CxYZNo3nk/fm3ldO8si25KYypIfse+pMJGlNCLMOc4Bqk88FOdgIhVNevyxubBMGj05d1hyKN+i+C7wXuIXgF3D8/kRm2esZOp6RBr7mekNakjrLvA5ASRVvkrBASDJqVcBTUxGa110l9owHOXjmCphm/rhetPLc1CNNna25gdnZD7/OYQuNm0G53BPKJjDTdC12MK+wuwPnko8reLl5A/wfV5/g3X+ahA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p//N4G0Wn8uuX8gbFSUtGmW3yTk9hr7sN6oQ4alXK2E=;
 b=ESHq+4wTk9BHIKutNyeLOS8lwuCRKPGdKJAZ76TnZkGq4915A7wrTg0FKhRMB8dFZ5jb+LGxVqzYbgUTi6UgwJCdtfvttXyqnaWskRKjmmJHIWKvVPcub3WqZYM6dph5ofRaw8el2qZlMY/rBoiIfDPGhFF8gXEKTFY2F1X+Sag=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB5806.namprd12.prod.outlook.com (2603:10b6:510:1d2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 09:52:36 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9611.008; Tue, 17 Feb 2026
 09:52:36 +0000
Message-ID: <0aa8147c-254d-4a1c-89ee-9dc4d4b6b022@amd.com>
Date: Tue, 17 Feb 2026 10:52:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/8] dma-buf: Use revoke mechanism to invalidate shared
 buffers
To: Leon Romanovsky <leon@kernel.org>, David Airlie <airlied@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>, Simona Vetter <simona@ffwll.ch>,
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
 Vivek Kasireddy <vivek.kasireddy@intel.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, iommu@lists.linux.dev, kvm@vger.kernel.org
References: <20260131-dmabuf-revoke-v7-0-463d956bd527@nvidia.com>
 <20260217080206.GJ12989@unreal>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260217080206.GJ12989@unreal>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0076.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB5806:EE_
X-MS-Office365-Filtering-Correlation-Id: 527060c9-33c9-481f-d635-08de6e0a4740
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WW1Keis0TjZ2K3hpcUNpZXJnNkFnOGh0TG91UDFqODJNRVpONlV3TGF6Y0ZM?=
 =?utf-8?B?Rm95ZE55S3JDUTlRbzRtYXdCTmZ5eXdTU1ZOL2tWRDRqbE5rWklFUWlVOCtx?=
 =?utf-8?B?Mks3dWg2S3poWjU4QWVQRjZCY0xtb0V0ZTJuRkdnYTFRdEJMWFZVVUYyeTN4?=
 =?utf-8?B?bkcyaVVSRmlVRjFYSlFZY3dKUFd3ak5DZTJPVmdzeUZ1R2oyTW0xOENCSmsw?=
 =?utf-8?B?MlYyNXd2dkZLMEUvN2pxWFFtUDQwQ2VhRUNRQ0t1bi85Wnp2d2dtZHliMmMr?=
 =?utf-8?B?b0hFYlNQTCt5N3NXZzVBd0Jtcm91d1dUNUZPQmx0UXNwbWlhSTZVZE1tejIv?=
 =?utf-8?B?Tk5SZE94Y3VQNHR2L1h5Sm9lRzN4bUFwZCtwdU5FNDZrVHNtbmhyUHo1bUdj?=
 =?utf-8?B?anpmc0E3NE1iSUM3bm9vMzl6S1BEUXE4aVRXU2R4ZkhCUGNTTU0zd0RPN3cy?=
 =?utf-8?B?UTJ0b1NTZnVZNHdxcmxNYkNROHN3eDJ3eW5aV1VPK1NHWS9zYTcwQk9GZGRQ?=
 =?utf-8?B?dk0wdUYzbVFWMzduRlVzQWVpSllES29RTEFuZjRrQ28vUGtDYmtNYytIdlFP?=
 =?utf-8?B?eDdseXlXblJqdkRTVUNrTFdEL29KR1o5cG50eFRjNVptZzBNSDRQK2NmSlk1?=
 =?utf-8?B?VDB5OXFGYng5VllmNXJEd3pxallOMlpiNFBDVndXU2M4bnNiWmlOMzN1bWdQ?=
 =?utf-8?B?dTUvdElkc1Rxc3gxeFMxZUFTSEMxdUwvTVdrYnhpelRrSmphV0N4eXQrQll0?=
 =?utf-8?B?YmlTS1g3MDRHdDUyY2VEZTMreWVlNWk1YVJCMGdaNGN6R1Uzelc0dnV5aDMv?=
 =?utf-8?B?cnVudGxuMTZhNzkyNlpCb2ROdDZWWUwzTE5TSzVQVHVaakN5aWlyNDhxbWEz?=
 =?utf-8?B?TE1wZ09EVHgvZ0pzT2pkVEtnNEtRaFJ2WlI3VkNFWTNLVWtuR3BQQnRrZzJV?=
 =?utf-8?B?cHJqdWpFQmJVM3F6Wk95UTFBekhWZHBwTEgzSlp5d1VONXpiaWR5b1VOV0tx?=
 =?utf-8?B?MXJHNmJVM0pkcnpaUnpncVBIeTJQUWVXSUhrWmxEZFZERFRQeUdyS09VTkx5?=
 =?utf-8?B?a3lpYjRhRS9hajhMdmVFVkJaMXI4UUtwR0xiV3grMHdwVWU5MjNsTGR4cVI1?=
 =?utf-8?B?MlVKUjNrSnkzVml5WU96YXRJUm5ScWtodlg1ZGVHQTMxNUM2aW5mUUFvT09o?=
 =?utf-8?B?dENQNVVPVHZOOW10V1YwNHlVc2wzZnpXU0JjVWk4cXQyY01NUWFKT1ZxdnRy?=
 =?utf-8?B?WHN1Z0FBamUxckNqa01ETW9IOUJCWG5OU3lhNTRPNWR6YUJFbWRmZElsL2dR?=
 =?utf-8?B?Z1hHNk1WSmhvMFRpeXFLNHo5azEzUENieTYvSXZwWGpRQU9jcmVseDlPU3hm?=
 =?utf-8?B?L3d5ZzdsMnlmVjlJSzFUZkFUZHR5Qk1GdFlLYytLSUUxK0JpaElETXcxWm53?=
 =?utf-8?B?cFJtbDZkN2NhVHF0MUg0MEtvNE5LSGY2amxsTmRoeWVoQWdaeVFMSFptd0lK?=
 =?utf-8?B?M3ArR3NMNmlOU3ptTWhObGpmdDlUNkY4Q3dlM0tucFJhWlhRQm5LV1R4R2ZB?=
 =?utf-8?B?MEZrYkU1ZU5TSzNmTnVHMzRLVjd3aFQ2VnAwTGhRbU5ScXlQMDdidWdBTGR5?=
 =?utf-8?B?amVvZEZoa3UydDNoano2djRJbXJqZmVKSTZUZklMMFVOZ2lINjZUSFdGSldu?=
 =?utf-8?B?YUJYZ2hWMmVMb3MrSVMxTlFUSHFKUG1SM1VUa3U2SUI0enZRd2d4QThMWDlN?=
 =?utf-8?B?YklFT2xFOWlLcDAzYWFqVkxKbFJLdHY4U0szZTk4aE1CV3AvbENJU2gxRUMx?=
 =?utf-8?B?TGlUZ21XMWw4bmRxTy9wWlJoL2pjRnpWRmxuTHIwZ25FblVteDgxU2h3K0tG?=
 =?utf-8?B?NjJ1aUtuNlJibHBkY1ZpdGZySFZZeUxxYy91MlVPWHk1c1poT2hDUWd5YW9R?=
 =?utf-8?B?aHZEMkVBUktyb1dOMUIwOXNNVjhzRnhHcFVGSkZNZVhudlhkRTB5c1dGR0Zs?=
 =?utf-8?B?akh4YUpPdUtvT3JKTnRDZkNRaEVIYmkxaEdVSlErTDVmNml1MEV5VmR3SDgx?=
 =?utf-8?B?Z0Q4T0xiQWt1SStvb2QzVFVKTUQ3NmtGcGZDMFQ3OEFGdlRUT2MrSElNbitN?=
 =?utf-8?Q?SYvU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0Rjc2xYL3pWRXl4OXpHcG43Y05xWnZOVnFEOW1UdUtyRGlEdTJBeHBwUzBD?=
 =?utf-8?B?dDVVMzlKRXc0akVNR3ZSc1phYy9PVDBzYzhVUEtFYlBRVGJQL3Z3Zytnc0Vv?=
 =?utf-8?B?K09INmpUdmduSVN0Yy9NRkdwUWFkSW9xSkNVdDhtM3dybHhOOEU0TExtS1BN?=
 =?utf-8?B?SVcwZ1JMb3dVM3dmdEh4M1dLWUowN21jaDhCbVdBdzM1MFZHR2lRTXNCZm1W?=
 =?utf-8?B?akF3ZWd4ZmZxUFlwK1hlYnBlN0h4VTkxU0puQXJTZ1c5cUovQWdWS09RUzAw?=
 =?utf-8?B?MndoTkJVc1AvUnJTVkZRUzVleXNWTXg5WUttY3FZRjdhL3dMWlhuQjlOQnFq?=
 =?utf-8?B?WVFaa1JuaEVvaVFSaTdTU0VubUE1SDlSTTQzRHFlajlSWFIwbUhzMUxYWDMx?=
 =?utf-8?B?TGxIY2djVm5NTGd6ZWxOOUI2bkdsUjlOZUJld0pDSXNwS2laU0ZlZzNqc3JQ?=
 =?utf-8?B?ZFVDbVc2YmR6WktZOFIvVFNMTUU5VDFCMzhzKzBPQURnQWRqcGswWjRsejk1?=
 =?utf-8?B?Z0JqTEFBNWtaekJ5aE5aNS95Ukl4c3p5eHVYU0lFSFIwZzhjd05TVXVPeWJK?=
 =?utf-8?B?S0hwMzQ2M1hQVWZ2eGNYeW1OekRTZ29qYS9BK2Q5UFZlcEEweWRmSldDdXF4?=
 =?utf-8?B?ZEZVVWc3eHNIblFmNVVKclN3ZEJhZWNwWEJiSlhtVkVLQ0Z6UDZHdXRteGsv?=
 =?utf-8?B?amhkTi96S0lvbnozc3pqVDZkY3g5aC9ZWFF3emR3NmI0MStCSndRRHBOR1E1?=
 =?utf-8?B?RGtEcklac1Z4c2ViYnRnL0Y0ZnJ0RlNod0cxMGlMWjd4dWJrQ0dkazZhZ3pQ?=
 =?utf-8?B?ZTN1RitmSXVleVBDZGNLQXBMVmJCTGU1cGJlNHhDcS9aVU9lQkgvaUhVMU8w?=
 =?utf-8?B?aWluSG9pQzVnQjRRWjVMV0VISXhZU0FpVHA4U2JZbWVDOWJtZE9QR2g4V3Bu?=
 =?utf-8?B?dEhsTUl0Ky81dWlPN3RVRUUvUGVTT2lORlRhV01JTklzQnFmRU1BMkl2YnBM?=
 =?utf-8?B?MGRZbm9DaFJKSmFrdDg4K0l6b3ZqTnZ2QWtKa01XZEg1MmJMeUI1c0NnSmps?=
 =?utf-8?B?UzJvdUsxTU8rU1JCQkhzT3lkdW5MUUY5NGNQZEdsRmZXZlNSdkxabEpVbUIv?=
 =?utf-8?B?NDNtZi9SanRGR1ppRUpuYUdsM2luYjIyTTQxSU14MVB1WFR3ZXhOUkFvMllP?=
 =?utf-8?B?NHFOVkd3T01PanJvb3pWRFQ1VEFzU1VYZlJYZERIclViV3MybHZXTFMranRv?=
 =?utf-8?B?ZHZidDg2M0JlN3Q4NFl1Tnl6bS9GWnJIbEdPNkF2SUNlTVQ5Y0hIdEh1S0Nk?=
 =?utf-8?B?T2pyd3B4cXBLYTd6MDNLZGdSenFudTE0dEYvTyt5WHFuK1Uwb1ZvV250L0VT?=
 =?utf-8?B?NWVFQ2R0am5RZW1yRENUVTgwbXZob2xwZ0dqOFhvbFRzcEVrdWlQbklNT01D?=
 =?utf-8?B?QVVKM2ExRzg0d1JRY0ZWRmlWT0hqbmlhc1UzcTIzOVZ0a2NtYlRCYmJvbVF0?=
 =?utf-8?B?dWhQT0pZUWJGRDdpRHEvRGdsOUxKY0hQaWw2bzFFUzRjRTJNbG1JcFBtd1J5?=
 =?utf-8?B?R0JmRUlRT1dNMW5NMElJQllFSGQyNVhEd3drWFFOSm1MbnRRZXR4RHRHOGpu?=
 =?utf-8?B?RFpvZjFtbW9jV25jZjA3cVgrRkk3T3RmNVdxbFk4dWZIaHI4OTVIdWZkb1hw?=
 =?utf-8?B?S1IzTUNJTmltM083elJXdmNSbVBsTkVrVXF6TGxDa2hKdjA3WVVWbk9lOEo1?=
 =?utf-8?B?MWM2U0dZZnVGNzF1a2Jva1BGQWltUlhzNk1kYXBBVUlIcXFRc2kreG4yeUp3?=
 =?utf-8?B?cndWZTZOWVpBUnNPU2FpVHRLNDJHUGp2V0N1cWxsM2Z1SFlqNWVjbGpYNGpR?=
 =?utf-8?B?SDZsenpIdENiMkNmUEJ6NHpveGludEhQb3RaSzk0QmtDeTdnOWxCZ0lHYmV3?=
 =?utf-8?B?aE1KNnJxaHRwa09rMGZTVmJhbnNTclhoMTNzcDUxZXBHUitmS0J5cGVieGcx?=
 =?utf-8?B?RUNaV0FMaEp2REZVdWxsRW5nMEN6ZjVjSzBQc0Z4QjY0YnphT1F0VVlhUVpV?=
 =?utf-8?B?UVUyK2RDMFowV01iWGxSMVlMZ1kyRVJpaVJ0SnpvM0FBYW4vYVJjaUxZU04w?=
 =?utf-8?B?eFVqRXd1emxQOEo2MnZQVlRxQ2pnSzh4OWxoaktkMUVJZUVtdWdDUUgyMVRm?=
 =?utf-8?B?K3p1NVlDZjUvbDRkSHNqWHp2RjVwRWRmUlEwbkNUUG1uRzZUTy80QXF6VFkr?=
 =?utf-8?B?bzNJTlpUcmxxM0lpc2JjUUxNbTBMcjZhRlhHOWU1eTdjSHlaMUVDd1BpWkVn?=
 =?utf-8?Q?7okPGCHrs8NPesyjlK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 527060c9-33c9-481f-d635-08de6e0a4740
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 09:52:35.9201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RGGjcgu+EvjxLbcEw7qdJEsFzNBu3OgNERcY6SrD2IRZa/IJAAPd1ofCEQ47GdsE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5806
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
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linaro.org,amd.com,ffwll.ch,redhat.com,collabora.com,chromium.org,gmail.com,linux.intel.com,kernel.org,suse.de,intel.com,ziepe.ca,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 205A314A8C0
X-Rspamd-Action: no action

On 2/17/26 09:02, Leon Romanovsky wrote:
> On Sat, Jan 31, 2026 at 07:34:10AM +0200, Leon Romanovsky wrote:
>> Changelog:
>> v7:
>>  * Fixed messed VFIO patch due to rebase.
> 
> <...>
> 
> Christian,
> 
> What should be my next step? Should I resubmit it?

No, the patches are fine as they are. I'm just waiting for the backmerge of upstream to apply them.

@Dave can we get 6.19 merged into drm-next (and then drm-next into drm-misc-next) ?

Thanks in advance,
Christian.

> 
> Thanks

