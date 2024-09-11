Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F619974963
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 06:54:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 002CD10E08F;
	Wed, 11 Sep 2024 04:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UtBr0RLN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30AD810E08F;
 Wed, 11 Sep 2024 04:54:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hDYTaO/EXakxOOIc+O5UFLz47/l8DDN+QRtAfihlYeelraVRb5MZoEZa7uNQdwrr1be8FmMZIulH5LAAnrFnryX4unEtj7oaszLJ+gyvE2XO3pqG3Bp7NEevfeJBOjJ6yF/n4IuZb0QX0MXVxMynxvImEPpC9skQYSqDYharILsLkcIbseV1r/661rT8Yyudy5fK4f9eHvcrqOpEEEhTQDLwCNwBWhZerrXV9MP7+ODRYyJ8GG9Y3CGPnoyRO7oIhqoygsT14FLwknvFsV0pbit4QMHBK2/wTjiz0233BdeijcuT9Mswyqxfsq4/uAbMK9JfqOQNq26rW6xFV7LvuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+5y4MjXLMsrInXKzTDlcswnVk5LcL3cAsHLIvyOUZo=;
 b=sIbeFU3Jv0JNuhOakFhj+WKx1NXZHibe0xeSA9IAq8lci800FrNH0z5kDEbeDyHAzhcdgNAI71Ec0Zp5UvdmTQT3jrfBl5l1ZHPicN6BwU3gBlQ66HmGX24y+JIY0W38NZcyRLi6L4jNd0+eJ9VXrO5FcpdhwOIfzS/us3LabZSD6lLftr6L46cceRxoh5Zs6rJEZH9OSpMoaam7VXXD/SNG7kyPts1sLMpLm5VaTntHbR14Bjmom07pN6OjeXPLrVwxfE2MO/iXngp3nVFjGV8+im8sno9biT7vGSPSkbycPcNVPlp0vqSWqD0qPqrBCuyuvQCg0E9p0f0XiPqzzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+5y4MjXLMsrInXKzTDlcswnVk5LcL3cAsHLIvyOUZo=;
 b=UtBr0RLN3z+Nbyz6caJeNaH9utVgw8pM4IGe9mG1Pzchk+NDbuqhuwlHn9yyq3/MzwUpl27KNFYoF0pCDeeULV7nVLBrWyuJcu8Jk+ZOumAyFs67ZEiqKiBbV8uQqPbXBplOtzYdGpw03ya1vSBbkSaiHVd1fVU/B/npiQzdxTkKWFcrOj1YNpJG517IOLQESojck+6N3a+KNWRu1Kz8OZuP8GUze9ExVrZjYcdU5nq+Q3FRtSHfhFfzWCJy1OV1JiH3FfA54nwH9bqT0pYi0rj/uLBC4wTEpzRYmp4Tnn7c6TWAUZbUN0WMYbG+G1gQRjBGhGiCKWM1Yz4plk/aiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH7PR12MB7455.namprd12.prod.outlook.com (2603:10b6:510:20e::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.25; Wed, 11 Sep 2024 04:54:14 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%3]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 04:54:13 +0000
References: <20240911030337.870160-1-matthew.brost@intel.com>
 <20240911030337.870160-2-matthew.brost@intel.com>
User-agent: mu4e 1.10.8; emacs 29.1
From: Alistair Popple <apopple@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, simona.vetter@ffwll.ch,
 Philip.Yang@amd.com, akpm@linux-foundation.org, felix.kuehling@amd.com,
 christian.koenig@amd.com
Subject: Re: [PATCH 1/1] mm/migrate: Trylock device page in do_swap_page
Date: Wed, 11 Sep 2024 14:53:31 +1000
In-reply-to: <20240911030337.870160-2-matthew.brost@intel.com>
Message-ID: <87mskehjtc.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SY8PR01CA0011.ausprd01.prod.outlook.com
 (2603:10c6:10:29c::14) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH7PR12MB7455:EE_
