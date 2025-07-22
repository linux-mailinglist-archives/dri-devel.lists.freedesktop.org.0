Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3389FB0D12A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 07:23:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FCF10E2F1;
	Tue, 22 Jul 2025 05:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cZuERcrx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2040.outbound.protection.outlook.com [40.107.212.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DECE410E2F1;
 Tue, 22 Jul 2025 05:23:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AN2hcle98NVs7yZjyfXSqQUoyGtBoqKvKuZAuE4o+mYVxK/PbLvQrUlHOse3z2vu04GOXgL0pWAa+YXgwJzMvTMN7NEl3PXx2pKxaN4UGj6mmiMrkPo+MyU+KC92zhMZv6Tvw32ExnV5W5v0GoMfOSrQTZCsB/49oU5MvotERJ1vSxITSAYOWNPhoD4opjppGguCq9rdgdq1oZtCYxJ9DCH30TrjOENjq0N9vYsQGKy1JuA3x4bnhhxrBIf7M/orXh2BVlQ80STzyWMQdckeJgKlu8eAgK4e243YlxYP5jpx4xQQGXUKzdsGRjZOT3+YcZ4soio34D41rVBxkbj4Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ovm/cUEe6FhCLOQD4/PBD4VWhSP0FchCUtvBP27xWfA=;
 b=YvVSKNcFjMs1RxFtwsbY04Xn6FZW7YEgNmxZ5haqOZWDUu7/7tEmWW8SGA5+7vPUjVIOrh2+nY1zEi1BVjqmnVjJeuEyzKQ8WIL7fvsN1g+u9ROO2fYMjFpmHe3Yy67sKpEn8P0PkN74hE6ixedGgF2ol297OVQFogRYZ9Ho0lmxKNwSdPvU23yev6BPUtZLPuu38TZ+zMpV22KT8kHQ5yFHQ7ZbPf+u1KH0sm4UHTosXTV2J0qzHpZqGi+VufNwGsH6/u24IydtRhNK23PqhOoLn6NCByc6+XeOFZIue8JWlrlEr42WaF7/9qrQ4v5Tp9oFZSK2c5Ikkd7/cGgOLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ovm/cUEe6FhCLOQD4/PBD4VWhSP0FchCUtvBP27xWfA=;
 b=cZuERcrxkc16YE65B6g/PZGG1Izs59c6+1PbMhw0OtjXvrhpF+3fwZRm/coCZwtyCXrLKhbX1ZqRdqvshWhaQdVjAaa40SRiG81tmpAzFjPETG1j/LIbxiGvXI4+av8FUdcSM0/DxIgE3Z+IAOIvtkhWlUNgNnTLSf1aEIPew3xj8v9sculuM900rh7clhE8NTbBnQTTfUvaWcyKbb5stu/RM4FmoqQjLe5bT4c2eDTHLrYNzh1YLNqUc7EEeK/wQWhFzs3GUJadV5d3B1/YXeoOmm4vofIYXgdwm80jAt+w1HPsTePIpOO/Qrr8XEl8wp5AZjxO/Z7C+d2C0JZvFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL1PR12MB5851.namprd12.prod.outlook.com (2603:10b6:208:396::13)
 by CY8PR12MB8243.namprd12.prod.outlook.com (2603:10b6:930:78::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Tue, 22 Jul
 2025 05:23:45 +0000
Received: from BL1PR12MB5851.namprd12.prod.outlook.com
 ([fe80::d4a:9ce3:c92e:e938]) by BL1PR12MB5851.namprd12.prod.outlook.com
 ([fe80::d4a:9ce3:c92e:e938%4]) with mapi id 15.20.8922.037; Tue, 22 Jul 2025
 05:23:44 +0000
Message-ID: <989a77d1-334c-444b-b6fd-3c0680a2f035@nvidia.com>
Date: Tue, 22 Jul 2025 08:23:35 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] nouveau/dmem: HMM P2P DMA for private dev pages
To: Christoph Hellwig <hch@infradead.org>
Cc: =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alistair Popple <apopple@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Michael Guralnik <michaelgur@nvidia.com>,
 Or Har-Toov <ohartoov@nvidia.com>, Daisuke Matsuda <dskmtsd@gmail.com>,
 Shay Drory <shayd@nvidia.com>, linux-mm@kvack.org,
 linux-rdma@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Gal Shalom <GalShalom@nvidia.com>
References: <20250718115112.3881129-1-ymaman@nvidia.com>
 <20250718115112.3881129-3-ymaman@nvidia.com> <aH3lpyhdnCdZISK5@infradead.org>
Content-Language: en-US
From: Yonatan Maman <ymaman@nvidia.com>
In-Reply-To: <aH3lpyhdnCdZISK5@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL2P290CA0013.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:2::7)
 To BL1PR12MB5851.namprd12.prod.outlook.com
 (2603:10b6:208:396::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5851:EE_|CY8PR12MB8243:EE_
X-MS-Office365-Filtering-Correlation-Id: ddc4e6e7-e99c-4401-2440-08ddc8dfed7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1FHS2hONVoySitXL2wwNXVXUHZnaTVveDdraDVJSTNiVit2YldPc1k1QWFB?=
 =?utf-8?B?eTVteDZhUVpnYlpwTXVwNDQ3WjE3elRycnZNdzVWUFI3a2I4blh2T280N3Rh?=
 =?utf-8?B?WWtJNXB5QzNYYUdHdTBWMHNoeXNLaFkyUFZrSkkzWlQyY3hSbG9sOE1HOVFu?=
 =?utf-8?B?SnMyZGdYSDZtNjRIazhBQ3E5ZmZDa0lyRGhxcGRGOWN0NkJscXRMK1NZdnN1?=
 =?utf-8?B?a1E2cCt3ZUZmMnB0VUFoTTZuZDFnRHEyVEt0ZnBmWUE0NEhwUVlCa2hoMWZ1?=
 =?utf-8?B?djZkbkUyZWxxODA4c0dqa0lBN28xZFBuMDZNR015ZXF0RE9XZGlZLzhLa0dU?=
 =?utf-8?B?dE16dStiRFZHOVg2WGthakRURzVMVWh0Y0ZGaURQNHdMUWlwR0JHMURuU1Ro?=
 =?utf-8?B?VjZXSTNxZE9zTE5SZ01kaDFia2prT2V0dmJqbDZBZXAyeWhmRXUybzlUeVhG?=
 =?utf-8?B?OGJxT3VvMjl5OUZaTGRpV1Z3Q1d4cmw5cU05cWN4dzI5WlptRmxTR3EwMCta?=
 =?utf-8?B?ZWRBUFVoRGxaRTNuRjQvNkVucDJPYytmR1l4RGtqUThIcFV1WFRDV3d1UWdn?=
 =?utf-8?B?THIyK1BxYlV2emJGMm1kREIvcFA3VzFXK0ltMHVBOFBybGs3WkU5bFRodVBj?=
 =?utf-8?B?RGR4RHRFWWdsQmVna2hYTGt0WEQ3R2hmaHRiOWs4RlZpZVU3bkQwcEp3OUQy?=
 =?utf-8?B?b2xqWE1POUZKTmNPcElRcU14YXlwalFyd0JUdTQxM0pjZWV2c3BXZ1FrRGJU?=
 =?utf-8?B?RkJzQ2JOa3RmRDNubzRrR1JUN0NWVENLK0Z5cWFFMllHYjYwdXpqcUxMVnor?=
 =?utf-8?B?M3lRTjk2VW1NWHNVNWd5aWpRTEI0MEJreU5tUkFySzlMcEpKbHllRHhPVTlX?=
 =?utf-8?B?eEU0bS9oc0ZZdmo5QXJpeTRRL2NtdTh3YW5MY0tKMGhCUzlId2F3NkVnQ3hn?=
 =?utf-8?B?NHJyRUlURVc3NGs1K1VFNHR6dXhDQVdQRTdpQTVGWDM3ckxaU3A0ZU0zSUFn?=
 =?utf-8?B?TG1meG5ORHgzRlM4bi9jOVd0Y0RUWm5SUGdURFIwZXBkU3Z2THdCWnAxQ3c0?=
 =?utf-8?B?TkZ5Q2NhOVR5VzY1WmRxSzY4SThKZ0pqUjgxODhWNFp3YnozdEVsNnJLQTFD?=
 =?utf-8?B?MUFjMHVJb2ZPL09WeE9nRjYvck9QTUNPVFcyaVVudTRSSXRHRW9OYVFBcGFo?=
 =?utf-8?B?ZGJ1Ykg0cHFKbVZpNHNFeUpQRnM3a3I4aU9aekhqd3EwZS9kczdhS0Fzcks2?=
 =?utf-8?B?MFlsTmZ3L0w0UHh5YUFwNmRPRnlSTHlFU2wwMWsrZDhHS0lzemYvMFpzK0dZ?=
 =?utf-8?B?QXdzSVpvVWQ4VUduZFR1Q3FBNTVxOThodnVBdmJTOGp1Zmt3MUdrWFY5eUQw?=
 =?utf-8?B?UFBpYjJhNDM0aFoxVTUyMGc1b3JMTDd1U0ZlempIWVpqUUQvZmdtamJEeUlC?=
 =?utf-8?B?eDlMZ2g1MER2ZW5Cblh0Y1duL3BJcjBENzQvQmNjTkwwbTEzNFFkZExEZXV0?=
 =?utf-8?B?NFA5TWhLRnc0K3lYNXAxT1haQlN3QkJDQ0ZkUTZRaWdPMzhUZnBpektDUXNK?=
 =?utf-8?B?ZUpuMUltR2J5dWNuWG1xRXlPKzI4VGZ0Zzd5aGI4SGozdytJV05YVGZmWXpS?=
 =?utf-8?B?T096NVVocCs3aldRNVlsc3Y1TGNPR2RWdGVDaWluVnNSdUQ0a2tTakUwWUxR?=
 =?utf-8?B?c2RmNEZPNFZwd21jZE9YRDFWbWtRK3VzMWFtRkZVZ3B0ZjFiK3VyU1Rva3h0?=
 =?utf-8?B?bklaaUtXRW9wNC9SRG5DWkJCWkVsYldrcUh2YUhvOFhFNWYxMzBXSXQyNDRl?=
 =?utf-8?B?NnlONFQxcDZ1dzdjbVg2ZUJDc3NNams0aklSNkliYlgyVE1tUFp6ZVJhTkNB?=
 =?utf-8?B?QWVYVDJvSWJMYm51K1JoYUxWL2wveHd3OWhOaC9naU0yRnA5ZnQzZnVKYzJL?=
 =?utf-8?Q?I4xnQAnOXhk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5851.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDJGOWZuL1FqRDE5YzFWQjRNaDhBam9uNExKVmp6SlJyWXNhd0ExSWRUZFZy?=
 =?utf-8?B?K1ROY1lSUmx1OGV6VVlreE9ScC9WRlFTV0F5MTdXdnNIWDZSOS9HdkhKUXk5?=
 =?utf-8?B?dmNtUFo3S0RYVE5SVzVMK0pic2hYVzFZSGdmNTNUc3prVGpkODdNNzd1QVJ1?=
 =?utf-8?B?dmh5aWpoU3dSRjRtUmdnN0d1RzNPT3IrK2tSR0VVNXZKdFVCYmhoVXRmNjJF?=
 =?utf-8?B?WVVPcDNJQXZtTzVUNVpyOFNONitob213RmM4RkNOOUpwdFp1eVV5K3hpZEtD?=
 =?utf-8?B?VjZIS2tyRnFyUWhtSm5nTXA5TDFyU3hVTHU4ZUNTbkcrQkt5MlgwQzZydDVm?=
 =?utf-8?B?ajR4a1lGWndDOFdiWnpWSnNBRElwV2JjTlZUWGhPWWd3YVJxd2tscXBBU2xI?=
 =?utf-8?B?MjB2MEtZb2hGQVNKcmptdjFuWWVtbk1wb0g4cUxJQk5aVVM0ZkpVSzIzVkE2?=
 =?utf-8?B?Rkg0K1JPdnpzelRlL1NPVWFNRzFCRy9ubVlvTXRMVU45RXJxREJ2elBtRmMz?=
 =?utf-8?B?bkltOGkwOWYrVzBZRWE0ZzBoeTBQalVrRERBNHc3dDZYWTFyT2pnMFArbnZF?=
 =?utf-8?B?N0VZOXpTV3d4M3d6OHFNMGxiK1pxUTdkcXpiUG10N2M2L0hINXQwSjc0UElI?=
 =?utf-8?B?K3RENFZMNUxGcHpCNUdVS3B6VWhieVFzc3hrNUVwMHA0a2NtdVFzN2Y2M2l3?=
 =?utf-8?B?ZWM3bmdHU1lWQ05FdTRiNVZGSWdyWE1PSGNSZ1ZkZGtlcTlFOTFlT0JGcUJW?=
 =?utf-8?B?akFCdXpyTVFQNzJXZ2pPVThpTGhSNUN5VzYxSjJXck40TXFFMkI1d25FZHZq?=
 =?utf-8?B?bVpUSENSNnZFSGtmUTlLTFc2LzZWQ3JFVVVUQ29XT29YNWZrdlNIckF2b2ph?=
 =?utf-8?B?OHkwUFFUR0VGcHprcVNlcGZWWSt6eTlScU9rMU4yZjltejFEdlE2Nzd5Q2dP?=
 =?utf-8?B?QWNpa2d3MnMyV0FQTWwrQm5BdGMyZEZVTE9jc1BBS3BCcllFUWpxQUFYemZv?=
 =?utf-8?B?Tno2dldiaTJmV05wZG5teUJUcFFFU1JReEtrMlV6U2J3MG5WNjFONkF2Q3lz?=
 =?utf-8?B?K2lmYmd2YllRMzZnVmRUdWxOK0F5enZRdHV3OGFYZUI4ZEczY3QySUE1RGt1?=
 =?utf-8?B?ZU8xcWRuK05mQUNwT2lsK25yRmF5eTVuNTd6YmF3cHRHN2g2dDNGbDIwOE4y?=
 =?utf-8?B?NEtvZDROeWsrZDBtdWpPWHJVck1VRmtQOWhIUGJwZlg5M0FtVXIwNWhZK3Ju?=
 =?utf-8?B?ZW8yRStCck8zWUl3T1hpb0VQcFh6ZzN1cW84TU1Yby9HZTgvWCtPOElEZFVT?=
 =?utf-8?B?VGRoWjhaTWV5L0Mwek5WU1JkVlRFVjFjNXZ2SkJzSHl6aWpYa3VNelRESm9h?=
 =?utf-8?B?V1lldGxLNlpTSlBMZ1Z2QmZGaFhDWXBjQkdaS1JKNmN4U3lnSER1TGErTjkv?=
 =?utf-8?B?Sm5FeGFnSndWZnVUc3pvcHgzellhTXNodjYzMEFMT3k2VkRQSjlsSWhjbVVH?=
 =?utf-8?B?ZFZlMUdpZjlIL1V0SHFZUGhScHlLN2h2Z0s1Nzh6Q1lKSkxSMzcxK1V0RnZJ?=
 =?utf-8?B?R0huL0VaTGpYSjJwUXU1dFpYNDhXRVJ6SEFpUzRNOTR6MkNFNGtkSFhDRkhu?=
 =?utf-8?B?MWVaWjBpY3JYaytDWnVka3BMTEpYaFZscmw4eFRTc29iM2k1L01ZYk5SVkNp?=
 =?utf-8?B?bkFpM2c0QnFOOUg2dWFWcm5aNXdZYXpnZ2NUKzdTZjBETk1LZ1d6R1VhUVVt?=
 =?utf-8?B?dHpMaWJkTGJleVphTVNQS0hzU3diT212bnJhSU1ZbmIwNndJdnBscUQ3UEI0?=
 =?utf-8?B?ZzZueVdtTHhRUmRtb1RlMzhpMDdUV0RGaEtyb1VWdUdRc1FYU3VlbFZ0ckVT?=
 =?utf-8?B?cWV1Z2JuOG1HSDF6SGJxVkk1VjNxejFDS2F6bHcvM2hacmhtOG1EWis1TnVH?=
 =?utf-8?B?NXdUNHRVdTVyVjBzeWZsUHBvZ0VaVm1scmMxaVpscjlIdEcvTkRFakJ1dU1O?=
 =?utf-8?B?bzdCb2puOWRzZDUxdGlLSFJQdWV2N203SWFTUm82MmJScFhIbWZiUm43Y2F1?=
 =?utf-8?B?SytyY3ZUUXp1S29zNWFJMlhwOWtDWkFabWJseHJCUERCcDAyd0U2VW5uL2My?=
 =?utf-8?B?RWdZU010SEhoZkxUcnF6N0Nkb2ptMFhHcHozT2FTT3lhVjE3SllJTnRZcDNU?=
 =?utf-8?Q?SVj6nve7PiTSILmaLfUVZ3VtDwu8iLpyvy+SRiSEPxyK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddc4e6e7-e99c-4401-2440-08ddc8dfed7a
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5851.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 05:23:44.7180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uz0xyJyaNpHQ+bBSTW9F+hCp8YrJT3rHh0K2pr5Kc2I0K8FOdKZiVpQj0x4KVyMH3HC8sfbBAHUkHVWLsoS6pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8243
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



On 21/07/2025 10:00, Christoph Hellwig wrote:
> On Fri, Jul 18, 2025 at 02:51:09PM +0300, Yonatan Maman wrote:
>> +	.get_dma_pfn_for_device = nouveau_dmem_get_dma_pfn,
> 
> Please don't shorten the method name prefix in the implementation
> symbol name, as that makes reading / refactoring the code a pain.
> 
> This might also be a hint that your method name is too long.
> 

got it, will be fixed in V3, thanks.
