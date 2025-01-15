Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB710A124EE
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 14:38:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C8B10E05F;
	Wed, 15 Jan 2025 13:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cJAOMk5S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6209F10E05F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 13:38:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DBW2XP0bJ9biOgR9vZESYNz88jt4SepEnMDhl+81ftU21PVi3bQdf8j+ZgwUOWH9a/1ZMENmrLCZFcD97vpdQjYhjtY6ndTXhFznxTFb1mb4pZ2iKC4vHvAsI3lTm0qrCmFotCOx66h6iVtg92sTlwjYNNBQ/2XchDFw2AS9MkDo0QkrTWBPeRjRYWEUxx8uw7Imef6ed+tVXkYOtx+C3JlGyqg7R2xlrgLGHiWPtHVeRJsRNdYP6I0k9n17f8d3EjrYq6XxDNSdRCLzZrmNX4BAPH+PLqhT3IpL5iq+2YBEdIDLS5+0oRwb2G59kFcTMic89jDIw2SwjG+2l8tVhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVzuSyPrqfJrciMuKYxNaF2uYia56pZS5nkkQ1HSwkU=;
 b=lbN3UBucXX0FptfTFCIsV1Y9HgIQANNmwbHrds6GbBR71EaVPTRU4bATRka6DBEJY0Eo5k0lgov/p2EQOHqdGzRlv2/3y5FwYZlyhFfXDBHQ5e2fcly6AF4Y+j85ernvh6XTklHzAbGyxtWnWFcsfqCwMXLUVV6iLYZdzOLudWk4U2hxRvXjopNgcZcuzaU0NJrLdzEaFPuunmVvlSdWZyI6JJGmnj5E8szX6QwYAK8hsk4OP739Bnkyl9d9/pffSAtGKns0WK/5q3Id9oP8ZaT2nPuNyOeWr3TpZidd/qBlUvuvgypER3jnCbYv3lUAJWXs9G9FqB8312CEbe0lbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVzuSyPrqfJrciMuKYxNaF2uYia56pZS5nkkQ1HSwkU=;
 b=cJAOMk5STRctuPHRBb9JURhcUfWH9llDMVrh0jvGebEZAmA/zTnboi1oKpfGzt07Sag8UMg2e8yHlG14WIkyVlwALdeULAf6k8JyLSof94O17AxSmeqyKFxJ2VrrYNNmni0CTumJqiA+QydDmY1zcCXFswqKgKvEZdqAlPMP4utTg08/Jyw/1Mr58Lvgsubnj5AM2Ii1hqbAqcSuCx9Cnn9Za6s+LnCDdKO5ReTG+G3mUO46P6f9HUE2pb61cUy3o+4+Mlep8GswO8gEAWwunlRWi2LgqONGgirGfwao6XG2ZEFVs1g+zpmNxWuPWGojBP8s/Ile8G9ih+SxDBaFlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DS7PR12MB5814.namprd12.prod.outlook.com (2603:10b6:8:76::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.13; Wed, 15 Jan 2025 13:38:22 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%5]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 13:38:22 +0000
Date: Wed, 15 Jan 2025 09:38:21 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
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
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
Message-ID: <20250115133821.GO5556@nvidia.com>
References: <f3748173-2bbc-43fa-b62e-72e778999764@amd.com>
 <20250108145843.GR5556@nvidia.com>
 <5a858e00-6fea-4a7a-93be-f23b66e00835@amd.com>
 <20250108162227.GT5556@nvidia.com>
 <Z37HpvHAfB0g9OQ-@phenom.ffwll.local>
 <Z37QaIDUgiygLh74@yilunxu-OptiPlex-7050>
 <58e97916-e6fd-41ef-84b4-bbf53ed0e8e4@amd.com>
 <c823f70c-9b70-441c-b046-71058c315857@amd.com>
 <20250110205454.GM5556@nvidia.com>
 <d213eee7-0501-4a63-9dfe-b431408c4c37@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d213eee7-0501-4a63-9dfe-b431408c4c37@amd.com>
X-ClientProxiedBy: BLAPR03CA0178.namprd03.prod.outlook.com
 (2603:10b6:208:32f::32) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DS7PR12MB5814:EE_