X-MS-Office365-Filtering-Correlation-Id: 433e8bc1-f0e2-4b04-ecf6-08dcd21dc849
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RndKWVcyelduNjJXdERKME0wbEFRaldQVDR6eVp2Y3VuWEJ0bzk1SU9aMmp2?=
 =?utf-8?B?b1BMN1NoRTBpN1JKajZyelI1WWV5VTh4dkMxaHpyUEVSZmsrWVI2MXdxamhr?=
 =?utf-8?B?N3lnUGJaMlJ3dUN1L3RtQlVONlVCd2thZ3V3dkJDYUF4TC8rNmg2cnJscldS?=
 =?utf-8?B?dlJOY0RxMjY5eTYyRzF1MmhpMnptZW1MWGhnSFJubjFEQUhnQjFBZ3FxTEp5?=
 =?utf-8?B?N2FwN05qU0tsamZHNXFXQWhRSVNuOEthNjFjY20xeWhDNDdCSTNaWWFKNlVx?=
 =?utf-8?B?dlp4UTRPZlo3ejEvUm9DSm5XWXEveGhsWmkwZFhMb00zSE42UmVLMnZCdmJl?=
 =?utf-8?B?eUNBa3dUbGFaZ1NXK3JDMSthSDJZR1ZxWERzbHRTejJJZzZvVU1VSXorNmRp?=
 =?utf-8?B?Q1NEZGZxcTAzSjR2Sy9UbEY4K3ZjUERYY25wRE01WUtMc2pCTi9Oczh3TVZH?=
 =?utf-8?B?ZC9reFhoVllSelAzVjNaZkJXRFhxa3FObVRVcnhvNFIvZStESGtsV0NIRVJP?=
 =?utf-8?B?U3BXcmxGWTJmTHlnWWNKRFNscVRsSGJXU1dlQ05za2hKdG5SeHRUS01OMktR?=
 =?utf-8?B?elpiOXFWeG9iSlpuNDVpdVIvMERJcGRNSEdCNkM0MVJVTkJFREFUdUR6SkJ2?=
 =?utf-8?B?b0RPTDFEeHVaUHMvcVVLdkwrejNGSEVpNUZnRktubDRBcUtibzNuOGhSRjZ3?=
 =?utf-8?B?RHJuTWRsZDkxK090aUR6ZXBnaWhrV2NIdWJVejFKTGpJWEZWamp0dzVnSEhn?=
 =?utf-8?B?amxneFZUcW1kNWVLRndBR1MzOFg0V3E4VklWb0d1S0YxeE5Od25DdDg2YVRL?=
 =?utf-8?B?N2t5T0xXN21jNkk5cFQ3TExjcFFSbDg4R2wwMjg2Z3lCWnJmdERiUnI3NW5E?=
 =?utf-8?B?bnpZRXZ5clFIMHNSUnpyRElBREhQVlpKbEowN3dOUXFrYyt0TWFNWkZLMVpq?=
 =?utf-8?B?Q3htWVdnOGJVKzJ6Zm5kQmY5RVl1RmIycEtaUk14L2gwQ0ZNeGM1R203b2VG?=
 =?utf-8?B?aTdVL293UjBMdzgwM2wxQzBERnR5bSthRjJMaWJDK1BqL1FZVjBIdGdsUHhW?=
 =?utf-8?B?eWZ4bXc0dlM1YkF5RG1hTEEwWEpnOVpNWVlQK2VBL3EwWVdKcWsxaUlrcDRi?=
 =?utf-8?B?SzRqcVhvWlhBbW5mVEVjbWtIZG14Q2R2cWxDakNkdDcwcGhqcVVudVRwVEZk?=
 =?utf-8?B?WWxLUjFTRlorSjF4azl6NWNuRHVnOEUvQnpqK2VtM3JXSXp6d2IyY1FIaCtS?=
 =?utf-8?B?Tnd3bHlKTHp5Y2NwWWN2RTlWbmRKMTN3clpvZUMxUHJIOTlSRmE1VXJBeCtl?=
 =?utf-8?B?aERxWnRtbDJQa2ZlSUg1MnRpODY3M1duL242MGo5dHRCdGFYd0pzN1ZWbnh2?=
 =?utf-8?B?NERtRW5VZVZpRThUVldzRS8xZUJXczNTeVNsSTZhVkF5K3RnTjROS1pud1dO?=
 =?utf-8?B?V0NRRHQwTDg4L05zakVacWh1dDFEdnJUdzgwc0pEZ1VrbDNVTUprZXEvYzlv?=
 =?utf-8?B?UFgwSTgzU2FXaXNwV1R4TEVFMHIxYmJJQzIwR1N3MUFtaGd0TDRlTllrQXhQ?=
 =?utf-8?B?akVSTkxMRFVEQkM3YjJmQkdiZldxWFZ6VnpLRksvU2VVbmc2N0dIMCs5dW9H?=
 =?utf-8?B?djIra2k3YnU4T1huVVNDdlBDUmV1T2tsTkxLQU9LaDU2S0xiSVByK3BCVzlT?=
 =?utf-8?B?MVltSXl1dzM5S0FZVWl0S1BnUGYzNW9ESVdHYlpJOWdoOEcwaXlQL3RhSEx1?=
 =?utf-8?B?QUFJYWZvRDRxN3RLajFRZmtRSzNlNUZ4TUFnbE1rT2RPaURqM0FaZ216eFIz?=
 =?utf-8?Q?vHrHMXzkaLzjp8/vqHXQ9vrUnAV0Vtjaz31z4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkVSNUVyKzZ6RFlQYmRSSFZ2UEVvcmRiSStTTTN2QW5CRU8yN040YjRNdkM3?=
 =?utf-8?B?U09KdzM5K1RtaENsUC9BT0Vieit2YXQrS2FaajFDT0RvVmNaNFdoK3BGQlN5?=
 =?utf-8?B?bEFNL3l4dnFYUTZCb3RmQmNFVWY0UzhOclVRZGVRQnFjNWtZNmlrTlF3b3Fi?=
 =?utf-8?B?emRaamlVOFRsODdMRkl5dHlSVHUxSmVFcVNvcEF1dXJSbVpOcU96RDN6Y0d5?=
 =?utf-8?B?QlM1RTRPVGhrNnQralRIWEhMUVRTWVRhMUk3R25NN2pXZG4yQVVYazR3N280?=
 =?utf-8?B?VlE5UnpVMnJRN2FXTk51Z0lkemJ2R1ZGWE9NS1ZlanFWWUVDeEl6MEhNOG5j?=
 =?utf-8?B?K0lKNXFCdjFFbHJHL1h1UUtPZTV6WEtjZE9tNE8xWjVvdDU0bTFIcjl6UFdj?=
 =?utf-8?B?dWZaU3d1Yll4bFN5eFNXUjNzREROc2RoQUVJZXZUR3RQbWhjTmZBdzJtbGhO?=
 =?utf-8?B?WWFnQUpjeG5ZK2RjOEhXWlpnTEt5YjlrbTZtNVlLWVArSXlBTkpNdDNJTlB1?=
 =?utf-8?B?cVRFMVQxOFNzQ1I4NjlBbXJzSlh0T3gxM0I2bjRVK1dYb2lCZjdqT2hvdnFT?=
 =?utf-8?B?aFp6MVpud29vaG9MZ2xGYXhnYWQyRG5PSmxDUC9GMjRid1dhTVFUbkVRN2FH?=
 =?utf-8?B?elBDOTNNbkIzL0tZY0FETzdST1lzVi90UHFES0lPUmJTa3ZNUHVLeEtkZlhG?=
 =?utf-8?B?aFk3dlEyTDZ2VXNJcVp5T0NOUGlyUW9lRVpHbWlaUGtFd2VLY3FYZTNKNzlV?=
 =?utf-8?B?RkJsZzJ0VVpTWE52Y0dhMklqL2RyOVVTZzlwa3NtZjkxNTRJZ3JFN1VVaVJS?=
 =?utf-8?B?MDBkVFBpekl2MlZ4S3Fibjh2Mm9uNWlxZjMvWkZTc3JwVkJjVzIwYnFFaVJJ?=
 =?utf-8?B?eHo4VnhYUW1zVjF1WmRaL0JyTXVNVlJib0ptS3JGZFVEOWVieVh2NVlydmpX?=
 =?utf-8?B?RWlYQ2dPaCtjTlV6UzlSZGkxZ0hjYStnSStZeEVsZlVlOVpUME81VzRNaDMw?=
 =?utf-8?B?bDZlalVvR1BXdUdmVytFR2pRTEpIcFMybGFwOGVlMnBmbWZqeXY4REVCRWVl?=
 =?utf-8?B?QXhSZnJTeUIzOTMrT09hRm1FRnh1dGF5Z1E5UDlTL29JU2IzUGMyRkZ5cXEr?=
 =?utf-8?B?N3pScFJPdEpoMCsrcVlOTG9hUDZrUU9LR3RJV0FRRURaNERvcXFSWjdsbHhu?=
 =?utf-8?B?bXRCUGZ6b2N1cHVGMEUyWkh0cm1Qb1ZobzZPdlZUZ0tvYVIxQ1FJdEZKYlRj?=
 =?utf-8?B?b1orRG93Q3RvUzIvVUR4SW9zdm43OXh3UUMxa0xpdWZ4WHRZLzFPWkNvem1L?=
 =?utf-8?B?cTIrU2NWMUpNZXY2SU5CQXNaL2FGTFhTMFFtNHdNVi9KMDFWdUtHdks5dmJt?=
 =?utf-8?B?STBkZkU1UEozWi9qRUlOYzJpTTV5alVxSS9ONldZcHVRTjhmU3h1dGZscUJX?=
 =?utf-8?B?ZEFNTENHS1dXeU9FWnc0ZlB1UjdlMWJpQXBJT1B2ZGZDQVROYldxbTNlcUh4?=
 =?utf-8?B?RWJxUEIwY1ZibmhWcjE1Z08rMlgyNm1hazhFVkl6b2xXKytlTTYxMnd0MVhp?=
 =?utf-8?B?aHFJbHdxSGVhZjhjOHpjS1phdmRQc3JzZkk0Sk5GSk9xdVB4TTRMN0I2Y1FW?=
 =?utf-8?B?azJqdHp6LzdlRXJqc21MQ0NIR2RCb0FwS29yVzd1ZnRPUjR5dkhCajVNd2ht?=
 =?utf-8?B?emxzcGkrNHpxZ1BSSVM0NHMrMFZ2RUltSTJwTUY2N1A1enZ3eG94SUk5bUxi?=
 =?utf-8?B?Umg4OFQ2bDZ4MmVISXErMXFpdGVnVGtNOFk0ODRDeXF4bzdZZkNaZUVITVUy?=
 =?utf-8?B?MlR1elFFcHdPUElnNzNzZzNJakRqL3hGcTd2N0I5Z3VBV040WUVLMkQvdGsz?=
 =?utf-8?B?RnVtV0F3QThEdTJOd0hxbm1YL1pnU3lhbjN0TnNveHBNNkgvWXhrS3FJN0Fa?=
 =?utf-8?B?aFZOWGF3dkIwU09hZG9UUS9KT1ZlWmcydHdOMVNuMkRRSGIxSnZSaGU4eDA1?=
 =?utf-8?B?ZHRQY3djSW1lSGdKTXdpL0pxUExxV3FlaGhTTWV6Zjh1NFpSOGRyTC9Ubm8x?=
 =?utf-8?B?dEt4UFVsbmNwQWtOWDdyM3NpclRnai91L0QrWHZOd2NLWUZ6aHZoeVc0Q0kz?=
 =?utf-8?Q?r1agWVH0fDVC9ijPWMWbnhZZk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 433e8bc1-f0e2-4b04-ecf6-08dcd21dc849
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 04:54:13.8540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: raQ3QSSZgd0AfwhiB9fdVNQyPJOcNLZVU6zEm+DMK9shbCq1Wsv9UtUgSDVob4FlJuQRiLfxeyJp+FmZX85TMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7455
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

