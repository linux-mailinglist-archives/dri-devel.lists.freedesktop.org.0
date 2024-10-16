Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FB599FFED
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 06:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D1C10E0A1;
	Wed, 16 Oct 2024 04:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gqPeOA6f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B2A10E0A1;
 Wed, 16 Oct 2024 04:04:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lh0/R084/zWqj9+Jl/OeFbKKMHboeepFTauB6vpyPPu4zAp+73IXutVjWPe3/Iz/VBKkZWBHUvEHMuaA/ZMPCvA3X7H5E6q4A5nAB19S8bCHNWtUVHfUe/uc+BC6u3byCSCP2R7mmGBAfpf0Khh+WwtxOEs457IrVbbMzhZ5Uw9bulk8346MdC5yB+KowfFXmycnITrLzieDRTYnxF3LrsgE7t4Ml82NvEhYpVDmqOo98khfZajQ249JVGFIbJnC3o7wCgp8QoRHQp+oAwGSzd3x0DqId+QGrtr/Ww7D/gN3Y3xCRNf/3aeSPk2MJ9LsJYaHB/X68h/+8OUfKYc+ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zeWqteT8fintN2M7K4cn7yck+4ZhIjGkeBhEt/XFd0M=;
 b=gX+IQrAplN0HhvFR/1Bn8CbSJ5kdDEoMmT5Tzxr/TNlKr+FtMj263dXFBDeNZg3HeUlIoubeO0OBlhmLia06CzGtjSZFO2H5Hj9bhqNHGgIR5Qqb+TM/mjlibQgFTlR2pv8jr9HFYq5e+thweS5DzbQbrgjUU91QiZ3LDmmsrRuvqMn0UUC2r1QVZq84s5xL+Oo849TarWrIxld4xKevEclrAtqNiKuQUrwFjHZYRpOeGUs8j0+n/Uz/cVOxiQOCjffwDtDeE8htwHnpoGxEvIgb9cNgVC7JgR5hYo9w9F0SoWPff2TmaouMWD4CxRtIBL2+4yVRMcfz19Eq9FZbhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zeWqteT8fintN2M7K4cn7yck+4ZhIjGkeBhEt/XFd0M=;
 b=gqPeOA6f5kZYCmbgW6KYiPOC5dYTl4OrMjhnolP7AzgkM78boIdsyJpGM4B3pjiuf4qz8w554sp2mLHZjPNd5bleCS+dLZRKaU6t5EDvKz/QwQKfH+ia861qD9oY2VuUQw1Tn4hBrA/0y2Vz2zNPExvfySII0n2fMb80n8RCXcNCOHDEPc1R1Tm7ev2sJKQo9djp7flr1eNE223jjV+bLtP3W7bvERTIYQvQnDvIUhsgFBy8QZXS4/o5Z56UYc7OEbzU3X+RFFTUoNWaIIVMZsVPIQ1g7dWisTgol44EOgTXLDnw5mpaJ90r1ZU0p374Qm4yDVgA2MypVbIr2N2l+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CYYPR12MB9013.namprd12.prod.outlook.com (2603:10b6:930:c2::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.18; Wed, 16 Oct 2024 04:03:59 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%3]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 04:03:59 +0000
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-4-matthew.brost@intel.com>
User-agent: mu4e 1.10.8; emacs 29.1
From: Alistair Popple <apopple@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: Re: [PATCH v2 03/29] mm/migrate: Trylock device page in do_swap_page
Date: Wed, 16 Oct 2024 15:00:08 +1100
In-reply-to: <20241016032518.539495-4-matthew.brost@intel.com>
Message-ID: <87sesw8ziu.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SY6PR01CA0151.ausprd01.prod.outlook.com
 (2603:10c6:10:1ba::21) To CY8PR12MB7705.namprd12.prod.outlook.com
 (2603:10b6:930:84::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CYYPR12MB9013:EE_
X-MS-Office365-Filtering-Correlation-Id: 37109bee-c993-400f-0edf-08dced978f72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVROdFBhcjJLdTA0bjhDM2NCaG9RTElLcDduRFV2V2N6bDFVb3BKUGJ1cEps?=
 =?utf-8?B?K1VLMUdaL0NuMEs5YzRQcGoxa2lXbkdOWk1RWGRkNWxnTHdROTFQQnRKT3R0?=
 =?utf-8?B?ZEFITHBGSHBmMnREanp6SVBmdzRtc0x2bkIzVU1ZVXJYWlBXTDdBOHl4U3lK?=
 =?utf-8?B?bVMxd2hYUWdrUUJuWGJrVFRwYTV2ZzhFbm1OUEZWd3J4cWIrUEJzUVpyOS9K?=
 =?utf-8?B?ZkRGM1IzM0RGM0RTaUlnMDIvRXF4Y0d6MDlWVlp5Q2YzcFdBRGhWUEFPMmIx?=
 =?utf-8?B?dzh2OWpzWkw1RVVnZSs5d0h1cjRJNTh2V05QQUZVUlVmWXFJMXU4S3BieXBs?=
 =?utf-8?B?WlhsbzhWZk9MRE1DaC9LSFEvNStiWmFFM1F5elBFOGtocDRXeVFFR29TQndB?=
 =?utf-8?B?UENlUnBTZE9Rc0ZTSy9xK2dodWcxVmt1NzVVWDJzYVZHM3hGTjkwYjZBRVlx?=
 =?utf-8?B?Y2VaRnp3WUJ4dHBJTnhXWEJsTndOQWdnQ0srTVJjOER1RXVpUGxyaEhjZlUz?=
 =?utf-8?B?V1pzOFdNYTFhYUZhZ0FpNnVYa1hwQ0tqVDJTa1c2SE5sWDJFUThqNFU3YTFw?=
 =?utf-8?B?bVgyTHNqa1ZEZ1YwTi85Y1NsZ29TYlp3SjNmZ2hjaWhvUjNWVy9Va2FoejEr?=
 =?utf-8?B?YUtWOGZTZkU1S3NTU0lZaUZXSUVNVUJXKys2Sm8wSzBzdUMxMEk0bUN1M0ly?=
 =?utf-8?B?aU1qQ2UzeXFhMmI4NTRob1U2Zjg3M1locElkVG5WMnZkc084VnNTV3ZnMGxS?=
 =?utf-8?B?d0tPbXZGNkFyQ2NOUHJmcEllZnBYbzd3aXZ0Qmw4VHFOdTVUZDJidG8yL29v?=
 =?utf-8?B?MWwxRUZQTGRzRnpWUGp0empobkJSSVRrVTFjY1M3TXc1YnRnQ3l4OUl3dlFy?=
 =?utf-8?B?M0xnWWswdlRPTXZDbnliWkExTk5tQmUreGpCQmJGNTV6Q0lIejJzUlhJUlpx?=
 =?utf-8?B?YmdhZzhIc3NGeFhLMWM3enVQZG9hN0lDbWgwV1B5c294b3l5ZFRLYzNRdThj?=
 =?utf-8?B?UFhWTklTV1hzR1JmbmZjTnh5NDBjbWF0N3B1OGZseE5SRDhJM1g0MVN0QWtj?=
 =?utf-8?B?VmFPWG5SQzN3RU1Zc2M5YWM0RWhIOGpxQ1FmS3lMT2M3dWFOZUIvYWwvTy9x?=
 =?utf-8?B?ME9ralRZc3BOZVk4OGM0bmJzcCtnb2FPbzNXVWpiZGE3T0MrU2drYzlod1dW?=
 =?utf-8?B?UnRtOFFkWDZoVGJ4SGVNbkp5NFlrZ0VCMWE4RlpESm1OOFJ6SnF5OUs3U3VP?=
 =?utf-8?B?U2g5ay9KdDlZdlo0WGRlVmp3WGQ1a1YwZTMraWFlWGc1eUU1MU10bkVvNko5?=
 =?utf-8?B?cDI4eUIyaUhzVGVnVkFyYkNHMTJnaG42M28vd1hZSFdJbStSOXFvTUhienBQ?=
 =?utf-8?B?MWNRZ2Ixc2xYYmZNajJLNFh1ZGlsWVF2Q0Zic05YSlYwczlHQTJLcXZNNkRY?=
 =?utf-8?B?WGpMMk05RGV3blorYkIwazVKbDBiSEp4R1l4VFUwQXUvNmNqNTMybGxUdUFp?=
 =?utf-8?B?c0NjdkNnRHJFejltTXVKandaQ0swNytwU3ZCNVAyT0dISytRK2FreVpuLzBV?=
 =?utf-8?B?ZnkydXU5OEo3VmJYQ2c3TEt3ZlZ2eEZFaGNMVzlzVFp4MDJYUTkxOU1PNHow?=
 =?utf-8?B?eTdxL295d2ZWUldHMlN0OUZ0cUZRRVdZdndIVDBtL2NDWkRPZytHWnJEOFc5?=
 =?utf-8?B?MmJiMU9GK043SnpWTzR0TDJ3RklNTzhkM21XS1pBaUU2Ris5SU02V1NRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2ZJRWltenFLR0ZnSE1KRFhCSmtRRktRQWJrZDU0bUMyd2o0QkZiNDBwWk5Y?=
 =?utf-8?B?dktIZGxIMXpQSnpubkEzbWZlL0hJOXlRQjFMM0VieGtpTm9zTFFORllzaEdQ?=
 =?utf-8?B?Ny9malMwREU4aXdEbEZ2dGlWN3ExdUxyaG01eG9qZE5OemVCeEU3UWFtQU4w?=
 =?utf-8?B?QXdrK3FTVzlOR0o3eUNPdFQ0SmtRRTRmZUI5QU5ZT1VHcDNWVHAvNithcmpj?=
 =?utf-8?B?aVd1eEJyVWswMHNXcTI2RkRXd2N2NXJvMUJtQnpaRGxHL21vNkE1MUxiNHI0?=
 =?utf-8?B?UjZUTzBxUnlOY3lkN08xcmVGaHZqRUxXNXJJVnJOTkIwbXpINUV2NmttV28z?=
 =?utf-8?B?cmhUMEFyeGZBOGFSajUrc0RybE9jSnJWNmRCcmpuVnFkM05qK3Z2enl2Y3B6?=
 =?utf-8?B?QVJ5OFpqR3haeUtjdEJQRmdRaXhTZWFlREx3RzhsZVI5UVR4WGVhWUFrSEdk?=
 =?utf-8?B?QTNzMk5CRXVvZVlUbGFnU3ZoanllcDkrN1dkendaZ0JFRUdjSzJXNzVlZEpl?=
 =?utf-8?B?ZjIyMUVVYUVUTXJvLytjdW8zbDdhcDMyYXZpRm1zdTBTN2wwOUZERzBDaSsr?=
 =?utf-8?B?bWlBZjZYYUdwS2ZXaWFqT2RxWURYSGYrdnRkMU1heGpaRjNka1lmSjcvUjQr?=
 =?utf-8?B?bmh1cm1JQzVoa2tDZnladkg2S2dHMXNFeFplb2hvWmZpMVhrNm55MXFwNDNX?=
 =?utf-8?B?UndrdU5heVNxNWpzVGNQZSs5MTNORHhDTkpQWE5tVDR2SFZ1WGk0a2x3R0hU?=
 =?utf-8?B?ZG55YTNwdVRTcmxtS1VUdjY5T1oxS2YvcWtNd0sweEd0V3VyV3doSHAydlBp?=
 =?utf-8?B?RHZwSlRmRGdMZ0JMejVZME1tMmtZeWtvMk9KUEc3aDV6eEtpWVkvSXZ6bnpl?=
 =?utf-8?B?NnFoUnZ1UGlXNmNSUTl0TndoZjh1bVo5d0JxakJVWWZkeFlLSEprdUp4Sm5F?=
 =?utf-8?B?dHdMTXNocGtPcGhQdVRuZzVRb0xZWHVjVDdKdjFsc1J5NUlqM1REeUdocWRI?=
 =?utf-8?B?RVpkS2lJZWZZU1VoUHRyVXRLU0lKVGtWZElKSmVieEJkQ3VTZUxJUXk2U2dE?=
 =?utf-8?B?UTZrWEZrN3dJaU13WUtwZk83N1JCc1BlZ00rRGJ2WG1UcGZocDVzWVBxRnpa?=
 =?utf-8?B?SHlEbzBGRHNqRzB1OFc1OHhwY2lvcUpmZFAyTktPYitHOWI1NEovYWdnRlNN?=
 =?utf-8?B?amlVME1MOFFIbnplQjhIQkFac1hUN1JhemRlMmp4VDJ4Qm1BVWxWRzBTeVVR?=
 =?utf-8?B?aTZCeXNrM3BhcmEvWWVnaEx3dURONEdoS1RRSlF5NUdLeEowNFdkMjdJNG9h?=
 =?utf-8?B?QmFLdVdsZko0SEFzdnVLQ3FWNmdMNEVpWERMNVdYR05pai94ZGZLSWtaZG9V?=
 =?utf-8?B?dEQvdXRxeVNNbi9Qa3dSOUMwRVNOVXV0aGxyYzFWc3pjanQwVnVTWE5aNGFP?=
 =?utf-8?B?OU1QK2VHa3dTVUJNdnpNbUtSZWxEN3MyZS90SmhLU2U4NFlrdGNlR3Zid1hy?=
 =?utf-8?B?R2p4YjFZUWs4M3FpaHhnVlMrbk82clBvZlJzbEdZNUljT2Y0YXJtNWIwMTRE?=
 =?utf-8?B?RjFpdXozTWhNVWV1OFhHT2dUektBK0RBYkNYSmgvVndZZEpkakNiNmdhZyt0?=
 =?utf-8?B?Vjk4RkU2Q1RWT0IrdzBJSXAwKytkK1V2TWF0OHlIQkM4MHNLYyt1WCtNUTRF?=
 =?utf-8?B?dWM3T1VualA4eFdxRmd6dWR3MlZWUjNuTFE4ZjB3cm1rdmJKQTNOOTF6dk5J?=
 =?utf-8?B?ZEFUU2hJaFlPYmhydWxOYVo0WU9GSnQyV3pFNzI3MnZuV3l4cDR4S0lyaGlM?=
 =?utf-8?B?NVRuamlnWUx3cHFCUmRkQmR6Qld4UWI4LzdlL2VQQ0Q2REswbEMvL1ZFc0Fh?=
 =?utf-8?B?WkJrS0o0T3dPRjRDR1pudXdlMSt1QnNYdHFpQ3Z6YVRyd01HUnhQWnlqbjM4?=
 =?utf-8?B?QUd6dkZ1SThOZkdkSFhVdXc3Z1d6ank1d0IxdG1hc2Y4YVFKOEZPU0dvbHZE?=
 =?utf-8?B?TDBtaFY3MDFvZW8zc1hycUsyMlIzSllDL3I0VUg2S0VmdG1oQmtwZDd3aHFv?=
 =?utf-8?B?U1lZbVMzQS9tMmJrcFVtU09CdGRvQnVTV0VLRnZqL09hVVNwVnNCUW1jYy9Y?=
 =?utf-8?Q?KDef/0XeYR45Df24Ferq7GKwZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37109bee-c993-400f-0edf-08dced978f72
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7705.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 04:03:58.9604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BF9tKsnkZJoSYCJc+asiaiUs9sUj4fPuq4HM/h9Rp9R76S3GVhuObtdlYqoYdvykrloEtj28F0xTBrpAXiy64g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB9013
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


Matthew Brost <matthew.brost@intel.com> writes:

> Avoid multiple CPU page faults to the same device page racing by trying
> to lock the page in do_swap_page before taking an extra reference to the
> page. This prevents scenarios where multiple CPU page faults each take
> an extra reference to a device page, which could abort migration in
> folio_migrate_mapping. With the device page being locked in
> do_swap_page, the migrate_vma_* functions need to be updated to avoid
> locking the fault_page argument.
>
> Prior to this change, a livelock scenario could occur in Xe's (Intel GPU
> DRM driver) SVM implementation if enough threads faulted the same device
> page.
>
> Cc: Philip Yang <Philip.Yang@amd.com>
> Cc: Felix Kuehling <felix.kuehling@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Suggessted-by: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  mm/memory.c         | 13 ++++++---
>  mm/migrate_device.c | 69 ++++++++++++++++++++++++++++++---------------
>  2 files changed, 56 insertions(+), 26 deletions(-)
>
> diff --git a/mm/memory.c b/mm/memory.c
> index 2366578015ad..b72bde782611 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -4252,10 +4252,15 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>  			 * Get a page reference while we know the page can't be
>  			 * freed.
>  			 */
> -			get_page(vmf->page);
> -			pte_unmap_unlock(vmf->pte, vmf->ptl);
> -			ret =3D vmf->page->pgmap->ops->migrate_to_ram(vmf);
> -			put_page(vmf->page);
> +			if (trylock_page(vmf->page)) {
> +				get_page(vmf->page);
> +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> +				ret =3D vmf->page->pgmap->ops->migrate_to_ram(vmf);
> +				put_page(vmf->page);
> +				unlock_page(vmf->page);

I don't think my previous review of this change has really been
addressed. Why don't we just install the migration entry here? Seems
like it would be a much simpler way of solving this.

> +			} else {
> +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> +			}
>  		} else if (is_hwpoison_entry(entry)) {
>  			ret =3D VM_FAULT_HWPOISON;
>  		} else if (is_pte_marker_entry(entry)) {
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index f163c2131022..2477d39f57be 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -60,6 +60,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  				   struct mm_walk *walk)
>  {
>  	struct migrate_vma *migrate =3D walk->private;
> +	struct folio *fault_folio =3D migrate->fault_page ?
> +		page_folio(migrate->fault_page) : NULL;
>  	struct vm_area_struct *vma =3D walk->vma;
>  	struct mm_struct *mm =3D vma->vm_mm;
>  	unsigned long addr =3D start, unmapped =3D 0;
> @@ -88,11 +90,13 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> =20
>  			folio_get(folio);
>  			spin_unlock(ptl);
> -			if (unlikely(!folio_trylock(folio)))
> +			if (unlikely(fault_folio !=3D folio &&
> +				     !folio_trylock(folio)))
>  				return migrate_vma_collect_skip(start, end,
>  								walk);
>  			ret =3D split_folio(folio);
> -			folio_unlock(folio);
> +			if (fault_folio !=3D folio)
> +				folio_unlock(folio);
>  			folio_put(folio);
>  			if (ret)
>  				return migrate_vma_collect_skip(start, end,
> @@ -192,7 +196,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  		 * optimisation to avoid walking the rmap later with
>  		 * try_to_migrate().
>  		 */
> -		if (folio_trylock(folio)) {
> +		if (fault_folio =3D=3D folio || folio_trylock(folio)) {
>  			bool anon_exclusive;
>  			pte_t swp_pte;
> =20
> @@ -204,7 +208,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> =20
>  				if (folio_try_share_anon_rmap_pte(folio, page)) {
>  					set_pte_at(mm, addr, ptep, pte);
> -					folio_unlock(folio);
> +					if (fault_folio !=3D folio)
> +						folio_unlock(folio);
>  					folio_put(folio);
>  					mpfn =3D 0;
>  					goto next;
> @@ -363,6 +368,8 @@ static unsigned long migrate_device_unmap(unsigned lo=
ng *src_pfns,
>  					  unsigned long npages,
>  					  struct page *fault_page)
>  {
> +	struct folio *fault_folio =3D fault_page ?
> +		page_folio(fault_page) : NULL;
>  	unsigned long i, restore =3D 0;
>  	bool allow_drain =3D true;
>  	unsigned long unmapped =3D 0;
> @@ -427,7 +434,8 @@ static unsigned long migrate_device_unmap(unsigned lo=
ng *src_pfns,
>  		remove_migration_ptes(folio, folio, 0);
> =20
>  		src_pfns[i] =3D 0;
> -		folio_unlock(folio);
> +		if (fault_folio !=3D folio)
> +			folio_unlock(folio);
>  		folio_put(folio);
>  		restore--;
>  	}
> @@ -536,6 +544,8 @@ int migrate_vma_setup(struct migrate_vma *args)
>  		return -EINVAL;
>  	if (args->fault_page && !is_device_private_page(args->fault_page))
>  		return -EINVAL;
> +	if (args->fault_page && !PageLocked(args->fault_page))
> +		return -EINVAL;
> =20
>  	memset(args->src, 0, sizeof(*args->src) * nr_pages);
>  	args->cpages =3D 0;
> @@ -799,19 +809,13 @@ void migrate_vma_pages(struct migrate_vma *migrate)
>  }
>  EXPORT_SYMBOL(migrate_vma_pages);
> =20
> -/*
> - * migrate_device_finalize() - complete page migration
> - * @src_pfns: src_pfns returned from migrate_device_range()
> - * @dst_pfns: array of pfns allocated by the driver to migrate memory to
> - * @npages: number of pages in the range
> - *
> - * Completes migration of the page by removing special migration entries=
.
> - * Drivers must ensure copying of page data is complete and visible to t=
he CPU
> - * before calling this.
> - */
> -void migrate_device_finalize(unsigned long *src_pfns,
> -			unsigned long *dst_pfns, unsigned long npages)
> +static void __migrate_device_finalize(unsigned long *src_pfns,
> +				      unsigned long *dst_pfns,
> +				      unsigned long npages,
> +				      struct page *fault_page)
>  {
> +	struct folio *fault_folio =3D fault_page ?
> +		page_folio(fault_page) : NULL;
>  	unsigned long i;
> =20
>  	for (i =3D 0; i < npages; i++) {
> @@ -824,7 +828,8 @@ void migrate_device_finalize(unsigned long *src_pfns,
> =20
>  		if (!page) {
>  			if (dst) {
> -				folio_unlock(dst);
> +				if (fault_folio !=3D dst)
> +					folio_unlock(dst);
>  				folio_put(dst);
>  			}
>  			continue;
> @@ -834,14 +839,16 @@ void migrate_device_finalize(unsigned long *src_pfn=
s,
> =20
>  		if (!(src_pfns[i] & MIGRATE_PFN_MIGRATE) || !dst) {
>  			if (dst) {
> -				folio_unlock(dst);
> +				if (fault_folio !=3D dst)
> +					folio_unlock(dst);
>  				folio_put(dst);
>  			}
>  			dst =3D src;
>  		}
> =20
>  		remove_migration_ptes(src, dst, 0);
> -		folio_unlock(src);
> +		if (fault_folio !=3D src)
> +			folio_unlock(src);
> =20
>  		if (folio_is_zone_device(src))
>  			folio_put(src);
> @@ -849,7 +856,8 @@ void migrate_device_finalize(unsigned long *src_pfns,
>  			folio_putback_lru(src);
> =20
>  		if (dst !=3D src) {
> -			folio_unlock(dst);
> +			if (fault_folio !=3D dst)
> +				folio_unlock(dst);
>  			if (folio_is_zone_device(dst))
>  				folio_put(dst);
>  			else
> @@ -857,6 +865,22 @@ void migrate_device_finalize(unsigned long *src_pfns=
,
>  		}
>  	}
>  }
> +
> +/*
> + * migrate_device_finalize() - complete page migration
> + * @src_pfns: src_pfns returned from migrate_device_range()
> + * @dst_pfns: array of pfns allocated by the driver to migrate memory to
> + * @npages: number of pages in the range
> + *
> + * Completes migration of the page by removing special migration entries=
.
> + * Drivers must ensure copying of page data is complete and visible to t=
he CPU
> + * before calling this.
> + */
> +void migrate_device_finalize(unsigned long *src_pfns,
> +			unsigned long *dst_pfns, unsigned long npages)
> +{
> +	return __migrate_device_finalize(src_pfns, dst_pfns, npages, NULL);
> +}
>  EXPORT_SYMBOL(migrate_device_finalize);
> =20
>  /**
> @@ -872,7 +896,8 @@ EXPORT_SYMBOL(migrate_device_finalize);
>   */
>  void migrate_vma_finalize(struct migrate_vma *migrate)
>  {
> -	migrate_device_finalize(migrate->src, migrate->dst, migrate->npages);
> +	__migrate_device_finalize(migrate->src, migrate->dst, migrate->npages,
> +				  migrate->fault_page);
>  }
>  EXPORT_SYMBOL(migrate_vma_finalize);

