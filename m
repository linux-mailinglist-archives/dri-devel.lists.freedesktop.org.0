Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB223C7331D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 10:33:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2131010E731;
	Thu, 20 Nov 2025 09:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="O68aiD3o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013036.outbound.protection.outlook.com
 [40.93.201.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383A510E731
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 09:33:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5ZQkjS5Q6Wzn0eqpijm2OUmUiuQQzTChu5E43MJ+5fqLUTRmIqNuf3N3ZzqP9PeX65dGnm+97rKWC/sMzP6ADbEOfLtuHaLl2ofBW4QagVVs0C3l8qcFyRY1MK21TLNekSrn1palSykN4W9enGsz2bGA2SxT3+8+lIJx6Y3/2o/peYNAbmsq042AwlbLEGJqS1Ouqa1OgOMqyEZ4nr9gNNfBD3CY8Mn9w3udmvIZoIBJVbBxYTZR5JkAmDkrUTxUppM/dc1NzEAHh0THd6sX14ScCMNd0r6uVaqYuUkfc4FcfI7S9Jk1tEyupnJvLyiJjWDtEPjQbfU4SepXyTTIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+IKuHfz3VsjQjAkN6PhhIVHZeqYqNaWdj453DTQok8=;
 b=gkpmEmEngSaQf0mhUGQu1CwKLlJ8jf0R3rWLn2P8b4dz9lrlnpv9Ewuj94K9BHZoj1UBb2neu6EMUm7rBOxYZUzx5/fz4T9XyHZTtKqc/2LCyCwTNy1m0DyB6GJjassdOFsaQYKOlBvYFyDqoZCp1eYBqI2CFrGqzm/5WnME0y6v0Ax0ZEJTfpmnfxu+yWNKm4/8k0NhV8qs3QKCfG+ttmdErqJGnb2vSyPkTPySI3Osz/+IB3VK5HLQGOHOsV0tbDV7vLQjUorFzFpWvKMbY8wyo8YAhu1p+rgu510WRAbgVe+HsI3bO+ppvbwfOIUnf2MmJmotl00Fvrr4I4d78w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+IKuHfz3VsjQjAkN6PhhIVHZeqYqNaWdj453DTQok8=;
 b=O68aiD3ojshtF65osjgU3NitFZWWXrT1ADuxm953qWyiDpzYrERCHO62WpijrIXn9Ubs+1wD+nPMNhFROPklevUyjyaRXLiJvoV+TUy0QCxak27caevEZTQGsyuzp0krDjnnUjisb/jiSwSqs30r4hNbEHusBq53BEhJFd4e+dI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ1PR12MB6097.namprd12.prod.outlook.com (2603:10b6:a03:488::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 09:33:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Thu, 20 Nov 2025
 09:33:45 +0000
Message-ID: <57b8876f-1399-4e4d-a44b-1177787aa17d@amd.com>
Date: Thu, 20 Nov 2025 10:33:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 06/11] dma-buf: provide phys_vec to scatter-gather
 mapping routine
To: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>
Cc: Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 kvm@vger.kernel.org, linux-hardening@vger.kernel.org,
 Nicolin Chen <nicolinc@nvidia.com>, Alex Mastro <amastro@fb.com>,
 Jason Gunthorpe <jgg@nvidia.com>
References: <20251120-dmabuf-vfio-v9-0-d7f71607f371@nvidia.com>
 <20251120-dmabuf-vfio-v9-6-d7f71607f371@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251120-dmabuf-vfio-v9-6-d7f71607f371@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN1PR10CA0019.namprd10.prod.outlook.com
 (2603:10b6:408:e0::24) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ1PR12MB6097:EE_
X-MS-Office365-Filtering-Correlation-Id: df5befd7-dad0-4e23-3e61-08de2817e6b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V21IZ1RsOEdWMlBOMTA0dDJRRlZ0ZTdiSlpBMmVzeWJ3MW1xYXhzWFV0QzNq?=
 =?utf-8?B?a1dlNHRnbTAwcmNDNFR5dEhCS2swdTVkcnpvblZVZldLSFlMcjExRXU5U0Rk?=
 =?utf-8?B?WGl5WWI0ZGdXaEJTQ2RLT3FwUi9nWnluUmc5S3ZnK1YxMWh5VlQxZUpLQ3Vu?=
 =?utf-8?B?bGJPeDNnZ1hOa0F1OTVqZFJhSGZkaVZ2YXBwWnBUNVM2UVZjb3lYT0JvZ0px?=
 =?utf-8?B?aVRZQ3JkY1kxSEg3SnlXWjZ2bFZGcUpzb05pdEphNFpOVWlRN1lDTzg3RlFk?=
 =?utf-8?B?cURKeU03OUtONmhwNVRrbEI3MWJ5SlZpWUpsdU1TaElaWllHMTNGK3lIS2o2?=
 =?utf-8?B?ZzFic24vSGxmSFhXL09ZTXA5ZnZPL05Kb24yYTBjMHRLUUhGVklzZVM5RFVH?=
 =?utf-8?B?Z0t3TnhTc2Y3b1BkLzVBWFh3Sm5KK2VUZmI5WlFGbFRWMXR4S1dSYVQ3NTlB?=
 =?utf-8?B?ZndabDVPSXZqNFNlNnNOelRRQVY0azNHaDJJQ05VU3BMc2RZMTRBTUVSZEpT?=
 =?utf-8?B?a0xUTllTeU1NREFpcjhyMTExa3hxQkxmZ21CQnhpU3VBME05UkpuY1pheGRF?=
 =?utf-8?B?eTIxWFRmVmhNUVRKdSt5bHBkU1I1KzIrUlBrWW1wUVRta21QYVI3am0yUGN5?=
 =?utf-8?B?WTlzaG1sbFpyMnozOEFqSlhpNVhIMVRIQktLc2liWUp1a3J3RWZCRSt3dVY4?=
 =?utf-8?B?ejJ4TTZvazA5aGJKVHpsdWZPa3N5ejJZYWdZT0JnZitKb3FtNVdOZWl3SDM0?=
 =?utf-8?B?NWtXWWcyZjl1WWhBeTZ1ZDhUWXFGb2FPbVpMRlpmdXJRMnljc1h0UEdBb3Jp?=
 =?utf-8?B?eE9aMXBZb2JidXM1UjNBUFNITGxPWVVrdGRrK0h6MzFackt6cW1XemFKbEsx?=
 =?utf-8?B?NmZ3V2wwUXJjWDVwVk03VVhONjY3SVdVODNyTVRYM282dHVxSk54SWFRcE9p?=
 =?utf-8?B?T2E5QjZXVm55dVMvcXJaOU1ldFJuUVo4eVFta2d2RXNXTG02Ym9yaUFabFFn?=
 =?utf-8?B?SjVvbUFreFpHUnZHOEtJL1RyaHFwMVpOWTA2dW01ZENRZEg5T3dabDF3Zndt?=
 =?utf-8?B?SjZsSEMrdW9Zc0RrWi9PemZrQU1mVU9YTkp6aHN6RjBXUG9IVndORHNsalQr?=
 =?utf-8?B?dU5pODRrZGlOTjdaODBCV1E4YnhmanFiTDFCcWJTMkprMnZoZXFack5na3du?=
 =?utf-8?B?SytFdXZETlBPalBqd29EaTlpc0gwSlZNb0pEVGIyZ3NSYmdNRVV3cDczSkhi?=
 =?utf-8?B?R0picXpiTzJyRnZqR2tJZktEU2diVG90TnllMnFGL2lUSUFuak5IY3Z2b0dF?=
 =?utf-8?B?VU42QTRVSEJoNG5PcWlIWitzeGVPcXhrc0ZSRGxjR0FnMGtRWDBrYnNVQUxX?=
 =?utf-8?B?SUtDb1M4T3FtT1VVbnNKajF4NWZHaStIcE1hVlBQRSt5UEt5QkNXaVN0RGd2?=
 =?utf-8?B?SENhQWl6NkNjQVBWMU0vb0hBSjZVcU5TcmpONjc4STZIMUs3NDRHclhyWkdQ?=
 =?utf-8?B?RDBISTJwS0xHYTEwTTJMNlNiSWtBakhCYVdvMnJXVjF5VERpbXBsR0VVM0J1?=
 =?utf-8?B?L3RaS2VlLzQ1dURwUWE5MldDZjMyc0dZbmJWa3BnRStJeXp4M3RCS0YreEgr?=
 =?utf-8?B?VlUwdGlyYjRDRzlxcnB2WnVjUnpYZytsY2JMYjlCZWFySC9UQ2hLc3lGYnF2?=
 =?utf-8?B?MER2S2p4M3RuMTZ5Vmc2ZnhUWkJkdzVvc2dtVU9la3lkUkZzOWpiYjUwbXlR?=
 =?utf-8?B?V1RSRTZEWWswenJxbmZycURLWGkwbWdySXV5dlFzNWMrNVhGVkl6V2J6SEpk?=
 =?utf-8?B?N1JOUGN3Qi9aYkViQ1c0NU1HTUhjVVNHOTM5MjI0SWo5aW1lZlZVYy9RWU9m?=
 =?utf-8?B?Z2ZIb2svSlJ3SUxJTVlNVXpLRjd5Zk1QS2RZTlc1SCtWeUJoUXAxU0szQklt?=
 =?utf-8?B?bzFzM3hmZ2U0Umk3YjNOZTlTSWJCOUptRjA2bFQzR1BiMlRqOG1BZ1MrNkRn?=
 =?utf-8?Q?uWv58s/QtbMBsqtuOxJ9qjkMAKQsE0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUNqRFBSVE5TQlZMUWtMUG82TTNPK0VqWkZFTDQycnFCZmkxODM2aTJUamJ5?=
 =?utf-8?B?ZW01Sk9Eay9CNzBWa2J1ZmxwOUFMekdyZG9ydXhrVWFCeitKMW5wQWlJdzBz?=
 =?utf-8?B?ZW5HekpKR3NlS0hvM21PcTFIQ2RBTTRuUUhqN2NocUZaSEN6Rmt5Zi94THdT?=
 =?utf-8?B?RGdiQWt4Ti93cFVxSG54NzhVeTRCZEc1OGVKd1JJait6SEV0dGthYVF3RG1x?=
 =?utf-8?B?eGhDVXhvQ1o1bXlRYlJCWFNKNElsTWFWcWlXY0dHTFZ0RGR4T1dsbjNzemV6?=
 =?utf-8?B?ank0TXIxM1F3a05nT3FVbmVCc091NG9oR3pOYzJDVXA1dW0rN2JmWWZQTU1m?=
 =?utf-8?B?VmprbkZJN0t1ak12TFVrUllOOEpMUzBHY2I1TlQwT2ozV2hSMlk1cGt0NGlC?=
 =?utf-8?B?b00xVk11M2RGN2t0OVJRcmtKbXlBU2x5VEpUR0NFbWsxVHZkUmVaSm1DWmJz?=
 =?utf-8?B?Zlk0ZmZKMWp2Zk9nLyt4d1h3U1F1STZ5ZmZUa1FXSWtlaUg3Wis3QWhueTdk?=
 =?utf-8?B?WVp0bVBTbUVmaTJIc2o0MURIZWZsQ09xWlZGQnJUK2NraDZNQ2gwWHNLN2Zt?=
 =?utf-8?B?aFFiZzlXZHlteDVJTm9MRm9pem1sR1hxRytFRWVhRGVlRzl6TFN1VkVmMjg1?=
 =?utf-8?B?eENPVHUvai9WVEt2clR2NFprc1NBUTVBUmhSZVJzUkM0amVhZ2p6Y0ZxelZL?=
 =?utf-8?B?SWEvT1lSVjE3b2d2V1N2MmFyVHc1bGlHbEUzSitEZEk3aTlHUFEwSjEzZzRF?=
 =?utf-8?B?djJFMFc3ejRlWllxWURma0habFM1L1pNY2YxVXZuNFArWWVnalRQcy9vdTBX?=
 =?utf-8?B?dVFFTUtndVlUTnhBUjc2bDFVVjdpa1BUM1A4VXQxMVA5cVhuMVFmbHlRN05t?=
 =?utf-8?B?RUYxQVo5SWQvQ21BVFdHTi9LVkhFekNNem5paW9pRURVcEdyODJwSmJiamdG?=
 =?utf-8?B?djJsWTBjcU5xNWNXbEhWWXlFSGw0dUFmaW5YU2R6enFPRXd0SmsrQ1ZqRXpM?=
 =?utf-8?B?cnhnVmpHN3pZdk5PTnl0bnR2UHJreWVDeGdrZStqUDFhR3ZlLzAwcW83eWtt?=
 =?utf-8?B?SThObDRseVFaUFFsMzNBczdhbERGZk53MHd6Ykd3L2RiOEQvMFp0ZWxsWVAw?=
 =?utf-8?B?VFpRbmR2bjVmdnBGbzMrN2JVK3duU1Y3Y21JY3pGQ1YwSWxtVldKN2szTnJ1?=
 =?utf-8?B?MmI5K1dWL0dMNWphTXdGRWRJMXQ3ZmtQUHhNSXZ4azRnQ0l1NElHZTVDM1p6?=
 =?utf-8?B?eHZqdU5JZCtjRkZJd3hSY2JYWFF4bGp3alRkZEVZL0hWY3JnWnAvekYwUlZB?=
 =?utf-8?B?dmx6RnAwRU80dytLWTA5bGVuaWUyUG9kNzc2ZTk0NDFybWsvc25qclVIbFZ4?=
 =?utf-8?B?akpYeWRXT2Q3SmlHNUNmWVRaNkxYYUQybjRVaUhIQTdjZ3ZUK3lodkp6V1RJ?=
 =?utf-8?B?bmw0UXRObEovNmdoZEVsbEpwczJkNG80K25kekRySmExQkhHUW9jVU4xbGVP?=
 =?utf-8?B?VlV4NmhpSE96aThCbll5dU5xUGNBWmxOUUx1UHk3YnNBRGg0VGRCK0Z1TU1Z?=
 =?utf-8?B?N3oyOTFyKzdYSXIxdGNUd05xSldvMGorRzNXcUU1Q0lkT2U2cVJnWlBCSUhB?=
 =?utf-8?B?TVVaQjFpdlNWRzcxUkFPUlhsNXl1WDlBSzhVRVo0NFlWM0RUanQ2bFFwZDRw?=
 =?utf-8?B?c2UvYzRkcmM0ZEZRNmhQNHhpWW9XOXM0V2JSVFZXWkxPRi9RQ3RDMzZ4M2NB?=
 =?utf-8?B?MmFUUTd2SHIvM3YvVGlXOEZUV2MrNCt5MUp2NVhvajRmWVBCTjBNTjhpbzNt?=
 =?utf-8?B?by9MZ3JaYW8xSVo0eGhhSkgyZUpQSlhWc3FROFYvUjB5STZxdXFNeWIvM2lw?=
 =?utf-8?B?Mm43eC9PaS83NHFQbi9yYTlvTTJ0V0JNVk9MOFVtRk5jcVQ0TTZUWXRPZTNi?=
 =?utf-8?B?QVZzL0hzc3dhQVNLSTFRSjc0UllwUUZ3cXZ4ODh5WDdGb2JNNWpaVzRzT1gz?=
 =?utf-8?B?ajhJbkI2Um9SMnM4MWhHK2pqdzEzMnVnQ3lEcVJXM1BtNUhkdGUrYlRiRWg1?=
 =?utf-8?B?Qy84S1FITjVQbVZLajlEVW5WaWc1a2syRVI3Y1UyeVZHczZ0Z2VkZlArekNK?=
 =?utf-8?Q?aT+vBBxP6DNjQkkIcWTrGkEO8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df5befd7-dad0-4e23-3e61-08de2817e6b2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 09:33:45.4685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yBDKvv6wi/qF93q75+tlUnrJj5OKYMoggjV2T9Ei4xe5Fvq1TVkWQz9XlSJB5k3n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6097
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

On 11/20/25 10:28, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Add dma_buf_phys_vec_to_sgt() and dma_buf_free_sgt() helpers to convert
> an array of MMIO physical address ranges into scatter-gather tables with
> proper DMA mapping.
> 
> These common functions are a starting point and support any PCI
> drivers creating mappings from their BAR's MMIO addresses. VFIO is one
> case, as shortly will be RDMA. We can review existing DRM drivers to
> refactor them separately. We hope this will evolve into routines to
> help common DRM that include mixed CPU and MMIO mappings.
> 
> Compared to the dma_map_resource() abuse this implementation handles
> the complicated PCI P2P scenarios properly, especially when an IOMMU
> is enabled:
> 
>  - Direct bus address mapping without IOVA allocation for
>    PCI_P2PDMA_MAP_BUS_ADDR, using pci_p2pdma_bus_addr_map(). This
>    happens if the IOMMU is enabled but the PCIe switch ACS flags allow
>    transactions to avoid the host bridge.
> 
>    Further, this handles the slightly obscure, case of MMIO with a
>    phys_addr_t that is different from the physical BAR programming
>    (bus offset). The phys_addr_t is converted to a dma_addr_t and
>    accommodates this effect. This enables certain real systems to
>    work, especially on ARM platforms.
> 
>  - Mapping through host bridge with IOVA allocation and DMA_ATTR_MMIO
>    attribute for MMIO memory regions (PCI_P2PDMA_MAP_THRU_HOST_BRIDGE).
>    This happens when the IOMMU is enabled and the ACS flags are forcing
>    all traffic to the IOMMU - ie for virtualization systems.
> 
>  - Cases where P2P is not supported through the host bridge/CPU. The
>    P2P subsystem is the proper place to detect this and block it.
> 
> Helper functions fill_sg_entry() and calc_sg_nents() handle the
> scatter-gather table construction, splitting large regions into
> UINT_MAX-sized chunks to fit within sg->length field limits.
> 
> Since the physical address based DMA API forbids use of the CPU list
> of the scatterlist this will produce a mangled scatterlist that has
> a fully zero-length and NULL'd CPU list. The list is 0 length,
> all the struct page pointers are NULL and zero sized. This is stronger
> and more robust than the existing mangle_sg_table() technique. It is
> a future project to migrate DMABUF as a subsystem away from using
> scatterlist for this data structure.
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Alex Mastro <amastro@fb.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>

Could be that this will backfire at some point, but I think we will never know without trying.

Acked-by: Christian König <christian.koenig@amd.com>

Regards,
Christian.

> ---
>  drivers/dma-buf/Makefile          |   2 +-
>  drivers/dma-buf/dma-buf-mapping.c | 248 ++++++++++++++++++++++++++++++++++++++
>  include/linux/dma-buf-mapping.h   |  17 +++
>  include/linux/dma-buf.h           |  11 ++
>  4 files changed, 277 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
> index 70ec901edf2c..2008fb7481b3 100644
> --- a/drivers/dma-buf/Makefile
> +++ b/drivers/dma-buf/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-y := dma-buf.o dma-fence.o dma-fence-array.o dma-fence-chain.o \
> -	 dma-fence-unwrap.o dma-resv.o
> +	 dma-fence-unwrap.o dma-resv.o dma-buf-mapping.o
>  obj-$(CONFIG_DMABUF_HEAPS)	+= dma-heap.o
>  obj-$(CONFIG_DMABUF_HEAPS)	+= heaps/
>  obj-$(CONFIG_SYNC_FILE)		+= sync_file.o
> diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-buf-mapping.c
> new file mode 100644
> index 000000000000..de494bcac5e9
> --- /dev/null
> +++ b/drivers/dma-buf/dma-buf-mapping.c
> @@ -0,0 +1,248 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * DMA BUF Mapping Helpers
> + *
> + */
> +#include <linux/dma-buf-mapping.h>
> +#include <linux/dma-resv.h>
> +
> +static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
> +					 dma_addr_t addr)
> +{
> +	unsigned int len, nents;
> +	int i;
> +
> +	nents = DIV_ROUND_UP(length, UINT_MAX);
> +	for (i = 0; i < nents; i++) {
> +		len = min_t(size_t, length, UINT_MAX);
> +		length -= len;
> +		/*
> +		 * DMABUF abuses scatterlist to create a scatterlist
> +		 * that does not have any CPU list, only the DMA list.
> +		 * Always set the page related values to NULL to ensure
> +		 * importers can't use it. The phys_addr based DMA API
> +		 * does not require the CPU list for mapping or unmapping.
> +		 */
> +		sg_set_page(sgl, NULL, 0, 0);
> +		sg_dma_address(sgl) = addr + i * UINT_MAX;
> +		sg_dma_len(sgl) = len;
> +		sgl = sg_next(sgl);
> +	}
> +
> +	return sgl;
> +}
> +
> +static unsigned int calc_sg_nents(struct dma_iova_state *state,
> +				  struct dma_buf_phys_vec *phys_vec,
> +				  size_t nr_ranges, size_t size)
> +{
> +	unsigned int nents = 0;
> +	size_t i;
> +
> +	if (!state || !dma_use_iova(state)) {
> +		for (i = 0; i < nr_ranges; i++)
> +			nents += DIV_ROUND_UP(phys_vec[i].len, UINT_MAX);
> +	} else {
> +		/*
> +		 * In IOVA case, there is only one SG entry which spans
> +		 * for whole IOVA address space, but we need to make sure
> +		 * that it fits sg->length, maybe we need more.
> +		 */
> +		nents = DIV_ROUND_UP(size, UINT_MAX);
> +	}
> +
> +	return nents;
> +}
> +
> +/**
> + * struct dma_buf_dma - holds DMA mapping information
> + * @sgt:    Scatter-gather table
> + * @state:  DMA IOVA state relevant in IOMMU-based DMA
> + * @size:   Total size of DMA transfer
> + */
> +struct dma_buf_dma {
> +	struct sg_table sgt;
> +	struct dma_iova_state *state;
> +	size_t size;
> +};
> +
> +/**
> + * dma_buf_phys_vec_to_sgt - Returns the scatterlist table of the attachment
> + * from arrays of physical vectors. This funciton is intended for MMIO memory
> + * only.
> + * @attach:	[in]	attachment whose scatterlist is to be returned
> + * @provider:	[in]	p2pdma provider
> + * @phys_vec:	[in]	array of physical vectors
> + * @nr_ranges:	[in]	number of entries in phys_vec array
> + * @size:	[in]	total size of phys_vec
> + * @dir:	[in]	direction of DMA transfer
> + *
> + * Returns sg_table containing the scatterlist to be returned; returns ERR_PTR
> + * on error. May return -EINTR if it is interrupted by a signal.
> + *
> + * On success, the DMA addresses and lengths in the returned scatterlist are
> + * PAGE_SIZE aligned.
> + *
> + * A mapping must be unmapped by using dma_buf_free_sgt().
> + *
> + * NOTE: This function is intended for exporters. If direct traffic routing is
> + * mandatory exporter should call routing pci_p2pdma_map_type() before calling
> + * this function.
> + */
> +struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_buf_attachment *attach,
> +					 struct p2pdma_provider *provider,
> +					 struct dma_buf_phys_vec *phys_vec,
> +					 size_t nr_ranges, size_t size,
> +					 enum dma_data_direction dir)
> +{
> +	unsigned int nents, mapped_len = 0;
> +	struct dma_buf_dma *dma;
> +	struct scatterlist *sgl;
> +	dma_addr_t addr;
> +	size_t i;
> +	int ret;
> +
> +	dma_resv_assert_held(attach->dmabuf->resv);
> +
> +	if (WARN_ON(!attach || !attach->dmabuf || !provider))
> +		/* This function is supposed to work on MMIO memory only */
> +		return ERR_PTR(-EINVAL);
> +
> +	dma = kzalloc(sizeof(*dma), GFP_KERNEL);
> +	if (!dma)
> +		return ERR_PTR(-ENOMEM);
> +
> +	switch (pci_p2pdma_map_type(provider, attach->dev)) {
> +	case PCI_P2PDMA_MAP_BUS_ADDR:
> +		/*
> +		 * There is no need in IOVA at all for this flow.
> +		 */
> +		break;
> +	case PCI_P2PDMA_MAP_THRU_HOST_BRIDGE:
> +		dma->state = kzalloc(sizeof(*dma->state), GFP_KERNEL);
> +		if (!dma->state) {
> +			ret = -ENOMEM;
> +			goto err_free_dma;
> +		}
> +
> +		dma_iova_try_alloc(attach->dev, dma->state, 0, size);
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		goto err_free_dma;
> +	}
> +
> +	nents = calc_sg_nents(dma->state, phys_vec, nr_ranges, size);
> +	ret = sg_alloc_table(&dma->sgt, nents, GFP_KERNEL | __GFP_ZERO);
> +	if (ret)
> +		goto err_free_state;
> +
> +	sgl = dma->sgt.sgl;
> +
> +	for (i = 0; i < nr_ranges; i++) {
> +		if (!dma->state) {
> +			addr = pci_p2pdma_bus_addr_map(provider,
> +						       phys_vec[i].paddr);
> +		} else if (dma_use_iova(dma->state)) {
> +			ret = dma_iova_link(attach->dev, dma->state,
> +					    phys_vec[i].paddr, 0,
> +					    phys_vec[i].len, dir,
> +					    DMA_ATTR_MMIO);
> +			if (ret)
> +				goto err_unmap_dma;
> +
> +			mapped_len += phys_vec[i].len;
> +		} else {
> +			addr = dma_map_phys(attach->dev, phys_vec[i].paddr,
> +					    phys_vec[i].len, dir,
> +					    DMA_ATTR_MMIO);
> +			ret = dma_mapping_error(attach->dev, addr);
> +			if (ret)
> +				goto err_unmap_dma;
> +		}
> +
> +		if (!dma->state || !dma_use_iova(dma->state))
> +			sgl = fill_sg_entry(sgl, phys_vec[i].len, addr);
> +	}
> +
> +	if (dma->state && dma_use_iova(dma->state)) {
> +		WARN_ON_ONCE(mapped_len != size);
> +		ret = dma_iova_sync(attach->dev, dma->state, 0, mapped_len);
> +		if (ret)
> +			goto err_unmap_dma;
> +
> +		sgl = fill_sg_entry(sgl, mapped_len, dma->state->addr);
> +	}
> +
> +	dma->size = size;
> +
> +	/*
> +	 * No CPU list included — set orig_nents = 0 so others can detect
> +	 * this via SG table (use nents only).
> +	 */
> +	dma->sgt.orig_nents = 0;
> +
> +
> +	/*
> +	 * SGL must be NULL to indicate that SGL is the last one
> +	 * and we allocated correct number of entries in sg_alloc_table()
> +	 */
> +	WARN_ON_ONCE(sgl);
> +	return &dma->sgt;
> +
> +err_unmap_dma:
> +	if (!i || !dma->state) {
> +		; /* Do nothing */
> +	} else if (dma_use_iova(dma->state)) {
> +		dma_iova_destroy(attach->dev, dma->state, mapped_len, dir,
> +				 DMA_ATTR_MMIO);
> +	} else {
> +		for_each_sgtable_dma_sg(&dma->sgt, sgl, i)
> +			dma_unmap_phys(attach->dev, sg_dma_address(sgl),
> +				       sg_dma_len(sgl), dir, DMA_ATTR_MMIO);
> +	}
> +	sg_free_table(&dma->sgt);
> +err_free_state:
> +	kfree(dma->state);
> +err_free_dma:
> +	kfree(dma);
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL_NS_GPL(dma_buf_phys_vec_to_sgt, "DMA_BUF");
> +
> +/**
> + * dma_buf_free_sgt- unmaps the buffer
> + * @attach:	[in]	attachment to unmap buffer from
> + * @sgt:	[in]	scatterlist info of the buffer to unmap
> + * @direction:	[in]	direction of DMA transfer
> + *
> + * This unmaps a DMA mapping for @attached obtained
> + * by dma_buf_phys_vec_to_sgt().
> + */
> +void dma_buf_free_sgt(struct dma_buf_attachment *attach, struct sg_table *sgt,
> +		      enum dma_data_direction dir)
> +{
> +	struct dma_buf_dma *dma = container_of(sgt, struct dma_buf_dma, sgt);
> +	int i;
> +
> +	dma_resv_assert_held(attach->dmabuf->resv);
> +
> +	if (!dma->state) {
> +		; /* Do nothing */
> +	} else if (dma_use_iova(dma->state)) {
> +		dma_iova_destroy(attach->dev, dma->state, dma->size, dir,
> +				 DMA_ATTR_MMIO);
> +	} else {
> +		struct scatterlist *sgl;
> +
> +		for_each_sgtable_dma_sg(sgt, sgl, i)
> +			dma_unmap_phys(attach->dev, sg_dma_address(sgl),
> +				       sg_dma_len(sgl), dir, DMA_ATTR_MMIO);
> +	}
> +
> +	sg_free_table(sgt);
> +	kfree(dma->state);
> +	kfree(dma);
> +
> +}
> +EXPORT_SYMBOL_NS_GPL(dma_buf_free_sgt, "DMA_BUF");
> diff --git a/include/linux/dma-buf-mapping.h b/include/linux/dma-buf-mapping.h
> new file mode 100644
> index 000000000000..a3c0ce2d3a42
> --- /dev/null
> +++ b/include/linux/dma-buf-mapping.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * DMA BUF Mapping Helpers
> + *
> + */
> +#ifndef __DMA_BUF_MAPPING_H__
> +#define __DMA_BUF_MAPPING_H__
> +#include <linux/dma-buf.h>
> +
> +struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_buf_attachment *attach,
> +					 struct p2pdma_provider *provider,
> +					 struct dma_buf_phys_vec *phys_vec,
> +					 size_t nr_ranges, size_t size,
> +					 enum dma_data_direction dir);
> +void dma_buf_free_sgt(struct dma_buf_attachment *attach, struct sg_table *sgt,
> +		      enum dma_data_direction dir);
> +#endif
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index d58e329ac0e7..0bc492090237 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -22,6 +22,7 @@
>  #include <linux/fs.h>
>  #include <linux/dma-fence.h>
>  #include <linux/wait.h>
> +#include <linux/pci-p2pdma.h>
>  
>  struct device;
>  struct dma_buf;
> @@ -530,6 +531,16 @@ struct dma_buf_export_info {
>  	void *priv;
>  };
>  
> +/**
> + * struct dma_buf_phys_vec - describe continuous chunk of memory
> + * @paddr:   physical address of that chunk
> + * @len:     Length of this chunk
> + */
> +struct dma_buf_phys_vec {
> +	phys_addr_t paddr;
> +	size_t len;
> +};
> +
>  /**
>   * DEFINE_DMA_BUF_EXPORT_INFO - helper macro for exporters
>   * @name: export-info name
> 