> Avoid multiple CPU page faults to the same device page racing by locking
> the page in do_swap_page before taking an additional reference to the
> page. This prevents scenarios where multiple CPU page faults each take
> an extra reference to a device page, which could abort migration in
> folio_migrate_mapping. With the device page locked in do_swap_page, the
> migrate_vma_* functions need to be updated to avoid locking the
> fault_page argument.

I added the get_page() and therefore the fault_page argument to deal
with another lifetime issue. Neither Felix nor I particularly liked the
solution though (see
https://lore.kernel.org/all/cover.60659b549d8509ddecafad4f498ee7f03bb23c69.=
1664366292.git-series.apopple@nvidia.com/T/#m715589d57716448386ff9af41da27a=
952d94615a)
and this seems to make it even uglier, so I have suggested an
alternative solution below.

> Prior to this change, a livelock scenario could occur in Xe's (Intel GPU
> DRM driver) SVM implementation if enough threads faulted the same device
> page.

I haven't seen the same in the NVIDIA UVM driver (out-of-tree, I know)
but theoretically it seems like it should be possible. However we
serialize migrations of the same virtual address range to avoid these
kind of issues as they can happen the other way too (ie. multiple
threads trying to migrate to GPU).

So I suspect what happens in UVM is that one thread wins and installs
the migration entry while the others fail to get the driver migration
lock and bail out sufficiently early in the fault path to avoid the
live-lock.