X-MS-Office365-Filtering-Correlation-Id: 9365a7e9-571a-464d-ee67-08dd3569e130
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MG5PNXdmNmRjR1RVVWI1K0ZXbWpFVFowTmJWd0NTT1F4U3doZWkrSHVLYk9h?=
 =?utf-8?B?eG5TZTl3NWY1bnRrNE14Q1hQaXJpc2FWYjRrNWlSbnljL1VMbGtmU3lIZVFQ?=
 =?utf-8?B?Y0dDb2I0VzV0R0NON3FoQ0VhY0NxL1BHWUlWVWJaUk9lQWpWaUcwb0pZdlRS?=
 =?utf-8?B?ZXduOWozSUVIU1AvVnhFaVRTUkxaU0F3bTRnTzZtRUZIeVdoTmlSdnQ5WTVZ?=
 =?utf-8?B?TVpybnV0UCtlWTB6K2JvS2RpcTFRc0ZGa2g5OXB2eGJqWkRUZGVlMjdxNWJF?=
 =?utf-8?B?eU9ncUV5VnM2QVRjbkFHL29kNElDeE9jenVNbXNUM3ZSSHl6VUtiK0NWY0F1?=
 =?utf-8?B?ZWlkYWl2VGFUT3V0UEhzN1BmcEtxTi9wQk1VanprQ1RNSkZ4YUo1cTRKWSs4?=
 =?utf-8?B?Sk9jWVo5NGh4WFJTdUdFQ3VZajhaZzRxcmJFZ1pERzMxRHY4WjJ5R3dma1Rn?=
 =?utf-8?B?aHdDL3BzNE5lWCtPMmYxMFUxaWZzVkRDVEJZQnJsNHlvYUJPakxnSUZJcVhG?=
 =?utf-8?B?S2hrWmVJaUh2S3Z4N3paT0VEZFg2ekRPT05qVnlEQWFUcjVnMFBsQ2NZNWN4?=
 =?utf-8?B?cjJUcGNKOUE2THlXeWhOdFdJK0RBeENUeE5FbnJJODhlMUxTOGVKUjdFeHdI?=
 =?utf-8?B?MVlqNTBkcDQzb0pKRGdvcDF4eEdXb0RjeHhEbzlTWlhQNVJPU1BVaUx5NEdY?=
 =?utf-8?B?bjZJaVJGQ3c3Qy8xNVNHNXdneEdVM2VQcXdSUDROSUc1eGtNVmc5cHN0NUlt?=
 =?utf-8?B?eGVtVWZQeS9RVXlJRURRSzM2MTkvbnNXdm5YS3NESzIrZ2NUS29HaXljVHpy?=
 =?utf-8?B?MXphdTZicFg1bHFPdks2c3NKa1Y0MHE2UjhTczRVRmVRbTg1UnpQVmVzMWVm?=
 =?utf-8?B?MjI5NnhML29FSThUdVlReklrTHNXVWp0cEZ2VGxvS21KdGpZR3ZnUGp0MlJE?=
 =?utf-8?B?UWtjNEZqaTFySUNXOTRDNWtNdzZGRjkrblArZWIzK0E4amNKN3Jtajc5T25a?=
 =?utf-8?B?bU92V1NwOXdiRjlITDg3Rm5FOXlLVWk2RzV2a1NRT0k2QzRaZ1h1SVVZU0s4?=
 =?utf-8?B?anlYRk51Qm1Yd2FhOUZhUURXSy9yZ3R5ZmJtUGtxS3NFOWV5MWJ5WTRIeHlC?=
 =?utf-8?B?UjF6RWtGNlRzb2d5Qk41YnkvTGJtYWI1amZPN25iU3NjaVg5NVpoTFRkWUFw?=
 =?utf-8?B?WWRTcjlleGlXVk50TGc3WXVTcHB5SGNmR2tSelh3aFMxOENmVDJOcDU4a2tL?=
 =?utf-8?B?Q3UvQlM3a0RIdkNHL2xpN2hPdlA5L3RMSStnaUhOQ2xCZEFpa0hSbHYrU1lQ?=
 =?utf-8?B?aWVxeTdQQUZFME81emFoRFpaSzA5Z0hnRm1CbmVneEgzWis3cmJMM2lZR2kz?=
 =?utf-8?B?L2sra2tpbFVPbkROWGtNOEhZdjRqZHdHQTJ3V3EycjhuNXQ5RVlrWGUrSFRs?=
 =?utf-8?B?ckJPKy9RelpkUWhpQkI3ZFB2dDlCUllRNjNjcVcxWVBFUERhaFY0TnVuQUhv?=
 =?utf-8?B?SldaeGdVVlo2M1dQVGt4K1pwRTBtN0xQSmUyem0zQ3dZMmFHU2pMRzNWNStY?=
 =?utf-8?B?YUxCNUV0WU5yOFR4Vml6emxtcVhQaCtpK2tReTFSWGRDRnZseitkbFcrRWlz?=
 =?utf-8?B?OTlxbzFOdFc5RTcySkRPSDBMdGVldmhtcDZHMTJoVW1ZejlHaldMVEN6ZEhs?=
 =?utf-8?B?STV1U1dKTXVpeTF3ZFUyRHBaRVZwOGUxeTcyc3QrQjNmcGFCVloya1pOYzlM?=
 =?utf-8?B?cE5IOTkyWVVabWhoWG9qRkNVbUVaRUJYWndRU2xHZ2tzY3Rpd08zOEIxNTRQ?=
 =?utf-8?B?Wnc5N3MrQ2h3cVRwalRtempXMC85ekhBNS8yaStnTWN3bFlMSjBiL2x3bFEz?=
 =?utf-8?Q?UQS+QYGYvNj8l?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3FhNllaTTBNMkE2bmVPaXp2WUZoQjVjZisxdlhNZ1V5NWR0VTV1TDg3aitQ?=
 =?utf-8?B?QVNJNVdTNk51clh6SS9HVUJMUzVpYkxLZ3lwNnVmWFNyTjFBY29SUklhM2hB?=
 =?utf-8?B?cG9GQVhpMkZ1UWllRjlobGwxQTRnK084VmtCTVdVdWFuNnJ3MzhCTEFDbFhQ?=
 =?utf-8?B?NkVUcDBRZ2Q3N00vQkR2WlIzOGYvZ2QrY1pySDEvZ2JTa1MrUGZWZVF5M2NP?=
 =?utf-8?B?UVJ2akdGY2lJbzd2MDBsK2Exdm1ZZ3ZuQnVRZnk4dldiOFJtaHNQVDB1RHVH?=
 =?utf-8?B?bHBvblo3T2lsYVNvaHJBc3V2eXI0R2hBTFBOaUJ5eXIxdytxUGhWazllZCs1?=
 =?utf-8?B?OFNNejh0ZWlMb1RSbGhVZTZmcTBieTkvT2ZaK0hOUTBrOGpyakMvcVdFVzVC?=
 =?utf-8?B?MzJ0OTByYXJVSnBlSGNhMmM3bHVHM0VYVE1kZUdWYzM3STB3ekpLVE5FSlFO?=
 =?utf-8?B?Q2JpVlRmcE8vb0dnS1YvdzZqa1JJWUNKazl2UjQ4OWdXSE53a0dibXFVVVNl?=
 =?utf-8?B?QVJBQWFUaGY3TE9iNlV2ZHhDWEFSRWxYNU5SR3o1dTBvQ0wyRFdRWUxWWGlQ?=
 =?utf-8?B?UjlIMXFxL3BLWnl0TmVaRjRJUGszMVFkRmVJNXpiMUlmQ3ZTZ0FqQ0Q1QVRw?=
 =?utf-8?B?M3ZpeGRlNGdmRGMrbThKNXRBdXhxT2x0TGVDUStTR2FjMHpzYS9NOXA2d0FM?=
 =?utf-8?B?U2tLTG9Kdzc3TVRJM1NYQ3FlSWFRSWtoN1hMZ29iRkNrckVUcDFySmxJVG4w?=
 =?utf-8?B?UmJVc3czamhGZ0VXQXNOdkk1ZnhCbU1DU3NaOFFveFhOYzF6UmNUYy9FdSth?=
 =?utf-8?B?UHlqSVhHVHdRaStHaDBtSVIvcnBjQ2FsYnA3V3VWdGNpekgvSlFqT1lRd0RJ?=
 =?utf-8?B?M0xQMVhNc1VaWXpvNTFEdHM1aE9sQ1JmMkxkVjhMcG5aYVk1eGdnL0RTdktn?=
 =?utf-8?B?TFc5R1ZSYVBteVhGVWliQmR1Z2lLZDZybGJtbWkwQ3pKcUU1bGtLV3I1cCt6?=
 =?utf-8?B?cTZESlVwYUZQWXVYZUNoWnZObFlRUkM5ZjhoMU9HRXFuOE13a3lnZkR5d0da?=
 =?utf-8?B?cmdnK0liRTdhSk1aY1k3REM2NVNoQjkwWVdkK3pSYnlNbzRacFhpNXFHOThN?=
 =?utf-8?B?ZDQvaXFtQlNtTGk1SVlJV0dnTHhpOHNmVnJlcEdFZlNuV1liQWFSek1IRzdL?=
 =?utf-8?B?M00vdlhFUWtkTi9ZTlJQdVdWbm9iUmtMVHhTQVVCYk1sRTRtTWFYbVlEMUJj?=
 =?utf-8?B?VDdFM0p1bXQyUnNkS0NKNzFJQkhaNmtmU3V2U2ZXdmFwTGN0WFlWRGNGN3lT?=
 =?utf-8?B?NWQxa1NiVktCcGsvcWFxZ2l3L2ZLTXZlWUZ5cmFnS0R6WXJ6RVRxVG41dVRn?=
 =?utf-8?B?VThqdUh3MFNuOENIa29wcUxNa2pPMGV6eWEzYWdKYjlndFpVbEh6K3huNko4?=
 =?utf-8?B?d3YyUlpaZ2liQW1MN3ZNT1ppc1NkcVNBY2J0NlFkOWtQZCs1WmR5VDVoWjZ0?=
 =?utf-8?B?UEJNZU80S1ZkeGtvMnBtaXM1NlBORy9TMy9iRGdNN2lROGczK0ZHSTVubkll?=
 =?utf-8?B?N0dBQmg2ZEEwang0aitoaE5FR0syMXNNSi9aZ1pkeGRUb2NlOTJ0aHBUcWlv?=
 =?utf-8?B?dkFDLzIrRjlJNHVxM3RQNzR4WURVWUc0Nml2OC9EL3NwN0kzbzZ5QWJFYWlx?=
 =?utf-8?B?ZC9VL2N0bDc2UTFaTERGMDdGTWNIaURsMWpQSy9UWHZCM3VqN1J1NThOc2F1?=
 =?utf-8?B?UXQ2eTJ3U2JMYmtTM3Fhdk9jYzdmSThKUGkrWDNIemd2TU9iUU56ZEZweFg2?=
 =?utf-8?B?UThTOTlFRWcxTzBKQzRIZ1B1VC9ZRG9IdEtodkx1NSs5UTErZGtsN05MSGp0?=
 =?utf-8?B?VWFBeVhrVjd4VU42eW9xMkZRcXRDeVEvY1lkWnRFVlFvQ1JqdUdaL2pJVXVn?=
 =?utf-8?B?N1h0Y201Ulg3Q2FueEJYck4wdVF6bTVWRVJETEJSVlMxaW1WZHl1K0M4SjQv?=
 =?utf-8?B?NUU4MHphUkdzMTN3MFMyVWhMOE9sNk9qUm1RaGFWZTdGdWhxU2VMdVNlbEFR?=
 =?utf-8?B?a0p6QU93bG9aN2xta3pOSDhRQWRWNEloLzF4TXozRWkrZzk3Z1NXcEJZekxU?=
 =?utf-8?Q?FH96n+PxIXWJVgw4xMzOnMxla?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9365a7e9-571a-464d-ee67-08dd3569e130
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 13:38:22.4240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sBUKK1fxrRMVCxlyf102e2NN/70WtIXWz1TULKxK6A7UNW2cpunCf54Qo0htmISf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5814
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