> Cc: Philip Yang <Philip.Yang@amd.com>
> Cc: Felix Kuehling <felix.kuehling@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Suggessted-by: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  mm/memory.c         | 13 +++++++---
>  mm/migrate_device.c | 60 +++++++++++++++++++++++++++++++--------------
>  2 files changed, 50 insertions(+), 23 deletions(-)
>
> diff --git a/mm/memory.c b/mm/memory.c
> index 3c01d68065be..bbd97d16a96a 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -4046,10 +4046,15 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
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

This is all beginning to look a lot like migrate_vma_collect_pmd(). So
rather than do this and then have to pass all this context
(ie. fault_page) down to the migrate_vma_* functions could we instead
just do what migrate_vma_collect_pmd() does here? Ie. we already have
the PTL and the page lock so there's no reason we couldn't just setup
the migration entry prior to calling migrate_to_ram().

Obviously calling migrate_vma_setup() would show the page as not
migrating, but drivers could easily just fill in the src_pfn info after
calling migrate_vma_setup().

This would eliminate the whole fault_page ugliness.

> +				ret =3D vmf->page->pgmap->ops->migrate_to_ram(vmf);
> +				put_page(vmf->page);
> +				unlock_page(vmf->page);
> +			} else {
> +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> +			}
>  		} else if (is_hwpoison_entry(entry)) {
>  			ret =3D VM_FAULT_HWPOISON;
>  		} else if (is_pte_marker_entry(entry)) {
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index 6d66dc1c6ffa..049893a5a179 100644
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
>  		remove_migration_ptes(folio, folio, false);
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
> @@ -838,7 +842,8 @@ void migrate_device_finalize(unsigned long *src_pfns,
>  		src =3D page_folio(page);
>  		dst =3D page_folio(newpage);
>  		remove_migration_ptes(src, dst, false);
> -		folio_unlock(src);
> +		if (fault_folio !=3D src)
> +			folio_unlock(src);
> =20
>  		if (is_zone_device_page(page))
>  			put_page(page);
> @@ -854,6 +859,22 @@ void migrate_device_finalize(unsigned long *src_pfns=
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
> @@ -869,7 +890,8 @@ EXPORT_SYMBOL(migrate_device_finalize);
>   */
>  void migrate_vma_finalize(struct migrate_vma *migrate)
>  {
> -	migrate_device_finalize(migrate->src, migrate->dst, migrate->npages);
> +	__migrate_device_finalize(migrate->src, migrate->dst, migrate->npages,
> +				  migrate->fault_page);
>  }
>  EXPORT_SYMBOL(migrate_vma_finalize);