On Wed, Jan 15, 2025 at 10:38:00AM +0100, Christian König wrote:
> Am 10.01.25 um 21:54 schrieb Jason Gunthorpe:
> > [SNIP]
> > > > I don't fully understand your use case, but I think it's quite likely
> > > > that we already have that working.
> > In Intel CC systems you cannot mmap secure memory or the system will
> > take a machine check.
> > 
> > You have to convey secure memory inside a FD entirely within the
> > kernel so that only an importer that understands how to handle secure
> > memory (such as KVM) is using it to avoid machine checking.
> > 
> > The patch series here should be thought of as the first part of this,
> > allowing PFNs to flow without VMAs. IMHO the second part of preventing
> > machine checks is not complete.
> > 
> > In the approach I have been talking about the secure memory would be
> > represented by a p2p_provider structure that is incompatible with
> > everything else. For instance importers that can only do DMA would
> > simply cleanly fail when presented with this memory.
> 
> That's a rather interesting use case, but not something I consider fitting
> for the DMA-buf interface.

To recast the problem statement, it is basically the same as your
device private interconnects. There are certain devices that
understand how to use this memory, and if they work together they can
access it.
 
> See DMA-buf in meant to be used between drivers to allow DMA access on
> shared buffers.

They are shared, just not with everyone :)
 
> What you try to do here instead is to give memory in the form of a file
> descriptor to a client VM to do things like CPU mapping and giving it to
> drivers to do DMA etc...

How is this paragraph different from the first? It is a shared buffer
that we want real DMA and CPU "DMA" access to. It is "private" so
things that don't understand the interconnect rules cannot access it.

> That sounds more something for the TEE driver instead of anything DMA-buf
> should be dealing with.

Has nothing to do with TEE.

Jason
